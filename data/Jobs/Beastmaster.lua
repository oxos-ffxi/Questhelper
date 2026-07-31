return {
    -- =========================================================================================
    -- 1) Save My Son
    --
    -- Log 3 (Jeuno) / Quest 5. NOT the unlock - it rewards the Beast Whistle. The job is
    -- unlocked by Path of the Beastmaster below. See data/ref/Jobs/beastmaster_reference.md.
    --
    -- Gated on Chocobo's Wounds, which lives in Quests -> Upper Jeuno because it is worth
    -- doing on its own (chocobo licence). The prerequisites block surfaces it here.
    -- =========================================================================================
    ["1.Beastmaster Quest - Save My Son"] = {
        requirements = {
            level = 30,
        },
        prerequisites = {
            { category = "Quests", subfile = "Upper Jeuno", name = "Chocobo's Wounds" },
        },
        steps = {
            {
                text = "Step 1: Examine the door to the Merchant's House in Lower Jeuno.\n \n" ..
                       "- The dialogue ends in a choice - take the option that accepts.\n",
                onmob_target = "Door: Merchants House",
                route_to = "Lower Jeuno",
                destination_highlight = { position = "G-11", offsetX = 16, offsetY = 16 },
                zone_max_distance = 25,
                visual_zones = {
                        -- Stairs to Merchants House - Lower Jeuno
                        { zone_name = "Lower Jeuno", type = 'arrow', center = { x = -94.6, y = -0.0, z = -173.7 }, size = 3, direction = "ne", floor_id = 0, colour = "yellow" },
                        { zone_name = "Lower Jeuno", type = 'arrow', center = { x = -84.4, y = -6.0, z = -161.1 }, size = 3, direction = "down", floor_id = 0, colour = "yellow" },
                },
                trigger_on_event_id = { 164 },
            },
            {
                text = "Step 2: Examine the Nightflowers on Qufim Island, at night.\n \n" ..
                       "NOTE: The nightflowers only respond between roughly 00:00 and dawn on the Vana'diel clock. In daylight nothing happens as the nightflowers haven't bloomed yet.\n \n",
                route_to = "Qufim Island",
                 destination_highlight = { position = "F-8", offsetX = 16, offsetY = 16 },
                onmob_target = "qufim-island-nightflowers-f8",
                zone_max_distance = 40,
                trigger_on_event_id = { 0, "Qufim Island" },
                visual_zones = {
                        { zone_name = "Qufim Island", type = 'arrow', center = { x = 141.2, y = 11.7, z = -470.5 }, size = 3, direction = "up", floor_id = 0, colour = "magenta" },
                        { zone_name = "Qufim Island", type = 'arrow', center = { x = 147.7, y = 21.4, z = -410.3 }, size = 3, direction = "up", floor_id = 0, colour = "magenta" },
                        { zone_name = "Qufim Island", type = 'arrow', center = { x = 148.3, y = 20.1, z = -374.4 }, size = 3, direction = "up", floor_id = 0, colour = "magenta" },
                        { zone_name = "Qufim Island", type = 'arrow', center = { x = 144.6, y = 21.5, z = -346.9 }, size = 3, direction = "left", floor_id = 0, colour = "magenta" },
                        { zone_name = "Qufim Island", type = 'arrow', center = { x = 101.9, y = 18.7, z = -335.1 }, size = 3, direction = "up", floor_id = 0, colour = "magenta" },
                        { zone_name = "Qufim Island", type = 'arrow', center = { x = 99.9, y = 18.5, z = -283.3 }, size = 3, direction = "up", floor_id = 0, colour = "magenta" },
                        { zone_name = "Qufim Island", type = 'arrow', center = { x = 108.1, y = 18.7, z = -262.4 }, size = 3, direction = "right", floor_id = 0, colour = "magenta" },
                        { zone_name = "Qufim Island", type = 'arrow', center = { x = 150.4, y = 21.0, z = -246.5 }, size = 3, direction = "ne", floor_id = 0, colour = "magenta" },
                        { zone_name = "Qufim Island", type = 'arrow', center = { x = 176.1, y = 20.9, z = -202.8 }, size = 3, direction = "ne", floor_id = 0, colour = "magenta" },
                        { zone_name = "Qufim Island", type = 'arrow', center = { x = 199.7, y = 20.0, z = -162.4 }, size = 3, direction = "ne", floor_id = 0, colour = "magenta" },
                        { zone_name = "Qufim Island", type = 'arrow', center = { x = 219.4, y = 18.5, z = -118.6 }, size = 3, direction = "up", floor_id = 0, colour = "magenta" },
                        { zone_name = "Qufim Island", type = 'arrow', center = { x = 220.6, y = 10.5, z = -81.7 }, size = 3, direction = "up", floor_id = 0, colour = "magenta" },
                        { zone_name = "Qufim Island", type = 'arrow', center = { x = 224.9, y = 6.2, z = -59.8 }, size = 3, direction = "right", floor_id = 0, colour = "magenta" },
                        { zone_name = "Qufim Island", type = 'arrow', center = { x = 260.3, y = -2.0, z = -54.2 }, size = 3, direction = "up", floor_id = 0, colour = "magenta" },
                        { zone_name = "Qufim Island", type = 'arrow', center = { x = 251.5, y = -10.5, z = -20.5 }, size = 3, direction = "left", floor_id = 0, colour = "magenta" },
                        { zone_name = "Qufim Island", type = 'arrow', center = { x = 201.5, y = -21.5, z = -19.6 }, size = 3, direction = "left", floor_id = 0, colour = "magenta" },
                        { zone_name = "Qufim Island", type = 'arrow', center = { x = 152.6, y = -19.9, z = -18.3 }, size = 3, direction = "left", floor_id = 0, colour = "magenta" },
                        { zone_name = "Qufim Island", type = 'arrow', center = { x = 132.8, y = -20.0, z = -12.9 }, size = 3, direction = "nw", floor_id = 0, colour = "magenta" },
                        { zone_name = "Qufim Island", type = 'arrow', center = { x = 117.2, y = -20.1, z = -5.6 }, size = 3, direction = "left", floor_id = 0, colour = "magenta" },
                        { zone_name = "Qufim Island", type = 'arrow', center = { x = 81.7, y = -19.8, z = -8.6 }, size = 3, direction = "left", floor_id = 0, colour = "magenta" },
                        { zone_name = "Qufim Island", type = 'arrow', center = { x = 43.9, y = -19.6, z = -12.2 }, size = 3, direction = "sw", floor_id = 0, colour = "magenta" },
                        { zone_name = "Qufim Island", type = 'arrow', center = { x = 16.2, y = -21.3, z = -21.6 }, size = 3, direction = "left", floor_id = 0, colour = "magenta" },
                        { zone_name = "Qufim Island", type = 'arrow', center = { x = -30.2, y = -20.5, z = -18.4 }, size = 3, direction = "left", floor_id = 0, colour = "magenta" },
                        { zone_name = "Qufim Island", type = 'arrow', center = { x = -58.7, y = -20.1, z = -10.2 }, size = 3, direction = "up", floor_id = 0, colour = "magenta" },
                        { zone_name = "Qufim Island", type = 'arrow', center = { x = -62.3, y = -20.2, z = 16.5 }, size = 3, direction = "left", floor_id = 0, colour = "magenta" },
                        { zone_name = "Qufim Island", type = 'arrow', center = { x = -108.1, y = -20.6, z = 20.6 }, size = 3, direction = "left", floor_id = 0, colour = "magenta" },
                        { zone_name = "Qufim Island", type = 'arrow', center = { x = -142.8, y = -20.0, z = 23.5 }, size = 3, direction = "nw", floor_id = 0, colour = "magenta" },
                        { zone_name = "Qufim Island", type = 'arrow', center = { x = -168.1, y = -19.8, z = 42.0 }, size = 3, direction = "left", floor_id = 0, colour = "magenta" },
                        { zone_name = "Qufim Island", type = 'arrow', center = { x = -226.0, y = -19.4, z = 38.9 }, size = 3, direction = "left", floor_id = 0, colour = "magenta" },
                        { zone_name = "Qufim Island", type = 'arrow', center = { x = -279.4, y = -20.0, z = 36.7 }, size = 3, direction = "left", floor_id = 0, colour = "magenta" },
                        { zone_name = "Qufim Island", type = 'arrow', center = { x = -298.9, y = -20.1, z = 39.6 }, size = 3, direction = "left", floor_id = 0, colour = "magenta" },
                        { zone_name = "Qufim Island", type = 'arrow', center = { x = -306.4, y = -18.4, z = 40.4 }, size = 2, direction = "down", floor_id = 0, colour = "magenta" },
                        { zone_name = "Qufim Island", type = 'arrow', center = { x = -304.9, y = -15.3, z = 30.0 }, size = 2, direction = "down", floor_id = 0, colour = "magenta" },
                        { zone_name = "Qufim Island", type = 'arrow', center = { x = -298.7, y = -10.5, z = 20.2 }, size = 2, direction = "se", floor_id = 0, colour = "magenta" },
                        { zone_name = "Qufim Island", type = 'arrow', center = { x = -286.0, y = -5.7, z = 14.1 }, size = 2, direction = "right", floor_id = 0, colour = "magenta" },
                        { zone_name = "Qufim Island", type = 'arrow', center = { x = -276.3, y = -3.4, z = 14.1 }, size = 2, direction = "right", floor_id = 0, colour = "magenta" },
                        { zone_name = "Qufim Island", type = 'arrow', center = { x = -263.7, y = -3.1, z = 21.1 }, size = 2, direction = "up", floor_id = 0, colour = "magenta" },
                },
            },
            {
                text = "Step 3: Return to the Merchant's House door in Lower Jeuno for the closing cutscene.\n \n",
                onmob_target = "Door: Merchants House",
                route_to = "Lower Jeuno",
                destination_highlight = { position = "G-11", offsetX = 16, offsetY = 16 },
                zone_max_distance = 25,
                visual_zones = {
                        -- Stairs to Merchants House - Lower Jeuno
                        { zone_name = "Lower Jeuno", type = 'arrow', center = { x = -94.6, y = -0.0, z = -173.7 }, size = 3, direction = "ne", floor_id = 0, colour = "yellow" },
                        { zone_name = "Lower Jeuno", type = 'arrow', center = { x = -84.4, y = -6.0, z = -161.1 }, size = 3, direction = "down", floor_id = 0, colour = "yellow" },
                },
                trigger_on_event_id = { 163 },
            },
        },
        reward = {
            text = "Beast Whistle\n \n" ..
                   "2,100 gil\n" ..
                   "Title: Life Saver\n",
        },
    },

    -- =========================================================================================
    -- 2) Path of the Beastmaster (the actual unlock)
    --
    -- Log 3 (Jeuno) / Quest 19. One conversation - unlockJob(xi.job.BST) sits in the
    -- onEventFinish for event 70.
    -- =========================================================================================
    ["2.Beastmaster Quest - Path of the Beastmaster"] = {
        requirements = {
            level = 30,
        },
        prerequisites = {
            { category = "Jobs", subfile = "Beastmaster", name = "1.Beastmaster Quest - Save My Son" },
        },
        steps = {
            {
                text = "Step 1: Talk to Brutus at the Chocobo Stables in Upper Jeuno to unlock Beastmaster.\n \n" ..
                       "- That is the whole quest. One conversation, no items, no travel.\n" ..
                       "- Same Brutus who ran 'Chocobo's Wounds'. If he only wants to talk about chocobos, one of the two prerequisites has not registered as complete yet.\n \n",
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
                trigger_on_event_id = { 70 },
            },
        },
        reward = {
            text = "Unlocks the Beastmaster job!\n \n" ..
                   "Title: Animal Trainer\n" ..
                   "Job gesture: beastmaster\n" ..
                   "+7 fame with San d'Oria, Bastok AND Windurst\n \n",
        },
    },
}
