--[[
    drawing.lua
    QuestHelper
]]

local helpers = require('util.helpers')

-- Create the module
local drawingModule = {}

local d3d8dev       = require('d3d8').get_device()
local ffi           = require('ffi')
local C             = ffi.C
local bit           = require('bit')

ffi.cdef[[
    #pragma pack(1)
    struct ArrowVertFormat {
        float x, y, z, rhw;
        unsigned int diffuse;
        float u, v;
    };
]]
local arrowVertSize   = ffi.sizeof('struct ArrowVertFormat')

local ARROW_VERTEX_FORMAT = bit.bor(C.D3DFVF_XYZRHW, C.D3DFVF_DIFFUSE, C.D3DFVF_TEX1)

local arrowBeamTex
local squareBeamTex
local function drawLine(start_pos, end_pos, color)
    local _, view = d3d8dev:GetTransform(C.D3DTS_VIEW)
    local _, projection = d3d8dev:GetTransform(C.D3DTS_PROJECTION)

    local sx1, sy1, sz1 = helpers.worldToScreen(start_pos.x, start_pos.y, start_pos.z, view, projection)
    local sx2, sy2, sz2 = helpers.worldToScreen(end_pos.x, end_pos.y, end_pos.z, view, projection)

    if sz1 < 0 or sz1 > 1 or sz2 < 0 or sz2 > 1 then return end

    local dx = sx2 - sx1
    local dy = sy2 - sy1
    local len = math.sqrt(dx*dx + dy*dy)
    if len < 0.001 then return end

    local lineWidth = 1
    local nx = (-dy / len) * lineWidth
    local ny = ( dx / len) * lineWidth

    arrowBeamTex = arrowBeamTex or helpers.getTexture(addon.path .. 'assets/beam.png')

    local verts = ffi.new('struct ArrowVertFormat[4]', {
        { sx1 + nx, sy1 + ny, 0.5, 1.0, color, 0, 0   },
        { sx1 - nx, sy1 - ny, 0.5, 1.0, color, 0, 0.5 },
        { sx2 + nx, sy2 + ny, 0.5, 1.0, color, 1, 0   },
        { sx2 - nx, sy2 - ny, 0.5, 1.0, color, 1, 0.5 },
    })

    d3d8dev:SetStreamSource(0, nil, 0)
    d3d8dev:SetVertexShader(ARROW_VERTEX_FORMAT)
    d3d8dev:SetRenderState(C.D3DRS_ZENABLE, 0)
    d3d8dev:SetRenderState(C.D3DRS_ALPHABLENDENABLE, 1)
    d3d8dev:SetRenderState(C.D3DRS_SRCBLEND, C.D3DBLEND_SRCALPHA)
    d3d8dev:SetRenderState(C.D3DRS_DESTBLEND, C.D3DBLEND_INVSRCALPHA)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_COLOROP,   C.D3DTOP_BLENDTEXTUREALPHA)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_COLORARG1, C.D3DTA_TEXTURE)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_COLORARG2, C.D3DTA_DIFFUSE)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_ALPHAOP,   C.D3DTOP_SELECTARG1)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_ALPHAARG1, C.D3DTA_TEXTURE)
    d3d8dev:SetTexture(0, arrowBeamTex)

    d3d8dev:DrawPrimitiveUP(C.D3DPT_TRIANGLESTRIP, 2, verts, arrowVertSize)
end

