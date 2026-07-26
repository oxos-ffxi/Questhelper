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

-- Gets the completion state of a specific step
function quest_state.getStepState(topCat, subfile, mission, step)
    local path = ensure_key_path(quest_state.settings.step_states, topCat, subfile, mission)
    return path[step] or false
end

-- Sets the completion state of a specific step
function quest_state.setStepState(topCat, subfile, mission, step, state, step_trigger_flags)
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
    settings.save(QUESTHELPER_ALIAS, quest_state.settings)
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
        if not quest_state.getStepState(topCat, subfile, mission, i) then
            return i
        end
    end
    return #mdata.steps + 1
end

-- Checks if an entire subfile is complete.
-- Missions sharing a choice_group are alternate routes the player picks between,
-- so the group counts as done once any one of its members is done - requiring all
-- of them would make such a subfile impossible to complete.
function quest_state.isSubfileComplete(topCat, subfile, quest_data)
    local fileData = quest_data[topCat] and quest_data[topCat][subfile]
    if not fileData then return false end

    local groupSeen = {}
    local groupDone = {}

    for mission_name, mission_data in pairs(fileData) do
        local complete = quest_state.isMissionComplete(topCat, subfile, mission_name, quest_data)
        local group = mission_data.choice_group

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
        if not quest_state.getStepState(topCat, subfile, mission, i) then
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
        if quest_state.getStepState(topCat, subfile, mission, i) then
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
