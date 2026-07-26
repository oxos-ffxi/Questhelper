return {
    ["Kazham Airship Pass Quest"] = {
        steps = {
            {
                text = "Step 1: Speak to Guddal (I-7) in Port Jueno for information towards Kazham Airship Pass. \n \n" ..
                       "Notes: You can purchase the pass for 148000 gil or farm the following items from beastman - to carry on with quest select 'Adventurers Deal'",
                items_needed = {
                    "Ghelsba Chest Key",
                    "Palborough Chest Key",
                    "Giddeus Chest Key"},
                keyitems_needed = {9},
                -- trigger_on_item_obtain = {
                --     "Ghelsba Chest Key",
                --     "Palborough Chest Key",
                --     "Giddeus Chest Key"
                -- },
                require_all_items = true,
                route_to = "Port Jeuno",
                onmob_target = "Guddal",
                --trigger_on_event_id = { 300 },
                trigger_on_talk = " Ghelsba chest key, Palborough chest key, and Giddeus chest key.",
                destination_highlight = {position = "I-7", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 2: Let's grab the Ghelsba Chest Key, this will require a trip to Yughott Grotto. \n \n" ..
                       "This key drops from Orcish Cursemaker(Level:21-23), Orcish Fighter(Level:21-23), and Orcish Serjeant(Level:21-23) they will be in the largest rooms surrounded by weaker mobs have a good look around! \n \n",
                route_to = "Yughott Grotto 1",
                destination_highlight = {position = "J-7", offsetX = 16, offsetY = 16},
                trigger_on_item_obtain = {
                     "Ghelsba Chest Key",
                 },
            },
            {
                text = "Step 3: Let's grab the Palborough Chest Key! \n \n" ..
                       "This key drops from Scimitar Scorpion(Level:19-21), Brass Quadav(Level:21-23), Copper Quadav(Level:21-23), and Old Quadav(Level:21-23). \n \n" ..
                       "Notes: Take the elevator up on map 1 (I-8) and this will take you to the third floor and make your way just before the Waughroon Shrine with mobs spawning after the river around (H-9), in the four rooms and the path leading up to the zone. \n \n",
                route_to = "Palborough Mines 3",
                destination_highlight = {position = "H-9", offsetX = 16, offsetY = 16},
                trigger_on_item_obtain = {
                     "Palborough Chest Key",
                 },
            },
            {
                text = "Step 4: Let's grab the Giddeus Chest Key! \n \n" ..
                       "This key drops from Yagudo Votary(Level:21-23), Yagudo Priest(Level:21-23), and Yagudo Theologist(Level:21-23). \n \n" ..
                       "Notes: Stay to the right and make your way to the cave at (G-7). Head left after you enter and drop down the hole concealed by bramble at (H-7). Head south outside the tunnel and follow the path all the way to the bottom of the map, taking care to not fall down. The very last room (H-13/14) contains all of the chest key mobs. \n \n",
                route_to = "Giddeus",
                destination_highlight = {
                    {position = "H-7", offsetX = 16, offsetY = 16, label = "1", floor_id = 1},
                    {position = "H-8", offsetX = 16, offsetY = 16, label = "2", floor_id = 15},
                    {position = "H-13", offsetX = 16, offsetY = 16, label = "3", floor_id = 1},
            },
                trigger_on_item_obtain = {
                     "Giddeus Chest Key",
                 },
            },
            {
                text = "Step 5: Return to Guddal (I-7) in Port Jueno again, and trade the 3 keys - Ghelsba Chest Key, Palborough Chest Key, and Giddeus Chest Key",
                onmob_target = "Guddal",
                trigger_on_event_id = { 301 },
                route_to = "Port Jeuno",
                destination_highlight = {position = "I-7", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "Permanent Key Item: Kazham Airship Pass!"
        }
    },
}
