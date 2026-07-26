-- Player position and heading tracking module
-- Includes buff/status effect detection
local player = {}
local ffi = require("ffi")

-- FFI definitions for floor/map functions and structures
ffi.cdef[[
    typedef int32_t (__thiscall* CheckFloorNumber_f)(void* pThis, float X, float Y, float Z);

    // mapinfo_t structure (14 bytes total = 0x0E)
    typedef struct {
        uint16_t ZoneId;         // +0x00
        uint8_t  FloorId;        // +0x02
        uint8_t  FloorIndex;     // +0x03
        uint8_t  Flags;          // +0x04
        uint8_t  Scale;          // +0x05
        uint8_t  KeyItemOffset;  // +0x06
        uint8_t  Unknown0000;    // +0x07
        uint16_t MapDatOffset;   // +0x08
        int16_t  OffsetX;        // +0x0A (SIGNED - can be negative!)
        int16_t  OffsetY;        // +0x0C (SIGNED - can be negative!)
    } mapinfo_t;
]]

-- Player position (updated each frame)
player.posX = 0
player.posY_height = 0
player.posZ_depth = 0
player.zoneId = 0
player.name = ""
player.floorId = 0  -- Map floor/layer ID

-- Floor detection data (initialized on first use)
local floorData = {
    initialized = false,
    ptrs = {
        func = nil,
        this = nil,
        mapinfo_array = nil,  -- Base pointer to mapinfo_t array
    },
    func = nil,
    this = nil,
    mapinfo_array_ptr = nil,
}

-- Updates player position from memory
-- Returns: true if successful, false otherwise
function player.updatePosition(mem)
    if not mem then return false end

    -- Get Player Name via GetPlayerEntity
    local playerInfo = GetPlayerEntity()
    if playerInfo and playerInfo.Name then
        player.name = playerInfo.Name
    end

    -- Position tracking is working via Movement.LocalPosition

    local party = mem:GetParty()
    local entityMgr = mem:GetEntity()
    if not party or not entityMgr then return false end

    player.zoneId = party:GetMemberZone(0)
    local playerIndex = party:GetMemberTargetIndex(0)
    local pActorPointer = 0

    if playerIndex == 0xFFFF or playerIndex == nil then
        local playerObj = mem:GetPlayer()
        if playerObj and playerObj:GetActorPointer() ~= 0 then
            pActorPointer = playerObj:GetActorPointer()
        else
            return false
        end
    else
        pActorPointer = entityMgr:GetActorPointer(playerIndex)
    end

    if pActorPointer == 0 then return false end

    -- Try using GetPlayerEntity() first (most reliable in Ashita v4)
    if playerInfo and playerInfo.Movement and playerInfo.Movement.LocalPosition then
        local pos = playerInfo.Movement.LocalPosition
        player.posX = pos.X
        player.posZ_depth = pos.Z
        player.posY_height = pos.Y
    elseif playerInfo and playerInfo.X and playerInfo.Z and playerInfo.Y then
        -- Fallback: Direct fields (if they exist)
        player.posX = playerInfo.X
        player.posZ_depth = playerInfo.Z
        player.posY_height = playerInfo.Y
    else
        -- Final fallback: Memory reading
        player.posX = ashita.memory.read_float(pActorPointer + 0x678)
        player.posZ_depth = ashita.memory.read_float(pActorPointer + 0x67C)
        player.posY_height = ashita.memory.read_float(pActorPointer + 0x680)
    end

    return true
end

-- Gets player heading/rotation
-- Returns: heading in radians, or 0 if unavailable
function player.getHeading()
    local playerEntity = GetPlayerEntity()
    if playerEntity then
        return playerEntity.Heading
    end
    return 0
end

