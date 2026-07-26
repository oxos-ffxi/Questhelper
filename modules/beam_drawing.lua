-- Beam drawing module - Handles 3D beam/arc rendering and quest icons
local beam_drawing = {}

local ffi      = require('ffi')
local bit      = require('bit')
local d3d      = require('d3d8')
local ui_debug = require('modules.ui_debug')
local d3d8dev = d3d.get_device()
local C = ffi.C

-- Beam Visuals Configuration
beam_drawing.BEAM_BASE_COLOR_R = 1.0
beam_drawing.BEAM_BASE_COLOR_G = 1.0
beam_drawing.BEAM_BASE_COLOR_B = 0.0 -- Yellow base
beam_drawing.BEAM_MIN_ALPHA = 0.4
beam_drawing.BEAM_MAX_ALPHA = 0.9
beam_drawing.BEAM_PULSE_SPEED = 2.0
beam_drawing.BEAM_APPEAR_DURATION = 3

-- Runtime state
beam_drawing.beamAppearProgress = 0.0
beam_drawing.ARGB_BEAM_COLOR = 0

-- Player Arc Start Offsets
beam_drawing.PLAYER_ARC_START_X_OFFSET = 0
beam_drawing.PLAYER_ARC_START_Z_OFFSET = 0

-- Race-based height offsets for beam start position (aiming for head level)
-- FFXI Race IDs: 1=Hume M, 2=Hume F, 3=Elvaan M, 4=Elvaan F, 5=Taru M, 6=Taru F, 7=Mithra, 8=Galka
beam_drawing.RACE_HEIGHT_OFFSETS = {
    [0] = -1.8,   -- Default/Unknown
    [1] = -1.8,   -- Hume Male
    [2] = -1.8,   -- Hume Female (slightly shorter)
    [3] = -2.2,   -- Elvaan Male (taller)
    [4] = -2.1,   -- Elvaan Female
    [5] = -0.8,   -- Tarutaru Male (shortest)
    [6] = -0.8,   -- Tarutaru Female (shortest)
    [7] = -1.5,   -- Mithra
    [8] = -2.3,   -- Galka (tallest)
}

-- Gets the appropriate height offset for the player's race
function beam_drawing.getPlayerHeightOffset(dev_mode)
    local playerEntity = GetPlayerEntity()
    if playerEntity then
        -- Try different possible race property names
        local race = playerEntity.Race or (playerEntity.GetRace and playerEntity:GetRace()) or playerEntity.race

        if race then
            local offset = beam_drawing.RACE_HEIGHT_OFFSETS[race] or beam_drawing.RACE_HEIGHT_OFFSETS[0]
            -- Debug output (only print occasionally to avoid spam)
            if dev_mode and math.random() < 0.001 then  -- Print ~0.1% of the time
                ui_debug.addLine(string.format("[QH Debug] Race: %d, Height Offset: %.2f", race, offset))
            end
            return offset
        end
    end
    -- Fallback to default if we can't get race
    return beam_drawing.RACE_HEIGHT_OFFSETS[0]
end

-- FFI definition for 2D icon vertices
ffi.cdef [[
    #pragma pack(1)
    struct IconVertFormat
    {
        float x;
        float y;
        float z;
        float rhw;
        unsigned int diffuse;
        float u;
        float v;
    };
]]
local iconVertFormatMask = bit.bor(C.D3DFVF_XYZRHW, C.D3DFVF_DIFFUSE, C.D3DFVF_TEX1)
local iconVertSize = ffi.sizeof('struct IconVertFormat')

-- Calculates dynamic beam color with pulsing alpha
function beam_drawing.calculateDynamicColor()
    local time = os.clock()
    local pulse = (math.sin(time * beam_drawing.BEAM_PULSE_SPEED) + 1) / 2
    local currentAlpha = beam_drawing.BEAM_MIN_ALPHA + pulse * (beam_drawing.BEAM_MAX_ALPHA - beam_drawing.BEAM_MIN_ALPHA)
    local A_int = math.floor(currentAlpha * 255)
    local R_int = math.floor(beam_drawing.BEAM_BASE_COLOR_R * 255)
    local G_int = math.floor(beam_drawing.BEAM_BASE_COLOR_G * 255)
    local B_int = math.floor(beam_drawing.BEAM_BASE_COLOR_B * 255)
    beam_drawing.ARGB_BEAM_COLOR = bit.bor(bit.lshift(A_int, 24), bit.lshift(R_int, 16), bit.lshift(G_int, 8), B_int)
