------------------------------------------------------------------
----- All credit to atom0s for providing texture loading code ----
------------------------------------------------------------------
-- File: images.lua
require 'common'
local ffi     = require('ffi')
local d3d     = require('d3d8')
local C       = ffi.C
local d3d8dev = d3d.get_device()

-- DAT loader for loading maps from FFXI ROM files
local dat_loader = require('modules.dat_loader')

-- Quest state for accessing dev_mode
local quest_state = require('modules.quest_state')

ffi.cdef[[
HRESULT __stdcall D3DXCreateTextureFromFileA(
    IDirect3DDevice8* pDevice,
    const char* pSrcFile,
    IDirect3DTexture8** ppTexture
);
]]

local images = {}
local loaded_textures = {}
local dat_cache = {}  -- Separate cache for DAT-loaded textures

-- Helper function to load one texture by filename.
local function load_texture(filename)
    local tex_ptr = ffi.new('IDirect3DTexture8*[1]')
    -- Path to /util/images/ folder inside your addon
    local path = string.format('%s/util/images/%s', addon.path, filename)
    local res  = C.D3DXCreateTextureFromFileA(d3d8dev, path, tex_ptr)
    if (res ~= C.S_OK) then
        print(string.format('Failed to load image (%s): %08X', path, res))
        return nil
    end

    local texture = ffi.new('IDirect3DTexture8*', tex_ptr[0])
    d3d.gc_safe_release(texture) -- ensures safe GC
    return texture
end

-- Public function to retrieve a texture by filename or from DAT.
-- Parameters:
--   filename: PNG filename (e.g., "maps/bastok_mines.png") - used as fallback
--   zone_id: FFXI zone ID (optional, enables DAT loading)
--   floor_id: Floor ID within zone (optional, defaults to 0)
--   force_png: If true, skip DAT loading and use PNG (optional, defaults to false)
function images.GetTexture(filename, zone_id, floor_id, force_png)
    -- Try DAT loading first if zone info provided and not forced to PNG
    if zone_id and not force_png then
        floor_id = floor_id or 0
        local cache_key = string.format("dat_%d_%d", zone_id, floor_id)

        -- Return cached result (false = known failure, skip retry and re-log)
        if dat_cache[cache_key] ~= nil then
            return dat_cache[cache_key] or nil
        end

        -- Try loading from DAT
        local texture, err = dat_loader.load_map_texture(zone_id, floor_id)
        if texture then
            dat_cache[cache_key] = texture
            if quest_state.settings and quest_state.settings.ui_settings and quest_state.settings.ui_settings.dev_mode then
                print(string.format('[QuestHelper] Loaded map from DAT: Zone %d, Floor %d', zone_id, floor_id))
            end
            return texture
        else
            dat_cache[cache_key] = false
            if quest_state.settings and quest_state.settings.ui_settings and quest_state.settings.ui_settings.dev_mode then
                print(string.format('[QuestHelper] DAT load failed (%s), falling back to PNG: %s', err or 'unknown error', filename or 'none'))
            end
        end
    end

    -- Fallback to PNG loading
    if not filename or filename == '' then
        return nil
    end

    if loaded_textures[filename] == nil then
        loaded_textures[filename] = load_texture(filename)
    end
    return loaded_textures[filename]
end

-- Unload a specific texture from memory
function images.UnloadTexture(filename)
    if loaded_textures[filename] then
        -- Release the texture (D3D will handle cleanup via GC)
        loaded_textures[filename] = nil
    end
end

-- Unload DAT texture by zone/floor
function images.UnloadDATTexture(zone_id, floor_id)
    floor_id = floor_id or 0
    local cache_key = string.format("dat_%d_%d", zone_id, floor_id)
    if dat_cache[cache_key] then
        dat_cache[cache_key] = nil
    end
end

-- Cleanup textures not in the provided list of filenames
-- Parameters:
--   keep_list: table/array of filenames to keep loaded
--   keep_dat_list: table/array of {zone_id, floor_id} tables to keep loaded
function images.CleanupUnused(keep_list, keep_dat_list)
    -- Build a set of filenames to keep
    local keep_set = {}
    if keep_list then
        for _, filename in ipairs(keep_list) do
            if filename and filename ~= '' then
                keep_set[filename] = true
            end
        end
    end

    -- Build a set of DAT cache keys to keep
    local keep_dat_set = {}
    if keep_dat_list then
        for _, entry in ipairs(keep_dat_list) do
            if entry.zone_id then
                local floor_id = entry.floor_id or 0
                local cache_key = string.format("dat_%d_%d", entry.zone_id, floor_id)
                keep_dat_set[cache_key] = true
            end
        end
    end

    -- Unload PNG textures not in the keep list
    local unloaded_count = 0
    for filename, _ in pairs(loaded_textures) do
        if not keep_set[filename] then
            loaded_textures[filename] = nil
            unloaded_count = unloaded_count + 1
        end
    end

    -- Unload DAT textures not in the keep list
    local unloaded_dat_count = 0
    for cache_key, _ in pairs(dat_cache) do
        if not keep_dat_set[cache_key] then
            dat_cache[cache_key] = nil
            unloaded_dat_count = unloaded_dat_count + 1
        end
    end

    return unloaded_count, unloaded_dat_count
end

-- Get count of currently loaded textures (for debugging)
function images.GetLoadedCount()
    local png_count = 0
    for _ in pairs(loaded_textures) do
        png_count = png_count + 1
    end

    local dat_count = 0
    for _ in pairs(dat_cache) do
        dat_count = dat_count + 1
    end

    return png_count, dat_count
end

-- Get map calibration data from DAT
function images.GetDATCalibration(zone_id, floor_id)
    return dat_loader.get_map_calibration(zone_id, floor_id)
end

-- Get available floors for a zone
function images.GetAvailableFloors(zone_id)
    return dat_loader.get_available_floors(zone_id)
end

return images
