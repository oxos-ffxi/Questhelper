-- Triggers module - Handles all quest step trigger logic
-- Includes: packet events, text chat, item obtains, zone entries, trigger zones
local triggers = {}

local ffi           = require('ffi')
local ui_debug      = require('modules.ui_debug')
local action_parser = require('modules.action_parser')

-- Dev mode flag (set by main module)
triggers.dev_mode_enabled = false

-- When true, all kill tracking uses 0x028/0x029 packets (server ID based, trust-safe).
-- Set to false to revert to text-based detection only.
local PACKET_KILL_MODE = true


-- Helper: Debug print (only prints if dev mode is enabled)
local function debug_print(msg)
    if triggers.dev_mode_enabled then
        ui_debug.addLine(msg)
    end
end

-- Helper: Cleans text by removing FFXI color codes and special characters
local function clean_text(text)
    if not text then return "" end
    local cleaned = text
    -- Strip standard FFXI colors (0x1E/0x1F + byte)
    cleaned = cleaned:gsub('[\x1E\x1F].', '')
    -- Strip auto-translate markers (0xEF/0x7F + byte)
    cleaned = cleaned:gsub('[\xEF\x7F].', '')
    -- Strip newlines/returns
    cleaned = cleaned:gsub('[\r\n]+', ' ')
    -- Trim whitespace
    return cleaned:match("^%s*(.-)%s*$")
end

-- Helper: Ensures nested key path exists
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

-- Helper: Calculate distance to line segment (for trigger zones)
local function distToSegmentSquared(p, v, w)
    local l2 = (v.x - w.x)^2 + (v.z - w.z)^2
    if l2 == 0 then return (p.x - v.x)^2 + (p.z - v.z)^2 end
    local t = ((p.x - v.x) * (w.x - v.x) + (p.z - v.z) * (w.z - v.z)) / l2
    t = math.max(0, math.min(1, t))
    local projX = v.x + t * (w.x - v.x)
    local projZ = v.z + t * (w.z - v.z)
    return (p.x - projX)^2 + (p.z - projZ)^2
end

-- Helper: Find entity in world by server ID (used to resolve actor/target names from packets)
local function findEntityByServerId(server_id)
    if not server_id or server_id == 0 then return nil end
    for i = 0, 1023 do
        local ent = GetEntity(i)
        if ent and ent.ServerId == server_id then
            return ent
        end
    end
    return nil
end

-- Helper: Read uint16 from packet data
local function read_uint16(ptr, offset)
    local p = ffi.cast('uint8_t*', ptr)
    return p[offset] + (p[offset+1] * 256)
end

-- Helper: Read uint32 from packet data
local function read_uint32(ptr, offset)
    local p = ffi.cast('uint8_t*', ptr)
    return p[offset] + (p[offset+1] * 256) + (p[offset+2] * 65536) + (p[offset+3] * 16777216)
end

-- Chat modes to ignore (player-generated text)
local ignored_chat_modes = {
    [0] = true,  -- Say
    [1] = true,  -- Shout
    [3] = true,  -- Tell
    [4] = true,  -- Party
    [5] = true,  -- Linkshell
    [6] = true,  -- Emotes
    [8] = true,  -- Linkshell 2
    [26] = true, -- Yell
    [27] = true, -- Yell
}

-- Checks zone entry triggers
function triggers.checkZoneTrigger(step_data, playerZoneId, zone_data, quest_state, topCat, subfile, mission, step_idx)
    if step_data.zone_trigger and zone_data[step_data.zone_trigger] then
        local required_zone_id = zone_data[step_data.zone_trigger]

        -- Debug Print
        --print(string.format("\30\105[QH Debug]\30\01 Zone Trigger: '%s' (ID: %d) | Current Zone ID: %d | Match: %s",
        --    step_data.zone_trigger, required_zone_id, playerZoneId, tostring(playerZoneId == required_zone_id)))

        if playerZoneId == required_zone_id then
            quest_state.setStepState(topCat, subfile, mission, step_idx, true, nil)
            return true
        end
    elseif step_data.zone_trigger then
        -- Debug: Zone name not found in zones.lua
        --print(string.format("\30\106[QH Warning]\30\01 Zone trigger '%s' not found in zones.lua", step_data.zone_trigger))
    end
    return false
