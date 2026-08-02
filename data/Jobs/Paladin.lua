return {
    -- =========================================================================================
    -- 1) A Squire's Test
    -- =========================================================================================
    ["1.Paladin Quest - A Squire's Test"] = {
        steps = {
            {
                text = "Step 1: Speak with Balasiel in Southern San d'Oria (F-7) and accept the quest.\n \n" ..
                       "- He is awkward to find. From Watchdog Alley (F-6) by Celyddon: west into the stairwell,\n" ..
                       "  up, first left. Do not take the wooden walkway - cross the wooden bridge instead.\n" ..
                       "  The stairs go up, then down and curve around to him.\n \n",
                route_to = "Southern San d'Oria",
                destination_highlight = { position = "F-7", offsetX = 16, offsetY = 16 },
            },
            {
                text = "Step 2: Get a Revival Tree Root.\n \n" ..
                       "- Auction House: [Materials > Alchemy]. Quickest option whenever one is listed.\n" ..
                       "NOTE: Some enemies spawn between 20:00 and 4:00 Vana'diel time - outside that window there is nothing there to kill.\n \n",
                route_choices_label = "Farm at (click one):",
                route_choices = {
                    {
                        group = "Gusgen Mines - best rate, longer trip",
                        default = true,
                        zones = {
                            {
                                zone = "Gusgen Mines",
                                destination_highlight = {
                                    { position = "H-7", offsetX = 16, offsetY = 16, floor_id = 1, label = "Bandersnatch" },
                                },
                            },
                        },
                    },
                    {
                        group = "Ronfaure - closest, night only",
                        -- East has no known camp spot, so it routes with no pin rather than
                        -- borrowing West's.
                        zones = {
                            { zone = "West Ronfaure", destination_highlight = { position = "H-9", offsetX = 16, offsetY = 16 } },
                            "East Ronfaure",
                        },
                    },
                },
                onmob_enemy = { "Bandersnatch", "Bogy", "Tainted Hound" },
                onmob_enemy_colour = "red",
                items_needed = { "Revival Tree Root" },
                trigger_on_item_obtain = { "revival tree root", "Revival Tree Root" },
            },
            {
                text = "Step 3: Trade the Revival Tree Root to Balasiel (F-7) to complete the quest.\n \n" ..
                       "- You do not need to zone after accepting - trade it straight away.\n \n",
                route_to = "Southern San d'Oria",
                destination_highlight = { position = "F-7", offsetX = 16, offsetY = 16 },
            },
        },
        reward = {
            text = "Completes the first Paladin test.\n \n" ..
                   "Opens A Squire's Test II.\n \n",
        },
    },

    -- =========================================================================================
    -- 2) A Squire's Test II
    -- =========================================================================================
    ["2.Paladin Quest - A Squire's Test II"] = {
        prerequisites = {
            { category = "Jobs", subfile = "Paladin", name = "1.Paladin Quest - A Squire's Test" },
        },
        steps = {
            {
                text = "Step 1: Return to Balasiel in Southern San d'Oria (F-7) to start the second test.\n \n" ..
                       "- Bring Sneak and Invisible for Ordelle's Caves, and a warp or teleport item to save the\n" ..
                       "  run back once you have the dew.\n" ..
                       "- (Optional: Chanpau at (E-7) here, and Morjean at (L-7) in Northern San d'Oria, have extra\n" ..
                       "  dialogue. Morjean is unavailable while you are mid-way through Dragoon's The Holy Crest.)\n \n",
                route_to = "Southern San d'Oria",
                destination_highlight = { position = "F-7", offsetX = 16, offsetY = 16 },
            },
            {
                text = "Step 2: Travel to La Theine Plateau (F-6), drop into the ravine near Equesobillot and enter Ordelle's Caves.\n \n" ..
                       "- There is a Survival Guide at the entrance.\n \n",
                route_to = "La Theine Plateau",
                destination_highlight = { position = "F-6", offsetX = 16, offsetY = 16 },
            },
            {
                text = "Step 3: In Ordelle's Caves, take the B route from Map 1 (I-6) to the room on Map 2 (G-7) holding two ??? points.\n \n" ..
                       "- Click the ??? in the pool of water first, then quickly click the second ??? near the\n" ..
                       "  centre of the room for the Key Item: Stalactite Dew.\n" ..
                       "- Too slow and nothing happens - re-click the first ??? and try again.\n" ..
                       "- Aggro: Shriekers, bats and jellies are sound. Will-o'-the-Wisp near the water is sight\n" ..
                       "  and magic.\n \n",
                images = {
                    {
                        zone_name = "Ordelle's Caves",
                        floor_id  = 1,
                        width     = 512,
                        height    = 512,
                        state     = 3,
                        highlights = {
                            { position = "I-6", offsetX = 16, offsetY = 16, label = "B route" },
                        },
                    },
                    -- Map 2's raw floor id is unconfirmed - see data/ref/Jobs/paladin_reference.md.
                    {
                        zone_name = "Ordelle's Caves",
                        floor_id  = 2,
                        width     = 512,
                        height    = 512,
                        state     = 3,
                        highlights = {
                            { position = "G-7", offsetX = 16, offsetY = 16, label = "???" },
                        },
                    },
                },
            },
            {
                text = "Step 4: Take the Stalactite Dew back to Balasiel in Southern San d'Oria (F-7).\n \n" ..
                       "- A Knight's Test can be started straight away if you meet its requirements.\n \n",
                route_to = "Southern San d'Oria",
                destination_highlight = { position = "F-7", offsetX = 16, offsetY = 16 },
            },
        },
        reward = {
            text = "Completes the second Paladin test.\n \n" ..
                   "Opens A Knight's Test.\n \n",
        },
    },

    -- =========================================================================================
    -- 3) A Knight's Test
    -- =========================================================================================
    ["3.Paladin Quest - A Knight's Test"] = {
        prerequisites = {
            { category = "Jobs", subfile = "Paladin", name = "2.Paladin Quest - A Squire's Test II" },
        },
        steps = {
            {
                text = "Step 1: Speak with Balasiel in Southern San d'Oria (F-7) for the Key Item: Book of Tasks.\n \n",
                route_to = "Southern San d'Oria",
                destination_highlight = { position = "F-7", offsetX = 16, offsetY = 16 },
            },
            {
                text = "Step 2: Still in Southern San d'Oria, talk to Baunise on the Westgate parapet (H-9) and Cahaurme on the Eastgate parapet (J-9).\n \n" ..
                       "- Baunise gives the Key Item: Book of the West.\n" ..
                       "- Cahaurme gives the Key Item: Book of the East.\n \n",
                route_to = "Southern San d'Oria",
                destination_highlight = {
                    { position = "H-9", offsetX = 16, offsetY = 16, label = "West" },
                    { position = "J-9", offsetX = 16, offsetY = 16, label = "East" },
                },
            },
            {
                text = "Step 3: In Davoi, examine the Disused Well at (E-10) for the Key Item: Knight's Soul.\n \n" ..
                       "- Route: drop into the water at the broken bridge (I-8), follow it west to (D-8), climb\n" ..
                       "  out at (D-9) and cross the camp to (E-10).\n \n" ..
                       "WARNING: Orcs in Davoi aggro and hit hard for this level. Sneak and Invisible both.\n \n",
                route_to = "Davoi",
                destination_highlight = { position = "E-10", offsetX = 16, offsetY = 16 },
            },
            {
                text = "Step 4: Return to Balasiel in Southern San d'Oria (F-7) with the Knight's Soul.\n \n",
                route_to = "Southern San d'Oria",
                destination_highlight = { position = "F-7", offsetX = 16, offsetY = 16 },
            },
        },
        reward = {
            text = "Completes A Knight's Test.\n \n",
        },
    },

    -- =========================================================================================
    -- 4) Father and Son
    --
    -- Not a Paladin-only quest, but Sharpening the Sword will not start until the fishing rod
    -- has been handed back, so it belongs in this chain.
    -- =========================================================================================
    ["4.Paladin Quest - Father and Son"] = {
        steps = {
            {
                text = "Step 1: Talk to Ailbeche by the fountain in Northern San d'Oria (J-9).\n \n" ..
                       "- He is the boy crying about his lost father, who he says wears armour but no helmet.\n \n",
                route_to = "Northern San d'Oria",
                destination_highlight = { position = "J-9", offsetX = 16, offsetY = 16 },
            },
            {
                text = "Step 2: Speak with Exoroche inside Helbort's Blades in Southern San d'Oria (K-7).\n \n" ..
                       "- He is the father.\n \n",
                route_to = "Southern San d'Oria",
                destination_highlight = { position = "K-7", offsetX = 16, offsetY = 16 },
            },
            {
                text = "Step 3: Return to Ailbeche in Northern San d'Oria (J-9).\n \n" ..
                       "- Exoroche turns up, scolds him, and hands you the boy's Willow Fishing Rod. This is the\n" ..
                       "  end of the quest proper.\n \n",
                route_to = "Northern San d'Oria",
                destination_highlight = { position = "J-9", offsetX = 16, offsetY = 16 },
            },
            {
                text = "Step 4: Trade the Willow Fishing Rod back to Ailbeche (J-9).\n \n" ..
                       "- There is no reward for handing it back.\n \n" ..
                       "CRITICAL: Sharpening the Sword will not start until the rod is returned. Most write-ups call this step optional - for the Paladin chain it is not.\n \n",
                route_to = "Northern San d'Oria",
                destination_highlight = { position = "J-9", offsetX = 16, offsetY = 16 },
            },
        },
        reward = {
            text = "Willow Fishing Rod (hand it back in step 4).\n \n" ..
                   "Opens Sharpening the Sword.\n \n",
        },
    },

    -- =========================================================================================
    -- 5) Sharpening the Sword
    -- =========================================================================================
    ["5.Paladin Quest - Sharpening the Sword"] = {
        prerequisites = {
            { category = "Jobs", subfile = "Paladin", name = "4.Paladin Quest - Father and Son" },
        },
        steps = {
            {
                text = "Step 1: Speak with Ailbeche in Northern San d'Oria (J-9), who asks for the Key Item: Ordelle Whetstone.\n \n" ..
                       "- Then speak with Sobane in Southern San d'Oria (D-6). If you get the cutscene for Signed\n" ..
                       "  in Blood or Tea with a Tonberry instead, just talk to him again.\n \n",
                onmob_target = "Sobane",
                route_to = "Northern San d'Oria",
                destination_highlight = { position = "J-9", offsetX = 16, offsetY = 16 },
            },
            {
                text = "Step 2: Enter Ordelle's Caves from La Theine Plateau (F-7) and find the Stalagmite on Map 1.\n \n" ..
                       "- Reported around (I-5), with (H-9) and (G-6) on the way - all three are marked.\n" ..
                       "- Clicking the Stalagmite spawns Polevik, an Earth Elemental.\n" ..
                       "- (There are Survival Guides at West Ronfaure and at the cave entrance.)\n \n",
                images = {
                    {
                        zone_name = "Ordelle's Caves",
                        floor_id  = 1,
                        width     = 512,
                        height    = 512,
                        state     = 2,
                        highlights = {
                            { position = "I-5", offsetX = 16, offsetY = 16, label = "1" },
                            { position = "H-9", offsetX = 16, offsetY = 16, label = "2" },
                            { position = "G-6", offsetX = 16, offsetY = 16, label = "3" },
                        },
                    },
                },
            },
            {
                text = "Step 3: Kill Polevik, then click the Stalagmite again for the Key Item: Ordelle Whetstone.\n \n" ..
                       "- Polevik is an elemental - Lv65+ or Trusts is the sensible bar for soloing it.\n \n",
                onmob_enemy = "Polevik",
                kill_requirement = {
                    count = 1,
                    enemies = { "Polevik" },
                    zone = "Ordelle's Caves",
                    count_party_kills = true,
                    display_only = true,
                },
            },
            {
                text = "Step 4: Take the Ordelle Whetstone back to Ailbeche in Northern San d'Oria (J-9).\n \n",
                route_to = "Northern San d'Oria",
                destination_highlight = { position = "J-9", offsetX = 16, offsetY = 16 },
            },
        },
        reward = {
            text = "Completes Sharpening the Sword.\n \n" ..
                   "Opens A Boy's Dream.\n \n",
        },
    },

    -- =========================================================================================
    -- 6) A Boy's Dream
    -- =========================================================================================
    ["6.Paladin Quest - A Boy's Dream"] = {
        requirements = {
            level = 50,
        },
        prerequisites = {
            { category = "Jobs", subfile = "Paladin", name = "5.Paladin Quest - Sharpening the Sword" },
        },
        steps = {
            {
                text = "Step 1: As a Lv50+ Paladin, speak with Ailbeche in Northern San d'Oria (J-9), then Exoroche in Helbort's Blades, Southern San d'Oria (K-7).\n \n" ..
                       "- Ailbeche asks for a Giant Shell Bug; Exoroche fills in what it is for.\n \n",
                route_to = "Northern San d'Oria",
                destination_highlight = { position = "J-9", offsetX = 16, offsetY = 16 },
            },
            {
                text = "Step 2: Get a Giant Shell Bug in Crawlers' Nest.\n \n" ..
                       "- From the entrance on Map 1 (H-8), take exit A down to Map 2.\n" ..
                       "- Check the ??? in the alcove at (H-9) to spawn Dreadbug, which drops 1-4 of them.\n" ..
                       "- They turn up on the Auction House too, but not reliably.\n \n",
                images = {
                    -- Map 1 is raw floor 15 for this zone (data/floor_mappings.lua [197]).
                    {
                        zone_name = "Crawlers' Nest",
                        floor_id  = 15,
                        width     = 512,
                        height    = 512,
                        state     = 2,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16, label = "In" },
                        },
                    },
                    -- Map 2's raw floor id is unconfirmed - see data/ref/Jobs/paladin_reference.md.
                    {
                        zone_name = "Crawlers' Nest",
                        width     = 512,
                        height    = 512,
                        state     = 2,
                        highlights = {
                            { position = "H-9", offsetX = 16, offsetY = 16, label = "???" },
                        },
                    },
                },
                onmob_enemy = "Dreadbug",
                items_needed = { "Giant Shell Bug" },
                skip_if_have = { item = "giant shell bug", quantity = 1 },
                trigger_on_item_obtain = { "giant shell bug", "Giant Shell Bug" },
            },
            {
                text = "Step 3: Fish up Odontotyrannus in Castle Oztroja, at the pond around (H-9) on Map 3.\n \n" ..
                       "- Route in: Map 1 (J-8), Map 2 (F-9), then Map 3.\n" ..
                       "- Use a Giant Shell Bug as bait and bring a rod. It fights you the moment it bites.\n" ..
                       "- Monster fishing is its own minigame - read up or bring help if you have not done it.\n \n",
                images = {
                    {
                        zone_name = "Castle Oztroja",
                        floor_id  = 1,
                        width     = 512,
                        height    = 512,
                        state     = 3,
                        highlights = {
                            { position = "J-8", offsetX = 16, offsetY = 16, label = "1" },
                        },
                    },
                    {
                        zone_name = "Castle Oztroja",
                        floor_id  = 2,
                        width     = 512,
                        height    = 512,
                        state     = 3,
                        highlights = {
                            { position = "F-9", offsetX = 16, offsetY = 16, label = "2" },
                        },
                    },
                    {
                        zone_name = "Castle Oztroja",
                        floor_id  = 3,
                        width     = 512,
                        height    = 512,
                        state     = 3,
                        highlights = {
                            { position = "H-9", offsetX = 16, offsetY = 16, label = "Pond" },
                        },
                    },
                },
                onmob_enemy = "Odontotyrannus",
            },
            {
                text = "Step 4: Trade the Odontotyrannus to Zaldon at the Fishermen's Guild in Selbina (H-9) for the Key Item: Knight's Boots.\n \n" ..
                       "- If you have not given Ailbeche his Giant Shell Bug yet, either order works.\n \n",
                route_to = "Selbina",
                destination_highlight = { position = "H-9", offsetX = 16, offsetY = 16 },
            },
            {
                text = "Step 5: Speak with Ailbeche in Northern San d'Oria (J-9), then Exoroche in Southern San d'Oria (K-7), then check Prince Trion's room in Chateau d'Oraguille (H-7).\n \n" ..
                       "- On Paladin main the Chateau cutscene also starts Under Oath.\n \n",
                route_to = "Chateau d'Oraguille",
                destination_highlight = { position = "H-7", offsetX = 16, offsetY = 16 },
            },
        },
        reward = {
            text = "Gallant Leggings\n \n" ..
                   "Opens Under Oath.\n \n",
        },
    },

    -- =========================================================================================
    -- 7) Under Oath
    -- =========================================================================================
    ["7.Paladin Quest - Under Oath"] = {
        requirements = {
            level = 50,
        },
        prerequisites = {
            { category = "Jobs", subfile = "Paladin", name = "6.Paladin Quest - A Boy's Dream" },
        },
        steps = {
            {
                text = "Step 1: Click Prince Trion's door in Chateau d'Oraguille (H-7).\n \n" ..
                       "- If you finished A Boy's Dream on Paladin you have already had this cutscene.\n" ..
                       "- (This quest can block the Trust: Trion unlock if you have not seen all of the door\n" ..
                       "  cutscenes yet, so clear those first if you want the Trust.)\n \n",
                route_to = "Chateau d'Oraguille",
                destination_highlight = { position = "H-7", offsetX = 16, offsetY = 16 },
            },
            {
                text = "Step 2: In Southern San d'Oria, speak with Vemalpeau (M-7), then Najjar in Lion Springs Tavern (K-6), then Ullasa at Count Caffaule's Manor (B-6).\n \n" ..
                       "- Ullasa brings up Mique's Paintbrush, which is the next objective.\n \n",
                route_to = "Southern San d'Oria",
                destination_highlight = {
                    { position = "M-7", offsetX = 16, offsetY = 16, label = "1" },
                    { position = "K-6", offsetX = 16, offsetY = 16, label = "2" },
                    { position = "B-6", offsetX = 16, offsetY = 16, label = "3" },
                },
            },
            {
                text = "Step 3: Open a coffer in Castle Zvahl Baileys for the Key Item: Mique's Paintbrush.\n \n" ..
                       "- Zvahl Coffer Keys drop from Ahriman, Abyssal Demons, Arch Demons, Blood Demons and Doom\n" ..
                       "  Demons, lower down on Map 3. Thieves can pick the coffer instead.\n" ..
                       "- The Curio Vendor Moogle sells a Zvahl Coffer Key for 5,000 gil once that shop is open.\n" ..
                       "- Paladin does not have to be your main job for this coffer.\n \n" ..
                       "CRITICAL: An active artifact quest for this same coffer takes priority - you will get the AF piece and no paintbrush until that quest is finished.\n \n",
                images = {
                    -- Map 3 is raw floor 15 for this zone (data/floor_mappings.lua [161]).
                    {
                        zone_name = "Castle Zvahl Baileys",
                        floor_id  = 15,
                        width     = 512,
                        height    = 512,
                        state     = 3,
                        highlights = {
                            { position = "F-6", offsetX = 16, offsetY = 16 },
                            { position = "F-10", offsetX = 16, offsetY = 16 },
                            { position = "J-6", offsetX = 16, offsetY = 16 },
                            { position = "J-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 4: Return to Vemalpeau in Southern San d'Oria (M-7).\n \n" ..
                       "- Go upstairs and examine the painting: pick 'look behind the frame', then 'open and\n" ..
                       "  examine', for the Key Item: Strange Sheet of Paper.\n \n",
                route_to = "Southern San d'Oria",
                destination_highlight = { position = "M-7", offsetX = 16, offsetY = 16 },
            },
            {
                text = "Step 5: Speak to Exoroche in Helbort's Blades (K-7), then examine the Village Well in Davoi (G-9).\n \n" ..
                       "- The well spawns two NMs: Three-eyed Prozpuz and One-eyed Gwajboj. Clear the Orcs around\n" ..
                       "  it first - a party around Lv55+ is the usual call.\n" ..
                       "- Each Paladin who needs one loots their own Well Weight.\n" ..
                       "- Trade the Well Weight to the Village Well for the Key Item: Knight's Confession.\n \n",
                route_to = "Davoi",
                destination_highlight = { position = "G-9", offsetX = 16, offsetY = 16 },
                onmob_enemy = { "Three-eyed Prozpuz", "One-eyed Gwajboj" },
                kill_requirement = {
                    count = 2,
                    enemies = { "Three-eyed Prozpuz", "One-eyed Gwajboj" },
                    zone = "Davoi",
                    count_party_kills = true,
                    display_only = true,
                },
            },
            {
                text = "Step 6: Speak to Ailbeche in Northern San d'Oria (J-9), then go to Maiden's Spring in Jugner Forest (E-6).\n \n" ..
                       "- Walking up to the pond triggers the cutscene. You do not have to dismount.\n \n",
                route_to = "Jugner Forest",
                destination_highlight = { position = "E-6", offsetX = 16, offsetY = 16 },
            },
            {
                text = "Step 7: Speak with Prince Trion in Chateau d'Oraguille (H-7) for the final cutscene.\n \n" ..
                       "- (Vemalpeau has a closing scene about the confession letter if you want it.)\n \n",
                route_to = "Chateau d'Oraguille",
                destination_highlight = { position = "H-7", offsetX = 16, offsetY = 16 },
            },
        },
        reward = {
            text = "Gallant Surcoat\n \n",
        },
    },

    -- =========================================================================================
    -- 8) Borghertz's Stalwart Hands (Paladin AF hands)
    -- =========================================================================================
    ["8.Paladin Quest - Borghertz's Stalwart Hands"] = {
        requirements = {
            level = 50,
        },
        steps = {
            {
                text = "Step 1: As a Lv50+ Paladin, speak to Guslam at Durable Shields in Upper Jeuno (H-8).\n \n" ..
                       "- Finish any other Borghertz's Hands quest you have open on another job first.\n \n",
                route_to = "Upper Jeuno",
                destination_highlight = { position = "H-8", offsetX = 16, offsetY = 16 },
            },
            {
                text = "Step 2: Open a coffer in The Eldieme Necropolis for the Key Item: Old Gauntlets.\n \n" ..
                       "- Coffer keys drop from Mimics, Haunts, Spriggans, Tomb Mages and Tomb Warriors. Thieves\n" ..
                       "  can pick the coffer instead.\n \n" ..
                       "CRITICAL: Paladin must be your main job when you open the coffer or you will not get the gauntlets.\n \n",
                images = {
                    -- Map 1 is raw floor 15 for this zone (data/floor_mappings.lua [195]).
                    {
                        zone_name = "The Eldieme Necropolis",
                        floor_id  = 15,
                        width     = 512,
                        height    = 512,
                        state     = 2,
                        highlights = {
                            { position = "G-6", offsetX = 16, offsetY = 16 },
                            { position = "F-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    -- Map 2's raw floor id is unconfirmed - see data/ref/Jobs/paladin_reference.md.
                    {
                        zone_name = "The Eldieme Necropolis",
                        width     = 512,
                        height    = 512,
                        state     = 2,
                        highlights = {
                            { position = "E-6", offsetX = 16, offsetY = 16 },
                            { position = "L-9", offsetX = 16, offsetY = 16 },
                            { position = "L-12", offsetX = 16, offsetY = 16 },
                            { position = "M-10", offsetX = 16, offsetY = 16 },
                            { position = "M-11", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 3: Take the Old Gauntlets back to Guslam in Upper Jeuno (H-8).\n \n" ..
                       "- He cannot repair them. Deadly Minnow points you at a Mithra in the Tenshodo.\n" ..
                       "- Pay Yin Pocanakhu 1,000 gil at Neptune's Spire in Lower Jeuno (J-7) for the details.\n \n",
                route_to = "Upper Jeuno",
                destination_highlight = { position = "H-8", offsetX = 16, offsetY = 16 },
            },
            {
                text = "Step 4: Examine the ??? near the Duty-Free Shop in Port Jeuno (H-8) for a cutscene about the repair.\n \n",
                route_to = "Port Jeuno",
                destination_highlight = { position = "H-8", offsetX = 16, offsetY = 16 },
            },
            {
                text = "Step 5: Go to the torch at (F-8) in Castle Zvahl Baileys, kill Dark Spark, then re-check the torch for the Key Item: Shadow Flames.\n \n" ..
                       "===== Dark Spark =====\n" ..
                       "- Lv55, roughly 8,500 HP, Dark Knight.\n" ..
                       "- It self-destructs, so keep your HP up when it is low.\n \n",
                images = {
                    {
                        zone_name = "Castle Zvahl Baileys",
                        floor_id  = 1,
                        width     = 512,
                        height    = 512,
                        state     = 5,
                        highlights = {
                            { position = "F-8", offsetX = 16, offsetY = 16, label = "Torch" },
                        },
                    },
                },
                onmob_enemy = "Dark Spark",
                kill_requirement = {
                    count = 1,
                    enemies = { "Dark Spark" },
                    zone = "Castle Zvahl Baileys",
                    count_party_kills = true,
                    display_only = true,
                },
            },
            {
                text = "Step 6: Return to the ??? in Port Jeuno (H-8) to receive the Gallant Gauntlets.\n \n",
                route_to = "Port Jeuno",
                destination_highlight = { position = "H-8", offsetX = 16, offsetY = 16 },
            },
            {
                text = "Step 7 (Optional): Pick up the rest of the Gallant set.\n \n" ..
                       "- Garlaige Citadel coffer gives the Gallant Coronet.\n" ..
                       "- Beadeaux coffer gives the Gallant Breeches.\n" ..
                       "- Both need Paladin as your main job, and neither blocks this quest.\n \n",
            },
        },
        reward = {
            text = "Gallant Gauntlets\n \n" ..
                   "Guslam also points you at the Garlaige Citadel and Beadeaux coffers for the rest of the set.\n \n",
        },
    },
}
