-- [[
--  OnMob Target Highlighter
--  Manages and displays visuals. Arc starts from player, beacon at target.
--  Version 2.6.4 - Player-Dynamic Arc Start
-- ]]

addon.name    = 'OnMob'
addon.author  = 'Oxos'
addon.version = '1'
addon.desc    = 'Arcing beam starts from player to target. Beacon at target. Includes /OnMob_getpos.'

require('common')

local imgui = require('imgui')
local ffi = require('ffi')
local d3d = require('d3d8')

-- Required local modules
local helpers = require('util.helpers')
if not helpers then
    error("[" .. addon.name .. "] helpers.lua is missing.")
end

local drawArcModule = require('util.drawArc')
if not drawArcModule then
    error("[" .. addon.name .. "] drawArc.lua is missing. Ensure it and Bezier3D_2.lua are present.")
end

----------------------------------------------------------------------------------------------------
-- Configuration & Data
----------------------------------------------------------------------------------------------------
-- Global Default Settings
local DEFAULT_USE_VERTICAL_BEACON = false
local DEFAULT_BEACON_HEIGHT = 15.0
local DEFAULT_BEACON_BASE_Y_OFFSET = 0.0
-- DEFAULT_ARC_START_X, Y, Z are removed as arc now starts from player.
local DEFAULT_TARGET_X = 94.0 
local DEFAULT_TARGET_Y = -30.0 -- Default Y (Height) for target
local DEFAULT_TARGET_Z = -66.0 -- Default Z (Depth) for target

-- Beam Visuals Configuration
local BEAM_BASE_COLOR_R, BEAM_BASE_COLOR_G, BEAM_BASE_COLOR_B = 1.0, 1.0, 0.0 -- Yellow base
local BEAM_MIN_ALPHA = 0.4
local BEAM_MAX_ALPHA = 0.9
local BEAM_PULSE_SPEED = 2.0
local BEAM_APPEAR_DURATION = 3 

local ENABLE_VERBOSE_DEBUG = true
local DEBUG_PRINT_INTERVAL = 10
local lastDebugPrintTime = 0

-- Runtime State
local currentActiveTargetKey = nil
local currentActualNPCName = nil -- Name of the game NPC found that matches the trigger
local beamAppearProgress = 0.0
local lastFrameTime = os.clock()
local ARGB_BEAM_COLOR

-- Player position (updated each frame)
local playerPosX, playerPosY_height, playerPosZ_depth = 0,0,0

-- Hardcoded Data for NPC/Target positions and settings
local npc_target_data = {
    ["Conrad"] = { 
        target_x = 94.0, target_y = -16.0, target_z = -66.0, 
        -- arc_start_x = 95.0, arc_start_y = -1.0, arc_start_z = -66.0, -- Deprecated for arc mode (starts from player)
        trigger_npc_name = "Conrad", 
        use_beacon = true,          
        beacon_height = 15.0, -- User value
    },
    ["Naji"] = { 
        target_x = 67.0, target_y = -30.0, target_z = -4.60, -- User value
        -- arc_start_x = 67.0, arc_start_y = -14.0, arc_start_z = -4.60, -- Deprecated
        trigger_npc_name = "Naji",    
        use_beacon = true,
         beacon_height = 15.0, -- Example, will use DEFAULT_BEACON_HEIGHT if not set
    },
    ["Malduc"] = { 
        target_x = 66.0, target_y = -30.0, target_z = 4.50, -- User value
        -- arc_start_x = 67.0, arc_start_y = -14.0, arc_start_z = 4.50, -- Deprecated
        trigger_npc_name = "Malduc",    
        use_beacon = true,
    },
    ["Presidents_Office"] = { 
        target_x = 93.0, target_y = -36.0, target_z = -0.20, -- User value
        -- arc_start_x = 93.0, arc_start_y = -22.0, arc_start_z = -0.20, -- Deprecated
        trigger_npc_name = "Iron Eater", -- User value   
        use_beacon = true,
    },
    ["Kaela"] = { 
        target_x = 40.5, target_y = -30.0, target_z = 16.1, -- User value
        -- arc_start_x = 40.5, arc_start_y = -14.0, arc_start_z = 16.1, -- Deprecated
        trigger_npc_name = "Kaela",    
        use_beacon = false,
    },
    ["Phara"] = { 
        target_x = 75.0, target_y = -16.0, target_z = -82.0,
        -- arc_start_x = 75.0, arc_start_y = -1.0, arc_start_z = -82.0, -- Deprecated
        trigger_npc_name = "Phara",
        use_beacon = true,  
    },
    ["ZoneExit"] = { 
        target_x = 10.0, target_y = 0.0, target_z = 10.0,
        trigger_npc_name = "", 
        use_beacon = true,
        beacon_height = 5.0,
        beacon_base_y_offset = 0.5,
    }
}