end

-- Throttle debug output (print once every 10 seconds)
local last_trigger_debug_time = 0
local TRIGGER_DEBUG_INTERVAL = 10

-- Checks trigger zones (square/line regions player walks through)
function triggers.checkTriggerZones(step_data, playerPosX, playerPosZ_depth, quest_state, topCat, subfile, mission, step_idx, enable_debug, player_zone_id, zone_data)
    if type(step_data) == 'table' and step_data.trigger_zones then
        local stepRequiredZone = step_data.zone_name or step_data.zone

        local current_time = os.time()
        local should_debug = enable_debug and (current_time - last_trigger_debug_time) >= TRIGGER_DEBUG_INTERVAL

        for i, zone in ipairs(step_data.trigger_zones) do
            -- Per-shape zone_name overrides step-level zone_name, same as visual_zones
            local requiredZone = zone.zone_name or stepRequiredZone
            if requiredZone and zone_data and zone_data[requiredZone] then
                if player_zone_id ~= zone_data[requiredZone] then
                    goto continue
                end
            end
            -- Square trigger zone
            if zone.type == 'square' and playerPosX and playerPosZ_depth and zone.center and zone.size then
                local half_size = zone.size / 2
                local dx = math.abs(playerPosX - zone.center.x)
                local dz = math.abs(playerPosZ_depth - zone.center.z)

                -- Debug: Show when checking zones (throttled)
                if should_debug then
                    ui_debug.addLine(string.format("\30\106[QH Debug]\30\01 Checking step %d, zone %d: Player(%.1f, %.1f) vs Center(%.1f, %.1f) | dx=%.1f<%.1f? dz=%.1f<%.1f?",
                        step_idx, i, playerPosX, playerPosZ_depth, zone.center.x, zone.center.z, dx, half_size, dz, half_size))
                    last_trigger_debug_time = current_time
                end

                if dx < half_size and dz < half_size then
                    -- Check if this zone switches maps
                    if zone.switch_to_map and player_zone_id then
                        quest_state.setCurrentMap(player_zone_id, zone.switch_to_map)
                    end

                    -- Check if we should complete the step (default: true)
                    local should_complete = zone.complete_step
                    if should_complete == nil then
                        should_complete = true
                    end

                    if should_complete then
                        --print(string.format("\30\105[QH]\30\01 Trigger Zone HIT! Completing step %d", step_idx))
                        quest_state.setStepState(topCat, subfile, mission, step_idx, true, nil)
                        return true
                    else
                        -- Just switched maps, don't complete step
                        return false
                    end
                end
            -- Line trigger zone
            elseif zone.type == 'line' and playerPosX and playerPosZ_depth and zone.start and zone.stop then
                local player_pos = { x = playerPosX, z = playerPosZ_depth }
                local distSq = distToSegmentSquared(player_pos, zone.start, zone.stop)
                local width = zone.width or 2
                if distSq < (width * width) then
                    -- Check if this zone switches maps
                    if zone.switch_to_map and player_zone_id then
                        quest_state.setCurrentMap(player_zone_id, zone.switch_to_map)
                    end

                    -- Check if we should complete the step (default: true)
                    local should_complete = zone.complete_step
                    if should_complete == nil then
                        should_complete = true
                    end

                    if should_complete then
                        debug_print(string.format("\30\105[QH]\30\01 Line Trigger HIT! Completing step %d", step_idx))
                        quest_state.setStepState(topCat, subfile, mission, step_idx, true, nil)
                        return true
                    else
                        -- Just switched maps, don't complete step
                        return false
                    end
                end
            end
            ::continue::
        end
    end
    return false
end

