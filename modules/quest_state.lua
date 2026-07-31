-- Quest state management module
-- Handles step completion, progress tracking, and partial item states
local quest_state = {}

local settings = require('settings')
local ui_debug = require('modules.ui_debug')

-- Helper: Debug print (only prints if dev mode is enabled)
local function debug_print(msg)
    if quest_state.settings and quest_state.settings.ui_settings and quest_state.settings.ui_settings.dev_mode then
        ui_debug.addLine(msg)
    end
end

local QUESTHELPER_ALIAS = 'QuestHelper_settings'
local default_settings = T{
    step_states = T{},
    partial_progress = T{},
    kill_counts = T{},
    daily_progress = T{},  -- Day-stamped scratch state (e.g. Castle Oztroja passwords); resets each Vana'diel day
    quest_choices = T{},   -- Server-randomised objectives captured from NPC dialogue (e.g. Genkai 4 clues).
                           -- NOT day-stamped: these hold until the quest is finished or cleared by hand.
    route_choice = T{},    -- Player's chosen destination for steps offering several (route_choices).
    weather_progress = T{},-- Weather types witnessed on zone-in (e.g. SMN "I Can Hear a Rainbow").
                           -- NOT day-stamped, same reasoning as quest_choices: the server remembers
                           -- which colours the ruby has been shown across days, zoning and relogs.
    current_map = T{},  -- Tracks active map number per zone ID
    keyitem_cache = T{},  -- Cached list of owned key item IDs (array of numbers)
    fame_cache = T{},     -- [area] = {level = n, day = vana_day_stamp}; last value seen from a reputation NPC
    ui_settings = T{
        map_opacity = 1.0,         -- Map image opacity (0.0 - 1.0)
        map_scale = 1.0,           -- Map size scale (1.0 = 512x512, 0.5 = 256x256)
        ui_scale = 1.0,            -- Main UI scale (1.0 = 100%, 0.7 = 70% for small screens)
        auto_scroll_enabled = true, -- Auto-scroll to current floor/zone
        show_all_steps = true,      -- Show all steps vs only current step
        map_pos_x = nil,            -- Map window X position (nil = centered on first launch)
        map_pos_y = nil,            -- Map window Y position (nil = centered on first launch)
        items_section_expanded = true,     -- Items Needed section expanded state
        keyitems_section_expanded = true,  -- Key Items Needed section expanded state
        prerequisites_section_expanded = true, -- Prerequisites section expanded state
        requirements_section_expanded = true,  -- Requirements section (level/fame) expanded state
        route_section_expanded = true,     -- Route section expanded state
        handheld_mode = false,      -- Small screens: map becomes a tab instead of a second window
        auto_sync = true,           -- Mark quests/missions complete from the server's 0x56 log
        dev_mode = false            -- Developer mode - enables debug output
    }
}

-- Load settings
quest_state.settings = settings.load(default_settings, QUESTHELPER_ALIAS)

--- Re-load settings from disk. Call this once the character is fully in-world
--- to ensure Ashita resolves the correct character-specific settings file.
function quest_state.reloadSettings()
    quest_state.settings = settings.load(default_settings, QUESTHELPER_ALIAS)
end

-- Ensure a nested key path exists in a table
local function ensure_key_path(t, ...)
    local keys = {...}
    local current = t
    for _, key in ipairs(keys) do
        if not current[key] then
            current[key] = T{}
        end
        current = current[key]
    end
    return current
end

-- Lazy, memoised require of modules.player. Lazy because a top-level require risks a
-- cycle (see utils.get_images_for_step); memoised because isStepSkipped runs per step
-- per frame. `false` records a failed require so it is not retried every call.
local player_module_memo = nil
local function get_player_module()
    if player_module_memo == nil then
        local ok, mod = pcall(require, 'modules.player')
        player_module_memo = (ok and mod) or false
    end
    return player_module_memo or nil
end

