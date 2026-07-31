return {
    -- =========================================================================================
    -- 1) Forge Your Destiny (Samurai unlock)
    -- =========================================================================================
    ["1.Samurai Quest - Forge Your Destiny"] = {
        requirements = {
            level = 30,
        },
        steps = {
            {
                text = "Step 1: Speak with Jaucribaix in Norg (K-8) and accept the quest.\n \n" ..
                       "- He is on the upper level, at the end of the hallway near the Captain's Quarters.\n" ..
                       "- He asks for a Lump of Bomb Steel and a Sacred Branch, and points you at his two pupils.\n" ..
                       "- The dialogue ends with a choice - you must pick the option that accepts, or the quest\n" ..
                       "  does not start.\n \n" ..
                       "===== Getting to Norg =====\n" ..
                       "- Airship to Kazham, out into Yuhtunga Jungle, then in at the Sea Serpent Grotto entrance\n" ..
                       "  (E-11). Norg is a short run inside; a chocobo from Kazham saves most of the jungle.\n" ..
                       "- WARNING: Sahagin in Sea Serpent Grotto aggro. Sneak is strongly recommended at Lv30.\n" ..
                       "- TIP: Norg has a Home Point and a chocobo of its own - the return trips get much cheaper\n" ..
                       "  once you have been there once.\n \n",
                onmob_target = "Jaucribaix",
                route_to = "Norg",
                destination_highlight = { position = "K-8", offsetX = 16, offsetY = 16 },
                trigger_on_event_id = { 25 },
            },
            {
                text = "Step 2: Go down the long steps and talk to Aeka (I-8) for the Lump of Oriental Steel.\n \n" ..
                       "NOTE: If you lose the steel or fail against Forger, Aeka will sell you a replacement for\n" ..
                       "1x Darksteel Ore.\n \n",
                onmob_target = "Aeka",
                route_to = "Norg",
                destination_highlight = { position = "I-8", offsetX = 16, offsetY = 16 },
                zone_max_distance = 35,
                trigger_on_event_id = { 44, 47 },
            },
            {
                text = "Step 3: Talk to Ranemaud (I-7), just along from Aeka, for the Sacred Sprig.\n \n" ..
                       "NOTE: If you lose the sprig, Ranemaud will sell you a replacement for 1x Platinum Ore and\n" ..
                       "2x Gold Ore.\n \n",
                onmob_target = "Ranemaud",
                route_to = "Norg",
                destination_highlight = { position = "I-7", offsetX = 16, offsetY = 16 },
                zone_max_distance = 35,
                trigger_on_event_id = { 40, 43 },
            },
            {
                text = "Step 4: In The Sanctuary of Zi'Tah, pop and kill the Guardian Treant, then trade the Sacred\n" ..
                       "Sprig to the ??? for the Sacred Branch.\n \n" ..
                       "===== Finding the ??? =====\n" ..
                       "- At (K-10) there is a pathway leading into an UNMAPPED area. Head straight east to (L-10)\n" ..
                       "  and you will see a large tree.\n" ..
                       "- Climb the rocks at the base of the tree to get close enough to the ??? to use it.\n \n" ..
                       "===== The pop =====\n" ..
                       "- Trade or use a Hatchet on the ??? to spawn the Guardian Treant. The hatchet is NOT\n" ..
                       "  consumed, and only one person in a party needs one.\n" ..
                       "- Kill the Treant, then trade the Sacred Sprig to the ??? to receive the Sacred Branch.\n" ..
                       "- Everyone in the party can trade a sprig for a branch off a single Treant kill - you do\n" ..
                       "  not need one NM per person.\n \n" ..
                       "NOTE: The ??? goes on a 10 minute cooldown after the Treant despawns. If it says a strange\n" ..
                       "force prevents you, the timer is still running.\n \n" ..
                       "NOTE: This step and the Konschtat one can be done in either order. If you do Konschtat\n" ..
                       "first, tick that step off manually.\n \n",
                route_to = "The Sanctuary of Zi'Tah",
                destination_highlight = {
                    { position = "K-10", offsetX = 16, offsetY = 16, label = "Path", color = "yellow" },
                    { position = "L-10", offsetX = 16, offsetY = 16, label = "???",  color = "cyan" },
                },
                onmob_target = "zitah-guardian-treant-qm-l10",
                onmob_enemy = "Guardian Treant",
                zone_max_distance = 50,
                items_needed = { "Hatchet" },
                trigger_on_item_obtain = { "Sacred Branch", "sacred branch" },
                visual_zones = {
                    { zone_name = "The Sanctuary of Zi'Tah", type = 'square', center = { x = 642.0, y = -5.0, z = -150.0 }, size = 2, floor_id = 0, colour = "cyan" },
                },
            },
            {
                text = "Step 5: In Konschtat Highlands, trade the Lump of Oriental Steel to the ??? at (D-8) to pop\n" ..
                       "Forger, then kill it and loot the Lump of Bomb Steel.\n \n" ..
                       "- The ??? is inside a cave. You must be standing right next to it - stand off and the trade\n" ..
                       "  is refused with a 'must be closer' message.\n" ..
                       "- Forger drops exactly one Lump of Bomb Steel.\n \n" ..
                       "CRITICAL: If you lose the fight the Oriental Steel is gone - you have to go back to Aeka in\n" ..
                       "Norg with a Darksteel Ore for another one. Bring help if you are close to Lv30.\n \n" ..
                       "NOTE: The ??? stays visible but will not pop Forger again for 2 minutes after he despawns,\n" ..
                       "so parties popping him back to back need to wait their turn.\n \n",
                route_to = "Konschtat Highlands",
                destination_highlight = { position = "D-8", offsetX = 16, offsetY = 16 },
                onmob_target = "konschtat-forger-qm-d8",
                onmob_enemy = "Forger",
                zone_max_distance = 40,
                kill_requirement = {
                    count = 1,
                    enemies = { "Forger" },
                    zone = "Konschtat Highlands",
                    count_party_kills = true,
                },
                visual_zones = {
                    { zone_name = "Konschtat Highlands", type = 'square', center = { x = -709.0, y = 2.0, z = 102.0 }, size = 2, floor_id = 0, colour = "cyan" },
                },
            },
            {
                text = "Step 6: Return to Norg and trade the Lump of Bomb Steel AND the Sacred Branch to Jaucribaix\n" ..
                       "(K-8) together.\n \n" ..
                       "CRITICAL: Both items go in the SAME trade window. Trading them one at a time does nothing.\n \n" ..
                       "- He tells you the blade will be ready in 3 Vana'diel days.\n \n",
                onmob_target = "Jaucribaix",
                route_to = "Norg",
                destination_highlight = { position = "K-8", offsetX = 16, offsetY = 16 },
                trigger_on_event_id = { 27 },
            },
            {
                text = "Step 7: Wait 3 Vana'diel days, then speak to Jaucribaix (K-8) again for the cutscene where\n" ..
                       "Gilgamesh hands you the Mumeito and unlocks Samurai.\n \n" ..
                       "- 3 Vana'diel days is 2 hours 53 minutes of real time. Talking to him early just gives the\n" ..
                       "  'not ready' dialogue with the hours remaining - it costs nothing to check.\n \n" ..
                       "TIP: Park it here and go level. Norg's Home Point makes the return trip trivial.\n \n" ..
                       "CRITICAL: Keep the Mumeito. It is needed for the Samurai AF Great Katana quest 'The Sacred\n" ..
                       "Katana' - if you drop it, Ranemaud charges 30,000 gil for a replacement, and only after you\n" ..
                       "have already accepted that quest.\n \n",
                onmob_target = "Jaucribaix",
                route_to = "Norg",
                destination_highlight = { position = "K-8", offsetX = 16, offsetY = 16 },
                trigger_on_event_id = { 29 },
            },
        },
        reward = {
            text = "Unlocks the Samurai job!\n \n" ..
                   "Mumeito (Lv1 Great Katana - keep it for the AF quest 'The Sacred Katana')\n" ..
                   "Title: Bushido Blade\n" ..
                   "Job gesture: Samurai\n" ..
                   "Norg fame +20\n \n",
        },
    },
}
