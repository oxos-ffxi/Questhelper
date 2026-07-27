-- =============================================================================
-- Limit Break (Genkai) quest line
-- =============================================================================
-- Authored from the wiki + server Lua, following data/ref/step_authoring_guide.md.
--
-- Plan (project memory: genkai-plan):
--   * Genkai 1-4 are SHARED across all jobs (level caps 50->55->60->65->70).
--       - typically item-collection / trial quests, same for every job.
--   * Genkai 5 is the MAAT FIGHT (cap 70->75) and differs PER JOB.
--       - build the 15 original jobs first.
--       - the addon does NOT detect the player's job, so each job's Maat fight is
--         its own entry the player selects manually (do NOT auto-branch on job).
--
-- This folder is auto-discovered as the "Limit Breaks" category by the loader
-- (modules/quest_data.lua). Each key below becomes a selectable entry; each entry
-- needs a `steps` table with at least one step so the UI renders cleanly.
--
-- Genkai 1 is split into TWO entries sharing choice_group "Genkai 1: In Defiant
-- Challenge" so the UI shows a "Choose one" between the FARMING route (kill mobs
-- for the drops - the original quest) and the KEY ITEM route (click ??? for each
-- item - a newer QOL addition). Splitting keeps each route's arrows on their own
-- step instead of overlapping in one. Complete EITHER to settle Genkai 1.
-- Order note: the UI sorts entries by name (utils.get_sorted_keys), so "Farming"
-- shows before "Key Item" (F < K); source order below matches that.
-- =============================================================================