function drawingModule.drawSquare(center, size, color, options)
    local _, view = d3d8dev:GetTransform(C.D3DTS_VIEW)
    local _, projection = d3d8dev:GetTransform(C.D3DTS_PROJECTION)

    local h = size / 2
    local corners
    if options and options.vertical then
        if options.vertical_axis == 'z' then
            -- Upright square facing E/W: varies Z and Y (elevation), X fixed.
            corners = {
                {x = center.x, y = center.y - h, z = center.z - h},
                {x = center.x, y = center.y - h, z = center.z + h},
                {x = center.x, y = center.y + h, z = center.z + h},
                {x = center.x, y = center.y + h, z = center.z - h},
            }
        elseif options.vertical_axis == 'ne' then
            -- Upright square facing NE/SW: spans NW/SE direction and Y.
            local d = h / math.sqrt(2)
            corners = {
                {x = center.x - d, y = center.y - h, z = center.z + d},
                {x = center.x + d, y = center.y - h, z = center.z - d},
                {x = center.x + d, y = center.y + h, z = center.z - d},
                {x = center.x - d, y = center.y + h, z = center.z + d},
            }
        elseif options.vertical_axis == 'nw' then
            -- Upright square facing NW/SE: spans NE/SW direction and Y.
            local d = h / math.sqrt(2)
            corners = {
                {x = center.x - d, y = center.y - h, z = center.z - d},
                {x = center.x + d, y = center.y - h, z = center.z + d},
                {x = center.x + d, y = center.y + h, z = center.z + d},
                {x = center.x - d, y = center.y + h, z = center.z - d},
            }
        else
            -- Upright square facing N/S: varies X and Y (elevation), Z fixed.
            corners = {
                {x = center.x - h, y = center.y - h, z = center.z},
                {x = center.x + h, y = center.y - h, z = center.z},
                {x = center.x + h, y = center.y + h, z = center.z},
                {x = center.x - h, y = center.y + h, z = center.z},
            }
        end
    else
        corners = {
            {x = center.x - h, y = center.y, z = center.z - h},
            {x = center.x + h, y = center.y, z = center.z - h},
            {x = center.x + h, y = center.y, z = center.z + h},
            {x = center.x - h, y = center.y, z = center.z + h},
        }
    end

    local sx, sy, sz = {}, {}, {}
    for i, c in ipairs(corners) do
        sx[i], sy[i], sz[i] = helpers.worldToScreen(c.x, c.y, c.z, view, projection)
    end

    squareBeamTex = squareBeamTex or helpers.getTexture(addon.path .. 'assets/beam.png')

    d3d8dev:SetStreamSource(0, nil, 0)
    d3d8dev:SetVertexShader(ARROW_VERTEX_FORMAT)
    d3d8dev:SetRenderState(C.D3DRS_ZENABLE, 0)
    d3d8dev:SetRenderState(C.D3DRS_ALPHABLENDENABLE, 1)
    d3d8dev:SetRenderState(C.D3DRS_SRCBLEND, C.D3DBLEND_SRCALPHA)
    d3d8dev:SetRenderState(C.D3DRS_DESTBLEND, C.D3DBLEND_INVSRCALPHA)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_COLOROP,   C.D3DTOP_BLENDTEXTUREALPHA)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_COLORARG1, C.D3DTA_TEXTURE)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_COLORARG2, C.D3DTA_DIFFUSE)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_ALPHAOP,   C.D3DTOP_SELECTARG1)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_ALPHAARG1, C.D3DTA_TEXTURE)
    d3d8dev:SetTexture(0, squareBeamTex)

    local lineWidth = 2
    local sides = {{1,2},{2,3},{3,4},{4,1}}
    for _, s in ipairs(sides) do
        local a, b = s[1], s[2]
        if sz[a] >= 0 and sz[a] <= 1 and sz[b] >= 0 and sz[b] <= 1 then
            local dx = sx[b] - sx[a]
            local dy = sy[b] - sy[a]
            local qlen = math.sqrt(dx*dx + dy*dy)
            if qlen >= 0.001 then
                local nx = (-dy / qlen) * lineWidth
                local ny = ( dx / qlen) * lineWidth
                local verts = ffi.new('struct ArrowVertFormat[4]', {
                    { sx[a] + nx, sy[a] + ny, 0.5, 1.0, color, 0, 0   },
                    { sx[a] - nx, sy[a] - ny, 0.5, 1.0, color, 0, 0.5 },
                    { sx[b] + nx, sy[b] + ny, 0.5, 1.0, color, 1, 0   },
                    { sx[b] - nx, sy[b] - ny, 0.5, 1.0, color, 1, 0.5 },
                })
                d3d8dev:DrawPrimitiveUP(C.D3DPT_TRIANGLESTRIP, 2, verts, arrowVertSize)
            end
        end
    end
end

-- Base facing angle (degrees) for each vertical_axis preset. The wall's width
-- spans a horizontal direction (cos/sin of the angle in the X/Z plane); an
-- optional `rotation` (degrees) is added on top to fine-tune the fit.
local RECT_AXIS_ANGLE = { ns = 0, z = 90, ne = -45, nw = 45 }

