-- Main UI window module
local ui_main = {}

local imgui = require('imgui')

-- ImGui Tree Node Flags
ImGuiTreeNodeFlags_DefaultOpen = 0x20

-- ImGui Condition Flags
ImGuiCond_FirstUseEver = 2

-- ImGui Window Flags
ImGuiWindowFlags_AlwaysAutoResize = 0x40

-- Search functionality
local search_query = ""
local search_results = T{}

-- Hardcoded progression guide
local progression_guide = require('data.progression_guide')
local player_module = require('modules.player')
local theme = require('modules.ui_theme')
local col = theme.col
local has_group = type(imgui.BeginGroup) == 'function'
local step_utils = require('modules.utils')  -- resolveDynamicStep (randomised-objective quests)

-- Inventory checking (periodic, not every frame)
local inventory_results = {} -- Cached results
local last_inventory_check = 0
local INVENTORY_CHECK_INTERVAL = 5.0 -- Check every 5 seconds

-- Set when the main window's X is clicked; questhelper.lua consumes it.
ui_main.close_requested = false

-- Settings window state
local show_settings_window = false
local settings_just_opened = false  -- force-uncollapse on the frame it opens
local show_progression_guide = false

-- Gold caption + rule that heads each block of settings.
local function settingsSection(label)
    imgui.Spacing()
    imgui.TextColored(col.gold, label)
    imgui.Separator()
    imgui.Spacing()
end

-- Collapsed mode step navigation
local collapsed_viewed_step = nil  -- Track which step we're viewing in collapsed mode

-- Debug UI "Jump" tab: scroll the panel to a step without touching progress.
-- Purely visual - the same pointer the Prev/Next buttons move.
function ui_main.setViewedStep(n)
    collapsed_viewed_step = n
end
local prev_show_all_steps   = nil  -- Detect collapse/expand transitions

local function perform_search(quest_data)
    search_results = T{}
    local query = (search_query or ""):lower()
    if query == "" then return end
    for topCategory, subfiles in pairs(quest_data) do
        for subfile, missions in pairs(subfiles) do
            for mission_name, _ in pairs(missions) do
                if mission_name:lower():find(query, 1, true) then
                    table.insert(search_results, {
                        topCategory = topCategory,
                        subfile     = subfile,
                        mission     = mission_name
                    })
                end
            end
        end
    end
end

-- Collects all unique items needed for entire quest with quantities
-- NOTE: Only collects from items_needed (not trigger_on_item_obtain)
-- trigger_on_item_obtain items are REWARDS/OUTCOMES, not items you need to bring
-- Returns: { {name = "Item Name", quantity = 2, alternatives = {...}}, ... }
--
-- Supported formats:
--   items_needed = "Dark Crystal"  -- qty 1
--   items_needed = {"Dark Crystal", "Lizard Egg"}  -- qty 1 each
--   items_needed = {
--       "Dark Crystal",
--       { item = "Lizard Egg", quantity = 6 },
--       { display = "Elemental Crystal", alternatives = {"Dark Crystal", "Wind Crystal", "Water Crystal"} }
--   }
local function getAllItemsNeeded(missionData)
    local allItems = {}
    local itemData = {}  -- { itemName = {quantity, alternatives} }

    if not missionData or not missionData.steps then return allItems end

    for _, step_data in ipairs(missionData.steps) do
        if type(step_data) == 'table' and step_data.items_needed then
            local items = step_data.items_needed

            -- Process items_needed (can be string, table of strings, or table with {item=, quantity=})
            if type(items) == 'string' then
                if not itemData[items] then
                    itemData[items] = { quantity = 0, alternatives = nil }
                end
                itemData[items].quantity = itemData[items].quantity + 1
            elseif type(items) == 'table' then
                for _, item in ipairs(items) do
                    if type(item) == 'string' then
                        -- Simple string format
                        if not itemData[item] then
                            itemData[item] = { quantity = 0, alternatives = nil }
                        end
                        itemData[item].quantity = itemData[item].quantity + 1
                    elseif type(item) == 'table' then
                        if item.display and item.alternatives then
                            -- Alias format: { display = "Elemental Crystal", alternatives = {"Dark Crystal", ...} }
                            -- alternatives can be:
                            --   1. Array of strings: {"Dark Crystal", "Wind Crystal"}
                            --   2. Array of tables: {{"Meteorite", 1}, {"Soil Geodes", 12}}
                            --   3. Array of tables: {{item="Meteorite", quantity=1}, {item="Soil Geodes", quantity=12}}
                            local displayName = item.display
                            if not itemData[displayName] then
                                itemData[displayName] = { quantity = 0, alternatives = item.alternatives }
                            end
                            itemData[displayName].quantity = itemData[displayName].quantity + (item.quantity or 1)
                        elseif item.item then
                            -- Object format: { item = "Name", quantity = 6, optional = true, on_the_way = true }
                            local itemName = item.item
                            if not itemData[itemName] then
                                itemData[itemName] = { quantity = 0, alternatives = nil, optional = item.optional or false, on_the_way = item.on_the_way or false }
                            end
                            local qty = item.quantity or 1
                            itemData[itemName].quantity = itemData[itemName].quantity + qty
                        end
                    end
                end
            end
        end
    end

    -- Convert to array with quantities and alternatives
    for itemName, data in pairs(itemData) do
        table.insert(allItems, {
            name = itemName,
            quantity = data.quantity,
            alternatives = data.alternatives,
            optional = data.optional,
            on_the_way = data.on_the_way
        })
    end

    return allItems
end

-- Missions sharing a choice_group are alternate routes through the same point in
-- the chain - the player only ever completes one of them. A group is "settled"
-- once any of its members is complete; the others are then routes not taken, and
-- are shown greyed out and skipped when advancing through the chain.
local function getSettledChoiceGroups(topCat, subfile, subData, quest_state, quest_data)
    local settled = {}
    for mname, mdata in pairs(subData) do
        if mdata.choice_group and quest_state.isMissionComplete(topCat, subfile, mname, quest_data) then
            settled[mdata.choice_group] = true
        end
    end
    return settled
end

-- True when this mission is the alternate route the player passed over.
local function isRouteNotTaken(settled, subData, mname, topCat, subfile, quest_state, quest_data)
    local group = subData[mname] and subData[mname].choice_group
    return group ~= nil
        and settled[group] == true
        and not quest_state.isMissionComplete(topCat, subfile, mname, quest_data)
end

-- A progress_group (see quest_state.isSubfileComplete) is the other kind of group:
-- any one member is enough to progress, but the rest are still worth doing. Unlike a
-- choice_group nothing greys out - every member stays live, and the group shows a count.
-- Returns group name -> {done = n, total = n}.
local function getProgressGroupCounts(topCat, subfile, subData, quest_state, quest_data)
    local counts = {}
    for mname, mdata in pairs(subData) do
        local group = mdata.progress_group
        if group and not counts[group] then
            local done, total = quest_state.getGroupProgress(topCat, subfile, group, quest_data)
            counts[group] = {done = done, total = total}
        end
    end
    return counts
end

-- Builds the display rows for a quest/mission's prerequisites.
--
-- A prerequisites entry is either a single prerequisite:
--   {category = "Missions", subfile = "Bastok", name = "7-1: The Final Image"}
-- or an OR group, satisfied by any one of its members:
--   {any = { {category = ..., subfile = ..., name = ...}, ... }}
--
-- An OR group with at least one member complete shows only the complete
-- member(s), so the section reads as done. With none complete it shows a
-- "Choose one:" caption above every member, since the player picks which to do.
--
-- Returns a flat list of rows, each either {caption = "..."} or a prerequisite.
-- Rows are one UI line apiece, so #rows drives the section height.
local function getAllPrerequisites(missionData, quest_state, quest_data)
    if not missionData or type(missionData.prerequisites) ~= 'table' then
        return {}
    end

    local function isValid(prereq)
        return type(prereq) == 'table' and prereq.category and prereq.subfile and prereq.name
    end

    local rows = {}
    for _, entry in ipairs(missionData.prerequisites) do
        if type(entry) == 'table' and type(entry.any) == 'table' then
            local complete = {}
            for _, prereq in ipairs(entry.any) do
                if isValid(prereq) and
                   quest_state.isMissionComplete(prereq.category, prereq.subfile, prereq.name, quest_data)
                then
                    table.insert(complete, prereq)
                end
            end

            if #complete > 0 then
                for _, prereq in ipairs(complete) do
                    table.insert(rows, prereq)
                end
            else
                table.insert(rows, {caption = "Choose one:"})
                for _, prereq in ipairs(entry.any) do
                    if isValid(prereq) then
                        local choice = {}
                        for k, v in pairs(prereq) do choice[k] = v end
                        choice.or_choice = true
                        table.insert(rows, choice)
                    end
                end
            end
        elseif isValid(entry) then
            table.insert(rows, entry)
        end
    end

    return rows