-- True when a step does not apply to this character and should read as done.
--
--   skip_if_any_job_level = 71  -- skip once ANY job has reached this level
--
-- The Genkai 5 use case: steps 1/3/5 are the Maat conversations, whose events only
-- fire while the quest is QUEST_ACCEPTED. No job can pass 70 until the cap is broken,
-- so a job at 71+ proves those events are already spent - even though the job you are
-- fighting on may only be 66.
--
-- Deliberately one-directional: an unknown level (nil) never skips. The worst case is
-- showing a step the player has to tick by hand, never hiding one they still need.
function quest_state.isStepSkipped(step_data)
    if type(step_data) ~= 'table' then return false end

    local threshold = step_data.skip_if_any_job_level
    if type(threshold) ~= 'number' then return false end

    local player_module = get_player_module()
    if not player_module then return false end

    local highest = player_module.getHighestJobLevel()
    return highest ~= nil and highest >= threshold
end

-- Gets the completion state of a specific step.
-- Pass step_data (the step's table) to honour skip_if_* fields; omitting it returns
-- the raw stored tick, which is what the manual checkbox writes.
function quest_state.getStepState(topCat, subfile, mission, step, step_data)
    if step_data and quest_state.isStepSkipped(step_data) then
        return true
    end
    local path = ensure_key_path(quest_state.settings.step_states, topCat, subfile, mission)
    return path[step] or false
end

-- Sets the completion state of a specific step.
-- defer_save skips the write to disk, for callers ticking many steps at once (the
-- server sync); they are responsible for saving once at the end.
function quest_state.setStepState(topCat, subfile, mission, step, state, step_trigger_flags, defer_save)
    -- Clear any existing trigger flags for this specific step to ensure a clean state
    if step_trigger_flags and step_trigger_flags[topCat] and
       step_trigger_flags[topCat][subfile] and
       step_trigger_flags[topCat][subfile][mission] then
        step_trigger_flags[topCat][subfile][mission][step] = nil
    end

    local path = ensure_key_path(quest_state.settings.step_states, topCat, subfile, mission)
    path[step] = state
    debug_print(string.format("Saving step: %s -> %s -> %s -> Step %d = %s",
        topCat, subfile, mission, step, tostring(state)))
    if not defer_save then
        settings.save(QUESTHELPER_ALIAS, quest_state.settings)
    end
end

-- Gets the partial completion state for a checklist item
function quest_state.getPartialState(cat, sub, mis, step, item_name)
    local path = ensure_key_path(quest_state.settings.partial_progress, cat, sub, mis, step)
    return path[item_name:lower()] or false
end

-- Sets the partial completion state for a checklist item
function quest_state.setPartialState(cat, sub, mis, step, item_name, state)
    local path = ensure_key_path(quest_state.settings.partial_progress, cat, sub, mis, step)
    path[item_name:lower()] = state
    debug_print(string.format("\30\105[QuestHelper] Checked item: %s", item_name))
    settings.save(QUESTHELPER_ALIAS, quest_state.settings)
end

-- Checks if all items in a checklist are complete
function quest_state.checkAllItemsComplete(cat, sub, mis, step, required_list)
    for _, item in ipairs(required_list) do
        if not quest_state.getPartialState(cat, sub, mis, step, item) then
            return false
        end
    end
    return true
end

-- Gets the kill count for a step
function quest_state.getKillCount(cat, sub, mis, step)
    local path = ensure_key_path(quest_state.settings.kill_counts, cat, sub, mis)
    return path[step] or 0
end

-- Sets the kill count for a step
function quest_state.setKillCount(cat, sub, mis, step, count)
    local path = ensure_key_path(quest_state.settings.kill_counts, cat, sub, mis)
    path[step] = count
    settings.save(QUESTHELPER_ALIAS, quest_state.settings)
end

-- Daily password cache (day-stamped scratch state that resets each Vana'diel day).
-- Used by steps with a `daily_passwords` block (e.g. Castle Oztroja).
local function currentVanaDay()
    local ok, utils = pcall(require, 'modules.utils')
    if ok and utils.getVanaDayStamp then
        return utils.getVanaDayStamp()
    end
    return nil
end

-- Returns the entry table {day=, words=} for a step, resetting it if the Vana'diel day changed.
local function getDailyEntry(cat, sub, mis, step, save_on_reset)
    if not quest_state.settings.daily_progress then
        quest_state.settings.daily_progress = T{}
    end
    local today = currentVanaDay()
    local path = ensure_key_path(quest_state.settings.daily_progress, cat, sub, mis)
    local entry = path[step]
    if type(entry) ~= 'table' or entry.day ~= today then
        entry = T{ day = today, words = T{} }
        path[step] = entry
        if save_on_reset then
            settings.save(QUESTHELPER_ALIAS, quest_state.settings)
        end
    end
    return entry
end

-- Returns the captured-password table for a step, keyed by slot number (may be empty).
-- Auto-resets on Vana'diel day change.
function quest_state.getDailyPasswords(cat, sub, mis, step)
    return getDailyEntry(cat, sub, mis, step, true).words
end

-- Stores a captured password into a slot (1-based), stamped with the current Vana'diel day.
function quest_state.setDailyPassword(cat, sub, mis, step, slot, word)
    local entry = getDailyEntry(cat, sub, mis, step, false)
    entry.words[slot] = word
    debug_print(string.format("[QuestHelper] Password slot %d = %s", slot, tostring(word)))
    settings.save(QUESTHELPER_ALIAS, quest_state.settings)
end

-- Quest choice cache (server-randomised objectives, e.g. Genkai 4's four clue NPCs).
--
-- Deliberately NOT day-stamped, unlike daily_progress: Maat's picks are fixed for the
-- life of the quest, so they must survive Vana'diel day rollovers, zoning and addon
-- reloads. Cleared explicitly via clearQuestChoices (/qh_clearclues) or when the
-- quest is completed.
--
-- Shape: quest_choices[cat][sub][mis][slot] = { index = n, npc = "...", zone = "...", pos = "..." }

--- Returns the captured choice table for a mission, keyed by slot name (may be empty).
function quest_state.getQuestChoices(cat, sub, mis)
    if not quest_state.settings.quest_choices then
        quest_state.settings.quest_choices = T{}
    end
    return ensure_key_path(quest_state.settings.quest_choices, cat, sub, mis)
end

--- Returns a single captured choice, or nil if that slot has not been seen yet.
function quest_state.getQuestChoice(cat, sub, mis, slot)
    return quest_state.getQuestChoices(cat, sub, mis)[slot]
end

--- Records one resolved choice. `entry` is the matched row from data/clue_tables.lua.
function quest_state.setQuestChoice(cat, sub, mis, slot, index, entry)
    local choices = quest_state.getQuestChoices(cat, sub, mis)
    choices[slot] = T{
        index = index,
        npc   = entry.npc,
        zone  = entry.zone,
        pos   = entry.pos,
        clue  = entry.clue,
    }
    debug_print(string.format("[QuestHelper] Choice %s = [%d] %s (%s)",
        tostring(slot), index, tostring(entry.npc), tostring(entry.zone)))
    settings.save(QUESTHELPER_ALIAS, quest_state.settings)
end

--- Wipes captured choices. Omit `mis` to clear every mission's choices.
--- Returns how many slots were removed.
function quest_state.clearQuestChoices(cat, sub, mis)
    if not quest_state.settings.quest_choices then return 0 end

    local removed = 0
    if cat and sub and mis then
        local path = ensure_key_path(quest_state.settings.quest_choices, cat, sub)
        if type(path[mis]) == 'table' then
            for _ in pairs(path[mis]) do removed = removed + 1 end
            path[mis] = nil
        end
    else
        -- Full wipe (test/retry path)
        for _, subs in pairs(quest_state.settings.quest_choices) do
            for _, miss in pairs(subs) do
                for _, slots in pairs(miss) do
                    for _ in pairs(slots) do removed = removed + 1 end
                end
            end
        end
        quest_state.settings.quest_choices = T{}
    end

    settings.save(QUESTHELPER_ALIAS, quest_state.settings)
    return removed
end

-- Weather cache (weather types witnessed on zone-in).
--
-- Same persistence rules as quest_choices and for the same reason: the server records
-- these in a bitmask that survives day rollovers, zoning and relogs, so a day-stamped
-- reset like daily_progress would lie to the player. Cleared when the mission completes.
--
-- Shape: weather_progress[cat][sub][mis][step][element_key] = true

--- Returns the table of witnessed weather keys for a step (may be empty).
function quest_state.getWeatherSeen(cat, sub, mis, step)
    if not quest_state.settings.weather_progress then
        quest_state.settings.weather_progress = T{}
    end
    local path = ensure_key_path(quest_state.settings.weather_progress, cat, sub, mis)
    if type(path[step]) ~= 'table' then
        path[step] = T{}
    end
    return path[step]
end

--- True if this element has been banked.
---
--- MUST use rawget. These tables are Ashita `T{}`s, whose metatable exposes the table
--- library helpers through __index - so a plain `seen[key]` lookup for a key that happens
--- to share a helper's name (`clear`, `copy`, `map`, ...) returns that FUNCTION and reads
--- as true forever. That is exactly what happened to the SMN tracker's `clear` slot: it
--- showed DONE regardless of weather and survived every wipe. Never index these directly.
function quest_state.hasWeatherSeen(cat, sub, mis, step, key)
    return rawget(quest_state.getWeatherSeen(cat, sub, mis, step), key) ~= nil
end

--- Records one witnessed weather element. Returns true if this was new (first sighting),
--- false if it was already banked - the caller uses that to avoid re-announcing.
function quest_state.setWeatherSeen(cat, sub, mis, step, key)
    local seen = quest_state.getWeatherSeen(cat, sub, mis, step)
    if rawget(seen, key) ~= nil then return false end

    seen[key] = true
    debug_print(string.format("[QuestHelper] Weather captured: %s", tostring(key)))
    settings.save(QUESTHELPER_ALIAS, quest_state.settings)
    return true
end

-- Route choice (steps that offer several valid destinations).
--
-- Some steps name a lot of possible zones - the SMN weather hunt has 25. Rather than
-- draw every route at once, the step lists them in `route_choices` and the player picks
-- one; that pick becomes the step's effective route_to. Persistent, per step.
--
-- Shape: route_choice[cat][sub][mis][step] = "Zone Name"

--- Returns the zone the player picked for this step, or nil.
function quest_state.getRouteChoice(cat, sub, mis, step)
    if not quest_state.settings.route_choice then
        quest_state.settings.route_choice = T{}
    end
    local path = ensure_key_path(quest_state.settings.route_choice, cat, sub, mis)
    return rawget(path, step)
end

--- Records the player's pick. Pass nil to clear it.
function quest_state.setRouteChoice(cat, sub, mis, step, zone)
    if not quest_state.settings.route_choice then
        quest_state.settings.route_choice = T{}
    end
    local path = ensure_key_path(quest_state.settings.route_choice, cat, sub, mis)
    path[step] = zone
    settings.save(QUESTHELPER_ALIAS, quest_state.settings)
end

--- Flattens route_choices to a plain list of zone names.
---
--- Entries are either a bare zone string, or a group:
---   { group = "Fire", zones = { "Valkurm Dunes", ... } }
--- Groups exist so the buttons can be labelled by what they are FOR (which weather each
--- zone gets, say) instead of being one undifferentiated wall of zone names. A zone may
--- appear in several groups - Valkurm Dunes gets both fire and earth weather - and that
--- is fine: picking it from either routes to the same place.
function quest_state.routeChoiceZones(step_data)
    local out = {}
    if type(step_data) ~= 'table' or type(step_data.route_choices) ~= 'table' then
        return out
    end

    for _, entry in ipairs(step_data.route_choices) do
        if type(entry) == 'string' then
            table.insert(out, entry)
        elseif type(entry) == 'table' and type(entry.zones) == 'table' then
            for _, zone in ipairs(entry.zones) do
                table.insert(out, zone)
            end
        end
    end

    return out
end

--- The destination a step should actually route to: the player's pick when it is still
--- one of the step's offered choices, otherwise the step's own route_to. Validating
--- against the current list means a pick left over from an edited data file is ignored
--- rather than routing somewhere the step no longer mentions.
function quest_state.resolveRouteTo(step_data, cat, sub, mis, step)
    if type(step_data) ~= 'table' then return nil end

    if type(step_data.route_choices) == 'table' then
        local choice = quest_state.getRouteChoice(cat, sub, mis, step)
        if choice then
            for _, zone in ipairs(quest_state.routeChoiceZones(step_data)) do
                if zone == choice then return choice end
            end
        end
    end

    return step_data.route_to
end

--- Forgets one witnessed element. Returns true if it was actually banked.
--- Manual correction path for /qh_weather unset - lets a mistyped `set` be undone without
--- wiping the whole quest's progress.
function quest_state.unsetWeatherSeen(cat, sub, mis, step, key)
    local seen = quest_state.getWeatherSeen(cat, sub, mis, step)
    if rawget(seen, key) == nil then return false end

    seen[key] = nil
    settings.save(QUESTHELPER_ALIAS, quest_state.settings)
    return true
end

--- Wipes witnessed weather. Omit `mis` to clear every mission's. Returns how many
--- element slots were removed.
function quest_state.clearWeatherSeen(cat, sub, mis)
    if not quest_state.settings.weather_progress then return 0 end

    local removed = 0
    local function countSteps(steps)
        for _, keys in pairs(steps) do
            if type(keys) == 'table' then
                for _ in pairs(keys) do removed = removed + 1 end
            end
        end
    end

    if cat and sub and mis then
        local path = ensure_key_path(quest_state.settings.weather_progress, cat, sub)
        if type(path[mis]) == 'table' then
            countSteps(path[mis])
            path[mis] = nil
        end
    else
        for _, subs in pairs(quest_state.settings.weather_progress) do
            for _, miss in pairs(subs) do
                for _, steps in pairs(miss) do
                    if type(steps) == 'table' then countSteps({steps}) end
                end
            end
        end
        quest_state.settings.weather_progress = T{}
    end

    settings.save(QUESTHELPER_ALIAS, quest_state.settings)
    return removed
end

--- Drops every bit of in-progress scratch state for one mission: checklist ticks, kill
--- counts, daily passwords, captured choices and witnessed weather. Only for a mission
--- that is finished -
--- half-killed counts and half-ticked checklists under a completed mission are noise,
--- and worse, a trigger can still act on them. Leaves step_states alone; the caller
--- owns those.
--- defer_save skips the write to disk, as setStepState does.
function quest_state.clearMissionProgress(cat, sub, mis, defer_save)
    local tables = {
        quest_state.settings.partial_progress,
        quest_state.settings.kill_counts,
        quest_state.settings.daily_progress,
        quest_state.settings.quest_choices,
        quest_state.settings.weather_progress,
    }

    local cleared = false
    for _, t in ipairs(tables) do
        if t and t[cat] and t[cat][sub] and t[cat][sub][mis] then
            t[cat][sub][mis] = nil
            cleared = true
        end
    end

    if cleared and not defer_save then
        settings.save(QUESTHELPER_ALIAS, quest_state.settings)
    end
    return cleared
end

-- Returns the last fame level seen for an area, plus how many Vana'diel days ago it
-- was seen (nil age if the clock was unavailable at capture). Returns nil if never
-- checked. NOTE: fame rises silently on any quest turn-in, so this is a historical
-- observation, never the player's current fame - present it as "last checked".
function quest_state.getFame(area)
    local entry = quest_state.settings.fame_cache and quest_state.settings.fame_cache[area]
    if type(entry) ~= 'table' or type(entry.level) ~= 'number' then return nil end

    local age
    local today = currentVanaDay()
    if today and entry.day then
        age = today - entry.day
    end
    return entry.level, age
end

-- Records a fame level observed from a reputation NPC's dialogue.
function quest_state.setFame(area, level)
    if not quest_state.settings.fame_cache then
        quest_state.settings.fame_cache = T{}
    end
    quest_state.settings.fame_cache[area] = T{ level = level, day = currentVanaDay() }
    debug_print(string.format("[QuestHelper] Fame: %s = %d", area, level))
    settings.save(QUESTHELPER_ALIAS, quest_state.settings)
end

-- Gets the active map number for a zone (defaults to 1)
function quest_state.getCurrentMap(zone_id)
    return quest_state.settings.current_map[zone_id] or 1
end

-- Sets the active map number for a zone
function quest_state.setCurrentMap(zone_id, map_num)
    quest_state.settings.current_map[zone_id] = map_num
    debug_print(string.format("\30\106[QH]\30\01 Switched to map %d", map_num))
    settings.save(QUESTHELPER_ALIAS, quest_state.settings)
end

-- Gets the current (first incomplete) step for a mission
function quest_state.getCurrentStep(topCat, subfile, mission, quest_data)
    local mdata = quest_data[topCat] and quest_data[topCat][subfile] and quest_data[topCat][subfile][mission]
    if not mdata or not mdata.steps then
        return 1
    end
    for i = 1, #mdata.steps do
        if not quest_state.getStepState(topCat, subfile, mission, i, mdata.steps[i]) then
            return i
        end
    end
    return #mdata.steps + 1
end

-- Counts how many members of a progress_group are complete.
-- Returns done, total. Used for the "3/15" caption in the mission list.
function quest_state.getGroupProgress(topCat, subfile, group, quest_data)
    local fileData = quest_data[topCat] and quest_data[topCat][subfile]
    if not fileData or not group then return 0, 0 end

    local done, total = 0, 0
    for mission_name, mission_data in pairs(fileData) do
        if mission_data.progress_group == group then
            total = total + 1
            if quest_state.isMissionComplete(topCat, subfile, mission_name, quest_data) then
                done = done + 1
            end
        end
    end

    return done, total
end

-- Checks if an entire subfile is complete.
-- Both group fields settle once any one member is done, for different reasons:
--   choice_group   - alternate routes; the player only ever does one.
--   progress_group - one is enough to progress, but the rest stay worth doing
--                    (Genkai 5: any one Maat win caps you at 75, all 15 = Maat's Cap).
-- They differ only in presentation (ui_main.lua). Do not use a name as both.
function quest_state.isSubfileComplete(topCat, subfile, quest_data)
    local fileData = quest_data[topCat] and quest_data[topCat][subfile]
    if not fileData then return false end

    local groupSeen = {}
    local groupDone = {}

    for mission_name, mission_data in pairs(fileData) do
        local complete = quest_state.isMissionComplete(topCat, subfile, mission_name, quest_data)
        local group = mission_data.choice_group or mission_data.progress_group

        if group then
            groupSeen[group] = true
            if complete then
                groupDone[group] = true
            end
        elseif not complete then
            return false
        end
    end

    for group in pairs(groupSeen) do
        if not groupDone[group] then
            return false
        end
    end

    return true
end

-- Checks if a specific mission is complete
function quest_state.isMissionComplete(topCat, subfile, mission, quest_data)
    local mission_data = quest_data[topCat] and quest_data[topCat][subfile] and quest_data[topCat][subfile][mission]
    if not mission_data then return false end
    local steps = mission_data.steps or {}
    for i = 1, #steps do
        if not quest_state.getStepState(topCat, subfile, mission, i, steps[i]) then
            return false
        end
    end
    return true
end

-- Calculates progress percentage for a mission
function quest_state.calculateProgress(topCat, subfile, mission, quest_data)
    local mdata = quest_data[topCat][subfile][mission]
    local steps = mdata.steps or {}
    local completed = 0
    for i = 1, #steps do
        if quest_state.getStepState(topCat, subfile, mission, i, steps[i]) then
            completed = completed + 1
        end
    end
    local total = #steps
    local pct = 0
    if total > 0 then
        pct = (completed / total) * 100
    end
    return pct, completed, total
end

-- Saves settings to disk
function quest_state.save()
    settings.save(QUESTHELPER_ALIAS, quest_state.settings)
end

return quest_state
