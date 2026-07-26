return {
    ["Fly High"] = {
        prerequisites = {
            {category = "Missions", subfile = "ChainsOfPromathia", name = "CoP 4-2: The Savage"},
        },
        steps = {
            {
                text = "Step 1: Speak with Ferchinne (G-9) on the First (Main) floor of Tavnazian Safehold to accept the quest.\n \n" ..
                       "Prerequisite: Must be on or have completed CoP 4-2: The Savage and may require speaking multiple times to get the quest dialogue.\n \n",
                route_to = "Tavnazian Safehold 2",
                onmob_target = "Ferchinne",
                destination_highlight = {position = "G-9", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {241,242,244},
                visual_zones = {
                    { zone_name = "Tavnazian Safehold", type = 'arrow', center = { x = -20.2, y = -22.0, z = 20.7 }, size = 4, direction = "nw", floor_id = 2, colour = "yellow" },
                    { zone_name = "Tavnazian Safehold", type = 'arrow', center = { x = -55.0, y = -22.2, z = 44.1 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Tavnazian Safehold", type = 'arrow', center = { x = -78.5, y = -22.0, z = 50.7 }, size = 4, direction = "up", floor_id = 2, colour = "yellow" },
                    { zone_name = "Tavnazian Safehold", type = 'arrow', center = { x = -88.3, y = -19.8, z = 62.5 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                },
            },
            {
                text = "Step 2: Obtain 2x Hippogryph Tailfeathers and trade them to Ferchinne (G-9) to complete the quest.\n \n" ..
                       "You should have some from CoP 2-5 Ancient Vows, if not go kill Hippogryphs in Riverne - Site #A01! \n \n" ..
                       "Dropped by Hippogryphs in:\n" ..
                       "- Riverne - Site #A01\n" ..
                       "- Riverne - Site #B01\n" ..
                       "- Grauberg (S)\n \n" ..
                       "Or buy from Auction House: Materials > Clothcraft.\n \n" ..
                       "This quest is repeatable - each completion rewards 1x Mistmelt.\n \n",
                onmob_enemy = {"Hippogryph","Cloud Hippogryph"},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        -- highlights = {
                        --     { position = "G-10", offsetX = 16, offsetY = 16 },
                        -- },
                        zone_name = "Riverne - Site #A01",
                        floor_id = 2,
                    },
                },
                destination_highlight = {position = "G-9", offsetX = 16, offsetY = 16},
                items_needed = {
                    { item = "Hippogryph Tailfeather", quantity = 2, on_the_way = true },
                },
                trigger_on_item_obtain = {{item = "Hippogryph Tailfeather", quantity = 2}},
            },
            {
                text = "Step 3: Trade the Hippogryph Tailfeathers to Ferchinne (G-9), each completion rewards 1x Mistmelt.\n \n",
                route_to = "Tavnazian Safehold 2",
                onmob_target = "Ferchinne",
                destination_highlight = {position = "G-9", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {243,245},
            },
        },
        reward = {
            text = "Mistmelt x1\nRepeatable - run again for more Mistmelts for the Ouryu fight (CoP 4-2).",
        }
    },

    ["A Hard Day's Knight"] = {
        steps = {
            {
                text = "Step 1: Speak to Quelveuiat (I-10) in Tavnazian Safehold to accept the quest.\n \n" ..
                       "Closest Home Point is #2. Head up the ramp and turn left - Quelveuiat paces in front of Eonnite's Revelations.\n" ..
                       "Agree both times to start the quest.\n \n",
                route_to = "Tavnazian Safehold 2",
                onmob_target = "Quelveuiat",
                destination_highlight = {position = "I-10", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {119},
            },
            {
                text = "Step 2: Exit Tavnazian Safehold north, cross the bridge, and take the south exit into Lufaise Meadows (I-6).\n \n" ..
                       "Head south to H-10 and climb the lookout platform.\n" ..
                       "Click the ??? at the top to spawn Splinterspine Grukjuk (Orc Ranger NM).\n" ..
                       "Kill Splinterspine Grukjuk.\n \n",
                route_to = "Lufaise Meadows",
                onmob_target = "lufaise-meadows-???-h10",
                onmob_enemy = {"Splinterspine Grukjuk"},
                visual_zones = {
                    { zone_name = "Lufaise Meadows", type = 'arrow', center = { x = -274.1, y = -5.1, z = -232.4 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Lufaise Meadows", type = 'arrow', center = { x = -199.0, y = -8.1, z = -198.2 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Lufaise Meadows", type = 'arrow', center = { x = -137.0, y = -6.5, z = -174.8 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Lufaise Meadows", type = 'arrow', center = { x = -90.2, y = -7.6, z = -177.0 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Lufaise Meadows", type = 'arrow', center = { x = -68.1, y = -7.0, z = -221.8 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Lufaise Meadows", type = 'arrow', center = { x = -19.5, y = -6.2, z = -248.0 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Lufaise Meadows", type = 'arrow', center = { x = -50.5, y = -0.3, z = -276.6 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                },
                destination_highlight = {position = "H-10", offsetX = 16, offsetY = 16},
                kill_requirement = {
                    count = 1,
                    enemies = {"Splinterspine Grukjuk"},
                    count_party_kills = true,
                },
            },
            {
                text = "Step 3: Return to Tavnazian Safehold (Home Point #2) and speak to Quelveuiat (I-10) to complete the quest.\n \n",
                route_to = "Tavnazian Safehold 2",
                onmob_target = "Quelveuiat",
                destination_highlight = {position = "I-10", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {121},
            },
            {
                text = "Step 4: After completion, trade a Sealion Crest Key AND a Coral Crest Key to Quelveuiat to receive the Key Item: Temple Knight Key.\n" ..
                       "The Temple Knight Key grants solo access to the inner Sacrarium (useful for CoP 4-3).\n \n",
                route_to = "Tavnazian Safehold 2",
                onmob_target = "Quelveuiat",
                destination_highlight = {position = "I-10", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {632},
                trigger_on_keyitem_obtain = {2506}
            },
        },
        reward = {
            text = "2100 gil\nTitle: Tavnazian Squire\nOptional: Trade Sealion Crest Key + Coral Crest Key to Quelveuiat for Key Item: Temple Knight Key (solo Sacrarium access for CoP 4-3).",
        }
    },
}