end

-- Builds the display rows for a quest/mission's requirements - the things a player
-- needs to *be*, rather than things they need to have done (those are prerequisites).
--
--   requirements = {
--       level = 30,                                 -- recommended main job level
--       fame  = {area = "Windurst", level = 3},     -- or a list of these
--   }
--
-- Each row is {text = "...", status = 'ok'|'fail'|'unknown'}. Level is read live
-- from the player.
--
-- Fame has no live source - the client is never sent a numeric value - so it relies on
-- a value captured from a reputation NPC's dialogue (see modules/fame.lua), which may
-- be old. That is safe to pass/fail on because fame only ever rises: no known mechanic
-- reduces it. A captured value is therefore a LOWER BOUND on current fame, so
--   captured >= required  -> 'ok', and cannot later become wrong
--   captured <  required  -> 'unknown' (they may have gained since), never 'fail'
-- If fame decay is ever discovered, the 'ok' case is what breaks.
local function getRequirementRows(missionData, quest_state)
    if not missionData or type(missionData.requirements) ~= 'table' then
        return {}
    end

    local reqs = missionData.requirements
    local rows = {}

    if type(reqs.level) == 'number' then
        local level = player_module.getMainJobLevel()
        if not level then
            table.insert(rows, {
                text = string.format("Recommended Level: %d (your level is unavailable)", reqs.level),
                status = 'unknown',
            })
        else
            table.insert(rows, {
                text = string.format("Recommended Level: %d (you are %d)", reqs.level, level),
                status = level >= reqs.level and 'ok' or 'fail',
            })
        end
    end

    -- fame accepts a single {area = ..., level = ...} or a list of them
    local fameEntries = {}
    if type(reqs.fame) == 'table' then
        if reqs.fame.area then
            table.insert(fameEntries, reqs.fame)
        else
            for _, entry in ipairs(reqs.fame) do
                if type(entry) == 'table' and entry.area then
                    table.insert(fameEntries, entry)
                end
            end
        end
    end

    local fame_ok, fame_db = pcall(require, 'modules.fame')

    for _, entry in ipairs(fameEntries) do
        local needed = entry.level or 1
        local area_info = fame_ok and fame_db.AREAS[entry.area] or nil
        local where = (area_info and area_info.checker) or "the reputation NPC in town"

        local seen, age = quest_state.getFame(entry.area)

        if seen and seen >= needed then
            -- Fame never drops, so a past sighting at or above the bar still holds.
            table.insert(rows, {
                text = string.format("Fame: %s %d+ (you were %d/9 when last checked)",
                    entry.area, needed, seen),
                status = 'ok',
            })
        elseif seen then
            local when = "previously"
            if age == 0 then
                when = "today"
            elseif age and age > 0 then
                when = string.format("%d Vana'diel day%s ago", age, age == 1 and "" or "s")
            end
            table.insert(rows, {
                text = string.format("Fame: %s %d+ (was %d/9 %s - recheck with %s)",
                    entry.area, needed, seen, when, where),
                status = 'unknown',
            })
        else
            table.insert(rows, {
                text = string.format("Fame: %s %d+ (check with %s)",
                    entry.area, needed, where),
                status = 'unknown',
            })
        end
    end

    return rows
end

