return {
    -- =========================================================================================
    -- 1) Blade of Darkness (Dark Knight unlock)
    --
    -- Log 1 (Bastok) / Quest 28. See data/ref/Jobs/dark_knight_reference.md.
    -- =========================================================================================
    ["1.Dark Knight Quest - Blade of Darkness"] = {
        requirements = {
            level = 30,
        },
        steps = {
            {
                text = "Step 1: Speak with Gumbah in Bastok Mines (J-7) until he gives you the cutscene that starts the quest.\n \n" ..
                       "- Gumbah starts several quests and the Great Sword weaponskill quest 'Inheritance' takes priority. Check your log before leaving to be sure you picked up the right one.\n \n",
                onmob_target = "Gumbah",
                route_to = "Bastok Mines",
                destination_highlight = { position = "J-7", offsetX = 16, offsetY = 16 },
                zone_max_distance = 20,
                visual_zones = {
                        { zone_name = "Bastok Mines", type = 'arrow', center = { x = 34.1, y = 0.0, z = -57.2 }, size = 3, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Bastok Mines", type = 'arrow', center = { x = 28.4, y = 0.0, z = -24.1 }, size = 3, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Bastok Mines", type = 'arrow', center = { x = -3.9, y = 0.0, z = -23.0 }, size = 3, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Bastok Mines", type = 'arrow', center = { x = -3.5, y = 0.0, z = 10.1 }, size = 3, direction = "right", floor_id = 0, colour = "yellow" },
                        { zone_name = "Bastok Mines", type = 'arrow', center = { x = 36.9, y = 0.0, z = 8.7 }, size = 3, direction = "right", floor_id = 0, colour = "yellow" },
                        { zone_name = "Bastok Mines", type = 'arrow', center = { x = 58.7, y = 0.0, z = 7.4 }, size = 3, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Bastok Mines", type = 'arrow', center = { x = 59.7, y = 0.0, z = -12.8 }, size = 3, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Bastok Mines", type = 'arrow', center = { x = 50.4, y = -0.0, z = -13.6 }, size = 3, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Bastok Mines", type = 'rect', center = { x = 49.9, y = -1.4, z = -16.8 }, width = 2.25, height = 2.75, floor_id = 0, colour = "cyan", vertical_axis = 'ns' },
                },
                trigger_on_event_id = { 99 },
            },
            {
                text = "Step 2: Ride the boat in Palborough Mines to Zeruhn Mines for the Chaosbringer.\n \n" ..
                       "- Home Point Palborough Mines #1 at (H-10) on map 3 drops you a few steps from the boat.\n" ..
                       "- Anyone can pull the lever - you only need to make the trip.\n" ..
                       "- Pulling the lever does nothing on its own. The cutscene and the sword come when the boat lands you in Zeruhn Mines, so stay on it.\n" ..
                       "- Have a free inventory slot before boarding, or you will be making the trip twice.\n",
                route_to = "Palborough Mines 3",
                destination_highlight = {
                    { position = "I-8",  offsetX = 16, offsetY = 16, floor_id = 1, },
                    { position = "H-8",  offsetX = 16, offsetY = 16, floor_id = 3, },
                },
                onmob_target = {"palborough-mines-elevator-lever-i8",
                                "palborough-mines-dock-lever-h8"},
                zone_max_distance = 20,
                items_needed = { "Chaosbringer" },
                trigger_on_item_obtain = { "Chaosbringer" },
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

                    -- To Boat - Lever h8 - 3rd floor_id
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 185.6, y = -32.0, z = 66.9 }, size = 3, direction = "left", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 171.9, y = -32.0, z = 67.3 }, size = 3, direction = "down", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 169.7, y = -32.0, z = 60.5 }, size = 3, direction = "left", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 139.8, y = -32.0, z = 59.0 }, size = 3, direction = "down", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 139.7, y = -31.6, z = 36.0 }, size = 3, direction = "down", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 141.1, y = -30.5, z = 27.9 }, size = 3, direction = "down", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 140.1, y = -30.5, z = 17.6 }, size = 3, direction = "left", floor_id = 3, colour = "yellow" },
                },
            },
            {
                text = "Step 3: Kill 100 enemies with the Chaosbringer.\n \n" ..
                       "- Any enemy anywhere counts, and it does not have to give experience.\n" ..
                       "- Only the final blow matters, so soften things up however you like - sub BLM, use a bow - then finish with a swing.\n" ..
                       "- Dropping the sword is the only thing that resets the count. Zoning, job changes, weapon swaps and dying are all safe.\n" ..
                       "- 'Blade of Death' wants another 100 with the same sword. If you plan to do it, bank all 200 before turning in.\n" ..
                       "NOTE: It must be EQUIPPED and land the killing blow as a normal or critical melee swing. Weapon skills, job abilities, magic, ranged attacks and monster suicides all count for nothing.\n \n",
                kill_requirement = {
                    count = 100,
                    kill_type = "melee",
                },
            },
            {
                text = "Step 4: Zone into Beadeaux from Pashhow Marshlands (L-11) carrying the Chaosbringer.\n \n" ..
                       "- Warping in on the Beadeaux Survival Guide fires the cutscene just as well.\n",
                route_to = "Beadeaux",
                zone_max_distance = 40,
                trigger_on_event_id = { 121 },
                zone_trigger = "Beadeaux",

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