-- Rectangle: flat on floor by default; pass vertical_axis to stand it upright.
-- Flat: width spans X, height spans Z. Vertical: width spans horizontal, height spans elevation.
-- options.rotation (optional, degrees): rotates a vertical wall around the Y axis,
--   added to the vertical_axis preset. Ignored for flat rectangles.
function drawingModule.drawRectangle(center, width, height, color, options)
    local _, view = d3d8dev:GetTransform(C.D3DTS_VIEW)
    local _, projection = d3d8dev:GetTransform(C.D3DTS_PROJECTION)

    local hw = width  / 2
    local hh = height / 2
    local axis = options and options.vertical_axis
    local corners
    if axis then
        -- Upright wall: width spans a horizontal direction, height spans elevation Y.
        local angle = (RECT_AXIS_ANGLE[axis] or 0) + (options.rotation or 0)
        local rad = math.rad(angle)
        local ox = hw * math.cos(rad)
        local oz = hw * math.sin(rad)
        corners = {
            {x = center.x - ox, y = center.y - hh, z = center.z - oz},
            {x = center.x + ox, y = center.y - hh, z = center.z + oz},
            {x = center.x + ox, y = center.y + hh, z = center.z + oz},
            {x = center.x - ox, y = center.y + hh, z = center.z - oz},
        }
    else
        -- Flat on floor: width spans X, height spans Z
        corners = {
            {x = center.x - hw, y = center.y, z = center.z - hh},
            {x = center.x + hw, y = center.y, z = center.z - hh},
            {x = center.x + hw, y = center.y, z = center.z + hh},
            {x = center.x - hw, y = center.y, z = center.z + hh},
        }
    end

    local sx, sy, sz = {}, {}, {}
    for i, c in ipairs(corners) do
        sx[i], sy[i], sz[i] = helpers.worldToScreen(c.x, c.y, c.z, view, projection)
    end

    squareBeamTex = squareBeamTex or helpers.getTexture(addon.path .. 'assets/beam.png')
    d3d8dev:SetStreamSource(0, nil, 0)
    d3d8dev:SetVertexShader(ARROW_VERTEX_FORMAT)
    d3d8dev:SetRenderState(C.D3DRS_ZENABLE, 0)
    d3d8dev:SetRenderState(C.D3DRS_ALPHABLENDENABLE, 1)
    d3d8dev:SetRenderState(C.D3DRS_SRCBLEND, C.D3DBLEND_SRCALPHA)
    d3d8dev:SetRenderState(C.D3DRS_DESTBLEND, C.D3DBLEND_INVSRCALPHA)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_COLOROP,   C.D3DTOP_BLENDTEXTUREALPHA)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_COLORARG1, C.D3DTA_TEXTURE)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_COLORARG2, C.D3DTA_DIFFUSE)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_ALPHAOP,   C.D3DTOP_SELECTARG1)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_ALPHAARG1, C.D3DTA_TEXTURE)
    d3d8dev:SetTexture(0, squareBeamTex)

    local lineWidth = 2
    for _, s in ipairs({{1,2},{2,3},{3,4},{4,1}}) do
        local a, b = s[1], s[2]
        if sz[a] >= 0 and sz[a] <= 1 and sz[b] >= 0 and sz[b] <= 1 then
            local dx = sx[b] - sx[a]
            local dy = sy[b] - sy[a]
            local qlen = math.sqrt(dx*dx + dy*dy)
            if qlen >= 0.001 then
                local nx = (-dy / qlen) * lineWidth
                local ny = ( dx / qlen) * lineWidth
                local verts = ffi.new('struct ArrowVertFormat[4]', {
                    { sx[a] + nx, sy[a] + ny, 0.5, 1.0, color, 0, 0   },
                    { sx[a] - nx, sy[a] - ny, 0.5, 1.0, color, 0, 0.5 },
                    { sx[b] + nx, sy[b] + ny, 0.5, 1.0, color, 1, 0   },
                    { sx[b] - nx, sy[b] - ny, 0.5, 1.0, color, 1, 0.5 },
                })
                d3d8dev:DrawPrimitiveUP(C.D3DPT_TRIANGLESTRIP, 2, verts, arrowVertSize)
            end
        end
    end
