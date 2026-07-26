-- =============================================================================
-- Garlaige Citadel - zone quests
-- =============================================================================
-- Keyed by starting/target zone like the other files in data/Quests.
--
-- "Pouch of Weighted Stones" is an OPTIONAL key-item grab, not a giver quest -
-- you just examine a ??? on Map 1. It lets you open Banishing Gates solo by
-- clicking the gate, instead of needing 4 players on the weight switches. It is
-- useful to BOTH Genkai 1 routes (Farming and Key Item) since the gate blocks
-- the deeper rooms either way - it is NOT tied to the Key Item method.
-- KI 1846 (see data/keyitems.lua).
-- =============================================================================

return {
    ["Pouch of Weighted Stones"] = {
        steps = {
            {
                text = "Step 1: Examine the ??? at (G-8) on Map 1 of Garlaige Citadel to receive the Key Item 'Pouch of Weighted Stones'.\n \n" ..
                       "- WARNING: Use Sneak + Invisible to avoid aggro from the bats/skeletons and bombs on the way in.\n \n",
                route_to = "Garlaige Citadel",
                onmob_target = "garlaige-citadel-g8-weighted-stones",
                zone_max_distance = 20,
                visual_zones = {
                    -- To Weighted Stones KI
                      { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -380.1, y = -7.8, z = 375.0 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                      { zone_name = "Garlaige Citadel", type = 'square', center = { x = -383.0, y = -6.0, z = 363.5 }, size = 1, floor_id = 1, colour = "green" },
                      { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -366.3, y = -6.0, z = 340.3 }, size = 3, direction = "right", floor_id = 1, colour = "yellow" },
                      { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -340.4, y = -3.3, z = 337.6 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                      { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -339.9, y = 0.0, z = 301.4 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                      { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -337.6, y = 0.0, z = 290.3 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                      { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -341.4, y = 0.0, z = 270.1 }, size = 3, direction = "left", floor_id = 1, colour = "yellow" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Garlaige Citadel",
                        floor_id = 1, -- VERIFY: Map 1 (entrance level). User draws Garlaige arrows on floor_id 1; Map 1 may be 0.
                        highlights = {
                            { position = "G-8", offsetX = 16, offsetY = 16},
                        },
                    },
                },
                keyitems_needed = {1846},
                trigger_on_keyitem_obtain = {1846},
            },
        },
        reward = {
            text = "Key Item: Pouch of Weighted Stones.\n \n" ..
                   "- Opens Banishing Gates in Garlaige Citadel on click.\n \n",
        },
    },
}
