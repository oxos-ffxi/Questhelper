-- Auto-sync completed quests and missions from the server's own log.
--
-- The server sends packet 0x056 on zone-in to populate the client's quest/mission log.
-- Reading it lets a character who has played for years light up their real progress
-- instead of ticking hundreds of boxes by hand.
--
-- Layout confirmed against LandSandBoat src/map/packets/s2c/0x056_mission*.{h,cpp}
-- and src/map/enums/{quest,mission}_log.h:
--
--   0x04..0x23  Data[8] - eight uint32, meaning depends on the port
--   0x24        Port    - uint16, says which log this packet carries
--
--   Port 0x0090..0x0108  completed quests for one quest log (256 bits, id = bit index)
--   Port 0x00D0          completed nation missions: 64 bits per log, San d'Oria /
--                        Bastok / Windurst / Zilart in that order (logID * 64 + id)
--   Port 0xFFFF          main mission info - Nation at 0x04, current nation mission
--                        at 0x08, current CoP mission at 0x10. Current, not complete:
--                        the server knows you are on 3-1, not which of our steps you
--                        have reached.
--
-- Chains of Promathia is the odd one out: it has no completion bitmask at all, so it is
-- driven entirely off the 0xFFFF current-mission number against sync_ids.cop_chain.
--
-- Nothing here is authored per quest. Entries are matched by name against the IDs in
-- data/sync_ids.lua, so a quest added to data/ tomorrow syncs with no extra work.
local quest_sync = {}

local sync_ids = require('data.sync_ids')

local PORT_OFFSET          = 0x24
local DATA_OFFSET          = 0x04
local COP_OFFSET           = 0x10
local PORT_MISSION_NATIONS = 0x00D0
local PORT_MISSION_MAIN    = 0xFFFF

local COP_CAT = 'Missions'
local COP_SUB = 'ChainsOfPromathia'
local COP_LOG = 6  -- MissionLog::CoP, reported only so the debug view can name it

-- Name -> chain id, so a CoP entry the chain does not name shows up as unmatched
-- instead of disappearing.
local cop_ids = {}
for i = 1, #sync_ids.cop_chain do
    cop_ids[sync_ids.cop_chain[i].name] = sync_ids.cop_chain[i].id
end

-- Port -> quest log index (QuestComplete in quest_log.h)
local QUEST_COMPLETE_PORTS = {
    [0x0090] = 0,  [0x0098] = 1,  [0x00A0] = 2,  [0x00A8] = 3,
    [0x00B0] = 4,  [0x00B8] = 5,  [0x00C0] = 6,  [0x00C8] = 7,
    [0x00E8] = 8,  [0x00F8] = 9,  [0x0108] = 10,
}

-- Last state the server told us, kept so a manual re-sync works without zoning.
local seen_quests   = {}   -- [log][id] = true
local seen_missions = {}   -- [log][id] = true
local seen_current  = nil  -- {nation = n, mission = id}
local packet_seen   = false

-- Name -> entry index, built once from quest_data.
local index_built    = false
local quest_index    = {}  -- [log][id] = list of {cat, sub, name}
local mission_index  = {}  -- [log][id] = list of {cat, sub, name}
local unmatched      = {}  -- {cat, sub, name, label} with no server id, for the debug view
local ambiguous      = {}  -- names the server has in more than one log

-- Did the server say this one is done? CoP carries no completion bit, so there it means
-- "the mission you are on is past this one" - the same test LSB itself uses.
local function serverHasIt(kind, log, id)
    if kind == 'cop' then
        local cop = seen_current and seen_current.cop
        return cop ~= nil and cop > id
    end
    local seen = (kind == 'quest') and seen_quests or seen_missions
    return (seen[log] and seen[log][id]) and true or false
end

-- The choice_group an entry belongs to, namespaced by data file so two files reusing a
-- group name stay apart. nil when the entry is not one of a set of alternates.
local function choiceGroup(quest_data, entry)
    local data = quest_data[entry.cat]
        and quest_data[entry.cat][entry.sub]
        and quest_data[entry.cat][entry.sub][entry.name]
    local group = data and data.choice_group
    return group and (entry.cat .. '/' .. entry.sub .. '/' .. group) or nil
end

