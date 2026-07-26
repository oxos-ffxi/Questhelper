-- Map renderer module for drawing player markers on map images
local map_renderer = {}

local imgui = require('imgui')

-- Helper function to convert polar to cartesian with rotation
local function polarToXY(radius, angle)
    local x = radius * math.cos(angle - math.pi/2)
    local y = radius * math.sin(angle - math.pi/2)
    return x, y
end

-- Draws a rotating arrow at the player's position on the map
-- Parameters:
--   imageX, imageY: Top-left corner of the map image
--   w, h: Width and height of the map image (already scaled)
--   playerPosX, playerPosY_height: Player's world position
--   playerHeading: Player's heading in radians
--   calibration: Map calibration data {origin_x, origin_y, scale_x, scale_y}
function map_renderer.drawPlayerArrow(imageX, imageY, w, h, playerPosX, playerPosY_height, playerHeading, calibration)
    if not calibration then return end

    -- Calculate map scale from width (assumes base width of 512)
    local map_scale = w / 512

    -- 1. Map X (Left/Right) uses Player X
    -- Calibration values are for 512x512, so we need to scale them
    local relX = (playerPosX - calibration.origin_x) * calibration.scale_x * map_scale

    -- 2. Map Y (Up/Down)
    local relY = (playerPosY_height - calibration.origin_y) * calibration.scale_y * map_scale

    -- Check if marker is within bounds
    if relX >= 0 and relX <= w and relY >= 0 and relY <= h then
        local markerX = imageX + relX
        local markerY = imageY + relY

        -- Arrow size and angles (scaled with map)
        local arrowLength = 12 * map_scale
        local arrowWidth = 6 * map_scale
        local lookAngle = playerHeading + math.pi/2

        -- Calculate arrow tip (pointing forward)
        local tipX, tipY = polarToXY(arrowLength, lookAngle)

        -- Calculate base vertices (left and right wings)
        local leftX, leftY = polarToXY(arrowWidth, lookAngle + math.pi * 0.6)
        local rightX, rightY = polarToXY(arrowWidth, lookAngle - math.pi * 0.6)

        -- Get draw list
        local dl = imgui.GetWindowDrawList()

        -- Draw filled triangle (red arrow)
        dl:AddTriangleFilled(
            {markerX + tipX, markerY + tipY},    -- Tip
            {markerX + leftX, markerY + leftY},  -- Left wing
            {markerX + rightX, markerY + rightY}, -- Right wing
            0xFF0000FF -- Red
        )

        -- Draw black outline (scaled thickness)
        dl:AddTriangle(
            {markerX + tipX, markerY + tipY},
            {markerX + leftX, markerY + leftY},
            {markerX + rightX, markerY + rightY},
            0xFF000000, -- Black
            2.0 * map_scale -- Line thickness scaled with map
        )
    end
end

-- Named color presets for highlights (ImGui U32 ABGR format).
-- Each entry: fill (semi-transparent) + outline (opaque).
local HIGHLIGHT_COLORS = {
    green   = { fill = 0x5500FF00, outline = 0xFF00FF00 },
    yellow  = { fill = 0x5500FFFF, outline = 0xFF00FFFF },
    cyan    = { fill = 0x55FFFF00, outline = 0xFFFFFF00 },
    red     = { fill = 0x550000FF, outline = 0xFF0000FF },
    blue    = { fill = 0x55FF0000, outline = 0xFFFF0000 },
    magenta = { fill = 0x55FF00FF, outline = 0xFFFF00FF },
    orange  = { fill = 0x5500A5FF, outline = 0xFF00A5FF },
    white   = { fill = 0x55FFFFFF, outline = 0xFFFFFFFF },
}

-- Draws highlights on the map (grid-based positioning)
-- Parameters:
--   imageX, imageY: Top-left corner of the map image
--   w, h: Width and height of the map image (already scaled)
--   highlights: Array of highlight data {position, offsetX, offsetY, color}
--     color (optional): preset name ("yellow", "cyan", ...) or raw ABGR number.
--     Defaults to green when omitted.
function map_renderer.drawHighlights(imageX, imageY, w, h, highlights)
    if not highlights then return end

    -- Calculate map scale from width (assumes base width of 512)
    local map_scale = w / 512

    local drawList = imgui.GetWindowDrawList()

    for _, highlight in ipairs(highlights) do
        local letter, numStr = highlight.position:match("([A-Za-z])%-(%d+)")
        if letter and numStr then
            local colIndex = (letter:byte() - 65) + 1
            local rowIndex = tonumber(numStr)
            local cellW, cellH = w / 16, h / 16
            -- Scale offsets with map scale (offsets are defined for 512x512 maps)
            local offsetX = (highlight.offsetX or 0) * map_scale
            local offsetY = (highlight.offsetY or 0) * map_scale
            local centerX = imageX + (colIndex - 0.5) * cellW + offsetX
            local centerY = imageY + (rowIndex - 0.5) * cellH + offsetY
            -- Scale box size with map scale
            local halfBox = 16 * map_scale
            local x1, y1 = centerX - halfBox, centerY - halfBox
            local x2, y2 = centerX + halfBox, centerY + halfBox
            -- Resolve color: preset name, raw ABGR number, or default green.
            local colorFill, colorOutline = 0x5500FF00, 0xFFFFFFFF
            if type(highlight.color) == "string" then
                local preset = HIGHLIGHT_COLORS[highlight.color:lower()]
                if preset then
                    colorFill, colorOutline = preset.fill, preset.outline
                end
            elseif type(highlight.color) == "number" then
                colorFill = highlight.color
            end
            drawList:AddRectFilled({x1, y1}, {x2, y2}, colorFill)
            drawList:AddRect({x1, y1}, {x2, y2}, colorOutline)

            -- Draw label if provided (e.g., "1", "2" for ordering)
            if highlight.label then
                local labelText = tostring(highlight.label)
                local textColor = 0xFFFFFFFF  -- White text
                -- Center the text in the box
                local textX = centerX - 4 * map_scale  -- Approximate centering
                local textY = centerY - 6 * map_scale
                drawList:AddText({textX, textY}, textColor, labelText)
            end
        end
    end
end

return map_renderer
