return {
    ["Magicked Astrolabe"] = {
        steps = {
            {
                text = "Speak to Churano-Shurano in Windurst Waters (North) and buy the KI:Magicked Astrolabe for 10,000 gil. \n \n" ..
                       "Notes: Not an official quest and sometimes not available on all servers - the Astrolabe is simply purchased. It opens the locked doors in the Eldieme Necropolis. \n \n",
                route_to = "Windurst Waters North",
                destination_highlight = {position = "F-8", offsetX = 16, offsetY = 16},
                onmob_target = "Churano-Shurano",
                keyitems_needed = {2578},
                trigger_on_keyitem_obtain = {2578},
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Windurst Waters North", type = 'arrow', center = { x = -67.2, y = -5.0, z = 98.0 }, size = 3, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Windurst Waters North", type = 'arrow', center = { x = -66.0, y = -10.8, z = 115.1 }, size = 3, direction = "right", floor_id = 1, colour = "yellow" },
                },
            },
        },
        reward = {
            text = "Permanent Key Item: Magicked Astrolabe"
        }
    },
}
