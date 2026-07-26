-- Key Item tracking module
local keyitem = {}

local struct = require('struct')

-- Storage for key item states
-- This table persists in Lua memory across zone changes - do not clear it on zone.
-- The 0x55 packet is the sole source of truth; it arrives on zone-in and on any change.
keyitem.owned_keyitems = T{}

-- True once we have received at least one authoritative 0x55 packet.
-- Used by isInitialized() so the UI can show "zone to update" until we have reliable data.
local packet_initialized = false

-- True once initFromMemory() has run (best-effort bootstrap, may be incomplete).
-- Prevents re-running the memory scan on every frame, but does NOT suppress the UI hint.
local memory_scanned = false

-- Flagged true when 0x55 updates owned_keyitems so questhelper can persist the cache.
local cache_dirty = false

--- Checks if player has a specific key item
--- @param ki_id number - Key item ID
--- @return boolean - true if player has the key item
function keyitem.hasKeyItem(ki_id)
    return keyitem.owned_keyitems[ki_id] == true
end

--- Checks if player has all key items from a list
--- @param ki_list table - Array of key item IDs or names
--- @return boolean - true if player has all key items
function keyitem.hasAllKeyItems(ki_list)
    if not ki_list or #ki_list == 0 then
        return true
    end

    for _, ki in ipairs(ki_list) do
        local ki_id = type(ki) == 'table' and ki.id or ki
        if not keyitem.hasKeyItem(ki_id) then
            return false
        end
    end

    return true
end

--- Get count of how many key items player has from a list
--- @param ki_list table - Array of key item IDs
--- @return number, number - (owned_count, total_count)
function keyitem.getKeyItemCount(ki_list)
    if not ki_list or #ki_list == 0 then
        return 0, 0
    end

    local owned = 0
    local total = #ki_list

    for _, ki in ipairs(ki_list) do
        local ki_id = type(ki) == 'table' and ki.id or ki
        if keyitem.hasKeyItem(ki_id) then
            owned = owned + 1
        end
    end

    return owned, total
end

--- Packet handler for key item updates (0x55)
--- The server sends this on zone-in (one packet per 512-item chunk) and on any change.
--- Call this from your main packet_in event handler.
function keyitem.handlePacket(e)
    if e.id == 0x55 then
        -- Each 0x55 packet covers a specific 512-bit chunk of the key item table.
        local offset = struct.unpack('B', e.data, 0x84 + 1) * 512

        for ki_id = offset, offset + 511 do
            local has_ki = (ashita.bits.unpack_be(e.data_raw, 0x04, ki_id - offset, 1) == 1)

            if has_ki then
                keyitem.owned_keyitems[ki_id] = true
            else
                keyitem.owned_keyitems[ki_id] = nil
            end
        end

        packet_initialized = true
        cache_dirty = true
    end
end

--- Load owned key items from a previously saved cache (array of KI IDs).
--- Treats the data as authoritative: suppresses the "zone to update" hint.
--- 0x55 packets will overwrite this when the player next zones.
function keyitem.loadFromCache(cache)
    if not cache then return end
    local count = 0
    for _, ki_id in ipairs(cache) do
        keyitem.owned_keyitems[ki_id] = true
        count = count + 1
    end
    if count > 0 then
        packet_initialized = true  -- Cache is good enough to suppress the hint
    end
end

--- Returns true if 0x55 has updated owned_keyitems since the last clearCacheDirty().
function keyitem.isCacheDirty()
    return cache_dirty
end

--- Clears the dirty flag after the cache has been persisted to settings.
function keyitem.clearCacheDirty()
    cache_dirty = false
end

--- One-shot memory scan for addon reload mid-session.
--- Populates owned_keyitems from memory as a best-effort bootstrap.
--- Does NOT set packet_initialized, so the UI hint stays visible until a real
--- 0x55 packet confirms the data.
function keyitem.initFromMemory()
    if packet_initialized or memory_scanned then return end

    local memManager = AshitaCore:GetMemoryManager()
    if not memManager then return end

    local player = memManager:GetPlayer()
    if not player then return end

    for ki_id = 0, 4095 do
        if player:HasKeyItem(ki_id) then
            keyitem.owned_keyitems[ki_id] = true
        end
    end

    memory_scanned = true
end

--- Reset key item tracking (useful on logout/unload)
function keyitem.reset()
    keyitem.owned_keyitems = T{}
    packet_initialized = false
    memory_scanned = false
    cache_dirty = false
end

--- Returns true only once a 0x55 packet has been received (authoritative data).
--- The UI uses this to show a "zone to update" hint until then.
function keyitem.isInitialized()
    return packet_initialized
end

--- Debug function to list all owned key items
function keyitem.listOwnedKeyItems()
    local count = 0
    local items = {}

    for ki_id, _ in pairs(keyitem.owned_keyitems) do
        table.insert(items, ki_id)
        count = count + 1
    end

    table.sort(items)
    return items, count
end

return keyitem