-- Handles packet_in events (0x034 or 0x032 - Event/Interaction packets)
function triggers.handlePacketIn(e, currentTopCategory, currentSubfile, current_mission, quest_data, quest_state, step_trigger_flags, playerZoneId)
    if e.id ~= 0x034 and e.id ~= 0x032 then return end

    local event_id = read_uint16(e.data, 0x2C)
    local actor_id = read_uint32(e.data, 0x04)
    local param0   = read_uint32(e.data, 0x0C) -- The "Hidden" Message ID

    -- Debug Print
    if event_id > 0 or param0 > 0 then
        debug_print(string.format("\30\105[QH Debug]\30\01 Event: %d | NPC: %d | Param0: %d", event_id, actor_id, param0))
    end

    if not currentTopCategory or not currentSubfile or not current_mission then return end

    local missionData = quest_data[currentTopCategory][currentSubfile][current_mission]
    if not missionData or not missionData.steps then return end

    local step_idx = quest_state.getCurrentStep(currentTopCategory, currentSubfile, current_mission, quest_data)
    if not missionData.steps[step_idx] then return end

    local step_data = missionData.steps[step_idx]

    if type(step_data) == 'table' and step_data.trigger_on_event_id then
        local trigger = step_data.trigger_on_event_id
        local event_match = false

        -- Helper to check a specific ID against the packet data
        local function check_id(target_id)
            -- Case A: It's a standard Cutscene (EventID matches)
            if event_id == target_id then return true end
            -- Case B: It's a Text Interaction (Event=0, Param0 matches)
            if event_id == 0 and param0 == target_id then return true end
            return false
        end

        -- Handle Single Number vs List of Numbers (optional string = zone name filter)
        if type(trigger) == 'table' then
            local zone_filter = nil
            for _, v in ipairs(trigger) do
                if type(v) == 'string' then
                    zone_filter = v
                elseif not event_match and check_id(v) then
                    event_match = true
                end
            end
            if event_match and zone_filter then
                local zone_data = require('data.zones')
                event_match = (zone_data[zone_filter] == playerZoneId)
            end
        else
            event_match = check_id(trigger)
        end

        -- Check NPC ID (Optional)
        local npc_match = true
        if step_data.trigger_on_npc_id then
            npc_match = (actor_id == step_data.trigger_on_npc_id)
        end

        -- If ID matched (either Event or Param0), proceed
        if event_match and npc_match then
            local has_talk_trigger = (step_data.trigger_on_talk ~= nil)

            if not has_talk_trigger then
                quest_state.setStepState(currentTopCategory, currentSubfile, current_mission, step_idx, true, step_trigger_flags)
            else
                local flags = ensure_key_path(step_trigger_flags, currentTopCategory, currentSubfile, current_mission, step_idx)
                flags.event_complete = true
                if flags.talk_complete then
                    quest_state.setStepState(currentTopCategory, currentSubfile, current_mission, step_idx, true, step_trigger_flags)
                end
            end
        end
    end
end