-- Recorded structured so the debug view can group by data file; label is what gets shown.
local function addUnmatched(cat, sub, name)
    table.insert(unmatched, { cat = cat, sub = sub, name = name,
                              label = cat .. '/' .. sub .. '/' .. name })
end

-- Strip a leading log code ("1-2: ", "2-3a: ", "ZM01: ") and everything that is not
-- a letter or digit, then uppercase. Both sides go through this, which is what lets
-- "1-2: Bat Hunt" find the server's BAT_HUNT without either side being edited.
local function normalise(name)
    local s = name:gsub('^%d+%-%d+%a*:%s*', ''):gsub('^%u%u+%d+:%s*', '')

    -- Job files number their entries to keep a chain in order - "1.Summoner Quest - I Can
    -- Hear a Rainbow", or just "4.Father and Son". Strip the ordering prefix and the
    -- "<Job> Quest - " decoration so what is left is the quest's real name, which is what
    -- sync_ids holds. Without this every Jobs entry lands in `unmatched` and a player who
    -- finished a job quest years ago never sees it light up.
    s = s:gsub('^%d+%.%s*', '')
    s = s:gsub('^.-%s+Quest%s*%-%s*', '')

    return (s:gsub('[^%a%d]', '')):upper()
end

-- Second pass for near-misses: the server calls Windurst 2-2 "A Testing Time" where we
-- call it "Testing Time". Only ever consulted when the strict key found nothing, and
-- the rest of the name still has to match exactly.
local function loose(key)
    return key:match('^THE(.+)$') or key:match('^AN(.+)$') or key:match('^A(.+)$') or key
end

-- Unique loose match or nothing. Two candidates collapsing to the same key means we
-- cannot tell them apart, and marking the wrong mission complete is worse than
-- marking none: pick neither and let it show up as unmatched.
local function looseLookup(candidates, key)
    local want, found, count = loose(key), nil, 0
    for k, v in pairs(candidates) do
        if loose(k) == want then
            found, count = v, count + 1
        end
    end
    if count == 1 then return found end
    return nil
end

-- Whole families of ours share one server entry - fifteen "Shattering Stars (job)" against
-- the server's one SHATTERING_STARS. A pattern matches the family, so adding the sixteenth
-- job needs no work here. Exact overrides win; these are only consulted after.
local function patternOverride(name)
    for i = 1, #sync_ids.override_patterns do
        local rule = sync_ids.override_patterns[i]
        if name:match(rule.pattern) then return rule end
    end
    return nil
end

-- One server id can cover several entries of ours: the server has one "Shattering Stars"
-- where we have fifteen, one per job. So each id holds a list, not a single entry - the
-- old single slot silently kept whichever the pairs() order happened to reach last.
local function addEntry(index, log, id, cat, sub, name)
    index[log] = index[log] or {}
    index[log][id] = index[log][id] or {}
    table.insert(index[log][id], { cat = cat, sub = sub, name = name })
end

-- Builds the name -> id index. Cheap enough to do once per session.
function quest_sync.buildIndex(quest_data)
    quest_index, mission_index, unmatched, ambiguous = {}, {}, {}, {}

    -- Quests: our subfiles are zones, not log regions, so look the name up across
    -- every quest log. A name in two logs is skipped rather than guessed at.
    local quests_by_name = {}
    for log, entries in pairs(sync_ids.quests) do
        for key, id in pairs(entries) do
            quests_by_name[key] = quests_by_name[key] or {}
            table.insert(quests_by_name[key], { log = log, id = id })
        end
    end

    for cat, subfiles in pairs(quest_data) do
        for sub, missions in pairs(subfiles) do
            local mission_log = (cat == 'Missions') and sync_ids.mission_logs[sub] or nil

            for name, _ in pairs(missions) do
                local override = sync_ids.overrides[name] or patternOverride(name)
                local key      = normalise(name)

                if override then
                    local index = (override.kind == 'quest') and quest_index or mission_index
                    addEntry(index, override.log, override.id, cat, sub, name)

                elseif mission_log then
                    local entries = sync_ids.missions[mission_log] or {}
                    local id = entries[key] or looseLookup(entries, key)
                    if id then
                        addEntry(mission_index, mission_log, id, cat, sub, name)
                    else
                        addUnmatched(cat, sub, name)
                    end

                elseif cop_ids[name] then
                    -- CoP is applied straight off the chain in apply(), not through an
                    -- id index - there is no bitmask for it to be indexed against.

                elseif cat ~= 'Missions' then
                    local hits = quests_by_name[key] or looseLookup(quests_by_name, key)
                    if hits and #hits == 1 then
                        addEntry(quest_index, hits[1].log, hits[1].id, cat, sub, name)
                    elseif hits then
                        table.insert(ambiguous, name)
                    else
                        addUnmatched(cat, sub, name)
                    end

                else
                    addUnmatched(cat, sub, name)
                end
            end
        end
    end

    index_built = true
