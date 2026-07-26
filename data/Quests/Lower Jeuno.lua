return {
    ["Tenshodo Membership"] = {
        prerequisites = {
                      {category = "Quests", subfile = "Selbina", name = "Only The Best"},
                },
        steps = {
            {
                text = "Step 1: Speak to Ghebi Damomohe (I-7) in Lower Jueno. She can be located within Neptune's Spire. \n \n" ..
                       "Select the THIRD blank line, keep hitting down when given the dialogue options! \n" ..
                       "Notes: To trigger this quest you need Fame 3 for Jeuno and you can skip this questline by going to the Auction House under Others -> Misc and buying a Tenshodo Invite. \n",
                route_to = "Lower Jeuno",
                onmob_target = "Ghebi Damomohe",
                trigger_on_event_id = { 106 },
                destination_highlight = {position = "I-7", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 2: Get ready to go to Port Bastok and Speak with Jabbar to attain KI:Tenshodo Application Form - Skip this step manually if you bought off the Auction House.",
                onmob_target = "Jabbar",
                route_to = "Port Bastok",
                destination_highlight = {position = "F-6", offsetX = 16, offsetY = 16},
                trigger_on_item_obtain = "Tenshodo Invite",
                items_needed = {
                    { item = "Tenshodo Invite", quantity = 1 }
                },
                keyitems_needed = {121},
                trigger_on_keyitem_obtain = {121},
            },
            {
                text = "Step 3: Speak to Ghebi Damomohe (I-7) in Lower Jueno again, hand over the KI:Tenshodo Application Form or Trade a Tenshodo Invite whichever way you prefer.",
                onmob_target = "Ghebi Damomohe",
                trigger_on_event_id = { 107,108 },
                route_to = "Lower Jeuno",
                destination_highlight = {position = "I-7", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "Permanent Key Item: Tenshodo Member's Card"
        }
    },
}