return {
    ["Genkai 1: In Defiant Challenge - Item Drop"] = {
        -- Shared across ALL jobs. Log ID 3 / Quest ID 128 (jeuno.IN_DEFIANT_CHALLENGE).
        -- Original route: kill the listed mob in each dungeon for the item drop.
        -- Start: Maat, Ru'Lude Gardens (H-5). Requires Lv.50 with the level cap still at 50.
        choice_group = "Genkai 1: In Defiant Challenge",
        prerequisites = {
            {category = "Quests", subfile = "Garlaige Citadel", name = "Pouch of Weighted Stones", recommended = true},
            {category = "Quests", subfile = "Windurst Waters North", name = "Magicked Astrolabe", recommended = true},
        },
        requirements = {
            level = 50,
        },
        steps = {
            {
                text = "Step 1: Speak to Maat in Ru'Lude Gardens (H-5) to start the quest.\n \n" ..
                       "- Maat asks you to bring him an Exoray Mold, a Bomb Coal, and a sheet of Ancient Papyrus.\n \n" ..
                       "- Kill the listed mob in each dungeon for the drop. No quest Key Items required.\n",
                route_to = "Ru'Lude Gardens",
                onmob_target = "Maat",
                destination_highlight = { position = "H-5", offsetX = 16, offsetY = 16 },
                trigger_on_event_id = { 79 },
            },
            {
                text = "Step 2: Farm the Exoray Mold in Crawlers' Nest.\n \n" ..
                       "- Follow the YELLOW arrows to the Exorays and kill them for the drop.\n" ..
                       "- Exorays are in the tunnel to the donut room, starting around (I-10) on Map 1.\n" ..
                       "- WARNING: Exorays use Silence Gas and Spore (ice/paralysis) - mages bring Echo Drops and consider /whm.\n \n",
                zone_max_distance = 20,
                visual_zones = {
                        -- Route to kill the Exorays for the Mold drop
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 367.2, y = -32.3, z = -21.1 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'square', center = { x = 364.0, y = -32.2, z = -23.0 }, size = 1, floor_id = 15, colour = "green" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 329.4, y = -32.3, z = -17.9 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 300.3, y = -32.3, z = -32.8 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 278.8, y = -32.1, z = -59.5 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 259.7, y = -32.5, z = -48.2 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 220.4, y = -32.4, z = -19.9 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 180.0, y = -32.3, z = -16.7 }, size = 3, direction = "sw", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 162.9, y = -32.4, z = -19.0 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 139.1, y = -32.2, z = -27.6 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 139.6, y = -37.3, z = -58.0 }, size = 3, direction = "sw", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'line', start = { x = 129.6, y = -41.4, z = -72.8 }, stop = { x = 127.7, y = -32.0, z = -80.4 }, floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 123.0, y = -32.2, z = -81.6 }, size = 3, direction = "nw", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 103.3, y = -32.5, z = -73.2 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 77.8, y = -32.2, z = -60.3 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 59.0, y = -32.3, z = -42.0 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 59.8, y = -35.1, z = -29.6 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 53.9, y = -37.3, z = -28.1 }, size = 3, direction = "ne", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 61.2, y = -33.4, z = -7.6 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        zone_name = "Crawlers' Nest",
                        floor_id = 15,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        zone_name = "Crawlers' Nest",
                        floor_id = 16,
                        highlights = {
                            { position = "H-11", offsetX = 16, offsetY = 16 },
                            { position = "I-11", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
                onmob_enemy = "Exoray",
                onmob_enemy_size = 2,
                trigger_on_item_obtain = { "Exoray Mold" }, -- VERIFY display name (LSB: CLUMP_OF_EXORAY_MOLD)
            },
            {
                text = "Step 3: Farm the Bomb Coal in Garlaige Citadel.\n \n" ..
                       "- Just click door if you have the Weighted Stones, otherwise be nice to 3 other people and have them step on the purple latches! \n \n" ..
                       "- Explosures (at (I-8) past the first Banishing Gate drop Bomb Coal at a high rate.\n" ..
                       "- WARNING: Use Sneak + Invisible to avoid aggro throughout Map 2.\n \n",
                zone_max_distance = 20,
                visual_zones = {
                        -- To Banshing Gate 1
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -380.1, y = -7.8, z = 375.0 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'square', center = { x = -383.0, y = -6.0, z = 363.5 }, size = 1, floor_id = 1, colour = "green" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -366.3, y = -6.0, z = 340.3 }, size = 3, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -340.4, y = -3.3, z = 337.6 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -339.8, y = 0.0, z = 300.8 }, size = 3, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -328.0, y = 0.0, z = 300.1 }, size = 3, direction = "ne", floor_id = 1, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -309.7, y = 0.0, z = 300.0 }, size = 3, direction = "se", floor_id = 1, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -297.8, y = 0.0, z = 292.0 }, size = 3, direction = "ne", floor_id = 1, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -283.8, y = 0.0, z = 300.4 }, size = 3, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -259.4, y = 0.0, z = 300.4 }, size = 3, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -248.2, y = 0.0, z = 300.2 }, size = 3, direction = "ne", floor_id = 1, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -234.8, y = 0.0, z = 299.6 }, size = 3, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -221.1, y = 0.0, z = 298.8 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -219.8, y = 0.0, z = 288.4 }, size = 3, direction = "sw", floor_id = 1, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -222.0, y = 0.0, z = 279.1 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -227.7, y = 0.0, z = 257.4 }, size = 3, direction = "se", floor_id = 1, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -220.4, y = 0.0, z = 242.9 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -221.6, y = 0.0, z = 220.1 }, size = 3, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'rect', center = { x = -201.0, y = -3.0, z = 220.0 }, width = 6.25, height = 6.00, floor_id = 1, colour = "cyan", vertical_axis = 'z' },

                        -- Step on squares to open door if no KI weighted stones
                        { zone_name = "Garlaige Citadel", type = 'rect', center = { x = -207.2, y = -0.3, z = 226.3 }, width = 1.75, height = 2.75, floor_id = 1, colour = "magenta" },
                        { zone_name = "Garlaige Citadel", type = 'rect', center = { x = -213.0, y = -0.3, z = 226.3 }, width = 1.75, height = 2.75, floor_id = 1, colour = "magenta" },
                        { zone_name = "Garlaige Citadel", type = 'rect', center = { x = -212.8, y = -0.3, z = 213.8 }, width = 1.75, height = 2.75, floor_id = 1, colour = "magenta" },
                        { zone_name = "Garlaige Citadel", type = 'rect', center = { x = -207.2, y = -0.3, z = 213.8 }, width = 1.75, height = 2.75, floor_id = 1, colour = "magenta" },

                        -- To the BOMBS!!
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -194.6, y = 0.0, z = 219.8 }, size = 3, direction = "right", floor_id = 2, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -180.7, y = 0.0, z = 217.8 }, size = 3, direction = "down", floor_id = 2, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -180.1, y = 0.0, z = 195.3 }, size = 3, direction = "down", floor_id = 2, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -179.0, y = 0.0, z = 178.9 }, size = 3, direction = "right", floor_id = 2, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -166.9, y = 0.0, z = 179.3 }, size = 3, direction = "right", floor_id = 2, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -140.1, y = 0.0, z = 179.0 }, size = 3, direction = "right", floor_id = 2, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -117.5, y = 0.0, z = 179.3 }, size = 3, direction = "right", floor_id = 2, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -100.0, y = 0.0, z = 179.2 }, size = 3, direction = "up", floor_id = 2, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -99.8, y = 0.0, z = 205.2 }, size = 3, direction = "up", floor_id = 2, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -97.5, y = 0.0, z = 220.0 }, size = 3, direction = "right", floor_id = 2, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -68.7, y = 0.0, z = 218.2 }, size = 3, direction = "se", floor_id = 2, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -59.7, y = 0.0, z = 200.0 }, size = 3, direction = "down", floor_id = 2, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -60.1, y = 5.3, z = 171.3 }, size = 3, direction = "down", floor_id = 2, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -58.2, y = 5.9, z = 150.5 }, size = 3, direction = "se", floor_id = 2, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -49.1, y = 6.9, z = 144.3 }, size = 3, direction = "right", floor_id = 2, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -38.1, y = 6.1, z = 143.1 }, size = 3, direction = "se", floor_id = 2, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -24.7, y = 7.6, z = 140.9 }, size = 3, direction = "ne", floor_id = 2, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -19.5, y = 5.9, z = 152.9 }, size = 3, direction = "up", floor_id = 2, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -19.7, y = 6.1, z = 177.3 }, size = 3, direction = "ne", floor_id = 2, colour = "yellow" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        zone_name = "Garlaige Citadel",
                        floor_id = 1,
                        highlights = {
                            { position = "I-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        zone_name = "Garlaige Citadel",
                        floor_id = 2,
                        highlights = {
                            { position = "I-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        zone_name = "Garlaige Citadel",
                        floor_id = 16,
                        highlights = {
                            { position = "H-11", offsetX = 16, offsetY = 16 },
                            { position = "I-11", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
                onmob_enemy = "Explosure",
                onmob_enemy_size = 2,
                trigger_on_item_obtain = { "Bomb Coal" }, -- VERIFY display name (LSB: CHUNK_OF_BOMB_COAL)
            },
            {
                text = "Step 4: Farm the Ancient Papyrus in The Eldieme Necropolis.\n \n" ..
                       "- Liches on the first level (Map 1) drop Ancient Papyrus (sparse spawns) - Make a Thief friend with Treasure Hunter.\n" ..
                       "- If the GATE is shut, follow the PURPLE line to and from the GATE - once you open go back to following yellow arrows! \n \n",
                route_to = "The Eldieme Necropolis",
                destination_highlight = { position = "H-9", offsetX = 16, offsetY = 16},
                onmob_target = "the-eldieme-necropolis-east-plate-h8",
                zone_max_distance = 20,
                visual_zones = {
                        --Route to J-10 The Eldieme Necrolpolios
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 424.2, y = 8.0, z = -142.7 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 388.5, y = 8.4, z = -176.6 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 353.5, y = 8.4, z = -207.3 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 322.7, y = 0.0, z = -238.1 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 289.5, y = 2.6, z = -268.9 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 246.2, y = 7.7, z = -299.6 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 218.3, y = 8.9, z = -323.3 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 204.3, y = 8.8, z = -342.9 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 204.9, y = 8.4, z = -372.8 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 198.3, y = 8.0, z = -402.1 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 177.9, y = 8.1, z = -417.7 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 138.3, y = 11.6, z = -378.6 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },

                        -- 1st keyitem.
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 420.5, y = -56.0, z = -115.6 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'square', center = { x = 418.0, y = -52.0, z = -99.5 }, size = 1, floor_id = 15, colour = "green" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 420.3, y = -50.8, z = -92.7 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 420.7, y = -48.0, z = -57.8 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 420.8, y = -42.3, z = -10.7 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 401.6, y = -40.0, z = 19.8 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 380.2, y = -40.0, z = 20.3 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 378.9, y = -36.0, z = -19.7 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 328.5, y = -32.0, z = -59.6 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },

                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 316.7, y = -32.0, z = -60.3 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 308.3, y = -32.0, z = -56.9 }, size = 3, direction = "nw", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 300.9, y = -32.0, z = -49.5 }, size = 3, direction = "sw", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 284.1, y = -32.2, z = -59.7 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 273.3, y = -32.0, z = -59.9 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        --Shivas Gate
                        { zone_name = "The Eldieme Necropolis", type = 'rect', center = { x = 271.0, y = -34.3, z = -60.0 }, width = 4.25, height = 4.75, floor_id = 15, colour = "cyan", vertical_axis = 'z' },

                        -- PURPLE ARROWS TO GATE
                        { zone_name = "The Eldieme Necropolis", type = 'line', start = { x = 301.1, y = -32.0, z = -43.4 }, stop = { x = 300.0, y = -32.0, z = -34.0 }, floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'line', start = { x = 300.0, y = -32.0, z = -34.0 }, stop = { x = 299.8, y = -32.0, z = -26.9 }, floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'line', start = { x = 299.8, y = -32.0, z = -26.9 }, stop = { x = 299.3, y = -32.0, z = -17.2 }, floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'line', start = { x = 299.3, y = -32.0, z = -17.2 }, stop = { x = 299.5, y = -32.0, z = -4.9 }, floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'line', start = { x = 299.5, y = -32.0, z = -4.9 }, stop = { x = 299.2, y = -28.0, z = 1.8 }, floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'line', start = { x = 299.2, y = -28.0, z = 1.8 }, stop = { x = 289.4, y = -28.0, z = 1.8 }, floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'line', start = { x = 289.4, y = -28.0, z = 1.8 }, stop = { x = 281.5, y = -28.0, z = 2.2 }, floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'line', start = { x = 281.5, y = -28.0, z = 2.2 }, stop = { x = 281.7, y = -28.0, z = 11.3 }, floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'line', start = { x = 281.7, y = -28.0, z = 11.3 }, stop = { x = 282.0, y = -28.0, z = 19.7 }, floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'line', start = { x = 282.0, y = -28.0, z = 19.7 }, stop = { x = 272.9, y = -32.0, z = 19.5 }, floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'line', start = { x = 272.9, y = -32.0, z = 19.5 }, stop = { x = 264.7, y = -32.0, z = 19.4 }, floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'line', start = { x = 264.7, y = -32.0, z = 19.4 }, stop = { x = 257.4, y = -32.0, z = 19.3 }, floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'line', start = { x = 257.4, y = -32.0, z = 19.3 }, stop = { x = 257.2, y = -32.0, z = 15.0 }, floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'line', start = { x = 257.2, y = -32.0, z = 15.0 }, stop = { x = 250.0, y = -32.0, z = 16.1 }, floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'line', start = { x = 250.0, y = -32.0, z = 16.1 }, stop = { x = 250.0, y = -32.0, z = 19.6 }, floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'line', start = { x = 250.0, y = -32.0, z = 19.6 }, stop = { x = 240.2, y = -32.3, z = 20.2 }, floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'line', start = { x = 240.2, y = -32.3, z = 20.2 }, stop = { x = 233.8, y = -34.0, z = 19.9 }, floor_id = 15, colour = "magenta" },

                },
                onmob_enemy = "Lich",
                onmob_enemy_size = 2,
                trigger_on_item_obtain = { "Ancient Papyrus" },
            },
            {
                text = "Step 5: Return to Maat in Ru'Lude Gardens (H-5) and trade him all three items together (Exoray Mold, Bomb Coal, Ancient Papyrus) to finish.\n \n",
                route_to = "Ru'Lude Gardens",
                onmob_target = "Maat",
                destination_highlight = { position = "H-5", offsetX = 16, offsetY = 16 },
                items_needed = { "Exoray Mold", "Bomb Coal", "Ancient Papyrus" },
                --require_all_items = true,
                trigger_on_event_id = { 81 },
            },
        },
        reward = {
            text = "Title: Horizon Breaker.\n \n" ..
                   "- Your level cap is raised to 55.\n \n",
        },
    },

    ["Genkai 1: In Defiant Challenge - Key Item"] = {
        -- Same quest, newer QOL route: click all THREE ??? per dungeon to receive
        -- each finished item (fragments combine automatically).
        choice_group = "Genkai 1: In Defiant Challenge",
        prerequisites = {
            {category = "Quests", subfile = "Garlaige Citadel", name = "Pouch of Weighted Stones", recommended = true},
            {category = "Quests", subfile = "Windurst Waters North", name = "Magicked Astrolabe", recommended = true},
        },
        requirements = {
            level = 50,
        },
        steps = {
            {
                text = "Step 1: Speak to Maat in Ru'Lude Gardens (H-5) to start the quest.\n \n" ..
                       "- Maat asks you to bring him an Exoray Mold, a Bomb Coal, and a sheet of Ancient Papyrus.\n \n" ..
                       "- Click all THREE ??? in each item's dungeon to receive the finished item (fragments combine automatically). You MUST have started the quest with Maat first.\n",
                route_to = "Ru'Lude Gardens",
                onmob_target = "Maat",
                keyitems_needed = {2134,2135,2136,2137,2138,2139,2140,2141,2142},
                destination_highlight = { position = "H-5", offsetX = 16, offsetY = 16 },
                trigger_on_event_id = { 79 },
            },
            {
                text = "Step 2: Get the Exoray Mold Crumb in Crawlers' Nest.\n \n" ..
                       "- Follow the arrows to the ??? (marked KI on the map).\n",
                onmob_target = "crawlers-nest-g10-???",
                zone_max_distance = 20,
                visual_zones = {
                        -- Route to the 3 KEYITEM ??? for the mold
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 367.2, y = -32.3, z = -21.1 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'square', center = { x = 364.0, y = -32.2, z = -23.0 }, size = 1, floor_id = 15, colour = "green" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 329.4, y = -32.3, z = -17.9 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 300.3, y = -32.3, z = -32.8 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 278.8, y = -32.1, z = -59.5 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 259.7, y = -32.5, z = -48.2 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 220.4, y = -32.4, z = -19.9 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 180.0, y = -32.3, z = -16.7 }, size = 3, direction = "sw", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 162.9, y = -32.4, z = -19.0 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 139.1, y = -32.2, z = -27.6 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 139.6, y = -37.3, z = -58.0 }, size = 3, direction = "sw", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'line', start = { x = 129.6, y = -41.4, z = -72.8 }, stop = { x = 127.7, y = -32.0, z = -80.4 }, floor_id = 15, colour = "yellow" },

                        -- to KI 1
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 124.0, y = -32.3, z = -81.0 }, size = 3, direction = "nw", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 111.6, y = -33.5, z = -71.6 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 95.8, y = -32.3, z = -70.5 }, size = 3, direction = "nw", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 81.2, y = -32.0, z = -60.1 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 58.0, y = -32.2, z = -53.5 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 57.9, y = -32.2, z = -38.3 }, size = 3, direction = "nw", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 53.3, y = -34.7, z = -32.6 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 55.5, y = -38.2, z = -25.3 }, size = 3, direction = "ne", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 61.8, y = -33.3, z = -7.4 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 59.9, y = -27.8, z = 19.0 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 21.6, y = -20.0, z = 22.8 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 19.5, y = -16.6, z = 3.9 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 19.8, y = -12.4, z = -15.6 }, size = 3, direction = "se", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 40.3, y = -8.2, z = -21.2 }, size = 3, direction = "right", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 60.4, y = -3.1, z = -15.0 }, size = 3, direction = "up", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 60.4, y = -0.3, z = 9.7 }, size = 3, direction = "up", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 60.3, y = -0.1, z = 42.0 }, size = 3, direction = "up", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 60.3, y = -0.2, z = 81.6 }, size = 3, direction = "up", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 59.3, y = -0.4, z = 99.7 }, size = 3, direction = "up", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 61.2, y = -0.3, z = 130.1 }, size = 3, direction = "up", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 59.7, y = -0.2, z = 154.6 }, size = 3, direction = "up", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 59.2, y = -6.0, z = 179.9 }, size = 3, direction = "nw", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 50.7, y = -8.7, z = 189.7 }, size = 3, direction = "nw", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'line', start = { x = 47.6, y = -8.2, z = 192.0 }, stop = { x = 46.9, y = -2.0, z = 195.4 }, floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 47.9, y = -0.0, z = 199.7 }, size = 3, direction = "up", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 50.9, y = -0.2, z = 214.5 }, size = 3, direction = "right", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 82.7, y = -0.1, z = 218.7 }, size = 3, direction = "right", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 101.6, y = -0.3, z = 229.0 }, size = 3, direction = "up", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 101.4, y = -0.3, z = 255.8 }, size = 3, direction = "nw", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 80.1, y = -0.1, z = 260.7 }, size = 3, direction = "left", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 57.7, y = -0.5, z = 264.9 }, size = 3, direction = "up", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 60.3, y = -0.5, z = 300.9 }, size = 3, direction = "left", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 32.7, y = -2.0, z = 301.6 }, size = 3, direction = "left", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 19.4, y = -6.1, z = 297.5 }, size = 3, direction = "sw", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 8.3, y = -9.0, z = 290.4 }, size = 3, direction = "sw", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'line', start = { x = 8.3, y = -9.0, z = 290.4 }, stop = { x = 4.3, y = -1.9, z = 286.9 }, floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 0.1, y = -0.2, z = 283.4 }, size = 3, direction = "sw", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -14.5, y = -0.5, z = 267.2 }, size = 3, direction = "sw", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -29.8, y = -0.4, z = 259.0 }, size = 3, direction = "left", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -49.5, y = -2.6, z = 260.7 }, size = 3, direction = "left", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -61.4, y = -6.3, z = 256.9 }, size = 3, direction = "sw", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -70.8, y = -8.9, z = 249.7 }, size = 3, direction = "sw", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'line', start = { x = -70.8, y = -8.9, z = 249.7 }, stop = { x = -78.7, y = -0.2, z = 242.9 }, floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -76.9, y = -0.2, z = 240.8 }, size = 3, direction = "right", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -66.3, y = -0.0, z = 239.8 }, size = 3, direction = "down", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -67.5, y = -0.6, z = 225.5 }, size = 3, direction = "se", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -58.7, y = -0.2, z = 203.9 }, size = 3, direction = "down", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -59.6, y = -3.0, z = 185.1 }, size = 3, direction = "sw", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -71.6, y = -6.6, z = 180.8 }, size = 3, direction = "left", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -97.4, y = -11.5, z = 179.6 }, size = 3, direction = "sw", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -100.0, y = -15.5, z = 163.1 }, size = 3, direction = "down", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -98.7, y = -12.8, z = 145.3 }, size = 3, direction = "down", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'line', start = { x = -98.4, y = -12.9, z = 142.5 }, stop = { x = -98.4, y = -10.5, z = 140.5 }, floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -97.0, y = -10.4, z = 138.7 }, size = 3, direction = "right", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -60.9, y = -8.5, z = 140.4 }, size = 3, direction = "down", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -59.4, y = -8.2, z = 115.3 }, size = 3, direction = "down", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -65.6, y = -8.3, z = 94.4 }, size = 3, direction = "sw", floor_id = 16, colour = "yellow" },

                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        zone_name = "Crawlers' Nest",
                        floor_id = 15,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        zone_name = "Crawlers' Nest",
                        floor_id = 16,
                        highlights = {
                            { position = "G-10", offsetX = 16, offsetY = 16, label = "1" },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        zone_name = "Crawlers' Nest",
                        floor_id = 17,
                        highlights = {
                            { position = "I-11", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
                trigger_on_item_obtain = { "Exoray Mold" },
                trigger_on_keyitem_obtain = {2137},
            },
            {
                text = "Step 3: Get the second Exoray Mold Crumb in Crawlers' Nest.\n \n" ..
                       "- Follow the arrows to the ??? (marked KI on the map).\n",
                onmob_target = "crawlers-nest-i10-???",
                zone_max_distance = 20,
                visual_zones = {
                        -- Route to the 3 KEYITEM ??? for the mold
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -80.1, y = -8.2, z = 82.6 }, size = 3, direction = "ne", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -67.6, y = -8.4, z = 93.7 }, size = 3, direction = "ne", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -59.3, y = -8.1, z = 120.7 }, size = 3, direction = "up", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -59.9, y = -8.4, z = 143.0 }, size = 3, direction = "right", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -18.8, y = -8.4, z = 139.9 }, size = 3, direction = "right", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 6.5, y = -6.8, z = 139.0 }, size = 3, direction = "right", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 15.8, y = -4.6, z = 138.6 }, size = 3, direction = "right", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'line', start = { x = 17.3, y = -4.7, z = 138.7 }, stop = { x = 18.8, y = -2.5, z = 138.4 }, floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 19.3, y = -2.3, z = 136.6 }, size = 3, direction = "se", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 18.1, y = -0.1, z = 117.3 }, size = 3, direction = "down", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 29.5, y = -0.4, z = 98.7 }, size = 3, direction = "right", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 61.0, y = -0.4, z = 98.2 }, size = 3, direction = "down", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 59.1, y = 0.0, z = 61.7 }, size = 3, direction = "down", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 59.9, y = -0.4, z = 20.2 }, size = 3, direction = "down", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 61.5, y = -1.2, z = -7.0 }, size = 3, direction = "down", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 58.1, y = -3.6, z = -17.4 }, size = 3, direction = "sw", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 44.2, y = -7.3, z = -20.0 }, size = 3, direction = "left", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 23.5, y = -11.3, z = -19.4 }, size = 3, direction = "nw", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 18.9, y = -16.2, z = 1.3 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 28.8, y = -21.7, z = 20.2 }, size = 3, direction = "right", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 60.1, y = -31.6, z = 2.6 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 60.7, y = -37.3, z = -24.9 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 60.1, y = -32.2, z = -57.8 }, size = 3, direction = "se", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 92.9, y = -32.3, z = -67.7 }, size = 3, direction = "se", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 102.9, y = -32.6, z = -83.1 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 108.2, y = -32.6, z = -93.7 }, size = 3, direction = "se", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 114.1, y = -32.5, z = -100.0 }, size = 3, direction = "sw", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 101.5, y = -32.3, z = -124.3 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 99.1, y = -32.4, z = -148.3 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 102.3, y = -32.2, z = -161.7 }, size = 3, direction = "se", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 108.5, y = -35.7, z = -169.7 }, size = 3, direction = "sw", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 104.2, y = -38.2, z = -174.7 }, size = 3, direction = "sw", floor_id = 15, colour = "yellow" },

                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        zone_name = "Crawlers' Nest",
                        floor_id = 15,
                        highlights = {
                            { position = "I-10", offsetX = 16, offsetY = 16,label = "2" },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        zone_name = "Crawlers' Nest",
                        floor_id = 16,
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        zone_name = "Crawlers' Nest",
                        floor_id = 17,
                        highlights = {
                            { position = "I-11", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
                trigger_on_item_obtain = { "Exoray Mold" }, -- VERIFY display name (LSB: CLUMP_OF_EXORAY_MOLD)
                trigger_on_keyitem_obtain = {2138},
            },
             {
                text = "Step 4: Get the final Exoray Mold Crumb in Crawlers' Nest.\n \n" ..
                       "- Follow the arrows to the ??? (marked KI on the map).\n",
                onmob_target = "crawlers-nest-i6-???",
                zone_max_distance = 20,
                visual_zones = {
                        -- Route to the 3 KEYITEM ??? for the mold
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 97.9, y = -38.5, z = -181.5 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 113.2, y = -25.2, z = -220.6 }, size = 3, direction = "right", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 141.0, y = -19.0, z = -214.1 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 140.4, y = -15.4, z = -195.9 }, size = 3, direction = "up", floor_id = 17, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 133.7, y = -10.9, z = -179.5 }, size = 3, direction = "left", floor_id = 17, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 102.1, y = -4.1, z = -176.3 }, size = 3, direction = "down", floor_id = 17, colour = "yellow" },

                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Crawlers' Nest",
                        floor_id = 15,
                        highlights = {
                            { position = "J-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Crawlers' Nest",
                        floor_id = 16,
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Crawlers' Nest",
                        floor_id = 17,
                        highlights = {
                            { position = "I-6", offsetX = 16, offsetY = 16, label = "3" },
                        },
                    },
                },
                trigger_on_item_obtain = { "Exoray Mold" }, -- VERIFY display name (LSB: CLUMP_OF_EXORAY_MOLD)
                trigger_on_keyitem_obtain = {2139},
            },
            {
                text = "Step 5: Get the Bomb Coal in Garlaige Citadel (Key Item ??? x3).\n \n" ..
                       "- All three are on Map 2. Use a 'Pouch of Weighted Stones' to pass the first Banishing Gate.\n" ..
                       "- The ??? are at (I-8), (H-7) and (G-6) in the first room on the right from the east.\n" ..
                       "- CRITICAL: click ALL THREE ??? to receive the Bomb Coal.\n" ..
                       "- WARNING: Use Sneak + Invisible to avoid aggro throughout Map 2.\n \n",
                onmob_target = {"garlaige-citadel-i8-bcf-1-???",
                                "garlaige-citadel-h7-bcf-2-???"},
                zone_max_distance = 25,
                visual_zones = {
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -380.1, y = -7.8, z = 375.0 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'square', center = { x = -383.0, y = -6.0, z = 363.5 }, size = 1, floor_id = 1, colour = "green" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -366.3, y = -6.0, z = 340.3 }, size = 3, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -340.4, y = -3.3, z = 337.6 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -339.8, y = 0.0, z = 300.8 }, size = 3, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -328.0, y = 0.0, z = 300.1 }, size = 3, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -309.7, y = 0.0, z = 300.0 }, size = 3, direction = "se", floor_id = 1, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -297.8, y = 0.0, z = 292.0 }, size = 3, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -283.8, y = 0.0, z = 300.4 }, size = 3, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -259.4, y = 0.0, z = 300.4 }, size = 3, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -248.2, y = 0.0, z = 300.2 }, size = 3, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -234.8, y = 0.0, z = 299.6 }, size = 3, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -221.1, y = 0.0, z = 298.8 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -219.8, y = 0.0, z = 288.4 }, size = 3, direction = "sw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -222.0, y = 0.0, z = 279.1 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -227.7, y = 0.0, z = 257.4 }, size = 3, direction = "se", floor_id = 1, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -220.4, y = 0.0, z = 242.9 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -221.6, y = 0.0, z = 220.1 }, size = 3, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'rect', center = { x = -201.0, y = -3.0, z = 220.0 }, width = 6.25, height = 6.00, floor_id = 1, colour = "cyan", vertical_axis = 'z' },

                    -- Step on squares to open door if no KI weighted stones
                    { zone_name = "Garlaige Citadel", type = 'rect', center = { x = -207.2, y = -0.3, z = 226.3 }, width = 1.75, height = 2.75, floor_id = 1, colour = "magenta" },
                    { zone_name = "Garlaige Citadel", type = 'rect', center = { x = -213.0, y = -0.3, z = 226.3 }, width = 1.75, height = 2.75, floor_id = 1, colour = "magenta" },
                    { zone_name = "Garlaige Citadel", type = 'rect', center = { x = -212.8, y = -0.3, z = 213.8 }, width = 1.75, height = 2.75, floor_id = 1, colour = "magenta" },
                    { zone_name = "Garlaige Citadel", type = 'rect', center = { x = -207.2, y = -0.3, z = 213.8 }, width = 1.75, height = 2.75, floor_id = 1, colour = "magenta" },

                    -- To 1st Bomb KI
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -197.0, y = 0.0, z = 219.9 }, size = 3, direction = "right", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -179.4, y = 0.0, z = 218.9 }, size = 3, direction = "down", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -177.6, y = 0.0, z = 179.2 }, size = 3, direction = "right", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -141.2, y = 0.0, z = 179.1 }, size = 3, direction = "right", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -114.8, y = 0.0, z = 179.2 }, size = 3, direction = "right", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -100.1, y = 0.0, z = 180.1 }, size = 3, direction = "up", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -99.7, y = 0.0, z = 201.1 }, size = 3, direction = "up", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -98.3, y = 0.0, z = 219.9 }, size = 3, direction = "right", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -70.3, y = 0.0, z = 219.5 }, size = 3, direction = "se", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -60.3, y = 0.0, z = 200.5 }, size = 3, direction = "down", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -60.2, y = 6.0, z = 164.2 }, size = 3, direction = "down", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -54.7, y = 6.4, z = 145.0 }, size = 3, direction = "right", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -40.0, y = 6.1, z = 143.2 }, size = 3, direction = "se", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -29.5, y = 7.6, z = 138.5 }, size = 3, direction = "ne", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -19.6, y = 6.0, z = 155.0 }, size = 3, direction = "up", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -15.6, y = 6.1, z = 182.7 }, size = 3, direction = "up", floor_id = 2, colour = "yellow" },

                    -- To 2nd/3rd
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -14.3, y = 6.5, z = 201.4 }, size = 3, direction = "up", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -18.4, y = 9.0, z = 219.4 }, size = 3, direction = "nw", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -38.6, y = 7.0, z = 239.6 }, size = 3, direction = "nw", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -55.8, y = 6.1, z = 258.8 }, size = 3, direction = "nw", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -58.6, y = 5.9, z = 274.1 }, size = 3, direction = "up", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -59.4, y = 5.9, z = 312.3 }, size = 3, direction = "up", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -59.9, y = 2.8, z = 340.8 }, size = 3, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -99.8, y = 0.0, z = 339.9 }, size = 3, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -129.1, y = 0.0, z = 339.6 }, size = 3, direction = "up", floor_id = 2, colour = "yellow" },
                  },
                  images = {
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Garlaige Citadel",
                        floor_id = 1,
                        highlights = {
                            { position = "I-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Garlaige Citadel",
                        floor_id = 2,
                        highlights = {
                            { position = "I-8", offsetX = 16, offsetY = 16, label = "1" },
                            { position = "H-7", offsetX = 16, offsetY = 16, label = "2" },
                            { position = "G-6", offsetX = 16, offsetY = 16, label = "3" },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Garlaige Citadel",
                        floor_id = 16,
                        highlights = {
                            { position = "G-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
                onmob_enemy = "Explosure",
                onmob_enemy_size = 2,
                trigger_on_item_obtain = { "Bomb Coal" }, -- VERIFY display name (LSB: CHUNK_OF_BOMB_COAL) - 3 crumb KIs combine into 1 Bomb Coal, so complete on the finished item
            },
            {
                text = "Step 6: Get the Ancient Papyrus in The Eldieme Necropolis (Key Item ??? x3).\n \n" ..
                       "- All three are on Map 1, in the small rooms containing Braziers, at [1](H-9), [3](F-9) and [2](F-7).\n" ..
                       "- A 'Magicked Astrolabe' opens any door on click. Without it, the gate switch is at (H-8) - watch for false floors that look like gravel.\n \n" ..
                       "- CRITICAL: click ALL THREE ??? to receive the Ancient Papyrus.\n" ..
                       "- Notes: The order is 1 -> 2 -> 3 from the map, but we will pick the Ancient Papyrus Shreds in order 1 -> 3 -> 2(incases there's confusion as its a nicer route!\n \n",
                route_to = "The Eldieme Necropolis",
                destination_highlight = {
                    { position = "H-9", offsetX = 16, offsetY = 16, label = "1" },
                    { position = "F-9", offsetX = 16, offsetY = 16, label = "3" },
                    { position = "F-7", offsetX = 16, offsetY = 16, label = "2" },
                },
                onmob_target = {"the-eldieme-necropolis-h9-aps-1-???",
                                "the-eldieme-necropolis-f9-aps-3-???",
                                "the-eldieme-necropolis-f7-aps-2-???"},
                zone_max_distance = 30,
                visual_zones = {
                        --Route to J-10 The Eldieme Necrolpolios
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 424.2, y = 8.0, z = -142.7 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 388.5, y = 8.4, z = -176.6 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 353.5, y = 8.4, z = -207.3 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 322.7, y = 0.0, z = -238.1 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 289.5, y = 2.6, z = -268.9 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 246.2, y = 7.7, z = -299.6 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 218.3, y = 8.9, z = -323.3 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 204.3, y = 8.8, z = -342.9 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 204.9, y = 8.4, z = -372.8 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 198.3, y = 8.0, z = -402.1 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 177.9, y = 8.1, z = -417.7 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 138.3, y = 11.6, z = -378.6 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },

                        -- 1st keyitem.
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 420.5, y = -56.0, z = -115.6 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'square', center = { x = 418.0, y = -52.0, z = -99.5 }, size = 1, floor_id = 15, colour = "green" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 420.3, y = -50.8, z = -92.7 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 420.7, y = -48.0, z = -57.8 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 420.8, y = -42.3, z = -10.7 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 401.6, y = -40.0, z = 19.8 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 380.2, y = -40.0, z = 20.3 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 378.9, y = -36.0, z = -19.7 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 328.5, y = -32.0, z = -59.6 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },

                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 316.7, y = -32.0, z = -60.3 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 308.3, y = -32.0, z = -56.9 }, size = 3, direction = "nw", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 300.9, y = -32.0, z = -49.5 }, size = 3, direction = "sw", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 284.1, y = -32.2, z = -59.7 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 273.3, y = -32.0, z = -59.9 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        --Shivas Gate
                        { zone_name = "The Eldieme Necropolis", type = 'rect', center = { x = 271.0, y = -34.3, z = -60.0 }, width = 4.25, height = 4.75, floor_id = 15, colour = "cyan", vertical_axis = 'z' },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 266.1, y = -32.0, z = -58.6 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 263.6, y = -32.0, z = -66.6 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },

                        --3rd Keyitem
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 250.4, y = -32.0, z = -60.0 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 230.3, y = -32.0, z = -59.1 }, size = 3, direction = "nw", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 220.6, y = -32.0, z = -47.2 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 218.6, y = -32.0, z = -28.2 }, size = 3, direction = "nw", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 205.9, y = -32.0, z = -20.0 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 185.9, y = -32.0, z = -20.2 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 160.0, y = -32.0, z = -20.1 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 147.6, y = -32.0, z = -21.5 }, size = 3, direction = "sw", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 140.1, y = -32.0, z = -32.4 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 138.2, y = -32.0, z = -51.7 }, size = 3, direction = "sw", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 123.1, y = -32.0, z = -59.7 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 115.0, y = -32.0, z = -59.8 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },

                        --Shivas Gate 2
                        { zone_name = "The Eldieme Necropolis", type = 'rect', center = { x = 111.0, y = -34.5, z = -60.0 }, width = 4.00, height = 4.75, floor_id = 15, colour = "cyan", vertical_axis = 'z' },
                        { zone_name = "The Eldieme Necropolis", type = 'rect', center = { x = 111.0, y = -34.5, z = -60.0 }, width = 4.00, height = 4.75, floor_id = 15, colour = "cyan", vertical_axis = 'z' },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 106.3, y = -32.0, z = -58.6 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 103.1, y = -32.0, z = -66.1 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },

                        --2nd keyitem
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 89.5, y = -32.0, z = -59.8 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 69.0, y = -32.0, z = -58.8 }, size = 3, direction = "nw", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 60.0, y = -32.0, z = -42.4 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 60.2, y = -32.0, z = -8.2 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 59.9, y = -28.0, z = 1.8 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 54.2, y = -28.0, z = 2.1 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 54.6, y = -27.5, z = 21.2 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 54.9, y = -27.8, z = 37.3 }, size = 3, direction = "ne", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 60.4, y = -32.0, z = 45.5 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 59.8, y = -32.0, z = 67.2 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 60.8, y = -32.0, z = 91.1 }, size = 3, direction = "ne", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 72.2, y = -32.0, z = 99.5 }, size = 3, direction = "right", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 85.1, y = -32.0, z = 100.0 }, size = 3, direction = "right", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'rect', center = { x = 89.0, y = -34.5, z = 100.0 }, width = 4.00, height = 4.75, floor_id = 15, colour = "cyan", vertical_axis = 'z' },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 93.1, y = -32.0, z = 101.4 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 96.3, y = -32.0, z = 93.3 }, size = 3, direction = "right", floor_id = 15, colour = "yellow" },

                },
                trigger_on_item_obtain = { "Ancient Papyrus" }, -- VERIFY display name (LSB: PIECE_OF_ANCIENT_PAPYRUS)
            },
            {
                text = "Step 7: Return to Maat in Ru'Lude Gardens (H-5) and trade him all three items together (Exoray Mold, Bomb Coal, Ancient Papyrus) to finish.\n \n",
                route_to = "Ru'Lude Gardens",
                onmob_target = "Maat",
                destination_highlight = { position = "H-5", offsetX = 16, offsetY = 16 },
                items_needed = { "Exoray Mold", "Bomb Coal", "Ancient Papyrus" },
                --require_all_items = true,
                trigger_on_event_id = { 81 },
            },
        },
        reward = {
            text = "Title: Horizon Breaker.\n \n" ..
                   "- Your level cap is raised to 55.\n \n",
        },
    },

    ["Genkai 2: Atop the Highest Mountains"] = {
        prerequisites = {
            { any = {
                {category = "Limit Breaks", subfile = "Genkai", name = "Genkai 1: In Defiant Challenge - Item Drop"},
                {category = "Limit Breaks", subfile = "Genkai", name = "Genkai 1: In Defiant Challenge - Key Item Method"},
            } },
        },
        requirements = {
            level = 51,
        },
        steps = {
            {
                text = "Step 1: Speak to Maat in Ru'Lude Gardens (H-5) to start the quest.\n \n" ..
                       "- Maat asks you to retrieve three pieces of Frigicite from Xarcabard.\n",
                route_to = "Ru'Lude Gardens",
                onmob_target = "Maat",
                destination_highlight = { position = "H-5", offsetX = 16, offsetY = 16 },
                trigger_on_event_id = { 82 },
            },
            {
                text = "Step 2: Boreal Tiger at (I-6) -> Round Frigicite.\n \n" ..
                       "Outpost/Survival Guide to Beaucedine Glacier(Fauregandi) or White Mage to Teleport-Vahlz.\n \n" ..
                       "Defeat the Boreal Tiger, then touch the ??? to receive the Round Frigicite.\n \n" ..
                       "Note: If you have a Mount - run past the Boreal Tiger and click the '???' for the KI. \n \n",
                route_to = "Xarcabard",
                destination_highlight = { position = "I-6", offsetX = 16, offsetY = 16 },
                onmob_enemy = { "Boreal Tiger" },
                onmob_enemy_size = 2,
                onmob_target = "xarcabard-i5-boreal-tiger-???",
                zone_max_distance = 30,
                visual_zones = {
                        -- Beaucedine Glacier to Xarcabard
                        { zone_name = "Beaucedine Glacier", type = 'square', center = { x = -28.0, y = -59.7, z = -125.0 }, size = 1, floor_id = 0, colour = "green" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -32.2, y = -59.8, z = -115.9 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -10.6, y = -60.0, z = -91.4 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 12.5, y = -59.7, z = -61.0 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 11.0, y = -60.1, z = -23.5 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 9.4, y = -59.9, z = 12.9 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 7.8, y = -59.5, z = 55.3 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 8.8, y = -60.1, z = 82.1 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 0.9, y = -59.1, z = 103.0 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -36.8, y = -63.7, z = 100.5 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -67.9, y = -69.8, z = 102.8 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -95.2, y = -76.3, z = 106.1 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -108.1, y = -79.7, z = 124.5 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -128.0, y = -80.0, z = 149.8 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -151.0, y = -80.1, z = 183.6 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -154.6, y = -79.8, z = 195.0 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -138.7, y = -79.8, z = 218.2 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -148.4, y = -80.0, z = 252.8 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -177.9, y = -80.0, z = 271.2 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -197.7, y = -79.9, z = 297.4 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -219.0, y = -79.8, z = 277.0 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        -- Xarca to Boreal Tiger
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 594.8, y = 0.2, z = -260.8 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 570.1, y = -0.5, z = -266.9 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 543.6, y = 0.8, z = -277.1 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 524.5, y = 0.1, z = -248.4 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 509.8, y = -0.3, z = -227.2 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 499.6, y = -0.2, z = -211.2 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 481.8, y = 0.3, z = -179.7 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 459.0, y = -0.0, z = -179.8 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 450.3, y = -0.4, z = -173.8 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 420.9, y = -0.1, z = -148.0 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 392.2, y = 0.4, z = -119.1 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 387.9, y = -2.4, z = -96.9 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 391.0, y = -1.2, z = -53.2 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 374.4, y = -5.8, z = -36.0 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 348.9, y = -8.0, z = -10.7 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 321.0, y = -7.4, z = 14.0 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 294.7, y = -7.3, z = 36.8 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 269.2, y = -8.3, z = 64.2 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 247.2, y = -8.2, z = 49.6 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 220.5, y = -7.0, z = 42.6 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 220.0, y = -12.3, z = 87.2 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 218.8, y = -19.3, z = 118.1 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 233.6, y = -27.2, z = 140.1 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 264.7, y = -27.7, z = 169.3 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 284.2, y = -28.0, z = 195.9 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 300.7, y = -27.6, z = 212.1 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 304.5, y = -28.2, z = 245.2 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 338.3, y = -27.9, z = 274.3 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 340.3, y = -29.5, z = 312.1 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 340.8, y = -28.9, z = 331.7 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 340.6, y = -28.3, z = 343.4 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },

                },
                keyitems_needed = { 222 },
                trigger_on_keyitem_obtain = { 222 },
            },
            {
                text = "Step 3: Boreal Coeurl at (J-6) -> Square Frigicite.\n \n" ..
                       "Outpost/Survival Guide to Beaucedine Glacier(Fauregandi) or White Mage to Teleport-Vahlz.\n \n" ..
                       "Defeat the Boreal Coeurl, then touch the ??? to receive the Square Frigicite.\n \n" ..
                       "Note: If you have a Mount - run past the Boreal Coeurl and click the '???' for the KI - it won't aggroe! \n \n",
                route_to = "Xarcabard",
                destination_highlight = { position = "J-6", offsetX = 16, offsetY = 16 },
                onmob_enemy = { "Boreal Coeurl" },
                onmob_enemy_size = 2,
                onmob_target = "xarcabard-j6-boreal-coeurl-???",
                zone_max_distance = 30,
                visual_zones = {
                    -- Boreal Coeurl
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 341.0, y = -28.0, z = 377.5 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 340.3, y = -29.2, z = 330.2 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 338.7, y = -27.9, z = 297.0 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 331.1, y = -28.7, z = 268.2 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 298.2, y = -27.8, z = 237.2 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 297.2, y = -27.1, z = 199.6 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 264.8, y = -28.0, z = 174.8 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 238.8, y = -28.0, z = 156.6 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 214.4, y = -27.3, z = 151.5 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 218.9, y = -15.4, z = 99.0 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 219.3, y = -8.2, z = 57.5 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 220.2, y = -7.0, z = 42.4 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 265.2, y = -7.3, z = 42.1 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 290.6, y = -7.7, z = 40.2 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 316.2, y = -7.8, z = 32.0 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 339.4, y = -8.6, z = 8.9 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 352.8, y = -8.1, z = 4.8 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 379.2, y = -7.7, z = 7.4 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 401.1, y = -7.7, z = 9.0 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 425.1, y = -3.0, z = 41.6 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 460.5, y = -7.2, z = 68.1 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 484.7, y = -8.0, z = 83.9 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 499.4, y = -8.0, z = 110.2 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 499.6, y = -9.1, z = 143.5 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 500.4, y = -9.1, z = 175.7 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 509.6, y = -8.0, z = 217.5 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 540.5, y = -8.6, z = 220.0 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 563.1, y = -9.5, z = 220.3 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 579.8, y = -9.5, z = 224.7 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 579.3, y = -10.0, z = 246.3 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 579.9, y = -9.5, z = 273.7 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                },
                keyitems_needed = { 223 },
                trigger_on_keyitem_obtain = { 223 },
            },
            {
                text = "Step 4: Boreal Hound at (G-10) -> Triangular Frigicite.\n \n" ..
                       "Outpost/Survival Guide to Beaucedine Glacier(Fauregandi) or White Mage to Teleport-Vahlz.\n \n" ..
                       "Defeat the Boreal Hound, then touch the ??? to receive the Triangular Frigicite.\n \n" ..
                       "Note: If you have a Mount - run past the Boreal Hound and click the '???' for the KI - it won't aggroe! \n \n",
                route_to = "Xarcabard",
                destination_highlight = { position = "G-10", offsetX = 16, offsetY = 16 },
                onmob_enemy = { "Boreal Hound" },
                onmob_enemy_size = 2,
                onmob_target = "xarcabard-g11-boreal-hound-???",
                zone_max_distance = 30,
                visual_zones = {
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 581.5, y = -8.2, z = 295.7 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 578.9, y = -8.9, z = 267.9 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 579.4, y = -9.4, z = 236.5 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 576.9, y = -9.4, z = 221.8 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 576.9, y = -9.4, z = 221.8 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 535.7, y = -8.0, z = 218.2 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 503.5, y = -8.2, z = 211.8 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 500.3, y = -9.5, z = 167.7 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 497.6, y = -7.9, z = 118.8 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 494.7, y = -8.1, z = 93.2 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 455.6, y = -3.2, z = 56.2 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 428.9, y = -2.1, z = 26.5 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 406.1, y = -7.3, z = -7.6 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 382.9, y = -3.7, z = -38.4 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 355.9, y = -7.3, z = -64.8 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 323.8, y = -7.3, z = -88.6 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 295.1, y = -6.0, z = -111.2 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 266.6, y = -10.4, z = -144.2 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 246.9, y = -15.0, z = -170.2 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 230.7, y = -16.8, z = -187.2 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 213.7, y = -21.8, z = -198.1 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'square', center = { x = 204.0, y = -23.5, z = -203.0 }, size = 1, floor_id = 0, colour = "green" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 193.2, y = -20.2, z = -179.5 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 172.5, y = -21.9, z = -162.8 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 152.6, y = -24.0, z = -157.7 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 123.8, y = -24.0, z = -160.0 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 87.6, y = -23.8, z = -162.9 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 81.3, y = -24.0, z = -196.2 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 71.4, y = -23.8, z = -242.3 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 57.5, y = -23.8, z = -256.7 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 53.5, y = -25.2, z = -286.5 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 32.8, y = -24.2, z = -304.4 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 20.0, y = -23.9, z = -326.6 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 20.9, y = -23.7, z = -371.7 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 19.0, y = -23.9, z = -415.6 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 17.8, y = -25.5, z = -448.2 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 15.5, y = -25.3, z = -457.9 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = -9.8, y = -25.0, z = -461.8 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = -20.2, y = -25.5, z = -463.6 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = -20.5, y = -25.5, z = -485.5 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                },
                keyitems_needed = { 224 },
                trigger_on_keyitem_obtain = { 224 },
            },
            {
                text = "Step 5: Return to Maat in Ru'Lude Gardens (H-5) with all three Frigicite to finish.\n \n" ..
                       "Maat takes the three key items and raises your level cap to 60.\n \n",
                route_to = "Ru'Lude Gardens",
                onmob_target = "Maat",
                destination_highlight = { position = "H-5", offsetX = 16, offsetY = 16 },
                trigger_on_event_id = { 84 },
            },
        },
        reward = {
            text = "Title: Summit Breaker.\n \n" ..
                   "- Your level cap is raised to 60.\n \n",
        },
    },

    ["Genkai 3: Whence Blows the Wind"] = {
        prerequisites = {
            {category = "Limit Breaks", subfile = "Genkai", name = "Genkai 2: Atop the Highest Mountains"},
            { any = {
                -- Magicite must be STARTED to finish the crest sections; any nation's 4-1.
                {category = "Missions", subfile = "Bastok", name = "4-1: Magicite"},
                {category = "Missions", subfile = "SanDoria", name = "4-1: Magicite"},
                {category = "Missions", subfile = "Windurst", name = "4-1: Magicite"},
            } },
            -- Opens the Wall of Banishing for the Orcish Crest; one per party is enough.
            {category = "Quests", subfile = "Davoi", name = "Wall of Banishing", recommended = true},
        },
        requirements = {
            level = 56,
        },
        steps = {
            {
                text = "Step 1: Speak to Maat in Ru'Lude Gardens (H-5) to start the quest.\n \n" ..
                       "- Maat asks you to bring him the Orcish, Quadav, and Yagudo crests.\n" ..
                       "- Requires Lv.56 and your level cap already raised to 60 (Genkai 2 complete).\n \n" ..
                       "NOTE: You can accept now, but the crest ??? in Beadeaux/Oztroja are gated behind having STARTED the Magicite mission (4-1). Start Magicite first and do both together if you haven't already.\n",
                route_to = "Ru'Lude Gardens",
                onmob_target = "Maat",
                destination_highlight = { position = "H-5", offsetX = 16, offsetY = 16 },
                trigger_on_event_id = { 85 },
            },
            {
                text = "Step 2: Orcish Crest - Monastic Cavern (enter Davoi H-11).\n \n" ..
                       "Invisible up the whole way, follow the arrows, click the ??? at (J-6).\n \n" ..
                       "Needs a Crimson Orb (Wall of Banishing quest) - one per party. True-sight Orc NMs in the room, do not aggro.\n",
                onmob_target = {"davoi-wall-of-banishing-j9",
                                "monastic-cavern-orcish-crest-???"},
                zone_max_distance = 25,
                visual_zones = {
                    -- Survival Guide
                    { zone_name = "Davoi", type = 'square', center = { x = 223.0, y = -0.2, z = -10.0 }, size = 1, floor_id = 0, colour = "green" },
                    -- To H-11 (Monastic Cavern entrance), first MAP Davoi
                    { zone_name = "Davoi", type = 'arrow', center = { x = 215.7, y = -0.4, z = -12.6 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = 218.5, y = 3.3, z = -67.1 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = 237.6, y = 4.0, z = -93.1 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = 220.0, y = 3.7, z = -131.4 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = 240.0, y = 0.0, z = -179.2 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = 279.4, y = 4.0, z = -192.3 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = 277.4, y = 4.0, z = -242.7 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = 275.0, y = 4.0, z = -288.3 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = 235.0, y = -0.2, z = -299.0 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = 216.7, y = -1.6, z = -306.1 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = 205.0, y = -0.0, z = -259.8 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = 162.7, y = 0.0, z = -259.2 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = 111.1, y = -0.4, z = -265.6 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = 76.0, y = -0.2, z = -259.0 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = 50.4, y = -2.0, z = -266.4 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = 67.6, y = -1.8, z = -297.1 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = 57.0, y = 0.7, z = -341.1 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },

                    -- Inside Monastic Cavern, back to I-8 to zone out into central Davoi
                    { zone_name = "Monastic Cavern", type = 'arrow', center = { x = 27.4, y = -13.6, z = -376.5 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Monastic Cavern", type = 'arrow', center = { x = -15.1, y = -4.6, z = -381.5 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Monastic Cavern", type = 'arrow', center = { x = -22.2, y = -0.3, z = -340.5 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Monastic Cavern", type = 'arrow', center = { x = 13.3, y = -2.2, z = -334.4 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Monastic Cavern", type = 'arrow', center = { x = 16.5, y = -1.6, z = -305.3 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Monastic Cavern", type = 'arrow', center = { x = 45.7, y = -0.2, z = -278.0 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Monastic Cavern", type = 'arrow', center = { x = 61.2, y = -0.2, z = -244.4 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Monastic Cavern", type = 'arrow', center = { x = 53.4, y = -0.1, z = -218.0 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Monastic Cavern", type = 'arrow', center = { x = 16.5, y = -0.5, z = -217.5 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Monastic Cavern", type = 'arrow', center = { x = -20.4, y = -0.4, z = -214.2 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Monastic Cavern", type = 'arrow', center = { x = -20.4, y = -0.3, z = -167.2 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Monastic Cavern", type = 'arrow', center = { x = -20.3, y = -0.3, z = -137.2 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Monastic Cavern", type = 'arrow', center = { x = 22.4, y = -0.4, z = -141.9 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Monastic Cavern", type = 'arrow', center = { x = 34.2, y = -6.9, z = -181.1 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Monastic Cavern", type = 'arrow', center = { x = 74.2, y = -15.0, z = -179.9 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },

                    -- Extra from prereq quest arrows if needed
                    { zone_name = "Davoi", type = 'arrow', center = { x = 177.1, y = -2.7, z = -117.3 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = 179.8, y = 0.0, z = -161.8 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    -- ...then north to Banshing Wall
                    { zone_name = "Davoi", type = 'arrow', center = { x = 89.2, y = 0.6, z = -152.4 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = 79.8, y = -2.5, z = -151.9 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = 81.3, y = -4.0, z = -140.1 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = 129.7, y = 0.4, z = -142.0 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = 141.4, y = -0.1, z = -179.4 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = 179.5, y = -0.1, z = -179.1 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = 180.3, y = 1.0, z = -207.4 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },

                    -- Through the wall
                    { zone_name = "Davoi", type = 'arrow', center = { x = 177.1, y = 3.6, z = -235.9 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },

                    -- To the Orcish Crest
                    { zone_name = "Monastic Cavern", type = 'arrow', center = { x = 206.2, y = -14.7, z = -260.8 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Monastic Cavern", type = 'arrow', center = { x = 220.4, y = -9.9, z = -249.6 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Monastic Cavern", type = 'arrow', center = { x = 220.3, y = -0.1, z = -198.7 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Monastic Cavern", type = 'arrow', center = { x = 220.6, y = -0.4, z = -174.5 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Monastic Cavern", type = 'arrow', center = { x = 218.0, y = -0.4, z = -143.2 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Monastic Cavern", type = 'arrow', center = { x = 196.9, y = -0.3, z = -125.8 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Monastic Cavern", type = 'arrow', center = { x = 191.9, y = -0.4, z = -92.6 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Monastic Cavern", type = 'arrow', center = { x = 189.8, y = -0.7, z = -68.6 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Monastic Cavern", type = 'arrow', center = { x = 180.1, y = -1.4, z = -34.4 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },


                },
                 images = {
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        zone_name = "Davoi",
                        floor_id = 0,
                        highlights = {
                            { position = "H-11", offsetX = 16, offsetY = 16, label = "1" },
                            { position = "J-9", offsetX = 16, offsetY = 16, label = "W" },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        zone_name = "Monastic Cavern",
                        floor_id = 0,
                        highlights = {
                            { position = "I-8", offsetX = 16, offsetY = 16, label = "1" },
                            { position = "J-6", offsetX = 16, offsetY = 16, label = "KI" },
                        },
                    },
                },
                keyitems_needed = {
                    336,
                    136,  -- Crimson Orb - opens the Wall of Banishing
                },
                trigger_on_keyitem_obtain = { 336 },
            },
            {
                text = "Step 3: Quadav Crest - Qulun Dome (enter from Beadeaux).\n \n" ..
                       "Sneak on (Invisible not needed). Follow the YELLOW arrows: map 1 ramp at (H-7), then map 2 to the Qulun Dome entrance at (I-7).\n \n" ..
                       "BLUE Line detour: examine 'The Mute' for Silence, which lets you pass 'The Afflictor' without being Cursed.\n \n" ..
                       "Door at (G-8) needs one member carrying KI:Silver Bell + KI:Coruscant Rosary + KI:Black Matinee Necklace, with Mysteries of Beadeaux I & II done (or Rank 5+). They must stay OUTSIDE - it cannot be opened from inside.\n \n" ..
                       "??? is in the NW corner, second room. WARNING: Ruby Quadav has True Hearing (hears through Sneak).\n",
                onmob_target = {"The Mute1",
                                "beadeaux-the-mute-k8",
                                "qulun-dome-quadav-crest-???"},
                zone_max_distance = 25,
                visual_zones = {
                    -- Survival Guide
                    { zone_name = "Beadeaux", type = 'square', center = { x = -264.0, y = 1.6, z = 107.0 }, size = 1, floor_id = 1, colour = "green" },

                    -- Map 1 to the ramp at (H-7)
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -216.2, y = 0.7, z = 96.3 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -181.2, y = 0.7, z = 101.0 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -167.6, y = 1.0, z = 140.3 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -118.7, y = 1.0, z = 135.6 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -61.8, y = 1.0, z = 139.6 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -61.3, y = 1.4, z = 97.1 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },

                    -- Map 2 east to the Qulun Dome entrance (I-7)
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -59.2, y = 23.8, z = 62.9 }, size = 4, direction = "left", floor_id = 15, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -93.8, y = 24.0, z = 58.8 }, size = 4, direction = "sw", floor_id = 15, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -101.6, y = 24.1, z = 24.3 }, size = 4, direction = "left", floor_id = 15, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -139.8, y = 24.4, z = 25.9 }, size = 4, direction = "up", floor_id = 15, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -150.0, y = 23.9, z = 59.6 }, size = 4, direction = "left", floor_id = 15, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -179.3, y = 24.0, z = 63.6 }, size = 4, direction = "left", floor_id = 15, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -214.9, y = 24.0, z = 55.4 }, size = 4, direction = "sw", floor_id = 15, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -220.0, y = 22.4, z = 29.4 }, size = 4, direction = "se", floor_id = 15, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -196.8, y = 15.9, z = 25.7 }, size = 4, direction = "ne", floor_id = 15, colour = "yellow" },

                    -- Optional detour: 'The Mute' at (G-7) for Silence vs. The Afflictor
                    { zone_name = "Beadeaux", type = 'line', start = { x = -94.8, y = 24.0, z = 62.0 }, stop = { x = -96.8, y = 23.7, z = 69.4 }, floor_id = 15, colour = "cyan" },
                    { zone_name = "Beadeaux", type = 'line', start = { x = -96.8, y = 23.7, z = 69.4 }, stop = { x = -99.0, y = 24.1, z = 81.9 }, floor_id = 15, colour = "cyan" },
                    { zone_name = "Beadeaux", type = 'line', start = { x = -99.0, y = 24.1, z = 81.9 }, stop = { x = -99.6, y = 24.3, z = 92.1 }, floor_id = 15, colour = "cyan" },
                    { zone_name = "Beadeaux", type = 'line', start = { x = -99.6, y = 24.3, z = 92.1 }, stop = { x = -99.8, y = 24.1, z = 101.1 }, floor_id = 15, colour = "cyan" },
                    -- to ramp 1
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -216.6, y = 1.0, z = 13.1 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -220.3, y = 1.0, z = -39.0 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -210.4, y = 0.8, z = -65.5 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -175.7, y = 1.0, z = -67.7 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -176.2, y = 1.2, z = -90.3 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -204.9, y = 1.0, z = -117.9 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -231.5, y = 1.0, z = -139.0 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },

                    -- To K-6
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -257.5, y = 1.0, z = -139.0 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -268.6, y = -3.1, z = -127.9 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -281.2, y = -3.5, z = -167.2 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -280.2, y = -3.3, z = -200.0 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -279.8, y = -3.1, z = -222.9 }, size = 4, direction = "se", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -250.8, y = -3.3, z = -237.8 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -220.5, y = -3.1, z = -234.6 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -196.9, y = -3.5, z = -231.4 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -168.0, y = -3.0, z = -207.8 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -141.4, y = -3.4, z = -192.3 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -98.5, y = -2.9, z = -193.8 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -60.7, y = -3.2, z = -193.7 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -49.0, y = -3.4, z = -189.4 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -23.7, y = -3.0, z = -157.1 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -6.2, y = -3.0, z = -136.4 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = 12.4, y = -3.2, z = -121.2 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = 35.7, y = -3.3, z = -119.4 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = 57.9, y = -3.0, z = -113.6 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = 61.3, y = -3.0, z = -80.0 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = 63.1, y = -3.0, z = -51.3 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = 96.6, y = -3.0, z = -47.6 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = 128.6, y = -3.0, z = -49.9 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = 163.3, y = -3.3, z = -43.8 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = 195.6, y = -3.3, z = -40.2 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = 218.7, y = -3.2, z = -44.0 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = 235.1, y = -3.3, z = -15.4 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = 256.5, y = -3.3, z = 6.8 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = 256.5, y = -3.0, z = 44.4 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = 256.6, y = -3.0, z = 79.7 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = 255.6, y = -3.0, z = 104.2 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = 227.5, y = -3.2, z = 125.0 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = 193.0, y = -3.1, z = 143.0 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },

                    -- Map 2
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = 182.6, y = 1.5, z = 144.5 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = 160.6, y = 11.2, z = 162.0 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = 158.2, y = 16.4, z = 144.6 }, size = 4, direction = "se", floor_id = 15, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = 180.1, y = 22.8, z = 153.4 }, size = 4, direction = "up", floor_id = 15, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = 190.7, y = 30.5, z = 180.1 }, size = 4, direction = "right", floor_id = 15, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = 219.4, y = 38.9, z = 165.4 }, size = 4, direction = "down", floor_id = 15, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = 230.1, y = 39.8, z = 139.6 }, size = 4, direction = "right", floor_id = 15, colour = "yellow" },

                    -- Line to Mute to be silenced.
                    { zone_name = "Beadeaux", type = 'line', start = { x = 224.3, y = 40.1, z = 136.7 }, stop = { x = 221.2, y = 40.1, z = 125.0 }, floor_id = 15, colour = "cyan" },
                    { zone_name = "Beadeaux", type = 'line', start = { x = 221.2, y = 40.1, z = 125.0 }, stop = { x = 219.9, y = 40.1, z = 113.7 }, floor_id = 15, colour = "cyan" },
                    { zone_name = "Beadeaux", type = 'line', start = { x = 219.9, y = 40.1, z = 113.7 }, stop = { x = 217.7, y = 40.0, z = 101.1 }, floor_id = 15, colour = "cyan" },
                    { zone_name = "Beadeaux", type = 'line', start = { x = 217.7, y = 40.0, z = 101.1 }, stop = { x = 208.5, y = 41.0, z = 90.3 }, floor_id = 15, colour = "cyan" },
                    { zone_name = "Beadeaux", type = 'line', start = { x = 208.5, y = 41.0, z = 90.3 }, stop = { x = 197.8, y = 41.0, z = 76.5 }, floor_id = 15, colour = "cyan" },
                    { zone_name = "Beadeaux", type = 'line', start = { x = 197.8, y = 41.0, z = 76.5 }, stop = { x = 188.7, y = 40.2, z = 66.2 }, floor_id = 15, colour = "cyan" },
                    { zone_name = "Beadeaux", type = 'line', start = { x = 188.7, y = 40.2, z = 66.2 }, stop = { x = 180.3, y = 40.1, z = 55.9 }, floor_id = 15, colour = "cyan" },
                    { zone_name = "Beadeaux", type = 'line', start = { x = 180.3, y = 40.1, z = 55.9 }, stop = { x = 180.0, y = 40.1, z = 46.2 }, floor_id = 15, colour = "cyan" },
                    { zone_name = "Beadeaux", type = 'line', start = { x = 180.0, y = 40.1, z = 46.2 }, stop = { x = 179.6, y = 40.1, z = 32.5 }, floor_id = 15, colour = "cyan" },
                    { zone_name = "Beadeaux", type = 'line', start = { x = 179.6, y = 40.1, z = 32.5 }, stop = { x = 179.2, y = 40.2, z = 20.2 }, floor_id = 15, colour = "cyan" },

                    -- To Qulin Dome
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = 258.5, y = 40.2, z = 136.6 }, size = 4, direction = "right", floor_id = 15, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = 291.7, y = 38.2, z = 139.2 }, size = 4, direction = "right", floor_id = 15, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = 318.6, y = 32.2, z = 140.2 }, size = 4, direction = "right", floor_id = 15, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = 341.0, y = 25.9, z = 127.3 }, size = 4, direction = "down", floor_id = 15, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = 339.4, y = 24.0, z = 102.0 }, size = 4, direction = "right", floor_id = 15, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = 368.1, y = 24.8, z = 99.8 }, size = 4, direction = "right", floor_id = 15, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'rect', center = { x = 371.1, y = 23.1, z = 100.0 }, width = 3.00, height = 3.75, floor_id = 15, colour = "cyan", vertical_axis = 'z' },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = 380.4, y = 24.8, z = 100.9 }, size = 4, direction = "down", floor_id = 15, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'rect', center = { x = 380.0, y = 23.3, z = 91.1 }, width = 3.00, height = 3.50, floor_id = 15, colour = "cyan", vertical_axis = 'ns' },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = 379.4, y = 24.7, z = 85.5 }, size = 4, direction = "down", floor_id = 15, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = 383.4, y = 23.9, z = 59.7 }, size = 4, direction = "right", floor_id = 15, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = 418.5, y = 30.6, z = 48.5 }, size = 4, direction = "down", floor_id = 15, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = 404.0, y = 39.7, z = 20.2 }, size = 4, direction = "left", floor_id = 15, colour = "yellow" },

                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        zone_name = "Beadeaux",
                        floor_id = 1,
                        highlights = {
                            { position = "H-7", offsetX = 16, offsetY = 16, label = "1" },
                            { position = "K-6", offsetX = 16, offsetY = 16, label = "2" },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        zone_name = "Beadeaux",
                        floor_id = 15,
                        highlights = {
                            { position = "F-8", offsetX = 16, offsetY = 16, label = "1" },
                            { position = "M-8", offsetX = 16, offsetY = 16, label = "2" },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        zone_name = "Qulun Dome",
                        highlights = {
                            { position = "I-6", offsetX = 16, offsetY = 16, label = "KI" },
                        },
                    },
                },
                keyitems_needed = {
                    337,
                    46,
                    47,
                },
                trigger_on_keyitem_obtain = { 337 },
            },
            {
                -- Castle Oztroja navigation (daily_passwords + arrow chain + per-floor maps)
                text = "Step 4: Yagudo Crest - Castle Oztroja. Follow the arrows! Passwords reset every game day at 00:00 so wait till a new day if it is close enough. Beyond 18:00 just wait if first time.  \n \n" ..
                       "- BLUE arrows lead to the 3 password statues; YELLOW arrows are the main path onward. \n" ..
                       "- CRITICAL: Invisible for this ENTIRE section (Sneak for bats/leeches if low level). Lighting the torches needs the KI:Yagudo Torch (from Magicite). \n \n" ..
                       "- Read all 3 statues : \n" ..
                       " #1 - Floor 1    (H-9) \n" ..
                       " #2 - Basement 1 (H-9) \n" ..
                       " #3 - Floor 2    (I-8) \n \n" ..
                       "- A 4-lever door combo appears at the dead-end (G-8) with a Brass Door - the order is Random you just have to guess a combination to open it! \n" ..
                       "- At the trap-door room: touch a torch (G-7, G-8, H-7, or H-8) to open the Brass Door, stand on the wooden plank, click the statue and enter the 3 passwords IN ORDER - everyone drops through the trap door (safe landing). \n \n" ..
                       "- Re-invis, run the corridor to the big ramped room; the ??? for the Yagudo Crest is on the LOWER CENTRAL platform. Grab it and warp. \n \n" ..
                       "- Possible passwords (case-sensitive): Buxu, Deggi, Domi, Duxo, Duzu, Gadu, Haqa, Misu, Mjuu, Mong, Ouzi, Ovzi, Puqu, Quu, Xalmo, Xicu, Zhuu. \n \n" ..
                       "- WARNING: True-sight NMs here (Tzee Xicu the Manifest, Yagudo Avatar/High Priest/Templar) see through Invisible - stay out of their sight lines.\n",
                onmob_target = {"castle-oztroja-brass-statue-1-h9",
                                "castle-oztroja-handle-1-i8",
                                "castle-oztroja-handle-2-i8",
                                "castle-oztroja-brass-statue-15-h9",
                                "castle-oztroja-brass-statue-2-i8",
                                "castle-oztroja-handle-1-g8",
                                "castle-oztroja-handle-2-g8",
                                "castle-oztroja-handle-3-g8",
                                "castle-oztroja-handle-4-g8",
                                "castle-oztroja-torch-stand-4-h7",
                                "castle-oztroja-brass-statue-4-h7",
                                "castle-oztroja-yagudo-crest-???"},
                keyitems_needed = {
                    338,
                    20,   -- Yagudo Torch - lights the torches (from Magicite)
                },
                trigger_on_keyitem_obtain = { 338 },
                daily_passwords = {
                    wordlist = { "Buxu","Deggi","Domi","Duxo","Duzu","Gadu","Haqa","Misu",
                                 "Mjuu","Mong","Ouzi","Ovzi","Puqu","Quu","Xalmo","Xicu","Zhuu" },
                    slots = {
                        { slot = 1, floor_id = 1,  label = "#1 Floor 1 (H-9)"    },
                        { slot = 2, floor_id = 15, label = "#2 Basement 1 (H-9)" },
                        { slot = 3, floor_id = 2,  label = "#3 Floor 2 (I-8)"    },
                    },
                },
                zone_max_distance = 35,
                visual_zones = {
                    -- Survival Guide
                    { zone_name = "Castle Oztroja", type = 'square', center = { x = -221.0, y = 0.3, z = -13.0 }, size = 1, floor_id = 1, colour = "green" },

                    -- To 1st password. (hidden once password #1 is captured)
                    { zone_name = "Castle Oztroja", type = 'square', center = { x = -221.0, y = 0.3, z = -13.0 }, size = 1, floor_id = 1, colour = "green", hide_if_password = 1 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -215.8, y = 0.3, z = -18.6 }, size = 4, direction = "right", floor_id = 1, colour = "cyan", hide_if_password = 1 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -179.1, y = 0.3, z = -16.4 }, size = 4, direction = "up", floor_id = 1, colour = "cyan", hide_if_password = 1 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -176.9, y = 0.3, z = 20.4 }, size = 4, direction = "right", floor_id = 1, colour = "cyan", hide_if_password = 1 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -138.8, y = 0.3, z = 21.1 }, size = 4, direction = "right", floor_id = 1, colour = "cyan", hide_if_password = 1 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -101.0, y = 0.1, z = 18.8 }, size = 4, direction = "se", floor_id = 1, colour = "cyan", hide_if_password = 1 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -74.9, y = 0.3, z = -12.6 }, size = 4, direction = "se", floor_id = 1, colour = "cyan", hide_if_password = 1 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -65.6, y = 0.3, z = -26.3 }, size = 4, direction = "se", floor_id = 1, colour = "cyan", hide_if_password = 1 },
                    { zone_name = "Castle Oztroja", type = 'square', center = { x = -62.5, y = 0.3, z = -30.6 }, size = 1, floor_id = 1, colour = "cyan", hide_if_password = 1 },
                    -- To first door levers (shown once password #1 is captured)
                    { zone_name = "Castle Oztroja", type = 'square', center = { x = -62.6, y = 0.3, z = -34.6 }, size = 1, floor_id = 1, colour = "yellow", show_if_password = 1 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -56.8, y = 0.2, z = -25.4 }, size = 4, direction = "up", floor_id = 1, colour = "yellow", show_if_password = 1 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -55.4, y = 0.3, z = 1.4 }, size = 4, direction = "up", floor_id = 1, colour = "yellow", show_if_password = 1 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -55.0, y = 0.3, z = 19.9 }, size = 4, direction = "right", floor_id = 1, colour = "yellow", show_if_password = 1 },

                    -- if player falls level its 50/50 this will help them get back to start
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 16.2, y = 24.0, z = -25.6 }, size = 4, direction = "right", floor_id = 15, colour = "yellow",show_if_password = 1 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 19.3, y = 40.3, z = -26.5 }, size = 4, direction = "down", floor_id = 15, colour = "yellow",show_if_password = 1 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 18.8, y = 33.5, z = -68.9 }, size = 4, direction = "down", floor_id = 15, colour = "yellow",show_if_password = 1 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 19.8, y = 25.5, z = -109.0 }, size = 4, direction = "down", floor_id = 15, colour = "yellow",show_if_password = 1 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 19.7, y = 19.3, z = -142.3 }, size = 4, direction = "down", floor_id = 15, colour = "yellow",show_if_password = 1 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 20.2, y = 16.3, z = -188.9 }, size = 4, direction = "down", floor_id = 15, colour = "yellow",show_if_password = 1 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 20.6, y = 12.0, z = -220.6 }, size = 4, direction = "right", floor_id = 15, colour = "yellow",show_if_password = 1 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 60.5, y = 4.0, z = -220.0 }, size = 4, direction = "up", floor_id = 15, colour = "yellow",show_if_password = 1 },

                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 59.2, y = -0.3, z = -180.1 }, size = 4, direction = "left", floor_id = 5, colour = "yellow",show_if_password = 1 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 17.7, y = -1.5, z = -179.4 }, size = 4, direction = "left", floor_id = 5, colour = "yellow",show_if_password = 1 },

                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -29.8, y = 0.2, z = -178.4 }, size = 4, direction = "left", floor_id = 1, colour = "yellow",show_if_password = 1 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -69.3, y = 0.3, z = -178.3 }, size = 4, direction = "left", floor_id = 1, colour = "yellow",show_if_password = 1 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -97.7, y = 0.3, z = -175.9 }, size = 4, direction = "up", floor_id = 1, colour = "yellow",show_if_password = 1 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -98.1, y = 0.3, z = -142.0 }, size = 4, direction = "up", floor_id = 1, colour = "yellow",show_if_password = 1 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -99.3, y = 0.3, z = -95.0 }, size = 4, direction = "up", floor_id = 1, colour = "yellow",show_if_password = 1 },

                    -- To 2nd password
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -21.0, y = 0.3, z = 6.1 }, size = 4, direction = "down", floor_id = 1, colour = "yellow", show_if_password = 1 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -19.6, y = 0.3, z = -17.6 }, size = 4, direction = "right", floor_id = 1, colour = "yellow", show_if_password = 1 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 12.6, y = 0.3, z = -20.2 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow", show_if_password = 1 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 20.6, y = 0.3, z = 1.5 }, size = 4, direction = "up", floor_id = 1, colour = "yellow", show_if_password = 1 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 28.4, y = 0.3, z = 20.3 }, size = 4, direction = "right", floor_id = 1, colour = "yellow", show_if_password = 1 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 56.9, y = -3.5, z = 20.6 }, size = 4, direction = "right", floor_id = 1, colour = "yellow", show_if_password = 1 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 100.6, y = -12.0, z = 19.8 }, size = 4, direction = "down", floor_id = 2, colour = "yellow", show_if_password = 1 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 99.5, y = -15.8, z = -20.4 }, size = 4, direction = "left", floor_id = 2, colour = "yellow", show_if_password = 1 },

                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 20.0, y = -15.8, z = -17.5 }, size = 4, direction = "up", floor_id = 2, colour = "cyan", hide_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 17.8, y = -15.8, z = 21.7 }, size = 4, direction = "up", floor_id = 2, colour = "cyan", hide_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 11.7, y = -15.8, z = 56.8 }, size = 4, direction = "left", floor_id = 2, colour = "cyan", hide_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -63.0, y = -15.7, z = 59.4 }, size = 4, direction = "left", floor_id = 2, colour = "cyan", hide_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -99.5, y = -15.8, z = 47.1 }, size = 4, direction = "down", floor_id = 2, colour = "cyan", hide_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -101.5, y = -16.0, z = 28.3 }, size = 4, direction = "left", floor_id = 2, colour = "cyan", hide_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -153.1, y = -15.7, z = 18.9 }, size = 4, direction = "left", floor_id = 2, colour = "cyan", hide_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -178.6, y = -15.8, z = 24.8 }, size = 4, direction = "up", floor_id = 2, colour = "cyan", hide_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -173.9, y = -15.8, z = 60.0 }, size = 4, direction = "right", floor_id = 2, colour = "cyan", hide_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -135.5, y = -15.8, z = 64.6 }, size = 4, direction = "up", floor_id = 2, colour = "cyan", hide_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -139.2, y = -15.8, z = 101.2 }, size = 4, direction = "left", floor_id = 2, colour = "cyan", hide_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -174.3, y = -16.2, z = 103.9 }, size = 4, direction = "up", floor_id = 6, colour = "cyan", hide_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -176.6, y = -16.0, z = 169.2 }, size = 4, direction = "up", floor_id = 6, colour = "cyan", hide_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -164.5, y = -15.8, z = 219.0 }, size = 4, direction = "right", floor_id = 15, colour = "cyan", hide_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -99.8, y = -12.0, z = 219.9 }, size = 4, direction = "down", floor_id = 15, colour = "cyan", hide_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -101.4, y = 4.0, z = 138.6 }, size = 4, direction = "right", floor_id = 15, colour = "cyan", hide_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -60.6, y = 12.0, z = 140.2 }, size = 4, direction = "down", floor_id = 15, colour = "cyan", hide_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -60.5, y = 22.5, z = 89.5 }, size = 4, direction = "down", floor_id = 15, colour = "cyan", hide_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -60.9, y = 24.3, z = 48.5 }, size = 4, direction = "down", floor_id = 15, colour = "cyan", hide_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -63.4, y = 24.3, z = 18.5 }, size = 4, direction = "left", floor_id = 15, colour = "cyan", hide_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -113.2, y = 24.3, z = 18.4 }, size = 4, direction = "left", floor_id = 15, colour = "cyan", hide_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -157.2, y = 24.3, z = 17.7 }, size = 4, direction = "left", floor_id = 15, colour = "cyan", hide_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -177.1, y = 24.3, z = 14.2 }, size = 4, direction = "down", floor_id = 15, colour = "cyan", hide_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -178.6, y = 24.3, z = -30.5 }, size = 4, direction = "down", floor_id = 15, colour = "cyan", hide_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -178.1, y = 24.3, z = -58.6 }, size = 4, direction = "right", floor_id = 15, colour = "cyan", hide_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -140.4, y = 24.3, z = -59.1 }, size = 4, direction = "up", floor_id = 15, colour = "cyan", hide_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -135.4, y = 24.3, z = -20.2 }, size = 4, direction = "right", floor_id = 15, colour = "cyan", hide_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -101.5, y = 24.3, z = -18.7 }, size = 4, direction = "down", floor_id = 15, colour = "cyan", hide_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -91.0, y = 24.4, z = -55.2 }, size = 4, direction = "se", floor_id = 15, colour = "cyan", hide_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -66.5, y = 24.3, z = -64.4 }, size = 4, direction = "se", floor_id = 15, colour = "cyan", hide_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'square', center = { x = -62.5, y = 24.3, z = -69.6 }, size = 1, floor_id = 15, colour = "cyan", hide_if_password = 2 },

                    -- to 3rd password
                    { zone_name = "Castle Oztroja", type = 'square', center = { x = -63.3, y = 24.3, z = -75.0 }, size = 1, floor_id = 15, colour = "yellow", show_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -66.7, y = 24.3, z = -67.0 }, size = 5, direction = "nw", floor_id = 15, colour = "yellow", show_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -95.4, y = 24.2, z = -39.2 }, size = 5, direction = "nw", floor_id = 15, colour = "yellow", show_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -110.1, y = 24.2, z = -20.2 }, size = 5, direction = "left", floor_id = 15, colour = "yellow", show_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -139.7, y = 24.3, z = -22.8 }, size = 5, direction = "down", floor_id = 15, colour = "yellow", show_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -141.3, y = 24.3, z = -59.7 }, size = 5, direction = "left", floor_id = 15, colour = "yellow", show_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -180.4, y = 24.3, z = -62.5 }, size = 5, direction = "up", floor_id = 15, colour = "yellow", show_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -178.1, y = 24.3, z = -17.2 }, size = 5, direction = "up", floor_id = 15, colour = "yellow", show_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -173.9, y = 24.3, z = 14.9 }, size = 5, direction = "right", floor_id = 15, colour = "yellow", show_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -138.7, y = 24.2, z = 20.7 }, size = 5, direction = "right", floor_id = 15, colour = "yellow", show_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -96.3, y = 24.3, z = 17.9 }, size = 5, direction = "right", floor_id = 15, colour = "yellow", show_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -60.1, y = 24.3, z = 26.2 }, size = 5, direction = "up", floor_id = 15, colour = "yellow", show_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -60.7, y = 24.3, z = 73.1 }, size = 5, direction = "up", floor_id = 15, colour = "yellow", show_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -59.9, y = 16.3, z = 116.6 }, size = 5, direction = "up", floor_id = 15, colour = "yellow", show_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -60.7, y = 12.0, z = 139.1 }, size = 5, direction = "left", floor_id = 15, colour = "yellow", show_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -99.6, y = 4.0, z = 139.8 }, size = 5, direction = "up", floor_id = 15, colour = "yellow", show_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -100.0, y = -7.8, z = 197.2 }, size = 5, direction = "up", floor_id = 15, colour = "yellow", show_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -100.2, y = -12.0, z = 221.2 }, size = 5, direction = "left", floor_id = 15, colour = "yellow", show_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -146.9, y = -15.8, z = 219.8 }, size = 5, direction = "left", floor_id = 15, colour = "yellow", show_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -181.8, y = -15.8, z = 207.6 }, size = 5, direction = "down", floor_id = 15, colour = "yellow", show_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -175.7, y = -16.2, z = 180.5 }, size = 4, direction = "down", floor_id = 6, colour = "yellow", show_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -174.5, y = -16.0, z = 140.5 }, size = 4, direction = "down", floor_id = 6, colour = "yellow", show_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -172.3, y = -16.0, z = 101.1 }, size = 4, direction = "right", floor_id = 6, colour = "yellow", show_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -138.2, y = -15.8, z = 100.5 }, size = 4, direction = "down", floor_id = 2, colour = "yellow", show_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -142.7, y = -15.8, z = 61.9 }, size = 4, direction = "left", floor_id = 2, colour = "yellow", show_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -177.6, y = -15.8, z = 52.7 }, size = 4, direction = "down", floor_id = 2, colour = "yellow", show_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -179.1, y = -15.7, z = 20.7 }, size = 4, direction = "right", floor_id = 2, colour = "yellow", show_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -143.8, y = -16.0, z = 26.8 }, size = 4, direction = "right", floor_id = 2, colour = "yellow", show_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -100.3, y = -16.0, z = 27.4 }, size = 4, direction = "up", floor_id = 2, colour = "yellow", show_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -86.9, y = -15.8, z = 58.6 }, size = 4, direction = "right", floor_id = 2, colour = "yellow", show_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -19.6, y = -15.7, z = 59.7 }, size = 4, direction = "right", floor_id = 2, colour = "yellow", show_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 18.2, y = -15.8, z = 54.4 }, size = 4, direction = "down", floor_id = 2, colour = "yellow", show_if_password = 2 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 20.5, y = -15.8, z = -17.4 }, size = 4, direction = "down", floor_id = 2, colour = "yellow", show_if_password = 2 },

                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 20.4, y = -15.8, z = -38.5 }, size = 4, direction = "down", floor_id = 2, colour = "cyan", show_if_password = 2, hide_if_password = 3 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 8.0, y = -15.8, z = -59.9 }, size = 4, direction = "left", floor_id = 2, colour = "cyan", show_if_password = 2, hide_if_password = 3 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -19.6, y = -15.8, z = -61.9 }, size = 4, direction = "down", floor_id = 2, colour = "cyan", show_if_password = 2, hide_if_password = 3 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -19.9, y = -15.8, z = -98.7 }, size = 4, direction = "left", floor_id = 2, colour = "cyan", show_if_password = 2, hide_if_password = 3 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -60.6, y = -15.8, z = -109.6 }, size = 4, direction = "down", floor_id = 2, colour = "cyan", show_if_password = 2, hide_if_password = 3 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -60.7, y = -15.7, z = -139.4 }, size = 4, direction = "left", floor_id = 2, colour = "cyan", show_if_password = 2, hide_if_password = 3 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -99.9, y = -15.8, z = -133.6 }, size = 4, direction = "up", floor_id = 2, colour = "cyan", show_if_password = 2, hide_if_password = 3 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -100.6, y = -15.7, z = -99.3 }, size = 4, direction = "left", floor_id = 2, colour = "cyan", show_if_password = 2, hide_if_password = 3 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -139.0, y = -15.8, z = -90.1 }, size = 4, direction = "up", floor_id = 2, colour = "cyan", show_if_password = 2, hide_if_password = 3 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -139.3, y = -15.9, z = -68.9 }, size = 4, direction = "right", floor_id = 2, colour = "cyan", show_if_password = 2, hide_if_password = 3 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -92.4, y = -16.0, z = -60.1 }, size = 4, direction = "right", floor_id = 2, colour = "cyan", show_if_password = 2, hide_if_password = 3 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -60.9, y = -15.8, z = -55.1 }, size = 4, direction = "up", floor_id = 2, colour = "cyan", show_if_password = 2, hide_if_password = 3 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -52.9, y = -16.0, z = -25.0 }, size = 4, direction = "up", floor_id = 2, colour = "cyan", show_if_password = 2, hide_if_password = 3 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -49.3, y = -15.8, z = 14.0 }, size = 4, direction = "ne", floor_id = 2, colour = "cyan", show_if_password = 2, hide_if_password = 3 },
                    { zone_name = "Castle Oztroja", type = 'square', center = { x = -45.2, y = -15.7, z = 17.7 }, size = 1, floor_id = 2, colour = "cyan", show_if_password = 2, hide_if_password = 3 },

                    -- 3rd password captured -> 4-lever door and on to the trap door
                    { zone_name = "Castle Oztroja", type = 'square', center = { x = -41.4, y = -15.8, z = 17.0 }, size = 1, floor_id = 2, colour = "yellow", show_if_password = 3 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -50.9, y = -15.9, z = 18.2 }, size = 4, direction = "down", floor_id = 2, colour = "yellow", show_if_password = 3 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -53.6, y = -16.0, z = -12.7 }, size = 4, direction = "down", floor_id = 2, colour = "yellow", show_if_password = 3 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -59.1, y = -16.0, z = -27.2 }, size = 4, direction = "left", floor_id = 2, colour = "yellow", show_if_password = 3 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -97.9, y = -15.9, z = -21.6 }, size = 4, direction = "left", floor_id = 2, colour = "yellow", show_if_password = 3 },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -140.3, y = -16.0, z = -20.2 }, size = 4, direction = "left", floor_id = 2, colour = "yellow", show_if_password = 3 },

                    -- passed levers
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -201.4, y = -15.8, z = -19.6 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -259.5, y = -15.8, z = -25.6 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -258.9, y = -20.0, z = -60.2 }, size = 4, direction = "right", floor_id = 2, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -201.6, y = -31.8, z = -59.1 }, size = 4, direction = "right", floor_id = 3, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -141.8, y = -39.8, z = -57.5 }, size = 4, direction = "up", floor_id = 3, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -137.7, y = -39.8, z = -23.6 }, size = 4, direction = "right", floor_id = 3, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -100.1, y = -39.8, z = -23.4 }, size = 4, direction = "down", floor_id = 3, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -100.4, y = -39.7, z = -70.1 }, size = 4, direction = "down", floor_id = 3, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -91.8, y = -39.7, z = -99.3 }, size = 4, direction = "right", floor_id = 3, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -60.9, y = -39.8, z = -100.4 }, size = 4, direction = "down", floor_id = 3, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -60.2, y = -39.7, z = -140.9 }, size = 4, direction = "right", floor_id = 3, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -19.3, y = -39.8, z = -146.6 }, size = 4, direction = "down", floor_id = 3, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -22.0, y = -39.8, z = -179.6 }, size = 4, direction = "left", floor_id = 3, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -61.3, y = -44.0, z = -180.6 }, size = 4, direction = "down", floor_id = 3, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -60.6, y = -52.0, z = -219.5 }, size = 4, direction = "left", floor_id = 3, colour = "yellow" },

                    -- torch run to the Brass Door, then up the ramps to the crest ??? room
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -99.5, y = -60.0, z = -218.9 }, size = 4, direction = "up", floor_id = 4, colour = "cyan" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -99.7, y = -71.8, z = -163.2 }, size = 4, direction = "up", floor_id = 4, colour = "cyan" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -97.2, y = -71.8, z = -120.2 }, size = 4, direction = "up", floor_id = 4, colour = "cyan" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -95.1, y = -71.7, z = -101.2 }, size = 4, direction = "right", floor_id = 4, colour = "cyan" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -60.4, y = -71.7, z = -99.2 }, size = 4, direction = "up", floor_id = 4, colour = "cyan" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -61.6, y = -71.8, z = -68.1 }, size = 4, direction = "down", floor_id = 4, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -64.5, y = -71.8, z = -95.9 }, size = 4, direction = "left", floor_id = 4, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -102.8, y = -71.8, z = -92.6 }, size = 4, direction = "up", floor_id = 4, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -100.0, y = -71.8, z = -50.6 }, size = 4, direction = "up", floor_id = 4, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -99.9, y = -55.8, z = -17.7 }, size = 4, direction = "up", floor_id = 4, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -100.8, y = -56.0, z = 21.5 }, size = 4, direction = "up", floor_id = 4, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -99.7, y = -59.5, z = 39.3 }, size = 4, direction = "up", floor_id = 4, colour = "yellow" },

                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Castle Oztroja",
                        floor_id = 1,
                        highlights = {
                            { position = "H-9", offsetX = 16, offsetY = 16, label = "P1", color = "Cyan" },
                            { position = "J-8", offsetX = 16, offsetY = 16, color = "Yellow" },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Castle Oztroja",
                        floor_id = 2,
                        highlights = {
                            { position = "I-8", offsetX = 16, offsetY = 16, label = "P3", color = "Cyan" },
                            { position = "G-7", offsetX = 16, offsetY = 16, label = "P2", color = "Cyan" },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Castle Oztroja",
                        floor_id = 3,
                        highlights = {
                            { position = "H-11", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Castle Oztroja",
                        floor_id = 4,
                        highlights = {
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Castle Oztroja",
                        floor_id = 5,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Castle Oztroja",
                        floor_id = 6,
                        highlights = {
                            { position = "I-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Castle Oztroja",
                        floor_id = 15,
                        highlights = {
                            { position = "H-9", offsetX = 16, offsetY = 16, label = "P2", color = "Cyan" },
                            { position = "G-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 5: Return to Maat in Ru'Lude Gardens (H-5) with all three crests to finish.\n \n" ..
                       "- Maat takes the Orcish, Quadav, and Yagudo crests and raises your level cap to 65.\n \n",
                route_to = "Ru'Lude Gardens",
                onmob_target = "Maat",
                destination_highlight = { position = "H-5", offsetX = 16, offsetY = 16 },
                keyitems_needed = { 336, 337, 338 },
                require_all_keyitems = true,
                trigger_on_event_id = { 87 },
            },
        },
        reward = {
            text = "Title: Sky Breaker.\n \n" ..
                   "- Your level cap is raised to 65.\n \n",
        },
    },

    -- Genkai 4. Maat picks ONE NPC per region at random and hands the four choices to
    -- the client as event params (see data/clue_tables.lua). Steps 2-5 therefore carry
    -- a `dynamic_target` that is resolved at display time once those params are captured.
    -- Until that engine support lands these steps still work: each one lists all eight
    -- candidates for its region, so the player can match Maat's clue by hand.
    ["Genkai 4: Riding on the Clouds"] = {
        prerequisites = {
            {category = "Limit Breaks", subfile = "Genkai", name = "Genkai 3: Whence Blows the Wind"},
        },
        requirements = {
            level = 61,
        },
        steps = {
            {
                text = "Step 1: Speak to Maat in Ru'Lude Gardens (H-5) to start the quest.\n \n" ..
                       "- Requires Lv.61-65 with your cap already raised to 65 (Genkai 3 complete).\n" ..
                       "- Maat gives you FOUR clues: one NPC in San d'Oria, one in Bastok, one in Windurst, and one in Selbina/Mhaura.\n" ..
                       "- The picks are RANDOM per player and are recorded when you accept.\n \n" ..
                       "TIP: Once flagged you can be any job or level to trade the seals. You can re-speak to Maat at any time to hear the clues again.\n \n" ..
                       "You need 4x Kindred's Seal. (Trade any 3 seals to Shami to get 1 Kindred's Seal.)\n",
                route_to = "Ru'Lude Gardens",
                onmob_target = "Maat",
                destination_highlight = { position = "H-5", offsetX = 16, offsetY = 16 },
                items_needed = { { item = "Kindred's Seal", quantity = 4 } },
                trigger_on_event_id = { 88 },
                -- Captures Maat's four picks from the event params.
                -- Event 89 is the reminder re-speak and carries the SAME four params.
                event_choices = {
                    table = "Genkai 4: Riding on the Clouds",
                    event_ids = { 88, 89 },
                    params = { 0, 1, 2, 3 },
                    slots = { "sandoria", "bastok", "windurst", "otherlands" },
                },
            },
            {
                text = "Step 2: San d'Oria - trade a Kindred's Seal for the Scowling Stone.\n \n",
                dynamic_target = { table = "Genkai 4: Riding on the Clouds", slot = "sandoria" },
                keyitems_needed = { 467 },
                trigger_on_keyitem_obtain = { 467 },
            },
            {
                text = "Step 3: Bastok - trade a Kindred's Seal for the Smiling Stone.\n \n",
                dynamic_target = { table = "Genkai 4: Riding on the Clouds", slot = "bastok" },
                keyitems_needed = { 466 },
                trigger_on_keyitem_obtain = { 466 },
            },
            {
                text = "Step 4: Windurst - trade a Kindred's Seal for the Spirited Stone.\n \n",
                dynamic_target = { table = "Genkai 4: Riding on the Clouds", slot = "windurst" },
                keyitems_needed = { 469 },
                trigger_on_keyitem_obtain = { 469 },
            },
            {
                text = "Step 5: Otherlands - trade a Kindred's Seal for the Somber Stone.\n \n" ..
                       "TIP: Selbina and Mhaura are linked by the ferry, so this leg is one trip either way.\n",
                dynamic_target = { table = "Genkai 4: Riding on the Clouds", slot = "otherlands" },
                keyitems_needed = { 468 },
                trigger_on_keyitem_obtain = { 468 },
            },
            {
                text = "Step 6: Return to Maat in Ru'Lude Gardens (H-5) with all four stones.\n \n" ..
                       "He takes the Scowling, Smiling, Spirited and Somber Stones and raises your cap to 70.\n",
                route_to = "Ru'Lude Gardens",
                onmob_target = "Maat",
                destination_highlight = { position = "H-5", offsetX = 16, offsetY = 16 },
                keyitems_needed = { 466, 467, 468, 469 },
                require_all_keyitems = true,
                trigger_on_event_id = { 90 },
            },
        },
        reward = {
            text = "Title: Cloud Breaker.\n \n" ..
                   "- Your level cap is raised to 70.\n \n",
        },
    },

    ["Genkai 5: Shattering Stars (Warrior)"] = {
        progress_group = "Genkai 5: Shattering Stars",
        job_id = 1, -- xi.job.WAR - marks this entry when you are on Warrior
        prerequisites = {
            {category = "Limit Breaks", subfile = "Genkai", name = "Genkai 4: Riding on the Clouds"},
        },
        requirements = {
            level = 66,
        },
        steps = {
            {
                text = "Step 1: Speak to Maat in Ru'Lude Gardens (H-5) to start the quest.\n \n" ..
                       "NOTE: Only needed for your FIRST Maat fight. If you have already beaten him on another\n" ..
                       "job, tick this and go straight to the burning circle.\n",
                route_to = "Ru'Lude Gardens",
                onmob_target = "Maat",
                destination_highlight = { position = "H-5", offsetX = 16, offsetY = 16 },
                trigger_on_event_id = { 92 },
                skip_if_any_job_level = 71, -- cap already broken, so event 92 is spent
            },
            {
                text = "Step 2: Farm a Warrior's Testimony.\n \n" ..
                       "Primary target: Goblin Mercenary (Lv.65-68) in Cape Teriggan around (G-8) - Use Outpost Warp if you have it - Look for the RED highlighted Goblins!\n \n" ..
                       "TIP: One testimony is good for THREE attempts at Maat. It only vanishes on the third trade to\n" ..
                       "the burning circle, so a single drop covers two retries.\n",
                route_to = "Cape Teriggan",
                destination_highlight = { position = "G-8", offsetX = 16, offsetY = 16 },
                items_needed = { "Warrior's Testimony" },
                onmob_enemy = { "Goblin Mercenary" },
                onmob_enemy_colour = "red",
                trigger_on_item_obtain = { "Warrior's Testimony" },
            },
            {
                text = "Step 3: Trade the Warrior's Testimony to Maat in Ru'Lude Gardens (H-5).\n \n" ..
                       "You cannot enter the battlefield the first time without doing this - he has to challenge\n" ..
                       "you before the burning circle will let you in.\n \n" ..
                       "- He then offers to warp you straight to Horlais Peak. Say YES, it saves the walk.\n" ..
                       "- Do your prep BEFORE you accept: once you confirm, you are in and the clock is running.\n \n" ..
                       "NOTE: Only needed for your FIRST Maat fight. After your first win he stops offering the\n" ..
                       "warp entirely and you go straight to the burning circle - tick this and move on.\n",
                route_to = "Ru'Lude Gardens",
                onmob_target = "Maat",
                destination_highlight = { position = "H-5", offsetX = 16, offsetY = 16 },
                trigger_on_event_id = { 64 },
                skip_if_any_job_level = 71, -- cap already broken, so Maat no longer warps you
            },
            {
                text = "Step 4: Beat Maat in Horlais Peak as WARRIOR.\n \n" ..
                       "If you did not take Maat's warp, trade the testimony at the Burning Circle and pick the\n" ..
                       "\"Shattering Stars\" arena - or Home Point to Yughott Grotto #1.\n \n" ..
                       "===== Before you go in =====\n" ..
                       "CRITICAL: Your SUB JOB is disabled inside. Take /BLM for the Warp out, or a Warp Ring.\n" ..
                       "CRITICAL: The 10 minute clock starts when you ZONE IN, not when you engage - resting and\n" ..
                       "buffing inside eats your timer. Bring food, meds, an Icarus Wing, and an Opo-opo Necklace\n" ..
                       "with Sleeping Potions to build TP is a commonly used tactic to zerg down Maat quickly.\n \n" ..
                       "===== The fight =====\n" ..
                       "- Maat fights as WARRIOR with your job's abilities including Mighty Strikes, but he always\n" ..
                       "  swings Hand-to-Hand and uses H2H weapon skills.\n" ..
                       "- Uncapped. He is NOT aggressive, so you get the first move.\n" ..
                       "- He usually concedes before he actually dies, so do not panic at his HP bar.\n" ..
                       "- If you have never beaten Maat on ANY job you lose NO experience on a loss. After your first win anywhere, later losses DO cost experience.\n" ..
                       "- If you have Rhapsody in Umber, you can call Trusts once you are inside.\n \n",
                --zone_trigger = "Horlais Peak",
                zone_max_distance = 35,
                onmob_target = "horlais-peak-burning-circle",
                kill_requirement = {
                    count = 1,
                    enemies = {"Maat"},
                    display_only = true,
                    reset_on_zone_entry = true,
                },
                onmob_enemy = "Maat",
                onmob_enemy_size = 1,
                visual_zones = {
                        --Ghelsba Outpost
                        { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = 28.1, y = 0.1, z = 62.2 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                        { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = -4.4, y = 0.0, z = 26.6 }, size = 4, direction = "se", floor_id = 1, colour = "yellow" },
                        { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = 19.9, y = 0.1, z = -4.8 }, size = 4, direction = "se", floor_id = 1, colour = "yellow" },
                        { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = 45.9, y = 0.0, z = -58.5 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },

                        -- Yughott Grotto 1 to K-4
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = -225.1, y = -0.2, z = -91.6 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = -191.8, y = -1.0, z = -87.9 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = -141.4, y = -0.2, z = -60.4 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = -103.5, y = -0.0, z = -56.4 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = -92.0, y = -0.6, z = -38.2 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = -78.9, y = 0.0, z = -9.7 }, size = 4, direction = "se", floor_id = 1, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = -21.5, y = -0.2, z = -25.1 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = 18.8, y = -0.2, z = 2.0 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = 56.4, y = -0.2, z = 32.4 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = 137.1, y = -12.9, z = 61.9 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = 139.8, y = -12.4, z = 113.1 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = 203.8, y = -12.0, z = 121.4 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = 236.9, y = -12.2, z = 125.9 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = 292.9, y = -23.7, z = 171.2 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = 317.5, y = -24.2, z = 180.5 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = 329.4, y = -24.4, z = 215.5 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = 335.4, y = -24.1, z = 239.0 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = 322.3, y = -24.1, z = 251.7 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },

                        -- Fort Ghelsba
                        { zone_name = "Fort Ghelsba", type = 'arrow', center = { x = 207.9, y = -45.8, z = 100.5 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Fort Ghelsba", type = 'arrow', center = { x = 151.4, y = -44.0, z = 116.0 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Fort Ghelsba", type = 'arrow', center = { x = 93.8, y = -52.0, z = 116.8 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Fort Ghelsba", type = 'arrow', center = { x = 96.9, y = -59.8, z = 66.4 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Fort Ghelsba", type = 'arrow', center = { x = 101.0, y = -60.0, z = 1.5 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Fort Ghelsba", type = 'arrow', center = { x = 109.9, y = -63.6, z = -51.9 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                        { zone_name = "Fort Ghelsba", type = 'arrow', center = { x = 146.6, y = -68.5, z = -62.1 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                        { zone_name = "Fort Ghelsba", type = 'arrow', center = { x = 184.1, y = -75.7, z = -49.2 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Fort Ghelsba", type = 'arrow', center = { x = 177.5, y = -83.9, z = -3.6 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Fort Ghelsba", type = 'arrow', center = { x = 166.4, y = -84.6, z = 20.1 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                        { zone_name = "Fort Ghelsba", type = 'arrow', center = { x = 176.7, y = -86.4, z = 20.6 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                        { zone_name = "Fort Ghelsba", type = 'arrow', center = { x = 185.2, y = -86.4, z = 24.3 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                        { zone_name = "Fort Ghelsba", type = 'arrow', center = { x = 198.8, y = -86.2, z = 19.8 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },

                        --Yughott Grotto 2
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = 283.4, y = -39.7, z = 148.5 }, size = 4, direction = "right", floor_id = 2, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = 320.8, y = -40.3, z = 135.1 }, size = 4, direction = "sw", floor_id = 2, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = 315.1, y = -40.1, z = 105.0 }, size = 4, direction = "ne", floor_id = 2, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = 330.6, y = -42.1, z = 109.8 }, size = 4, direction = "right", floor_id = 2, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = 374.5, y = -40.3, z = 105.9 }, size = 4, direction = "right", floor_id = 2, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = 400.5, y = -40.2, z = 118.6 }, size = 4, direction = "up", floor_id = 2, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = 405.5, y = -40.1, z = 148.4 }, size = 4, direction = "right", floor_id = 2, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = 436.7, y = -40.1, z = 169.2 }, size = 4, direction = "right", floor_id = 2, colour = "yellow" },

                        --Home point
                        { zone_name = "Yughott Grotto", type = 'square', center = { x = 434.0, y = -40.0, z = 171.0 }, size = 1, floor_id = 2, colour = "green" },
                },
                images = {
                      {
                          width    = 512,
                          height   = 512,
                          state    = 4,
                          zone_name = "Ghelsba Outpost",
                          floor_id = 1,
                          highlights = {
                              { position = "H-11", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 4,
                          zone_name = "Yughott Grotto",
                          floor_id = 1,
                          highlights = {
                              { position = "K-5", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 4,
                          zone_name = "Fort Ghelsba",
                          highlights = {
                              { position = "J-8", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 4,
                          zone_name = "Yughott Grotto",
                          floor_id = 2,
                          highlights = {
                              { position = "J-6", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 4,
                          zone_name = "Horlais Peak",
                          floor_id = 0,
                        --   highlights = {
                        --       { position = "J-6", offsetX = 16, offsetY = 16 },
                        --   },
                      },
                },
                trigger_on_event_id = { 32001 },
            },
            {
                text = "Step 5: Return to Maat in Ru'Lude Gardens (H-5).\n \n" ..
                       "On your FIRST win this conversation is required, for subsequent job fights skip this step manually.\n \n" ..
                       "TIP: If you have not done The Road to Aht Urhgan, a surviving testimony can be traded to\n" ..
                       "Faursel in Lower Jeuno for the Boarding Permit.\n",
                route_to = "Ru'Lude Gardens",
                onmob_target = "Maat",
                destination_highlight = { position = "H-5", offsetX = 16, offsetY = 16 },
                trigger_on_event_id = { 93 },
                skip_if_any_job_level = 71, -- cap already broken, so event 93 is spent
            },
        },
        reward = {
            text = "Title: Star Breaker (first clear) and Maat Masher, Level Cap raised to 75!\n \n",
        },
    },

    ["Genkai 5: Shattering Stars (White Mage)"] = {
        progress_group = "Genkai 5: Shattering Stars",
        job_id = 3, -- xi.job.WHM - marks this entry when you are on White Mage
        prerequisites = {
            {category = "Limit Breaks", subfile = "Genkai", name = "Genkai 4: Riding on the Clouds"},
        },
        requirements = {
            level = 66,
        },
        steps = {
            {
                text = "Step 1: Speak to Maat in Ru'Lude Gardens (H-5) to start the quest.\n \n" ..
                       "NOTE: Only needed for your FIRST Maat fight. If you have already beaten him on another\n" ..
                       "job, tick this and go straight to the burning circle.\n",
                route_to = "Ru'Lude Gardens",
                onmob_target = "Maat",
                destination_highlight = { position = "H-5", offsetX = 16, offsetY = 16 },
                trigger_on_event_id = { 92 },
                skip_if_any_job_level = 71, -- cap already broken, so event 92 is spent
            },
            {
                text = "Step 2: Farm a White Mage's Testimony.\n \n" ..
                       "Primary target: Goblin Alchemist (Lv.65-68) in Cape Teriggan around (G-8) - Use Outpost Warp if you have it - Look for the RED highlighted Goblins!\n \n" ..
                       "TIP: One testimony is good for THREE attempts at Maat. It only vanishes on the third trade to\n" ..
                       "the burning circle, so a single drop covers two retries.\n",
                route_to = "Cape Teriggan",
                destination_highlight = { position = "G-8", offsetX = 16, offsetY = 16 },
                items_needed = { "White Mage's Testimony" },
                onmob_enemy = { "Goblin Alchemist" },
                onmob_enemy_colour = "red",
                trigger_on_item_obtain = { "White Mage's Testimony" },
            },
            {
                text = "Step 3: Trade the White Mage's Testimony to Maat in Ru'Lude Gardens (H-5).\n \n" ..
                       "You cannot enter the battlefield the first time without doing this - he has to challenge\n" ..
                       "you before the burning circle will let you in.\n \n" ..
                       "- He then offers to warp you straight to Balga's Dais. Say YES, it saves the walk.\n" ..
                       "- Do your prep BEFORE you accept: once you confirm, you are in and the clock is running.\n \n" ..
                       "NOTE: Only needed for your FIRST Maat fight. After your first win he stops offering the\n" ..
                       "warp entirely and you go straight to the burning circle - tick this and move on.\n",
                route_to = "Ru'Lude Gardens",
                onmob_target = "Maat",
                destination_highlight = { position = "H-5", offsetX = 16, offsetY = 16 },
                trigger_on_event_id = { 64 },
                skip_if_any_job_level = 71, -- cap already broken, so Maat no longer warps you
            },
            {
                text = "Step 4: Beat Maat in Balga's Dais as WHITE MAGE.\n \n" ..
                       "Head into Giddeus and follow the arrows to the Burning\n" ..
                       "Circle at (F-12), then pick the \"Shattering Stars\" arena.\n \n" ..
                       "TIP: Home Point to Giddeus #1 (G-12) puts you right outside Balga's Dais.\n \n" ..
                       "===== Before you go in =====\n" ..
                       "CRITICAL: Your SUB JOB is disabled inside. Take /BLM for the Warp out, or a Warp Ring.\n" ..
                       "CRITICAL: The 10 minute clock starts when you ZONE IN, not when you engage - resting and\n" ..
                       "buffing inside eats your timer. Bring food, meds and medicines before you enter.\n \n" ..
                       "===== The fight =====\n" ..
                       "- Maat fights as WHITE MAGE with your job's abilities including Benediction, but he always\n" ..
                       "  swings Hand-to-Hand and uses H2H weapon skills.\n" ..
                       "- Uncapped. He is NOT aggressive, so you get the first move.\n" ..
                       "- He usually concedes before he actually dies, so do not panic at his HP bar.\n" ..
                       "- WHM can win by a special condition rather than damage - see the wiki job strategy page.\n" ..
                       "- If you have never beaten Maat on ANY job you lose NO experience on a loss. After your first win anywhere, later losses DO cost experience.\n" ..
                       "- If you have Rhapsody in Umber, you can call Trusts once you are inside.\n \n",
                zone_max_distance = 35,
                onmob_target = "balga-dais-burning-circle",
                kill_requirement = {
                    count = 1,
                    enemies = {"Maat"},
                    display_only = true,
                    reset_on_zone_entry = true,
                },
                onmob_enemy = "Maat",
                onmob_enemy_size = 1,
                visual_zones = {
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -100.7, y = -0.3, z = 404.4 }, size = 4, direction = "down", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -101.4, y = -0.2, z = 382.8 }, size = 4, direction = "left", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -140.1, y = 0.4, z = 376.9 }, size = 4, direction = "down", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -136.4, y = 3.9, z = 341.4 }, size = 4, direction = "sw", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -159.8, y = 4.0, z = 319.3 }, size = 4, direction = "sw", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -182.6, y = 4.0, z = 298.7 }, size = 4, direction = "down", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -180.8, y = -0.1, z = 274.4 }, size = 4, direction = "down", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -172.4, y = 0.0, z = 259.0 }, size = 4, direction = "right", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -140.2, y = -0.5, z = 256.1 }, size = 4, direction = "down", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -139.9, y = -4.0, z = 200.3 }, size = 4, direction = "down", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -138.6, y = -0.2, z = 154.5 }, size = 4, direction = "down", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -137.4, y = -0.8, z = 100.7 }, size = 4, direction = "right", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -100.0, y = -0.7, z = 94.4 }, size = 4, direction = "down", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -99.6, y = -1.2, z = 71.6 }, size = 4, direction = "sw", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -108.8, y = -2.7, z = 60.2 }, size = 4, direction = "left", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -138.3, y = -0.9, z = 51.4 }, size = 4, direction = "down", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -140.7, y = -1.2, z = -1.9 }, size = 4, direction = "down", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -138.4, y = -1.2, z = -44.0 }, size = 4, direction = "down", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -133.4, y = 1.1, z = -65.2 }, size = 4, direction = "se", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -112.6, y = 1.0, z = -80.1 }, size = 4, direction = "down", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -112.3, y = 0.9, z = -105.7 }, size = 4, direction = "se", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -86.0, y = 1.0, z = -134.6 }, size = 4, direction = "down", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -77.5, y = 1.0, z = -160.9 }, size = 4, direction = "se", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -57.6, y = -0.2, z = -186.9 }, size = 4, direction = "down", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -66.8, y = -2.8, z = -220.1 }, size = 4, direction = "left", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -108.4, y = 0.6, z = -222.8 }, size = 4, direction = "sw", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -121.9, y = 1.0, z = -241.0 }, size = 4, direction = "se", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -99.1, y = -0.9, z = -258.0 }, size = 4, direction = "se", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -98.2, y = -3.1, z = -278.0 }, size = 4, direction = "down", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -113.6, y = -3.4, z = -300.6 }, size = 4, direction = "left", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -130.7, y = -2.5, z = -299.5 }, size = 4, direction = "left", floor_id = 1, colour = "cyan" },
                },
                images = {
                      {
                          width    = 512,
                          height   = 512,
                          state    = 4,
                          zone_name = "Giddeus",
                          floor_id = 1,
                          highlights = {
                              { position = "F-12", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 4,
                          zone_name = "Balga's Dais",
                          floor_id = 0,
                      },
                },
                trigger_on_event_id = { 32001 },
            },
            {
                text = "Step 5: Return to Maat in Ru'Lude Gardens (H-5).\n \n" ..
                       "On your FIRST win this conversation is required, for subsequent job fights skip this step manually.\n \n" ..
                       "TIP: If you have not done The Road to Aht Urhgan, a surviving testimony can be traded to\n" ..
                       "Faursel in Lower Jeuno for the Boarding Permit.\n",
                route_to = "Ru'Lude Gardens",
                onmob_target = "Maat",
                destination_highlight = { position = "H-5", offsetX = 16, offsetY = 16 },
                trigger_on_event_id = { 93 },
                skip_if_any_job_level = 71, -- cap already broken, so event 93 is spent
            },
        },
        reward = {
            text = "Title: Star Breaker (first clear) and Maat Masher, Level Cap raised to 75!\n \n",
        },
    },
}
