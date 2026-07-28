return {
    ["Open Sesame"] = {
        steps = {
            {
                text = "Step 1: Obtain a Tremorstone by checking a ??? near the protocrystal in the Cloister of Tremors. \n \n" ..
                       "This quest does not need to be active to obtain the Tremorstone. \n \n" ..
                       "Quick route: If you have Summoner level 20+, use the Mini Tuning Fork of Earth from the 'Trial Size Trial by Earth' quest to warp instantly. \n \n" ..
                       "Alternative: Use Quicksand Caves Home Point #2, or Unity warp to Quicksand Caves (Level 125 category).",
                onmob_target = "cloister-of-tremors-tremorstone-???",
                zone_max_distance = 35,
                visual_zones = {
                        -- Eastern Altepa Desert to Quicksands Caves 1
                        { zone_name = "Eastern Altepa Desert", type = 'arrow', center = { x = 459.1, y = -7.0, z = 85.5 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Eastern Altepa Desert", type = 'arrow', center = { x = 468.8, y = 3.9, z = 138.8 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                        { zone_name = "Eastern Altepa Desert", type = 'arrow', center = { x = 499.7, y = 2.2, z = 142.3 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Eastern Altepa Desert", type = 'arrow', center = { x = 497.6, y = 2.2, z = 180.0 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Eastern Altepa Desert", type = 'arrow', center = { x = 456.1, y = 7.1, z = 179.9 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Eastern Altepa Desert", type = 'arrow', center = { x = 421.0, y = 10.2, z = 181.5 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },

                        -- Quicksand Caves 1 to Cloister of Tremors
                        { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 940.3, y = -15.1, z = -352.1 }, size = 3, direction = "up", floor_id = 1, colour = "yellow" },
                        { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 940.4, y = -8.0, z = -299.7 }, size = 3, direction = "left", floor_id = 1, colour = "yellow" },
                        { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 903.3, y = -8.0, z = -299.3 }, size = 3, direction = "left", floor_id = 1, colour = "yellow" },
                        { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 858.8, y = -8.0, z = -301.6 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                        { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 859.2, y = -8.0, z = -344.1 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                        { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 861.8, y = -8.1, z = -376.4 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                        { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 861.8, y = -8.0, z = -413.9 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                        { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 861.0, y = -8.0, z = -443.2 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                        { zone_name = "Quicksand Caves", type = 'line', start = { x = 861.2, y = -8.0, z = -444.3 }, stop = { x = 861.1, y = -3.1, z = -447.4 }, floor_id = 1, colour = "yellow" },
                        { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 858.8, y = -2.4, z = -450.0 }, size = 3, direction = "sw", floor_id = 1, colour = "yellow" },
                        { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 855.0, y = -1.4, z = -456.7 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                        { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 853.7, y = 1.1, z = -498.3 }, size = 3, direction = "left", floor_id = 1, colour = "yellow" },
                        { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 820.4, y = 1.0, z = -508.1 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                        { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 814.7, y = 1.2, z = -539.7 }, size = 3, direction = "sw", floor_id = 1, colour = "yellow" },
                        { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 793.9, y = 2.0, z = -551.0 }, size = 3, direction = "left", floor_id = 1, colour = "yellow" },
                        { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 742.8, y = 1.3, z = -545.8 }, size = 3, direction = "nw", floor_id = 1, colour = "yellow" },
                        { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 712.0, y = 0.6, z = -544.0 }, size = 3, direction = "left", floor_id = 1, colour = "yellow" },
                        { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 700.6, y = 0.0, z = -543.8 }, size = 3, direction = "left", floor_id = 1, colour = "yellow" },
                        { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 657.1, y = 0.0, z = -544.8 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                        { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 657.3, y = 0.0, z = -570.3 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                        { zone_name = "Quicksand Caves", type = 'line', start = { x = 657.3, y = 0.0, z = -572.6 }, stop = { x = 657.2, y = 6.3, z = -575.3 }, floor_id = 1, colour = "yellow" },
                        { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 647.9, y = 8.5, z = -579.0 }, size = 3, direction = "left", floor_id = 1, colour = "yellow" },
                        { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 620.4, y = 9.1, z = -573.2 }, size = 3, direction = "up", floor_id = 1, colour = "yellow" },
                        { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 612.4, y = 9.1, z = -539.2 }, size = 3, direction = "left", floor_id = 1, colour = "yellow" },
                        { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 580.3, y = 9.4, z = -535.2 }, size = 3, direction = "up", floor_id = 1, colour = "yellow" },
                        { zone_name = "Quicksand Caves", type = 'arrow', center = { x = 578.6, y = 9.1, z = -502.7 }, size = 3, direction = "up", floor_id = 1, colour = "yellow" },
                        { zone_name = "Quicksand Caves", type = 'square', center = { x = 573.0, y = 9.2, z = -499.0 }, size = 1, floor_id = 1, colour = "green" },

                        --Acquire Tremor Stone
                        { zone_name = "Cloister of Tremors", type = 'arrow', center = { x = -579.1, y = 1.1, z = -558.8 }, size = 3, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Cloister of Tremors", type = 'arrow', center = { x = -575.3, y = 1.4, z = -542.9 }, size = 3, direction = "right", floor_id = 0, colour = "yellow" },
                        { zone_name = "Cloister of Tremors", type = 'arrow', center = { x = -539.5, y = 1.0, z = -531.1 }, size = 3, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Cloister of Tremors", type = 'arrow', center = { x = -544.8, y = 1.8, z = -500.1 }, size = 3, direction = "up", floor_id = 0, colour = "yellow" },
                },
                trigger_on_item_obtain = "Tremorstone",
                items_needed = {"Tremorstone"},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Eastern Altepa Desert",
                        floor_id = 0,
                        highlights = {
                            { position = "K-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Quicksand Caves",
                        floor_id = 1,
                        highlights = {
                            { position = "D-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 2: Obtain ONE of the following items (your choice): \n \n" ..
                       "Option 1: Meteorite - Dropped by Crawlers in West Sarutabaruta (only Crawlers around Starfall Hillock), or excavated from Mineral Vein in Mog Garden. \n \n" ..
                       "Option 2: Soil Gem - Craft via mid-level Goldsmithing, or buy from Auction House. \n \n" ..
                       "Option 3: Twelve Soil Geodes - Dropped by high level monsters on Earthday or in earth weather, or buy from Auction House.",
                items_needed = {
                    { display = "Meteorite OR Soil Gem OR 12x Soil Geodes", alternatives = {
                        { item = "Meteorite", quantity = 1 },
                        { item = "Soil Gem", quantity = 1 },
                        { item = "Soil Geodes", quantity = 12 },

                    }}
                },
                trigger_on_item_obtain = {
                    { item = "Meteorite", quantity = 1 },
                    { item = "Soil Gem", quantity = 1 },
                    { item = "Soil Geodes", quantity = 12 },
                },
                require_all_items = false,  -- Only need ONE of the items above
                route_to = "West Sarutabaruta",
                destination_highlight = {position = "J-7", offsetX = 16, offsetY = 16},
            },
             {
                text = "Step 3: Speak to Lokpix at the Altepa telepoint in Eastern Altepa Desert (G-10) and answer yes to both questions. \n \n" ..
                       "This step does not need to be done first, but must be completed before trading items to him. \n \n" ..
                       "If you are a GALKA no need to do this quest you are heavy enough to trigger the door mechanism! :D \n \n",
                onmob_target = "Lokpix",
                --trigger_on_event_id = 20,
                trigger_on_talk = " Dat's why.",
                route_to = "Eastern Altepa Desert",
                destination_highlight = {position = "G-7", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 4: Trade the Tremorstone and your chosen item(s) to Lokpix at Eastern Altepa Desert (G-7) to receive the Key Item: Loadstone.",
                onmob_target = "Lokpix",
                trigger_on_keyitem_obtain = {2051},
                route_to = "Eastern Altepa Desert",
                destination_highlight = {position = "G-7", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "Key Item: Loadstone (Required for Bastok Mission 8-1, and ZM6)"
        }
    },
}
