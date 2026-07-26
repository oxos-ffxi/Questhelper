-----------------------------------------------------------------------------------
-- clue_tables.lua
--
-- Late-bound target tables for quests where the SERVER picks the objectives at
-- random and tells the player which ones it chose.
--
-- This is NOT quest content. modules/quest_data.lua only scans SUBDIRECTORIES of
-- data/ (Missions, Quests, Jobs, ...), so top-level files like this one are only
-- ever visible through an explicit require('data.clue_tables').
--
-- HOW IT IS USED
--   1. A step declares an `event_choices` block naming a table in here.
--   2. The capture handler watches incoming text for a `match` fragment and stores
--      the resolved {slot, index} pair in quest_state.
--   3. Later steps declare `dynamic_target = { table = ..., slot = ... }` and
--      resolve npc/zone/pos from the captured index at display time.
--
-- INDEXING
--   Sub-tables are keyed 0-7 to match the server's own comparisons verbatim
--   (`if quest:getVar(player, 'npcBastok') == 0 then ...`). They are therefore
--   0-BASED and sparse from Lua's point of view - use pairs(), never ipairs(),
--   and do not renumber them to 1-8. The whole point is that the key IS the
--   value the server sent.
--
-- MATCHING - read this before editing any `match` value
--   `match` is a SHORT fragment, matched with plain find(text, m, 1, true).
--   `clue` is the full hint, kept for DISPLAY only ("Maat said: ...").
--
--   Never match on the full clue. Confirmed in-game, Maat's dialogue uses
--   TYPOGRAPHIC punctuation - curly quotes around "hats suck." and curly
--   apostrophes in you've / I'm - which will not compare equal to the ASCII
--   quotes and apostrophes in a Lua source file. Every `match` below is chosen
--   to contain NO apostrophes and NO quotes for exactly that reason.
--
--   Each `match` is also verified to appear in one and only one of the 32 clues.
--   Watch the near-collisions if you change any:
--     - Babenn and Hilda both say "Palborough Mines" -> disambiguated by
--       "pioneer of the Palborough" vs "lost her husband".
--     - Mathilde and Celestina both say "Selbina" -> "weaving woman" vs
--       "all the way in Selbina".
--     - Lucius says "age of magic", Koru-Moru says "magic doll".
--
-- ORDERING
--   Maat lists the four hints on screen in the order Sandoria, Bastok,
--   Otherlands, Windurst - which is NOT the order the server passes them in
--   (progressEvent: sandoria, bastok, windurst, otherlands). Do not "fix" the
--   `slots` list to match the on-screen numbering; the two are unrelated, and
--   text capture resolves the slot from the matched clue anyway.
--
--   `zone` values must exist in data/zones.lua or route_to and /qh_validate break.
-----------------------------------------------------------------------------------