-- Checks if player has a specific buff/status effect
-- Parameters:
--   buffId - Single buff ID (number) or list of buff IDs (table)
-- Returns: true if player has the buff, false otherwise
function player.hasBuff(buffId)
    local mem = AshitaCore:GetMemoryManager()
    if not mem then return false end

    local playerObj = mem:GetPlayer()
    if not playerObj then return false end

    local buffs = playerObj:GetBuffs()
    if not buffs then return false end

    -- Handle single buff ID or list of buff IDs
    local buffsToCheck = {}
    if type(buffId) == 'number' then
        table.insert(buffsToCheck, buffId)
    elseif type(buffId) == 'table' then
        buffsToCheck = buffId
    else
        return false
    end

    -- Check all 32 buff slots
    for i = 0, 31 do
        local currentBuff = buffs[i]
        if currentBuff and currentBuff ~= 0 and currentBuff ~= 255 then
            -- Check if this buff matches any we're looking for
            for _, targetBuff in ipairs(buffsToCheck) do
                if currentBuff == targetBuff then
                    return true
                end
            end
        end
    end

    return false
end

-- Gets the player's current main job level
-- Returns: level (number), or nil if unavailable
function player.getMainJobLevel()
    local mem = AshitaCore:GetMemoryManager()
    if not mem then return nil end

    local playerObj = mem:GetPlayer()
    if not playerObj then return nil end

    local level = playerObj:GetMainJobLevel()
    if not level or level == 0 then return nil end

    return level
end

-- Initialize floor detection (finds memory signatures)
-- Returns: true if successful, false otherwise
local function initializeFloorDetection()
    if floorData.initialized then
        return true
    end

    -- Find CheckFloorNumber function pointer
    floorData.ptrs.func = ashita.memory.find('FFXiMain.dll', 0, '8B542408568D4424108BF18B4C2410508B44240C', 0, 0)
    if not floorData.ptrs.func or floorData.ptrs.func == 0 then
        return false
    end

    -- Find 'this' pointer
    floorData.ptrs.this = ashita.memory.find('FFXiMain.dll', 0, '8B7424148B4424108B7C240C8B0D', 0x0E, 0)
    if not floorData.ptrs.this or floorData.ptrs.this == 0 then
        return false
    end

    -- Cast function pointer
    floorData.func = ffi.cast('CheckFloorNumber_f', floorData.ptrs.func)

    -- Read and cast 'this' pointer
    local thisPtr = ashita.memory.read_uint32(ashita.memory.read_uint32(floorData.ptrs.this))
    floorData.this = ffi.cast('void*', thisPtr)

    -- Try to find mapinfo array pointer
    -- Signature from Discord: The data array is located at offset +0x1C from this pattern
    floorData.ptrs.mapinfo_array = ashita.memory.find('FFXiMain.dll', 0, '8A0D????????5333C05684C95774??8A5424188B7424148B7C2410B9', 0x1C, 0)
    if floorData.ptrs.mapinfo_array and floorData.ptrs.mapinfo_array ~= 0 then
        local mapinfo_base = ashita.memory.read_uint32(floorData.ptrs.mapinfo_array)
        if mapinfo_base and mapinfo_base ~= 0 then
            floorData.mapinfo_array_ptr = mapinfo_base
        end
    end

    floorData.initialized = true
    return true
end

-- Gets player's current floor/map ID from memory using CheckFloorNumber
-- Returns: mapped floor/map number or raw floor ID if no mapping exists
-- Parameters:
--   floor_mappings (optional) - mapping table from floor_mappings.lua
function player.getFloorId(floor_mappings)
    -- Initialize if needed
    if not floorData.initialized then
        if not initializeFloorDetection() then
            return nil
        end
    end

    -- Get player position
    local playerInfo = GetPlayerEntity()
    if not playerInfo or not playerInfo.Movement or not playerInfo.Movement.LocalPosition then
        return nil
    end

    local pos = playerInfo.Movement.LocalPosition

    -- Call CheckFloorNumber (X, Z, Y order - note Z and Y are swapped!)
    local rawFloorId = floorData.func(floorData.this, pos.X, pos.Z, pos.Y)

    -- If we have mappings for this zone, use them
    if floor_mappings and floor_mappings[player.zoneId] then
        local zoneMapping = floor_mappings[player.zoneId]
        if zoneMapping[rawFloorId] then
            player.floorId = zoneMapping[rawFloorId]
            return player.floorId
        end
    end

    -- Default: Assume sequential mapping (raw ID = floor number)
    -- Most zones are sequential (1=1, 2=2, etc.)
    -- Only outliers like Beadeaux need manual mappings
    player.floorId = rawFloorId
    return player.floorId