end

-- Reads one 0x056. Only records what the server said; applying is separate so it can
-- also be re-run on demand.
function quest_sync.handlePacket(e)
    if e.id ~= 0x56 then return end

    local port = struct.unpack('H', e.data, PORT_OFFSET + 1)

    local quest_log = QUEST_COMPLETE_PORTS[port]
    if quest_log then
        seen_quests[quest_log] = {}
        for id = 0, 255 do
            if ashita.bits.unpack_be(e.data_raw, DATA_OFFSET, id, 1) == 1 then
                seen_quests[quest_log][id] = true
            end
        end
        packet_seen = true

    elseif port == PORT_MISSION_NATIONS then
        -- 64 bits per log, in log order: San d'Oria, Bastok, Windurst, Zilart
        for log = 0, 3 do
            seen_missions[log] = {}
            for id = 0, 63 do
                if ashita.bits.unpack_be(e.data_raw, DATA_OFFSET, (log * 64) + id, 1) == 1 then
                    seen_missions[log][id] = true
                end
            end
        end
        packet_seen = true

    elseif port == PORT_MISSION_MAIN then
        seen_current = {
            nation  = struct.unpack('I', e.data, 0x04 + 1),
            mission = struct.unpack('I', e.data, 0x08 + 1),
            cop     = struct.unpack('I', e.data, COP_OFFSET + 1),
        }
        packet_seen = true
    end
end

-- Marks one entry complete outright. The server's log is the authority here: it says the
-- quest is finished, so every step is written true whatever half-done state was left by
-- hand-ticking or by a trigger that fired early, and the mission's scratch state goes
-- with it. Nothing under a finished quest should still read as in progress.
--
-- Reads the raw stored tick rather than the step's effective state - a step that only
-- reads as done because it is skipped (skip_if_any_job_level) has nothing written down,
-- and leaving it that way is what let a mission look complete without being recorded.
local function completeEntry(entry, quest_data, quest_state)
    local mission_data = quest_data[entry.cat]
        and quest_data[entry.cat][entry.sub]
        and quest_data[entry.cat][entry.sub][entry.name]
    if not mission_data or not mission_data.steps then return false end

    local changed = false
    for i = 1, #mission_data.steps do
        if not quest_state.getStepState(entry.cat, entry.sub, entry.name, i) then
            quest_state.setStepState(entry.cat, entry.sub, entry.name, i, true, nil, true)
            changed = true
        end
    end

    if changed then
        quest_state.clearMissionProgress(entry.cat, entry.sub, entry.name, true)
    end
    return changed
end

