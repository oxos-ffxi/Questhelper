-- addons/QuestHelper/data/Custom/FeatureDemo.lua
return {
    ["Feature Demo"] = {
        steps = {
            {
                text = "Walk into the glowing square to begin the demo.\n" ..
                       "[DAT LOADING TEST] This map is loaded from FFXI's ROM DAT files!\n" ..
                       "No PNG required - saves space and uses your in-game maps!",
                images = {
                {
                    -- DAT loading is automatic when zone_name is present!
                    -- Map is loaded from FFXI ROM DAT files - no PNG required!
                    zone_name = "Bastok Mines",
                    width    = 512,
                    height   = 512,
                    highlights = {
                        { position = "H-10", offsetX = 16, offsetY = 16 },
                    },
                },
                },
                trigger_zones = {
                    { type = 'square', center = { x = 2, y = 0, z = -79 }, size = 2 },
                     { type = 'square', center = { x = 26, y = 0, z = -81 }, size = 5 },
                    { type = 'square', center = { x = 0,  y = 0, z = -81 }, size = 2 },
                    { type = 'line', start = { x = 50, y = 0, z = -81 }, stop = { x = 50, y = -5, z = -71 } }
                },
                visual_zones = {
                    -- Cardinal directions
                    { type = 'arrow', center = { x = -10, y = 0, z = -79 }, size = 4, direction = 'up', colour = "cyan" },      -- North
                    { type = 'arrow', center = { x = -20, y = 0, z = -79 }, size = 4, direction = 'down' },    -- South
                    { type = 'arrow', center = { x = -10, y = 0, z = -90 }, size = 4, direction = 'left' },    -- West
                    { type = 'arrow', center = { x = -20, y = 0, z = -90 }, size = 4, direction = 'right' },   -- East

                    -- Diagonal directions
                    { type = 'arrow', center = { x = -30, y = 0, z = -79 }, size = 4, direction = 'ne' },      -- Northeast
                    { type = 'arrow', center = { x = -40, y = 0, z = -79 }, size = 4, direction = 'nw' },      -- Northwest
                    { type = 'arrow', center = { x = -30, y = 0, z = -90 }, size = 4, direction = 'se' },      -- Southeast
                    { type = 'arrow', center = { x = -40, y = 0, z = -90 }, size = 4, direction = 'sw' },      -- Southwest
                },
                zone_name = "Bastok Mines"
            },
            {
                text = "This is a line. It connects two points.",
                zone = "Bastok Mines",
                trigger_zones = {
                    { type = 'line', start = { x = 26, y = 0, z = -81 }, stop =  { x = 36, y = 0, z = -81 } }
                },
            },
            {
                text = "Auto Map Switch Demo: Go to Beadeaux! \n" ..
                       "Maps automatically switch every 5 seconds when you change floors. \n" ..
                       "Try walking between the upper and lower floors - the map will auto-update!",
                zone = "Beadeaux",
                images = {
                {
                    zone_name = "Beadeaux",
                    floor_id = 1,
                    width    = 512,
                    height   = 512,
                    highlights = {
                        { position = "H-10", offsetX = 16, offsetY = 16 },
                    },
                },
                {
                    zone_name = "Beadeaux",
                    floor_id = 15,
                    width    = 512,
                    height   = 512,
                    highlights = {
                        { position = "D-11", offsetX = 16, offsetY = 16 },
                    },
                },
            },
            },
            {
                text = "Auto-Calibration 6-Floor Test: Aydeewa Subterrane! \n" ..
                       "This zone has 6 floors - all using AUTO-CALIBRATION! \n" ..
                       "Walk between floors and watch the arrow switch between all 6 maps automatically!",
                zone = "Aydeewa Subterrane",
                images = {
                {
                    width    = 512,
                    height   = 512,
                    zone_name = "Aydeewa Subterrane",
                    floor_id = 1,
                },
                {

                    width    = 512,
                    height   = 512,
                    zone_name = "Aydeewa Subterrane",
                    floor_id = 2,
                },
                {

                    width    = 512,
                    height   = 512,
                    zone_name = "Aydeewa Subterrane",
                    floor_id = 3,
                },
                {

                    width    = 512,
                    height   = 512,
                    zone_name = "Aydeewa Subterrane",
                    floor_id = 4,
                },
                {

                    width    = 512,
                    height   = 512,
                    zone_name = "Aydeewa Subterrane",
                    floor_id = 5,
                },
                {

                    width    = 512,
                    height   = 512,
                    zone_name = "Aydeewa Subterrane",
                    floor_id = 6,
                },
            },
            },
            {
                text = "Auto-Calibration Test: Dangruf Wadi! \n" ..
                       "This map uses AUTO-CALIBRATION from mapinfo. No manual calibration needed! \n" ..
                       "The red arrow should appear automatically.",
                zone = "Dangruf Wadi",
                images = {
                    {
                        file     = "maps/dangruf_wadi.png",
                        width    = 512,
                        height   = 512,
                        zone_name = "Dangruf Wadi",
                        floor_id = 1,
                        -- NO map_calibration defined - will use auto-calibration!
                    },
                },
                draw_type = 'square',
                center = { x = -10, y = -3.0, z = -115 },
                size = 3,
            },
            {
                text = "Now, go obtain some stuff. You can get them outside.",
                -- [NEW] This line turns the list below into a mandatory checklist
                require_all_items = true,

                -- I corrected "quadava" to "quadav" here to ensure it matches the game text
                trigger_on_item_obtain = {
                    "copper ore",
                    "honey"
                },
                -- Key items needed (displayed in UI, not required for step completion)
                keyitems_needed = {75},  -- Gustaberg Supplies (ID from LSB)
            },
            {
                text = "Key Item Trigger Test: Get the Gustaberg Supplies key item! \n" ..
                       "You can obtain this from any Bastokan Guard NPC. \n" ..
                       "This step will auto-complete when you have the key item.",
                -- Trigger step completion when player gets this key item
                trigger_on_keyitem_obtain = {78},  -- Gustaberg Supplies (ID from LSB)
            },
            {
                text = "Kill Counter Demo: Defeat 5 enemies in Bastok Mines! \n" ..
                       "This will count ANY enemy you defeat. Try killing bees or worms outside the city.",
                kill_requirement = {
                    count = 5,
                    -- No specific enemies specified, so any kill counts
                    zone = "South Gustaberg",
                    display_only = true,
                },
            },
            {
                text = "Kill Counter Demo 2: Defeat 3 Stone Eaters! \n" ..
                       "This will count Stone Eater kills by you, your trusts, and party members.",
                kill_requirement = {
                    count = 100,
                    enemies = {"Stone Eater", "Huge Hornet", "Tunnel Worm"},  -- Only Stone Eater kills count
                    zone = "South Gustaberg",
                    count_party_kills = true,  -- Count kills from party members and trusts
                    reset_on_zone_entry = true,
                    --kill_type = {"melee", "magic", "ranged"},
                },
            },
            {
                text = "Kill Counter Demo 2: Defeat 3 Stone Eaters! \n" ..
                       "This will count Stone Eater kills by you, your trusts, and party members.",
                onmob_enemy = "Locus Colibri",
                kill_requirement = {
                    count = 100,
                    enemies = {"Locus Colibri"},  -- Only Stone Eater kills count
                    zone = "Bhaflau Thickets",
                    count_party_kills = true,  -- Count kills from party members and trusts
                    reset_on_zone_entry = true
                },
            },
            {
                text = "whaaaat",
                -- [NEW] This line turns the list below into a mandatory checklist
                require_all_items = false,

                -- I corrected "quadava" to "quadav" here to ensure it matches the game text
                trigger_on_item_obtain = "flint stone",
            },
            {
                text = "Pathfinding Demo: Travel to Valkurm Dunes! \n" ..
                       "This step uses AUTOMATIC ROUTE CALCULATION. \n" ..
                       "The route shown below changes based on YOUR CURRENT ZONE! \n \n" ..
                       "Try this: \n" ..
                       "1. Note the route shown below \n" ..
                       "2. Zone to a different city (Jeuno, San d'Oria, Windurst) \n" ..
                       "3. Come back to this quest and see the route update!",
                --route_to = "Valkurm Dunes"
                route_to = "Dangruf Wadi"
            },
            {
                text = "Pathfinding Demo 2: Go to Beadeaux! \n" ..
                       "Another auto-route example - notice how it calculates from your position.",
                route_to = "Beadeaux"
            },
            {
                text = "Congratulations! You have completed the feature demo."
            }
        }
    },

    -- ─────────────────────────────────────────────────────────────────────────
    -- Beam floor_id test
    --
    -- locations.lua floor_id is the RAW floor id and is compared against the raw
    -- floor only (no floor_mappings involved). This walks every zone where the raw
    -- id and the map number differ, i.e. the only places that could be wrong.
    --
    -- Use the prev/next buttons to move between steps - there are no triggers.
    -- The debug UI (Validate tab -> "Beams in this zone") shows your current raw
    -- floor and, per entry, whether the floor matched and whether you are in range.
    -- ─────────────────────────────────────────────────────────────────────────
    ["Beam Floor Test"] = {
        steps = {
            {
                text = "BEAM FLOOR TEST - what this is for. \n \n" ..
                       "locations.lua floor_id must hold the RAW floor id (what /qh_checkfloor prints), \n" ..
                       "NOT the map number from floor_mappings.lua. Most zones cannot tell the two apart \n" ..
                       "because their raw ids and map numbers are the same. These steps cover the zones \n" ..
                       "where they differ - the only ones that can be wrong. \n \n" ..
                       "For each step: go to the object, check the beam appears. \n" ..
                       "If it does not, open the debug UI Validate tab and read the 'Beams in this zone' \n" ..
                       "list - it prints your raw floor and the floor_id each entry expects. \n \n" ..
                       "CONTROLS: use the prev/next buttons. No step auto-completes.",
            },
            {
                text = "1/8  OUTER HORUTOTO RUINS - expected PASS (these were dead before this fix). \n \n" ..
                       "Go to the main square room with the 6 Ancient Magical Gizmos (Windurst 1-2 step 4). \n" ..
                       "ALL 6 gizmo beams plus the gate gizmo should draw. \n \n" ..
                       "Entries hold floor_id=3, which is the raw id. Map number is 1. \n" ..
                       "If these draw, raw-only matching is working.",
                onmob_target = {"outer-horutoto-ruins-ancient-magical-gizmo-1",
                                "outer-horutoto-ruins-ancient-magical-gizmo-2",
                                "outer-horutoto-ruins-ancient-magical-gizmo-3",
                                "outer-horutoto-ruins-ancient-magical-gizmo-4",
                                "outer-horutoto-ruins-ancient-magical-gizmo-5",
                                "outer-horutoto-ruins-ancient-magical-gizmo-6",
                                "outer-horutoto-ruins-gate-magical-gizmo",
                                "outer-horutoto-ruins-gate-magical-gizmo-j8",
                                "outer-horutoto-ruins-cracked-wall-5-g8"},
                route_to = "Outer Horutoto Ruins",
            },
            {
                text = "2/8  BOSTAUNIEUX OUBLIETTE - Couchatorage, floor_id was CHANGED 1 -> 15. \n \n" ..
                       "Go to the sewer hatch area (San d'Oria 7-1 step 3). \n" ..
                       "Couchatorage's beam should draw. \n \n" ..
                       "If it does NOT draw, the raw floor there is 1 and this entry should go back to \n" ..
                       "floor_id = 1 in locations.lua.",
                onmob_target = {"Couchatorage"},
                route_to = "Bostaunieux Oubliette",
            },
            {
                text = "3/8  BEADEAUX - The Mute1, floor_id was CHANGED 2 -> 15. \n \n" ..
                       "Ramp 1 (floor_id=1, upper) is included as a control - it was never touched. \n \n" ..
                       "Expected: Ramp 1 draws on the upper floor, The Mute1 draws on the lower floor. \n" ..
                       "If The Mute1 does NOT draw down there, put it back to floor_id = 2.",
                onmob_target = {"The Mute1", "Ramp 1"},
                route_to = "Beadeaux",
            },
            {
                text = "4/8  GIDDEUS - Uu Zhoumo, floor_id was CHANGED 2 -> 15. \n \n" ..
                       "Laa Mozi and Ghoo Pakya (floor_id=1) are controls - untouched. \n \n" ..
                       "Expected: the two controls draw on the upper floor, Uu Zhoumo on the lower. \n" ..
                       "If Uu Zhoumo does NOT draw, put it back to floor_id = 2.",
                onmob_target = {"Uu Zhoumo", "Laa Mozi", "Ghoo Pakya"},
                route_to = "Giddeus",
            },
            {
                text = "5/8  FEI'YIN - cermet door, floor_id was CHANGED 2 -> 15. \n \n" ..
                       "Go to the cermet door at (F-6). The beam should draw. \n" ..
                       "If it does NOT, put it back to floor_id = 2.",
                onmob_target = {"fei-yin-cermet-door-2-f6"},
                route_to = "Fei'Yin",
            },
            {
                text = "6/8  CASTLE OZTROJA - two entries CHANGED 7 -> 15 (high confidence). \n \n" ..
                       "castle-oztroja-brass-statue-15-h9 and castle-oztroja-brass-door-g10 are the \n" ..
                       "changed ones, both on the top floor (raw 15). Everything else here is a control \n" ..
                       "on floors 1/2/4 and was never touched. \n \n" ..
                       "Expected: controls draw on their own floors, and the two changed entries draw \n" ..
                       "on the top floor. If they do not, put them back to floor_id = 7.",
                onmob_target = {"castle-oztroja-brass-statue-15-h9",
                                "castle-oztroja-brass-door-g10",
                                "castle-oztroja-brass-statue-1-h9",
                                "castle-oztroja-brass-statue-2-i8",
                                "castle-oztroja-handle-1-g8",
                                "castle-oztroja-handle-2-g8",
                                "castle-oztroja-handle-3-g8",
                                "castle-oztroja-handle-4-g8",
                                "castle-oztroja-torch-stand-4-h7",
                                "castle-oztroja-brass-statue-4-h7",
                                "castle-oztroja-brass-door-4-h6",
                                "castle-oztroja-kaa-toru-the-just",
                                "castle-oztroja-handle-1-i8",
                                "castle-oztroja-handle-2-i8"},
                route_to = "Castle Oztroja",
            },
            {
                text = "7/8  PSO'XJA - 16 stone doors on floor_id=1, NOT changed. \n \n" ..
                       "The audit flags these because 1 is also Pso'Xja's map number (raw 8 -> map 1). \n" ..
                       "But sibling entries use raw 12 and 15, so 1 is almost certainly a raw id too - \n" ..
                       "Pso'Xja is many disconnected sections. \n \n" ..
                       "Expected: the numbered stone door beams draw. If they do NOT, and the debug UI \n" ..
                       "shows your raw floor as 8, then all 16 need floor_id = 8.",
                onmob_target = {"pso-xja-stone-door-1", "pso-xja-stone-door-2", "pso-xja-stone-door-3",
                                "pso-xja-stone-door-4", "pso-xja-stone-door-5", "pso-xja-stone-door-6",
                                "pso-xja-stone-door-7", "pso-xja-stone-door-8", "pso-xja-stone-door-9",
                                "pso-xja-stone-door-10", "pso-xja-stone-door-11", "pso-xja-stone-door-12",
                                "pso-xja-stone-door-13", "pso-xja-stone-door-14", "pso-xja-stone-door-15",
                                "pso-xja-stone-door-16",
                                "pso-xja-stone-door-g7", "pso-xja-stone-door-h8", "pso-xja-stone-gate",
                                "pso-xja-avatar-gate", "pso-xja-avatar-gate-2"},
                route_to = "Pso'Xja",
            },
            {
                text = "8/8  RIVERNE SITE A01 - unstable-displacement-g10 was changed 1 -> 2 and then \n" ..
                       "REVERTED back to 1. \n \n" ..
                       "Both Riverne sites use unstable=1 and spatial=2, and Site B01 is not in \n" ..
                       "floor_mappings at all, so its values are raw by definition - which is why 1 was \n" ..
                       "judged correct here. \n \n" ..
                       "Expected: all 5 displacement beams draw (4 spatial on floor 2, 1 unstable on \n" ..
                       "floor 1). If the unstable one does NOT draw but the others do, it needs 2.",
                onmob_target = {"riverne-site-a01-unstable-displacement-g10",
                                "riverne-site-a01-spatial-displacement-l8",
                                "riverne-site-a01-unstable-displacement-e10",
                                "riverne-site-a01-spatial-displacement-d9",
                                "riverne-site-a01-spatial-displacement-e8"},
                route_to = "Riverne - Site #A01",
            },
            {
                text = "TEST COMPLETE. \n \n" ..
                       "Any step where a beam failed to draw: the fix is in the step text - put the old \n" ..
                       "floor_id back in data/locations.lua. \n \n" ..
                       "Maze of Shakhrami is deliberately not tested: its [16] mapping line is commented \n" ..
                       "out, so its entries pass through unchanged and cannot be affected.",
            },
        }
    },
}
