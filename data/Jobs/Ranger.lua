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
                text = "Step 1: Talk to Perih Vashai in Windurst Woods (K-7) at Lv30 or above to accept the quest.\n \n" ..
                       "- She wants proof of an old tiger, and sends you to Sauromugue Champaign.\n",
                onmob_target = "Perih Vashai",
                route_to = "Windurst Woods",
                destination_highlight = { position = "K-7", offsetX = 16, offsetY = 16 },
                zone_max_distance = 40,
                -- 351 accepts. 352 is her reminder while you have no fang, 353/354 the guards,
                -- 356 the Black Tiger Fang trade scene - none of those advance anything.
                trigger_on_event_id = { 351 },
            },
            {
                text = "Step 2: In Sauromugue Champaign, up the cliff at (L-8) then south to the cave at (L-10).\n \n" ..
                       "- Examine the Tiger Bones to spawn Old Sabertooth, then examine them again once it dies\n" ..
                       "  for the Key Item: Old Tiger's Fang. Stand well back and it will not aggro.\n \n" ..
                       "CRITICAL: DO NOT FIGHT IT. Only its natural death (~3 min) will give you the Key Item. Killing it costs a 5 minute wait for a fresh pop.\n \n" ..
                       "TIP: Three Sabertooth Tigers outside the cave aggro under Lv40. Mount or Invisible in, Warp out once you have the Key Item.\n \n",
                route_to = "Sauromugue Champaign",
                destination_highlight = {
                    { position = "L-8", offsetX = 16, offsetY = 16, label = "1" },
                    { position = "L-10", offsetX = 16, offsetY = 16, label = "2" },
                },
                onmob_target = "sauromugue-champaign-tiger-bones-l10",
                onmob_enemy = "Old Sabertooth",
                onmob_enemy_colour = "white",
                keyitems_needed = { 117 },
                trigger_on_keyitem_obtain = { 117 },
                zone_max_distance = 30,
                visual_zones = {
                        -- To the Tiger Bones
                        { zone_name = "Sauromugue Champaign", type = 'arrow', center = { x = 538.0, y = 24.8, z = 113.4 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                        { zone_name = "Sauromugue Champaign", type = 'arrow', center = { x = 582.1, y = 24.4, z = 73.9 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                        { zone_name = "Sauromugue Champaign", type = 'arrow', center = { x = 592.8, y = 17.2, z = 49.0 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Sauromugue Champaign", type = 'arrow', center = { x = 562.1, y = 9.8, z = 13.3 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Sauromugue Champaign", type = 'arrow', center = { x = 537.6, y = 6.3, z = -21.9 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Sauromugue Champaign", type = 'arrow', center = { x = 503.4, y = 7.7, z = -56.2 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                        { zone_name = "Sauromugue Champaign", type = 'arrow', center = { x = 537.0, y = 6.3, z = -93.8 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                        { zone_name = "Sauromugue Champaign", type = 'arrow', center = { x = 559.1, y = 7.8, z = -125.3 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Sauromugue Champaign", type = 'arrow', center = { x = 557.4, y = 0.0, z = -195.3 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Sauromugue Champaign", type = 'arrow', center = { x = 557.4, y = 0.0, z = -244.4 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Sauromugue Champaign", type = 'arrow', center = { x = 555.8, y = 0.0, z = -275.1 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                        { zone_name = "Sauromugue Champaign", type = 'arrow', center = { x = 598.3, y = 0.0, z = -318.2 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                        { zone_name = "Sauromugue Champaign", type = 'arrow', center = { x = 643.8, y = -8.0, z = -322.1 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                        { zone_name = "Sauromugue Champaign", type = 'arrow', center = { x = 676.2, y = -10.2, z = -366.7 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                },
            },
            {
                text = "Step 3: Return to Perih Vashai in Windurst Woods (K-7) with the Old Tiger's Fang to unlock Ranger.\n \n",
                onmob_target = "Perih Vashai",
                route_to = "Windurst Woods",
                destination_highlight = { position = "K-7", offsetX = 16, offsetY = 16 },
                zone_max_distance = 40,
                -- 357 completes and unlocks RNG. 358 is the post-completion scene, gated on
                -- setMustZone, so it needs a zone change first.
                trigger_on_event_id = { 357 },
            },
        },
        reward = {
            text = "Unlocks the Ranger job!\n \n" ..
                   "Title: The Fanged One\n" ..
                   "Job gesture: ranger\n" ..
                   "Windurst fame +20\n \n",
            items = {
                {
                    name  = "Ranger's Necklace",
                    type  = "Neck",
                    races = "All Races",
                },
            },
        },
    },
}
