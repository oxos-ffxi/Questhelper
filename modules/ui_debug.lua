-- Debug ImGui window — visible only when Developer Mode is enabled.
-- Tab 1 "Log"      : redirected QH debug messages (no chat spam)
-- Tab 2 "Position" : live coords + visual_zone entry builder
-- Tab 3 "Target"   : live target NPC coords + locations.lua entry builder
--
-- Coordinate note: posY_height = horizontal Z (depth), posZ_depth = elevation Y.
-- Data format:  x = posX,  y = posZ_depth (elev),  z = posY_height (horiz).
local ui_debug = {}

local imgui = require('imgui')

local ImGuiCond_FirstUseEver = 2

-- ── Log state ─────────────────────────────────────────────────────────────────
local MAX_LINES   = 200
local log_lines   = {}
local auto_scroll = true

-- ── Position/floor cache ──────────────────────────────────────────────────────
local FLOOR_INTERVAL = 5.0
local lastFloorTime  = 0

local cache = {
    pos   = { x = 0.0, y = 0.0, z = 0.0, zone = 0, zone_name = "..." },
    floor = { raw = nil, mapped = nil, saved = 0 },
    target = { name = "none", x = 0.0, y = 0.0, z = 0.0, valid = false },
}

-- ── Visual-zone builder (Position tab) ───────────────────────────────────────
local viz = {
    entry_type  = 'none',
    direction   = 'up',
    colour      = 'cyan',
    size        = 4,
    floor_id    = 0,
    pos_source    = 'player',  -- 'player', 'target', or 'custom'
    custom_x      = 0.0,
    custom_y      = 0.0,
    custom_z      = 0.0,
    custom_step   = 0.5,
    vertical      = false,  -- square only: upright panel using NPC elevation
    vertical_axis = nil,    -- square+vertical only: nil=N/S, 'z'=E/W, 'ne'=NE/SW, 'nw'=NW/SE
    rect_w         = 4.0,   -- rect only: horizontal width
    rect_h         = 4.0,   -- rect only: vertical height
    rect_rot       = 0,     -- rect+vertical only: extra rotation in degrees, nudges the axis preset
    preview_shapes = {},    -- shapes locked in for on-screen preview when Add is clicked
    entries     = {},
}
local DIRECTIONS = { 'up', 'down', 'left', 'right', 'ne', 'nw', 'se', 'sw' }
local COLOURS    = { 'cyan', 'yellow', 'white', 'orange', 'red', 'green', 'blue', 'magenta', 'purple', 'pink', 'black' }

-- ── Validate tab state ───────────────────────────────────────────────────────
local val = {
    quest_data    = nil,
    zone_data_ref = nil,
    ran           = false,
    checked       = 0,
    errors        = {},
    passing       = {},
    -- these are length-checked every frame to label the sub-tabs, so they must
    -- exist before Run Validation is ever pressed
    zone_issues   = {},
    state_issues  = {},
    target_issues = {},
    trigger_issues = {},
    show_errors   = true,
    show_ok       = true,
}

function ui_debug.setValidateData(quest_data, connections, floor_maps, zd, locations)
    val.quest_data     = quest_data
    val.connections    = connections
    val.zone_data_ref  = zd
    val.floor_maps     = floor_maps
    val.location_data  = locations
    -- quest data replaced, so the onmob_target reverse index is stale
    ui_debug.invalidateTargetIndex()
end

-- Runs every static check. Results are split by kind so each gets its own sub-tab:
--   zone_issues   - a zone name that is in neither zones.lua nor zone_connections
--   state_issues  - an image whose "state" does not equal its step's position, which
--                   silently hides that map (see the state check in modules/utils.lua)
--   target_issues - an onmob_target / vday_targets key with no locations.lua entry,
--                   which silently draws no beam
local function run_validate()
    val.errors        = {}
    val.passing       = {}
    val.zone_issues   = {}
    val.state_issues  = {}
    val.target_issues = {}
    val.trigger_issues = {}
    val.checked       = 0
    val.ran           = true

    if not val.quest_data then
        table.insert(val.zone_issues, { where = "-", detail = "Validate data not initialised - reload the addon." })
        return
    end

    local function chk_zone(zn, ctx, errs)
        if not zn then return end
        local in_zones = val.zone_data_ref and val.zone_data_ref[zn]
        local in_conns = val.connections and val.connections[zn]
        if not in_zones and not in_conns then
            table.insert(errs, 'unknown zone "' .. zn .. '" (' .. ctx .. ')')
        end
    end

    local function chk_target(name, where, ctx)
        if not val.location_data then return end
        if not val.location_data[name] then
            table.insert(val.target_issues, {
                where  = where,
                detail = string.format('%s "%s" has no entry in locations.lua - no beam will draw', ctx, name),
            })
        end
    end

    for category, subfiles in pairs(val.quest_data) do
        for subfile, missions in pairs(subfiles) do
            for mission_name, mission in pairs(missions) do
                local mission_errors = {}
                local label = category .. '/' .. subfile .. ' > "' .. mission_name .. '"'

                for si, step in ipairs(mission.steps or {}) do
                    val.checked = val.checked + 1
                    local ctx   = 'step ' .. si
                    local where = label .. ' ' .. ctx

                    if step.route_to then
                        chk_zone(step.route_to, ctx .. ' route_to', mission_errors)
                    end
                    if step.zone_trigger then
                        chk_zone(step.zone_trigger, ctx .. ' zone_trigger', mission_errors)
                    end
                    if step.kill_requirement and step.kill_requirement.zone then
                        chk_zone(step.kill_requirement.zone, ctx .. ' kill_requirement', mission_errors)
                    end

                    for _, img in ipairs(step.images or {}) do
                        chk_zone(img.zone_name or img.zone, ctx .. ' image zone_name', mission_errors)
                        -- state must match the step position or the image never shows
                        if img.state ~= nil and img.state ~= si then
                            table.insert(val.state_issues, {
                                where  = where,
                                detail = string.format('image state=%d but this is step %d - map will not show (set state=%d or remove it)',
                                                       img.state, si, si),
                            })
                        end
                    end

                    -- talk + event are AND-ed in modules/triggers.lua: both flags must
                    -- fire before the step advances. If the server never sends one of
                    -- them the step can never complete, and nothing reports why.
                    if step.trigger_on_talk and step.trigger_on_event_id then
                        table.insert(val.trigger_issues, {
                            where  = where,
                            detail = "has BOTH trigger_on_talk and trigger_on_event_id - these are AND-ed, so the step needs both to fire",
                        })
                    end

                    local tr = step.onmob_target
                    if type(tr) == 'string' then
                        chk_target(tr, where, 'onmob_target')
                    elseif type(tr) == 'table' and type(tr[1]) == 'string' then
                        for _, n in ipairs(tr) do chk_target(n, where, 'onmob_target') end
                    end
                    if type(step.vday_targets) == 'table' then
                        for day, names in pairs(step.vday_targets) do
                            if type(names) == 'table' then
                                for _, n in ipairs(names) do
                                    chk_target(n, where, 'vday_targets[' .. tostring(day) .. ']')
                                end
                            end
                        end
                    end
                end

                if #mission_errors > 0 then
                    table.insert(val.errors, { label = label, issues = mission_errors })
                else
                    table.insert(val.passing, label)
                end
            end
        end
    end
end

-- Reverse index: locations.lua key -> every mission step whose onmob_target (or
-- vday_targets) references it. Built once and cached, since quest_data does not change
-- while the addon is loaded. Lets the Drawing tab answer "which mission is this NPC for?"
local target_index = nil

