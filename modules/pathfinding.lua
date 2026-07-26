-- Pathfinding module for calculating routes between zones
local pathfinding = {}

-- Load zone connections
local zone_connections = require('data.zone_connections')

-- Map specific zone names to their floor_id (for multi-floor zones split by name)
local zone_name_to_floor = {
    ['Bibiki Bay 1'] = 1,
    ['Bibiki Bay 2'] = 2,
    ["Windurst Waters North"] = 1,
    ["Windurst Waters South"] = 2,
    ["Fei'Yin 1"] = 1,
    ["Fei'Yin 15"] = 15,
    ['Korroloka Tunnel 1'] = 1,
    ['Korroloka Tunnel 2'] = 2,
    ['Kuftal Tunnel 1'] = 1,
    ['Kuftal Tunnel 2'] = 2,
    ['Yughott Grotto 1'] = 1,
    ['Palborough Mines 1'] = 1,
    ['Palborough Mines 2'] = 2,
    ['Palborough Mines 3'] = 3,
    ['Tavnazian Safehold 1'] = 1,
    ['Tavnazian Safehold 2'] = 2,
    ['Tavnazian Safehold 3'] = 3,
    ['Giddeus 2'] = 15,
}

-- Map sub-zone names to base zone names (for map/image loading)
local subzone_to_base = {
    ['Bibiki Bay 1'] = "Bibiki Bay",
    ['Bibiki Bay 2'] = "Bibiki Bay",
    ["Windurst Waters North"] = "Windurst Waters",
    ["Windurst Waters South"] = "Windurst Waters",
    ["Fei'Yin 1"] = "Fei'Yin",
    ["Fei'Yin 15"] = "Fei'Yin",
    ['Korroloka Tunnel 1'] = "Korroloka Tunnel",
    ['Korroloka Tunnel 2'] = "Korroloka Tunnel",
    ['Kuftal Tunnel 1'] = "Kuftal Tunnel",
    ['Kuftal Tunnel 2'] = "Kuftal Tunnel",
    ['Yughott Grotto 1'] = "Yughott Grotto",
    ['Palborough Mines 1'] = "Palborough Mines",
    ['Palborough Mines 2'] = "Palborough Mines",
    ['Palborough Mines 3'] = "Palborough Mines",
    ['Tavnazian Safehold 1'] = "Tavnazian Safehold",
    ['Tavnazian Safehold 2'] = "Tavnazian Safehold",
    ['Tavnazian Safehold 3'] = "Tavnazian Safehold",
    ['Giddeus 2'] = "Giddeus",
}

-- Get base zone name for map loading (converts sub-zone names to base names)
local function getBaseZoneName(zone_name)
    return subzone_to_base[zone_name] or zone_name
end
pathfinding.getBaseZoneName = getBaseZoneName

-- Map zone_id + floor_id to specific zone names (inverse of zone_name_to_floor)
-- Used for detecting which "sub-zone" the player is in based on their floor
local zone_floor_to_name = {
    [142] = {
        [1] = "Yughott Grotto 1"
    },
    [143] = {
        [1] = "Palborough Mines 1",
        [2] = "Palborough Mines 2",
        [3] = "Palborough Mines 3"
    },
    [173] = {
        [1] = "Korroloka Tunnel 1",
        [2] = "Korroloka Tunnel 2"
    },
    [174] = {
        [1] = "Kuftal Tunnel 1",
        [2] = "Kuftal Tunnel 2"
    },
    [204] = {  -- Fei'Yin
        [1] = "Fei'Yin 1",
        [2] = "Fei'Yin 15"  -- logical floor 2 (raw floor_id 15)
    },
    [238] = {  -- Windurst Waters
        [1] = "Windurst Waters North",
        [2] = "Windurst Waters South"
    },
    [26] = {  -- Tavnazian Safehold
        [1] = "Tavnazian Safehold 1",  -- upper floor (ramp up from I-9)
        [2] = "Tavnazian Safehold 2",  -- entry floor (from Lufaise Meadows)
        [3] = "Tavnazian Safehold 3",  -- lower floor (ramp down from H-8)
    },
    [4] = {  -- Bibiki Bay
        [1] = "Bibiki Bay 1",
        [2] = "Bibiki Bay 2",  -- Purgonorgo Isle (boat from I-6)
    },
    [145] = {  -- Giddeus
        [2] = "Giddeus 2",  -- logical floor 2 (raw floor_id 15)
    },
}

