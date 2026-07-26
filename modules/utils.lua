-- Utility functions module
local utils = {}

-- Scan once at load; reads from FFXiMain.dll memory kept in sync with the server clock
local vanatime_ptr = ashita.memory.find('FFXiMain.dll', 0, 'B0015EC390518B4C24088D4424005068', 0x34, 0)

local VANA_DAYS = {'Firesday','Earthsday','Watersday','Windsday','Iceday','Lightningday','Lightsday','Darksday'}

-- Returns current Vana'diel day name and 0-based index (0=Firesday .. 7=Darksday)
function utils.getVanaDay()
    if not vanatime_ptr or vanatime_ptr == 0 then return nil, nil end
    local ptr = ashita.memory.read_uint32(vanatime_ptr)
    local ts  = (ashita.memory.read_uint32(ptr + 0x0C) + 92514960) * 25
    local idx = math.floor(ts / 86400) % 8
    return VANA_DAYS[idx + 1], idx
end

-- Returns a monotonic Vana'diel day counter (total days since the Vana'diel epoch).
-- Increments once every Vana'diel midnight (~57.6 real minutes). Use as a stamp to
-- detect day rollovers for daily-reset content (e.g. Castle Oztroja passwords).
-- Returns nil if the clock pointer is unavailable.
function utils.getVanaDayStamp()
    if not vanatime_ptr or vanatime_ptr == 0 then return nil end
    local ptr = ashita.memory.read_uint32(vanatime_ptr)
    local ts  = (ashita.memory.read_uint32(ptr + 0x0C) + 92514960) * 25
    return math.floor(ts / 86400)
end

-- Memory pattern from Ashita v3 weather.lua (atom0s, CC BY-NC-ND 4.0) — adapted for v4
local weather_ptr = ashita.memory.find('FFXiMain.dll', 0, '66A1????????663D????72', 0x02, 0)

local WEATHER_NAMES = {
    [0]  = 'Clear',      [1]  = 'Sunshine',
    [2]  = 'Clouds',     [3]  = 'Fog',
    [4]  = 'Fire',       [5]  = 'Fire x2',
    [6]  = 'Water',      [7]  = 'Water x2',
    [8]  = 'Earth',      [9]  = 'Earth x2',
    [10] = 'Wind',       [11] = 'Wind x2',
    [12] = 'Ice',        [13] = 'Ice x2',
    [14] = 'Thunder',    [15] = 'Thunder x2',
    [16] = 'Light',      [17] = 'Light x2',
    [18] = 'Dark',       [19] = 'Dark x2',
}

-- Returns current weather name and raw ID
function utils.getWeather()
    if not weather_ptr or weather_ptr == 0 then return nil, nil end
    local ptr = ashita.memory.read_uint32(weather_ptr)
    local id  = ashita.memory.read_uint8(ptr)
    return WEATHER_NAMES[id] or ('Unknown('..id..')'), id
end

-- Text wrapping for UI display
function utils.wrap_text(text, max_length)
    local wrapped_text = {}
    for line in text:gmatch("[^\r\n]+") do
        local start = 1
        while start <= #line do
            local next_break = start + max_length - 1
            if next_break >= #line then
                table.insert(wrapped_text, line:sub(start))
                break
            end
            local space_pos = line:sub(start, next_break):match("^.*() ") or max_length
            table.insert(wrapped_text, line:sub(start, start + space_pos - 1))
            start = start + space_pos
        end
    end
    return table.concat(wrapped_text, "\n")
end

-- Returns sorted keys from a table
function utils.get_sorted_keys(tbl)
    local keys = {}
    for k in pairs(tbl) do
        table.insert(keys, k)
    end
    table.sort(keys)
    return keys
end

