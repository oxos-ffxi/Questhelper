return {
    ["Leaping Lizzy"] = {
        steps = {
            {
                text = "===== Spawn Details =====\n" ..
                       "Leaping Lizzy is a notorious monster that spawns in South Gustaberg (E-8 to F-8).\n" ..
                       "It is a lottery spawn from the Rock Lizards in the area.\n \n" ..
                       "- Placeholder: Rock Lizards in the central area at (F-8).\n" ..
                       "- Spawn Timer: 5-15 minutes after the placeholder is defeated.\n" ..
                       "- Spawn Chance: Approximately 9.4 percent per placeholder.\n" ..
                       "- Use Wide Scan to locate her more easily; she typically appears in the first group of Rock Lizards.\n\n" ..
                       "===== Battle Strategy =====\n" ..
                       "- Leaping Lizzy can be easily soloed around level 15-18.\n" ..
                       "- Suggested jobs: THF/RNG/BST/WAR; any with ranged or movement speed bonuses for quick tagging on populated servers.\n \n" ..
                       "- Useful information: BSTs can use the ability 'Charm' and utilize Wide Scan.\n \n",
                images = {
                    {
                        zone_name = "South Gustaberg",
                        width = 512,
                        height = 512,
                        highlights = {
                            { position = "F-8", offsetX = 16, offsetY = 16 }
                        },
                    },
                }
            },
        },
        reward = {
            text = "Notable Drops:", -- lowercase 'text'
            items = {
                {
                    name = "Bounding Boots",
                    type = "FEET",
                    races = "All Races",
                    stats = { "DEF:+3", "DEX:+3", "AGI:+3" },
                    level = "7",
                    jobs = "WAR/RDM/THF/PLD/DRK/BST/BRD/RNG/SAM/NIN/DRG/BLU/COR/DNC",
                    note = "Drop Rate: ~6.7%"
                }
                --,
                -- {
                --     name = "Lizard Hide",
                --     type = "MATERIAL",
                --     --races = "", -- Can be empty string if not applicable
                --     --stats = {}, -- Can be empty table
                --     --level = 0,  -- Or some other indicator for N/A if you prefer
                --     --jobs = "All Jobs",
                --     note = "Common drop"
                -- }
            }
        }
    },
    ["Bubbly Bernie"] = {
        steps = {
            {
                text = "Step 1: Acquire a Quus (To Spawn Bubbly Bernie)\n \n" ..
                       "===== Purchase from Guild Merchants =====\n \n" ..
                       "*Note: Merchants operate during specific in-game hours*\n" ..

                       "- Babubu (Port Windurst, C-8)\n" ..
                       "- Graegham & Mendoline (Selbina, H-9)\n" ..
                       "- Rajmonda (Ship to Mhaura)\n" ..
                       "- Jidwahn (Nashmau - Al Zahbi Ferry)\n" ..
                       "- Wahnid (Aht Urhgan Whitegate, H-11)\n \n" ..
                       "===== Obtain via Fishing (Skill Level: 19) =====\n \n" ..
                       "- Locations:\n" ..
                       "  - Port Bastok\n" ..
                       "  - Port Windurst\n" ..
                       "  - South Gustaberg\n" ..
                       "  - Selbina\n" ..
                       "  - Ship routes between Mhaura and Selbina\n" ..
                       "- Bait: Lugworm, Sabiki Rig, Fly Lure\n" ..
                       "- Rods: Halcyon Rod, Composite Rod, Carbon Rod\n \n" ..
                       "===== Buy from Auction House =====\n \n" ..
                       "- Check 'Food' > 'Fish' section for listings.\n \n" ..
                       "\n \n",
                images = {
                    {
                        zone_name = "Port Windurst",
                        width = 512,
                        height = 512,
                        highlights = {
                            { position = "C-8", offsetX = 16, offsetY = 16 }
                        },
                    },
                    {
                        zone_name = "Selbina",
                        width = 512,
                        height = 512,
                        highlights = {
                            { position = "H-9", offsetX = 16, offsetY = 16 }
                        },
                    },
                    {
                        zone_name = "Aht Urhgan Whitegate",
                        width = 512,
                        height = 512,
                        highlights = {
                            { position = "H-11", offsetX = 16, offsetY = 16 }
                        },
                    },
                }
            },
            {
                text = "Step 2: Spawn and Defeat Bubbly Bernie\n \n" ..
                       "===== Spawn Details =====\n \n" ..
                        "- Location: Near Morhen Lighthouse (M-10).\n" ..
                        "- Spawn Method: Trade a Quus to the ??? at the spawn location.\n \n" ..
                        "===== Battle Strategy =====\n \n" ..
                        "- Bubbly Bernie is a level 9-10 Crab.\n" ..
                        "- Can be soloed at level 10-15.\n" ..
                        "- Be cautious of its 'Bubble Shower' ability, which deals area-of-effect damage.\n\n" ..
                        "===== Useful Information =====\n \n" ..
                        "- Melee classes should keep Shell and defensive abilities ready.\n" ..
                        "- Mages should maintain distance to avoid AoE damage." ..
                        "\n \n",
                images = {
                    {
                        zone_name = "South Gustaberg",
                        width = 512,
                        height = 512,
                        highlights = {
                            { position = "M-10", offsetX = 16, offsetY = 16 }
                        },
                    },
                }
            },
        },
        reward = {
            items = {
                {
                    name = "Steam Clock",
                    type = "ITEM",
                    note = "Drop Rate: ~100%"
                }
                --,
                -- {
                --     name = "Lizard Hide",
                --     type = "MATERIAL",
                --     --races = "", -- Can be empty string if not applicable
                --     --stats = {}, -- Can be empty table
                --     --level = 0,  -- Or some other indicator for N/A if you prefer
                --     --jobs = "All Jobs",
                --     note = "Common drop"
                -- }
            }
            -- text = "Steam Clock",
            -- images = {
            --
            -- },

        }
    },
    ["Carnero"] = {
        steps = {
            {
                text = "===== Spawn Details =====\n \n" ..
                       "Carnero is a notorious monster that spawns in South Gustaberg around (I-8) to (J-8).\n" ..
                       "It is a lottery spawn from the Tremor Sheep in the area.\n \n" ..
                       "- Placeholder: Sheep in the vicinity of (I-8) to (J-8).\n" ..
                       "- Spawn Timer: Approximately 2 hours after the placeholder is defeated.\n" ..
                       "- Spawn Chance: Low; patience is required.\n \n" ..
                       "===== Battle Strategy =====\n \n" ..
                       "- Carnero is a level 11-12 Sheep.\n" ..
                       "- Can be challenging due to high attack power; recommended for players level 15 and above.\n" ..
                       "- Be cautious of its 'Sheep Song' ability, which can put players to sleep and it can link with other nearby Sheep.\n \n" ..
                       "===== Drops =====\n \n" ..
                       "- Katayama Ichimonji\n \n",
                images = {
                    {
                        zone_name = "South Gustaberg",
                        width = 512,
                        height = 512,
                        highlights = {
                            { position = "I-8", offsetX = 16, offsetY = 16 },
                            { position = "J-8", offsetX = 16, offsetY = 16 }
                        },
                    },
                }
            },
        },
        reward = {
            images = {
            },
        }
    },
    ["Tococo"] = {
        steps = {
            {
                text = "===== Spawn Details =====\n \n" ..
                       "Tococo is a notorious monster that spawns in South Gustaberg around (G-7) to (H-7).\n" ..
                       "It is a timed spawn NM.\n \n" ..
                       "- Location: Around (G-7) to (H-7).\n" ..
                       "- Spawn Timer: Approximately every 60-70 minutes.\n \n" ..
                       "===== Battle Strategy =====\n \n" ..
                       "- Tococo is a level 4-5 Lesser Bird.\n" ..
                       "- Can be soloed by players around level 5-10.\n" ..
                       "- Be cautious of its 'Pecking Flurry' ability, which can deal multiple hits.\n \n" ..
                       "===== Drops =====\n \n" ..
                       "- Armiger's Lace\n \n",
                images = {
                    {
                        zone_name = "South Gustaberg",
                        width = 512,
                        height = 512,
                        state = 1,
                        highlights = {
                            { position = "G-7", offsetX = 16, offsetY = 16 },
                            { position = "H-7", offsetX = 16, offsetY = 16 }
                        },
                    },
                }
            },
        },
        reward = {
            images = {
            },
        }
    },
}