end

-- Debug: Get raw floor ID for testing (0-based as game returns it)
function player.getFloorIdRaw()
    if not floorData.initialized then
        if not initializeFloorDetection() then
            return nil
        end
    end

    local playerInfo = GetPlayerEntity()
    if not playerInfo or not playerInfo.Movement or not playerInfo.Movement.LocalPosition then
        return nil
    end

    local pos = playerInfo.Movement.LocalPosition
    return floorData.func(floorData.this, pos.X, pos.Z, pos.Y)
end

-- Reads mapinfo_t structure for the current floor
-- Returns: table with map info or nil if unavailable
-- Note: Searches for entry matching current zone, NOT using CheckFloorNumber index
function player.getMapInfo()
    if not floorData.initialized then
        if not initializeFloorDetection() then
            return nil
        end
    end

    -- Check if we have the mapinfo array pointer
    if not floorData.mapinfo_array_ptr or floorData.mapinfo_array_ptr == 0 then
        return nil
    end

    -- Get current floor index from CheckFloorNumber
    local floorIndex = player.getFloorIdRaw()
    if not floorIndex then
        return nil
    end

    -- Search through mapinfo array to find entry matching current zone
    -- We need to search because CheckFloorNumber returns a global index
    -- Increase search to 500 entries to handle high zone IDs like 234+
    local maxSearchEntries = 500

    for i = 0, maxSearchEntries - 1 do
        local mapinfo_address = floorData.mapinfo_array_ptr + (i * 0x0E)
        local mapinfo = ffi.cast('mapinfo_t*', mapinfo_address)

        -- Check if this entry matches our zone
        if mapinfo[0].ZoneId == player.zoneId then
            -- Try matching FloorId first (seems to match CheckFloorNumber better)
            if mapinfo[0].FloorId == floorIndex then
                -- Found it!
                return {
                    ZoneId = mapinfo[0].ZoneId,
                    FloorId = mapinfo[0].FloorId,
                    FloorIndex = mapinfo[0].FloorIndex,
                    Flags = mapinfo[0].Flags,
                    Scale = mapinfo[0].Scale,
                    KeyItemOffset = mapinfo[0].KeyItemOffset,
                    Unknown0000 = mapinfo[0].Unknown0000,
                    MapDatOffset = mapinfo[0].MapDatOffset,
                    OffsetX = mapinfo[0].OffsetX,
                    OffsetY = mapinfo[0].OffsetY,
                    array_index = i,  -- Debug: which array entry we found
                }
            end
        end
    end

    -- Fallback: Return the entry at CheckFloorNumber index (might be wrong zone)
    local mapinfo_address = floorData.mapinfo_array_ptr + (floorIndex * 0x0E)
    local mapinfo = ffi.cast('mapinfo_t*', mapinfo_address)

    return {
        ZoneId = mapinfo[0].ZoneId,
        FloorId = mapinfo[0].FloorId,
        FloorIndex = mapinfo[0].FloorIndex,
        Flags = mapinfo[0].Flags,
        Scale = mapinfo[0].Scale,
        KeyItemOffset = mapinfo[0].KeyItemOffset,
        Unknown0000 = mapinfo[0].Unknown0000,
        MapDatOffset = mapinfo[0].MapDatOffset,
        OffsetX = mapinfo[0].OffsetX,
        OffsetY = mapinfo[0].OffsetY,
        array_index = floorIndex,
        warning = "Zone mismatch - using CheckFloorNumber index",
    }
end

