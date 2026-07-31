return {
    -- =========================================================================================
    -- 1) Path of the Bard (Bard unlock)
    --
    -- Log 3 (Jeuno) / Quest 20, but authored as ONE entry covering all three quests in the
    -- chain: The Old Monument (Q11) -> A Minstrel in Despair (Q12) -> Path of the Bard (Q20).
    --
    -- The lead-ins are Lower Jeuno quests, so a player following the Bard line would never
    -- find them if they only lived in data/Quests. Keeping them here means the whole unlock
    -- reads top to bottom in one place.
    --
    -- The entry name still normalises to PATHOFTHEBARD, so quest_sync ties it to quest 20 and
    -- the whole thing ticks complete once the unlock is done. See data/ref/Jobs/bard_reference.md.
    -- =========================================================================================
    ["1.Bard Quest - Path of the Bard"] = {
        requirements = {
            level = 30,
        },
        steps = {
            {
                text = "Step 1: Talk to Mertaire in Lower Jeuno (I-8).\n \n" ..
                       "- He and Bki Tbujhja stand a few yalms apart, resulting in finding the Song Runes in Buburimu.\n \n",
                onmob_target = "Mertaire",
                route_to = "Lower Jeuno",
                destination_highlight = { position = "I-8", offsetX = 16, offsetY = 16 },
                zone_max_distance = 30,
                visual_zones = {
                        { zone_name = "Lower Jeuno", type = 'arrow', center = { x = -31.2, y = 0.0, z = -58.9 }, size = 3, direction = "se", floor_id = 0, colour = "yellow" },
                        { zone_name = "Lower Jeuno", type = 'rect', center = { x = -28.7, y = -1.6, z = -61.2 }, width = 2.50, height = 3.25, floor_id = 0, colour = "cyan", vertical_axis = 'nw', rotation = 15 },
                },
                trigger_on_event_id = { 102 },
            },
            {
                text = "Step 2: Get a Sheet of Parchment.\n \n" ..
                       "- Pikini-Mikini in Mhaura (G-9) sells them, and Mhaura is one zone from the Buburimu runes you need next.\n" ..
                       "- Auction House: [Materials > Leathercraft]\n",
                route_to = "Mhaura",
                destination_highlight = { position = "G-9", offsetX = 16, offsetY = 16 },
                onmob_target = "Pikini-Mikini",
                zone_max_distance = 30,
                visual_zones = {
                    { zone_name = "Mhaura", type = 'arrow', center = { x = -0.5, y = -4.0, z = 116.9 }, size = 2, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Mhaura", type = 'arrow', center = { x = -0.3, y = -4.0, z = 78.6 }, size = 2, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Mhaura", type = 'arrow', center = { x = 0.6, y = -8.0, z = 50.7 }, size = 2, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Mhaura", type = 'arrow', center = { x = -12.8, y = -8.0, z = 49.3 }, size = 2, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Mhaura", type = 'arrow', center = { x = -24.5, y = -8.0, z = 35.0 }, size = 2, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Mhaura", type = 'arrow', center = { x = -26.1, y = -4.0, z = 19.7 }, size = 2, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Mhaura", type = 'arrow', center = { x = -48.1, y = -4.0, z = 21.9 }, size = 2, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Mhaura", type = 'arrow', center = { x = 31.3, y = -8.0, z = 46.0 }, size = 2, direction = "left", floor_id = 0, colour = "yellow" },
                },
                items_needed = {
                    { item = "Sheet of Parchment", quantity = 1 }
                },
                trigger_on_item_obtain = {
                    { item = "Sheet of Parchment", quantity = 1 },
                },
            },
            {
                text = "Step 3: Examine the Song Runes on the old monument in Buburimu Peninsula.\n \n" ..
                       "- Just click them. The cutscene is all that is needed here.\n \n",
                route_to = "Buburimu Peninsula",
                destination_highlight = { position = "F-9", offsetX = 16, offsetY = 16,label= "SR"  },
                onmob_target = "buburimu-peninsula-song-runes-g9",
                zone_max_distance = 25,
                -- Zone-scoped: event 0 is about as generic as an id gets
                trigger_on_event_id = { 0, "Buburimu Peninsula" },
                visual_zones = {
                    --Route from Mharau to Beach(can be used for Bibiki Bay with few more additions).
                    { zone_name = "Buburimu Peninsula", type = 'arrow', center = { x = 159.1, y = 0.6, z = -185.9 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Buburimu Peninsula", type = 'arrow', center = { x = 156.5, y = 0.0, z = -161.3 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Buburimu Peninsula", type = 'arrow', center = { x = 106.0, y = 0.6, z = -160.2 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Buburimu Peninsula", type = 'arrow', center = { x = 56.1, y = 0.8, z = -160.9 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Buburimu Peninsula", type = 'arrow', center = { x = 13.5, y = 0.5, z = -162.3 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Buburimu Peninsula", type = 'arrow', center = { x = -17.0, y = 0.8, z = -163.4 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Buburimu Peninsula", type = 'arrow', center = { x = -40.6, y = 0.0, z = -161.9 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Buburimu Peninsula", type = 'arrow', center = { x = -44.4, y = 16.0, z = -204.0 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Buburimu Peninsula", type = 'arrow', center = { x = -48.9, y = 16.2, z = -246.8 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Buburimu Peninsula", type = 'arrow', center = { x = -72.6, y = 16.1, z = -270.2 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Buburimu Peninsula", type = 'arrow', center = { x = -102.3, y = 18.7, z = -299.7 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Buburimu Peninsula", type = 'arrow', center = { x = -125.3, y = 20.0, z = -321.7 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Buburimu Peninsula", type = 'arrow', center = { x = -133.7, y = 20.1, z = -332.6 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Buburimu Peninsula", type = 'arrow', center = { x = -143.9, y = 20.1, z = -333.4 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Buburimu Peninsula", type = 'arrow', center = { x = -165.9, y = 18.3, z = -324.4 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Buburimu Peninsula", type = 'arrow', center = { x = -177.1, y = 20.1, z = -333.6 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Buburimu Peninsula", type = 'arrow', center = { x = -187.7, y = 20.1, z = -332.1 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Buburimu Peninsula", type = 'arrow', center = { x = -220.4, y = 19.2, z = -302.7 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                },
            },
            {
                text = "Step 4: Trade the Sheet of Parchment to the same Song Runes to take a rubbing.\n \n" ..
                       "- You get a Poetic Parchment, and 'The Old Monument' quest completes.\n",
                route_to = "Buburimu Peninsula",
                destination_highlight = { position = "F-9", offsetX = 16, offsetY = 16,label= "SR"  },
                onmob_target = "buburimu-peninsula-song-runes-g9",
                zone_max_distance = 40,
                trigger_on_event_id = { 2, "Buburimu Peninsula" },
                 visual_zones = {
                    --Route from Mharau to Beach(can be used for Bibiki Bay with few more additions).
                    { zone_name = "Buburimu Peninsula", type = 'arrow', center = { x = 159.1, y = 0.6, z = -185.9 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Buburimu Peninsula", type = 'arrow', center = { x = 156.5, y = 0.0, z = -161.3 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Buburimu Peninsula", type = 'arrow', center = { x = 106.0, y = 0.6, z = -160.2 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Buburimu Peninsula", type = 'arrow', center = { x = 56.1, y = 0.8, z = -160.9 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Buburimu Peninsula", type = 'arrow', center = { x = 13.5, y = 0.5, z = -162.3 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Buburimu Peninsula", type = 'arrow', center = { x = -17.0, y = 0.8, z = -163.4 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Buburimu Peninsula", type = 'arrow', center = { x = -40.6, y = 0.0, z = -161.9 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Buburimu Peninsula", type = 'arrow', center = { x = -44.4, y = 16.0, z = -204.0 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Buburimu Peninsula", type = 'arrow', center = { x = -48.9, y = 16.2, z = -246.8 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Buburimu Peninsula", type = 'arrow', center = { x = -72.6, y = 16.1, z = -270.2 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Buburimu Peninsula", type = 'arrow', center = { x = -102.3, y = 18.7, z = -299.7 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Buburimu Peninsula", type = 'arrow', center = { x = -125.3, y = 20.0, z = -321.7 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Buburimu Peninsula", type = 'arrow', center = { x = -133.7, y = 20.1, z = -332.6 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Buburimu Peninsula", type = 'arrow', center = { x = -143.9, y = 20.1, z = -333.4 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Buburimu Peninsula", type = 'arrow', center = { x = -165.9, y = 18.3, z = -324.4 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Buburimu Peninsula", type = 'arrow', center = { x = -177.1, y = 20.1, z = -333.6 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Buburimu Peninsula", type = 'arrow', center = { x = -187.7, y = 20.1, z = -332.1 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Buburimu Peninsula", type = 'arrow', center = { x = -220.4, y = 19.2, z = -302.7 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                },
            },
            {
                text = "Step 5: Take the Poetic Parchment back to Mertaire in Lower Jeuno (I-8) and trade it to him.\n \n" ..
                       "- That is 'A Minstrel in Despair' started and finished in one trade. 2,100 gil.\n",
                onmob_target = "Mertaire",
                route_to = "Lower Jeuno",
                items_needed = {
                    { item = "Poetic Parchment", quantity = 1, on_the_way = true }
                },
                destination_highlight = { position = "I-8", offsetX = 16, offsetY = 16 },
                zone_max_distance = 30,
                visual_zones = {
                        { zone_name = "Lower Jeuno", type = 'arrow', center = { x = -31.2, y = 0.0, z = -58.9 }, size = 3, direction = "se", floor_id = 0, colour = "yellow" },
                        { zone_name = "Lower Jeuno", type = 'rect', center = { x = -28.7, y = -1.6, z = -61.2 }, width = 2.50, height = 3.25, floor_id = 0, colour = "cyan", vertical_axis = 'nw', rotation = 15 },
                },
                trigger_on_event_id = { 101 },
            },
            {
                text = "Step 6: Talk to Bki Tbujhja, next to Mertaire (I-8), to start 'Path of the Bard'.\n \n" ..
                       "- Talks to you about a second set of song runes, out in Valkurm Dunes.\n",
                onmob_target = "Bki Tbujhja",
                route_to = "Lower Jeuno",
                destination_highlight = { position = "I-8", offsetX = 16, offsetY = 16 },
                zone_max_distance = 30,
                visual_zones = {
                        { zone_name = "Lower Jeuno", type = 'arrow', center = { x = -31.2, y = 0.0, z = -58.9 }, size = 3, direction = "se", floor_id = 0, colour = "yellow" },
                        { zone_name = "Lower Jeuno", type = 'rect', center = { x = -28.7, y = -1.6, z = -61.2 }, width = 2.50, height = 3.25, floor_id = 0, colour = "cyan", vertical_axis = 'nw', rotation = 15 },
                },
                trigger_on_event_id = { 182 },
            },
            {
                text = "Step 7: Examine the Song Runes on the hidden beach in Valkurm Dunes to unlock Bard.\n \n" ..
                       "- Nothing is traded and nothing needs to be carried - you just click them.\n",
                route_to = "Valkurm Dunes",
                destination_highlight = { position = "B-7", offsetX = 16, offsetY = 16, label= "SR" },
                onmob_target = "valkurm-dunes-song-runes-b7",
                zone_max_distance = 40,
                trigger_on_event_id = { 2, "Valkurm Dunes" },
                visual_zones = {
                    { zone_name = "Valkurm Dunes", type = 'arrow', center = { x = 69.0, y = -0.2, z = -126.9 }, size = 4, direction = "up", floor_id = 0, colour = "magenta" },
                    { zone_name = "Valkurm Dunes", type = 'arrow', center = { x = 66.0, y = -0.0, z = -92.3 }, size = 4, direction = "up", floor_id = 0, colour = "magenta" },
                    { zone_name = "Valkurm Dunes", type = 'arrow', center = { x = 60.9, y = 1.2, z = -57.0 }, size = 4, direction = "nw", floor_id = 0, colour = "magenta" },
                    { zone_name = "Valkurm Dunes", type = 'arrow', center = { x = 26.1, y = -0.9, z = -22.5 }, size = 4, direction = "nw", floor_id = 0, colour = "magenta" },
                    { zone_name = "Valkurm Dunes", type = 'arrow', center = { x = -3.7, y = -0.0, z = 5.9 }, size = 4, direction = "nw", floor_id = 0, colour = "magenta" },
                    { zone_name = "Valkurm Dunes", type = 'arrow', center = { x = -38.8, y = -0.2, z = 37.5 }, size = 4, direction = "nw", floor_id = 0, colour = "magenta" },
                    { zone_name = "Valkurm Dunes", type = 'arrow', center = { x = -66.2, y = -0.4, z = 61.0 }, size = 4, direction = "nw", floor_id = 0, colour = "magenta" },
                    { zone_name = "Valkurm Dunes", type = 'arrow', center = { x = -86.7, y = 0.1, z = 78.0 }, size = 4, direction = "nw", floor_id = 0, colour = "magenta" },
                    { zone_name = "Valkurm Dunes", type = 'arrow', center = { x = -94.2, y = 0.4, z = 82.4 }, size = 4, direction = "left", floor_id = 0, colour = "magenta" },
                    { zone_name = "Valkurm Dunes", type = 'arrow', center = { x = -151.8, y = 0.2, z = 82.4 }, size = 4, direction = "left", floor_id = 0, colour = "magenta" },
                    { zone_name = "Valkurm Dunes", type = 'arrow', center = { x = -190.0, y = 0.3, z = 83.3 }, size = 4, direction = "left", floor_id = 0, colour = "magenta" },
                    { zone_name = "Valkurm Dunes", type = 'arrow', center = { x = -230.2, y = -7.1, z = 84.1 }, size = 4, direction = "left", floor_id = 0, colour = "magenta" },
                    { zone_name = "Valkurm Dunes", type = 'arrow', center = { x = -256.5, y = -8.2, z = 89.8 }, size = 4, direction = "nw", floor_id = 0, colour = "magenta" },
                    { zone_name = "Valkurm Dunes", type = 'arrow', center = { x = -289.5, y = -8.0, z = 127.9 }, size = 4, direction = "nw", floor_id = 0, colour = "magenta" },
                    { zone_name = "Valkurm Dunes", type = 'arrow', center = { x = -324.1, y = -7.9, z = 165.2 }, size = 4, direction = "nw", floor_id = 0, colour = "magenta" },
                    { zone_name = "Valkurm Dunes", type = 'arrow', center = { x = -361.1, y = -8.0, z = 202.7 }, size = 4, direction = "nw", floor_id = 0, colour = "magenta" },
                    { zone_name = "Valkurm Dunes", type = 'arrow', center = { x = -394.8, y = -7.9, z = 236.6 }, size = 4, direction = "nw", floor_id = 0, colour = "magenta" },
                    { zone_name = "Valkurm Dunes", type = 'arrow', center = { x = -422.4, y = -15.4, z = 264.3 }, size = 4, direction = "nw", floor_id = 0, colour = "magenta" },
                    { zone_name = "Valkurm Dunes", type = 'arrow', center = { x = -449.7, y = -16.4, z = 288.5 }, size = 4, direction = "nw", floor_id = 0, colour = "magenta" },
                    { zone_name = "Valkurm Dunes", type = 'arrow', center = { x = -480.0, y = -16.0, z = 315.0 }, size = 4, direction = "up", floor_id = 0, colour = "magenta" },
                    { zone_name = "Valkurm Dunes", type = 'arrow', center = { x = -486.8, y = -15.9, z = 357.2 }, size = 4, direction = "left", floor_id = 0, colour = "magenta" },
                    { zone_name = "Valkurm Dunes", type = 'arrow', center = { x = -536.0, y = -15.3, z = 355.4 }, size = 4, direction = "sw", floor_id = 0, colour = "magenta" },
                    { zone_name = "Valkurm Dunes", type = 'arrow', center = { x = -563.5, y = -16.0, z = 320.6 }, size = 4, direction = "se", floor_id = 0, colour = "magenta" },
                    { zone_name = "Valkurm Dunes", type = 'arrow', center = { x = -538.5, y = -22.2, z = 293.9 }, size = 4, direction = "down", floor_id = 0, colour = "magenta" },
                    { zone_name = "Valkurm Dunes", type = 'arrow', center = { x = -547.0, y = -25.7, z = 259.4 }, size = 4, direction = "left", floor_id = 0, colour = "magenta" },
                    { zone_name = "Valkurm Dunes", type = 'arrow', center = { x = -577.0, y = -19.3, z = 250.6 }, size = 4, direction = "down", floor_id = 0, colour = "magenta" },
                    { zone_name = "Valkurm Dunes", type = 'arrow', center = { x = -580.6, y = -16.0, z = 198.7 }, size = 4, direction = "down", floor_id = 0, colour = "magenta" },
                    { zone_name = "Valkurm Dunes", type = 'arrow', center = { x = -584.4, y = -17.8, z = 179.7 }, size = 4, direction = "left", floor_id = 0, colour = "magenta" },
                    { zone_name = "Valkurm Dunes", type = 'arrow', center = { x = -619.0, y = -13.4, z = 181.1 }, size = 4, direction = "nw", floor_id = 0, colour = "magenta" },
                    { zone_name = "Valkurm Dunes", type = 'arrow', center = { x = -643.2, y = -8.0, z = 202.7 }, size = 4, direction = "sw", floor_id = 0, colour = "magenta" },
                    { zone_name = "Valkurm Dunes", type = 'arrow', center = { x = -681.5, y = -7.1, z = 181.3 }, size = 4, direction = "sw", floor_id = 0, colour = "magenta" },
                    { zone_name = "Valkurm Dunes", type = 'arrow', center = { x = -710.6, y = -8.0, z = 150.3 }, size = 4, direction = "sw", floor_id = 0, colour = "magenta" },
                    { zone_name = "Valkurm Dunes", type = 'arrow', center = { x = -722.1, y = -7.6, z = 132.4 }, size = 4, direction = "sw", floor_id = 0, colour = "magenta" },
                    { zone_name = "Valkurm Dunes", type = 'arrow', center = { x = -733.0, y = -7.0, z = 121.0 }, size = 4, direction = "se", floor_id = 0, colour = "magenta" },
                },
            },
        },
        reward = {
            text = "Unlocks the Bard job!\n \n",
        },
    },
}