-- Estimates how many rendered lines a string occupies, counting explicit newlines and
-- soft wraps at wrap_chars. Used to size the collapsed window to its content.
-- Blank lines count as a fraction: ui_theme renders them as a thin gap, not a full line.
local function countWrappedLines(text, wrap_chars)
    if type(text) ~= 'string' or text == '' then return 0 end

    local lines = 0
    for line in (text .. '\n'):gmatch('([^\n]*)\n') do
        local trimmed = line:match('^%s*(.-)%s*$')
        if trimmed == '' then
            lines = lines + 0.6  -- thin gap, but keep the estimate on the generous side
        else
            lines = lines + math.max(1, math.ceil(#trimmed / wrap_chars))
        end
    end
    return lines
end

-- Height the Rewards block needs in collapsed mode. Rewards render at close to the full
-- window width (wider than the step text, which sits in a narrower scrolling child), so
-- they wrap later - ~60 chars. Erring low on wrap width overestimates the height, which
-- costs a little empty space rather than clipping the last line.
local REWARD_WRAP_CHARS = 60

local function getRewardHeight(reward)
    if type(reward) ~= 'table' then return 0 end

    local hasItems = type(reward.items) == 'table' and #reward.items > 0
    local hasText  = type(reward.text) == 'string' and reward.text ~= ""
    if not hasItems and not hasText then return 0 end

    local height = 30  -- "Rewards:" header + the two Spacing() calls above it

    if hasItems then
        -- Each item is a Separator + a TreeNode; assume collapsed, as expanded state
        -- lives inside imgui and is not readable from here.
        height = height + (#reward.items * 25) + 5
    end
    if hasText then
        height = height + (countWrappedLines(reward.text, REWARD_WRAP_CHARS) * 20)
    end

    return height
end

-- Renders the main QuestHelper window
function ui_main.render(is_open, currentTopCategory, currentSubfile, current_mission, showImagesDrawer,
                       quest_data, quest_state, utils, inventory_cache, keyitem_module, keyitems_db)

    local settings = require('settings')
    local ui_settings = quest_state.settings.ui_settings

    -- Get UI scale setting early so it can be used for window sizing
    local ui_scale = ui_settings.ui_scale or 1.0

    local theme_colors, theme_vars = theme.push()

    -- Dynamic window sizing based on collapsed state
    local window_height = 600  -- Default height
    if current_mission and not ui_settings.show_all_steps then
        -- Collapsed mode: Calculate height based on current step text
        local missionData = quest_data[currentTopCategory] and quest_data[currentTopCategory][currentSubfile] and quest_data[currentTopCategory][currentSubfile][current_mission]
        if missionData and missionData.steps then
            local current_step_index = quest_state.getCurrentStep(currentTopCategory, currentSubfile, current_mission, quest_data)
            local steps = missionData.steps

            -- Base height for UI elements (top bar, mission name, separators, etc.)
            -- Add extra height for navigation buttons if more than 1 step
            local base_height = 150
            if #steps > 1 then
                base_height = base_height + 40  -- Add space for navigation buttons + separator
            end

            -- Get step text for height calculation
            -- Use collapsed_viewed_step if set, otherwise use current step
            if current_step_index and #steps > 0 then
                -- Use viewed step for height calculation (will be initialized in navigation section)
                local step_index_to_use = collapsed_viewed_step or math.min(current_step_index, #steps)
                local step_data = steps[step_index_to_use]
                -- Narrow a randomised objective to its captured target (no-op otherwise)
                step_data = step_utils.resolveDynamicStep(step_data, currentTopCategory, currentSubfile, current_mission, quest_state)
                local text = (type(step_data) == 'table' and step_data.text) or tostring(step_data)
                -- Banner is rendered separately but still takes vertical space - measure it.
                if type(step_data) == 'table' and step_data.dynamic_banner then
                    text = text .. '\n \n' .. step_data.dynamic_banner
                end

                -- Estimate text height: Count newlines + account for line wrapping
                -- Each line wraps at ~55 chars (to account for scrollbar), each line is ~20px tall
                local text_height = countWrappedLines(text, 55) * 20

                -- Cap text height to scroll limit (350px) if it exceeds that
                -- Scale the scroll limit with UI scale
                local scroll_limit = 350 * ui_scale
                if text_height > scroll_limit then
                    text_height = scroll_limit
                end

                -- Add height for items/key items if present
                -- Only add full height if sections are expanded, otherwise just add header height + extra breathing room
                local items_height = 0
                local itemsNeeded = getAllItemsNeeded(missionData)
                if #itemsNeeded > 0 then
                    if ui_settings.items_section_expanded then
                        items_height = (#itemsNeeded * 25) + 30  -- ~25px per item + header
                    else
                        items_height = 30 -- Collapsed header + extra breathing room
                    end
                end

                local keyItemsNeeded = utils.getAllKeyItemsNeeded(missionData, keyitems_db)
                if #keyItemsNeeded > 0 then
                    if ui_settings.keyitems_section_expanded then
                        items_height = items_height + (#keyItemsNeeded * 25) + 30
                    else
                        items_height = items_height + 30  -- Collapsed header + extra breathing room
                    end
                end

                local prerequisites = getAllPrerequisites(missionData, quest_state, quest_data)
                if #prerequisites > 0 then
                    if ui_settings.prerequisites_section_expanded then
                        items_height = items_height + (#prerequisites * 25) + 30
                    else
                        items_height = items_height + 30  -- Collapsed header + extra breathing room
                    end
                end

                local requirements = getRequirementRows(missionData, quest_state)
                if #requirements > 0 then
                    if ui_settings.requirements_section_expanded then
                        items_height = items_height + (#requirements * 25) + 30
                    else
                        items_height = items_height + 30  -- Collapsed header + extra breathing room
                    end
                end

                -- Add height for route display (if route_to is defined)
                if type(step_data) == 'table' and step_data.route_to then
                    if ui_settings.route_section_expanded then
                        -- Load pathfinding to calculate route lines
                        local pathfinding_ok, pathfinding = pcall(require, 'modules.pathfinding')
                        if pathfinding_ok then
                            local party = AshitaCore:GetMemoryManager():GetParty()
                            if party then
                                local player_zone_id = party:GetMemberZone(0)
                                if player_zone_id and player_zone_id > 0 then
                                    local zones_db = require('data.zones')
                                    local current_zone = pathfinding.getCurrentZone(player_zone_id, zones_db)

                                    if current_zone then
                                        local path = pathfinding.findPath(current_zone, step_data.route_to)
                                        if path then
                                            local route_str = pathfinding.formatPath(path, current_zone, step_data.destination_highlight)
                                            -- Count lines in route string (each "\n" is a new line)
                                            local route_lines = 1  -- Start with header line "Route (X zones):"
                                            for _ in route_str:gmatch("\n") do
                                                route_lines = route_lines + 1
                                            end
                                            -- Add header (30px) + route lines * 20px per line
                                            items_height = items_height + 30 + (route_lines * 20)
                                        else
                                            -- No path found message: header + 2 lines
                                            items_height = items_height + 30 + (2 * 20)
                                        end
                                    end
                                end
                            end
                        end
                    else
                        -- Collapsed route header only
                        items_height = items_height + 30
                    end
                end

                -- Add height for kill requirement display
                if type(step_data) == 'table' and step_data.kill_requirement then
                    items_height = items_height + 25  -- "[X/Y] Kills Remaining" line
                    local kill_enemies = step_data.kill_requirement.enemies
                    if type(kill_enemies) == 'table' then
                        items_height = items_height + (#kill_enemies * 20)
                    end
                end

                -- Rewards render below everything else in collapsed mode, so their height
                -- must be reserved or the last line falls outside the window.
                items_height = items_height + getRewardHeight(missionData.reward)

                -- Calculate total height
                window_height = base_height + text_height + items_height

                -- Minimum of 200px
                if window_height < 200 then
                    window_height = 200
                end
            else
                window_height = 250  -- Fallback
            end
        else
            window_height = 250  -- Fallback
        end
    else
        -- Expanded mode: Larger window for scrolling
        window_height = 600
    end

    local scaled_width = 600 * ui_scale
    local scaled_height = window_height * ui_scale

    -- Snapshot before any button clicks can mutate show_all_steps this frame
    local show_all_steps_this_frame = ui_settings.show_all_steps
    local is_expanding = (prev_show_all_steps == false and show_all_steps_this_frame == true)

    if current_mission and not ui_settings.show_all_steps then
        -- Collapsed mode: enforce dynamic size every frame so height tracks content
        imgui.SetNextWindowSize({scaled_width, scaled_height}, ImGuiCond_Always)
    else
        -- Expanded mode: lock width, allow height resize
        -- On transition from collapsed, force-restore the saved expanded height
        local saved_h = (ui_settings.expanded_window_height or 600) * ui_scale
        imgui.SetNextWindowSizeConstraints({scaled_width, 200}, {scaled_width, 2000})
        if is_expanding then
            imgui.SetNextWindowSize({scaled_width, saved_h}, ImGuiCond_Always)
        end
    end

    -- No window flags on purpose.
    --
    -- p_open has to be a table for the title bar's X to report back - but passing nil
    -- was also what stopped the flags argument being read at all. Turning them on for
    -- the first time fought the SetNextWindowSize above and clipped the panel, so the
    -- window keeps the sizing it has always used and stays collapsible (the title bar
    -- arrow hides it without needing /questhelper).
    local mainFlags = 0
    local main_open = { true }
    local window_open = imgui.Begin('Quest Helper', main_open, mainFlags)

    -- Apply font scaling for the entire window
    imgui.SetWindowFontScale(ui_scale)

    local mainX, mainY = 0, 0
    local mainW, mainH = 0, 0
    local new_showImagesDrawer = showImagesDrawer
    local new_currentTopCategory = currentTopCategory
    local new_currentSubfile = currentSubfile
    local new_current_mission = current_mission

    if window_open then
        mainX, mainY = imgui.GetWindowPos()
        mainW, mainH = imgui.GetWindowSize()

        -- Save expanded height so re-expanding restores the user's last set height
        if ui_settings.show_all_steps then
            ui_settings.expanded_window_height = mainH / ui_scale
        end

        -- STICKY TOP BAR: All control buttons in one line
        -- Images drawer toggle - lit while the drawer is open
        local imgPushed = theme.pushButton(showImagesDrawer and 'accent' or 'neutral')
        if imgui.SmallButton("Maps##drawerToggle") then
            new_showImagesDrawer = not showImagesDrawer
        end
        imgui.PopStyleColor(imgPushed)

        -- Settings button (the gear glyph has no font coverage - it drew as "?")
        imgui.SameLine()
        local setPushed = theme.pushButton(show_settings_window and 'accent' or 'neutral')
        if imgui.SmallButton("Settings##Settings") then
            show_settings_window = not show_settings_window
            settings_just_opened = show_settings_window
        end
        imgui.PopStyleColor(setPushed)

        -- Progression guide toggle
        imgui.SameLine()
        local guidePushed = theme.pushButton(show_progression_guide and 'accent' or 'neutral')
        if imgui.SmallButton("Guide##GuideToggle") then
            show_progression_guide = not show_progression_guide
        end
        imgui.PopStyleColor(guidePushed)

        -- Navigation back buttons and toggles (hidden while guide is open)
        if not show_progression_guide and current_mission then
            -- Collapse/Expand Steps Toggle
            imgui.SameLine()
            if ui_settings.show_all_steps then
                if imgui.SmallButton("Collapse##CollapseToggle") then
                    ui_settings.show_all_steps = false
                    settings.save('QuestHelper_settings', quest_state.settings)
                end
            else
                if imgui.SmallButton("Expand##CollapseToggle") then
                    ui_settings.show_all_steps = true
                    settings.save('QuestHelper_settings', quest_state.settings)
                end
            end

            -- Back to Missions button
            imgui.SameLine()
            if imgui.SmallButton("< Back##BackToMissions") then
                new_current_mission = nil
            end

            -- Next Mission button (Missions only, within same subfile)
            if currentTopCategory == "Missions" then
                local subData_nav = quest_data[currentTopCategory] and quest_data[currentTopCategory][currentSubfile]
                if subData_nav then
                    local keys_nav = utils.get_sorted_keys(subData_nav)
                    local cur_idx = nil
                    for i, k in ipairs(keys_nav) do
                        if k == current_mission then cur_idx = i break end
                    end

                    -- Advance past any route the player didn't take, so finishing one
                    -- alternate route steps to the next real mission in the chain.
                    local settled_nav = getSettledChoiceGroups(currentTopCategory, currentSubfile, subData_nav, quest_state, quest_data)
                    local next_idx = nil
                    if cur_idx then
                        for i = cur_idx + 1, #keys_nav do
                            if not isRouteNotTaken(settled_nav, subData_nav, keys_nav[i], currentTopCategory, currentSubfile, quest_state, quest_data) then
                                next_idx = i
                                break
                            end
                        end
                    end

                    if next_idx then
                        imgui.SameLine()
                        if imgui.SmallButton("Next >##NextMission") then
                            new_current_mission = keys_nav[next_idx]
                            collapsed_viewed_step = 1
                        end
                    end
                end
            end
        elseif not show_progression_guide and currentSubfile then
            -- Back to Subfiles button (when viewing mission list)
            imgui.SameLine()
            if imgui.SmallButton("< Back##BackToSubfiles") then
                new_currentSubfile = nil
            end
        elseif not show_progression_guide and currentTopCategory then
            -- Back to Categories button (when viewing subfile list)
            imgui.SameLine()
            if imgui.SmallButton("< Back##BackToCategories") then
                new_currentTopCategory = nil
            end
        end

        imgui.Separator()

        -- Begin scrollable content area (everything below the top bar scrolls)
        imgui.BeginChild("##ScrollableContent", {0, 0}, false, 0)

        -- SEARCH BAR (hide when viewing mission in collapsed mode to save space)
        local show_search = not (current_mission and not ui_settings.show_all_steps)
        if show_search then
            imgui.Text("Search Missions/Quests (lowest-level):")
            local input_buf = { search_query }
            if imgui.InputText("##SearchQuest", input_buf, 256) then
                search_query = input_buf[1]
                perform_search(quest_data)
            end
            imgui.Separator()
        end

        -- SEARCH RESULTS
        if search_query ~= "" then
            if #search_results == 0 then
                imgui.TextColored(col.red, "No matches found.")
            else
                imgui.TextColored(col.gold, "Search Results:")
                for _, result in ipairs(search_results) do
                    local topCat  = result.topCategory
                    local subfile = result.subfile
                    local mission = result.mission
                    local isComplete = quest_state.isMissionComplete(topCat, subfile, mission, quest_data)
                    local label = string.format("[%s] %s -> %s", topCat, subfile, mission)

                    local pushed = theme.pushButton(isComplete and 'done' or 'todo')

                    if imgui.Button(label) then
                        new_currentTopCategory = topCat
                        new_currentSubfile     = subfile
                        new_current_mission    = mission
                        search_query           = ""
                        search_results         = T{}
                    end
                    imgui.PopStyleColor(pushed)
                end
            end
            imgui.Separator()
        else
            -- Normal Navigation
            if show_progression_guide then
                -- Dedicated progression guide page
                imgui.TextColored(col.gold, "Progression Guide")
                imgui.TextColored(col.dim, "Suggested mission order by level.")
                imgui.Spacing()
                for _, tier in ipairs(progression_guide) do
                    imgui.TextColored(col.gold, tier.label)
                    imgui.Separator()
                    for _, entry in ipairs(tier.entries) do
                        local subfileData = quest_data[entry.topCategory] and quest_data[entry.topCategory][entry.subfile]
                        local done = subfileData and quest_state.isSubfileComplete(entry.topCategory, entry.subfile, quest_data)
                        local pushed
                        if done then
                            pushed = theme.pushButton('done')
                        elseif subfileData then
                            pushed = theme.pushButton('neutral')
                        else
                            pushed = theme.pushButton('muted')
                        end
                        local btnLabel = entry.label .. (entry.note and (' (' .. entry.note .. ')') or '') .. '##pg_' .. entry.topCategory .. entry.subfile .. entry.label
                        if imgui.Button(btnLabel) and subfileData then
                            new_currentTopCategory = entry.topCategory
                            new_currentSubfile     = entry.subfile
                            new_current_mission    = entry.mission or nil
                            show_progression_guide = false
                        end
                        imgui.PopStyleColor(pushed)
                    end
                    imgui.Spacing()
                end

            elseif not currentTopCategory then
                imgui.Text('Select a top category:')
                for category, _ in pairs(quest_data) do
                    if imgui.Button(category) then
                        new_currentTopCategory = category
                    end
                end

            elseif not currentSubfile then
                imgui.TextColored(col.dim, currentTopCategory)
                imgui.Separator()
                imgui.Text('Select a Subfile:')
                if not quest_data[currentTopCategory] then
                    imgui.TextColored(col.red, 'No subfiles found in ' .. currentTopCategory)
                else
                    local subKeys = utils.get_sorted_keys(quest_data[currentTopCategory])
                    for _, sfName in ipairs(subKeys) do
                        local complete = quest_state.isSubfileComplete(currentTopCategory, sfName, quest_data)
                        local pushed = theme.pushButton(complete and 'done' or 'neutral')
                        local label = sfName
                        if complete then label = label .. " (Complete!)" end
                        if imgui.Button(label) then new_currentSubfile = sfName end
                        imgui.PopStyleColor(pushed)
                    end
                end

            elseif not current_mission then
                imgui.TextColored(col.dim, currentTopCategory .. '  >  ' .. currentSubfile)
                imgui.Separator()
                local subData = quest_data[currentTopCategory][currentSubfile]
                if not subData then
                    imgui.TextColored(col.red, 'No missions found in ' .. currentSubfile)
                else
                    imgui.Text('Select a mission:')
                    local missionKeys = utils.get_sorted_keys(subData)

                    local groupSettled = getSettledChoiceGroups(currentTopCategory, currentSubfile, subData, quest_state, quest_data)
                    local progressCounts = getProgressGroupCounts(currentTopCategory, currentSubfile, subData, quest_state, quest_data)
                    -- Read once per frame, not once per entry.
                    local currentJob = player_module.getMainJob()
                    local currentJobName = player_module.getMainJobName()
                    local groupCaptioned = {}
                    for _, mname in ipairs(missionKeys) do
                        local group = subData[mname].choice_group
                        local pgroup = subData[mname].progress_group
                        local complete = quest_state.isMissionComplete(currentTopCategory, currentSubfile, mname, quest_data)
                        -- Entries that only apply on one job (the 15 Maat fights) pin it with
                        -- job_id. Mark the one matching the player's job - but never hide or
                        -- auto-pick, since the rest are still a valid checklist (Maat's Cap).
                        local isPlayerJob = currentJob ~= nil and subData[mname].job_id == currentJob
                        local label = mname
                        local pushedColors = 0

                        if pgroup then
                            -- Caption the group once with its running count, then list every
                            -- member. No member is ever greyed out: the ones still outstanding
                            -- are optional extras, not routes passed over.
                            if not groupCaptioned[pgroup] then
                                local caption = string.format('%s - %d/%d done',
                                    pgroup, progressCounts[pgroup].done, progressCounts[pgroup].total)
                                if currentJobName then
                                    caption = caption .. ' - you are on ' .. currentJobName
                                end
                                theme.caption(caption)
                                groupCaptioned[pgroup] = true
                            end
                            label = '  ' .. label
                            if complete then
                                pushedColors = theme.pushButton('done')
                                label = label .. ' (Complete!)'
                            elseif isPlayerJob then
                                pushedColors = theme.pushButton('accent')
                                label = label .. '  <-- your current job'
                            end
                        elseif group and not groupSettled[group] then
                            -- Undecided: caption the group once, then offer each route.
                            if not groupCaptioned[group] then
                                theme.caption(group .. ' - choose one:')
                                groupCaptioned[group] = true
                            end
                            pushedColors = theme.pushButton('choice')
                            label = '  ' .. label
                        elseif group and not complete then
                            -- The route not taken: greyed out, but still readable.
                            pushedColors = theme.pushButton('muted')
                            label = label .. ' (route not taken)'
                        elseif complete then
                            pushedColors = theme.pushButton('done')
                            label = label .. ' (Complete!)'
                        end

                        if imgui.Button(label) then new_current_mission = mname end

                        if pushedColors > 0 then
                            imgui.PopStyleColor(pushedColors)
                        end
                    end
                end

            else
                -- Display mission details
                local missionData = quest_data[currentTopCategory][currentSubfile][current_mission]
                local steps  = missionData.steps or {}
                local reward = missionData.reward

                -- Show full header and progress only when NOT collapsed
                if ui_settings.show_all_steps then
                    imgui.TextColored(col.dim, currentTopCategory .. '  >  ' .. currentSubfile)
                    imgui.TextColored(col.gold, current_mission)

                    -- Progress readout
                    local pct, done, tot = quest_state.calculateProgress(currentTopCategory, currentSubfile, current_mission, quest_data)
                    theme.progressBar(pct, done, tot)
                    imgui.Separator()
                else
                    -- Minimal header when collapsed: mission name + step progress
                    imgui.TextColored(col.gold, current_mission)

                    local pct, done, tot = quest_state.calculateProgress(currentTopCategory, currentSubfile, current_mission, quest_data)
                    theme.progressBar(pct, done, tot)

                    -- Step navigation buttons in collapsed mode (before items/keyitems)
                    local current_step_index = quest_state.getCurrentStep(currentTopCategory, currentSubfile, current_mission, quest_data)

                    -- Initialize viewed step to current step if not set OR auto-advance if user completed steps
                    if not collapsed_viewed_step or collapsed_viewed_step < 1 or collapsed_viewed_step > #steps then
                        collapsed_viewed_step = math.min(current_step_index, #steps)
                    elseif collapsed_viewed_step < current_step_index then
                        -- Auto-advance: user completed steps, follow the current step forward
                        collapsed_viewed_step = math.min(current_step_index, #steps)
                    end
                    -- Note: We don't auto-rewind when user unchecks earlier steps
                    -- This allows manual navigation with prev/next buttons to work properly

                    if #steps > 1 then
                        -- Previous button
                        if collapsed_viewed_step > 1 then
                            if imgui.SmallButton("< Prev##CollapsedPrev") then
                                collapsed_viewed_step = collapsed_viewed_step - 1
                            end
                            imgui.SameLine()
                        end

                        imgui.TextColored(col.dim, string.format("Step %d/%d", collapsed_viewed_step, #steps))
                        imgui.SameLine()

                        -- Next button
                        if collapsed_viewed_step < #steps then
                            if imgui.SmallButton("Next >##CollapsedNext") then
                                collapsed_viewed_step = collapsed_viewed_step + 1
                            end
                        end

                        imgui.Separator()
                    end
                end

                -- Items Needed Section (check inventory every 5 seconds)
                local itemsNeeded = getAllItemsNeeded(missionData)
                if #itemsNeeded > 0 and inventory_cache then
                    local currentTime = os.clock()
                    local timeSinceLastCheck = currentTime - last_inventory_check

                    -- Check inventory every 5 seconds or when quest first opens
                    -- Search all storages (not just inventory)
                    if timeSinceLastCheck >= INVENTORY_CHECK_INTERVAL or not inventory_results[current_mission] then
                        -- We need to manually check all items across all storages
                        local results = {}
                        local inventory_module = require('modules.inventory')
                        for _, itemData in ipairs(itemsNeeded) do
                            local itemName = itemData.name
                            local alternatives = itemData.alternatives

                            -- If alternatives exist, check all of them
                            if alternatives and type(alternatives) == 'table' then
                                local bestCount = 0
                                local bestLocations = {}
                                local hasAny = false
                                local bestMatch = nil

                                for _, alt in ipairs(alternatives) do
                                    local altName, altQty

                                    -- Parse alternative format
                                    if type(alt) == 'string' then
                                        -- Simple string: "Meteorite"
                                        altName = alt
                                        altQty = 1
                                    elseif type(alt) == 'table' then
                                        if alt.item then
                                            -- {item = "Meteorite", quantity = 1}
                                            altName = alt.item
                                            altQty = alt.quantity or 1
                                        elseif alt[1] then
                                            -- {"Meteorite", 1}
                                            altName = alt[1]
                                            altQty = alt[2] or 1
                                        end
                                    end

                                    if altName then
                                        local hasItem, count, locations = inventory_module.hasItem(altName, true)
                                        if hasItem then
                                            -- Calculate progress: how many "sets" of this alternative we have
                                            local progress = math.floor(count / altQty)
                                            -- If this alternative is better, use it
                                            if progress > math.floor(bestCount / (bestMatch and bestMatch.qty or 1)) then
                                                hasAny = true
                                                bestCount = count
                                                bestLocations = locations or {}
                                                bestMatch = { name = altName, qty = altQty }
                                            end
                                        end
                                    end
                                end

                                results[itemName] = {
                                    hasItem = hasAny,
                                    count = bestCount,
                                    locations = bestLocations,
                                    alternative_match = bestMatch  -- Store which alternative matched
                                }
                            else
                                -- Normal single item check
                                local hasItem, count, locations = inventory_module.hasItem(itemName, true)
                                results[itemName] = {
                                    hasItem = hasItem,
                                    count = count,
                                    locations = locations  -- Store location info
                                }
                            end
                        end
                        inventory_results[current_mission] = results
                        last_inventory_check = currentTime
                    end

                    -- Display items needed (collapsible, open by default)
                    -- Track the expanded state for dynamic height calculation
                    local items_header_expanded = imgui.CollapsingHeader(string.format("Items Needed (%d)###ItemsHeader", #itemsNeeded), ui_settings.items_section_expanded and ImGuiTreeNodeFlags_DefaultOpen or 0)

                    -- Update state if it changed
                    if items_header_expanded ~= ui_settings.items_section_expanded then
                        ui_settings.items_section_expanded = items_header_expanded
                        settings.save('QuestHelper_settings', quest_state.settings)
                    end

                    if items_header_expanded then
                        for _, itemData in ipairs(itemsNeeded) do
                            local itemName = itemData.name
                            local qtyNeeded = itemData.quantity
                            local result = inventory_results[current_mission] and inventory_results[current_mission][itemName]

                            if result and result.hasItem then
                                -- If this is an alternative match, show which one we found
                                local displayName = itemName
                                local displayQty = qtyNeeded
                                if result.alternative_match then
                                    displayName = result.alternative_match.name
                                    displayQty = result.alternative_match.qty
                                end

                                -- Build compact location string
                                local locationStr = ""
                                if result.locations then
                                    local locParts = {}
                                    -- Put Inventory first if it exists
                                    if result.locations["Inventory"] then
                                        table.insert(locParts, string.format("Inventory: %d", result.locations["Inventory"]))
                                    end
                                    -- Then add other locations
                                    for locName, locCount in pairs(result.locations) do
                                        if locName ~= "Inventory" then
                                            table.insert(locParts, string.format("%s: %d", locName, locCount))
                                        end
                                    end
                                    if #locParts > 0 then
                                        locationStr = "    " .. table.concat(locParts, ", ")
                                    end
                                end

                                -- Color based on location: GREEN if in Inventory, YELLOW if in storage
                                local inInventory = result.locations and result.locations["Inventory"]

                                -- Check if we have enough
                                local hasEnough = result.count >= displayQty

                                -- Display main line
                                if hasEnough then
                                    if inInventory then
                                        -- GREEN - Item in Inventory (ready!)
                                        imgui.TextColored(col.green, string.format("  [x] %s x%d (have %d)", displayName, displayQty, result.count))
                                    else
                                        -- YELLOW - Item in storage (need to retrieve)
                                        imgui.TextColored(col.gold, string.format("  [!] %s x%d (have %d)", displayName, displayQty, result.count))
                                    end
                                else
                                    -- ORANGE - Have some but not enough
                                    if itemData.on_the_way then
                                        imgui.TextColored(col.amber, string.format("  [~] %s x%d (have %d, pick up during quest)", displayName, displayQty, result.count))
                                    else
                                        imgui.TextColored(col.amber, string.format("  [~] %s x%d (have %d)", displayName, displayQty, result.count))
                                    end
                                end

                                -- Display storage locations on one line
                                if locationStr ~= "" then
                                    local color = hasEnough and (inInventory and col.green or col.gold) or col.amber
                                    imgui.TextColored(color, locationStr)
                                end
                            else
                                if itemData.optional then
                                    -- GREY - Optional, don't have it
                                    if itemData.alternatives then
                                        imgui.TextColored(col.faint, string.format("  [ ] %s (optional)", itemName))
                                    else
                                        imgui.TextColored(col.faint, string.format("  [ ] %s x%d (optional)", itemName, qtyNeeded))
                                    end
                                elseif itemData.on_the_way then
                                    -- YELLOW - Don't have it but can pick up during quest
                                    if itemData.alternatives then
                                        imgui.TextColored(col.gold, string.format("  [ ] %s (pick up during quest)", itemName))
                                    else
                                        imgui.TextColored(col.gold, string.format("  [ ] %s x%d (pick up during quest)", itemName, qtyNeeded))
                                    end
                                else
                                    -- RED - Don't have it
                                    if itemData.alternatives then
                                        imgui.TextColored(col.red, string.format("  [ ] %s", itemName))
                                    else
                                        imgui.TextColored(col.red, string.format("  [ ] %s x%d", itemName, qtyNeeded))
                                    end
                                end
                                -- List the acceptable options beneath a grouped (alternatives) item
                                if itemData.alternatives then
                                    local altNames = {}
                                    for _, alt in ipairs(itemData.alternatives) do
                                        if type(alt) == 'string' then
                                            table.insert(altNames, alt)
                                        elseif type(alt) == 'table' then
                                            table.insert(altNames, alt.item or alt[1])
                                        end
                                    end
                                    imgui.TextColored(col.faint, "        any of: " .. table.concat(altNames, ", "))
                                end
                            end
                        end
                    end
                    imgui.Separator()
                end

                -- Key Items Needed Section (collapsible, open by default)
                local keyItemsNeeded = utils.getAllKeyItemsNeeded(missionData, keyitems_db)
                if #keyItemsNeeded > 0 and keyitem_module then
                    -- Track the expanded state for dynamic height calculation
                    local keyitems_header_expanded = imgui.CollapsingHeader(string.format("Key Items (%d)###KeyItemsHeader", #keyItemsNeeded), ui_settings.keyitems_section_expanded and ImGuiTreeNodeFlags_DefaultOpen or 0)

                    -- Update state if it changed
                    if keyitems_header_expanded ~= ui_settings.keyitems_section_expanded then
                        ui_settings.keyitems_section_expanded = keyitems_header_expanded
                        settings.save('QuestHelper_settings', quest_state.settings)
                    end

                    if keyitems_header_expanded then
                        -- Check if key item tracking is initialized
                        if not keyitem_module.isInitialized() then
                            imgui.TextColored(col.gold, "  [!] Key item tracking not ready yet")
                            imgui.TextColored(col.dim, "  This will require a zone to update.")
                        else
                            for _, ki in ipairs(keyItemsNeeded) do
                                local hasKI = keyitem_module.hasKeyItem(ki.id)
                                if hasKI then
                                    -- GREEN - Player has it
                                    imgui.TextColored(col.green, string.format("  [x] KI: %s", ki.name))
                                elseif ki.optional then
                                    -- GREY - Optional, don't have it (not required to progress)
                                    imgui.TextColored(col.faint, string.format("  [ ] KI: %s (optional)", ki.name))
                                else
                                    -- RED - Don't have it
                                    imgui.TextColored(col.red, string.format("  [ ] KI: %s", ki.name))
                                end
                            end
                        end
                    end
                    imgui.Separator()
                end

                -- Requirements Section (collapsible, open by default)
                local requirements = getRequirementRows(missionData, quest_state)
                if #requirements > 0 then
                    local req_header_expanded = imgui.CollapsingHeader(string.format("Requirements (%d)###RequirementsHeader", #requirements), ui_settings.requirements_section_expanded and ImGuiTreeNodeFlags_DefaultOpen or 0)

                    if req_header_expanded ~= ui_settings.requirements_section_expanded then
                        ui_settings.requirements_section_expanded = req_header_expanded
                        settings.save('QuestHelper_settings', quest_state.settings)
                    end

                    if req_header_expanded then
                        for _, req in ipairs(requirements) do
                            if req.status == 'ok' then
                                imgui.TextColored(col.green, "  [x] " .. req.text)
                            elseif req.status == 'fail' then
                                imgui.TextColored(col.red, "  [!] " .. req.text)
                            else
                                -- Can't be verified from the client - show as a reminder
                                imgui.TextColored(col.amber, "  [?] " .. req.text)
                            end
                        end
                        imgui.Separator()
                    end
                end

                -- Prerequisites Section (collapsible, open by default)
                local prerequisites = getAllPrerequisites(missionData, quest_state, quest_data)
                if #prerequisites > 0 then
                    -- Track the expanded state for dynamic height calculation
                    local prereq_header_expanded = imgui.CollapsingHeader(string.format("Prerequisites (%d)###PrereqHeader", #prerequisites), ui_settings.prerequisites_section_expanded and ImGuiTreeNodeFlags_DefaultOpen or 0)

                    -- Update state if it changed
                    if prereq_header_expanded ~= ui_settings.prerequisites_section_expanded then
                        ui_settings.prerequisites_section_expanded = prereq_header_expanded
                        settings.save('QuestHelper_settings', quest_state.settings)
                    end

                    if prereq_header_expanded then
                        for idx, prereq in ipairs(prerequisites) do
                            if prereq.caption then
                                -- OR group header, e.g. "Choose one:"
                                imgui.TextColored(col.blue, prereq.caption)
                            else
                                local isComplete = quest_state.isMissionComplete(prereq.category, prereq.subfile, prereq.name, quest_data)
                                local isRecommended = prereq.recommended == true
                                local isChoice = prereq.or_choice == true

                                local pushedPrereq
                                if isComplete then
                                    pushedPrereq = theme.pushButton('done')
                                elseif isChoice then
                                    pushedPrereq = theme.pushButton('choice')
                                elseif isRecommended then
                                    pushedPrereq = theme.pushButton('accent')
                                else
                                    pushedPrereq = theme.pushButton('todo')
                                end

                                -- Choice rows sit under a "Choose one:" caption, so they drop
                                -- the category prefix to stay inside the window width.
                                local buttonLabel
                                if isChoice then
                                    buttonLabel = string.format("  [ ] %s##prereq_%d", prereq.name, idx)
                                else
                                    buttonLabel = string.format("%s %s: %s%s##prereq_%d",
                                        isComplete and "[x]" or "[ ]",
                                        prereq.category,
                                        prereq.name,
                                        isRecommended and " (recommended)" or "",
                                        idx)
                                end

                                if imgui.Button(buttonLabel) then
                                    -- Navigate to the prerequisite quest/mission
                                    new_currentTopCategory = prereq.category
                                    new_currentSubfile = prereq.subfile
                                    new_current_mission = prereq.name
                                end

                                imgui.PopStyleColor(pushedPrereq)
                            end
                        end
                        imgui.Separator()
                    end
                end

                -- Get current step for route display optimization
                local current_step_index = quest_state.getCurrentStep(currentTopCategory, currentSubfile, current_mission, quest_data)

                -- Route Section (collapsible, shows route for current step)
                -- In collapsed mode: use viewed step, in expanded mode: use current step
                local route_step_index = ui_settings.show_all_steps and current_step_index or collapsed_viewed_step
                local route_step_data = steps[route_step_index]
                route_step_data = step_utils.resolveDynamicStep(route_step_data, currentTopCategory, currentSubfile, current_mission, quest_state)
                if route_step_data and type(route_step_data) == 'table' and route_step_data.route_to then
                    -- Track the expanded state for dynamic height calculation
                    local route_header_expanded = imgui.CollapsingHeader("Route###RouteHeader", ui_settings.route_section_expanded and ImGuiTreeNodeFlags_DefaultOpen or 0)

                    -- Update state if it changed
                    if route_header_expanded ~= ui_settings.route_section_expanded then
                        ui_settings.route_section_expanded = route_header_expanded
                        settings.save('QuestHelper_settings', quest_state.settings)
                    end

                    if route_header_expanded then
                        -- Load pathfinding module on demand
                        local pathfinding_ok, pathfinding = pcall(require, 'modules.pathfinding')

                        if pathfinding_ok then
                            -- Get player's current zone (Ashita API)
                            local party = AshitaCore:GetMemoryManager():GetParty()
                            if party then
                                local player_zone_id = party:GetMemberZone(0)
                                if player_zone_id and player_zone_id > 0 then
                                    local zones_db = require('data.zones')
                                    local current_zone = pathfinding.getCurrentZone(player_zone_id, zones_db)

                                    if current_zone then
                                        local destination = route_step_data.route_to
                                        local path = pathfinding.findPath(current_zone, destination)

                                        if path then
                                            local route_str = pathfinding.formatPath(path, current_zone, route_step_data.destination_highlight)
                                            local distance = pathfinding.getRouteDistance(path)

                                            if distance == 0 then
                                                -- Already at destination
                                                imgui.TextColored(col.green, "  " .. route_str)
                                            elseif pathfinding.isLongRoute(path) then
                                                -- Long route warning
                                                imgui.TextColored(col.gold, string.format("  %d zones:", distance))
                                                -- Display each zone on its own line with indent
                                                for line in route_str:gmatch("[^\n]+") do
                                                    imgui.TextColored(col.text, "  " .. line)
                                                end
                                            else
                                                -- Normal route
                                                imgui.TextColored(col.blue, string.format("  %d zones:", distance))
                                                -- Display each zone on its own line with indent
                                                for line in route_str:gmatch("[^\n]+") do
                                                    imgui.TextColored(col.text, "  " .. line)
                                                end
                                            end
                                        else
                                            -- No path found
                                            imgui.TextColored(col.red, "  No route found to " .. destination)
                                            imgui.TextColored(col.dim, "  (Zone graph incomplete)")
                                        end
                                    else
                                        -- Current zone not in database
                                        imgui.TextColored(col.amber, "  Current zone not mapped")
                                    end
                                end
                            end
                        end
                    end
                    imgui.Separator()
                end

                -- Steps
                -- Determine which steps to display based on show_all_steps setting
                local steps_to_show = {}

                if ui_settings.show_all_steps then
                    -- Show all steps
                    for i = 1, #steps do
                        table.insert(steps_to_show, i)
                    end
                else
                    -- Collapsed mode: show the viewed step (navigation buttons are above)
                    if collapsed_viewed_step and collapsed_viewed_step >= 1 and collapsed_viewed_step <= #steps then
                        table.insert(steps_to_show, collapsed_viewed_step)
                    end
                end

                for _, i in ipairs(steps_to_show) do
                    local step_data = steps[i]
                    step_data = step_utils.resolveDynamicStep(step_data, currentTopCategory, currentSubfile, current_mission, quest_state)
                    local base_text = (type(step_data) == 'table' and step_data.text) or tostring(step_data)
                    local dyn_banner = (type(step_data) == 'table') and step_data.dynamic_banner or nil
                    -- `text` drives the height/scroll maths below and must include the
                    -- banner; `base_text` and `dyn_banner` are rendered separately so the
                    -- banner can carry its own colour.
                    local text = dyn_banner and (base_text .. '\n \n' .. dyn_banner) or base_text
                    local st = quest_state.getStepState(currentTopCategory, currentSubfile, current_mission, i, step_data)
                    local cbLabel = string.format("##step_%d", i)
                    local ref = { st }
                    if imgui.Checkbox(cbLabel, ref) then
                        quest_state.setStepState(currentTopCategory, currentSubfile, current_mission, i, ref[1], nil)
                    end
                    imgui.SameLine()

                    -- Calculate estimated text height for collapse mode scrolling
                    local use_scrollable_text = false
                    local estimated_text_height = 0

                    if not ui_settings.show_all_steps then
                        -- 55 chars per line to match rendering with the scrollbar, ~20px per line
                        estimated_text_height = countWrappedLines(text, 55) * 20

                        -- Use scrollable container if text height exceeds 350px
                        -- Scale the threshold with UI scale
                        local scroll_threshold = 350 * ui_scale
                        if estimated_text_height > scroll_threshold then
                            use_scrollable_text = true
                        end
                    end

                    -- Begin scrollable container if text is too long in collapse mode
                    if use_scrollable_text then
                        -- Scale container height with UI scale
                        local container_height = 350 * ui_scale
                        imgui.BeginChild("##StepTextScroll", {-1, container_height}, true, 0)
                        -- Apply font scaling to child window
                        imgui.SetWindowFontScale(ui_scale)
                    end

                    -- Render the step text
                    -- Use narrower wrap width when scrollbar is present to prevent text cutoff
                    local wrap_width = use_scrollable_text and 55 or 60
                    local tint = ref[1] and 'done' or (i == current_step_index and 'active' or nil)

                    -- Group so wrapped lines align under the first, not back at the margin
                    if has_group then imgui.BeginGroup() end
                    theme.renderStepText(base_text, wrap_width, utils.wrap_text, tint)

                    -- Resolved randomised target, under the step heading and in its own
                    -- colour so it stands out against the active-step text.
                    if dyn_banner then
                        imgui.Spacing()
                        imgui.TextColored(col.cyan, utils.wrap_text(dyn_banner, wrap_width))
                    end
                    if has_group then imgui.EndGroup() end

                    -- End scrollable container if we started one
                    if use_scrollable_text then
                        imgui.EndChild()
                    end

                    -- KILL COUNTER UI DISPLAY
                    if not st and step_data.kill_requirement then
                        local kill_req = step_data.kill_requirement
                        local current_count = quest_state.getKillCount(currentTopCategory, currentSubfile, current_mission, i) or 0
                        local required_count = kill_req.count

                        imgui.Indent(20)
                        if current_count >= required_count then
                            imgui.TextColored(col.green, string.format("[%d/%d] Kills Complete!", current_count, required_count))
                        else
                            imgui.TextColored(col.gold, string.format("[%d/%d] Kills Remaining", current_count, required_count))
                        end

                        -- Show enemy types if specified (one per line to prevent text overflow)
                        if kill_req.enemies and #kill_req.enemies > 0 then
                            for _, enemy_name in ipairs(kill_req.enemies) do
                                imgui.TextColored(col.dim, "  - " .. enemy_name)
                            end
                        end
                        imgui.Unindent(20)
                    end

                    -- DAILY PASSWORD CACHE UI DISPLAY (e.g. Castle Oztroja)
                    if not st and type(step_data) == 'table' and step_data.daily_passwords then
                        local dp = step_data.daily_passwords
                        local words = quest_state.getDailyPasswords(currentTopCategory, currentSubfile, current_mission, i) or {}
                        imgui.Indent(20)
                        imgui.TextColored(col.blue, "Passwords (reset each Vana'diel day):")
                        if dp.slots then
                            for _, slot in ipairs(dp.slots) do
                                local w = words[slot.slot]
                                local lbl = slot.label or ("#" .. tostring(slot.slot))
                                if w then
                                    imgui.TextColored(col.green, string.format("  %s = %s", lbl, w))
                                else
                                    imgui.TextColored(col.gold, string.format("  %s = ____", lbl))
                                end
                            end
                        end
                        imgui.Unindent(20)
                    end

                    -- Divider between steps in expanded mode
                    -- (was pushing index 3 = ChildBg, so it never tinted the separator)
                    if ui_settings.show_all_steps and i < #steps then
                        imgui.Spacing()
                        imgui.PushStyleColor(theme.C.Separator, {0.35, 0.50, 0.80, 0.55})
                        imgui.Separator()
                        imgui.PopStyleColor(1)
                        imgui.Spacing()
                    end
                end

                -- Rewards (shown in both expanded and collapsed modes)
                if reward then
                    local hasItems = type(reward.items) == 'table' and #reward.items > 0
                    local hasText  = type(reward.text) == 'string' and reward.text ~= ""
                    if hasItems or hasText then
                        imgui.Spacing()
                        imgui.Separator()
                        imgui.TextColored(col.gold, "Rewards")
                    end
                    if hasItems then
                        for idx, item_data in ipairs(reward.items) do
                            if type(item_data) == 'table' and item_data.name then
                                if imgui.TreeNode(item_data.name .. "##rewarditem" .. idx) then
                                    imgui.TextColored(col.gold,"  Name: ");  imgui.SameLine(); imgui.TextWrapped(item_data.name)
                                    if item_data.type then imgui.TextColored(col.gold,"  Type: "); imgui.SameLine(); imgui.TextWrapped(item_data.type) end
                                    if item_data.races then imgui.TextColored(col.gold,"  Race: "); imgui.SameLine(); imgui.TextWrapped(item_data.races) end
                                    if item_data.stats then imgui.TextColored(col.gold,"  Stat: "); imgui.SameLine(); imgui.TextWrapped(table.concat(item_data.stats, ", ")) end
                                    if item_data.level then imgui.TextColored(col.gold,"  Lvl.: "); imgui.SameLine(); imgui.TextWrapped(item_data.level) end
                                    if item_data.jobs then imgui.TextColored(col.gold,"  Jobs: "); imgui.SameLine(); imgui.TextWrapped(item_data.jobs) end
                                    if item_data.note then imgui.TextColored(col.gold,"  Note: "); imgui.SameLine(); imgui.TextWrapped(item_data.note) end
                                    imgui.TreePop()
                                end
                            end
                        end
                        imgui.Separator()
                    end
                    if hasText then
                        imgui.TextWrapped(reward.text)
                    end
                end
            end
        end

        -- End scrollable content area
        imgui.EndChild()
    end

    imgui.End()

    -- Title bar X - questhelper.lua reads this and drops is_open
    if not main_open[1] then
        ui_main.close_requested = true
    end

    -- Settings Window
    if show_settings_window then
        -- Scale settings window to match main UI
        local settings_ui_scale = ui_settings.ui_scale or 1.0
        imgui.SetNextWindowSize({380 * settings_ui_scale, 470 * settings_ui_scale}, ImGuiCond_FirstUseEver)

        -- A collapsed window's Begin() returns false. That used to be read as "closed",
        -- which left the window permanently unopenable. Collapsing is fine now, and
        -- clicking Settings force-uncollapses so an already-stuck window recovers.
        if settings_just_opened and type(imgui.SetNextWindowCollapsed) == 'function' then
            imgui.SetNextWindowCollapsed(false, ImGuiCond_Always)
        end
        settings_just_opened = false

        local settings_open = { true }
        if imgui.Begin("QuestHelper Settings", settings_open, 0) then
            -- Apply font scaling for settings window
            imgui.SetWindowFontScale(settings_ui_scale)

            settingsSection("Maps")

            -- Auto-scroll toggle
            local auto_scroll_ref = { ui_settings.auto_scroll_enabled }
            if imgui.Checkbox("Follow my floor / zone", auto_scroll_ref) then
                ui_settings.auto_scroll_enabled = auto_scroll_ref[1]
                settings.save('QuestHelper_settings', quest_state.settings)
            end
            if imgui.IsItemHovered() then
                imgui.SetTooltip("Switch the map automatically as you move between zones and floors")
            end

            -- Map opacity slider
            imgui.TextColored(col.dim, "Opacity")
            local opacity_ref = { ui_settings.map_opacity }
            imgui.PushItemWidth(-1)
            if imgui.SliderFloat("##MapOpacity", opacity_ref, 0.0, 1.0, "%.2f") then
                ui_settings.map_opacity = opacity_ref[1]
                settings.save('QuestHelper_settings', quest_state.settings)
            end
            imgui.PopItemWidth()
            if ui_settings.map_opacity == 0.0 then
                imgui.TextColored(col.amber, "Maps hidden (opacity = 0)")
            end

            -- Map scale slider
            imgui.TextColored(col.dim, "Size")
            if not ui_settings.map_scale then
                ui_settings.map_scale = 1.0  -- Initialize default
            end
            local scale_ref = { ui_settings.map_scale }
            imgui.PushItemWidth(-1)
            if imgui.SliderFloat("##MapScale", scale_ref, 0.25, 1.0, "%.2f") then
                ui_settings.map_scale = scale_ref[1]
                settings.save('QuestHelper_settings', quest_state.settings)
            end
            imgui.PopItemWidth()

            -- Reset map position button
            imgui.Spacing()
            if imgui.Button("Reset Map Position", {-1, 0}) then
                ui_settings.map_pos_x = 100
                ui_settings.map_pos_y = 100
                settings.save('QuestHelper_settings', quest_state.settings)
                print("\30\106[QH]\30\01 Map position reset to (100, 100)")
            end
            if imgui.IsItemHovered() then
                imgui.SetTooltip("Move the map window back to (100, 100)")
            end

            settingsSection("Window")

            -- UI scale slider
            imgui.TextColored(col.dim, "Scale (window & font)")
            if not ui_settings.ui_scale then
                ui_settings.ui_scale = 1.0  -- Initialize default
            end
            local ui_scale_ref = { ui_settings.ui_scale }
            imgui.PushItemWidth(-1)
            if imgui.SliderFloat("##UIScale", ui_scale_ref, 0.6, 1.0, "%.2f") then
                ui_settings.ui_scale = ui_scale_ref[1]
                settings.save('QuestHelper_settings', quest_state.settings)
            end
            imgui.PopItemWidth()
            if imgui.IsItemHovered() then
                imgui.SetTooltip("Shrink the main window and font for smaller screens")
            end

            -- Show all steps toggle
            imgui.Spacing()
            local show_all_ref = { ui_settings.show_all_steps }
            if imgui.Checkbox("Show all steps", show_all_ref) then
                ui_settings.show_all_steps = show_all_ref[1]
                settings.save('QuestHelper_settings', quest_state.settings)
            end
            if imgui.IsItemHovered() then
                imgui.SetTooltip("Off = current step only (compact mode)")
            end

            settingsSection("Developer")

            -- Dev mode toggle
            local dev_mode_ref = { ui_settings.dev_mode }
            if imgui.Checkbox("Developer Mode", dev_mode_ref) then
                ui_settings.dev_mode = dev_mode_ref[1]
                settings.save('QuestHelper_settings', quest_state.settings)
                if ui_settings.dev_mode then
                    print("\30\106[QH]\30\01 Developer mode enabled - Debug output active")
                else
                    print("\30\106[QH]\30\01 Developer mode disabled - Debug output hidden")
                end
            end
            if imgui.IsItemHovered() then
                imgui.SetTooltip("Opens the QH Debug window and logs to chat")
            end

            imgui.Spacing()
            imgui.Separator()
            imgui.Spacing()
            if imgui.Button("Close##SettingsClose", {-1, 0}) then
                show_settings_window = false
            end
        end
        -- End() must run even when Begin() returns false, or ImGui's stack unbalances
        imgui.End()

        if not settings_open[1] then
            show_settings_window = false
        end
    end

    -- Popped last so the settings window is themed too
    theme.pop(theme_colors, theme_vars)

    -- Reset collapsed viewed step if mission changed
    if new_current_mission ~= current_mission then
        collapsed_viewed_step = nil
    end

    prev_show_all_steps = show_all_steps_this_frame

    return window_open, mainX, mainY, mainW, mainH, new_showImagesDrawer,
           new_currentTopCategory, new_currentSubfile, new_current_mission
end

return ui_main