-- Gets images for a specific quest step
function utils.get_images_for_step(topCat, subfile, mission, stepIndex, quest_data)
    local mdata = quest_data[topCat] and quest_data[topCat][subfile] and quest_data[topCat][subfile][mission]
    if not mdata or not mdata.steps then return {} end
    local step_data = mdata.steps[stepIndex]

    -- If step has manually-defined images, return them or route to nearest image zone
    if type(step_data) == 'table' and step_data.images then
        local matched = {}
        for _, image_info in ipairs(step_data.images) do
            if (image_info.state == stepIndex) or (image_info.state == nil) then
                table.insert(matched, image_info)
            end
        end

        if #matched > 0 then
            local image_zones = {}
            local seen = {}
            for _, img in ipairs(matched) do
                if img.zone_name and not seen[img.zone_name] then
                    seen[img.zone_name] = true
                    table.insert(image_zones, img.zone_name)
                end
            end

            if #image_zones > 0 then
                local pathfinding_ok, pathfinding = pcall(require, 'modules.pathfinding')
                if pathfinding_ok then
                    local party = AshitaCore:GetMemoryManager():GetParty()
                    if party then
                        local player_zone_id = party:GetMemberZone(0)
                        if player_zone_id and player_zone_id > 0 then
                            local zones_db = require('data.zones')
                            local current_zone = pathfinding.getCurrentZone(player_zone_id, zones_db)
                            if current_zone then
                                -- Also compare base zone name so sub-zones like "Giddeus 2" match "Giddeus"
                                local base_current = pathfinding.getBaseZoneName(current_zone)
                                local in_valid_zone = false
                                for _, z in ipairs(image_zones) do
                                    if current_zone == z or base_current == z then
                                        in_valid_zone = true
                                        break
                                    end
                                end
                                if not in_valid_zone then
                                    local backtrack_floor_id = step_data.backtrack_floor_id
                                    local best_path, best_len, best_dest = nil, math.huge, nil
                                    for _, z in ipairs(image_zones) do
                                        local path = pathfinding.findPath(current_zone, z, backtrack_floor_id)
                                        if path and #path >= 1 and #path < best_len then
                                            best_path = path
                                            best_len = #path
                                            best_dest = z
                                        end
                                    end
                                    if best_path then
                                        local dest_highlights = {}
                                        for _, img in ipairs(matched) do
                                            if img.zone_name == best_dest and img.highlights then
                                                for _, hl in ipairs(img.highlights) do
                                                    local h = {}
                                                    for k, v in pairs(hl) do h[k] = v end
                                                    if img.floor_id ~= nil then h.floor_id = img.floor_id end
                                                    table.insert(dest_highlights, h)
                                                end
                                            end
                                        end
                                        local dh = #dest_highlights > 0 and dest_highlights or nil
                                        return pathfinding.generateRouteImages(best_path, current_zone, dh, backtrack_floor_id)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end

        return matched
    end

    -- NEW: Auto-generate route maps if route_to is defined
    if type(step_data) == 'table' and step_data.route_to then
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
                        local destination = step_data.route_to
                        local backtrack_floor_id = step_data.backtrack_floor_id
                        local path = pathfinding.findPath(current_zone, destination, backtrack_floor_id)

                        if path then
                            -- Generate route images with exit highlights
                            -- Optional: destination_highlight for marking NPCs/targets at final destination
                            local dest_highlight = step_data.destination_highlight
                            local route_images = pathfinding.generateRouteImages(path, current_zone, dest_highlight, backtrack_floor_id)
                            return route_images
                        end
                    end
                end
            end
        end
    end

    return {}
end

-- Collects all unique key items needed for entire quest
-- Returns: { {id = 1234, name = "Mystical Canteen"}, ... }
--
-- Supported formats:
--   keyitems_needed = {1234}  -- Just key item ID
--   keyitems_needed = {"Kindred Crest"}  -- Key item name (looked up from database)
--   keyitems_needed = {{id = 1234, name = "Mystical Canteen"}}  -- Explicit ID+name
function utils.getAllKeyItemsNeeded(missionData, keyitems_db)
    local allKeyItems = {}
    local kiData = {}  -- { ki_id = name }
    local kiOptional = {}  -- { ki_id = true } (only when explicitly optional in every sighting)

    if not missionData or not missionData.steps then return allKeyItems end

    for _, step_data in ipairs(missionData.steps) do
        if type(step_data) == 'table' and step_data.keyitems_needed then
            local keyitems = step_data.keyitems_needed

            if type(keyitems) == 'table' then
                for _, ki in ipairs(keyitems) do
                    if type(ki) == 'number' then
                        -- Simple ID format
                        if not kiData[ki] then
                            -- Try to get name from database
                            local ki_name = keyitems_db and keyitems_db.getName(ki)
                            kiData[ki] = ki_name
                        end
                    elseif type(ki) == 'string' then
                        -- Name format - look up ID from database
                        if keyitems_db then
                            local ki_id = keyitems_db.getId(ki)
                            if ki_id and not kiData[ki_id] then
                                kiData[ki_id] = ki
                            end
                        end
                    elseif type(ki) == 'table' and ki.id then
                        -- Object format: { id = 1234, name = "Name", optional = true }
                        if not kiData[ki.id] then
                            kiData[ki.id] = ki.name
                        end
                        -- Required wins: only stays optional if no sighting marks it required
                        if ki.optional then
                            if kiOptional[ki.id] == nil then kiOptional[ki.id] = true end
                        else
                            kiOptional[ki.id] = false
                        end
                    end
                end
            end
        end
    end

    -- Convert to array
    for ki_id, ki_name in pairs(kiData) do
        table.insert(allKeyItems, {
            id = ki_id,
            name = ki_name or string.format("Key Item #%d", ki_id),
            optional = kiOptional[ki_id] == true
        })
    end

    -- Sort by ID for consistency
    table.sort(allKeyItems, function(a, b) return a.id < b.id end)

    return allKeyItems
end

return utils
