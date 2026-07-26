return {
    ["ZM01: The New Frontier"] = {
        prerequisites = {
            {any = {
                {category = "Missions", subfile = "Bastok", name = "5-2: Xarcabard, Land of Truths"},
                {category = "Missions", subfile = "SanDoria", name = "5-2: The Shadow Lord"},
                {category = "Missions", subfile = "Windurst", name = "5-2: The Shadow Awaits"},
            }},
        },
        steps = {
            {
                text = "Step 1: Enter Norg to receive a cutscene and a Key Item: Map of Norg.",
                zone_trigger = "Norg",
                trigger_on_event_id = {1},
                route_to = "Norg",
            },
        },
        reward = {
            text = "Key Item: Map of Norg",
        }
    },

    ["ZM02: Welcome to Norg"] = {
        steps = {
            {
                text = "Step 1: Click on the 'Oaken Door' at (K-8) in Norg for a cutscene with Gilgamesh. The dialog will ask if you want to open the door, choose Yes. \n \n" ..
                       "Note: If you are on one of the numerous Rhapsodies Missions where you click on the door, you will get that cutscene first. Just touch the door again. \n \n",
                route_to = "Norg",
                onmob_target = {"Norg_OakenDoor"},
                destination_highlight = {position = "K-8", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {2},
            },
        },
        reward = {
            text = "None",
        }
    },

    ["ZM03: Kazhams Chieftainess"] = {
        steps = {
            {
                text = "Step 1: Talk to Jakoh Wahcondalo at (J-9) in Kazham (Home Point #1) to obtain the Key Item: Sacrificial Chamber Key, which is required to enter the deeper areas of the Temple of Uggalepih.",
                onmob_target = "Jakoh Wahcondalo",
                route_to = "Kazham",
                destination_highlight = {position = "J-9", offsetX = 16, offsetY = 16},
                --trigger_on_event_id = {114},
                keyitems_needed = {238},
                trigger_on_keyitem_obtain = {238},
            },
        },
        reward = {
            text = "Key Item: Sacrificial Chamber Key",
        }
    },

    ["ZM04: The Temple of Uggalepih"] = {
        prerequisites = {
            {category = "Quests", subfile = "Temple of Uggalepih", name = "Paintbrush of Souls"},
        },
        steps = {
            {
                keyitems_needed = {272},
                text = "Step 1: Start traveling to The Temple of Uggalepih (J-11) in Yhoator Jungle. \n \n" ..
                       "Elshimo Uplands Outpost warp will get you there quickly if you have it! \n \n" ..
                       "Otherwise follow the arrows from Kazham through Yuhtunga Jungle and Yhoator Jungle. \n \n",
                route_to = "Yhoator Jungle",
                destination_highlight = {position = "J-11", offsetX = 16, offsetY = 16},
                zone_trigger = "Temple of Uggalepih",
                zone_max_distance = 35,
                visual_zones = {
                    -- Kazham -> Yuhtunga Jungle
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
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        highlights = {
                            { position = "F-5", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Temple of Uggalepih",
                        floor_id = 1,
                    },
                },
            },
            {
                text = "Step 2: Head back out to Yhoator Jungle via (F-5) exit, once outside of the temple go west back into exit3 - this will take you BACK into the Temple of Uggalepih (map2).\n \n" ..
                       "Follow the arrows back into the temple again if lost! \n \n" ..
                       "Run to the Granite Door (I-10) to the south and kill the Temple Guardian to open the door - run through quick or you will have to kill the Temple Guardian again",
                kill_requirement = {
                    count = 1,
                    enemies = {"Temple Guardian"},
                    zone = "Temple of Uggalepih",
                    count_party_kills = true
                },
                visual_zones = {
                    -- Floor 0 Yhoator
                    --1
                    { type = 'arrow', center = { x = 32.5, y = -10, z = -454.1 }, size = 4, direction = 'left',floor_id = 0 },
                    --2
                    { type = 'arrow', center = { x = 8.0, y = -10, z = -453.7 }, size = 4, direction = 'down',floor_id = 0 },
                },
                zone_name = "Yhoator Jungle",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        highlights = {
                            { position = "F-5", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Temple of Uggalepih",
                        floor_id = 1,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        highlights = {
                            { position = "H-11", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Yhoator Jungle",
                        floor_id = 0,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        highlights = {
                            { position = "I-10", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Temple of Uggalepih",
                        floor_id = 2,
                    },
                },
            },
            {
                text = "Step 3: Enter the large room and take northeast exit and make your way to (I-7)! \n \n" ..
                       "You will have to navigate through a Granite Door, and you will find yourself in a room with paintings. \n \n" ..
                       "Click on the painting on the east wall only ONCE and do NOT confirm the second message just yet. \n \n" ..
                       "It should say 'There is a blank canvas in this frame. The Paintbrush of souls begins to twitch.' \n \n" ..
                       "You should then see 'By focusing your thoughts on the paintbrush of souls, a new painting begins to appear on the canvas...' DO NOT CLICK YET - wait about 30seconds and the screen should flash white! Then you can click! \n \n" ..
                       "Note: Will be safer to clear the Tonberries out as they will aggroe level 75s. \n \n",
                trigger_on_talk = " Den of Rancor has opened!",
                onmob_target = "templeugg2-zm4-eastpainting",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        highlights = {
                            { position = "I-7", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Temple of Uggalepih",
                        floor_id = 2,
                    },
                },
            },
            {
                text = "Step 4: A door has opened on your left side - look for an arrow, that will lead to the Den of Rancor.",
                visual_zones = {
                    { type = 'arrow', center = { x = -54.4, y = -0, z = 20.2 }, size = 4, direction = 'right',floor_id = 2 },
                },
                zone_name = "Temple of Uggalepih",
                zone_trigger = "Den of Rancor",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        highlights = {
                            { position = "J-7", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Temple of Uggalepih",
                        floor_id = 2,
                    },
                },
            },
            {
            text = "Step 5: Den of Rancor - Light 4 torches to open the gate. Make sure to read ALL of the steps - Items are RARE/EX, so repeat this cycle x4:\n \n" ..
                "Tip: Having someone with the Home Point open the gate is strongly recommended.\n \n" ..
                "[1] Kill a Tonberry Imprecator (G-6) for an Unlit Lantern (skip if you have one - after 1st cycle you should have an Unlit Lantern returned to you!).\n \n" ..
                "[2] Trade to the Altar of Rancor (E-5) Map 1 for a Rancor Flame.\n" ..
                "    !! Only THIS Altar works - deeper Altars produce the wrong flame.\n \n" ..
                "[3] Head to Map 2 via the drop at (F-7).\n \n" ..
                "[4] Trade the Rancor Flame to a torch (E-5) Map 2 — torch lit, Unlit Lantern returned run back up to light the next Unlit Lantern - rinse repeat till all are lit and door opens!\n \n" ..
                "Notes: You cannot trade while Invisible. If you loot an Unlit Lantern mid-fight while holding a Rancor Flame, drop it before trading.\n \n" ..
                "WARNING: The exit switch unlights all torches! If others are present, wait for them to go through first. Get the Home Point on the other side!\n \n",
                zone_trigger = "Sacrificial Chamber",
                visual_zones = {
                    {
                        type = 'square',
                        center = { x = -78.3, y = 15.4, z = -0.5 },
                        size = 1,
                        floor_id = 1  -- Optional: only show on floor 1
                    },
                    {
                        type = 'square',
                        center = { x = -63.2, y = 45.7, z = 26.5 },
                        size = 2,
                        floor_id = 2  -- Optional: only show on floor 1
                    },
                    {
                        type = 'square',
                        center = { x = -56.9, y = 46, z = 26.5 },
                        size = 2,
                        floor_id = 2  -- Optional: only show on floor 1
                    },
                    {
                        type = 'square',
                        center = { x = -65.1, y = 45.9, z = 21 },
                        size = 2,
                        floor_id = 2  -- Optional: only show on floor 1
                    },
                    {
                        type = 'square',
                        center = { x = -54.9, y = 45.9, z = 21 },
                        size = 2,
                        floor_id = 2  -- Optional: only show on floor 1
                    },
                    { type = 'arrow', center = { x = -9.6, y = 16.6, z = -61.5 }, size = 4, direction = 'se',floor_id = 1 },

                },
                zone_name = "Den of Rancor",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        highlights = {
                            { position = "E-5", offsetX = 16, offsetY = 16, label = "2" },
                            { position = "F-7", offsetX = 16, offsetY = 16 ,  label = "3" },
                            { position = "G-6", offsetX = 16, offsetY = 16 ,  label = "1" },
                        },
                        zone_name = "Den of Rancor",
                        floor_id = 1,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        highlights = {
                            { position = "E-5", offsetX = 16, offsetY = 16, label = "4"},
                            { position = "D-4", offsetX = 16, offsetY = 16, label = "X"},
                        },
                        zone_name = "Den of Rancor",
                        floor_id = 2,
                    },
                },
            },
            {
                text = "Step 6: Inside the Sacrificial Chamber, examine the Mahogany Door to enter the Battlefield.\n \n" ..
                    "Level 99 cap, 6 players max. All buffs wear on entry (including Reraise) — no EXP loss.\n \n" ..
                    "Defeat all three Tonberry NMs. Recommended order:\n" ..
                    "[1] Grav'iton (Thief - crown on head). Immune to sleep - kill first while sleeping/silencing the others.\n" ..
                    "    Warning: At ~25% HP may use Everyone's Rancor, which can one-shot if your Tonberry hate is high.\n" ..
                    "[2] Molyb'iton (Black Mage).\n" ..
                    "[3] Tungs'iton (Summoner). Has a random elemental pet that dies with it - no need to kill the pet.\n" ..
                    "    Warning: At ~25% HP will use Astral Flow (~700-800 damage max). Heal up before waking the elemental.\n \n" ..
                    "Soloable by most jobs at 99. Clearing gives a cutscene and Key Item: Dark Fragment.\n" ..
                    "Exiting zones you to Temple of Uggalepih Map 2 (NW room).\n",
                kill_requirement = {
                    count = 3,
                    enemies = {"Grav'iton", "Molyb'iton", "Tungs'iton"},
                    count_party_kills = true,
                    reset_on_zone_entry = true,
                },
                trigger_on_keyitem_obtain = {246},
            },
        },
        reward = {
            text = "Key Item: Dark Fragment",
        }
    },

    ["ZM05: Headstone Pilgrimage"] = {
        prerequisites = {
            {category = "Missions", subfile = "Zilart", name = "ZM04: The Temple of Uggalepih"},
        },
        steps = {
            {
                text = "Step 1: [Water Fragment] — La Theine Plateau\n \n" ..
                    "You need to collect 8 Fragments from across Vana'diel. The Dark Fragment from ZM4 already counts — 7 more to go.\n \n" ..
                    "Note: At battle headstones only one party member needs to examine to spawn the NMs. You have 15 minutes to collect your fragment after defeating them.\n \n" ..
                    "The Cermet Headstone is at (G-11) in La Theine Plateau — no battle required here.\n \n" ..
                    "Fastest: Geomagnetic Fount to La Theine Plateau (arrives at H-10), then run SW to (G-11).\n \n" ..
                    "Run mode: Enter Ordelle's Caves from La Theine Plateau at (F-7) - Look for my wee arrows!\n \n",
                route_to = "La Theine Plateau",
                zone_trigger = "Ordelle's Caves",
                destination_highlight = {position = "F-7", offsetX = 16, offsetY = 16},
                visual_zones = {
                    { type = 'arrow', center = { x = -285.8, y = 9.4, z = 289.0 }, size = 4, direction = 'nw',floor_id = 0 },
                    { type = 'arrow', center = { x = -298.0, y = 25.5, z = 348.4 }, size = 4, direction = 'sw',floor_id = 0 },
                },
                zone_name = "La Theine Plateau",
            },
            {
                text = "Step 2: [Water Fragment] — Enter Ordelle's Cave! \n \n" ..
                    "[1] Once inside Ordelle's Cave head east initially and then south to (I-6)! \n \n" ..
                    "[2] Next we will go to (H-9) on the next map! \n \n" ..
                    "[3] This will lead back to the intial map, we want to go to (H-11) in the SOUTH-EAST room and drop down marked hole. \n \n" ..
                    "Notes: Make sure to NOT fall down the first hole, we will mark the correct hole with a SQUARE. \n \n" ..
                    "[4] Head east to (H-11) to the next map.. \n \n" ..
                    "[5] Last map in the caves, head to (G-10) which will zone you ou to La Theine Plateau ! \n \n",

                visual_zones = {
                    { type = 'arrow', center = { x = -89.9, y = 0.3, z = 589.6 }, size = 4, direction = 'right',floor_id = 1 },
                    { type = 'arrow', center = { x = -145.0, y = 32.1, z = 180.0 }, size = 4, direction = 'right',floor_id = 15 },
                    { type = 'arrow', center = { x = -22.3, y = 32.3, z = 149.2 }, size = 4, direction = 'down',floor_id = 15 },
                    { type = 'arrow', center = { x = -31.6, y = 0.6, z = -8.4 }, size = 4, direction = 'se',floor_id = 1 },
                    { type = 'square', center = { x = -45.6, y = 0.5, z = -74.6 }, size = 7,floor_id = 1 },
                    { type = 'arrow', center = { x = -39.9, y = 28.1, z = -73.6 }, size = 4, direction = 'right',floor_id = 15 },
                    { type = 'arrow', center = { x = -60.2, y = -27.3, z = 55.5 }, size = 4, direction = 'down',floor_id = 2 },
                    { type = 'arrow', center = { x = -100.1, y = -27.5, z = -179.6 }, size = 4, direction = 'left',floor_id = 2 },
                },
                zone_name = "Ordelle's Caves",
                zone_trigger = "La Theine Plateau",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        highlights = {
                            { position = "I-6", offsetX = 16, offsetY = 16, label = "1"},
                            { position = "H-11", offsetX = 16, offsetY = 16, label = "3"},
                        },
                        floor_id = 1,
                        zone_name = "Ordelle's Caves",
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        highlights = {
                            { position = "H-9", offsetX = 16, offsetY = 16, label = "2"},
                            { position = "I-11", offsetX = 16, offsetY = 16, label = "4"},
                        },
                        floor_id = 15,
                        zone_name = "Ordelle's Caves",
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        highlights = {
                            { position = "G-10", offsetX = 16, offsetY = 16, label = "5"},
                        },
                        floor_id = 2,
                        zone_name = "Ordelle's Caves",
                    },
                },
            },
             {
                text = "Step 3: [Water Fragment] - Final ! \n \n" ..
                       "Run to the Cermet Headstone and clicky for your first Key Item: Water Fragment!! \n \n",
                keyitems_needed = {240},
                trigger_on_keyitem_obtain = {240},
                onmob_target = "zm4-la-theine-cermet-headstone",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        highlights = {
                            { position = "G-11", offsetX = 16, offsetY = 16,},
                        },
                        floor_id = 0,
                        zone_name = "La Theine Plateau",
                    },

                },
            },
            {
                text = "Step 4 [Ice Fragment] - Travel To Fei'Yin!\n \n" ..
                    "Fastest: Home Point #2 in Fei'Yin — short walk north to the Cloister.\n" ..
                    "Alternative: Home Point #1 in Fei'Yin, use Sneak navigating to (G-9).\n" ..
                    "Mini Tuning Fork of Ice holders can warp directly from Northern San d'Oria.\n \n" ..
                    "If running follow route to Fei'Yin! \n \n",
                keyitems_needed = {244},
                route_to = "Beaucedine Glacier",
                destination_highlight = {position = "J-4", offsetX = 16, offsetY = 16},
                zone_trigger = "Fei'Yin",
            },
            {
                text = "Step 5 [Ice Fragment] - Inside Fei'Yin -> Cloister of Frost\n \n" ..
                    "Once inside Fei'Yin head to (G-9), and then run to (I-5) near the Cloister of Frost \n \n" ..
                    "Notes: Remember to Sneak up! \n \n",
                visual_zones = {
                    { type = 'arrow', center = { x = -78.8, y = -15.6, z = -73.4 }, size = 4, direction = 'ne',floor_id = 1 },
                    { type = 'arrow', center = { x = -20.6, y = -16, z = -61.1 }, size = 4, direction = 'right',floor_id = 1 },
                    { type = 'arrow', center = { x = -18.8, y = -16, z = -18.9 }, size = 4, direction = 'left',floor_id = 1 },
                },
                zone_name = "Fei'Yin",
                zone_trigger = "Cloister of Frost",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        highlights = {
                            { position = "G-9", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Fei'Yin",
                        floor_id = 1,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        highlights = {
                            { position = "I-5", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Fei'Yin",
                        floor_id = 15,
                    },
                },
            },
            {
                text = "Step 6 [Ice Fragment] - Cloister of Frost -> Cermet Headstone \n \n" ..
                       "Once inside Cloister of Frost, run past the protocrystal and click on the Cermet Headstone. \n \n",
                trigger_on_keyitem_obtain = {244},
                onmob_target = "cloister-of-frost-zm5-cermet-headstone",

            },
            {
                text = "Step 7: [Earth Fragment] - Western Altepa Desert \n \n" ..
                    "Fastest: Unity Teleport (Content Level 125) to Western Altepa Desert - drops you right above the pit.\n \n" ..
                    "Otherwise: Enter Quicksand Caves at (J-9).",
                route_to = "Western Altepa Desert",
                destination_highlight = {position = "J-9", offsetX = 16, offsetY = 16},
                keyitems_needed = {241},
                visual_zones = {
                    { type = 'arrow', center = { x = 127.8, y = 1.1, z = -218.6 }, size = 4, direction = 'right' },
                },
                zone_name = "Western Altepa Desert",
                zone_trigger = "Quicksand Caves",
                --trigger_on_keyitem_obtain = {570}, -- TODO: verify Earth Fragment key item ID
            },
            {
                text = "Step 8: [Earth Fragment] - Quicksand Caves \n \n" ..
                    "After zoning, drop down through the sand pit at (K-6) then head east to re-enter Western Altepa Desert.\n \n",
                visual_zones = {
                    {
                        type = 'square',
                        center = { x = 217.3, y = 6.3, z = -15.5 },
                        size = 5,
                        floor_id = 3  -- Optional: only show on floor 1
                    },
                },
                zone_name = "Quicksand Caves",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 8,
                        highlights = {
                            { position = "K-6", offsetX = 16, offsetY = 16, label = "1" },
                            { position = "N-4", offsetX = 16, offsetY = 16, label = "2" },
                        },
                        zone_name = "Quicksand Caves",
                        floor_id = 3,
                    },
                },
                zone_trigger = "Western Altepa Desert",
            },
            {
                text = "Step 9: [Earth Fragment] - Re-entering Western Altepa Desert. \n \n" ..
                       "Drop down and follow the below ground level path/tunnel to (H-9) and touch the Cermet Headstone.\n \n",
                visual_zones = {
                     { type = 'arrow', center = { x = 140.5, y = 10.2, z = -19.6 }, size = 4, direction = 'down' },
                     { type = 'arrow', center = { x = 58.9, y = 10.2, z = -99.6 }, size = 4, direction = 'left' },
                     { type = 'arrow', center = { x = -19.2, y = 10.2, z = -76.2 }, size = 4, direction = 'down' },
                },
                zone_name = "Western Altepa Desert",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 9,
                        highlights = {
                            { position = "H-9", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Western Altepa Desert",
                    },
                },
                trigger_on_keyitem_obtain = {241},
                onmob_target = "western-altepa-desert-zm5-cermet-headstone",
            },
            {
                text = "Step 10 [Fire Fragment] - Journey to Ifrit's Cauldron! \n \n" ..
                    "Bring 3+ Ice Clusters[Crystals] just to be safe, optionally a Garnet[Materials > Goldsmithing] . Everyone needs Sneak and Invisible — Bombs detect magic use.\n \n" ..
                    "Fastest start: Survival Guide to Yhoator Jungle (G-6) entrance of Ifrit's Cauldron.\n \n" ..
                    "Otherwise let's head to Yhoator Jungle (G-6) and enter Ifrit's Cauldron. \n \n" ..
                    "Follow the Arrows from Kazham into Yuhtunga Jungle if you don't know the way to (G-6)!!",
                route_to = "Yhoator Jungle",
                destination_highlight = {position = "G-6", offsetX = 16, offsetY = 16},
                zone_trigger = "Ifrit's Cauldron",
                items_needed = {
                    { item = "Ice Cluster", quantity = 3 },
                    { item = "Garnet", quantity = 1, optional = true },
                },
                visual_zones = {
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -160.6, y = 0, z = 362.3 }, size = 4, direction = 'ne' },
                    { zone_name = "Yuhtunga Jungle", type = 'square', center = { x = -94.8, y = 0, z = 418.3 }, size = 7 },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -94.1, y = 11.2, z = 419.1 }, size = 4, direction = 'sw' },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = 16.3, y = 1.1, z = 262.5 }, size = 4, direction = 'down' },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = 30.7, y = 0, z = 222.1 }, size = 4, direction = 'sw' },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = 20.9, y = 4.5, z = 139.6 }, size = 4, direction = 'down' },
                    -- Yhoator Jungle shapes go here
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = -218.0, y = 1.3, z = 176.9 }, size = 4, direction = 'down' },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = -167.1, y = 0, z = 58.4 }, size = 4, direction = 'sw' },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = -161.4, y = 0.8, z = 15 }, size = 4, direction = 'ne' },
                },
            },
            {
                text = "Step 11 [Fire Fragment] - Ifrit's Cauldron - Yuhtunga Jungle\n \n" ..
                    "Route:\n" ..
                    "  Map 4: Enter at (G-6) - head to (H-8) - Map 7\n" ..
                    "  Map 7: (D-12) - Map 5 \n" ..
                    "  Map 5: (J-8) - Map 2. Flame Spout at (H-6)/(H-7) - trade Ice Cluster or wait ~5 min.\n" ..
                    "  Map 2: (E-7) - Map 7 \n" ..
                    "  Map 7: (G-7) - Map 8 \n" ..
                    "  Map 8: Follow tunnel to (C-7) - exit to Yuhtunga Jungle. Two more Flame Spouts on the way.\n \n" ..
                    "  Ash Dragon near the end has wide detection — time your entry when it moves away.\n \n",
                visual_zones = {
                    { zone_name = "Ifrit's Cauldron", type = 'arrow', center = { x = -58.8, y = 20.3, z = 20.5 }, size = 4, direction = 'up' },
                },
                zone_trigger = "Yuhtunga Jungle",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 11,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Ifrit's Cauldron",
                        floor_id = 4,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 11,
                        highlights = {
                            { position = "D-12", offsetX = 16, offsetY = 16, label="1" },
                            { position = "G-7", offsetX = 16, offsetY = 16, label="2" },
                        },
                        zone_name = "Ifrit's Cauldron",
                        floor_id = 16,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 11,
                        highlights = {
                            { position = "J-8", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Ifrit's Cauldron",
                        floor_id = 5,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 11,
                        highlights = {
                            { position = "E-7", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Ifrit's Cauldron",
                        floor_id = 2,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 11,
                        highlights = {
                            { position = "C-7", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Ifrit's Cauldron",
                        floor_id = 17,
                    },
                },
            },
            {
                text = "Step 12 [Fire Fragment] - Back to Yuhtunga Jungle! \n \n" ..
                       "Once back in Yuhtunga Jungle, take a left until you find a passage way towards (L-7). \n \n" ..
                       "Click on the Cermet Headstone and prepare for Battle! \n \n" ..
                       "Two Opo-Opos will spawn both Level 65 named: Carthi and Tipha. Both immune to Sleep and Lullaby. \n",
                visual_zones = {
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = 381.3, y = 20.3, z = 317.3 }, size = 4, direction = 'se' },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = 395.6, y = 20.2, z = 296.5 }, size = 4, direction = 'right' },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = 419.2, y = 20.1, z = 305.4 }, size = 4, direction = 'right' },
                },
                trigger_zones = {
                    { zone_name = "Yuhtunga Jungle", type = 'square', center = {  x = 493.8, y = 20.7, z = 303.5 }, size = 3, colour = "yellow" },
                },
                onmob_target = "yuhtunga-jungle-zm5-cermet-headstone",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 12,
                        highlights = {
                            { position = "L-7", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Yuhtunga Jungle",
                    },
                },
            },
            {
                text = "Step 13 [Fire Fragment] - Fight commences - Carthi and Tipha. \n \n" ..
                       "Make sure you get in close and click the Cermet Headstone - defeat both Opo-Opos! NO MERCY! \n \n",
                visual_zones = {
                 { zone_name = "Yuhtunga Jungle", type = 'square', center = {  x = 493.8, y = 20.7, z = 303.5  }, size = 3, colour = "green" },
                },
                kill_requirement = {
                    count = 2,
                    enemies = {"Carthi", "Tipha"},
                    count_party_kills = true,
                    reset_on_zone_entry = true,
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 13,
                        highlights = {
                            { position = "L-7", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Yuhtunga Jungle",
                    },
                },
            },
            {
                text = "Step 14 [Fire Fragment] - Obtain the Fire Fragment! \n \n" ..
                       "Click on the Cermet Headstone once more to receive the Fire Fragment.  \n \n" ..
                       "Note: Now is also the time to trade the Garnet to the Cermet Headstone to obtain an Opo-opo Necklace(good for Maat!) \n",
                onmob_target = "yuhtunga-jungle-zm5-cermet-headstone",
                keyitems_needed = {239},
                trigger_on_keyitem_obtain = {239},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 14,
                        highlights = {
                            { position = "L-7", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Yuhtunga Jungle",
                    },
                },
            },
            {
                text = "Step 15 [Wind Fragment] - Head to Cape Teriggan\n \n" ..
                    "Fastest: Home Point #1 at Cloister of Gales, or Unity warp (Level 128).\n \n" ..
                    "Enter the uncharted tunnel at (F-7), and make your way to the Cermet Headstone at (H-5).\n \n" ..
                    "Note: Optional to grab a Rain Lily[Materials > Alchemy] item to trade it for a Flagellant's Rope. \n",
                items_needed = {
                    { item = "Rain Lily", quantity = 1, optional = true },
                },
                keyitems_needed = {242},
                route_to = "Cape Teriggan",
                destination_highlight = {position = "H-5", offsetX = 16, offsetY = 16},
                onmob_target = "cape-teriggan-zm5-cermet-headstone",
                visual_zones = {
                    { zone_name = "Cape Teriggan", type = 'arrow', center = { x = -67.1, y = -0.2, z = 31.4 }, size = 4, direction = 'ne' },
                    { zone_name = "Cape Teriggan", type = 'arrow', center = { x = 60.7, y = -1.9, z = 209.9 }, size = 4, direction = 'nw' },
                    { zone_name = "Cape Teriggan", type = 'arrow', center = { x = -95.7, y = -9.4, z = 226.1 }, size = 4, direction = 'left' },
                    { zone_name = "Cape Teriggan", type = 'arrow', center = { x = -190.2, y = -7.3, z = 208.8 }, size = 4, direction = 'sw' },
                    { zone_name = "Cape Teriggan", type = 'arrow', center = { x = -200.3, y = 0, z = 438.8 }, size = 4, direction = 'right' },
                },
                trigger_zones = {
                    { zone_name = "Cape Teriggan", type = 'square', center = {   x = -109.2, y = -8.5, z = 453.8 }, size = 3, colour = "yellow" },
                },
            },
            {
                text = "Step 16 [Wind Fragment] - Prepare for Battle!\n \n" ..
                    "BATTLE: Get in close and click the Cermet Headstone, a Shadow named Axesarion the Wanderer will spawn.\n \n" ..
                    "Uses Dimensional Death frequently. Immune to Stun. Nearby Goblins respawn every 5 minutes. \n \n",
                kill_requirement = {
                    count = 1,
                    enemies = {"Axesarion the Wanderer"},
                    count_party_kills = true,
                },
                visual_zones = {
                    { zone_name = "Cape Teriggan", type = 'square', center = {   x = -109.2, y = -8.5, z = 453.8 }, size = 3, colour = "green" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 16,
                        highlights = {
                            { position = "H-5", offsetX = 16, offsetY = 16},
                        },
                        zone_name = "Cape Teriggan",
                    },
                },
            },
            {
                text = "Step 17 [Wind Fragment] - Obtain the Wind Fragment!\n \n" ..
                    "Click the Cermet Headstone once more \n \n" ..
                    "Note: Remember to trade the optional Rain Lily for a Flagellant's Rope if you haven't already! \n \n",
                trigger_on_keyitem_obtain = {242},
                onmob_target = "cape-teriggan-zm5-cermet-headstone",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 17,
                        highlights = {
                            { position = "H-5", offsetX = 16, offsetY = 16},
                        },
                        zone_name = "Cape Teriggan",
                    },
                },
            },
            {
                text = "Step 18 [Lightning Fragment] - Head to Behemoths Dominion! \n \n" ..
                    "Fastest: Unity warp (Level 135).\n \n" ..
                    "Go to (D-5) in Qufim Island and go down the left tunnel it will lead you to Behemoth's Dominion.\n \n",
                route_to = "Behemoth's Dominion",
                destination_highlight = {position = "G-9", offsetX = 16, offsetY = 16},
                onmob_target = "behemoth's-dominion-zm5-cermet-headstone",
                keyitems_needed = {243},
                trigger_zones = {
                    { zone_name = "Behemoth's Dominion", type = 'square', center = {   x = -74.8, y = -4, z = -89.2 }, size = 3, colour = "yellow" },
                },
            },
             {
                text = "Step 19 [Lightning Fragment] - Prepare for Battle!\n \n" ..
                    "BATTLE: Get in close and click the Cermet Headstone, two Weapons will spawn - Legendary Weapon(RDM) and Ancient Weapon(WAR).\n \n" ..
                    "You tehcnically only have to kill the Ancient Weapon but easier and faster to kill both - Can pop both with Sneak up and they will not attack. \n \n",
                kill_requirement = {
                    count = 2,
                    enemies = {"Legendary Weapon", "Ancient Weapon"},
                    count_party_kills = true,
                    reset_on_zone_entry = true,
                },
                visual_zones = {
                    { zone_name = "Behemoth's Dominion", type = 'square', center = {   x = -74.8, y = -4, z = -89.2 }, size = 3, colour = "green" },
                },
                route_to = "Behemoth's Dominion",
                destination_highlight = {position = "G-9", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 20 [Lightning Fragment] - Obtain the Lightning Fragment!\n \n" ..
                    "Click the Cermet Headstone once more for the Lightning Fragment.\n \n",
                onmob_target = "behemoth's-dominion-zm5-cermet-headstone",
                trigger_on_keyitem_obtain = {243},
                route_to = "Behemoth's Dominion",
                destination_highlight = {position = "G-9", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 21 [Light Fragment] - The Sanctuary of Zi'Tah \n \n" ..
                    "Head to the SE corner of (J-9), take the hidden path north to the top-right of (J-9), then hug left along the uncharted path to (I-7).\n \n",
                keyitems_needed = {245},
                route_to = "The Sanctuary of Zi'Tah",
                destination_highlight = {position = "I-7", offsetX = 16, offsetY = 16},
                onmob_target = "sanctuary-of-zitah-zm5-cermet-headstone",
                visual_zones = {
                    { zone_name = "The Sanctuary of Zi'Tah", type = 'arrow', center = { x = 418.8, y = 0.9, z = -35.4 }, size = 4, direction = 'left' },
                },
                trigger_zones = {
                    { zone_name = "The Sanctuary of Zi'Tah", type = 'square', center = {   x = 231.8, y = 0, z = 279.9 }, size = 5, colour = "yellow" },
                },
            },
            {
                text = "Step 22 [Light Fragment] - Prepare for Battle!\n \n" ..
                    "BATTLE: Get in close and click the Cermet Headstone, a Doomed named Doomed Pilgrims(Level 70) - considered the hardest headstone fight. Hits hard and fast. High evasion recommended.\n \n",
                route_to = "The Sanctuary of Zi'Tah",
                destination_highlight = {position = "I-7", offsetX = 16, offsetY = 16},
                visual_zones = {
                    { zone_name = "The Sanctuary of Zi'Tah", type = 'square', center = {   x = 231.8, y = 0, z = 279.9 }, size = 5, colour = "green" },
                },
                kill_requirement = {
                    count = 1,
                    enemies = {"Doomed Pilgrims"},
                    count_party_kills = true,
                },
            },
            {
                text = "Step 23 [Light Fragment] - Obtain Light Fragment! \n \n" ..
                    "Once again after defeating the Doomed Pilgrims click the Cermet Headstone for the final Light Fragment.\n \n" ..
                    "Congratulations on obtaining all 8 Fragments!",
                route_to = "The Sanctuary of Zi'Tah",
                destination_highlight = {position = "I-7", offsetX = 16, offsetY = 16},
                onmob_target = "sanctuary-of-zitah-zm5-cermet-headstone",
                keyitems_needed = {245},
            },
        },
        reward = {
            text = "Key Items: Fire, Earth, Water, Wind, Ice, Lightning & Light Fragments\nTitle: Bearer of the Eight Prayers",
        }
    },
    ["ZM06: Through the Quicksand Caves"] = {
        prerequisites = {
            {category = "Missions", subfile = "Zilart", name = "ZM05: Headstone Pilgrimage"},
            {category = "Quests", subfile = "Eastern Altepa Desert", name = "Open Sesame"},
        },
        steps = {
            {
                text = "Step 1: Head to Quicksand Caves via Western Altepa Desert.\n \n" ..
                       "Fastest: Home Point #1 of Quicksand Caves warps you directly to the Chamber of Oracles entrance — skip to Step 3 if you have it!\n \n" ..
                       "Otherwise: Head to (C-11) of Western Altepa Desert. There's a small tunnel at (D-11) — enter it and drop down the ramp at (D-12) into Quicksand Caves.\n \n" ..
                       "Bring Sneak — Antica and Sabotenders aggro in the caves. There is a Grounds Tome at the entrance for Circumspection.\n \n",
                route_to = "Western Altepa Desert",
                keyitems_needed = {2051},
                destination_highlight = {position = "C-11", offsetX = 16, offsetY = 16},
                visual_zones = {
                    { zone_name = "Western Altepa Desert", type = 'arrow', center = { x = -833.6, y = -8.8, z = -605.8 }, size = 4, direction = 'se', floor_id = 0 },
                    { zone_name = "Western Altepa Desert", type = 'arrow', center = { x = -802, y = -19.1, z = -698.6 }, size = 4, direction = 'up', floor_id = 0 },
                    { zone_name = "Western Altepa Desert", type = 'arrow', center = { x = -779.9, y = -16.6, z = -616.3 }, size = 4, direction = 'down', floor_id = 0 },
                    { zone_name = "Western Altepa Desert", type = 'arrow', center = { x = -774, y = -8.4, z = -702.5 }, size = 4, direction = 'right', floor_id = 0 },
                    -- --Quicksand
                    -- { type = 'square', center = { x = -700.1, y = -0.4, z = -380.1 }, size =5, floor_id = 7 }

                },
                zone_trigger = "Quicksand Caves",
            },
            {
                text = "Step 2: Navigate Quicksand Caves to the Chamber of Oracles.\n \n" ..
                       "[1] Travel to (I-9) and step on the circular pad to open the door.\n \n" ..
                       "Requires weight value of 3 OR a Key Item: Loadstone.\n" ..
                       "Weight values: Galka = 3, Hume/Mithra/Elvaan = 2, Tarutaru = 1.\n \n" ..
                       "[2] Head west to the pad at (H-7) to open the next door.\n \n" ..
                       "[3] Enter the next room and drop down the hole at (F-7).\n \n" ..
                       "[4] Hug the left wall with Sneak to reach the Chamber of Oracles zone at (D-4) and grab the home point!.\n \n",
                zone_name = "Quicksand Caves",
                zone_trigger = "Chamber of Oracles",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        highlights = {
                            { position = "I-9", offsetX = 16, offsetY = 16, label = "1" },
                            { position = "H-7", offsetX = 16, offsetY = 16, label = "2" },
                            { position = "F-7", offsetX = 16, offsetY = 16, label = "3" },
                            { position = "D-4", offsetX = 16, offsetY = 16, label = "4" },
                        },
                        floor_id = 4,
                        zone_name = "Quicksand Caves",
                    },
                },
            },
            {
                text = "Step 3: Chamber of Oracles - Examine the Shimmering Circle when ready to enter the fight.\n \n" ..
                       "Level 99 cap, 6 party max. Buffs wear on entry (food stays). No EXP loss on death.\n \n" ..
                       "Defeat 3 Antica in this order:\n" ..
                       "[1] Centurio V-III (PLD) - Immune to Sleep, can heal/buff itself and allies. Kill first.\n" ..
                       "[2] Triarius V-VIII (BLM) - Spams Sleepga. Poison Potions are useful. Can be Silenced.\n" ..
                       "[3] Princeps V-XI (RNG) - Beware Eagle Eye Shot at ~60% HP. Fast attack rate, Blink tanks may struggle.\n \n" ..
                       "Tip: Elemental Seal + Sleepga II works well to open. Dispel Protect/Shell from the PLD.",
                zone_name = "Chamber of Oracles",
                kill_requirement = {
                    count = 3,
                    enemies = {"Centurio V-III", "Triarius V-VIII", "Princeps V-XI"},
                    count_party_kills = true,
                    reset_on_zone_entry = true,
                },
            },
            {
                text = "Step 4: Mission complete!\n \n" ..
                       "After defeating the 3 Antica a cutscene plays and you appear in a new section of the Chamber of Oracles — this is the start of ZM7.\n \n" ..
                       "WARNING: Do NOT leave this room before completing ZM7 tasks. The only way back is to fight the 3 Antica again!\n \n",
                trigger_on_event_id = 32001,
            },
        },
        reward = {
            text = "Mission complete — access to Chamber of Oracles for ZM7",
        }
    },
    ["ZM07: The Chamber of Oracles"] = {
        prerequisites = {
            {category = "Missions", subfile = "Zilart", name = "ZM06: Through the Quicksand Caves"},
        },
        steps = {
            {
                text = "Step 1: Place all 8 Fragments into their pedestals around the central device.\n \n" ..
                       "  Fire Fragment - Pedestal of Fire\n" ..
                       "  Earth Fragment - Pedestal of Earth\n" ..
                       "  Water Fragment - Pedestal of Water\n" ..
                       "  Wind Fragment - Pedestal of Wind\n" ..
                       "  Ice Fragment - Pedestal of Ice\n" ..
                       "  Lightning Fragment - Pedestal of Lightning\n" ..
                       "  Light Fragment - Pedestal of Light\n" ..
                       "  Dark Fragment - Pedestal of Darkness\n \n" ..
                       "After all 8 are placed a cutscene fires automatically.\n" ..
                       "If it does not start, touch any pedestal again.\n \n" ..
                       "WARNING: Do NOT leave this room — the only way back is to redo the ZM6 Antica fight!\n \n",
                zone_name = "Chamber of Oracles",
                keyitems_needed = {239, 241, 240, 242, 244, 243, 245, 246},
                trigger_on_keyitem_obtain = {247},
            },
        },
        reward = {
            text = "Key Item: Prismatic Fragment\nTitle: Lightweaver",
        }
    },
    ["ZM08: Return to Delkfutt's Tower"] = {
        prerequisites = {
            {category = "Missions", subfile = "Zilart", name = "ZM07: The Chamber of Oracles"},
        },
        steps = {
            {
                text = "Step 1: Head to Delkfutt's Tower.\n \n" ..
                       "Fastest: Upper Delkfutt's Tower Home Point #1 - take the transporter on arrival to reach the Stellar Fulcrum on the 12th floor directly.\n \n" ..
                       "Otherwise: Head to Qufim Island and enter Lower Delkfutt's Tower.\n \n" ..
                       "Optional: Talk to Aldo in the Tenshodo (Neptune Spire Inn, Lower Jeuno) for a cutscene with Lion first.\n \n" ..
                       "Optional: Zone into Lower Delkfutt's Tower for a cutscene with Lion, Zeid and Aldo.\n \n",
                route_to = "Qufim Island",
                keyitems_needed = {1111},
                zone_trigger = "Lower Delkfutt's Tower",
                destination_highlight = {position = "F-6", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 2: Navigate Lower Delkfutt's Tower to Upper Delkfutt's Tower.\n \n" ..
                       "Bring Delkfutt Keys (from your nation's 3-3 mission) to use Cermet Doors and skip most of the climb.\n \n" ..
                       "[1] At the first fork go LEFT to (E-8) - stay on the lower level and click the Cermet Door.\n" ..
                       "[2] Head downstairs and follow the path to the next Cermet Door at (J-8).\n" ..
                       "Remember: Sneak/Invisible — bats and giants aggro, dolls and pots aggro to magic.\n \n",
                zone_name = "Lower Delkfutt's Tower",
                zone_trigger = "Upper Delkfutt's Tower",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        highlights = {
                            { position = "E-8", offsetX = 16, offsetY = 16 },
                            --{ position = "J-8", offsetX = 16, offsetY = 16, label = "2" },
                            --{ position = "H-8", offsetX = 16, offsetY = 16, label = "3" },
                        },
                        zone_name = "Lower Delkfutt's Tower",
                        floor_id = 1,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        highlights = {
                            { position = "J-8", offsetX = 16, offsetY = 16},
                            --{ position = "H-8", offsetX = 16, offsetY = 16, label = "3" },
                        },
                        zone_name = "Lower Delkfutt's Tower",
                        floor_id = 15,
                    },
                },
                visual_zones = {
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 374.6, y = 0.3, z = -31.9 }, size = 4, direction = 'left', floor_id = 1  },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 343.5, y = 0, z = 19.5 }, size = 4, direction = 'right', floor_id = 1  },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 538.7, y = 16, z = 19.7 }, size = 4, direction = 'left', floor_id = 15 },
                },
            },
            {
                text = "Step 3: Navigate Upper Delkfutt's Tower to the Stellar Fulcrum.\n \n" ..

                       "[1] Go to (H-8) and examine the ??? to be transported to Upper Delkfutt's Tower.\n" ..
                       "[2] Head through the door at (F-8) and run up the stairs to the 11th floor. \n" ..
                       "[2] On the 11th floor, take the stairs at (J-6) up to the 12th floor.\n" ..
                       "[3] On the 12th floor, go to (F-10) and step through the portal to the Stellar Fulcrum.\n \n" ..
                       "Keep Sneak/Invisible up throughout — bats, giants, dolls and pots all aggro.\n \n",
                zone_name = "Upper Delkfutt's Tower",
                onmob_target = "delkfutts-tower-zm8-lift-???",
                zone_trigger = "Stellar Fulcrum",
                visual_zones = {
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = 374.6, y = 0.3, z = -31.9 }, size = 4, direction = 'left', floor_id = 1  },
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = 343.5, y = 0, z = 19.5 }, size = 4, direction = 'right', floor_id = 1  },
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = 538.7, y = 16, z = 19.7 }, size = 4, direction = 'left', floor_id = 15 },
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = -284.9, y = -143.6, z = 44.3 }, size = 4, direction = 'nw', floor_id = 1  },
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = -298.8, y = -144, z = 60.2 }, size = 4, direction = 'left', floor_id = 1  },
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = -361.5, y = -143.6, z = 73.3 }, size = 4, direction = 'left', floor_id = 1  },
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = -379.3, y = -143.9, z = 6.7 }, size = 4, direction = 'down', floor_id = 1  },
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = -367.4, y = -144, z = -31.4 }, size = 4, direction = 'right', floor_id = 1  },
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = -295, y = -159.4, z = 29.1 }, size = 4, direction = 'ne', floor_id = 2  },
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = -249.8, y = -160, z = 69.6 }, size = 4, direction = 'up', floor_id = 2  },
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = -257.5, y = -175.5, z = 85.2 }, size = 4, direction = 'sw', floor_id = 3  },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Upper Delkfutt's Tower",
                        floor_id = 6,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        highlights = {
                            { position = "F-8", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Upper Delkfutt's Tower",
                        floor_id = 1,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        highlights = {
                            { position = "J-6", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Upper Delkfutt's Tower",
                        floor_id = 2,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        highlights = {
                            { position = "F-10", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Upper Delkfutt's Tower",
                        floor_id = 3,
                    },
                },
            },
            {
                text = "Step 4: Stellar Fulcrum - prepare for the fight.\n \n" ..
                       "A cutscene plays on entry. When ready, examine the 'Qe'lov Gate' at the far end of the chamber for another cutscene, then you enter the battlefield.\n \n" ..
                       "IMPORTANT: Do NOT call Trusts until AFTER the cutscene at the gate - they will be dispelled if called before it.\n \n" ..
                       "Buffs wear on entry. Trusts are permitted after the cutscene. No EXP loss on death.\n \n" ..
                       "~10,000 HP. Immune to Sleep and Silence.\n \n" ..
                       "Key abilities:\n" ..
                       "Elemental Blade - gives him an En-spell that ABSORBS damage of that element. Watch the element and switch accordingly.\n" ..
                       "Great Wheel - ~200 AoE damage and Hate Reset.\n" ..
                       "Light Blade - 700-1200 single target physical damage (blocked by Utsusemi).\n" ..
                       "Dispelga / Silencega / Slowga - Slowga overrides Haste, reapply after.\n \n" ..
                       "After the fight there is a long cutscene (~6 minutes). You return to Stellar Fulcrum when it ends.\n \n" ..
                       "Note: Exit via Upper Delkfutt's Tower and use the Home Point there to head to Norg for ZM9.\n \n",
                zone_name = "Stellar Fulcrum",
                kill_requirement = {
                    count = 1,
                    enemies = {"Kam'lanaut"},
                    count_party_kills = true,
                    reset_on_zone_entry = true,
                },
                trigger_on_event_id = {32001},
            },
        },
        reward = {
            text = "Zilart Rank 8\nTitle: Destroyer of Antiquity",
        }
    },
    ["ZM09: Ro'Maeve"] = {
        prerequisites = {
            {category = "Missions", subfile = "Zilart", name = "ZM08: Return to Delkfutt's Tower"},
        },
        steps = {
            {
                text = "Step 1: Head to Norg (Home Point #1) and examine the Oaken Door at (K-8) for a cutscene.\n \n",
                route_to = "Norg",
                onmob_target = "Norg_OakenDoor",
                destination_highlight = {position = "K-8", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {3},
            },
        },
        reward = {
            text = "Mission log updated - head to Ro'Maeve",
        }
    },
    ["ZM10: The Temple of Desolation"] = {
        prerequisites = {
            {category = "Missions", subfile = "Zilart", name = "ZM09: Ro'Maeve"},
        },
        steps = {
            {
                text = "Step 1: Head to Ro'Maeve and zone into the Hall of the Gods at (H-5).\n \n" ..
                       "Everything in Ro'Maeve aggros to magic - use Silent Oils and Prism Powders (or Spectral Jig/Ninjutsu).\n" ..
                       "You can ride Mounts in Ro'Maeve to avoid aggro entirely if you have one.\n" ..
                       "Watch for golems or bombs near the (H-5) entrance to Hall of the Gods.\n \n",
                route_to = "Ro'Maeve",
                destination_highlight = {position = "H-5", offsetX = 16, offsetY = 16},
                zone_trigger = "Hall of the Gods",
            },
            {
                text = "Step 2: Inside the Hall of the Gods, head to the far end and examine the Cermet Grate.\n \n" ..
                       "Your mission log will update after the cutscene.\n \n",
                zone_name = "Hall of the Gods",
                onmob_target = "hall-of-gods-zm10-gate",
                trigger_on_event_id = {1},
                route_to = "Hall of the Gods",
                destination_highlight = {position = "H-7", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "Mission log updated",
        }
    },
    ["ZM11: The Hall of the Gods"] = {
        prerequisites = {
            {category = "Missions", subfile = "Zilart", name = "ZM10: The Temple of Desolation"},
        },
        steps = {
            {
                text = "Step 1: Head to Norg (Home Point #1) and speak with Gilgamesh.\n \n" ..
                       "Gilgamesh will give a cutscene. Mission complete after the conversation.\n \n",
                route_to = "Norg",
                onmob_target = "Gilgamesh",
                destination_highlight = {position = "K-8", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {169},
            },
        },
        reward = {
            text = "Mission complete — next: The Mithra and the Crystal",
        }
    },
    ["ZM12: The Mithra and the Crystal"] = {
        prerequisites = {
            {category = "Missions", subfile = "Zilart", name = "ZM11: The Hall of the Gods"},
            {category = "Quests", subfile = "Eastern Altepa Desert", name = "Open Sesame"},
        },
        steps = {
            {
                text = "Step 1: Head to Rabao (Home Point #2) and talk to Maryoh Comyujah at the windmill (G-7).\n \n",
                route_to = "Rabao",
                onmob_target = "maryoh-comyujah",
                destination_highlight = {position = "G-7", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {81},
                keyitems_needed = {451, 2051},
            },
            {
                text = "Step 2: Head to Western Altepa Desert and enter Quicksand Caves at D-12.\n \n" ..
                       "The entrance is in a trench at D-12 via an unmapped pathway at the SW corner of D-11.\n \n" ..
                       "Navigate through the caves to reach I-8 on map 7:\n" ..
                       "[1] Stand on the weight pad at K-8 to open the door east (exit at L-8).\n" ..
                       "Requires 1 Galka, 3 Tarutaru, 2 of any other race, or a Loadstone.\n" ..
                       "[2] On the next map pass the door at G-8, then drop into the pit at I-8.\n \n",
                route_to = "Western Altepa Desert",
                visual_zones = {
                    { zone_name = "Western Altepa Desert", type = 'arrow', center = { x = -833.6, y = -8.8,  z = -605.8 }, size = 4, direction = 'se',    floor_id = 0 },
                    { zone_name = "Western Altepa Desert", type = 'arrow', center = { x = -802,   y = -19.1, z = -698.6 }, size = 4, direction = 'up',    floor_id = 0 },
                    { zone_name = "Western Altepa Desert", type = 'arrow', center = { x = -779.9, y = -16.6, z = -616.3 }, size = 4, direction = 'down',  floor_id = 0 },
                    { zone_name = "Western Altepa Desert", type = 'arrow', center = { x = -774,   y = -8.4,  z = -702.5 }, size = 4, direction = 'right', floor_id = 0 },
                },
                zone_trigger = "Quicksand Caves",
                destination_highlight = {position = "D-12", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 3: Go to (K-8) and stand on the pressure plate which will open the door to the East.\n \n" ..
                       "Once the door is open, head through to next map (L-8) \n \n" ..
                       "You can then go to (G-8) and step on the pressure plate to open the next door, then drop down the hole at (I-8) to reach the next map.\n \n" ..
                       "Once you drop down the hole there will be a ??? on a nearby pillar!\n \n",
                zone_name = "Quicksand Caves",
                onmob_target = "zm12-ancient-vessel-qm7",
                trigger_zones = {
                    { zone_name = "Quicksand Caves", type = 'square', center = { x = -506.8, y = 18.5, z = -420.3 }, size = 3, colour = "yellow" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        highlights = {
                            { position = "L-8", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Quicksand Caves",
                        floor_id = 4,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        highlights = {
                            { position = "I-8", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Quicksand Caves",
                        floor_id = 7,
                    },
                },
            },
            {
                text = "Step 4: Touch the ??? at I-8 and select 'Yes' to spawn the Ancient Vessel. Casts many GA spells, but can be stunned! \n \n",
                zone_name = "Quicksand Caves",
                onmob_target = "zm12-ancient-vessel-qm7",
                visual_zones = {
                    { zone_name = "Quicksand Caves", type = 'square', center = { x = -506.8, y = 18.5, z = -420.3 }, size = 3, colour = "green" },
                },
                kill_requirement = {
                    count = 1,
                    enemies = {"Ancient Vessel"},
                    count_party_kills = true,
                    reset_on_zone_entry = true,
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        highlights = {
                            { position = "I-8", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Quicksand Caves",
                        floor_id = 7,
                    },
                },
            },
            {
                text = "Step 5: Touch the ??? again to obtain the Scrap of Papyrus.\n \n" ..
                       "WARNING: If you zone after killing the Ancient Vessel without picking up the Scrap of Papyrus, you must redo the fight.\n \n",
                zone_name = "Quicksand Caves",
                onmob_target = "zm12-ancient-vessel-qm7",
                trigger_on_event_id = {13},
                trigger_on_keyitem_obtain = {451},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        highlights = {
                            { position = "I-8", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Quicksand Caves",
                        floor_id = 7,
                    },
                },
            },
            {
                text = "Step 6: Warp out and return to Maryoh Comyujah in Rabao (G-7) with the Scrap of Papyrus.\n \n" ..
                       "She will trade it for the Cerulean Crystal.\n \n",
                route_to = "Rabao",
                onmob_target = "maryoh-comyujah",
                destination_highlight = {position = "G-7", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {83},
                trigger_on_keyitem_obtain = {452},
            },
            {
                text = "Step 7: Head to the Hall of the Gods and touch the sealed gate for a cutscene.\n \n",
                route_to = "Hall of the Gods",
                onmob_target = "hall-of-gods-zm10-gate",
                destination_highlight = {position = "H-7", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {4},
            },
            {
                text = "Step 8: Continue down the hallway and examine the Shimmering Circle for the final cutscene. \n \n" ..
                       "Welcome to Ru'Aun Gardens(SKY)! \n \n",
                route_to = "Hall of the Gods",
                keyitems_needed = {452},
                onmob_target = "hall-of-gods-zm12-shimmering",
                destination_highlight = {position = "H-4", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {3},
            },
        },
        reward = {
            text = "ZM12 complete — next: The Gate of the Gods",
        }
    },
     ["ZM13: The Gate of the Gods"] = {
        prerequisites = {
            {category = "Missions", subfile = "Zilart", name = "ZM12: The Mithra and the Crystal"},
        },
        steps = {
            {
                text = "Step 1: After clicking on the shimmering circle you will be elevated up a floor, keep heading north to Ru'Aun Gardens! \n \n" ..
                       "This mission will complete on zoning into Ru'Aun Gardens. \n \n",
                route_to = "Hall of the Gods",
                destination_highlight = {position = "H-4", offsetX = 16, offsetY = 16},
                zone_trigger = "Ru'Aun Gardens",
                visual_zones = {
                    { zone_name = "Hall of the Gods",  type = 'arrow', center = { x = -0.0, y = 0.1,  z = 261.3 }, size = 4, direction = 'up', floor_id = 0 },
                    { zone_name = "Hall of the Gods",  type = 'arrow', center = { x = -0.2, y = 0.1,  z = 320.1 }, size = 4, direction = 'up', floor_id = 0 },
                }
            },
        },
        reward = {
            text = "ZM13 complete — next: Ark Angels",
        }
    },
    ["ZM14: Ark Angels"] = {
        prerequisites = {
            {category = "Missions", subfile = "Zilart", name = "ZM13: The Gate of the Gods"},
        },
        steps = {
            {
                text = "Step 1: In Ru'Aun Gardens (Tu'Lia), take the center portal to the main island.\n \n" ..
                       "There is a Survival Guide just to the right of the center portal.\n \n" ..
                       "Head North to the Ru'Avitau Gate at H-8. WARNING: Groundskeepers near blue pads are aggressive to both magic AND sight.\n \n" ..
                       "Enter the Shrine of Ru'Avitau.\n \n",
                route_to = "Ru'Aun Gardens",
                destination_highlight = {position = "H-8", offsetX = 16, offsetY = 16},
                zone_trigger = "The Shrine of Ru'Avitau",
                keyitems_needed = {455, 456, 457, 458, 459},
            },
            {
                text = "Step 2: Inside the Shrine of Ru'Avitau, continue North until you find an unmarked target on the wall. Sneak is needed to avoid Weapon aggro.\n \n" ..
                       "Examine it for a cutscene. If you want to also flag Divine Might (separate quest, Ark Pentasphere reward), click it again after the first cutscene completes.\n \n",
                route_to = "The Shrine of Ru'Avitau",
                onmob_target = "zm14-ark-angel-cs-locale",
                destination_highlight = {position = "H-11", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {53},
            },
            {
                text = "Step 3: Defeat all 5 Ark Angels in La'Loff Amphitheater.\n \n" ..
                       "The battlefields are on the 5 islands surrounding the main Ru'Aun Gardens island, let's go CLOCKWISE following the yellow arrows and jump in the Red Portals.\n \n" ..
                       "To reach a new(bigger) island: Activate a Pincer Stone(Will put blue Arrows/Squares to help locate) and take the Blue Portals, the Red Portals do not require Blue activation to reach the ARK Angels islands. \n \n" ..
                       "TIP: Register all 5 Home Points in Ru'Aun Gardens - they warp you directly to each island section.\n \n" ..
                       "Once all 5 Shards are collected the mission completes automatically.\n \n",
                route_to = "Ru'Aun Gardens",
                destination_highlight = {
                    {position = "F-11", offsetX = 16, offsetY = 16, label = "TT"},
                    {position = "E-7", offsetX = 16, offsetY = 16, label = "MR"},
                    {position = "H-4", offsetX = 16, offsetY = 16, label = "HM"},
                    {position = "K-7", offsetX = 16, offsetY = 16, label = "EV"},
                    {position = "J-11", offsetX = 16, offsetY = 16, label = "GK"},
                },
                kill_requirement = {
                    count = 5,
                    enemies = {"Ark Angel TT", "Ark Angel MR", "Ark Angel EV", "Ark Angel GK", "Ark Angel HM"},
                    count_party_kills = true,
                    reset_on_zone_entry = false,
                },
                trigger_on_keyitem_obtain = {455, 456, 457, 458, 459},
                require_all_keyitems = true,
                onmob_target = {"zm14-la-loff-ark-tt-shimmering-circle",
                                "zm14-la-loff-ark-mr-shimmering-circle",
                                "zm14-la-loff-ark-hm-shimmering-circle",
                                "zm14-la-loff-ark-ev-shimmering-circle",
                                "zm14-la-loff-ark-gk-shimmering-circle"},
                onmob_enemy= {"Ark Angel TT", "Ark Angel MR", "Ark Angel HM", "Ark Angel EV", "Ark Angel GK"},
                visual_zones = {
                    -- ARK TT
                    -- First Pincer left side
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = -4.2, y = -40, z = -427.6 }, size = 4, direction = 'left', floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = -41.1, y = -40, z = -423.3 }, size = 4, direction = 'up', floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = -47.6, y = -32, z = -382.9 }, size = 4, direction = 'up', floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Aun Gardens", type = 'square', center = { x = -49.9, y = -32, z = -370.3 }, size = 8, colour = "cyan" },
                    --Second Pincer right side
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 11.6, y = -40.0, z = -426.9 }, size = 4, direction = "right", floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 50.5, y = -32.0, z = -380.8 }, size = 4, direction = "up", floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Aun Gardens", type = 'square', center = { x = 49.8, y = -32.0, z = -371.4 }, size = 8, colour = "cyan" },
                    -- 1st Portal
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = -3.4, y = -40.0, z = -429.9 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = -44.7, y = -40, z = -429.3 }, size = 4, direction = 'left', floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = -108.8, y = -40, z = -441 }, size = 4, direction = 'left', floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = -297.6, y = -42, z = -409 }, size = 4, direction = 'sw', floor_id = 0, colour = "yellow" },
                    -- ARK MR
                    -- 2nd Island
                    -- #1 Pincer
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = -297.4, y = -24, z = -268.8 }, size = 4, direction = 'ne', floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = -303.6, y = -40, z = -228.4 }, size = 4, direction = 'nw', floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = -316.2, y = -40.2, z = -198.9 }, size = 4, direction = 'up', floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Aun Gardens", type = 'square', center = { x = -318.1, y = -40.2, z = -180 }, size = 8, colour = "cyan" },
                    -- #2 Pincer
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = -395.9, y = -24, z = 39.8 }, size = 4, direction = 'right', floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = -370.1, y = -40.2, z = 3.4 }, size = 4, direction = 'down', floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Aun Gardens", type = 'square', center = { x = -363.2, y = -40.2, z = -40.7 }, size = 8, colour = "cyan" },
                    -- 2nd Portal -> MR
                    -- #1 From South West
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = -299.4, y = -24, z = -266.8 }, size = 4, direction = 'ne', floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = -302.1, y = -40, z = -229.7 }, size = 4, direction = 'sw', floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = -337.9, y = -40.2, z = -248.5 }, size = 4, direction = 'nw', floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = -374.2, y = -40.2, z = -223.5 }, size = 4, direction = 'nw', floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = -441.3, y = -40, z = -43.3 }, size = 4, direction = 'up', floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = -445.7, y = -40, z = 5.6 }, size = 4, direction = 'up', floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = -482.7, y = -42, z = 157 }, size = 4, direction = 'left', floor_id = 0, colour = "yellow" },
                    -- #2 From  West
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = -397.8, y = -24, z = 37.5 }, size = 4, direction = 'right', floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = -382.6, y = -40, z = 10 }, size = 4, direction = 'left', floor_id = 0, colour = "yellow" },

                    --ARK HM
                    -- 3rd Island
                    -- #1 Pincer
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = -344.6, y = -24, z = 200.4 }, size = 4, direction = 'se', floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = -308.5, y = -40, z = 212.3 }, size = 4, direction = 'ne', floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Aun Gardens", type = 'square', center = { x = -268.5, y = -40.2, z = 247.2 }, size = 8, colour = "cyan" },
                    -- #1 Portal
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = -343.8, y = -24, z = 202.9 }, size = 4, direction = 'ne', floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = -314.9, y = -24, z = 246 }, size = 4, direction = 'ne', floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = -343.2, y = -40, z = 259.2 }, size = 4, direction = 'up', floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = -136.3, y = -24, z = 375.7 }, size = 4, direction = 'right', floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = -83.8, y = -24, z = 388.9 }, size = 4, direction = 'down', floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = -106.4, y = -40, z = 360.5 }, size = 4, direction = 'up', floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = -120.3, y = -40, z = 422.8 }, size = 4, direction = 'right', floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 0.2, y = -42, z = 504.2 }, size = 4, direction = 'up', floor_id = 0, colour = "yellow" },
                    -- #2 Pincer
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = -81.8, y = -24, z = 390.9 }, size = 4, direction = 'down', floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = -106.8, y = -40, z = 355.8 }, size = 4, direction = 'left', floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Aun Gardens", type = 'square', center = { x = -150.4, y = -40.2, z = 332.5 }, size = 8, colour = "cyan" },
                    --ARK EV
                    -- 1 Pincer
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 82.6, y = -24.0, z = 388.1 }, size = 4, direction = "down", floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 108.2, y = -40.0, z = 357.7 }, size = 4, direction = "se", floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 140.2, y = -40.2, z = 340.0 }, size = 4, direction = "se", floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Aun Gardens", type = 'square', center = { x = 149.0, y = -40.2, z = 333.5 }, size = 8, colour = "cyan" },
                    -- 2 Pincer
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 343.6, y = -24.0, z = 201.9 }, size = 4, direction = "sw", floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 300.8, y = -40.2, z = 216.5 }, size = 4, direction = "nw", floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 278.4, y = -40.2, z = 236.1 }, size = 4, direction = "nw", floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Aun Gardens", type = 'square', center = { x = 271.1, y = -40.2, z = 244.6 }, size = 8, colour = "cyan" },
                    -- 1 Portal
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 80.8, y = -24.0, z = 389.0 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 107.1, y = -40.0, z = 367.5 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 136.1, y = -40.0, z = 408.5 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 190.3, y = -40.0, z = 406.0 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 328.9, y = -40.0, z = 301.8 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 370.9, y = -40.0, z = 237.7 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 483.5, y = -42.0, z = 158.4 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    --ARK GK
                    --Portal 1
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 10.1, y = -40.0, z = -424.0 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 44.2, y = -40.0, z = -424.7 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 110.2, y = -40.0, z = -441.7 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 169.5, y = -40.0, z = -419.2 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    -- Portal 2
                    -- { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 300.1, y = -24.0, z = -265.0 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    -- { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 298.2, y = -40.0, z = -228.5 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    -- { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 345.3, y = -40.0, z = -264.0 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    -- { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 296.3, y = -42.0, z = -408.4 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    -- Portal 3
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 394.7, y = -24.0, z = 38.0 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 379.2, y = -40.0, z = 9.8 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 426.1, y = -40.0, z = -6.8 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 445.5, y = -40.0, z = -55.0 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 386.4, y = -40.0, z = -220.6 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 297.6, y = -42.0, z = -409.8 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },

                    -- Pincer 1
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 393.4, y = -24.0, z = 39.9 }, size = 4, direction = "left", floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 368.1, y = -40.2, z = -7.4 }, size = 4, direction = "down", floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 362.9, y = -40.2, z = -32.9 }, size = 4, direction = "down", floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Aun Gardens", type = 'square', center = { x = 363.1, y = -40.2, z = -38.6 }, size = 8, colour = "cyan" },
                    -- Pincer 2
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 297.3, y = -24.0, z = -265.7 }, size = 4, direction = "nw", floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 295.4, y = -40.0, z = -226.0 }, size = 4, direction = "ne", floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 311.2, y = -40.2, z = -188.9 }, size = 4, direction = "ne", floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Aun Gardens", type = 'square', center = { x = 316.4, y = -40.2, z = -182.2 }, size = 8, colour = "cyan" },

                },
            },
        },
        reward = {
            text = "ZM14 complete — next: The Sealed Shrine",
        }
    },
    ["ZM15: The Sealed Shrine"] = {
        prerequisites = {
            {category = "Missions", subfile = "Zilart", name = "ZM14: Ark Angels"},
        },
        steps = {
            {
                text = "Step 1: Head to Norg and talk to Gilgamesh (L-8) for a second cutscene.\n \n" ..
                       "Optional: Then head to Lower Jeuno and talk to Aldo in the Tenshodo HQ (J-8) for an extra cutscene.\n \n",
                route_to = "Norg",
                onmob_target = "Gilgamesh",
                destination_highlight = {position = "L-8", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {173},
            },
            {
                text = "Step 2: Return to Ru'Aun Gardens and enter the Shrine of Ru'Avitau from (H-8/9). A cutscene will play automatically on zone-in — this completes the mission.\n \n" ..
                       "Note: After completing the Quest 'Divine Might', if you have not received your Rare/EX earring, re-enter the Shrine here to collect it.\n \n",
                route_to = "Ru'Aun Gardens",
                destination_highlight = {position = "H-8", offsetX = 16, offsetY = 16},
                zone_trigger = "The Shrine of Ru'Avitau",
                visual_zones = {
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 0.2, y = -40.0, z = -394.5 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = -0.2, y = -43.6, z = -202.1 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                }
            },
        },
        reward = {
            text = "ZM15 complete — next: The Celestial Nexus",
        }
    },
    ["ZM16: The Celestial Nexus"] = {
        prerequisites = {
            {category = "Missions", subfile = "Zilart", name = "ZM15: The Sealed Shrine"},
        },
        steps = {
            {
                text = "Step 1: Make sure to READ this section or you will have to backtrack! \n \n" ..
                       "While you're still near the Shrine of Ru'Avitau after ZM15, head inside via the main entrance (H-8 in Ru'Aun Gardens) and go straight north to H-10 on Map 2.\n \n" ..
                       "Touch the yellow Monolith here to open the first yellow door, this saves you having to find a partner to open it later - if someone opens the blue gate before you get through the next phase you will have to come back here.\n \n",
                route_to = "Ru'Aun Gardens",
                destination_highlight = {position = "H-10", offsetX = 16, offsetY = 16},
                --zone_trigger = "Ru'Aun Gardens",
                onmob_target = "zm16-shrine-of-ru-avitau-yellow-monolith",
                trigger_zones = {
                        { zone_name = "The Shrine of Ru'Avitau", type = 'square', center = { x = 7.9, y = -0.4, z = -116.0 }, size = 7, colour = "yellow" },
                },
            },
            {
                text = "Step 2: Head back to Ru'Aun Gardens and go to (I-6) near Genbu's island (Home Point #1 is the quickest). \n \n" ..
                       "Re-enter The Shrine of Ru'Avitau from this entrance to get on Map 2 from the correct side.\n \n",
                route_to = "Ru'Aun Gardens",
                destination_highlight = {position = "I-6", offsetX = 16, offsetY = 16},
                visual_zones = {
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 0.3, y = -43.6, z = -221.3 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 1.1, y = -40.0, z = -425.7 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 39.4, y = -40.0, z = -421.2 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'square', center = { x = 49.8, y = -32.0, z = -371.4 }, size = 8, colour = "cyan" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 53.8, y = -32.0, z = -391.4 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 111.1, y = -24.0, z = -388.4 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 158.7, y = -24.0, z = -381.3 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 153.2, y = -30.0, z = -353.4 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 303.2, y = -24.0, z = -261.2 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 330.4, y = -24.0, z = -225.1 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 374.7, y = -20.0, z = -116.6 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 400.1, y = -24.0, z = -14.2 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 394.0, y = -24.0, z = 35.7 }, size = 4, direction = "left", floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 378.1, y = -40.0, z = 6.1 }, size = 4, direction = "down", floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 374.1, y = -40.0, z = -29.9 }, size = 4, direction = "sw", floor_id = 0, colour = "cyan" },
                    { zone_name = "Ru'Aun Gardens", type = 'square', center = { x = 363.1, y = -40.2, z = -38.6 }, size = 8, colour = "cyan" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 360.8, y = -40.2, z = -30.5 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 366.6, y = -40.0, z = 10.9 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 390.6, y = -24.0, z = 47.1 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },

                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 347.2, y = -24.0, z = 201.7 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 316.5, y = -24.0, z = 244.1 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 230.1, y = -20.0, z = 313.3 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 260.1, y = -8.0, z = 337.6 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Aun Gardens", type = 'arrow', center = { x = 216.7, y = -8.0, z = 298.1 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                },
                trigger_zones = {
                    { zone_name = "The Shrine of Ru'Avitau", type = 'square', center = { x = 240.0, y = -1.7, z = 352.0 }, size = 6, colour = "yellow" },
                },
                --zone_trigger = "The Celestial Nexus",
            },
            {
                text = "Step 3: Keep Sneak up throughout - Weapons aggro. Invisible when you see Aura Statues (Golems), they aggro to sight.\n \n" ..
                       "Route through the Shrine - can follow the arrows:\n" ..
                       "[1] Head south and follow the path to J-7, through the first yellow door (now open).\n" ..
                       "[2] Head west past the second yellow door to the control room at H-7 (2 Monoliths — touch one to open the second door if closed).\n" ..
                       "[3] Head south through the room with 2 Dark Elementals — Sneak only from here.\n" ..
                       "[4] Follow the corridor east or west to the room with 2 Dark Elementals at H-10.\n" ..
                       "[5] Head north and descend the stairs - zone into The Celestial Nexus at H-9.\n \n",
                visual_zones = {
                    { zone_name = "The Shrine of Ru'Avitau", type = 'arrow', center = { x = 239.4, y = -0.1, z = 300.3 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "The Shrine of Ru'Avitau", type = 'arrow', center = { x = 180.0, y = 0.1, z = 300.2 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "The Shrine of Ru'Avitau", type = 'arrow', center = { x = 181.9, y = 0.1, z = 181.8 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "The Shrine of Ru'Avitau", type = 'arrow', center = { x = 121.3, y = 0.2, z = 128.7 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "The Shrine of Ru'Avitau", type = 'arrow', center = { x = 4.2, y = 0.5, z = 118.5 }, size = 4, direction = "se", floor_id = 1, colour = "yellow" },
                    { zone_name = "The Shrine of Ru'Avitau", type = 'arrow', center = { x = 19.6, y = 0.1, z = 60.0 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "The Shrine of Ru'Avitau", type = 'arrow', center = { x = -20.1, y = 0.1, z = -60.3 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "The Shrine of Ru'Avitau", type = 'arrow', center = { x = -11.4, y = -0.0, z = -5.2 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "The Shrine of Ru'Avitau", type = 'arrow', center = { x = -12.1, y = 48.0, z = 6.7 }, size = 4, direction = "nw", floor_id = 15, colour = "yellow" },
                },
                zone_trigger = "The Celestial Nexus",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        highlights = {
                            { position = "H-9", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "The Shrine of Ru'Avitau",
                        floor_id = 1,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        highlights = {
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "The Shrine of Ru'Avitau",
                        floor_id = 15,
                    },
                },

            },
            {
                text = "Step 4: Pass through 4 Celestial Gates in sequence. Do NOT open the 4th gate (sirens in room) until your party is ready - entering immediately starts the fight.\n \n" ..
                       "[FORM 1] Exoplates (~10,000 HP): Eald'narche is invulnerable until the armour shell is destroyed. Sleep the 2 Orbitals - don't kill them, they respawn instantly. Phase Shift fires at ~66/33/1 percent HP (30' AoE physical, Stun, Bind). Rest up before finishing off Eald'narche (~2000 HP) after Exoplates fall.\n \n" ..
                       "[FORM 2] (~2500 HP): Teleports constantly, ~75percent melee resist, extremely fast attacks. Casts Ancient Magic, Sleepga II, Bindga - drink Poison Potions and stun key spells. Hate is random, burn fast. WARNING: Do NOT Reraise inside - instant aggro.\n \n" ..
                       "After the final cutscene you appear in Hall of the Gods. Congratulations!\n \n",
                        onmob_enemy = {"Eald'narche"},
                        onmob_enemy_colour = "red",
                        kill_requirement = {
                            count = 1,
                            enemies = {"Eald'narche"},
                            count_party_kills = true,
                            reset_on_zone_entry = true,
                        },
                        trigger_on_event_id = {32001},
            },
        },
        reward = {
            text = "Rise of the Zilart complete!\nTitle: Burier of the Illusion\nNext: Awakening",
        }
    },
    ["ZM17: Awakening"] = {
        prerequisites = {
            {category = "Missions", subfile = "Zilart", name = "ZM16: The Celestial Nexus"},
        },
        steps = {
            {
                text = "Step 1: Zone into Norg (Home Point #1) - a cutscene with Gilgamesh plays automatically on zone-in.\n \n" ..
                       "Tip: Do Norg first so you end up in Jeuno for the next quest (Shadows of the Departed).\n \n" ..
                       "Optional: Speak with Gilgamesh again after the cutscene for extra dialogue.\n \n",
                route_to = "Norg",
                --onmob_target = "Gilgamesh",
                --destination_highlight = {position = "L-8", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {176},
            },
            {
                text = "Step 2: Head to Lower Jeuno and enter the Neptune's Spire inn (Tenshodo HQ) at (J-8). A cutscene with Aldo triggers automatically inside.\n \n" ..
                       "Both this and the Norg cutscene are required before Shadows of the Departed becomes available.\n \n" ..
                       "Optional: Speak with Aldo, Garnev, Yin Pocanakhu, and Sattal-Mansal after for extra dialogue.\n \n",
                route_to = "Lower Jeuno",
                onmob_target = "Door: Neptune's Spire",
                destination_highlight = {position = "J-8", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {20},
            },
        },
        reward = {
            text = "ZM17 complete — next: Shadows of the Departed",
        }
    },
}