-- Handles text_in events (chat messages/dialogue)
function triggers.handleTextIn(e, currentTopCategory, currentSubfile, current_mission, quest_data, quest_state, step_trigger_flags, playerName)
    -- 1. Filter out Player Chat
    if ignored_chat_modes[e.mode] then return end

    -- 2. Validation
    if not currentTopCategory or not currentSubfile or not current_mission then return end

    local missionData = quest_data[currentTopCategory][currentSubfile][current_mission]
    if not missionData or not missionData.steps then return end

    local step_idx = quest_state.getCurrentStep(currentTopCategory, currentSubfile, current_mission, quest_data)
    local step_data = missionData.steps[step_idx]
    local msg_text = e.message_modified or e.message
    if not step_data or not msg_text then return end

    -- 3. Get Player Name if not set
    if playerName == "" then
        local p = GetPlayerEntity()
        if p then playerName = p.Name end
    end

    -- 4. Clean the message
    local incoming_text = clean_text(msg_text)

    if type(step_data) ~= 'table' then return end

    -- HANDLE: trigger_on_talk (Chat Dialogue)
    local raw_triggers = step_data.trigger_on_talk
    if raw_triggers then
        local triggers_list = {}
        if type(raw_triggers) == 'string' then
            table.insert(triggers_list, raw_triggers)
        elseif type(raw_triggers) == 'table' then
            triggers_list = raw_triggers
        end

        for _, raw_text in ipairs(triggers_list) do
            if type(raw_text) == 'string' and raw_text ~= "" then
                local processed_trigger = raw_text
                if playerName and playerName ~= "" then
                    processed_trigger = raw_text:gsub("{player_name}", playerName)
                end

                if incoming_text:find(processed_trigger, 1, true) then
                    local has_event_requirement = (step_data.trigger_on_event_id ~= nil)

                    if not has_event_requirement then
                        quest_state.setStepState(currentTopCategory, currentSubfile, current_mission, step_idx, true, step_trigger_flags)
                    else
                        local flags = ensure_key_path(step_trigger_flags, currentTopCategory, currentSubfile, current_mission, step_idx)
                        flags.talk_complete = true
                        if flags.event_complete then
                            quest_state.setStepState(currentTopCategory, currentSubfile, current_mission, step_idx, true, step_trigger_flags)
                        end
                    end
                    return playerName
                end
            end
        end
    end

    -- HANDLE: trigger_on_item_obtain (Drops OR Purchases - Supports List)
    local trigger_item_data = step_data.trigger_on_item_obtain

    if trigger_item_data then
        -- 1. Normalize into a list (table) so we can loop
        local items_to_check = {}
        if type(trigger_item_data) == 'string' then
            table.insert(items_to_check, trigger_item_data)
        elseif type(trigger_item_data) == 'table' then
            items_to_check = trigger_item_data
        end

        -- 2. Loop through every item in the list
        -- Supports string "Item" or table {item = "Item", quantity = 2}
        for _, entry in ipairs(items_to_check) do
            local current_item, required_qty
            if type(entry) == 'string' then
                current_item = entry
                required_qty = 1
            elseif type(entry) == 'table' and entry.item then
                current_item = entry.item
                required_qty = entry.quantity or 1
            end

            if not current_item then break end

            -- Case A: Dropped / Synthesized Items
            local matched_drop = false
            if playerName ~= "" and
               incoming_text:find(playerName, 1, true) and
               incoming_text:find(current_item, 1, true) and
               incoming_text:find("obtains", 1, true) then
                matched_drop = true
            end

            -- Case B: Purchased Items
            local matched_buy = false
            if incoming_text:find("You buy", 1, true) and
               incoming_text:find(current_item, 1, true) then
                matched_buy = true
            end

            -- If matched, check quantity then handle completion
            if matched_drop or matched_buy then
                if required_qty > 1 then
                    local inv = require('modules.inventory')
                    local _, count = inv.hasItem(current_item, true)
                    if count < required_qty then
                        break
                    end
                end

                -- Checklist logic
                if step_data.require_all_items then
                    quest_state.setPartialState(currentTopCategory, currentSubfile, current_mission, step_idx, current_item, true)

                    if quest_state.checkAllItemsComplete(currentTopCategory, currentSubfile, current_mission, step_idx, items_to_check) then
                        quest_state.setStepState(currentTopCategory, currentSubfile, current_mission, step_idx, true, step_trigger_flags)
                    end
                else
                    quest_state.setStepState(currentTopCategory, currentSubfile, current_mission, step_idx, true, step_trigger_flags)
                end
                break
            end
        end
    end

    return playerName
end

