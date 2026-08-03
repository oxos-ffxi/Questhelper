return {
    -- =========================================================================================
    -- The Old Lady (Support Job unlock, Mhaura side)
    --
    -- Log 4 (Other Areas) / Quest 10. See data/ref/Quests/subjob_reference.md.
    -- CRITICAL: mutually exclusive with Elder Memories in Selbina.
    -- =========================================================================================
    ["The Old Lady"] = {
        requirements = {
            level = 18,
        },
        steps = {
            {
                text = "Step 1: Talk to Vera in Mhaura (G-10) at Lv18 or above and accept.\n \n" ..
                       "- She is outside the warehouse. Under Lv18 she just brushes you off.\n \n" ..
                       "CRITICAL: This and Elder Memories (Isacio, Selbina) are the SAME reward and are mutually exclusive. Starting one locks the other out forever - pick a side.\n \n" ..
                       "TIP: If you hold Gilgamesh's Introductory Letter from Rhapsodies 'Set Free', just talk to Vera again after she asks for the first item and the whole quest completes - skip steps 2-7.\n \n",
                route_to = "Mhaura",
                destination_highlight = { position = "G-10", offsetX = 16, offsetY = 16 },
                onmob_target = "Vera",
                -- 131 accepts on option 40, 133 is the under-level brush-off. The option cannot be
                -- filtered, so declining still ticks this step - untick it if you back out.
                trigger_on_event_id = { 131 },
                zone_max_distance = 25,
            },
            {
                text = "Step 2: Get a Wild Rabbit Tail from the Mighty Rarabs in Buburimu Peninsula.\n \n",
                route_to = "Buburimu Peninsula",
                destination_highlight = {
                    { position = "G-7", offsetX = 16, offsetY = 16  },
                },
                onmob_enemy = "Mighty Rarab",
                onmob_enemy_colour = "red",
                items_needed = { "Wild Rabbit Tail" },
                skip_if_have = { item = "rabbit tail", quantity = 1 },
                trigger_on_item_obtain = { "Wild Rabbit Tail" },
            },
            {
                text = "Step 3: Get a Cup of Dhalmel Saliva from the Dhalmels in Buburimu Peninsula.\n \n" ..
                       "- Same zone as the rabbits, so do both on one trip.\n \n",
                route_to = "Buburimu Peninsula",
                onmob_enemy = "Bull Dhalmel",
                onmob_enemy_colour = "red",
                destination_highlight = {
                    { position = "I-8", offsetX = 16, offsetY = 16  },
                },
                items_needed = { "Dhalmel Saliva" },
                skip_if_have = { item = "dhalmel saliva", quantity = 1 },
                trigger_on_item_obtain = { "Dhalmel Saliva" },
            },
            {
                text = "Step 4: Get a Bloody Robe from the Bogys.\n \n" ..
                       "- Buburimu Peninsula is the same zone as the other two, but Bogy is NIGHT ONLY there -\n" ..
                       "  nothing to kill for it between 4:00 and 20:00 Vana'diel time.\n" ..
                       "- Gusgen Mines has them around the clock, at the cost of the trip out.\n \n" ..
                       "TIP: If it is daytime and you do not fancy waiting, Gusgen is the answer. If it is already night, stay put - you are stood in the right zone.\n \n",
                route_choices_label = "Farm at (click one):",
                route_choices = {
                    {
                        group = "Buburimu Peninsula - already here, night only",
                        zones = { "Buburimu Peninsula" },
                        default = true,
                        -- Scoped to this choice, so it never pins Buburimu camps on Gusgen's map.
                        destination_highlight = {
                            { position = "G-9", offsetX = 16, offsetY = 16 },
                            { position = "H-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        group = "Gusgen Mines - any time, longer trip",
                        zones = { "Gusgen Mines" },
                        -- Same Bogy camp Elder Memories uses; one spot serves both quests.
                        destination_highlight = {
                            { position = "I-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
                onmob_enemy = "Bogy",
                onmob_enemy_colour = "red",
                onmob_enemy_size = 1,
                items_needed = { "Bloody Robe" },
                skip_if_have = { item = "bloody robe", quantity = 1 },
                trigger_on_item_obtain = { "Bloody Robe" },
            },
            {
                text = "Step 5: Trade the Wild Rabbit Tail to Vera (G-10).\n \n" ..
                       "CRITICAL: The order is fixed. Vera only accepts the item she is currently asking for, and a trade of the wrong one is silently refused.\n \n",
                route_to = "Mhaura",
                destination_highlight = { position = "G-10", offsetX = 16, offsetY = 16 },
                onmob_target = "Vera",
                onmob_target_icon = "Wild Rabbit Tail",
                trigger_on_event_id = { 135 },
                zone_max_distance = 25,
            },
            {
                text = "Step 6: Trade the Cup of Dhalmel Saliva to Vera (G-10).\n \n",
                route_to = "Mhaura",
                destination_highlight = { position = "G-10", offsetX = 16, offsetY = 16 },
                onmob_target = "Vera",
                onmob_target_icon = "Dhalmel Saliva",
                trigger_on_event_id = { 136 },
                zone_max_distance = 25,
            },
            {
                text = "Step 7: Trade the Bloody Robe to Vera (G-10) to unlock Support Job.\n \n",
                route_to = "Mhaura",
                destination_highlight = { position = "G-10", offsetX = 16, offsetY = 16 },
                onmob_target = "Vera",
                onmob_target_icon = "Bloody Robe",
                trigger_on_event_id = { 137 },
                zone_max_distance = 25,
            },
        },
        reward = {
            text = "Unlocks Support Job!\n \n",
        },
    },
}