-- Compares strings with digit runs treated as numbers, so mission names sort the way
-- a human reads them: 1-1, 1-2, 2-1, 3-1, 10-1 - not 1-1, 10-1, 2-1 as a plain string
-- sort would give. Used for the mission lists under each Drawing row.
local function natural_lt(a, b)
    local ai, bi = 1, 1
    while ai <= #a and bi <= #b do
        local ad = a:match('^%d+', ai)
        local bd = b:match('^%d+', bi)
        if ad and bd then
            local an, bn = tonumber(ad), tonumber(bd)
            if an ~= bn then return an < bn end
            ai, bi = ai + #ad, bi + #bd
        else
            local ac = a:sub(ai, ai):lower()
            local bc = b:sub(bi, bi):lower()
            if ac ~= bc then return ac < bc end
            ai, bi = ai + 1, bi + 1
        end
    end
    return (#a - ai) < (#b - bi)
end

local function build_target_index()
    target_index = {}
    for category, subfiles in pairs(val.quest_data or {}) do
        for subfile, missions in pairs(subfiles) do
            for mission_name, mission in pairs(missions) do
                for si, step in ipairs(mission.steps or {}) do
                    local function add(name)
                        local list = target_index[name]
                        if not list then list = {} target_index[name] = list end
                        table.insert(list, {
                            cat = category, sub = subfile, mission = mission_name, step = si,
                        })
                    end
                    local tr = step.onmob_target
                    if type(tr) == 'string' then
                        add(tr)
                    elseif type(tr) == 'table' and type(tr[1]) == 'string' then
                        for _, n in ipairs(tr) do add(n) end
                    end
                    if type(step.vday_targets) == 'table' then
                        for _, names in pairs(step.vday_targets) do
                            if type(names) == 'table' then
                                for _, n in ipairs(names) do add(n) end
                            end
                        end
                    end
                end
            end
        end
    end

    -- pairs() gave these in hash order, which looks random on screen. Sort each list
    -- into reading order: category, subfile, mission (numbers compared as numbers),
    -- then step. Done once here rather than per frame.
    for _, list in pairs(target_index) do
        table.sort(list, function(x, y)
            if x.cat ~= y.cat then return x.cat < y.cat end
            if x.sub ~= y.sub then return x.sub < y.sub end
            if x.mission ~= y.mission then return natural_lt(x.mission, y.mission) end
            return x.step < y.step
        end)
    end
end

-- Defined here so it closes over target_index; safe to call from setValidateData above
-- because that only runs at load time, once the whole module is in place.
function ui_debug.invalidateTargetIndex()
    target_index = nil
end

-- which rows are expanded in the Drawing tab
local beam_expanded = {}

-- Drawing tab zone selector. nil = follow the zone the player is standing in.
-- When a zone is picked manually the floor/distance checks are meaningless (they
-- compare against the player's live position), so rows are shown as "remote".
local beam_zone = { override = nil, search = { "" }, npc = { "" } }

-- Live view of every locations.lua entry in the zone you are standing in, showing
-- the same three tests the beam filter applies (zone / raw floor / distance) so a
-- beam that is not drawing says why instead of just being absent.
-- quest_state_mod is threaded in so the "go" buttons can set the active step
local function render_zone_beams(quest_state_mod)
    local here   = cache.pos.zone_name
    local zn     = beam_zone.override or here
    local remote = (zn ~= here)
    local raw    = cache.floor.raw

    -- Zone picker: type to filter, click to browse that zone without being in it
    imgui.Text("Zone:")
    imgui.SameLine()
    imgui.InputText("##beamzonesearch", beam_zone.search, 64)
    imgui.SameLine()
    if imgui.SmallButton("follow me##bzclear") then
        beam_zone.override = nil
        beam_zone.search[1] = ""
    end

    local q = tostring(beam_zone.search[1] or ""):lower()
    if q ~= "" and val.zone_data_ref then
        local hits = {}
        for name, id in pairs(val.zone_data_ref) do
            if name:lower():find(q, 1, true) then
                table.insert(hits, { name = name, id = id })
            end
        end
        table.sort(hits, function(a, b) return a.name < b.name end)
        local shown = 0
        for _, h in ipairs(hits) do
            if shown >= 12 then break end
            if imgui.SmallButton(string.format("%s (%d)##bz%s", h.name, h.id, h.name)) then
                beam_zone.override  = h.name
                beam_zone.search[1] = ""
            end
            shown = shown + 1
        end
        if #hits > 12 then
            imgui.TextColored({ 0.6, 0.6, 0.6, 1.0 },
                string.format("...%d more, keep typing to narrow", #hits - 12))
        end
        if #hits == 0 then
            imgui.TextColored({ 0.6, 0.6, 0.6, 1.0 }, "no zone matches that")
        end
        imgui.Separator()
    end

    -- NPC / entry search. Non-empty means search EVERY zone, not just the one being
    -- viewed, so you can find an entry without knowing which zone it lives in.
    imgui.Text("NPC: ")
    imgui.SameLine()
    imgui.InputText("##beamnpcsearch", beam_zone.npc, 64)
    imgui.SameLine()
    if imgui.SmallButton("clear##bnclear") then beam_zone.npc[1] = "" end
    local npc_q = tostring(beam_zone.npc[1] or ""):lower()
    local searching = (npc_q ~= "")

    if searching then
        imgui.TextColored({ 0.7, 0.85, 1.0, 1.0 },
            string.format("Searching all zones for \"%s\" - clear the box to go back to zone view", npc_q))
    elseif remote then
        imgui.TextColored({ 1.0, 0.75, 0.2, 1.0 },
            string.format("Viewing %s - you are in %s", tostring(zn), tostring(here)))
        imgui.TextColored({ 0.6, 0.6, 0.6, 1.0 },
            "Floor and distance cannot be checked from another zone. TP still works.")
    else
        imgui.Text(string.format("Zone: %s      your RAW floor: %s",
            tostring(zn), raw and tostring(raw) or "unknown"))
        imgui.TextColored({ 0.6, 0.6, 0.6, 1.0 },
            "An entry draws only if its floor_id equals your raw floor AND you are within max_distance.")
    end
    imgui.Separator()

    if not val.location_data then
        imgui.TextColored({ 1.0, 0.4, 0.4, 1.0 }, "locations data not passed to the debug UI - reload the addon.")
        return
    end

    local rows, drawing = {}, 0
    for name, l in pairs(val.location_data) do
        -- searching = every zone; otherwise just the zone being viewed
        local include = searching and name:lower():find(npc_q, 1, true) or
                        (not searching and l.zone == zn)
        if include then
            -- "remote" is per row now: a search can return entries from many zones,
            -- and floor/distance only mean anything for the zone you are standing in
            local row_remote = (l.zone ~= here)
            local fid  = l.floor_id
            local fok  = row_remote or (fid == nil) or (raw == nil) or (fid == raw)
            local dist, dok = nil, true
            if not row_remote and l.max_distance and l.target_pos then
                local dx = cache.pos.x - l.target_pos.x
                local dy = cache.pos.y - l.target_pos.y
                local dz = cache.pos.z - l.target_pos.z
                dist = math.sqrt(dx * dx + dy * dy + dz * dz)
                dok  = dist <= l.max_distance
            end
            if not row_remote and fok and dok then drawing = drawing + 1 end
            table.insert(rows, { name = name, fid = fid, fok = fok, dist = dist,
                                 maxd = l.max_distance, dok = dok, pos = l.target_pos,
                                 zone = l.zone, remote = row_remote })
        end
    end

    if #rows == 0 then
        imgui.Text(searching and "Nothing in locations.lua matches that name."
                              or "No locations entries for this zone.")
        return
    end

    -- Alphabetical, deliberately: sorting by distance or floor state makes rows jump
    -- around as you walk or change floor, so you lose track of which you have already
    -- checked. A fixed order is worth more here than putting the nearest first.
    table.sort(rows, function(a, b) return a.name < b.name end)

    if searching then
        imgui.Text(string.format("%d match(es) across all zones", #rows))
    elseif remote then
        imgui.Text(string.format("%d entr(ies) in %s", #rows, zn))
    else
        imgui.Text(string.format("%d entr(ies) here, %d currently drawable", #rows, drawing))
    end
    imgui.TextColored({ 0.6, 0.6, 0.6, 1.0 },
        "TP sends the LSB GM command '!pos x y z zoneid' - it needs GM rights on the server.")
    imgui.Separator()

    for _, r in ipairs(rows) do
        -- each row carries its own zone, so a search result TPs to the right place
        local zone_id = val.zone_data_ref and val.zone_data_ref[r.zone]
        local fid_s  = r.fid and tostring(r.fid) or "-"
        local dist_s = r.dist and string.format("%.1f/%s", r.dist, tostring(r.maxd)) or "-"
        local verdict, col
        if r.remote then
            -- not in this zone, so floor/distance say nothing - do not imply it is drawing
            verdict = "not here - TP to check"
            col = { 0.7, 0.7, 0.8, 1.0 }
        elseif not r.fok then
            verdict = string.format("FLOOR MISMATCH (entry %s, you are on %s)", fid_s, tostring(raw))
            col = { 1.0, 0.45, 0.45, 1.0 }
        elseif not r.dok then
            verdict = "in range? no - move closer"
            col = { 0.55, 0.55, 0.55, 1.0 }
        else
            verdict = "DRAWING"
            col = { 0.3, 0.9, 0.3, 1.0 }
        end

        -- locations target_pos maps straight onto !pos: x -> x, y -> y, z -> z
        -- (verified against the LSB script headers, e.g. Ambrotien 93.4 / -57.3)
        if r.pos and zone_id then
            if imgui.SmallButton("TP##tp" .. r.name) then
                local cmd = string.format("!pos %.3f %.3f %.3f %d",
                    r.pos.x, r.pos.y, r.pos.z, zone_id)
                -- Logged as well as sent: if the server rejects it or the queue mode is
                -- wrong on this Ashita build, the exact command is there to copy by hand.
                ui_debug.addLine("[QH] " .. cmd)
                local ok = pcall(function()
                    AshitaCore:GetChatManager():QueueCommand(1, cmd)
                end)
                if not ok then
                    ui_debug.addLine("[QH] could not send - copy the command above manually")
                end
            end
            imgui.SameLine()
        end

        -- Expander: which missions/steps reference this entry via onmob_target
        if not target_index then build_target_index() end
        local uses = target_index and target_index[r.name]
        local nuses = uses and #uses or 0
        if nuses > 0 then
            local mark = beam_expanded[r.name] and "v" or ">"
            if imgui.SmallButton(string.format("%s %d##ex%s", mark, nuses, r.name)) then
                beam_expanded[r.name] = not beam_expanded[r.name]
            end
        else
            imgui.SmallButton("  0##ex" .. r.name)
        end
        imgui.SameLine()

        if searching then
            -- results span zones, so the zone matters more than the distance column
            imgui.TextColored(col, string.format("%-42s %-26s floor %-4s %s",
                r.name, tostring(r.zone), fid_s, verdict))
        else
            imgui.TextColored(col, string.format("%-42s floor %-4s dist %-12s %s",
                r.name, fid_s, dist_s, verdict))
        end

        if beam_expanded[r.name] and uses then
            for _, u in ipairs(uses) do
                if imgui.SmallButton(string.format("go##g%s%s%s%d",
                        r.name, u.mission, u.sub, u.step)) then
                    -- DESTRUCTIVE, and deliberately so: this rewrites saved progress for
                    -- this one mission so the chosen step becomes the ACTIVE step, which
                    -- is what makes its beams and triggers live. Current step is derived
                    -- (quest_state.getCurrentStep = first step whose state is false), so
                    -- the only way to activate step N is to mark 1..N-1 done and N onward
                    -- not done. Nothing on the server restores this - mission progress is
                    -- not packet-synced, only key items are. Dev mode only.
                    local mdata = val.quest_data
                        and val.quest_data[u.cat]
                        and val.quest_data[u.cat][u.sub]
                        and val.quest_data[u.cat][u.sub][u.mission]
                    local nsteps = (mdata and mdata.steps) and #mdata.steps or 0
                    if quest_state_mod and nsteps > 0 then
                        -- setStepState saves internally, so no explicit save() here
                        for n = 1, nsteps do
                            quest_state_mod.setStepState(u.cat, u.sub, u.mission, n, n < u.step)
                        end
                        ui_debug.addLine(string.format(
                            "[QH] %s: steps 1-%d marked done, now active on step %d (progress overwritten)",
                            u.mission, u.step - 1, u.step))
                    end
                    ui_debug.pending_jump = {
                        cat = u.cat, sub = u.sub, mission = u.mission, step = u.step,
                    }
                end
                imgui.SameLine()
                imgui.TextColored({ 0.7, 0.8, 1.0, 1.0 },
                    string.format("      %s/%s  >  %s   step %d", u.cat, u.sub, u.mission, u.step))
            end
        end
    end
end

-- ── Step jump (Validate tab) ─────────────────────────────────────────────────
-- Drill down category > subfile > mission > step and force the tracker onto it.
-- "Current step" is not stored anywhere - quest_state.getCurrentStep derives it as
-- the first step whose state is false. So jumping to step N means marking 1..N-1
-- complete and N onward incomplete. Selecting the mission itself has to happen in
-- questhelper.lua, which owns currentTopCategory/Subfile/mission, so we leave the
-- request in ui_debug.pending_jump for it to pick up on the next frame.
local jump = { cat = nil, sub = nil, mission = nil }

local function sorted_keys(t)
    local out = {}
    for k in pairs(t or {}) do table.insert(out, k) end
    table.sort(out)
    return out
end

local function render_jump_tab(quest_state_mod)
    if not val.quest_data then
        imgui.TextColored({ 1.0, 0.4, 0.4, 1.0 }, "Quest data not loaded - reload the addon.")
        return
    end
    if not quest_state_mod then
        imgui.TextColored({ 1.0, 0.4, 0.4, 1.0 }, "Quest state not available.")
        return
    end

    imgui.TextColored({ 0.6, 0.6, 0.6, 1.0 },
        "Navigation only - selects a mission and scrolls the panel to a step so you can read it.")
    imgui.TextColored({ 0.6, 0.6, 0.6, 1.0 },
        "Changes NO progress and saves nothing. Beams and arrows keep following real progress,")
    imgui.TextColored({ 0.6, 0.6, 0.6, 1.0 },
        "so tick the steps yourself if you want a later step to become active.")
    imgui.Separator()

    -- breadcrumb + back
    if jump.cat then
        if imgui.SmallButton("< back##jb") then
            if jump.mission then jump.mission = nil
            elseif jump.sub then jump.sub = nil
            else jump.cat = nil end
        end
        imgui.SameLine()
        imgui.Text(string.format("%s%s%s",
            jump.cat,
            jump.sub and (" > " .. jump.sub) or "",
            jump.mission and (" > " .. jump.mission) or ""))
        imgui.Separator()
    end

    if not jump.cat then
        imgui.Text("Category:")
        for _, c in ipairs(sorted_keys(val.quest_data)) do
            if imgui.SmallButton(c .. "##jc") then jump.cat = c end
            imgui.SameLine()
        end
        imgui.Text("")
        return
    end

    if not jump.sub then
        imgui.Text("Subfile:")
        for _, s in ipairs(sorted_keys(val.quest_data[jump.cat])) do
            if imgui.SmallButton(s .. "##js") then jump.sub = s end
            imgui.SameLine()
        end
        imgui.Text("")
        return
    end

    if not jump.mission then
        imgui.Text("Mission:")
        for _, m in ipairs(sorted_keys(val.quest_data[jump.cat][jump.sub])) do
            if imgui.SmallButton(m .. "##jm") then jump.mission = m end
        end
        return
    end

    local mdata = val.quest_data[jump.cat][jump.sub][jump.mission]
    local steps = mdata and mdata.steps or {}
    if #steps == 0 then
        imgui.Text("This mission has no steps.")
        return
    end

    local cur = quest_state_mod.getCurrentStep(jump.cat, jump.sub, jump.mission, val.quest_data)
    imgui.Text(string.format("%d steps - real progress is on step %d", #steps, cur))
    imgui.Text("Go to step:")

    for i = 1, #steps do
        if imgui.SmallButton(tostring(i) .. "##jstep") then
            -- Navigation only. Nothing is written to quest_state, nothing is saved.
            -- This selects the mission and scrolls the panel to the step so it can be
            -- read; beams/arrows still follow real progress until you complete steps
            -- normally.
            ui_debug.pending_jump = {
                cat = jump.cat, sub = jump.sub, mission = jump.mission, step = i,
            }
            ui_debug.addLine(string.format("[QH] viewing %s step %d (progress unchanged)",
                jump.mission, i))
        end
        if i % 12 ~= 0 then imgui.SameLine() end
    end
    imgui.Text("")
end

-- ── Line builder (Position tab) ───────────────────────────────────────────────
local lin = {
    start_pos = nil,   -- { x, y, z } once set
    stop_pos  = nil,   -- { x, y, z } once set
}

-- ── locations.lua builder (Target tab) ───────────────────────────────────────
local loc = {
    visual_mode    = 'arc',
    floor_id       = 0,
    max_distance   = 35,
    use_target     = true,   -- true = NPC pos, false = player pos
    y_offset       = 0.0,    -- vertical nudge baked into target_pos.y on export
    entries        = {},
    preview_arcs   = {},     -- locked arcs kept on screen after Add Entry
    key_buf        = { "" },
    last_target_name = "",
}

local active_tab = 'position'  -- tracks which debug tab is visible, gates live drawing
local VISUAL_MODES = { 'arc', 'beacon' }

-- ── Helpers ───────────────────────────────────────────────────────────────────
local function strip_colors(s)
    return (tostring(s):gsub('\30.', ''))
end

local function zone_name_lookup(zone_data, zone_id)
    if zone_data then
        for name, id in pairs(zone_data) do
            if id == zone_id then return name end
        end
    end
    return "Zone " .. tostring(zone_id)
end

local function slugify(s)
    return tostring(s):lower():gsub("[%s']+", "-"):gsub("[^%w%-]", "")
end

-- Gets current target entity; returns nil if no target.
local function get_target_entity()
    -- Try the Ashita 4 global first (same pattern as GetPlayerEntity)
    if GetTargetEntity then
        local t = GetTargetEntity()
        if t and t.Name and t.Name ~= "" then return t end
    end
    -- Fallback: memory manager path
    local ok, result = pcall(function()
        local mem = AshitaCore:GetMemoryManager()
        if not mem then return nil end
        local tmgr = mem:GetTarget()
        if not tmgr then return nil end
        local tidx = tmgr:GetTargetIndex(0)
        if not tidx or tidx == 0 or tidx == 0xFFFF then return nil end
        return GetEntity(tidx)
    end)
    return ok and result or nil
end

-- Push a highlighted (active) button style.
local function push_active_style()
    imgui.PushStyleColor(ImGuiCol_Button,        { 0.15, 0.50, 0.85, 1.0 })
    imgui.PushStyleColor(ImGuiCol_ButtonHovered, { 0.20, 0.60, 0.95, 1.0 })
end

local function toggle_btn(label, active)
    if active then push_active_style() end
    local clicked = imgui.Button(label)
    if active then imgui.PopStyleColor(2) end
    return clicked
end

-- ── Public API ────────────────────────────────────────────────────────────────
function ui_debug.addLine(msg)
    local clean = strip_colors(msg)
    table.insert(log_lines, os.date("[%H:%M:%S] ") .. clean)
    if #log_lines > MAX_LINES then table.remove(log_lines, 1) end
    auto_scroll = true
end

-- ── Tab 1: Log ────────────────────────────────────────────────────────────────
local function render_log_tab()
    if imgui.Button("Clear Log") then log_lines = {} end
    imgui.SameLine()
    local s = { auto_scroll }
    if imgui.Checkbox("Auto-scroll", s) then auto_scroll = s[1] end
    imgui.Separator()
    imgui.BeginChild("QHLog", { 0, 0 }, false, 0)
    for _, line in ipairs(log_lines) do
        imgui.Text(line)
    end
    if auto_scroll then imgui.SetScrollHereY(1.0) end
    imgui.EndChild()
end

-- ── Tab 2: Position + visual_zone builder ────────────────────────────────────
local function render_position_tab()
    local p = cache.pos
    local f = cache.floor

    imgui.Text(string.format("Zone:  %s  (ID: %d)", p.zone_name, p.zone))
    imgui.Text(string.format("X: %8.2f    Y (elev): %8.2f    Z (horiz): %8.2f",
        p.x, p.y, p.z))
    local rs = f.raw    ~= nil and tostring(f.raw)    or "N/A"
    local ms = f.mapped ~= nil and tostring(f.mapped) or "N/A"
    imgui.Text(string.format("Floor  raw: %s    mapped: %s    saved map: %d",
        rs, ms, f.saved))

    imgui.Separator()
    imgui.Text("Visual Zone Entry Builder")
    imgui.Separator()

    -- Pos source
    local t = cache.target
    imgui.Text("Pos source:"); imgui.SameLine()
    if toggle_btn("My Position##vsrc", viz.pos_source == 'player') then viz.pos_source = 'player' end
    imgui.SameLine()
    if toggle_btn("NPC Target##vsrc", viz.pos_source == 'target') then viz.pos_source = 'target' end
    imgui.SameLine()
    if toggle_btn("Custom##vsrc", viz.pos_source == 'custom') then
        if viz.pos_source ~= 'custom' then
            viz.custom_x, viz.custom_y, viz.custom_z = p.x, p.y, p.z
        end
        viz.pos_source = 'custom'
    end

    local src_x, src_y, src_z
    if viz.pos_source == 'target' and t.valid then
        local use_npc_y = viz.vertical and (viz.entry_type == 'square' or viz.entry_type == 'rect')
        src_x = t.x
        src_y = use_npc_y and t.y or p.y
        src_z = t.z
        local y_label = use_npc_y and "NPC elev" or "player elev"
        imgui.Text(string.format("  Using:  %s  X=%.2f  Y=%.2f (%s)  Z=%.2f", t.name, src_x, src_y, y_label, src_z))
    elseif viz.pos_source == 'custom' then
        src_x, src_y, src_z = viz.custom_x, viz.custom_y, viz.custom_z
        imgui.Text("  X:"); imgui.SameLine()
        if imgui.Button(" - ##vcx") then viz.custom_x = viz.custom_x - viz.custom_step end
        imgui.SameLine(); imgui.Text(string.format("%.2f", viz.custom_x)); imgui.SameLine()
        if imgui.Button(" + ##vcx") then viz.custom_x = viz.custom_x + viz.custom_step end
        imgui.SameLine(); imgui.Text("  Y:"); imgui.SameLine()
        if imgui.Button(" - ##vcy") then viz.custom_y = viz.custom_y - viz.custom_step end
        imgui.SameLine(); imgui.Text(string.format("%.2f", viz.custom_y)); imgui.SameLine()
        if imgui.Button(" + ##vcy") then viz.custom_y = viz.custom_y + viz.custom_step end
        imgui.SameLine(); imgui.Text("  Z:"); imgui.SameLine()
        if imgui.Button(" - ##vcz") then viz.custom_z = viz.custom_z - viz.custom_step end
        imgui.SameLine(); imgui.Text(string.format("%.2f", viz.custom_z)); imgui.SameLine()
        if imgui.Button(" + ##vcz") then viz.custom_z = viz.custom_z + viz.custom_step end
        imgui.Text("  Step:"); imgui.SameLine()
        for _, s in ipairs({ 0.1, 0.5, 1.0, 5.0 }) do
            if toggle_btn(string.format("%.1f##vcs", s), viz.custom_step == s) then viz.custom_step = s end
            imgui.SameLine()
        end
        if imgui.Button("Snap Player##vcp") then viz.custom_x, viz.custom_y, viz.custom_z = p.x, p.y, p.z end
        if t.valid then
            imgui.SameLine()
            if imgui.Button("Snap NPC##vcp") then viz.custom_x, viz.custom_y, viz.custom_z = t.x, t.y, t.z end
        end
    else
        src_x, src_y, src_z = p.x, p.y, p.z
        imgui.Text(string.format("  Using:  Player  X=%.2f  Y=%.2f  Z=%.2f", src_x, src_y, src_z))
    end

    -- Type
    imgui.Text("Type:"); imgui.SameLine()
    if toggle_btn("None##vt",   viz.entry_type == 'none')   then viz.entry_type = 'none'   end
    imgui.SameLine()
    if toggle_btn("Arrow##vt",  viz.entry_type == 'arrow')  then viz.entry_type = 'arrow'  end
    imgui.SameLine()
    if toggle_btn("Square##vt", viz.entry_type == 'square') then viz.entry_type = 'square' end
    imgui.SameLine()
    if toggle_btn("Line##vt",   viz.entry_type == 'line')   then viz.entry_type = 'line'   end
    imgui.SameLine()
    if toggle_btn("Rect##vt",   viz.entry_type == 'rect')   then viz.entry_type = 'rect'   end
    if viz.entry_type == 'square' or viz.entry_type == 'rect' then
        if toggle_btn("Vertical##vt", viz.vertical) then
            viz.vertical = not viz.vertical
            if viz.vertical then
                viz.vertical_axis = viz.vertical_axis or 'ns'
            else
                viz.vertical_axis = nil
            end
        end
        if viz.vertical then
            imgui.SameLine()
            if toggle_btn("N/S##vaxis",   viz.vertical_axis == 'ns') then viz.vertical_axis = 'ns' end
            imgui.SameLine()
            if toggle_btn("E/W##vaxis",   viz.vertical_axis == 'z')  then viz.vertical_axis = 'z'  end
            imgui.SameLine()
            if toggle_btn("NE/SW##vaxis", viz.vertical_axis == 'ne') then viz.vertical_axis = 'ne' end
            imgui.SameLine()
            if toggle_btn("NW/SE##vaxis", viz.vertical_axis == 'nw') then viz.vertical_axis = 'nw' end
        end
    end

    if viz.entry_type ~= 'line' then
        -- Colour (split into 2 lines for readability)
        imgui.Text("Colour:")
        imgui.SameLine()
        for i = 1, 4 do
            if i > 1 then imgui.SameLine() end
            if toggle_btn(COLOURS[i], viz.colour == COLOURS[i]) then viz.colour = COLOURS[i] end
        end
        imgui.Text("       ")  -- indent to match label above
        imgui.SameLine()
        for i = 5, #COLOURS do
            if i > 5 then imgui.SameLine() end
            if toggle_btn(COLOURS[i], viz.colour == COLOURS[i]) then viz.colour = COLOURS[i] end
        end

        -- Direction (arrow only) - two rows of 4
        if viz.entry_type == 'arrow' then
            imgui.Text("Direction:")
            imgui.SameLine()
            for i = 1, 4 do
                if i > 1 then imgui.SameLine() end
                if toggle_btn(DIRECTIONS[i], viz.direction == DIRECTIONS[i]) then viz.direction = DIRECTIONS[i] end
            end
            imgui.Text("          ")
            imgui.SameLine()
            for i = 5, 8 do
                if i > 5 then imgui.SameLine() end
                if toggle_btn(DIRECTIONS[i], viz.direction == DIRECTIONS[i]) then viz.direction = DIRECTIONS[i] end
            end
        end

        -- Size / Floor ID
        if viz.entry_type == 'rect' then
            imgui.Text("Width:"); imgui.SameLine()
            if imgui.Button(" - ##vrw") then viz.rect_w = math.max(0.25, viz.rect_w - 0.25) end
            imgui.SameLine(); imgui.Text(string.format("%.2f", viz.rect_w)); imgui.SameLine()
            if imgui.Button(" + ##vrw") then viz.rect_w = viz.rect_w + 0.25 end
            imgui.SameLine(); imgui.Text("   Height:"); imgui.SameLine()
            if imgui.Button(" - ##vrh") then viz.rect_h = math.max(0.25, viz.rect_h - 0.25) end
            imgui.SameLine(); imgui.Text(string.format("%.2f", viz.rect_h)); imgui.SameLine()
            if imgui.Button(" + ##vrh") then viz.rect_h = viz.rect_h + 0.25 end
        else
            imgui.Text("Size:"); imgui.SameLine()
            if imgui.Button(" - ##vs") then viz.size = math.max(1, viz.size - 1) end
            imgui.SameLine(); imgui.Text(string.format("%d", viz.size)); imgui.SameLine()
            if imgui.Button(" + ##vs") then viz.size = viz.size + 1 end
        end

        imgui.SameLine(); imgui.Text("   Floor ID:"); imgui.SameLine()
        if imgui.Button(" - ##vf") then viz.floor_id = math.max(0, viz.floor_id - 1) end
        imgui.SameLine(); imgui.Text(string.format("%d", viz.floor_id)); imgui.SameLine()
        if imgui.Button(" + ##vf") then viz.floor_id = viz.floor_id + 1 end

        -- Rotate (rect + vertical only): nudge the axis preset to fit angled doors
        if viz.entry_type == 'rect' and viz.vertical then
            imgui.Text("Rotate:"); imgui.SameLine()
            if imgui.Button(" - ##vrr") then viz.rect_rot = viz.rect_rot - 5 end
            imgui.SameLine(); imgui.Text(string.format("%d deg", viz.rect_rot)); imgui.SameLine()
            if imgui.Button(" + ##vrr") then viz.rect_rot = viz.rect_rot + 5 end
            imgui.SameLine()
            if imgui.Button("0##vrr") then viz.rect_rot = 0 end
        end
    else
        -- Colour (line shares same colour picker)
        imgui.Text("Colour:")
        imgui.SameLine()
        for i = 1, 4 do
            if i > 1 then imgui.SameLine() end
            if toggle_btn(COLOURS[i], viz.colour == COLOURS[i]) then viz.colour = COLOURS[i] end
        end
        imgui.Text("       ")
        imgui.SameLine()
        for i = 5, #COLOURS do
            if i > 5 then imgui.SameLine() end
            if toggle_btn(COLOURS[i], viz.colour == COLOURS[i]) then viz.colour = COLOURS[i] end
        end

        -- Floor ID (line)
        imgui.Text("Floor ID:"); imgui.SameLine()
        if imgui.Button(" - ##lf") then viz.floor_id = math.max(0, viz.floor_id - 1) end
        imgui.SameLine(); imgui.Text(string.format("%d", viz.floor_id)); imgui.SameLine()
        if imgui.Button(" + ##lf") then viz.floor_id = viz.floor_id + 1 end

        -- Line: Set Start / Set End
        if imgui.Button("Set Start##lb") then lin.start_pos = { x = src_x, y = src_y, z = src_z } end
        imgui.SameLine()
        if imgui.Button("Set End##lb")   then lin.stop_pos  = { x = src_x, y = src_y, z = src_z } end

        if lin.start_pos then
            imgui.Text(string.format("  Start:  X=%.2f  Y=%.2f  Z=%.2f", lin.start_pos.x, lin.start_pos.y, lin.start_pos.z))
        else
            imgui.Text("  Start:  (not set)")
        end
        if lin.stop_pos then
            imgui.Text(string.format("  End:    X=%.2f  Y=%.2f  Z=%.2f", lin.stop_pos.x, lin.stop_pos.y, lin.stop_pos.z))
        else
            imgui.Text("  End:    (not set)")
        end
    end

    -- Actions
    imgui.Separator()
    local add_lbl = viz.entry_type == 'arrow'  and "+ Add Arrow##v"
                 or viz.entry_type == 'line'   and "+ Add Line##v"
                 or viz.entry_type == 'rect'   and "+ Add Rect##v"
                 or viz.entry_type == 'square' and "+ Add Square##v"
                 or nil
    if add_lbl and imgui.Button(add_lbl) then
        local entry
        if viz.entry_type == 'rect' then
            local axis_str = (viz.vertical and viz.vertical_axis) and string.format(", vertical_axis = '%s'", viz.vertical_axis) or ""
            local rot_str  = (viz.vertical and viz.rect_rot ~= 0) and string.format(", rotation = %d", viz.rect_rot) or ""
            entry = string.format(
                "    { zone_name = %q, type = 'rect', center = { x = %.1f, y = %.1f, z = %.1f }, width = %.2f, height = %.2f, floor_id = %d, colour = %q%s%s },",
                p.zone_name, src_x, src_y, src_z, viz.rect_w, viz.rect_h, viz.floor_id, viz.colour, axis_str, rot_str)
        elseif viz.entry_type == 'square' then
            local vert_str = viz.vertical and ", vertical = true" or ""
            local rot_str  = (viz.vertical and viz.vertical_axis) and string.format(", vertical_axis = '%s'", viz.vertical_axis) or ""
            entry = string.format(
                "    { zone_name = %q, type = 'square', center = { x = %.1f, y = %.1f, z = %.1f }, size = %d, floor_id = %d, colour = %q%s%s },",
                p.zone_name, src_x, src_y, src_z, viz.size, viz.floor_id, viz.colour, vert_str, rot_str)
        elseif viz.entry_type == 'line' then
            if lin.start_pos and lin.stop_pos then
                entry = string.format(
                    "    { zone_name = %q, type = 'line', start = { x = %.1f, y = %.1f, z = %.1f }, stop = { x = %.1f, y = %.1f, z = %.1f }, floor_id = %d, colour = %q },",
                    p.zone_name,
                    lin.start_pos.x, lin.start_pos.y, lin.start_pos.z,
                    lin.stop_pos.x,  lin.stop_pos.y,  lin.stop_pos.z, viz.floor_id, viz.colour)
                -- capture before clearing so preview_shapes push below can use them
                local saved_start = { x = lin.start_pos.x, y = lin.start_pos.y, z = lin.start_pos.z }
                local saved_stop  = { x = lin.stop_pos.x,  y = lin.stop_pos.y,  z = lin.stop_pos.z  }
                lin.start_pos = nil
                lin.stop_pos  = nil
                if entry then
                    table.insert(viz.entries, entry)
                    table.insert(viz.preview_shapes, { type = 'line', start_pos = saved_start, stop_pos = saved_stop, colour = viz.colour })
                end
                entry = nil  -- already inserted above
            end
        else
            entry = string.format(
                "    { zone_name = %q, type = 'arrow', center = { x = %.1f, y = %.1f, z = %.1f }, size = %d, direction = %q, floor_id = %d, colour = %q },",
                p.zone_name, src_x, src_y, src_z, viz.size, viz.direction, viz.floor_id, viz.colour)
        end
        if entry then
            table.insert(viz.entries, entry)
            if viz.entry_type == 'rect' then
                table.insert(viz.preview_shapes, { type = 'rect', center = { x = src_x, y = src_y, z = src_z }, width = viz.rect_w, height = viz.rect_h, colour = viz.colour, vertical_axis = viz.vertical and viz.vertical_axis or nil, rotation = (viz.vertical and viz.rect_rot ~= 0) and viz.rect_rot or nil })
            elseif viz.entry_type == 'square' then
                table.insert(viz.preview_shapes, { type = 'square', center = { x = src_x, y = src_y, z = src_z }, size = viz.size, colour = viz.colour, vertical = viz.vertical, vertical_axis = viz.vertical_axis })
            elseif viz.entry_type == 'arrow' then
                table.insert(viz.preview_shapes, { type = 'arrow', center = { x = src_x, y = src_y, z = src_z }, size = viz.size, direction = viz.direction, colour = viz.colour })
            end
        end
    end
    if add_lbl then imgui.SameLine() end
    if imgui.Button(string.format("Copy All (%d)##vc", #viz.entries)) then
        if #viz.entries > 0 then
            imgui.SetClipboardText(table.concat(viz.entries, "\n"))
        end
    end
    imgui.SameLine()
    if imgui.Button("Clear##vc") then viz.entries = {} viz.preview_shapes = {} end

    -- Preview
    if #viz.entries > 0 then
        imgui.Separator()
        imgui.Text(string.format("%d entries — hit 'Copy All' to grab:", #viz.entries))
        imgui.BeginChild("QHViz", { 0, 0 }, true, 0)
        local to_remove = nil
        for i, line in ipairs(viz.entries) do
            if imgui.SmallButton(string.format("X##vr%d", i)) then to_remove = i end
            imgui.SameLine()
            imgui.TextWrapped(line)
        end
        imgui.EndChild()
        if to_remove then
            table.remove(viz.entries, to_remove)
            table.remove(viz.preview_shapes, to_remove)
        end
    end
end

-- ── Tab 4: Validate ──────────────────────────────────────────────────────────
-- Renders one flat list of {where, detail} findings, or a green all-clear.
local function render_findings(list, empty_msg, hints)
    for _, line in ipairs(hints or {}) do
        imgui.TextColored({ 0.6, 0.6, 0.6, 1.0 }, line)
    end
    if not val.ran then
        imgui.Text("Click 'Run Validation' above.")
        return
    end
    if #list == 0 then
        imgui.TextColored({ 0.2, 0.9, 0.2, 1.0 }, empty_msg)
        return
    end
    imgui.TextColored({ 1.0, 0.4, 0.4, 1.0 }, string.format("%d issue(s):", #list))
    imgui.Separator()
    for _, e in ipairs(list) do
        imgui.TextColored({ 1.0, 0.75, 0.4, 1.0 }, "  " .. e.where)
        imgui.Text("      " .. e.detail)
    end
end

local function render_validate_tab(quest_state_mod)
    if imgui.Button("Run Validation") then run_validate() end
    imgui.SameLine()
    if imgui.Button("Clear##vclr") then
        val.ran = false
        val.errors, val.passing = {}, {}
        val.zone_issues, val.state_issues, val.target_issues = {}, {}, {}
        val.trigger_issues = {}
        val.checked = 0
    end
    if val.ran then
        imgui.SameLine()
        imgui.Text(string.format("%d steps checked   %d zone   %d state   %d target",
            val.checked, #val.errors, #val.state_issues, #val.target_issues))
    end

    imgui.Separator()

    if imgui.BeginTabBar("QHValidateTabs") then
        -- 1: zone names
        if imgui.BeginTabItem(string.format("Zones (%d)##vz", #val.errors)) then
            imgui.BeginChild("QHVZones", { 0, 0 }, false, 0)
            imgui.TextColored({ 0.6, 0.6, 0.6, 1.0 },
                "route_to / zone_trigger / image zone_name / kill_requirement must exist in zones.lua.")
            if not val.ran then
                imgui.Text("Click 'Run Validation' above.")
            elseif #val.errors == 0 then
                imgui.TextColored({ 0.2, 0.9, 0.2, 1.0 }, "All zone names resolve.")
            else
                if toggle_btn(string.format("Errors (%d)##vfe", #val.errors), val.show_errors) then
                    val.show_errors = not val.show_errors
                end
                imgui.SameLine()
                if toggle_btn(string.format("OK (%d)##vfo", #val.passing), val.show_ok) then
                    val.show_ok = not val.show_ok
                end
                imgui.Separator()
                if val.show_errors then
                    for _, entry in ipairs(val.errors) do
                        imgui.TextColored({ 1.0, 0.4, 0.4, 1.0 }, entry.label)
                        for _, issue in ipairs(entry.issues) do
                            imgui.Text("    " .. issue)
                        end
                        imgui.Separator()
                    end
                end
                if val.show_ok then
                    for _, label in ipairs(val.passing) do
                        imgui.TextColored({ 0.3, 0.85, 0.3, 1.0 }, "OK  " .. label)
                    end
                end
            end
            imgui.EndChild()
            imgui.EndTabItem()
        end

        -- 2: live drawing
        if imgui.BeginTabItem("Drawing##vd") then
            imgui.BeginChild("QHVDraw", { 0, 0 }, false, 0)
            render_zone_beams(quest_state_mod)
            imgui.EndChild()
            imgui.EndTabItem()
        end

        -- 3: image state vs step position
        if imgui.BeginTabItem(string.format("Step Images (%d)##vs", #val.state_issues)) then
            imgui.BeginChild("QHVState", { 0, 0 }, false, 0)
            render_findings(val.state_issues, "Every image state matches its step position.", {
                "An image only shows when its 'state' equals the step number (or is absent).",
                "Inserting a step without renumbering silently hides the maps after it.",
            })
            imgui.EndChild()
            imgui.EndTabItem()
        end

        -- 4: onmob_target keys
        if imgui.BeginTabItem(string.format("Beam Targets (%d)##vt", #val.target_issues)) then
            imgui.BeginChild("QHVTarget", { 0, 0 }, false, 0)
            render_findings(val.target_issues, "Every onmob_target key exists in locations.lua.", {
                "onmob_target and vday_targets names must be keys in locations.lua.",
                "A name with no entry draws no beam and reports nothing in game.",
            })
            imgui.EndChild()
            imgui.EndTabItem()
        end

        -- 5: trigger combinations
        if imgui.BeginTabItem(string.format("Triggers (%d)##vg", #val.trigger_issues)) then
            imgui.BeginChild("QHVTrig", { 0, 0 }, false, 0)
            render_findings(val.trigger_issues, "No steps pair talk and event triggers.", {
                "trigger_on_talk and trigger_on_event_id are AND-ed - a step with both waits for BOTH.",
                "If the server never sends one, the step can never complete. Usually you want just one.",
            })
            imgui.EndChild()
            imgui.EndTabItem()
        end

        -- 6: jump straight to a mission step
        if imgui.BeginTabItem("Jump##vj") then
            imgui.BeginChild("QHVJump", { 0, 0 }, false, 0)
            render_jump_tab(quest_state_mod)
            imgui.EndChild()
            imgui.EndTabItem()
        end

        imgui.EndTabBar()
    end
end

-- ── Tab 3: Target + locations.lua builder ────────────────────────────────────
local function render_target_tab()
    local t = cache.target
    local p = cache.pos

    -- Live target info
    if t.valid then
        imgui.Text(string.format("Target:  %s", t.name))
        imgui.Text(string.format("X: %8.2f    Y (elev): %8.2f    Z (horiz): %8.2f",
            t.x, t.y, t.z))
    else
        imgui.Text("Target:  (none — select an NPC)")
        imgui.Text("")
    end

    imgui.Separator()
    imgui.Text("locations.lua Entry Builder")
    imgui.Separator()

    -- Pos source
    imgui.Text("Pos source:"); imgui.SameLine()
    if toggle_btn("NPC Target##lsrc",    loc.use_target)  then loc.use_target = true  end
    imgui.SameLine()
    if toggle_btn("My Position##lsrc", not loc.use_target) then loc.use_target = false end

    local src_x, src_y, src_z
    if loc.use_target and t.valid then
        src_x, src_y, src_z = t.x, t.y, t.z
    else
        src_x, src_y, src_z = p.x, p.y, p.z
    end
    imgui.Text(string.format("  Using:  X=%.2f  Y=%.2f  Z=%.2f", src_x, src_y, src_z))

    -- Key name
    imgui.Text("Key name:")
    imgui.SameLine()
    imgui.SetNextItemWidth(420)
    imgui.InputText("##lockey", loc.key_buf, 256)

    -- Visual mode
    imgui.Text("Mode:"); imgui.SameLine()
    for i, mode in ipairs(VISUAL_MODES) do
        if i > 1 then imgui.SameLine() end
        if toggle_btn(mode .. "##lm", loc.visual_mode == mode) then loc.visual_mode = mode end
    end

    -- Zone (auto)
    imgui.Text(string.format("Zone:     %s  (auto from current zone)", p.zone_name))

    -- Y offset (arc tip height tuning, baked into target_pos.y on export)
    imgui.Text("Y offset:"); imgui.SameLine()
    if imgui.Button(" - ##lyo") then loc.y_offset = loc.y_offset - 0.1 end
    imgui.SameLine(); imgui.Text(string.format("%.1f", loc.y_offset)); imgui.SameLine()
    if imgui.Button(" + ##lyo") then loc.y_offset = loc.y_offset + 0.1 end

    -- Floor ID
    imgui.Text("Floor ID:"); imgui.SameLine()
    if imgui.Button(" - ##lf") then loc.floor_id = math.max(0, loc.floor_id - 1) end
    imgui.SameLine(); imgui.Text(string.format("%d", loc.floor_id)); imgui.SameLine()
    if imgui.Button(" + ##lf") then loc.floor_id = loc.floor_id + 1 end

    -- Max distance
    imgui.Text("Max dist:"); imgui.SameLine()
    if imgui.Button(" - ##ld") then loc.max_distance = math.max(1, loc.max_distance - 1) end
    imgui.SameLine(); imgui.Text(string.format("%d", loc.max_distance)); imgui.SameLine()
    if imgui.Button(" + ##ld") then loc.max_distance = loc.max_distance + 1 end
    imgui.SameLine(); imgui.Text("  ")
    imgui.SameLine()
    if imgui.Button(" -10##ld") then loc.max_distance = math.max(1, loc.max_distance - 10) end
    imgui.SameLine()
    if imgui.Button(" +10##ld") then loc.max_distance = loc.max_distance + 10 end

    -- Actions
    imgui.Separator()
    if imgui.Button("+ Add Entry##la") then
        local key = loc.key_buf[1] ~= "" and loc.key_buf[1] or "my-location"
        local entry = string.format(
            "[%q] = {\n    target_pos = { x = %.1f, y = %.1f, z = %.1f },\n    visual_mode = %q,\n    zone = %q,\n    floor_id = %d,\n    max_distance = %d\n},",
            key, src_x, src_y + loc.y_offset, src_z,
            loc.visual_mode, p.zone_name, loc.floor_id, loc.max_distance)
        table.insert(loc.entries, entry)
        if t.valid then
            table.insert(loc.preview_arcs, { end_x = t.x, end_ye = t.y + loc.y_offset, end_zh = t.z })
        end
    end
    imgui.SameLine()
    if imgui.Button(string.format("Copy All (%d)##lc", #loc.entries)) then
        if #loc.entries > 0 then
            imgui.SetClipboardText(table.concat(loc.entries, "\n"))
        end
    end
    imgui.SameLine()
    if imgui.Button("Clear##lc") then loc.entries = {} loc.preview_arcs = {} end

    -- Preview
    if #loc.entries > 0 then
        imgui.Separator()
        imgui.Text(string.format("%d entries — hit 'Copy All' to grab:", #loc.entries))
        imgui.BeginChild("QHLoc", { 0, 0 }, true, 0)
        local to_remove = nil
        for i, entry in ipairs(loc.entries) do
            if imgui.SmallButton(string.format("X##lr%d", i)) then to_remove = i end
            imgui.SameLine()
            imgui.TextWrapped(entry)
            imgui.Separator()
        end
        imgui.EndChild()
        if to_remove then
            table.remove(loc.entries, to_remove)
            table.remove(loc.preview_arcs, to_remove)
        end
    end
end

-- ── Main render ───────────────────────────────────────────────────────────────
function ui_debug.render(player_mod, floor_mappings, quest_state_mod, zone_data)
    if not (quest_state_mod
        and quest_state_mod.settings
        and quest_state_mod.settings.ui_settings
        and quest_state_mod.settings.ui_settings.dev_mode) then
        return
    end

    local now = os.clock()

    -- Refresh player position every frame (player_mod values are already updated each frame in questhelper.lua)
    if player_mod then
        cache.pos.x         = player_mod.posX or 0
        cache.pos.y         = player_mod.posZ_depth or 0   -- elevation  → data Y
        cache.pos.z         = player_mod.posY_height or 0  -- horizontal → data Z
        cache.pos.zone      = player_mod.zoneId or 0
        cache.pos.zone_name = zone_name_lookup(zone_data, cache.pos.zone)
    end

    -- Refresh floor
    if player_mod and (now - lastFloorTime) >= FLOOR_INTERVAL then
        lastFloorTime      = now
        cache.floor.raw    = player_mod.getFloorIdRaw and player_mod.getFloorIdRaw() or nil
        cache.floor.mapped = player_mod.getFloorId and player_mod.getFloorId(floor_mappings) or nil
        if quest_state_mod and player_mod.zoneId then
            cache.floor.saved = quest_state_mod.getCurrentMap
                and quest_state_mod.getCurrentMap(player_mod.zoneId) or 0
        end
    end

    -- Refresh target (every frame is fine — entity lookup is cheap)
    local tgt = get_target_entity()
    if tgt and tgt.Name and tgt.Name ~= "" and tgt.Movement and tgt.Movement.LocalPosition then
        local tp = tgt.Movement.LocalPosition
        cache.target.name  = tgt.Name
        cache.target.x     = tp.X or 0
        cache.target.y     = tp.Z or 0   -- same swap: LocalPosition.Z = elevation = data Y
        cache.target.z     = tp.Y or 0   -- LocalPosition.Y = horizontal = data Z
        cache.target.valid = true
        -- Auto-suggest key when target changes
        if tgt.Name ~= loc.last_target_name then
            loc.last_target_name = tgt.Name
            local suggested = slugify(cache.pos.zone_name) .. "-" .. slugify(tgt.Name)
            loc.key_buf[1] = suggested
        end
    else
        cache.target.valid = false
        cache.target.name  = "none"
    end

    imgui.SetNextWindowSize({ 740, 500 }, ImGuiCond_FirstUseEver)
    local win_open = imgui.Begin("QH Debug", nil, 0)
    if win_open then
        if imgui.BeginTabBar("QHTabs") then
            if imgui.BeginTabItem("Log") then
                active_tab = 'log'
                render_log_tab()
                imgui.EndTabItem()
            end
            if imgui.BeginTabItem("Position") then
                active_tab = 'position'
                render_position_tab()
                imgui.EndTabItem()
            end
            if imgui.BeginTabItem("Target") then
                active_tab = 'target'
                render_target_tab()
                imgui.EndTabItem()
            end
            if imgui.BeginTabItem("Validate") then
                active_tab = 'validate'
                render_validate_tab(quest_state_mod)
                imgui.EndTabItem()
            end
            imgui.EndTabBar()
        end
    end
    imgui.End()

    -- Locked shapes — always visible regardless of active tab
    if #viz.preview_shapes > 0 then
        local beam_drawing = require('modules.beam_drawing')
        local drawing      = require('util.drawing')
        for _, s in ipairs(viz.preview_shapes) do
            local color = beam_drawing.colorNameToARGB(s.colour, 0.85)
            if s.type == 'rect' then
                drawing.drawRectangle(s.center, s.width, s.height, color, { vertical_axis = s.vertical_axis, rotation = s.rotation })
            elseif s.type == 'square' then
                drawing.drawSquare(s.center, s.size, color, { vertical = s.vertical, vertical_axis = s.vertical_axis })
            elseif s.type == 'arrow' then
                drawing.drawArrow(s.center, s.size, s.direction, color)
            elseif s.type == 'line' then
                drawing.drawLine(s.start_pos, s.stop_pos, color)
            end
        end
    end

    -- Live in-progress shape — only on Position tab
    if active_tab == 'position' then
        local beam_drawing = require('modules.beam_drawing')
        local drawing      = require('util.drawing')
        local p = cache.pos
        local t = cache.target
        local cx, cy, cz
        local use_npc_y = viz.vertical and (viz.entry_type == 'square' or viz.entry_type == 'rect')
        if viz.pos_source == 'target' and t.valid then
            cx = t.x; cy = use_npc_y and t.y or p.y; cz = t.z
        elseif viz.pos_source == 'custom' then
            cx = viz.custom_x; cy = viz.custom_y; cz = viz.custom_z
        else
            cx, cy, cz = p.x, p.y, p.z
        end
        local color = beam_drawing.colorNameToARGB(viz.colour, 0.85)
        if viz.entry_type == 'rect' then
            drawing.drawRectangle({ x = cx, y = cy, z = cz }, viz.rect_w, viz.rect_h, color, { vertical_axis = viz.vertical and viz.vertical_axis or nil, rotation = viz.vertical and viz.rect_rot or nil })
        elseif viz.entry_type == 'square' then
            drawing.drawSquare({ x = cx, y = cy, z = cz }, viz.size, color, { vertical = viz.vertical, vertical_axis = viz.vertical_axis })
        elseif viz.entry_type == 'arrow' then
            drawing.drawArrow({ x = cx, y = cy, z = cz }, viz.size, viz.direction, color)
        end
    end

    -- Locked arcs (from Target tab Add Entry) — always visible regardless of active tab
    if #loc.preview_arcs > 0 then
        local beam_drawing = require('modules.beam_drawing')
        local drawArcModule = require('util.drawArc')
        local p = cache.pos
        local heightOffset = beam_drawing.getPlayerHeightOffset(false)
        local startX  = p.x + beam_drawing.PLAYER_ARC_START_X_OFFSET
        local startYe = p.y + heightOffset
        local startZh = p.z + beam_drawing.PLAYER_ARC_START_Z_OFFSET
        beam_drawing.calculateDynamicColor()
        for _, arc in ipairs(loc.preview_arcs) do
            drawArcModule(startX, startZh, startYe, arc.end_x, arc.end_zh, arc.end_ye,
                beam_drawing.ARGB_BEAM_COLOR, beam_drawing.beamAppearProgress, true)
        end
    end

    -- Target tab: live arc from player to NPC target with y_offset applied
    if active_tab == 'target' then
        local t = cache.target
        local p = cache.pos
        if t.valid then
            local beam_drawing = require('modules.beam_drawing')
            local drawArcModule = require('util.drawArc')
            local heightOffset = beam_drawing.getPlayerHeightOffset(false)
            local startX  = p.x  + beam_drawing.PLAYER_ARC_START_X_OFFSET
            local startYe = p.y  + heightOffset
            local startZh = p.z  + beam_drawing.PLAYER_ARC_START_Z_OFFSET
            local endX    = t.x
            local endYe   = t.y + loc.y_offset
            local endZh   = t.z
            beam_drawing.calculateDynamicColor()
            drawArcModule(startX, startZh, startYe, endX, endZh, endYe,
                beam_drawing.ARGB_BEAM_COLOR, beam_drawing.beamAppearProgress, true)
        end
    end
end

return ui_debug
