-- Quest data loading module
-- Handles loading of quest data, locations, zones, and maps
local quest_data_module = {}

-- JSON/Data Loading
local function decode_json(json_str)
    local status, result = pcall(function()
        return load("return " .. json_str)()
    end)
    if status then
        return result
    else
        print('Failed to parse data file:', result)
        return nil
    end
end

-- Loads zone data from data/zones.lua
function quest_data_module.loadZones(addon_name)
    local zone_data = T{}
    local filepath = string.format('%saddons/%s/data/zones.lua', AshitaCore:GetInstallPath(), addon_name)
    local chunk, err = loadfile(filepath)
    if chunk then
        local ok, result = pcall(chunk)
        if ok and type(result) == 'table' then
            zone_data = T(result)
            print(string.format("[%s] Loaded %d zones from data/zones.lua.", addon_name, table.count(zone_data)))
        else
            print(string.format('Error running file: %s -> %s', filepath, err or "unknown"))
        end
    else
        print(string.format('Warning: Could not load data/zones.lua. Zone checks will not work. Error: %s', err or "file not found"))
    end
    return zone_data
end

-- Loads location data from data/locations.lua
function quest_data_module.loadLocations(addon_name)
    local location_data = T{}
    local filepath = string.format('%saddons/%s/data/locations.lua', AshitaCore:GetInstallPath(), addon_name)
    local chunk, err = loadfile(filepath)
    if chunk then
        local ok, result = pcall(chunk)
        if ok and type(result) == 'table' then
            location_data = T(result)
            print(string.format("[%s] Loaded %d locations from data/locations.lua.", addon_name, table.count(location_data)))
        else
            print(string.format('Error running file: %s -> %s', filepath, err or "unknown"))
        end
    else
        print(string.format('Warning: Could not load data/locations.lua. Beams relying on it will not work. Error: %s', err or "file not found"))
    end
    return location_data
end

-- Loads map calibration data from data/maps.lua
function quest_data_module.loadMaps(addon_name)
    local map_db = T{}
    local filepath = string.format('%saddons/%s/data/maps.lua', AshitaCore:GetInstallPath(), addon_name)
    local chunk = loadfile(filepath)
    if chunk then
        local ok, res = pcall(chunk)
        if ok then
            map_db = T(res)
            print(string.format("[%s] Loaded %d map calibrations.", addon_name, table.count(map_db)))
        end
    end
    return map_db
end

-- Loads all quest/mission data from subdirectories
function quest_data_module.loadQuestData(addon_name)
    local quest_data = T{}
    local baseFolder = string.format('%saddons/%s/data/', AshitaCore:GetInstallPath(), addon_name)
    local dynamic_directories_list = T{}

    -- Scan for category directories
    local dirCmdScanCategories = string.format('dir /b /ad "%s"', baseFolder:gsub('/', '\\'))
    local pCategories = io.popen(dirCmdScanCategories)
    if pCategories then
        for category_name_raw in pCategories:lines() do
            local category_name = category_name_raw:match("^%s*(.-)%s*$")
            if category_name and #category_name > 0 and category_name ~= "." and category_name ~= ".." then
                table.insert(dynamic_directories_list, category_name)
            end
        end
        pCategories:close()
        if #dynamic_directories_list == 0 then
            print("QuestHelper: WARNING - No category subdirectories found in " .. baseFolder)
        else
            print("QuestHelper: Discovered categories: " .. table.concat(dynamic_directories_list, ", "))
        end
    else
        print("QuestHelper: ERROR - Could not execute 'dir' command to find categories in " .. baseFolder)
        return quest_data
    end

    -- Load files from each category
    for _, subdir in ipairs(dynamic_directories_list) do
        local folderPath = baseFolder .. subdir .. '/'
        local dirCmd = 'dir "' .. folderPath .. '" /b'
        local p = io.popen(dirCmd)
        if p then
            for file_name in p:lines() do
                -- Load .lua files
                if file_name:match('%.lua$') then
                    local filepath = folderPath .. file_name
                    local chunk, err = loadfile(filepath)
                    if chunk then
                        local ok, result = pcall(chunk)
                        if ok and type(result) == 'table' then
                            local shortName = file_name:gsub('%.lua$', '')
                            if not quest_data[subdir] then
                                quest_data[subdir] = T{}
                            end
                            quest_data[subdir][shortName] = T(result)
                        else
                            print(string.format('Error running file: %s -> %s', filepath, err or "unknown"))
                        end
                    else
                        print(string.format('Error loading Lua file: %s -> %s', filepath, err or "unknown"))
                    end
                -- Load .json files
                elseif file_name:match('%.json$') then
                    local filepath = folderPath .. file_name
                    local f = io.open(filepath, 'r')
                    if f then
                        local content = f:read('*all')
                        f:close()
                        local data = decode_json(content)
                        if data then
                            local shortName = file_name:gsub('%.json$', '')
                            if not quest_data[subdir] then
                                quest_data[subdir] = T{}
                            end
                            quest_data[subdir][shortName] = T(data)
                        else
                            print(string.format('Error parsing JSON data: %s', filepath))
                        end
                    end
                end
            end
            p:close()
        end
    end

    return quest_data
end

return quest_data_module
