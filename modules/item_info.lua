-- Item lookup by NAME against the game's own resources, so reward blocks can carry just
-- `name = "Spatha"` instead of hand-copied stats.
--
-- Uses the same API modules/inventory.lua already relies on: AshitaCore:GetResourceManager()
-- and item.Name[LANGUAGE]. Everything is pcall'd and cached - a miss returns nil and the
-- caller falls back to whatever the data file authored.

local item_info = {}

local ffi = require('ffi')
local d3d = require('d3d8')

local LANGUAGE = 1  -- English, same constant inventory.lua uses

-- item.Bitmap is already a standard in-memory bitmap, so D3DX detects the format itself and
-- no header needs prepending. Approach taken from oxos-ffxi/ffxi-tcg modules/textures.lua.
-- The Ex variant, not the plain one dat_loader declares, because we need to force
-- A8R8G8B8 + MANAGED rather than accept whatever the icon's own format is.
ffi.cdef[[
    int __stdcall D3DXCreateTextureFromFileInMemoryEx(
        IDirect3DDevice8* pDevice, const void* pSrcData, uint32_t SrcDataSize,
        uint32_t Width, uint32_t Height, uint32_t MipLevels, uint32_t Usage,
        uint32_t Format, uint32_t Pool, uint32_t Filter, uint32_t MipFilter,
        uint32_t ColorKey, void* pSrcInfo, void* pPalette,
        IDirect3DTexture8** ppTexture
    );
]]

local D3DX_DEFAULT     = 0xFFFFFFFF
local D3DFMT_A8R8G8B8  = 21
local D3DPOOL_MANAGED  = 1

-- name (lowercased) -> item table, or false for "looked and did not find"
local cache = {}

-- Lazily built id -> name sweep, only when the direct lookup is unavailable. Ashita exposes
-- GetItemByName on some builds and not others, so this is the portable fallback.
local name_index = nil
local SCAN_MAX = 30000

local function resourceManager()
    local ok, mgr = pcall(function() return AshitaCore:GetResourceManager() end)
    if ok then return mgr end
    return nil
end

local function itemName(item)
    if not item then return nil end
    local ok, n = pcall(function() return item.Name[LANGUAGE] end)
    if ok and type(n) == 'string' and n ~= '' then return n end
    return nil
end

local function buildNameIndex(mgr)
    local index = {}
    for id = 1, SCAN_MAX do
        local ok, item = pcall(mgr.GetItemById, mgr, id)
        if ok and item then
            local n = itemName(item)
            if n then
                local key = n:lower()
                if index[key] == nil then index[key] = id end
            end
        end
    end
    return index
end

--- The game's item record for a display name, or nil. Case-insensitive, exact match on the
--- item's Name - not a substring, so "Spatha" will not pick up "Spatha +1".
function item_info.getByName(name)
    if type(name) ~= 'string' or name == '' then return nil end

    local key = name:lower()
    local hit = cache[key]
    if hit ~= nil then
        return hit or nil
    end

    local mgr = resourceManager()
    if not mgr then return nil end

    -- Fast path where the build provides it
    local ok, item = pcall(function() return mgr:GetItemByName(name, LANGUAGE) end)
    if ok and item and itemName(item) then
        cache[key] = item
        return item
    end

    -- Portable path: one sweep, then every later lookup is a table hit
    if name_index == nil then
        local built_ok, built = pcall(buildNameIndex, mgr)
        name_index = built_ok and built or {}
    end

    local id = name_index[key]
    if id then
        local got_ok, found = pcall(mgr.GetItemById, mgr, id)
        if got_ok and found then
            cache[key] = found
            return found
        end
    end

    cache[key] = false
    return nil
end

-- Bit position -> job, standard FFXI order. UNVERIFIED against a live client - if the job
-- list on a reward reads wrong, this table is the thing to check first.
local JOBS = {
    'WAR', 'MNK', 'WHM', 'BLM', 'RDM', 'THF', 'PLD', 'DRK', 'BST', 'BRD', 'RNG',
    'SAM', 'NIN', 'DRG', 'SMN', 'BLU', 'COR', 'PUP', 'DNC', 'SCH', 'GEO', 'RUN',
}

local function decodeJobs(mask)
    if type(mask) ~= 'number' or mask == 0 then return nil end

    local out = {}
    for bit, job in ipairs(JOBS) do
        -- bit 1 is WAR, so shift by the index itself
        if math.floor(mask / (2 ^ bit)) % 2 == 1 then
            table.insert(out, job)
        end
    end

    if #out == 0 then return nil end
    if #out == #JOBS then return 'All Jobs' end
    return table.concat(out, ' ')
end

--- Display-ready fields pulled from the game, or nil when the item is not found.
--- Only the plain integers are trusted here: Level, Damage and Delay are read straight off
--- the record. Jobs goes through the mask table above; Races is deliberately NOT decoded,
--- because its bit layout was never confirmed and a wrong race line is worse than none.
function item_info.getStats(name)
    local item = item_info.getByName(name)
    if not item then return nil end

    local function num(field)
        local ok, v = pcall(function() return item[field] end)
        if ok and type(v) == 'number' and v > 0 then return v end
        return nil
    end

    return {
        id     = num('Id'),
        level  = num('Level'),
        damage = num('Damage'),
        delay  = num('Delay'),
        jobs   = decodeJobs(select(2, pcall(function() return item.Jobs end))),
    }
end

-- item id -> { tex = <cdata>, id = <number for imgui.Image> }
--
-- The cdata reference is held for the addon's lifetime ON PURPOSE. d3d8's gc_safe_release
-- frees the underlying D3D texture when the cdata is collected, so dropping this table while
-- ImGui still holds the id is a use-after-free, not a leak. Icons are 32x32 and there are only
-- a handful of reward items, so keeping them costs nothing worth reclaiming.
local icon_cache = {}
local device = nil

--- Texture id for an item's in-game icon, ready for imgui.Image, or nil.
--- Same number form ui_images uses: a uintptr_t cast of the texture pointer.
function item_info.getIconTextureId(name)
    local item = item_info.getByName(name)
    if not item then return nil end

    local ok_id, id = pcall(function() return item.Id end)
    if not ok_id or type(id) ~= 'number' then return nil end

    local hit = icon_cache[id]
    if hit ~= nil then
        return hit and hit.id or nil
    end

    local ok = pcall(function()
        if not device then device = d3d.get_device() end
        if not device then error('no d3d device') end

        local size = item.ImageSize
        if type(size) ~= 'number' or size <= 0 then error('no image bytes') end

        local out = ffi.new('IDirect3DTexture8*[1]')
        local hr = ffi.C.D3DXCreateTextureFromFileInMemoryEx(
            device,
            item.Bitmap, size,
            D3DX_DEFAULT, D3DX_DEFAULT,   -- let D3DX read the icon's own dimensions
            1, 0,
            D3DFMT_A8R8G8B8,
            D3DPOOL_MANAGED,
            D3DX_DEFAULT, D3DX_DEFAULT,
            0, nil, nil, out)

        if hr ~= 0 or out[0] == nil then error('D3DX returned ' .. tostring(hr)) end

        local tex = d3d.gc_safe_release(out[0])
        icon_cache[id] = { tex = tex, id = tonumber(ffi.cast('uintptr_t', tex)) }
    end)

    if not ok then
        icon_cache[id] = false
        return nil
    end

    return icon_cache[id].id
end

--- Clears the caches. For /qh debugging after a DAT or resource swap.
--- Deliberately does NOT drop icon_cache - see the note above it.
function item_info.clearCache()
    cache = {}
    name_index = nil
end

return item_info
