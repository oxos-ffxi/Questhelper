return {
    ["1-1: The Zeruhn Report"] = {
        steps = {
          {
            text = "Step 1: Receive the mission from any Bastok Gate Guard. They can be found at the entrance gates to the city.",

            onmob_target = {"Rashid", "Cleades", "Argus"},
            --trigger_on_event_id = 1001,
            trigger_on_talk = {"You have accepted the mission"},
            images = {
                {
                    width    = 512,
                    height   = 512,
                    state    = 1,
                    highlights = {
                        { position = "H-10", offsetX = 16, offsetY = 16 },
                    },
                    zone_name = "Bastok Mines",
                },
                {
                    width    = 512,
                    height   = 512,
                    state    = 1,
                    highlights = {
                        { position = "D-11", offsetX = 16, offsetY = 16 },
                    },
                    zone_name = "Bastok Markets",
                },
                {
                    width    = 512,
                    height   = 512,
                    state    = 1,
                    highlights = {
                        { position = "L-6", offsetX = 16, offsetY = 16 },
                    },
                    zone_name = "Port Bastok",
                },
            },
          },
          {
            text = "Step 2: Go to Bastok Mines (D-7) and enter Zeruhn Mines. The entrance to Zeruhn Mines is located in the southwest corner of Bastok Mines.",
            zone_trigger = "Zeruhn Mines",
            route_to = "Zeruhn Mines",
          },
          {
            text = "Step 3: Talk to Makarim at (H-11) in Zeruhn Mines to receive the Zeruhn Report. He is located all the way to the south within Zeruhn Mines. Although there are creatures here in the level 75-80 range, they are not aggressive and do not aggro by sound.",
            onmob_target = {"Makarim"},
            trigger_on_event_id = { 121 },
            images = {
                {
                    width    = 512,
                    height   = 512,
                    state    = 3,
                    highlights = {
                        { position = "H-11", offsetX = 16, offsetY = 16 },
                    },
                    zone_name = "Zeruhn Mines",
                    floor_id = 0,
                },
            },
          },
          {
            text = "Step 4: Deliver the report to Naji at (J-8) outside the President's Office in the Metalworks. Side note: If you examine the Key Item 'Zeruhn Report' before talking to Naji, the dialogue in this cutscene will be slightly different.",
            onmob_target = "Naji",
            trigger_on_event_id = { 710 },
            route_to = "Metalworks",
            destination_highlight = {position = "J-8", offsetX = 16, offsetY = 16}
          },
        },
        reward = {
            text = "Rank Points!",
        }
    },

    ["1-2: A Geological Survey"] = {
        steps = {
            {
              text = "Step 1: Receive the mission from any Bastok Gate Guard. They can be found at the entrance gates to the city.",
              onmob_target = {"Rashid", "Cleades", "Argus"},
              --trigger_on_event_id = 1001,
              trigger_on_talk = {"You have accepted the mission"},
              images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Bastok Mines",
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "D-11", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Bastok Markets",
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "L-6", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Port Bastok",
                    },
                },
            },
            {
                text = "Step 2: Go to Metalworks and talk to Cid (H-8), inside Cid's Lab, for a Key Item Blue Acidity Tester.",
                onmob_target = {"Cid"},
                trigger_on_event_id = 503,
                keyitems_needed = {3,4},
                route_to = "Metalworks",
                destination_highlight = {position = "H-8", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 3: Proceed to South Gustaberg (D-9) and enter Dangruf Wadi.",
                zone_trigger = "Dangruf Wadi",
                route_to = "Dangruf Wadi"
            },
            {
                text = "Step 4: In Dangruf Wadi, go to the geyser at (I-8) and stand on it to be propelled to the ledge, changing the Blue Acidity Tester to Red Acidity Tester. Check your Key Items to make sure it has changed!",
                onmob_target = {"Geyser1"},
                trigger_on_event_id = { 10,11,12 },
                draw_type = 'square',
                center = {x = -133, y= 3, z=133.3},
                size = 2,
                zone = "Dangruf Wadi",
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 4,
                        highlights = {
                            { position = "I-8", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Dangruf Wadi",
                        floor_id = 1
                    },
                },
            },
            {
                text = "Step 5: Return to Cid in the Metalworks(H-8) to complete the mission.",
                onmob_target = {"Cid"},
                trigger_on_event_id = { 504 },
                route_to = "Metalworks",
                destination_highlight = {position = "H-8", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "Rank Points"
        }
    },

    ["1-3: Fetichism"] = {
        steps = {
            {
                text = "Step 1: Receive the mission from any Bastok Gate Guard. They can be found at the entrance gates to the city.",
                onmob_target = {"Rashid", "Cleades", "Argus"},
                --trigger_on_event_id = 1001,
                trigger_on_talk = {"You have accepted the mission"},
                images = {
                      {
                          width    = 512,
                          height   = 512,
                          state    = 1,
                          highlights = {
                              { position = "H-10", offsetX = 16, offsetY = 16 },
                          },
                          zone_name = "Bastok Mines",
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 1,
                          highlights = {
                              { position = "D-11", offsetX = 16, offsetY = 16 },
                          },
                          zone_name = "Bastok Markets",
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 1,
                          highlights = {
                              { position = "L-6", offsetX = 16, offsetY = 16 },
                          },
                          zone_name = "Port Bastok",
                      },
                  },
            },
            {
                text = "Step 2: Collect four Quadav fetiches. Go to North Gustaberg(K-3) and zone into Palborough Mines: You will require Head, Torso, Arms, and Legs from enemy Amber/Greater/Onyx/Veteran/Old/Brass Quadav in this zone. Can be purchased on Auction House under [Other -> Beast-made].",

                items_needed = {
                    "Quadav fetich head",
                    "Quadav fetich arms",
                    "Quadav fetich torso",
                    "Quadav fetich legs"
                },

                require_all_items = true,
                route_to = "Palborough Mines 1",
                -- images = {
                --       {
                --           width    = 512,
                --           height   = 512,
                --           state    = 2,
                --           highlights = {
                --               { position = "K-3", offsetX = 16, offsetY = 16 },
                --           },
                --           zone_name = "North Gustaberg",
                --       },
                --   },
            },
            {
                text = "Step 3: Return to the Bastok Gate Guard and trade the Head, Torso, Arms, and Legs fetiches to complete the mission!",
                onmob_target = {"Rashid", "Cleades", "Argus"},
                trigger_on_event_id = {1005,1008},
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Bastok Mines",
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        highlights = {
                            { position = "D-11", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Bastok Markets",
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        highlights = {
                            { position = "L-6", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Port Bastok",
                    },
                  },
            },
        },
        reward = {
            text = "Rank 2, 1000g"
        }
    },

    ["2-1: The Crystal Line"] = {
        steps = {
            {
                text = "Step 1: Receive the mission from any Bastok Gate Guard. They can be found at the entrance gates to the city. \n \n",
                onmob_target = {"Rashid", "Cleades", "Argus"},
                --trigger_on_event_id = 1001,
                trigger_on_talk = {"You have accepted the mission"},
                images = {
                      {
                          width    = 512,
                          height   = 512,
                          state    = 1,
                          zone_name = "Bastok Mines",
                          highlights = {
                              { position = "H-10", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 1,
                          zone_name = "Bastok Markets",
                          highlights = {
                              { position = "D-11", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 1,
                          zone_name = "Port Bastok",
                          highlights = {
                              { position = "L-6", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 2: Talk to Cid in the Metalworks (H-8). \n \n",
                onmob_target = {"Cid"},
                trigger_on_event_id = 505,
                -- items_needed: Shows in UI but does NOT auto-complete the step
                -- Using alias format: display name shown to user, but checks for any of the alternatives
                items_needed = {
                    {
                        display = "Elemental Crystal",
                        alternatives = {
                            "Dark Crystal",
                            "Fire Crystal",
                            "Ice Crystal",
                            "Wind Crystal",
                            "Earth Crystal",
                            "Lightning Crystal",
                            "Water Crystal",
                            "Light Crystal"
                        }
                    }
                },
                route_to = "Metalworks",
                destination_highlight = {position = "H-8", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 3: Trade any crystal (these drop from any monster with Signet/Sanction or Sigil on ) to the Telepoints: \n" ..
                       "-{!Recommended!} Crag of Dem(I-6) - North Gustaberg divides into two - GO TO THE WESTERN EXITS IN THE ROUTES! \n \n" ..
                       "It will then become a Faded Crystal, check your inventory and it should update visually to be a white crystal.\n" ..
                       "Remember to click on the tele-crystal, this will give you {KI:Dem Gate Crystal} allowing you to Teleport-Dem to that location later. \n \n" ..
                       "You can warp back to Bastok-Metalworks. \n \n",
                trigger_on_item_obtain = "Faded Crystal",
                route_to = "Konschtat Highlands",
                destination_highlight = {position = "I-6", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 4: Return and Trade Cid the Faded Crystal in the Metalworks(H-8).\n" ..
                       "Optional: Talk to Naji(J-8) for some cheesy dialogue. \n \n",
                onmob_target = {"Cid"},
                trigger_on_event_id = 506,
                route_to = "Metalworks",
                destination_highlight = {position = "H-8", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 5: Talk to Ayame inside the Cannonry in the Metalworks(K-7). \n \n",
                onmob_target = {"Ayame"},
                trigger_on_event_id = 712,
                route_to = "Metalworks",
                destination_highlight = {position = "K-7", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "Rank Points!"
        }
    },
    ["2-2: Wading Beasts"] = {
        steps = {
            {
                text = "Step 1: Receive the mission from any Bastok Gate Guard. They can be found at the entrance gates to the city. \n" ..
                       "This Mission can be skipped if you trade Crystals to the gate guards to boost your Rank Points, see 'Status -> 'Profile' \n \n",
                onmob_target = {"Rashid", "Cleades", "Argus"},
                --trigger_on_event_id = 1001,
                trigger_on_talk = {"You have accepted the mission"},
                images = {
                      {
                          width    = 512,
                          height   = 512,
                          state    = 1,
                          zone_name = "Bastok Mines",
                          highlights = {
                              { position = "H-10", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 1,
                          zone_name = "Bastok Markets",
                          highlights = {
                              { position = "D-11", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 1,
                          zone_name = "Port Bastok",
                          highlights = {
                              { position = "L-6", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 2: Obtain a Lizard Egg! \n\n" ..
                       "===== Buy from Auction House =====\n \n" ..
                       "- Check 'Food' > 'Ingredients' section for listings.\n \n" ..
                       "===== Obtain from Lizard Family =====\n \n" ..
                       "- Travel through South Gustaberg(D-9) to Dangruf Wadi.\n" ..
                       "- Inside Dangruf Wadi Look for 'Steam Lizards'(G-11) - level 16-20.\n" ..
                       "",
                items_needed = {
                    "Lizard Egg"
                },
                trigger_on_item_obtain = {"Lizard Egg"},
                route_to = "Dangruf Wadi",
                destination_highlight = {position = "G-11", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 3: Go to Metalworks(J-8) in Bastok and trade Alois a Lizard Egg to complete the mission",
                onmob_target = {"Alois"},
                trigger_on_event_id = { 373, 372 },
                route_to = "Metalworks",
                destination_highlight = {position = "J-8", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "Rank Points!"
        }
    },

    ["2-3: The Emissary - Introduction"] = {
        steps = {
            {
                text = "Step 1: Receive the mission from any Bastok Gate Guard. They can be found at the entrance gates to the city. \n" ..
                       "This mission has a fight capped originally at 25, non-era versions will be uncapped - check with your respective server!' \n \n",
                onmob_target = {"Rashid", "Cleades", "Argus"},
                --trigger_on_event_id = 1001,
                trigger_on_talk = {"You have accepted the mission"},
                images = {
                      {
                          width    = 512,
                          height   = 512,
                          state    = 1,
                          zone_name = "Bastok Mines",
                          highlights = {
                              { position = "H-10", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 1,
                          zone_name = "Bastok Markets",
                          highlights = {
                              { position = "D-11", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 1,
                          zone_name = "Port Bastok",
                          highlights = {
                              { position = "L-6", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 2: Talk to Naji in Metalworks (J-8), just outside the Presidents Office. \n" ..
                       "After the cutscene you will have to travel to San d'Oria and Windhurst \n" ..
                       "Please note you can choose San d'Oria -> Windurst or Windurst -> San d'Oria. Questhelper will split this into two missions. \n" ..
                       "Which order will affect the tasks, titles and cutscenes so this section will be split into two so follow the one you prefer - Don't complete both! \n \n",
                onmob_target = {"Naji"},
                trigger_on_event_id = { 714 },
                route_to = "Metalworks",
                destination_highlight = {position = "J-8", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "Nothing. . . wamp wamp!"
        }
    },
    ["2-3: The Emissary - San d'Oria -> Windurst"] = {
        choice_group = "2-3: The Emissary",
        steps = {
            {
                text = "Step 1: Talk to Baraka (K-10) in the Consulate of Bastok in Northern San d'Oria. \n",
                --trigger_on_event_id = { 11141 },
                trigger_on_talk = " all the same.",
                onmob_target = {"Baraka"},
                route_to = "Northern San d'Oria",
                destination_highlight = {position = "K-10", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 2: Talk to Helaku (K-10) in the Consulate of Bastok in Northern San d'Oria. \n",
                trigger_on_event_id = { 536 },
                onmob_target = {"Helaku"},
                route_to = "Northern San d'Oria",
                destination_highlight = {position = "K-10", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 3: Go to Chateau d'Oraguille which resides in Northern San d'Oria (I-6/J-6). \n",
                zone_trigger = "Chateau d'Oraguille",
                route_to = "Chateau d'Oraguille",
            },
            {
                text = "Step 4: Talk to Halver in Chateau d'Oraguille (I-9). \n" ..
                       "If you have KI:Rhapsody in White you will obtain a new trust - Cipher:Halver. \n",
                trigger_on_event_id = { 501 },
                onmob_target = {"Halver"},
                images = {
                      {
                          width    = 512,
                          height   = 512,
                          state    = 4,
                          zone_name = "Chateau d'Oraguille",
                          highlights = {
                              { position = "I-9", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 5: Travel to Ghelsba Outpost which can be reached from West Ronfaure (E-4). \n",
                zone_trigger = "Ghelsba Outpost",
                route_to = "Ghelsba Outpost",
            },
            {
                text = "Step 6: Defeat the NM Warchief Vatgit in Ghlesba Outpost (H-7). \n \n" ..
                       "===== Warchief Vatgit ===== \n" ..
                       "Family: Orc \n" ..
                       "Level: 16 \n" ..
                       "Job: Warrior \n \n" ..
                       "===== Bloody Vrukwuk ===== \n" ..
                       "Family: Orc \n" ..
                       "Level: 14 \n" ..
                       "Job: Paladin \n \n" ..
                       "===== Fogweaver Mozzfuzz ===== \n" ..
                       "Family: Orc \n" ..
                       "Level: 14 \n" ..
                       "Job: Black Mage \n \n" ..
                       "Recommended: Soloable at level 20 comfortably.\n" ..
                       "Notes: Warchief Vatgit is sometimes followed by Bloody Vrukwuk or Fogweaver Mozzfuzz. Try and one-shot these monsters build tp on surrounding monsters! \n \n",
                 kill_requirement = {
                    count = 1,
                    enemies = {"Warchief Vatgit"},  -- Only Warchief kills count
                    zone = "Ghelsba Outpost",
                    count_party_kills = true  -- Count kills from party members and trusts
                },
                images = {
                      {
                          width    = 512,
                          height   = 512,
                          state    = 6,
                          zone_name = "Ghelsba Outpost",
                          floor_id = 1,
                          highlights = {
                              { position = "H-7", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 7: Return back to Helaku (K-10) in the Consulate of Bastok in Northern San d'Oria. \n",
                onmob_target = {"Helaku"},
                trigger_on_event_id = { 543 },
                route_to = "Northern San d'Oria",
                destination_highlight = {position = "K-10", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 8: Travel to Port Windurst!\n " ..
                       "If you have the teleport crystal from Crag of Mea you can get a White Mage to teleport you, or Outpost Warp to Kolshushu \n",
                zone_trigger = "Port Windurst",
                route_to = "Port Windurst",
            },
            {
                text = "Step 9: Talk to Melek in the Consulate of Bastok in Port Windurst (F-6). \n",
                trigger_on_event_id = { 64 },
                onmob_target = {"Melek"},
                images = {
                      {
                          width    = 512,
                          height   = 512,
                          state    = 9,
                          zone_name = "Port Windurst",
                          highlights = {
                              { position = "F-6", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 10: Talk to Kupipi in Heavens Tower on the first floor north side, she will give you a KI:Dark Key. \n" ..
                       "All party members need one Dark Key! \n" ..
                       "If you have KI:Rhapsody in White you will obtain a new trust - Cipher:Semih. \n",
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
                       "Notes: Sleep/Bind the Dragon and kill the Spotter! \n \n" ..
                       "After winning, you will receive the KI:Kindred Crest and title 'Black Dragon Slayer'.",
                trigger_on_event_id = { 32001 },
            },
            {
                text = "Step 14: Return to Melek in the Consulate of Bastok in Port Windurst (F-6) to receive the KI:Kindred Report.",
                onmob_target = {"Melek"},
                trigger_on_event_id = {66},
                route_to = "Port Windurst",
                destination_highlight = {position = "F-6", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 15: Return to Naji in Metalworks (J-8) to complete the mission!",
                onmob_target = {"Naji"},
                trigger_on_event_id = {713},
                route_to = "Metalworks",
                destination_highlight = {position = "J-8", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "Rank 3, 3000g, Adventurer's Certificate, Trust: Halver & Semih!"
        }
    },

    ["2-3: The Emissary - Windurst -> San d'Oria"] = {
        choice_group = "2-3: The Emissary",
        steps = {
            {
                text = "Step 1: Talk to Melek in the Consulate of Bastok in Port Windurst (F-6). \n",
                onmob_target = {"Melek"},
                trigger_on_event_id = {49},
                route_to = "Port Windurst",
                destination_highlight = {position = "F-8", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 2: Talk to Kupipi in Heavens Tower on the first floor north side to receive the KI:Sword Offering. \n \n" ..
                       "Note: If you posses KI:Rhapsody in White you will obtain a new trust - Cipher:Semih. \n",
                onmob_target = {"Kupipi"},
                trigger_on_event_id = { 239 },
                route_to = "Windurst Walls",
                destination_highlight = {position = "H-7", offsetX = 16, offsetY = 16},
                zone_max_distance = 17,
                visual_zones = {
                        { zone_name = "Heavens Tower", type = 'arrow', center = { x = -0.0, y = 0.8, z = 15.8 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Heavens Tower", type = 'rect', center = { x = 0.0, y = -1.8, z = 22.3 }, width = 3.75, height = 3.25, floor_id = 0, colour = "cyan", vertical_axis = 'ns' },
                }
            },
            {
                text = "Step 3: Talk to Gold Skull in the Consulate of Bastok in Port Windurst (F-6) to receive a Dull Sword.",
                onmob_target = {"Gold Skull"},
                trigger_on_event_id = { 53 },
                route_to = "Port Windurst",
                destination_highlight = {position = "F-6", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 4: Travel to Giddeus Map 2 and speak with Uu Zhoumo (F-7) you can drop down either from 'A','E','F' and 'G' on Map1. You need to get an Aspir Knife! \n \n" ..
                       "===== Obtaining Aspir Knife ===== \n" ..
                       "The Aspir Knife drops from Eyy Mon the Ironbreaker, a Yagudo NM in Giddeus. \n" ..
                       "This NM spawns on Map2 (G-7) around this area. Also highlighted! \n" ..
                       "Each party member needs one Aspir Knife! \n" ..
                       "Respawn time: approximately 15 minutes. \n \n",
                items_needed = {
                    "Aspir Knife"
                },
                trigger_on_item_obtain = {"Aspir Knife"},
                onmob_enemy = "Eyy Mon the Ironbreaker",
                onmob_enemy_size = 2,
                images = {
                        {
                          width    = 512,
                          height   = 512,
                          state    = 4,
                          zone_name = "Port Windurst",
                          highlights = {
                              { position = "A-4", offsetX = 16, offsetY = 16 },
                              { position = "A-5", offsetX = 16, offsetY = 16 },
                          },
                       },
                       {
                          width    = 512,
                          height   = 512,
                          state    = 4,
                          zone_name = "West Sarutabaruta",
                          highlights = {
                              { position = "F-8", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 4,
                          zone_name = "Giddeus",
                          floor_id = 1,
                          highlights = {
                              { position = "F-8", offsetX = 16, offsetY = 16 },
                              { position = "G-8", offsetX = 16, offsetY = 16 },
                              { position = "I-8", offsetX = 16, offsetY = 16 },
                              { position = "J-8", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 4,
                          zone_name = "Giddeus",
                          floor_id = 15,
                          highlights = {
                              { position = "F-7", offsetX = 16, offsetY = 16 },
                              { position = "G-7", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 5: Trade the Aspir Knife to Uu Zhoumo (F-7) in Giddeus Map 2.",
                onmob_target = {"Uu Zhoumo"},
                trigger_on_event_id = { 41 },
                images = {
                    {
                          width    = 512,
                          height   = 512,
                          state    = 5,
                          zone_name = "Giddeus",
                          floor_id = 1,
                          highlights = {
                              { position = "F-8", offsetX = 16, offsetY = 16 },
                              { position = "G-8", offsetX = 16, offsetY = 16 },
                              { position = "I-8", offsetX = 16, offsetY = 16 },
                              { position = "J-8", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 5,
                          zone_name = "Giddeus",
                          floor_id = 15,
                          highlights = {
                              { position = "F-7", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 6: Return to Melek in the Consulate of Bastok in Port Windurst (F-6).",
                onmob_target = {"Melek"},
                trigger_on_event_id = { 55 },
                route_to = "Port Windurst",
                destination_highlight = {position = "F-6", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 7: Travel to San d'Oria! \n " ..
                       "If you have the teleport crystal from Crag of Holla you can get a White Mage to teleport you or use Unity Warp. \n \n",
                zone_trigger = "Northern San d'Oria",
                route_to = "Northern San d'Oria",
            },
            {
                text = "Step 8: Talk to Helaku (K-10) in the Consulate of Bastok in Northern San d'Oria. \n",
                onmob_target = {"Helaku"},
                trigger_on_talk = {"Helaku:"},
                route_to = "Northern San d'Oria",
                destination_highlight = {position = "K-10", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 9: Go to Chateau d'Oraguille which resides in Northern San d'Oria (I-6). \n",
                zone_trigger = "Chateau d'Oraguille",
                route_to = "Northern San d'Oria",
                destination_highlight = {position = "I-6", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 10: Talk to Halver in Chateau d'Oraguille (I-9). \n" ..
                       "If you have KI:Rhapsody in White you will obtain a new trust - Cipher:Halver. \n \n",
                onmob_target = {"Halver"},
                trigger_on_event_id = {503},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 11: Travel to Horlais Peak with your party. \n \n" ..

                       "Notes: Orcs sight-Aggro to players around level 35 unless they are Invisible. Bats will aggro by sound. \n \n" ..
                       "Hard coded route - this will take off from Sandy! \n" ..
                       "West Ronfaure  : Go to (E-4) -> Ghelsba Outpost. \n" ..
                       "Ghelsba Outpost: Go to (H-11)-> Yughott Grotto  - exit 1. \n" ..
                       "Yughott Grotto : Go to (K-5) -> Fort Ghelsba    - exit 3. \n" ..
                       "Fort Ghelsba   : Go to (J-8) -> Yughott Grotto  - exit 4. \n" ..
                       "Yughott Grotto : Enter Horlais Peak (J-6). \n \n",
                zone_trigger = "Horlais Peak",
                zone_max_distance = 35,
                visual_zones = {
                        --Ghelsba Outpost
                        { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = 28.1, y = 0.1, z = 62.2 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                        { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = -4.4, y = 0.0, z = 26.6 }, size = 4, direction = "se", floor_id = 1, colour = "yellow" },
                        { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = 19.9, y = 0.1, z = -4.8 }, size = 4, direction = "se", floor_id = 1, colour = "yellow" },
                        { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = 45.9, y = 0.0, z = -58.5 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },

                        -- Yughotto Grott 1 to K-4
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
                          state    = 11,
                          zone_name = "Ghelsba Outpost",
                          floor_id = 1,
                          highlights = {
                              { position = "H-11", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 11,
                          zone_name = "Yughott Grotto",
                          floor_id = 1,
                          highlights = {
                              { position = "K-5", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 11,
                          zone_name = "Fort Ghelsba",
                          highlights = {
                              { position = "J-8", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 11,
                          zone_name = "Yughott Grotto",
                          floor_id = 2,
                          highlights = {
                              { position = "J-6", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 12: This is a BCNM battle! You will face Spotter and Dread Dragon. \n \n" ..
                       "Recommended: Level 35+ or a party. \n \n" ..
                       "===== Spotter ===== \n" ..
                       "Family: Spotter \n" ..
                       "Level: 25 \n \n" ..
                       "===== Dread Dragon ===== \n" ..
                       "Family: Dragon \n" ..
                       "Level: 27 \n" ..
                       "Notes: Sleep/Bind the dragon and kill the Spotter first! \n \n" ..
                       "After winning, you will receive the KI:Kindred Crest and title 'Dread Dragon Slayer'.",
                trigger_on_event_id = {32001},
            },
            {
                text = "Step 13: Return to Helaku in Northern San d'Oria (K-10) to receive the KI:Kindred Report. \n",
                onmob_target = {"Helaku"},
                trigger_on_event_id = {545},
                route_to = "Northern San d'Oria",
                destination_highlight = {position = "K-10", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 14: Return to Bastok and speak with Naji in Metalworks (J-8) to complete the mission!",
                onmob_target = {"Naji"},
                trigger_on_event_id = {713},
                route_to = "Metalworks",
                destination_highlight = {position = "J-8", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "Rank 3, 3000g, Adventurer's Certificate, Trust: Halver!"
        }
    },

    ["3-1: The Four Musketeers"] = {
        steps = {
            {
                text = "Step 1: Receive the mission from any Bastok Gate Guard. They can be found at the entrance gates to the city.",
                onmob_target = {"Rashid", "Cleades", "Argus"},
                --trigger_on_event_id = 1001,
                trigger_on_talk = {"You have accepted the mission"},
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        zone_name = "Bastok Mines",
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        zone_name = "Bastok Markets",
                        highlights = {
                            { position = "D-11", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        zone_name = "Port Bastok",
                        highlights = {
                            { position = "L-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 2: Talk to Iron Eater at (J-8) in the Metalworks, outside the President's Office. You may need to speak with him twice to receive the cutscene!",
                onmob_target = {"Iron Eater"},
                trigger_on_event_id = {715},
                route_to = "Metalworks",
                destination_highlight = {position = "J-8", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 3: Travel to Beadeaux via Pashhow Marshlands (J-9). \n" ..
                       "From Konschtat Highlands, you can travel to (K-3) to enter Pashhow Marshlands. \n" ..
                       "You also can use the Beadeaux Survival Guide if unlocked!",
                zone_trigger = "Beadeaux",
                route_to = "Beadeaux",
            },
            {
                text = "Step 4: Zone into Beadeaux for a cutscene. \n \n" ..
                       "You need to defeat 20 Copper Quadav enemies (levels 22-28) while in Beadeaux - they are around the starting area. They sound-aggro under level 42. \n" ..
                       "Party members get credit for kills. The kill counter persists if you zone or logout.",
                trigger_on_event_id = 120,
                onmob_enemy = "Copper Quadav",
                onmob_enemy_size = 2,
                kill_requirement = {
                    count = 20,
                    enemies = {"Copper Quadav"},
                    zone = "Beadeaux",
                    count_party_kills = true
                },
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 4,
                        zone_name = "Beadeaux",
                        floor_id = 1,
                        highlights = {
                            { position = "F-6", offsetX = 16, offsetY = 16 },
                            { position = "F-7", offsetX = 16, offsetY = 16 },
                            { position = "G-6", offsetX = 16, offsetY = 16 },
                            { position = "G-7", offsetX = 16, offsetY = 16 },
                            { position = "H-6", offsetX = 16, offsetY = 16 },
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 5: After defeating 20 Copper Quadav, zone into Pashhow Marshlands to receive the completion cutscene. \n" ..
                       "Do NOT use Escape or you'll miss the cutscene!",
                trigger_on_event_id = {11},
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        zone_name = "Beadeaux",
                        floor_id = 1,
                        highlights = {
                            { position = "E-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
        reward = {
            text = "Rank Points!"
        }
    },

    ["3-2: To the Forsaken Mines"] = {
        steps = {
            {
                text = "Step 1: Receive the mission from any Bastok Gate Guard. They can be found at the entrance gates to the city. \n \n",
                onmob_target = {"Rashid", "Cleades", "Argus"},
                --trigger_on_event_id = 1001,
                trigger_on_talk = {"You have accepted the mission"},
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        zone_name = "Bastok Mines",
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        zone_name = "Bastok Markets",
                        highlights = {
                            { position = "D-11", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        zone_name = "Port Bastok",
                        highlights = {
                            { position = "L-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 2: Obtain Hare Meat! \n\n" ..
                       "===== Buy from Auction House =====\n \n" ..
                       "- Check 'Food' > 'Ingredients' section for listings.\n \n" ..
                       "===== Obtain from Rabbit Family =====\n \n" ..
                       "- Hare Meat drops from rabbits Palborough Mines[Pit Hare] lowest level rabbits near Bastok. Alt: Dangruf Wadi.\n \n",
                items_needed = {
                    "Hare Meat"
                },
                trigger_on_item_obtain = {"Hare Meat"},
                route_to = "Palborough Mines 1",
            },
            {
                text = "Step 3: Travel to Gusgen Mines via Konschtat Highlands (L-7). You can also use a Survival Guide or assisted images for directions from Bastok! \n" ..
                       "Recommended: Level 30+ with Sneak, or level 40+ (mobs aggro by hearing and HP). \n \n",
                zone_trigger = "Gusgen Mines",
                route_to = "Gusgen Mines",
            },
            {
                text = "Step 4: In Gusgen Mines, find the ??? at Map 1 (J-7). \n \n" ..
                       "Trade your Hare Meat to it to spawn Blind Moby. \n \n" ..
                       "Defeat Blind Moby to obtain the Glocolite key item. \n \n",
                onmob_target = {"Blind Moby"},
                draw_type = 'square',
                center = { x = 210.1, y= -59.2, z=-101.8 },
                size = 1,
                zone = "Gusgen Mines",
                --trigger_on_event_id = {1010},
                items_needed = {
                    "Glocolite"
                },
                trigger_on_item_obtain = {"Glocolite"},
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 4,
                        zone_name = "Gusgen Mines",
                        floor_id = 1,
                        highlights = {
                            { position = "J-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 5: Return to any Bastok Gate Guard and trade the Glocolite to complete the mission.",
                onmob_target = {"Rashid", "Cleades", "Argus"},
                trigger_on_event_id = {1006},
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        zone_name = "Bastok Mines",
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        zone_name = "Bastok Markets",
                        highlights = {
                            { position = "D-11", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        zone_name = "Port Bastok",
                        highlights = {
                            { position = "L-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
        reward = {
            text = "Rank Points!"
        }
    },

    ["3-3: Jeuno"] = {
        steps = {
            {
                text = "Step 1: Receive the mission from any Bastok Gate Guard. They can be found at the entrance gates to the city.",
                onmob_target = {"Rashid", "Cleades", "Argus"},
                --trigger_on_event_id = 1001,
                trigger_on_talk = {"You have accepted the mission"},
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        zone_name = "Bastok Mines",
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        zone_name = "Bastok Markets",
                        highlights = {
                            { position = "D-11", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        zone_name = "Port Bastok",
                        highlights = {
                            { position = "L-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 2: Visit Lucius at the Metalworks (I-9) to obtain the KI:Letter to the Ambassador.",
                onmob_target = {"Lucius"},
                trigger_on_event_id = 322,
                route_to = "Metalworks",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 3: Travel to Ru'Lude Gardens in Jeuno and speak with Goggehn at the Embassy of Bastok (H-10). \n \n",
                onmob_target = {"Goggehn"},
                route_to = "Ru'Lude Gardens",
                destination_highlight = {position = "H-10", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {41, 66, 139},
            },
            {
                text = "Step 4: Travel to Qufim Island and enter Lower Delkfutts Tower. \n \n" ..
                       "Alternatively, you can use Unity Warp/Outpost Warp/Home Point to Qufim Island if unlocked for quickness",
                zone_trigger = "Lower Delkfutt's Tower",
                route_to = "Qufim Island",
                destination_highlight = {position = "F-6", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 5: Navigate Delkfutt's Tower in Qufim Island (10 floors). \n" ..
                       "Recommended: Level 40+ with Sneak and Invisible, or level 50+. \n" ..
                       "You need to reach Floor 10 - Upper Delkfutt's Tower!  \n \n" ..
                       "1st Floor: Go to (E/F-6) Stairs \n" ..
                       "2nd Floor: (I/J-9) Stairs - Avoid (H-9). \n" ..
                       "3rd Floor: (G-6) Teleporter. \n" ..
                       "4th Floor: (I-6) Stairs - long way around. \n" ..
                       "5th Floor: (H-9) Stairs  \n" ..
                       "6th Floor: (J-10) Teleporter \n" ..
                       "7th Floor: (F-6/7) Stairs (NW) \n" ..
                       "8th Floor: (1st time): (I-6) Stairs \n" ..
                       "9th Floor: (1st time): J-10 (Do NOT drop at (H-10). \n" ..
                       "8th Floor: (2nd time): F-9/G-10 -> 9th Floor \n" ..
                       "9th Floor: (2nd time): F-6 -> 10th Floor Teleport. \n \n",
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
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        zone_name = "Lower Delkfutt's Tower",
                        floor_id = 1,
                        highlights = {
                            { position = "E-6", offsetX = 16, offsetY = 16 },
                            { position = "F-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        zone_name = "Lower Delkfutt's Tower",
                        floor_id = 2,
                        highlights = {
                            { position = "I-9", offsetX = 16, offsetY = 16 },
                            { position = "J-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        zone_name = "Lower Delkfutt's Tower",
                        floor_id = 3,
                        highlights = {
                            { position = "G-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        zone_name = "Lower Delkfutt's Tower",
                        floor_id = 15,
                        highlights = {
                            { position = "I-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        zone_name = "Middle Delkfutt's Tower",
                        floor_id = 4,
                        highlights = {
                            { position = "I-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        zone_name = "Middle Delkfutt's Tower",
                        floor_id = 5,
                        highlights = {
                            { position = "H-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        zone_name = "Middle Delkfutt's Tower",
                        floor_id = 6,
                        highlights = {
                            { position = "J-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        zone_name = "Middle Delkfutt's Tower",
                        floor_id = 7,
                        highlights = {
                            { position = "F-6", offsetX = 16, offsetY = 16 },
                            { position = "F-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        zone_name = "Middle Delkfutt's Tower",
                        floor_id = 8,
                        highlights = {
                            { position = "I-6", offsetX = 16, offsetY = 16 },
                            { position = "F-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        zone_name = "Middle Delkfutt's Tower",
                        floor_id = 9,
                        highlights = {
                            { position = "J-10", offsetX = 16, offsetY = 16 },
                            { position = "F-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 6: Kill Porphyrion to obtain a Delkfutt Key! \n \n" ..
                       "Notes: It uses Eagle Eye Shot, be careful! \n \n" ..
                       "Recommended: Level 50+ or a party. \n \n",
                items_needed = {
                    "Delkfutt Key"
                },
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
                        width    = 512,
                        height   = 512,
                        state    = 6,
                        zone_name = "Upper Delkfutt's Tower",
                        floor_id = 1,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 7: Trade the Delkfutt Key on the elevator to access the basement area of the tower. \n",
                trigger_on_event_id = {1,6},
                onmob_target = {"Elevator"},
                draw_type = 'square',
                center = {x = -300, y= -143.6, z=19.9},
                size = 1,
                zone = "Upper Delkfutt's Tower",
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 7,
                        zone_name = "Upper Delkfutt's Tower",
                        floor_id = 1,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 8: You will now have to run down the tower's stairs and re-enter Lower Delkfutts Tower Basement. \n \n" ..
                       "Trigger a cutscene at the Cermet Door in the basement (L-9).",
                trigger_on_event_id = {1,"Lower Delkfutt's Tower"},
                onmob_target = {"Cermet Door"},
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
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 540.9, y = 16.0, z = 18.4 }, size = 4, direction = "se", floor_id = 15, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 564.0, y = 16.2, z = -8.2 }, size = 4, direction = "se", floor_id = 15, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 582.5, y = 16.0, z = -20.5 }, size = 4, direction = "right", floor_id = 15, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'rect', center = { x = 600.5, y = 13.5, z = -20.0 }, width = 5.50, height = 5.00, floor_id = 15, colour = "cyan", vertical_axis = 'z' },

                },
                 images = {
                    {
                        width     = 512,
                        height    = 512,
                        state     = 8,
                        zone_name = "Upper Delkfutt's Tower",
                        floor_id  = 4,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width     = 512,
                        height    = 512,
                        state     = 8,
                        zone_name = "Upper Delkfutt's Tower",
                        floor_id  = 5,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width     = 512,
                        height    = 512,
                        state     = 8,
                        zone_name = "Upper Delkfutt's Tower",
                        floor_id  = 6,
                        highlights = {
                            { position = "J-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width     = 512,
                        height    = 512,
                        state     = 8,
                        zone_name = "Lower Delkfutt's Tower",
                        floor_id  = 1,
                        highlights = {
                            { position = "E-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width     = 512,
                        height    = 512,
                        state     = 8,
                        zone_name = "Lower Delkfutt's Tower",
                        floor_id  = 15,
                        highlights = {
                            { position = "L-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 9: Return to Goggehn at the Embassy of Bastok in Ru'Lude Gardens (H-10).",
                onmob_target = {"Goggehn"},
                trigger_on_event_id = 139,
                route_to = "Ru'Lude Gardens",
                destination_highlight = {position = "H-10", offsetX = 16, offsetY = 16},
                visual_zones = {
                     { zone_name = "Ru'Lude Gardens", type = 'arrow', center = { x = 4.2, y = 9.0, z = -51.6 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                     { zone_name = "Ru'Lude Gardens", type = 'rect', center = { x = 4.0, y = 7.4, z = -68.4 }, width = 3.00, height = 3.25, floor_id = 0, colour = "cyan", vertical_axis = 'ns' },
                },
            },
            {
                text = "Step 10: Click on the Door:Bastokan Embassy at (H-10) in Ru'Lude Gardens to complete the mission.",
                onmob_target = {"Door:Bastokan Embassy"},
                trigger_on_event_id = 38,
                visual_zones = {
                    { zone_name = "Ru'Lude Gardens", type = 'rect', center = { x = 13.9, y = 7.5, z = -79.1 }, width = 2.25, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'z' },
                },
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 10,
                        zone_name = "Ru'Lude Gardens",
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
        reward = {
            text = "Rank 4, 5000g!"
        }
    },

    ["4-1: Magicite"] = {
        requirements = {
            level = 40,
            fame  = {area = "Jeuno", level = 3},
        },
        prerequisites = {
                      {category = "Quests", subfile = "Lower Jeuno", name = "Tenshodo Membership"},
                },
        steps = {
            -- PREREQUISITES
            {
                text = "Step 1: This mission requires Rank 4. Ensure your Rank Points are high (nearly or completely full) by completing repeatable missions or trading 4 crystals to a Conquest Overseer. \n \n" ..
                       "Morlepiche (H-10) in upper Ru'Lude Gardens accepts crystals. \n \n" ..
                       "Go to Basokan Embassy and speak with Goggehn (H-10) to start the mission. \n \n" ..
                       "Note: Unlike most missions, this is NOT offered by Gate Guards.",
                onmob_target = {"Goggehn"},
                trigger_on_talk = {" pronto!"},
                --trigger_on_event_id = 0,
                route_to = "Ru'Lude Gardens",
                destination_highlight = {position = "H-10", offsetX = 16, offsetY = 16},
            },

            -- MISSION START
            {
                text = "Step 2: Next check the Door: Bastokan Embassy at (H-10). \n \n" ..
                       "You will receive KI:Archducal Audience Permit.",
                onmob_target = {"Door:Bastokan Embassy"},
                trigger_on_event_id = {129},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        zone_name = "Ru'Lude Gardens",
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 3: In Ru'Lude Gardens, check the Audience Chamber door at (H-6). \n \n" ..
                       "You will receive KI:Letter to Aldo.",
                onmob_target = {"Door: Audience Chamber"},
                trigger_on_event_id = {128},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        zone_name = "Ru'Lude Gardens",
                        highlights = {
                            { position = "H-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
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
                "Notes: Home Point#3 closest teleport. \n \n",
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
                route_to = "Lower Jeuno",
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
                trigger_on_buff = 6,  -- Silence status effect (ID: 6 when server is using LSB)
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
                       "Notes: Stay on the 2nd level and run around to the shown coordinates. \n \n",
                require_all_items = true,
                items_needed = {
                    "Quadav Charm",
                    "Quadav Augury Shell"
                },
                trigger_on_item_obtain = {
                    "Quadav Charm",
                    "Quadav Augury Shell"
                },
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
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 14,
                        zone_name = "Beadeaux",
                        floor_id = 1,
                        highlights = {
                            { position = "I-9", offsetX = 16, offsetY = 16 },
                            { position = "F-6", offsetX = 16, offsetY = 16 },
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
                --trigger_on_event_id = {50},
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
                text = "Step 30: Talk to Goggehn (H-10) at the Bastokan Embassy in Ru'Lude Gardens to complete the mission. \n \n" ..
                       "Rewards: Rank 5, KI:Message to Jeuno, 10,000 gil. \n \n" ..
                       "Mission 5-1 'Darkness Rising' begins immediately. You cannot change allegiance until completing or rejecting 5-1. \n \n",
                onmob_target = {"Goggehn"},
                trigger_on_event_id = {35},
                route_to = "Ru'Lude Gardens",
                destination_highlight = {position = "H-10", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "Rank 5, Airship Pass (or 20,000 gil), Message to Jeuno KI, 10,000 gil, Title: Have Wings Will Fly"
        }
    },

    ["5-1: Darkness Rising"] = {
        steps = {
            {
                text = "Step 1: Talk to Naji at (J-8) in Metalworks outside the President's Office. \n \n" ..
                       "Accept the mission to receive KI:New Fei'Yin Seal. \n \n" ..
                       "If you postpone the mission, you will be able to change allegiances.",
                onmob_target = {"Naji"},
                trigger_on_event_id = {720},
                route_to = "Metalworks",
                destination_highlight = {position = "J-8", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 2: Zone into Fei'Yin for a cutscene with Zeid. \n \n" ..
                       "Multiple ways to reach Fei'Yin: \n \n" ..
                       "Home Point #1 teleport (if unlocked) \n" ..
                       "Unity Concord warp \n" ..
                       "Warp to Qu'Bia Arena via Domenic (J-7) in Lower Jeuno (if completed Beyond Infinity), then walk out \n \n" ..
                       "Note: If cutscene doesn't trigger, zone out to Beaucedine Glacier and back in. \n \n",
                zone_trigger = "Fei'Yin",
                --trigger_on_event_id = {1},
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
            {
                text = "Step 3: Travel to Qu'Bia Arena entrance at (K-8) in Fei'Yin. \n \n" ..
                       "Accept the mission to receive KI:New Fei'Yin Seal. \n \n" ..
                       "If you postpone the mission, you will be able to change allegiances.",
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
                        state = 3,
                        zone_name = "Fei'Yin",
                        floor_id = 1,
                        highlights = {
                            { position = "K-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 4: Examine the Burning Circle to enter BCNM 'The Rank 5 Mission'. \n \n" ..
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
            {
                text = "Step 5: Return to Naji at (J-8) in Metalworks to complete the mission.",
                onmob_target = {"Naji"},
                trigger_on_event_id = {722},
                route_to = "Metalworks",
                destination_highlight = {position = "J-8", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "600 Rank Points"
        }
    },

    ["5-2: Xarcabard, Land of Truths"] = {
        steps = {
            {
                text = "Step 1: Complete repeatable missions or trade 2 crystals to a Conquest Overseer to build Rank Bar. \n \n" ..
                       "Talk to any Bastok Gate Guard and select 'Xarcabard, Land of Truths' to accept the mission.",
                onmob_target = {"Rashid", "Cleades", "Argus"},
                --trigger_on_event_id = 1001,
                trigger_on_talk = {"You have accepted the mission"},
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Bastok Mines",
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "D-11", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Bastok Markets",
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "L-6", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Port Bastok",
                    },
                },
            },
            {
                text = "Step 2: Travel to Metalworks and speak to President Karst at (K-8) for a cutscene.",
                onmob_target = {"Karst"},
                trigger_on_event_id = {602},
                route_to = "Metalworks",
                destination_highlight = {position = "K-8", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 3: Travel to Castle Zvahl Baileys! \n \n" ..
                       "Outpost/Survival Guides: Fauregandi/Valdeaunia if possible. \n \n" ..
                       "If walking a good route is from San d'Oria: \n",
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
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = -418.9, y = -44.0, z = 19.6 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Xarcabard", type = 'arrow', center = { x = -390.5, y = -41.7, z = 20.0 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                },
            },
            {
                text = "Step 4: Route through Castle Zvahl Baileys -> Castle Zvahl Keep! \n \n" ..
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
                        state = 4,
                        zone_name = "Castle Zvahl Baileys",
                        floor_id = 1,
                        highlights = {
                            { position = "F-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Castle Zvahl Baileys",
                        floor_id = 2,
                        highlights = {
                            { position = "F-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Castle Zvahl Baileys",
                        floor_id = 15,
                        highlights = {
                            { position = "H-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 5: Castle Zvahl Keep -> Throne Room of the Shadow Lord! \n \n" ..
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
                        state = 5,
                        zone_name = "Castle Zvahl Keep",
                        floor_id = 1,
                        highlights = {
                            { position = "H-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Castle Zvahl Keep",
                        floor_id = 2,
                        highlights = {
                            { position = "E-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Castle Zvahl Keep",
                        floor_id = 3,
                        -- highlights = {
                        --     { position = "E-8", offsetX = 16, offsetY = 16 },
                        -- },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Castle Zvahl Keep",
                        floor_id = 4,
                        highlights = {
                            { position = "G-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 6: Examine the door at the end of Throne Room to enter BCNM 'The Shadow Lord Battle'. \n \n" ..
                       "Shadow Lord (2 phases): \n" ..
                       "Phase 1: \n" ..
                       "- Alternates between Magic Stance (physical immunity) and Melee Stance (magic immunity) \n" ..
                       "- Switches every 5 minutes or after 1000 damage \n" ..
                       "- Magic Stance: Tier 2 elementals, debuffs, Dark Nova weaponskill before switching \n" ..
                       "- Melee Stance: Giga Slash, Kick Back, Umbra Smash weaponskills \n" ..
                       "- Monks: Use Formless Strikes to bypass physical immunity \n" ..
                       "Phase 2 (after cutscene): Spams Implosion \n" ..
                       "- Lower-level parties should zerg him so save your 2hours for this phase! \n \n",
                trigger_on_event_id = {7},
                -- Key items needed (displayed in UI, not required for step completion)
                onmob_target = {"throne-room"},
                onmob_enemy = "Shadow Lord",
                onmob_enemy_size = 4,
            },
            {
                text = "Step 7: Return to President Karst at (K-8) in Metalworks to complete the mission.",
                onmob_target = {"Karst"},
                trigger_on_event_id = {603},
                route_to = "Metalworks",
                destination_highlight = {position = "K-8", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "Rank 6, 20,000 gil, Zilart Mission 1 'The New Frontier' unlocked"
        }
    },

    ["6-1: Return of the Talekeeper"] = {
        steps = {
            {
                text = "Step 1: Receive the mission from any Bastok Gate Guard. This mission requires a certain level of Rank Bar. Trade 4 crystals to a Conquest Overseer.",
                onmob_target = {"Rashid", "Cleades", "Argus"},
                --trigger_on_event_id = 1001,
                trigger_on_talk = {"You have accepted the mission"},
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Bastok Mines",
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "D-11", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Bastok Markets",
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "L-6", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Port Bastok",
                    },
                },
            },
            {
                text = "Step 2: Go to Bastok Mines and talk to Medicine Eagle at (H-5) for a cutscene.",
                onmob_target = {"Medicine Eagle"},
                trigger_on_event_id = 180,
                route_to = "Bastok Mines",
                destination_highlight = {position = "H-5", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 3: Travel to Zeruhn Mines and talk to Drake Fang at (H-6) next to the boat from Palborough Mines. You will see a cutscene where Iron Eater will approve your mission and tell you to go check out Altepa. You don't have to get on the boat to talk to him, just come through Zeruhn.",
                onmob_target = {"Drake Fang"},
                trigger_on_event_id = 200,
                route_to = "Zeruhn Mines",
                destination_highlight = {position = "H-6", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 4: Go to Western Altepa Desert. Travel to the center of the desert (Revelation Rock). Southwest of the rock is a ??? at (G-8). Examine it to spawn the Western Sphinx and Eastern Sphinx. A quick way to get there is to Unity warp (Level 125 category). \n \n",
                route_to = "Western Altepa Desert",
                destination_highlight = {position = "G-8", offsetX = 16, offsetY = 16},
                zone_trigger = "Western Altepa Desert",
            },
            {
                text = "Step 5: Check the ??? at (G-8) and prepare for battle against Eastern Sphinx(Lvl.62) and Western Sphinx(Lvl.62)! \n \n" ..
                       "Notes: This fight is soloable with a party/trusts around level 65. \n \n",
                trigger_on_talk = {"You sense something evil looming above you."},
                onmob_target = {"6-1-???"},
                visual_zones = {
                    {
                        type = 'square',
                        center = { x = -328.4, y = 0.1, z = -112.9 },
                        size = 1,
                    },
                },
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        highlights = {
                            { position = "G-8", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Western Altepa Desert",
                    },
                },
            },
            {
                text = "Step 6: Kill one or both of the Western Sphinx and Eastern Sphinx. Only one must be killed, but you cannot obtain the key item until the other is either dead or de-aggroed - So best kill both! \n \n",
                kill_requirement = {
                    count = 2,
                    enemies = {"Eastern Sphinx", "Western Sphinx"},
                    zone = "Western Altepa Desert",
                    count_party_kills = true  -- Count kills from party members and trusts
                },
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 6,
                        highlights = {
                            { position = "G-8", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Western Altepa Desert",
                    },
                },
            },
            {
                text = "Step 7: Check the ??? again once they have been defeated to recieve the KI:'Altepa moonpebble'! \n \n",
                keyitems_needed = {266},
                trigger_on_keyitem_obtain = {266},
                onmob_target = {"6-1-???"},
                visual_zones = {
                    {
                        type = 'square',
                        center = { x = -328.4, y = 0.1, z = -112.9 },
                        size = 2,
                    },
                },
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 7,
                        highlights = {
                            { position = "G-8", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Western Altepa Desert",
                    },
                },
            },
            {
                text = "Step 8: Return to Bastok Mines and talk to Tall Mountain downstairs at (J-7) on Ore Street by the 'Restricted Section' (next to Bastok Mines Home Point #3) to complete this mission.",
                onmob_target = "Tall Mountain",
                trigger_on_event_id = { 182 },
                route_to = "Bastok Mines",
                destination_highlight = {position = "J-7", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "650 Rank Points"
        }
    },
    ["6-2: The Pirate's Cove"] = {
        prerequisites = {
            {category = "Quests", subfile = "Port Jeuno", name = "Kazham Airship Pass Quest"},
        },
        steps = {
            {
                text = "Step 1: This mission requires a certain level of Rank Bar. Trade 4 crystals to a Conquest Overseer, then speak to any Gate Guard and select the mission from the list. \n \n" ..
                       "NOTE: You must have sufficient rank points built up to receive this mission.",
                onmob_target = {"Rashid", "Cleades", "Argus"},
                --trigger_on_event_id = 1001,
                trigger_on_talk = {"You have accepted the mission"},
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Bastok Mines",
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "D-11", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Bastok Markets",
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "L-6", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Port Bastok",
                    },
                },
            },
            {
                text = "Step 2: Talk to Naji in Metalworks at (J-8). He is the guard outside the President's Office, where you will be treated to a cutscene.",
                onmob_target = "Naji",
                trigger_on_event_id = { 761 },
                route_to = "Metalworks",
                destination_highlight = {position = "J-8", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 3: Make your way to Norg, this will involve a trip to Kazham and Chocobo (F-9) ride through the jungle! \n \n" ..
                       "From Kazham grab the Survival Guide/Home Point if you wish to teleport back later! \n",
                onmob_target = "Tielleque",
                zone_trigger = "Yuhtunga Jungle",
                route_to = "Kazham",
                destination_highlight = {position = "F-9", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 4: You will be sent to speak with Gilgamesh (through the Oaken Door at (K-8) in Norg) where you will get another cutscene. \n \n" ..
                       "Rhapsody of Vanadiel gives a free teleport, also look at the Kazham Airship Pass Quest to allow travel to Kazham via airship from Port Jeuno! \n \n" ..
                       "There's some arrows drawn in the jungle to help with navigation!",
                route_to = "Norg",
                destination_highlight = {position = "K-8", offsetX = 16, offsetY = 16},
                visual_zones = {
                    -- Floor 1
                    --1
                    { type = 'arrow', center = { x = -206.8, y = 0, z = 435.6 }, size = 4, direction = 'down',floor_id = 0 },
                    { type = 'arrow', center = { x = -229.7, y = 0.4, z = 364.3 }, size = 4, direction = 'down',floor_id = 0 },
                    { type = 'arrow', center = { x = -296.8, y = 3.2, z = 182.1 }, size = 4, direction = 'down',floor_id = 0 },
                    { type = 'arrow', center = { x = -262.1, y = 4.5, z = 61.3 }, size = 4, direction = 'left',floor_id = 0 },
                    { type = 'arrow', center = { x = -294.4, y = 0.9, z = 26.1 }, size = 4, direction = 'right',floor_id = 0 },
                    { type = 'arrow', center = { x = -271.1, y = 0, z = -17.8 }, size = 4, direction = 'se',floor_id = 0 },
                    { type = 'arrow', center = { x = -296.9, y = 4.5, z = -99.7 }, size = 4, direction = 'right',floor_id = 0 },
                    { type = 'arrow', center = { x = -255.7, y = 0.9, z = -105.6 }, size = 4, direction = 'ne',floor_id = 0 },
                    { type = 'arrow', center = { x = -221.6, y = 1.4, z = -135.3 }, size = 4, direction = 'down',floor_id = 0 },
                    { type = 'arrow', center = { x = -219.6, y = 4.6, z = -220.7 }, size = 4, direction = 'down',floor_id = 0 },
                    { type = 'arrow', center = { x = -201.5, y = 0, z = -322.9 }, size = 4, direction = 'sw',floor_id = 0 },
                    { type = 'square', center = { x = -261.8, y = 0.2, z = -374.2 }, size = 6,floor_id = 0 },
                    { type = 'arrow', center = { x = -264.3, y = 13.5, z = -376.8 }, size = 4, direction = 'left',floor_id = 0 },
                    { type = 'arrow', center = { x = -390.2, y = 17, z = -366.3 }, size = 4, direction = 'left',floor_id = 0 },
                    { type = 'arrow', center = { x = -477.6, y = 16.3, z = -378.9 }, size = 4, direction = 'left',floor_id = 0 },
                },
                zone_name = "Yuhtunga Jungle",
                onmob_target = "Gilgamesh",
                trigger_on_event_id = { 98 },
            },
            {
                text = "Step 5: Take a chocobo from Norg and this will take you to Yuhtunga Jungle! \n \n" ..
                       "Next go to (I-11) which will take you into Yhoator Jungle also DONT FALL DOWN HOLES! \n \n",
                zone_trigger = "Yhoator Jungle",
                onmob_target = "Marilleune",
                visual_zones = {
                    { type = 'arrow', center = { x = -452.3, y = 17.3, z = -345.2 }, size = 4, direction = 'ne',floor_id = 0 },
                    { type = 'arrow', center = { x = -415.3, y = 17, z = -313.4 }, size = 4, direction = 'up',floor_id = 0 },
                    { type = 'arrow', center = { x = -420.8, y = 0.7, z = -242.9 }, size = 4, direction = 'ne',floor_id = 0 },
                    { type = 'arrow', center = { x = -254.1, y = 0.8, z = -101.3 }, size = 4, direction = 'right',floor_id = 0 },
                    { type = 'arrow', center = { x = -220.6, y = 1.1, z = -134.7 }, size = 4, direction = 'down',floor_id = 0 },
                    { type = 'arrow', center = { x = -219.8, y = 4.7, z = -221.4 }, size = 4, direction = 'down',floor_id = 0 },
                    { type = 'arrow', center = { x = -200.2, y = 0.6, z = -338.0 }, size = 4, direction = 'down',floor_id = 0 },
                    { type = 'arrow', center = { x = -172.6, y = 0.5, z = -413.9 }, size = 4, direction = 'se',floor_id = 0 },
                    { type = 'arrow', center = { x = -29.2, y = 0.8, z = -457.9 }, size = 4, direction = 'ne',floor_id = 0 },
                    { type = 'arrow', center = { x = -15.8, y = 1.3, z = -419.4 }, size = 4, direction = 'right',floor_id = 0 },
                },
                zone_name = "Yuhtunga Jungle",
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        highlights = {
                            { position = "H-9", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Norg",
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        highlights = {
                            { position = "I-11", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Yuhtunga Jungle",
                    },
                },
            },
            {
                text = "Step 6: Next go to (I-5) entrance in Yhoator Jungle to Ifrit's Cauldron. \n \n" ..
                       "Fastest method is to use the Ifrit's Cauldron Home Point and cast Escape. \n \n" ..
                       "If running from Yhoator Jungle, enter at (I-5) - i'll draw some arrows from (D-9) if running/chocoboing. \n \n" ..
                       "Notes: There is a Teleport-Yhoat Crystal KI and Outpost warp to pick up at (F-9) we will take the scenic route! \n \n" ..
                       "If you know the way it is much easier to run from Kazham but for this guide we will pick up the KI's to allow us to teleport back later!",
                zone_trigger = "Ifrit's Cauldron",
                visual_zones = {
                    { type = 'arrow', center = { x = -461.6, y = 1.4, z = -218.7 }, size = 4, direction = 'up',floor_id = 0 },
                    { type = 'arrow', center = { x = -460.1, y = 4.5, z = -179.8 }, size = 4, direction = 'up',floor_id = 0 },
                    { type = 'arrow', center = { x = -456.8, y = 1.1, z = -143.4 }, size = 4, direction = 'right',floor_id = 0 },
                    { type = 'square', center = { x = -281.2, y = 0.6, z = -144 }, size = 4,floor_id = 0 },
                    { type = 'arrow', center = { x = -271.2, y = 0.5, z = -144.5 }, size = 4, direction = 'ne',floor_id = 0 },
                    { type = 'arrow', center = { x = -20.4, y = 8.1, z = -95 }, size = 4, direction = 'up',floor_id = 0 },
                    { type = 'arrow', center = { x = -21.4, y = 0.2, z = -48.8 }, size = 4, direction = 'sw',floor_id = 0 },
                    { type = 'arrow', center = { x = -40.4, y = -0.5, z = -134.5 }, size = 4, direction = 'se',floor_id = 0 },
                    { type = 'arrow', center = { x = -16.8, y = -0.2, z = -149.8 }, size = 4, direction = 'ne',floor_id = 0 },
                    { type = 'arrow', center = { x = 12.7, y = -0.1, z = -72.5 }, size = 4, direction = 'ne',floor_id = 0 },
                    { type = 'arrow', center = { x = 142.7, y = 0.1, z = -130 }, size = 4, direction = 'ne',floor_id = 0 },
                    { type = 'arrow', center = { x = 209.7, y = 0.4, z = -81 }, size = 4, direction = 'right',floor_id = 0 },
                    { type = 'arrow', center = { x = 243.1, y = 0, z = 31.1 }, size = 4, direction = 'left',floor_id = 0 },
                    { type = 'arrow', center = { x = 192.6, y = 0.3, z = 90.4 }, size = 4, direction = 'nw',floor_id = 0 },
                    { type = 'arrow', center = { x = 86.3, y = 0, z = 161.2 }, size = 4, direction = 'up',floor_id = 0 },
                },
                zone_name = "Yhoator Jungle",
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 6,
                        highlights = {
                            { position = "I-5", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Yhoator Jungle",
                    },
                },
            },
            {
                text = "Step 7: From the entrance, go south at the first fork, then north at the second. At (H-7) there will be a lava puddle with a ??? close by. \n \n" ..
                       "IMPORTANT: Bees do not aggro, but bats and bombs will!. \n \n" ..
                       "You will need 1x Adaman Ore to trade to the ???. Adaman Ore can be bought from Auction House or acquired via several other methods. \n \n" ..
                       "NOTE: Magma drops 6 Rare/Ex Frag Rocks. Each person completing the mission will need one so one Adaman Ore would be enough for 6 people; if more than 6 people need the mission, it will need to be killed more than once. \n \n" ..
                       "Like all bombs, Magma can use Self-Destruct. \n \n" ..
                       "STRATEGY: Magma needs to be killed to get the Frag Rock, but the Salamander does not.  \n \n" ..
                       "Re-Pops after 15 minutes.",
                items_needed = {
                    { item = "Adaman Ore", quantity = 1 },
                },
                onmob_target = {"ifrit-6-2-???"},
                trigger_on_talk = {"You have a bad feeling about this place."},
                visual_zones = {
                    { type = 'arrow', center = { x = 259.4, y = 16.6, z = -64.6 }, size = 4, direction = 'down',floor_id = 1 },
                    { type = 'arrow', center = { x = 221.3, y = 16.6, z = -98.7 }, size = 4, direction = 'up',floor_id = 1 },
                },
                zone_name = "Ifrit's Cauldron",
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 7,
                        highlights = {
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Ifrit's Cauldron",
                        floor_id = 1,
                    },
                },
            },
            {
                text = "Step 8: Kill Magma to obtain the Frag Rock. (The Salamander does not need to be killed, but will likely aggro during the fight). \n \n" ..
                       "NOTE: Only Magma drops the Frag Rock, so focus on killing it first!",
                kill_requirement = {
                    count = 1,
                    enemies = {"Magma"},
                    zone = "Ifrit's Cauldron",
                    count_party_kills = true
                },
                items_needed = "Frag Rock",
                trigger_on_item_obtain = {"Frag Rock"},
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 8,
                        highlights = {
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Ifrit's Cauldron",
                        floor_id = 1,
                    },
                },
            },
            {
                text = "Step 9: Once everyone has a Frag Rock, return to Norg and trade your Frag Rock to Gilgamesh at (K-8) for a cutscene.",
                onmob_target = "Gilgamesh",
                route_to = "Norg",
                destination_highlight = {position = "K-8", offsetX = 16, offsetY = 16},
                trigger_on_event_id = { 99 },
            },
            {
                text = "Step 10: Finally, return to Bastok and talk to Naji at (K-8) in Metalworks for a final cutscene and to complete the mission.",
                onmob_target = "Naji",
                route_to = "Metalworks",
                destination_highlight = {position = "K-8", offsetX = 16, offsetY = 16},
                trigger_on_event_id = { 762 },
            },
        },
        reward = {
            text = "40,000 Gil + Rank 7"
        }
    },
    ["7-1: The Final Image"] = {
        steps = {
            {
                text = "Step 1: This mission requires a certain level of Rank Bar. Complete Wading Beasts 1 time or trade 4 single crystals to a Conquest Overseer to open this quest which will put your rank bar at half. You can trade 12 crystals to get Full Rank Bar. \n \n" ..
                       "Talk to a Bastok Gate Guard to receive the mission. \n \n" ..
                       "NOTE: You must have sufficient rank points built up to receive this mission.",
                onmob_target = {"Rashid", "Cleades", "Argus"},
                --trigger_on_event_id = 1001,
                trigger_on_talk = {"You have accepted the mission"},
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Bastok Mines",
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "D-11", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Bastok Markets",
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "L-6", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Port Bastok",
                    },
                },
            },
            {
                text = "Step 2: Talk to Cid in Metalworks (Home Point #1) at (H-8) for a cutscene.",
                onmob_target = "Cid",
                route_to = "Metalworks",
                destination_highlight = {position = "H-8", offsetX = 16, offsetY = 16},
                trigger_on_event_id = { 763 },
            },
            {
                text = "Step 3: Travel to Ro'Maeve. Be sure to have Silent Oils, Ninja's Monomi: Ichi (with tools), or Dancer's Spectral Jig. Monsters in Ro'Maeve are aggressive to level 75+ players by Sound and Magic spellcasting. \n \n" ..
                       "Mounts can now be used in Ro'Maeve, allowing you to move quicker and avoid aggro altogether. If using trusts, pull them out before mounting as there may not be a safe area to dismount near the ???. \n \n" ..
                       "Notes: Use the Ro'Maeve Survival Guide for instant travel!",
                zone_trigger = "Ro'Maeve",
                route_to = "Ro'Maeve",
            },
            {
                text = "Step 4: Find the ??? in Ro'Maeve. The ??? can be located at one of the following positions: D-10, E-9, E-10, E-11, G-9, I-8/J-8, K-10, K-11, L-10, L-7. \n \n" ..
                       "NOTE: The ??? at M-8 is not related to this mission. \n \n" ..
                       "Clear the area around the ???. Very highly recommended to clear the area of nearby enemies prior to popping the NMs. Weapons, bombs, and dolls will aggro level 75s and can easily complicate things for a small group. \n \n" ..
                       "Jugs and Dolls aggro only magic and only players' magic, they will not aggro magic cast by trusts. If the player only melees and leaves the spell-casting to trusts then only evil weapons need to be cleared. \n \n" ..
                       "When ready, target the ??? to spawn 2 NM Golems (Mokkurkalfi). Upon doing so, the ??? most likely will disappear and move to a different location. \n \n" ..
                       "STRATEGY: It is possible to pop the NMs with Sneak active so that they don't aggro, even though Golems normally aggro by Sight. You can then pull them with a ranged attack and fight them one at a time. \n \n" ..
                       "Both golems are resistant or immune to sleep. Only one Golem has to be defeated. \n \n" ..
                       "As with other instances of multiple popped NMs, if you claim one and allow the other one to despawn BEFORE defeating the one you claimed, the party will still receive credit for the fight.",
                trigger_on_talk = {"A chill runs down your spine"},
                kill_requirement = {
                    count = 1,
                    enemies = {"Mokkurkalfi"},
                    zone = "Ro'Maeve",
                    count_party_kills = true
                },
                --  visual_zones = {
                --     { type = 'square', center = { x = 161.6, y = -8, z = 21 }, size = 2 },
                --     { type = 'arrow', center = { x = 221.3, y = 16.6, z = -98.7 }, size = 4, direction = 'up',floor_id = 1 },
                -- },
                -- zone_name = "Ro'Maeve",
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 4,
                        highlights = {
                            { position = "D-10", offsetX = 16, offsetY = 16 },
                            { position = "E-9", offsetX = 16, offsetY = 16 },
                            { position = "E-10", offsetX = 16, offsetY = 16 },
                            { position = "E-11", offsetX = 16, offsetY = 16 },
                            { position = "G-9", offsetX = 16, offsetY = 16 },
                            { position = "I-8", offsetX = 16, offsetY = 16 },
                            { position = "J-8", offsetX = 16, offsetY = 16 },
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                            { position = "K-11", offsetX = 16, offsetY = 16 },
                            { position = "L-10", offsetX = 16, offsetY = 16 },
                            { position = "L-7", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Ro'Maeve",
                    },
                },
            },
            {
                text = "Step 5: After a golem or both Golems are defeated, track down the ??? again and get the Reinforced Cermet key item. The ??? will most likely not be in the same position where you spawned the NMs. \n \n" ..
                       "IMPORTANT: You must not leave the zone after defeating the NMs and before getting the key item. If you do, you will have to defeat the NMs once again upon your return. Logging out is confirmed to not count as leaving. \n \n" ..
                       "The ??? will not move when someone checks it for key item; it will only move when the NMs are spawned.",
                keyitems_needed = {289},
                trigger_on_keyitem_obtain = {289},
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        highlights = {
                            { position = "D-10", offsetX = 16, offsetY = 16 },
                            { position = "E-9", offsetX = 16, offsetY = 16 },
                            { position = "E-10", offsetX = 16, offsetY = 16 },
                            { position = "E-11", offsetX = 16, offsetY = 16 },
                            { position = "G-9", offsetX = 16, offsetY = 16 },
                            { position = "I-8", offsetX = 16, offsetY = 16 },
                            { position = "J-8", offsetX = 16, offsetY = 16 },
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                            { position = "K-11", offsetX = 16, offsetY = 16 },
                            { position = "L-10", offsetX = 16, offsetY = 16 },
                            { position = "L-7", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Ro'Maeve",
                    },
                },
            },
            {
                text = "Step 6: Go back and talk with Cid at (H-8) in Metalworks to get a cutscene and complete the mission.",
                onmob_target = "Cid",
                route_to = "Metalworks",
                destination_highlight = {position = "H-8", offsetX = 16, offsetY = 16},
                trigger_on_event_id = { 764 },
            },
        },
        reward = {
            text = "700 Rank Points"
        }
    },

    ["7-2: On My Way"] = {
        steps = {
            {
                text = "Step 1: If you traded 4 crystals to a Bastok Gate Guard for the prior mission, trade another 5 crystals to get this mission. \n \n" ..
                       "Talk to a Bastok Gate Guard to receive the mission.",
                onmob_target = {"Rashid", "Cleades", "Argus"},
                --trigger_on_event_id = 1001,
                trigger_on_talk = {"You have accepted the mission"},
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Bastok Mines",
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "D-11", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Bastok Markets",
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "L-6", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Port Bastok",
                    },
                },
            },
            {
                text = "Step 2: Talk to President Karst in Metalworks at (K-8) for a cutscene.",
                onmob_target = "Karst",
                route_to = "Metalworks",
                destination_highlight = {position = "K-8", offsetX = 16, offsetY = 16},
                trigger_on_event_id = { 765 },
            },
            {
                text = "Step 3: Talk to Hilda at (E-6) in the 'Steaming Sheep' restaurant in Port Bastok. (Next to Home Point #3)",
                onmob_target = "Hilda",
                route_to = "Port Bastok",
                destination_highlight = {position = "E-6", offsetX = 16, offsetY = 16},
                trigger_on_event_id = { 255 },
            },
            {
                text = "Step 4: Go through Palborough Mines and into Waughroon Shrine. \n \n" ..
                       "Alternative routes: \n" ..
                       "- If you've beaten Beyond Infinity, you can talk to Domenic inside Neptune's Spire in Lower Jeuno and have him teleport you to the shrine. \n" ..
                       "- If you've previously activated the Home Point outside the arena, you can go there directly. \n \n",
                zone_trigger = "Waughroon Shrine",
                route_to = "Waughroon Shrine",
            },
            {
                text = "Step 5: Click on the Burning Circle to enter the battlefield 'On My Way', a 6-person uncapped level BCNM. \n \n" ..
                       "The fight is against: \n" ..
                       "- Go'Bha Slaughterer (DRK) \n" ..
                       "- Ku'Jhu Graniteskin (WAR) \n" ..
                       "- Da'Shu Knightslayer (RDM) \n" ..
                       "- Sa'Nha Soulsaver (WHM) \n \n" ..
                       "This is a mission BCNM, so no exp is lost from K.O. in this fight. \n \n" ..
                       "STRATEGY: Enemies will all use their respective jobs' One Hour Ability. It is recommended that you kill them in the order listed above. If you use Sleepga and go for the White Mage first, he can use Benediction or Curaga to wake the others. So you should bring Sa'Nha Soulsaver to the entrance and kill it there. \n \n" ..
                       "Buffs and Trusts wear upon entering, so cast after entering. \n \n" ..
                       "Only Bastokers who are on mission 7-2 or who have finished this mission for Bastok before (regardless of current Allegiance), can enter the BCNM. \n \n" ..
                       "After the fight, you will receive the KI:Letter From Werei.",
                trigger_on_keyitem_obtain = {"Letter From Werei"},
                keyitems_needed = {"Letter From Werei"},
            },
            {
                text = "Step 6: The next two steps can be completed in either order, but you must do both to complete the mission. \n \n" ..
                       "Talk to Gumbah at (J-7) inside an upper-level house in Bastok Mines. Gumbah also starts several quests, so be sure the cutscene relates to Werei's letter.",
                onmob_target = "Gumbah",
                route_to = "Bastok Mines",
                destination_highlight = {position = "J-7", offsetX = 16, offsetY = 16},
                trigger_on_event_id = { 175,177 },
            },
            {
                text = "Step 7: Talk to President Karst in Metalworks at (K-8). At this point you will receive Rank 8 and your reward.",
                onmob_target = "Karst",
                route_to = "Metalworks",
                destination_highlight = {position = "K-8", offsetX = 16, offsetY = 16},
                trigger_on_event_id = { 766 },
            },
        },
        reward = {
            text = "60,000 Gil + Rank 8"
        }
    },

    ["8-1: The Chains That Bind Us"] = {
        prerequisites = {
            {category = "Quests", subfile = "Eastern Altepa Desert", name = "Open Sesame"},
        },
        steps = {
            {
                text = "Step 1: This mission requires a certain level of Rank Bar. Trade 6 crystals to a Conquest Overseer, then talk to a Bastok Gate Guard to receive the mission.",
                onmob_target = {"Rashid", "Cleades", "Argus"},
                --trigger_on_event_id = 1001,
                trigger_on_talk = {"You have accepted the mission"},
                keyitems_needed = {2051},
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Bastok Mines",
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "D-11", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Bastok Markets",
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "L-6", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Port Bastok",
                    },
                },
            },
            {
                text = "Step 2: Talk to Iron Eater at (J-8) guarding the Door to the President's Office in Metalworks. \n \n" ..
                       "Iron Eater is involved in multiple quests and missions. If necessary, keep talking to him until he tells you to investigate the Quicksand Caves.",
                onmob_target = "Iron Eater",
                route_to = "Metalworks",
                destination_highlight = {position = "J-8", offsetX = 16, offsetY = 16},
                trigger_on_event_id = { 767 },
            },
            {
                text = "Step 3: Travel to Western Altepa Desert (G-5) and enter Quicksand Caves. \n \n" ..
                       "Routes: \n" ..
                       "- Voidwatch warp to Kuftal Tunnel entrance is near this location (Requires starting the Zilart branch of Voidwatch). \n" ..
                       "- Use the Kuftal Tunnel Survival Guide and exit back into Altepa. \n" ..
                       "- Unity warping to Western Altepa Desert (Level 125 category). \n \n",
                zone_trigger = "Quicksand Caves",
                route_to = "Western Altepa Desert",
                destination_highlight = {position = "G-5", offsetX = 16, offsetY = 16},
                visual_zones = {
                    { type = 'arrow', center = { x = -280.8, y = 0.8, z = 263.8 }, size = 4, direction = 'left',floor_id = 0 },
                    { type = 'arrow', center = { x = -339.9, y = 10.2, z = 300.2 }, size = 4, direction = 'right',floor_id = 0 },
                 },
                zone_name = "Western Altepa Desert",
            },
            {
                text = "Step 4: Navigate through Quicksand Caves. Head to (H-8) and pass through the Weight Detection's door [works with 1 Galka, 2 Hume/Elvaan/Mithra, 3 Tarutaru also works with 1 Tarutaru and 1 of any other race, or Key Item: Loadstone]. Trust NPCs do not work!!! \n \n" ..
                       "Head south into a new room and pass another Weight Detection's door (H-10). The ??? (Galka Statue) you need is just to the south located at (G-11). \n \n" ..
                       "Clear the room first, then spawn the 3 NMs: \n" ..
                       "- Triarius IV-XIV (Black Mage) \n" ..
                       "- Princeps IV-XLV (Paladin) \n" ..
                       "- Centurio IV-VII (Warrior) \n \n" ..
                       "It is recommended that you kill them in the order listed above. However, only one needs to be killed if two others are left to despawn before it dies. \n \n" ..
                       "A group of 12 level ~60 alliance or a party (Trust or not) at level ~73 can handle this with a sleeper. Trivial at Item Level. \n \n" ..
                       "TIPS: The NMs are about lvl 70~ Antica. Sneak pop does not work, they will aggro once you pop them. However, they can be deaggroed by a SMN using an AoE bloodpact, running away, and releasing. \n \n" ..
                       "They have high resistance to dark magic, but Repose and Horde Lullaby can sleep them easily. Level 75+ Red Mage can cast Sleep reliably. \n \n" ..
                       "Triarius IV-XIV may cast Sleepga II in the beginning, please beware. Centurio IV-VII will also use Mighty Strikes.",
                visual_zones = {
                    { type = 'square', center = { x = -419.9, y = -0.4, z = 740.4 }, size = 6,floor_id = 5 },
                    { type = 'square', center = { x = -400.0, y = -0.4, z = 671.7 }, size = 6,floor_id = 5 },
                 },
                onmob_target = "quicksand-8-1-???",
                trigger_on_talk = "You sense something evil.",
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 4,
                        highlights = {
                            { position = "G-11", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Quicksand Caves",
                        floor_id = 5,
                    },
                },
            },
            {
                text = "Step 5: Now kill the 3 NMs: \n" ..
                       "- Triarius IV-XIV (Black Mage) \n" ..
                       "- Princeps IV-XLV (Paladin) \n" ..
                       "- Centurio IV-VII (Warrior) \n \n",
                kill_requirement = {
                    count = 3,
                    enemies = {"Triarius IV-XIV", "Princeps IV-XLV", "Centurio IV-VII"},
                    zone = "Quicksand Caves",
                    count_party_kills = true,
                    reset_on_zone_entry = true,
                },
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        highlights = {
                            { position = "G-11", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Quicksand Caves",
                        floor_id = 5,
                    },
                },
            },
            {
                text = "Step 6: After you win, touch the ??? again at (G-11) to get a cutscene.",
                trigger_on_event_id = { 11 },
                onmob_target = "quicksand-8-1-???",
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 6,
                        highlights = {
                            { position = "G-11", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Quicksand Caves",
                        floor_id = 5,
                    },
                },
            },
            {
                text = "Step 7: Next go to the Western Altepa Desert (D-12) entrance. \n \n" ..
                       "The entrance in Western Altepa Desert is accessed through a hidden area on the map, starting at (C-11)/(D-11) in the far Southwest corner. Hug the southern wall in the lower area to climb the broken stairs. \n \n",
                --zone_trigger = "Quicksand Caves",
                route_to = "Western Altepa Desert",
                destination_highlight = {position = "D-12", offsetX = 16, offsetY = 16},
                trigger_zones = {
                    { type = 'square', center = { x = -739.8, y = -9.8, z = -704.3 }, size = 5},
                },
                visual_zones = {
                    { type = 'arrow', center = { x = -833.6, y = -8.8, z = -605.8 }, size = 4, direction = 'se', floor_id = 0 },
                    { type = 'arrow', center = { x = -802, y = -19.1, z = -698.6 }, size = 4, direction = 'up', floor_id = 0 },
                    { type = 'arrow', center = { x = -779.9, y = -16.6, z = -616.3 }, size = 4, direction = 'down', floor_id = 0 },
                    { type = 'arrow', center = { x = -774, y = -8.4, z = -702.5 }, size = 4, direction = 'right', floor_id = 0 },
                    -- --Quicksand
                    -- { type = 'square', center = { x = -700.1, y = -0.4, z = -380.1 }, size =5, floor_id = 7 }

                },
                zone_name = "Western Altepa Desert",
            },
            {
                text = "Step 8: Now enter the Quicksand Caves!",
                route_to = "Western Altepa Desert",
                destination_highlight = {position = "D-12", offsetX = 16, offsetY = 16},
                visual_zones = {
                    { type = 'arrow', center = { x = -740.2, y = -9.8, z = -706.2 }, size = 3, direction = 'down'},
                },
                zone_name = "Western Altepa Desert",
                zone_trigger = "Quicksand Caves",
            },
            {
                text = "Step 9: Once inside, make sure you cast Sneak and make your way through the caves to (K-8). You will come to a weighted door leading East. Go through that door and continue to follow the caves (both the left and the right path lead to the next door). \n \n" ..
                       "You will arrive at another weighted door at (G-8) facing East. Again, go through that door into a smaller room with another door. \n \n" ..
                       "After going through the second weighted door and through the door behind it, you will notice the mural on the wall to your left, and a ??? on a small pedestal, which you will check for another cutscene with Zeid and some interesting storyline.",
                trigger_on_event_id = { 10 },
                onmob_target = "quicksand2-8-1-???",
                visual_zones = {
                    --Quicksand
                    { type = 'square', center = { x = -700.0, y = -0.4, z = -420.2 }, size =5, floor_id = 4 },
                    { type = 'square', center = { x = -580.1, y = -0.4, z = -420.1 }, size =5, floor_id = 7 }

                },
                zone_name = "Quicksand Caves",
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 9,
                        highlights = {
                            { position = "K-8", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Quicksand Caves",
                        floor_id = 4,
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 9,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Quicksand Caves",
                        floor_id = 7,
                    },
                },
            },
            {
                text = "Step 10: When that is done, head back to Metalworks in Bastok and talk to Iron Eater at (J-8) for another cutscene to complete the mission.",
                onmob_target = "Iron Eater",
                route_to = "Metalworks",
                destination_highlight = {position = "J-8", offsetX = 16, offsetY = 16},
                trigger_on_event_id = { 768 },
            },
        },
        reward = {
            text = "1133 Rank Points"
        }
    },

    ["8-2: Enter the Talekeeper"] = {
        steps = {
            {
                text = "Step 1: This mission requires a certain level of Rank Bar to become available. Trade 6 crystals to a Conquest Overseer, then talk to a Bastok Gate Guard to receive the mission.",
                onmob_target = {"Rashid", "Cleades", "Argus"},
                --trigger_on_event_id = 1001,
                trigger_on_talk = {"You have accepted the mission"},
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Bastok Mines",
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "D-11", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Bastok Markets",
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "L-6", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Port Bastok",
                    },
                },
            },
            {
                text = "Step 2: Talk to Drake Fang at (H-6) in Zeruhn Mines for a cutscene.",
                onmob_target = "Drake Fang",
                route_to = "Zeruhn Mines",
                destination_highlight = {position = "H-6", offsetX = 16, offsetY = 16},
                trigger_on_event_id = { 202 },
            },
            {
                text = "Step 3: Head to Kuftal Tunnel. The entrance is at (H-4) from Western Altepa Desert. \n \n" ..
                       "Routes: \n" ..
                       "- Fastest teleport option is the Survival Guide in Kuftal Tunnel. \n" ..
                       "- You can ride from Rabao, use the Voidwatch Zilart teleport, Western Altepa Desert Survival Guide teleport, or Unity teleport (Level 125 category) to get to the Western Altepa Desert exit to Kuftal Tunnel. \n \n",
                zone_trigger = "Kuftal Tunnel",
                route_to = "Western Altepa Desert",
                destination_highlight = {position = "H-4", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 4: Examine the ??? at (H-8) on the top of the cliff near the entrance to Western Altepa Desert. The dialogue should end with it saying the piece of wood fell down. \n \n" ..
                       "Everyone who needs the mission must check the ???. However, if someone misses it, they can check the ??? at the top after the NM is killed, then check the ??? at the bottom and still get the key item.",
                trigger_on_event_id = { 12 },
                onmob_target = "kuftal1-8-2-???",
                visual_zones = {
                    { type = 'square', center = { x = -29.1, y = -22.1, z = -183.8 }, size = 1, floor_id = 1 },
                },
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 4,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Kuftal Tunnel",
                        floor_id = 1,
                    },
                },
            },
            {
                text = "Step 5: Clear the lower area of ghosts, then touch the ??? at (H-7) at the bottom of the cliff (in the Cancer pop room) to spawn 3 NM ghosts: \n" ..
                       "- Dervo's Ghost \n" ..
                       "- Gizerl's Ghost \n" ..
                       "- Gordov's Ghost \n \n" ..
                       "Doable solo with Trust at level 75. Trivial at Item Level. \n \n" ..
                       "TIPS: It takes at least one minute from pop of the NMs before the cutscene can be triggered. If you kill the ghosts fast you will get the nothing message until the cutscene triggers. \n \n" ..
                       "It is possible to complete this mission by killing only one of the ghosts. Pull one of the NMs, wait for the other two to despawn, then kill the NM that was pulled. If you do not wait for the other two NMs to despawn first, you will not be able to complete the mission by checking the ??? and will have to fight the mobs again. The wait time for the ??? to be active again is approximately 5 minutes.",
                trigger_on_talk = "You sense an evil presence...",
                onmob_target = "kuftal2-8-2-???",
                visual_zones = {
                    { type = 'square', center = {  x = -27.8, y = -10.4, z = -185.8 }, size = 1, floor_id = 1 },
                },
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        highlights = {
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Kuftal Tunnel",
                        floor_id = 1,
                    },
                },
            },
            {
                text = "Step 6: Kill the 3 NM ghosts: \n" ..
                       "- Dervo's Ghost \n" ..
                       "- Gizerl's Ghost \n" ..
                       "- Gordov's Ghost \n \n",
                kill_requirement = {
                    count = 1,
                    enemies = {"Dervo's Ghost", "Gizerl's Ghost", "Gordov's Ghost"},
                    zone = "Kuftal Tunnel",
                    count_party_kills = true
                },
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 6,
                        highlights = {
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Kuftal Tunnel",
                        floor_id = 1,
                    },
                },
            },
            {
                text = "Step 7: Have everyone check the ??? at the bottom (H-7) until they receive the cutscene and a Key Item: Old Piece of Wood. \n \n" ..
                       "Checking the ??? will not respawn the NM ghosts no matter how much time has passed (leaving the zone means you will have to re-fight the NMs), so it's okay to raise any members who have died first. \n \n" ..
                       "A static time limit may exist between killing NMs and ??? triggering cutscene with mission completion. If your group or solo party killed each ghost, continue testing the ??? periodically until it yields the completion cutscene.",
                --trigger_on_event_id = { 13 },
                trigger_on_keyitem_obtain = {293},
                keyitems_needed = {293},
                onmob_target = "kuftal2-8-2-???",
                visual_zones = {
                    { type = 'square', center = {  x = -27.8, y = -10.4, z = -185.8 }, size = 1, floor_id = 1 },
                },
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 7,
                        highlights = {
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Kuftal Tunnel",
                        floor_id = 1,
                    },
                },
            },
            {
                text = "Step 8: Talk to Drake Fang at (H-6) in Zeruhn Mines again for a long cutscene. You will be teleported to Bastok Mines and the mission will complete.",
                onmob_target = "Drake Fang",
                trigger_on_event_id = { 204, 176 },
                route_to = "Zeruhn Mines",
                destination_highlight = {position = "H-6", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "80,000 Gil + Rank 9"
        }
    },

    ["9-1: The Salt of the Earth"] = {
        steps = {
            {
                text = "Step 1: This mission requires a certain level of Rank Bar. Repeat missions or trade 10 crystals to a Conquest Overseer, then talk to a Bastok Gate Guard to receive the mission.",
                onmob_target = {"Rashid", "Cleades", "Argus"},
                --trigger_on_event_id = 1001,
                trigger_on_talk = {"You have accepted the mission"},
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Bastok Mines",
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "D-11", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Bastok Markets",
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "L-6", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Port Bastok",
                    },
                },
            },
            {
                text = "Step 2: Talk to Alois in the 'Conference Room' to the left of the President's Office in Metalworks for a cutscene.",
                onmob_target = "Alois",
                trigger_on_event_id = { 773 },
                route_to = "Metalworks",
                destination_highlight = {position = "J-7", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 3: Talk to Dancing Wolf at (G-7) in Rabao, near Home Point #2 - Same route as previous missions(Use the maps if need a route from Bastok or OP Warp to Kuzotz!)",
                onmob_target = "Dancing Wolf",
                trigger_on_event_id = { 102 },
                route_to = "Rabao",
                destination_highlight = {position = "G-7", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 4: Go to Gustav Tunnel. \n \n",
                zone_trigger = "Gustav Tunnel",
                route_to = "Valkurm Dunes",
                destination_highlight = {position = "B-8", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 5: Click the ??? which is located at (G-6). The fight starts off with one Gigaplasm. Once you kill it, it turns into two Macroplasms. Each one of those turns into two Microplasms and each one of those turn into two Nanoplasms. \n \n" ..
                       "Recommended Fight Order: Gigaplasm -> Macroplasms -> Microplasms -> Nanoplasms \n \n" ..
                       "Soloable at Lv99 with trusts. \n \n" ..
                       "TIPS: It is not possible to sneak pop the NM as in previous missions. The Gigaplasm will spawn claimed and immediately begin attacking the person who popped it. \n \n" ..
                       "The plasms do not build resistance to either sleep or lullaby. As the plasms get smaller, they attack faster and faster. Nanoplasm have a delay of about 150. The smaller plasms' magic defense decreases greatly with each new stage. \n \n" ..
                       "IMPORTANT: If whoever pops the Gigaplasm dies in a bad spot and is still dead after fight is over, do not Tractor them! You must not zone or get tractored, otherwise you will need to fight the NM again. Should someone d/c after the fight is done, but before earning the key item, you will not have to do the fight again. If someone gets disconnected during the fight, sleep the last slime until they can be re-invited.",
                trigger_on_talk = "You have a bad feeling about this place.",
                onmob_target = "gustav1-9-1-???",
                visual_zones = {
                    { type = 'square', center = { x = -130.7, y = 1.2, z = 252.6 }, size = 1, floor_id = 2 },
                },
                zone_name = "Gustav Tunnel",
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        highlights = {
                            { position = "G-9", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Gustav Tunnel",
                        floor_id = 1,
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        highlights = {
                            { position = "G-6", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Gustav Tunnel",
                        floor_id = 2,
                    },
                },
            },
            {
                text = "Step 6: After you defeat all the Plasms, check the ??? at (G-6) for the Key Item: Miraclesalt.",
                onmob_target = "gustav1-9-1-???",
                visual_zones = {
                    { type = 'square', center = { x = -130.7, y = 1.2, z = 252.6 }, size = 1, floor_id = 2 },
                },
                zone_name = "Gustav Tunnel",
                trigger_on_keyitem_obtain = {477},
                keyitems_needed = {477},
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 6,
                        highlights = {
                            { position = "G-6", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Gustav Tunnel",
                        floor_id = 2,
                    },
                },
            },
            {
                text = "Step 7: Return to Rabao and talk to Dancing Wolf at (G-7) for a cutscene after obtaining the key item.",
                onmob_target = "Dancing Wolf",
                trigger_on_event_id = { 104 },
                route_to = "Rabao",
                destination_highlight = {position = "G-7", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 8: Return to the Conference Room and talk to Alois at (J-7) in Metalworks again to complete the mission.",
                onmob_target = "Alois",
                trigger_on_event_id = { 776 },
                route_to = "Metalworks",
                destination_highlight = {position = "J-7", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "1500 Rank Points"
        }
    },

    ["9-2: Where Two Paths Converge"] = {
        steps = {
            {
                text = "Step 1: Talk to a Bastok Gate Guard to receive the mission.",
                onmob_target = {"Rashid", "Cleades", "Argus"},
                --trigger_on_event_id = 1001,
                trigger_on_talk = {"You have accepted the mission"},
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Bastok Mines",
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "D-11", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Bastok Markets",
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "L-6", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Port Bastok",
                    },
                },
            },
            {
                text = "Step 2: Talk to Iron Eater at (J-8) in Metalworks for a cutscene. May require you talking to him multiple times to get the correct cutscene.",
                onmob_target = "Iron Eater",
                trigger_on_event_id = { 780 },
                route_to = "Metalworks",
                destination_highlight = {position = "J-8", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 3: Travel to Castle Zvahl Baileys. \n \n" ..
                       "Outpost: Fauregandi/Valdeaunia if possible or use Castle Baileys HP#1 teleport.\n \n",
                zone_trigger = "Castle Zvahl Baileys",
                route_to = "Xarcabard",
                destination_highlight = {position = "D-7", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 4: Route through Castle Zvahl Baileys -> Castle Zvahl Keep. \n \n" ..
                       "Map 1: Go to (G-8) staying on the lower level and take a first Right (North). Follow the arrows on the ground will lead you to (F-8) - Map 2. \n \n" ..
                       "Map 2: Jump down the Goblin Pitt, there will be an arrow to indicate where to go. \n \n" ..
                       "Map 2: Jump down the Goblin Pitt, there will be an arrow to indicate where to go. \n \n" ..
                       "Map 3: Run down the hall and run up the stairs back to Map 2. \n \n" ..
                       "Map 2: Follow the arrows, end goal is (F-8) to Castle Zvahl Keep. \n \n" ..
                       "Aggro: Demons/Beastmen (sight), Ahriman (sight+sound), use Sneak/Invis if below Lv70.",
                zone_trigger = "Castle Zvahl Keep",
                visual_zones = {
                    { type = 'arrow', center = { x = 179.9, y = -24.1, z = 19.5 }, size = 4, direction = 'up', floor_id = 1 },
                    { type = 'arrow', center = { x = 87.9, y = -20.1, z = 100.6 }, size = 4, direction = 'down', floor_id = 1 },
                    { type = 'arrow', center = { x = 99.8, y = -20.1, z = 72.7 }, size = 4, direction = 'left', floor_id = 1 },
                    { type = 'arrow', center = { x = 31.2, y = -20, z = 59.7 }, size = 4, direction = 'up', floor_id = 2 },
                    { type = 'arrow', center = { x = 20.8, y = -20, z = 150.2 }, size = 4, direction = 'down', floor_id = 2 },
                    { type = 'arrow', center = { x = 12.8, y = -24, z = 133.4 }, size = 4, direction = 'sw', floor_id = 2 },
                    { type = 'arrow', center = { x = -61, y = -20, z = 110.2 }, size = 4, direction = 'down', floor_id = 2 },
                    { type = 'arrow', center = { x = -92, y = -20, z = 89.4 }, size = 4, direction = 'down', floor_id = 2 },
                    { type = 'arrow', center = { x = -91.8, y = -19.5, z = 51.5 }, size = 4, direction = 'right', floor_id = 2 },
                    { type = 'arrow', center = { x = -76.1, y = -19.5, z = 52.1 }, size = 4, direction = 'down', floor_id = 2 },
                    { type = 'arrow', center = { x = -77.4, y = -24, z = 20.2 }, size = 4, direction = 'left', floor_id = 2 },
                    { type = 'arrow', center = { x = -6.5, y = 4, z = 126.5 }, size = 4, direction = 'nw', floor_id = 15 },
                    { type = 'arrow', center = { x = -59.7, y = 4, z = 179.2 }, size = 4, direction = 'down', floor_id = 15 },
                    { type = 'arrow', center = { x = 12.8, y = -24, z = 133.4 }, size = 4, direction = 'sw', floor_id = 15 },
                },
                zone_name = "Castle Zvahl Baileys",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Castle Zvahl Baileys",
                        floor_id = 1,
                        highlights = {
                            { position = "F-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Castle Zvahl Baileys",
                        floor_id = 2,
                        highlights = {
                            { position = "F-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Castle Zvahl Baileys",
                        floor_id = 15,
                        highlights = {
                            { position = "H-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 5: Castle Zvahl Keep -> Throne Room. \n \n" ..
                       "Follow the arrows, there is a lot of door opening here! \n" ..
                       "Map 1 -> (H-6) \n" ..
                       "Map 2 -> (E-8) \n" ..
                       "Map 3 -> Run on the teleporters when a glowing image appears. Keep doing this until you reach Map 4! \n" ..
                       "Map 4 -> (G-7) to Throne Room and grab the Home Point!",
                visual_zones = {
                    { type = 'arrow', center = { x = -30, y = 0, z = -22.3 }, size = 4, direction = 'up', floor_id = 1 },
                    { type = 'arrow', center = { x = -32.4, y = 0.6, z = 48.7 }, size = 4, direction = 'right', floor_id = 1 },
                    { type = 'arrow', center = { x = -10.1, y = 0.6, z = 69.4 }, size = 4, direction = 'up', floor_id = 1 },
                    { type = 'arrow', center = { x = -10.1, y = 0.6, z = 90.2 }, size = 4, direction = 'left', floor_id = 1 },
                    { type = 'arrow', center = { x = -69, y = 0.6, z = 107.8 }, size = 4, direction = 'up', floor_id = 1 },
                    { type = 'arrow', center = { x = -69.7, y = -15.4, z = 86.4 }, size = 4, direction = 'down', floor_id = 2 },
                    { type = 'arrow', center = { x = -60.4, y = -15.4, z = 48.5 }, size = 4, direction = 'down', floor_id = 2 },
                    { type = 'square', center = { x = -300, y = -49.1, z = -20 }, size = 4, floor_id = 3 },
                    { type = 'square', center = { x = -272.6, y = -53.2, z = 4.9 }, size = 4, floor_id = 3 },
                    { type = 'square', center = { x = -272.9, y = -53.2, z = -44.6 }, size = 4, floor_id = 3 },
                    { type = 'square', center = { x = -326.5, y = -53.2, z = -45 }, size = 4, floor_id = 3 },
                },
                zone_name = "Castle Zvahl Keep",
                zone_trigger = "Throne Room",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Castle Zvahl Keep",
                        floor_id = 1,
                        highlights = {
                            { position = "H-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Castle Zvahl Keep",
                        floor_id = 2,
                        highlights = {
                            { position = "E-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Castle Zvahl Keep",
                        floor_id = 3,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Castle Zvahl Keep",
                        floor_id = 4,
                        highlights = {
                            { position = "G-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 6: Enter the Throne Room BCNM to fight Zeid. 6 characters including you, that are either currently on this part of the mission or have previously completed it, regardless of current allegiance, may enter. \n \n" ..
                       "PREPARATION: Buffs are removed upon entry. Food effects however, are not. Do not move towards Zeid until everyone is inside/Alter Egos have been summoned. He will not attack until you move close enough, so it is safe to buff up and rest to full as long as you stay far enough away. You CAN call Trust NPCs for this fight. \n \n" ..
                       "ZEID'S ABILITIES: Zeid is capable of using all Great Sword weapon skills up to Ground Strike, which tends to be his favorite. He casts Absorb spells, but nothing more. The weapon skill Shockwave is an AoE attack and can cause Sleep. If a large portion of your party are melee-type, consider using Poison Potions. This is not necessary for mages, as long as they keep proper distance. \n \n" ..
                       "Zeid also uses two unique abilities: Abyssal Strike (ranged attack, 5-10 second Stun, purple flash on sword) and Abyssal Drain (Drain move about as powerful as the spell). Zeid may have some form of TP Regain, as he will build TP quickly even if being kited and only attacked by magic. \n \n" ..
                       "VOLKER PHASE: When Zeid is at about 70 percent HP, there will be a cutscene featuring Volker, who will join you in the fight. You are given time to rest afterwards as Zeid will not immediately aggro again, but Volker will attack if you wait too long. Volker must be kept alive in order to win and Zeid's Ground Strike can take most, if not all, of his HP in one shot. \n \n" ..
                       "SHADOW OF RAGE: At some point, two creatures called Shadow of Rage will spawn. They have attacks equal to Zeid's but much less HP. They are highly resistant or immune to all forms of Sleep. A well-timed -ga spell can kill both in one hit. The Shadows can use Great Sword weapon skills at least up to Shockwave and use the same Abyssal moves as Zeid. They gain TP very quickly. Zeid will later recall the Shadows if they are defeated, but not immediately (30-60 seconds). Killing them is highly recommended as they hit nearly as hard as Zeid and can skillchain with him. If Zeid is defeated before the shadows, they will despawn. \n \n" ..
                       "You won't lose any Experience Points if you are defeated.",
                kill_requirement = {
                    count = 1,
                    enemies = {"Zeid"},
                    --zone = "Throne Room",
                    count_party_kills = true
                },
            },
            {
                text = "Step 7: Return to Iron Eater at (J-8) in Metalworks to complete the mission and receive your rewards.",
                onmob_target = "Iron Eater",
                route_to = "Metalworks",
                destination_highlight = {position = "J-8", offsetX = 16, offsetY = 16},
                trigger_on_event_id = { 782 },
            },
        },
        reward = {
            text = "100,000 Gil + Rank 10 + Title: Hero Among Heroes + Bastokan Flag"
        }
    },
}