-- Get current zone name with floor detection support
-- Parameters:
--   player_zone_id: The zone ID from party:GetMemberZone(0)
--   zones_db: Optional zones database (will load if not provided)
-- Returns: zone name string, or nil if not found
function pathfinding.getCurrentZone(player_zone_id, zones_db)
    if not player_zone_id or player_zone_id <= 0 then
        return nil
    end

    -- Load zones database if not provided
    if not zones_db then
        local ok, db = pcall(require, 'data.zones')
        if ok then
            zones_db = db
        else
            return nil
        end
    end

    local current_zone = nil

    -- Only try floor detection if this zone needs it
    if zone_floor_to_name[player_zone_id] then
        local floor_ok, floor_mappings = pcall(require, 'data.floor_mappings')
        local player_ok, player_module = pcall(require, 'modules.player')

        if floor_ok and player_ok and player_module.getFloorId then
            local status_ok, player_floor_id = pcall(player_module.getFloorId, floor_mappings)
            if status_ok and player_floor_id and zone_floor_to_name[player_zone_id][player_floor_id] then
                current_zone = zone_floor_to_name[player_zone_id][player_floor_id]
            end
        end
    end

    -- If no floor-based name found, use regular zone lookup (works for all zones)
    if not current_zone then
        for zone_name, zone_id in pairs(zones_db) do
            if zone_id == player_zone_id then
                current_zone = zone_name
                break
            end
        end
    end

    return current_zone
end

