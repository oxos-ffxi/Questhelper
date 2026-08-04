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
    Tab             = colIdx('ImGuiCol_Tab', 33),
    TabHovered      = colIdx('ImGuiCol_TabHovered', 34),
    TabActive       = colIdx('ImGuiCol_TabActive', 35),
    TabUnfocused    = colIdx('ImGuiCol_TabUnfocused', 36),
    TabUnfocusedAct = colIdx('ImGuiCol_TabUnfocusedActive', 37),
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
    green_dim= {0.44, 0.64, 0.50, 1.00},  -- finished work, meant to recede
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
    -- Tabs ship stock orange, which fought the panel badly in Handheld Mode
    {C.Tab,            {0.055, 0.100, 0.240, 0.90}},
    {C.TabHovered,     PANEL_H},
    {C.TabActive,      {0.160, 0.280, 0.560, 1.00}},
    {C.TabUnfocused,   {0.045, 0.080, 0.200, 0.90}},
    {C.TabUnfocusedAct,{0.120, 0.210, 0.420, 1.00}},
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

-- Green header colours for a section with nothing outstanding, so a collapsed
-- section still answers "am I ready?". Returns the pop count (0 when not satisfied).
function ui_theme.pushHeader(satisfied)
    if not satisfied then return 0 end
    imgui.PushStyleColor(C.Header,        {0.10, 0.30, 0.19, 0.90})
    imgui.PushStyleColor(C.HeaderHovered, {0.14, 0.42, 0.27, 0.92})
    imgui.PushStyleColor(C.HeaderActive,  {0.18, 0.54, 0.33, 1.00})
    imgui.PushStyleColor(C.Text,          {0.78, 1.00, 0.85, 1.00})
    return 4
end

-- Progress gauge. Gold while in progress, green once finished. Falls back to the
-- old ASCII bar if the runtime has no ProgressBar.
function ui_theme.progressBar(pct, done, total, width, height, noun)
    local frac = 0
    if total and total > 0 then frac = math.max(0, math.min(1, pct / 100)) end
    noun = noun or "steps"
    -- No percent sign: imgui's text calls treat the string as a printf format, so a
    -- literal "%" is swallowed as a (broken) conversion - "43% - 3/7" arrived as "43/7".
    -- The bar already shows the proportion; the count is what needs words.
    local label = string.format("%d of %d %s", done, total, noun)

    if not has('ProgressBar') then
        local bars = math.floor(frac * 20)
        ui_theme.text(frac >= 1 and col.green or col.gold,
            '[' .. string.rep('|', bars) .. string.rep(' ', 20 - bars) .. '] ' .. label)
        return
    end

    -- The label sits beside the bar, not on it: centred overlay text straddles the edge
    -- of the fill and half of it ends up unreadable whatever colour it is.
    imgui.PushStyleColor(C.PlotHistogram, frac >= 1 and col.green or col.gold)
    imgui.PushStyleColor(C.FrameBg, {0.020, 0.045, 0.120, 0.85})
    -- Reserve the label's real width where the binding can measure it. A fixed guess
    -- ran "1 of 20 killed" off the edge, and it would break again at a larger UI scale.
    local reserve = 130
    if type(imgui.CalcTextSize) == 'function' then
        local tw = imgui.CalcTextSize(label)
        if type(tw) == 'number' and tw > 0 then reserve = tw + 14 end
    end
    -- height 0 = font height + padding, so the bar matches the text line at any UI scale
    imgui.ProgressBar(frac, {width or -reserve, height or 0}, "")
    imgui.PopStyleColor(2)
    imgui.SameLine()
    ui_theme.text(frac >= 1 and col.green or col.dim, label)
end

-- Coloured text that is safe for strings we did not write.
--
-- TextColored takes its string as a printf format, so any "%" in it is read as a
-- conversion and mangles the line (a "43% - 3/7" progress label rendered "43/7").
-- Text does not have that problem, so colour it with the style stack instead. Use
-- this for anything carrying quest data - names, step text, route strings.
function ui_theme.text(colour, str)
    imgui.PushStyleColor(C.Text, colour)
    imgui.Text(str)
    imgui.PopStyleColor(1)
end

-- Screen size, when the binding will tell us. Used to keep the Handheld map inside
-- the display: a Steam Deck is 800px tall and a 512px map plus chrome nearly fills it.
-- Returns nil rather than guessing, and every caller treats nil as "no cap".
function ui_theme.displaySize()
    if type(imgui.GetIO) ~= 'function' then return nil end
    local ok, io = pcall(imgui.GetIO)
    if not ok or io == nil then return nil end
    local ok2, ds = pcall(function() return io.DisplaySize end)
    if not ok2 or ds == nil then return nil end
    local w = (type(ds) == 'table') and (ds.x or ds[1]) or nil
    local h = (type(ds) == 'table') and (ds.y or ds[2]) or nil
    if type(w) == 'number' and type(h) == 'number' and w > 0 and h > 0 then
        return w, h
    end
    return nil
end