local function calculateDynamicColor()
    local time = os.clock()
    local pulse = (math.sin(time * BEAM_PULSE_SPEED) + 1) / 2
    local currentAlpha = BEAM_MIN_ALPHA + pulse * (BEAM_MAX_ALPHA - BEAM_MIN_ALPHA)
    local A_int = math.floor(currentAlpha * 255)
    local R_int = math.floor(BEAM_BASE_COLOR_R * 255)
    local G_int = math.floor(BEAM_BASE_COLOR_G * 255)
    local B_int = math.floor(BEAM_BASE_COLOR_B * 255)
    ARGB_BEAM_COLOR = bit.bor(bit.lshift(A_int, 24), bit.lshift(R_int, 16), bit.lshift(G_int, 8), B_int)
end

local function updatePlayerPosition(mem)
    if not mem then return false end
    local party = mem:GetParty()
    local entityMgr = mem:GetEntity()

    if not party or not entityMgr then return false end

    local playerIndex = party:GetMemberTargetIndex(0) 
    local pActorPointer = 0

    if playerIndex == 0xFFFF or playerIndex == nil then 
        local player = mem:GetPlayer()
        if player and player:GetActorPointer() ~= 0 then
             pActorPointer = player:GetActorPointer()
        else return false
        end
    else
        pActorPointer = entityMgr:GetActorPointer(playerIndex)
    end

    if pActorPointer == 0 then return false end

    playerPosX = ashita.memory.read_float(pActorPointer + 0x678)
    playerPosZ_depth = ashita.memory.read_float(pActorPointer + 0x67C)
    playerPosY_height = ashita.memory.read_float(pActorPointer + 0x680)
    return true
end


----------------------------------------------------------------------------------------------------
-- Addon Load
----------------------------------------------------------------------------------------------------
ashita.events.register('load', 'load_cb', function()
    print(string.format("[%s] v%s loaded. %d targets defined in script. Current active target: %s", addon.name, addon.version, table.count(npc_target_data), currentActiveTargetKey or "None"))
    if ENABLE_VERBOSE_DEBUG then
        print(string.format("[%s] Global Defaults: BeaconMode=%s, BeaconHeight=%.1f", addon.name, tostring(DEFAULT_USE_VERTICAL_BEACON), DEFAULT_BEACON_HEIGHT))
    end
end)