-- Applies everything the server has told us so far.
-- Returns how many entries were newly completed, and the current mission if known.
function quest_sync.apply(quest_data, quest_state)
    if not index_built then quest_sync.buildIndex(quest_data) end

    local applied = 0

    -- An id we have no entries for is simply not ours: private-server extras and content
    -- we have not written live in the same ranges.
    for log, ids in pairs(seen_quests) do
        for id, _ in pairs(ids) do
            for _, entry in ipairs(quest_index[log] and quest_index[log][id] or {}) do
                if completeEntry(entry, quest_data, quest_state) then
                    applied = applied + 1
                end
            end
        end
    end

    for log, ids in pairs(seen_missions) do
        for id, _ in pairs(ids) do
            for _, entry in ipairs(mission_index[log] and mission_index[log][id] or {}) do
                if completeEntry(entry, quest_data, quest_state) then
                    applied = applied + 1
                end
            end
        end
    end

    -- Nation missions are strictly sequential - the gate guard will not hand you 3-3
    -- until 3-2 is done - so anything below the highest id the server calls complete is
    -- complete too, whether or not its own bit survived.
    --
    -- Bits do go missing. LSB's delMission clears the completion flag outright, a
    -- character advanced by GM command never had it set, and a server that once ran a
    -- different script for a mission may never have written it. Trusting the bits alone
    -- leaves permanent holes mid-list that no amount of play will ever fill.
    --
    -- Only the three nation logs. They are the ones known to be a single ordered line;
    -- Zilart is left to its own bits.
    for log = 0, 2 do
        local ids = seen_missions[log]
        if ids then
            local highest = -1
            for id in pairs(ids) do
                if id > highest then highest = id end
            end

            -- Which choice groups the server has already answered. 2-3 is the case: it
            -- records the route you actually walked, so backfilling the other one would
            -- tick a road never taken. Only when the server says nothing about any member
            -- of the group does the backfill get to settle it.
            local decided = {}
            for id, entries in pairs(mission_index[log] or {}) do
                if ids[id] then
                    for _, entry in ipairs(entries) do
                        local group = choiceGroup(quest_data, entry)
                        if group then decided[group] = true end
                    end
                end
            end

            for id, entries in pairs(mission_index[log] or {}) do
                if id < highest then
                    for _, entry in ipairs(entries) do
                        local group = choiceGroup(quest_data, entry)
                        if not (group and decided[group])
                            and completeEntry(entry, quest_data, quest_state) then
                            applied = applied + 1
                        end
                    end
                end
            end
        end
    end

    -- CoP has no completion bitmask, so the mission you are on is all the progress the
    -- server gives us. Everything earlier in the chain is done, which is exactly how LSB
    -- answers hasCompletedMission for CoP. 0 means the storyline was declined or never
    -- started; nothing is claimed then.
    local cop_current = seen_current and seen_current.cop
    if cop_current and cop_current > 0 and cop_current < 65535 then
        for i = 1, #sync_ids.cop_chain do
            local link = sync_ids.cop_chain[i]
            if link.id < cop_current then
                local entry = { cat = COP_CAT, sub = COP_SUB, name = link.name }
                if completeEntry(entry, quest_data, quest_state) then
                    applied = applied + 1
                end
            end
        end
    end

    -- The current nation mission is a selection hint, not progress: the server knows
    -- which mission you are on, never which step, so the steps are left to triggers.
    -- Where several of ours share the id, the first is the one suggested.
    local current
    if seen_current and seen_current.mission and seen_current.mission < 65535 then
        local entries = mission_index[seen_current.nation]
            and mission_index[seen_current.nation][seen_current.mission]
        if entries then current = entries[1] end
    end

    -- Deliberately no CoP fallback here. A character who has finished the nation missions
    -- always has a CoP number to point at, so suggesting it hijacked the panel on every
    -- login - and it is a poor suggestion anyway, since the server parks you on the last
    -- CoP mission long after you are done with it.

    if applied > 0 then
        local settings = require('settings')
        settings.save('QuestHelper_settings', quest_state.settings)
    end

    return applied, current
end

--- True once any 0x056 has arrived this session.
function quest_sync.hasData()
    return packet_seen
end

