return {
    ["Bombs Away!"] = {
        steps = {
            {
                text = "Step 1: Speak to Buffalostalker Dodzbraz (F-9) in Uleguerand Range to accept the quest.\n \n" ..
                       "Note: Shu'Meyo Salt (the reward) extends the Snoll Tzar timer by 20 seconds during CoP 5-3 - stack usages but do not overlap.\n \n",
                route_to = "Uleguerand Range",
                onmob_target = "uleguerand-range-buffalostalker-dodzbraz",
                destination_highlight = {position = "F-9", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {6},
                zone_max_distance = 40,
                visual_zones = {
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 32.0, y = -16.2, z = 8.6 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 20.0, y = -16.7, z = 60.0 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 12.0, y = -36.3, z = 149.4 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = 2.5, y = -35.7, z = 109.3 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = -20.9, y = -36.7, z = 58.9 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = -105.7, y = -36.5, z = 65.9 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = -136.4, y = -35.9, z = 47.9 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = -136.7, y = -24.0, z = 100.4 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Xarcabard", type = 'arrow', center = { x = -138.9, y = -21.6, z = 130.8 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },

                    -- Uleguerand
                    { zone_name = "Uleguerand Range", type = 'arrow', center = { x = -174.1, y = -39.4, z = -474.3 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Uleguerand Range", type = 'arrow', center = { x = -182.5, y = -19.7, z = -370.1 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Uleguerand Range", type = 'arrow', center = { x = -212.6, y = -19.5, z = -320.4 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Uleguerand Range", type = 'arrow', center = { x = -258.8, y = -20.5, z = -255.9 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Uleguerand Range", type = 'arrow', center = { x = -311.1, y = -16.9, z = -219.2 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Uleguerand Range", type = 'arrow', center = { x = -338.9, y = -25.5, z = -200.0 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Uleguerand Range", type = 'arrow', center = { x = -350.6, y = -27.4, z = -139.0 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Uleguerand Range", type = 'arrow', center = { x = -381.3, y = -25.7, z = -145.2 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                },
            },
            {
                text = "Step 2: Obtain 2x Cluster Core and trade them to Buffalostalker Dodzbraz (F-9) to complete the quest.\n \n" ..
                       "Cluster Cores are dropped by Clusters in Uleguerand Range - you should have some from 'Riverne - Site #A01/B01. \n \n",
                route_to = "Uleguerand Range",
                onmob_target = "uleguerand-range-buffalostalker-dodzbraz",
                --onmob_enemy = {"Cluster"},
                destination_highlight = {position = "F-9", offsetX = 16, offsetY = 16},
                items_needed = {
                    { item = "Cluster Core", quantity = 2, on_the_way = true },
                },
                --trigger_on_item_obtain = {{item = "Cluster Core", quantity = 2}},
                trigger_on_event_id = {8},
            },
        },
        reward = {
            text = "Shu'Meyo Salt\nUseful for CoP 5-3: extends the Snoll Tzar timer by 20 seconds per use.",
        }
    },
}
