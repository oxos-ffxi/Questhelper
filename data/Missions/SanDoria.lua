return {
    ["1-1: Smash the Orcish Scouts"] = {
        steps = {
            { -- Step 1
                text = "Step 1: Talk to a San d'Orian Gate Guard to accept the mission. \n \n" ..
                       "Southern San d'Oria: Ambrotien or Endracion (I-9 / F-9). \n" ..
                       "Northern San d'Oria: Grilau (D-8). \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                trigger_on_talk = {"You accept the mission."},
                zone_max_distance = 40,
                visual_zones = {
                    -- Green Square around
                    --Aravoge, T.K for crystal trades
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = -104.9, y = 0.0, z = -53.1 }, size = 1, floor_id = 0, colour = "green" },
                    --Arpevion, T.K
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = 105.2, y = 0.0, z = -53.0 }, size = 1, floor_id = 0, colour = "green" },
                    --Achantere, T.K
                    { zone_name = "Northern San d'Oria", type = 'square', center = { x = -247.2, y = 7.0, z = 40.9 }, size = 1, floor_id = 0, colour = "green" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "F-9", offsetX = 16, offsetY = 16 },
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 2
                text = "Step 2: Defeat Orcish Fodder to obtain an Orcish Axe. \n \n" ..
                       "===== Obtaining the Orcish Axe ===== \n" ..
                       "Orcish Fodder spawn in West Ronfaure, Ghelsba Outpost, or La Theine Plateau. \n" ..
                       "Nearest: West Ronfaure, just outside the San d'Oria gates - highlighted on map some areas but look around the zones. \n" ..
                       "The Orcish Axe is a common drop; kill until one drops. \n \n",
                items_needed = {
                    "Orcish Axe"
                },
                trigger_on_item_obtain = {"Orcish Axe"},
                onmob_enemy = {"Orcish Fodder"},
                onmob_enemy_colour = "red",
                onmob_enemy_size = 2,
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        zone_name = "West Ronfaure",
                        highlights = {
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                            { position = "F-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 3
                text = "Step 3: Return to San d'Oria and trade the Orcish Axe to a Gate Guard to complete the mission. \n \n" ..
                       "Trade to Ambrotien or Endracion (Southern, I-9 / H-7), or Grilau (Northern, D-6). \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                trigger_on_event_id = {1002, 1020, 2002, 2020},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "F-9", offsetX = 16, offsetY = 16 },
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
        reward = {
            text = "Rank Points"
        }
    },
    ["1-2: Bat Hunt"] = {
        prerequisites = {
            {category = "Missions", subfile = "SanDoria", name = "1-1: Smash the Orcish Scouts"},
        },
        steps = {
            { -- Step 1
                text = "Step 1: Talk to a San d'Orian Gate Guard to accept the mission. \n \n" ..
                       "Southern San d'Oria: Ambrotien or Endracion (F-9 / K-10). \n" ..
                       "Northern San d'Oria: Grilau (D-8). \n \n" ..
                       "(Level 8 recommended.) \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                trigger_on_talk = {" but do not go in over your head!"},
                zone_max_distance = 40,
                visual_zones = {
                    -- Green Square around
                    --Aravoge, T.K for crystal trades
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = -104.9, y = 0.0, z = -53.1 }, size = 1, floor_id = 0, colour = "green" },
                    --Arpevion, T.K
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = 105.2, y = 0.0, z = -53.0 }, size = 1, floor_id = 0, colour = "green" },
                    --Achantere, T.K
                    { zone_name = "Northern San d'Oria", type = 'square', center = { x = -247.2, y = 7.0, z = 40.9 }, size = 1, floor_id = 0, colour = "green" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "F-9", offsetX = 16, offsetY = 16 },
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 2
                text = "Step 2: Travel to King Ranperre's Tomb and kill Ding Bats for Orcish Mail Scales. \n \n" ..
                       "===== Getting there ===== \n" ..
                       "From San d'Oria, cross into East Ronfaure, then enter King Ranperre's Tomb at (H-11). \n" ..
                       "Zone in and follow the right wall until you come out into an open area. \n \n" ..
                       "===== Obtaining Orcish Mail Scales ===== \n" ..
                       "Kill Ding Bats in the open area until you receive Orcish Mail Scales - highlighted! \n" ..
                       "WARNING: Ding Bats only spawn at NIGHT (Vana'diel 18:00 - 6:00). \n \n",
                route_to = "King Ranperre's Tomb",
                items_needed = {
                    "Orcish Mail Scales"
                },
                trigger_on_item_obtain = {"Orcish Mail Scales"},
                onmob_enemy = {"Ding Bats"},
                onmob_enemy_colour = "red",
                onmob_enemy_size = 2,
                zone_max_distance = 20,
                visual_zones = {
                    { zone_name = "East Ronfaure", type = 'arrow', center = { x = 212.8, y = 2.5, z = -491.0 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "East Ronfaure", type = 'arrow', center = { x = 200.2, y = 0.3, z = -533.8 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },

                    --Survival Guide
                    { zone_name = "King Ranperre's Tomb", type = 'square', center = { x = -119.0, y = 0.0, z = 248.5 }, size = 1, floor_id = 1, colour = "green" },

                    --Running to next area.
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
                    --To tombstone
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
            { -- Step 3
                text = "Step 3: Make your way through the maze to the King's Tomb at (H-10 / I-10). \n \n" ..
                       "Examine the Headstone for a cutscene. \n \n",
                onmob_target = {"king-ranperres-tomb-tombstone-i10"},
                trigger_on_event_id = {4},
                zone_max_distance = 20,
                visual_zones = {
                    { zone_name = "East Ronfaure", type = 'arrow', center = { x = 212.8, y = 2.5, z = -491.0 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "East Ronfaure", type = 'arrow', center = { x = 200.2, y = 0.3, z = -533.8 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },

                    --Survival Guide
                    { zone_name = "King Ranperre's Tomb", type = 'square', center = { x = -119.0, y = 0.0, z = 248.5 }, size = 1, floor_id = 1, colour = "green" },

                    --Running to next area.
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
                     --To tombstone
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
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        zone_name = "King Ranperre's Tomb",
                        highlights = {
                            { position = "I-10", offsetX = 16, offsetY = 16, label = "T" },
                        },
                        floor_id  = 1,
                    },
                },
            },
            { -- Step 4
                text = "Step 4: Return to San d'Oria and trade the Orcish Mail Scales to a Gate Guard to complete the mission. \n \n" ..
                       "Trade to Ambrotien or Endracion (Southern, I-9 / H-7), or Grilau (Northern, D-6). \n \n" ..
                       "NOTE: When repeating this mission, trade 1 Bat Fang instead of Orcish Mail Scales. \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                trigger_on_event_id = {1003, 1023, 2003, 2023},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "F-9", offsetX = 16, offsetY = 16 },
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
        reward = {
            text = "Rank Points"
        }
    },
    ["1-3: Save the Children"] = {
        requirements = {
            level = 10,
        },
        prerequisites = {
            {category = "Missions", subfile = "SanDoria", name = "1-2: Bat Hunt"},
        },
        steps = {
            { -- Step 1
                text = "Step 1: Talk to a San d'Orian Gate Guard to accept the mission. \n \n" ..
                       "Southern San d'Oria: Ambrotien or Endracion (F-9 / K-10). \n" ..
                       "Northern San d'Oria: Grilau (D-8). \n \n" ..
                       "(Level 10 recommended.) \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                trigger_on_talk = {" and ask what this boy looks like."},
                zone_max_distance = 40,
                visual_zones = {
                    -- Green Square around
                    --Aravoge, T.K for crystal trades
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = -104.9, y = 0.0, z = -53.1 }, size = 1, floor_id = 0, colour = "green" },
                    --Arpevion, T.K
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = 105.2, y = 0.0, z = -53.0 }, size = 1, floor_id = 0, colour = "green" },
                    --Achantere, T.K
                    { zone_name = "Northern San d'Oria", type = 'square', center = { x = -247.2, y = 7.0, z = 40.9 }, size = 1, floor_id = 0, colour = "green" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "F-9", offsetX = 16, offsetY = 16 },
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 2
                text = "Step 2: Talk to Arnau in the Cathedral in Northern San d'Oria (M-6) for a cutscene. \n \n" ..
                       "(First time only - if you are repeating this mission you can skip straight to the battlefield.) \n \n",
                onmob_target = {"Arnau"},
                trigger_on_event_id = {693},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "M-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 3
                text = "Step 3: Head to Ghelsba Outpost and check the Hut Door at (G-10) to enter the battlefield \"Save the Children\". \n \n" ..
                       "===== Battle ===== \n" ..
                       "Defeat the 3 Orcs: \n" ..
                       "  Fodderchief Vokdek (Warrior) \n" ..
                       "  Strongarm Zodvad (Ranger) \n" ..
                       "  Sureshot Snatgat (Ranger) \n \n" ..
                       "Time limit: 10 minutes. Buffs wear off on entry. Level is restricted to 99. \n" ..
                       "Trusts are allowed, but cast them AFTER entering - alter egos summoned beforehand despawn. \n \n",
                route_to = "Ghelsba Outpost",
                destination_highlight = {position = "G-10", offsetX = 16, offsetY = 16},
                onmob_target = "ghelsba-outpost-hut-door-f10",
                onmob_enemy = {"Fodderchief Vokdek", "Strongarm Zodvad", "Sureshot Snatgat"},
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
                kill_requirement = {
                    count = 3,
                    enemies = {"Fodderchief Vokdek", "Strongarm Zodvad", "Sureshot Snatgat"},
                    count_party_kills = true,
                    display_only = true,
                },
                onmob_enemy_colour = "red",
                onmob_enemy_size = 2,
                trigger_on_event_id = {32001},
            },
            { -- Step 4
                text = "Step 4: After you are teleported out, check the Hut Door at (G-10) again for a cutscene. \n \n" ..
                       "TIP: Click the Hut Door again afterwards until it stops responding - this saves you a return trip. \n \n",
                onmob_target = "ghelsba-outpost-hut-door-f10",
                trigger_on_event_id = {3, 55},
                route_to = "Ghelsba Outpost",
                destination_highlight = {position = "G-10", offsetX = 16, offsetY = 16},
            },
            { -- Step 5
                text = "Step 5: Return to San d'Oria and speak to a Gate Guard to complete the mission. \n \n" ..
                       "Ambrotien or Endracion (Southern, F-9 / K-10), or Grilau (Northern, D-8). \n \n" ..
                       "Optional: return to the Cathedral and speak to Arnau afterwards for an additional cutscene. \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                trigger_on_event_id = {1004, 1024, 2004, 2024},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "F-9", offsetX = 16, offsetY = 16 },
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
        reward = {
            text = "Rank 2, 1000 gil, Title: Fodderchief Flayer"
        }
    },
    ["2-1: The Rescue Drill"] = {
        requirements = {
            level = 15,
        },
        prerequisites = {
            {category = "Missions", subfile = "SanDoria", name = "1-3: Save the Children"},
        },
        steps = {
            { -- Step 1
                text = "Step 1: Talk to a San d'Orian Gate Guard to accept the mission. \n \n" ..
                       "Southern San d'Oria: Ambrotien or Endracion (F-9 / K-10). \n" ..
                       "Northern San d'Oria: Grilau (D-8). \n \n" ..
                       "NOTE: You must have enough rank points to be offered this mission - if your rank bar is empty, trade a crystal to a Gate Guard first. \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                --trigger_on_event_id = {1009, 2009},
                trigger_on_talk = " Just follow orders and you'll be fine.",
                zone_max_distance = 40,
                visual_zones = {
                    -- Green Square around
                    --Aravoge, T.K for crystal trades
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = -104.9, y = 0.0, z = -53.1 }, size = 1, floor_id = 0, colour = "green" },
                    --Arpevion, T.K
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = 105.2, y = 0.0, z = -53.0 }, size = 1, floor_id = 0, colour = "green" },
                    --Achantere, T.K
                    { zone_name = "Northern San d'Oria", type = 'square', center = { x = -247.2, y = 7.0, z = 40.9 }, size = 1, floor_id = 0, colour = "green" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "F-9", offsetX = 16, offsetY = 16 },
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 2
                text = "Step 2: Travel to La Theine Plateau and talk to Galaihaurat at (E-6), on the road west of the canyon. \n \n" ..
                       "This is the first Temple Knight - you will talk to the rest in order as you head toward Ordelle's Caves. \n \n",
                onmob_target = {"Galaihaurat"},
                trigger_on_event_id = {110},
                route_to = "La Theine Plateau",
                destination_highlight = {position = "E-6", offsetX = 16, offsetY = 16},
            },
            { -- Step 3
                text = "Step 3: Head east and north around the top of the canyon and talk to Equesobillot at (F-6). \n \n",
                onmob_target = {"Equesobillot"},
                trigger_on_event_id = {101},
                route_to = "La Theine Plateau",
                destination_highlight = {position = "F-6", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                        -- To the Ramp
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
                },
            },
            { -- Step 4
                text = "Step 4: Talk to Deaufrain (F-6), on the ramp into the canyon. \n \n",
                onmob_target = {"Deaufrain"},
                trigger_on_event_id = {102},
                route_to = "La Theine Plateau",
                destination_highlight = {position = "F-6", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                        -- To the Ramp
                            { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -290.7, y = 12.0, z = 294.0 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                            { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -294.1, y = 17.0, z = 314.8 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                            { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -291.5, y = 23.4, z = 342.1 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                },
            },
            { -- Step 5
                text = "Step 5: Talk to Vicorpasse (the captain) at the beginning of the canyon. \n \n",
                onmob_target = {"Vicorpasse"},
                trigger_on_event_id = {108},
                route_to = "La Theine Plateau",
                destination_highlight = {position = "F-6", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -306.0, y = 28.9, z = 336.6 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -311.0, y = 31.7, z = 312.1 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -322.2, y = 38.8, z = 284.0 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                },
            },
            { -- Step 6
                text = "Step 6: Head down into the canyon and talk to Laurisse. \n \n" ..
                       "(Augevinne and Yaucevouchat nearby have optional dialogue.) \n \n",
                onmob_target = {"Laurisse"},
                trigger_on_event_id = {106},
                route_to = "La Theine Plateau",
                destination_highlight = {position = "F-7", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -347.7, y = 37.8, z = 259.4 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -360.8, y = 38.8, z = 235.0 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -357.5, y = 38.8, z = 205.1 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -335.2, y = 37.5, z = 181.1 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -315.9, y = 38.4, z = 154.2 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                },
            },
            { -- Step 7
                text = "Step 7: Talk to Narvecaint - the last knight - near (F-7), the entrance to Ordelle's Caves. \n \n",
                onmob_target = {"Narvecaint"},
                trigger_on_event_id = {107},
                route_to = "La Theine Plateau",
                destination_highlight = {position = "F-7", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -289.0, y = 27.3, z = 141.2 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -275.8, y = 24.1, z = 142.1 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                },
            },
            { -- Step 8
                text = "Step 8: Enter Ordelle's Caves (La Theine F-7) and talk to Ruillont. \n \n" ..
                       "Follow the left wall (about 15 seconds walking) - he is hiding in a small pond. \n \n",
                onmob_target = {"Ruillont"},
                trigger_on_event_id = {1},
                route_to = "Ordelle's Caves",
                destination_highlight = {position = "H-3", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -261.7, y = 23.9, z = 117.7 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },

                    -- Ordelles to find the Knight
                    { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -81.2, y = 0.5, z = 660.4 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -99.5, y = 0.5, z = 648.2 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    --Survival Guide
                    { zone_name = "Ordelle's Caves", type = 'square', center = { x = -104.0, y = -0.1, z = 633.0 }, size = 1, floor_id = 1, colour = "green" },
                    { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -100.4, y = 0.6, z = 619.9 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -95.1, y = 0.5, z = 602.4 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },


                },
            },
            { -- Step 9
                text = "Step 9: Return to La Theine Plateau and talk to the knight holding Ruillont's Bronze Sword. \n \n" ..
                       "The knight is RANDOM - one of Galaihaurat(Purple) (E-6), Equesobillot(Blue) (F-6), or Deaufrain(Purple) (F-6). \n" ..
                       "You will receive an actual Bronze Sword, so make sure you have an inventory slot free. \n \n",
                onmob_target = {"Galaihaurat", "Equesobillot", "Deaufrain"},
                trigger_on_event_id = {112, 113, 114},
                route_to = "La Theine Plateau",
                destination_highlight = {position = "F-6", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -77.0, y = 1.5, z = 607.1 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -88.2, y = 1.5, z = 602.6 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -100.4, y = 0.1, z = 615.3 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -90.1, y = 0.4, z = 660.0 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },

                    -- random 3 knights go all the way to e-6 just incase
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -272.1, y = 23.3, z = 99.6 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -261.8, y = 23.4, z = 116.4 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -289.8, y = 27.9, z = 143.2 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -318.8, y = 38.9, z = 167.5 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -346.0, y = 39.3, z = 197.6 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -358.0, y = 38.9, z = 229.6 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -354.7, y = 39.4, z = 259.2 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -318.8, y = 38.8, z = 280.0 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -309.9, y = 33.5, z = 306.4 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -306.6, y = 29.5, z = 319.3 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -303.5, y = 27.2, z = 342.6 }, size = 4, direction = "ne", floor_id = 0, colour = "cyan" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -294.6, y = 24.1, z = 343.1 }, size = 4, direction = "down", floor_id = 0, colour = "cyan" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -292.7, y = 17.1, z = 316.2 }, size = 4, direction = "down", floor_id = 0, colour = "cyan" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -282.0, y = 8.8, z = 295.0 }, size = 4, direction = "up", floor_id = 0, colour = "magenta" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -280.7, y = 8.2, z = 327.5 }, size = 4, direction = "up", floor_id = 0, colour = "magenta" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -282.1, y = 8.0, z = 360.4 }, size = 4, direction = "up", floor_id = 0, colour = "magenta" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -289.5, y = 8.3, z = 401.1 }, size = 4, direction = "sw", floor_id = 0, colour = "magenta" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -316.1, y = 8.9, z = 381.6 }, size = 4, direction = "sw", floor_id = 0, colour = "magenta" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -346.1, y = 8.7, z = 355.4 }, size = 4, direction = "sw", floor_id = 0, colour = "magenta" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -374.2, y = 8.5, z = 328.3 }, size = 4, direction = "sw", floor_id = 0, colour = "magenta" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -398.1, y = 8.9, z = 302.5 }, size = 4, direction = "down", floor_id = 0, colour = "magenta" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -401.7, y = 7.9, z = 276.8 }, size = 4, direction = "down", floor_id = 0, colour = "magenta" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -407.0, y = 8.1, z = 239.7 }, size = 4, direction = "sw", floor_id = 0, colour = "magenta" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -418.7, y = 8.4, z = 224.1 }, size = 4, direction = "sw", floor_id = 0, colour = "magenta" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -435.2, y = 8.3, z = 209.5 }, size = 4, direction = "up", floor_id = 0, colour = "magenta" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -452.1, y = 0.8, z = 216.7 }, size = 4, direction = "left", floor_id = 0, colour = "magenta" },
                },
            },
            { -- Step 10
                text = "Step 10: Return to Ordelle's Caves and trade the Bronze Sword to Ruillont. \n \n",
                onmob_target = {"Ruillont"},
                trigger_on_event_id = {2},
                route_to = "Ordelle's Caves",
                items_needed = {
                    { item = "Bronze Sword", quantity = 1, on_the_way = true },
                },
                destination_highlight = {position = "H-3", offsetX = 16, offsetY = 16},
                zone_max_distance = 25,
                visual_zones = {
                        -- To the Ramp
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
                        { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -290.0, y = 11.6, z = 291.8 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -292.7, y = 18.5, z = 320.0 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -296.6, y = 25.2, z = 346.2 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -309.4, y = 36.9, z = 293.6 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -357.2, y = 39.6, z = 262.9 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -360.8, y = 39.2, z = 227.9 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -355.5, y = 38.8, z = 203.5 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                        { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -327.3, y = 38.8, z = 170.9 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                        { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -299.5, y = 31.6, z = 142.5 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                        { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -270.3, y = 22.7, z = 138.8 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                        { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -260.8, y = 22.8, z = 114.2 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },

                        -- Ordelles to Rulluiont
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -81.2, y = 0.5, z = 660.4 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -99.5, y = 0.5, z = 648.2 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                        --Survival Guide
                        { zone_name = "Ordelle's Caves", type = 'square', center = { x = -104.0, y = -0.1, z = 633.0 }, size = 1, floor_id = 1, colour = "green" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -100.4, y = 0.6, z = 619.9 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                        { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -95.1, y = 0.5, z = 602.4 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                },
            },
            { -- Step 11
                text = "Step 11: Return to La Theine Plateau and talk to Vicorpasse (F-6) at the beginning of the canyon. \n \n" ..
                       "CRITICAL: He gives you the Key Item: Rescue Training Certificate. \n \n",
                onmob_target = {"Vicorpasse"},
                trigger_on_event_id = {115},
                route_to = "La Theine Plateau",
                destination_highlight = {position = "F-6", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -77.0, y = 1.5, z = 607.1 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -88.2, y = 1.5, z = 602.6 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -100.4, y = 0.1, z = 615.3 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Ordelle's Caves", type = 'arrow', center = { x = -90.1, y = 0.4, z = 660.0 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },

                    -- random 3 knights go all the way to e-6 just incase
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -272.1, y = 23.3, z = 99.6 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -261.8, y = 23.4, z = 116.4 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -289.8, y = 27.9, z = 143.2 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -318.8, y = 38.9, z = 167.5 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -346.0, y = 39.3, z = 197.6 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -358.0, y = 38.9, z = 229.6 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "La Theine Plateau", type = 'arrow', center = { x = -354.7, y = 39.4, z = 259.2 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                },
            },
            { -- Step 12
                text = "Step 12: Return to San d'Oria and talk to a Gate Guard to complete the mission. \n \n" ..
                       "Ambrotien or Endracion (Southern, F-9 / K-10), or Grilau (Northern, D-8). \n \n" ..
                       "TIP: There is a Survival Guide just inside Ordelle's Caves for a quick return trip/warp home! \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                trigger_on_event_id = {1005, 2005},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 12,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "F-9", offsetX = 16, offsetY = 16 },
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 12,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
        reward = {
            text = "Rank Points"
        }
    },
    ["2-2: The Davoi Report"] = {
        requirements = {
            level = 25,
        },
        prerequisites = {
            {category = "Missions", subfile = "SanDoria", name = "2-1: The Rescue Drill"},
        },
        steps = {
            { -- Step 1
                text = "Step 1: Talk to a San d'Orian Gate Guard to accept the mission. \n \n" ..
                       "Southern San d'Oria: Ambrotien or Endracion (F-9 / K-10). \n" ..
                       "Northern San d'Oria: Grilau (D-8). \n \n" ..
                       "(Level 20 in a party, 25 solo. This mission can be skipped by 2 stacks of crystals to a Gate Guard.) \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                --trigger_on_event_id = {1009, 2009},
                trigger_on_talk = " Those lands are no place to wander",
                zone_max_distance = 40,
                visual_zones = {
                    -- Green Square around
                    --Aravoge, T.K for crystal trades
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = -104.9, y = 0.0, z = -53.1 }, size = 1, floor_id = 0, colour = "green" },
                    --Arpevion, T.K
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = 105.2, y = 0.0, z = -53.0 }, size = 1, floor_id = 0, colour = "green" },
                    --Achantere, T.K
                    { zone_name = "Northern San d'Oria", type = 'square', center = { x = -247.2, y = 7.0, z = 40.9 }, size = 1, floor_id = 0, colour = "green" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "F-9", offsetX = 16, offsetY = 16 },
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 2
                text = "Step 2: Travel to Davoi (enter from Jugner Forest at G-12) and speak to Zantaviat. \n \n" ..
                       "He is hiding next to a tree near the entrance. \n \n" ..
                       "WARNING: Orcs detect by sight and Bats detect by sound - bring Prism Powders and Silent Oils if low level. \n \n",
                onmob_target = {"Zantaviat"},
                trigger_on_event_id = {100},
                route_to = "Davoi",
                destination_highlight = {position = "J-7", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                        --Survival Guide
                        { zone_name = "Davoi", type = 'square', center = { x = 223.0, y = -0.0, z = -10.0 }, size = 1, floor_id = 0, colour = "green" },
                },
            },
            { -- Step 3
                text = "Step 3: Walk south to the pond. At the pond's south end, check the ! point to receive the Key Item: Lost Document. \n \n",
                keyitems_needed = {103},
                trigger_on_keyitem_obtain = {103},
                onmob_target = "davoi-!",
                route_to = "Davoi",
                destination_highlight = {position = "J-8", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                        --Survival Guide
                        { zone_name = "Davoi", type = 'square', center = { x = 223.0, y = -0.0, z = -10.0 }, size = 1, floor_id = 0, colour = "green" },
                        --Route to "!" near the pond.
                        { zone_name = "Davoi", type = 'arrow', center = { x = 215.9, y = -0.1, z = -17.2 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Davoi", type = 'arrow', center = { x = 219.4, y = 2.1, z = -55.1 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Davoi", type = 'arrow', center = { x = 220.8, y = 4.0, z = -81.4 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                        { zone_name = "Davoi", type = 'arrow', center = { x = 239.5, y = 4.0, z = -105.3 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Davoi", type = 'arrow', center = { x = 218.7, y = 3.9, z = -117.6 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                },
            },
            { -- Step 4
                text = "Step 4: Return the Lost Document to Zantaviat to receive the Key Item: Temple Knights' Davoi Report. \n \n",
                onmob_target = {"Zantaviat"},
                trigger_on_event_id = {104},
                route_to = "Davoi",
                destination_highlight = {position = "J-7", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                        --Survival Guide
                        { zone_name = "Davoi", type = 'square', center = { x = 223.0, y = -0.0, z = -10.0 }, size = 1, floor_id = 0, colour = "green" },
                        -- Back to Zantaviat
                        { zone_name = "Davoi", type = 'arrow', center = { x = 212.8, y = 3.3, z = -114.2 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                        { zone_name = "Davoi", type = 'arrow', center = { x = 230.9, y = 3.7, z = -115.9 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                        { zone_name = "Davoi", type = 'arrow', center = { x = 242.1, y = 4.0, z = -95.6 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Davoi", type = 'arrow', center = { x = 220.2, y = 3.0, z = -64.3 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Davoi", type = 'arrow', center = { x = 218.5, y = -0.0, z = -43.8 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                }
            },
            { -- Step 5
                text = "Step 5: Deliver the report in Northern San d'Oria. \n \n" ..
                       "Go to the Cathedral (M-6) and enter the Papal Chambers on the third floor, then speak to Prince Pieuje. \n \n",
                onmob_target = {"Door: Papal Chambers"},
                zone_max_distance = 15,
                visual_zones = {
                    { zone_name = "Northern San d'Oria", type = 'arrow', center = { x = 109.0, y = 0.0, z = 101.6 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Northern San d'Oria", type = 'arrow', center = { x = 125.2, y = 0.0, z = 112.1 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Northern San d'Oria", type = 'arrow', center = { x = 134.3, y = -6.5, z = 93.7 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Northern San d'Oria", type = 'arrow', center = { x = 122.3, y = -6.5, z = 106.0 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Northern San d'Oria", type = 'arrow', center = { x = 132.1, y = -11.0, z = 124.2 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" }
                },
                trigger_on_event_id = {695, 1006, 2006},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "M-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
        reward = {
            text = "Rank Points"
        }
    },
    ["2-3a: Journey Abroad - Introduction"] = {
        requirements = {
            level = 25,
        },
        prerequisites = {
            {category = "Missions", subfile = "SanDoria", name = "2-1: The Rescue Drill"},
        },
        steps = {
            { -- Step 1
                text = "Step 1: Talk to a San d'Orian Gate Guard to accept the mission. \n \n" ..
                       "Southern San d'Oria: Ambrotien or Endracion (F-9 / K-10). \n" ..
                       "Northern San d'Oria: Grilau (D-8). \n \n" ..
                       "(Requires Mission 2-1 and a 3/4-full Rank Bar. If short on rank points, trade a crystal to a Temple Knight or repeat Bat Hunt.) \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                trigger_on_talk = " he'll explain in person.",
                zone_max_distance = 40,
                visual_zones = {
                    -- Green Square around
                    --Aravoge, T.K for crystal trades
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = -104.9, y = 0.0, z = -53.1 }, size = 1, floor_id = 0, colour = "green" },
                    --Arpevion, T.K
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = 105.2, y = 0.0, z = -53.0 }, size = 1, floor_id = 0, colour = "green" },
                    --Achantere, T.K
                    { zone_name = "Northern San d'Oria", type = 'square', center = { x = -247.2, y = 7.0, z = 40.9 }, size = 1, floor_id = 0, colour = "green" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "F-9", offsetX = 16, offsetY = 16 },
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 2
                text = "Step 2: Enter Chateau d'Oraguille (Northern San d'Oria, I-7) and talk to Halver. \n \n" ..
                       "He gives you the Key Item: Letter to the Consuls and sends you to visit the Bastok and Windurst embassies. \n \n" ..
                       "NEXT: Pick ONE route guide and follow it - do NOT do both: \n" ..
                       "  - '2-3b: Journey Abroad - Bastok -> Windurst', or \n" ..
                       "  - '2-3b: Journey Abroad - Windurst -> Bastok'. \n \n",
                onmob_target = {"Halver"},
                trigger_on_event_id = {505},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "Nothing yet - follow ONE of the two route guides (2-3b) to continue!"
        }
    },
    ["2-3b: Journey Abroad - Bastok -> Windurst"] = {
        choice_group = "2-3b: Journey Abroad",
        requirements = {
            level = 25,
        },
        prerequisites = {
            {category = "Missions", subfile = "SanDoria", name = "2-3a: Journey Abroad - Introduction"},
        },
        steps = {
            { -- Step 1
                text = "Step 1: Travel to Bastok. In the Metalworks, take a lift to the 2nd floor and enter the Consulate of San d'Oria. \n \n" ..
                       "Speak to Savae E Paleade for a cutscene. \n \n" ..
                       "(If you have never been: Unity warp to South Gustaberg, then Bastok Markets H-7 -> Metalworks I-9.) \n \n",
                onmob_target = {"Savae E Paleade"},
                trigger_on_event_id = {204},
                route_to = "Metalworks",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                        { zone_name = "Metalworks", type = 'arrow', center = { x = 23.8, y = -14.0, z = -14.7 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Metalworks", type = 'rect', center = { x = 24.0, y = -17.4, z = -23.0 }, width = 4.00, height = 2.75, floor_id = 0, colour = "cyan", vertical_axis = 'ns' },
                },
            },
            {
                text = "Step 2: Talk to Pius (J-8) in the Department of Industry (President's Office) in Metalworks. \n \n",
                onmob_target = {"Pius"},
                trigger_on_event_id = {355},
                route_to = "Metalworks",
                destination_highlight = {position = "J-8", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Metalworks", type = 'arrow', center = { x = 88.9, y = -19.5, z = -0.9 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Metalworks", type = 'rect', center = { x = 88.8, y = -21.7, z = -6.9 }, width = 2.25, height = 2.75, floor_id = 0, colour = "cyan", vertical_axis = 'ns' },
                }
            },
            {
                text = "Step 3: Talk to Grohm (H-9) in the Craftsmen's Eatery in Metalworks. \n \n" ..
                       "He will give you Pickaxes and direct you to mine in Palborough Mines. \n \n" ..
                       "Tip: Buy extra Pickaxes as they can break. Pick up the Map of Palborough Mines if you need it. \n \n",
                onmob_target = {"Grohm"},
                trigger_on_event_id = {423},
                route_to = "Metalworks",
                destination_highlight = {position = "H-9", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                         { zone_name = "Metalworks", type = 'rect', center = { x = -29.7, y = -11.6, z = -18.3 }, width = 2.50, height = 3.25, floor_id = 0, colour = "cyan", vertical_axis = 'nw' },
                         { zone_name = "Metalworks", type = 'arrow', center = { x = -32.9, y = -10.0, z = -15.4 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                }
            },
            { -- Step 4
                text = "Step 4: Head to Palborough Mines (enter from North Gustaberg K-3) and mine Mythril Seams until you obtain Mine Gravel. \n \n" ..
                       "Seam locations: (I-8) floor 1 west of river, (I-8) floor 2 south room, (I-9) floor 3. \n \n" ..
                       "Trade a Pickaxe to a Mythril Seam - it may take several attempts (pickaxes can break; you still get the gravel). \n" ..
                       "Note: Sneak recommended - Quadavs aggro by sight. \n" ..
                       "(Optional): Mine Gravel can also be bought from the Auction House [Others -> Misc.]. \n \n",
                route_to = "Palborough Mines 1",
                destination_highlight = {position = "I-8", offsetX = 16, offsetY = 16},
                onmob_target = {"palborough-mines-mythril-seam"},
                items_needed = {"Mine Gravel"},
                trigger_on_item_obtain = {"Mine Gravel"},
                zone_max_distance = 40,
                visual_zones = {
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 59.7, y = 0.2, z = 69.4 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 60.1, y = 0.2, z = 99.1 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 62.1, y = 0.9, z = 139.9 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 100.3, y = -0.1, z = 133.6 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 101.5, y = 0.1, z = 60.7 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 167.6, y = -0.1, z = 66.1 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                },
            },
            { -- Step 5
                text = "Step 5: On floor 3 of Palborough Mines, go to (I-6) and trade the Mine Gravel to the Refiner Lid. \n \n",
                zone_max_distance = 30,
                onmob_target = {"palborough-mines-elevator-lever-i8",
                                "palborough-mines-refiner-lid"},
                route_to = "Palborough Mines 2",
                destination_highlight = {position = "I-7", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {19},
                visual_zones = {
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 169.2, y = -1.2, z = 92.7 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 163.1, y = 0.2, z = 59.6 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 99.9, y = 0.1, z = 55.7 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 99.3, y = -6.1, z = 9.6 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 139.0, y = -8.1, z = -7.8 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 179.3, y = -14.5, z = 20.1 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 220.9, y = -7.9, z = 39.7 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 200.5, y = 0.2, z = 59.9 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 187.0, y = -32.0, z = 61.1 }, size = 4, direction = "right", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 219.3, y = -32.0, z = 66.2 }, size = 4, direction = "up", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 219.4, y = -32.0, z = 99.6 }, size = 4, direction = "up", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 218.5, y = -32.0, z = 139.7 }, size = 4, direction = "left", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 179.5, y = -32.0, z = 141.5 }, size = 4, direction = "up", floor_id = 3, colour = "yellow" },
                },
            },
            { -- Step 6
                text = "Step 6: Pull the Refiner Lever! \n \n",
                zone_max_distance = 30,
                onmob_target = {"palborough-mines-refiner-lever"},
                route_to = "Palborough Mines 2",
                destination_highlight = {position = "I-7", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {17},
            },
            { -- Step 7
                text = "Step 7: Drop down to the floor below and pull the second lever. \n \n" ..
                       "You will receive an Onz of Mythril Sand automatically. This completes the mining. \n \n",
                zone_max_distance = 30,
                onmob_target = {"palborough-mines-refiner-lever-2"},
                route_to = "Palborough Mines 2",
                destination_highlight = {position = "I-7", offsetX = 16, offsetY = 16},
                trigger_on_item_obtain = {"Mythril Sand"},
                visual_zones = {
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 180.9, y = -32.3, z = 167.6 }, size = 3, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 175.3, y = -31.8, z = 176.7 }, size = 3, direction = "up", floor_id = 2, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'line', start = { x = 175.4, y = -31.8, z = 177.9 }, stop = { x = 175.6, y = -23.5, z = 179.2 }, floor_id = 2, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'line', start = { x = 175.6, y = -23.5, z = 179.2 }, stop = { x = 175.4, y = -23.5, z = 184.1 }, floor_id = 2, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'line', start = { x = 175.4, y = -23.5, z = 184.1 }, stop = { x = 175.3, y = -15.7, z = 185.3 }, floor_id = 2, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 174.1, y = -15.8, z = 182.8 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                },
            },
            { -- Step 8
                text = "Step 8: Return to Savae E Paleade in the Metalworks (2nd floor Consulate) and trade her the Mythril Sand. \n \n" ..
                       "This completes the Bastok leg. \n \n" ..
                       "(Shortcut back: Palborough Mines 3rd floor H-8 boat -> Zeruhn Mines -> Bastok Mines.) \n \n",
                onmob_target = {"Savae E Paleade"},
                trigger_on_event_id = {205},
                route_to = "Metalworks",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                        { zone_name = "Metalworks", type = 'arrow', center = { x = 23.8, y = -14.0, z = -14.7 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Metalworks", type = 'rect', center = { x = 24.0, y = -17.4, z = -23.0 }, width = 4.00, height = 2.75, floor_id = 0, colour = "cyan", vertical_axis = 'ns' },
                },
            },
            { -- Step 9
                text = "Step 9: Travel to Windurst. Talk to Mourices at the Consulate of San d'Oria in Windurst Woods (F-10). \n \n",
                onmob_target = {"Mourices"},
                trigger_on_event_id = {462},
                route_to = "Windurst Woods",
                destination_highlight = {position = "F-10", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                        { zone_name = "Windurst Woods", type = 'arrow', center = { x = -46.6, y = 1.2, z = -49.1 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Windurst Woods", type = 'rect', center = { x = -55.5, y = -1.0, z = -40.5 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'nw' },
                        { zone_name = "Windurst Woods", type = 'rect', center = { x = -52.7, y = -1.0, z = -34.9 }, width = 2.25, height = 2.75, floor_id = 0, colour = "cyan", vertical_axis = 'ne' },
                },
            },
            {
                text = "Step 10: Talk to Kupipi in Heavens Tower on the first floor north side, she will give you a KI:Dark Key. \n" ..
                       "All party members need one Dark Key! \n" ..
                       "If you have KI:Rhapsody in White you will obtain a new trust - Cipher:Semih. \n \n",
                onmob_target = {"Kupipi"},
                trigger_on_event_id = {242},
                route_to = "Heavens Tower",
                zone_max_distance = 17,
                visual_zones = {
                        { zone_name = "Heavens Tower", type = 'arrow', center = { x = -0.0, y = 0.8, z = 15.8 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Heavens Tower", type = 'rect', center = { x = 0.0, y = -1.8, z = 22.3 }, width = 3.75, height = 3.25, floor_id = 0, colour = "cyan", vertical_axis = 'ns' },
                }
            },
            {
                text = "Step 11: Travel to Giddeus with your party! \n",
                zone_trigger = "Giddeus",
                route_to = "Giddeus",
            },
            {
                text = "Step 12: Navigate to Balga's Dais  \n",
                zone_max_distance = 35,
                zone_trigger = "Balga's Dais",
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
                          state    = 12,
                          zone_name = "Giddeus",
                          floor_id = 1,
                          highlights = {
                              { position = "F-12", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 12,
                          zone_name = "Giddeus",
                          floor_id = 15,
                          highlights = {
                              { position = "F-8", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 13: This is a BCNM battle! You will face Searcher and Black Dragon. \n" ..
                       "Recommended: Level 35+ or a party. \n \n" ..
                       "===== Searcher ===== \n" ..
                       "Family: Bigeye thing \n" ..
                       "Level: 25 \n \n" ..
                       "===== Black Dragon ===== \n" ..
                       "Family: Dragon \n" ..
                       "Level: 27 \n" ..
                       "Notes: Sleep/Bind the Dragon and kill the Spotter! \n \n",
                trigger_on_event_id = { 32001 },
                onmob_target = "balga-dais-burning-circle",
            },
            { -- Step 12
                text = "Step 14: Return to Mourices in Windurst Woods (F-10) to receive the Key Item: Kindred Report. \n \n",
                onmob_target = {"Mourices"},
                trigger_on_event_id = {467},
                route_to = "Windurst Woods",
                destination_highlight = {position = "F-10", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                        { zone_name = "Windurst Woods", type = 'arrow', center = { x = -46.6, y = 1.2, z = -49.1 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Windurst Woods", type = 'rect', center = { x = -55.5, y = -1.0, z = -40.5 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'nw' },
                        { zone_name = "Windurst Woods", type = 'rect', center = { x = -52.7, y = -1.0, z = -34.9 }, width = 2.25, height = 2.75, floor_id = 0, colour = "cyan", vertical_axis = 'ne' },
                },
            },
            { -- Step 13
                text = "Step 15: Return to Chateau d'Oraguille in Northern San d'Oria and report to Halver to complete the mission. \n \n" ..
                       "(Afterwards you can talk to Curilla to obtain her Alter Ego.) \n \n",
                onmob_target = {"Halver"},
                trigger_on_event_id = {507},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "Rank 3, 3000 gil, Key Item: Adventurer's Certificate, Title: Certified Adventurer"
        }
    },
    ["2-3b: Journey Abroad - Windurst -> Bastok"] = {
        choice_group = "2-3b: Journey Abroad",
        requirements = {
            level = 25,
        },
        prerequisites = {
            {category = "Missions", subfile = "SanDoria", name = "2-3a: Journey Abroad - Introduction"},
        },
        steps = {
            { -- Step 1
                text = "Step 1: Travel to Windurst. Talk to Mourices at the Consulate of San d'Oria in Windurst Woods (G-10). \n \n",
                onmob_target = {"Mourices"},
                trigger_on_event_id = {448},
                route_to = "Windurst Woods",
                destination_highlight = {position = "F-10", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                        { zone_name = "Windurst Woods", type = 'arrow', center = { x = -46.6, y = 1.2, z = -49.1 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Windurst Woods", type = 'rect', center = { x = -55.5, y = -1.0, z = -40.5 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'nw' },
                        { zone_name = "Windurst Woods", type = 'rect', center = { x = -52.7, y = -1.0, z = -34.9 }, width = 2.25, height = 2.75, floor_id = 0, colour = "cyan", vertical_axis = 'ne' },
                },
            },
            { -- Step 2
                text = "Step 2: Enter Heavens Tower (Windurst Walls H-7) for a cutscene, then talk to Kupipi in the Clerical Chamber. \n \n" ..
                       "She gives you the Key Item: Shield Offering. \n \n",
                onmob_target = {"Kupipi"},
                trigger_on_event_id = {238},
                route_to = "Heavens Tower",
                zone_max_distance = 17,
                visual_zones = {
                        { zone_name = "Heavens Tower", type = 'arrow', center = { x = -0.0, y = 0.8, z = 15.8 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Heavens Tower", type = 'rect', center = { x = 0.0, y = -1.8, z = 22.3 }, width = 3.75, height = 3.25, floor_id = 0, colour = "cyan", vertical_axis = 'ns' },
                }
            },
            { -- Step 3
                text = "Step 3: Go to Giddeus (West Sarutabaruta F-8). Make your way to Uu Zhoumo on Map 2 (F-7) and give the Shield Offering. \n \n" ..
                       "Only Invisible is needed in Giddeus. \n \n",
                onmob_target = {"Uu Zhoumo"},
                trigger_on_event_id = {42},
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Giddeus", type = 'arrow', center = { x = -100.0, y = -0.4, z = 406.0 }, size = 4, direction = "down", floor_id = 1, colour = "cyan" },
                    { zone_name = "Giddeus", type = 'arrow', center = { x = -101.7, y = -0.2, z = 382.9 }, size = 4, direction = "left", floor_id = 1, colour = "cyan" },
                    { zone_name = "Giddeus", type = 'arrow', center = { x = -139.4, y = 0.4, z = 374.9 }, size = 4, direction = "down", floor_id = 1, colour = "cyan" },
                    { zone_name = "Giddeus", type = 'arrow', center = { x = -147.9, y = 3.9, z = 331.2 }, size = 4, direction = "sw", floor_id = 1, colour = "cyan" },
                    { zone_name = "Giddeus", type = 'arrow', center = { x = -182.4, y = 3.1, z = 292.4 }, size = 4, direction = "down", floor_id = 1, colour = "cyan" },
                    { zone_name = "Giddeus", type = 'arrow', center = { x = -169.8, y = 0.2, z = 260.3 }, size = 4, direction = "right", floor_id = 1, colour = "cyan" },
                    { zone_name = "Giddeus", type = 'arrow', center = { x = -139.7, y = -2.8, z = 246.4 }, size = 4, direction = "down", floor_id = 1, colour = "cyan" },
                    { zone_name = "Giddeus", type = 'arrow', center = { x = -140.2, y = -4.0, z = 201.0 }, size = 4, direction = "down", floor_id = 1, colour = "cyan" },
                    { zone_name = "Giddeus", type = 'arrow', center = { x = -143.1, y = 0.6, z = 147.2 }, size = 4, direction = "down", floor_id = 1, colour = "cyan" },
                    { zone_name = "Giddeus", type = 'arrow', center = { x = -130.7, y = -1.0, z = 100.3 }, size = 4, direction = "right", floor_id = 1, colour = "cyan" },
                    { zone_name = "Giddeus", type = 'arrow', center = { x = -99.7, y = -1.1, z = 73.1 }, size = 4, direction = "sw", floor_id = 1, colour = "cyan" },
                    { zone_name = "Giddeus", type = 'arrow', center = { x = -141.1, y = -1.0, z = 51.4 }, size = 4, direction = "down", floor_id = 1, colour = "cyan" },
                    { zone_name = "Giddeus", type = 'arrow', center = { x = -146.3, y = -1.2, z = 21.2 }, size = 4, direction = "left", floor_id = 1, colour = "cyan" },
                    { zone_name = "Giddeus", type = 'arrow', center = { x = -220.0, y = 8.1, z = 28.5 }, size = 4, direction = "up", floor_id = 2, colour = "cyan" },
                    { zone_name = "Giddeus", type = 'arrow', center = { x = -207.2, y = 8.0, z = 59.2 }, size = 4, direction = "right", floor_id = 2, colour = "cyan" },
                    { zone_name = "Giddeus", type = 'arrow', center = { x = -161.5, y = 17.0, z = 60.0 }, size = 4, direction = "right", floor_id = 2, colour = "cyan" },
                    { zone_name = "Giddeus", type = 'arrow', center = { x = -140.1, y = 17.0, z = 62.3 }, size = 4, direction = "up", floor_id = 2, colour = "cyan" },
                    { zone_name = "Giddeus", type = 'arrow', center = { x = -136.4, y = 17.3, z = 97.9 }, size = 4, direction = "right", floor_id = 2, colour = "cyan" },
                    { zone_name = "Giddeus", type = 'arrow', center = { x = -103.0, y = 16.6, z = 102.2 }, size = 4, direction = "up", floor_id = 2, colour = "cyan" },
                    { zone_name = "Giddeus", type = 'arrow', center = { x = -108.9, y = 16.2, z = 139.3 }, size = 4, direction = "left", floor_id = 2, colour = "cyan" },
                    { zone_name = "Giddeus", type = 'arrow', center = { x = -160.0, y = 17.0, z = 140.1 }, size = 4, direction = "left", floor_id = 2, colour = "cyan" },
                },
                images = {
                      {
                          width    = 512,
                          height   = 512,
                          state    = 3,
                          zone_name = "Giddeus",
                          floor_id = 1,
                          highlights = {
                              { position = "F-8", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 3,
                          zone_name = "Giddeus",
                          floor_id = 15,
                          highlights = {
                              { position = "F-7", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            { -- Step 4
                text = "Step 4: Defeat Zhuu Buxu the Silent twice to obtain 2 Parana Shields. \n \n" ..
                       "From Map 1 take the path at (I-8) down the tunnels, then reach (H-7) on Map 2. \n" ..
                       "WARNING: Zhuu Buxu aggros and links with nearby Yagudo. Respawn is ~5 minutes. \n" ..
                       "(You can give the Shield Offering to Uu Zhoumo while waiting for respawns.) \n \n",
                kill_requirement = {
                    count = 2,
                    enemies = {"Zhuu Buxu the Silent"},
                    zone = "Giddeus",
                    count_party_kills = true,
                    display_only = true,
                },
                items_needed = {
                    { item = "Parana Shield", quantity = 2, on_the_way = true },
                },
                trigger_on_item_obtain = { { item = "Parana Shield", quantity = 2 } },
                onmob_enemy = {"Zhuu Buxu the Silent"},
                onmob_enemy_colour = "red",
                onmob_enemy_size = 2,
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Giddeus", type = 'arrow', center = { x = -180.4, y = 17.0, z = 142.0 }, size = 4, direction = "right", floor_id = 2, colour = "cyan" },
                    { zone_name = "Giddeus", type = 'arrow', center = { x = -99.8, y = 16.1, z = 141.0 }, size = 4, direction = "right", floor_id = 2, colour = "cyan" },
                    { zone_name = "Giddeus", type = 'arrow', center = { x = -33.8, y = 17.3, z = 140.2 }, size = 4, direction = "se", floor_id = 2, colour = "cyan" },
                },
                images = {
                      {
                          width    = 512,
                          height   = 512,
                          state    = 4,
                          zone_name = "Giddeus",
                          floor_id = 1,
                          highlights = {
                              { position = "F-8", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 4,
                          zone_name = "Giddeus",
                          floor_id = 15,
                          highlights = {
                              { position = "H-7", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            { -- Step 5
                text = "Step 5: Return to Mourices in Windurst Woods and trade him both Parana Shields to complete the Windurst leg. \n \n",
                onmob_target = {"Mourices"},
                trigger_on_event_id = {457},
                route_to = "Windurst Woods",
                destination_highlight = {position = "F-10", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                        { zone_name = "Windurst Woods", type = 'arrow', center = { x = -46.6, y = 1.2, z = -49.1 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Windurst Woods", type = 'rect', center = { x = -55.5, y = -1.0, z = -40.5 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'nw' },
                        { zone_name = "Windurst Woods", type = 'rect', center = { x = -52.7, y = -1.0, z = -34.9 }, width = 2.25, height = 2.75, floor_id = 0, colour = "cyan", vertical_axis = 'ne' },
                },
            },
            { -- Step 6
                text = "Step 6: Travel to Bastok. In the Metalworks (2nd floor Consulate of San d'Oria) speak to Savae E Paleade for a cutscene. \n \n" ..
                       "(Reach it via Bastok Markets H-7 -> Metalworks.) \n \n",
                onmob_target = {"Savae E Paleade"},
                trigger_on_event_id = {206},
                route_to = "Metalworks",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                        { zone_name = "Metalworks", type = 'arrow', center = { x = 23.8, y = -14.0, z = -14.7 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Metalworks", type = 'rect', center = { x = 24.0, y = -17.4, z = -23.0 }, width = 4.00, height = 2.75, floor_id = 0, colour = "cyan", vertical_axis = 'ns' },
                },
            },
            { -- Step 7
                text = "Step 7: Enter the Department of Industry (adjacent to the President's Office) and speak to Pius. \n \n",
                onmob_target = {"Pius"},
                trigger_on_event_id = {355},
                route_to = "Metalworks",
                destination_highlight = {position = "J-8", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Metalworks", type = 'arrow', center = { x = 88.9, y = -19.5, z = -0.9 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Metalworks", type = 'rect', center = { x = 88.8, y = -21.7, z = -6.9 }, width = 2.25, height = 2.75, floor_id = 0, colour = "cyan", vertical_axis = 'ns' },
                }
            },
            { -- Step 8
                text = "Step 8: Walk to the Craftsmen's Eatery (Metalworks G-9) and speak to Grohm. \n \n",
                onmob_target = {"Grohm"},
                trigger_on_event_id = {426},
                route_to = "Metalworks",
                destination_highlight = {position = "H-9", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                         { zone_name = "Metalworks", type = 'rect', center = { x = -29.7, y = -11.6, z = -18.3 }, width = 2.50, height = 3.25, floor_id = 0, colour = "cyan", vertical_axis = 'nw' },
                         { zone_name = "Metalworks", type = 'arrow', center = { x = -32.9, y = -10.0, z = -15.4 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                }
            },
            { -- Step 9
                text = "Step 9: Go to Palborough Mines (North Gustaberg K-3) and make your way to the 3rd floor Waughroon Shrine (H-10). \n \n" ..
                       "Enter the Burning Circle for a cutscene and to fight the BCNM: Seeker + Dark Dragon. \n \n" ..
                       "Buffs are removed on entry; Trusts are allowed. (Low level: bring Silent Oils for the Lv21-23 Quadav.) \n" ..
                       "Notes: If you have the Home Point #1 you can teleport right outside the BCNM! \n \n",
                onmob_target = {"palborough-mines-elevator-lever-i8","waughroon-shrine-burning-circle"},
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 59.0, y = 0.4, z = 66.5 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 60.0, y = 0.2, z = 99.6 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 19.2, y = 0.1, z = 118.3 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 62.0, y = 0.9, z = 140.4 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 99.9, y = -0.1, z = 135.7 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 100.5, y = -0.1, z = 87.2 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 99.9, y = 0.2, z = 58.2 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 99.9, y = -7.8, z = -2.0 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 130.7, y = -8.0, z = -20.2 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 140.4, y = -9.5, z = 10.0 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 180.1, y = -14.5, z = 19.1 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 220.3, y = -9.3, z = 33.2 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 206.9, y = -1.2, z = 59.4 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 186.7, y = 0.3, z = 63.1 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },

                    --floor 3
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 186.4, y = -32.0, z = 61.4 }, size = 4, direction = "right", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 219.7, y = -32.0, z = 64.9 }, size = 4, direction = "up", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 219.4, y = -32.0, z = 99.4 }, size = 4, direction = "up", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 216.7, y = -32.0, z = 140.3 }, size = 4, direction = "left", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 180.6, y = -32.0, z = 139.6 }, size = 4, direction = "left", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 139.9, y = -32.0, z = 139.8 }, size = 4, direction = "left", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 111.5, y = -32.0, z = 141.1 }, size = 4, direction = "nw", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 89.9, y = -32.1, z = 143.0 }, size = 4, direction = "sw", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 60.3, y = -32.1, z = 127.2 }, size = 4, direction = "down", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 59.5, y = -31.3, z = 96.7 }, size = 4, direction = "down", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 67.8, y = -31.6, z = 59.6 }, size = 4, direction = "right", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 99.4, y = -32.0, z = 59.1 }, size = 4, direction = "down", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 100.4, y = -31.7, z = 36.6 }, size = 4, direction = "down", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 99.8, y = -31.7, z = 3.2 }, size = 4, direction = "down", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 90.3, y = -32.0, z = -19.6 }, size = 4, direction = "left", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 60.3, y = -32.0, z = -30.7 }, size = 4, direction = "down", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 66.0, y = -32.0, z = -60.0 }, size = 4, direction = "right", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 99.8, y = -32.0, z = -62.3 }, size = 4, direction = "down", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 100.3, y = -32.2, z = -89.8 }, size = 4, direction = "down", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 101.0, y = -32.8, z = -124.5 }, size = 4, direction = "down", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 104.8, y = -38.4, z = -146.9 }, size = 4, direction = "ne", floor_id = 3, colour = "yellow" },

                    --home point
                    { zone_name = "Palborough Mines", type = 'square', center = { x = 109.0, y = -38.4, z = -147.0 }, size = 1, floor_id = 3, colour = "green" },
                },
                trigger_on_event_id = {32001},
                route_to = "Palborough Mines 3",
                destination_highlight = {position = "H-10", offsetX = 16, offsetY = 16},

            },
            { -- Step 10
                text = "Step 10: Return to Savae E Paleade in the Metalworks to receive the Key Item: Kindred Report. \n \n",
                onmob_target = {"Savae E Paleade"},
                trigger_on_event_id = {207},
                route_to = "Metalworks",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                        { zone_name = "Metalworks", type = 'arrow', center = { x = 23.8, y = -14.0, z = -14.7 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Metalworks", type = 'rect', center = { x = 24.0, y = -17.4, z = -23.0 }, width = 4.00, height = 2.75, floor_id = 0, colour = "cyan", vertical_axis = 'ns' },
                },
            },
            { -- Step 11
                text = "Step 11: Return to Chateau d'Oraguille in Northern San d'Oria and report to Halver to complete the mission. \n \n" ..
                       "(Afterwards you can talk to Curilla to obtain her Alter Ego.) \n \n",
                onmob_target = {"Halver"},
                trigger_on_event_id = {507},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "Rank 3, 3000 gil, Key Item: Adventurer's Certificate, Title: Certified Adventurer"
        }
    },
    ["3-1: Infiltrate Davoi"] = {
        requirements = {
            level = 35,
        },
        prerequisites = {
            {any = {
                {category = "Missions", subfile = "SanDoria", name = "2-3b: Journey Abroad - Bastok -> Windurst"},
                {category = "Missions", subfile = "SanDoria", name = "2-3b: Journey Abroad - Windurst -> Bastok"},
            }},
        },
        steps = {
            { -- Step 1
                text = "Step 1: Talk to a San d'Orian Gate Guard to accept the mission. \n \n" ..
                       "Southern San d'Oria: Ambrotien or Endracion (F-9 / K-10). \n" ..
                       "Northern San d'Oria: Grilau (D-8). \n \n" ..
                       "(Level 35+. Trade 1 stack of crystals if you need the rank points to unlock it.) \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                --trigger_on_event_id = {1009, 2009},
                trigger_on_talk = " as soon as you're presentable!",
                zone_max_distance = 40,
                visual_zones = {
                    -- Green Square around
                    --Aravoge, T.K for crystal trades
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = -104.9, y = 0.0, z = -53.1 }, size = 1, floor_id = 0, colour = "green" },
                    --Arpevion, T.K
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = 105.2, y = 0.0, z = -53.0 }, size = 1, floor_id = 0, colour = "green" },
                    --Achantere, T.K
                    { zone_name = "Northern San d'Oria", type = 'square', center = { x = -247.2, y = 7.0, z = 40.9 }, size = 1, floor_id = 0, colour = "green" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "F-9", offsetX = 16, offsetY = 16 },
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 2
                text = "Step 2: Enter Chateau d'Oraguille (Northern San d'Oria, I-7) and examine the Door: Prince Royal's Rm (H-7) to speak with Prince Trion. \n \n",
                onmob_target = {"Door: Prince Royals Rm"},
                trigger_on_event_id = {553},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "H-7", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                        { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -8.2, y = 0.0, z = -3.7 }, size = 3, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -16.4, y = 0.0, z = -3.2 }, size = 3, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -16.1, y = -3.0, z = 35.2 }, size = 3, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -16.9, y = -3.0, z = 68.1 }, size = 3, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -37.7, y = -3.0, z = 67.4 }, size = 3, direction = "up", floor_id = 0, colour = "yellow" },
                },
            },
            { -- Step 3
                text = "Step 3: Travel to Davoi (enter from Jugner Forest at G-12). A cutscene plays automatically when you zone in. \n \n" ..
                       "WARNING: Orcs in Davoi detect by sight - keep Invisible up. \n \n",
                trigger_on_event_id = {116},
                route_to = "Davoi",
                zone_trigger = "Davoi",
            },
            { -- Step 4
                text = "Step 4: Find Quemaricond(hes patrols!) near the bridge (H-7) and talk to him for the Key Item: Royal Knights' Davoi Report. \n \n",
                onmob_target = {"Quemaricond"},
                trigger_on_event_id = {117},
                route_to = "Davoi",
                destination_highlight = {position = "H-7", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                        { zone_name = "Davoi", type = 'arrow', center = { x = 217.1, y = -0.6, z = -12.0 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Davoi", type = 'arrow', center = { x = 215.8, y = 4.0, z = -76.2 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Davoi", type = 'arrow', center = { x = 164.1, y = 3.9, z = -82.6 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Davoi", type = 'arrow', center = { x = 139.7, y = 1.3, z = -50.5 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Davoi", type = 'arrow', center = { x = 137.1, y = -0.1, z = -19.7 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Davoi", type = 'arrow', center = { x = 88.8, y = -0.4, z = -18.8 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Davoi", type = 'arrow', center = { x = 74.5, y = -0.8, z = -18.8 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                },
            },
            { -- Step 5
                text = "Step 5: Return to San d'Oria and deliver the report to Prince Trion. \n \n" ..
                       "Chateau d'Oraguille - examine the Door: Prince Royal's Rm (H-7) again to complete the mission. \n \n",
                onmob_target = {"Door: Prince Royals Rm"},
                trigger_on_event_id = {554},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "H-7", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                        { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -8.2, y = 0.0, z = -3.7 }, size = 3, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -16.4, y = 0.0, z = -3.2 }, size = 3, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -16.1, y = -3.0, z = 35.2 }, size = 3, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -16.9, y = -3.0, z = 68.1 }, size = 3, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -37.7, y = -3.0, z = 67.4 }, size = 3, direction = "up", floor_id = 0, colour = "yellow" },
                },
            },
        },
        reward = {
            text = "Rank Points"
        }
    },
    ["3-2: The Crystal Spring"] = {
        prerequisites = {
            {category = "Missions", subfile = "SanDoria", name = "3-1: Infiltrate Davoi"},
        },
        steps = {
            { -- Step 1
                text = "Step 1: Talk to a San d'Orian Gate Guard to accept the mission. \n \n" ..
                       "Southern San d'Oria: Ambrotien or Endracion (F-9 / K-10). \n" ..
                       "Northern San d'Oria: Grilau (D-8). \n \n" ..
                       "(Level 35. Trade 1 stack of crystals to skip this quest!) \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                --trigger_on_event_id = {1009, 2009},
                trigger_on_talk = " should you need help finding and choosing your gear.",
                zone_max_distance = 40,
                visual_zones = {
                    -- Green Square around
                    --Aravoge, T.K for crystal trades
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = -104.9, y = 0.0, z = -53.1 }, size = 1, floor_id = 0, colour = "green" },
                    --Arpevion, T.K
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = 105.2, y = 0.0, z = -53.0 }, size = 1, floor_id = 0, colour = "green" },
                    --Achantere, T.K
                    { zone_name = "Northern San d'Oria", type = 'square', center = { x = -247.2, y = 7.0, z = 40.9 }, size = 1, floor_id = 0, colour = "green" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "F-9", offsetX = 16, offsetY = 16 },
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 2
                text = "Step 2: Grab A Fishing Rod and Bait! \n \n" ..
                       "Fish one at the Crystwater Spring in Jugner Forest (J-9), on the zone's eastern edge - using a Halycon/Carbon/Hume Rod and Minnow. \n" ..
                       "(Alternatively, buy a Crystal Bass from the Auction House [Food -> Fish]. Extra fish can be used for repeats.) \n \n",
                items_needed = { "TaruTaru Fishing Rod", "Minnow" },
                onmob_target = "Babubu",
                trigger_on_item_obtain = {"Tarutaru Fishing Rod","Minnow"},
                --trigger_on_item_obtain = {"Crystal Bass"},
                skip_if_have = { item = "Crystal Bass" },
                require_all_items = true,
                route_to = "Port Windurst",
                destination_highlight = {position = "C-8", offsetX = 16, offsetY = 16},
            },
            { -- Step 3
                text = "Step 3: Obtain a Crystal Bass. \n \n" ..
                       "Fish one at the Crystwater Spring in Jugner Forest (J-9), on the zone's eastern edge - using a Tarutaru Fishing Rod and Minnow. \n" ..
                       "(Alternatively, buy a Crystal Bass from the Auction House [Food -> Fish]. Extra fish can be used for repeats.) \n \n",
                items_needed = {
                    "Crystal Bass",
                },
                zone_max_distance = 50,
                visual_zones = {

                    -- Route through Jugner Forest
                    { zone_name = "Jugner Forest", type = 'arrow', center = { x = -565.7, y = -0.2, z = -441.9 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Jugner Forest", type = 'arrow', center = { x = -522.0, y = 0.2, z = -432.8 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Jugner Forest", type = 'arrow', center = { x = -463.7, y = 0.8, z = -431.7 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Jugner Forest", type = 'arrow', center = { x = -418.8, y = 0.5, z = -430.7 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Jugner Forest", type = 'arrow', center = { x = -378.1, y = -0.7, z = -425.2 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Jugner Forest", type = 'arrow', center = { x = -377.6, y = 4.4, z = -386.2 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Jugner Forest", type = 'arrow', center = { x = -370.2, y = 6.9, z = -342.0 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Jugner Forest", type = 'arrow', center = { x = -339.9, y = 6.9, z = -330.8 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Jugner Forest", type = 'arrow', center = { x = -335.2, y = 2.6, z = -268.2 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Jugner Forest", type = 'arrow', center = { x = -298.4, y = 2.3, z = -228.5 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Jugner Forest", type = 'arrow', center = { x = -255.9, y = 0.3, z = -192.4 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Jugner Forest", type = 'arrow', center = { x = -233.9, y = 0.0, z = -166.1 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Jugner Forest", type = 'arrow', center = { x = -183.5, y = 0.8, z = -160.9 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Jugner Forest", type = 'arrow', center = { x = -142.9, y = 0.6, z = -161.9 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Jugner Forest", type = 'arrow', center = { x = -101.7, y = 0.0, z = -168.4 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Jugner Forest", type = 'arrow', center = { x = -73.6, y = 0.3, z = -176.8 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Jugner Forest", type = 'arrow', center = { x = -41.6, y = 0.0, z = -194.4 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Jugner Forest", type = 'arrow', center = { x = -10.4, y = 0.2, z = -205.4 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Jugner Forest", type = 'arrow', center = { x = 22.3, y = 0.7, z = -202.8 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Jugner Forest", type = 'arrow', center = { x = 61.0, y = 0.9, z = -201.0 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Jugner Forest", type = 'arrow', center = { x = 76.6, y = 0.0, z = -198.1 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Jugner Forest", type = 'arrow', center = { x = 100.5, y = -0.4, z = -171.6 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Jugner Forest", type = 'arrow', center = { x = 119.3, y = 0.0, z = -161.2 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Jugner Forest", type = 'arrow', center = { x = 129.2, y = 1.5, z = -164.9 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Jugner Forest", type = 'arrow', center = { x = 124.7, y = 0.1, z = -201.0 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Jugner Forest", type = 'arrow', center = { x = 143.6, y = 0.3, z = -230.6 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Jugner Forest", type = 'arrow', center = { x = 161.6, y = 0.3, z = -190.2 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Jugner Forest", type = 'arrow', center = { x = 162.8, y = 0.1, z = -153.1 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Jugner Forest", type = 'arrow', center = { x = 171.7, y = -0.8, z = -128.7 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Jugner Forest", type = 'arrow', center = { x = 215.3, y = -0.0, z = -126.0 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Jugner Forest", type = 'arrow', center = { x = 247.5, y = 0.2, z = -156.7 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Jugner Forest", type = 'arrow', center = { x = 269.5, y = -1.1, z = -176.9 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                -- Lake for fishies
                    { zone_name = "Jugner Forest", type = 'square', center = { x = 302.5, y = 1.9, z = -179.9 }, size = 22, floor_id = 0, colour = "magenta" },

                },
                trigger_on_item_obtain = {"Crystal Bass"},
                route_to = "Jugner Forest",
                destination_highlight = {position = "J-9", offsetX = 16, offsetY = 16},
            },
            { -- Step 4
                text = "Step 4: Return to San d'Oria and trade the Crystal Bass to a Gate Guard. \n \n" ..
                       "Ambrotien or Endracion (Southern, F-9 / K-10), or Grilau (Northern, D-8). \n \n" ..
                       "NOTE: On a repeat run, trading the Crystal Bass to a guard completes the mission immediately - skip the rest. \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                trigger_on_event_id = {1030, 2030},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "F-9", offsetX = 16, offsetY = 16 },
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 5
                text = "Step 5: Enter Chateau d'Oraguille (Northern San d'Oria, I-7). \n \n" ..
                       "A cutscene plays automatically on entry, between Halver, Curilla, and the Papsque. \n \n",
                trigger_on_event_id = {555},
                route_to = "Chateau d'Oraguille",
                zone_trigger = "Chateau d'Oraguille",
            },
            { -- Step 6
                text = "Step 5: Talk to the royal gardener Chalvatot (F-7) in Chateau d'Oraguille to complete the mission. \n \n",
                onmob_target = {"Chalvatot"},
                trigger_on_event_id = {556},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "F-7", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -5.9, y = 0.0, z = -4.0 }, size = 3, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -15.4, y = 0.0, z = -6.0 }, size = 3, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -15.8, y = -3.0, z = 35.9 }, size = 3, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -37.3, y = -3.0, z = 35.8 }, size = 3, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -59.6, y = -3.0, z = 35.5 }, size = 3, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -59.7, y = -3.0, z = 52.0 }, size = 3, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -69.6, y = -3.0, z = 51.6 }, size = 3, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -84.1, y = -1.1, z = 57.8 }, size = 3, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -85.2, y = 0.4, z = 77.9 }, size = 3, direction = "left", floor_id = 0, colour = "yellow" },
                },
            },
        },
        reward = {
            text = "Rank Points"
        }
    },
    ["3-3: Appointment to Jeuno"] = {
        requirements = {
            level = 40,
        },
        prerequisites = {
            {category = "Missions", subfile = "SanDoria", name = "3-1: Infiltrate Davoi"},
        },
        steps = {
            { -- Step 1
                text = "Step 1: Talk to a San d'Orian Gate Guard to accept the mission. \n \n" ..
                       "Southern San d'Oria: Ambrotien or Endracion (F-9 / K-10). \n" ..
                       "Northern San d'Oria: Grilau (D-8). \n \n" ..
                       "(Level 40. Requires Mission 3-1. Trade 1 stack of crystals or repeat a mission once if short on rank points.) \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                trigger_on_talk = " Monarlais Halver will tell you all you need to know.",
                zone_max_distance = 40,
                visual_zones = {
                    -- Green Square around
                    --Aravoge, T.K for crystal trades
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = -104.9, y = 0.0, z = -53.1 }, size = 1, floor_id = 0, colour = "green" },
                    --Arpevion, T.K
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = 105.2, y = 0.0, z = -53.0 }, size = 1, floor_id = 0, colour = "green" },
                    --Achantere, T.K
                    { zone_name = "Northern San d'Oria", type = 'square', center = { x = -247.2, y = 7.0, z = 40.9 }, size = 1, floor_id = 0, colour = "green" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "F-9", offsetX = 16, offsetY = 16 },
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 2
                text = "Step 2: Enter Chateau d'Oraguille (Northern San d'Oria, I-7) and speak with Halver until you get the dialogue starting with \"I've been waiting for you.\" \n \n",
                onmob_target = {"Halver"},
                trigger_on_event_id = {508},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
            },
            { -- Step 3
                text = "Step 3: Examine the Door: Great Hall behind Halver for a cutscene with His Majesty Destin, and to receive the Key Item: Letter to the Ambassador. \n \n",
                onmob_target = {"Door: Great Hall"},
                trigger_on_event_id = {537},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -0.2, y = 0.0, z = 3.1 }, size = 2, direction = "up", floor_id = 0, colour = "yellow" },
                },
            },
            { -- Step 4
                text = "Step 4: Travel to Ru'Lude Gardens in Jeuno and talk to Nelcabrit (G-9) at the San d'Oria embassy for a cutscene. \n \n",
                onmob_target = {"Nelcabrit"},
                trigger_on_event_id = {42},
                route_to = "Ru'Lude Gardens",
                destination_highlight = {position = "G-9", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Ru'Lude Gardens", type = 'arrow', center = { x = -0.3, y = 3.0, z = -6.3 }, size = 4, direction = "down", floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Lude Gardens", type = 'arrow', center = { x = -2.1, y = 9.0, z = -31.7 }, size = 4, direction = "sw", floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Lude Gardens", type = 'arrow', center = { x = -8.3, y = 9.0, z = -49.9 }, size = 4, direction = "left", floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Lude Gardens", type = 'rect', center = { x = -24.4, y = 7.4, z = -50.0 }, width = 3.00, height = 3.25, floor_id = 0, colour = "cyan", vertical_axis = 'z' },
                },
            },
            { -- Step 5
                text = "Step 5: Travel to Qufim Island and enter Lower Delkfutt's Tower (F-6). \n" ..
                       "Tip: Unity Warp / Home Point to Qufim Island for quickness. \n \n",
                zone_trigger = "Lower Delkfutt's Tower",
                route_to = "Qufim Island",
                destination_highlight = {position = "F-6", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 6: Navigate Delkfutt's Tower to Floor 10 - Upper Delkfutt's Tower. \n" ..
                       "Recommended: Level 40+ with Sneak and Invisible, or level 50+. \n \n" ..
                       "1st Floor : Go to (E-6/F-6) Stairs (NW). \n" ..
                       "2nd Floor : (I-9/J-9) Stairs - avoid (H-9). \n" ..
                       "3rd Floor : (G-6) Teleporter. \n" ..
                       "4th Floor : (I-6) Stairs - long way around. \n" ..
                       "5th Floor : (H-9) Stairs. \n" ..
                       "6th Floor : (J-10) Teleporter. \n" ..
                       "7th Floor : (F-6/F-7) Stairs (NW). \n" ..
                       "8th Floor : (1st pass) (I-6) Stairs. \n" ..
                       "9th Floor : (1st pass) (J-10) - do NOT drop at (H-10). \n" ..
                       "8th Floor : (2nd pass) (F-9/G-10) -> 9th Floor. \n" ..
                       "9th Floor : (2nd pass) (F-6) -> 10th Floor Teleport. \n \n",
                zone_trigger = "Upper Delkfutt's Tower",
                zone_max_distance = 35,
                visual_zones = {
                    --Survival Guide
                    { zone_name = "Lower Delkfutt's Tower", type = 'square', center = { x = 464.0, y = 0.0, z = -51.0 }, size = 1, floor_id = 1, colour = "green" },
                    --1st floor
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 460.7, y = 0.0, z = -59.7 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 529.3, y = 0.1, z = -76.4 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 542.3, y = 0.0, z = -51.5 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 569.9, y = 0.1, z = -36.0 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 579.5, y = 0.0, z = -8.9 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 579.3, y = 0.0, z = 20.2 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 577.5, y = 0.0, z = 67.0 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 548.1, y = -0.0, z = 95.6 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 515.4, y = 0.0, z = 130.1 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 460.2, y = 0.0, z = 139.9 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 412.8, y = 0.0, z = 139.3 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 396.1, y = 0.6, z = 118.4 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 394.4, y = 0.6, z = 92.3 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 391.1, y = 0.5, z = 74.2 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 378.5, y = 0.4, z = 73.1 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 350.8, y = -7.7, z = 82.1 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },

                    --2nd floor
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 377.1, y = -15.9, z = 95.4 }, size = 4, direction = "right", floor_id = 2, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 405.5, y = -15.5, z = 100.1 }, size = 4, direction = "right", floor_id = 2, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 459.3, y = -16.0, z = 109.1 }, size = 4, direction = "up", floor_id = 2, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 474.1, y = -16.0, z = 140.4 }, size = 4, direction = "right", floor_id = 2, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 514.6, y = -16.0, z = 131.3 }, size = 4, direction = "se", floor_id = 2, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 538.5, y = -16.0, z = 107.3 }, size = 4, direction = "se", floor_id = 2, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 558.3, y = -16.0, z = 99.6 }, size = 4, direction = "right", floor_id = 2, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 578.9, y = -16.0, z = 94.0 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 579.7, y = -16.0, z = 61.3 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 580.6, y = -16.0, z = 18.3 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 569.8, y = -16.0, z = -58.4 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 528.4, y = -16.0, z = -50.1 }, size = 4, direction = "up", floor_id = 2, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 516.1, y = -27.0, z = -50.3 }, size = 4, direction = "right", floor_id = 2, colour = "yellow" },

                    --1st teleporter
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 529.5, y = -32.0, z = -36.5 }, size = 4, direction = "ne", floor_id = 3, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 539.0, y = -32.0, z = -11.8 }, size = 4, direction = "up", floor_id = 3, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 540.1, y = -31.6, z = 20.9 }, size = 4, direction = "up", floor_id = 3, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 530.5, y = -32.0, z = 71.9 }, size = 4, direction = "left", floor_id = 3, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 472.9, y = -31.6, z = 69.8 }, size = 4, direction = "sw", floor_id = 3, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 440.6, y = -31.5, z = 44.6 }, size = 4, direction = "nw", floor_id = 3, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 409.9, y = -31.4, z = 59.7 }, size = 4, direction = "nw", floor_id = 3, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 395.1, y = -31.5, z = 75.1 }, size = 4, direction = "ne", floor_id = 3, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 403.0, y = -33.8, z = 82.5 }, size = 4, direction = "ne", floor_id = 3, colour = "yellow" },

                    --middle delkfutts tower
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -41.6, y = -47.9, z = 70.3 }, size = 4, direction = "left", floor_id = 4, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -59.1, y = -48.0, z = 55.9 }, size = 4, direction = "down", floor_id = 4, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -48.5, y = -48.0, z = 21.4 }, size = 4, direction = "right", floor_id = 4, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -19.8, y = -48.0, z = 20.0 }, size = 4, direction = "down", floor_id = 4, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -32.5, y = -47.7, z = -37.1 }, size = 4, direction = "down", floor_id = 4, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -21.9, y = -48.0, z = -59.6 }, size = 4, direction = "right", floor_id = 4, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = 20.5, y = -47.6, z = -59.9 }, size = 4, direction = "right", floor_id = 4, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = 73.4, y = -48.0, z = -60.9 }, size = 4, direction = "right", floor_id = 4, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = 99.3, y = -48.0, z = -51.9 }, size = 4, direction = "up", floor_id = 4, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = 94.8, y = -48.0, z = -19.5 }, size = 4, direction = "left", floor_id = 4, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = 59.0, y = -48.0, z = -19.5 }, size = 4, direction = "up", floor_id = 4, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = 64.3, y = -48.0, z = 20.3 }, size = 4, direction = "right", floor_id = 4, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = 99.3, y = -47.6, z = 27.2 }, size = 4, direction = "up", floor_id = 4, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = 96.0, y = -48.0, z = 70.8 }, size = 4, direction = "left", floor_id = 4, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = 80.6, y = -56.2, z = 88.8 }, size = 4, direction = "right", floor_id = 4, colour = "yellow" },

                    -- middle delkfutts 2nd floor
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = 71.7, y = -63.7, z = 62.2 }, size = 4, direction = "left", floor_id = 5, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = 19.2, y = -64.0, z = 60.6 }, size = 4, direction = "left", floor_id = 5, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -25.7, y = -64.0, z = 60.4 }, size = 4, direction = "nw", floor_id = 5, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -48.5, y = -63.8, z = 76.5 }, size = 4, direction = "sw", floor_id = 5, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -60.0, y = -64.0, z = 41.0 }, size = 4, direction = "down", floor_id = 5, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -59.7, y = -64.0, z = 13.7 }, size = 4, direction = "se", floor_id = 5, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -29.4, y = -64.0, z = -6.0 }, size = 4, direction = "se", floor_id = 5, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -20.3, y = -64.0, z = -28.7 }, size = 4, direction = "down", floor_id = 5, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -8.1, y = -70.0, z = -60.1 }, size = 4, direction = "right", floor_id = 5, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = 19.9, y = -72.0, z = -61.3 }, size = 4, direction = "up", floor_id = 5, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = 19.9, y = -76.6, z = -38.1 }, size = 4, direction = "up", floor_id = 5, colour = "yellow" },

                    --middle delkfutts 3rd floor
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = 22.8, y = -80.0, z = -20.1 }, size = 4, direction = "ne", floor_id = 6, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = 53.0, y = -80.0, z = 8.5 }, size = 4, direction = "ne", floor_id = 6, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = 71.6, y = -80.0, z = 20.3 }, size = 4, direction = "right", floor_id = 6, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = 99.9, y = -79.6, z = 18.6 }, size = 4, direction = "down", floor_id = 6, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = 100.9, y = -80.0, z = -23.1 }, size = 4, direction = "sw", floor_id = 6, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = 76.4, y = -79.5, z = -36.7 }, size = 4, direction = "se", floor_id = 6, colour = "yellow" },

                    --middle delkfutts tower 4th floor
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -364.1, y = -95.6, z = -46.4 }, size = 4, direction = "nw", floor_id = 7, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -399.2, y = -95.4, z = -18.2 }, size = 4, direction = "left", floor_id = 7, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -439.9, y = -95.4, z = -15.6 }, size = 4, direction = "nw", floor_id = 7, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -464.9, y = -95.4, z = 23.9 }, size = 4, direction = "nw", floor_id = 7, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -485.5, y = -95.5, z = 44.1 }, size = 4, direction = "up", floor_id = 7, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -488.4, y = -95.7, z = 59.6 }, size = 4, direction = "ne", floor_id = 7, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -485.6, y = -105.2, z = 89.2 }, size = 4, direction = "sw", floor_id = 7, colour = "yellow" },

                    --middle delkfutts tower 5th floor
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -471.7, y = -111.4, z = 64.3 }, size = 4, direction = "right", floor_id = 8, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -430.5, y = -111.4, z = 49.5 }, size = 4, direction = "right", floor_id = 8, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -385.1, y = -111.4, z = 45.0 }, size = 4, direction = "ne", floor_id = 8, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -366.9, y = -111.4, z = 61.7 }, size = 4, direction = "ne", floor_id = 8, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -368.1, y = -121.7, z = 89.2 }, size = 4, direction = "down", floor_id = 8, colour = "yellow" },

                    -- back down
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -350.5, y = -128.0, z = 74.5 }, size = 4, direction = "se", floor_id = 9, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -339.6, y = -128.0, z = 40.0 }, size = 4, direction = "down", floor_id = 9, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -341.0, y = -128.0, z = -4.4 }, size = 4, direction = "down", floor_id = 9, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -348.7, y = -128.0, z = -43.7 }, size = 4, direction = "sw", floor_id = 9, colour = "yellow" },

                    -- back up
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -354.7, y = -118.7, z = -31.9 }, size = 4, direction = "se", floor_id = 8, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -364.2, y = -111.9, z = -49.3 }, size = 4, direction = "sw", floor_id = 8, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -386.5, y = -112.0, z = -60.0 }, size = 4, direction = "left", floor_id = 8, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -419.7, y = -111.6, z = -63.8 }, size = 4, direction = "left", floor_id = 8, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -450.2, y = -112.0, z = -59.8 }, size = 4, direction = "left", floor_id = 8, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -470.3, y = -112.0, z = -50.6 }, size = 4, direction = "up", floor_id = 8, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -489.5, y = -118.7, z = -34.8 }, size = 4, direction = "down", floor_id = 8, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'square', center = { x = -419.9, y = -111.6, z = -59.9 }, size = 4, floor_id = 8, colour = "red" },

                    -- teleporter
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -470.0, y = -128.0, z = -35.3 }, size = 4, direction = "ne", floor_id = 9, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -449.7, y = -128.0, z = -5.2 }, size = 4, direction = "up", floor_id = 9, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -444.8, y = -127.5, z = 35.4 }, size = 4, direction = "ne", floor_id = 9, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -419.6, y = -128.0, z = 53.8 }, size = 4, direction = "up", floor_id = 9, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -421.2, y = -128.0, z = 85.4 }, size = 4, direction = "nw", floor_id = 9, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -433.8, y = -127.9, z = 100.5 }, size = 4, direction = "left", floor_id = 9, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -472.4, y = -128.0, z = 95.3 }, size = 4, direction = "down", floor_id = 9, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -477.5, y = -127.4, z = 77.9 }, size = 4, direction = "nw", floor_id = 9, colour = "yellow" },

                },
                images = {
                    {
                        width     = 512,
                        height    = 512,
                        state     = 6,
                        zone_name = "Lower Delkfutt's Tower",
                        floor_id  = 1,
                        highlights = {
                            { position = "E-6", offsetX = 16, offsetY = 16 },
                            { position = "F-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width     = 512,
                        height    = 512,
                        state     = 6,
                        zone_name = "Lower Delkfutt's Tower",
                        floor_id  = 2,
                        highlights = {
                            { position = "I-9", offsetX = 16, offsetY = 16 },
                            { position = "J-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width     = 512,
                        height    = 512,
                        state     = 6,
                        zone_name = "Lower Delkfutt's Tower",
                        floor_id  = 3,
                        highlights = {
                            { position = "G-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width     = 512,
                        height    = 512,
                        state     = 6,
                        zone_name = "Lower Delkfutt's Tower",
                        floor_id  = 15,
                        highlights = {
                            { position = "I-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width     = 512,
                        height    = 512,
                        state     = 6,
                        zone_name = "Middle Delkfutt's Tower",
                        floor_id  = 4,
                        highlights = {
                            { position = "I-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width     = 512,
                        height    = 512,
                        state     = 6,
                        zone_name = "Middle Delkfutt's Tower",
                        floor_id  = 5,
                        highlights = {
                            { position = "H-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width     = 512,
                        height    = 512,
                        state     = 6,
                        zone_name = "Middle Delkfutt's Tower",
                        floor_id  = 6,
                        highlights = {
                            { position = "J-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width     = 512,
                        height    = 512,
                        state     = 6,
                        zone_name = "Middle Delkfutt's Tower",
                        floor_id  = 7,
                        highlights = {
                            { position = "F-6", offsetX = 16, offsetY = 16 },
                            { position = "F-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width     = 512,
                        height    = 512,
                        state     = 6,
                        zone_name = "Middle Delkfutt's Tower",
                        floor_id  = 8,
                        highlights = {
                            { position = "I-6", offsetX = 16, offsetY = 16 },
                            { position = "F-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width     = 512,
                        height    = 512,
                        state     = 6,
                        zone_name = "Middle Delkfutt's Tower",
                        floor_id  = 9,
                        highlights = {
                            { position = "J-10", offsetX = 16, offsetY = 16 },
                            { position = "F-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 7: Kill Porphyrion at (H-8) on Floor 10 to obtain a Delkfutt Key. \n \n" ..
                       "Porphyrion drops 6 keys and respawns in ~10 minutes. \n \n" ..
                       "Note: Uses Eagle Eye Shot - be careful! Recommended level 50+. \n" ..
                       "After defeating it, click the ??? that appears to receive the KI:Delkfutt Key. \n \n",
                items_needed = {"Delkfutt Key"},
                trigger_on_item_obtain = {"Delkfutt Key"},
                onmob_enemy = {"Porphyrion"},
                onmob_enemy_size = 4,
                zone_max_distance = 35,
                visual_zones = {
                    --upper delk
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = -354.8, y = -144.0, z = 69.9 }, size = 4, direction = "se", floor_id = 1, colour = "yellow" },
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = -300.8, y = -144.0, z = 59.7 }, size = 4, direction = "se", floor_id = 1, colour = "yellow" },
                    { zone_name = "Upper Delkfutt's Tower", type = 'rect', center = { x = -291.6, y = -146.5, z = 51.8 }, width = 5.75, height = 5.00, floor_id = 1, colour = "cyan", vertical_axis = 'nw' },
                },
                images = {
                    {
                        width     = 512,
                        height    = 512,
                        state     = 7,
                        zone_name = "Upper Delkfutt's Tower",
                        floor_id  = 1,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 8: Trade the Delkfutt Key to the circular Elevator at (H-8) in the same room. \n" ..
                       "This will take you down a winding stairwell to the basement. \n \n",
                trigger_on_event_id = {1, 6},
                onmob_target = {"Elevator"},
                images = {
                    {
                        width     = 512,
                        height    = 512,
                        state     = 8,
                        zone_name = "Upper Delkfutt's Tower",
                        floor_id  = 1,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 9
                text = "Step 9: Descend to the Lower Delkfutt's Tower basement and enter through the Cermet Door. \n" ..
                       "At Floor 10, use the Elevator platform (H-8) to drop to the blind staircase, then spiral down through Middle and Lower Delkfutt's Tower to the basement. \n \n" ..
                       "Cross the large basement room and trade (or use) your Delkfutt Key on the Cermet Door at (M-8) for a cutscene. \n \n",
                onmob_target = {"lower-delkfutt-tower-cermet-door-m8"},
                trigger_on_event_id = {0, "Lower Delkfutt's Tower"},
                zone_max_distance = 20,
                visual_zones = {
                    --Down the tower 4 id
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = -309.7, y = -116.1, z = 21.1 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = -290.6, y = -106.7, z = 24.8 }, size = 4, direction = "nw", floor_id = 4, colour = "yellow" },

                    --5
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = 9.7, y = -100.7, z = 23.3 }, size = 4, direction = "down", floor_id = 5, colour = "yellow" },
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = 29.6, y = -93.5, z = 13.3 }, size = 4, direction = "up", floor_id = 5, colour = "yellow" },
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = 10.5, y = -82.7, z = 15.1 }, size = 4, direction = "se", floor_id = 5, colour = "yellow" },
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = 13.9, y = -65.2, z = 9.6 }, size = 4, direction = "right", floor_id = 5, colour = "yellow" },
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = 25.8, y = -46.5, z = 11.7 }, size = 4, direction = "ne", floor_id = 5, colour = "yellow" },

                    --6
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = 250.1, y = -37.5, z = 26.6 }, size = 4, direction = "down", floor_id = 6, colour = "yellow" },
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = 264.3, y = -25.0, z = 29.9 }, size = 4, direction = "left", floor_id = 6, colour = "yellow" },
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = 262.9, y = -8.7, z = 29.4 }, size = 4, direction = "left", floor_id = 6, colour = "yellow" },
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = 257.8, y = 8.5, z = 29.9 }, size = 4, direction = "left", floor_id = 6, colour = "yellow" },
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = 272.9, y = 19.1, z = 20.6 }, size = 4, direction = "right", floor_id = 6, colour = "yellow" },
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = 313.4, y = 16.0, z = 19.7 }, size = 4, direction = "right", floor_id = 6, colour = "yellow" },
                    { zone_name = "Upper Delkfutt's Tower", type = 'rect', center = { x = 320.0, y = 13.5, z = 20.0 }, width = 5.50, height = 5.00, floor_id = 6, colour = "cyan", vertical_axis = 'z' },

                    -- final door for mission
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 525.8, y = 16.0, z = 20.0 }, size = 4, direction = "right", floor_id = 15, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 541.8, y = 16.0, z = 20.3 }, size = 4, direction = "right", floor_id = 15, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 579.6, y = 16.5, z = 26.9 }, size = 4, direction = "right", floor_id = 15, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 604.6, y = 16.1, z = 30.1 }, size = 4, direction = "se", floor_id = 15, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 627.4, y = 16.0, z = 20.2 }, size = 4, direction = "right", floor_id = 15, colour = "yellow" },

                },
                images = {
                    {
                        width     = 512,
                        height    = 512,
                        state     = 9,
                        zone_name = "Upper Delkfutt's Tower",
                        floor_id  = 4,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width     = 512,
                        height    = 512,
                        state     = 9,
                        zone_name = "Upper Delkfutt's Tower",
                        floor_id  = 5,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width     = 512,
                        height    = 512,
                        state     = 9,
                        zone_name = "Upper Delkfutt's Tower",
                        floor_id  = 6,
                        highlights = {
                            { position = "J-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width     = 512,
                        height    = 512,
                        state     = 9,
                        zone_name = "Lower Delkfutt's Tower",
                        floor_id  = 1,
                        highlights = {
                            { position = "E-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width     = 512,
                        height    = 512,
                        state     = 9,
                        zone_name = "Lower Delkfutt's Tower",
                        floor_id  = 15,
                        highlights = {
                            { position = "M-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 10
                text = "Step 10: Return to the San d'Oria embassy in Ru'Lude Gardens (G-9) and speak to Nelcabrit, the receptionist, for a cutscene. \n \n",
                onmob_target = {"Nelcabrit"},
                trigger_on_event_id = {140},
                route_to = "Ru'Lude Gardens",
                destination_highlight = {position = "G-9", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Ru'Lude Gardens", type = 'arrow', center = { x = -0.3, y = 3.0, z = -6.3 }, size = 4, direction = "down", floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Lude Gardens", type = 'arrow', center = { x = -2.1, y = 9.0, z = -31.7 }, size = 4, direction = "sw", floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Lude Gardens", type = 'arrow', center = { x = -8.3, y = 9.0, z = -49.9 }, size = 4, direction = "left", floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Lude Gardens", type = 'rect', center = { x = -24.4, y = 7.4, z = -50.0 }, width = 3.00, height = 3.25, floor_id = 0, colour = "cyan", vertical_axis = 'z' },
                },
            },
            { -- Step 11
                text = "Step 11: Examine the ambassador's office door next to Nelcabrit to receive your reward and complete the mission. \n \n",
                onmob_target = {"Door: San dOrian Embassy"},
                trigger_on_event_id = {39},
                route_to = "Ru'Lude Gardens",
                destination_highlight = {position = "G-9", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Ru'Lude Gardens", type = 'arrow', center = { x = -35.3, y = 9.0, z = -56.5 }, size = 3, direction = "down", floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Lude Gardens", type = 'rect', center = { x = -35.1, y = 7.5, z = -59.9 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'ns' },
                },
            },
        },
        reward = {
            text = "Rank 4, 5000 gil"
        }
    },
    ["4-1: Magicite"] = {
        requirements = {
            level = 40,
            fame  = {area = "Jeuno", level = 3},
        },
        prerequisites = {
            {category = "Missions", subfile = "SanDoria", name = "3-3: Appointment to Jeuno"},
            {category = "Quests", subfile = "Lower Jeuno", name = "Tenshodo Membership"},
        },
        steps = {
            -- PREREQUISITES
            {
                text = "Step 1: This mission requires Rank 4. Ensure your Rank Points are high (nearly or completely full) by completing repeatable missions or trading 2 stacks of crystals to a Conquest Overseer. \n \n" ..
                       "Morlepiche (H-10) in upper Ru'Lude Gardens accepts crystals. \n \n" ..
                       "Go to the San d'Oria Embassy and speak with Nelcabrit (G-9) to start the mission. \n \n" ..
                       "Note: Unlike most missions, this is NOT offered by Gate Guards.",
                onmob_target = {"Nelcabrit"},
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Ru'Lude Gardens", type = 'square', center = { x = -4.9, y = 0.0, z = -79.3 }, size = 1, floor_id = 0, colour = "green" },
                    { zone_name = "Ru'Lude Gardens", type = 'arrow', center = { x = -0.3, y = 3.0, z = -6.3 }, size = 4, direction = "down", floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Lude Gardens", type = 'arrow', center = { x = -2.1, y = 9.0, z = -31.7 }, size = 4, direction = "sw", floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Lude Gardens", type = 'arrow', center = { x = -8.3, y = 9.0, z = -49.9 }, size = 4, direction = "left", floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Lude Gardens", type = 'rect', center = { x = -24.4, y = 7.4, z = -50.0 }, width = 3.00, height = 3.25, floor_id = 0, colour = "cyan", vertical_axis = 'z' },
                },
                trigger_on_event_id = {45},
                route_to = "Ru'Lude Gardens",
                destination_highlight = {position = "G-9", offsetX = 16, offsetY = 16},
            },

            -- MISSION START
            {
                text = "Step 2: Next check the San d'Oria Embassy door at (G-9). \n \n" ..
                       "You will receive KI:Archducal Audience Permit.",
                onmob_target = {"Door: San dOrian Embassy"},
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Ru'Lude Gardens", type = 'arrow', center = { x = -35.3, y = 9.0, z = -56.5 }, size = 3, direction = "down", floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Lude Gardens", type = 'rect', center = { x = -35.1, y = 7.5, z = -59.9 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'ns' },
                },
                trigger_on_event_id = {130},
                route_to = "Ru'Lude Gardens",
                destination_highlight = {position = "G-9", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 3: In Ru'Lude Gardens, check the Audience Chamber door at (H-6). \n \n" ..
                       "You will receive KI:Letter to Aldo.",
                onmob_target = {"Door: Audience Chamber"},
                trigger_on_event_id = {128},
                route_to = "Ru'Lude Gardens",
                destination_highlight = {position = "H-6", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 4: Travel to Lower Jeuno and talk to Aldo (J-8) inside Neptune's Spire Inn. \n \n" ..
                       "You will receive KI:Silver Bell. \n \n" ..
                       "NOTE: To access Tenshodo HQ, you need KI:Tenshodo Member's Card from the quests 'Tenshodo Membership'/'Only the Best' OR trade a Tenshodo Invite to Ghebi Damomohe (I-7) with Jeuno Fame 3+. \n \n" ..
                       "You can buy a Tenshodo Invite off the Auction House in the Others > Misc.1 section \n \n" ..
                       "Once you have a Tenshodo Invite simply trade it to Ghebi Damomohe (I-7) - she is behind the counter at the entrance! \n" ..
                       "If on CoP mission 'A Vessel Without a Captain', that scene appears first - talk to Aldo twice. \n \n",
                onmob_target = {"Aldo"},
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Lower Jeuno", type = 'rect', center = { x = 13.8, y = -1.5, z = -2.6 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'nw',  rotation = 15 },
                    { zone_name = "Lower Jeuno", type = 'rect', center = { x = 38.1, y = -1.5, z = -16.6 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'nw', rotation = 15 },
                    { zone_name = "Lower Jeuno", type = 'rect', center = { x = 34.4, y = 2.4, z = -36.4 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'ne', rotation = 15 },
                    { zone_name = "Lower Jeuno", type = 'rect', center = { x = 38.3, y = 1.9, z = -57.8 }, width = 2.25, height = 3.25, floor_id = 0, colour = "cyan", vertical_axis = 'ne', rotation = 15 },
                    { zone_name = "Lower Jeuno", type = 'rect', center = { x = 18.6, y = 2.3, z = -51.9 }, width = 2.50, height = 3.25, floor_id = 0, colour = "cyan", vertical_axis = 'ne', rotation = 15 },
                },
                trigger_on_event_id = {152},
                route_to = "Lower Jeuno",
                destination_highlight = {position = "J-8", offsetX = 16, offsetY = 16},
            },
            -- YAGUDO TORCH
            {
                text = "Step 5: Talk to Paya-Sabya (I-8) in Upper Jeuno. \n" ..
                "Notes: Home Point #3 closest teleport. \n \n",
                onmob_target = {"Paya-Sabya"},
                route_to = "Upper Jeuno",
                destination_highlight = {position = "I-8", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {80},
                trigger_on_keyitem_obtain = {20},
                keyitems_needed = {20,21,46,47},
            },
            {
                text = "Step 6: Talk to Muckvix (H-9) teleport to Home Point#1 in Lower Jeuno and head inside Muckvix's Junk Shop. \n \n" ..
                       "You will receive KI:Yagudo Torch. \n \n",
                onmob_target = {"Muckvix"},
                zone_max_distance = 35,
                route_to = "Lower Jeuno",
                visual_zones = {
                        { zone_name = "Lower Jeuno", type = 'arrow', center = { x = -65.9, y = 6.0, z = -100.9 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                        { zone_name = "Lower Jeuno", type = 'rect', center = { x = -56.7, y = 4.3, z = -109.7 }, width = 2.25, height = 3.25, floor_id = 0, colour = "cyan", vertical_axis = 'nw' },
                },
                destination_highlight = {position = "H-9", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {184},
                trigger_on_keyitem_obtain = {20},
            },

            -- CREST OF DAVOI
            {
                text = "Step 7: Talk to Baudin at (G-7) southwest corner in Upper Jeuno. \n \n",
                onmob_target = {"Baudin"},
                route_to = "Upper Jeuno",
                destination_highlight = {position = "G-7", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {174},
                trigger_on_keyitem_obtain = {21},
            },
            {
                text = "Step 8: Obtain Coeurl Meat by: \n \n" ..
                       "Purchasing from Auction House: Food > Ingredients section! \n \n" ..
                       "Defeating Coeurls (drops from all Coeurls, including in Sauromugue Champaign/Meriphataud Mountains) \n \n",
                items_needed = {
                    "Coeurl Meat"
                },
                trigger_on_item_obtain = {"Coeurl Meat"},
                trigger_on_keyitem_obtain = {21},
                route_to = "Sauromugue Champaign",
                onmob_enemy = {"Champaign Coeurl"},
                destination_highlight = {
                    {position = "J-6", offsetX = 16, offsetY = 16},
                    {position = "K-10", offsetX = 16, offsetY = 16},
                }
            },
            {
                text = "Step 9: Trade Coeurl Meat to Baudin (G-7) in Upper Jeuno. \n \n" ..
                       "You will receive KI:Crest of Davoi. (Completes quest 'Crest of Davoi') \n \n",
                onmob_target = {"Baudin"},
                trigger_on_event_id = {171},
                trigger_on_keyitem_obtain = {21},
                route_to = "Upper Jeuno",
                destination_highlight = {position = "G-7", offsetX = 16, offsetY = 16},
            },

            -- BEADEAUX KEY ITEMS
            {
                text = "Step 10: Talk to Sattal-Mansal (J-8) in Lower Jeuno (outside Aldo's room in basement of Neptune's Spire). \n \n" ..
                       "This initiates quests: 'Mysteries of Beadeaux I' and 'Mysteries of Beadeaux II'. \n \n" ..
                       "He will request: Quadav Charm (Rare/Ex) and Quadav Augury Shell (Rare). \n \n",
                onmob_target = {"Sattal-Mansal"},
                route_to = "Lower Jeuno",
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Lower Jeuno", type = 'rect', center = { x = 13.8, y = -1.5, z = -2.6 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'nw',  rotation = 15 },
                    { zone_name = "Lower Jeuno", type = 'rect', center = { x = 38.1, y = -1.5, z = -16.6 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'nw', rotation = 15 },
                    { zone_name = "Lower Jeuno", type = 'rect', center = { x = 34.4, y = 2.4, z = -36.4 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'ne', rotation = 15 },
                },
                destination_highlight = {position = "J-8", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {89},
                trigger_on_keyitem_obtain = {46},
            },
            {
                text = "Step 11: Travel to Beadeaux. \n \n" ..
                       "Fastest route: Survival Guide to Beadeaux directly, or Outpost to Passhow Marshlands. \n \n",
                zone_trigger = "Beadeaux",
                route_to = "Pashhow Marshlands",
                destination_highlight = {position = "K-11", offsetX = 16, offsetY = 16},
                trigger_on_keyitem_obtain = {46},
            },
            {
                text = "Step 12: In Beadeaux Map 1, head to ramp at (H-7) to enter Map 2. \n \n" ..
                       "In Map 2, examine 'The Mute' at (G-7) to receive Silence effect. \n \n" ..
                       "This allows you to pass 'The Afflictor' without being Cursed. \n \n",
                trigger_on_buff = 6,
                zone_name = "Beadeaux",
                onmob_target = {"The Mute1"},
                zone_max_distance = 35,
                trigger_on_keyitem_obtain = {46},
                visual_zones = {
                        -- survival guide
                        { zone_name = "Beadeaux", type = 'square', center = { x = -264.0, y = 1.6, z = 107.0 }, size = 1, floor_id = 1, colour = "green" },

                        -- to h5 map 1
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -216.2, y = 0.7, z = 96.3 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -181.2, y = 0.7, z = 101.0 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -167.6, y = 1.0, z = 140.3 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -118.7, y = 1.0, z = 135.6 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -61.8, y = 1.0, z = 139.6 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -61.3, y = 1.4, z = 97.1 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },

                        -- to mute1
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -58.7, y = 22.4, z = 90.2 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -62.3, y = 24.1, z = 63.1 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -95.8, y = 24.2, z = 62.4 }, size = 4, direction = "up", floor_id = 2, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -99.3, y = 24.1, z = 86.1 }, size = 4, direction = "up", floor_id = 2, colour = "yellow" },

                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 12,
                        zone_name = "Beadeaux",
                        floor_id = 1,
                        highlights = {
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 12,
                        zone_name = "Beadeaux",
                        floor_id = 15,
                        highlights = {
                            { position = "G-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 13: Whilst Silenced, you can walk through 'The Afflictor' to avoid being CURSED! \n \n" ..
                       "Make your way to (F-8) and back to Map 1. \n \n" ..
                       "Now go to (E-10) and up the ramp to the 2nd Level on Map 1. \n \n",
                trigger_zones = {
                    { type = 'square', center = {  x = -259.9, y = 1, z = -137 }, size = 3  }
                },
                zone_max_distance = 35,
                trigger_on_keyitem_obtain = {46},
                visual_zones = {
                    -- to ramp 1
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -100.8, y = 24.2, z = 95.4 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -91.4, y = 23.9, z = 59.7 }, size = 4, direction = "sw", floor_id = 2, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -99.0, y = 24.1, z = 42.5 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -103.0, y = 24.0, z = 23.3 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -140.4, y = 24.3, z = 26.3 }, size = 4, direction = "up", floor_id = 2, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -156.7, y = 24.1, z = 59.9 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -199.1, y = 24.2, z = 59.9 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -203.4, y = 17.9, z = 20.4 }, size = 4, direction = "ne", floor_id = 2, colour = "yellow" },

                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -216.6, y = 1.0, z = 13.1 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -220.3, y = 1.0, z = -39.0 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -210.4, y = 0.8, z = -65.5 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -175.7, y = 1.0, z = -67.7 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -176.2, y = 1.2, z = -90.3 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -204.9, y = 1.0, z = -117.9 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -231.5, y = 1.0, z = -139.0 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                },
                onmob_target = {"Ramp 1"},
                zone = "Beadeaux",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 13,
                        zone_name = "Beadeaux",
                        floor_id = 1,
                        highlights = {
                            { position = "E-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 13,
                        zone_name = "Beadeaux",
                        floor_id = 15,
                        highlights = {
                            { position = "F-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 14: Defeat De'Vyu Headhunter (I-9) to obtain Quadav Charm (drops up to 4). \n \n" ..
                       "Defeat Go'Bhu Gascon (F-6) to obtain Quadav Augury Shell (drops up to 4). \n \n" ..
                       "Notes: Stay on the 2nd level and run around to the shown coordinates - follow the arrows to each boss! \n \n",
                require_all_items = true,
                zone_max_distance = 35,
                trigger_on_keyitem_obtain = {46},
                visual_zones = {
                        --up ramp to 1st boss
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -262.8, y = -0.4, z = -134.6 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -275.3, y = -3.4, z = -128.8 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -280.2, y = -3.0, z = -183.7 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -279.6, y = -3.0, z = -216.7 }, size = 4, direction = "se", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -244.3, y = -3.0, z = -234.3 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -171.5, y = -3.0, z = -224.2 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -146.8, y = -3.0, z = -211.4 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -114.0, y = -3.1, z = -206.0 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -76.9, y = -3.3, z = -197.9 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -44.8, y = -3.3, z = -196.9 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = 5.4, y = -3.2, z = -158.6 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },

                        -- continue to 2nd boss
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = 14.4, y = -3.1, z = -120.5 }, size = 4, direction = "nw", floor_id = 1, colour = "cyan" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -23.8, y = -3.1, z = -78.2 }, size = 4, direction = "nw", floor_id = 1, colour = "cyan" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -67.8, y = -3.2, z = -45.2 }, size = 4, direction = "left", floor_id = 1, colour = "cyan" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -106.4, y = -3.4, z = -47.0 }, size = 4, direction = "left", floor_id = 1, colour = "cyan" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -147.7, y = -3.2, z = -46.4 }, size = 4, direction = "left", floor_id = 1, colour = "cyan" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -185.6, y = -3.0, z = -32.8 }, size = 4, direction = "up", floor_id = 1, colour = "cyan" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -187.4, y = -3.0, z = 8.3 }, size = 4, direction = "up", floor_id = 1, colour = "cyan" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -179.3, y = -3.0, z = 30.5 }, size = 4, direction = "right", floor_id = 1, colour = "cyan" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -121.3, y = -3.3, z = 36.7 }, size = 4, direction = "right", floor_id = 1, colour = "cyan" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -87.1, y = -3.0, z = 52.2 }, size = 4, direction = "ne", floor_id = 1, colour = "cyan" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -59.5, y = -3.2, z = 81.5 }, size = 4, direction = "ne", floor_id = 1, colour = "cyan" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -37.6, y = -3.4, z = 109.4 }, size = 4, direction = "up", floor_id = 1, colour = "cyan" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -39.4, y = -3.0, z = 144.4 }, size = 4, direction = "nw", floor_id = 1, colour = "cyan" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -61.3, y = -3.2, z = 162.7 }, size = 4, direction = "left", floor_id = 1, colour = "cyan" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -87.0, y = -3.4, z = 162.1 }, size = 4, direction = "nw", floor_id = 1, colour = "cyan" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -114.1, y = -3.0, z = 171.2 }, size = 4, direction = "left", floor_id = 1, colour = "cyan" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -157.6, y = -3.3, z = 162.5 }, size = 4, direction = "left", floor_id = 1, colour = "cyan" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -193.6, y = -3.4, z = 158.3 }, size = 4, direction = "sw", floor_id = 1, colour = "cyan" },
                },
                items_needed = {
                    "Quadav Charm",
                    "Quadav Augury Shell"
                },
                trigger_on_item_obtain = {
                    "Quadav Charm",
                    "Quadav Augury Shell"
                },
                onmob_enemy = {"De'Vyu Headhunter", "Go'Bhu Gascon"},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 14,
                        zone_name = "Beadeaux",
                        floor_id = 1,
                        highlights = {
                             { position = "I-9", offsetX = 16, offsetY = 16, label = "D", color = "yellow" },
                             { position = "F-6", offsetX = 16, offsetY = 16, label = "G", color = "cyan" },
                        },
                    },
                },
            },
            {
                text = "Step 15: Return to Sattal-Mansal (J-8) in Lower Jeuno. \n \n" ..
                       "Trade Quadav Charm -> receive KI:Coruscant Rosary (completes 'Mysteries of Beadeaux I'). \n \n",
                onmob_target = {"Sattal-Mansal"},
                trigger_on_event_id = {91},
                trigger_on_keyitem_obtain = {46},
                route_to = "Lower Jeuno",
                destination_highlight = {position = "J-8", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Lower Jeuno", type = 'rect', center = { x = 13.8, y = -1.5, z = -2.6 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'nw',  rotation = 15 },
                    { zone_name = "Lower Jeuno", type = 'rect', center = { x = 38.1, y = -1.5, z = -16.6 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'nw', rotation = 15 },
                    { zone_name = "Lower Jeuno", type = 'rect', center = { x = 34.4, y = 2.4, z = -36.4 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'ne', rotation = 15 },
                },
            },
            {
                text = "Step 16: Return to Sattal-Mansal (J-8) in Lower Jeuno. \n \n" ..
                        "Trade Quadav Augury Shell -> receive KI:Black Matinee Necklace (completes 'Mysteries of Beadeaux II'). \n \n",
                onmob_target = {"Sattal-Mansal"},
                trigger_on_event_id = {92},
                trigger_on_keyitem_obtain = {47},
                route_to = "Lower Jeuno",
                destination_highlight = {position = "J-8", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Lower Jeuno", type = 'rect', center = { x = 13.8, y = -1.5, z = -2.6 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'nw',  rotation = 15 },
                    { zone_name = "Lower Jeuno", type = 'rect', center = { x = 38.1, y = -1.5, z = -16.6 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'nw', rotation = 15 },
                    { zone_name = "Lower Jeuno", type = 'rect', center = { x = 34.4, y = 2.4, z = -36.4 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'ne', rotation = 15 },
                },
            },
            -- DAVOI - OPTISTONE
            --
            -- From here on, steps carry NO trigger_on_keyitem_obtain skip. That is
            -- deliberate: the magicite (KI 14/15/16) are taken back when the mission
            -- completes, so a repeat runner never holds them and this stretch must be
            -- walked every time. The skips on steps 5-16 work only because the Yagudo
            -- Torch / Crest of Davoi / Coruscant Rosary / Black Matinee Necklace are
            -- kept for good - they are the entry passes to the strongholds.
            -- Rule: skip on key items that SURVIVE completion, never on ones consumed
            -- by it. (KI 14/15/16 do appear on steps 20/24/28, but as ordinary "just
            -- picked it up" triggers within a run, not as skips.)
            {
                text = "Step 17: Travel to Davoi! \n \n" ..
                       "Fastest route: Unity Warp to Jugner Forest, go to (G-12). OR Outpost to Norvallen > Davoi. \n \n",
                route_to = "Jugner Forest",
                destination_highlight = {position = "G-12", offsetX = 16, offsetY = 16},
                zone_trigger = "Davoi",
            },
            {
                text = "Step 18: Navigate to Wall of Dark Arts (G-7) and click! \n \n" ..
                       "You will need the KI:Crest of Davoi to get through. \n \n" ..
                       "Click Yes... Continue into Monastic Cavern. \n \n",
                zone_trigger = "Monastic Cavern",
                onmob_target = {"Wall of Dark Arts"},
                trigger_on_event_id = 54,
                zone_max_distance = 35,
                visual_zones = {
                    --surivial guide
                    { zone_name = "Davoi", type = 'square', center = { x = 223.0, y = -0.3, z = -10.0 }, size = 1, floor_id = 0, colour = "green" },

                    -- to wall of dark arts
                    { zone_name = "Davoi", type = 'arrow', center = { x = 216.3, y = -0.5, z = -13.6 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = 218.7, y = -0.0, z = -43.8 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = 214.9, y = 4.0, z = -76.6 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = 156.6, y = 4.0, z = -77.1 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = 139.6, y = 0.0, z = -41.6 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = 134.8, y = -0.1, z = -19.7 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = 76.2, y = -0.2, z = -18.4 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = 30.3, y = -0.4, z = -25.5 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = -5.6, y = -0.0, z = -22.0 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = -20.5, y = -0.2, z = -20.5 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = -21.9, y = 0.7, z = -48.7 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 18,
                        zone_name = "Davoi",
                        highlights = {
                            { position = "G-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 19: Continue into Monastic Cavern. \n \n",
                zone_trigger = "Monastic Cavern",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 19,
                        zone_name = "Davoi",
                        highlights = {
                            { position = "G-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 20: In Monastic Cavern, check the Magicite at the end of the hall. \n \n" ..
                       "You will receive KI:Magicite: Optistone. \n \n",
                keyitems_needed = {14},
                trigger_on_keyitem_obtain = {14},
                onmob_target = {"Magicite-Monastic"},
                zone_max_distance = 35,
                visual_zones = {
                        { zone_name = "Monastic Cavern", type = 'arrow', center = { x = -152.0, y = -8.5, z = -52.8 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 20,
                        zone_name = "Monastic Cavern",
                        highlights = {
                            { position = "F-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },

            -- BEADEAUX - AURASTONE
            {
                text = "Step 21: Return to Beadeaux! \n \n" ..
                       "Use the Survival Guide or Outpost [Derfland] in Pashhow Marshlands to get there! \n \n",
                zone_trigger = "Beadeaux",
                route_to = "Pashhow Marshlands",
                destination_highlight = {position = "K-11", offsetX = 16, offsetY = 16},
            },
             {
                text = "Step 22: Map 1 go to (H-7). \n \n" ..
                       "Navigate to Qulun Dome entrance at (I-7). \n \n",
                zone_trigger = "Qulun Dome",
                zone_max_distance = 35,
                visual_zones = {
                        -- survival guide
                        { zone_name = "Beadeaux", type = 'square', center = { x = -264.0, y = 1.6, z = 107.0 }, size = 1, floor_id = 1, colour = "green" },

                        -- to h5 map 1
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -216.2, y = 0.7, z = 96.3 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -181.2, y = 0.7, z = 101.0 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -167.6, y = 1.0, z = 140.3 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -118.7, y = 1.0, z = 135.6 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -61.8, y = 1.0, z = 139.6 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -61.3, y = 1.4, z = 97.1 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },

                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -59.2, y = 23.8, z = 62.9 }, size = 4, direction = "right", floor_id = 2, colour = "yellow" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 22,
                        zone_name = "Beadeaux",
                        floor_id = 1,
                        highlights = {
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 22,
                        zone_name = "Beadeaux",
                        floor_id = 15,
                        highlights = {
                            { position = "I-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 23: In Qulun Dome, check the Door (G-8). \n \n" ..
                       "Open the door - you need: KI:Silver Bell, KI:Coruscant Rosary, KI:Black Matinee Necklace. \n \n" ..
                       "Might have to click it twice, till an option: 'Investigate the door?' -  Click Yes! \n \n",
                onmob_target = {"Qulun Door 1"},
                trigger_on_talk = {" shine brightly!"},
                zone = "Qulun Dome",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 23,
                        zone_name = "Qulun Dome",
                        highlights = {
                            { position = "G-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 24: In Qulun Dome, check the Magicite at the end of the hall. \n \n" ..
                       "You will receive KI:Magicite: Aurastone. \n \n",
                keyitems_needed = {15},
                trigger_on_keyitem_obtain = {15},
                onmob_target = {"Magicite-Qulun"},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 24,
                        zone_name = "Qulun Dome",
                        highlights = {
                            { position = "F-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },

            -- CASTLE OZTROJA - ORASTONE
            {
                text = "Step 25: Travel to Castle Oztroja. \n \n"..
                       "Fastest route: Survival Guide to Aragoneu > Castle Oztroja OR outpost to Meriphataud Mountains! \n \n",
                route_to = "Meriphataud Mountains",
                destination_highlight = {position = "L-8", offsetX = 16, offsetY = 16},
                zone_trigger = "Castle Oztroja",
            },
            {
                text = "Step 26: Castle Oztroja Route: \n \n" ..
                       "Navigate through: \n \n" ..
                       "Map 1 (I-8)    -> \n" ..
                       "Map 2 (G-7)    -> \n" ..
                       "Map 6 (I-7)    -> \n" ..
                       "Map 7 (H-9/10) -> Yagudo Torch! \n \n" ..
                       "Notes: One lever opens door, other triggers trapdoor. Correct lever changes each Vana'diel day. \n \n" ..
                       "Stand on trapdoor to use the lever. To avoid trap: Click lever and then RUN off trapdoor immediately. \n \n" ..
                       "If you fall follow the map and click the other lever until you get through! \n \n",
                trigger_on_event_id = {11},
                onmob_target = {"castle-oztroja-handle-1-i8","castle-oztroja-handle-2-i8"},
                zone_name = "Castle Oztroja",
                zone_max_distance = 35,
                visual_zones = {
                    --map 1
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -216.0, y = 0.3, z = -18.2 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -178.6, y = 0.3, z = -12.7 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -178.7, y = 0.3, z = 24.6 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -175.1, y = 0.3, z = 56.8 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -139.7, y = 0.3, z = 58.7 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -141.6, y = 0.1, z = 16.2 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -95.5, y = 0.2, z = 18.6 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -56.6, y = 0.3, z = 19.8 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -20.9, y = 0.3, z = 11.8 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -18.5, y = 0.3, z = -17.6 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },


                    -- map 2
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 19.7, y = 0.3, z = 17.5 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 59.2, y = -4.0, z = 19.9 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 100.3, y = -12.0, z = 19.3 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 97.7, y = -15.8, z = -19.7 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 61.8, y = -15.8, z = -20.2 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 20.7, y = -15.8, z = -22.6 }, size = 4, direction = "up", floor_id = 2, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 22.1, y = -15.8, z = 36.5 }, size = 4, direction = "up", floor_id = 2, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 13.0, y = -15.8, z = 59.1 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -31.8, y = -15.7, z = 59.4 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -71.0, y = -15.8, z = 60.3 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -99.4, y = -15.8, z = 48.1 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -101.7, y = -16.0, z = 27.6 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -150.9, y = -15.8, z = 20.1 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -180.8, y = -15.8, z = 21.8 }, size = 4, direction = "up", floor_id = 2, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -176.5, y = -15.7, z = 61.4 }, size = 4, direction = "right", floor_id = 2, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -140.3, y = -15.8, z = 65.8 }, size = 4, direction = "up", floor_id = 2, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -140.4, y = -15.7, z = 101.1 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },

                    --map 6
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -173.4, y = -16.1, z = 103.4 }, size = 4, direction = "up", floor_id = 6, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -175.0, y = -16.0, z = 157.9 }, size = 4, direction = "up", floor_id = 6, colour = "yellow" },

                    --map 7
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -169.9, y = -15.8, z = 219.2 }, size = 4, direction = "right", floor_id = 7, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -124.7, y = -15.8, z = 219.6 }, size = 4, direction = "right", floor_id = 7, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -99.6, y = -12.0, z = 219.1 }, size = 4, direction = "down", floor_id = 7, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -99.7, y = -1.0, z = 167.1 }, size = 4, direction = "down", floor_id = 7, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -99.0, y = 4.0, z = 139.4 }, size = 4, direction = "right", floor_id = 7, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -59.9, y = 12.0, z = 138.8 }, size = 4, direction = "down", floor_id = 7, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -59.0, y = 24.3, z = 72.1 }, size = 4, direction = "down", floor_id = 7, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -63.2, y = 24.3, z = 23.9 }, size = 4, direction = "left", floor_id = 7, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -123.2, y = 24.3, z = 20.6 }, size = 4, direction = "left", floor_id = 7, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -175.9, y = 24.3, z = 20.2 }, size = 4, direction = "down", floor_id = 7, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -179.1, y = 24.3, z = -24.9 }, size = 4, direction = "down", floor_id = 7, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -181.4, y = 24.3, z = -60.8 }, size = 4, direction = "down", floor_id = 7, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -172.4, y = 24.3, z = -98.7 }, size = 4, direction = "right", floor_id = 7, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -119.9, y = 24.3, z = -99.1 }, size = 4, direction = "right", floor_id = 7, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -99.7, y = 24.3, z = -99.8 }, size = 4, direction = "down", floor_id = 7, colour = "yellow" },

                    --map 7 torches
                    {
                        zone_name = "Castle Oztroja",
                        type = 'square',
                        center = { x = -102.9, y = 24.3, z = -108.4 },
                        size = 2,
                        floor_id = 15
                    },
                    {
                        zone_name = "Castle Oztroja",
                        type = 'square',
                        center = { x = -97.3, y = 24.3, z = -108.4 },
                        size = 2,
                        floor_id = 15
                    },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 26,
                        zone_name = "Castle Oztroja",
                        floor_id = 1,
                        highlights = {
                            { position = "I-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 26,
                        zone_name = "Castle Oztroja",
                        floor_id = 2,
                        highlights = {
                            { position = "G-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 26,
                        zone_name = "Castle Oztroja",
                        floor_id = 5,
                        highlights = {
                            { position = "G-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 26,
                        zone_name = "Castle Oztroja",
                        floor_id = 6,
                        highlights = {
                            { position = "I-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 26,
                        zone_name = "Castle Oztroja",
                        floor_id = 15,
                        highlights = {
                            { position = "J-11", offsetX = 16, offsetY = 16 },
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 27: Now proceed to the Altar Room! \n \n" ..
                       "You'll have to go through another Brass Door! \n \n",
                zone_trigger = "Altar Room",
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -102.3, y = 24.3, z = -137.3 }, size = 4, direction = "left", floor_id = 7, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -147.9, y = 24.3, z = -139.7 }, size = 4, direction = "left", floor_id = 7, colour = "yellow" },

                    --brass door
                    { zone_name = "Castle Oztroja", type = 'rect', center = { x = -155.2, y = 20.4, z = -140.0 }, width = 6.25, height = 7.75, floor_id = 7, colour = "cyan", vertical_axis = 'z' },

                    -- keep runnin
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -160.6, y = 24.3, z = -140.2 }, size = 4, direction = "left", floor_id = 7, colour = "yellow" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 27,
                        zone_name = "Castle Oztroja",
                        floor_id = 15,
                        highlights = {
                            { position = "G-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 28: In Altar Room, check the Magicite at the end of the hall. \n \n" ..
                       "You will receive KI:Magicite: Orastone. \n \n" ..
                       "NOTE: If you spoke to Paya-Sabya and Muckvix, you get Fickblix cutscene. If repeating mission and skipped them, cutscene is skipped. \n \n",
                keyitems_needed = {16},
                trigger_on_keyitem_obtain = {16},
                onmob_target = {"Magicite-Altar"},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 28,
                        zone_name = "Altar Room",
                        highlights = {
                            { position = "G-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },

            -- MISSION COMPLETION
            {
                text = "Step 29: After obtaining all THREE Magicites, return to Ru'Lude Gardens (Home Point #1) and check the Audience Chamber door at (H-6). \n \n" ..
                       "You will receive KI:Airship Pass (or 20,000 gil if you already have one). \n \n" ..
                       "You will also receive title: 'Have Wings, Will Fly'. \n \n",
                onmob_target = {"Door: Audience Chamber"},
                trigger_on_event_id = {60},
                route_to = "Ru'Lude Gardens",
                destination_highlight = {position = "H-6", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 30: Talk to Nelcabrit (G-9) at the San d'Oria Embassy in Ru'Lude Gardens to complete the mission. \n \n",
                onmob_target = {"Nelcabrit"},
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Ru'Lude Gardens", type = 'arrow', center = { x = -0.3, y = 3.0, z = -6.3 }, size = 4, direction = "down", floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Lude Gardens", type = 'arrow', center = { x = -2.1, y = 9.0, z = -31.7 }, size = 4, direction = "sw", floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Lude Gardens", type = 'arrow', center = { x = -8.3, y = 9.0, z = -49.9 }, size = 4, direction = "left", floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Lude Gardens", type = 'rect', center = { x = -24.4, y = 7.4, z = -50.0 }, width = 3.00, height = 3.25, floor_id = 0, colour = "cyan", vertical_axis = 'z' },
                },
                trigger_on_event_id = {36},
                route_to = "Ru'Lude Gardens",
                destination_highlight = {position = "G-9", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "Rank 5, Airship Pass (or 20,000 gil), Message to Jeuno KI, 10,000 gil, Title: Have Wings Will Fly"
        }
    },

    ["5-1: The Ruins of Fei'Yin"] = {
        prerequisites = {
            {category = "Missions", subfile = "SanDoria", name = "4-1: Magicite"},
        },
        steps = {
            { -- Step 1
                text = "Step 1: Enter Chateau d'Oraguille (Northern San d'Oria, I-7) for a cutscene. \n \n" ..
                       "NOTE: You must view this cutscene before you can accept the mission (or change allegiance at an Immigration NPC). \n \n",
                trigger_on_event_id = {509},
                route_to = "Chateau d'Oraguille",
                zone_trigger = "Chateau d'Oraguille",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
            },
            { -- Step 2
                text = "Step 2: Go to a San d'Orian Gate Guard and accept the mission. \n \n" ..
                       "Southern San d'Oria: Ambrotien or Endracion (F-9 / K-10). \n" ..
                       "Northern San d'Oria: Grilau (D-8). \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                trigger_on_talk = {"You accept the mission."},
                zone_max_distance = 40,
                visual_zones = {
                    -- Green Square around
                    --Aravoge, T.K for crystal trades
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = -104.9, y = 0.0, z = -53.1 }, size = 1, floor_id = 0, colour = "green" },
                    --Arpevion, T.K
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = 105.2, y = 0.0, z = -53.0 }, size = 1, floor_id = 0, colour = "green" },
                    --Achantere, T.K
                    { zone_name = "Northern San d'Oria", type = 'square', center = { x = -247.2, y = 7.0, z = 40.9 }, size = 1, floor_id = 0, colour = "green" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "F-9", offsetX = 16, offsetY = 16 },
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 3
                text = "Step 3: Return to Halver in Chateau d'Oraguille to obtain the Key Item: New Fei'Yin Seal. \n \n" ..
                       "This mission cannot be completed without it. \n \n",
                onmob_target = {"Halver"},
                trigger_on_event_id = {533},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 4: Zone into Fei'Yin for a cutscene with Zeid. \n \n",
                --trigger_on_event_id = {1},
                zone_trigger = "Fei'Yin",
                route_to = "Fei'Yin 1",
                zone_max_distance = 40,
                visual_zones = {
                    -- Rang pass arrows
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -206.7, y = -39.9, z = -197.0 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -165.0, y = -40.0, z = -204.5 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -118.9, y = -39.8, z = -219.1 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    -- Route to Fei'Yin in Beaucedine Glacier from Xarca good to help players navigate complicated map.
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -136.4, y = -79.8, z = 220.3 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -119.9, y = -79.5, z = 173.5 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -101.2, y = -80.0, z = 133.0 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -96.4, y = -76.2, z = 102.4 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -32.0, y = -63.2, z = 101.1 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 0.5, y = -59.1, z = 98.9 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 2.6, y = -59.0, z = 60.4 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 3.0, y = -59.6, z = 12.0 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 5.7, y = -59.7, z = -27.1 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 2.7, y = -59.1, z = -58.4 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -5.6, y = -59.9, z = -81.7 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -29.7, y = -59.7, z = -105.7 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },

                    --Survival guide
                    { zone_name = "Beaucedine Glacier", type = 'square', center = { x = -28.0, y = -59.8, z = -125.0 }, size = 1, floor_id = 0, colour = "green" },

                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -63.1, y = -58.2, z = -95.7 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -63.6, y = -47.5, z = -142.3 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -58.7, y = -39.6, z = -189.8 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -27.6, y = -39.7, z = -205.2 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 10.6, y = -40.1, z = -193.4 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 23.3, y = -40.1, z = -151.9 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 54.1, y = -40.9, z = -128.8 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 85.5, y = -40.0, z = -101.0 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 120.5, y = -40.0, z = -87.2 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 141.8, y = -40.4, z = -50.1 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 133.9, y = -40.5, z = -4.9 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 93.1, y = -39.5, z = 0.7 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 61.2, y = -39.2, z = 5.3 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 64.2, y = -36.0, z = 20.7 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 126.2, y = -23.1, z = 20.1 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 153.0, y = -19.3, z = 20.2 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 175.3, y = -19.9, z = 17.5 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 170.4, y = -20.4, z = -30.7 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 167.1, y = -19.8, z = -83.4 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 158.6, y = -19.9, z = -114.9 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 128.2, y = -19.7, z = -142.5 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 80.9, y = -19.6, z = -148.7 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 59.2, y = -17.4, z = -182.7 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 121.1, y = -3.7, z = -180.8 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 186.5, y = 0.4, z = -193.7 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },

                    --Intersection
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 229.4, y = 0.3, z = -198.3 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 269.5, y = 0.3, z = -200.8 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 317.1, y = 0.0, z = -196.8 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 323.4, y = 0.8, z = -136.6 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 313.5, y = 0.2, z = -88.5 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 300.7, y = 0.6, z = -27.6 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 299.3, y = 0.1, z = 21.2 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 292.0, y = 0.4, z = 57.7 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 237.4, y = 0.2, z = 88.7 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 194.3, y = 0.1, z = 115.2 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 181.1, y = 0.1, z = 144.2 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 195.4, y = 0.0, z = 180.4 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 237.2, y = 0.0, z = 196.2 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 282.7, y = 0.9, z = 217.7 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 335.7, y = -0.2, z = 226.0 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 357.0, y = 0.0, z = 277.8 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 382.8, y = 1.9, z = 296.3 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 380.4, y = 16.4, z = 361.3 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 379.2, y = 21.0, z = 403.6 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 370.2, y = 20.1, z = 429.0 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 357.5, y = 20.0, z = 475.5 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 324.6, y = 20.5, z = 506.7 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 296.7, y = 20.7, z = 524.6 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 280.7, y = 20.0, z = 535.0 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                },
            },
            {
                text = "Step 5: Travel to Qu'Bia Arena entrance at (K-8) in Fei'Yin.",
                zone_trigger = "Qu'Bia Arena",
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = -176.1, y = -24.0, z = -171.4 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = -152.5, y = -24.0, z = -148.2 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = -133.5, y = -24.0, z = -140.4 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = -100.2, y = -19.0, z = -133.3 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = -97.7, y = -16.0, z = -96.0 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = -74.6, y = -16.0, z = -69.5 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = -60.4, y = -16.0, z = -61.0 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = -20.7, y = -16.0, z = -61.7 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 32.3, y = -16.0, z = -54.0 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 27.8, y = -16.0, z = -21.6 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = -20.3, y = -16.0, z = -16.8 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = -16.7, y = -16.0, z = 22.6 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 13.8, y = -16.0, z = 49.1 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 24.9, y = -16.0, z = 58.9 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 63.1, y = -16.6, z = 59.1 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 99.6, y = -24.0, z = 56.4 }, size = 4, direction = "se", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 124.8, y = -24.0, z = 28.4 }, size = 4, direction = "se", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 162.6, y = -23.7, z = 7.4 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 182.3, y = -24.0, z = 19.8 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 209.5, y = -24.0, z = 23.7 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 221.8, y = -24.0, z = 37.2 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 218.2, y = -24.0, z = 60.0 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'rect', center = { x = 231.5, y = -29.6, z = 60.0 }, width = 4.75, height = 10.75, floor_id = 1, colour = "cyan", vertical_axis = 'z' },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 237.3, y = -24.3, z = 59.5 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Fei'Yin",
                        floor_id = 1,
                        highlights = {
                            { position = "K-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 6: Examine the Burning Circle to enter BCNM 'The Rank 5 Mission'. \n \n" ..
                       "Requirements: \n \n" ..
                       "- Party members must be Rank 5+ and have watched Fei'Yin cutscene \n" ..
                       "- Level cap: 99 \n" ..
                       "- Time limit: 15 minutes \n" ..
                       "- Buffs wear upon entry \n \n" ..
                       "Defeat Archlich Taber'quoan (Black Mage skeleton): \n \n" ..
                       "- Spawns with 2 Ancient Sorcerers \n" ..
                       "- Ancient Warriors periodically spawn in pairs \n" ..
                       "- Uses Sleepga II, Freeze, and Manafont \n" ..
                       "- Susceptible to Silence and most enfeebles \n" ..
                       "- Skeletons can be Slept but easier with Bard Lullaby light based spells! \n \n" ..
                       "Victory: Title 'Archmage Assassin', KI:Burnt Seal",
                trigger_on_event_id = {32001},
                onmob_target = "qu-bia-arena-burning-circle",
                onmob_enemy = {"Ancient Sorcerer", "Ancient Warrior", "Archlich Taber'quoan"},
                kill_requirement = {
                    count = 1,
                    enemies = {"Archlich Taber'quoan"},
                    count_party_kills = true,
                    display_only = true,
                },
            },
            { -- Step 7
                text = "Step 7: Report back to Halver in Chateau d'Oraguille to complete the mission. \n \n" ..
                       "(Optional: afterwards talk to Prince Trion, Rahal, and Curilla for additional cutscenes.) \n \n",
                onmob_target = {"Halver"},
                trigger_on_event_id = {534},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "Rank Points, Title: Archmage Assassin"
        }
    },

    ["5-2: The Shadow Lord"] = {
        prerequisites = {
            {category = "Missions", subfile = "SanDoria", name = "5-1: The Ruins of Fei'Yin"},
        },
        steps = {
            { -- Step 1
                text = "Step 1: Trade 3 stacks of crystals to a Temple Knight Gate Guard (or repeat Bat Hunt) to build Rank Bar. \n \n" ..
                       "Talk to any San d'Orian Gate Guard to accept the mission - you should see the option available. \n \n" ..
                       "Southern San d'Oria: Ambrotien or Endracion (F-9 / K-10). \n" ..
                       "Northern San d'Oria: Grilau (D-8). \n \n" ..
                       "NOTE: If you have accepted the quest 'Under Oath', you must complete the Southern San d'Oria portion of it or Trion will not talk to you. \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                trigger_on_talk = {" but he was in a hurry. You'd best be off to Chateau d'Oraguille!"},
                zone_max_distance = 40,
                visual_zones = {
                    -- Green Square around
                    --Aravoge, T.K for crystal trades
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = -104.9, y = 0.0, z = -53.1 }, size = 1, floor_id = 0, colour = "green" },
                    --Arpevion, T.K
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = 105.2, y = 0.0, z = -53.0 }, size = 1, floor_id = 0, colour = "green" },
                    --Achantere, T.K
                    { zone_name = "Northern San d'Oria", type = 'square', center = { x = -247.2, y = 7.0, z = 40.9 }, size = 1, floor_id = 0, colour = "green" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "F-9", offsetX = 16, offsetY = 16 },
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 2
                text = "Step 2: Go to Chateau d'Oraguille and speak to Halver for a cutscene. \n \n" ..
                       "He will send you to Prince Trion. \n \n",
                onmob_target = {"Halver"},
                trigger_on_event_id = {546},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
            },
            { -- Step 3
                text = "Step 3: Examine the Door: Prince Royal's Rm at (H-7) in Chateau d'Oraguille for a cutscene with Trion. \n \n",
                onmob_target = {"Door: Prince Royals Rm"},
                trigger_on_event_id = {547},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "H-7", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                        -- Prince Trion room
                        { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -8.2, y = 0.0, z = -3.7 }, size = 3, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -16.4, y = 0.0, z = -3.2 }, size = 3, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -16.1, y = -3.0, z = 35.2 }, size = 3, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -16.9, y = -3.0, z = 68.1 }, size = 3, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -37.7, y = -3.0, z = 67.4 }, size = 3, direction = "up", floor_id = 0, colour = "yellow" },
                },
            },
            { -- Step 4
                text = "Step 4: Travel to Castle Zvahl Baileys! \n \n" ..
                       "Outpost/Survival Guides: Fauregandi/Valdeaunia if possible. \n \n" ..
                       "If walking, a good route from San d'Oria is via Ranguemont Pass > Beaucedine Glacier > Xarcabard.",
                zone_trigger = "Castle Zvahl Baileys",
                route_to = "Xarcabard",
                destination_highlight = {position = "D-8", offsetX = 16, offsetY = 16},
                zone_max_distance = 40,
                visual_zones = {
                        --Route from Range to Xarca
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -59.0, y = -39.4, z = -193.0 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -63.9, y = -47.7, z = -142.4 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -51.4, y = -58.6, z = -102.2 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -20.4, y = -60.0, z = -104.3 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 5.5, y = -59.1, z = -59.8 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 12.0, y = -60.0, z = -28.6 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 9.4, y = -59.6, z = 13.7 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 7.2, y = -59.6, z = 53.9 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 5.6, y = -60.0, z = 79.8 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -7.5, y = -59.4, z = 101.2 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -47.9, y = -64.6, z = 100.8 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -77.5, y = -71.9, z = 105.1 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -104.7, y = -78.9, z = 109.8 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -118.4, y = -79.5, z = 147.1 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -130.1, y = -79.7, z = 179.0 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -138.2, y = -79.6, z = 211.8 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },

                        --Xarca to Castle
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 448.9, y = 0.4, z = -183.9 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 401.1, y = 0.3, z = -189.2 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 357.7, y = 8.2, z = -191.2 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 318.4, y = 6.8, z = -191.2 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 265.0, y = -7.2, z = -184.6 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 238.3, y = -16.1, z = -192.2 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 195.6, y = -23.0, z = -189.5 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 141.1, y = -23.1, z = -163.0 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 98.1, y = -23.8, z = -139.5 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 44.5, y = -23.8, z = -110.8 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = 15.5, y = -23.3, z = -84.7 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = -0.8, y = -24.1, z = -73.1 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = -31.3, y = -23.9, z = -73.4 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = -66.5, y = -24.1, z = -63.6 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = -105.8, y = -24.3, z = -37.0 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = -129.2, y = -19.3, z = -14.4 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = -159.4, y = -15.2, z = 23.0 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = -161.0, y = -10.8, z = 66.0 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = -176.7, y = -2.5, z = 100.4 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = -189.6, y = -3.4, z = 71.2 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = -204.5, y = -3.9, z = 49.4 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = -218.4, y = -8.6, z = 26.1 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = -244.9, y = -12.3, z = -2.6 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = -257.9, y = -16.5, z = 13.1 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = -282.6, y = -20.0, z = 35.6 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = -303.0, y = -25.0, z = 56.1 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = -318.6, y = -27.0, z = 60.2 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = -322.8, y = -28.0, z = 36.2 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = -331.6, y = -29.7, z = 10.1 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = -364.6, y = -35.8, z = 20.6 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = -390.5, y = -41.7, z = 20.0 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = -418.9, y = -44.0, z = 19.6 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                },
            },
            { -- Step 5
                text = "Step 5: Route through Castle Zvahl Baileys -> Castle Zvahl Keep! \n \n" ..
                       "Map 1: Go to (G-8) staying on the lower level and take a first Right!(North)\n \n" ..
                       "Follow the arrows on the ground will lead you to (F-8) - Map 2! \n \n" ..
                       "Map 2: Jump down the Goblin Pitt, there will be an arrow to indicate where to go. \n \n" ..
                       "Map 3: Run down the hall and run up the stairs back to Map 2. \n \n" ..
                       "Map 2: Follow the arrows end goal is (F-8) to Castle Zvhal Keep. \n \n" ..
                       "Aggro: Demons/Beastmen (sight), Ahriman (sight+sound), up to Lv53. Use Sneak/Invis if below Lv70. \n \n",
                zone_max_distance = 40,
                visual_zones = {
                    --Survival Guide
                    { zone_name = "Castle Zvahl Baileys", type = 'square', center = { x = 372.0, y = -12.0, z = -25.0 }, size = 1, floor_id = 1, colour = "green" },
                    -- Floor 1
                    { zone_name = "Castle Zvahl Baileys", type = 'arrow', center = { x = 179.9, y = -24.1, z = 19.5 }, size = 4, direction = 'up', floor_id = 1 },
                    { zone_name = "Castle Zvahl Baileys", type = 'arrow', center = { x = 87.9, y = -20.1, z = 100.6 }, size = 4, direction = 'down', floor_id = 1 },
                    { zone_name = "Castle Zvahl Baileys", type = 'arrow', center = { x = 99.8, y = -20.1, z = 72.7 }, size = 4, direction = 'left', floor_id = 1 },
                    -- Floor 2
                    { zone_name = "Castle Zvahl Baileys", type = 'arrow', center = { x = 31.2, y = -20, z = 59.7 }, size = 4, direction = 'up', floor_id = 2 },
                    { zone_name = "Castle Zvahl Baileys", type = 'arrow', center = { x = 20.8, y = -20, z = 150.2 }, size = 4, direction = 'down', floor_id = 2 },
                    { zone_name = "Castle Zvahl Baileys", type = 'arrow', center = { x = 12.8, y = -24, z = 133.4 }, size = 4, direction = 'sw', floor_id = 2 },
                    { zone_name = "Castle Zvahl Baileys", type = 'arrow', center = { x = -61, y = -20, z = 110.2 }, size = 4, direction = 'down', floor_id = 2 },
                    { zone_name = "Castle Zvahl Baileys", type = 'arrow', center = { x = -92, y = -20, z = 89.4 }, size = 4, direction = 'down', floor_id = 2 },
                    { zone_name = "Castle Zvahl Baileys", type = 'arrow', center = { x = -91.8, y = -19.5, z = 51.5 }, size = 4, direction = 'right', floor_id = 2 },
                    { zone_name = "Castle Zvahl Baileys", type = 'arrow', center = { x = -76.1, y = -19.5, z = 52.1 }, size = 4, direction = 'down', floor_id = 2 },
                    { zone_name = "Castle Zvahl Baileys", type = 'arrow', center = { x = -77.4, y = -24, z = 20.2 }, size = 4, direction = 'left', floor_id = 2 },
                    -- Floor 15
                    { zone_name = "Castle Zvahl Baileys", type = 'arrow', center = { x = -6.5, y = 4, z = 126.5 }, size = 4, direction = 'nw', floor_id = 15 },
                    { zone_name = "Castle Zvahl Baileys", type = 'arrow', center = { x = -59.7, y = 4, z = 179.2 }, size = 4, direction = 'down', floor_id = 15 },
                    { zone_name = "Castle Zvahl Baileys", type = 'arrow', center = { x = 12.8, y = -24, z = 133.4 }, size = 4, direction = 'sw', floor_id = 15 },
                },
                zone_name = "Castle Zvahl Baileys",
                zone_trigger = "Castle Zvahl Keep",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Castle Zvahl Baileys",
                        floor_id = 1,
                        highlights = {
                            { position = "F-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Castle Zvahl Baileys",
                        floor_id = 2,
                        highlights = {
                            { position = "F-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Castle Zvahl Baileys",
                        floor_id = 15,
                        highlights = {
                            { position = "H-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 6
                text = "Step 6: Castle Zvahl Keep -> Throne Room of the Shadow Lord! \n \n" ..
                       "Follow the arrows, there is a lot of door opening here! \n" ..
                       "Map 1 -> (H-6) \n" ..
                       "Map 2 -> (E-8) \n" ..
                       "Map 3 -> Run on the teleporters when a glowing image appears \n" ..
                       "Keep doing this until you reach Map 4!! \n" ..
                       "Map 4 -> (G-7) to Throne Room and grab the Home Point! \n \n",
                zone_max_distance = 30,
                visual_zones = {
                    -- Floor 1
                    { zone_name = "Castle Zvahl Keep", type = 'arrow', center = { x = -30, y = 0, z = -22.3 }, size = 4, direction = 'up', floor_id = 1 },
                    { zone_name = "Castle Zvahl Keep", type = 'rect', center = { x = -30.0, y = -2.9, z = 41.3 }, width = 5.75, height = 5.50, floor_id = 1, colour = "cyan", vertical_axis = 'ns' },
                    { zone_name = "Castle Zvahl Keep", type = 'arrow', center = { x = -32.4, y = 0.6, z = 48.7 }, size = 4, direction = 'right', floor_id = 1 },
                    { zone_name = "Castle Zvahl Keep", type = 'arrow', center = { x = -10.1, y = 0.6, z = 69.4 }, size = 4, direction = 'up', floor_id = 1 },
                    { zone_name = "Castle Zvahl Keep", type = 'rect', center = { x = -10.0, y = -2.9, z = 78.8 }, width = 5.75, height = 5.50, floor_id = 1, colour = "cyan", vertical_axis = 'ns' },
                    { zone_name = "Castle Zvahl Keep", type = 'arrow', center = { x = -10.1, y = 0.6, z = 90.2 }, size = 4, direction = 'left', floor_id = 1 },
                    { zone_name = "Castle Zvahl Keep", type = 'rect', center = { x = -18.8, y = -3.0, z = 90.0 }, width = 6.00, height = 6.00, floor_id = 1, colour = "cyan", vertical_axis = 'z' },
                    { zone_name = "Castle Zvahl Keep", type = 'rect', center = { x = -38.7, y = -3.1, z = 90.0 }, width = 6.00, height = 6.00, floor_id = 1, colour = "cyan", vertical_axis = 'z' },
                    { zone_name = "Castle Zvahl Keep", type = 'rect', center = { x = -50.0, y = -3.0, z = 98.8 }, width = 6.00, height = 6.00, floor_id = 1, colour = "cyan", vertical_axis = 'ns' },
                    { zone_name = "Castle Zvahl Keep", type = 'rect', center = { x = -58.8, y = -3.0, z = 110.0 }, width = 6.00, height = 6.00, floor_id = 1, colour = "cyan", vertical_axis = 'z' },
                    { zone_name = "Castle Zvahl Keep", type = 'arrow', center = { x = -69, y = 0.6, z = 107.8 }, size = 4, direction = 'up', floor_id = 1 },
                    { zone_name = "Castle Zvahl Keep", type = 'rect', center = { x = -70.0, y = -3.0, z = 118.8 }, width = 6.00, height = 6.00, floor_id = 1, colour = "cyan", vertical_axis = 'ns' },
                    { zone_name = "Castle Zvahl Keep", type = 'rect', center = { x = -50.0, y = -19.0, z = 118.8 }, width = 6.00, height = 6.00, floor_id = 1, colour = "cyan", vertical_axis = 'ns' },
                    -- Floor 2
                    { zone_name = "Castle Zvahl Keep", type = 'rect', center = { x = -61.3, y = -19.0, z = 110.0 }, width = 6.00, height = 6.00, floor_id = 2, colour = "cyan", vertical_axis = 'z' },
                    { zone_name = "Castle Zvahl Keep", type = 'arrow', center = { x = -48.7, y = -15.4, z = 112.2 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Castle Zvahl Keep", type = 'arrow', center = { x = -69.7, y = -15.4, z = 86.4 }, size = 4, direction = 'down', floor_id = 2 },
                    { zone_name = "Castle Zvahl Keep", type = 'rect', center = { x = -70.0, y = -19.4, z = 78.8 }, width = 5.75, height = 6.75, floor_id = 2, colour = "cyan", vertical_axis = 'ns' },
                    { zone_name = "Castle Zvahl Keep", type = 'arrow', center = { x = -60.4, y = -15.4, z = 48.5 }, size = 4, direction = 'down', floor_id = 2 },
                    { zone_name = "Castle Zvahl Keep", type = 'rect', center = { x = -60.0, y = -19.4, z = 41.3 }, width = 5.75, height = 6.75, floor_id = 2, colour = "cyan", vertical_axis = 'ns' },
                    { zone_name = "Castle Zvahl Keep", type = 'arrow', center = { x = -58.7, y = -16.0, z = 14.4 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Castle Zvahl Keep", type = 'arrow', center = { x = -93.4, y = -16.0, z = 12.7 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                    { zone_name = "Castle Zvahl Keep", type = 'arrow', center = { x = -96.3, y = -16.0, z = -20.0 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Castle Zvahl Keep", type = 'arrow', center = { x = -206.7, y = -48.0, z = -19.1 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    -- Floor 3 (teleporters)
                    { zone_name = "Castle Zvahl Keep", type = 'square', center = { x = -300, y = -49.1, z = -20 }, size = 4, floor_id = 3 },
                    { zone_name = "Castle Zvahl Keep", type = 'square', center = { x = -272.6, y = -53.2, z = 4.9 }, size = 4, floor_id = 3 },
                    { zone_name = "Castle Zvahl Keep", type = 'square', center = { x = -272.9, y = -53.2, z = -44.6 }, size = 4, floor_id = 3 },
                    { zone_name = "Castle Zvahl Keep", type = 'square', center = { x = -326.5, y = -53.2, z = -45 }, size = 4, floor_id = 3 },

                    --arrows to each teleporter
                    { zone_name = "Castle Zvahl Keep", type = 'arrow', center = { x = -290.6, y = -48.0, z = -20.2 }, size = 4, direction = "left", floor_id = 3, colour = "yellow" },
                    { zone_name = "Castle Zvahl Keep", type = 'arrow', center = { x = -241.7, y = -52.0, z = 75.0 }, size = 4, direction = "sw", floor_id = 3, colour = "yellow" },
                    { zone_name = "Castle Zvahl Keep", type = 'arrow', center = { x = -260.1, y = -52.0, z = 47.4 }, size = 4, direction = "down", floor_id = 3, colour = "yellow" },
                    { zone_name = "Castle Zvahl Keep", type = 'arrow', center = { x = -272.5, y = -52.0, z = 14.2 }, size = 4, direction = "down", floor_id = 3, colour = "yellow" },
                    { zone_name = "Castle Zvahl Keep", type = 'arrow', center = { x = -202.0, y = -52.0, z = -81.8 }, size = 4, direction = "nw", floor_id = 3, colour = "yellow" },
                    { zone_name = "Castle Zvahl Keep", type = 'arrow', center = { x = -225.2, y = -52.0, z = -60.3 }, size = 4, direction = "left", floor_id = 3, colour = "yellow" },
                    { zone_name = "Castle Zvahl Keep", type = 'arrow', center = { x = -273.5, y = -52.0, z = -53.6 }, size = 4, direction = "up", floor_id = 3, colour = "yellow" },
                    { zone_name = "Castle Zvahl Keep", type = 'arrow', center = { x = -359.1, y = -52.0, z = -115.9 }, size = 4, direction = "ne", floor_id = 3, colour = "yellow" },
                    { zone_name = "Castle Zvahl Keep", type = 'arrow', center = { x = -339.5, y = -52.0, z = -93.8 }, size = 4, direction = "up", floor_id = 3, colour = "yellow" },
                    { zone_name = "Castle Zvahl Keep", type = 'arrow', center = { x = -326.4, y = -52.0, z = -54.5 }, size = 4, direction = "up", floor_id = 3, colour = "yellow" },
                    -- Floor 4
                    { zone_name = "Castle Zvahl Keep", type = 'arrow', center = { x = -419.7, y = -67.3, z = 61.2 }, size = 4, direction = "up", floor_id = 4, colour = "yellow" },
                    { zone_name = "Castle Zvahl Keep", type = 'arrow', center = { x = -419.9, y = -68.0, z = 99.9 }, size = 4, direction = "left", floor_id = 4, colour = "yellow" },
                    { zone_name = "Castle Zvahl Keep", type = 'arrow', center = { x = -465.8, y = -68.0, z = 99.8 }, size = 4, direction = "left", floor_id = 4, colour = "yellow" },
                    { zone_name = "Castle Zvahl Keep", type = 'arrow', center = { x = -500.0, y = -68.0, z = 96.3 }, size = 4, direction = "down", floor_id = 4, colour = "yellow" },
                    { zone_name = "Castle Zvahl Keep", type = 'arrow', center = { x = -507.5, y = -68.0, z = 60.8 }, size = 4, direction = "left", floor_id = 4, colour = "yellow" },
                    { zone_name = "Castle Zvahl Keep", type = 'arrow', center = { x = -550.1, y = -70.0, z = 60.5 }, size = 4, direction = "left", floor_id = 4, colour = "yellow" },
                },
                zone_name = "Castle Zvahl Keep",
                zone_trigger = "Throne Room",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 6,
                        zone_name = "Castle Zvahl Keep",
                        floor_id = 1,
                        highlights = {
                            { position = "H-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 6,
                        zone_name = "Castle Zvahl Keep",
                        floor_id = 2,
                        highlights = {
                            { position = "E-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 6,
                        zone_name = "Castle Zvahl Keep",
                        floor_id = 3,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 6,
                        zone_name = "Castle Zvahl Keep",
                        floor_id = 4,
                        highlights = {
                            { position = "G-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 7
                text = "Step 7: Examine the Ore Door in the Throne Room (next to Home Point #1) for a cutscene, then examine it again and select 'The Shadow Lord Battle'. \n \n" ..
                       "Shadow Lord (2 phases): \n" ..
                       "Phase 1: \n" ..
                       "- Alternates between Magic Stance (physical immunity) and Melee Stance (magic immunity) \n" ..
                       "- Switches every 5 minutes or after 1000 damage \n" ..
                       "- Magic Stance: Tier 2 elementals, debuffs, Dark Nova weaponskill before switching \n" ..
                       "- Melee Stance: Giga Slash, Kick Back, Umbra Smash weaponskills \n" ..
                       "- Monks: Use Formless Strikes to bypass physical immunity \n" ..
                       "Phase 2 (after cutscene): Spams Implosion \n" ..
                       "- Lower-level parties should zerg him so save your 2hours for this phase! \n \n" ..
                       "NOTE: Helpers must be on 5-2 or higher in their own nation. Buffs wear on entry, 30 minute limit. \n \n" ..
                       "Victory: KI:Shadow Fragment. You will be warped back to Baileys entrance.",
                onmob_target = {"throne-room"},
                trigger_on_event_id = {7},
                onmob_enemy = "Shadow Lord",
                onmob_enemy_size = 4,
            },
            { -- Step 8
                text = "Step 8: Return to Halver in Chateau d'Oraguille to be promoted to Rank 6. \n \n" ..
                       "Afterwards, examine the Great Hall door for a cutscene. \n \n" ..
                       "(Optional: talk to Rahal, Milchupain, Aramaviont and Curilla for additional dialogue.) \n \n" ..
                       "This unlocks the Zilart missions - take Lion's offer and visit Norg. \n \n",
                onmob_target = {"Halver"},
                trigger_on_event_id = {548},
                keyitems_needed = {74},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
            },
            { -- Step 8
                text = "Step 9: Click on door to the Great Hall for a cutscene. \n \n",
                onmob_target = {"Door: Great Hall"},
                trigger_on_event_id = {61},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "Rank 6, 20,000 gil, Title: Shadow Banisher, Zilart Mission 1 'The New Frontier' unlocked"
        }
    },

    ["6-1: Leaute's Last Wishes"] = {
        prerequisites = {
            {category = "Missions", subfile = "SanDoria", name = "5-2: The Shadow Lord"},
        },
        steps = {
            { -- Step 1
                text = "Step 1: Trade 2stacks off crystals to a San d'Orian Gate Guard (or repeat missions) to build Rank Bar. \n \n" ..
                       "Talk to any San d'Orian Gate Guard to accept the mission. \n \n" ..
                       "Southern San d'Oria: Ambrotien or Endracion (F-9 / K-10). \n" ..
                       "Northern San d'Oria: Grilau (D-8). \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                --trigger_on_talk = {"You have accepted the mission"},
                trigger_on_talk = " on the mission from Monarlais Halver.",
                zone_max_distance = 40,
                visual_zones = {
                    -- Green Square around
                    --Aravoge, T.K for crystal trades
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = -104.9, y = 0.0, z = -53.1 }, size = 1, floor_id = 0, colour = "green" },
                    --Arpevion, T.K
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = 105.2, y = 0.0, z = -53.0 }, size = 1, floor_id = 0, colour = "green" },
                    --Achantere, T.K
                    { zone_name = "Northern San d'Oria", type = 'square', center = { x = -247.2, y = 7.0, z = 40.9 }, size = 1, floor_id = 0, colour = "green" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "F-9", offsetX = 16, offsetY = 16 },
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 2
                text = "Step 2: Go to Chateau d'Oraguille and speak to Halver for a cutscene. He will tell you the King wishes to see you. \n \n",
                onmob_target = {"Halver"},
                trigger_on_event_id = {25},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
            },
            { -- Step 3
                text = "Step 3: Examine the Door: Great Hall behind Halver for a cutscene with the King. \n \n" ..
                       "He will ask you to retrieve a Dreamrose. \n \n" ..
                       "(Optional: Arsha and Chupaile have extra dialogue at this point.) \n \n",
                onmob_target = {"Door: Great Hall"},
                trigger_on_event_id = {87},
                zone_max_distance = 20,
            },
            { -- Step 4
                text = "Step 4: Travel to Western Altepa Desert (G-7) - the small lake on the west side of Revelation Rock. \n \n" ..
                       "Closest warps: Kuftal Tunnel Survival Guide, then the Western Altepa Desert Survival Guide. \n \n" ..
                       "Aggro: Cactuars in the area are Lv48-53. They do NOT link with the NM. \n \n",
                route_to = "Western Altepa Desert",
                zone_trigger = "Western Altepa Desert",
                destination_highlight = {position = "G-7", offsetX = 16, offsetY = 16},
                visual_zones = {
                    { zone_name = "Western Altepa Desert", type = 'square', center = { x = -262.4, y = -10.2, z = 49.2 }, size = 2, floor_id = 0, colour = "green" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Western Altepa Desert",
                        highlights = {
                            { position = "G-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 5
                text = "Step 5: Examine the Dreamrose to spawn Sabotender Enamorado, then defeat it. \n \n" ..
                       "Sabotender Enamorado (Lv75, ~15,000 HP): \n" ..
                       "- Uses all normal Cactuar abilities including 1000 Needles \n" ..
                       "- Bring a pet (SMN/BST/PUP) or your Adventuring Fellow to soak 1000 Needles \n" ..
                       "- Earth Staff / physical damage reduction gear helps a lot \n \n",
                onmob_target = {"western-altepa-desert-dreamrose"},
                onmob_enemy = "Sabotender Enamorado",
                onmob_enemy_size = 2,
                kill_requirement = {
                    count = 1,
                    enemies = {"Sabotender Enamorado"},
                    zone = "Western Altepa Desert",
                    count_party_kills = true,
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Western Altepa Desert",
                        highlights = {
                            { position = "G-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 6
                text = "Step 6: Examine the Dreamrose again to receive KI:Dreamrose. \n \n" ..
                       "EVERYONE in the alliance on this mission must examine it individually. \n \n",
                onmob_target = {"western-altepa-desert-dreamrose"},
                keyitems_needed = {268},
                trigger_on_keyitem_obtain = {268},
            },
            { -- Step 7
                text = "Step 7: Return to Halver in Chateau d'Oraguille. He will ask you to bring the Dreamrose to Chalvatot. \n \n",
                onmob_target = {"Halver"},
                trigger_on_event_id = {22},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
            },
            { -- Step 8
                text = "Step 8: Walk into the garden at (F-7) in Chateau d'Oraguille for the final cutscene. \n \n" ..
                       "The cutscene triggers on entering the garden area - you do not need to talk to Chalvatot. \n \n" ..
                       "You will receive KI:Piece of Paper. \n \n",
                trigger_on_event_id = {111},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "F-7", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -5.9, y = 0.0, z = -4.0 }, size = 3, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -15.4, y = 0.0, z = -6.0 }, size = 3, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -15.8, y = -3.0, z = 35.9 }, size = 3, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -37.3, y = -3.0, z = 35.8 }, size = 3, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -59.6, y = -3.0, z = 35.5 }, size = 3, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -59.7, y = -3.0, z = 52.0 }, size = 3, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -69.6, y = -3.0, z = 51.6 }, size = 3, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -84.1, y = -1.1, z = 57.8 }, size = 3, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -85.2, y = 0.4, z = 77.9 }, size = 3, direction = "left", floor_id = 0, colour = "yellow" },
                },
            },
        },
        reward = {
            text = "Rank Points (600), KI: Piece of Paper"
        }
    },

    ["6-2: Ranperre's Final Rest"] = {
        prerequisites = {
            {category = "Missions", subfile = "SanDoria", name = "6-1: Leaute's Last Wishes"},
        },
        steps = {
            { -- Step 1
                text = "Step 1: Trade 2 stacks of crystals to a San d'Orian Gate Guard (or repeat missions) to build Rank Bar. \n \n" ..
                       "Talk to any San d'Orian Gate Guard to accept the mission. He will tell you to speak to Prince Trion. \n \n" ..
                       "Southern San d'Oria: Ambrotien or Endracion (F-9 / K-10). \n" ..
                       "Northern San d'Oria: Grilau (D-8). \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                trigger_on_talk = {" The prince is waiting in his chambers."},
                zone_max_distance = 40,
                visual_zones = {
                    -- Green Square around
                    --Aravoge, T.K for crystal trades
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = -104.9, y = 0.0, z = -53.1 }, size = 1, floor_id = 0, colour = "green" },
                    --Arpevion, T.K
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = 105.2, y = 0.0, z = -53.0 }, size = 1, floor_id = 0, colour = "green" },
                    --Achantere, T.K
                    { zone_name = "Northern San d'Oria", type = 'square', center = { x = -247.2, y = 7.0, z = 40.9 }, size = 1, floor_id = 0, colour = "green" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "F-9", offsetX = 16, offsetY = 16 },
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 2
                text = "Step 2: Examine the Door: Prince Royal's Rm at (H-7) in Chateau d'Oraguille for a cutscene with Prince Trion. \n \n",
                onmob_target = {"Door: Prince Royals Rm"},
                trigger_on_event_id = {81},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "H-7", offsetX = 16, offsetY = 16},
                zone_max_distance = 20,
                visual_zones = {
                        { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -8.2, y = 0.0, z = -3.7 }, size = 3, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -16.4, y = 0.0, z = -3.2 }, size = 3, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -16.1, y = -3.0, z = 35.2 }, size = 3, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -16.9, y = -3.0, z = 68.1 }, size = 3, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -37.7, y = -3.0, z = 67.4 }, size = 3, direction = "up", floor_id = 0, colour = "yellow" },
                },
            },
            { -- Step 3
                text = "Step 3: Travel through East Ronfaure to King Ranperre's Tomb and go to the Heavy Stone Door at (H-8) - Map 1. \n \n" ..
                       "Examine the Heavy Stone Door to spawn 3 skeleton NMs: \n" ..
                       "- Corrupted Yorgos (WAR) \n" ..
                       "- Corrupted Soffeil (BLM) \n" ..
                       "- Corrupted Ulbrig (BLM) \n \n" ..
                       "WARNING: Have SNEAK up BEFORE examining the door or all 3 will aggro at once! \n \n" ..
                       "They do NOT link - pull and kill them one at a time. Most Lv85 jobs can solo this. \n \n",
                onmob_target = {"king-ranperre-tomb-heavy-stone-door-h8"},
                route_to = "King Ranperre's Tomb",
                destination_highlight = {position = "H-8", offsetX = 16, offsetY = 16},
                onmob_enemy = {"Corrupted Yorgos", "Corrupted Soffeil", "Corrupted Ulbrig"},
                onmob_enemy_colour = "red",
                onmob_enemy_size = 2,
                kill_requirement = {
                    count = 3,
                    enemies = {"Corrupted Yorgos", "Corrupted Soffeil", "Corrupted Ulbrig"},
                    zone = "King Ranperre's Tomb",
                    count_party_kills = true,
                },
                zone_max_distance = 35,
                visual_zones = {
                    -- Entrance
                    { zone_name = "East Ronfaure", type = 'arrow', center = { x = 213.8, y = 2.9, z = -489.4 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "East Ronfaure", type = 'arrow', center = { x = 200.6, y = 0.0, z = -503.4 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "East Ronfaure", type = 'arrow', center = { x = 199.7, y = 0.3, z = -533.3 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },

                    --Kings Tomb
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -140.6, y = -0.1, z = 247.8 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -139.8, y = 0.0, z = 220.9 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -163.3, y = 0.0, z = 219.5 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -160.3, y = 0.0, z = 184.5 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -140.6, y = -1.1, z = 207.9 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -140.4, y = 7.5, z = 159.8 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -145.4, y = 7.2, z = 141.9 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -169.6, y = 7.5, z = 137.3 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -180.1, y = 7.5, z = 120.3 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -180.8, y = 7.5, z = 81.4 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -183.2, y = 7.3, z = 60.5 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -220.1, y = 6.5, z = 58.8 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -250.9, y = 6.8, z = 53.9 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -260.7, y = 7.3, z = 31.7 }, size = 4, direction = "se", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -234.6, y = 7.5, z = 20.4 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -181.7, y = 7.0, z = 17.1 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -147.3, y = 7.1, z = 16.9 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -99.7, y = 8.3, z = 15.7 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -100.8, y = 4.5, z = -27.6 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -116.3, y = 3.0, z = -27.3 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -117.0, y = 0.0, z = -62.7 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -117.2, y = 0.1, z = -105.9 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -115.3, y = 0.0, z = -134.9 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -75.2, y = 0.0, z = -134.7 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -44.1, y = 0.0, z = -130.8 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -23.5, y = -0.0, z = -135.6 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 37.5, y = 0.0, z = -135.1 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 36.2, y = 0.0, z = -84.1 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },

                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 36.1, y = 0.0, z = -62.3 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },

                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 36.0, y = 3.0, z = -26.6 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 20.0, y = 4.5, z = -26.2 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 21.1, y = 8.7, z = 19.3 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 72.1, y = 7.2, z = 19.2 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 124.1, y = 7.5, z = 18.5 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 140.8, y = 7.2, z = 62.4 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 136.9, y = 7.3, z = 84.3 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 138.2, y = 8.5, z = 117.5 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 113.9, y = 8.2, z = 141.5 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 80.1, y = 7.5, z = 180.6 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 29.5, y = 6.8, z = 179.4 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 10.1, y = 7.6, z = 178.0 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -21.0, y = 7.3, z = 173.6 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -7.1, y = 7.5, z = 129.1 }, size = 4, direction = "se", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 23.7, y = 8.0, z = 106.7 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 55.5, y = 6.5, z = 105.1 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 59.2, y = 7.5, z = 75.0 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 56.7, y = 7.2, z = 61.6 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 18.0, y = 7.3, z = 60.6 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -10.7, y = 6.9, z = 54.5 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -20.5, y = 8.8, z = 31.2 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -31.6, y = 7.5, z = 20.1 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },

                },
            },
            { -- Step 4
                text = "Step 4: Examine the Heavy Stone Door again and select YES to enter. \n \n" ..
                       "NOTE: You may have to wait up to 1 minute from the NM spawn time before the door will let you in, even if they are already dead. \n \n" ..
                       "Once you have won, you can re-enter freely even after zoning or logging out. \n \n",
                onmob_target = {"king-ranperre-tomb-heavy-stone-door-h8"},
                trigger_on_event_id = {6},
                route_to = "King Ranperre's Tomb",
                destination_highlight = {position = "H-8", offsetX = 16, offsetY = 16},
            },
            { -- Step 5
                text = "Step 5: Examine the Tombstone inside the chamber for a cutscene. \n \n" ..
                       "You will receive KI:Ancient San d'Orian book. \n \n",
                onmob_target = {"king-ranperre-tomb-tombstone-h8"},
                trigger_on_event_id = {8},
                route_to = "King Ranperre's Tomb",
                destination_highlight = {position = "H-8", offsetX = 16, offsetY = 16},
            },
            -- Steps 6-8: the guard will not send you to Prince Trion until you have
            -- ZONED since handing the book over (server sets a zone-scoped flag when it
            -- takes the book, and only a zone change clears it). Waiting does nothing.
            -- Pinned to Grilau in Northern San d'Oria because the West Ronfaure gate is
            -- right next to him, which makes the zone trip trivial and gives step 7 a
            -- single zone to trigger on.
            { -- Step 6
                text = "Step 6: Take the book to Grilau (D-8) at the Northern San d'Oria gate. \n \n" ..
                       "She takes the KI:Ancient San d'Orian Book. \n \n" ..
                       "(Optional: Perfaumand, by Prince Trion's door, has extra dialogue while you still hold the book.) \n \n",
                onmob_target = {"Grilau"},
                trigger_on_event_id = {1035,1037},
                route_to = "Northern San d'Oria",
                destination_highlight = {position = "D-8", offsetX = 16, offsetY = 16},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 6,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 7
                text = "Step 7: Step outside to West Ronfaure through the gate beside Grilau. \n \n" ..
                       "This is REQUIRED - the guard only sends you back to Prince Trion once you have zoned. \n \n" ..
                       "Talking to her again without zoning just gives a 'deciphering will take a while' dialogue over and over. \n \n",
                zone_trigger = "West Ronfaure",
                route_to = "West Ronfaure",
                destination_highlight = {position = "D-8", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                        { zone_name = "Northern San d'Oria", type = 'arrow', center = { x = -241.9, y = 8.0, z = 53.3 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Northern San d'Oria", type = 'arrow', center = { x = -243.6, y = 8.0, z = 43.7 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                },
            },
            { -- Step 8
                text = "Step 8: Go back in and talk to Grilau again. \n \n" ..
                       "Grilau now sends you back to Prince Trion. \n \n",
                onmob_target = {"Grilau"},
                trigger_on_event_id = {1039, 1040},
                route_to = "Northern San d'Oria",
                destination_highlight = {position = "D-8", offsetX = 16, offsetY = 16},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 8,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 9
                text = "Step 9: Examine the Door: Prince Royal's Rm at (H-7) in Chateau d'Oraguille again for a cutscene. \n \n",
                onmob_target = {"Door: Prince Royals Rm"},
                trigger_on_event_id = {21},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "H-7", offsetX = 16, offsetY = 16},
                zone_max_distance = 20,
                visual_zones = {
                        { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -8.2, y = 0.0, z = -3.7 }, size = 3, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -16.4, y = 0.0, z = -3.2 }, size = 3, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -16.1, y = -3.0, z = 35.2 }, size = 3, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -16.9, y = -3.0, z = 68.1 }, size = 3, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -37.7, y = -3.0, z = 67.4 }, size = 3, direction = "up", floor_id = 0, colour = "yellow" },
                },
            },
            { -- Step 10
                text = "Step 10: Return to the Heavy Stone Door at (H-8) in King Ranperre's Tomb and examine it for another cutscene. \n \n" ..
                       "The NMs do NOT respawn - you can walk straight up to the door. \n \n",
                onmob_target = {"king-ranperre-tomb-heavy-stone-door-h8"},
                trigger_on_event_id = {5},
                route_to = "King Ranperre's Tomb",
                destination_highlight = {position = "H-8", offsetX = 16, offsetY = 16},
                zone_max_distance = 25,
                visual_zones = {
                    -- Entrance
                    { zone_name = "East Ronfaure", type = 'arrow', center = { x = 213.8, y = 2.9, z = -489.4 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "East Ronfaure", type = 'arrow', center = { x = 200.6, y = 0.0, z = -503.4 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "East Ronfaure", type = 'arrow', center = { x = 199.7, y = 0.3, z = -533.3 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },

                    --Kings Tomb
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -140.6, y = -0.1, z = 247.8 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -139.8, y = 0.0, z = 220.9 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -163.3, y = 0.0, z = 219.5 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -160.3, y = 0.0, z = 184.5 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -140.6, y = -1.1, z = 207.9 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -140.4, y = 7.5, z = 159.8 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -145.4, y = 7.2, z = 141.9 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -169.6, y = 7.5, z = 137.3 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -180.1, y = 7.5, z = 120.3 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -180.8, y = 7.5, z = 81.4 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -183.2, y = 7.3, z = 60.5 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -220.1, y = 6.5, z = 58.8 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -250.9, y = 6.8, z = 53.9 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -260.7, y = 7.3, z = 31.7 }, size = 4, direction = "se", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -234.6, y = 7.5, z = 20.4 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -181.7, y = 7.0, z = 17.1 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -147.3, y = 7.1, z = 16.9 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -99.7, y = 8.3, z = 15.7 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -100.8, y = 4.5, z = -27.6 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -116.3, y = 3.0, z = -27.3 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -117.0, y = 0.0, z = -62.7 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -117.2, y = 0.1, z = -105.9 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -115.3, y = 0.0, z = -134.9 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -75.2, y = 0.0, z = -134.7 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -44.1, y = 0.0, z = -130.8 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -23.5, y = -0.0, z = -135.6 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 37.5, y = 0.0, z = -135.1 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 36.2, y = 0.0, z = -84.1 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },

                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 36.1, y = 0.0, z = -62.3 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },

                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 36.0, y = 3.0, z = -26.6 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 20.0, y = 4.5, z = -26.2 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 21.1, y = 8.7, z = 19.3 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 72.1, y = 7.2, z = 19.2 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 124.1, y = 7.5, z = 18.5 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 140.8, y = 7.2, z = 62.4 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 136.9, y = 7.3, z = 84.3 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 138.2, y = 8.5, z = 117.5 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 113.9, y = 8.2, z = 141.5 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 80.1, y = 7.5, z = 180.6 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 29.5, y = 6.8, z = 179.4 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 10.1, y = 7.6, z = 178.0 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -21.0, y = 7.3, z = 173.6 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -7.1, y = 7.5, z = 129.1 }, size = 4, direction = "se", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 23.7, y = 8.0, z = 106.7 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 55.5, y = 6.5, z = 105.1 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 59.2, y = 7.5, z = 75.0 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 56.7, y = 7.2, z = 61.6 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 18.0, y = 7.3, z = 60.6 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -10.7, y = 6.9, z = 54.5 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -20.5, y = 8.8, z = 31.2 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -31.6, y = 7.5, z = 20.1 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },

                    --Door non fight
                    --{ zone_name = "King Ranperre's Tomb", type = 'rect', center = { x = -39.0, y = 4.8, z = 20.0 }, width = 4.25, height = 5.75, floor_id = 1, colour = "cyan", vertical_axis = 'z' },
                },
            },
            { -- Step 11
                text = "Step 11: Return to a San d'Orian Gate Guard and talk to him to complete the mission. \n \n" ..
                       "(Optional: Perfaumand by Prince Trion's door has one more short cutscene.) \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                trigger_on_event_id = {1033, 1034},
                route_to = "Southern San d'Oria",
                zone_max_distance = 35,
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 11,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "F-9", offsetX = 16, offsetY = 16 },
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 11,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
        reward = {
            text = "Rank 7, 40,000 gil"
        }
    },

    ["7-1: Prestige of the Papsque"] = {
        prerequisites = {
            {category = "Missions", subfile = "SanDoria", name = "6-2: Ranperre's Final Rest"},
        },
        steps = {
            { -- Step 1
                text = "Step 1: Trade 2 stacks of crystals to a San d'Orian Gate Guard (or repeat missions) to build Rank Bar. \n \n" ..
                       "Talk to any San d'Orian Gate Guard to accept the mission. \n \n" ..
                       "Southern San d'Oria: Ambrotien or Endracion (F-9 / K-10). \n" ..
                       "Northern San d'Oria: Grilau (D-8). \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                trigger_on_talk = {" papsque's chambers on the third floor of the cathedral."},
                zone_max_distance = 40,
                visual_zones = {
                    -- Green Square around
                    --Aravoge, T.K for crystal trades
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = -104.9, y = 0.0, z = -53.1 }, size = 1, floor_id = 0, colour = "green" },
                    --Arpevion, T.K
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = 105.2, y = 0.0, z = -53.0 }, size = 1, floor_id = 0, colour = "green" },
                    --Achantere, T.K
                    { zone_name = "Northern San d'Oria", type = 'square', center = { x = -247.2, y = 7.0, z = 40.9 }, size = 1, floor_id = 0, colour = "green" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "F-9", offsetX = 16, offsetY = 16 },
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 2
                text = "Step 2: Go to the Cathedral (M-6) in Northern San d'Oria and examine the Door: Papal Chambers on the THIRD floor for a cutscene. \n \n" ..
                       "You must view this before heading to the Bostaunieux Oubliette. \n \n",
                onmob_target = {"Door: Papal Chambers"},
                trigger_on_event_id = {7},
                route_to = "Northern San d'Oria",
                destination_highlight = {position = "M-6", offsetX = 16, offsetY = 16},
                zone_max_distance = 15,
                visual_zones = {
                    { zone_name = "Northern San d'Oria", type = 'arrow', center = { x = 109.0, y = 0.0, z = 101.6 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Northern San d'Oria", type = 'arrow', center = { x = 125.2, y = 0.0, z = 112.1 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Northern San d'Oria", type = 'arrow', center = { x = 134.3, y = -6.5, z = 93.7 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Northern San d'Oria", type = 'arrow', center = { x = 122.3, y = -6.5, z = 106.0 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Northern San d'Oria", type = 'arrow', center = { x = 132.1, y = -11.0, z = 124.2 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" }
                },
            },
            { -- Step 3
                text = "Step 3: Enter the Bostaunieux Oubliette from Chateau d'Oraguille at (I-8). \n \n" ..
                       "Chateau d'Oraguille is entered from Northern San d'Oria at (I-9). \n" ..
                       "Head down to the lower level of the Chateau and zone in at (I-8). \n \n" ..
                       "===== Alternative: Unity Warp (100 Accolades) ===== \n" ..
                       "Any Unity Concord NPC > 'Bring Me to a Wanted encounter area' > Content level 122 > Bostaunieux Oubliette. \n" ..
                       "This warps you straight to the West Ronfaure end of the zone - if you use this you can skip the next step. \n \n",
                zone_trigger = "Bostaunieux Oubliette",
                route_to = "Bostaunieux Oubliette",
                --destination_highlight = {position = "I-8", offsetX = 16, offsetY = 16},
                zone_max_distance = 20,
                visual_zones = {
                        { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = 1.9, y = 0.0, z = -3.5 }, size = 3, direction = "right", floor_id = 0, colour = "yellow" },
                        { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = 16.0, y = 0.0, z = -4.4 }, size = 3, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = 17.4, y = 0.0, z = 12.0 }, size = 3, direction = "right", floor_id = 0, colour = "yellow" },
                        { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = 43.2, y = 3.0, z = 12.5 }, size = 3, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = 28.4, y = 7.5, z = 24.2 }, size = 3, direction = "left", floor_id = 0, colour = "yellow" },
                },

            },
            { -- Step 4
                text = "Step 4: Cross the Bostaunieux Oubliette and zone out into West Ronfaure at (E-8). \n \n" ..
                       "Drop down the sewer hatch at (E-7)/(E-8) on Map 1 - talk to Couchatorage to drop down. \n" ..
                       "Use Sneak/Silent Oil BEFORE moving - Haunts and Garm will aggro even at Lv90. \n",
                zone_trigger = "West Ronfaure",
                zone_max_distance = 25,
                onmob_target = "Couchatorage",
                visual_zones = {
                    { zone_name = "Bostaunieux Oubliette", type = 'arrow', center = { x = 99.1, y = -24.0, z = 70.3 }, size = 4, direction = "down", floor_id = 15, colour = "yellow" },
                    { zone_name = "Bostaunieux Oubliette", type = 'arrow', center = { x = 98.5, y = -24.0, z = 43.3 }, size = 4, direction = "down", floor_id = 15, colour = "yellow" },
                    { zone_name = "Bostaunieux Oubliette", type = 'arrow', center = { x = 100.8, y = -24.0, z = 19.6 }, size = 4, direction = "left", floor_id = 15, colour = "yellow" },
                    { zone_name = "Bostaunieux Oubliette", type = 'arrow', center = { x = 56.3, y = -24.1, z = 19.9 }, size = 4, direction = "left", floor_id = 15, colour = "yellow" },
                    { zone_name = "Bostaunieux Oubliette", type = 'arrow', center = { x = 20.1, y = -24.0, z = 20.1 }, size = 4, direction = "left", floor_id = 15, colour = "yellow" },
                    { zone_name = "Bostaunieux Oubliette", type = 'rect', center = { x = 16.0, y = -25.5, z = 20.0 }, width = 2.00, height = 3.00, floor_id = 15, colour = "cyan", vertical_axis = 'z' },
                    { zone_name = "Bostaunieux Oubliette", type = 'arrow', center = { x = -7.7, y = -19.0, z = 19.7 }, size = 4, direction = "left", floor_id = 15, colour = "yellow" },

                    -- bottom floor
                    { zone_name = "Bostaunieux Oubliette", type = 'square', center = { x = -11.7, y = 1.1, z = 25.4 }, size = 1, floor_id = 16, colour = "green" },
                    { zone_name = "Bostaunieux Oubliette", type = 'arrow', center = { x = -20.0, y = 1.1, z = 18.4 }, size = 3, direction = "down", floor_id = 16, colour = "yellow" },
                    { zone_name = "Bostaunieux Oubliette", type = 'arrow', center = { x = -22.1, y = 0.0, z = -0.9 }, size = 3, direction = "down", floor_id = 16, colour = "yellow" },
                    { zone_name = "Bostaunieux Oubliette", type = 'arrow', center = { x = -18.1, y = 0.0, z = -33.1 }, size = 3, direction = "down", floor_id = 16, colour = "yellow" },
                    { zone_name = "Bostaunieux Oubliette", type = 'arrow', center = { x = -19.1, y = -0.1, z = -59.5 }, size = 3, direction = "left", floor_id = 16, colour = "yellow" },
                    { zone_name = "Bostaunieux Oubliette", type = 'arrow', center = { x = -55.1, y = 0.1, z = -58.3 }, size = 3, direction = "left", floor_id = 16, colour = "yellow" },
                    { zone_name = "Bostaunieux Oubliette", type = 'arrow', center = { x = -74.4, y = 0.0, z = -58.5 }, size = 3, direction = "left", floor_id = 16, colour = "yellow" },
                    { zone_name = "Bostaunieux Oubliette", type = 'arrow', center = { x = -102.6, y = -0.1, z = -62.2 }, size = 3, direction = "left", floor_id = 16, colour = "yellow" },
                    { zone_name = "Bostaunieux Oubliette", type = 'arrow', center = { x = -140.6, y = -0.1, z = -61.6 }, size = 3, direction = "down", floor_id = 16, colour = "yellow" },
                    { zone_name = "Bostaunieux Oubliette", type = 'arrow', center = { x = -140.7, y = -0.1, z = -99.4 }, size = 3, direction = "left", floor_id = 16, colour = "yellow" },
                    { zone_name = "Bostaunieux Oubliette", type = 'arrow', center = { x = -169.9, y = -0.0, z = -103.1 }, size = 3, direction = "nw", floor_id = 16, colour = "yellow" },
                    { zone_name = "Bostaunieux Oubliette", type = 'arrow', center = { x = -180.0, y = 0.0, z = -97.3 }, size = 3, direction = "left", floor_id = 16, colour = "yellow" },
                    { zone_name = "Bostaunieux Oubliette", type = 'arrow', center = { x = -206.0, y = -0.0, z = -97.9 }, size = 3, direction = "left", floor_id = 16, colour = "yellow" },
                    { zone_name = "Bostaunieux Oubliette", type = 'arrow', center = { x = -221.3, y = -0.1, z = -100.4 }, size = 3, direction = "down", floor_id = 16, colour = "yellow" },
                    { zone_name = "Bostaunieux Oubliette", type = 'arrow', center = { x = -221.7, y = 0.0, z = -124.9 }, size = 3, direction = "down", floor_id = 16, colour = "yellow" },
                    { zone_name = "Bostaunieux Oubliette", type = 'arrow', center = { x = -218.5, y = 0.1, z = -150.4 }, size = 3, direction = "down", floor_id = 16, colour = "yellow" },
                    { zone_name = "Bostaunieux Oubliette", type = 'arrow', center = { x = -220.0, y = 0.0, z = -169.7 }, size = 3, direction = "down", floor_id = 16, colour = "yellow" },
                    { zone_name = "Bostaunieux Oubliette", type = 'arrow', center = { x = -219.7, y = 0.0, z = -180.2 }, size = 3, direction = "left", floor_id = 16, colour = "yellow" },
                    { zone_name = "Bostaunieux Oubliette", type = 'arrow', center = { x = -260.3, y = 0.0, z = -179.6 }, size = 3, direction = "left", floor_id = 16, colour = "yellow" },
                    { zone_name = "Bostaunieux Oubliette", type = 'arrow', center = { x = -284.4, y = 0.0, z = -181.5 }, size = 3, direction = "left", floor_id = 16, colour = "yellow" },
                    { zone_name = "Bostaunieux Oubliette", type = 'arrow', center = { x = -312.9, y = -0.0, z = -178.3 }, size = 3, direction = "left", floor_id = 16, colour = "yellow" },
                    { zone_name = "Bostaunieux Oubliette", type = 'arrow', center = { x = -340.0, y = -0.1, z = -179.5 }, size = 3, direction = "down", floor_id = 16, colour = "yellow" },
                    { zone_name = "Bostaunieux Oubliette", type = 'arrow', center = { x = -340.2, y = -0.0, z = -219.8 }, size = 3, direction = "left", floor_id = 16, colour = "yellow" },
                    { zone_name = "Bostaunieux Oubliette", type = 'arrow', center = { x = -381.0, y = -4.0, z = -220.1 }, size = 3, direction = "down", floor_id = 16, colour = "yellow" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Bostaunieux Oubliette",
                        floor_id = 15,
                        highlights = {
                            { position = "E-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Bostaunieux Oubliette",
                        floor_id = 16,
                        highlights = {
                            { position = "E-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 5
                text = "Step 5: Examine the ??? at West Ronfaure (E-8) to spawn Marauder Dvogzog, then defeat him. \n \n" ..
                       "Marauder Dvogzog (Lv67 Orc Monk, ~16,000 HP): \n" ..
                       "- Uses Hundred Fists at around 50% HP - BIND him and back off while it is up \n \n" ..
                       "NOTE: If you wipe and zone, you must wait 5-10 minutes before the ??? will pop him again. \n \n",
                onmob_target = {"west-ronfaure-???-e8"},
                onmob_enemy = "Marauder Dvogzog",
                onmob_enemy_colour = "red",
                onmob_enemy_size = 2,
                kill_requirement = {
                    count = 1,
                    enemies = {"Marauder Dvogzog"},
                    zone = "West Ronfaure",
                    count_party_kills = true,
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "West Ronfaure",
                        highlights = {
                            { position = "E-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 6
                text = "Step 6: Examine the ??? again to receive KI:Ancient San d'Orian tablet. \n \n" ..
                       "EVERYONE on the mission must examine it individually. \n \n" ..
                       "WARNING: If you zone before examining the ???, you have to kill Marauder Dvogzog all over again. \n \n",
                onmob_target = {"west-ronfaure-???-e8"},
                trigger_on_keyitem_obtain = {283},
                keyitems_needed = {283},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 6,
                        zone_name = "West Ronfaure",
                        highlights = {
                            { position = "E-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 7
                text = "Step 7: Return to the Cathedral (M-6) in Northern San d'Oria and examine the Door: Papal Chambers for the final cutscene. \n \n" ..
                       "The mission completes after this cutscene. \n \n",
                onmob_target = {"Door: Papal Chambers"},
                trigger_on_event_id = {8},
                route_to = "Northern San d'Oria",
                destination_highlight = {position = "M-6", offsetX = 16, offsetY = 16},
                zone_max_distance = 15,
                visual_zones = {
                    { zone_name = "Northern San d'Oria", type = 'arrow', center = { x = 109.0, y = 0.0, z = 101.6 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Northern San d'Oria", type = 'arrow', center = { x = 125.2, y = 0.0, z = 112.1 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Northern San d'Oria", type = 'arrow', center = { x = 134.3, y = -6.5, z = 93.7 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Northern San d'Oria", type = 'arrow', center = { x = 122.3, y = -6.5, z = 106.0 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Northern San d'Oria", type = 'arrow', center = { x = 132.1, y = -11.0, z = 124.2 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" }
                },
            },
        },
        reward = {
            text = "Rank Points (1000)"
        }
    },

    ["7-2: The Secret Weapon"] = {
        prerequisites = {
            {category = "Missions", subfile = "SanDoria", name = "7-1: Prestige of the Papsque"},
        },
        steps = {
            { -- Step 1
                text = "Step 1: Trade 2 stacks of crystals to a San d'Orian Gate Guard (or repeat missions) to build Rank Bar. \n \n" ..
                       "Talk to any San d'Orian Gate Guard. He will NOT offer you the mission list - instead he says: \n" ..
                       "'Go to the garden for further instructions.' \n \n" ..
                       "Southern San d'Oria: Ambrotien or Endracion (F-9 / K-10). \n" ..
                       "Northern San d'Oria: Grilau (D-8). \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                trigger_on_event_id = {1041, 1042},
                zone_max_distance = 40,
                visual_zones = {
                    -- Green Square around
                    --Aravoge, T.K for crystal trades
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = -104.9, y = 0.0, z = -53.1 }, size = 1, floor_id = 0, colour = "green" },
                    --Arpevion, T.K
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = 105.2, y = 0.0, z = -53.0 }, size = 1, floor_id = 0, colour = "green" },
                    --Achantere, T.K
                    { zone_name = "Northern San d'Oria", type = 'square', center = { x = -247.2, y = 7.0, z = 40.9 }, size = 1, floor_id = 0, colour = "green" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "F-9", offsetX = 16, offsetY = 16 },
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 2
                text = "Step 2: Go to Queen Leaute's Garden (F-7) in Chateau d'Oraguille for a cutscene. \n \n" ..
                       "The cutscene triggers on entering the garden area - there is no NPC to talk to. \n \n",
                trigger_zones = {
                    { zone_name = "Chateau d'Oraguille", type = 'square', center = { x = -85.2, y = 0.4, z = 77.9 }, size = 8, colour = "cyan" },
                },
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "F-7", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -5.9, y = 0.0, z = -4.0 }, size = 3, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -15.4, y = 0.0, z = -6.0 }, size = 3, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -15.8, y = -3.0, z = 35.9 }, size = 3, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -37.3, y = -3.0, z = 35.8 }, size = 3, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -59.6, y = -3.0, z = 35.5 }, size = 3, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -59.7, y = -3.0, z = 52.0 }, size = 3, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -69.6, y = -3.0, z = 51.6 }, size = 3, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -84.1, y = -1.1, z = 57.8 }, size = 3, direction = "up", floor_id = 0, colour = "yellow" },
                },

            },
            { -- Step 3
                text = "Step 3: Return to a San d'Orian Gate Guard to actually ACCEPT the mission. \n \n" ..
                       "The mission list will now be offered to you. \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau","Faurie"},
                trigger_on_talk = {" would deal a great blow to all of San d'Oria."},
                zone_max_distance = 25,
                visual_zones = {

                    -- Exit Chateau D'Oraguille
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -83.7, y = 0.4, z = 75.7 }, size = 3, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -79.2, y = -3.0, z = 51.7 }, size = 3, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -59.4, y = -3.0, z = 51.8 }, size = 3, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -58.3, y = -3.0, z = 35.7 }, size = 3, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -38.5, y = -3.0, z = 36.2 }, size = 3, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -16.1, y = -3.0, z = 35.8 }, size = 3, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -15.8, y = 0.0, z = 14.2 }, size = 3, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -15.1, y = 0.0, z = -3.9 }, size = 3, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = 0.3, y = 0.0, z = -6.5 }, size = 3, direction = "down", floor_id = 0, colour = "yellow" },

                    -- Green Square around
                    --Aravoge, T.K for crystal trades
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = -104.9, y = 0.0, z = -53.1 }, size = 1, floor_id = 0, colour = "green" },
                    --Arpevion, T.K
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = 105.2, y = 0.0, z = -53.0 }, size = 1, floor_id = 0, colour = "green" },
                    --Achantere, T.K
                    { zone_name = "Northern San d'Oria", type = 'square', center = { x = -247.2, y = 7.0, z = 40.9 }, size = 1, floor_id = 0, colour = "green" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "F-9", offsetX = 16, offsetY = 16 },
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 4
                text = "Step 4: Travel to Horlais Peak with your party. \n \n" ..
                       "Notes: Orcs sight-aggro, Bats aggro by sound. Use Sneak/Invis if low level. \n \n" ..
                       "Shortcut: Yughott Grotto Home Point #1 (J-6), or Domenic for 750g if Beyond Infinity is complete. \n \n",
                zone_max_distance = 35,
                zone_trigger = "Horlais Peak",
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

                        -- Fort Ghelsba 2
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
                  },
            },
            { -- Step 5
                text = "Step 5: Examine the Burning Circle to enter BCNM 'The Secret Weapon'. \n \n" ..
                       "Requirements: \n" ..
                       "- Max 6 players, all must be on (or have completed) this mission \n" ..
                       "- Buffs wear on entry \n" ..
                       "- NO EXP loss on defeat \n \n" ..
                       "Enemies (all Lv68) - attacking ONE aggros them ALL: \n" ..
                       "- Darokbok of Clan Reaper (PLD, ~4000 HP) \n" ..
                       "- Derakbak of Clan Wolf (DRG, ~4000 HP + ~1000 HP Wyvern) \n" ..
                       "- Jagidbod of Clan Reaper (RNG, ~4000 HP) \n" ..
                       "- Reaper Clan Warmachine (~1800 HP) \n" ..
                       "- Wolf Clan Warmachine (~1800 HP) \n \n" ..
                       "Tips: \n" ..
                       "- All are vulnerable to Sleep and Lullaby - Darokbok resists (use Elemental Seal + Sleepga, or Horde Lullaby) \n" ..
                       "- The Orcs use their 1hrs below 50percent HP \n" ..
                       "- You do NOT need to kill the Wyvern - leave it slept \n" ..
                       "- Soloable on many jobs, especially with /SCH \n \n" ..
                       "Victory: KI:Crystal dowser",
                onmob_target = "horlais-peak-burning-circle",
                trigger_on_event_id = {32001},
                onmob_enemy = {"Darokbok of Clan Reaper", "Derakbak of Clan Wolf", "Jagidbod of Clan Reaper", "Reaper Clan Warmachine", "Wolf Clan Warmachine"},
                onmob_enemy_colour = "red",
                onmob_enemy_size = 2,
                kill_requirement = {
                    count = 5,
                    enemies = {"Darokbok of Clan Reaper", "Derakbak of Clan Wolf", "Jagidbod of Clan Reaper", "Reaper Clan Warmachine", "Wolf Clan Warmachine"},
                    zone = "Horlais Peak",
                    count_party_kills = true,
                    display_only = true,
                },
            },
            { -- Step 6
                text = "Step 6: Warp out, and report back to any San d'Orian Gate Guard to complete the mission. \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                trigger_on_event_id = {1043, 1044},
                route_to = "Southern San d'Oria",
                zone_max_distance = 40,
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 6,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "F-9", offsetX = 16, offsetY = 16 },
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 6,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
        reward = {
            text = "Rank 8, 60,000 gil"
        }
    },

    ["8-1: Coming of Age"] = {
        prerequisites = {
            {category = "Missions", subfile = "SanDoria", name = "7-2: The Secret Weapon"},
        },
        steps = {
            { -- Step 1
                text = "Step 1: Trade 3 stacks of crystals to a San d'Orian Gate Guard (or repeat missions) to build Rank Bar. \n \n" ..
                       "Talk to any San d'Orian Gate Guard to accept the mission. \n \n" ..
                       "Southern San d'Oria: Ambrotien or Endracion (F-9 / K-10). \n" ..
                       "Northern San d'Oria: Grilau (D-8). \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                trigger_on_talk = {" your next mission from Sir Halver."},
                zone_max_distance = 40,
                visual_zones = {
                    -- Green Square around
                    --Aravoge, T.K for crystal trades
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = -104.9, y = 0.0, z = -53.1 }, size = 1, floor_id = 0, colour = "green" },
                    --Arpevion, T.K
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = 105.2, y = 0.0, z = -53.0 }, size = 1, floor_id = 0, colour = "green" },
                    --Achantere, T.K
                    { zone_name = "Northern San d'Oria", type = 'square', center = { x = -247.2, y = 7.0, z = 40.9 }, size = 1, floor_id = 0, colour = "green" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "F-9", offsetX = 16, offsetY = 16 },
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 2
                text = "Step 2: Zone into Chateau d'Oraguille for a cutscene of Princess Claidie speaking to her Mother about her coming-of-age ceremony. \n \n" ..
                       "This fires on ZONING IN - there is no NPC to talk to. \n \n",
                trigger_on_event_id = {116},
                zone_trigger = "Chateau d'Oraguille",
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
            },
            { -- Step 3
                text = "Step 3: Speak to Halver in Chateau d'Oraguille. \n \n" ..
                       "He will send you to the Quicksand Caves to collect KI:Drops of Amnio. \n \n",
                onmob_target = {"Halver"},
                trigger_on_event_id = {58},
                zone_max_distance = 20,
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
            },
            { -- Step 4
                text = "Step 4: Travel to the Fountain of Kings in the Quicksand Caves. \n \n" ..
                        "Honor (Lv70, ~6000 HP): casts Paralyga and Silencega. \n" ..
                       "Valor: uses Hundred Fists. Easier for a magic-heavy party. \n \n" ..
                       "- Both are vulnerable to Gravity and Bind, but IMMUNE to all Sleep \n" ..
                       "- They spawn underwater in the pool and do NOT link \n" ..
                       "- To pull one: go to the left/right wall, cancel Sneak, and creep in so only one aggros \n" ..
                       "- They despawn exactly 3 minutes after spawning \n" ..
                       "- After a despawn it takes ~10 minutes before you can pop them again \n \n" ..
                       "COURTESY: They aggro anyone nearby, including fishers camping Cave Cherax - warn them before you pop. \n \n" ..
                       "If anyone is under Lv67, clear the room and the connecting hallway first. \n \n",
                --route_to = "Quicksand Caves",
                --zone_trigger = "Quicksand Caves",
                destination_highlight = {position = "H-10", offsetX = 16, offsetY = 16},
                zone_max_distance = 40,
                onmob_target = {"quicksand-caves-fountain-of-kings"},
                onmob_enemy = {"Honor", "Valor"},
                onmob_enemy_colour = "red",
                onmob_enemy_size = 2,
                kill_requirement = {
                    count = 2,
                    enemies = {"Honor", "Valor"},
                    zone = "Quicksand Caves",
                    count_party_kills = true,
                },
                visual_zones = {
                    -- Eastern Altepa Desert path down
                    { zone_name = "Eastern Altepa Desert", type = 'arrow', center = { x = -19.3, y = 1.5, z = -210.0 }, size = 4, direction = "down", floor_id = 0, colour = "cyan" },
                    { zone_name = "Eastern Altepa Desert", type = 'arrow', center = { x = -18.4, y = 10.8, z = -258.8 }, size = 4, direction = "right", floor_id = 0, colour = "cyan" },
                    { zone_name = "Eastern Altepa Desert", type = 'arrow', center = { x = 19.9, y = 10.2, z = -261.7 }, size = 4, direction = "down", floor_id = 0, colour = "cyan" },
                    { zone_name = "Eastern Altepa Desert", type = 'arrow', center = { x = 21.1, y = 13.3, z = -297.0 }, size = 4, direction = "down", floor_id = 0, colour = "cyan" },

                    --drop down quicksand
                    { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 700.0, y = -24.0, z = -696.2 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                    { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 697.6, y = -20.1, z = -740.4 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 651.3, y = -16.0, z = -740.3 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 622.5, y = -16.1, z = -740.8 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 579.9, y = -16.0, z = -739.5 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 542.0, y = -16.0, z = -741.3 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 482.2, y = -16.1, z = -740.8 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 458.9, y = -16.0, z = -740.8 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                    { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 464.0, y = -14.7, z = -783.6 }, size = 4, direction = "se", floor_id = 2, colour = "yellow" },
                    { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 484.2, y = -14.5, z = -805.3 }, size = 4, direction = "se", floor_id = 2, colour = "yellow" },
                    { zone_name = "Quicksand Caves", type = 'square', center = { x = 496.2, y = -9.9, z = -815.9 }, size = 3, floor_id = 2, colour = "green" },

                    -- Fountian of Kings
                    { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 498.0, y = 5.8, z = -819.8 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                    { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 501.7, y = 1.0, z = -849.1 }, size = 4, direction = "sw", floor_id = 2, colour = "yellow" },
                    { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 480.8, y = 1.0, z = -862.7 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 460.7, y = 1.3, z = -864.5 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                    { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 470.7, y = 1.0, z = -901.2 }, size = 4, direction = "right", floor_id = 2, colour = "yellow" },
                    { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 500.8, y = 6.1, z = -906.8 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                    { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 507.0, y = 14.1, z = -939.5 }, size = 4, direction = "right", floor_id = 2, colour = "yellow" },
                    { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 561.0, y = 18.3, z = -939.7 }, size = 4, direction = "right", floor_id = 2, colour = "yellow" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Eastern Altepa Desert",
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Quicksand Caves",
                        floor_id = 2,
                        highlights = {
                            { position = "E-11", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 5
                text = "Step 5: Once BOTH are gone (dead or despawned), inspect the Fountain of Kings again to receive KI:Drops of Amnio. \n \n",
                onmob_target = {"quicksand-caves-fountain-of-kings"},
                keyitems_needed = {288},
                trigger_on_keyitem_obtain = {288},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Quicksand Caves",
                        floor_id = 2,
                        highlights = {
                            { position = "E-11", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 7
                text = "Step 6: Return to Halver in Chateau d'Oraguille. \n \n" ..
                       "NOTE: Your mission log will now say COMPLETE, but you CANNOT start 8-2 yet - see the next step. \n \n",
                onmob_target = {"Halver"},
                trigger_on_event_id = {102},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
            },
            { -- Step 8
                text = "Step 7: Wait 1 MINUTE, then zone into Northern San d'Oria for the final cutscene. \n \n" ..
                       "The cutscene fires on zoning in (not from your Mog House). \n \n" ..
                       "Until you view it, the Gate Guards will refuse to give you any new mission - so do not skip this. \n \n",
                trigger_on_event_id = {16},
                zone_trigger = "Northern San d'Oria",
                route_to = "Northern San d'Oria",
            },
        },
        reward = {
            text = "Rank Points (800)"
        }
    },

    ["8-2: Lightbringer"] = {
        prerequisites = {
            {category = "Missions", subfile = "SanDoria", name = "8-1: Coming of Age"},
        },
        steps = {
            { -- Step 1
                text = "Step 1: Talk to any San d'Orian Gate Guard to accept the mission. \n \n" ..
                       "NOTE: If the guards refuse you, you have not viewed the final cutscene from Mission 8-1 - zone into Northern San d'Oria first. \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                trigger_on_talk = {" Do not let us down."},
                zone_max_distance = 40,
                visual_zones = {
                    -- Green Square around
                    --Aravoge, T.K for crystal trades
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = -104.9, y = 0.0, z = -53.1 }, size = 1, floor_id = 0, colour = "green" },
                    --Arpevion, T.K
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = 105.2, y = 0.0, z = -53.0 }, size = 1, floor_id = 0, colour = "green" },
                    --Achantere, T.K
                    { zone_name = "Northern San d'Oria", type = 'square', center = { x = -247.2, y = 7.0, z = 40.9 }, size = 1, floor_id = 0, colour = "green" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "F-9", offsetX = 16, offsetY = 16 },
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 2
                text = "Step 2: Go to Chateau d'Oraguille and examine the Door: Great Hall for a cutscene with the King. \n \n",
                onmob_target = {"Door: Great Hall"},
                trigger_on_event_id = {100},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
                zone_max_distance = 20,
            },
            { -- Step 3
                text = "Step 3: Speak to Rahal in the Royal Knights' Quarters. \n \n" ..
                       "He gives you KI:Crystal dowser. \n \n" ..
                       "BEFORE YOU LEAVE: Check your inventory/storage for a Prelate Key. It is Ex/Rare so you can only hold one - bring it, it opens a door later. \n \n" ..
                       "(Optional: Curilla has extra dialogue at this point.) \n \n",
                onmob_target = {"Rahal"},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "H-9", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {106},
                zone_max_distance = 20,
                visual_zones = {
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = 1.0, y = 0.0, z = -3.5 }, size = 3, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Chateau d'Oraguille", type = 'arrow', center = { x = -16.5, y = 0.0, z = -3.8 }, size = 3, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Chateau d'Oraguille", type = 'rect', center = { x = -19.5, y = -1.2, z = -4.0 }, width = 2.75, height = 2.50, floor_id = 0, colour = "cyan", vertical_axis = 'z' },
                },
            },
            { -- Step 4
                text = "Step 4: Travel to the Temple of Uggalepih - you need to reach MAP 2. \n \n" ..
                       "Lv72+ is safe from aggro on the first floor. Mobs past the Granite Doors on Map 2 will aggro even a Lv99. \n \n" ..
                       "===== Fastest ===== \n" ..
                       "Unity warp to Temple of Uggalepih (content level 125) - this drops you straight onto Map 2. \n \n" ..
                       "===== Otherwise ===== \n" ..
                       "Survival Guide to Temple of Uggalepih, turn around and head north into Yhoator Jungle. \n" ..
                       "Or reach Yhoator Jungle by Teleport-Yhoat / outpost / walking, and go to the main temple entrance at (J-12). \n \n" ..
                       "===== Map 1 -> Map 2 ===== \n" ..
                       "Zone into the Temple (Map 1) and follow the RIGHT wall until you zone back out into the jungle at (F-5). \n" ..
                       "In the jungle you will see stairs leading down. DO NOT take them. \n" ..
                       "Turn LEFT, then instantly LEFT again to zone into the other part of the Temple (Map 2). \n \n",
                route_to = "Temple of Uggalepih",
                onmob_enemy = {"Tonberry Cutter", "Tonberry Stabber","Tonberry Slasher"},
                zone_max_distance = 35,
                -- We are no on map 2 and ready for nmexts tep to find the key.
                trigger_zones = {
                    { zone_name = "Temple of Uggalepih", type = 'square', center = { x = -60.0, y = -8.0, z = 76.9 }, size = 8, floor_id = 2, colour = "magenta" },
                },
                visual_zones = {

                    -- Yutungha Jungle
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -234.1, y = 0.4, z = 490.4 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -207.7, y = 0.3, z = 451.6 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -206.1, y = 0.4, z = 407.7 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -221.1, y = 0.4, z = 370.7 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -247.3, y = 0.0, z = 317.7 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -262.0, y = 9.2, z = 268.2 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -271.6, y = 7.6, z = 219.9 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -301.9, y = 0.3, z = 201.8 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -302.6, y = 0.2, z = 163.4 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -272.6, y = 7.9, z = 140.0 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -259.5, y = 8.3, z = 81.9 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -259.5, y = 4.6, z = 61.2 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -221.6, y = 0.5, z = 73.3 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -205.8, y = 8.2, z = 98.9 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -178.2, y = 8.4, z = 123.3 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -162.7, y = 0.0, z = 194.2 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -116.6, y = 0.0, z = 192.4 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -61.5, y = 8.1, z = 164.7 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -61.1, y = 8.3, z = 118.6 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -33.4, y = 7.2, z = 99.4 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -19.5, y = 4.0, z = 95.6 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -1.9, y = 8.3, z = 60.7 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = 40.6, y = 8.3, z = 18.4 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = 109.2, y = 8.2, z = 21.4 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },

                    -- Yhoator Jungle to Temple of Ugg
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = -476.0, y = 8.4, z = 58.3 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = -431.9, y = 8.7, z = 58.1 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = -401.8, y = 8.3, z = 61.4 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = -373.8, y = 3.1, z = 59.7 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = -370.6, y = 1.3, z = 19.7 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = -337.4, y = 4.4, z = 19.5 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = -294.2, y = 1.3, z = 59.9 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = -260.4, y = 4.7, z = 58.1 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = -250.0, y = 7.5, z = 20.7 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = -219.6, y = 4.3, z = 18.4 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = -212.2, y = 7.1, z = -22.3 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = -165.8, y = 8.5, z = -19.4 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = -142.2, y = 0.4, z = 8.5 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = -123.0, y = 0.1, z = 24.5 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = -96.1, y = 0.0, z = 29.9 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = -69.5, y = 1.0, z = 19.2 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = -59.8, y = 0.4, z = -4.9 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = -45.9, y = 8.2, z = -20.0 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = -12.9, y = 0.7, z = -29.2 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = -22.6, y = 2.0, z = -63.2 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = -21.0, y = 8.5, z = -103.3 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = -20.9, y = 0.4, z = -152.8 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = -16.6, y = 6.0, z = -182.6 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = 19.4, y = 8.3, z = -200.0 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = 20.8, y = 8.1, z = -230.0 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = 2.9, y = 8.3, z = -258.7 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = -38.5, y = 0.0, z = -275.0 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = -35.5, y = 0.3, z = -326.9 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = -32.6, y = 0.3, z = -360.8 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = -3.3, y = 0.6, z = -384.7 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = 45.6, y = 0.3, z = -391.0 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = 94.9, y = 0.6, z = -400.8 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = 125.1, y = 0.1, z = -408.6 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = 155.3, y = 8.2, z = -419.9 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = 179.3, y = 7.8, z = -433.5 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = 196.1, y = 0.0, z = -476.5 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = 232.1, y = 0.4, z = -498.0 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = 272.5, y = -0.0, z = -487.7 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = 298.1, y = -0.2, z = -486.8 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = 299.5, y = -4.0, z = -540.8 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = 310.5, y = -4.0, z = -571.7 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = 300.0, y = -4.0, z = -586.4 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = 299.5, y = -4.0, z = -614.6 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },

                    -- Inside Temple of Ugg Map 1, follow right wall back out to the jungle
                    { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = 197.9, y = 0.0, z = 20.4 }, size = 3, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = 220.0, y = -0.1, z = 20.3 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = 220.0, y = 0.0, z = 1.3 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = 219.7, y = -0.0, z = -22.3 }, size = 3, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = 180.1, y = 0.0, z = -21.9 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = 177.5, y = 0.0, z = -64.4 }, size = 3, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = 139.7, y = -0.0, z = -63.4 }, size = 3, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = 139.6, y = 0.0, z = -29.5 }, size = 3, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = 139.8, y = 0.0, z = -8.7 }, size = 3, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = 139.5, y = 0.0, z = 20.3 }, size = 3, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = 98.6, y = -0.1, z = 20.8 }, size = 3, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = 97.3, y = -4.8, z = 60.4 }, size = 3, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = 76.8, y = -8.0, z = 60.1 }, size = 3, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = 60.7, y = -7.9, z = 61.4 }, size = 3, direction = "up", floor_id = 1, colour = "yellow" },

                    -- -- Back into the Temple (Map 2) from the jungle - do NOT take the stairs down from (F-5) exit
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = 65.6, y = -10.0, z = -488.5 }, size = 3, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = 31.8, y = -10.0, z = -488.5 }, size = 3, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = 32.5, y = -10.0, z = -454.3 }, size = 3, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = 7.7, y = -10.0, z = -453.8 }, size = 3, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = 7.8, y = -10.0, z = -480.2 }, size = 3, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = 7.8, y = -10.0, z = -500.6 }, size = 3, direction = "down", floor_id = 0, colour = "yellow" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Yhoator Jungle",
                        highlights = {
                            { position = "H-11", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Temple of Uggalepih",
                        floor_id = 1,
                        highlights = {
                            { position = "F-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Temple of Uggalepih",
                        floor_id = 2,
                        highlights = {
                            { position = "I-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 5
                text = "Step 5: Get both keys on Map 2 - an Uggalepih Key, then a Prelate Key. \n \n" ..
                       "1) Kill Tonberry Cutters until one drops an Uggalepih Key. \n \n" ..
                       "2) Trade the Uggalepih Key to the Granite Door at (E-8) to open it and step inside (the key is consumed). \n \n" ..
                       "3) Inside the room, kill the Tonberry Slasher until it drops a Prelate Key (Ex/Rare - you can only hold one). \n \n" ..
                       "The Prelate Key opens the upper Granite Door in the next step. \n \n",
                items_needed = {"Uggalepih Key", "Prelate Key"},
                trigger_on_item_obtain = {"Prelate Key"},
                onmob_enemy = {"Tonberry Cutter", "Tonberry Stabber","Tonberry Slasher"},
                onmob_enemy_colour = "red",
                onmob_enemy_size = 2,
                zone_max_distance = 20,
                -- TODO: map visual_zones here - trade marker on the Granite Door at (E-8), floor_id = 2
                visual_zones = {
                       { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -59.9, y = -8.1, z = 77.3 }, size = 3, direction = "down", floor_id = 2, colour = "yellow" },
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -60.0, y = -8.1, z = 60.0 }, size = 3, direction = "left", floor_id = 2, colour = "yellow" },
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -82.0, y = -8.0, z = 60.0 }, size = 3, direction = "left", floor_id = 2, colour = "yellow" },
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -99.8, y = 0.0, z = 42.0 }, size = 3, direction = "down", floor_id = 2, colour = "yellow" },
                        { zone_name = "Temple of Uggalepih", type = 'rect', center = { x = -100.0, y = -1.9, z = 40.0 }, width = 8.00, height = 4.00, floor_id = 2, colour = "cyan", vertical_axis = 'ns' },
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -100.1, y = -0.1, z = 19.8 }, size = 3, direction = "left", floor_id = 2, colour = "yellow" },
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -129.9, y = 0.0, z = 20.2 }, size = 3, direction = "left", floor_id = 2, colour = "yellow" },
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -151.3, y = 0.0, z = 20.3 }, size = 3, direction = "left", floor_id = 2, colour = "yellow" },
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -180.0, y = -0.1, z = 18.9 }, size = 3, direction = "down", floor_id = 2, colour = "yellow" },
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -181.5, y = -0.1, z = -19.8 }, size = 3, direction = "left", floor_id = 2, colour = "yellow" },
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -204.0, y = -0.0, z = -20.0 }, size = 3, direction = "left", floor_id = 2, colour = "yellow" },
                        { zone_name = "Temple of Uggalepih", type = 'rect', center = { x = -208.0, y = -1.9, z = -20.0 }, width = 3.75, height = 3.75, floor_id = 2, colour = "cyan", vertical_axis = 'z' },

                        --past ugg door
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -213.2, y = -0.0, z = -19.7 }, size = 3, direction = "nw", floor_id = 2, colour = "yellow" },
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -220.0, y = -0.0, z = -10.5 }, size = 3, direction = "up", floor_id = 2, colour = "yellow" },
                        { zone_name = "Temple of Uggalepih", type = 'rect', center = { x = -220.0, y = -1.9, z = -8.0 }, width = 3.75, height = 4.00, floor_id = 2, colour = "cyan", vertical_axis = 'ns' },
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -220.0, y = -0.0, z = -3.5 }, size = 3, direction = "up", floor_id = 2, colour = "yellow" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Temple of Uggalepih",
                        floor_id = 2,
                        highlights = {
                            { position = "E-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 6
                text = "Step 6: Map 2 - reach the Granite Door, then continue up to the upper Granite Door onto Map 4. \n \n" ..
                       "Trade the Prelate Key (from the previous step) to the Granite Door at the top of either stairway. \n \n",
                zone_max_distance = 18,
                visual_zones = {
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -220.2, y = 0.0, z = 2.2 }, size = 3, direction = "down", floor_id = 2, colour = "yellow" },
                        { zone_name = "Temple of Uggalepih", type = 'rect', center = { x = -220.0, y = -1.9, z = -8.0 }, width = 3.75, height = 3.75, floor_id = 2, colour = "cyan", vertical_axis = 'ns' },
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -219.9, y = -0.1, z = -12.5 }, size = 3, direction = "se", floor_id = 2, colour = "yellow" },
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -210.9, y = 0.0, z = -20.0 }, size = 3, direction = "right", floor_id = 2, colour = "yellow" },
                        { zone_name = "Temple of Uggalepih", type = 'rect', center = { x = -208.0, y = -1.9, z = -20.0 }, width = 3.50, height = 3.75, floor_id = 2, colour = "cyan", vertical_axis = 'z' },
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -201.1, y = 0.0, z = -20.1 }, size = 3, direction = "right", floor_id = 2, colour = "yellow" },
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -179.9, y = -0.1, z = -19.3 }, size = 3, direction = "up", floor_id = 2, colour = "yellow" },
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -178.2, y = -0.1, z = 19.8 }, size = 3, direction = "right", floor_id = 2, colour = "yellow" },
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -149.8, y = 0.0, z = 20.0 }, size = 3, direction = "right", floor_id = 2, colour = "yellow" },
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -130.4, y = 0.0, z = 20.1 }, size = 3, direction = "right", floor_id = 2, colour = "yellow" },

                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -60.0, y = -8.1, z = 78.4 }, size = 3, direction = "down", floor_id = 2, colour = "yellow" },
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -60.4, y = -8.1, z = 59.8 }, size = 3, direction = "left", floor_id = 2, colour = "yellow" },
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -99.8, y = 0.0, z = 42.7 }, size = 3, direction = "down", floor_id = 2, colour = "yellow" },
                        { zone_name = "Temple of Uggalepih", type = 'rect', center = { x = -100.0, y = -1.9, z = 40.0 }, width = 8.00, height = 4.00, floor_id = 2, colour = "cyan", vertical_axis = 'ns' },
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -99.8, y = -0.1, z = 18.3 }, size = 3, direction = "down", floor_id = 2, colour = "yellow" },
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -103.2, y = 0.0, z = -5.5 }, size = 3, direction = "sw", floor_id = 2, colour = "yellow" },
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -111.9, y = 0.0, z = -19.0 }, size = 3, direction = "down", floor_id = 2, colour = "yellow" },
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -108.9, y = 0.0, z = -28.1 }, size = 3, direction = "se", floor_id = 2, colour = "yellow" },
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -100.3, y = 0.0, z = -38.7 }, size = 3, direction = "down", floor_id = 2, colour = "yellow" },
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -100.0, y = -0.1, z = -59.7 }, size = 3, direction = "down", floor_id = 2, colour = "yellow" },
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -100.0, y = 0.0, z = -80.6 }, size = 3, direction = "down", floor_id = 2, colour = "yellow" },
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -99.1, y = -0.1, z = -100.1 }, size = 3, direction = "right", floor_id = 2, colour = "yellow" },
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -74.7, y = -0.2, z = -100.1 }, size = 3, direction = "right", floor_id = 2, colour = "yellow" },
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -62.8, y = -0.1, z = -100.1 }, size = 3, direction = "right", floor_id = 2, colour = "yellow" },

                        -- step back
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -47.2, y = 0.5, z = -99.8 }, size = 3, direction = "ne", floor_id = 2, colour = "yellow" },
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -29.4, y = 0.5, z = -79.7 }, size = 3, direction = "se", floor_id = 2, colour = "yellow" },
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -18.0, y = -8.5, z = -96.2 }, size = 3, direction = "se", floor_id = 2, colour = "yellow" },
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -10.2, y = -8.7, z = -100.1 }, size = 3, direction = "right", floor_id = 2, colour = "yellow" },
                },
                onmob_target = {"temple-of-uggalepih-granite-door-j10"},
                onmob_enemy = {"Temple Guardian"},
                onmob_enemy_colour = "red",
                onmob_enemy_size = 2,
                trigger_zones = {
                        { zone_name = "Temple of Uggalepih", type = 'square', center = { x = 0.3, y = -9.0, z = -99.7 }, size = 8, floor_id = 4, colour = "magenta" },
                        { zone_name = "Temple of Uggalepih", type = 'square', center = { x = 0.3, y = -9.0, z = -99.7 }, size = 8, floor_id = 2, colour = "magenta" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 6,
                        zone_name = "Temple of Uggalepih",
                        floor_id = 2,
                        highlights = {
                            { position = "J-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 6,
                        zone_name = "Temple of Uggalepih",
                        floor_id = 4,
                    },
                },
            },
            { -- Step 7
                text = "Step 7: Map 4 - head south to the hall with 4 doors on its south side. \n \n" ..
                       "Counting from the WEST end: Doors 1, 2, 3, 4 (they all check as 'Granite Door' in game). \n \n" ..
                       "Clear the hallway of tonberries and magic jugs first. \n \n" ..
                       "Enter Door 1 and inspect the ??? for the 1st KI:Piece of a Broken Key. \n \n",
                onmob_target = {"temple-of-uggalepih-brokenkey3-???"},
                keyitems_needed = {287},
                trigger_on_keyitem_obtain = {287},
                zone_max_distance = 20,
                visual_zones = {
                    -- To first broken key
                    { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = 1.9, y = -9.0, z = -100.1 }, size = 3, direction = "right", floor_id = 4, colour = "yellow" },
                    { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = 7.4, y = -9.0, z = -99.4 }, size = 3, direction = "down", floor_id = 4, colour = "yellow" },
                    { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = 8.2, y = -9.0, z = -112.1 }, size = 3, direction = "right", floor_id = 4, colour = "yellow" },
                    { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = 20.1, y = -9.0, z = -112.1 }, size = 3, direction = "down", floor_id = 4, colour = "yellow" },
                    { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = 2.4, y = -17.0, z = -139.9 }, size = 3, direction = "left", floor_id = 4, colour = "yellow" },
                    { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -12.6, y = -17.0, z = -140.3 }, size = 3, direction = "left", floor_id = 4, colour = "yellow" },
                    { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -32.1, y = -17.0, z = -139.6 }, size = 3, direction = "left", floor_id = 4, colour = "yellow" },
                    { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -50.0, y = -17.0, z = -139.8 }, size = 3, direction = "left", floor_id = 4, colour = "yellow" },
                    { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -70.1, y = -17.0, z = -139.9 }, size = 3, direction = "down", floor_id = 4, colour = "yellow" },
                    { zone_name = "Temple of Uggalepih", type = 'rect', center = { x = -70.0, y = -18.8, z = -146.3 }, width = 3.25, height = 3.75, floor_id = 4, colour = "cyan", vertical_axis = 'ns' },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 7,
                        zone_name = "Temple of Uggalepih",
                        floor_id = 2,
                        highlights = {
                            { position = "J-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 7,
                        zone_name = "Temple of Uggalepih",
                        floor_id = 4,
                        highlights = {
                            { position = "G-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 8
                text = "Step 8: Enter Door 3 and inspect the ??? for the 2nd KI:Piece of a Broken Key. \n \n" ..
                       "(Door 2 does nothing until you hold all 3 pieces.) \n \n",
                onmob_target = {"temple-of-uggalepih-brokenkey2-???"},
                keyitems_needed = {286},
                trigger_on_keyitem_obtain = {286},
                zone_max_distance = 20,
                visual_zones = {
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -70.1, y = -17.0, z = -141.4 }, size = 3, direction = "right", floor_id = 4, colour = "yellow" },
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -49.2, y = -17.0, z = -140.2 }, size = 3, direction = "right", floor_id = 4, colour = "yellow" },
                        { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -29.7, y = -17.0, z = -141.3 }, size = 3, direction = "down", floor_id = 4, colour = "yellow" },
                        { zone_name = "Temple of Uggalepih", type = 'rect', center = { x = -30.0, y = -18.8, z = -146.3 }, width = 3.00, height = 3.50, floor_id = 4, colour = "cyan", vertical_axis = 'ns' },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 8,
                        zone_name = "Temple of Uggalepih",
                        floor_id = 2,
                        highlights = {
                            { position = "J-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 8,
                        zone_name = "Temple of Uggalepih",
                        floor_id = 4,
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 9
                text = "Step 9: Enter Door 4 and inspect the ??? for the 3rd KI:Piece of a Broken Key. \n \n" ..
                       "WARNING: Room 4 has TWO ???. The correct one is on the SHELVES TO THE RIGHT as you enter. \n \n" ..
                       "EVERYONE on the mission needs all 3 pieces before continuing. \n \n",
                onmob_target = {"temple-of-uggalepih-brokenkey1-???"},
                keyitems_needed = {285},
                trigger_on_keyitem_obtain = {285},
                zone_max_distance = 20,
                visual_zones = {
                    { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -30.3, y = -17.0, z = -140.2 }, size = 3, direction = "right", floor_id = 4, colour = "yellow" },
                    { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -10.4, y = -17.0, z = -141.8 }, size = 3, direction = "down", floor_id = 4, colour = "yellow" },
                    { zone_name = "Temple of Uggalepih", type = 'rect', center = { x = -10.0, y = -18.8, z = -146.3 }, width = 3.25, height = 3.50, floor_id = 4, colour = "cyan", vertical_axis = 'ns' },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 9,
                        zone_name = "Temple of Uggalepih",
                        floor_id = 2,
                        highlights = {
                            { position = "J-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 9,
                        zone_name = "Temple of Uggalepih",
                        floor_id = 4,
                        highlights = {
                            { position = "I-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 10
                text = "Step 10: Inspect Door 2 to spawn the Doll NMs Nio-Hum and Nio-A, then defeat them. \n \n" ..
                       "You only need to KILL ONE - but the other must be dead or despawned before the kill counts. \n \n" ..
                       "Nio-A / Nio-Hum (Warriors): \n" ..
                       "- Both use Mighty Strikes \n" ..
                       "- IMMUNE to Sleep and Stun. Break DOES land \n" ..
                       "- Extremely high magic damage reduction - melee them down \n" ..
                       "- Keep Barfira up in case they use Meltdown \n" ..
                       "- They do NOT link: Sneak up, then pull ONE with a ranged attack (the hall is narrow, so JAs are hard to land) \n" ..
                       "- Two tanks: one holds Nio-A while the party kills Nio-Hum \n \n" ..
                       "If you wipe, you keep the broken key pieces - just go back to Door 2 for a rematch. \n \n",
                onmob_target = {"temple-of-uggalepih-granite-door-s82-2"},
                onmob_enemy = {"Nio-A", "Nio-Hum"},
                onmob_enemy_colour = "red",
                onmob_enemy_size = 2,
                kill_requirement = {
                    count = 2,
                    enemies = {"Nio-A", "Nio-Hum"},
                    zone = "Temple of Uggalepih",
                    count_party_kills = true,
                },
                zone_max_distance = 20,
                visual_zones = {
                    -- Nio-A and Nio-Hum
                    { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -10.1, y = -17.0, z = -148.0 }, size = 3, direction = "up", floor_id = 4, colour = "yellow" },
                    { zone_name = "Temple of Uggalepih", type = 'rect', center = { x = -10.0, y = -18.8, z = -146.3 }, width = 3.00, height = 3.50, floor_id = 4, colour = "cyan", vertical_axis = 'ns' },
                    { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -10.4, y = -17.0, z = -139.9 }, size = 3, direction = "left", floor_id = 4, colour = "yellow" },
                    { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -30.4, y = -17.0, z = -140.0 }, size = 3, direction = "left", floor_id = 4, colour = "yellow" },
                    { zone_name = "Temple of Uggalepih", type = 'arrow', center = { x = -50.0, y = -17.0, z = -140.2 }, size = 3, direction = "down", floor_id = 4, colour = "yellow" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 10,
                        zone_name = "Temple of Uggalepih",
                        floor_id = 2,
                        highlights = {
                            { position = "J-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 10,
                        zone_name = "Temple of Uggalepih",
                        floor_id = 4,
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 11
                text = "Step 11: Inspect Door 2 again for a cutscene. \n \n" ..
                       "You are done when you see: 'You could not find Lightbringer here. Your investigation is over.' \n \n" ..
                       "The dolls do NOT respawn - anyone who was missing key pieces can collect them now and re-inspect the door. \n \n",
                onmob_target = {"temple-of-uggalepih-granite-door-s82-2"},
                trigger_on_event_id = {65},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 11,
                        zone_name = "Temple of Uggalepih",
                        floor_id = 2,
                        highlights = {
                            { position = "J-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 11,
                        zone_name = "Temple of Uggalepih",
                        floor_id = 4,
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 12
                text = "Step 12: Return to Chateau d'Oraguille and examine the Door: Great Hall for a cutscene with King Destin and your reward. \n \n",
                onmob_target = {"Door: Great Hall"},
                trigger_on_event_id = {104},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "Rank 9, 80,000 gil"
        }
    },

    ["9-1: Breaking Barriers"] = {
        prerequisites = {
            {category = "Missions", subfile = "SanDoria", name = "8-2: Lightbringer"},
            {category = "Quests", subfile = "Windurst Waters North", name = "Magicked Astrolabe", recommended = true},
        },
        steps = {
            { -- Step 1
                text = "Step 1: Trade up to 4 stacks of crystals to a San d'Orian Gate Guard (or repeat missions) to build Rank Bar. \n \n" ..
                       "Talk to any San d'Orian Gate Guard to accept the mission. \n \n" ..
                       "Southern San d'Oria: Ambrotien or Endracion (F-9 / K-10). \n" ..
                       "Northern San d'Oria: Grilau (D-8). \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                trigger_on_talk = {" He may not be present for your briefing."},
                zone_max_distance = 40,
                visual_zones = {
                    -- Green Square around
                    --Aravoge, T.K for crystal trades
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = -104.9, y = 0.0, z = -53.1 }, size = 1, floor_id = 0, colour = "green" },
                    --Arpevion, T.K
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = 105.2, y = 0.0, z = -53.0 }, size = 1, floor_id = 0, colour = "green" },
                    --Achantere, T.K
                    { zone_name = "Northern San d'Oria", type = 'square', center = { x = -247.2, y = 7.0, z = 40.9 }, size = 1, floor_id = 0, colour = "green" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "F-9", offsetX = 16, offsetY = 16 },
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 2
                text = "Step 2: Go to Chateau d'Oraguille and examine the Door: Great Hall for a cutscene with Trion, Pieuje, the papsque Shamonde and Princess Claidie. \n \n" ..
                       "(Optional: Halver has extra dialogue.) \n \n" ..
                       "===== READ THIS BEFORE YOU LEAVE ===== \n" ..
                       "You must now collect 3 key items STRICTLY IN ORDER: \n" ..
                       "1. Figure of Titan   - Valley of Sorrows (I-8) \n" ..
                       "2. Figure of Garuda  - Xarcabard (H-7) \n" ..
                       "3. Figure of Leviathan - Batallia Downs (J-11) \n \n" ..
                       "The ??? will NOT respond out of order, and nobody can skip a key item by having someone else pop the NMs. \n \n" ..
                       "Bring Sneak/Invisible or a Mount for the first two. \n" ..
                       "TIP: Touching a ??? plays a short cutscene which makes any mobs chasing you lose aggro. \n \n",
                onmob_target = {"Door: Great Hall"},
                keyitems_needed = {481, 482, 483},
                trigger_on_event_id = {32},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
                zone_max_distance = 20,
            },
            { -- Step 3
                text = "Step 3: KEY ITEM 1 of 3 - Figure of Titan, Valley of Sorrows (I-8). \n \n" ..
                       "From Cape Teriggan, take the NORTH entrance at (J-8) into the Valley of Sorrows. \n \n" ..
                       "Use Sneak + Invisible (or stay mounted) and go to the ??? at (I-8). \n \n" ..
                       "The zone is full of Adamantoise - do not get greedy, just touch the ???. \n \n",
                onmob_target = {"valley-of-sorrows-i8-???"},
                trigger_on_keyitem_obtain = {483},
                route_to = "Valley of Sorrows",
                destination_highlight = {position = "I-8", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                        -- Through Kuftal Tunnel
                        { zone_name = "Kuftal Tunnel", type = 'square', center = { x = -16.0, y = -20.3, z = -237.0 }, size = 1, floor_id = 1, colour = "green" },
                        { zone_name = "Kuftal Tunnel", type = 'arrow', center = { x = -19.9, y = -19.9, z = -235.4 }, size = 3, direction = "nw", floor_id = 1, colour = "yellow" },
                        { zone_name = "Kuftal Tunnel", type = 'arrow', center = { x = -26.7, y = -20.0, z = -216.2 }, size = 3, direction = "ne", floor_id = 1, colour = "yellow" },
                        { zone_name = "Kuftal Tunnel", type = 'arrow', center = { x = -14.5, y = -20.3, z = -209.4 }, size = 3, direction = "se", floor_id = 1, colour = "yellow" },
                        { zone_name = "Kuftal Tunnel", type = 'arrow', center = { x = 10.4, y = -15.8, z = -216.2 }, size = 3, direction = "ne", floor_id = 1, colour = "yellow" },
                        { zone_name = "Kuftal Tunnel", type = 'arrow', center = { x = 27.8, y = -9.9, z = -175.4 }, size = 3, direction = "up", floor_id = 1, colour = "yellow" },
                        { zone_name = "Kuftal Tunnel", type = 'arrow', center = { x = 26.9, y = -10.3, z = -150.5 }, size = 3, direction = "ne", floor_id = 1, colour = "yellow" },
                        { zone_name = "Kuftal Tunnel", type = 'arrow', center = { x = 51.3, y = -11.4, z = -133.1 }, size = 3, direction = "ne", floor_id = 1, colour = "yellow" },
                        { zone_name = "Kuftal Tunnel", type = 'arrow', center = { x = 60.7, y = -10.4, z = -104.9 }, size = 3, direction = "up", floor_id = 2, colour = "yellow" },
                        { zone_name = "Kuftal Tunnel", type = 'arrow', center = { x = 73.5, y = -8.9, z = -58.6 }, size = 3, direction = "right", floor_id = 2, colour = "yellow" },
                        { zone_name = "Kuftal Tunnel", type = 'arrow', center = { x = 112.4, y = 0.2, z = -47.6 }, size = 3, direction = "up", floor_id = 2, colour = "yellow" },
                        { zone_name = "Kuftal Tunnel", type = 'arrow', center = { x = 116.4, y = 0.3, z = -14.3 }, size = 3, direction = "up", floor_id = 2, colour = "yellow" },
                        { zone_name = "Kuftal Tunnel", type = 'arrow', center = { x = 115.9, y = 0.5, z = 22.7 }, size = 3, direction = "up", floor_id = 2, colour = "yellow" },
                        { zone_name = "Kuftal Tunnel", type = 'arrow', center = { x = 113.9, y = 0.2, z = 51.2 }, size = 3, direction = "nw", floor_id = 2, colour = "yellow" },
                        { zone_name = "Kuftal Tunnel", type = 'arrow', center = { x = 99.8, y = -8.8, z = 81.0 }, size = 3, direction = "up", floor_id = 2, colour = "yellow" },
                        { zone_name = "Kuftal Tunnel", type = 'arrow', center = { x = 100.4, y = -8.8, z = 125.1 }, size = 3, direction = "up", floor_id = 2, colour = "yellow" },
                        { zone_name = "Kuftal Tunnel", type = 'arrow', center = { x = 99.2, y = -9.1, z = 140.7 }, size = 3, direction = "left", floor_id = 2, colour = "yellow" },
                        { zone_name = "Kuftal Tunnel", type = 'arrow', center = { x = 56.2, y = -1.2, z = 144.0 }, size = 3, direction = "nw", floor_id = 2, colour = "yellow" },
                        { zone_name = "Kuftal Tunnel", type = 'arrow', center = { x = 38.7, y = 0.0, z = 158.7 }, size = 3, direction = "ne", floor_id = 2, colour = "yellow" },
                        { zone_name = "Kuftal Tunnel", type = 'arrow', center = { x = 59.9, y = -5.5, z = 188.9 }, size = 3, direction = "up", floor_id = 2, colour = "yellow" },
                        { zone_name = "Kuftal Tunnel", type = 'arrow', center = { x = 55.8, y = -9.4, z = 213.3 }, size = 3, direction = "nw", floor_id = 2, colour = "yellow" },
                        { zone_name = "Kuftal Tunnel", type = 'arrow', center = { x = 51.8, y = -9.8, z = 230.9 }, size = 3, direction = "ne", floor_id = 2, colour = "yellow" },
                        { zone_name = "Kuftal Tunnel", type = 'arrow', center = { x = 57.0, y = -9.7, z = 258.7 }, size = 3, direction = "left", floor_id = 2, colour = "yellow" },

                        -- Cape Terrigan -> Valley of Sorrows
                        { zone_name = "Cape Teriggan", type = 'arrow', center = { x = -218.7, y = -0.0, z = -317.8 }, size = 4, direction = "up", floor_id = 0, colour = "cyan" },
                        { zone_name = "Cape Teriggan", type = 'arrow', center = { x = -214.0, y = -1.9, z = -300.7 }, size = 4, direction = "right", floor_id = 0, colour = "cyan" },
                        { zone_name = "Cape Teriggan", type = 'arrow', center = { x = -182.0, y = 2.5, z = -299.0 }, size = 4, direction = "ne", floor_id = 0, colour = "cyan" },
                        { zone_name = "Cape Teriggan", type = 'arrow', center = { x = -163.0, y = 8.3, z = -269.3 }, size = 4, direction = "nw", floor_id = 0, colour = "cyan" },
                        { zone_name = "Cape Teriggan", type = 'arrow', center = { x = -192.9, y = 8.5, z = -222.6 }, size = 4, direction = "up", floor_id = 0, colour = "cyan" },
                        { zone_name = "Cape Teriggan", type = 'arrow', center = { x = -189.7, y = 8.5, z = -179.0 }, size = 4, direction = "ne", floor_id = 0, colour = "cyan" },
                        { zone_name = "Cape Teriggan", type = 'arrow', center = { x = -149.4, y = 8.1, z = -135.8 }, size = 4, direction = "ne", floor_id = 0, colour = "cyan" },
                        { zone_name = "Cape Teriggan", type = 'arrow', center = { x = -108.3, y = 6.5, z = -95.6 }, size = 4, direction = "ne", floor_id = 0, colour = "cyan" },
                        { zone_name = "Cape Teriggan", type = 'arrow', center = { x = -71.9, y = 0.1, z = -57.2 }, size = 4, direction = "ne", floor_id = 0, colour = "cyan" },
                        { zone_name = "Cape Teriggan", type = 'arrow', center = { x = -48.8, y = -0.3, z = -24.9 }, size = 4, direction = "up", floor_id = 0, colour = "cyan" },
                        { zone_name = "Cape Teriggan", type = 'arrow', center = { x = -47.5, y = -0.1, z = 18.7 }, size = 4, direction = "up", floor_id = 0, colour = "cyan" },
                        { zone_name = "Cape Teriggan", type = 'arrow', center = { x = -43.7, y = 0.5, z = 59.4 }, size = 4, direction = "up", floor_id = 0, colour = "cyan" },
                        { zone_name = "Cape Teriggan", type = 'arrow', center = { x = -35.1, y = 0.0, z = 87.9 }, size = 4, direction = "ne", floor_id = 0, colour = "cyan" },
                        { zone_name = "Cape Teriggan", type = 'arrow', center = { x = -14.5, y = 0.4, z = 113.7 }, size = 4, direction = "ne", floor_id = 0, colour = "cyan" },
                        { zone_name = "Cape Teriggan", type = 'arrow', center = { x = 9.2, y = 0.5, z = 148.1 }, size = 4, direction = "ne", floor_id = 0, colour = "cyan" },
                        { zone_name = "Cape Teriggan", type = 'arrow', center = { x = 33.6, y = 0.1, z = 164.5 }, size = 4, direction = "se", floor_id = 0, colour = "cyan" },
                        { zone_name = "Cape Teriggan", type = 'arrow', center = { x = 57.8, y = -0.6, z = 144.6 }, size = 4, direction = "se", floor_id = 0, colour = "cyan" },
                        { zone_name = "Cape Teriggan", type = 'arrow', center = { x = 78.0, y = 0.0, z = 120.7 }, size = 4, direction = "down", floor_id = 0, colour = "cyan" },
                        { zone_name = "Cape Teriggan", type = 'arrow', center = { x = 83.3, y = 1.4, z = 93.5 }, size = 4, direction = "se", floor_id = 0, colour = "cyan" },
                        { zone_name = "Cape Teriggan", type = 'arrow', center = { x = 107.9, y = 0.4, z = 79.2 }, size = 4, direction = "right", floor_id = 0, colour = "cyan" },
                        { zone_name = "Cape Teriggan", type = 'arrow', center = { x = 151.7, y = 7.3, z = 79.8 }, size = 4, direction = "right", floor_id = 0, colour = "cyan" },
                        { zone_name = "Cape Teriggan", type = 'arrow', center = { x = 179.7, y = 8.9, z = 78.2 }, size = 4, direction = "right", floor_id = 0, colour = "cyan" },
                        { zone_name = "Cape Teriggan", type = 'arrow', center = { x = 205.4, y = 8.1, z = 72.1 }, size = 4, direction = "se", floor_id = 0, colour = "cyan" },
                        { zone_name = "Cape Teriggan", type = 'arrow', center = { x = 233.8, y = 8.1, z = 39.2 }, size = 4, direction = "down", floor_id = 0, colour = "cyan" },
                        { zone_name = "Cape Teriggan", type = 'arrow', center = { x = 236.2, y = 8.2, z = 14.3 }, size = 4, direction = "down", floor_id = 0, colour = "cyan" },
                        { zone_name = "Cape Teriggan", type = 'arrow', center = { x = 242.5, y = 7.8, z = -6.4 }, size = 4, direction = "se", floor_id = 0, colour = "cyan" },
                        { zone_name = "Cape Teriggan", type = 'arrow', center = { x = 262.2, y = 0.4, z = -33.9 }, size = 4, direction = "down", floor_id = 0, colour = "cyan" },
                        { zone_name = "Cape Teriggan", type = 'arrow', center = { x = 268.0, y = -1.7, z = -60.1 }, size = 4, direction = "right", floor_id = 0, colour = "cyan" },

                        -- Valley of Sorrows to Keyitem
                        { zone_name = "Valley of Sorrows", type = 'arrow', center = { x = -228.4, y = -0.7, z = -19.7 }, size = 4, direction = "right", floor_id = 0, colour = "cyan" },
                        { zone_name = "Valley of Sorrows", type = 'arrow', center = { x = -180.8, y = -5.4, z = -8.7 }, size = 4, direction = "up", floor_id = 0, colour = "cyan" },
                        { zone_name = "Valley of Sorrows", type = 'arrow', center = { x = -171.8, y = -8.9, z = 22.6 }, size = 4, direction = "right", floor_id = 0, colour = "cyan" },
                        { zone_name = "Valley of Sorrows", type = 'square', center = { x = -167.0, y = -8.0, z = 24.0 }, size = 1, floor_id = 0, colour = "cyan" },
                        { zone_name = "Valley of Sorrows", type = 'arrow', center = { x = -160.5, y = -8.0, z = 20.4 }, size = 4, direction = "right", floor_id = 0, colour = "cyan" },
                        { zone_name = "Valley of Sorrows", type = 'arrow', center = { x = -140.5, y = -5.1, z = 16.4 }, size = 4, direction = "se", floor_id = 0, colour = "cyan" },
                        { zone_name = "Valley of Sorrows", type = 'arrow', center = { x = -117.4, y = 0.9, z = -21.2 }, size = 4, direction = "se", floor_id = 0, colour = "cyan" },
                        { zone_name = "Valley of Sorrows", type = 'arrow', center = { x = -89.8, y = 0.3, z = -41.9 }, size = 4, direction = "right", floor_id = 0, colour = "cyan" },
                        { zone_name = "Valley of Sorrows", type = 'arrow', center = { x = -55.6, y = 0.8, z = -40.0 }, size = 4, direction = "ne", floor_id = 0, colour = "cyan" },
                        { zone_name = "Valley of Sorrows", type = 'arrow', center = { x = -27.2, y = 0.0, z = -12.7 }, size = 4, direction = "ne", floor_id = 0, colour = "cyan" },
                        { zone_name = "Valley of Sorrows", type = 'arrow', center = { x = 1.2, y = 0.2, z = 8.2 }, size = 4, direction = "right", floor_id = 0, colour = "cyan" },
                        { zone_name = "Valley of Sorrows", type = 'arrow', center = { x = 53.2, y = 0.5, z = -2.0 }, size = 4, direction = "right", floor_id = 0, colour = "cyan" },
                        { zone_name = "Valley of Sorrows", type = 'arrow', center = { x = 91.0, y = -2.2, z = -7.0 }, size = 4, direction = "down", floor_id = 0, colour = "cyan" },
                },
            },
            { -- Step 4
                text = "Step 4: KEY ITEM 2 of 3 - Figure of Garuda, Xarcabard (H-7). \n \n" ..
                       "The ??? is on the UPPER level, among some trees on your LEFT as you go up the slope. \n \n" ..
                       "Sneak + Invisible recommended. \n \n",
                onmob_target = {"xarcabard-h7-???"},
                trigger_on_keyitem_obtain = {482},
                route_to = "Xarcabard",
                destination_highlight = {position = "H-7", offsetX = 16, offsetY = 16},
                zone_max_distance = 40,
                visual_zones = {
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 521.9, y = 0.2, z = -247.3 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 500.5, y = -0.2, z = -212.9 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 481.3, y = 0.2, z = -181.0 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 428.1, y = 0.5, z = -181.9 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 377.3, y = 5.2, z = -185.9 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 325.3, y = 6.2, z = -188.4 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 273.8, y = -1.1, z = -199.2 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 217.5, y = -21.2, z = -200.0 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 185.5, y = -18.5, z = -164.3 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 160.3, y = -16.2, z = -125.2 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 170.8, y = -14.8, z = -87.7 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 183.5, y = -10.4, z = -47.2 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 190.5, y = -9.7, z = -14.5 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 198.1, y = -7.7, z = 30.7 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 219.5, y = -8.3, z = 58.2 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 218.4, y = -14.2, z = 93.2 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 218.0, y = -19.4, z = 124.0 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 205.2, y = -27.6, z = 147.6 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 175.3, y = -33.7, z = 111.9 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 164.4, y = -35.2, z = 92.8 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                },
            },
            { -- Step 5
                text = "Step 5: KEY ITEM 3 of 3 - Figure of Leviathan. \n \n" ..
                       "This spot is ONLY reachable by going through Eldieme Necropolis - you cannot walk to it in Batallia. \n \n" ..
                       "Enter Eldieme Necropolis from the SOUTHERN entrance at Batallia Downs (J-10), or use the Survival Guide. \n \n",
                zone_trigger = "The Eldieme Necropolis",
                zone_max_distance = 40,
                visual_zones = {
                        --Route to J-10
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
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Batallia Downs",
                        highlights = {
                            { position = "J-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 6
                text = "Step 6: Both players split up and work the Gates. \n \n" ..
                       "Open the Gates so both players can regroup at the hole (next step). \n \n" ..
                       "===== Follow your colour ===== \n" ..
                       "BOTH players first follow the YELLOW arrows to the split point. \n" ..
                       "(Solo with Magicked Astrolabe? Take the Player 2 / BLUE route and click the blocked doors instead of using the levers.) \n \n" ..
                       "Person 1: follow the PURPLE arrows to the Lever at (H-8) and work the Gates for Person 2. \n" ..
                       "Person 2: follow the BLUE arrows to the southern room and use the matching Lever to work the Gates for Person 1. \n \n" ..
                       "The guide advances automatically once you reach your plate. \n \n",
                zone_max_distance = 20,
                keyitems_needed = {
                                    {id = 2578, name = "Magicked Astrolabe", optional = true},
                },
                -- If we have the Magicked Astrolabe skip the gate sstep and just run straight there in Step 7.
                trigger_on_keyitem_obtain = {2578},
                onmob_target = {"the-eldieme-necropolis-east-plate-h8",
                                "the-eldieme-necropolis-south-plate-g8"},
                visual_zones = {
                        -- Route through Eldieme.
                        -- Both players to split
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 420.5, y = -56.0, z = -115.6 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'square', center = { x = 418.0, y = -52.0, z = -99.5 }, size = 1, floor_id = 15, colour = "green" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 420.3, y = -50.8, z = -92.7 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 420.7, y = -48.0, z = -57.8 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 420.8, y = -42.3, z = -10.7 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 401.6, y = -40.0, z = 19.8 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 380.2, y = -40.0, z = 20.3 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 378.9, y = -36.0, z = -19.7 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 328.5, y = -32.0, z = -59.6 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },

                        -- Player 1 going to H-8
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 301.0, y = -32.0, z = -51.7 }, size = 3, direction = "up", floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 300.7, y = -32.0, z = -7.6 }, size = 3, direction = "up", floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 305.9, y = -27.5, z = 9.0 }, size = 3, direction = "up", floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 305.5, y = -27.5, z = 13.5 }, size = 3, direction = "left", floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 283.9, y = -27.8, z = 13.6 }, size = 3, direction = "nw", floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 281.5, y = -28.0, z = 19.3 }, size = 3, direction = "left", floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 258.1, y = -32.0, z = 21.0 }, size = 3, direction = "nw", floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 252.3, y = -32.0, z = 24.3 }, size = 3, direction = "sw", floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 242.3, y = -32.0, z = 20.0 }, size = 3, direction = "left", floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 233.9, y = -34.0, z = 20.0 }, size = 3, direction = "left", floor_id = 15, colour = "magenta" },

                        -- PLayer 2 to Drop down map 16
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 297.1, y = -32.0, z = -53.4 }, size = 3, direction = "sw", floor_id = 15, colour = "cyan" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 284.2, y = -32.2, z = -59.7 }, size = 3, direction = "left", floor_id = 15, colour = "cyan" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 269.0, y = -32.0, z = -59.8 }, size = 3, direction = "sw", floor_id = 15, colour = "cyan" },
                        { zone_name = "The Eldieme Necropolis", type = 'rect', center = { x = 271.0, y = -34.3, z = -60.0 }, width = 4.25, height = 4.75, floor_id = 15, colour = "cyan", vertical_axis = 'z' },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 259.1, y = -32.0, z = -68.0 }, size = 3, direction = "down", floor_id = 15, colour = "cyan" },
                        { zone_name = "The Eldieme Necropolis", type = 'rect', center = { x = 260.0, y = -34.3, z = -71.0 }, width = 4.00, height = 4.75, floor_id = 15, colour = "cyan", vertical_axis = 'ns' },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 260.3, y = -32.0, z = -80.4 }, size = 3, direction = "down", floor_id = 15, colour = "cyan" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 245.8, y = -32.0, z = -100.7 }, size = 3, direction = "left", floor_id = 15, colour = "cyan" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 207.8, y = -32.0, z = -99.8 }, size = 3, direction = "left", floor_id = 15, colour = "cyan" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 197.7, y = -28.0, z = -101.0 }, size = 3, direction = "up", floor_id = 15, colour = "cyan" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 197.5, y = -28.0, z = -81.9 }, size = 3, direction = "left", floor_id = 15, colour = "cyan" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 180.1, y = -28.0, z = -80.3 }, size = 3, direction = "up", floor_id = 15, colour = "cyan" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 178.4, y = -32.0, z = -59.2 }, size = 3, direction = "nw", floor_id = 15, colour = "cyan" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 176.5, y = -32.0, z = -51.3 }, size = 3, direction = "ne", floor_id = 15, colour = "cyan" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 180.2, y = -34.0, z = -34.3 }, size = 3, direction = "up", floor_id = 15, colour = "cyan" },

                },
                trigger_zones = {
                    -- Box triggers: advance when the LOCAL player reaches their plate (per-client).
                    -- VERIFY: adjust these to the actual plate positions if they fire early/late.
                    { zone_name = "The Eldieme Necropolis", type = 'square', center = { x = 233.9, y = -34.0, z = 20.0 }, size = 6, floor_id = 15, colour = "green" },   -- East plate  (Player 1 / PURPLE / H-8)
                    { zone_name = "The Eldieme Necropolis", type = 'square', center = { x = 180.2, y = -34.0, z = -34.3 }, size = 6, floor_id = 15, colour = "green" },  -- South plate (Player 2 / BLUE / G-8)

                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 6,
                        zone_name = "The Eldieme Necropolis",
                        floor_id = 15,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16,label = "1", color = "yellow" },
                            { position = "G-9", offsetX = 16, offsetY = 16,label = "2", color = "cyan" },
                        },
                    },
                },
            },
            { -- Step 7
                text = "Step 7: Regroup at the hole and drop out to Batallia. \n \n" ..
                       "Once BOTH players are through the Gates, follow the YELLOW arrows back to the hole in the CENTRE of the room (green square) at (G-9). \n \n" ..
                       "SNEAK UP, then drop down the hole. You WILL get aggro below, even at Lv99. \n \n" ..
                       "Follow the path EAST onto a new map. Work south: RIGHT at the first intersection, LEFT at the second. \n" ..
                       "Follow it until you zone back out into Batallia Downs. \n \n" ..
                       "After zoning, take a RIGHT and head SOUTH. The ??? is on the cliff's edge just EAST of the Stone Monument. \n \n" ..
                       "WARNING: The NM Ahtu spawns on this island. \n \n",
                --zone_trigger = "Batallia Downs",
                -- Lets use a trigger zone as if we die and come back to Battilia downs it will complete the step.
                trigger_zones = {
                    { zone_name = "Batallia Downs", type = 'line', start = { x = 180.8, y = 12.4, z = -584.1 }, stop = { x = 176.0, y = 12.4, z = -580.0 }, floor_id = 0, colour = "green" },

                },
                zone_max_distance = 20,
                onmob_target = {"the-eldieme-necropolis-east-plate-h8",
                                "the-eldieme-necropolis-south-plate-g8"},
                visual_zones = {
                        -- If keyitem to open doors draw these anyway
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 420.5, y = -56.0, z = -115.6 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'square', center = { x = 418.0, y = -52.0, z = -99.5 }, size = 1, floor_id = 15, colour = "green" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 420.3, y = -50.8, z = -92.7 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 420.7, y = -48.0, z = -57.8 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 420.8, y = -42.3, z = -10.7 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 401.6, y = -40.0, z = 19.8 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 380.2, y = -40.0, z = 20.3 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 378.9, y = -36.0, z = -19.7 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 328.5, y = -32.0, z = -59.6 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        --Once done with Gate - regroup and run to the hole
                        --player 1
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 234.8, y = -34.0, z = 20.5 }, size = 3, direction = "right", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 249.4, y = -32.0, z = 21.2 }, size = 3, direction = "ne", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 255.3, y = -32.0, z = 24.3 }, size = 3, direction = "se", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 273.0, y = -32.0, z = 19.0 }, size = 3, direction = "right", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 282.0, y = -28.0, z = 18.1 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 280.6, y = -28.0, z = 1.5 }, size = 3, direction = "right", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 300.1, y = -28.0, z = 1.4 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 299.9, y = -32.0, z = -17.0 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        --{ zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 299.8, y = -32.0, z = -35.2 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 299.4, y = -32.0, z = -51.2 }, size = 3, direction = "sw", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 285.7, y = -32.2, z = -59.9 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 274.0, y = -32.0, z = -59.9 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 267.0, y = -32.0, z = -61.9 }, size = 3, direction = "sw", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 259.9, y = -32.0, z = -67.8 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 258.9, y = -32.0, z = -89.9 }, size = 3, direction = "sw", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 240.0, y = -32.0, z = -99.5 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 213.3, y = -32.0, z = -99.7 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 198.5, y = -28.0, z = -99.8 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 197.0, y = -28.0, z = -81.3 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        --player 2
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 181.5, y = -34.0, z = -34.0 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 180.9, y = -32.0, z = -49.8 }, size = 3, direction = "se", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 182.8, y = -32.0, z = -57.7 }, size = 3, direction = "sw", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 177.9, y = -28.0, z = -81.2 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 174.2, y = -27.5, z = -87.5 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 174.1, y = -27.5, z = -100.0 }, size = 3, direction = "right", floor_id = 15, colour = "yellow" },

                        { zone_name = "The Eldieme Necropolis", type = 'square', center = { x = 179.9, y = -27.5, z = -99.8 }, size = 2, floor_id = 15, colour = "green" },

                        --Doors highlighhted
                        { zone_name = "The Eldieme Necropolis", type = 'rect', center = { x = 271.0, y = -34.3, z = -60.0 }, width = 4.25, height = 4.75, floor_id = 15, colour = "yellow", vertical_axis = 'z' },
                        { zone_name = "The Eldieme Necropolis", type = 'rect', center = { x = 260.0, y = -34.3, z = -71.0 }, width = 4.00, height = 4.75, floor_id = 15, colour = "yellow", vertical_axis = 'ns' },

                        -- To Battalia
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 180.0, y = 0.0, z = -100.5 }, size = 3, direction = "right", floor_id = 16, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 213.9, y = -0.2, z = -104.6 }, size = 3, direction = "se", floor_id = 17, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 219.8, y = 0.2, z = -120.5 }, size = 3, direction = "down", floor_id = 17, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 219.7, y = -5.1, z = -145.6 }, size = 3, direction = "down", floor_id = 17, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 222.7, y = -10.0, z = -172.1 }, size = 3, direction = "se", floor_id = 17, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 240.1, y = -15.8, z = -179.8 }, size = 3, direction = "right", floor_id = 17, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 252.0, y = -16.2, z = -181.6 }, size = 3, direction = "se", floor_id = 17, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 260.2, y = -15.8, z = -196.5 }, size = 3, direction = "down", floor_id = 17, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 266.0, y = -15.8, z = -222.5 }, size = 3, direction = "sw", floor_id = 17, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 261.7, y = -16.0, z = -251.5 }, size = 3, direction = "se", floor_id = 17, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 288.1, y = -16.1, z = -260.3 }, size = 3, direction = "ne", floor_id = 17, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 300.9, y = -15.6, z = -252.0 }, size = 3, direction = "se", floor_id = 17, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 317.7, y = -15.8, z = -260.0 }, size = 3, direction = "right", floor_id = 17, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 333.7, y = -19.0, z = -266.3 }, size = 3, direction = "se", floor_id = 17, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 339.7, y = -23.9, z = -282.3 }, size = 3, direction = "down", floor_id = 17, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 340.7, y = -31.8, z = -317.6 }, size = 3, direction = "down", floor_id = 17, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 352.9, y = -31.9, z = -340.2 }, size = 3, direction = "right", floor_id = 17, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 376.3, y = -31.9, z = -334.5 }, size = 3, direction = "up", floor_id = 17, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 400.6, y = -39.8, z = -300.2 }, size = 3, direction = "right", floor_id = 17, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 423.7, y = -44.8, z = -300.1 }, size = 3, direction = "right", floor_id = 17, colour = "yellow" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 7,
                        zone_name = "The Eldieme Necropolis",
                        floor_id = 15,
                        highlights = {
                            { position = "G-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 7,
                        zone_name = "The Eldieme Necropolis",
                        floor_id = 16,
                        highlights = {
                            { position = "K-12", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 7,
                        zone_name = "The Eldieme Necropolis",
                        floor_id = 17,
                        highlights = {
                            { position = "J-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 8
                text = "Step 8: Inspect the ??? to spawn the Roc NMs Suparna and Suparna Fledgling, then defeat them. \n \n" ..
                       "Suparna (WAR/BRD): Horde Lullaby, Massacre Elegy, Magic Finale, Giga Scream, Dread Dive, Mighty Strikes. \n" ..
                       "Suparna Fledgling (WHM/BRD): same song kit, plus BENEDICTION. \n \n" ..
                       "- Bring Silence/Finale to shut down the songs - Horde Lullaby will sleep your whole party \n" ..
                       "- Soloable/duoable by most jobs around Lv90 \n \n",
                onmob_target = {"batallia-downs-???-j11"},
                onmob_enemy = {"Suparna", "Suparna Fledgling"},
                onmob_enemy_colour = "red",
                onmob_enemy_size = 2,
                kill_requirement = {
                    count = 2,
                    enemies = {"Suparna", "Suparna Fledgling"},
                    zone = "Batallia Downs",
                    count_party_kills = true,
                },
                -- Fallback: if the NMs were already killed (server 'Prog' var set) the KI is handed
                -- over without a respawn, so advance the moment we're holding Figure of Leviathan.
                trigger_on_keyitem_obtain = {481},
                visual_zones = {
                    { zone_name = "Batallia Downs", type = 'arrow', center = { x = 183.6, y = 12.7, z = -580.2 }, size = 3, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Batallia Downs", type = 'arrow', center = { x = 204.7, y = 15.6, z = -601.5 }, size = 3, direction = "se", floor_id = 0, colour = "yellow" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 8,
                        zone_name = "Batallia Downs",
                        highlights = {
                            { position = "J-11", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 9
                text = "Step 9: Inspect the ??? again for a cutscene and KI:Figure of Leviathan. \n \n",
                onmob_target = {"batallia-downs-???-j11"},
                trigger_on_event_id = {904},
                trigger_on_keyitem_obtain = {481},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 9,
                        zone_name = "Batallia Downs",
                        highlights = {
                            { position = "J-11", offsetX = 16, offsetY = 16 },
                        },
                    },
                },

            },
            { -- Step 10
                text = "Step 10: Return to Chateau d'Oraguille and examine the Door: Great Hall to report to the King and complete the mission. \n \n" ..
                       "You must be holding all 3 figures (Titan, Garuda, Leviathan). \n \n" ..
                       "(Optional: Rahal and Curilla have extra dialogue afterwards.) \n \n",
                onmob_target = {"Door: Great Hall"},
                trigger_on_event_id = {76},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
                zone_max_distance = 20,
            },
        },
        reward = {
            text = "Rank Points (900)"
        }
    },

    ["9-2: The Heir to the Light"] = {
        prerequisites = {
            {category = "Missions", subfile = "SanDoria", name = "9-1: Breaking Barriers"},
        },
        steps = {
            { -- Step 1
                text = "Step 1: Trade up to 2 stacks of crystals to Ambrotien or Endracion, avoid Grilau for this mission. \n \n" ..
                       "Southern San d'Oria: Ambrotien or Endracion (F-9 / K-10). \n",
                onmob_target = {"Ambrotien", "Endracion"},
                trigger_on_talk = {" will have our heads if he finds out."},
                zone_max_distance = 40,
                visual_zones = {
                    -- Green Square around
                    --Aravoge, T.K for crystal trades
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = -104.9, y = 0.0, z = -53.1 }, size = 1, floor_id = 0, colour = "green" },
                    --Arpevion, T.K
                    { zone_name = "Southern San d'Oria", type = 'square', center = { x = 105.2, y = 0.0, z = -53.0 }, size = 1, floor_id = 0, colour = "green" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "F-9", offsetX = 16, offsetY = 16 },
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 2
                text = "Step 2: Zone into Northern San d'Oria for a VERY long cutscene (~5 minutes). \n \n" ..
                       "This fires on ZONING IN - there is no NPC to talk to. Get comfortable. \n \n",
                -- Step 1 only surfaces the two SOUTHERN guards (Ambrotien/Endracion) for 9-2, so a
                -- player who follows the guide accepts from Southern and enters Northern as a real
                -- zone change - which makes zone_trigger (a presence poll) fire correctly here.
                -- (Grilau still works server-side; accepting there leaves you already in Northern and
                --  would instant-complete this step - hence we steer players to Southern for 9-2.)
                zone_trigger = "Northern San d'Oria",
                route_to = "Northern San d'Oria",
            },
            { -- Step 3
                text = "Step 3: First make sure you got the Northern San d'Oria cutscene (re-zone into Northern if you missed it). Then zone into Chateau d'Oraguille for another cutscene. \n \n" ..
                       "You will be ordered to head to Qu'Bia Arena. \n \n" ..
                       "(Optional: Rahal, Aramaviont, Milchupain, Curilla, Halver, Nachou and Perfaumand all have extra dialogue now.) \n \n",
                trigger_on_event_id = {10},
                zone_trigger = "Chateau d'Oraguille",
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
            },
            { -- Step 4
                text = "Step 4: Zone into Fei'Yin for a cutscene. \n \n" ..
                       "Home Point #1 inside Fei'Yin drops you at the Qu'Bia Arena entrance. \n",
                trigger_on_event_id = {23},
                zone_trigger = "Fei'Yin",
                route_to = "Fei'Yin 1",
                zone_max_distance = 40,
                visual_zones = {
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -206.7, y = -39.9, z = -197.0 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -165.0, y = -40.0, z = -204.5 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -118.9, y = -39.8, z = -219.1 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    -- Route to Fei'Yin in Beaucedine Glacier from Xarca good to help players navigate complicated map.
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -136.4, y = -79.8, z = 220.3 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -119.9, y = -79.5, z = 173.5 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -101.2, y = -80.0, z = 133.0 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -96.4, y = -76.2, z = 102.4 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -32.0, y = -63.2, z = 101.1 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 0.5, y = -59.1, z = 98.9 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 2.6, y = -59.0, z = 60.4 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 3.0, y = -59.6, z = 12.0 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 5.7, y = -59.7, z = -27.1 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 2.7, y = -59.1, z = -58.4 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -5.6, y = -59.9, z = -81.7 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -29.7, y = -59.7, z = -105.7 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },

                    --Survival guide
                    { zone_name = "Beaucedine Glacier", type = 'square', center = { x = -28.0, y = -59.8, z = -125.0 }, size = 1, floor_id = 0, colour = "green" },

                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -63.1, y = -58.2, z = -95.7 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -63.6, y = -47.5, z = -142.3 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -58.7, y = -39.6, z = -189.8 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -27.6, y = -39.7, z = -205.2 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 10.6, y = -40.1, z = -193.4 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 23.3, y = -40.1, z = -151.9 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 54.1, y = -40.9, z = -128.8 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 85.5, y = -40.0, z = -101.0 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 120.5, y = -40.0, z = -87.2 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 141.8, y = -40.4, z = -50.1 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 133.9, y = -40.5, z = -4.9 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 93.1, y = -39.5, z = 0.7 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 61.2, y = -39.2, z = 5.3 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 64.2, y = -36.0, z = 20.7 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 126.2, y = -23.1, z = 20.1 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 153.0, y = -19.3, z = 20.2 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 175.3, y = -19.9, z = 17.5 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 170.4, y = -20.4, z = -30.7 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 167.1, y = -19.8, z = -83.4 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 158.6, y = -19.9, z = -114.9 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 128.2, y = -19.7, z = -142.5 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 80.9, y = -19.6, z = -148.7 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 59.2, y = -17.4, z = -182.7 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 121.1, y = -3.7, z = -180.8 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 186.5, y = 0.4, z = -193.7 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },

                    --Intersection
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 229.4, y = 0.3, z = -198.3 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 269.5, y = 0.3, z = -200.8 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 317.1, y = 0.0, z = -196.8 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 323.4, y = 0.8, z = -136.6 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 313.5, y = 0.2, z = -88.5 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 300.7, y = 0.6, z = -27.6 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 299.3, y = 0.1, z = 21.2 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 292.0, y = 0.4, z = 57.7 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 237.4, y = 0.2, z = 88.7 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 194.3, y = 0.1, z = 115.2 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 181.1, y = 0.1, z = 144.2 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 195.4, y = 0.0, z = 180.4 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 237.2, y = 0.0, z = 196.2 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 282.7, y = 0.9, z = 217.7 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 335.7, y = -0.2, z = 226.0 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 357.0, y = 0.0, z = 277.8 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 382.8, y = 1.9, z = 296.3 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 380.4, y = 16.4, z = 361.3 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 379.2, y = 21.0, z = 403.6 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 370.2, y = 20.1, z = 429.0 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 357.5, y = 20.0, z = 475.5 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 324.6, y = 20.5, z = 506.7 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 296.7, y = 20.7, z = 524.6 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 280.7, y = 20.0, z = 535.0 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                },
            },
            { -- Step 5
                text = "Step 5: Travel to the Qu'Bia Arena entrance at (K-8) in Fei'Yin. \n \n",
                zone_trigger = "Qu'Bia Arena",
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = -176.1, y = -24.0, z = -171.4 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = -152.5, y = -24.0, z = -148.2 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = -133.5, y = -24.0, z = -140.4 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = -100.2, y = -19.0, z = -133.3 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = -97.7, y = -16.0, z = -96.0 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = -74.6, y = -16.0, z = -69.5 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = -60.4, y = -16.0, z = -61.0 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = -20.7, y = -16.0, z = -61.7 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 32.3, y = -16.0, z = -54.0 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 27.8, y = -16.0, z = -21.6 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = -20.3, y = -16.0, z = -16.8 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = -16.7, y = -16.0, z = 22.6 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 13.8, y = -16.0, z = 49.1 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 24.9, y = -16.0, z = 58.9 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 63.1, y = -16.6, z = 59.1 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 99.6, y = -24.0, z = 56.4 }, size = 4, direction = "se", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 124.8, y = -24.0, z = 28.4 }, size = 4, direction = "se", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 162.6, y = -23.7, z = 7.4 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 182.3, y = -24.0, z = 19.8 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 209.5, y = -24.0, z = 23.7 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 221.8, y = -24.0, z = 37.2 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 218.2, y = -24.0, z = 60.0 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'rect', center = { x = 231.5, y = -29.6, z = 60.0 }, width = 4.75, height = 10.75, floor_id = 1, colour = "cyan", vertical_axis = 'z' },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 237.3, y = -24.3, z = 59.5 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Fei'Yin",
                        floor_id = 1,
                        highlights = {
                            { position = "K-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 6
                text = "Step 6: Examine the Burning Circle to enter BCNM 'The Heir to the Light'. \n \n" ..
                       "Level cap 99, but you are still Level Restricted - BUFFS WEAR ON ENTRY. Rebuff after the opening event. \n" ..
                       "No EXP loss on death. Trusts can be summoned. \n \n" ..
                       "===== PART 1 ===== \n" ..
                       "- Death Clan Destroyer (Warmachine, WHM - will NOT sleep) \n" ..
                       "- Yukvok of Clan Death (Orc RNG - highly sleep resistant, uses Eagle Eye Shot) \n" ..
                       "- 3x Worgbut, 3x Rallbrog, 3x Vangknok of Clan Death (sleepable) \n \n" ..
                       "Tank rounds up the Orcs, then Sleepga/Horde Lullaby the pile. \n" ..
                       "SILENCE THE WARMACHINE - it is a White Mage and its Curaga will wake the whole horde. Kill it FIRST. \n" ..
                       "Then the Ranger, then mop up the rest (they are weak - Predator Claws shreds them). \n" ..
                       "Keep one weak orc slept and rest to full - killing the LAST orc triggers the event. \n \n" ..
                       "===== PART 2 ===== \n" ..
                       "Prince Trion joins you. IF TRION DIES, YOUR PARTY IS EJECTED - mages must keep him alive. \n" ..
                       "- Rojgnoj's Left Hand (BLM) \n" ..
                       "- Warlord Rojgnoj (PLD) \n" ..
                       "- Rojgnoj's Right Hand (DRK) \n \n" ..
                       "Kill order: BLM > PLD > DRK. Kill the BLM at all costs - it will wipe you. \n" ..
                       "Trion randomly picks a target, so DDs should Provoke onto whatever he engages. \n" ..
                       "Tank takes the PLD (very sleep resistant, but Bind holds him ~60s). Sleep whatever is not being fought. \n" ..
                       "SCH note: Accession buffs will land on Trion even though you cannot target him directly. \n \n" ..
                       "All 3 dead = post-battle cutscene.",
                onmob_target = "qu-bia-arena-burning-circle",
                trigger_on_event_id = {32001},
                onmob_enemy = {"Death Clan Destroyer", "Yukvok of Clan Death", "Worgbut of Clan Death", "Rallbrog of Clan Death", "Vangknok of Clan Death", "Warlord Rojgnoj", "Rojgnoj's Left Hand", "Rojgnoj's Right Hand"},
                onmob_enemy_colour = "red",
                onmob_enemy_size = 2,
            },
            { -- Step 7
                text = "Step 7: Zone into Northern San d'Oria for a short cutscene. \n \n",
                trigger_on_event_id = {0},
                zone_trigger = "Northern San d'Oria",
                route_to = "Northern San d'Oria",
            },
            { -- Step 8
                text = "Step 8: Go to Chateau d'Oraguille and examine the Door: Great Hall for a cutscene. \n \n" ..
                       "(Optional: Halver, Rahal, Curilla, Aramaviont and Milchupain have extra dialogue.) \n" ..
                       "(Optional: Pieuje's door and Trion's door each have a cutscene. The Door: Papal Chambers at the top of the Cathedral has another.) \n" ..
                       "(Optional: Talking to Trion with a San d'Oria Trust Permit unlocks Trust: Trion, if you already have Excenmille and Curilla.) \n \n",
                onmob_target = {"Door: Great Hall"},
                trigger_on_event_id = {8},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
                zone_max_distance = 20,
            },
            { -- Step 9
                text = "Step 9: Go to the Heavy Stone Door in King Ranperre's Tomb at (H-8) for a cutscene. \n \n",
                trigger_on_event_id = {14},
                onmob_target = {"king-ranperre-tomb-heavy-stone-door-h8"},
                route_to = "King Ranperre's Tomb",
                destination_highlight = {position = "H-8", offsetX = 16, offsetY = 16},
                zone_max_distance = 25,
                visual_zones = {
                    -- Entrance
                    { zone_name = "East Ronfaure", type = 'arrow', center = { x = 213.8, y = 2.9, z = -489.4 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "East Ronfaure", type = 'arrow', center = { x = 200.6, y = 0.0, z = -503.4 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "East Ronfaure", type = 'arrow', center = { x = 199.7, y = 0.3, z = -533.3 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },

                    --Kings Tomb
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -140.6, y = -0.1, z = 247.8 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -139.8, y = 0.0, z = 220.9 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -163.3, y = 0.0, z = 219.5 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -160.3, y = 0.0, z = 184.5 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -140.6, y = -1.1, z = 207.9 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -140.4, y = 7.5, z = 159.8 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -145.4, y = 7.2, z = 141.9 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -169.6, y = 7.5, z = 137.3 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -180.1, y = 7.5, z = 120.3 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -180.8, y = 7.5, z = 81.4 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -183.2, y = 7.3, z = 60.5 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -220.1, y = 6.5, z = 58.8 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -250.9, y = 6.8, z = 53.9 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -260.7, y = 7.3, z = 31.7 }, size = 4, direction = "se", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -234.6, y = 7.5, z = 20.4 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -181.7, y = 7.0, z = 17.1 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -147.3, y = 7.1, z = 16.9 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -99.7, y = 8.3, z = 15.7 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -100.8, y = 4.5, z = -27.6 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -116.3, y = 3.0, z = -27.3 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -117.0, y = 0.0, z = -62.7 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -117.2, y = 0.1, z = -105.9 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -115.3, y = 0.0, z = -134.9 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -75.2, y = 0.0, z = -134.7 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -44.1, y = 0.0, z = -130.8 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -23.5, y = -0.0, z = -135.6 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 37.5, y = 0.0, z = -135.1 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 36.2, y = 0.0, z = -84.1 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },

                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 36.1, y = 0.0, z = -62.3 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },

                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 36.0, y = 3.0, z = -26.6 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 20.0, y = 4.5, z = -26.2 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 21.1, y = 8.7, z = 19.3 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 72.1, y = 7.2, z = 19.2 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 124.1, y = 7.5, z = 18.5 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 140.8, y = 7.2, z = 62.4 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 136.9, y = 7.3, z = 84.3 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 138.2, y = 8.5, z = 117.5 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 113.9, y = 8.2, z = 141.5 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 80.1, y = 7.5, z = 180.6 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 29.5, y = 6.8, z = 179.4 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 10.1, y = 7.6, z = 178.0 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -21.0, y = 7.3, z = 173.6 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -7.1, y = 7.5, z = 129.1 }, size = 4, direction = "se", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 23.7, y = 8.0, z = 106.7 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 55.5, y = 6.5, z = 105.1 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 59.2, y = 7.5, z = 75.0 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 56.7, y = 7.2, z = 61.6 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = 18.0, y = 7.3, z = 60.6 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -10.7, y = 6.9, z = 54.5 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -20.5, y = 8.8, z = 31.2 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                    { zone_name = "King Ranperre's Tomb", type = 'arrow', center = { x = -31.6, y = 7.5, z = 20.1 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },

                    --Door non fight
                    --{ zone_name = "King Ranperre's Tomb", type = 'rect', center = { x = -39.0, y = 4.8, z = 20.0 }, width = 4.25, height = 5.75, floor_id = 1, colour = "cyan", vertical_axis = 'z' },
                },
            },
            { -- Step 10
                text = "Step 10: Report back to Halver in Chateau d'Oraguille for the final cutscene and your reward. \n \n" ..
                       "MAKE SURE YOU HAVE A FREE INVENTORY SLOT for the San d'Orian Flag. \n" ..
                       "(If your inventory is full, talk to Halver again afterwards and he will hand it over.) \n \n" ..
                       "(Optional afterwards: Pieuje's and Trion's doors have two more Rank 10 only cutscenes; Rahal, Aramaviont and Curilla have dialogue; and there is an epilogue cutscene when you zone into Southern San d'Oria.) \n \n",
                onmob_target = {"Halver"},
                trigger_on_event_id = {9},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
                zone_max_distance = 20,
            },
        },
        reward = {
            text = "Rank 10, 100,000 gil, Title: San d'Orian Royal Heir, San d'Orian Flag, can purchase Atma of the Heir"
        }
    },
}
