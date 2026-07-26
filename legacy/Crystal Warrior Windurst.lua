return {
    ["A Crystal Prelude(Windurst)"] = {
        steps = {
          {
            text = "Step 1: Talk to Erudu-Faludu (H-8) to start the quest.\n" ..
                   "Crystal Warrior quests are custom and do not lock the characters movement.\n" ..
                   "He will give you a 'Sickle' \n \n",
            images = {
                {
                    zone_name = "Toraimarai Canal", floor_id = 2 --[[VERIFY floor_id]],
                    width    = 512,
                    height   = 512,
                    state    = 1,
                    highlights = {
                        { position = "H-8", offsetX = 16, offsetY = 16 },
                    },
                }
            },
          },
          {
            text = "Step 2: Go to the room west, through the 'Marble Door' and use the 'Sickle'(trade it) on the 'Dangling Roots' for a 'Revival Root' item! \n \n",
            images = {
                {
                    zone_name = "Toraimarai Canal", floor_id = 2 --[[VERIFY floor_id]],
                    width    = 512,
                    height   = 512,
                    state    = 2,
                    highlights = {
                        { position = "G-8", offsetX = 16, offsetY = 16 },
                    },
                },
            },
          },
          {
            text = "Step 3: Trade the 'Revival Root' to Erudu-Faludu (H-8) and he will give you your starting jobs Weapon! \n" ..
                   "Check the books around the room, and you will spawn a 'Dusty Tome' monster! \n" ..
                   "Kill it, and talk to Erudu-Faludu (H-8) again and he will warp you out into East Sarutabaruta with an 'Adventurers Coupon' \n" ..
                   "This can be traded to Jack of Spades (F-8) in Windurst Woods!\n \n",

            images = {
                {
                    zone_name = "Windurst Woods",
                    width    = 512,
                    height   = 512,
                    state    = 3,
                    highlights = {
                        { position = "F-8", offsetX = 16, offsetY = 16 },
                    },
                },
            },
          },
        },
        reward = {
            text = "JSE Onion Weapon, Adventurer Coupon!",
            images = {
            },
        }
    },
}
