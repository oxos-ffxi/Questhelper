-- FF7-style palette and shared styling for the QuestHelper windows.
-- Deep navy panels, pale blue edges, gold accents.
local ui_theme = {}

local imgui = require('imgui')

-- Ashita defines the ImGui enums as globals. Fall back to the standard indices so
-- the module still loads (and lints) outside the game.
local function colIdx(name, fallback)
    local v = _G[name]
    if type(v) == 'number' then return v end
    return fallback
end

-- Style vars are strict: a wrong index can feed a float to a vec2 var and assert
-- inside ImGui, so we simply skip any the runtime does not expose.
local function varIdx(name)
    local v = _G[name]
    if type(v) == 'number' then return v end
    return nil
end

local function has(fn)
    return type(imgui[fn]) == 'function'
end

local C = {
    Text            = colIdx('ImGuiCol_Text', 0),
    TextDisabled    = colIdx('ImGuiCol_TextDisabled', 1),
    WindowBg        = colIdx('ImGuiCol_WindowBg', 2),
    ChildBg         = colIdx('ImGuiCol_ChildBg', 3),
    PopupBg         = colIdx('ImGuiCol_PopupBg', 4),
    Border          = colIdx('ImGuiCol_Border', 5),
    FrameBg         = colIdx('ImGuiCol_FrameBg', 7),
    FrameBgHovered  = colIdx('ImGuiCol_FrameBgHovered', 8),
    FrameBgActive   = colIdx('ImGuiCol_FrameBgActive', 9),
    TitleBg         = colIdx('ImGuiCol_TitleBg', 10),
    TitleBgActive   = colIdx('ImGuiCol_TitleBgActive', 11),
    ScrollbarBg     = colIdx('ImGuiCol_ScrollbarBg', 14),
    ScrollbarGrab   = colIdx('ImGuiCol_ScrollbarGrab', 15),
    ScrollbarGrabH  = colIdx('ImGuiCol_ScrollbarGrabHovered', 16),
    ScrollbarGrabA  = colIdx('ImGuiCol_ScrollbarGrabActive', 17),
    CheckMark       = colIdx('ImGuiCol_CheckMark', 18),
    SliderGrab      = colIdx('ImGuiCol_SliderGrab', 19),
    SliderGrabA     = colIdx('ImGuiCol_SliderGrabActive', 20),
    Button          = colIdx('ImGuiCol_Button', 21),
    ButtonHovered   = colIdx('ImGuiCol_ButtonHovered', 22),
    ButtonActive    = colIdx('ImGuiCol_ButtonActive', 23),
    Header          = colIdx('ImGuiCol_Header', 24),
    HeaderHovered   = colIdx('ImGuiCol_HeaderHovered', 25),
    HeaderActive    = colIdx('ImGuiCol_HeaderActive', 26),
    Separator       = colIdx('ImGuiCol_Separator', 27),
    PlotHistogram   = colIdx('ImGuiCol_PlotHistogram', 40),
}
ui_theme.C = C

-- Semantic colours. Everything the UI draws should come from here.
ui_theme.col = {
    text     = {0.88, 0.92, 1.00, 1.00},  -- FF7 menu white
    dim      = {0.62, 0.68, 0.84, 1.00},
    faint    = {0.45, 0.50, 0.64, 1.00},
    gold     = {1.00, 0.82, 0.27, 1.00},  -- cursor / limit gauge
    cyan     = {0.42, 0.85, 0.96, 1.00},
    blue     = {0.45, 0.70, 1.00, 1.00},
    green    = {0.36, 0.88, 0.50, 1.00},
    amber    = {1.00, 0.66, 0.20, 1.00},
    red      = {1.00, 0.42, 0.42, 1.00},
    purple   = {0.70, 0.58, 1.00, 1.00},
    edge     = {0.48, 0.66, 0.92, 0.55},  -- pale blue window edge
}

local col = ui_theme.col

-- Window chrome
local WINDOW_BG = {0.035, 0.065, 0.165, 0.90}
local CHILD_BG  = {0.000, 0.000, 0.000, 0.00}
local PANEL     = {0.090, 0.160, 0.360, 0.85}
local PANEL_H   = {0.140, 0.245, 0.510, 0.92}
local PANEL_A   = {0.190, 0.330, 0.640, 1.00}

