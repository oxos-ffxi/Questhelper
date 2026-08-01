return {
    -- =========================================================================================
    -- 1) A Squire's Test
    -- =========================================================================================
    ["1.Paladin Quest - A Squire's Test"] = {
        steps = {
            {
                text = "Step 1: Head to Southern San d'Oria (F-7) and speak with Balasiel.\n \n" ..
                       "- He can be tricky to locate. Starting at Watchdog Alley (F-6) near the NPC Celyddon:\n \n" ..
                       "  - Walk west into the stairwell, follow it upward, take the first left.\n" ..
                       "  - Don't go along the wooden walkway; instead cross the wooden bridge.\n" ..
                       "  - Stairs go up, then down, curving around to Balasiel's spot.\n \n" ..
                       "- Once you find him, accept the quest.\n \n",
                images = {
                    {
                        zone_name = "Southern San d'Oria",
                        width = 512,
                        height = 512,
                        state = 1,
                        highlights = {
                            { position = "F-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 2: Trade Balasiel a Revival Tree Root to complete the quest.\n \n" ..
                       "- Revival Tree Roots can be:\n" ..
                       "  - Purchased from AH (Materials -> Alchemy), or\n" ..
                       "  - Dropped by undead (e.g., in King Ranperre's Tomb).\n \n" ..
                       "- Despite his dialogue, any Revival Tree Root works; it doesn’t have to be from King Ranperre's.\n" ..
                       "- You do NOT need to zone after receiving the quest—just trade the item right away.\n \n",
                images = {},
            },
        },
        reward = {
            text = "Completion of the first Paladin test.\n \n",
        },
    },

    -- =========================================================================================
    -- 2) A Squire's Test II
    -- =========================================================================================
    ["2.Paladin Quest - A Squire's Test 2"] = {
        steps = {
            {
                text = "Step 1: Return to Balasiel in Southern San d'Oria (F-7) to start the second test.\n \n" ..
                       "- Recommended to have Sneak/Invis for Ordelle's Caves, especially if under Lv.40.\n" ..
                       "- Having a Warp/Teleport item can help after collecting the Stalactite Dew.\n \n" ..
                       "- **Optional**: Talk to Chanpau (E-7 in Southern San d'Oria) and Morjean (L-7 in Northern San d'Oria) for extra dialogue.\n" ..
                       "  - Morjean might be locked if you are mid-quest on Dragoon's “The Holy Crest.”\n \n",
                images = {
                    {
                        zone_name = "Southern San d'Oria",
                        width = 512,
                        height = 512,
                        state = 1,
                        highlights = {
                            { position = "F-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 2: Travel to La Theine Plateau (F-6), drop into the ravine near Equesobillot, and enter Ordelle's Caves.\n \n" ..
                       "- There is a Survival Guide at the entrance.\n \n",
                images = {
                    {
                        zone_name = "La Theine Plateau",
                        width = 512,
                        height = 512,
                        state = 2,
                        highlights = {
                            { position = "F-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 3: Navigate Ordelle's Caves on map 1 (I-6) B route, and find the cave room at Map 2 (G-7) containing two ??? points.\n \n" ..
                       "- You must click the first ??? (in the pool of water), then quickly click the second ??? near the center.\n" ..
                       "- If done fast enough, you'll receive the key item: Stalactite Dew.\n" ..
                       "- If not, re-click the first ??? and try again.\n \n" ..
                       "- Watch for aggro:\n" ..
                       "  - Sound: Shriekers (mushrooms), Bats, Jellies\n" ..
                       "  - Sight/Magic: Will-o'-the-Wisp near the water\n \n",
                images = {
                    {
                        zone_name = "Ordelle's Caves", floor_id = 1 --[[VERIFY floor_id]],
                        width = 512,
                        height = 512,
                        state = 3,
                        highlights = {
                            { position = "I-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Ordelle's Caves", floor_id = 2 --[[VERIFY floor_id]],
                        width = 512,
                        height = 512,
                        state = 3,
                        highlights = {
                            { position = "G-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 4: Return to Southern San d'Oria (F-7) and talk to Balasiel again.\n \n" ..
                       "- Hand over the Stalactite Dew key item for recognition.\n" ..
                       "- You can potentially start “A Knight's Test” immediately if you meet its requirements.\n \n",
                images = {},
            },
        },
        reward = {
            text = "Completion of the second Paladin test.\n \n",
        },
    },

    -- =========================================================================================
    -- 3) A Knight's Test
    -- =========================================================================================
    ["3.Paladin Quest - A Knight's Test"] = {
        steps = {
            {
                text = "Step 1: (Southern San d'Oria F-7) Speak with Balasiel once more to get the Key Item “Book of Tasks.”\n \n" ..
                       "- You must have finished 'A Squire's Test II' and meet the level requirement.\n \n",
                images = {
                    {
                        zone_name = "Southern San d'Oria",
                        width = 512,
                        height = 512,
                        state = 1,
                        highlights = {
                            { position = "F-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 2: Speak with Baunise (H-9) over the Westgate parapet and Cahaurme (J-9) over the Eastgate parapet to obtain:\n \n" ..
                       "- Key Item 'Book of the West' (Baunise)\n" ..
                       "- Key Item 'Book of the East' (Cahaurme)\n \n",
                images = {
                    {
                        zone_name = "Southern San d'Oria",
                        width = 512,
                        height = 512,
                        state = 2,
                        highlights = {
                            { position = "H-9", offsetX = 16, offsetY = 16 },
                            { position = "J-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 3: Travel to Davoi (E-10) and examine the Disused Well for Key Item 'Knight's Soul.'\n \n" ..
                       "- Recommended route:\n" ..
                       "  - Go to the broken bridge (I-8) and drop into the water.\n" ..
                       "  - Follow west to (D-8), exit water at (D-9), move through the camp to (E-10).\n" ..
                       "- Use Sneak/Invis to avoid Orc aggro.\n \n",
                images = {
                    {
                        zone_name = "Davoi",
                        width = 512,
                        height = 512,
                        state = 3,
                        highlights = {
                            { position = "E-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 4: Return to Balasiel in Southern San d'Oria (F-7) after obtaining the Knight's Soul.\n \n",
                images = {},
            },
        },
        reward = {
            text = "Completion of 'A Knight's Test' and further progression as a Paladin.\n \n",
        },
    },
    ["4.Father and Son"] = {
            steps = {
                {
                    text = "Step 1: In Northern San d'Oria, find Ailbeche near the fountain (approx. J-9).\n \n" ..
                           "- He's a small boy crying about losing his father.\n" ..
                           "- He says his father is in armor but without a helmet.\n \n",
                    images = {
                        {
                            zone_name = "Northern San d'Oria", -- Adjust filename as needed
                            width = 512,
                            height = 512,
                            state = 1,
                            highlights = {
                                { position = "J-9", offsetX = 16, offsetY = 16 },
                            },
                        },
                    },
                },
                {
                    text = "Step 2: Go to Southern San d'Oria (K-7) and speak with Exoroche inside Helbort's Blades.\n \n" ..
                           "- This is Ailbeche’s father, the man in armor.\n",
                    images = {
                        {
                            zone_name = "Southern San d'Oria", -- Adjust filename as needed
                            width = 512,
                            height = 512,
                            state = 2,
                            highlights = {
                                { position = "K-7", offsetX = 16, offsetY = 16 },
                            },
                        },
                    },
                },
                {
                    text = "Step 3: Return to Ailbeche in Northern San d'Oria (J-9) for another cutscene.\n \n" ..
                           "- Exoroche shows up, scolds Ailbeche, and hands you the boy’s fishing rod.\n" ..
                           "- This completes the primary portion of the quest.\n \n",
                    images = {},
                },
                {
                    text = "Step 4 (Optional): Speak to Ailbeche again.\n \n" ..
                           "- He wants his fishing rod back. You can trade the Willow Fishing Rod to him.\n" ..
                           "- Doing so yields no immediate reward, but is *required* to start 'Sharpening the Sword.'\n \n",
                    images = {},
                },
            },
            reward = {
                text = "Receive the boy’s fishing rod (Willow Fishing Rod) after the father scolds him.\n \n" ..
                       "Returning the rod to Ailbeche is optional yet necessary to unlock 'Sharpening the Sword.'\n \n",
            },
        },
    -- =========================================================================================
    -- 5) Sharpening the Sword
    -- =========================================================================================
    ["5.Paladin Quest - Sharpening the Sword"] = {
        steps = {
            {
                text = "Step 1: Prerequisite: Complete the “Father and Son” quest and ensure you returned the Willow Fishing Rod to the son.\n \n" ..
                       "- Then speak with Ailbeche (Northern San d'Oria J-9), who requests a Key Item 'Ordelle Whetstone.'\n" ..
                       "- Speak with Sobane (D-6) in Southern San d'Oria. If you get a different cutscene for 'Signed in Blood' or 'Tea with a Tonberry?', talk again.\n \n",
                images = {
                    {
                        zone_name = "Northern San d'Oria",
                        width = 512,
                        height = 512,
                        state = 1,
                        highlights = {
                            { position = "J-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Southern San d'Oria",
                        width = 512,
                        height = 512,
                        state = 1,
                        highlights = {
                            { position = "D-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 2: Head to Ordelle's Caves, preferably entering from (F-7) in La Theine Plateau.\n \n" ..
                       "- Alternatively, use Survival Guide teleports (West Ronfaure or Ordelle's Caves direct).\n" ..
                       "- Navigate to the Stalagmite on the first map near (I-5) or (H-9)/(G-6) path—precise route depends on your server.\n" ..
                       "- Clicking the Stalagmite spawns NM “Polevik” (Earth Elemental). \n" ..
                       "  - Recommended Lv.65+ or trust support.\n \n",
                images = {
                    {
                        zone_name = "La Theine Plateau",
                        width = 512,
                        height = 512,
                        state = 2,
                        highlights = {
                            { position = "F-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Ordelle's Caves", floor_id = 1 --[[VERIFY floor_id]],
                        width = 512,
                        height = 512,
                        state = 2,
                        highlights = {
                            -- (I-5) or (H-9) approximate
                            { position = "I-5", offsetX = 16, offsetY = 16 },
                            { position = "H-9", offsetX = 16, offsetY = 16 },
                            { position = "G-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 3: Defeat Polevik and re-click the Stalagmite to receive Key Item 'Ordelle Whetstone.'\n \n" ..
                       "- Return to Ailbeche in Northern San d'Oria (J-9) to complete the quest.\n \n",
                images = {
                    {
                        zone_name = "Northern San d'Oria",
                        width = 512,
                        height = 512,
                        state = 3,
                        highlights = {
                            -- (I-5) or (H-9) approximate
                            { position = "J-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
        reward = {
            text = "Completes Sharpening the Sword.\n \n",
            images = {
            },
        },
    },

    -- =========================================================================================
    -- 6) A Boy's Dream
    -- =========================================================================================
    ["6.Paladin Quest - A Boy's Dream"] = {
        steps = {
            {
                text = "Step 1: After completing “Sharpening the Sword,” speak with Ailbeche (J-9) in Northern San d'Oria as a Lv.50+ Paladin.\n \n" ..
                       "- He requests a Giant Shell Bug. \n" ..
                       "- Speak with Exoroche (K-7) in Helbort's Blades, Southern San d'Oria for more details.\n \n",
                images = {
                    {
                        zone_name = "Northern San d'Oria",
                        width = 512,
                        height = 512,
                        state = 1,
                        highlights = {
                            { position = "J-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Southern San d'Oria",
                        width = 512,
                        height = 512,
                        state = 1,
                        highlights = {
                            { position = "K-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 2: Collect Giant Shell Bugs in Crawler's Nest.\n \n" ..
                       "- From entrance (H-8) on map 1, use exit A to map 2.\n" ..
                       "- Check ??? in the alcove at (H-9) to spawn NM “Dreadbug,” dropping 1-4 Giant Shell Bugs.\n" ..
                       "- You can also purchase them from Auction House if available.\n \n",
                images = {
                    {
                        zone_name = "Crawlers' Nest", floor_id = 1 --[[VERIFY floor_id]],
                        width = 512,
                        height = 512,
                        state = 2,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Crawlers' Nest", floor_id = 2 --[[VERIFY floor_id]],
                        width = 512,
                        height = 512,
                        state = 2,
                        highlights = {
                            { position = "H-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 3: Next, you must fish up the NM “Odontotyrannus” in Castle Oztroja - Map 1(J-8) -> Map2(F-9) -> Map 3, around H-9 pond using:\n \n" ..
                       "- Giant Shell Bug as bait.\n" ..
                       "- Bring a rod and be ready for a fight once it bites.\n" ..
                       "- If you're unfamiliar with monster fishing, read about the fishing minigame or bring help.\n \n",
                images = {
                    {
                        zone_name = "Castle Oztroja", floor_id = 1 --[[VERIFY floor_id]],
                        width = 512,
                        height = 512,
                        state = 3,
                        highlights = {
                            { position = "J-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Castle Oztroja", floor_id = 2 --[[VERIFY floor_id]],
                        width = 512,
                        height = 512,
                        state = 3,
                        highlights = {
                            { position = "F-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Castle Oztroja", floor_id = 3 --[[VERIFY floor_id]],
                        width = 512,
                        height = 512,
                        state = 3,
                        highlights = {
                            { position = "H-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 4: Trade the caught Odontotyrannus to Zaldon (H-9) at the Fisherman's Guild in Selbina to receive Key Item 'Knight's Boots.'\n \n" ..
                       "- If you haven't traded a Giant Shell Bug to Ailbeche yet, do that first or afterwards.\n \n",
                images = {
                    {
                        zone_name = "Selbina",
                        width = 512,
                        height = 512,
                        state = 4,
                        highlights = {
                            { position = "H-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 5: Return to Northern San d'Oria, speak with Ailbeche (J-9), then go to Southern San d'Oria and talk with Exoroche (K-7).\n \n" ..
                       "- Finally, check Prince Trion's room in Chateau d'Oraguille at (H-7) for a cutscene.\n" ..
                       "- If you are on Paladin main, this will also start next quest “Under Oath.”\n \n",
                images = {
                    {
                        zone_name = "Northern San d'Oria",
                        width = 512,
                        height = 512,
                        state = 5,
                        highlights = {
                            { position = "J-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Southern San d'Oria",
                        width = 512,
                        height = 512,
                        state = 5,
                        highlights = {
                            { position = "K-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Chateau d'Oraguille",
                        width = 512,
                        height = 512,
                        state = 5,
                        highlights = {
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
        reward = {
            text = "Completes A Boy's Dream.\n \n" ..
                   "Aquire Gallant Leggings!",
            images = {
            },
        },
    },

    -- =========================================================================================
    -- 7) Under Oath
    -- =========================================================================================
    ["7.Paladin Quest - Under Oath"] = {
        steps = {
            {
                text = "Step 1: If you finished “A Boy's Dream” as a Paladin, you may already have the initial cutscene.\n \n" ..
                       "- Otherwise, go to Chateau d'Oraguille in Northern San d'Oria and click on Prince Trion's door at (H-7).\n \n" ..
                       "- Note: This quest can block obtaining the Trust: Trion if you haven't triggered all door scenes yet.\n \n",
                images = {
                    {
                        zone_name = "Chateau d'Oraguille",
                        width = 512,
                        height = 512,
                        state = 1,
                        highlights = {
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 2: Speak with Vemalpeau in Southern San d'Oria (M-7). Next, talk to Najjar (K-6) inside Lion Spring's Tavern, then Ullasa at Count Caffaule's Manor (B-6).\n \n" ..
                       "- Ullasa mentions “Mique's Paintbrush,” prompting a new objective.\n \n",
                images = {
                    {
                        zone_name = "Southern San d'Oria",
                        width = 512,
                        height = 512,
                        state = 2,
                        highlights = {
                            { position = "M-7", offsetX = 16, offsetY = 16 },
                            { position = "K-6", offsetX = 16, offsetY = 16 },
                            { position = "B-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 3: Obtain a Zvahl Coffer Key (Castle Zvahl Baileys) or pick the coffer lock as a Thief.\n \n" ..
                       "- Mobs that drop the key: Ahriman, Abyssal Demons, Arch Demons, Blood Demons, Doom Demons found lower down in map3.\n" ..
                       "- Or buy a Zvahl Coffer Key from the Curio Vendor Moogle for 5,000 gil if you’ve unlocked that shop.\n \n" ..
                       "- Open a coffer to get Key Item “Mique's Paintbrush.” Paladin does not have to be main for the coffer.\n" ..
                       "- If you have an active artifact quest for that coffer, you won't get the paintbrush until AF is completed.\n \n",
                images = {
                    {
                        zone_name = "Castle Zvahl Baileys", floor_id = 3 --[[VERIFY floor_id]],
                        width = 512,
                        height = 512,
                        state = 3,
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
                text = "Step 4: Return to Vemalpeau (M-7) in Southern San d'Oria.\n \n" ..
                       "- Go upstairs, examine the painting on the wall, select “look behind the frame” → “open and examine.”\n" ..
                       "- You’ll obtain Key Item “Strange Sheet of Paper.”\n \n",
                images = {
                    {
                        zone_name = "Southern San d'Oria",
                        width = 512,
                        height = 512,
                        state = 4,
                        highlights = {
                            { position = "M-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 5: Speak to Exoroche in Helbort's Blades (K-7), who directs you to Davoi.\n \n" ..
                       "In Davoi (G-9), examine the Village Well to spawn two NMs: “Three-eyed Prozpuz” (RNG) and “One-eyed Gwajboj” (PLD).\n" ..
                       "- Clear nearby Orcs first; a party or alliance ~Lv.55+ recommended.\n" ..
                       "- Defeat the NMs, loot 1 Well Weight for each Paladin needing it.\n \n" ..
                       "- Trade the Well Weight to the Village Well to get Key Item “Knight's Confession.”\n \n",
                images = {
                    {
                        zone_name = "Davoi",
                        width = 512,
                        height = 512,
                        state = 5,
                        highlights = {
                            { position = "G-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 6: Return to Ailbeche (J-9) in Northern San d'Oria, who mentions Jugner Forest.\n \n" ..
                       "- Go to Maiden's Spring in Jugner Forest (E-6). Approaching the pond triggers a cutscene.\n" ..
                       "- If mounted, you do not need to dismount.\n \n",
                images = {
                    {
                        zone_name = "Northern San d'Oria",
                        width = 512,
                        height = 512,
                        state = 6,
                        highlights = {
                            { position = "J-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Jugner Forest",
                        width = 512,
                        height = 512,
                        state = 6,
                        highlights = {
                            { position = "E-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 7: Finally, return to Chateau d'Oraguille in Northern San d'Oria and speak with Prince Trion for a final cutscene.\n \n" ..
                       "- You get your reward. Optionally, speak with Vemalpeau again for closure (confession letter).\n \n",
                images = {
                    {
                        zone_name = "Chateau d'Oraguille",
                        width = 512,
                        height = 512,
                        state = 7,
                        highlights = {
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
        reward = {
            text = "Under Oath completed\n \n" ..
                   "Aquired Gallant Surcoat!",
            images = {
                },
        },
    },

    -- =========================================================================================
    -- 8) Borghertz's Stalwart Hands (Paladin AF Hands)
    -- =========================================================================================
    ["8.Paladin Quest - Borghertz's Stalwart Hands"] = {
        steps = {
            {
                text = "Step 1: If you have any other “Borghertz's Hands” quest active for a different job, finish it first.\n \n" ..
                       "- As a Lv.50+ Paladin, speak to Guslam (H-8) in Upper Jeuno (Durable Shields shop) to start the quest.\n \n",
                images = {
                    {
                        zone_name = "Upper Jeuno",
                        width = 512,
                        height = 512,
                        state = 1,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 2: Head to The Eldieme Necropolis and open a coffer to obtain Key Item “Old Gauntlets.”\n \n" ..
                       "- If you prefer, come as Thief with tools to pick the coffer.\n" ..
                       "- Dropped by Mimics, Haunts, Spriggan, Tomb Mage and Tomb Warriors" ..
                       "- Paladin must be the main job if you want to get the AF item from the coffer.\n \n",
                images = {
                    {
                        zone_name = "The Eldieme Necropolis", floor_id = 1 --[[VERIFY floor_id]],
                        width = 512,
                        height = 512,
                        state = 2,
                        highlights = {
                            -- Potential coffer spots
                            { position = "G-6", offsetX = 16, offsetY = 16 },
                            { position = "F-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "The Eldieme Necropolis", floor_id = 2 --[[VERIFY floor_id]],
                        width = 512,
                        height = 512,
                        state = 2,
                        highlights = {
                            -- Potential coffer spots
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
                text = "Step 3: If this is your first time completing an AF hands quest:\n \n" ..
                       "- Return to Guslam. He can't fix them. Deadly Minnow suggests a Mithra in Tenshodo.\n" ..
                       "- Pay Yin Pocanakhu (Lower Jeuno, Neptune's Spire) 1,000 gil for info.\n" ..
                       "- Go to Port Jeuno (H-8) near the Duty-Free Shop, check the ??? for a cutscene about repairing.\n" ..
                       "- Travel to Castle Zvahl Baileys (F-8 torch) to fight Dark Spark.\n" ..
                       "  - Defeat Dark Spark, re-check torch to get Key Item “Shadow Flames.”\n \n" ..
                       "  - ===== DARK SPARK ===== \n" ..
                       "  - Level: 55 \n" ..
                       "  - HP: 8500 \n" ..
                       "  - Job: Dark Knight \n" ..
                       "  - Notes: Be careful it can Self Destruct" ..
                       "- Back in Port Jeuno, click the ??? again to receive Gallant Gauntlets.\n \n",
                images = {
                    {
                        zone_name = "Upper Jeuno",
                        width = 512,
                        height = 512,
                        state = 3,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Lower Jeuno",
                        width = 512,
                        height = 512,
                        state = 3,
                        highlights = {
                            { position = "J-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Port Jeuno",
                        width = 512,
                        height = 512,
                        state = 3,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Castle Zvahl Baileys", floor_id = 1 --[[VERIFY floor_id]],
                        width = 512,
                        height = 512,
                        state = 3,
                        highlights = {
                            { position = "F-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Port Jeuno",
                        width = 512,
                        height = 512,
                        state = 3,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 4 (Optional Coffers): Guslam hints other armor is scattered across Vana'diel.\n \n" ..
                       "- You can open coffers in Garlaige Citadel (for Gallant Coronet) and Beadeaux (for Gallant Breeches) while on Paladin main.\n" ..
                       "- These do not block quest completion but help complete your Paladin AF set.\n \n",
                images = {},
            },
        },
        reward = {
            text = "Aquired Gallant Gauntlets! \n" ..
                   "Access to other Paladin AF pieces.\n \n",
        },
    },
}