-- Per-window font scale, when the binding has it. ImGui 1.92 obsoleted
-- SetWindowFontScale, so recent Ashita builds don't export it and calling it
-- direct kills the render callback. No-op there: windows still scale, fonts don't.
function ui_theme.fontScale(scale)
    if has('SetWindowFontScale') then imgui.SetWindowFontScale(scale) end
end

-- Brighter blue rule with room either side. Parts the reference sections from the
-- step text, which otherwise starts hard against the last section header.
function ui_theme.divider()
    imgui.Spacing()
    imgui.PushStyleColor(C.Separator, {0.35, 0.55, 0.90, 0.70})
    imgui.Separator()
    imgui.PopStyleColor(1)
    imgui.Spacing()
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

-- "Step 18 (Windurst): Run up Parradamo Tor" -> "(Windurst)  Run up Parradamo Tor".
-- The step number is already in the nav row, so repeating it on the first line of
-- every step is just noise; what is left becomes the step's title. Returns nil when
-- the line does not follow the convention, and that line is then left alone.
local function stepTitle(line)
    local tag, rest = line:match('^[Ss]tep%s*%d+%s*(.-)%s*:%s*(.+)$')
    if not rest then return nil end
    if tag and tag ~= '' then return tag .. '  ' .. rest end
    return rest
end

-- Turns a step's text into draw instructions: {kind = 'gap'|'head'|'body'}.
-- Pure Lua on purpose - the pattern matching and wrapping happen here, away from the
-- imgui calls, so a bad line can be caught without leaving the indent/style stacks
-- unbalanced (which would take the rest of the panel down with it).
--
-- `mono` drops the per-prefix colours so every line takes `body`. Used for completed
-- steps: a done step reads as one solid green block, and a red CRITICAL left shouting
-- inside it just looks broken. Headings already collapse the same way in renderStepText.
local function buildStepLines(text, wrap_width, wrap_fn, body, mono)
    local out = {}
    local title_done = false

    for _, line in ipairs(splitLines(text)) do
        local trimmed = line:match('^%s*(.-)%s*$')
        local heading = trimmed:match('^=+%s*(.-)%s*=+$')
        local title = (not title_done) and trimmed ~= '' and stepTitle(trimmed) or nil

        if trimmed == '' then
            table.insert(out, {kind = 'gap'})
        elseif title then
            -- First line of the step becomes its title
            title_done = true
            table.insert(out, {kind = 'title', text = wrap_fn(title, wrap_width)})
        elseif heading and heading ~= '' then
            title_done = true
            table.insert(out, {kind = 'head', text = heading:upper()})
        else
            title_done = true
            local colour = nil
            if not mono then
                for _, entry in ipairs(PREFIX_COLORS) do
                    if trimmed:find(entry[1]) then colour = entry[2] break end
                end
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

-- Renders one step's text: the first line becomes the step's title, "===== X ====="
-- becomes a section heading, CRITICAL/TIP/NOTE lines take their own colour, "- "
-- lines become indented bullets, blank lines shrink to a thin gap.
--
-- tint is 'done' | 'active' | nil. For 'active' the state rides on the title line only,
-- not the whole block: colouring every line gold turned the panel into one flat wash and
-- made the instructions harder to read, not easier.
--
-- 'done' is the exception and goes fully green - body, headings AND callouts. A finished
-- step is not being read for instructions any more, it is being scanned for "is this
-- done?", and a red CRITICAL still shouting inside an otherwise green block reads as an
-- unfinished step. Headings already collapsed this way; `mono` extends it to callouts.
function ui_theme.renderStepText(text, wrap_width, wrap_fn, tint)
    local body, title_col = col.text, col.text
    if tint == 'done' then
        body, title_col = col.green_dim, col.green_dim
    elseif tint == 'active' then
        title_col = col.gold
    else
        body = col.dim  -- an upcoming step in the expanded list
    end

    -- A completed step goes solid green, callouts included - see buildStepLines' `mono`.
    local ok, lines = pcall(buildStepLines, text, wrap_width, wrap_fn, body, tint == 'done')
    if not ok then
        -- Never swallow the step: show it raw rather than an empty panel.
        ui_theme.text(col.red, "(could not format this step: " .. tostring(lines) .. ")")
        ui_theme.text(body, tostring(text))
        return
    end

    -- Each line is its own item now, so pack them like a paragraph. Without this the
    -- default 4px gap per line makes the block taller than the window sizing assumes.
    local spacing_var = has('PushStyleVar') and varIdx('ImGuiStyleVar_ItemSpacing') or nil
    if spacing_var then imgui.PushStyleVar(spacing_var, {6.0, 1.0}) end

    for _, item in ipairs(lines) do
        if item.kind == 'gap' then
            spacer(3)
        elseif item.kind == 'title' then
            ui_theme.text(title_col, item.text)
            spacer(2)
        elseif item.kind == 'head' then
            spacer(2)
            ui_theme.text(tint == 'done' and col.green_dim or col.gold, item.text)
        elseif item.indent then
            imgui.Indent(12)
            ui_theme.text(item.colour, item.text)
            imgui.Unindent(12)
        else
            ui_theme.text(item.colour, item.text)
        end
    end

    if spacing_var then imgui.PopStyleVar(1) end
end

return ui_theme
