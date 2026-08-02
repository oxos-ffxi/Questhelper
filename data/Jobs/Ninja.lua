return {
    -- =========================================================================================
    -- 1) Ayame and Kaede (Ninja unlock)
    --
    -- Log 1 (Bastok) / Quest 60 - the quest file lives in scripts/quests/bastok, not outlands.
    -- Step order follows the server's Prog chain, which differs from most wiki summaries:
    -- Korroloka BEFORE Norg, and Ryoma is gated on Prog 4. See data/ref/Jobs/ninja_reference.md.
    -- =========================================================================================
    ["1.Ninja Quest - Ayame and Kaede"] = {
        requirements = {
            level = 30,
        },
        -- Step 6 is in Norg, so you need a way into Kazham. Flagged recommended rather than
        -- required because RoV 'The Beginning' also gets you there and has no entry to point at.
        prerequisites = {
            { category = "Quests", subfile = "Port Jeuno", name = "Kazham Airship Pass Quest", recommended = true },
        },
        steps = {
            {
                text = "Step 1: Talk to Kaede in Port Bastok (J-5), in the northernmost house, for the opening cutscene about Ensetsu's family and the pirates of Norg.\n \n" ..
                       "NOTE: This quest sends you to Norg, so you need a way in before you start - a Kazham airship pass, or 'The Beginning' from Rhapsodies of Vana'diel. Sort it out now or you stall halfway.\n \n",
                onmob_target = "Kaede",
                route_to = "Port Bastok",
                destination_highlight = { position = "J-5", offsetX = 16, offsetY = 16 },
                zone_max_distance = 30,
                visual_zones = {
                    -- To Kaede
                    { zone_name = "Port Bastok", type = 'arrow', center = { x = 2.3, y = -2.1, z = 12.8 }, size = 3, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Port Bastok", type = 'arrow', center = { x = 31.7, y = -2.1, z = 10.3 }, size = 3, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Port Bastok", type = 'arrow', center = { x = 37.3, y = -4.1, z = 22.4 }, size = 3, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Port Bastok", type = 'arrow', center = { x = 36.8, y = -6.1, z = 46.6 }, size = 3, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Port Bastok", type = 'rect', center = { x = 42.0, y = -7.9, z = 56.1 }, width = 2.50, height = 2.75, floor_id = 0, colour = "cyan", vertical_axis = 'ns' },
                },
                trigger_on_event_id = { 240 },
            },
            {
                text = "Step 2: Talk to Kagetora in the Warehouse 2 at (F-6) in Port Bastok for the next scene.\n \n",
                onmob_target = "Kagetora",
                route_to = "Port Bastok",
                destination_highlight = { position = "F-6", offsetX = 16, offsetY = 16 },
                zone_max_distance = 30,
                visual_zones = {
                        { zone_name = "Port Bastok", type = 'arrow', center = { x = -100.0, y = -2.1, z = 14.9 }, size = 3, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Port Bastok", type = 'rect', center = { x = -100.0, y = -3.6, z = 19.7 }, width = 2.75, height = 2.75, floor_id = 0, colour = "cyan", vertical_axis = 'ns' },
                },
                trigger_on_event_id = { 241 },
            },
            {
                text = "Step 3: Talk to Ensetsu in Port Bastok (J-5), next door to Kaede - he asks you for the favour that drives the rest of the quest.\n \n",
                onmob_target = "Ensetsu",
                route_to = "Port Bastok",
                destination_highlight = { position = "J-5", offsetX = 16, offsetY = 16 },
                zone_max_distance = 30,
                visual_zones = {
                    -- To Kaede
                    { zone_name = "Port Bastok", type = 'arrow', center = { x = 2.3, y = -2.1, z = 12.8 }, size = 3, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Port Bastok", type = 'arrow', center = { x = 31.7, y = -2.1, z = 10.3 }, size = 3, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Port Bastok", type = 'arrow', center = { x = 37.3, y = -4.1, z = 22.4 }, size = 3, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Port Bastok", type = 'arrow', center = { x = 36.8, y = -6.1, z = 46.6 }, size = 3, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Port Bastok", type = 'rect', center = { x = 42.0, y = -7.9, z = 56.1 }, width = 2.50, height = 2.75, floor_id = 0, colour = "cyan", vertical_axis = 'ns' },
                },
                trigger_on_event_id = { 242 },
            },
            {
                text = "Step 4: In Korroloka Tunnel, examine the ??? on Map 5 at (L-8) to pop three Korroloka Leeches, kill all three, then examine the ??? again for the Key Item: Strangely Shaped Coral.\n \n" ..
                       "- All THREE leeches must die before the ??? will hand over the coral.\n" ..
                       "- Enter from Zeruhn Mines (N-6) on the Bastok side. Eastern Altepa Desert gets you in from the far side, but the route below starts from Zeruhn.\n \n" ..
                       "NOTE: The maps have highlights with numbers, but there will be arrows to follow to the quests destination.\n \n" ..
                       "WARNING: Long, mazey zone with aggro. Bring Sneak and Invisible at this level.\n \n",
                images = {
                    {
                        zone_name = "Korroloka Tunnel",
                        floor_id  = 1,
                        width     = 512,
                        height    = 512,
                        state     = 4,
                        highlights = {
                            { position = "C-8", offsetX = 16, offsetY = 16, label = "1" },
                        },
                    },
                    {
                        zone_name = "Korroloka Tunnel",
                        floor_id  = 3,
                        width     = 512,
                        height    = 512,
                        state     = 4,
                        highlights = {
                            { position = "I-9", offsetX = 16, offsetY = 16, label = "2" },
                            { position = "F-10", offsetX = 16, offsetY = 16, label = "4" },
                        },
                    },
                    {
                        zone_name = "Korroloka Tunnel",
                        floor_id  = 2,
                        width     = 512,
                        height    = 512,
                        state     = 4,
                        highlights = {
                            { position = "K-7", offsetX = 16, offsetY = 16, label = "3" },
                            { position = "G-7", offsetX = 16, offsetY = 16, label = "5" },
                        },
                    },
                    {
                        zone_name = "Korroloka Tunnel",
                        floor_id  = 5,
                        width     = 512,
                        height    = 512,
                        state     = 4,
                        highlights = {
                            { position = "L-8", offsetX = 16, offsetY = 16, label = "6", color = "cyan" },
                        },
                    },
                },
                onmob_target = "korroloka-tunnel-ninja-qm2-???",
                onmob_enemy = "Korroloka Leech",
                onmob_target_size = 1,
                zone_max_distance = 30,
                kill_requirement = {
                    count = 3,
                    enemies = { "Korroloka Leech" },
                    zone = "Korroloka Tunnel",
                    count_party_kills = true,
                    display_only = true,
                },
                keyitems_needed = {257},
                trigger_on_keyitem_obtain = {257},
                visual_zones = {
                    -- To Map 5 - ???
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = 420.8, y = -29.4, z = 182.6 }, size = 3, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = 380.7, y = -18.6, z = 155.1 }, size = 3, direction = "sw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = 351.5, y = -11.3, z = 135.4 }, size = 3, direction = "sw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = 332.7, y = -10.8, z = 108.5 }, size = 3, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = 301.6, y = -10.8, z = 106.6 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = 300.2, y = -10.0, z = 79.7 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = 285.3, y = -9.4, z = 60.7 }, size = 3, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = 261.6, y = -7.4, z = 53.2 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = 251.3, y = -5.6, z = 21.0 }, size = 3, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = 221.1, y = -5.6, z = 29.2 }, size = 3, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = 221.7, y = -5.5, z = 61.1 }, size = 3, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = 189.4, y = -5.1, z = 62.7 }, size = 3, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = 158.1, y = -5.5, z = 64.1 }, size = 3, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = 140.2, y = -4.4, z = 65.8 }, size = 3, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = 139.4, y = -5.0, z = 97.1 }, size = 3, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = 83.5, y = -5.4, z = 96.0 }, size = 3, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = 38.4, y = -5.5, z = 95.0 }, size = 3, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = 24.6, y = -5.5, z = 96.2 }, size = 3, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = -6.4, y = -5.3, z = 100.3 }, size = 3, direction = "left", floor_id = 3, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = -54.5, y = -4.1, z = 101.0 }, size = 3, direction = "left", floor_id = 3, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = -84.0, y = -5.5, z = 99.8 }, size = 3, direction = "left", floor_id = 3, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = -97.7, y = -5.7, z = 94.9 }, size = 3, direction = "down", floor_id = 3, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = -108.1, y = -4.6, z = 62.9 }, size = 3, direction = "sw", floor_id = 2, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = -123.0, y = -4.3, z = 52.2 }, size = 3, direction = "nw", floor_id = 2, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = -139.2, y = -5.5, z = 81.4 }, size = 3, direction = "up", floor_id = 3, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = -144.0, y = -5.5, z = 103.5 }, size = 3, direction = "nw", floor_id = 3, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = -160.0, y = -6.0, z = 120.4 }, size = 3, direction = "sw", floor_id = 3, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = -182.5, y = -5.3, z = 101.5 }, size = 3, direction = "sw", floor_id = 3, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = -207.3, y = -5.5, z = 81.6 }, size = 3, direction = "sw", floor_id = 3, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = -221.0, y = -5.5, z = 70.7 }, size = 3, direction = "down", floor_id = 3, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = -219.5, y = -5.5, z = 41.8 }, size = 3, direction = "down", floor_id = 3, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = -219.0, y = -5.5, z = 28.8 }, size = 3, direction = "down", floor_id = 2, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = -225.6, y = -4.9, z = 17.3 }, size = 3, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = -263.1, y = -4.6, z = 17.2 }, size = 3, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = -300.5, y = -5.3, z = 22.7 }, size = 3, direction = "up", floor_id = 2, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = -307.6, y = -5.4, z = 57.9 }, size = 3, direction = "left", floor_id = 5, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = -339.1, y = -5.0, z = 63.8 }, size = 3, direction = "up", floor_id = 5, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = -339.1, y = -4.7, z = 109.3 }, size = 3, direction = "up", floor_id = 5, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = -340.4, y = -5.5, z = 148.1 }, size = 3, direction = "up", floor_id = 5, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = -337.8, y = -6.0, z = 178.7 }, size = 3, direction = "right", floor_id = 5, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = -299.1, y = -10.0, z = 189.3 }, size = 3, direction = "up", floor_id = 5, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = -302.6, y = -9.9, z = 219.0 }, size = 3, direction = "right", floor_id = 5, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = -260.6, y = -9.7, z = 214.7 }, size = 3, direction = "down", floor_id = 5, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = -260.4, y = -10.6, z = 172.2 }, size = 3, direction = "down", floor_id = 5, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = -260.8, y = -9.5, z = 142.5 }, size = 3, direction = "right", floor_id = 5, colour = "yellow" },
                    { zone_name = "Korroloka Tunnel", type = 'arrow', center = { x = -226.9, y = -10.4, z = 149.5 }, size = 3, direction = "ne", floor_id = 5, colour = "yellow" },
                },
            },
            {
                text = "Step 5: Return to Ensetsu in Port Bastok (J-5) with the Strangely Shaped Coral.\n \n",
                onmob_target = "Ensetsu",
                route_to = "Port Bastok",
                destination_highlight = { position = "J-5", offsetX = 16, offsetY = 16 },
                zone_max_distance = 30,
                visual_zones = {
                    -- To Ensetsu
                    { zone_name = "Port Bastok", type = 'arrow', center = { x = 2.3, y = -2.1, z = 12.8 }, size = 3, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Port Bastok", type = 'arrow', center = { x = 31.7, y = -2.1, z = 10.3 }, size = 3, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Port Bastok", type = 'arrow', center = { x = 37.3, y = -4.1, z = 22.4 }, size = 3, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Port Bastok", type = 'arrow', center = { x = 36.8, y = -6.1, z = 46.6 }, size = 3, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Port Bastok", type = 'rect', center = { x = 42.0, y = -7.9, z = 56.1 }, width = 2.50, height = 2.75, floor_id = 0, colour = "cyan", vertical_axis = 'ns' },
                },
                trigger_on_event_id = { 245 },
            },
            {
                text = "Step 6: Travel to Norg and speak with Ryoma (H-8) for the Key Item: Sealed Dagger.\n \n" ..
                       "- He stands on a slight ledge on the left-hand side near the water, in the first big room.\n" ..
                       "- He trades you the dagger for the coral, so the Strangely Shaped Coral leaves your key items here.\n" ..
                       "- Getting there: airship to Kazham, out into Yuhtunga Jungle, in at the Sea Serpent Grotto entrance (E-11), then a short run to Norg. A chocobo from Kazham saves most of the jungle.\n \n" ..
                       "WARNING: Sahagin in Sea Serpent Grotto aggro. Sneak is strongly recommended.\n \n",
                onmob_target = "Ryoma",
                route_to = "Norg",
                destination_highlight = { position = "H-8", offsetX = 16, offsetY = 16 },
                zone_max_distance = 35,
                -- Kazham exit down to the Sea Serpent Grotto entrance. Same chain as Bastok
                -- mission 6-1 step 4 (Gilgamesh), which routes to Norg the same way.
                visual_zones = {
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -206.8, y = 0.0, z = 435.6 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -229.7, y = 0.4, z = 364.3 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -296.8, y = 3.2, z = 182.1 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -262.1, y = 4.5, z = 61.3 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -294.4, y = 0.9, z = 26.1 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -271.1, y = 0.0, z = -17.8 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -296.9, y = 4.5, z = -99.7 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -255.7, y = 0.9, z = -105.6 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -221.6, y = 1.4, z = -135.3 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -219.6, y = 4.6, z = -220.7 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -201.5, y = 0.0, z = -322.9 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yuhtunga Jungle", type = 'square', center = { x = -261.8, y = 0.2, z = -374.2 }, size = 6, floor_id = 0 },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -264.3, y = 13.5, z = -376.8 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -390.2, y = 17.0, z = -366.3 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -477.6, y = 16.3, z = -378.9 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },

                    -- To Norg
                    { zone_name = "Sea Serpent Grotto", type = 'square', center = { x = 223.0, y = -23.7, z = 335.0 }, size = 1, floor_id = 1, colour = "green" },
                    { zone_name = "Sea Serpent Grotto", type = 'arrow', center = { x = 222.1, y = -20.0, z = 320.1 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Sea Serpent Grotto", type = 'arrow', center = { x = 219.0, y = -16.8, z = 271.3 }, size = 3, direction = "sw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Sea Serpent Grotto", type = 'arrow', center = { x = 188.0, y = -9.7, z = 260.6 }, size = 3, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Sea Serpent Grotto", type = 'arrow', center = { x = 123.9, y = -8.9, z = 261.0 }, size = 3, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Sea Serpent Grotto", type = 'arrow', center = { x = 83.4, y = -9.8, z = 260.1 }, size = 3, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Sea Serpent Grotto", type = 'arrow', center = { x = 67.2, y = -4.8, z = 253.0 }, size = 3, direction = "sw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Sea Serpent Grotto", type = 'arrow', center = { x = 43.8, y = 9.2, z = 222.0 }, size = 3, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Sea Serpent Grotto", type = 'arrow', center = { x = 21.2, y = 9.8, z = 216.1 }, size = 3, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Sea Serpent Grotto", type = 'arrow', center = { x = 20.5, y = 10.0, z = 236.7 }, size = 3, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Sea Serpent Grotto", type = 'rect', center = { x = 20.0, y = 8.5, z = 239.6 }, width = 4.00, height = 3.00, floor_id = 1, colour = "cyan", vertical_axis = 'ns' },
                    { zone_name = "Sea Serpent Grotto", type = 'arrow', center = { x = 19.4, y = 10.1, z = 249.7 }, size = 3, direction = "nw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Sea Serpent Grotto", type = 'arrow', center = { x = 3.9, y = 11.2, z = 261.6 }, size = 3, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Sea Serpent Grotto", type = 'arrow', center = { x = -15.3, y = 10.9, z = 264.5 }, size = 3, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Sea Serpent Grotto", type = 'arrow', center = { x = -16.2, y = 10.8, z = 292.1 }, size = 3, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Sea Serpent Grotto", type = 'arrow', center = { x = -8.6, y = 10.1, z = 306.3 }, size = 3, direction = "nw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Sea Serpent Grotto", type = 'arrow', center = { x = -25.5, y = 5.9, z = 330.4 }, size = 3, direction = "nw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Sea Serpent Grotto", type = 'arrow', center = { x = -42.0, y = 0.0, z = 339.7 }, size = 3, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Sea Serpent Grotto", type = 'arrow', center = { x = -61.0, y = -2.0, z = 344.2 }, size = 3, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Sea Serpent Grotto", type = 'arrow', center = { x = -61.1, y = -0.5, z = 374.1 }, size = 3, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Sea Serpent Grotto", type = 'arrow', center = { x = -61.0, y = 1.3, z = 398.9 }, size = 3, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Sea Serpent Grotto", type = 'arrow', center = { x = -60.6, y = -0.6, z = 414.9 }, size = 3, direction = "up", floor_id = 1, colour = "yellow" },
                },
                trigger_on_event_id = { 95 },
            },
            {
                text = "Step 7: Take the Sealed Dagger back to Ensetsu in Port Bastok (J-5) for the final cutscene. This unlocks Ninja.\n \n" ..
                       "- The Sealed Dagger is consumed here.\n \n",
                onmob_target = "Ensetsu",
                route_to = "Port Bastok",
                destination_highlight = { position = "J-5", offsetX = 16, offsetY = 16 },
                zone_max_distance = 30,
                visual_zones = {
                    -- To Ensetsu
                    { zone_name = "Port Bastok", type = 'arrow', center = { x = 2.3, y = -2.1, z = 12.8 }, size = 3, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Port Bastok", type = 'arrow', center = { x = 31.7, y = -2.1, z = 10.3 }, size = 3, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Port Bastok", type = 'arrow', center = { x = 37.3, y = -4.1, z = 22.4 }, size = 3, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Port Bastok", type = 'arrow', center = { x = 36.8, y = -6.1, z = 46.6 }, size = 3, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Port Bastok", type = 'rect', center = { x = 42.0, y = -7.9, z = 56.1 }, width = 2.50, height = 2.75, floor_id = 0, colour = "cyan", vertical_axis = 'ns' },
                },
                trigger_on_event_id = { 246 },
            },
        },
        reward = {
            text = "Unlocks the Ninja job!\n \n" ..
                   "Title: Shadow Walker\n" ..
                   "Job gesture: ninja\n" ..
                   "Norg fame +20\n \n",
        },
    },
}
