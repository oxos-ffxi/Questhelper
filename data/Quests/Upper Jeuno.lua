return {
    -- =========================================================================================
    -- Chocobo's Wounds
    --
    -- Log 3 (Jeuno) / Quest 4. The chocobo-riding licence quest, and the gateway to the whole
    -- Beastmaster line: Chocobo's Wounds -> Save My Son -> Path of the Beastmaster.
    -- =========================================================================================
    ["Chocobo's Wounds"] = {
        requirements = {
            level = 20,
        },
        steps = {
            {
                text = "Step 1: Talk to Brutus at the Chocobo Stables in Upper Jeuno and agree to look after the\n" ..
                       "injured chocobo.\n \n" ..
                       "- Level 20+ on your main job.\n" ..
                       "- His dialogue ends in a choice - you must pick the option that accepts, or nothing starts.\n \n" ..
                       "(Osker, the stablehand standing right there, gives you a read on the bird's condition at\n" ..
                       "every stage. Purely optional, but it is the in-game way to check your progress.)\n \n",
                onmob_target = "Brutus",
                route_to = "Upper Jeuno",
                zone_max_distance = 30,
                trigger_on_event_id = { 71 },
            },
            {
                text = "Step 2: Get 4 Gausebit Wildgrass.\n \n" ..
                       "This step ticks itself off the moment you are holding 4, however you got them - so if you\n" ..
                       "buy them it skips straight past on its own.\n \n" ..
                       "===== Buy them (fastest) =====\n" ..
                       "- Auction House: [Weapons > Ammo & Misc. > Pet Items]\n" ..
                       "- Listed as Gausebit Wildgrass. They are cheap and stack, so buying is almost always worth\n" ..
                       "  it over farming.\n \n" ..
                       "===== Or farm them =====\n" ..
                       "- Crane Fly (Lv18-21) around the outpost in Meriphataud Mountains (E-5). Best drop rate by\n" ..
                       "  a wide margin - this is the one to camp.\n" ..
                       "- Hares in the same area also drop it, but far less often. Only worth killing if they are\n" ..
                       "  already in your way.\n \n" ..
                       "NOTE: The drop is called a clump of gausebit wildgrass in the log, and Gausebit Wildgrass in your inventory and on the Auction House. Same item.\n \n" ..
                       "TIP: Grab a couple spare. If a trade gets fumbled you do not want to make this trip twice.\n \n",
                route_to = "Meriphataud Mountains",
                destination_highlight = { position = "E-5", offsetX = 16, offsetY = 16 },
                onmob_enemy = "Crane Fly",
                zone_max_distance = 40,
                items_needed = {
                    { item = "Gausebit Wildgrass", quantity = 4 }
                },
                -- Inventory check runs on a timer and is case-insensitive substring matched, so it
                -- catches AH purchases, mob drops and grass you already had. The obtain triggers
                -- below just complete it the instant the 4th one lands.
                skip_if_have = { item = "gausebit", quantity = 4 },
                trigger_on_item_obtain = {
                    { item = "Gausebit Wildgrass", quantity = 4 },
                    { item = "gausebit wildgrass", quantity = 4 },
                },
            },
            {
                text = "Step 3: Feed the wounded chocobo the Gausebit Wildgrass until it recovers.\n \n" ..
                       "- Trade ONE at a time. Trading a stack does nothing - the server checks for exactly one\n" ..
                       "  item in the trade window.\n" ..
                       "- Repeat once per stage of recovery. The final trade fires the completion cutscene and\n" ..
                       "  hands you the Chocobo License.\n \n" ..
                       "CRITICAL: There is a 45 second cooldown between feeds. Trading again too early is simply ignored - wait it out, then trade the next one.\n \n" ..
                       "WARNING: Do NOT trade a Bunch of Gysahl Greens. The chocobo refuses them and it is a wasted trip to the vendor. It wants GAUSEBIT WILDGRASS.\n \n" ..
                       "TIP: Osker will tell you how the bird is doing between feeds if you want to check progress.\n \n",
                onmob_target = "upper-jeuno-wounded-chocobo",
                route_to = "Upper Jeuno",
                zone_max_distance = 30,
                --trigger_on_event_id = { 64 },
                trigger_on_keyitem_obtain = { 138 },
                keyitems_needed = { 138 },
            },
        },
        reward = {
            text = "Key Item: Chocobo License - you can now rent and ride chocobos.\n \n" ..
                   "Title: Chocobo Trainer\n" ..
                   "+7 fame with San d'Oria, Bastok AND Windurst\n \n" ..
                   "Opens up 'Save My Son', the first half of the Beastmaster unlock.\n \n",
        },
    },
}