----------------------------------------------------------------------------------------------------
-- Ashita Event: Direct3D Present (Main Render Loop)
----------------------------------------------------------------------------------------------------
ashita.events.register('d3d_present', 'present_cb', function()
    local systemCurrentTime = os.time()
    local frameCurrentTime = os.clock()
    local deltaTime = frameCurrentTime - lastFrameTime
    lastFrameTime = frameCurrentTime
    local shouldPrintDebugNow = false

    if ENABLE_VERBOSE_DEBUG then
        if (systemCurrentTime - lastDebugPrintTime) >= DEBUG_PRINT_INTERVAL then
            shouldPrintDebugNow = true
            lastDebugPrintTime = systemCurrentTime
        end
    end

    local memManager = AshitaCore:GetMemoryManager()
    if not memManager then
        if shouldPrintDebugNow then print("["..addon.name.."] MemoryManager not ready.") end
        return
    end

    -- Update player's current position
    if not updatePlayerPosition(memManager) then
        if shouldPrintDebugNow then print("["..addon.name.."] Could not update player position for dynamic arc start.") end
        -- Decide if you want to return or use a default player pos if it fails. For now, arc might look odd.
    end

    if not currentActiveTargetKey or not npc_target_data[currentActiveTargetKey] then
        if shouldPrintDebugNow and currentActiveTargetKey then
            print(string.format("[%s Debug] Active target key '%s' has no data. Nothing to draw.", addon.name, currentActiveTargetKey))
        end
        return 
    end

    local targetData = npc_target_data[currentActiveTargetKey]
    
    local npcNameToActuallyFindInGame
    if targetData.trigger_npc_name == "" then 
        npcNameToActuallyFindInGame = "" 
    elseif targetData.trigger_npc_name then
        npcNameToActuallyFindInGame = targetData.trigger_npc_name
    else
        npcNameToActuallyFindInGame = currentActiveTargetKey 
    end

    local npcFoundThisFrame = false
    local foundNpcObjectName = nil

    if npcNameToActuallyFindInGame and npcNameToActuallyFindInGame ~= "" then
        for i = 0, 1023 do
            local entity = GetEntity(i) 
            if entity and entity.Name and entity.Name == npcNameToActuallyFindInGame then
                npcFoundThisFrame = true
                foundNpcObjectName = entity.Name
                if currentActualNPCName ~= foundNpcObjectName then
                    if shouldPrintDebugNow then print(string.format("[%s Debug] Game NPC '%s' for target '%s' acquired/changed. Resetting animation.", addon.name, foundNpcObjectName, currentActiveTargetKey)) end
                    currentActualNPCName = foundNpcObjectName
                    beamAppearProgress = 0.0
                end
                if shouldPrintDebugNow then print(string.format("[%s Debug] Game NPC Trigger Found: %s (Index: %d) for TargetKey: %s", addon.name, entity.Name, i, currentActiveTargetKey)) end
                break
            end
        end
    else
        npcFoundThisFrame = true 
        if currentActualNPCName ~= "__NO_NPC_TRIGGER__" then
             if shouldPrintDebugNow then print(string.format("[%s Debug] Target '%s' has no specific NPC trigger or uses key as non-trigger. Activating. Resetting animation.", addon.name, currentActiveTargetKey)) end
            currentActualNPCName = "__NO_NPC_TRIGGER__"
            beamAppearProgress = 0.0
        end
    end

    if npcNameToActuallyFindInGame and npcNameToActuallyFindInGame ~= "" and not npcFoundThisFrame and currentActualNPCName == npcNameToActuallyFindInGame then
        if shouldPrintDebugNow then print(string.format("[%s Debug] Previously tracked game NPC '%s' for target '%s' lost.", addon.name, npcNameToActuallyFindInGame, currentActiveTargetKey)) end
        currentActualNPCName = nil 
    end
    
    local drawActive = npcFoundThisFrame 

    if drawActive then
        local useBeacon = targetData.use_beacon
        if useBeacon == nil then useBeacon = DEFAULT_USE_VERTICAL_BEACON end 

        local beaconHeight = targetData.beacon_height or DEFAULT_BEACON_HEIGHT
        local beaconBaseYOffset = targetData.beacon_base_y_offset or DEFAULT_BEACON_BASE_Y_OFFSET
        
        local effectiveTargetX = targetData.target_x or DEFAULT_TARGET_X
        local effectiveTargetY_height = targetData.target_y or DEFAULT_TARGET_Y 
        local effectiveTargetZ_depth = targetData.target_z or DEFAULT_TARGET_Z   

        local visualStartX, visualStartY_height, visualStartZ_depth
        local visualEndX, visualEndY_height, visualEndZ_depth

        if useBeacon then
            -- Beacon is always at the target location
            visualStartX = effectiveTargetX
            visualStartY_height = effectiveTargetY_height + beaconBaseYOffset      
            visualStartZ_depth = effectiveTargetZ_depth                           
            
            visualEndX = effectiveTargetX
            visualEndY_height = effectiveTargetY_height + beaconBaseYOffset + beaconHeight 
            visualEndZ_depth = effectiveTargetZ_depth                             
        else
            -- Arcing beam starts from player's current position
            visualStartX = playerPosX
            visualStartY_height = playerPosY_height 
            visualStartZ_depth = playerPosZ_depth  
            
            visualEndX = effectiveTargetX
            visualEndY_height = effectiveTargetY_height                           
            visualEndZ_depth = effectiveTargetZ_depth                             
        end

        if beamAppearProgress < 1.0 then
            beamAppearProgress = beamAppearProgress + (deltaTime / BEAM_APPEAR_DURATION)
            if beamAppearProgress > 1.0 then beamAppearProgress = 1.0 end
        end
        calculateDynamicColor()

        if shouldPrintDebugNow then
            local type = useBeacon and "Beacon" or "Arc"
            print(string.format("[%s Debug] Drawing %s for '%s'. Start(X:%.1f YH:%.1f ZD:%.1f) End(X:%.1f YH:%.1f ZD:%.1f) Prog:%.2f", addon.name, type, currentActiveTargetKey, visualStartX, visualStartY_height, visualStartZ_depth, visualEndX, visualEndY_height, visualEndZ_depth, beamAppearProgress))
        end
        drawArcModule(visualStartX, visualStartZ_depth, visualStartY_height, visualEndX, visualEndZ_depth, visualEndY_height, ARGB_BEAM_COLOR, beamAppearProgress, true)
    end
end)