local STYLE_COLORS = {
    {C.WindowBg,       WINDOW_BG},
    {C.ChildBg,        CHILD_BG},
    {C.PopupBg,        {0.045, 0.080, 0.200, 0.96}},
    {C.Border,         col.edge},
    {C.Text,           col.text},
    {C.TextDisabled,   col.faint},
    {C.FrameBg,        PANEL},
    {C.FrameBgHovered, PANEL_H},
    {C.FrameBgActive,  PANEL_A},
    {C.TitleBg,        {0.055, 0.100, 0.240, 1.00}},
    {C.TitleBgActive,  {0.080, 0.150, 0.340, 1.00}},
    {C.Button,         PANEL},
    {C.ButtonHovered,  PANEL_H},
    {C.ButtonActive,   PANEL_A},
    {C.Header,         {0.075, 0.140, 0.330, 0.90}},
    {C.HeaderHovered,  PANEL_H},
    {C.HeaderActive,   PANEL_A},
    {C.CheckMark,      col.gold},
    {C.SliderGrab,     col.blue},
    {C.SliderGrabA,    col.gold},
    {C.Separator,      {0.30, 0.45, 0.75, 0.45}},
    {C.ScrollbarBg,    {0.020, 0.040, 0.110, 0.60}},
    {C.ScrollbarGrab,  {0.180, 0.300, 0.560, 0.80}},
    {C.ScrollbarGrabH, {0.260, 0.420, 0.720, 0.90}},
    {C.ScrollbarGrabA, col.gold},
    {C.PlotHistogram,  col.gold},
}

-- name -> value. Skipped when the runtime does not expose the var.
local STYLE_VARS = {
    {'ImGuiStyleVar_WindowRounding',   4.0},
    {'ImGuiStyleVar_WindowBorderSize', 1.0},
    {'ImGuiStyleVar_ChildRounding',    4.0},
    {'ImGuiStyleVar_FrameRounding',    3.0},
    {'ImGuiStyleVar_GrabRounding',     3.0},
    {'ImGuiStyleVar_ScrollbarRounding',6.0},
    {'ImGuiStyleVar_ScrollbarSize',    12.0},
    {'ImGuiStyleVar_WindowPadding',    {10.0, 8.0}},
    {'ImGuiStyleVar_FramePadding',     {6.0, 3.0}},
    {'ImGuiStyleVar_ItemSpacing',      {6.0, 4.0}},
    {'ImGuiStyleVar_IndentSpacing',    16.0},
}

-- Pushes the whole theme. Returns the counts to hand back to ui_theme.pop().
function ui_theme.push()
    for _, entry in ipairs(STYLE_COLORS) do
        imgui.PushStyleColor(entry[1], entry[2])
    end

    local vars = 0
    if has('PushStyleVar') then
        for _, entry in ipairs(STYLE_VARS) do
            local idx = varIdx(entry[1])
            if idx then
                imgui.PushStyleVar(idx, entry[2])
                vars = vars + 1
            end
        end
    end

    return #STYLE_COLORS, vars
end

function ui_theme.pop(colors, vars)
    if vars and vars > 0 then imgui.PopStyleVar(vars) end
    if colors and colors > 0 then imgui.PopStyleColor(colors) end
end

-- Button colour sets: base, hovered, active, text.
local BUTTONS = {
    done      = {{0.10, 0.34, 0.22, 0.85}, {0.14, 0.47, 0.30, 0.92}, {0.18, 0.60, 0.38, 1.00}, {0.78, 1.00, 0.85, 1.00}},
    todo      = {{0.34, 0.11, 0.15, 0.80}, {0.48, 0.15, 0.20, 0.90}, {0.60, 0.19, 0.25, 1.00}, {1.00, 0.88, 0.88, 1.00}},
    choice    = {{0.06, 0.28, 0.44, 0.85}, {0.10, 0.40, 0.62, 0.92}, {0.14, 0.52, 0.80, 1.00}, {0.85, 0.96, 1.00, 1.00}},
    accent    = {{0.36, 0.28, 0.06, 0.85}, {0.50, 0.39, 0.09, 0.92}, {0.64, 0.50, 0.12, 1.00}, col.gold},
    neutral   = {PANEL, PANEL_H, PANEL_A, col.text},
    muted     = {{0.12, 0.14, 0.20, 0.60}, {0.14, 0.17, 0.24, 0.60}, {0.16, 0.20, 0.28, 0.60}, col.faint},
}

-- Pushes a button colour set; returns the pop count.
function ui_theme.pushButton(kind)
    local set = BUTTONS[kind] or BUTTONS.neutral
    imgui.PushStyleColor(C.Button,        set[1])
    imgui.PushStyleColor(C.ButtonHovered, set[2])
    imgui.PushStyleColor(C.ButtonActive,  set[3])
    imgui.PushStyleColor(C.Text,          set[4])
    return 4
end