-- Handles kill tracking via text messages ("{player} defeats the {enemy}")
function triggers.handleKillText(e, incoming_text, playerName, currentTopCategory, currentSubfile, current_mission, quest_data, quest_state, playerZoneId)
    if not currentTopCategory or not currentSubfile or not current_mission then return end
    if not playerName or playerName == "" then return end

    -- CRITICAL: Filter out player-generated chat to prevent fake messages from counting
    -- Only count system messages (combat log)
    if ignored_chat_modes[e.mode] then
        return -- Ignore player chat (say/shout/tell/party/linkshell)
    end

    local missionData = quest_data[currentTopCategory][currentSubfile][current_mission]
    if not missionData or not missionData.steps then return end

    local step_idx = quest_state.getCurrentStep(currentTopCategory, currentSubfile, current_mission, quest_data)
    if not missionData.steps[step_idx] then return end

    local step_data = missionData.steps[step_idx]

    -- Check if this step has kill requirements
    if not step_data.kill_requirement then return end

    local kill_req = step_data.kill_requirement

    -- Defer to packet handler when PACKET_KILL_MODE is on, or when kill_type is specified
    if kill_req.kill_type or PACKET_KILL_MODE then return end

    -- Check zone requirement
    if kill_req.zone and playerZoneId then
        local zone_data = require('data.zones')
        local required_zone_id = zone_data[kill_req.zone]
        if required_zone_id and playerZoneId ~= required_zone_id then
            return -- Not in the required zone
        end
    end

    -- Build list of valid names to check (player + active party members if enabled)
    local valid_names = {playerName}

    if kill_req.count_party_kills then
        if AshitaCore then
            local memManager = AshitaCore:GetMemoryManager()
            if memManager then
                local party = memManager:GetParty()
                if party then
                    for i = 1, 5 do
                        if party:GetMemberIsActive(i) == 1 then
                            local member_name = party:GetMemberName(i)
                            if member_name and member_name ~= "" then
                                table.insert(valid_names, member_name)
                            end
                        end
                    end
                end
            end
        end
    end

    -- Look for "{name} defeats the" or "{name} defeats" for any valid name
    local enemy_name = nil
    local killer_name = nil

    for _, name in ipairs(valid_names) do
        local defeat_pattern_1 = name .. " defeats the "
        local defeat_pattern_2 = name .. " defeats "

        -- Try pattern 1: "Name defeats the Enemy"
        local start_pos = incoming_text:find(defeat_pattern_1, 1, true)
        if start_pos then
            enemy_name = incoming_text:sub(start_pos + #defeat_pattern_1)
            enemy_name = enemy_name:gsub("%.$", "")
            killer_name = name
            break
        else
            -- Try pattern 2: "Name defeats Enemy"
            start_pos = incoming_text:find(defeat_pattern_2, 1, true)
            if start_pos then
                enemy_name = incoming_text:sub(start_pos + #defeat_pattern_2)
                enemy_name = enemy_name:gsub("%.$", "")
                killer_name = name
                break
            end
        end
    end

    if enemy_name then
        local who = killer_name or "Unknown"
        debug_print(string.format("\30\106[QH Debug]\30\01 Kill detected: %s defeated '%s'", who, enemy_name))

        -- Check if enemy name matches requirements
        local name_match = false
        if kill_req.enemies and #kill_req.enemies > 0 then
            for _, required_enemy in ipairs(kill_req.enemies) do
                if enemy_name:lower():find(required_enemy:lower(), 1, true) then
                    name_match = true
                    break
                end
            end
            if not name_match then
                debug_print(string.format("\30\106[QH Debug]\30\01 Enemy '%s' doesn't match required: %s",
                    enemy_name, table.concat(kill_req.enemies, ", ")))
            end
        else
            -- No specific enemies required, count any kill
            name_match = true
        end

        if name_match then
            -- Increment kill counter
            local current_count = quest_state.getKillCount(currentTopCategory, currentSubfile, current_mission, step_idx) or 0
            current_count = current_count + 1
            quest_state.setKillCount(currentTopCategory, currentSubfile, current_mission, step_idx, current_count)

            -- Success message - show who got the kill if not the player
            local kill_credit = killer_name ~= playerName and (" by " .. killer_name) or ""
            print(string.format("\30\106[QH]\30\01 Kill Tracked: %s%s (%d/%d)",
                enemy_name, kill_credit, current_count, kill_req.count))

            -- Check if requirement met
            if current_count >= kill_req.count then
                if not kill_req.display_only then
                    quest_state.setStepState(currentTopCategory, currentSubfile, current_mission, step_idx, true, nil)
                end
                print(string.format("\30\106[QH]\30\01 Kill requirement complete! (%d/%d)",
                    current_count, kill_req.count))
            end
        end
    end
end

-- HANDLE: daily_passwords (e.g. Castle Oztroja statues).
-- Watches incoming text for any token in the step's fixed wordlist, then slots the
-- captured word by the player's current floor_id (so collection ORDER doesn't matter).
-- State is day-stamped in quest_state and resets each Vana'diel day.
function triggers.handleDailyPasswordText(e, incoming_text, currentTopCategory, currentSubfile, current_mission, quest_data, quest_state)
    if not currentTopCategory or not currentSubfile or not current_mission then return end
    if ignored_chat_modes[e.mode] then return end  -- ignore player chat
    if not incoming_text then return end

    local missionData = quest_data[currentTopCategory] and quest_data[currentTopCategory][currentSubfile]
        and quest_data[currentTopCategory][currentSubfile][current_mission]
    if not missionData or not missionData.steps then return end

    local step_idx = quest_state.getCurrentStep(currentTopCategory, currentSubfile, current_mission, quest_data)
    local step_data = missionData.steps[step_idx]
    if type(step_data) ~= 'table' or not step_data.daily_passwords then return end

    local dp = step_data.daily_passwords
    if not dp.wordlist or not dp.slots then return end

    -- Find a wordlist token in the message (case-insensitive, whole word)
    local lower = incoming_text:lower()
    local found
    for _, w in ipairs(dp.wordlist) do
        if lower:find('%f[%a]' .. w:lower() .. '%f[%A]') then
            found = w
            break
        end
    end
    if not found then return end

    -- Determine which slot this statue is, from the player's current floor
    local player_module = require('modules.player')
    local floor = player_module.getFloorIdRaw and player_module.getFloorIdRaw()
    if not floor then return end

    for _, slot in ipairs(dp.slots) do
        if slot.floor_id == floor then
            quest_state.setDailyPassword(currentTopCategory, currentSubfile, current_mission, step_idx, slot.slot, found)
            print(string.format("\30\106[QH]\30\01 Password #%d captured: %s", slot.slot, found))
            return
        end
    end
end

-- HANDLE: fame (reputation) checker dialogue.
-- The client is never sent a numeric fame value, so we recover it by fingerprinting
-- the checker NPC's reply (see modules/fame.lua). Unlike the other text handlers this
-- is NOT step-scoped: the player can check fame at any time, on any mission or none,
-- so it listens globally and stores per-area.
--
-- playerZoneId is required - some replies are shared verbatim between areas at
-- different levels, and only the zone disambiguates them.
function triggers.handleFameText(e, incoming_text, quest_state, playerZoneId)
    if ignored_chat_modes[e.mode] then return end  -- ignore player chat
    if not incoming_text then return end

    local ok, fame = pcall(require, 'modules.fame')
    if not ok then return end

    local area, level = fame.matchDialogue(incoming_text, playerZoneId)
    if not area then return end

    local prev = quest_state.getFame(area)
    quest_state.setFame(area, level)

    if prev and prev ~= level then
        print(string.format("\30\106[QH]\30\01 Fame: %s is now %d (was %d)", area, level, prev))
    else
        print(string.format("\30\106[QH]\30\01 Fame: %s is %d/9", area, level))
    end
end

-- Tracks last attack cmd_no per actor from 0x028 packets.
-- The actual kill (defeat) arrives in 0x029, so we store state here for correlation.
local actor_last_cmd = {}  -- [actor_server_id] = cmd_no

local kill_type_cmds = { melee = {[1]=true}, ranged = {[2]=true}, magic = {[4]=true} }

-- Accepts kill_type as a string ("melee") or array ({"melee","magic","ranged"})
local function buildValidCmds(kill_type)
    if type(kill_type) == 'string' then
        return kill_type_cmds[kill_type] or {}
    elseif type(kill_type) == 'table' then
        local result = {}
        for _, kt in ipairs(kill_type) do
            for cmd in pairs(kill_type_cmds[kt] or {}) do
                result[cmd] = true
            end
        end
        return result
    end
    return {}
end

local function isValidActor(actor_id, player_id, kill_req)
    if actor_id == player_id then return true end
    if kill_req.count_party_kills and AshitaCore then
        local party = AshitaCore:GetMemoryManager():GetParty()
        if party then
            for i = 1, 5 do
                if party:GetMemberIsActive(i) == 1 and party:GetMemberServerId(i) == actor_id then
                    return true
                end
            end
        end
    end
    return false
end

-- 0x028: parse cmd_no and record which actors attacked with which method
function triggers.handleActionPacket(e, currentTopCategory, currentSubfile, current_mission, quest_data, quest_state, playerZoneId)
    if e.id ~= 0x028 then return end
    if not currentTopCategory or not currentSubfile or not current_mission then return end
    local missionData = quest_data[currentTopCategory][currentSubfile][current_mission]
    if not missionData or not missionData.steps then return end
    local step_idx = quest_state.getCurrentStep(currentTopCategory, currentSubfile, current_mission, quest_data)
    if not missionData.steps[step_idx] then return end
    local kill_req = missionData.steps[step_idx].kill_requirement
    if not kill_req then return end
    if not kill_req.kill_type and not PACKET_KILL_MODE then return end

    local action = action_parser.parse(e.data)
    if not action or not action.actor_id then return end

    local player_entity = GetPlayerEntity()
    local player_id = player_entity and player_entity.ServerId or 0

    if not isValidActor(action.actor_id, player_id, kill_req) then return end

    actor_last_cmd[action.actor_id] = action.cmd_no
    debug_print(string.format("\30\105[QH Debug]\30\01 0x028 tracked: actor=%d cmd_no=%d", action.actor_id, action.cmd_no))
end

-- 0x029: action message — contains the defeat event. Cross-reference with actor_last_cmd.
function triggers.handleKillMessage(e, currentTopCategory, currentSubfile, current_mission, quest_data, quest_state, playerZoneId)
    if e.id ~= 0x029 then return end
    if not currentTopCategory or not currentSubfile or not current_mission then return end
    local missionData = quest_data[currentTopCategory][currentSubfile][current_mission]
    if not missionData or not missionData.steps then return end
    local step_idx = quest_state.getCurrentStep(currentTopCategory, currentSubfile, current_mission, quest_data)
    if not missionData.steps[step_idx] then return end
    local kill_req = missionData.steps[step_idx].kill_requirement
    if not kill_req then return end
    if not kill_req.kill_type and not PACKET_KILL_MODE then return end

    -- Zone check
    if kill_req.zone and playerZoneId then
        local zone_data = require('data.zones')
        local required_zone_id = zone_data[kill_req.zone]
        if required_zone_id and playerZoneId ~= required_zone_id then return end
    end

    -- 0x029 structure: actor_id(4) + target_id(4) + actor_idx(2) + target_idx(2) + param1(4) + param2(4) + message_id(2)
    local actor_id   = read_uint32(e.data, 0x04)
    local target_id  = read_uint32(e.data, 0x08)
    local message_id = read_uint16(e.data, 0x18)

    debug_print(string.format("\30\105[QH Debug]\30\01 0x029: actor=%d target=%d msg=%d", actor_id, target_id, message_id))

    -- Only defeat messages
    if message_id ~= 6 and message_id ~= 20 then return end

    local player_entity = GetPlayerEntity()
    local player_id = player_entity and player_entity.ServerId or 0

    if not isValidActor(actor_id, player_id, kill_req) then return end

    -- If kill_type is specified, verify the killing blow used the right method
    if kill_req.kill_type then
        local last_cmd = actor_last_cmd[actor_id]
        local valid_cmds = buildValidCmds(kill_req.kill_type)
        if not last_cmd or not valid_cmds[last_cmd] then
            debug_print(string.format("\30\105[QH Debug]\30\01 Kill type mismatch: last_cmd=%s", tostring(last_cmd)))
            return
        end
    end

    -- Find target entity by server ID for name matching
    local target_ent = findEntityByServerId(target_id)
    if not target_ent then
        debug_print(string.format("\30\106[QH Debug]\30\01 0x029 target entity not found: id=%d", target_id))
        return
    end
    local target_name = target_ent.Name

    local name_match = (not kill_req.enemies or #kill_req.enemies == 0)
    if not name_match then
        for _, req_enemy in ipairs(kill_req.enemies) do
            if target_name:lower():find(req_enemy:lower(), 1, true) then
                name_match = true
                break
            end
        end
    end
    if not name_match then return end

    local current_count = quest_state.getKillCount(currentTopCategory, currentSubfile, current_mission, step_idx) or 0
    current_count = current_count + 1
    quest_state.setKillCount(currentTopCategory, currentSubfile, current_mission, step_idx, current_count)

    local actor_ent  = findEntityByServerId(actor_id)
    local actor_name = actor_ent and actor_ent.Name or "Unknown"
    local kill_credit = (actor_id ~= player_id) and (" by " .. actor_name) or ""
    print(string.format("\30\106[QH]\30\01 Kill Tracked: %s%s (%d/%d)", target_name, kill_credit, current_count, kill_req.count))

    if current_count >= kill_req.count then
        if not kill_req.display_only then
            quest_state.setStepState(currentTopCategory, currentSubfile, current_mission, step_idx, true, nil)
        end
        print(string.format("\30\106[QH]\30\01 Kill requirement complete! (%d/%d)", current_count, kill_req.count))
    end
end


return triggers
