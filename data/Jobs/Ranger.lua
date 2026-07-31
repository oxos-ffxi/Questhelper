return {
    -- =========================================================================================
    -- 1) The Fanged One (Ranger unlock)
    --
    -- Log 2 (Windurst) / Quest 31. See data/ref/Jobs/ranger_reference.md.
    -- CRITICAL: Old Sabertooth must NOT be fought - it dies on its own.
    -- =========================================================================================
    ["1.Ranger Quest - The Fanged One"] = {
        requirements = {
            level = 30,
        },
        steps = {
            {
                text = "Step 1: Talk to Perih Vashai in Windurst Woods (K-7) to accept the quest.\n \n" ..
                       "- She wants proof of an old tiger, and sends you to Sauromugue Champaign.\n \n" ..
                       "(Kapeh Myohrye and Muhk Johldy, also in Windurst Woods, have optional dialogue about the\n" ..
                       "quest. Neither is required.)\n \n",
                onmob_target = "Perih Vashai",
                route_to = "Windurst Woods",
                destination_highlight = { position = "K-7", offsetX = 16, offsetY = 16 },
                zone_max_distance = 40,
                trigger_on_event_id = { 351 },
            },
            {
                text = "Step 2: In Sauromugue Champaign, find the cave at (L-10) - go up the cliff at (L-8) - and\n" ..
                       "examine the Tiger Bones to spawn Old Sabertooth.\n \n" ..
                       "CRITICAL: DO NOT FIGHT IT. Old Sabertooth does not aggro, and it dies on its own after\n" ..
                       "about 3 real minutes. If you attack it or otherwise disturb it, you get NO key item and\n" ..
                       "have to wait out the repop timer and start the whole pop again. Stand back and watch.\n \n" ..
                       "- Once it has died by itself, examine the Tiger Bones again for the Key Item: Old Tiger's\n" ..
                       "  Fang. There is a time window on this, so do not wander off - click the bones promptly.\n \n" ..
                       "===== Getting in and out =====\n" ..
                       "- TIP: The Survival Guide at (J-9/J-10) is the closest warp.\n" ..
                       "- WARNING: Three Sabertooth Tigers sit outside the cave. You can ride a chocobo straight in\n" ..
                       "  past them, but then you have to deal with them on the way out - bring an Instant Warp\n" ..
                       "  scroll if you would rather not.\n \n",
                route_to = "Sauromugue Champaign",
                destination_highlight = {
                    { position = "L-8", offsetX = 16, offsetY = 16, label = "Cliff", color = "yellow" },
                    { position = "L-10", offsetX = 16, offsetY = 16, label = "Cave", color = "cyan" },
                },
                onmob_target = "sauromugue-tiger-bones-l10",
                zone_max_distance = 40,
                visual_zones = {
                    { zone_name = "Sauromugue Champaign", type = 'square', center = { x = 666.0, y = -8.0, z = -379.0 }, size = 2, floor_id = 0, colour = "cyan" },
                },
            },
            {
                text = "Step 3: Return to Perih Vashai in Windurst Woods (K-7) with the Old Tiger's Fang to unlock\n" ..
                       "Ranger.\n \n" ..
                       "- She takes the key item and hands over the Ranger's Necklace.\n \n" ..
                       "(Optional flavour: trading her a Black Tiger Fang at any point during the quest gives an\n" ..
                       "extra scene. It is not needed and it eats the fang.)\n \n",
                onmob_target = "Perih Vashai",
                route_to = "Windurst Woods",
                destination_highlight = { position = "K-7", offsetX = 16, offsetY = 16 },
                zone_max_distance = 40,
                trigger_on_event_id = { 357 },
            },
        },
        reward = {
            text = "Unlocks the Ranger job!\n \n" ..
                   "Ranger's Necklace\n" ..
                   "Title: The Fanged One\n" ..
                   "Job gesture: ranger\n" ..
                   "Windurst fame +20\n \n",
        },
    },
}