return {

    -----------------------------------------------------------------------------
    -- Limit Breaks / Genkai.lua  ->  ["Genkai 4: Riding on the Clouds"]
    -- Cap 65 -> 70. Maat picks one NPC per region; trade a Kindred's Seal to each
    -- of the four to receive that region's stone, then return to Maat.
    --
    -- Server: quest:progressEvent(88, npcSandoria, npcBastok, npcWindurst,
    --                                 npcOtherlands, 180)
    -- Event 89 re-sends the same four hints as a reminder, so re-speaking to Maat
    -- is a safe way to re-capture if the first set was missed.
    -----------------------------------------------------------------------------
    ['Genkai 4: Riding on the Clouds'] = {

        -- Param slot order as sent by the server. See ORDERING note above - this
        -- is NOT the order the hints appear on screen.
        slots = { 'sandoria', 'bastok', 'windurst', 'otherlands' },

        -- Each region hands over one distinct key item, so per-region completion
        -- needs no trade detection - just watch for the stone. Ids are the step's
        -- trigger_on_keyitem_obtain values; names are in data/keyitems.lua.
        rewards = {
            sandoria   = { id = 467, name = 'Scowling Stone' },
            bastok     = { id = 466, name = 'Smiling Stone'  },
            windurst   = { id = 469, name = 'Spirited Stone' },
            otherlands = { id = 468, name = 'Somber Stone'   },
        },

        -- Traded to every one of them. Regular item, not a key item.
        trade_item = { name = "Kindred's Seal", quantity = 4 },

        sandoria = {
            [0] = { npc = 'Raminel',     zone = "Southern San d'Oria", pos = 'F-8',  roving = true,
                    match = 'sick mother',
                    clue  = 'A boy who only thinks of his sick mother.' },
            [1] = { npc = 'Sobane',      zone = "Southern San d'Oria", pos = 'D-6',
                    match = 'knives sharp',
                    clue  = 'An Elvaan who likes her knives sharp.' },
            [2] = { npc = 'Taurette',    zone = "Northern San d'Oria", pos = 'F-7',
                    match = 'Royal Knight',
                    clue  = 'A little girl who wants to be a Royal Knight, just like her brother.' },
            [3] = { npc = 'Maloquedil',  zone = "Northern San d'Oria", pos = 'J-8',
                    match = 'breath stinks',
                    clue  = 'A young elvaan whose breath stinks.' },
            [4] = { npc = 'Sheridan',    zone = "Port San d'Oria",     pos = 'H-10',
                    match = 'not too rough',
                    clue  = "A young man looking for a job where they're not too rough with him." },
            [5] = { npc = 'Fontoumant',  zone = "Port San d'Oria",     pos = 'H-10',
                    match = 'Consortium warehouses',
                    clue  = 'An old man running the Consortium warehouses.' },
            [6] = { npc = 'Brifalien',   zone = "Port San d'Oria",     pos = 'H-8',
                    match = 'nirvana slash',
                    clue  = 'A second knight who specializes in the nirvana slash.' },
            [7] = { npc = 'Rugiette',    zone = "Port San d'Oria",     pos = 'J-8',
                    match = 'scrolls of Stone',
                    clue  = 'A shopkeeper who longs for customers that want more than scrolls of Stone.' },
        },

        bastok = {
            [0] = { npc = 'Babenn',      zone = 'Bastok Mines',    pos = 'J-6',
                    match = 'pioneer of the Palborough',
                    clue  = 'A pioneer of the Palborough Mines.' },
            [1] = { npc = 'Gwill',       zone = 'Bastok Markets',  pos = 'E-11',
                    match = 'Dalzakk',
                    clue  = "A boy watching over Dalzakk's home while he's off adventuring." },
            [2] = { npc = 'Brygid',      zone = 'Bastok Markets',  pos = 'K-9',
                    match = 'subligaria',
                    clue  = 'A girl who is positive robes and bronze subligaria are the latest fashion.' },
            [3] = { npc = 'Kaede',       zone = 'Port Bastok',     pos = 'J-5',
                    match = 'as good as her sister',
                    clue  = 'A girl who thinks she can never be as good as her sister.' },
            [4] = { npc = 'Hilda',       zone = 'Port Bastok',     pos = 'E-6',
                    match = 'lost her husband',
                    clue  = 'A woman who lost her husband in an accident in the Palborough Mines.' },
            [5] = { npc = 'Naji',        zone = 'Metalworks',      pos = 'J-8',
                    match = 'number five',
                    clue  = 'Bastok\'s number five "doorman."' },
            [6] = { npc = 'Raibaht',     zone = 'Metalworks',      pos = 'G-8',
                    match = 'Silent Mountain',
                    clue  = 'A man so quiet, his boss is ready to call him "Silent Mountain".' },
            [7] = { npc = 'Lucius',      zone = 'Metalworks',      pos = 'J-9',
                    match = 'age of magic',
                    clue  = 'A man who is ready to move Bastok into the age of magic.' },
        },

        windurst = {
            [0] = { npc = 'Koko Lihzeh',    zone = 'Windurst Waters North', pos = 'K-6',
                    match = 'smartest looking',
                    clue  = 'The smartest looking mithra child.' },
            [1] = { npc = 'Naiko-Paneiko',  zone = 'Windurst Waters South', pos = 'C-11',
                    match = 'something snappy',
                    clue  = 'A man looking for something snappy to hook his customers.' },
            [2] = { npc = 'Kerutoto',       zone = 'Windurst Waters South', pos = 'J-8',
                    match = 'strange little poppet',
                    clue  = 'A woman everybody called a "strange little poppet" when she was younger.' },
            [3] = { npc = 'Koru-Moru',      zone = 'Windurst Walls',        pos = 'E-7',
                    match = 'magic doll',
                    clue  = 'A man known for his magic doll upgrades.' },
            [4] = { npc = 'Shanruru',       zone = 'Port Windurst',         pos = 'H-5',
                    match = 'left out all the time',
                    clue  = 'A little girl sick of being left out all the time.' },
            [5] = { npc = 'Boizo-Naizo',    zone = 'Windurst Woods',        pos = 'H-10',
                    match = 'hats suck',
                    clue  = 'A man that gets upset when anyone tells him that "hats suck."' },
            [6] = { npc = 'Sola Jaab',      zone = 'Windurst Woods',        pos = 'K-10',
                    match = 'tasty frog',
                    clue  = 'A lady looking for another tasty frog.' },
            [7] = { npc = 'Kupipi',         zone = 'Heavens Tower',         pos = nil,
                    match = 'Rolanberry souvenirs',
                    clue  = 'A lady that jumps for joy at the sight of Rolanberry souvenirs.' },
        },

        otherlands = {
            [0] = { npc = 'Mathilde',       zone = 'Selbina', pos = 'H-9',
                    match = 'weaving woman',
                    clue  = 'A weaving woman who lost her memory in Selbina.' },
            [1] = { npc = 'Vobo',           zone = 'Selbina', pos = 'I-7',
                    match = 'great at hiding',
                    clue  = 'A Galkan child who is great at hiding.' },
            [2] = { npc = 'Melyon',         zone = 'Selbina', pos = 'I-9',
                    match = 'raising his own sheep',
                    clue  = 'A man who started raising his own sheep to get some good wool.' },
            [3] = { npc = 'Gabwaleid',      zone = 'Selbina', pos = 'H-9',
                    match = 'Zaldon',
                    clue  = 'A pupil of Zaldon who knows his fish.' },
            [4] = { npc = 'Celestina',      zone = 'Mhaura',  pos = 'G-8',
                    match = 'all the way in Selbina',
                    clue  = 'A girl whose fiance is all the way in Selbina.' },
            [5] = { npc = 'Ekokoko',        zone = 'Mhaura',  pos = 'F-9',
                    match = 'small mayor',
                    clue  = 'A small mayor in a small town.' },
            [6] = { npc = 'Bihoro-Guhoro',  zone = 'Mhaura',  pos = 'G-9',
                    match = 'about pirates',
                    clue  = "A guy who knows a lot about pirates for somebody that's never met one." },
            [7] = { npc = 'Jikka-Abukka',   zone = 'Mhaura',  pos = 'H-9',
                    match = 'work with monsters',
                    clue  = 'A kid that wants to work with monsters when he grows up.' },
        },
    },
}
