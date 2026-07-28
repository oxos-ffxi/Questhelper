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
--                        at 0x08. Current, not complete: the server knows you are on
--                        3-1, not which of our steps you have reached.
--
-- Nothing here is authored per quest. Entries are matched by name against the IDs in
-- data/sync_ids.lua, so a quest added to data/ tomorrow syncs with no extra work.
local quest_sync = {}

local sync_ids = require('data.sync_ids')

local PORT_OFFSET          = 0x24
local DATA_OFFSET          = 0x04
local PORT_MISSION_NATIONS = 0x00D0
local PORT_MISSION_MAIN    = 0xFFFF

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
local quest_index    = {}  -- [log][id] = {cat, sub, name}
local mission_index  = {}  -- [log][id] = {cat, sub, name}
local unmatched      = {}  -- entries with no server id, for the debug report
local ambiguous      = {}  -- names the server has in more than one log

-- Strip a leading log code ("1-2: ", "2-3a: ", "ZM01: ") and everything that is not
-- a letter or digit, then uppercase. Both sides go through this, which is what lets
-- "1-2: Bat Hunt" find the server's BAT_HUNT without either side being edited.
local function normalise(name)
    local s = name:gsub('^%d+%-%d+%a*:%s*', ''):gsub('^%u%u+%d+:%s*', '')
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

local function addEntry(index, log, id, cat, sub, name)
    index[log] = index[log] or {}
    index[log][id] = { cat = cat, sub = sub, name = name }
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
                local override = sync_ids.overrides[name]
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
                        table.insert(unmatched, cat .. '/' .. sub .. '/' .. name)
                    end

                elseif cat ~= 'Missions' then
                    local hits = quests_by_name[key] or looseLookup(quests_by_name, key)
                    if hits and #hits == 1 then
                        addEntry(quest_index, hits[1].log, hits[1].id, cat, sub, name)
                    elseif hits then
                        table.insert(ambiguous, name)
                    else
                        table.insert(unmatched, cat .. '/' .. sub .. '/' .. name)
                    end
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
        }
        packet_seen = true
    end
end

-- Marks every step of one entry complete. Upward only - never unticks anything, so
-- manual progress and part-finished quests survive a sync.
local function completeEntry(entry, quest_data, quest_state)
    local mission_data = quest_data[entry.cat]
        and quest_data[entry.cat][entry.sub]
        and quest_data[entry.cat][entry.sub][entry.name]
    if not mission_data or not mission_data.steps then return false end

    if quest_state.isMissionComplete(entry.cat, entry.sub, entry.name, quest_data) then
        return false
    end

    for i = 1, #mission_data.steps do
        local step = mission_data.steps[i]
        if not quest_state.getStepState(entry.cat, entry.sub, entry.name, i, step) then
            quest_state.setStepState(entry.cat, entry.sub, entry.name, i, true, nil, true)
        end
    end
    return true
end

-- Applies everything the server has told us so far.
-- Returns how many entries were newly completed, and the current mission if known.
function quest_sync.apply(quest_data, quest_state)
    if not index_built then quest_sync.buildIndex(quest_data) end

    local applied = 0

    for log, ids in pairs(seen_quests) do
        for id, _ in pairs(ids) do
            local entry = quest_index[log] and quest_index[log][id]
            -- An id we have no entry for is simply not ours: private-server extras
            -- and content we have not written live in the same ranges.
            if entry and completeEntry(entry, quest_data, quest_state) then
                applied = applied + 1
            end
        end
    end

    for log, ids in pairs(seen_missions) do
        for id, _ in pairs(ids) do
            local entry = mission_index[log] and mission_index[log][id]
            if entry and completeEntry(entry, quest_data, quest_state) then
                applied = applied + 1
            end
        end
    end

    -- The current nation mission is a selection hint, not progress: the server knows
    -- which mission you are on, never which step, so the steps are left to triggers.
    local current
    if seen_current and seen_current.mission and seen_current.mission < 65535 then
        local entry = mission_index[seen_current.nation]
            and mission_index[seen_current.nation][seen_current.mission]
        if entry then current = entry end
    end

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

--- Counts for the settings screen and the debug log.
function quest_sync.stats()
    local mapped_q, mapped_m = 0, 0
    for _, ids in pairs(quest_index) do
        for _ in pairs(ids) do mapped_q = mapped_q + 1 end
    end
    for _, ids in pairs(mission_index) do
        for _ in pairs(ids) do mapped_m = mapped_m + 1 end
    end
    return {
        mapped_quests   = mapped_q,
        mapped_missions = mapped_m,
        unmatched       = unmatched,
        ambiguous       = ambiguous,
        has_packet      = packet_seen,
    }
end

return quest_sync
