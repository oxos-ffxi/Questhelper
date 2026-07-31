return {
    -- =========================================================================================
    -- 1) Path of the Bard (Bard unlock)
    --
    -- Log 3 (Jeuno) / Quest 20. The quest itself is tiny - the work is the two prerequisite
    -- quests that gate it. See data/ref/bard_reference.md.
    -- =========================================================================================
    ["1.Bard Quest - Path of the Bard"] = {
        requirements = {
            level = 30,
        },
        steps = {
            {
                text = "Step 1: Prerequisite check - you cannot start this until 'A Minstrel in Despair' is COMPLETE.\n \n" ..
                       "The server gates the whole quest on it:\n" ..
                       "  getQuestStatus(JEUNO, A_MINSTREL_IN_DESPAIR) == QUEST_COMPLETED\n \n" ..
                       "===== The lead-in chain, both from Lower Jeuno =====\n" ..
                       "1. 'The Old Monument' - talk to Mertaire in Lower Jeuno, then examine the Song Runes in\n" ..
                       "   Buburimu Peninsula, then trade him a Sheet of Parchment.\n" ..
                       "2. 'A Minstrel in Despair' - trade a Sheet of Parchment to the Buburimu Song Runes for the\n" ..
                       "   Poetic Parchment, then trade that to Mertaire.\n \n" ..
                       "Tick this step once both are done and showing complete in your log.\n \n" ..
                       "NOTE: Mertaire and Bki Tbujhja stand next to each other in Lower Jeuno, so all the talking\n" ..
                       "for the whole chain happens in one spot.\n \n",
                onmob_target = "Mertaire",
                route_to = "Lower Jeuno",
                zone_max_distance = 30,
            },
            {
                text = "Step 2: Talk to Bki Tbujhja in Lower Jeuno. He tells you about song runes in Valkurm Dunes.\n \n" ..
                       "(Mataligeat nearby has extra dialogue on this quest, and Mertaire has some too. Neither is\n" ..
                       "required - they are flavour.)\n \n",
                onmob_target = "Bki Tbujhja",
                route_to = "Lower Jeuno",
                zone_max_distance = 30,
                trigger_on_event_id = { 182 },
            },
            {
                text = "Step 3: Examine the Song Runes on the hidden beach in Valkurm Dunes for the cutscene that\n" ..
                       "unlocks Bard.\n \n" ..
                       "- Nothing is traded and nothing needs to be in your inventory - you just click them.\n" ..
                       "- The marker beam points straight at them; they sit on the secluded stretch of beach.\n \n" ..
                       "TIP: Valkurm Dunes is reached from La Theine Plateau (L-5), Konschtat Highlands (M-11), or\n" ..
                       "the Selbina ferry (G-9).\n \n" ..
                       "WARNING: The dunes are a low-level zone but the walk is long and there is plenty that will\n" ..
                       "aggro a straggler. Sneak is worth having if you are going in at 30.\n \n",
                route_to = "Valkurm Dunes",
                onmob_target = "valkurm-song-runes",
                zone_max_distance = 40,
                trigger_on_event_id = { 2 },
                visual_zones = {
                    { zone_name = "Valkurm Dunes", type = 'square', center = { x = -721.0, y = -7.0, z = 102.0 }, size = 2, floor_id = 0, colour = "cyan" },
                },
            },
        },
        reward = {
            text = "Unlocks the Bard job!\n \n" ..
                   "3,000 gil\n" ..
                   "Title: Wandering Minstrel\n" ..
                   "Job gesture: bard\n" ..
                   "+7 fame with San d'Oria, Bastok AND Windurst\n \n",
        },
    },
}