--- What the server actually said for one mission log, for /qh_sync. Returns the sorted
--- list of completed ids and, for each, the entry it resolved to (nil when it is not
--- one of ours). The only way to tell "the server never sent this bit" apart from
--- "our id is wrong" without guessing.
function quest_sync.dumpMissionLog(log)
    local ids = {}
    for id in pairs(seen_missions[log] or {}) do
        table.insert(ids, id)
    end
    table.sort(ids)

    local rows = {}
    for i = 1, #ids do
        local entries = mission_index[log] and mission_index[log][ids[i]] or {}
        local names = {}
        for _, entry in ipairs(entries) do
            table.insert(names, entry.name)
        end
        table.insert(rows, { id = ids[i], name = (#names > 0) and table.concat(names, ', ') or nil })
    end
    return rows
end

--- The current-mission numbers, for /qh_sync.
function quest_sync.currentRaw()
    return seen_current
end

--- Why is one entry not ticking? Finds every entry whose name contains `text`, the id it
--- resolved to, and whether the server actually set that bit. That is the whole question:
--- either we failed to map it, or the server never said it was done - and the two need
--- opposite fixes. Also returns any unmatched entries containing the text, which is the
--- "we failed to map it" case.
function quest_sync.explain(text)
    local want = text:lower()
    local rows = {}

    local function scan(index, kind)
        for log, ids in pairs(index) do
            for id, entries in pairs(ids) do
                for _, entry in ipairs(entries) do
                    if entry.name:lower():find(want, 1, true) then
                        table.insert(rows, {
                            name = entry.name, kind = kind, log = log, id = id,
                            set  = serverHasIt(kind, log, id),
                        })
                    end
                end
            end
        end
    end

    scan(quest_index, 'quest')
    scan(mission_index, 'mission')

    for i = 1, #sync_ids.cop_chain do
        local link = sync_ids.cop_chain[i]
        if link.name:lower():find(want, 1, true) then
            table.insert(rows, {
                name = link.name, kind = 'cop', log = COP_LOG, id = link.id,
                set  = serverHasIt('cop', COP_LOG, link.id),
            })
        end
    end

    local misses = {}
    for _, m in ipairs(unmatched) do
        if m.label:lower():find(want, 1, true) then table.insert(misses, m.label) end
    end

    return rows, misses
end

--- Every entry in one data file with its own linked/done state, for drilling into a row
--- of quest_sync.coverage. Unlinked entries are included with linked = false - they are
--- the ones worth looking at, so leaving them out would defeat the point.
function quest_sync.entriesFor(cat, sub)
    local rows = {}

    local function scan(index, kind)
        for log, ids in pairs(index) do
            for id, entries in pairs(ids) do
                for _, entry in ipairs(entries) do
                    if entry.cat == cat and entry.sub == sub then
                        table.insert(rows, { name = entry.name, linked = true,
                                             done = serverHasIt(kind, log, id),
                                             kind = kind, log = log, id = id })
                    end
                end
            end
        end
    end

    scan(quest_index, 'quest')
    scan(mission_index, 'mission')

    if cat == COP_CAT and sub == COP_SUB then
        for i = 1, #sync_ids.cop_chain do
            local link = sync_ids.cop_chain[i]
            table.insert(rows, { name = link.name, linked = true,
                                 done = serverHasIt('cop', COP_LOG, link.id),
                                 kind = 'cop', log = COP_LOG, id = link.id })
        end
    end

    for _, m in ipairs(unmatched) do
        if m.cat == cat and m.sub == sub then
            table.insert(rows, { name = m.name, linked = false, done = false })
        end
    end

    table.sort(rows, function(a, b) return a.name < b.name end)
    return rows
end

--- Linked / not linked / already-done counts per category and subfile, so a glance says
--- which data file is fully wired up. Driven off the entries themselves, so a new
--- directory under data/ appears here with no change to this module.
function quest_sync.coverage()
    local out = {}

    local function bump(cat, sub, field)
        out[cat] = out[cat] or {}
        out[cat][sub] = out[cat][sub] or { linked = 0, unlinked = 0, done = 0 }
        out[cat][sub][field] = out[cat][sub][field] + 1
    end

    local function scan(index, kind)
        for log, ids in pairs(index) do
            for id, entries in pairs(ids) do
                for _, entry in ipairs(entries) do
                    bump(entry.cat, entry.sub, 'linked')
                    if serverHasIt(kind, log, id) then bump(entry.cat, entry.sub, 'done') end
                end
            end
        end
    end

    scan(quest_index, 'quest')
    scan(mission_index, 'mission')

    for i = 1, #sync_ids.cop_chain do
        local link = sync_ids.cop_chain[i]
        bump(COP_CAT, COP_SUB, 'linked')
        if serverHasIt('cop', COP_LOG, link.id) then bump(COP_CAT, COP_SUB, 'done') end
    end

    for _, m in ipairs(unmatched) do
        bump(m.cat, m.sub, 'unlinked')
    end

    return out
end

--- Counts for the settings screen and the debug log.
function quest_sync.stats()
    local mapped_q, mapped_m = 0, 0
    for _, ids in pairs(quest_index) do
        for _, entries in pairs(ids) do mapped_q = mapped_q + #entries end
    end
    for _, ids in pairs(mission_index) do
        for _, entries in pairs(ids) do mapped_m = mapped_m + #entries end
    end
    mapped_m = mapped_m + #sync_ids.cop_chain
    return {
        mapped_quests   = mapped_q,
        mapped_missions = mapped_m,
        unmatched       = unmatched,
        ambiguous       = ambiguous,
        has_packet      = packet_seen,
    }
end

return quest_sync
