return {
    -- =========================================================================================
    -- Elder Memories (Support Job unlock, Selbina side)
    --
    -- Log 4 (Other Areas) / Quest 24. See data/ref/Quests/subjob_reference.md.
    -- CRITICAL: mutually exclusive with The Old Lady in Mhaura.
    -- =========================================================================================
    ["Elder Memories"] = {
        requirements = {
            level = 18,
        },
        steps = {
            {
                text = "Step 1: Talk to Isacio in Selbina (G-10) at Lv18 or above and accept.\n \n" ..
                       "- He is on the waterfront. Under Lv18 he just brushes you off.\n \n" ..
                       "CRITICAL: This and The Old Lady (Vera, Mhaura) are the SAME reward and are mutually exclusive. Starting one locks the other out forever - pick a side.\n \n" ..
                       "TIP: If you hold Gilgamesh's Introductory Letter from Rhapsodies 'Set Free', just talk to Isacio again after he asks for the first item and the whole quest completes - skip steps 2-7.\n \n",
                route_to = "Selbina",
                destination_highlight = { position = "G-10", offsetX = 16, offsetY = 16 },
                onmob_target = "Isacio",
                -- 111 accepts on option 40, 119 is the under-level brush-off. The option cannot be
                -- filtered, so declining still ticks this step - untick it if you back out.
                trigger_on_event_id = { 111 },
                zone_max_distance = 25,
            },
            {
                text = "Step 2: Get a Crab Apron from the Snippers in Valkurm Dunes.\n \n" ..
                       "- Snippers are the crabs along the beaches, straight out of Selbina's north gate.\n \n",
                route_to = "Valkurm Dunes",
                destination_highlight = {
                    { position = "F-9", offsetX = 16, offsetY = 16  },
                    { position = "I-9", offsetX = 16, offsetY = 16  },
                    { position = "I-7", offsetX = 16, offsetY = 16  },
                },
                onmob_enemy = "Snipper",
                onmob_enemy_colour = "red",
                items_needed = { "Crab Apron" },
                skip_if_have = { item = "crab apron", quantity = 1 },
                trigger_on_item_obtain = { "Crab Apron" },
            },
            {
                text = "Step 3: Get a Damselfly Worm from the Damselflies in Valkurm Dunes.\n \n" ..
                       "- Same zone as the Snippers, so do both on one trip.\n \n",
                route_to = "Valkurm Dunes",
                destination_highlight = {
                    { position = "G-8", offsetX = 16, offsetY = 16  },
                    { position = "I-8", offsetX = 16, offsetY = 16  },
                    { position = "E-8", offsetX = 16, offsetY = 16  },
                },
                onmob_enemy = "Damselfly",
                onmob_enemy_colour = "red",
                items_needed = { "Damselfly Worm" },
                skip_if_have = { item = "damselfly worm", quantity = 1 },
                trigger_on_item_obtain = { "Damselfly Worm" },
            },
            {
                text = "Step 4: Get a Magicked Skull from the undead.\n \n" ..
                       "- Valkurm Dunes is the same zone as the other two, but the undead there are NIGHT ONLY scattered around the zone -\n" ..
                       "  nothing to kill for it between 4:00 and 20:00 Vana'diel time.\n" ..
                       "- Gusgen Mines has them around the clock, at the cost of the trip out.\n \n" ..
                       "TIP: If it is daytime and you do not fancy waiting, Gusgen is the answer. If it is already night, stay put - you are stood in the right zone.\n \n",
                route_choices_label = "Farm at (click one):",
                route_choices = {
                    {
                        group = "Valkurm Dunes - already here, night only",
                        zones = { "Valkurm Dunes" },
                        default = true,
                    },
                    {
                        group = "Gusgen Mines - any time, longer trip",
                        zones = { "Gusgen Mines" },
                        -- Bogy camp. No floor_id: which map it sits on is unconfirmed, and a
                        -- wrong one would filter the pin off the map it belongs to.
                        destination_highlight = {
                            { position = "I-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
                items_needed = { "Magicked Skull" },
                skip_if_have = { item = "magicked skull", quantity = 1 },
                trigger_on_item_obtain = { "Magicked Skull" },
                -- Ghoul covers the Valkurm branch, Bogy the Gusgen one. A name that is not in the
                -- current zone simply never matches, so listing both is safe.
                onmob_enemy = { "Ghoul", "Bogy" },
                onmob_enemy_colour = "red",
                onmob_enemy_size = 1,
            },
            {
                text = "Step 5: Trade the Magicked Skull to Isacio (G-10).\n \n" ..
                       "CRITICAL: The skull goes FIRST. Isacio only accepts the item he is currently asking for, and most write-ups list these three in a different order to the one the server enforces.\n \n",
                route_to = "Selbina",
                destination_highlight = { position = "G-10", offsetX = 16, offsetY = 16 },
                onmob_target = "Isacio",
                onmob_target_icon = "Magicked Skull",
                trigger_on_event_id = { 115 },
                zone_max_distance = 25,
            },
            {
                text = "Step 6: Trade the Damselfly Worm to Isacio (G-10).\n \n",
                route_to = "Selbina",
                destination_highlight = { position = "G-10", offsetX = 16, offsetY = 16 },
                onmob_target = "Isacio",
                onmob_target_icon = "Damselfly Worm",
                trigger_on_event_id = { 116 },
                zone_max_distance = 25,
            },
            {
                text = "Step 7: Trade the Crab Apron to Isacio (G-10) to unlock Support Job.\n \n",
                route_to = "Selbina",
                destination_highlight = { position = "G-10", offsetX = 16, offsetY = 16 },
                onmob_target = "Isacio",
                onmob_target_icon = "Crab Apron",
                trigger_on_event_id = { 117 },
                zone_max_distance = 25,
            },
        },
        reward = {
            text = "Unlocks Support Job!\n \n" ..
                   "No item, no title, no fame.\n" ..
                   "Change zone before the support job slot becomes usable.\n \n",
        },
    },

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
