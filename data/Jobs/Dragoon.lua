return {
    -- =========================================================================================
    -- 1) The Holy Crest (Dragoon unlock)
    --
    -- There is NO quest script for this in LSB - only the battlefield
    -- (scripts/battlefields/Ghelsba_Outpost/Holy_Crest.lua). Every step below comes from the
    -- individual zone NPC scripts, which drive a single charvar: TheHolyCrest_Event.
    -- See data/ref/dragoon_reference.md for the full var chain.
    -- =========================================================================================
    ["1.Dragoon Quest - The Holy Crest"] = {
        requirements = {
            level = 30,
        },
        steps = {
            {
                text = "Step 1: In Port San d'Oria (I-9), go to Cargo Room A and talk to Ceraulian or Arminibit.\n \n" ..
                       "- Talking to either one starts a conversation between the two of them - it does not matter\n" ..
                       "  which you pick, and talking to the second gives the same scene.\n \n" ..
                       "===== Before you start =====\n" ..
                       "- Level 30+ on your main job.\n" ..
                       "- Rise of the Zilart expansion.\n" ..
                       "- Access to Chateau d'Oraguille: Rank 2 as a San d'Orian, or at least STARTED mission 2-3\n" ..
                       "  if you are Windurstian or Bastokan. Step 2 is inside, so sort this out first.\n \n",
                onmob_target = { "Ceraulian", "Arminibit" },
                route_to = "Port San d'Oria",
                destination_highlight = { position = "I-9", offsetX = 16, offsetY = 16 },
                trigger_on_event_id = { 24 },
            },
            {
                text = "Step 2: Talk to Novalmauge in Bostaunieux Oubliette, beneath Chateau d'Oraguille.\n \n" ..
                       "- He PATROLS between (F-8) and (G-8) - if he is not where the marker says, walk the corridor.\n" ..
                       "- Without the map: zone in, follow the hallway south, then turn west.\n \n" ..
                       "CRITICAL: If you have the Scythe weaponskill quest 'Souls in Shadow' active you cannot\n" ..
                       "progress here until you finish the Scythe of Trials. Novalmauge can hand out the Scythe of\n" ..
                       "Trials from the very same conversation that flags Dragoon - read the dialogue options and\n" ..
                       "pick the Dragoon one deliberately.\n \n",
                onmob_target = "Novalmauge",
                route_to = "Bostaunieux Oubliette",
                destination_highlight = {
                    { position = "F-8", offsetX = 16, offsetY = 16, floor_id = 15, color = "cyan" },
                    { position = "G-8", offsetX = 16, offsetY = 16, floor_id = 15, color = "cyan" },
                },
                zone_max_distance = 40,
                trigger_on_event_id = { 6 },
            },
            {
                text = "Step 3: Talk to Morjean (L-7) in Northern San d'Oria, in the manuscript room inside the\n" ..
                       "Cathedral - on your left as soon as you enter.\n \n" ..
                       "NOTE: The Novalmauge cutscene tells you to go ask the archaeologist Oiheaurese about dragons.\n" ..
                       "Do not go looking for him - he only ever appears inside the cutscene with Morjean.\n \n",
                onmob_target = "Morjean",
                route_to = "Northern San d'Oria",
                destination_highlight = { position = "L-7", offsetX = 16, offsetY = 16 },
                trigger_on_event_id = { 65 },
            },
            {
                text = "Step 4: Buy a Pickaxe, then dig up the Wyvern Egg in the Maze of Shakhrami.\n \n" ..
                       "- Ostalie in Southern San d'Oria sells pickaxes. Buy several - excavation points do not\n" ..
                       "  always give the egg and the pickaxe breaks.\n" ..
                       "- The Maze of Shakhrami entrance is at (K-5) in Tahrongi Canyon. There is a Survival Guide\n" ..
                       "  right at the entrance.\n \n" ..
                       "===== Finding an excavation point =====\n" ..
                       "- Work the points near the TAHRONGI CANYON entrance first and check every possible spot on\n" ..
                       "  that side before crossing to the Buburimu side - it is much less walking.\n" ..
                       "- Trade a pickaxe to an excavation point to receive the Wyvern Egg.\n \n" ..
                       "WARNING: At Lv30 bring Sneak and Invisible or keep a Trust out. If you end up on map 2 you\n" ..
                       "will meet Lv80+ monsters - bring sneak/invis regardless of your level for that.\n \n",
                route_to = "Maze of Shakhrami",
                items_needed = { "Pickaxe" },
                trigger_on_item_obtain = { "Wyvern Egg", "wyvern egg" },
            },
            {
                text = "Step 5: Return to Morjean (L-7) in Northern San d'Oria with the Wyvern Egg.\n \n" ..
                       "- Cutscene: Yachemidot asks you to carry the egg to the Meriphataud Mountains.\n \n",
                onmob_target = "Morjean",
                route_to = "Northern San d'Oria",
                destination_highlight = { position = "L-7", offsetX = 16, offsetY = 16 },
                trigger_on_event_id = { 62 },
            },
            {
                text = "Step 6: Trade the Wyvern Egg to the ??? at (K-8) in Meriphataud Mountains for a cutscene.\n \n" ..
                       "- It sits on the eastern edge of Drogaroga's Spine.\n \n" ..
                       "TIP: Fastest approach is the Survival Guide at the Castle Oztroja entrance. Second fastest is\n" ..
                       "the Meriphataud Mountains Outpost Survival Guide.\n \n",
                route_to = "Meriphataud Mountains",
                destination_highlight = { position = "K-8", offsetX = 16, offsetY = 16 },
                onmob_target = "meriphataud-holy-crest-qm-k8",
                zone_max_distance = 40,
                trigger_on_event_id = { 56, 33 },
                visual_zones = {
                    { zone_name = "Meriphataud Mountains", type = 'square', center = { x = 641.0, y = -15.0, z = 7.0 }, size = 2, floor_id = 0, colour = "cyan" },
                },
            },
            {
                text = "Step 7: Talk to Rahal in the Royal Knight's Quarters of Chateau d'Oraguille - on your left as\n" ..
                       "you enter - to receive the Key Item: Dragon Curse Remedy.\n \n" ..
                       "NOTE: If you have 'Lure of the Wildcat (San d'Oria)' active, Rahal berates you for being a\n" ..
                       "mercenary instead of handing anything over. Just talk to him a second time.\n \n",
                onmob_target = "Rahal",
                route_to = "Chateau d'Oraguille",
                destination_highlight = { position = "I-9", offsetX = 16, offsetY = 16 },
                zone_max_distance = 35,
                trigger_on_event_id = { 60 },
                trigger_on_keyitem_obtain = { 294 },
                keyitems_needed = { 294 },
            },
            {
                text = "Step 8: Go to the hut at (F-10) in Ghelsba Outpost and open the door to enter the battlefield\n" ..
                       "'The Holy Crest'. Defeat Cyranuce M Cutauleon to unlock Dragoon.\n \n" ..
                       "===== The battlefield =====\n" ..
                       "- 6 players max, 15 minute limit, UNCAPPED.\n" ..
                       "- TP and buffs are NOT lost on entry - buff up outside and walk in loaded.\n" ..
                       "- CRITICAL: Trust magic cannot be used in this fight. Whatever you rely on outside, you do\n" ..
                       "  not have it in here.\n" ..
                       "- Entry needs the Dragon Curse Remedy key item. Only players on this quest (or who have\n" ..
                       "  already finished it) can go in.\n \n" ..
                       "===== Cyranuce M Cutauleon =====\n" ..
                       "- Most non-mage jobs beat this solo at Lv30. Mage jobs usually want a few more levels or a\n" ..
                       "  friend along.\n \n" ..
                       "- Ghelsba Outpost is reached from West Ronfaure (J-11).\n \n",
                route_to = "Ghelsba Outpost",
                destination_highlight = { position = "F-10", offsetX = 16, offsetY = 16 },
                onmob_target = "ghelsba-outpost-hut-door-f10",
                onmob_enemy = "Cyranuce M Cutauleon",
                zone_max_distance = 40,
                trigger_on_event_id = { 32001 },
                kill_requirement = {
                    count = 1,
                    enemies = { "Cyranuce M Cutauleon" },
                    display_only = true,
                    reset_on_zone_entry = true,
                },
            },
        },
        reward = {
            text = "Unlocks the Dragoon job!\n \n" ..
                   "Title: Heir to the Holy Crest\n" ..
                   "Job gesture: dragoon\n" ..
                   "San d'Oria fame +20\n" ..
                   "You also name your wyvern here - the option you pick in the winning cutscene sets the name.\n \n",
        },
    },
}