----------------------------------------------------------------------------------------------------
-- Commands
----------------------------------------------------------------------------------------------------
ashita.events.register('command', 'command_cb', function(e)
    local args = e.command:args()
    if not args[1] then return false end
    
    local command_base = args[1]:gsub("^/", ""):lower() 

    if command_base == 'onmob_target' then
        if args[2] then
            local targetKey = args[2] 
            if npc_target_data[targetKey] then
                currentActiveTargetKey = targetKey
                currentActualNPCName = nil 
                beamAppearProgress = 0.0
                print(string.format("[%s] Active target set to: '%s'.", addon.name, targetKey))
            else
                print(string.format("[%s] Error: Target key '%s' not found. Use /OnMob_list to see available keys.", addon.name, targetKey))
            end
        else
            currentActiveTargetKey = nil 
            currentActualNPCName = nil
            beamAppearProgress = 0.0
            print(string.format("[%s] Active target cleared.", addon.name))
        end
        e.blocked = true
        return true

    elseif command_base == 'onmob_list' then
        if table.count(npc_target_data) == 0 then
            print(string.format("[%s] No targets defined in script.", addon.name))
        else
            print(string.format("[%s] Defined Targets:", addon.name))
            for key, data in pairs(npc_target_data) do
                local posY_H = data.target_y or -1 
                local posZ_D = data.target_z or -1
                local posStr = string.format("Pos(X:%.1f YH:%.1f ZD:%.1f)", data.target_x or -1, posY_H, posZ_D)
                
                local triggerInfo
                if data.trigger_npc_name == "" then
                    triggerInfo = "Trigger:Always(if key selected)"
                elseif data.trigger_npc_name then
                    triggerInfo = string.format("TriggerNPC:%s", data.trigger_npc_name)
                else
                    triggerInfo = string.format("TriggerNPC:%s (defaulting to key)", key)
                end
                local useBeacon = data.use_beacon
                if useBeacon == nil then useBeacon = DEFAULT_USE_VERTICAL_BEACON end
                local modeStr = useBeacon and "Beacon" or "Arc"
                
                -- Note: arc_start is no longer used from data for arc mode, starts from player
                local arcStartInfo = ""
                if not useBeacon then arcStartInfo = " (Arc starts from player)" end

                print(string.format("  - %s: %s, %s, Mode:%s%s", key, posStr, triggerInfo, modeStr, arcStartInfo))
            end
        end
        e.blocked = true
        return true
        
    elseif command_base == 'onmob_mode' then
        if args[2] and args[2]:lower() == "beacon" then
            DEFAULT_USE_VERTICAL_BEACON = true
        elseif args[2] and args[2]:lower() == "arc" then
            DEFAULT_USE_VERTICAL_BEACON = false
        else
            DEFAULT_USE_VERTICAL_BEACON = not DEFAULT_USE_VERTICAL_BEACON
        end
        print(string.format("[%s] Global Default visual mode set to: %s.", addon.name, DEFAULT_USE_VERTICAL_BEACON and "Vertical Beacon" or "Arcing Beam"))
        beamAppearProgress = 0.0 
        e.blocked = true
        return true

    elseif command_base == 'onmob_getpos' then
        local mem = AshitaCore:GetMemoryManager()
        if not mem then
            print(string.format("[%s] MemoryManager not available for getpos.", addon.name))
            e.blocked = true; return true
        end
        
        if updatePlayerPosition(mem) then
            print(string.format("[%s] Player Position: X: %.2f, Y (Height): %.2f, Z (Depth): %.2f", addon.name, playerPosX, playerPosY_height, playerPosZ_depth))
            print(string.format("[%s] For npc_target_data: target_x = %.1f, target_y = %.1f, target_z = %.1f,", addon.name, playerPosX, playerPosY_height, playerPosZ_depth))
        else
            print(string.format("[%s] Failed to get player position.", addon.name))
        end
        e.blocked = true
        return true
    end
    return false
end)

ashita.events.register('unload', 'unload_cb', function()
    print(string.format("[%s] Unloaded.", addon.name))
end)
