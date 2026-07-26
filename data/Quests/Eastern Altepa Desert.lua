return {
    ["Open Sesame"] = {
        steps = {
            {
                text = "Step 1: Obtain a Tremorstone by checking a ??? near the protocrystal in the Cloister of Tremors. \n \n" ..
                       "This quest does not need to be active to obtain the Tremorstone. \n \n" ..
                       "Quick route: If you have Summoner level 20+, use the Mini Tuning Fork of Earth from the 'Trial Size Trial by Earth' quest to warp instantly. \n \n" ..
                       "Alternative: Use Quicksand Caves Home Point #2, or Unity warp to Quicksand Caves (Level 125 category).",
                trigger_on_item_obtain = "Tremorstone",
                items_needed = {"Tremorstone"},
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