end

function drawingModule.drawLine(p1, p2, color)
    drawLine(p1, p2, color)
end

function drawingModule.drawLineWithArrow(p1, p2, color, head_size)
    local _, view = d3d8dev:GetTransform(C.D3DTS_VIEW)
    local _, projection = d3d8dev:GetTransform(C.D3DTS_PROJECTION)

    local sx1, sy1, sz1 = helpers.worldToScreen(p1.x, p1.y, p1.z, view, projection)
    local sx2, sy2, sz2 = helpers.worldToScreen(p2.x, p2.y, p2.z, view, projection)

    if sx1 == nil or sx2 == nil then return end
    if sz1 < 0 or sz1 > 1 or sz2 < 0 or sz2 > 1 then return end

    local dx = sx2 - sx1
    local dy = sy2 - sy1
    local len = math.sqrt(dx*dx + dy*dy)
    if len < 0.001 then return end

    local lineWidth = 4
    arrowBeamTex = arrowBeamTex or helpers.getTexture(addon.path .. 'assets/beam.png')

    d3d8dev:SetStreamSource(0, nil, 0)
    d3d8dev:SetVertexShader(ARROW_VERTEX_FORMAT)
    d3d8dev:SetRenderState(C.D3DRS_ZENABLE, 0)
    d3d8dev:SetRenderState(C.D3DRS_ALPHABLENDENABLE, 1)
    d3d8dev:SetRenderState(C.D3DRS_SRCBLEND, C.D3DBLEND_SRCALPHA)
    d3d8dev:SetRenderState(C.D3DRS_DESTBLEND, C.D3DBLEND_INVSRCALPHA)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_COLOROP,   C.D3DTOP_BLENDTEXTUREALPHA)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_COLORARG1, C.D3DTA_TEXTURE)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_COLORARG2, C.D3DTA_DIFFUSE)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_ALPHAOP,   C.D3DTOP_SELECTARG1)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_ALPHAARG1, C.D3DTA_TEXTURE)
    d3d8dev:SetTexture(0, arrowBeamTex)

    local function beamQuad(ax, ay, ex, ey)
        local bdx = ex - ax
        local bdy = ey - ay
        local blen = math.sqrt(bdx*bdx + bdy*bdy)
        if blen < 0.001 then return end
        local bnx = (-bdy / blen) * lineWidth
        local bny = ( bdx / blen) * lineWidth
        local verts = ffi.new('struct ArrowVertFormat[4]', {
            { ax + bnx, ay + bny, 0.5, 1.0, color, 0, 0   },
            { ax - bnx, ay - bny, 0.5, 1.0, color, 0, 0.5 },
            { ex + bnx, ey + bny, 0.5, 1.0, color, 1, 0   },
            { ex - bnx, ey - bny, 0.5, 1.0, color, 1, 0.5 },
        })
        d3d8dev:DrawPrimitiveUP(C.D3DPT_TRIANGLESTRIP, 2, verts, arrowVertSize)
    end

    beamQuad(sx1, sy1, sx2, sy2)

    -- Arrowhead wings in screen space
    local headLen = 20
    local fx, fy = dx / len, dy / len
    local px, py = -dy / len, dx / len
    beamQuad(sx2, sy2, sx2 - fx*headLen + px*headLen*0.5, sy2 - fy*headLen + py*headLen*0.5)
    beamQuad(sx2, sy2, sx2 - fx*headLen - px*headLen*0.5, sy2 - fy*headLen - py*headLen*0.5)
end