end

-- Converts color name to ARGB format
function beam_drawing.colorNameToARGB(color_name, alpha)
    alpha = alpha or 0.7  -- Default alpha
    local A_int = math.floor(alpha * 255)

    -- Color name mapping (R, G, B as 0-1 values)
    local colors = {
        yellow = {1.0, 1.0, 0.0},
        green = {0.0, 1.0, 0.0},
        red = {1.0, 0.0, 0.0},
        blue = {0.0, 0.0, 1.0},
        white = {1.0, 1.0, 1.0},
        cyan = {0.0, 1.0, 1.0},
        magenta = {1.0, 0.0, 1.0},
        orange = {1.0, 0.5, 0.0},
        purple = {0.5, 0.0, 1.0},
        pink = {1.0, 0.5, 0.5},
        black = {0.0, 0.0, 0.0},
    }

    local color = colors[string.lower(color_name or "")] or colors.yellow
    local R_int = math.floor(color[1] * 255)
    local G_int = math.floor(color[2] * 255)
    local B_int = math.floor(color[3] * 255)

    return bit.bor(bit.lshift(A_int, 24), bit.lshift(R_int, 16), bit.lshift(G_int, 8), B_int)
end

-- Updates beam appear progress animation
function beam_drawing.updateBeamProgress(deltaTime)
    if beam_drawing.beamAppearProgress < 1.0 then
        beam_drawing.beamAppearProgress = beam_drawing.beamAppearProgress + (deltaTime / beam_drawing.BEAM_APPEAR_DURATION)
        if beam_drawing.beamAppearProgress > 1.0 then
            beam_drawing.beamAppearProgress = 1.0
        end
    end
end

-- Draws a 2D quest icon at specified screen position
function beam_drawing.drawQuestIcon(x, y, z, rhw, size, color, questIconTexture)
    if not questIconTexture then return end

    local halfSize = size * 0.5
    local x1, y1 = x - halfSize, y - halfSize
    local x2, y2 = x + halfSize, y + halfSize

    -- Create a 4-vertex quad
    local vertices = ffi.new('struct IconVertFormat[4]', {
        { x1, y1, z, rhw, color, 0, 0 }, -- Top-left
        { x2, y1, z, rhw, color, 1, 0 }, -- Top-right
        { x1, y2, z, rhw, color, 0, 1 }, -- Bottom-left
        { x2, y2, z, rhw, color, 1, 1 }  -- Bottom-right
    })

    -- Set device states for 2D texture drawing
    d3d8dev:SetStreamSource(0, nil, 0) -- Unbind any existing buffer
    d3d8dev:SetVertexShader(iconVertFormatMask)
    d3d8dev:SetTexture(0, questIconTexture)

    -- Standard alpha blending
    d3d8dev:SetRenderState(C.D3DRS_ZENABLE, 0) -- No Z-buffer
    d3d8dev:SetRenderState(C.D3DRS_ALPHABLENDENABLE, 1)
    d3d8dev:SetRenderState(C.D3DRS_SRCBLEND, C.D3DBLEND_SRCALPHA)
    d3d8dev:SetRenderState(C.D3DRS_DESTBLEND, C.D3DBLEND_INVSRCALPHA)

    -- Modulate texture color with vertex color (for tinting/alpha)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_COLOROP, C.D3DTOP_MODULATE)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_COLORARG1, C.D3DTA_TEXTURE)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_COLORARG2, C.D3DTA_DIFFUSE)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_ALPHAOP, C.D3DTOP_MODULATE)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_ALPHAARG1, C.D3DTA_TEXTURE)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_ALPHAARG2, C.D3DTA_DIFFUSE)

    -- Draw the quad
    d3d8dev:DrawPrimitiveUP(C.D3DPT_TRIANGLESTRIP, 2, vertices, iconVertSize)
