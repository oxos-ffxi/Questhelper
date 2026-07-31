return {
    -- =========================================================================================
    -- 1) Blade of Darkness (Dark Knight unlock)
    -- =========================================================================================
    ["1.Dark Knight Quest - Blade of Darkness"] = {
        requirements = {
            level = 30,
        },
        steps = {
            {
                text = "Step 1: Speak with Gumbah in Bastok Mines (J-7) until he gives you the cutscene that starts the quest.\n \n" ..
                       "- He is on the upper floor, across the bridge, toward the Alchemy Guild.\n" ..
                       "- You must be Level 30+ on your main job.\n \n" ..
                       "NOTE: Gumbah starts several quests. The Great Sword weaponskill quest 'Inheritance' (Ground Strike)\n" ..
                       "takes priority over this one - check your quest log before you leave to confirm you picked up\n" ..
                       "Blade of Darkness and not something else.\n \n",
                onmob_target = "Gumbah",
                route_to = "Bastok Mines",
                destination_highlight = { position = "J-7", offsetX = 16, offsetY = 16 },
                trigger_on_event_id = { 99 },
            },
            {
                text = "Step 2: Ride the boat in Palborough Mines to Zeruhn Mines for a cutscene and the Chaosbringer.\n \n" ..
                       "===== Getting there =====\n" ..
                       "- Home Point Palborough Mines #1 at (H-10) on map 3 is the fastest route by far - it drops you\n" ..
                       "  a few steps from the boat.\n" ..
                       "- Otherwise: Port Bastok -> North Gustaberg (K-3) -> Palborough Mines. From the entrance take\n" ..
                       "  the elevator at (I-8) on map 1 up to map 3.\n" ..
                       "- Map 3 is the one with the giant burn hole in the centre. The boat lever is at (H-8), very\n" ..
                       "  close to the top of the elevator.\n \n" ..
                       "===== The boat =====\n" ..
                       "- Pull the lever and ride it. Anyone can pull the lever - you only need to make the trip.\n" ..
                       "- It drops you in Zeruhn Mines (a safe zone connected to Bastok Mines), where the cutscene\n" ..
                       "  hands you the Chaosbringer (Lv1 Great Sword, WAR/DRK/RUN).\n \n" ..
                       "WARNING: Make sure you have a free inventory slot BEFORE boarding, or you will have to run all\n" ..
                       "the way back here for another trip.\n \n" ..
                       "TIP: If you ever drop the Chaosbringer, ride the boat again to be given a replacement.\n \n",
                route_to = "Palborough Mines 3",
                destination_highlight = {
                    { position = "I-8",  offsetX = 16, offsetY = 16, floor_id = 1, label = "Elevator", color = "cyan" },
                    { position = "H-8",  offsetX = 16, offsetY = 16, floor_id = 3, label = "Boat",     color = "cyan" },
                    { position = "H-10", offsetX = 16, offsetY = 16, floor_id = 3, label = "HP",       color = "green" },
                },
                onmob_target = "palborough-mines-elevator-lever-i8",
                zone_max_distance = 35,
                items_needed = { "Chaosbringer" },
                trigger_on_event_id = { 130, 131 },
                visual_zones = {
                    -- floor 1: entrance to the elevator at (I-8)
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 59.0, y = 0.4, z = 66.5 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 60.0, y = 0.2, z = 99.6 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 19.2, y = 0.1, z = 118.3 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 62.0, y = 0.9, z = 140.4 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 99.9, y = -0.1, z = 135.7 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 100.5, y = -0.1, z = 87.2 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 99.9, y = 0.2, z = 58.2 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 99.9, y = -7.8, z = -2.0 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 130.7, y = -8.0, z = -20.2 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 140.4, y = -9.5, z = 10.0 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 180.1, y = -14.5, z = 19.1 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 220.3, y = -9.3, z = 33.2 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 206.9, y = -1.2, z = 59.4 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 186.7, y = 0.3, z = 63.1 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                },
            },
            {
                text = "Step 3: Kill 100 enemies with the Chaosbringer.\n \n" ..
                       "CRITICAL: The Chaosbringer must be EQUIPPED and must land the killing blow as a normal or\n" ..
                       "critical melee swing. Weapon skills, job abilities (Jump etc.), magic, ranged attacks and\n" ..
                       "monster suicides (Bomb Toss, Self-Destruct, Final Sting) do NOT count.\n \n" ..
                       "CRITICAL: Do not drop the Chaosbringer - that is the only thing that resets the count. Zoning,\n" ..
                       "changing jobs, changing weapons and getting K.O.'d are all safe.\n \n" ..
                       "===== What counts =====\n" ..
                       "- Any enemy counts, anywhere. It does not have to give experience points.\n" ..
                       "- How you damage it is irrelevant, only the final blow matters - sub BLM and nuke it down, or\n" ..
                       "  soften it with a ranged weapon, then finish with a melee swing.\n \n" ..
                       "===== Speeding it up =====\n" ..
                       "- Records of Eminence 'Area Kills' objectives help you keep count.\n" ..
                       "- During the real-life October Harvest Festival, Wraith Bats spawn outside the starter nations\n" ..
                       "  with 1 HP.\n \n" ..
                       "TIP: The follow-up quest 'Blade of Death' needs another 100 kills with the same sword. If you\n" ..
                       "intend to do it, get all 200 before turning in - the count carries straight over.\n \n" ..
                       "NOTE: This addon counts your own melee killing blows; it cannot see which weapon you have\n" ..
                       "equipped. The server is the authority - if you swing something other than the Chaosbringer the\n" ..
                       "tracker will run ahead of your real count.\n \n",
                kill_requirement = {
                    count = 100,
                    kill_type = "melee",
                },
            },
            {
                text = "Step 4: Zone into Beadeaux from Pashhow Marshlands (L-11) with the Chaosbringer in your inventory\n" ..
                       "for the cutscene that unlocks Dark Knight.\n \n" ..
                       "- Pashhow Marshlands is reached from the top-right of Konschtat Highlands or the bottom of\n" ..
                       "  Rolanberry Fields. The Beadeaux entrance is on the Pashhow side around (K-11)/(L-11).\n" ..
                       "- You can be on ANY job for this - the sword does not even need to be equipped, just carried.\n" ..
                       "- Warping in on the Beadeaux Survival Guide also fires the cutscene.\n \n" ..
                       "WARNING: Beadeaux Quadav aggro by sight and sound and will make short work of a Lv30 character.\n" ..
                       "The cutscene fires the moment you zone in, so take it and leave.\n \n",
                route_to = "Beadeaux",
                destination_highlight = { position = "L-11", offsetX = 16, offsetY = 16 },
                zone_max_distance = 40,
                trigger_on_event_id = { 121 },
            },
        },
        reward = {
            text = "Unlocks the Dark Knight job!\n \n" ..
                   "Title: Dark Sider\n" ..
                   "Job gesture: dark knight\n" ..
                   "Keep the Chaosbringer - 'Blade of Death' wants another 100 kills with it for the Deathbringer.\n \n",
        },
    },
}
