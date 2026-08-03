return {
    -- =========================================================================================
    -- 1) A Squire's Test
    -- =========================================================================================
    ["1.Paladin Quest - A Squire's Test"] = {
        steps = {
            {
                text = "Step 1: Speak with Balasiel in Southern San d'Oria (F-7) and accept the quest.\n \n" ..
                       "- He is awkward to find. From Watchdog Alley (F-6) by Celyddon: west into the stairwell,\n",
                route_to = "Southern San d'Oria",
                destination_highlight = { position = "F-7", offsetX = 16, offsetY = 16 },
                onmob_target = "Balasiel",
                -- 616 first time, 631 once you have declined him before
                trigger_on_event_id = { 616, 631 },
                zone_max_distance = 15,
                visual_zones = {
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -86.1, y = 2.0, z = 5.5 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -105.5, y = -2.0, z = 28.3 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -91.7, y = -4.0, z = 48.8 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -91.4, y = -6.0, z = 71.8 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -104.8, y = -6.0, z = 88.5 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -133.4, y = -6.0, z = 89.6 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -151.7, y = -6.0, z = 89.5 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -151.5, y = -8.8, z = 77.9 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -133.0, y = -12.8, z = 78.0 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -124.9, y = -10.8, z = 68.0 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -131.4, y = -10.8, z = 58.5 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                },
            },
            {
                text = "Step 2: Get a Revival Tree Root.\n \n" ..
                       "- Auction House: [Materials > Alchemy]. Quickest option whenever one is listed.\n" ..
                       "NOTE: Some enemies spawn between 20:00 and 4:00 Vana'diel time - outside that window there is nothing there to kill.\n \n",
                route_choices_label = "Farm at (click one):",
                route_choices = {
                    {
                        group = "King Ranperre's Tomb - Spook, where Balasiel sends you",
                        zones = {
                            {
                                zone = "King Ranperre's Tomb",
                                destination_highlight = { position = "I-10", offsetX = 16, offsetY = 16},
                                -- Scoped to this choice, so none of it draws while you are
                                -- crossing East Ronfaure on the way to Gusgen. Same walked
                                -- route as SanDoria mission 2-3 step 2.
                                zone_max_distance = 15,
                                default = true,
                                visual_zones = {
                                    { zone_name = "East Ronfaure", type = 'arrow', center = { x = 212.8, y = 2.5, z = -491.0 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                                    { zone_name = "East Ronfaure", type = 'arrow', center = { x = 200.2, y = 0.3, z = -533.8 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },

                                    -- Survival Guide
                                    { zone_name = "King Ranperre's Tomb", type = 'square', center = { x = -119.0, y = 0.0, z = 248.5 }, size = 1, floor_id = 1, colour = "green" },

                                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -140.9, y = -0.1, z = 247.9 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -139.0, y = 0.0, z = 222.3 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -164.2, y = -0.1, z = 218.8 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -158.1, y = 0.0, z = 185.6 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -139.9, y = -1.0, z = 207.1 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -139.9, y = 7.5, z = 161.7 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -140.0, y = 7.5, z = 140.8 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -181.4, y = 6.7, z = 90.9 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -182.9, y = 7.2, z = 60.8 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -242.9, y = 8.8, z = 60.7 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -248.5, y = 7.4, z = 21.3 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -173.0, y = 6.7, z = 18.8 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -121.1, y = 8.8, z = 17.5 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -100.1, y = 8.5, z = 8.6 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -101.4, y = 4.5, z = -26.2 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -115.9, y = 3.0, z = -28.6 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },

                                    -- To the tombstone at (I-10)
                                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -116.1, y = 0.0, z = -63.2 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -114.5, y = 0.0, z = -134.6 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -70.3, y = -0.0, z = -134.1 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -38.3, y = 0.0, z = -127.8 }, size = 4, direction = "se", floor_id = 1, colour = "yellow" },
                                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -19.9, y = -0.0, z = -135.1 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 21.1, y = -0.0, z = -134.6 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 18.3, y = 0.0, z = -124.0 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -23.7, y = -0.0, z = -121.5 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -22.7, y = 0.0, z = -74.7 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 0.6, y = 0.0, z = -74.8 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                                },
                            },
                        },
                    },
                    {
                        group = "Gusgen Mines - best rate, longer trip",
                        zones = {
                            {
                                zone = "Gusgen Mines",
                                destination_highlight = {
                                    { position = "H-7", offsetX = 16, offsetY = 16, floor_id = 1 },
                                },
                            },
                        },
                    },
                    {
                        group = "Ronfaure - closest, night only",
                        -- East has no known camp spot, so it routes with no pin rather than
                        -- borrowing West's.
                        zones = {
                            { zone = "West Ronfaure", destination_highlight = { position = "H-9", offsetX = 16, offsetY = 16 } },
                            "East Ronfaure",
                        },
                    },
                },
                onmob_enemy = { "Bandersnatch", "Bogy", "Tainted Hound", "Spook" },
                onmob_enemy_colour = "red",
                items_needed = { "Revival Tree Root" },
                trigger_on_item_obtain = { "Revival Tree Root" },
            },
            {
                text = "Step 3: Trade the Revival Tree Root to Balasiel (F-7) to complete the quest.\n \n" ..
                       "- You do not need to zone after accepting - trade it straight away.\n \n",
                onmob_target = "Balasiel",
                route_to = "Southern San d'Oria",
                destination_highlight = { position = "F-7", offsetX = 16, offsetY = 16 },
                zone_max_distance = 15,
                visual_zones = {
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -86.1, y = 2.0, z = 5.5 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -105.5, y = -2.0, z = 28.3 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -91.7, y = -4.0, z = 48.8 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -91.4, y = -6.0, z = 71.8 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -104.8, y = -6.0, z = 88.5 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -133.4, y = -6.0, z = 89.6 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -151.7, y = -6.0, z = 89.5 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -151.5, y = -8.8, z = 77.9 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -133.0, y = -12.8, z = 78.0 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -124.9, y = -10.8, z = 68.0 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -131.4, y = -10.8, z = 58.5 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                },
                trigger_on_event_id = { 617 },
            },
        },
        reward = {
            text = "Title: Knight in Training\n" ..
                   "Opens A Squire's Test II.\n \n",
            items = {
                {
                    name  = "Spatha",
                    type  = "Sword",
                    races = "All Races",
                },
            },
        },
    },

    -- =========================================================================================
    -- 2) A Squire's Test II
    -- =========================================================================================
    ["2.Paladin Quest - A Squire's Test II"] = {
        requirements = {
            level = 10,
        },
        prerequisites = {
            { category = "Jobs", subfile = "Paladin", name = "1.Paladin Quest - A Squire's Test" },
        },
        steps = {
            {
                text = "Step 1: Return to Balasiel in Southern San d'Oria (F-7) at Lv10 or above to start the second test.\n \n" ..
                       "- Bring Sneak and Invisible for Ordelle's Caves, and a warp or teleport item to save the\n" ..
                       "  run back once you have the dew.\n" ..
                       "- (Optional: talk to Chanpau at (E-7) here first, which unlocks extra dialogue from Morjean\n" ..
                       "  at (L-7) in Northern San d'Oria. Neither is needed to finish.)\n \n",
                route_to = "Southern San d'Oria",
                destination_highlight = { position = "F-7", offsetX = 16, offsetY = 16 },
                onmob_target = "Balasiel",
                trigger_on_event_id = { 625 },
                zone_max_distance = 15,
                visual_zones = {
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -86.1, y = 2.0, z = 5.5 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -105.5, y = -2.0, z = 28.3 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -91.7, y = -4.0, z = 48.8 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -91.4, y = -6.0, z = 71.8 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -104.8, y = -6.0, z = 88.5 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -133.4, y = -6.0, z = 89.6 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -151.7, y = -6.0, z = 89.5 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -151.5, y = -8.8, z = 77.9 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -133.0, y = -12.8, z = 78.0 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -124.9, y = -10.8, z = 68.0 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -131.4, y = -10.8, z = 58.5 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                },
            },
            {
                text = "Step 2: Travel to La Theine Plateau (F-6), drop into the ravine near Equesobillot and enter Ordelle's Caves.\n \n",
                route_to = "La Theine Plateau",
                destination_highlight = { position = "F-7", offsetX = 16, offsetY = 16 },
                zone_trigger = "Ordelle's Caves",
                zone_max_distance = 35,
                visual_zones = {
                    -- Zone-in from West Ronfaure, east then north around the top of the canyon
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -477.3, y = -7.1, z = 221.6 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -454.5, y = -0.6, z = 221.3 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -435.9, y = 6.4, z = 221.4 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -404.1, y = 8.5, z = 221.7 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -400.4, y = 8.6, z = 254.1 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -396.4, y = 8.0, z = 277.2 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -387.9, y = 10.0, z = 305.9 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -357.9, y = 8.4, z = 332.5 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -324.8, y = 8.1, z = 365.8 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -284.6, y = 8.4, z = 393.1 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -280.3, y = 8.2, z = 351.7 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -280.2, y = 8.0, z = 318.1 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -280.3, y = 8.7, z = 294.7 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },

                    -- Down the ramp into the ravine (Equesobillot is at the top of it)
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -290.7, y = 12.0, z = 294.0 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -294.1, y = 17.0, z = 314.8 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -291.5, y = 23.4, z = 342.1 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -306.0, y = 28.9, z = 336.6 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -311.0, y = 31.7, z = 312.1 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -322.2, y = 38.8, z = 284.0 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },

                    -- Along the ravine floor south-east to the cave mouth at (F-7)
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -347.7, y = 37.8, z = 259.4 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -360.8, y = 38.8, z = 235.0 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -357.5, y = 38.8, z = 205.1 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -335.2, y = 37.5, z = 181.1 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -315.9, y = 38.4, z = 154.2 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -289.0, y = 27.3, z = 141.2 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -275.8, y = 24.1, z = 142.1 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -261.7, y = 23.9, z = 117.7 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                },
            },
            {
                text = "Step 3: In Ordelle's Caves travel to the holding two ??? points.\n \n" ..
                       "- Click the ??? in the pool of water first, then the second ??? about 45 yalms away, for\n" ..
                       "  the Key Item: Stalactite Dew.\n" ..
                       "- Aggro: Shriekers, bats and jellies are sound. Will-o'-the-Wisp near the water is sight\n" ..
                       "  and magic.\n \n" ..
                       "CRITICAL: You have 30 seconds between the two. Miss it and the dew slips through your fingers - re-click the pool and run it again, as many times as you like.\n \n",
                onmob_target = { "ordelles-caves-stalactite-pool-qm2", "ordelles-caves-stalactite-dew-qm3" },
                keyitems_needed = { 141 },
                trigger_on_keyitem_obtain = {141},
                zone_max_distance = 25,
                visual_zones = {
                        -- Stalactite Dew
                        { zone_name = "Ordelle's Caves", type = 'square', center = { x = -104.0, y = 0.5, z = 633.0 }, size = 1, floor_id = 1, colour = "green" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -100.4, y = 0.4, z = 632.3 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -101.5, y = -0.0, z = 613.0 }, size = 3, direction = "sw", floor_id = 1, colour = "yellow" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -127.7, y = 0.7, z = 593.1 }, size = 3, direction = "sw", floor_id = 1, colour = "yellow" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -146.9, y = 0.5, z = 580.9 }, size = 3, direction = "left", floor_id = 1, colour = "yellow" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -195.1, y = 0.6, z = 579.1 }, size = 3, direction = "left", floor_id = 1, colour = "yellow" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -219.9, y = 0.9, z = 577.0 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -216.7, y = 0.4, z = 537.9 }, size = 3, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -178.2, y = 0.4, z = 534.1 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -175.6, y = 0.8, z = 499.9 }, size = 3, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -118.5, y = 0.5, z = 499.1 }, size = 3, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -99.8, y = 0.5, z = 485.2 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -94.9, y = 0.6, z = 459.8 }, size = 3, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -47.7, y = 0.3, z = 460.8 }, size = 3, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -22.3, y = 0.9, z = 460.9 }, size = 3, direction = "up", floor_id = 1, colour = "yellow" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -20.5, y = 0.7, z = 501.5 }, size = 3, direction = "up", floor_id = 1, colour = "yellow" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -24.0, y = 0.8, z = 540.2 }, size = 3, direction = "left", floor_id = 1, colour = "yellow" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -71.4, y = 0.7, z = 539.9 }, size = 3, direction = "left", floor_id = 1, colour = "yellow" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -98.4, y = 4.6, z = 535.2 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -94.5, y = 12.1, z = 502.3 }, size = 3, direction = "right", floor_id = 15, colour = "yellow" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -60.2, y = 19.1, z = 490.2 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -67.0, y = 22.6, z = 461.2 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -98.2, y = 28.6, z = 454.3 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -94.9, y = 32.1, z = 421.1 }, size = 3, direction = "right", floor_id = 15, colour = "yellow" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -38.6, y = 32.5, z = 420.7 }, size = 3, direction = "right", floor_id = 15, colour = "yellow" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -21.0, y = 32.1, z = 426.1 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -7.5, y = 32.5, z = 460.9 }, size = 3, direction = "right", floor_id = 15, colour = "yellow" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = 26.5, y = 32.5, z = 453.7 }, size = 3, direction = "se", floor_id = 15, colour = "yellow" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = 36.2, y = 33.0, z = 435.2 }, size = 3, direction = "sw", floor_id = 15, colour = "yellow" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = 20.9, y = 32.5, z = 414.1 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = 12.6, y = 29.1, z = 380.9 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -31.1, y = 25.2, z = 379.5 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -60.0, y = 18.5, z = 372.4 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -68.1, y = 10.4, z = 340.6 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -93.5, y = 4.7, z = 338.9 }, size = 3, direction = "sw", floor_id = 1, colour = "yellow" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -100.6, y = 0.5, z = 319.5 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -98.9, y = 0.1, z = 295.8 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                },
                images = {
                    {
                        zone_name = "Ordelle's Caves",
                        floor_id  = 1,
                        width     = 512,
                        height    = 512,
                        state     = 3,
                        highlights = {
                            { position = "G-4", offsetX = 16, offsetY = 16, label = "1" },
                            { position = "G-7", offsetX = 16, offsetY = 16, label = "1" },
                        },
                    },
                    -- Map 2's raw floor id is unconfirmed - see data/ref/Jobs/paladin_reference.md.
                    {
                        zone_name = "Ordelle's Caves",
                        floor_id  = 15,
                        width     = 512,
                        height    = 512,
                        state     = 3,
                        highlights = {
                            { position = "G-6", offsetX = 16, offsetY = 16, label = "2" },
                        },
                    },
                },
            },
            {
                text = "Step 4: Take the Stalactite Dew back to Balasiel in Southern San d'Oria (F-7).\n \n" ..
                       "- A Knight's Test starts from the same NPC, so stay put if you are already Lv30.\n \n",
                route_to = "Southern San d'Oria",
                destination_highlight = { position = "F-7", offsetX = 16, offsetY = 16 },
                onmob_target = "Balasiel",
                trigger_on_event_id = { 626 },
                zone_max_distance = 15,
                visual_zones = {
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -86.1, y = 2.0, z = 5.5 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -105.5, y = -2.0, z = 28.3 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -91.7, y = -4.0, z = 48.8 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -91.4, y = -6.0, z = 71.8 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -104.8, y = -6.0, z = 88.5 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -133.4, y = -6.0, z = 89.6 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -151.7, y = -6.0, z = 89.5 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -151.5, y = -8.8, z = 77.9 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -133.0, y = -12.8, z = 78.0 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -124.9, y = -10.8, z = 68.0 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -131.4, y = -10.8, z = 58.5 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                },
            },
        },
        reward = {
            text = "Key Item: Squire's Certificate\n \n" ..
                   "Title: Spelunker\n",
        },
    },

    -- =========================================================================================
    -- 3) A Knight's Test
    -- =========================================================================================
    ["3.Paladin Quest - A Knight's Test"] = {
        requirements = {
            level = 30,
        },
        prerequisites = {
            { category = "Jobs", subfile = "Paladin", name = "2.Paladin Quest - A Squire's Test II" },
        },
        steps = {
            {
                text = "Step 1: Speak with Balasiel in Southern San d'Oria (F-7) for the Key Item: Book of Tasks.\n \n",
                route_to = "Southern San d'Oria",
                destination_highlight = { position = "F-7", offsetX = 16, offsetY = 16 },
                onmob_target = "Balasiel",
                -- 627 first time, 635 once you have declined him before, 670 the under-level
                -- brush-off. Both accept ids branch on the dialogue option and trigger_on_event_id
                -- cannot see the option, so this waits on the key item instead - declining does
                -- not tick the step.
                keyitems_needed = { 143 },
                trigger_on_keyitem_obtain = { 143 },
                zone_max_distance = 15,
                visual_zones = {
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -86.1, y = 2.0, z = 5.5 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -105.5, y = -2.0, z = 28.3 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -91.7, y = -4.0, z = 48.8 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -91.4, y = -6.0, z = 71.8 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -104.8, y = -6.0, z = 88.5 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -133.4, y = -6.0, z = 89.6 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -151.7, y = -6.0, z = 89.5 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -151.5, y = -8.8, z = 77.9 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -133.0, y = -12.8, z = 78.0 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -124.9, y = -10.8, z = 68.0 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -131.4, y = -10.8, z = 58.5 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                },
            },
            {
                text = "Step 2: Talk to Baunise on the Westgate parapet (H-9) for the Key Item: Book of the West.\n \n",
                route_to = "Southern San d'Oria",
                destination_highlight = { position = "H-9", offsetX = 16, offsetY = 16},
                onmob_target = "Baunise",
                zone_max_distance = 20,
                visual_zones = {
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -133.9, y = -10.8, z = 62.1 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -127.7, y = -12.8, z = 78.3 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -152.3, y = -8.8, z = 77.3 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -148.4, y = -6.0, z = 90.0 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -130.8, y = -6.0, z = 87.6 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -107.2, y = -6.0, z = 85.8 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -92.6, y = -6.0, z = 71.6 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -93.9, y = -4.0, z = 42.9 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -110.2, y = -2.0, z = 12.9 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -92.7, y = -6.2, z = -9.1 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -62.4, y = -6.6, z = -37.3 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                },
                -- 634. Once you hold it he switches to a DO_NOT_FRET message with no cutscene.
                keyitems_needed = { 145 },
                trigger_on_keyitem_obtain = { 145 },
            },
            {
                text = "Step 3: Talk to Cahaurme on the Eastgate parapet (J-9) for the Key Item: Book of the East.\n \n" ..
                       "- Same again on the other gate: up the stairs onto the wall.\n \n",
                route_to = "Southern San d'Oria",
                destination_highlight = { position = "J-9", offsetX = 16, offsetY = 16 },
                onmob_target = "Cahaurme",
                zone_max_distance = 20,
                visual_zones = {
                        { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -56.3, y = -8.6, z = -33.9 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -68.3, y = -6.2, z = -33.0 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -90.3, y = -6.2, z = -11.9 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -109.9, y = -2.2, z = 5.1 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -101.9, y = -2.0, z = 17.1 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                        { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -77.3, y = 2.0, z = -5.5 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                        { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -53.3, y = 2.0, z = -21.2 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                        { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -21.3, y = 2.0, z = -21.4 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                        { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = 5.1, y = 2.0, z = -21.6 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                        { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = 40.8, y = 2.0, z = -22.7 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                        { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = 72.7, y = 2.0, z = -13.1 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                        { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = 87.6, y = 2.0, z = 4.4 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                        { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = 102.1, y = 4.0, z = 14.1 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                        { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = 132.6, y = 0.0, z = 13.0 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = 129.6, y = 0.0, z = 3.2 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = 103.8, y = -3.0, z = 2.3 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = 82.9, y = -7.4, z = -18.3 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = 63.2, y = -6.6, z = -37.5 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                },
                -- 633. Once you hold it he switches to a TRIAL_IS_DIFFICULT message.
                keyitems_needed = { 144 },
                trigger_on_keyitem_obtain = { 144 },
            },
            {
                text = "Step 4: In Davoi, examine the Disused Well at (E-10) for the Key Item: Knight's Soul.\n \n" ..
                       "- Route: drop into the water at the broken bridge (I-8), follow it west to (D-8), climb\n" ..
                       "  out at (D-9) and cross the camp south to (E-10).\n \n" ..
                       "WARNING: Orcs in Davoi aggro and hit hard at this level. Bring Sneak and Invisible both.\n \n" ..
                       "NOTE: The well does nothing at all until you hold both books - no message, no cutscene.\n \n",
                route_to = "Davoi",
                destination_highlight = { position = "E-10", offsetX = 16, offsetY = 16 },
                onmob_target = "davoi-disused-well-e10",
                zone_max_distance = 20,
                visual_zones = {
                        { zone_name = "Davoi", type = 'square', center = { x = 223.0, y = -0.4, z = -10.0 }, size = 1, floor_id = 0, colour = "green" },
                        { zone_name = "Davoi", type = 'arrow', center = { x = 216.6, y = -0.4, z = -9.9 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Davoi", type = 'arrow', center = { x = 218.7, y = 2.7, z = -59.7 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Davoi", type = 'arrow', center = { x = 218.1, y = 3.9, z = -74.9 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Davoi", type = 'arrow', center = { x = 164.4, y = 4.0, z = -80.1 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Davoi", type = 'arrow', center = { x = 148.1, y = 3.8, z = -99.2 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Davoi", type = 'arrow', center = { x = 100.2, y = -2.6, z = -102.2 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Davoi", type = 'line', start = { x = 100.2, y = -2.6, z = -102.2 }, stop = { x = 92.9, y = 3.6, z = -104.8 }, floor_id = 0, colour = "yellow" },
                        { zone_name = "Davoi", type = 'arrow', center = { x = 90.1, y = 3.9, z = -106.5 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Davoi", type = 'arrow', center = { x = 64.0, y = 3.8, z = -95.5 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Davoi", type = 'arrow', center = { x = 54.1, y = 2.2, z = -108.3 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Davoi", type = 'arrow', center = { x = 36.7, y = 2.6, z = -108.0 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Davoi", type = 'arrow', center = { x = 17.9, y = 3.9, z = -140.9 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Davoi", type = 'arrow', center = { x = -30.5, y = 3.6, z = -139.8 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Davoi", type = 'arrow', center = { x = -82.3, y = 3.8, z = -137.3 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Davoi", type = 'arrow', center = { x = -126.2, y = 3.7, z = -135.7 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Davoi", type = 'arrow', center = { x = -168.4, y = 3.9, z = -135.4 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Davoi", type = 'arrow', center = { x = -205.5, y = 3.8, z = -139.1 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Davoi", type = 'arrow', center = { x = -224.3, y = 3.4, z = -148.8 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Davoi", type = 'arrow', center = { x = -257.9, y = 3.8, z = -135.1 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Davoi", type = 'arrow', center = { x = -260.9, y = 0.2, z = -155.9 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Davoi", type = 'arrow', center = { x = -257.8, y = 3.6, z = -187.8 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                        { zone_name = "Davoi", type = 'arrow', center = { x = -233.9, y = 3.8, z = -207.4 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                        { zone_name = "Davoi", type = 'arrow', center = { x = -219.1, y = 2.2, z = -226.5 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Davoi", type = 'arrow', center = { x = -219.1, y = -0.8, z = -268.7 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                },
                keyitems_needed = { 146 },
                trigger_on_keyitem_obtain = { 146 },
            },
            {
                text = "Step 5: Return to Balasiel in Southern San d'Oria (F-7) with the Knight's Soul to unlock Paladin.\n \n" ..
                       "- All four key items are taken off you here.\n" ..
                       "- Sharpening the Sword is next, but it will not start until Father and Son is done.\n \n",
                route_to = "Southern San d'Oria",
                destination_highlight = { position = "F-7", offsetX = 16, offsetY = 16 },
                onmob_target = "Balasiel",
                -- 628 hands in. 669 is the "still looking?" line when you turn up without the soul.
                trigger_on_event_id = { 628 },
                zone_max_distance = 15,
                visual_zones = {
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -86.1, y = 2.0, z = 5.5 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -105.5, y = -2.0, z = 28.3 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -91.7, y = -4.0, z = 48.8 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -91.4, y = -6.0, z = 71.8 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -104.8, y = -6.0, z = 88.5 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -133.4, y = -6.0, z = 89.6 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -151.7, y = -6.0, z = 89.5 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -151.5, y = -8.8, z = 77.9 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -133.0, y = -12.8, z = 78.0 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -124.9, y = -10.8, z = 68.0 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Southern San d'Oria", type = 'arrow', center = { x = -131.4, y = -10.8, z = 58.5 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                },
            },
        },
        reward = {
            text = "Unlocks the Paladin job!\n \n" ..
                   "Title: Tried and Tested Knight\n" ..
                   "Job gesture: paladin\n",
            items = {
                {
                    name  = "Kite Shield",
                    type  = "Shield",
                    races = "All Races",
                },
            },
        },
    },

    -- =========================================================================================
    -- 4) Father and Son
    --
    -- Not a Paladin-only quest, but Sharpening the Sword will not start until the fishing rod
    -- has been handed back, so it belongs in this chain.
    -- =========================================================================================
    ["4.Paladin Quest - Father and Son"] = {
        steps = {
            {
                text = "Step 1: Talk to Ailbeche by the fountain in Northern San d'Oria (J-9).\n \n" ..
                       "- He is the boy crying about his lost father, who he says wears armour but no helmet.\n \n",
                route_to = "Northern San d'Oria",
                destination_highlight = { position = "J-9", offsetX = 16, offsetY = 16 },
            },
            {
                text = "Step 2: Speak with Exoroche inside Helbort's Blades in Southern San d'Oria (K-7).\n \n" ..
                       "- He is the father.\n \n",
                route_to = "Southern San d'Oria",
                destination_highlight = { position = "K-7", offsetX = 16, offsetY = 16 },
            },
            {
                text = "Step 3: Return to Ailbeche in Northern San d'Oria (J-9).\n \n" ..
                       "- Exoroche turns up, scolds him, and hands you the boy's Willow Fishing Rod. This is the\n" ..
                       "  end of the quest proper.\n \n",
                route_to = "Northern San d'Oria",
                destination_highlight = { position = "J-9", offsetX = 16, offsetY = 16 },
            },
            {
                text = "Step 4: Trade the Willow Fishing Rod back to Ailbeche (J-9).\n \n" ..
                       "- There is no reward for handing it back.\n \n" ..
                       "CRITICAL: Sharpening the Sword will not start until the rod is returned. Most write-ups call this step optional - for the Paladin chain it is not.\n \n",
                route_to = "Northern San d'Oria",
                destination_highlight = { position = "J-9", offsetX = 16, offsetY = 16 },
            },
        },
        reward = {
            text = "Willow Fishing Rod (hand it back in step 4).\n \n" ..
                   "Opens Sharpening the Sword.\n \n",
        },
    },

    -- =========================================================================================
    -- 5) Sharpening the Sword
    -- =========================================================================================
    ["5.Paladin Quest - Sharpening the Sword"] = {
        prerequisites = {
            { category = "Jobs", subfile = "Paladin", name = "4.Paladin Quest - Father and Son" },
        },
        steps = {
            {
                text = "Step 1: Speak with Ailbeche in Northern San d'Oria (J-9), who asks for the Key Item: Ordelle Whetstone.\n \n" ..
                       "- Then speak with Sobane in Southern San d'Oria (D-6). If you get the cutscene for Signed\n" ..
                       "  in Blood or Tea with a Tonberry instead, just talk to him again.\n \n",
                onmob_target = "Sobane",
                route_to = "Northern San d'Oria",
                destination_highlight = { position = "J-9", offsetX = 16, offsetY = 16 },
            },
            {
                text = "Step 2: Enter Ordelle's Caves from La Theine Plateau (F-7) and find the Stalagmite on Map 1.\n \n" ..
                       "- Reported around (I-5), with (H-9) and (G-6) on the way - all three are marked.\n" ..
                       "- Clicking the Stalagmite spawns Polevik, an Earth Elemental.\n" ..
                       "- (There are Survival Guides at West Ronfaure and at the cave entrance.)\n \n",
                images = {
                    {
                        zone_name = "Ordelle's Caves",
                        floor_id  = 1,
                        width     = 512,
                        height    = 512,
                        state     = 2,
                        highlights = {
                            { position = "I-5", offsetX = 16, offsetY = 16, label = "1" },
                            { position = "H-9", offsetX = 16, offsetY = 16, label = "2" },
                            { position = "G-6", offsetX = 16, offsetY = 16, label = "3" },
                        },
                    },
                },
            },
            {
                text = "Step 3: Kill Polevik, then click the Stalagmite again for the Key Item: Ordelle Whetstone.\n \n" ..
                       "- Polevik is an elemental - Lv65+ or Trusts is the sensible bar for soloing it.\n \n",
                onmob_enemy = "Polevik",
                kill_requirement = {
                    count = 1,
                    enemies = { "Polevik" },
                    zone = "Ordelle's Caves",
                    count_party_kills = true,
                    display_only = true,
                },
            },
            {
                text = "Step 4: Take the Ordelle Whetstone back to Ailbeche in Northern San d'Oria (J-9).\n \n",
                route_to = "Northern San d'Oria",
                destination_highlight = { position = "J-9", offsetX = 16, offsetY = 16 },
            },
        },
        reward = {
            text = "Completes Sharpening the Sword.\n \n" ..
                   "Opens A Boy's Dream.\n \n",
        },
    },

    -- =========================================================================================
    -- 6) A Boy's Dream
    -- =========================================================================================
    ["6.Paladin Quest - A Boy's Dream"] = {
        requirements = {
            level = 50,
        },
        prerequisites = {
            { category = "Jobs", subfile = "Paladin", name = "5.Paladin Quest - Sharpening the Sword" },
        },
        steps = {
            {
                text = "Step 1: As a Lv50+ Paladin, speak with Ailbeche in Northern San d'Oria (J-9), then Exoroche in Helbort's Blades, Southern San d'Oria (K-7).\n \n" ..
                       "- Ailbeche asks for a Giant Shell Bug; Exoroche fills in what it is for.\n \n",
                route_to = "Northern San d'Oria",
                destination_highlight = { position = "J-9", offsetX = 16, offsetY = 16 },
            },
            {
                text = "Step 2: Get a Giant Shell Bug in Crawlers' Nest.\n \n" ..
                       "- From the entrance on Map 1 (H-8), take exit A down to Map 2.\n" ..
                       "- Check the ??? in the alcove at (H-9) to spawn Dreadbug, which drops 1-4 of them.\n" ..
                       "- They turn up on the Auction House too, but not reliably.\n \n",
                images = {
                    -- Map 1 is raw floor 15 for this zone (data/floor_mappings.lua [197]).
                    {
                        zone_name = "Crawlers' Nest",
                        floor_id  = 15,
                        width     = 512,
                        height    = 512,
                        state     = 2,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16, label = "In" },
                        },
                    },
                    -- Map 2's raw floor id is unconfirmed - see data/ref/Jobs/paladin_reference.md.
                    {
                        zone_name = "Crawlers' Nest",
                        width     = 512,
                        height    = 512,
                        state     = 2,
                        highlights = {
                            { position = "H-9", offsetX = 16, offsetY = 16, label = "???" },
                        },
                    },
                },
                onmob_enemy = "Dreadbug",
                items_needed = { "Giant Shell Bug" },
                skip_if_have = { item = "giant shell bug", quantity = 1 },
                trigger_on_item_obtain = { "giant shell bug", "Giant Shell Bug" },
            },
            {
                text = "Step 3: Fish up Odontotyrannus in Castle Oztroja, at the pond around (H-9) on Map 3.\n \n" ..
                       "- Route in: Map 1 (J-8), Map 2 (F-9), then Map 3.\n" ..
                       "- Use a Giant Shell Bug as bait and bring a rod. It fights you the moment it bites.\n" ..
                       "- Monster fishing is its own minigame - read up or bring help if you have not done it.\n \n",
                images = {
                    {
                        zone_name = "Castle Oztroja",
                        floor_id  = 1,
                        width     = 512,
                        height    = 512,
                        state     = 3,
                        highlights = {
                            { position = "J-8", offsetX = 16, offsetY = 16, label = "1" },
                        },
                    },
                    {
                        zone_name = "Castle Oztroja",
                        floor_id  = 2,
                        width     = 512,
                        height    = 512,
                        state     = 3,
                        highlights = {
                            { position = "F-9", offsetX = 16, offsetY = 16, label = "2" },
                        },
                    },
                    {
                        zone_name = "Castle Oztroja",
                        floor_id  = 3,
                        width     = 512,
                        height    = 512,
                        state     = 3,
                        highlights = {
                            { position = "H-9", offsetX = 16, offsetY = 16, label = "Pond" },
                        },
                    },
                },
                onmob_enemy = "Odontotyrannus",
            },
            {
                text = "Step 4: Trade the Odontotyrannus to Zaldon at the Fishermen's Guild in Selbina (H-9) for the Key Item: Knight's Boots.\n \n" ..
                       "- If you have not given Ailbeche his Giant Shell Bug yet, either order works.\n \n",
                route_to = "Selbina",
                destination_highlight = { position = "H-9", offsetX = 16, offsetY = 16 },
            },
            {
                text = "Step 5: Speak with Ailbeche in Northern San d'Oria (J-9), then Exoroche in Southern San d'Oria (K-7), then check Prince Trion's room in Chateau d'Oraguille (H-7).\n \n" ..
                       "- On Paladin main the Chateau cutscene also starts Under Oath.\n \n",
                route_to = "Chateau d'Oraguille",
                destination_highlight = { position = "H-7", offsetX = 16, offsetY = 16 },
            },
        },
        reward = {
            text = "Gallant Leggings\n \n" ..
                   "Opens Under Oath.\n \n",
        },
    },

    -- =========================================================================================
    -- 7) Under Oath
    -- =========================================================================================
    ["7.Paladin Quest - Under Oath"] = {
        requirements = {
            level = 50,
        },
        prerequisites = {
            { category = "Jobs", subfile = "Paladin", name = "6.Paladin Quest - A Boy's Dream" },
        },
        steps = {
            {
                text = "Step 1: Click Prince Trion's door in Chateau d'Oraguille (H-7).\n \n" ..
                       "- If you finished A Boy's Dream on Paladin you have already had this cutscene.\n" ..
                       "- (This quest can block the Trust: Trion unlock if you have not seen all of the door\n" ..
                       "  cutscenes yet, so clear those first if you want the Trust.)\n \n",
                route_to = "Chateau d'Oraguille",
                destination_highlight = { position = "H-7", offsetX = 16, offsetY = 16 },
            },
            {
                text = "Step 2: In Southern San d'Oria, speak with Vemalpeau (M-7), then Najjar in Lion Springs Tavern (K-6), then Ullasa at Count Caffaule's Manor (B-6).\n \n" ..
                       "- Ullasa brings up Mique's Paintbrush, which is the next objective.\n \n",
                route_to = "Southern San d'Oria",
                destination_highlight = {
                    { position = "M-7", offsetX = 16, offsetY = 16, label = "1" },
                    { position = "K-6", offsetX = 16, offsetY = 16, label = "2" },
                    { position = "B-6", offsetX = 16, offsetY = 16, label = "3" },
                },
            },
            {
                text = "Step 3: Open a coffer in Castle Zvahl Baileys for the Key Item: Mique's Paintbrush.\n \n" ..
                       "- Zvahl Coffer Keys drop from Ahriman, Abyssal Demons, Arch Demons, Blood Demons and Doom\n" ..
                       "  Demons, lower down on Map 3. Thieves can pick the coffer instead.\n" ..
                       "- The Curio Vendor Moogle sells a Zvahl Coffer Key for 5,000 gil once that shop is open.\n" ..
                       "- Paladin does not have to be your main job for this coffer.\n \n" ..
                       "CRITICAL: An active artifact quest for this same coffer takes priority - you will get the AF piece and no paintbrush until that quest is finished.\n \n",
                images = {
                    -- Map 3 is raw floor 15 for this zone (data/floor_mappings.lua [161]).
                    {
                        zone_name = "Castle Zvahl Baileys",
                        floor_id  = 15,
                        width     = 512,
                        height    = 512,
                        state     = 3,
                        highlights = {
                            { position = "F-6", offsetX = 16, offsetY = 16 },
                            { position = "F-10", offsetX = 16, offsetY = 16 },
                            { position = "J-6", offsetX = 16, offsetY = 16 },
                            { position = "J-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 4: Return to Vemalpeau in Southern San d'Oria (M-7).\n \n" ..
                       "- Go upstairs and examine the painting: pick 'look behind the frame', then 'open and\n" ..
                       "  examine', for the Key Item: Strange Sheet of Paper.\n \n",
                route_to = "Southern San d'Oria",
                destination_highlight = { position = "M-7", offsetX = 16, offsetY = 16 },
            },
            {
                text = "Step 5: Speak to Exoroche in Helbort's Blades (K-7), then examine the Village Well in Davoi (G-9).\n \n" ..
                       "- The well spawns two NMs: Three-eyed Prozpuz and One-eyed Gwajboj. Clear the Orcs around\n" ..
                       "  it first - a party around Lv55+ is the usual call.\n" ..
                       "- Each Paladin who needs one loots their own Well Weight.\n" ..
                       "- Trade the Well Weight to the Village Well for the Key Item: Knight's Confession.\n \n",
                route_to = "Davoi",
                destination_highlight = { position = "G-9", offsetX = 16, offsetY = 16 },
                onmob_enemy = { "Three-eyed Prozpuz", "One-eyed Gwajboj" },
                kill_requirement = {
                    count = 2,
                    enemies = { "Three-eyed Prozpuz", "One-eyed Gwajboj" },
                    zone = "Davoi",
                    count_party_kills = true,
                    display_only = true,
                },
            },
            {
                text = "Step 6: Speak to Ailbeche in Northern San d'Oria (J-9), then go to Maiden's Spring in Jugner Forest (E-6).\n \n" ..
                       "- Walking up to the pond triggers the cutscene. You do not have to dismount.\n \n",
                route_to = "Jugner Forest",
                destination_highlight = { position = "E-6", offsetX = 16, offsetY = 16 },
            },
            {
                text = "Step 7: Speak with Prince Trion in Chateau d'Oraguille (H-7) for the final cutscene.\n \n" ..
                       "- (Vemalpeau has a closing scene about the confession letter if you want it.)\n \n",
                route_to = "Chateau d'Oraguille",
                destination_highlight = { position = "H-7", offsetX = 16, offsetY = 16 },
            },
        },
        reward = {
            text = "Gallant Surcoat\n \n",
        },
    },

    -- =========================================================================================
    -- 8) Borghertz's Stalwart Hands (Paladin AF hands)
    -- =========================================================================================
    ["8.Paladin Quest - Borghertz's Stalwart Hands"] = {
        requirements = {
            level = 50,
        },
        steps = {
            {
                text = "Step 1: As a Lv50+ Paladin, speak to Guslam at Durable Shields in Upper Jeuno (H-8).\n \n" ..
                       "- Finish any other Borghertz's Hands quest you have open on another job first.\n \n",
                route_to = "Upper Jeuno",
                destination_highlight = { position = "H-8", offsetX = 16, offsetY = 16 },
            },
            {
                text = "Step 2: Open a coffer in The Eldieme Necropolis for the Key Item: Old Gauntlets.\n \n" ..
                       "- Coffer keys drop from Mimics, Haunts, Spriggans, Tomb Mages and Tomb Warriors. Thieves\n" ..
                       "  can pick the coffer instead.\n \n" ..
                       "CRITICAL: Paladin must be your main job when you open the coffer or you will not get the gauntlets.\n \n",
                images = {
                    -- Map 1 is raw floor 15 for this zone (data/floor_mappings.lua [195]).
                    {
                        zone_name = "The Eldieme Necropolis",
                        floor_id  = 15,
                        width     = 512,
                        height    = 512,
                        state     = 2,
                        highlights = {
                            { position = "G-6", offsetX = 16, offsetY = 16 },
                            { position = "F-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    -- Map 2's raw floor id is unconfirmed - see data/ref/Jobs/paladin_reference.md.
                    {
                        zone_name = "The Eldieme Necropolis",
                        width     = 512,
                        height    = 512,
                        state     = 2,
                        highlights = {
                            { position = "E-6", offsetX = 16, offsetY = 16 },
                            { position = "L-9", offsetX = 16, offsetY = 16 },
                            { position = "L-12", offsetX = 16, offsetY = 16 },
                            { position = "M-10", offsetX = 16, offsetY = 16 },
                            { position = "M-11", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 3: Take the Old Gauntlets back to Guslam in Upper Jeuno (H-8).\n \n" ..
                       "- He cannot repair them. Deadly Minnow points you at a Mithra in the Tenshodo.\n" ..
                       "- Pay Yin Pocanakhu 1,000 gil at Neptune's Spire in Lower Jeuno (J-7) for the details.\n \n",
                route_to = "Upper Jeuno",
                destination_highlight = { position = "H-8", offsetX = 16, offsetY = 16 },
            },
            {
                text = "Step 4: Examine the ??? near the Duty-Free Shop in Port Jeuno (H-8) for a cutscene about the repair.\n \n",
                route_to = "Port Jeuno",
                destination_highlight = { position = "H-8", offsetX = 16, offsetY = 16 },
            },
            {
                text = "Step 5: Go to the torch at (F-8) in Castle Zvahl Baileys, kill Dark Spark, then re-check the torch for the Key Item: Shadow Flames.\n \n" ..
                       "===== Dark Spark =====\n" ..
                       "- Lv55, roughly 8,500 HP, Dark Knight.\n" ..
                       "- It self-destructs, so keep your HP up when it is low.\n \n",
                images = {
                    {
                        zone_name = "Castle Zvahl Baileys",
                        floor_id  = 1,
                        width     = 512,
                        height    = 512,
                        state     = 5,
                        highlights = {
                            { position = "F-8", offsetX = 16, offsetY = 16, label = "Torch" },
                        },
                    },
                },
                onmob_enemy = "Dark Spark",
                kill_requirement = {
                    count = 1,
                    enemies = { "Dark Spark" },
                    zone = "Castle Zvahl Baileys",
                    count_party_kills = true,
                    display_only = true,
                },
            },
            {
                text = "Step 6: Return to the ??? in Port Jeuno (H-8) to receive the Gallant Gauntlets.\n \n",
                route_to = "Port Jeuno",
                destination_highlight = { position = "H-8", offsetX = 16, offsetY = 16 },
            },
            {
                text = "Step 7 (Optional): Pick up the rest of the Gallant set.\n \n" ..
                       "- Garlaige Citadel coffer gives the Gallant Coronet.\n" ..
                       "- Beadeaux coffer gives the Gallant Breeches.\n" ..
                       "- Both need Paladin as your main job, and neither blocks this quest.\n \n",
            },
        },
        reward = {
            text = "Gallant Gauntlets\n \n" ..
                   "Guslam also points you at the Garlaige Citadel and Beadeaux coffers for the rest of the set.\n \n",
        },
    },
}