end

-- Draws beams to all active targets for current quest step
function beam_drawing.drawBeamsToTargets(targetsToDraw, playerPosX, playerPosZ_depth, playerPosY_height,
                                         memManager, drawArcModule, questIconTexture, helpers,
                                         shouldPrintDebug, addon_name)
    for _, targetData in ipairs(targetsToDraw) do
        local drawActive = false
        local liveNpcPos = nil
        if targetData then
            local npcNameToActuallyFindInGame = targetData.trigger_npc

            if not npcNameToActuallyFindInGame or npcNameToActuallyFindInGame == "" then
                drawActive = true
            else
                local npcFoundThisFrame = false
                if memManager then
                    for i = 0, 1023 do
                        local entity = GetEntity(i)
                        if entity and entity.Name and entity.Name == npcNameToActuallyFindInGame then
                            npcFoundThisFrame = true
                            if targetData.dynamic_pos then
                                if entity.Movement and entity.Movement.LocalPosition then
                                    local p = entity.Movement.LocalPosition
                                    -- Match target_pos convention: .y = game Z (north-south), .z = game Y (height)
                                    liveNpcPos = { x = p.X, y = p.Z, z = p.Y }
                                elseif entity.X then
                                    liveNpcPos = { x = entity.X, y = entity.Z, z = entity.Y }
                                end
                            end
                            break
                        end
                    end
                end
                if npcFoundThisFrame then
                    drawActive = true
                end
            end
        end

        if drawActive then
            local effectiveTargetX = 0.0
            local effectiveTargetY_height = 0.0
            local effectiveTargetZ_depth = 0.0

            if liveNpcPos then
                effectiveTargetX = liveNpcPos.x
                effectiveTargetY_height = liveNpcPos.y + (targetData.y_offset or 0)
                effectiveTargetZ_depth = liveNpcPos.z
            elseif targetData.target_pos and type(targetData.target_pos) == 'table' then
                effectiveTargetX = targetData.target_pos.x or 0.0
                effectiveTargetY_height = targetData.target_pos.y or 0.0
                effectiveTargetZ_depth = targetData.target_pos.z or 0.0
            else
                if shouldPrintDebug then
                    ui_debug.addLine(string.format("[%s Debug] Error: Location data for target is missing 'target_pos' table.", addon_name))
                end
            end

            local visualStartX, visualStartY_height, visualStartZ_depth
            local visualEndX, visualEndY_height, visualEndZ_depth

            -- Get race-based height offset
            local heightOffset = beam_drawing.getPlayerHeightOffset(shouldPrintDebug)

            visualStartX = playerPosX + beam_drawing.PLAYER_ARC_START_X_OFFSET
            visualStartY_height = playerPosZ_depth + heightOffset
            visualStartZ_depth = playerPosY_height + beam_drawing.PLAYER_ARC_START_Z_OFFSET

            visualEndX = effectiveTargetX
            visualEndY_height = effectiveTargetY_height
            visualEndZ_depth = effectiveTargetZ_depth

            beam_drawing.calculateDynamicColor()

            if not targetData.suppress_beam then
                drawArcModule(visualStartX, visualStartZ_depth, visualStartY_height,
                             visualEndX, visualEndZ_depth, visualEndY_height,
                             beam_drawing.ARGB_BEAM_COLOR, beam_drawing.beamAppearProgress, true)
            end

            -- Draw quest icon
            if questIconTexture then
                local _, view = d3d8dev:GetTransform(C.D3DTS_VIEW)
                local _, projection = d3d8dev:GetTransform(C.D3DTS_PROJECTION)

                local targetWorldX = effectiveTargetX
                local targetWorldY = effectiveTargetZ_depth
                local targetWorldZ = effectiveTargetY_height

                targetWorldZ = targetWorldZ - 0.5

                local sx, sy, sz = helpers.worldToScreen(targetWorldX, targetWorldZ, targetWorldY, view, projection)

                if sx and sz > 0 and sz < 1 then
                    beam_drawing.drawQuestIcon(sx, sy, 0.5, 1.0, 32, 0xFFFFFFFF, questIconTexture)
                end
            end
        end
    end
end

return beam_drawing
