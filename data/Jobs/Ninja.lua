return {
    -- =========================================================================================
    -- 1) Ayame and Kaede (Ninja unlock)
    --
    -- Log 1 (Bastok) / Quest 60 - the quest file lives in scripts/quests/BASTOK, not outlands.
    -- Step order below follows the server's Prog chain, which differs from some wiki
    -- summaries (Korroloka BEFORE Norg). See data/ref/Jobs/ninja_reference.md.
    -- =========================================================================================
    ["1.Ninja Quest - Ayame and Kaede"] = {
        requirements = {
            level = 30,
        },
        steps = {
            {
                text = "Step 1: Talk to Kaede in Port Bastok (J-5), in the northernmost house, for the opening\n" ..
                       "cutscene about Ensetsu's family and the pirates of Norg.\n \n" ..
                       "CRITICAL: You need access to Norg later in this quest (step 4). That means a Kazham airship\n" ..
                       "pass, or 'The Beginning' from Rhapsodies of Vana'diel. Sort that out before you start or you\n" ..
                       "will stall halfway.\n \n",
                onmob_target = "Kaede",
                route_to = "Port Bastok",
                destination_highlight = { position = "J-5", offsetX = 16, offsetY = 16 },
                zone_max_distance = 30,
                trigger_on_event_id = { 240 },
            },
            {
                text = "Step 2: Talk to Kagetora, elsewhere in Port Bastok, for the next scene.\n \n" ..
                       "- The server gates him on Prog 0, so he is the required next stop even though the wiki\n" ..
                       "  write-ups tend to skip straight to Ensetsu.\n \n",
                onmob_target = "Kagetora",
                route_to = "Port Bastok",
                zone_max_distance = 30,
                trigger_on_event_id = { 241 },
            },
            {
                text = "Step 3: Talk to Ensetsu in Port Bastok (next door to Kaede) - he asks you for the favour\n" ..
                       "that drives the rest of the quest.\n \n",
                onmob_target = "Ensetsu",
                route_to = "Port Bastok",
                destination_highlight = { position = "J-5", offsetX = 16, offsetY = 16 },
                zone_max_distance = 30,
                trigger_on_event_id = { 242 },
            },
            {
                text = "Step 4: In Korroloka Tunnel, examine the ??? to pop three Korroloka Leeches, kill all three,\n" ..
                       "then examine the ??? again for the Key Item: Strangely Shaped Coral.\n \n" ..
                       "- All THREE leeches must die before the ??? will give the coral.\n" ..
                       "- Korroloka Tunnel is entered from Zeruhn Mines (N-6) on the Bastok side, or from Eastern\n" ..
                       "  Altepa Desert on the far side. Reported map location is Map 5 around (L-8) - the marker\n" ..
                       "  beam is the reliable guide once you are in the zone.\n \n" ..
                       "WARNING: Long, mazey zone with aggro. Bring Sneak/Invisible at this level.\n \n",
                route_to = "Korroloka Tunnel 1",
                onmob_target = "korroloka-ninja-qm2",
                onmob_enemy = "Korroloka Leech",
                zone_max_distance = 30,
                kill_requirement = {
                    count = 3,
                    enemies = { "Korroloka Leech" },
                    zone = "Korroloka Tunnel",
                    count_party_kills = true,
                    display_only = true,
                },
                visual_zones = {
                    { zone_name = "Korroloka Tunnel", type = 'square', center = { x = -208.0, y = -9.0, z = 176.0 }, size = 2, colour = "cyan" },
                },
            },
            {
                text = "Step 5: Return to Ensetsu in Port Bastok (J-5) and hand over the Strangely Shaped Coral.\n \n" ..
                       "- He takes the coral and sends you on to Norg.\n \n",
                onmob_target = "Ensetsu",
                route_to = "Port Bastok",
                destination_highlight = { position = "J-5", offsetX = 16, offsetY = 16 },
                zone_max_distance = 30,
                trigger_on_event_id = { 245 },
            },
            {
                text = "Step 6: Travel to Norg and speak with Ryoma (H-8) for the Key Item: Sealed Dagger.\n \n" ..
                       "- He stands on a slight ledge on the left-hand side near the water, in the first big room.\n \n" ..
                       "===== Getting to Norg =====\n" ..
                       "- Airship to Kazham, out into Yuhtunga Jungle, in at the Sea Serpent Grotto entrance (E-11),\n" ..
                       "  then a short run to Norg. A chocobo from Kazham saves most of the jungle.\n" ..
                       "- WARNING: Sahagin in Sea Serpent Grotto aggro. Sneak strongly recommended.\n \n",
                onmob_target = "Ryoma",
                route_to = "Norg",
                destination_highlight = { position = "H-8", offsetX = 16, offsetY = 16 },
                zone_max_distance = 35,
                trigger_on_event_id = { 95 },
            },
            {
                text = "Step 7: Take the Sealed Dagger back to Ensetsu in Port Bastok (J-5) for the final cutscene.\n" ..
                       "This unlocks Ninja.\n \n" ..
                       "- The Sealed Dagger is consumed here.\n \n",
                onmob_target = "Ensetsu",
                route_to = "Port Bastok",
                destination_highlight = { position = "J-5", offsetX = 16, offsetY = 16 },
                zone_max_distance = 30,
                trigger_on_event_id = { 246 },
            },
        },
        reward = {
            text = "Unlocks the Ninja job!\n \n" ..
                   "Title: Shadow Walker\n" ..
                   "Job gesture: ninja\n" ..
                   "Norg fame +20\n \n",
        },
    },
}
