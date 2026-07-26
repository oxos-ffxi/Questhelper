return {
    ["Only The Best"] = {
        steps = {
            {
                text = "Step 1: Grab multiple stacks of any of the following items - we will use Millioncorn for this guide! \n" ..
                       "Notes: To raise fame you will have to hand in EITHER: La Theine Cabbage(64 stacks +2)/Millioncorn(25 stacks +9)/Boyahda Moss(6 stacks + 5) the amount depends on the server. \n \n" ..
                       "This is a repeatable quest so manually mark it complete when you are ready to proceed!",
                route_to = "Windurst Waters North",
                destination_highlight = {position = "E-8", offsetX = 16, offsetY = 16},
                items_needed = {
                    { item = "Millioncorn", quantity = 309 },
                },
                trigger_on_item_obtain = {"Millioncorn"},
                require_all_items = true,
            },
            {
                text = "Step 2: Talk to Melyon (I-9) Selbina to start the quest!\n" ..
                       "This is a repeatable quest so get ready to trade a lot of corn! Mark it complete once you are done!",
                onmob_target = "Melyon",
                route_to = "Selbina",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
                trigger_on_event_id = 60,

            },
            {
                text = "Step 3: Trade Melyon (I-9) Selbina your corn!\n" ..
                       "This is a repeatable quest so get ready to trade a lot of corn! It will complete after trading once!",
                onmob_target = "Melyon",
                route_to = "Selbina",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
                trigger_on_event_id = 63,
            },
        },
        reward = {
            text = "Millioncorn Handin: 120g per trade / 480g per stack!"
        }
    },
}
