return {
    -- =========================================================================================
    -- 1) I Can Hear a Rainbow (Summoner unlock)
    --
    -- Log 2 (Windurst) / Quest 75. The quest IS a weather hunt - you show the ruby seven
    -- "colours" by zoning into a listed outdoor area while that weather is up. Step 3 uses
    -- the weather_watch tracker. See data/ref/summoner_reference.md.
    -- =========================================================================================
    ["1.Summoner Quest - I Can Hear a Rainbow"] = {
        requirements = {
            level = 30,
        },
        steps = {
            {
                text = "Step 1: Get a Carbuncle's Ruby.\n \n" ..
                       "- Nearly every Leech drops it, but the rate is poor. The usual camp is the leeches along the southern beach of Buburimu Peninsula.\n",
                route_to = "Buburimu Peninsula",
                destination_highlight = { position = "H-9", offsetX = 16, offsetY = 16 },
                onmob_enemy = "Poison Leech",
                onmob_enemy_size = 2,
                zone_max_distance = 40,
                items_needed = {
                    { item = "Carbuncle's Ruby", quantity = 1 }
                },
                trigger_on_item_obtain = {
                    { item = "Carbuncle's Ruby", quantity = 1 },
                },
            },
            {
                text = "Step 2: Examine the House of the Hero door in Windurst Walls (G-3).\n \n" ..
                       "- The ruby must be in your INVENTORY - one sitting in the Mog Satchel does not count, here or for the weather.\n" ..
                       "- Carbuncle asks you to show him the seven weathers.\n \n",
                route_to = "Windurst Walls",
                destination_highlight = { position = "G-3", offsetX = 16, offsetY = 16 },
                onmob_target = "Door: House-of-the-Hero",
                zone_max_distance = 30,
                trigger_on_event_id = { 384, 385 },
            },
            {
                text = "Step 3: Show the Carbuncle's Ruby all seven weathers by zoning into different areas.\n \n" ..
                       "CRITICAL: Credit is on ZONE-IN only. It will only start tracking once you reach this step.\n \n",
                route_choices_label = "Route to (click one):",
                route_choices_per_row = 3,
                route_choices = {
                    { group = "Fire", zones = {
                        "Valkurm Dunes",
                        "Rolanberry Fields",
                        "Meriphataud Mountains",
                        "Eastern Altepa Desert",
                        "Western Altepa Desert",
                        "Cape Teriggan",
                        "Yuhtunga Jungle",
                        "Yhoator Jungle",
                    } },
                    { group = "Water", zones = {
                        "La Theine Plateau",
                        "Jugner Forest",
                        "Pashhow Marshlands",
                        "Rolanberry Fields",
                        "Buburimu Peninsula",
                        "Yuhtunga Jungle",
                        "Yhoator Jungle",
                        "The Sanctuary of Zi'Tah",
                    } },
                    { group = "Earth", zones = {
                        "Tahrongi Canyon",
                        "Konschtat Highlands",
                        "Valkurm Dunes",
                        "Sauromugue Champaign",
                        "Batallia Downs",
                        "Eastern Altepa Desert",
                        "Western Altepa Desert",
                        "Meriphataud Mountains",
                    } },
                    { group = "Wind", zones = {
                        "Tahrongi Canyon",
                        "Buburimu Peninsula",
                        "La Theine Plateau",
                        "Cape Teriggan",
                    } },
                    { group = "Ice", zones = {
                        "Beaucedine Glacier",
                        "Xarcabard",
                        "Batallia Downs",
                    } },
                    { group = "Thunder", zones = {
                        "Konschtat Highlands",
                        "Sauromugue Champaign",
                        "Pashhow Marshlands",
                        "Jugner Forest",
                        "The Sanctuary of Zi'Tah",
                    } },
                    { group = "Clear", zones = {
                        "West Ronfaure",
                        "East Ronfaure",
                        "North Gustaberg",
                        "South Gustaberg",
                        "West Sarutabaruta",
                        "East Sarutabaruta",
                    } },
                },
                weather_watch = {
                    label = "Weathers shown to Carbuncle's Ruby",
                    -- Nothing is tracked unless the ruby is actually in the player's bags.
                    -- Same precondition the server uses, so browsing this quest in the UI
                    -- without being on it cannot bank colours.
                    requires_item = "Carbuncle's Ruby",
                    -- route_group hides the matching route_choices group once the colour is
                    -- banked - this list already reports it, so showing it twice is noise.
                    -- The link lives here, not in route_choices, so route_choices stays a
                    -- generic "pick one of these zones" widget.
                    slots = {
                        { key = "none",    label = "Clear / Sunshine",                    route_group = "Clear" },
                        { key = "fire",    label = "Fire (Hot Spell / Heat Wave)",        route_group = "Fire" },
                        { key = "water",   label = "Water (Rain / Squall)",               route_group = "Water" },
                        { key = "earth",   label = "Earth (Dust Storm / Sand Storm)",     route_group = "Earth" },
                        { key = "wind",    label = "Wind (Wind / Gales)",                 route_group = "Wind" },
                        { key = "ice",     label = "Ice (Snow / Blizzards)",              route_group = "Ice" },
                        { key = "thunder", label = "Thunder (Thunder / Thunderstorms)",   route_group = "Thunder" },
                    },
                    -- Only these zones have an onZoneIn handler for the quest. Anywhere else,
                    -- however dramatic the weather, credits nothing.
                    zones = {
                        "West Ronfaure",
                        "East Ronfaure",
                        "North Gustaberg",
                        "South Gustaberg",
                        "West Sarutabaruta",
                        "East Sarutabaruta",
                        "La Theine Plateau",
                        "Konschtat Highlands",
                        "Tahrongi Canyon",
                        "Valkurm Dunes",
                        "Buburimu Peninsula",
                        "Jugner Forest",
                        "Batallia Downs",
                        "Pashhow Marshlands",
                        "Rolanberry Fields",
                        "Meriphataud Mountains",
                        "Sauromugue Champaign",
                        "Beaucedine Glacier",
                        "Xarcabard",
                        "Yuhtunga Jungle",
                        "Yhoator Jungle",
                        "The Sanctuary of Zi'Tah",
                        "Eastern Altepa Desert",
                        "Western Altepa Desert",
                        "Cape Teriggan",
                    },
                },
            },
            {
                text = "Step 4: Trade the Carbuncle's Ruby to the ??? in La Theine Plateau (G-6).\n \n" ..
                       "- It sits in the centre of the stone circle. The cutscene unlocks Summoner and teaches Carbuncle.\n" ..
                       "- Hang around into the next Vana'diel day for the rainbow that appears after the quest.\n \n",
                route_to = "La Theine Plateau",
                destination_highlight = { position = "G-6", offsetX = 16, offsetY = 16 },
                zone_max_distance = 40,
                trigger_on_event_id = { 124 },
                onmob_target = "la-theine-plateau-???-g6",
            },
        },
        reward = {
            text = "Unlocks the Summoner job!\n \n" ..
                   "Carbuncle (spell learned on completion)\n" ..
                   "Title: Rainbow Weaver\n" ..
                   "Windurst fame +20\n" ..
                   "A rainbow appears in La Theine the next Vana'diel day if you stay to watch.\n \n",
        },
    },
}
