return {
    -- =========================================================================================
    -- 1) Forge Your Destiny (Samurai unlock)
    -- =========================================================================================
    ["1.Samurai Quest - Forge Your Destiny"] = {
        requirements = {
            level = 30,
        },
        steps = {
            {
                text = "Step 1: Speak with Jaucribaix in Norg (K-8) and accept the quest.\n \n" ..
                       "- He is on the upper level, at the end of the hallway near the Captain's Quarters.\n" ..
                       "- He asks for a Lump of Bomb Steel and a Sacred Branch, and points you at his two pupils.\n" ..
                       "- The dialogue ends with a choice - you must pick the option that accepts, or the quest\n" ..
                       "  does not start.\n \n" ..
                       "===== Getting to Norg =====\n" ..
                       "- Airship to Kazham, out into Yuhtunga Jungle, then in at the Sea Serpent Grotto entrance\n" ..
                       "  (E-11). Norg is a short run inside; a chocobo from Kazham saves most of the jungle.\n" ..
                       "- WARNING: Sahagin in Sea Serpent Grotto aggro. Sneak is strongly recommended at Lv30.\n" ..
                       "- TIP: Norg has a Home Point and a chocobo of its own - the return trips get much cheaper\n" ..
                       "  once you have been there once.\n \n",
                onmob_target = "Jaucribaix",
                route_to = "Norg",
                visual_zones = {
                    -- Kazham exit south-west through Yuhtunga to the Sea Serpent Grotto entrance
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

                    -- Through the grotto to the Norg door
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
                destination_highlight = { position = "K-8", offsetX = 16, offsetY = 16 },
                trigger_on_event_id = { 25 },
            },
            {
                text = "Step 2: Go down the long steps and talk to Aeka (I-8) for the Lump of Oriental Steel.\n \n" ..
                       "NOTE: If you lose the steel or fail against Forger, Aeka will sell you a replacement for\n" ..
                       "1x Darksteel Ore.\n \n",
                onmob_target = "Aeka",
                route_to = "Norg",
                visual_zones = {
                    -- Kazham exit south-west through Yuhtunga to the Sea Serpent Grotto entrance
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

                    -- Through the grotto to the Norg door
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
                destination_highlight = { position = "I-8", offsetX = 16, offsetY = 16 },
                zone_max_distance = 35,
                trigger_on_event_id = { 44, 47 },
            },
            {
                text = "Step 3: Talk to Ranemaud (I-7), just along from Aeka, for the Sacred Sprig.\n \n" ..
                       "NOTE: If you lose the sprig, Ranemaud will sell you a replacement for 1x Platinum Ore and\n" ..
                       "2x Gold Ore.\n \n",
                onmob_target = "Ranemaud",
                route_to = "Norg",
                visual_zones = {
                    -- Kazham exit south-west through Yuhtunga to the Sea Serpent Grotto entrance
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

                    -- Through the grotto to the Norg door
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
                destination_highlight = { position = "I-7", offsetX = 16, offsetY = 16 },
                zone_max_distance = 35,
                trigger_on_event_id = { 40, 43 },
            },
            {
                text = "Step 4: In The Sanctuary of Zi'Tah, pop and kill the Guardian Treant, then trade the Sacred\n" ..
                       "Sprig to the ??? for the Sacred Branch.\n \n" ..
                       "===== Finding the ??? =====\n" ..
                       "- At (K-10) there is a pathway leading into an UNMAPPED area. Head straight east to (L-10)\n" ..
                       "  and you will see a large tree.\n" ..
                       "- Climb the rocks at the base of the tree to get close enough to the ??? to use it.\n \n" ..
                       "===== The pop =====\n" ..
                       "- Trade or use a Hatchet on the ??? to spawn the Guardian Treant. The hatchet is NOT\n" ..
                       "  consumed, and only one person in a party needs one.\n" ..
                       "- Kill the Treant, then trade the Sacred Sprig to the ??? to receive the Sacred Branch.\n" ..
                       "- Everyone in the party can trade a sprig for a branch off a single Treant kill - you do\n" ..
                       "  not need one NM per person.\n \n" ..
                       "NOTE: The ??? goes on a 10 minute cooldown after the Treant despawns. If it says a strange\n" ..
                       "force prevents you, the timer is still running.\n \n" ..
                       "NOTE: This step and the Konschtat one can be done in either order. If you do Konschtat\n" ..
                       "first, tick that step off manually.\n \n",
                route_to = "The Sanctuary of Zi'Tah",
                destination_highlight = {
                    { position = "K-10", offsetX = 16, offsetY = 16, label = "Path", color = "yellow" },
                    { position = "L-10", offsetX = 16, offsetY = 16, label = "???",  color = "cyan" },
                },
                onmob_target = "zitah-guardian-treant-qm-l10",
                onmob_enemy = "Guardian Treant",
                zone_max_distance = 50,
                items_needed = { "Hatchet" },
                trigger_on_item_obtain = { "Sacred Branch", "sacred branch" },
                visual_zones = {
                    { zone_name = "The Sanctuary of Zi'Tah", type = 'square', center = { x = 642.0, y = -5.0, z = -150.0 }, size = 2, floor_id = 0, colour = "cyan" },
                },
            },
            {
                text = "Step 5: In Konschtat Highlands, trade the Lump of Oriental Steel to the ??? at (D-8) to pop\n" ..
                       "Forger, then kill it and loot the Lump of Bomb Steel.\n \n" ..
                       "- The ??? is inside a cave. You must be standing right next to it - stand off and the trade\n" ..
                       "  is refused with a 'must be closer' message.\n" ..
                       "- Forger drops exactly one Lump of Bomb Steel.\n \n" ..
                       "CRITICAL: If you lose the fight the Oriental Steel is gone - you have to go back to Aeka in\n" ..
                       "Norg with a Darksteel Ore for another one. Bring help if you are close to Lv30.\n \n" ..
                       "NOTE: The ??? stays visible but will not pop Forger again for 2 minutes after he despawns,\n" ..
                       "so parties popping him back to back need to wait their turn.\n \n",
                route_to = "Konschtat Highlands",
                destination_highlight = { position = "D-8", offsetX = 16, offsetY = 16 },
                onmob_target = "konschtat-forger-qm-d8",
                onmob_enemy = "Forger",
                zone_max_distance = 40,
                kill_requirement = {
                    count = 1,
                    enemies = { "Forger" },
                    zone = "Konschtat Highlands",
                    count_party_kills = true,
                },
                visual_zones = {
                    { zone_name = "Konschtat Highlands", type = 'square', center = { x = -709.0, y = 2.0, z = 102.0 }, size = 2, floor_id = 0, colour = "cyan" },
                },
            },
            {
                text = "Step 6: Return to Norg and trade the Lump of Bomb Steel AND the Sacred Branch to Jaucribaix\n" ..
                       "(K-8) together.\n \n" ..
                       "CRITICAL: Both items go in the SAME trade window. Trading them one at a time does nothing.\n \n" ..
                       "- He tells you the blade will be ready in 3 Vana'diel days.\n \n",
                onmob_target = "Jaucribaix",
                route_to = "Norg",
                visual_zones = {
                    -- Kazham exit south-west through Yuhtunga to the Sea Serpent Grotto entrance
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

                    -- Through the grotto to the Norg door
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
                destination_highlight = { position = "K-8", offsetX = 16, offsetY = 16 },
                trigger_on_event_id = { 27 },
            },
            {
                text = "Step 7: Wait 3 Vana'diel days, then speak to Jaucribaix (K-8) again for the cutscene where\n" ..
                       "Gilgamesh hands you the Mumeito and unlocks Samurai.\n \n" ..
                       "- 3 Vana'diel days is 2 hours 53 minutes of real time. Talking to him early just gives the\n" ..
                       "  'not ready' dialogue with the hours remaining - it costs nothing to check.\n \n" ..
                       "TIP: Park it here and go level. Norg's Home Point makes the return trip trivial.\n \n" ..
                       "CRITICAL: Keep the Mumeito. It is needed for the Samurai AF Great Katana quest 'The Sacred\n" ..
                       "Katana' - if you drop it, Ranemaud charges 30,000 gil for a replacement, and only after you\n" ..
                       "have already accepted that quest.\n \n",
                onmob_target = "Jaucribaix",
                route_to = "Norg",
                visual_zones = {
                    -- Kazham exit south-west through Yuhtunga to the Sea Serpent Grotto entrance
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

                    -- Through the grotto to the Norg door
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
                destination_highlight = { position = "K-8", offsetX = 16, offsetY = 16 },
                trigger_on_event_id = { 29 },
            },
        },
        reward = {
            text = "Unlocks the Samurai job!\n \n" ..
                   "Mumeito (Lv1 Great Katana - keep it for the AF quest 'The Sacred Katana')\n" ..
                   "Title: Bushido Blade\n" ..
                   "Job gesture: Samurai\n" ..
                   "Norg fame +20\n \n",
        },
    },
}