-- Progress gauge. Gold while in progress, green once finished. Falls back to the
-- old ASCII bar if the runtime has no ProgressBar.
function ui_theme.progressBar(pct, done, total, width, height)
    local frac = 0
    if total and total > 0 then frac = math.max(0, math.min(1, pct / 100)) end
    local label = string.format("%d%% - %d/%d", math.floor(pct + 0.5), done, total)

    if not has('ProgressBar') then
        local bars = math.floor(frac * 20)
        imgui.TextColored(frac >= 1 and col.green or col.gold,
            '[' .. string.rep('|', bars) .. string.rep(' ', 20 - bars) .. '] ' .. label)
        return
    end

    -- The label sits beside the bar, not on it: centred overlay text straddles the edge
    -- of the fill and half of it ends up unreadable whatever colour it is.
    imgui.PushStyleColor(C.PlotHistogram, frac >= 1 and col.green or col.gold)
    imgui.PushStyleColor(C.FrameBg, {0.020, 0.045, 0.120, 0.85})
    -- height 0 = font height + padding, so the bar matches the text line at any UI scale
    imgui.ProgressBar(frac, {width or -130, height or 0}, "")
    imgui.PopStyleColor(2)
    imgui.SameLine()
    imgui.TextColored(frac >= 1 and col.green or col.dim, label)
end

-- A small caption line (group headings, "Choose one:", section notes).
function ui_theme.caption(text)
    imgui.TextColored(col.blue, text)
end

local function spacer(px)
    if has('Dummy') then
        imgui.Dummy({1, px})
    else
        imgui.Spacing()
    end
end

-- Splits on newlines, keeping blank lines (Lua patterns drop them otherwise).
local function splitLines(text)
    local lines = {}
    local start = 1
    while true do
        local nl = text:find('\n', start, true)
        if not nl then
            table.insert(lines, text:sub(start))
            break
        end
        table.insert(lines, text:sub(start, nl - 1))
        start = nl + 1
    end
    return lines
end

-- Prefixes that carry their own colour. Checked in order.
local PREFIX_COLORS = {
    {'^CRITICAL:', col.red},
    {'^WARNING:',  col.red},
    {'^IMPORTANT:',col.red},
    {'^TIP:',      col.cyan},
    {'^NOTE:',     col.cyan},
    {'^REWARD:',   col.gold},
}

-- Turns a step's text into draw instructions: {kind = 'gap'|'head'|'body'}.
-- Pure Lua on purpose - the pattern matching and wrapping happen here, away from the
-- imgui calls, so a bad line can be caught without leaving the indent/style stacks
-- unbalanced (which would take the rest of the panel down with it).
local function buildStepLines(text, wrap_width, wrap_fn, body)
    local out = {}

    for _, line in ipairs(splitLines(text)) do
        local trimmed = line:match('^%s*(.-)%s*$')
        local heading = trimmed:match('^=+%s*(.-)%s*=+$')

        if trimmed == '' then
            table.insert(out, {kind = 'gap'})
        elseif heading and heading ~= '' then
            table.insert(out, {kind = 'head', text = heading:upper()})
        else
            local colour = nil
            for _, entry in ipairs(PREFIX_COLORS) do
                if trimmed:find(entry[1]) then colour = entry[2] break end
            end

            -- Bullets, and the wrapped continuation lines the data indents under them.
            local indented = trimmed:find('^%-%s') ~= nil or line:find('^%s%s') ~= nil
            table.insert(out, {
                kind    = 'body',
                text    = wrap_fn(trimmed, indented and (wrap_width - 3) or wrap_width),
                colour  = colour or body,
                indent  = indented,
            })
        end
    end

    return out
end

-- Renders one step's text: "===== Heading =====" becomes a gold heading,
-- CRITICAL/TIP/NOTE lines take their own colour, "- " lines become indented
-- bullets, and blank lines shrink to a thin gap instead of a full line.
-- tint is 'done' | 'active' | nil and colours the ordinary body lines.
function ui_theme.renderStepText(text, wrap_width, wrap_fn, tint)
    local body = col.text
    if tint == 'done' then
        body = col.green
    elseif tint == 'active' then
        body = col.gold
    end

    local ok, lines = pcall(buildStepLines, text, wrap_width, wrap_fn, body)
    if not ok then
        -- Never swallow the step: show it raw rather than an empty panel.
        imgui.TextColored(col.red, "(could not format this step: " .. tostring(lines) .. ")")
        imgui.TextColored(body, tostring(text))
        return
    end

    -- Each line is its own item now, so pack them like a paragraph. Without this the
    -- default 4px gap per line makes the block taller than the window sizing assumes.
    local spacing_var = has('PushStyleVar') and varIdx('ImGuiStyleVar_ItemSpacing') or nil
    if spacing_var then imgui.PushStyleVar(spacing_var, {6.0, 1.0}) end

    for _, item in ipairs(lines) do
        if item.kind == 'gap' then
            spacer(3)
        elseif item.kind == 'head' then
            spacer(2)
            imgui.TextColored(col.gold, item.text)
        elseif item.indent then
            imgui.Indent(12)
            imgui.TextColored(item.colour, item.text)
            imgui.Unindent(12)
        else
            imgui.TextColored(item.colour, item.text)
        end
    end

    if spacing_var then imgui.PopStyleVar(1) end
end

return ui_theme
