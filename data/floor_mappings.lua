-- Floor ID to Map Number Mappings
-- Maps the raw floor IDs returned by CheckFloorNumber to logical map numbers (1, 2, 3, etc.)
-- Assume that every zone goes up incrementally, however some do not and we need an override here.
--
-- To add a new zone:
-- 1. Go to the zone
-- 2. Run /qh_checkfloor on each floor/map
-- 3. Note the "Floor ID (raw/0-based)" value
-- 4. Add mapping: [raw_id] = map_number
--
-- Example:
-- [147] = {  -- Beadeaux (Zone ID 147)
--     [1] = 1,   -- Raw floor ID 1 = Map 1 (upper floor)
--     [15] = 2,  -- Raw floor ID 15 = Map 2 (lower floor)
-- },
--
-- ─────────────────────────────────────────────────────────────────────────────
-- WHAT THIS FILE IS FOR
--
-- It translates raw floor ids into map numbers. Map numbers are used for:
--   1. Pathfinding sub-zones (the load-bearing one). Zones whose floors have
--      different zone connections - Palborough Mines, Korroloka Tunnel, Kuftal
--      Tunnel - are identified by map number in modules/pathfinding.lua, so
--      route_to needs this to route correctly through them.
--   2. Map images: which image auto-switches into view, and showing "Map 2"
--      rather than "floor 15" in the UI.
--
-- It does NOT affect beam drawing. locations.lua floor_id is a RAW id compared
-- against the raw floor, so adding a zone here can never break existing entries.
--
-- AUTHORING RULE: every floor_id you type anywhere - locations.lua, visual_zones,
-- images, destination_highlight - is the RAW /qh_checkfloor value. Map numbers
-- appear in exactly one place: the right-hand side of the tables below.
-- The "Audit Floor IDs" button on the debug Validate tab flags locations entries
-- that look like they used a map number by mistake.
-- ─────────────────────────────────────────────────────────────────────────────

return {
    --Bibiki Bay
    [4] = {
        [1] = 1,
        [2] = 2,  -- Purgonorgo Isle
    },
    --Pso'Xja
    [9] = {
        [8] = 1,
    },
    --Phoniuna Aqueducts
    [27] = {
        [1] = 1,
        [2] = 2,
        [3] = 3,
    },
    [30] = {
        [2] = 1,
    },
    -- Sealion's Den
    [32] = {
        [1] = 1,
    },
    -- Grand Palace Of Hu'Xzoi
    [34] = {
        [1] = 1,
    },
    -- The Garden of Ru'Hmet
    [35] = {
        [1] = 1,
    },

    [68] = {
        [1] = 1,
        [2] = 2,
        [3] = 3,
        [4] = 4,
        [5] = 5,
        [6] = 6,
        [7] = 7,
        [69] = 8,
    },
    -- Beadeaux
    [147] = {
        [1] = 1,   -- Upper floor
        [15] = 2,  -- Lower floor
    },
    -- Giddeus
    [145] = {
        [1] = 1,   -- Upper floor
        [15] = 2,  -- Lower floor
    },
    -- Ghelsba Outpost
    [140] = {
        [1] = 1,   -- Upper floor
    },
    [142] = {
        [1] = 1,   -- Upper floor
        [15] = 2,  -- Lower floor
    },
    -- Palboruough Mines
    [143] = {
        [1] = 1,   -- Upper floor
        [2] = 2,  -- Lower floor
        [3] = 3,  -- Lower floor
    },
    [144] = {
        [1] = 1,
    },
    [151] = {
        [1] = 1,   -- Upper floor
        [2] = 2,  -- Lower floor
        [3] = 3,  -- Lower floor
        [4] = 4,  -- Lower floor
        [5] = 5,  -- Lower floor
        [6] = 6,  -- Lower floor
        [15] = 7,  -- Lower floor
    },
    -- The Boyahda Tree
    [153] = {
        [1] = 1,
    },
    -- Middle Delkfutt's Tower
    [157] = {
        [4] = 1,   -- Upper floor
        [5] = 2,  -- Lower floor
        [6] = 3,  -- Lower floor
        [7] = 4,  -- Lower floor
        [8] = 5,  -- Lower floor
        [9] = 6,  -- Lower floor
    },
    [158] = {
        [1] = 1,   -- Upper floor
        [2] = 2,  -- Lower floor
    },
    --Temple of Ugg
    [159] = {
        [1] = 1,   -- Upper floor
        [2] = 2,  -- Lower floor
        [3] = 3,
    },
    [161] = {
        [1] = 1,
        [2] = 2,
        [15] = 3,
        [16] = 4,
        [162] = 5,
    },
    [167] = {
        [15] = 1,
        [16] = 2,
    },
    [172] = {
        [0] = 1,
    },
    -- Kuftal Tunnel
    [174] = {
        [1] = 1,
        [2] = 2,
    },
    [176] = {
        [1] = 1,
    },
    [178] = {
        [1] = 1,
    },
    [184] = {
        [1] = 1,
    },
    -- King Ranperre's Tomb
    [190] = {
        [1] = 1,
    },
    [191] = {
        [1] = 1,
    },
    -- Inner Hurutoto Ruins
    [192] = {
        [1] = 1,
    },
    -- Ordelle's Cave
    [193] = {
        [1] = 1,
    },
    -- Outer Hurutoto Ruins
    [194] = {
        [3] = 1,
    },
    -- The Eldieme Necropolis
    [195] = {
        [15] = 1,
    },
    [196] = {
        [1] = 1,
        [14] = 2,
    },
    -- Crawler's Nest
    [197] = {
        [15] = 1,
    },
    -- Maze of Shakhrami
    [198] = {
        [15] = 1,
        --[16] = 2,
    },
    -- Garliage Citadel
    [200] = {
        [1] = 1,
    },
    [204] = {
        [1] = 1,
        [15] = 2,
    },
    -- Ifrit's Cauldron
    [205] = {
        [1] = 1,
    },
    -- Quicksand Caves
    [208] = {
        [1] = 1,
        [2] = 2,
        [3] = 3,
        [4] = 4,
        [5] = 5,
        [6] = 6,
        [7] = 7,
        [8] = 8,
    },
    [238] = {
        [1] = 1,
        [2] = 2,
    },
    --Hall of the Gods
    [251] = {
        [1] = 1,
    },
    -- [184] removed - uses auto-increment (sequential floor IDs)
    -- If floors don't increment properly, run /qh_checkfloor on each floor
    -- and add the actual raw IDs here

    -- Add more zones here as you discover them
    -- Example: Delkfutt's Tower
    -- [184] = {
    --     [0] = 1,   -- Floor 1
    --     [1] = 2,   -- Floor 2
    --     [2] = 3,   -- Floor 3
    --     -- etc...
    -- },
}
