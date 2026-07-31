return {
    -- =========================================================================================
    -- 1) Save My Son
    --
    -- Log 3 (Jeuno) / Quest 5. NOT the unlock - it rewards the Beast Whistle. The job is
    -- unlocked by Path of the Beastmaster below. See data/ref/beastmaster_reference.md.
    -- =========================================================================================
    ["1.Beastmaster Quest - Save My Son"] = {
        requirements = {
            level = 30,
        },
        prerequisites = {
            { category = "Quests", subfile = "Upper Jeuno", name = "Chocobo's Wounds" },
        },
        steps = {
            {
                text = "Step 1: Examine the door to the Merchant's House in Lower Jeuno to start the quest.\n \n" ..
                       "- The dialogue ends in a choice - take the option that accepts.\n \n" ..
                       "CRITICAL: 'Chocobo's Wounds' must be COMPLETE first. The server checks it directly:\n" ..
                       "  hasCompletedQuest(JEUNO, CHOCOBOS_WOUNDS) and getMainLvl() >= 30\n" ..
                       "That quest is in Quests -> Upper Jeuno.\n \n",
                onmob_target = "jeuno-merchants-house-door",
                route_to = "Lower Jeuno",
                zone_max_distance = 25,
                trigger_on_event_id = { 164 },
            },
            {
                text = "Step 2: Go to Qufim Island and examine the Nightflowers - AT NIGHT.\n \n" ..
                       "CRITICAL: The flowers only respond between roughly 21:30 and dawn on the Vana'diel clock.\n" ..
                       "Show up in daylight and nothing happens at all - it does not tell you why. Check your\n" ..
                       "in-game clock before making the trip.\n \n" ..
                       "- You examine them; nothing is traded and you need no item.\n" ..
                       "- Qufim Island is straight down from Port Jeuno (I-11).\n \n" ..
                       "WARNING: Qufim is a level 30+ zone and the walk is exposed. Gigas and worms will happily\n" ..
                       "end a solo trip at 30 - bring Sneak/Invisible, or a friend, or both.\n \n",
                route_to = "Qufim Island",
                onmob_target = "qufim-nightflowers",
                zone_max_distance = 40,
                trigger_on_event_id = { 0 },
                visual_zones = {
                    { zone_name = "Qufim Island", type = 'square', center = { x = -264.8, y = -3.7, z = 28.8 }, size = 2, floor_id = 0, colour = "cyan" },
                },
            },
            {
                text = "Step 3: Return to the Merchant's House door in Lower Jeuno for the closing cutscene and the\n" ..
                       "Beast Whistle.\n \n" ..
                       "(Shalott in Upper Jeuno has mid-quest dialogue on this. Optional - she does not advance\n" ..
                       "anything.)\n \n" ..
                       "CRITICAL: Keep the Beast Whistle. It is the item Beastmaster actually uses to charm, and\n" ..
                       "you want it in hand the moment the job unlocks.\n \n",
                onmob_target = "jeuno-merchants-house-door",
                route_to = "Lower Jeuno",
                zone_max_distance = 25,
                trigger_on_event_id = { 163 },
            },
        },
        reward = {
            text = "Beast Whistle\n \n" ..
                   "2,100 gil\n" ..
                   "Title: Life Saver\n" ..
                   "+7 fame with San d'Oria, Bastok AND Windurst\n \n" ..
                   "This does NOT unlock the job - it opens 'Path of the Beastmaster', which does.\n \n",
        },
    },

    -- =========================================================================================
    -- 2) Path of the Beastmaster (the actual unlock)
    --
    -- Log 3 (Jeuno) / Quest 19. One conversation - unlockJob(xi.job.BST) sits in the
    -- onEventFinish for event 70.
    -- =========================================================================================
    ["2.Beastmaster Quest - Path of the Beastmaster"] = {
        requirements = {
            level = 30,
        },
        prerequisites = {
            { category = "Jobs", subfile = "Beastmaster", name = "1.Beastmaster Quest - Save My Son" },
        },
        steps = {
            {
                text = "Step 1: Talk to Brutus at the Chocobo Stables in Upper Jeuno to unlock Beastmaster.\n \n" ..
                       "- That is the whole quest. One conversation, no items, no travel.\n \n" ..
                       "- The server gates it on 'Save My Son' being complete and main level 30+:\n" ..
                       "  hasCompletedQuest(JEUNO, SAVE_MY_SON) and getMainLvl() >= 30\n \n" ..
                       "NOTE: Same Brutus who ran 'Chocobo's Wounds' - if he only wants to talk about chocobos,\n" ..
                       "one of the two prerequisites has not actually registered as complete yet.\n \n",
                onmob_target = "Brutus",
                route_to = "Upper Jeuno",
                zone_max_distance = 30,
                trigger_on_event_id = { 70 },
            },
        },
        reward = {
            text = "Unlocks the Beastmaster job!\n \n" ..
                   "Title: Animal Trainer\n" ..
                   "Job gesture: beastmaster\n" ..
                   "+7 fame with San d'Oria, Bastok AND Windurst\n \n",
        },
    },
}
