return {
    -- =========================================================================================
    -- Chocobo's Wounds
    --
    -- Log 3 (Jeuno) / Quest 4. The chocobo-riding licence quest, and the gateway to the whole
    -- Beastmaster line: Chocobo's Wounds -> Save My Son -> Path of the Beastmaster.
    -- =========================================================================================
    ["Chocobo's Wounds"] = {
        requirements = {
            level = 20,
        },
        steps = {
            {
                text = "Step 1: Talk to Brutus at the Chocobo Stables in Upper Jeuno and agree to look after the injured chocobo.\n \n" ..
                       "- His dialogue ends in a choice - pick the option that accepts, or nothing starts.\n" ..
                       "- Osker, the stablehand beside him, reads the bird's condition back to you at every stage. Optional, but it is the in-game way to check progress.\n \n",
                onmob_target = "Brutus",
                route_to = "Upper Jeuno",
                destination_highlight = { position = "G-7", offsetX = 16, offsetY = 16},
                zone_max_distance = 30,
                visual_zones = {
                    -- To Chocobo Stables in Upper Jeuno
                    { zone_name = "Upper Jeuno", type = 'arrow', center = { x = -58.9, y = 0.0, z = 75.3 }, size = 3, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Upper Jeuno", type = 'arrow', center = { x = -39.3, y = 8.0, z = 89.9 }, size = 3, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Upper Jeuno", type = 'arrow', center = { x = -45.2, y = 8.0, z = 95.6 }, size = 3, direction = "left", floor_id = 0, colour = "yellow" },
                },
                trigger_on_event_id = { 71 },
            },
            {
                text = "Step 2: Get 4 Gausebit Wildgrass.\n \n" ..
                       "- Auction House: [Weapons > Ammo & Misc. > Pet Items]. Cheap, and they stack - buying beats farming almost every time.\n" ..
                       "- Or farm Crane Fly (Lv18-21) around the outpost in Meriphataud Mountains (E-5). Best drop rate by a wide margin.\n",
                route_to = "Meriphataud Mountains",
                destination_highlight = { position = "E-5", offsetX = 16, offsetY = 16 },
                onmob_enemy = "Crane Fly",
                zone_max_distance = 40,
                items_needed = {
                    { item = "Gausebit Wildgrass", quantity = 4 }
                },
                -- Inventory check is a timed, case-insensitive substring match, so it catches AH
                trigger_on_item_obtain = {
                    { item = "Gausebit Wildgrass", quantity = 4 },
                },
            },
            {
                text = "Step 3: Feed the wounded chocobo the Gausebit Wildgrass until it recovers.\n \n" ..
                       "- SIX trades in total, but only four clumps are actually eaten. The first two feeds hand the grass back, so four is all you need to buy.\n" ..
                       "- Trade ONE at a time. A stack does nothing; the server checks for exactly one item in the window.\n" ..
                       "- The last trade fires the cutscene and hands over the Chocobo License.\n \n" ..
                       "NOTE: There is a 45 second cooldown between feeds. Trading again too early is silently ignored, which reads exactly like the quest being broken - wait it out.\n \n",
                onmob_target = "Chocobo",
                route_to = "Upper Jeuno",
                destination_highlight = { position = "G-7", offsetX = 16, offsetY = 16},
                zone_max_distance = 30,
                visual_zones = {
                    -- To Chocobo Stables in Upper Jeuno
                    { zone_name = "Upper Jeuno", type = 'arrow', center = { x = -58.9, y = 0.0, z = 75.3 }, size = 3, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Upper Jeuno", type = 'arrow', center = { x = -39.3, y = 8.0, z = 89.9 }, size = 3, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Upper Jeuno", type = 'arrow', center = { x = -45.2, y = 8.0, z = 95.6 }, size = 3, direction = "left", floor_id = 0, colour = "yellow" },
                },
                trigger_on_keyitem_obtain = { 138 },
                keyitems_needed = { 138 },
            },
        },
        reward = {
            text = "Key Item: Chocobo License - you can now ride chocobos.\n \n" ..
                   "Title: Chocobo Trainer\n",
        },
    },
}