-- Calculate map scale divisor (from sub_101EE310)
-- Returns: scale divisor or nil
function player.getMapScale(mapinfo)
    if not mapinfo or not mapinfo.Scale then
        return nil
    end

    local scale = mapinfo.Scale
    if scale < 0 then
        scale = -scale
    end

    if scale == 0 then
        return 0
    end

    return 2560.0 / scale
end

-- Calculate map calibration from mapinfo
-- Returns: table compatible with maps.lua format
-- Formula from Discord: grid_pos = (world_pos - offset - 16) / 32
-- Scale divisor = world units covered by the map
-- Assumes 512x512 pixel maps (standard FFXI map size)
function player.calculateMapCalibration(mapinfo, map_size)
    if not mapinfo then
        return nil
    end

    local scale_divisor = player.getMapScale(mapinfo)
    if not scale_divisor or scale_divisor == 0 then
        return nil
    end

    -- Default map size is 512x512 (standard FFXI)
    map_size = map_size or 512

    -- Calculate pixels per yalm: map_size / scale_divisor
    -- Example: 512 / 640 = 0.8 pixels per yalm
    local pixels_per_yalm = map_size / scale_divisor

    -- Origin must be scaled by the inverse of pixels_per_yalm
    -- Because smaller scale = map covers MORE world space
    -- Formula: origin = offset / pixels_per_yalm
    local origin_x = mapinfo.OffsetX / pixels_per_yalm
    local origin_y = mapinfo.OffsetY / pixels_per_yalm

    -- Return in maps.lua format
    -- Note: scale_y is negative because screen Y goes down, world Z goes up
    return {
        origin_x = origin_x,
        origin_y = -origin_y,
        scale_x = pixels_per_yalm,
        scale_y = -pixels_per_yalm,  -- Negative for screen coordinate conversion
        -- Debug info
        raw_offset_x = mapinfo.OffsetX,
        raw_offset_y = mapinfo.OffsetY,
        raw_scale = mapinfo.Scale,
        scale_divisor = scale_divisor,
        map_size = map_size,
        zone_id = mapinfo.ZoneId,
        floor_id = mapinfo.FloorId,
        flags = mapinfo.Flags,
        auto_calibrated = true,  -- Flag to indicate this was auto-generated
    }
end

-- Gets calibration for current zone, auto-loading from mapinfo if available
-- Returns: calibration table or nil
function player.getAutoCalibration(map_size)
    local mapinfo = player.getMapInfo()
    if not mapinfo then
        return nil
    end

    return player.calculateMapCalibration(mapinfo, map_size)
end

-- Debug: Dump first N entries from mapinfo array
-- Returns: table with base_ptr, current_floor, and entries array
function player.debugDumpMapArray(count)
    if not floorData.initialized then
        if not initializeFloorDetection() then
            return nil
        end
    end

    -- Check if we have the mapinfo array pointer
    if not floorData.mapinfo_array_ptr or floorData.mapinfo_array_ptr == 0 then
        return nil
    end

    -- Get current floor index
    local currentFloorIndex = player.getFloorIdRaw()

    local entries = {}
    for i = 0, count - 1 do
        local mapinfo_address = floorData.mapinfo_array_ptr + (i * 0x0E)
        local mapinfo = ffi.cast('mapinfo_t*', mapinfo_address)

        table.insert(entries, {
            address = mapinfo_address,
            ZoneId = mapinfo[0].ZoneId,
            FloorId = mapinfo[0].FloorId,
            FloorIndex = mapinfo[0].FloorIndex,
            Flags = mapinfo[0].Flags,
            Scale = mapinfo[0].Scale,
            KeyItemOffset = mapinfo[0].KeyItemOffset,
            Unknown0000 = mapinfo[0].Unknown0000,
            MapDatOffset = mapinfo[0].MapDatOffset,
            OffsetX = mapinfo[0].OffsetX,
            OffsetY = mapinfo[0].OffsetY,
        })
    end

    return {
        base_ptr = floorData.mapinfo_array_ptr,
        current_floor = currentFloorIndex,
        entries = entries,
    }
end

return player
