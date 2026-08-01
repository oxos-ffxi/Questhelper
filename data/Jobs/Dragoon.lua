return {
    -- =========================================================================================
    -- 1) The Holy Crest (Dragoon unlock)
    --
    -- No quest script in LSB - only the battlefield (Ghelsba_Outpost/Holy_Crest.lua). Steps come
    -- from the zone NPC scripts, all driven by one charvar: TheHolyCrest_Event.
    -- See data/ref/Jobs/dragoon_reference.md.
    -- =========================================================================================
    ["1.Dragoon Quest - The Holy Crest"] = {
        requirements = {
            level = 30,
        },
        -- Step 2 is inside Chateau d'Oraguille. Rank 2 gets a San d'Orian in; a foreigner needs
        -- to be on their nation's 2-3, so any one of these three covers it.
        prerequisites = {
            { any = {
                { category = "Missions", subfile = "SanDoria", name = "1-3: Save the Children" },
                { category = "Missions", subfile = "Bastok", name = "2-3a: The Emissary - Introduction" },
                { category = "Missions", subfile = "Windurst", name = "2-3a: The Three Kingdoms - Introduction" },
            } },
        },
        steps = {
            {
                text = "Step 1: In Port San d'Oria (I-9), go to Cargo Room A and talk to Ceraulian or Arminibit.\n \n" ..
                       "- Talking to either one starts a conversation between the two of them. \n",
                onmob_target = { "Ceraulian", "Arminibit" },
                route_to = "Port San d'Oria",
                destination_highlight = { position = "I-9", offsetX = 16, offsetY = 16 },
                trigger_on_event_id = { 24 },
                zone_max_distance = 30,
                visual_zones = {
                        -- Cargo Room A.
                        { zone_name = "Port San d'Oria", type = 'arrow', center = { x = 4.2, y = -8.0, z = -129.6 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Port San d'Oria", type = 'rect', center = { x = 4.0, y = -10.3, z = -126.1 }, width = 4.00, height = 4.50, floor_id = 0, colour = "cyan", vertical_axis = 'ns' },
                },
            },
            {
                text = "Step 2: Talk to Novalmauge in Bostaunieux Oubliette, beneath Chateau d'Oraguille.\n \n" ..
                       "- He PATROLS between (F-8) and (G-8) - if he is not where the marker says, walk the corridor.\n" ..
                       "- Without the map: zone in, follow the hallway south, then turn west.\n \n" ..
                       "CRITICAL: If the Scythe weaponskill quest 'Souls in Shadow' is active you cannot progress here until you finish the Scythe of Trials. Novalmauge hands out the Scythe of Trials from the same conversation that flags Dragoon, so read the dialogue options and pick the Dragoon one deliberately.\n \n",
                onmob_target = "Novalmauge",
                route_to = "Bostaunieux Oubliette",
                destination_highlight = {
                    { position = "F-8", offsetX = 16, offsetY = 16, floor_id = 15 },
                    { position = "G-8", offsetX = 16, offsetY = 16, floor_id = 15 },
                },
                zone_max_distance = 40,
                visual_zones = {
                    { zone_name = "Bostaunieux Oubliette", type = 'arrow', center = { x = 99.0, y = -24.0, z = 64.2 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                    { zone_name = "Bostaunieux Oubliette", type = 'arrow', center = { x = 99.6, y = -24.0, z = 20.6 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                },
                trigger_on_event_id = { 6 },
            },
            {
                text = "Step 3: Talk to Morjean (L-7) in Northern San d'Oria, in the manuscript room inside the Cathedral - on your left as soon as you enter.\n \n" ..
                       "NOTE: May require multiple talks to Morjean to trigger the correct cutscene.\n \n",
                onmob_target = "Morjean",
                route_to = "Northern San d'Oria",
                destination_highlight = { position = "L-7", offsetX = 16, offsetY = 16 },
                trigger_on_event_id = { 65 },
                zone_max_distance = 15,
                visual_zones = {
                    -- To Morjean in the Manuscript room.
                    { zone_name = "Northern San d'Oria", type = 'arrow', center = { x = 73.9, y = 0.0, z = 64.8 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Northern San d'Oria", type = 'arrow', center = { x = 109.7, y = 0.0, z = 101.9 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Northern San d'Oria", type = 'arrow', center = { x = 118.1, y = 0.0, z = 110.3 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Northern San d'Oria", type = 'arrow', center = { x = 103.1, y = 0.0, z = 123.9 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Northern San d'Oria", type = 'rect', center = { x = 101.4, y = -1.5, z = 125.9 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'nw' },
                    { zone_name = "Northern San d'Oria", type = 'arrow', center = { x = 99.3, y = 0.0, z = 128.5 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                },
            },
            {
                text = "Step 4: Buy a Pickaxe from Ostalie in Southern San d'Oria (E-9).\n \n" ..
                       "- You are already in San d'Oria for Morjean, so pick one up before making the trip out to Kazham side.\n" ..
                       "- One pickaxe is all the quest needs - the egg is a guaranteed trade, not a random dig. Buy spares only if you intend to dig for crafting materials while you are down there.\n" ..
                       "- Any pickaxe you already have counts, from the Auction House or otherwise.\n \n",
                onmob_target = "Ostalie",
                route_to = "Southern San d'Oria",
                destination_highlight = { position = "E-9", offsetX = 16, offsetY = 16 },
                zone_max_distance = 30,
                visual_zones = {
                        -- To buy pickaxes from Ostalie
                        { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -143.9, y = -2.0, z = 18.8 }, size = 3, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Southern San d'Oria", type = 'rect', center = { x = -144.0, y = -4.5, z = 10.4 }, width = 2.50, height = 3.25, floor_id = 0, colour = "cyan", vertical_axis = 'ns' },
                },
                items_needed = { "Pickaxe" },
                trigger_on_item_obtain = { "pickaxe" },
            },
            {
                text = "Step 5: Dig up the Wyvern Egg in the Maze of Shakhrami.\n \n" ..
                       "- The Maze of Shakhrami entrance is at (K-5) in Tahrongi Canyon, with a Survival Guide right at the entrance.\n" ..
                       "- Trade the pickaxe to an excavation point to receive the Wyvern Egg. One trade is enough - it is not a random dig.\n" ..
                       "- Excavation points MOVE. A point hops to another spot once it is worked out, so walk a circuit rather than waiting at an empty one. All 13 spots one can sit in are marked for you.\n" ..
                       "NOTE: The egg only comes from the trade once you have watched the Morjean cutscene in step 3. Trade a pickaxe before that and you get ordinary excavation loot and lose the pickaxe.\n \n" ..
                       "WARNING: At Lv30 bring Sneak and Invisible or keep a Trust out. Map 2 has Lv80+ monsters, so bring sneak/invis for that regardless of your level.\n \n",
                -- The 13 excavation spawn spots, from LSB scripts/globals/hobbies/helm/data.lua.
                -- A point hops to another of these once worked out, so all 13 are marked. No
                -- floor_id: which map each spot sits on is unverified, and omitting it draws on all.
                zone_max_distance = 50,
                visual_zones = {
                    -- Excavation Points hardcoded values
                    { zone_name = "Maze of Shakhrami", type = 'square', center = { x = -117.3, y = 0.9, z = -22.5 }, size = 1, colour = "cyan" },
                    { zone_name = "Maze of Shakhrami", type = 'square', center = { x = -109.8, y = 0.3, z = -35.5 }, size = 1, colour = "cyan" },
                    { zone_name = "Maze of Shakhrami", type = 'square', center = { x = -95.1, y = 0.4, z = -27.9 }, size = 1, colour = "cyan" },
                    { zone_name = "Maze of Shakhrami", type = 'square', center = { x = -56.5, y = -4.0, z = 14.8 }, size = 1, colour = "cyan" },
                    { zone_name = "Maze of Shakhrami", type = 'square', center = { x = -37.0, y = -4.2, z = 8.7 }, size = 1, colour = "cyan" },
                    { zone_name = "Maze of Shakhrami", type = 'square', center = { x = 82.3, y = 0.9, z = 57.5 }, size = 1, colour = "cyan" },
                    { zone_name = "Maze of Shakhrami", type = 'square', center = { x = 123.4, y = 0.9, z = 28.9 }, size = 1, colour = "cyan" },
                    { zone_name = "Maze of Shakhrami", type = 'square', center = { x = 170.7, y = 0.1, z = -91.4 }, size = 1, colour = "cyan" },
                    { zone_name = "Maze of Shakhrami", type = 'square', center = { x = 233.9, y = 0.3, z = 31.8 }, size = 1, colour = "cyan" },
                    { zone_name = "Maze of Shakhrami", type = 'square', center = { x = 235.0, y = -0.9, z = -107.5 }, size = 1, colour = "cyan" },
                    { zone_name = "Maze of Shakhrami", type = 'square', center = { x = 255.1, y = 0.4, z = -169.0 }, size = 1, colour = "cyan" },
                    { zone_name = "Maze of Shakhrami", type = 'square', center = { x = 255.8, y = -0.2, z = -144.9 }, size = 1, colour = "cyan" },
                    { zone_name = "Maze of Shakhrami", type = 'square', center = { x = 405.6, y = -0.3, z = -44.5 }, size = 1, colour = "cyan" },

                    --Route through all of them if the player cant find ANY
                    { zone_name = "Maze of Shakhrami", type = 'square', center = { x = -338.0, y = -12.0, z = -179.0 }, size = 1, floor_id = 15, colour = "green" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = -340.0, y = -12.2, z = -176.8 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = -319.0, y = 0.0, z = -139.5 }, size = 3, direction = "right", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = -288.7, y = 0.0, z = -130.6 }, size = 3, direction = "ne", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = -255.3, y = 0.0, z = -93.5 }, size = 3, direction = "ne", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = -232.4, y = -0.7, z = -67.9 }, size = 3, direction = "ne", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = -217.4, y = -0.7, z = -46.2 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = -206.4, y = 0.1, z = -4.7 }, size = 3, direction = "right", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = -174.9, y = 1.0, z = 0.6 }, size = 3, direction = "right", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = -153.3, y = 0.2, z = -5.1 }, size = 3, direction = "se", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = -121.0, y = 1.0, z = -27.5 }, size = 3, direction = "se", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = -108.2, y = 0.9, z = -39.5 }, size = 3, direction = "right", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = -97.9, y = 0.1, z = -34.6 }, size = 3, direction = "ne", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = -76.0, y = 0.5, z = -11.4 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = -74.7, y = 0.4, z = 7.6 }, size = 3, direction = "right", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = -58.4, y = -4.6, z = 11.5 }, size = 3, direction = "right", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = -36.3, y = -4.0, z = 9.7 }, size = 3, direction = "right", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = -22.8, y = -4.2, z = 5.7 }, size = 3, direction = "se", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = -4.4, y = 0.0, z = -9.3 }, size = 3, direction = "right", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 14.8, y = -0.7, z = -15.9 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 19.4, y = 3.3, z = -52.6 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 29.0, y = 16.5, z = -96.4 }, size = 3, direction = "right", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 51.9, y = 19.9, z = -103.4 }, size = 3, direction = "right", floor_id = 16, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 74.4, y = 19.7, z = -110.7 }, size = 3, direction = "right", floor_id = 16, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 110.3, y = 20.0, z = -114.4 }, size = 3, direction = "down", floor_id = 16, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 108.3, y = 20.0, z = -149.2 }, size = 3, direction = "sw", floor_id = 16, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 101.1, y = 19.0, z = -166.0 }, size = 3, direction = "down", floor_id = 16, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 99.7, y = 10.7, z = -196.3 }, size = 3, direction = "down", floor_id = 16, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 107.7, y = 8.3, z = -220.0 }, size = 3, direction = "right", floor_id = 16, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 140.7, y = 9.9, z = -212.1 }, size = 3, direction = "up", floor_id = 16, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 153.6, y = 1.7, z = -179.7 }, size = 3, direction = "right", floor_id = 16, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 171.1, y = 0.3, z = -180.6 }, size = 3, direction = "right", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 215.7, y = -0.5, z = -174.5 }, size = 3, direction = "right", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 244.6, y = 0.5, z = -168.8 }, size = 3, direction = "right", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 262.3, y = 0.0, z = -169.8 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 259.4, y = -0.8, z = -148.7 }, size = 3, direction = "nw", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 246.1, y = 0.2, z = -121.7 }, size = 3, direction = "nw", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 234.5, y = -2.0, z = -105.6 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 208.3, y = -0.0, z = -101.4 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 184.0, y = 0.1, z = -104.7 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 174.6, y = -0.5, z = -100.4 }, size = 3, direction = "nw", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 153.9, y = 0.0, z = -76.4 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 150.7, y = 0.6, z = -26.3 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 146.5, y = 1.0, z = -0.8 }, size = 3, direction = "nw", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 128.7, y = -0.1, z = 19.4 }, size = 3, direction = "nw", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 124.0, y = 0.8, z = 32.2 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 126.1, y = 0.4, z = 65.8 }, size = 3, direction = "ne", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 149.6, y = -1.5, z = 89.8 }, size = 3, direction = "right", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 173.1, y = -5.6, z = 90.6 }, size = 3, direction = "ne", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 185.1, y = -6.9, z = 98.9 }, size = 3, direction = "right", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 203.9, y = -0.0, z = 98.2 }, size = 3, direction = "right", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 223.6, y = -0.2, z = 92.8 }, size = 3, direction = "se", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 233.1, y = 0.1, z = 85.4 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 235.8, y = -0.6, z = 49.2 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 233.3, y = 0.3, z = 27.3 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 238.5, y = 0.0, z = 7.0 }, size = 3, direction = "se", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 266.5, y = -2.0, z = -17.9 }, size = 3, direction = "right", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 308.4, y = 8.0, z = -19.7 }, size = 3, direction = "right", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 339.2, y = 10.6, z = -23.1 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 359.7, y = 0.0, z = -60.5 }, size = 3, direction = "right", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 384.3, y = 0.0, z = -57.2 }, size = 3, direction = "ne", floor_id = 15, colour = "yellow" },
                },
                images = {
                    {
                        zone_name = "Maze of Shakhrami",
                        floor_id  = 15,
                        width     = 512,
                        height    = 512,
                        state     = 5,
                        highlights = {
                            { position = "F-7", offsetX = 16, offsetY = 16, label = "EP" },
                            { position = "G-7", offsetX = 16, offsetY = 16, label = "EP" },
                            { position = "K-9", offsetX = 16, offsetY = 16, label = "EP" },
                            { position = "I-6", offsetX = 16, offsetY = 16, label = "EP" },
                            { position = "J-7", offsetX = 16, offsetY = 16, label = "EP" },
                            { position = "M-8", offsetX = 16, offsetY = 16, label = "EP" },
                        },
                    },
                    {
                        zone_name = "Maze of Shakhrami",
                        floor_id  = 16,
                        width     = 512,
                        height    = 512,
                        state     = 5,
                        highlights = {
                            { position = "J-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
                trigger_on_item_obtain = { "Wyvern Egg"},
            },
            {
                text = "Step 6: Return to Morjean (L-7) in Northern San d'Oria with the Wyvern Egg.\n \n" ..
                       "- Cutscene: Yachemidot asks you to carry the egg to the Meriphataud Mountains.\n \n",
                onmob_target = "Morjean",
                route_to = "Northern San d'Oria",
                destination_highlight = { position = "L-7", offsetX = 16, offsetY = 16 },
                zone_max_distance = 15,
                visual_zones = {
                    -- To Morjean in the Manuscript room.
                    { zone_name = "Northern San d'Oria", type = 'arrow', center = { x = 73.9, y = 0.0, z = 64.8 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Northern San d'Oria", type = 'arrow', center = { x = 109.7, y = 0.0, z = 101.9 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Northern San d'Oria", type = 'arrow', center = { x = 118.1, y = 0.0, z = 110.3 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Northern San d'Oria", type = 'arrow', center = { x = 103.1, y = 0.0, z = 123.9 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Northern San d'Oria", type = 'rect', center = { x = 101.4, y = -1.5, z = 125.9 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'nw' },
                    { zone_name = "Northern San d'Oria", type = 'arrow', center = { x = 99.3, y = 0.0, z = 128.5 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                },
                trigger_on_event_id = { 62 },
            },
            {
                text = "Step 7: Trade the Wyvern Egg to the ??? at (K-8) in Meriphataud Mountains for a cutscene.\n \n" ..
                       "- It sits on the eastern edge of Drogaroga's Spine.\n \n" ..
                       "TIP: Fastest approach is the Survival Guide at the Castle Oztroja entrance, then the Meriphataud Mountains Outpost Survival Guide.\n \n",
                route_to = "Meriphataud Mountains",
                destination_highlight = { position = "K-8", offsetX = 16, offsetY = 16 },
                onmob_target = "meriphataud-mountains-holy-creast-qm-k8",
                zone_max_distance = 45,
                trigger_on_event_id = { 56, 33 },
            },
            {
                text = "Step 8: Talk to Rahal in the Royal Knight's Quarters of Chateau d'Oraguille - on your left as you enter - for the Key Item: Dragon Curse Remedy.\n \n" ..
                       "NOTE: If 'Lure of the Wildcat (San d'Oria)' is active, Rahal berates you for being a mercenary instead of handing anything over. Just talk to him a second time.\n \n",
                onmob_target = "Rahal",
                route_to = "Chateau d'Oraguille",
                destination_highlight = { position = "I-9", offsetX = 16, offsetY = 16 },
                trigger_on_keyitem_obtain = { 294 },
                zone_max_distance = 20,
                visual_zones = {
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = 1.0, y = 0.0, z = -3.5 }, size = 3, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -16.5, y = 0.0, z = -3.8 }, size = 3, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Chateau d'Oraguille", type = 'rect', center = { x = -19.5, y = -1.2, z = -4.0 }, width = 2.75, height = 2.50, floor_id = 0, colour = "cyan", vertical_axis = 'z' },
                },
                keyitems_needed = { 294 },
            },
            {
                text = "Step 9: Go to the hut at (F-10) in Ghelsba Outpost and open the door to enter the battlefield 'The Holy Crest'. Defeat Cyranuce M Cutauleon to unlock Dragoon.\n \n" ..
                       "- Entry needs the Dragon Curse Remedy key item. Only players on this quest, or who have already finished it, can go in.\n" ..
                       "- 6 players max, 15 minute limit, UNCAPPED.\n" ..
                       "- TP and buffs are NOT lost on entry, so buff up outside and walk in loaded.\n" ..
                       "CRITICAL: Trust magic cannot be used in this fight. Whatever you rely on outside, you do not have it in here.\n \n",
                route_to = "Ghelsba Outpost",
                destination_highlight = { position = "F-10", offsetX = 16, offsetY = 16 },
                onmob_target = "ghelsba-outpost-hut-door-f10",
                onmob_enemy = "Cyranuce M Cutauleon",
                zone_max_distance = 25,
                visual_zones = {
                    { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = 35.2, y = 0.0, z = 60.7 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = 4.0, y = 0.0, z = 68.2 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = -34.3, y = -0.2, z = 99.8 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = -83.7, y = -10.0, z = 99.8 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = -101.5, y = -10.4, z = 99.1 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = -122.0, y = -10.0, z = 80.3 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = -145.0, y = -10.2, z = 69.4 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = -155.9, y = -10.0, z = 79.3 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                },
                trigger_on_event_id = { 32001 },
                kill_requirement = {
                    count = 1,
                    enemies = { "Cyranuce M Cutauleon" },
                    display_only = true,
                    reset_on_zone_entry = true,
                },
            },
        },
        reward = {
            text = "Unlocks the Dragoon job!\n \n" ..
                   "Title: Heir to the Holy Crest\n" ..
                   "Job gesture: dragoon\n" ..
                   "San d'Oria fame +20\n" ..
                   "You also name your wyvern here - the option you pick in the winning cutscene sets the name.\n \n",
        },
    },
}