-- Helper function to get ALL floor_ids for a zone (for multi-floor zones)
-- Returns: array of floor_ids sorted in ascending order, or {0} if not found
local function getAllFloorIds(zone_id)
    -- Lazy-load dependencies to avoid circular dependencies
    local floor_mappings_ok, floor_mappings = pcall(require, 'data.floor_mappings')
    if not floor_mappings_ok or not floor_mappings then
        return {0}
    end

    -- Check if this zone has floor mappings
    local zone_floors = floor_mappings[zone_id]
    if not zone_floors or type(zone_floors) ~= 'table' then
        return {0}
    end

    -- Collect all floor_ids
    local floor_ids = {}
    for floor_id, _ in pairs(zone_floors) do
        if type(floor_id) == 'number' then
            table.insert(floor_ids, floor_id)
        end
    end

    -- Sort in ascending order
    table.sort(floor_ids)

    -- Return floor_ids, or {0} if no valid floors found
    return (#floor_ids > 0) and floor_ids or {0}
end

-- BFS (Breadth-First Search) to find shortest path between zones
-- dest_floor_id (optional): only accept arrival at end_zone via an entrance edge
--   whose floor_id matches. Used to disambiguate zones with multiple entrances
--   that lead to disconnected floor-segments (e.g. Outer Horutoto Ruins).
--   When nil, behaves exactly as before (any entrance is accepted).
-- Returns: path table with {zone, exit} entries, or nil if no path found
function pathfinding.findPath(start_zone, end_zone, dest_floor_id)
    -- Edge cases
    if not start_zone or not end_zone then
        return nil
    end

    if start_zone == end_zone then
        return {{zone = start_zone, exit = nil}}  -- Already at destination
    end

    if not zone_connections[start_zone] then
        return nil  -- Start zone not in graph
    end

    -- BFS setup
    local queue = {{zone = start_zone, path = {}}}
    local visited = {[start_zone] = true}

    while #queue > 0 do
        -- Dequeue
        local current = table.remove(queue, 1)
        local current_zone = current.zone
        local current_path = current.path

        -- Check neighbors
        local neighbors = zone_connections[current_zone]
        if neighbors then
            for _, neighbor in ipairs(neighbors) do
                local next_zone = neighbor.zone

                -- Found the destination? (optionally require a specific entrance floor)
                if next_zone == end_zone and (not dest_floor_id or neighbor.floor_id == dest_floor_id) then
                    -- Build final path
                    local final_path = {}
                    for _, step in ipairs(current_path) do
                        table.insert(final_path, step)
                    end
                    table.insert(final_path, {zone = next_zone, exit = neighbor.exit})
                    return final_path
                end

                -- Not visited yet? Add to queue
                if not visited[next_zone] then
                    visited[next_zone] = true
                    local new_path = {}
                    for _, step in ipairs(current_path) do
                        table.insert(new_path, step)
                    end
                    table.insert(new_path, {zone = next_zone, exit = neighbor.exit})
                    table.insert(queue, {zone = next_zone, path = new_path})
                end
            end
        end
    end

    -- No path found
    return nil
end

-- Normalize zone name for display (strip directional suffixes)
-- "North Gustaberg (East)" -> "North Gustaberg"
local function normalizeZoneName(zone_name)
    if not zone_name then return zone_name end
    -- Strip (East), (West), etc. suffixes for display
    return zone_name:gsub("%s*%(East%)$", ""):gsub("%s*%(West%)$", "")
end

-- Format a path into a readable string
-- Returns: formatted route string with current zone and exit coordinates
-- Format: "Current Zone (Exit) ->\nNext Zone (Exit) ->\nDestination"
-- destination_highlight: optional table with .position field to show at end (e.g., {position = "L-8"})
function pathfinding.formatPath(path, current_zone, destination_highlight)
    if not path or type(path) ~= "table" or #path == 0 then
        return "No route found"
    end

    -- If only one entry, player is already at destination
    if #path == 1 and path[1] and not path[1].exit then
        return "You're already here!"
    end

    local parts = {}

    -- Add the starting zone with the first exit coordinate
    if current_zone and #path > 0 and path[1] and path[1].exit then
        local norm_zone = normalizeZoneName(current_zone)
        if norm_zone then
            parts[#parts + 1] = string.format("%s (%s)", norm_zone, path[1].exit)
        end
    end

    -- Show subsequent zones with their exit coordinates
    -- Each zone shows the exit coordinate to reach the NEXT zone
    for i = 1, #path - 1 do
        local current_step = path[i]
        local next_step = path[i + 1]

        if current_step and next_step and next_step.exit then
            -- Show the zone you'll be in, with the exit to reach the next zone
            local norm_zone = normalizeZoneName(current_step.zone)
            if norm_zone then
                parts[#parts + 1] = string.format("%s (%s)", norm_zone, next_step.exit)
            end
        elseif current_step and current_step.zone then
            -- Next zone is the destination (no exit needed from current)
            local norm_zone = normalizeZoneName(current_step.zone)
            if norm_zone then
                parts[#parts + 1] = norm_zone
            end
        end
    end

    -- Add final destination
    if #path > 0 and path[#path] and path[#path].zone then
        local norm_zone = normalizeZoneName(path[#path].zone)
        if norm_zone then
            -- Add destination highlight position if provided
            if destination_highlight and destination_highlight.position then
                parts[#parts + 1] = string.format("%s (%s)", norm_zone, destination_highlight.position)
            else
                parts[#parts + 1] = norm_zone
            end
        end
    end

    if #parts == 0 then
        return "You're already here!"
    end

    return table.concat(parts, " ->\n")
end

-- Get route distance (number of zones to travel through)
function pathfinding.getRouteDistance(path)
    if not path or #path == 0 then
        return 0
    end

    -- If already at destination
    if #path == 1 and not path[1].exit then
        return 0
    end

    return #path
end

-- Check if a route is considered "long" (more than 5 zones)
function pathfinding.isLongRoute(path)
    return pathfinding.getRouteDistance(path) > 5
end

-- Generate images array for displaying route maps with exit highlights
-- Shows ALL exits that lead toward the destination (same minimum distance)
-- Returns: images array compatible with quest step format
-- Parameters:
--   path: The route path from BFS
--   current_zone: Player's current zone name
--   destination_highlight: Optional highlight(s) for final destination
--     Old format (single, shows on all floors): {position = "H-8", offsetX = 16, offsetY = 16}
--     New format (array with floor/label support): {
--       {position = "H-8", floor_id = 1, label = "1"},
--       {position = "G-10", floor_id = 2, label = "2"}
--     }
function pathfinding.generateRouteImages(path, current_zone, destination_highlight, dest_floor_id)
    if not path or type(path) ~= "table" or #path == 0 then
        return {}
    end

    -- Load zone database for zone_id lookups (needed for floor_id)
    local zones_db_ok, zones_db = pcall(require, 'data.zones')
    if not zones_db_ok then
        zones_db = {}
    end

    local images = {}
    local destination = path[#path] and path[#path].zone

    -- If already at destination, show destination map with highlight (player needs to see where NPC is)
    if #path == 1 and path[1] and not path[1].exit then
        if destination then
            local norm_zone = getBaseZoneName(normalizeZoneName(destination))
            local zone_id = zones_db[norm_zone]
            local floor_ids

            -- Check if zone name specifies a floor (e.g., "Windurst Waters North")
            if zone_name_to_floor[destination] then
                floor_ids = {zone_name_to_floor[destination]}
            elseif destination_highlight and not destination_highlight.position then
                -- New format array: infer floors from destination_highlight floor_ids
                local seen_floors = {}
                local unique_floors = {}
                for _, highlight in ipairs(destination_highlight) do
                    if highlight.floor_id and not seen_floors[highlight.floor_id] then
                        seen_floors[highlight.floor_id] = true
                        table.insert(unique_floors, highlight.floor_id)
                    end
                end
                if #unique_floors > 0 then
                    table.sort(unique_floors)
                    floor_ids = unique_floors
                else
                    -- New format but no floor_ids specified: default to first floor
                    local all_floors = zone_id and getAllFloorIds(zone_id) or {0}
                    floor_ids = {all_floors[1]}
                end
            else
                -- Old format or no highlight: default to first floor only
                local all_floors = zone_id and getAllFloorIds(zone_id) or {0}
                floor_ids = {all_floors[1]}
            end

            -- Generate a map for each floor
            for _, floor_id in ipairs(floor_ids) do
                local map_entry = {
                    zone_name = norm_zone,
                    floor_id = floor_id,
                    width = 512,
                    height = 512
                }

                -- Handle destination_highlight (supports old and new format)
                if destination_highlight then
                    if destination_highlight.position then
                        -- Old format: single highlight - show on all floors
                        map_entry.highlights = {destination_highlight}
                    else
                        -- New format: array with optional floor_id filtering
                        local floor_highlights = {}
                        for _, highlight in ipairs(destination_highlight) do
                            if not highlight.floor_id or highlight.floor_id == floor_id then
                                table.insert(floor_highlights, highlight)
                            end
                        end
                        if #floor_highlights > 0 then
                            map_entry.highlights = floor_highlights
                        end
                    end
                end

                table.insert(images, map_entry)
            end
        end
        return images
    end

    -- Helper: Get all exits from current_zone that lead toward destination
    -- Returns: table of {floor_id = {highlights}, ...} or {[0] = {highlights}} if no floor_id
    local function getExitsTowardDestinationByFloor(from_zone)
        local exits_by_floor = {}

        if not from_zone or not destination then
            return exits_by_floor
        end

        -- Get zone connections to check for floor_id
        local connections = zone_connections[from_zone]
        if not connections then
            return exits_by_floor
        end

        -- Calculate BFS distance from each neighbor to destination
        local min_distance = math.huge
        local zone_distances = {}

        -- First pass: calculate minimum distance
        for _, conn in ipairs(connections) do
            if conn.zone then
                local path_to_dest = pathfinding.findPath(conn.zone, destination, dest_floor_id)
                if path_to_dest then
                    local distance = pathfinding.getRouteDistance(path_to_dest)
                    if not zone_distances[conn.zone] or distance < zone_distances[conn.zone] then
                        zone_distances[conn.zone] = distance
                    end
                    if distance < min_distance then
                        min_distance = distance
                    end
                end
            end
        end

        -- conn.floor_id is overloaded: normally it is a floor of the CURRENT zone, but on an
        -- edge entering the destination it names the destination floor (see findPath). Only
        -- read it the latter way when from_zone is single-floor, so it cannot mean anything else.
        local from_norm = getBaseZoneName(normalizeZoneName(from_zone))
        local from_zone_id = from_norm and zones_db[from_norm]
        local from_is_single_floor = true
        if not zone_name_to_floor[from_zone] and from_zone_id then
            from_is_single_floor = #getAllFloorIds(from_zone_id) <= 1
        end

        -- Second pass: collect exits that have minimum distance, grouped by floor_id
        -- floor_id in connections = which floor of the CURRENT zone this exit is on
        -- Omitting floor_id (-> 0) means show all floors (backward-compatible default)
        for _, conn in ipairs(connections) do
            if conn.zone and zone_distances[conn.zone] == min_distance and conn.exit then
                local is_entrance = from_is_single_floor and dest_floor_id
                    and conn.zone == destination and conn.floor_id ~= nil
                if not is_entrance or conn.floor_id == dest_floor_id then
                    local fid = is_entrance and 0 or (conn.floor_id or 0)
                    if not exits_by_floor[fid] then exits_by_floor[fid] = {} end
                    table.insert(exits_by_floor[fid], {position = conn.exit, offsetX = 16, offsetY = 16, label = conn.label})
                end
            end
        end

        return exits_by_floor
    end

    -- Add current zone map with ALL exits toward destination
    if current_zone then
        local norm_zone = getBaseZoneName(normalizeZoneName(current_zone))
        if norm_zone then
            local exits_by_floor = getExitsTowardDestinationByFloor(current_zone)

            -- Get zone_id to determine available floors for the CURRENT zone
            local zone_id = zones_db[norm_zone]
            local available_floors

            -- Check if this zone name has a specific floor mapping (e.g., Windurst Waters North/South)
            if zone_name_to_floor[current_zone] then
                available_floors = {zone_name_to_floor[current_zone]}
            else
                available_floors = zone_id and getAllFloorIds(zone_id) or {0}
            end

            -- Process exits grouped by floor_id
            for floor_id, highlights in pairs(exits_by_floor) do
                if floor_id == 0 then
                    -- No floor_id specified in zone_connections: show all floors with same highlights
                    for _, fid in ipairs(available_floors) do
                        images[#images + 1] = {
                            zone_name = norm_zone,
                            width = 512,
                            height = 512,
                            floor_id = fid,
                            highlights = highlights
                        }
                    end
                else
                    -- floor_id IS specified: verify this floor actually exists in current zone
                    local floor_exists = false
                    for _, fid in ipairs(available_floors) do
                        if fid == floor_id then
                            floor_exists = true
                            break
                        end
                    end

                    if floor_exists then
                        -- Floor exists, show it
                        images[#images + 1] = {
                            zone_name = norm_zone,
                            width = 512,
                            height = 512,
                            floor_id = floor_id,
                            highlights = highlights
                        }
                    else
                        -- Floor doesn't exist in this zone (e.g., Port Windurst floor 2)
                        -- Show the zone's default/only floor instead
                        images[#images + 1] = {
                            zone_name = norm_zone,
                            width = 512,
                            height = 512,
                            floor_id = available_floors[1] or 0,
                            highlights = highlights
                        }
                    end
                end
            end
        end
    end

    -- Add intermediate zone maps with ALL exits toward destination
    for i = 1, #path - 1 do
        local current_step = path[i]

        if current_step and current_step.zone then
            local norm_zone = getBaseZoneName(normalizeZoneName(current_step.zone))
            if norm_zone then
                local exits_by_floor = getExitsTowardDestinationByFloor(current_step.zone)

                -- Get zone_id to determine available floors for THIS zone
                local zone_id = zones_db[norm_zone]
                local available_floors

                -- Check if this zone name has a specific floor mapping (e.g., Windurst Waters North/South)
                if zone_name_to_floor[current_step.zone] then
                    available_floors = {zone_name_to_floor[current_step.zone]}
                else
                    available_floors = zone_id and getAllFloorIds(zone_id) or {0}
                end

                -- Process exits grouped by floor_id
                for floor_id, highlights in pairs(exits_by_floor) do
                    if floor_id == 0 then
                        -- No floor_id specified in zone_connections: show all floors with same highlights
                        for _, fid in ipairs(available_floors) do
                            images[#images + 1] = {
                                zone_name = norm_zone,
                                width = 512,
                                height = 512,
                                floor_id = fid,
                                highlights = highlights
                            }
                        end
                    else
                        -- floor_id IS specified: verify this floor actually exists in this zone
                        local floor_exists = false
                        for _, fid in ipairs(available_floors) do
                            if fid == floor_id then
                                floor_exists = true
                                break
                            end
                        end

                        if floor_exists then
                            -- Floor exists, show it
                            images[#images + 1] = {
                                zone_name = norm_zone,
                                width = 512,
                                height = 512,
                                floor_id = floor_id,
                                highlights = highlights
                            }
                        else
                            -- Floor doesn't exist in this zone
                            -- Show the zone's default/only floor instead
                            images[#images + 1] = {
                                zone_name = norm_zone,
                                width = 512,
                                height = 512,
                                floor_id = available_floors[1] or 0,
                                highlights = highlights
                            }
                        end
                    end
                end
            end
        end
    end

    -- Add final destination map with optional custom highlight
    if destination then
        local norm_zone = getBaseZoneName(normalizeZoneName(destination))
        if norm_zone then
            -- Check if zone name explicitly specifies a floor (e.g., "Windurst Waters South")
            local destination_floor_id = zone_name_to_floor[destination]

            -- Get zone_id and determine which floors to show
            local zone_id = zones_db[norm_zone]
            local floor_ids

            if destination_floor_id then
                -- Zone name specifies a floor (e.g., Windurst Waters North = floor 1)
                floor_ids = {destination_floor_id}
            elseif destination_highlight and not destination_highlight.position then
                -- New format array: infer floors from destination_highlight floor_ids
                local seen_floors = {}
                local unique_floors = {}
                for _, highlight in ipairs(destination_highlight) do
                    if highlight.floor_id and not seen_floors[highlight.floor_id] then
                        seen_floors[highlight.floor_id] = true
                        table.insert(unique_floors, highlight.floor_id)
                    end
                end
                if #unique_floors > 0 then
                    -- Sort floors so they display in consistent order
                    table.sort(unique_floors)
                    floor_ids = unique_floors
                else
                    -- New format but no floor_ids specified: default to first floor
                    local all_floors = zone_id and getAllFloorIds(zone_id) or {0}
                    floor_ids = {all_floors[1]}
                end
            else
                -- Old format or no highlight: default to first floor only
                local all_floors = zone_id and getAllFloorIds(zone_id) or {0}
                floor_ids = {all_floors[1]}
            end

            -- Add a map for each relevant floor of the destination zone
            for _, floor_id in ipairs(floor_ids) do
                local final_map = {
                    zone_name = norm_zone,
                    width = 512,
                    height = 512,
                    floor_id = floor_id
                }

                -- Only show destination_highlight (NPC location, etc.) if provided
                -- Don't show entrance point - that's where you came from, not where you're going
                if destination_highlight then
                    -- Check if it's the old format (single object with .position) or new format (array)
                    if destination_highlight.position then
                        -- Old format: single highlight object - show on all floors (backward compatible)
                        final_map.highlights = {destination_highlight}
                    else
                        -- New format: array of highlights, possibly with floor_id and label
                        -- Filter highlights for this specific floor
                        local floor_highlights = {}
                        for _, highlight in ipairs(destination_highlight) do
                            -- Include highlight if: no floor_id specified, or floor_id matches current floor
                            if not highlight.floor_id or highlight.floor_id == floor_id then
                                table.insert(floor_highlights, highlight)
                            end
                        end
                        if #floor_highlights > 0 then
                            final_map.highlights = floor_highlights
                        end
                    end
                end

                images[#images + 1] = final_map
            end
        end
    end

    return images
end

return pathfinding