function drawingModule.drawArrow(center, size, direction, color, outline)
    -- direction can be: 'up', 'down', 'left', 'right', 'north', 'south', 'east', 'west'
    -- and diagonals: 'northeast', 'northwest', 'southeast', 'southwest', 'ne', 'nw', 'se', 'sw'
    -- outline: optional boolean, if true draws a black outline for better visibility
    -- Normalize direction to lowercase
    local dir = string.lower(direction or 'up')

    -- Arrow dimensions
    local head_length = size * 0.2
    local head_width = size * 0.25

    -- For diagonals, use sqrt(2) to maintain proper length
    local diagonal_factor = 0.707  -- 1/sqrt(2)

    local points = {}

    -- Define arrow points based on direction
    -- Arrow points up (north) by default
    if dir == 'up' or dir == 'north' then
        -- Tip of arrow (top/north)
        points.tip = {x = center.x, y = center.y, z = center.z + size/2}
        -- Base of shaft (bottom/south)
        points.base = {x = center.x, y = center.y, z = center.z - size/2}
        -- Left arrowhead
        points.left = {x = center.x - head_width/2, y = center.y, z = center.z + size/2 - head_length}
        -- Right arrowhead
        points.right = {x = center.x + head_width/2, y = center.y, z = center.z + size/2 - head_length}

    elseif dir == 'down' or dir == 'south' then
        -- Tip of arrow (bottom/south)
        points.tip = {x = center.x, y = center.y, z = center.z - size/2}
        -- Base of shaft (top/north)
        points.base = {x = center.x, y = center.y, z = center.z + size/2}
        -- Left arrowhead
        points.left = {x = center.x - head_width/2, y = center.y, z = center.z - size/2 + head_length}
        -- Right arrowhead
        points.right = {x = center.x + head_width/2, y = center.y, z = center.z - size/2 + head_length}

    elseif dir == 'left' or dir == 'west' then
        -- Tip of arrow (left)
        points.tip = {x = center.x - size/2, y = center.y, z = center.z}
        -- Base of shaft (right)
        points.base = {x = center.x + size/2, y = center.y, z = center.z}
        -- Top arrowhead
        points.left = {x = center.x - size/2 + head_length, y = center.y, z = center.z - head_width/2}
        -- Bottom arrowhead
        points.right = {x = center.x - size/2 + head_length, y = center.y, z = center.z + head_width/2}

    elseif dir == 'right' or dir == 'east' then
        -- Tip of arrow (right)
        points.tip = {x = center.x + size/2, y = center.y, z = center.z}
        -- Base of shaft (left)
        points.base = {x = center.x - size/2, y = center.y, z = center.z}
        -- Top arrowhead
        points.left = {x = center.x + size/2 - head_length, y = center.y, z = center.z - head_width/2}
        -- Bottom arrowhead
        points.right = {x = center.x + size/2 - head_length, y = center.y, z = center.z + head_width/2}

    -- Diagonal directions
    elseif dir == 'northeast' or dir == 'ne' then
        -- Tip of arrow (northeast)
        local offset = size/2 * diagonal_factor
        points.tip = {x = center.x + offset, y = center.y, z = center.z + offset}
        points.base = {x = center.x - offset, y = center.y, z = center.z - offset}
        -- Arrowhead points perpendicular to diagonal
        local head_offset = head_length * diagonal_factor
        local head_perp = head_width/2 * diagonal_factor
        points.left = {x = points.tip.x - head_offset - head_perp, y = center.y, z = points.tip.z - head_offset + head_perp}
        points.right = {x = points.tip.x - head_offset + head_perp, y = center.y, z = points.tip.z - head_offset - head_perp}

    elseif dir == 'northwest' or dir == 'nw' then
        -- Tip of arrow (northwest)
        local offset = size/2 * diagonal_factor
        points.tip = {x = center.x - offset, y = center.y, z = center.z + offset}
        points.base = {x = center.x + offset, y = center.y, z = center.z - offset}
        -- Arrowhead points perpendicular to diagonal
        local head_offset = head_length * diagonal_factor
        local head_perp = head_width/2 * diagonal_factor
        points.left = {x = points.tip.x + head_offset - head_perp, y = center.y, z = points.tip.z - head_offset - head_perp}
        points.right = {x = points.tip.x + head_offset + head_perp, y = center.y, z = points.tip.z - head_offset + head_perp}

    elseif dir == 'southeast' or dir == 'se' then
        -- Tip of arrow (southeast)
        local offset = size/2 * diagonal_factor
        points.tip = {x = center.x + offset, y = center.y, z = center.z - offset}
        points.base = {x = center.x - offset, y = center.y, z = center.z + offset}
        -- Arrowhead points perpendicular to diagonal
        local head_offset = head_length * diagonal_factor
        local head_perp = head_width/2 * diagonal_factor
        points.left = {x = points.tip.x - head_offset + head_perp, y = center.y, z = points.tip.z + head_offset + head_perp}
        points.right = {x = points.tip.x - head_offset - head_perp, y = center.y, z = points.tip.z + head_offset - head_perp}

    elseif dir == 'southwest' or dir == 'sw' then
        -- Tip of arrow (southwest)
        local offset = size/2 * diagonal_factor
        points.tip = {x = center.x - offset, y = center.y, z = center.z - offset}
        points.base = {x = center.x + offset, y = center.y, z = center.z + offset}
        -- Arrowhead points perpendicular to diagonal
        local head_offset = head_length * diagonal_factor
        local head_perp = head_width/2 * diagonal_factor
        points.left = {x = points.tip.x + head_offset + head_perp, y = center.y, z = points.tip.z + head_offset - head_perp}
        points.right = {x = points.tip.x + head_offset - head_perp, y = center.y, z = points.tip.z + head_offset + head_perp}

    else
        -- Default to up if invalid direction
        points.tip = {x = center.x, y = center.y, z = center.z + size/2}
        points.base = {x = center.x, y = center.y, z = center.z - size/2}
        points.left = {x = center.x - head_width/2, y = center.y, z = center.z + size/2 - head_length}
        points.right = {x = center.x + head_width/2, y = center.y, z = center.z + size/2 - head_length}
    end

    local _, view = d3d8dev:GetTransform(C.D3DTS_VIEW)
    local _, projection = d3d8dev:GetTransform(C.D3DTS_PROJECTION)

    local bx, by, bz = helpers.worldToScreen(points.base.x,  points.base.y,  points.base.z,  view, projection)
    local tx, ty, tz = helpers.worldToScreen(points.tip.x,   points.tip.y,   points.tip.z,   view, projection)
    local lx, ly, lz = helpers.worldToScreen(points.left.x,  points.left.y,  points.left.z,  view, projection)
    local rx, ry, rz = helpers.worldToScreen(points.right.x, points.right.y, points.right.z, view, projection)

    if bz < 0 or bz > 1 or tz < 0 or tz > 1 then return end

    arrowBeamTex = arrowBeamTex or helpers.getTexture(addon.path .. 'assets/beam.png')

    d3d8dev:SetStreamSource(0, nil, 0)
    d3d8dev:SetVertexShader(ARROW_VERTEX_FORMAT)
    d3d8dev:SetRenderState(C.D3DRS_ZENABLE, 0)
    d3d8dev:SetRenderState(C.D3DRS_ALPHABLENDENABLE, 1)
    d3d8dev:SetRenderState(C.D3DRS_SRCBLEND, C.D3DBLEND_SRCALPHA)
    d3d8dev:SetRenderState(C.D3DRS_DESTBLEND, C.D3DBLEND_INVSRCALPHA)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_COLOROP,   C.D3DTOP_BLENDTEXTUREALPHA)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_COLORARG1, C.D3DTA_TEXTURE)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_COLORARG2, C.D3DTA_DIFFUSE)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_ALPHAOP,   C.D3DTOP_SELECTARG1)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_ALPHAARG1, C.D3DTA_TEXTURE)
    d3d8dev:SetTexture(0, arrowBeamTex)

    local lineWidth = 4
    local function beamQuad(ax, ay, ex, ey)
        local dx = ex - ax
        local dy = ey - ay
        local qlen = math.sqrt(dx*dx + dy*dy)
        if qlen < 0.001 then return end
        local nx = (-dy / qlen) * lineWidth
        local ny = ( dx / qlen) * lineWidth
        local verts = ffi.new('struct ArrowVertFormat[4]', {
            { ax + nx, ay + ny, 0.5, 1.0, color, 0, 0   },
            { ax - nx, ay - ny, 0.5, 1.0, color, 0, 0.5 },
            { ex + nx, ey + ny, 0.5, 1.0, color, 1, 0   },
            { ex - nx, ey - ny, 0.5, 1.0, color, 1, 0.5 },
        })
        d3d8dev:DrawPrimitiveUP(C.D3DPT_TRIANGLESTRIP, 2, verts, arrowVertSize)
    end

    beamQuad(bx, by, tx, ty)
    if lz >= 0 and lz <= 1 then beamQuad(tx, ty, lx, ly) end
    if rz >= 0 and rz <= 1 then beamQuad(tx, ty, rx, ry) end
end

return drawingModule
