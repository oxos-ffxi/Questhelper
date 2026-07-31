-- File: addons/QuestHelper/data/locations.lua
--
-- This file stores all reusable locations.
-- The key (e.g., "Conrad") will be used in your quest files.
--
-- visual_mode can be "beacon" or "arc".
-- If trigger_npc is "" or nil, it will always be active.
--

return {
    -- Bastok
    -- Bastok Mines
    ["Rashid"] = {
        target_pos = { x = -8.5, y = -3.0, z = -123.6 },
        trigger_npc = "Rashid",
        visual_mode = "arc",
        zone = "Bastok Mines",
    },
    ["Medicine Eagle"] = {
        target_pos = { x = -39, y = -2, z = 40.8 },
        trigger_npc = "Medicine Eagle",
        visual_mode = "arc",
        zone = "Bastok Mines",
    },
    ["Tall Mountain"] = {
        target_pos = { x = 71.8, y = 5, z = -11.6 },
        trigger_npc = "Tall Mountain",
        visual_mode = "arc",
        zone = "Bastok Mines",
    },
    ["Gumbah"] = {
        target_pos = { x = 53.5, y = -1.4, z = -37.1 },
        trigger_npc = "Gumbah",
        visual_mode = "arc",
        zone = "Bastok Mines",
        floor_id = 0,
        max_distance = 35,
    },
    ["Babenn"] = {
        target_pos = { x = 73.5, y = -2.2, z = 34.7 },
        visual_mode = "arc",
        zone = "Bastok Mines",
        floor_id = 0,
        max_distance = 30
    },
    -- Bastok Markets
    ["Cleades"] = {
        target_pos = { x = -362.0, y = -12.0, z = -169.0 },
        trigger_npc = "Cleades",
        visual_mode = "arc",
        zone = "Bastok Markets",
    },
    ["Gwill"] = {
        target_pos = { x = -317.8, y = -17.3, z = -177.4 },
        visual_mode = "arc",
        zone = "Bastok Markets",
        floor_id = 0,
        max_distance = 30
    },
    ["Brygid"] = {
        target_pos = { x = -90.2, y = -5.4, z = -108.5 },
        visual_mode = "arc",
        zone = "Bastok Markets",
        floor_id = 0,
        max_distance = 35
    },
    -- Port Bastok
    ["Argus"] = {
        target_pos = { x = 132.1, y = 6.8, z = -2.2 },
        trigger_npc = "Argus",
        visual_mode = "arc",
        zone = "Port Bastok",
    },
    ["Hilda"] = {
        target_pos = { x = -161.8, y = -9, z = 10.3 },
        dynamic_pos = true,
        y_offset = -1.6,
        trigger_npc = "Hilda",
        visual_mode = "arc",
        zone = "Port Bastok",
        floor_id = 0,
        max_distance = 30
    },
    ["Jabbar"] = {
        target_pos = { x = -99.7, y = -3.8, z = 26.1 },
        trigger_npc = "Jabbar",
        visual_mode = "arc",
        zone = "Port Bastok",
    },
    ["Kaede"] = {
        target_pos = { x = 48.3, y = -7.8, z = 69.2 },
        visual_mode = "arc",
        zone = "Port Bastok",
        floor_id = 0,
        max_distance = 30
    },
    ["Ensetsu"] = {
        target_pos = { x = 33.0, y = -6.0, z = 67.0 },
        trigger_npc = "Ensetsu",
        visual_mode = "arc",
        zone = "Port Bastok",
        floor_id = 0,
        max_distance = 30
    },
    ["Kagetora"] = {
        target_pos = { x = -96.0, y = -2.0, z = 29.0 },
        trigger_npc = "Kagetora",
        visual_mode = "arc",
        zone = "Port Bastok",
        floor_id = 0,
        max_distance = 30
    },
    -- Metalworks
    ["Cid"] = {
        target_pos = { x = -12.6, y = -13.0, z = 2.5 },
        trigger_npc = "Cid",
        visual_mode = "arc",
        zone = "Metalworks",
    },
    ["Conrad"] = {
        target_pos = { x = 132.0, y = 6.5, z = -2.1 },
        trigger_npc = "Conrad",
        visual_mode = "beacon",
        beacon_height = 15.0,
        zone = "Metalworks",
    },
    ["Naji"] = {
        target_pos = { x = 67.0, y = -16.0, z = -4.60 },
        trigger_npc = "Naji",
        visual_mode = "arc",
        zone = "Metalworks",
    },
    ["Malduc"] = {
        target_pos = { x = 66.0, y = -30.0, z = 4.50 },
        trigger_npc = "Malduc",
        visual_mode = "beacon",
        zone = "Metalworks",
    },
    ["Iron Eater"] = {
        target_pos = { x = 92.9, y = -22.0, z = 1.8 },
        trigger_npc = "Iron Eater",
        visual_mode = "arc",
        zone = "Metalworks",
    },
    ["Karst"] = {
        target_pos = { x = 107, y = -21.8, z = 0.18 },
        trigger_npc = "Karst",
        visual_mode = "arc",
        zone = "Metalworks",
    },
    ["Kaela"] = {
        target_pos = { x = 40.5, y = -30.0, z = 16.1 },
        trigger_npc = "Kaela",
        visual_mode = "arc",
        zone = "Metalworks",
    },
    ["Phara"] = {
        target_pos = { x = 75.0, y = -16.0, z = -82.0 },
        trigger_npc = "Phara",
        visual_mode = "beacon",
        zone = "Metalworks",
    },
    ["Alois"] = {
        target_pos = { x = 97.7, y = -22.0, z = 14.6 },
        trigger_npc = "Alois",
        visual_mode = "arc",
        zone = "Metalworks",
    },
    ["Lucius"] = {
        target_pos = { x = 60, y = -18.2, z = -42.3 },
        trigger_npc = "Lucius",
        visual_mode = "arc",
        zone = "Metalworks",
        floor_id = 0,
        max_distance = 35
    },
     ["Ayame"] = {
        target_pos = { x = 134, y = -20.5, z = 33.3 },
        trigger_npc = "Ayame",
        visual_mode = "arc",
        zone = "Metalworks",
    },
    ["Patt-Pott"] = {
        target_pos = { x = 24.0, y = -17.6, z = 42.6 },
        visual_mode = "arc",
        zone = "Metalworks",
        floor_id = 0,
        max_distance = 35
    },
    ["Pius"] = {
        target_pos = { x = 99.9, y = -22, z = -12.5 },
        visual_mode = "arc",
        zone = "Metalworks",
        floor_id = 0,
        max_distance = 35
    },
    ["Grohm"] = {
        target_pos = { x = -18.1, y = -12.2, z = -27.6 },
        visual_mode = "arc",
        zone = "Metalworks",
        floor_id = 0,
        max_distance = 35
    },
    ["Savae E Paleade"] = {
        target_pos = { x = 23.7, y = -18.4, z = -43.4 },
        visual_mode = "arc",
        zone = "Metalworks",
        floor_id = 0,
        max_distance = 20
    },
    ["Raibaht"] = {
        target_pos = { x = -26.3, y = -12.3, z = -3.6 },
        visual_mode = "arc",
        zone = "Metalworks",
        floor_id = 0,
        max_distance = 30
    },
    --Zeruhn Mines
    ["Makarim"] = {
        target_pos = { x = -61, y = 7 ,z = -333.3 },
        trigger_npc = "Makarim",
        visual_mode = "arc",
        zone = "Zeruhn Mines",
    },
    ["Drake Fang"] = {
        target_pos = { x = -77.2, y = -2 ,z = 59.1 },
        trigger_npc = "Drake Fang",
        visual_mode = "arc",
        zone = "Zeruhn Mines",
    },
    --Palborough Mines
    ["palborough-mines-mythril-seam"] = {
        target_pos = { x = 164.8, y = -3.0, z = 97.6 },
        visual_mode = "arc",
        zone = "Palborough Mines",
        floor_id = 1,
        max_distance = 30
    },
    ["palborough-mines-elevator-lever-i8"] = {
        target_pos = { x = 182.4, y = 0.9, z = 64.4 },
        visual_mode = "arc",
        zone = "Palborough Mines",
        floor_id = 1,
        max_distance = 15
    },
    ["palborough-mines-refiner-lid"] = {
        target_pos = { x = 180.0, y = -33.9, z = 169.7 },
        visual_mode = "arc",
        zone = "Palborough Mines",
        floor_id = 2,
        max_distance = 20
    },
    ["palborough-mines-refiner-lever"] = {
        target_pos = { x = 182.4, y = -33.1, z = 169.7 },
        visual_mode = "arc",
        zone = "Palborough Mines",
        floor_id = 2,
        max_distance = 20
    },
    ["palborough-mines-refiner-lever-2"] = {
        target_pos = { x = 175.7, y = -17.1, z = 175.9 },
        visual_mode = "arc",
        zone = "Palborough Mines",
        floor_id = 2,
        max_distance = 5
    },
    --Dangruf Wadi
    ["Geyser1"] = {
        target_pos = { x = -133, y= 3, z=133.3},
        visual_mode = "arc",
        zone = "Dangruf Wadi"
    },
    --Selbina
    ["Mathilde"] = {
        target_pos = { x = 12.6, y = -8.9, z = -7.6 },
        visual_mode = "arc",
        zone = "Selbina",
        floor_id = 0,
        max_distance = 35
    },
    ["Melyon"] = {
        target_pos = { x = 25.6, y = -8.2, z = 4.3 },
        visual_mode = "arc",
        zone = "Selbina",
        floor_id = 0,
        max_distance = 35
    },
    ["Vobo"] = {
        target_pos = { x = 37.9, y = -16.0, z = 81.2 },
        visual_mode = "arc",
        zone = "Selbina",
        floor_id = 0,
        max_distance = 30
    },
    ["Gabwaleid"] = {
        target_pos = { x = -17.7, y = -8.7, z = 11.2 },
        visual_mode = "arc",
        zone = "Selbina",
        floor_id = 0,
        max_distance = 30
    },
    --Mhaura
    ["Celestina"] = {
        target_pos = { x = -37.6, y = -17.7, z = 75.7 },
        visual_mode = "arc",
        zone = "Mhaura",
        floor_id = 0,
        max_distance = 30
    },
    ["Ekokoko"] = {
        target_pos = { x = -77.9, y = -25.1, z = 28.0 },
        visual_mode = "arc",
        zone = "Mhaura",
        floor_id = 0,
        max_distance = 30
    },
    ["Bihoro-Guhoro"] = {
        target_pos = { x = -28.5, y = -9.1, z = 40.9 },
        visual_mode = "arc",
        zone = "Mhaura",
        floor_id = 0,
        max_distance = 30
    },
    ["Jikka-Abukka"] = {
        target_pos = { x = -13.5, y = -16.7, z = 58.6 },
        visual_mode = "arc",
        zone = "Mhaura",
        floor_id = 0,
        max_distance = 30
    },
    ["Pikini-Mikini"] = {
        target_pos = { x = -47.2, y = -5.0, z = 35.3 },
        visual_mode = "arc",
        zone = "Mhaura",
        floor_id = 0,
        max_distance = 10
    },
    --Gusgen Mines
    ["Blind Moby"] = {
        target_pos = { x = 210.1, y= -59.2, z=-101.8},
        visual_mode = "arc",
        zone = "Gusgen Mines"
    },
    -- Beaudeaux
    ["The Mute1"] = {
        target_pos = { x = -100, y= 21.9, z=102.9},
        trigger_npc = "The Mute",
        visual_mode = "arc",
        zone = "Beadeaux",
        floor_id = 15,
        max_distance = 35
    },
    ["Ramp 1"] = {
        target_pos = { x = -259.9, y = 1, z = -137},
        visual_mode = "arc",
        zone = "Beadeaux",
        floor_id = 1,
        max_distance = 45
    },
    ["beadeaux-the-mute-k8"] = {
        target_pos = { x = 180.1, y = 38.9, z = 16.0 },
        visual_mode = "arc",
        zone = "Beadeaux",
        floor_id = 15,
        max_distance = 20
    },
    --Qulun Dome
    ["Qulun Door 1"] = {
        target_pos = { x = 59.9, y= 22, z=-6.7},
        visual_mode = "arc",
        zone = "Qulun Dome",
        floor_id = 0,
        max_distance = 45,
    },
    ["Magicite-Qulun"] = {
        target_pos = { x = 9.5, y= 23, z=-84},
        visual_mode = "arc",
        zone = "Qulun Dome"
    },
    ["qulun-dome-quadav-crest-???"] = {
        target_pos = { x = 259.9, y = 39.8, z = 79.5 },
        visual_mode = "arc",
        zone = "Qulun Dome",
        floor_id = 0,
        max_distance = 20
    },
    --Windurst
    -- Windurst Woods
    ["Perih Vashai"] = {
        target_pos = { x = 117.5, y = -4.9, z = 90.5 },
        visual_mode = "arc",
        zone = "Windurst Woods",
        floor_id = 0,
        max_distance = 40
    },
    ["Rakoh-Buuma"] = {
        target_pos = { x = 110.5, y = -7, z = -24.0 },
        visual_mode = "arc",
        zone = "Windurst Woods",
        floor_id = 0,
        max_distance = 35
    },
    ["Apururu"] = {
        target_pos = { x = -12.1, y = -3.5, z = 15.9 },
        visual_mode = "arc",
        zone = "Windurst Woods",
        floor_id = 0,
        max_distance = 40
    },
    ["Nanaa Mihgo"] = {
        target_pos = { x = 65.0, y = -6.2, z = 239.6 },
        visual_mode = "arc",
        zone = "Windurst Woods",
        floor_id = 0,
        max_distance = 35
    },
    ["Mourices"] = {
        target_pos = { x = -50.6, y = -1.6, z = -27.6 },
        visual_mode = "arc",
        zone = "Windurst Woods",
        floor_id = 0,
        max_distance = 20
    },
    ["Boizo-Naizo"] = {
        target_pos = { x = -9.6, y = -3.6, z = -26.1 },
        visual_mode = "arc",
        zone = "Windurst Woods",
        floor_id = 0,
        max_distance = 35
    },
    ["Sola Jaab"] = {
        target_pos = { x = 109.4, y = -6.5, z = -25.9 },
        visual_mode = "arc",
        zone = "Windurst Woods",
        floor_id = 0,
        max_distance = 35
    },
    --Port Windurst
    ["Melek"] = {
        target_pos = { x = -78, y= -7, z=156},
        trigger_npc = "Melek",
        visual_mode = "arc",
        zone = "Port Windurst"
    },
    ["Gold Skull"] = {
        target_pos = { x = -76.5, y= -7.5, z=159.3},
        trigger_npc = "Gold Skull",
        visual_mode = "arc",
        zone = "Port Windurst"
    },
    ["Yujuju"] = {
        target_pos = { x = 201.5, y = -5.7, z = 139.0 },
        visual_mode = "arc",
        zone = "Port Windurst",
        floor_id = 0,
        max_distance = 40
    },
    ["Chipmy-Popmy"] = {
        target_pos = { x = -183.0, y = -3.8, z = 73.9 },
        visual_mode = "arc",
        zone = "Port Windurst",
        floor_id = 0,
        max_distance = 35
    },
    ["Janshura-Rashura"] = {
        target_pos = { x = -230.6, y = -9.2, z = 184.1 },
        visual_mode = "arc",
        zone = "Port Windurst",
        floor_id = 0,
        max_distance = 35
    },
    ["Hakkuru-Rinkuru"] = {
        target_pos = { x = -111.1, y = -5.2, z = 102.1 },
        visual_mode = "arc",
        zone = "Port Windurst",
        floor_id = 0,
        max_distance = 35
    },
    ["Babubu"] = {
        target_pos = { x = -175.2, y = -4.2, z = 70.4 },
        visual_mode = "arc",
        zone = "Port Windurst",
        floor_id = 0,
        max_distance = 30
    },
    ["Shanruru"] = {
        target_pos = { x = -1.3, y = -6.8, z = 186.7 },
        visual_mode = "arc",
        zone = "Port Windurst",
        floor_id = 0,
        max_distance = 35
    },
    -- Windurst Waters North
    ["Kyume-Romeh"] = {
        target_pos = { x = -54.5, y = -5.3, z = 23.2 },
        visual_mode = "arc",
        zone = "Windurst Waters North",
        floor_id = 1,
        max_distance = 40
    },
    ["Tosuka-Porika"] = {
        target_pos = { x = -28.7, y = -6.2, z = 104.4 },
        visual_mode = "arc",
        zone = "Windurst Waters North",
        floor_id = 1,
        max_distance = 40
    },
    ["Mokyokyo"] = {
        target_pos = { x = -56.0, y = -6.3, z = 230.4 },
        visual_mode = "arc",
        zone = "Windurst Waters North",
        floor_id = 1,
        max_distance = 35
    },
    ["Moreno-Toeno"] = {
        target_pos = { x = 168.5, y = -2.1, z = 156.9 },
        visual_mode = "arc",
        zone = "Windurst Waters North",
        floor_id = 1,
        max_distance = 35
    },
    ["Churano-Shurano"] = {
        target_pos = { x = -61.6, y = -12.2, z = 99.7 },
        visual_mode = "arc",
        zone = "Windurst Waters North",
        floor_id = 1,
        max_distance = 25
    },
    ["Koko Lihzeh"] = {
        target_pos = { x = 132.9, y = -6.9, z = 162.5 },
        visual_mode = "arc",
        zone = "Windurst Waters North",
        floor_id = 1,
        max_distance = 30
    },
    -- Windurst Waters South
    ["Ohbiru-Dohbiru"] = {
        target_pos = { x = 22.7, y = -6.2, z = -195.0 },
        visual_mode = "arc",
        zone = "Windurst Waters South",
        floor_id = 2,
        max_distance = 40
    },
    ["Honoi-Gomoi"] = {
        target_pos = { x = -194.1, y = -10.9, z = -122.9 },
        visual_mode = "arc",
        zone = "Windurst Waters South",
        floor_id = 2,
        max_distance = 45
    },
    ["Kerutoto"] = {
        target_pos = { x = 13.0, y = -5.4, z = -157.4 },
        visual_mode = "arc",
        zone = "Windurst Waters South",
        floor_id = 2,
        max_distance = 35
    },
    ["Leepe-Hoppe"] = {
        target_pos = { x = 11.4, y = -10.7, z = -197.5 },
        visual_mode = "arc",
        zone = "Windurst Waters South",
        floor_id = 2,
        max_distance = 30
    },
    ["Naiko-Paneiko"] = {
        target_pos = { x = -246.9, y = -6.3, z = -308.1 },
        visual_mode = "arc",
        zone = "Windurst Waters South",
        floor_id = 2,
        max_distance = 35
    },
    -- Windurst Walls
    ["Yoran-Oran"] = {
        target_pos = { x = -110.0, y = -13.8, z = 203.3 },
        visual_mode = "arc",
        zone = "Windurst Walls",
        floor_id = 0,
        max_distance = 45
    },
    ["Zokima-Rokima"] = {
        target_pos = { x = 0.0, y = -17.8, z = 127.0 },
        visual_mode = "arc",
        zone = "Windurst Walls",
        floor_id = 0,
        max_distance = 35
    },
    ["Door: House-of-the-Hero"] = {
        target_pos = { x = -26.0, y = -14.5, z = 263.0 },
        visual_mode = "arc",
        zone = "Windurst Walls",
        floor_id = 0,
        max_distance = 35
    },
    ["Shantotto"] = {
        target_pos = { x = 122.6, y = -3.9, z = 113.6 },
        visual_mode = "arc",
        zone = "Windurst Walls",
        floor_id = 0,
        max_distance = 25
    },
    ["Koru-Moru"] = {
        target_pos = { x = -121.7, y = -6.6, z = 122.4 },
        visual_mode = "arc",
        zone = "Windurst Walls",
        floor_id = 0,
        max_distance = 35
    },
    --Heavens Tower
    ["Kupipi"] = {
        target_pos = { x = 2, y= -1, z=32.1},
        trigger_npc = "Kupipi",
        visual_mode = "arc",
        zone = "Heavens Tower",
        floor_id = 0,
        max_distance = 35
    },
    ["Door: Starway-Stairway"] = {
        target_pos = { x = -13.7, y = -1.5, z = 28.9 },
        visual_mode = "arc",
        zone = "Heavens Tower",
        floor_id = 0,
        max_distance = 30
    },
    ["Zubaba"] = {
        target_pos = { x = 15.6, y = -27.0, z = 18.2 },
        visual_mode = "arc",
        zone = "Heavens Tower",
        floor_id = 0,
        max_distance = 20
    },
    ["Rhy Epocan"] = {
        target_pos = { x = 2.3, y = -48.8, z = 14.0 },
        visual_mode = "arc",
        zone = "Heavens Tower",
        floor_id = 0,
        max_distance = 22
    },
    ["Door: Vestal-chamber"] = {
        target_pos = { x = 0.0, y = -51.5, z = 40.3 },
        visual_mode = "arc",
        zone = "Heavens Tower",
        floor_id = 0,
        max_distance = 25
    },
    -- East Sarutabaruta
    ["Pore-Ohre"] = {
        target_pos = { x = 262.3, y = -18, z = -459.6 },
        visual_mode = "arc",
        zone = "East Sarutabaruta",
        floor_id = 0,
        max_distance = 35
    },
    -- Inner Horutoto Ruins
    ["inner-horutoto-ruins-gate-magical-gizmo"] = {
        target_pos = { x = 420.0, y = -1.7, z = -30.4 },
        visual_mode = "arc",
        zone = "Inner Horutoto Ruins",
        floor_id = 1,
        max_distance = 35
    },
    ["inner-horutoto-ruins-ancient-magical-gizmo-1"] = {
        target_pos = { x = 406.5, y = -3.0, z = 60.0 },
        visual_mode = "arc",
        zone = "Inner Horutoto Ruins",
        floor_id = 1,
        max_distance = 30
    },
    ["inner-horutoto-ruins-ancient-magical-gizmo-2"] = {
        target_pos = { x = 353.5, y = -3.0, z = 60.0 },
        visual_mode = "arc",
        zone = "Inner Horutoto Ruins",
        floor_id = 1,
        max_distance = 30
    },
    ["inner-horutoto-ruins-ancient-magical-gizmo-3"] = {
        target_pos = { x = 295.5, y = -3.5, z = 20.0 },
        visual_mode = "arc",
        zone = "Inner Horutoto Ruins",
        floor_id = 1,
        max_distance = 30
    },
    ["inner-horutoto-ruins-ancient-magical-gizmo-4"] = {
        target_pos = { x = 464.5, y = -3.5, z = 20.0 },
        visual_mode = "arc",
        zone = "Inner Horutoto Ruins",
        floor_id = 1,
        max_distance = 30
    },
    ["inner-horutoto-ruins-ancient-magical-gizmo-5"] = {
        target_pos = { x = 464.5, y = -3.5, z = 100.0 },
        visual_mode = "arc",
        zone = "Inner Horutoto Ruins",
        floor_id = 1,
        max_distance = 30
    },
    ["inner-horutoto-ruins-ancient-magical-gizmo-6"] = {
        target_pos = { x = 295.5, y = -3.5, z = 100.0 },
        visual_mode = "arc",
        zone = "Inner Horutoto Ruins",
        floor_id = 1,
        max_distance = 30
    },
    ["inner-horutoto-ruins-mahogany-door-g8"] = {
        target_pos = { x = -15.9, y = -2.2, z = 20.0 },
        visual_mode = "arc",
        zone = "Inner Horutoto Ruins",
        floor_id = 2,
        max_distance = 30
    },
    ["inner-horutoto-ruins-magic-gate-of-horutoto"] = {
        target_pos = { x = -175.7, y = -2.3, z = -140.0 },
        visual_mode = "arc",
        zone = "Inner Horutoto Ruins",
        floor_id = 2,
        max_distance = 30
    },
    ["inner-horutoto-ruins-gate-of-light"] = {
        target_pos = { x = -332.0, y = -1.9, z = 144.5 },
        visual_mode = "arc",
        zone = "Inner Horutoto Ruins",
        floor_id = 4,
        max_distance = 20
    },
    ["inner-horutoto-ruins-gate-of-darkness-4-i7"] = {
        target_pos = { x = -228.0, y = -1.9, z = 95.5 },
        visual_mode = "arc",
        zone = "Inner Horutoto Ruins",
        floor_id = 4,
        max_distance = 20
    },
    -- Outer Horutoto Ruins
    ["outer-horutoto-ruins-ancient-magical-gizmo-1"] = {
        target_pos = { x = 458.0, y = -3.3, z = -702.0 },
        visual_mode = "arc",
        zone = "Outer Horutoto Ruins",
        floor_id = 3,
        max_distance = 15
        },
    ["outer-horutoto-ruins-ancient-magical-gizmo-2"] = {
        target_pos = { x = 542.0, y = -3.3, z = -702.0 },
        visual_mode = "arc",
        zone = "Outer Horutoto Ruins",
        floor_id = 3,
        max_distance = 15
    },
    ["outer-horutoto-ruins-ancient-magical-gizmo-3"] = {
        target_pos = { x = 542.0, y = -3.3, z = -618.0 },
        visual_mode = "arc",
        zone = "Outer Horutoto Ruins",
        floor_id = 3,
        max_distance = 15
    },
    ["outer-horutoto-ruins-ancient-magical-gizmo-4"] = {
        target_pos = { x = 458.0, y = -3.3, z = -618.0 },
        visual_mode = "arc",
        zone = "Outer Horutoto Ruins",
        floor_id = 3,
        max_distance = 15
    },
    ["outer-horutoto-ruins-ancient-magical-gizmo-5"] = {
        target_pos = { x = 500.0, y = -3.3, z = -747.0 },
        visual_mode = "arc",
        zone = "Outer Horutoto Ruins",
        floor_id = 3,
        max_distance = 25
    },
    ["outer-horutoto-ruins-ancient-magical-gizmo-6"] = {
        target_pos = { x = 500.0, y = -3.3, z = -573.0 },
        visual_mode = "arc",
        zone = "Outer Horutoto Ruins",
        floor_id = 3,
        max_distance = 25
    },
    ["outer-horutoto-ruins-gate-magical-gizmo"] = {
        target_pos = { x = 590.4, y = -1.6, z = -660.0 },
        visual_mode = "arc",
        zone = "Outer Horutoto Ruins",
        floor_id = 3,
        max_distance = 35
    },
    ["outer-horutoto-ruins-gate-magical-gizmo-j8"] = {
        target_pos = { x = -289.6, y = -1.6, z = -660.0 },
        visual_mode = "arc",
        zone = "Outer Horutoto Ruins",
        floor_id = 4,
        max_distance = 35,
        draw_in_combat = false
    },
    ["outer-horutoto-ruins-cracked-wall-5-g8"] = {
        target_pos = { x = -424.3, y = -1.9, z = 620.0 },
        visual_mode = "arc",
        zone = "Outer Horutoto Ruins",
        floor_id = 5,
        max_distance = 15,
        draw_in_combat = false,
    },
    -- Toraimarai Canal
    ["toraimarai-canal-tome-of-magic"] = {
        target_pos = { x = 142.9, y = 12.7, z = -13.0 },
        visual_mode = "arc",
        zone = "Toraimarai Canal",
        floor_id = 2,
        max_distance = 10
    },
    ["toraimarai-canal-transporter"] = {
        target_pos = { x = 183.0, y = 11.5, z = -60.0 },
        visual_mode = "arc",
        zone = "Toraimarai Canal",
        floor_id = 2,
        max_distance = 25
    },
    -- Full Moon Fountain
    ["full-moon-fountain-moon-spiral"] = {
        target_pos = { x = -303.3, y = 9.5, z = -260.1 },
        visual_mode = "arc",
        zone = "Full Moon Fountain",
        floor_id = 0,
        max_distance = 35
    },
    -- Giddeus
    ["Uu Zhoumo"] = {
        target_pos = { x = -180, y= 15, z=157.4},
        trigger_npc = "Uu Zhoumo",
        visual_mode = "arc",
        zone = "Giddeus",
        floor_id = 15,
        max_distance = 20
    },
    ["Laa Mozi"] = {
        target_pos = { x = -21.6, y = -1.8, z = 145.3 },
        visual_mode = "arc",
        zone = "Giddeus",
        floor_id = 1,
        max_distance = 30
    },
    ["Ghoo Pakya"] = {
        target_pos = { x = -139.0, y = -2.1, z = 144.3 },
        visual_mode = "arc",
        zone = "Giddeus",
        floor_id = 1,
        max_distance = 30
    },
    --Balga Dais
    ["balga-dais-burning-circle"] = {
        target_pos = { x = 298.9, y = -124.1, z = 341.3 },
        visual_mode = "arc",
        zone = "Balga's Dais",
        floor_id = 0,
        max_distance = 35
    },
    --Castle Oztroja
    --1st password
    ["castle-oztroja-brass-statue-1-h9"] = {
        target_pos = { x = -60.1, y = -2.1, z = -61.5 },
        visual_mode = "arc",
        zone = "Castle Oztroja",
        floor_id = 1,
        max_distance = 30
    },
    --2nd password
    ["castle-oztroja-brass-statue-15-h9"] = {
        target_pos = { x = -60.0, y = 21.8, z = -102.8 },
        visual_mode = "arc",
        zone = "Castle Oztroja",
        floor_id = 15,
        max_distance = 30
    },
    --3rd password
    ["castle-oztroja-brass-statue-2-i8"] = {
        target_pos = { x = -18.6, y = -18.0, z = 20.0 },
        visual_mode = "arc",
        zone = "Castle Oztroja",
        floor_id = 2,
        max_distance = 30
    },
    -- levers
    ["castle-oztroja-handle-1-g8"] = {
        target_pos = { x = -183.6, y = -16.9, z = -12.8 },
        visual_mode = "arc",
        zone = "Castle Oztroja",
        floor_id = 2,
        max_distance = 10
    },
    ["castle-oztroja-handle-2-g8"] = {
        target_pos = { x = -183.2, y = -16.9, z = -12.8 },
        visual_mode = "arc",
        zone = "Castle Oztroja",
        floor_id = 2,
        max_distance = 10
    },
    ["castle-oztroja-handle-3-g8"] = {
        target_pos = { x = -182.7, y = -16.9, z = -12.8 },
        visual_mode = "arc",
        zone = "Castle Oztroja",
        floor_id = 2,
        max_distance = 10
    },
    ["castle-oztroja-handle-4-g8"] = {
        target_pos = { x = -182.3, y = -16.9, z = -12.8 },
        visual_mode = "arc",
        zone = "Castle Oztroja",
        floor_id = 2,
        max_distance = 10
    },
    --torch stand top floor
    ["castle-oztroja-torch-stand-4-h7"] = {
        target_pos = { x = -59.7, y = -74.8, z = -59.5 },
        visual_mode = "arc",
        zone = "Castle Oztroja",
        floor_id = 4,
        max_distance = 15
    },
    ["castle-oztroja-brass-statue-4-h7"] = {
        target_pos = { x = -100.1, y = -73.9, z = -16.8 },
        visual_mode = "arc",
        zone = "Castle Oztroja",
        floor_id = 4,
        max_distance = 15
    },
    ["castle-oztroja-brass-door-4-h6"] = {
        target_pos = { x = -100.0, y = -61.8, z = 85.8 },
        visual_mode = "arc",
        zone = "Castle Oztroja",
        floor_id = 4,
        max_distance = 15
    },
    ["castle-oztroja-kaa-toru-the-just"] = {
        target_pos = { x = -100.2, y = -63.4, z = 145.4 },
        visual_mode = "arc",
        zone = "Castle Oztroja",
        floor_id = 4,
        max_distance = 30
    },
    ["castle-oztroja-handle-1-i8"] = {
        target_pos = { x = 17.7, y = -1.1, z = -14.3 },
        visual_mode = "arc",
        zone = "Castle Oztroja",
        floor_id = 1,
        max_distance = 25
    },
    ["castle-oztroja-handle-2-i8"] = {
        target_pos = { x = 22.3, y = -1.1, z = -14.3 },
        visual_mode = "arc",
        zone = "Castle Oztroja",
        floor_id = 1,
        max_distance = 25
    },
    ["castle-oztroja-brass-door-g10"] = {
        target_pos = { x = -155.2, y = 21.5, z = -140.0 },
        visual_mode = "arc",
        zone = "Castle Oztroja",
        floor_id = 15,
        max_distance = 35
    },
    ["castle-oztroja-yagudo-crest-???"] = {
        target_pos = { x = -100.5, y = -63.2, z = 60.3 },
        visual_mode = "arc",
        zone = "Castle Oztroja",
        floor_id = 4,
        max_distance = 25
    },
    -- Maze of Shakhrami
    ["maze-of-shakhrami-fossil-rock-h5-1"] = {
        target_pos = { x = 49.1, y = 18.9, z = 152.5 },
        visual_mode = "arc",
        zone = "Maze of Shakhrami",
        floor_id = 16,
        max_distance = 35
    },
    ["maze-of-shakhrami-fossil-rock-h5-2"] = {
        target_pos = { x = -11.2, y = 19.2, z = 159.8 },
        visual_mode = "arc",
        zone = "Maze of Shakhrami",
        floor_id = 16,
        max_distance = 38
    },
    ["maze-of-shakhrami-fossil-rock-h5-3"] = {
        target_pos = { x = 17.4, y = 18.3, z = 184.7 },
        visual_mode = "arc",
        zone = "Maze of Shakhrami",
        floor_id = 16,
        max_distance = 38
    },
    ["maze-of-shakhrami-fossil-rock-i8-1"] = {
        target_pos = { x = 133.6, y = 18.2, z = -67.3 },
        visual_mode = "arc",
        zone = "Maze of Shakhrami",
        floor_id = 16,
        max_distance = 50
    },
    ["maze-of-shakhrami-fossil-rock-i8-2"] = {
        target_pos = { x = 127.6, y = 18.6, z = -127.8 },
        visual_mode = "arc",
        zone = "Maze of Shakhrami",
        floor_id = 16,
        max_distance = 50
    },
    --San d'Oria
    --Southern San d'Oria
    ["Endracion"] = {
        target_pos = { x = -112.8, y = -1.1, z = -37.2 },
        visual_mode = "arc",
        zone = "Southern San d'Oria",
        floor_id = 0,
        max_distance = 30
    },
    ["Ambrotien"] = {
        target_pos = { x = 93.4, y = -1.1, z = -57.3 },
        visual_mode = "arc",
        zone = "Southern San d'Oria",
        floor_id = 0,
        max_distance = 30
    },
    ["Hinaree"] = {
        target_pos = { x = -301.5, y = -11, z = 97.7 },
        visual_mode = "arc",
        zone = "Southern San d'Oria",
        floor_id = 0,
        max_distance = 50
    },
    ["Raminel"] = {
        target_pos = { x = -66.9, y = 0.8, z = -13.9 },
        dynamic_pos = true,
        y_offset = -1.2,
        trigger_npc = "Raminel",
        visual_mode = "arc",
        zone = "Southern San d'Oria",
        floor_id = 0,
        max_distance = 100
    },
    ["Sobane"] = {
        target_pos = { x = -189.0, y = -5.0, z = 99.2 },
        visual_mode = "arc",
        zone = "Southern San d'Oria",
        floor_id = 0,
        max_distance = 30
    },
    --Northern San d'Oria
    ["Baraka"] = {
        target_pos = { x = 38.65, y= -3.5, z=-5.75},
        trigger_npc = "Baraka",
        visual_mode = "arc",
        zone = "Northern San d'Oria"
    },
    ["Helaku"] = {
        target_pos = { x = 51.8, y= -3.5, z=-15.6},
        trigger_npc = "Helaku",
        visual_mode = "arc",
        zone = "Northern San d'Oria"
    },
    ["Arnau"] = {
        target_pos = { x = 149.9, y = -2.6, z = 141.9 },
        visual_mode = "arc",
        zone = "Northern San d'Oria",
        floor_id = 0,
        max_distance = 45
    },
    ["Chasalvige"] = {
        target_pos = { x = 96.4, y = -2.5, z = 134.0 },
        visual_mode = "arc",
        zone = "Northern San d'Oria",
        floor_id = 0,
        max_distance = 45
    },
    ["Kasaroro"] = {
        target_pos = { x = -72.3, y = -3.5, z = 34.4 },
        visual_mode = "arc",
        zone = "Northern San d'Oria",
        floor_id = 0,
        max_distance = 40
    },
    ["Heruze-Moruze"] = {
        target_pos = { x = -56.3, y = -3.5, z = 36.5 },
        visual_mode = "arc",
        zone = "Northern San d'Oria",
        floor_id = 0,
        max_distance = 35
    },
    ["Grilau"] = {
        target_pos = { x = -242.0, y = 6.0, z = 57.9 },
        visual_mode = "arc",
        zone = "Northern San d'Oria",
        floor_id = 0,
        max_distance = 30
    },
    ["Door: Papal Chambers"] = {
        target_pos = { x = 130.3, y = -13.0, z = 122.3 },
        visual_mode = "arc",
        zone = "Northern San d'Oria",
        floor_id = 0,
        max_distance = 10
    },
    ["Taurette"] = {
        target_pos = { x = -161.8, y = -1.2, z = 90.0 },
        visual_mode = "arc",
        zone = "Northern San d'Oria",
        floor_id = 0,
        max_distance = 35
    },
    ["Maloquedil"] = {
        target_pos = { x = 35.1, y = -2.3, z = 60.4 },
        visual_mode = "arc",
        zone = "Northern San d'Oria",
        floor_id = 0,
        max_distance = 35
    },
    -- Port San d'Oria
    ["Brifalien"] = {
        target_pos = { x = -19.4, y = -5.2, z = -74.1 },
        dynamic_pos = true,
        y_offset = -1.2,
        trigger_npc = "Brifalien",
        visual_mode = "arc",
        zone = "Port San d'Oria",
        floor_id = 0,
        max_distance = 20
    },
    ["Fontoumant"] = {
        target_pos = { x = -10.6, y = -10.2, z = -122.2 },
        visual_mode = "arc",
        zone = "Port San d'Oria",
        floor_id = 0,
        max_distance = 30,
    },
    ["Sheridan"] = {
        target_pos = { x = -19.1, y = -9.8, z = -129.7 },
        visual_mode = "arc",
        zone = "Port San d'Oria",
        floor_id = 0,
        max_distance = 30
    },
    ["Rugiette"] = {
        target_pos = { x = 71.4, y = -10.0, z = -73.7 },
        visual_mode = "arc",
        zone = "Port San d'Oria",
        floor_id = 0,
        max_distance = 50
    },
    -- West Ronfaure
    ["west-ronfaure-???-e8"] = {
        target_pos = { x = -695.7, y = -39.4, z = 21.4 },
        visual_mode = "arc",
        zone = "West Ronfaure",
        floor_id = 0,
        max_distance = 15,
        draw_in_combat = false,
    },
        -- Chateau d'Oraguille
    ["Halver"] = {
        target_pos = { x = 2.4, y= -2, z=1.9},
        trigger_npc = "Halver",
        visual_mode = "arc",
        zone = "Chateau d'Oraguille"
    },
    ["Door: Prince Royals Rm"] = {
        target_pos = { x = -38.0, y = -5.0, z = 75.4 },
        visual_mode = "arc",
        zone = "Chateau d'Oraguille",
        floor_id = 0,
        max_distance = 15
    },
    ["Chalvatot"] = {
        target_pos = { x = -106.0, y = -1.7, z = 72.2 },
        visual_mode = "arc",
        zone = "Chateau d'Oraguille",
        floor_id = 0,
        max_distance = 20
    },
    ["Door: Great Hall"] = {
        target_pos = { x = 0.0, y = -3.2, z = 17.0 },
        visual_mode = "arc",
        zone = "Chateau d'Oraguille",
        floor_id = 0,
        max_distance = 30
    },
    ["Faurie"] = {
        target_pos = { x = 1.4, y = -2.0, z = -15.3 },
        visual_mode = "arc",
        dynamic_pos = true,
        y_offset = -1.9,
        zone = "Chateau d'Oraguille",
        floor_id = 0,
        max_distance = 10,
        trigger_npc = "Faurie",
    },
    ["Rahal"] = {
        target_pos = { x = -31.0, y = -2.2, z = -8.4 },
        visual_mode = "arc",
        zone = "Chateau d'Oraguille",
        floor_id = 0,
        max_distance = 15
    },
    -- Bostaunieux Oubliette
    ["Couchatorage"] = {
        target_pos = { x = -20.5, y = -20.1, z = 17.8 },
        visual_mode = "arc",
        zone = "Bostaunieux Oubliette",
        floor_id = 15,
        max_distance = 10
    },
    -- Ghelsba Outpost
    ["ghelsba-outpost-hut-door-f10"] = {
        target_pos = { x = -165.4, y = -12.7, z = 77.8 },
        visual_mode = "arc",
        zone = "Ghelsba Outpost",
        floor_id = 1,
        max_distance = 15
    },
    -- King Ranperre's Tomb
    ["king-ranperres-tomb-tombstone-i10"] = {
        target_pos = { x = 1.0, y = -1.2, z = -103.6 },
        visual_mode = "arc",
        zone = "King Ranperre's Tomb",
        floor_id = 1,
        max_distance = 18
    },
    ["king-ranperre-tomb-heavy-stone-door-h8"] = {
        target_pos = { x = -39.0, y = 4.8, z = 20.0 },
        visual_mode = "arc",
        zone = "King Ranperre's Tomb",
        floor_id = 1,
        max_distance = 25,
        draw_in_combat = false,
    },
    ["king-ranperre-tomb-tombstone-h8"] = {
        target_pos = { x = -73.6, y = 7.8, z = 20.1 },
        visual_mode = "arc",
        zone = "King Ranperre's Tomb",
        floor_id = 1,
        max_distance = 30
    },
    -- La Theine Plateau
    -- Patrollers
    ["Galaihaurat"] = {
        target_pos = { x = -481.2, y = -9.1, z = 220.5 },
        visual_mode = "arc",
        zone = "La Theine Plateau",
        floor_id = 0,
        max_distance = 50
    },
    ["Equesobillot"] = {
        target_pos = { x = -286.5, y = 7.3, z = 287.8 },
        visual_mode = "arc",
        zone = "La Theine Plateau",
        floor_id = 0,
        max_distance = 25
    },
    ["Deaufrain"] = {
        target_pos = { x = -307.0, y = 25.6, z = 341.5 },
        visual_mode = "arc",
        zone = "La Theine Plateau",
        floor_id = 0,
        max_distance = 20
    },
    ["Vicorpasse"] = {
        target_pos = { x = -345.0, y = 35.2, z = 265.0 },
        visual_mode = "arc",
        zone = "La Theine Plateau",
        floor_id = 0,
        max_distance = 25
    },
    ["Laurisse"] = {
        target_pos = { x = -291.8, y = 26.2, z = 141.2 },
        visual_mode = "arc",
        zone = "La Theine Plateau",
        floor_id = 0,
        max_distance = 25
    },
    ["Narvecaint"] = {
        target_pos = { x = -261.9, y = 21.1, z = 127.6 },
        visual_mode = "arc",
        zone = "La Theine Plateau",
        floor_id = 0,
        max_distance = 20
    },
    -- Ordelle's Caves
    ["Ruillont"] = {
        target_pos = { x = -69.8, y = -0.6, z = 610.8 },
        visual_mode = "arc",
        zone = "Ordelle's Caves",
        floor_id = 1,
        max_distance = 25
    },
    -- Horlias Peak
    ["horlais-peak-burning-circle"] = {
        target_pos = { x = -503.0, y = 158.3, z = -212.6 },
        visual_mode = "arc",
        zone = "Horlais Peak",
        floor_id = 0,
        max_distance = 20
    },
    -- Waughroon Shrine
    ["waughroon-shrine-burning-circle"] = {
        target_pos = { x = -339.6, y = 104.3, z = -260.3 },
        visual_mode = "arc",
        zone = "Waughroon Shrine",
        floor_id = 0,
        max_distance = 35
    },
    -- Oldton Movalpolo
    ["oldton-movalpolos-tarnotik"] = {
        target_pos = { x = 160.9, y = 10.7, z = -55.7 },
        visual_mode = "arc",
        zone = "Oldton Movalpolos",
        floor_id = 0,
        max_distance = 25
    },
    ["oldton-movalpolos-twinkbrix"] = {
        target_pos = { x = -292.8, y = 6.8, z = -263.2 },
        visual_mode = "arc",
        zone = "Oldton Movalpolos",
        floor_id = 0,
        max_distance = 25
    },
    -- Mine Shaft
    ["mine-shaft-2716-shaft-entrance"] = {
        target_pos = { x = -54.5, y = -121.7, z = -580.0 },
        visual_mode = "arc",
        zone = "Mine Shaft #2716",
        floor_id = 0,
        max_distance = 35
    },
    -- La Theine Plateau
    ["zm4-la-theine-cermet-headstone"] = {
        target_pos = { x = -172.75, y= 38, z=-508.4},
        visual_mode = "arc",
        zone = "La Theine Plateau"
    },
    ["la-theine-plateau-shattered-telepoint"] = {
        target_pos = { x = 340.0, y = 19.1, z = -60.0 },
        visual_mode = "arc",
        zone = "La Theine Plateau",
        floor_id = 0,
        max_distance = 60
    },
    ["la-theine-plateau-???-g6"] = {
        target_pos = { x = -179.7, y = 8.8, z = 254.3 },
        visual_mode = "arc",
        zone = "La Theine Plateau",
        floor_id = 0,
        max_distance = 45
    },
    -- Carpenters' Landing
    ["carpenters-landing-guilloud"] = {
        target_pos = { x = -123.8, y = -7.8, z = -469.1 },
        visual_mode = "arc",
        zone = "Carpenters' Landing",
        floor_id = 1,
        max_distance = 35
    },
    ["carpenters-landing-???-i9"] = {
        target_pos = { x = 120.6, y = -5.3, z = -390.1 },
        visual_mode = "arc",
        zone = "Carpenters' Landing",
        floor_id = 1,
        max_distance = 30,
        draw_in_combat = false
    },
    -- Tahrongi Canyon
    ["tahrongi-canyon-shattered-telepoint"] = {
        target_pos = { x = 180.0, y = 35.2, z = 260.0 },
        visual_mode = "arc",
        zone = "Tahrongi Canyon",
        floor_id = 0,
        max_distance = 35
    },
    -- Attohwa Chasm
    ["attohwa-chasm-loose-sand"] = {
        target_pos = { x = 478.9, y = 20.0, z = 41.7 },
        visual_mode = "arc",
        zone = "Attohwa Chasm",
        floor_id = 0,
        max_distance = 25
    },
    ["attohwa-chasm-cradle-of-rebirth"] = {
        target_pos = { x = 320.2, y = -23.3, z = -15.9 },
        visual_mode = "arc",
        zone = "Attohwa Chasm",
        floor_id = 0,
        max_distance = 45
    },
    -- Boneyard Gully
    ["boneyard-gully-dark-miasma"] = {
        target_pos = { x = -619.4, y = -1.5, z = 505.7 },
        visual_mode = "arc",
        zone = "Boneyard Gully",
        floor_id = 0,
        max_distance = 45
    },
    -- Konschtat Highlands
   ["konschtat-highlands-shattered-telepoint"] = {
        target_pos = { x = 140.0, y = 19.1, z = 220.0 },
        visual_mode = "arc",
        zone = "Konschtat Highlands",
        max_distance = 60
    },
    -- Forger ??? (D-8 cave) - Samurai unlock, trade the lump of oriental steel here
    ["konschtat-forger-qm-d8"] = {
        target_pos = { x = -709.0, y = 2.0, z = 102.0 },
        visual_mode = "arc",
        zone = "Konschtat Highlands",
        max_distance = 40
    },
    -- Meriphataud Mountains
    -- ??? on the east edge of Drogaroga's Spine (K-8) - Dragoon unlock, trade the wyvern egg
    ["meriphataud-holy-crest-qm-k8"] = {
        target_pos = { x = 641.0, y = -15.0, z = 7.0 },
        visual_mode = "arc",
        zone = "Meriphataud Mountains",
        max_distance = 40
    },
    -- Buburimu Peninsula
    -- Song Runes on the old monument - the Bard lead-in chain, examine then trade parchment
    ["buburimu-peninsula-song-runes-g9"] = {
        target_pos = { x = -246.1, y = 15.0, z = -279.4 },
        visual_mode = "arc",
        zone = "Buburimu Peninsula",
        floor_id = 0,
        max_distance = 25
    },
    -- Valkurm Dunes
    ["valkurm-dunes-song-runes-b7"] = {
        target_pos = { x = -717.6, y = -8.6, z = 103.0 },
        visual_mode = "arc",
        zone = "Valkurm Dunes",
        floor_id = 0,
        max_distance = 20
    },
    -- Sauromugue Champaign
    -- Tiger Bones in the cave at (L-10), up the cliff at (L-8) - Ranger unlock
    ["sauromugue-tiger-bones-l10"] = {
        target_pos = { x = 666.0, y = -8.0, z = -379.0 },
        visual_mode = "arc",
        zone = "Sauromugue Champaign",
        max_distance = 40
    },
    -- Qufim Island
    -- Nightflowers - Save My Son. Only interactable at night (Vana'diel ~21:30 to dawn)
    ["qufim-nightflowers"] = {
        target_pos = { x = -264.8, y = -3.7, z = 28.8 },
        visual_mode = "arc",
        zone = "Qufim Island",
        max_distance = 40
    },
    -- Korroloka Tunnel
    -- ??? that pops the three Korroloka Leeches - Ninja unlock
    ["korroloka-ninja-qm2"] = {
        target_pos = { x = -208.0, y = -9.0, z = 176.0 },
        visual_mode = "arc",
        zone = "Korroloka Tunnel",
        max_distance = 30
    },
    -- Hall Of Transference
    ["hall-of-transference-dem-large-apparatus"] = {
        target_pos = { x = -236.3, y = -44.9, z = -270.0 },
        visual_mode = "arc",
        zone = "Hall of Transference",
        floor_id = 2,
        max_distance = 35
    },
    ["hall-of-transference-holla-large-apparatus"] = {
        target_pos = { x = -236.3, y = -4.9, z = 290.0 },
        visual_mode = "arc",
        zone = "Hall of Transference",
        floor_id = 1,
        max_distance = 35
    },
    ["hall-of-transference-mea-large-apparatus"] = {
        target_pos = { x = 270.0, y = -84.9, z = -36.3 },
        visual_mode = "arc",
        zone = "Hall of Transference",
        floor_id = 3,
        max_distance = 35
    },
    -- Tavnazian Safehold
    ["Despachiaire"] = {
        target_pos = { x = 111.2, y = -42.0, z = -85.5 },
        visual_mode = "arc",
        zone = "Tavnazian Safehold",
        floor_id = 1,
        max_distance = 35
    },
    ["Justinius"] = {
        target_pos = { x = 78.7, y = -35.5, z = 70.5 },
        visual_mode = "arc",
        zone = "Tavnazian Safehold",
        floor_id = 1,
        max_distance = 35
    },
    ["Ferchinne"] = {
        target_pos = { x = -69.1, y = -13.2, z = -5.7 },
        visual_mode = "arc",
        zone = "Tavnazian Safehold",
        floor_id = 2,
        max_distance = 35
    },
    ["Quelveuiat"] = {
        target_pos = { x = 3.2, y = -24.7, z = -26.0 },
        dynamic_pos = true,
        y_offset = -1.9,
        trigger_npc = "Quelveuiat",
        visual_mode = "arc",
        zone = "Tavnazian Safehold",
        floor_id = 2,
        max_distance = 35
    },
    ["tavnazian-safehold-sewer-entrance"] = {
        target_pos = { x = 28.0, y = -13.9, z = 45.9 },
        visual_mode = "arc",
        zone = "Tavnazian Safehold",
        floor_id = 3,
        max_distance = 40
    },
    ["tavnazian-safehold-walnut-door"] = {
        target_pos = { x = 117.0, y = -42.8, z = 42.0 },
        visual_mode = "arc",
        zone = "Tavnazian Safehold",
        floor_id = 1,
        max_distance = 35
    },
    -- Sealion's Den
    ["Sueleen"] = {
        target_pos = { x = 616.0, y = 131.2, z = 772.9 },
        visual_mode = "arc",
        zone = "Sealion's Den",
        floor_id = 1,
        max_distance = 25
    },
    ["sealions-den-iron-gate"] = {
        target_pos = { x = 612.0, y = 130.9, z = 770.0 },
        visual_mode = "arc",
        zone = "Sealion's Den",
        floor_id = 1,
        max_distance = 25
    },
    -- CoP 6-4
    ["sealion-den-airship-door"] = {
        target_pos = { x = -780.0, y = -104.3, z = -90.3 },
        visual_mode = "arc",
        zone = "Sealion's Den",
        floor_id = 0,
        max_distance = 7
    },
   -- Lufaise Meadows
    ["lufaise-meadows-???-h10"] = {
        target_pos = { x = -38.6, y = -9.0, z = -290.7 },
        visual_mode = "arc",
        zone = "Lufaise Meadows",
        floor_id = 0,
        max_distance = 5
    },
   -- Misareaux Coast
    ["misareaux-coast-dilapidated-gate"] = {
        target_pos = { x = 260.0, y = 7.3, z = -440.0 },
        visual_mode = "arc",
        zone = "Misareaux Coast",
        floor_id = 0,
        max_distance = 40
    },
    ["misareaux-coast-dilapidated-gate-f7"] = {
        target_pos = { x = -260.0, y = -32.7, z = 280.0 },
        visual_mode = "arc",
        zone = "Misareaux Coast",
        floor_id = 0,
        max_distance = 50
    },
    ["misareaux-coast-spatial-displacement"] = {
        target_pos = { x = -544.3, y = -33.3, z = 358.0 },
        visual_mode = "arc",
        zone = "Misareaux Coast",
        floor_id = 0,
        max_distance = 120
    },
    ["misareaux-coast-iron-gate"] = {
        target_pos = { x = 56.5, y = -25.5, z = 740.0 },
        visual_mode = "arc",
        zone = "Misareaux Coast",
        floor_id = 0,
        max_distance = 35
    },
    ["misareaux-coast-storage-compartment"] = {
        target_pos = { x = -312.5, y = -34.2, z = 187.2 },
        visual_mode = "arc",
        zone = "Misareaux Coast",
        floor_id = 0,
        max_distance = 35
    },
    -- Sacrarium
    ["sacrarium-wooden-gate-1"] = {
        target_pos = { x = 213.4, y = -3.5, z = 20.0 },
        visual_mode = "arc",
        zone = "Sacrarium",
        floor_id = 2,
        max_distance = 5
    },
    ["sacrarium-wooden-gate-2"] = {
        target_pos = { x = 213.4, y = -3.5, z = -20.0 },
        visual_mode = "arc",
        zone = "Sacrarium",
        floor_id = 2,
        max_distance = 5
    },
    ["sacrarium-large-keyhole"] = {
    target_pos = { x = 100.2, y = -1.4, z = 51.7 },
    visual_mode = "arc",
    zone = "Sacrarium",
    floor_id = 2,
    max_distance = 5
    },
    ["sacrarium-small-keyhole"] = {
        target_pos = { x = 99.8, y = -1.6, z = 51.5 },
        visual_mode = "arc",
        zone = "Sacrarium",
        floor_id = 2,
        max_distance = 5
    },
    ["sacrarium-wooden-gate-g8"] = {
        target_pos = { x = 45.5, y = -1.5, z = 10.0 },
        visual_mode = "arc",
        zone = "Sacrarium",
        floor_id = 2,
        max_distance = 15
    },
    ["sacrarium-wooden-gate-f10"] = {
    target_pos = { x = 20.0, y = -3.5, z = -97.4 },
    visual_mode = "arc",
    zone = "Sacrarium",
    floor_id = 2,
    max_distance = 5
    },
    ["sacrarium-classroom-???-f11"] = {
        target_pos = { x = 22.7, y = -3.7, z = -127.3 },
        visual_mode = "arc",
        zone = "Sacrarium",
        floor_id = 2,
        max_distance = 15
    },
    ["sacrarium-classroom-???-g11"] = {
        target_pos = { x = 62.7, y = -3.7, z = -127.3 },
        visual_mode = "arc",
        zone = "Sacrarium",
        floor_id = 2,
        max_distance = 15
    },
    ["sacrarium-wooden-gate-h10"] = {
        target_pos = { x = 100.0, y = -3.5, z = -97.4 },
        visual_mode = "arc",
        zone = "Sacrarium",
        floor_id = 2,
        max_distance = 5
    },
    ["sacrarium-classroom-???-h11"] = {
        target_pos = { x = 102.7, y = -3.7, z = -127.3 },
        visual_mode = "arc",
        zone = "Sacrarium",
        floor_id = 2,
        max_distance = 15
    },
    ["sacrarium-wooden-gate-h6"] = {
        target_pos = { x = 100.0, y = -3.5, z = 97.4 },
        visual_mode = "arc",
        zone = "Sacrarium",
        floor_id = 2,
        max_distance = 5
    },
    ["sacrarium-classroom-???-h5"] = {
        target_pos = { x = 102.7, y = -3.7, z = 127.3 },
        visual_mode = "arc",
        zone = "Sacrarium",
        floor_id = 2,
        max_distance = 15
    },
    ["sacrarium-wooden-gate-g6"] = {
        target_pos = { x = 60.0, y = -3.5, z = 97.4 },
        visual_mode = "arc",
        zone = "Sacrarium",
        floor_id = 2,
        max_distance = 5
    },
    ["sacrarium-classroom-???-g5"] = {
        target_pos = { x = 62.7, y = -3.7, z = 127.3 },
        visual_mode = "arc",
        zone = "Sacrarium",
        floor_id = 2,
        max_distance = 15
    },
    ["sacrarium-wooden-gate-f6"] = {
        target_pos = { x = 20.0, y = -3.5, z = 97.4 },
        visual_mode = "arc",
        zone = "Sacrarium",
        floor_id = 2,
        max_distance = 5
    },
    ["sacrarium-classroom-???-f5"] = {
        target_pos = { x = 22.7, y = -3.7, z = 127.3 },
        visual_mode = "arc",
        zone = "Sacrarium",
        floor_id = 2,
        max_distance = 15
    },

    -- Riverne Site #A01
    ["riverne-site-a01-spatial-displacement-l8"] = {
        target_pos = { x = 660.7, y = -35.2, z = -463.0 },
        visual_mode = "arc",
        zone = "Riverne - Site #A01",
        floor_id = 2,
        max_distance = 20
    },
    ["riverne-site-a01-unstable-displacement-g10"] = {
        target_pos = { x = -12.6, y = 0.6, z = 308.0 },
        visual_mode = "arc",
        zone = "Riverne - Site #A01",
        -- raw floor 1: unstable displacements sit on a different floor to the
        -- spatial ones (floor 2), same split as Riverne - Site #B01
        floor_id = 1,
        max_distance = 35
    },
    ["riverne-site-a01-unstable-displacement-e10"] = {
        target_pos = { x = -458.9, y = 15.6, z = -703.5 },
        visual_mode = "arc",
        zone = "Riverne - Site #A01",
        floor_id = 2,
        max_distance = 45
    },
    ["riverne-site-a01-spatial-displacement-d9"] = {
        target_pos = { x = -587.2, y = 21.8, z = -507.6 },
        visual_mode = "arc",
        zone = "Riverne - Site #A01",
        floor_id = 2,
        max_distance = 40
    },
    ["riverne-site-a01-spatial-displacement-e8"] = {
        target_pos = { x = -504.0, y = -11.2, z = -381.9 },
        visual_mode = "arc",
        zone = "Riverne - Site #A01",
        floor_id = 2,
        max_distance = 40
    },
    -- Riverne Site #B01
    ["riverne-site-b01-spatial-displacement-m9"] = {
        target_pos = { x = 663.4, y = -27.2, z = 340.1 },
        visual_mode = "arc",
        zone = "Riverne - Site #B01",
        floor_id = 2,
        max_distance = 35
    },
    ["riverne-site-b01-unstable-displacement-g8"] = {
        target_pos = { x = -56.4, y = -4.4, z = -420.4 },
        visual_mode = "arc",
        zone = "Riverne - Site #B01",
        floor_id = 1,
        max_distance = 30
    },
    ["riverne-site-b01-spatial-displacement-f6"] = {
        target_pos = { x = -333.7, y = 33.8, z = 773.0 },
        visual_mode = "arc",
        zone = "Riverne - Site #B01",
        floor_id = 2,
        max_distance = 35
    },
    ["riverne-site-b01-spatial-displacement-e7"] = {
        target_pos = { x = -500.0, y = -3.2, z = 663.1 },
        visual_mode = "arc",
        zone = "Riverne - Site #B01",
        floor_id = 2,
        max_distance = 35
    },
    ["riverne-site-b01-spatial-displacement-e8"] = {
        target_pos = { x = -536.9, y = -23.2, z = 500.0 },
        visual_mode = "arc",
        zone = "Riverne - Site #B01",
        floor_id = 2,
        max_distance = 35
    },
    -- Monarch Linn
    ["monarch-linn-spatial-displacement"] = {
        target_pos = { x = -39.1, y = -3.3, z = -540.0 },
        visual_mode = "arc",
        zone = "Monarch Linn",
        floor_id = 0,
        max_distance = 35
    },
    -- Davoi
    ["Wall of Dark Arts"] = {
        target_pos = { x = -23.2, y= -0.6, z=-69.1},
        visual_mode = "arc",
        zone = "Davoi",
        floor_id = 0,
        max_distance = 40
    },
    ["Sedal-Godjal"] = {
        target_pos = { x = 187.4, y = -4.3, z = -117.3 },
        visual_mode = "arc",
        zone = "Davoi",
        floor_id = 0,
        max_distance = 8
    },
    ["davoi-wall-of-banishing-j9"] = {
        target_pos = { x = 180.9, y = -2.0, z = -222.3 },
        visual_mode = "arc",
        zone = "Davoi",
        floor_id = 0,
        max_distance = 10
    },
    ["davoi-groaning-pond-i6"] = {
        target_pos = { x = 105.7, y = 1.4, z = 59.1 },
        visual_mode = "arc",
        zone = "Davoi",
        floor_id = 0,
        max_distance = 20
    },
    ["davoi-wailing-pond-l9"] = {
        target_pos = { x = 385.6, y = 1.5, z = -181.1 },
        visual_mode = "arc",
        zone = "Davoi",
        floor_id = 0,
        max_distance = 20
    },
    ["davoi-screaming-pond-e8"] = {
        target_pos = { x = -221.1, y = 0.8, z = -105.5 },
        visual_mode = "arc",
        zone = "Davoi",
        floor_id = 0,
        max_distance = 20
    },
    ["davoi-howling-pond-h10"] = {
        target_pos = { x = 22.2, y = 1.2, z = -254.8 },
        visual_mode = "arc",
        zone = "Davoi",
        floor_id = 0,
        max_distance = 20
    },
    --Sandy 3-3
    ["Quemaricond"] = {
        target_pos = { x = 16, y = 0.12, z = -25.36 },
        dynamic_pos = true,
        y_offset = -1.9,
        visual_mode = "arc",
        trigger_npc = "Quemaricond",
        zone = "Davoi",
        floor_id = 0,
        max_distance = 40
    },
    --Sandy 2-2
    ["Zantaviat"] = {
        target_pos = { x = 211.9, y = -2.6, z = -9.2 },
        visual_mode = "arc",
        zone = "Davoi",
        floor_id = 0,
        max_distance = 30
    },
    ["davoi-!"] = {
        target_pos = { x = 211.2, y = 2.2, z = -104.4 },
        visual_mode = "arc",
        zone = "Davoi",
        floor_id = 0,
        max_distance = 15
    },
    -- Monastic Cavern
    ["Magicite-Monastic"] = {
        target_pos = { x = -160.8, y= -9.5, z=7.8},
        visual_mode = "arc",
        zone = "Monastic Cavern",
        floor_id = 0,
        max_distance = 40,
    },
    ["monastic-cavern-orcish-crest-???"] = {
        target_pos = { x = 167.8, y = -2.0, z = -21.3 },
        visual_mode = "arc",
        zone = "Monastic Cavern",
        floor_id = 0,
        max_distance = 25
    },
    -- Altar Room
    ["Magicite-Altar"] = {
        target_pos = { x = -347, y= 22.2, z=46.3},
        visual_mode = "arc",
        zone = "Altar Room",
        floor_id = 0,
        max_distance = 40,
    },
    -- Jueno
    -- Port Jeuno
    ["Guddal"] = {
        target_pos = { x = -17.5, y= 6, z=42.1},
        trigger_npc = "Guddal",
        visual_mode = "arc",
        zone = "Port Jeuno"
    },
    ["Gekko"] = {
        target_pos = { x = -66.8, y = 6.2, z = -5.4 },
        visual_mode = "arc",
        zone = "Port Jeuno",
        floor_id = 0,
        max_distance = 15
    },
    --Kazham
    ["Tielleque"] = {
        target_pos = { x = -55.3, y= -12, z=-94.8},
        trigger_npc = "Tielleque",
        visual_mode = "arc",
        zone = "Kazham"
    },
    ["Jakoh Wahcondalo"] = {
        target_pos = { x = 101.8, y= -16.5, z=-115.8},
        trigger_npc = "Jakoh Wahcondalo",
        visual_mode = "arc",
        zone = "Kazham"
    },
    ["Romaa Mihgo"] = {
        target_pos = { x = 29.0, y = -13.6, z = -176.5 },
        visual_mode = "arc",
        zone = "Kazham",
        floor_id = 0,
        max_distance = 25
    },
    ["Vanono"] = {
        target_pos = { x = -23.1, y = -4.9, z = -23.1 },
        visual_mode = "arc",
        zone = "Kazham",
        floor_id = 0,
        max_distance = 35
    },
    -- Lower Jeuno
    ["Ghebi Damomohe"] = {
        target_pos = { x = 15.6, y= -1.7, z=-7.6},
        trigger_npc = "Ghebi Damomohe",
        visual_mode = "arc",
        zone = "Lower Jeuno"
    },
    ["Aldo"] = {
        target_pos = { x = 21.0, y = 2.1, z = -61.5 },
        visual_mode = "arc",
        zone = "Lower Jeuno",
        floor_id = 0,
        max_distance = 20
    },
    -- Merchant's House door (_6t2) - starts and finishes Save My Son
    ["jeuno-merchants-house-door"] = {
        target_pos = { x = -82.2, y = -7.7, z = -168.8 },
        visual_mode = "arc",
        zone = "Lower Jeuno",
        floor_id = 0,
        max_distance = 25
    },
    ["Bki Tbujhja"] = {
        target_pos = { x = -23.4, y = -1.7, z = -57.8 },
        visual_mode = "arc",
        zone = "Lower Jeuno",
        floor_id = 0,
        max_distance = 10
    },
    ["Mertaire"] = {
        target_pos = { x = -17.2, y = -1.9, z = -60.1 },
        visual_mode = "arc",
        zone = "Lower Jeuno",
        floor_id = 0,
        max_distance = 10
    },
    ["Muckvix"] = {
        target_pos = { x = -26.8, y= 3.5, z=-137.3},
        trigger_npc = "Muckvix",
        visual_mode = "arc",
        zone = "Lower Jeuno",
        floor_id = 0,
        max_distance = 35
    },
    ["Sattal-Mansal"] = {
        target_pos = { x = 41.3, y= 3.1, z=-54},
        trigger_npc = "Sattal-Mansal",
        visual_mode = "arc",
        zone = "Lower Jeuno",
        floor_id = 0,
        max_distance = 50
    },
    ["Door: Jeuno Bazaar"] = {
        target_pos = { x = -1.3, y= 0, z=-64.2},
        visual_mode = "arc",
        zone = "Lower Jeuno"
    },
    ["Door: Mhuufya's Shop"] = {
        target_pos = { x = -9.5, y= 0, z=-78.3},
        visual_mode = "arc",
        zone = "Lower Jeuno"
    },
    ["Door: Junk Shop"] = {
        target_pos = { x = -10.5, y= 0, z=-73.4},
        visual_mode = "arc",
        zone = "Lower Jeuno"
    },
    ["Door: Neptune's Spire"] = {
        target_pos = { x = 38.1, y = -1.6, z = -16.6 },
        visual_mode = "arc",
        zone = "Lower Jeuno",
        max_distance = 35
    },
    -- Upper Jeuno
    -- Chocobo Stables - Chocobo's Wounds / Path of the Beastmaster
    ["Brutus"] = {
        target_pos = { x = -55.0, y = 8.0, z = 95.0 },
        trigger_npc = "Brutus",
        visual_mode = "arc",
        zone = "Upper Jeuno",
        max_distance = 30
    },
    ["Osker"] = {
        target_pos = { x = -61.4, y = 8.2, z = 94.2 },
        trigger_npc = "Osker",
        visual_mode = "arc",
        zone = "Upper Jeuno",
        max_distance = 30
    },
    -- the wounded chocobo you feed the wildgrass to
    ["upper-jeuno-wounded-chocobo"] = {
        target_pos = { x = -61.4, y = 8.2, z = 93.0 },
        visual_mode = "arc",
        zone = "Upper Jeuno",
        max_distance = 30
    },
    ["Paya-Sabya"] = {
        target_pos = { x = 11.85, y= 1.5, z=70.9},
        trigger_npc = "Paya-Sabya",
        visual_mode = "arc",
        zone = "Upper Jeuno"
    },
    ["Baudin"] = {
        target_pos = { x = -76.4, y= -2.2, z=80},
        trigger_npc = "Baudin",
        visual_mode = "arc",
        zone = "Upper Jeuno"
    },
    ["Monberaux"] = {
        target_pos = { x = -42.4, y = -2, z = -1.9 },
        visual_mode = "arc",
        zone = "Upper Jeuno",
        max_distance = 30
    },
    ["Door: Jeuno Auction House"] = {
        target_pos = { x = 5.1, y= 0, z=45.3},
        visual_mode = "arc",
        zone = "Upper Jeuno"
    },
    ["Door: Paya-Sabya's Shop"] = {
        target_pos = { x = 14.3, y= 0, z=75.1},
        visual_mode = "arc",
        zone = "Upper Jeuno"
    },
    ["Door: Marble Bridge"] = {
        target_pos = { x = -97.8, y = -1.7, z = 90.8 },
        visual_mode = "arc",
        zone = "Upper Jeuno",
        floor_id = 0,
        max_distance = 35
    },
    -- Batallia Downs
    ["batallia-downs-???-k9"] = {
        target_pos = { x = 426.3, y = 8.6, z = -163.3 },
        visual_mode = "arc",
        zone = "Batallia Downs",
        floor_id = 0,
        max_distance = 35
    },
    ["batallia-downs-???-j11"] = {
        target_pos = { x = 210.9, y = 17.2, z = -615.1 },
        visual_mode = "arc",
        zone = "Batallia Downs",
        floor_id = 0,
        max_distance = 15,
        draw_in_combat = false,
    },
    -- Crawlers' Nest
    ["crawlers-nest-g10-???"] = {
        target_pos = { x = -83.4, y = -8.2, z = 79.1 },
        visual_mode = "arc",
        zone = "Crawlers' Nest",
        floor_id = 16,
        max_distance = 20
    },
    ["crawlers-nest-i10-???"] = {
        target_pos = { x = 98.1, y = -38.5, z = -181.2 },
        visual_mode = "arc",
        zone = "Crawlers' Nest",
        floor_id = 15,
        max_distance = 20
    },
    ["crawlers-nest-i6-???"] = {
        target_pos = { x = 99.3, y = -2.2, z = -188.9 },
        visual_mode = "arc",
        zone = "Crawlers' Nest",
        floor_id = 17,
        max_distance = 20
    },
    -- Garliage Citadel
    ["garlaige-citadel-g8-weighted-stones"] = {
        target_pos = { x = -354.9, y = -0.2, z = 262.3 },
        visual_mode = "arc",
        zone = "Garlaige Citadel",
        floor_id = 1,
        max_distance = 20
    },
    ["garlaige-citadel-i8-bcf-1-???"] = {
        target_pos = { x = -13.4, y = 6.4, z = 191.7 },
        visual_mode = "arc",
        zone = "Garlaige Citadel",
        floor_id = 2,
        max_distance = 8
    },
    ["garlaige-citadel-h7-bcf-2-???"] = {
        target_pos = { x = -50.2, y = 6.3, z = 251.7 },
        visual_mode = "arc",
        zone = "Garlaige Citadel",
        floor_id = 2,
        max_distance = 8
    },
    ["garlaige-citadel-g6-bcf-3-???"] = {
        target_pos = { x = -137.0, y = 0.0, z = 347.5 },
        visual_mode = "arc",
        zone = "Garlaige Citadel",
        floor_id = 2,
        max_distance = 8
    },
    -- The Eldieme Necropolis
    ["the-eldieme-necropolis-east-plate-h8"] = {
        target_pos = { x = 231.3, y = -34.8, z = 20.0 },
        visual_mode = "arc",
        zone = "The Eldieme Necropolis",
        floor_id = 15,
        max_distance = 15
    },
    ["the-eldieme-necropolis-south-plate-g8"] = {
        target_pos = { x = 180.0, y = -34.8, z = -31.3 },
        visual_mode = "arc",
        zone = "The Eldieme Necropolis",
        floor_id = 15,
        max_distance = 15
    },
    ["the-eldieme-necropolis-h9-aps-1-???"] = {
        target_pos = { x = 252.8, y = -32.0, z = -64.8 },
        visual_mode = "arc",
        zone = "The Eldieme Necropolis",
        floor_id = 15,
        max_distance = 8
    },
    ["the-eldieme-necropolis-f9-aps-3-???"] = {
        target_pos = { x = 92.3, y = -32.0, z = -64.7 },
        visual_mode = "arc",
        zone = "The Eldieme Necropolis",
        floor_id = 15,
        max_distance = 8
    },
    ["the-eldieme-necropolis-f7-aps-2-???"] = {
        target_pos = { x = 105.3, y = -32.0, z = 92.6 },
        visual_mode = "arc",
        zone = "The Eldieme Necropolis",
        floor_id = 15,
        max_distance = 10
    },
    -- Ru'Lude Gardens
    ["Goggehn"] = {
        target_pos = { x = 3, y= 6.7, z=-79.4},
        trigger_npc = "Goggehn",
        visual_mode = "arc",
        zone = "Ru'Lude Gardens",
        floor_id = 0,
        max_distance = 35
    },
    ["Pherimociel"] = {
        target_pos = { x = -31.6, y = 0, z = 68.0 },
        visual_mode = "arc",
        zone = "Ru'Lude Gardens",
        max_distance = 35
    },
    ["Harith"] = {
        target_pos = { x = -4.3, y = 0.3, z = 134.0 },
        visual_mode = "arc",
        zone = "Ru'Lude Gardens",
        max_distance = 35
    },
    ["Door:Bastokan Embassy"] = {
        target_pos = { x = 18.6, y= 7.3, z=-75.4},
        visual_mode = "arc",
        zone = "Ru'Lude Gardens",
        floor_id = 0,
        max_distance = 35
    },
    ["Door: Windurstian Embassy"] = {
        target_pos = { x = 32.1, y = 7.5, z = -20.9 },
        visual_mode = "arc",
        zone = "Ru'Lude Gardens",
        floor_id = 0,
        max_distance = 35
    },
    ["Door: San dOrian Embassy"] = {
        target_pos = { x = -31.1, y = 7.5, z = -65.1 },
        visual_mode = "arc",
        zone = "Ru'Lude Gardens",
        floor_id = 0,
        max_distance = 10
    },
    ["Door: Audience Chamber"] = {
        target_pos = { x = 0.1, y= -7, z=70.3},
        visual_mode = "arc",
        zone = "Ru'Lude Gardens",
        floor_id = 0,
        max_distance = 35
    },
    ["Pakh Jatalfih"] = {
        target_pos = { x = 36.5, y = 7.4, z = -36.8 },
        visual_mode = "arc",
        zone = "Ru'Lude Gardens",
        floor_id = 0,
        max_distance = 8
    },
    ["Nelcabrit"] = {
        target_pos = { x = -35.6, y = 6.9, z = -49.7 },
        visual_mode = "arc",
        zone = "Ru'Lude Gardens",
        floor_id = 0,
        max_distance = 20
    },
    ["Maat"] = {
        target_pos = { x = 10.9, y = 1.5, z = 119.5 },
        visual_mode = "arc",
        zone = "Ru'Lude Gardens",
        floor_id = 0,
        max_distance = 35
    },
    -- Qufum Island
    --Lower Delkfutts Tower
    ["Cermet Door"] = {
        target_pos = { x = 601, y= 13.7, z=-19.7},
        visual_mode = "arc",
        zone = "Lower Delkfutt's Tower",
        floor_id = 15,
        max_distance = 35
    },
    ["lower-delkfutt-tower-cermet-door-h5"] = {
        target_pos = { x = 460.0, y = -2.5, z = 125.8 },
        visual_mode = "arc",
        zone = "Lower Delkfutt's Tower",
        floor_id = 1,
        max_distance = 15
    },
    --windy mission
    ["lower-delkfutt-tower-cermet-door-l7"] = {
        target_pos = { x = 640.5, y = 13.3, z = 60.0 },
        visual_mode = "arc",
        zone = "Lower Delkfutt's Tower",
        floor_id = 15,
        max_distance = 35
    },
    ["lower-delkfutt-tower-cermet-door-m8"] = {
        target_pos = { x = 640.5, y = 13.3, z = 20.0 },
        visual_mode = "arc",
        zone = "Lower Delkfutt's Tower",
        floor_id = 15,
        max_distance = 20
    },
    -- Upper Delkfutts Tower
    ["Elevator"] = {
        target_pos = { x = -300, y= -143.6, z=19.9},
        visual_mode = "arc",
        zone = "Upper Delkfutt's Tower"
    },
    --Throne Room
    ["throne-room"] = {
        target_pos = { x = -115.8, y = -8.7, z = 0.0 },
        visual_mode = "arc",
        zone = "Throne Room",
        floor_id = 0,
        max_distance = 200
    },
    -- QuiBia Arena
    ["Qubia-BCNM"] = {
        target_pos = { x = -214, y= -24.6, z=-20.1},
        visual_mode = "arc",
        zone = "Qu'Bia Arena"
    },
    ["qu-bia-arena-burning-circle"] = {
        target_pos = { x = -213.7, y = -24.6, z = 20.1 },
        visual_mode = "arc",
        zone = "Qu'Bia Arena",
        floor_id = 0,
        max_distance = 35
    },
    -- Western Altepa Desert
    ["6-1-???"] = {
        target_pos = { x = -328.4, y = 0.1, z = -112.9},
        visual_mode = "arc",

        zone = "Western Altepa Desert"
    },
    ["western-altepa-desert-dreamrose"] = {
        target_pos = { x = -262.4, y = -9.4, z = 49.2 },
        visual_mode = "arc",
        zone = "Western Altepa Desert",
        floor_id = 0,
        max_distance = 60,
        draw_in_combat = false,
    },
    -- Eastern Altepa Desert
    ["Lokpix"] = {
        target_pos = { x = -55.3, y = 2.9, z = 223.9},
        visual_mode = "arc",
        trigger_npc = "Lokpix",
        zone = "Eastern Altepa Desert"
    },
    -- Norg
    ["Norg_OakenDoor"] = {
        target_pos = { x = 101.3, y = -8.8, z = -12.1},
        visual_mode = "arc",
        zone = "Norg"
    },
    ["Gilgamesh"] = {
        target_pos = { x = 122.5, y = -9.8, z = -12.1},
        visual_mode = "arc",
        trigger_npc = "Gilgamesh",
        zone = "Norg",
        max_distance = 35,
    },
    ["Marilleune"] = {
        target_pos = { x = -11.3, y = -2.6, z = -51.3},
        visual_mode = "arc",
        trigger_npc = "Marilleune",
        zone = "Norg"
    },
    ["Ryoma"] = {
        target_pos = { x = -23.0, y = 0.0, z = -9.0 },
        trigger_npc = "Ryoma",
        visual_mode = "arc",
        zone = "Norg",
        max_distance = 35,
    },
    ["Jaucribaix"] = {
        target_pos = { x = 91.0, y = -7.0, z = -8.0 },
        visual_mode = "arc",
        trigger_npc = "Jaucribaix",
        zone = "Norg",
        max_distance = 35,
    },
    ["Aeka"] = {
        target_pos = { x = 4.0, y = 0.0, z = -4.0 },
        visual_mode = "arc",
        trigger_npc = "Aeka",
        zone = "Norg",
        max_distance = 35,
    },
    ["Ranemaud"] = {
        target_pos = { x = 15.0, y = 0.0, z = 23.0 },
        visual_mode = "arc",
        trigger_npc = "Ranemaud",
        zone = "Norg",
        max_distance = 35,
    },
    -- Ifrit's Caldroun
    ["ifrit-6-2-???"] = {
        target_pos = { x = 172.2, y = -0.5, z = -26.9},
        visual_mode = "arc",
        zone = "Ifrit's Cauldron"
    },
    -- Quicksand Caves
    ["quicksand-8-1-???"] = {
        target_pos = { x = -469.4, y = -1.4, z = 620},
        visual_mode = "arc",
        zone = "Quicksand Caves"
    },
    ["quicksand2-8-1-???"] = {
        target_pos = { x = -533.1, y = -0.9, z = -415},
        visual_mode = "arc",
        zone = "Quicksand Caves"
    },
    ["quicksand-caves-fountain-of-kings"] = {
        target_pos = { x = 571.3, y = 20.0, z = -938.5 },
        visual_mode = "arc",
        zone = "Quicksand Caves",
        floor_id = 2,
        max_distance = 10,
        draw_in_combat = false,
    },
    --Cloister of Tremors
    ["cloister-of-tremors-tremorstone-???"] = {
        target_pos = { x = -545.2, y = 1.9, z = -495.7 },
        visual_mode = "arc",
        zone = "Cloister of Tremors",
        floor_id = 0,
        max_distance = 12
    },
    --Chamber of Oracles
    ["chamber-of-oracles-shimmering-circle"] = {
        target_pos = { x = -220.1, y = -1.9, z = 23.0 },
        visual_mode = "arc",
        zone = "Chamber of Oracles",
        floor_id = 0,
        max_distance = 35
    },
    --Kuftal Tunnel
    ["kuftal1-8-2-???"] = {
        target_pos = { x = -29.1, y = -22.1, z = -183.8},
        visual_mode = "arc",
        zone = "Kuftal Tunnel"
    },
    ["kuftal2-8-2-???"] = {
        target_pos = { x = -27.8, y = -10.4, z = -185.8},
        visual_mode = "arc",
        zone = "Kuftal Tunnel"
    },
    --Rabao
    ["Dancing Wolf"] = {
        target_pos = { x = 7.6, y = 6.0, z = 81.3},
        visual_mode = "arc",
        zone = "Rabao"
    },
    -- Gustav Tunnel
    ["gustav1-9-1-???"] = {
        target_pos = { x = -130.7, y = 1.2, z = 252.6},
        visual_mode = "arc",
        zone = "Gustav Tunnel"
    },
    -- Temple of Uggalepih
    ["temple-of-uggalepih-granite-door-win-7-2"] = {
        target_pos = { x = 340.0, y = -1.9, z = 331.7 },
        visual_mode = "arc",
        zone = "Temple of Uggalepih",
        floor_id = 3,
        max_distance = 25
    },
    ["templeugg1-zm4-granitedoor"] = {
        target_pos = { x = 60.1, y = -2, z = 11.2},
        visual_mode = "arc",
        zone = "Temple of Uggalepih"
    },
    ["templeugg1-zm4-wornbook1"] = {
        target_pos = { x = 67.3, y = -2, z = 22.7},
        visual_mode = "arc",
        zone = "Temple of Uggalepih"
    },
    ["templeugg1-zm4-wornbook2"] = {
        target_pos = { x = 59, y = -2, z = 27.2},
        visual_mode = "arc",
        zone = "Temple of Uggalepih"
    },
    ["templeugg1-zm4-wornbook3"] = {
        target_pos = { x = 52.9, y = -2, z = 21.7},
        visual_mode = "arc",
        zone = "Temple of Uggalepih"
    },
    ["templeugg1-zm4-oldcasket"] = {
        target_pos = { x = 63, y = -0.8, z = 17.6},
        visual_mode = "arc",
        zone = "Temple of Uggalepih"
    },
    ["templeugg2-zm4-eastpainting"] = {
        target_pos = { x = -52.1, y = -2.2, z = -0.1},
        visual_mode = "arc",
        zone = "Temple of Uggalepih"
    },
    ["temple-of-uggalepih-win92-???"] = {
        target_pos = { x = -239.4, y = -2.2, z = -18.9 },
        visual_mode = "arc",
        zone = "Temple of Uggalepih",
        floor_id = 2,
        max_distance = 20
    },
    ["temple-of-uggalepih-granite-door-j10"] = {
        target_pos = { x = -7.5, y = -10.8, z = -100.0 },
        visual_mode = "arc",
        zone = "Temple of Uggalepih",
        floor_id = 2,
        max_distance = 5
    },
    ["temple-of-uggalepih-granite-door-s82-1"] = {
        target_pos = { x = -70.0, y = -18.8, z = -146.3 },
        visual_mode = "arc",
        zone = "Temple of Uggalepih",
        floor_id = 4,
        max_distance = 15
    },
    ["temple-of-uggalepih-granite-door-s82-2"] = {
        target_pos = { x = -50.0, y = -18.8, z = -146.3 },
        visual_mode = "arc",
        zone = "Temple of Uggalepih",
        floor_id = 4,
        max_distance = 15,
        draw_in_combat = false,
    },
    ["temple-of-uggalepih-brokenkey3-???"] = {
        target_pos = { x = -67.6, y = -17.8, z = -154.6 },
        visual_mode = "arc",
        zone = "Temple of Uggalepih",
        floor_id = 4,
        max_distance = 15
    },
    ["temple-of-uggalepih-brokenkey2-???"] = {
        target_pos = { x = -32.1, y = -17.8, z = -154.7 },
        visual_mode = "arc",
        zone = "Temple of Uggalepih",
        floor_id = 4,
        max_distance = 15
    },
    ["temple-of-uggalepih-brokenkey1-???"] = {
        target_pos = { x = -14.6, y = -17.8, z = -151.0 },
        visual_mode = "arc",
        zone = "Temple of Uggalepih",
        floor_id = 4,
        max_distance = 15
    },
    -- Cloister of Frost
    ["cloister-of-frost-zm5-cermet-headstone"] = {
        target_pos = { x = 567.9, y = -1.2, z = 608},
        visual_mode = "arc",
        zone = "Cloister of Frost"
    },
    -- Western Altepa Desern
    ["western-altepa-desert-zm5-cermet-headstone"] = {
        target_pos = { x = -112.4, y = 9.5, z = -220.8},
        visual_mode = "arc",
        zone = "Western Altepa Desert"
    },
    --Yuhtunga Jungle
    ["yuhtunga-jungle-zm5-cermet-headstone"] = {
        target_pos = { x = 493.8, y = 19.5, z = 303.5},
        visual_mode = "arc",
        zone = "Yuhtunga Jungle"
    },
    -- Beaucedine Glacier
    ["beaucedine-glacier-iron-grate-h8"] = {
        target_pos = { x = -20.0, y = -55.0, z = -41.0 },
        visual_mode = "arc",
        zone = "Beaucedine Glacier",
        floor_id = 0,
        max_distance = 35
    },
    ["beaucedine-glacier-iron-grate-f7"] = {
        target_pos = { x = -340.0, y = -95.0, z = 159.0 },
        visual_mode = "arc",
        zone = "Beaucedine Glacier",
        floor_id = 0,
        max_distance = 35
    },
    ["beaucedine-glacier-iron-grate-j8"] = {
        target_pos = { x = 241.0, y = 5.0, z = -20.0 },
        visual_mode = "arc",
        zone = "Beaucedine Glacier",
        floor_id = 0,
        max_distance = 35
    },
    ["beaucedine-glacier-iron-grate-h10"] = {
        target_pos = { x = 60.0, y = 5.0, z = -359.0 },
        visual_mode = "arc",
        zone = "Beaucedine Glacier",
        floor_id = 0,
        max_distance = 35
    },
    -- Fei'Yin
    ["fei-yin-cermet-door-2-f6"] = {
        target_pos = { x = -184.5, y = -2.0, z = 190.0 },
        visual_mode = "arc",
        zone = "Fei'Yin",
        floor_id = 15,
        max_distance = 20
    },
    -- Xarcabard
    ["xarcabard-h7-???"] = {
        target_pos = { x = 178.1, y = -33.2, z = 82.0 },
        visual_mode = "arc",
        zone = "Xarcabard",
        floor_id = 0,
        max_distance = 25
    },
    ["xarcabard-i5-boreal-tiger-???"] = {
        target_pos = { x = 338.8, y = -28.1, z = 381.3 },
        visual_mode = "arc",
        zone = "Xarcabard",
        floor_id = 0,
        max_distance = 35,
        draw_in_combat = false,
    },
    ["xarcabard-j6-boreal-coeurl-???"] = {
        target_pos = { x = 578.5, y = -8.2, z = 300.1 },
        visual_mode = "arc",
        zone = "Xarcabard",
        floor_id = 0,
        max_distance = 35,
        draw_in_combat = false,
    },
    ["xarcabard-g11-boreal-hound-???"] = {
        target_pos = { x = -18.8, y = -24.1, z = -501.6 },
        visual_mode = "arc",
        zone = "Xarcabard",
        floor_id = 0,
        max_distance = 35,
        draw_in_combat = false,
    },
    -- Uleguerand Range
    ["uleguerand-range-buffalostalker-dodzbraz"] = {
        target_pos = { x = -380.2, y = -25.9, z = -180.8 },
        visual_mode = "arc",
        zone = "Uleguerand Range",
        floor_id = 0,
        max_distance = 35
    },
    -- Bearclaw Pinnacle
    ["bearclaw-pinnacle-wind-pillar"] = {
        target_pos = { x = -720.0, y = 8.0, z = -440.0 },
        visual_mode = "arc",
        zone = "Bearclaw Pinnacle",
        floor_id = 0,
        max_distance = 30
    },
    -- Pso'Xja
    ["pso-xja-stone-gate"] = {
        target_pos = { x = -60.0, y = 38.4, z = 25.0 },
        visual_mode = "arc",
        zone = "Pso'Xja",
        floor_id = 0,
        max_distance = 8
    },
    ["pso-xja-stone-door-h8"] = {
        target_pos = { x = -330.0, y = -1.9, z = 318.4 },
        visual_mode = "arc",
        zone = "Pso'Xja",
        floor_id = 12,
        max_distance = 10
    },
    ["pso-xja-stone-door-g7"] = {
        target_pos = { x = -380.0, y = 46.1, z = 330.5 },
        visual_mode = "arc",
        zone = "Pso'Xja",
        floor_id = 15,
        max_distance = 20
    },
    -- CoP 5-3 - 16 stone doors
    ["pso-xja-stone-door-1"] = {
        target_pos = { x = 341.6, y = -1.9, z = -50.0 },
        visual_mode = "arc",
        zone = "Pso'Xja",
        floor_id = 1,
        max_distance = 5,
        draw_in_combat = false
    },
    ["pso-xja-stone-door-2"] = {
        target_pos = { x = 350.0, y = -1.9, z = -61.6 },
        visual_mode = "arc",
        zone = "Pso'Xja",
        floor_id = 1,
        max_distance = 5,
        draw_in_combat = false
    },
    ["pso-xja-stone-door-3"] = {
        target_pos = { x = 338.4, y = -1.9, z = -70.0 },
        visual_mode = "arc",
        zone = "Pso'Xja",
        floor_id = 1,
        max_distance = 5,
        draw_in_combat = false
    },
    ["pso-xja-stone-door-4"] = {
        target_pos = { x = 321.6, y = -1.9, z = -70.0 },
        visual_mode = "arc",
        zone = "Pso'Xja",
        floor_id = 1,
        max_distance = 5,
        draw_in_combat = false
    },
    ["pso-xja-stone-door-5"] = {
        target_pos = { x = 310.0, y = -1.9, z = -101.6 },
        visual_mode = "arc",
        zone = "Pso'Xja",
        floor_id = 1,
        max_distance = 5,
        draw_in_combat = false
    },
    ["pso-xja-stone-door-6"] = {
        target_pos = { x = 298.4, y = -1.9, z = -110.0 },
        visual_mode = "arc",
        zone = "Pso'Xja",
        floor_id = 1,
        max_distance = 5,
        draw_in_combat = false
    },
    ["pso-xja-stone-door-7"] = {
        target_pos = { x = 290.0, y = -1.9, z = -98.4 },
        visual_mode = "arc",
        zone = "Pso'Xja",
        floor_id = 1,
        max_distance = 5,
        draw_in_combat = false
    },
    ["pso-xja-stone-door-8"] = {
        target_pos = { x = 290.0, y = -1.9, z = -81.6 },
        visual_mode = "arc",
        zone = "Pso'Xja",
        floor_id = 1,
        max_distance = 5,
        draw_in_combat = false
    },
    ["pso-xja-stone-door-9"] = {
        target_pos = { x = 258.4, y = -1.9, z = -70.0 },
        visual_mode = "arc",
        zone = "Pso'Xja",
        floor_id = 1,
        max_distance = 5,
        draw_in_combat = false
    },
    ["pso-xja-stone-door-10"] = {
        target_pos = { x = 250.0, y = -1.9, z = -58.4 },
        visual_mode = "arc",
        zone = "Pso'Xja",
        floor_id = 1,
        max_distance = 5,
        draw_in_combat = false
    },
    ["pso-xja-stone-door-11"] = {
        target_pos = { x = 261.6, y = -1.9, z = -50.0 },
        visual_mode = "arc",
        zone = "Pso'Xja",
        floor_id = 1,
        max_distance = 5,
        draw_in_combat = false
    },
    ["pso-xja-stone-door-12"] = {
        target_pos = { x = 278.4, y = -1.9, z = -50.0 },
        visual_mode = "arc",
        zone = "Pso'Xja",
        floor_id = 1,
        max_distance = 5,
        draw_in_combat = false
    },
    ["pso-xja-stone-door-13"] = {
        target_pos = { x = 290.0, y = -1.9, z = -18.4 },
        visual_mode = "arc",
        zone = "Pso'Xja",
        floor_id = 1,
        max_distance = 5,
        draw_in_combat = false
    },
    ["pso-xja-stone-door-14"] = {
        target_pos = { x = 301.6, y = -1.9, z = -10.0 },
        visual_mode = "arc",
        zone = "Pso'Xja",
        floor_id = 1,
        max_distance = 5,
        draw_in_combat = false
    },
    ["pso-xja-stone-door-15"] = {
        target_pos = { x = 310.0, y = -1.9, z = -21.6 },
        visual_mode = "arc",
        zone = "Pso'Xja",
        floor_id = 1,
        max_distance = 5,
        draw_in_combat = false
    },
    ["pso-xja-stone-door-16"] = {
        target_pos = { x = 310.0, y = -1.9, z = -38.4 },
        visual_mode = "arc",
        zone = "Pso'Xja",
        floor_id = 1,
        max_distance = 5,
        draw_in_combat = false
    },
    ["pso-xja-avatar-gate"] = {
        target_pos = { x = 280.0, y = 30.4, z = -60.0 },
        visual_mode = "arc",
        zone = "Pso'Xja",
        floor_id = 0,
        max_distance = 15
    },
    ["pso-xja-avatar-gate-2"] = {
        target_pos = { x = 140.0, y = 46.4, z = -360.0 },
        visual_mode = "arc",
        zone = "Pso'Xja",
        floor_id = 0,
        max_distance = 15
    },
    -- Promvyion Vahlz
    ["promyvion-vahzl-memory-flux-j8"] = {
        target_pos = { x = 180.0, y = -2.5, z = -60.0 },
        visual_mode = "arc",
        zone = "Promyvion - Vahzl",
        floor_id = 0,
        max_distance = 100
    },
    ["promyvion-vahzl-memory-flux-m6"] = {
        target_pos = { x = 420.0, y = -2.5, z = 140.0 },
        visual_mode = "arc",
        zone = "Promyvion - Vahzl",
        floor_id = 0,
        max_distance = 100
    },
    ["promyvion-vahzl-memory-flux-d6"] = {
        target_pos = { x = -340.0, y = -2.5, z = 140.0 },
        visual_mode = "arc",
        zone = "Promyvion - Vahzl",
        floor_id = 0,
        max_distance = 100
    },
    --Cape Teriggan
    ["cape-teriggan-zm5-cermet-headstone"] = {
        target_pos = { x = -109.2, y = -8.5, z = 453.8},
        visual_mode = "arc",
        zone = "Cape Teriggan"
    },
    -- Valley of Sorrows
    ["valley-of-sorrows-i8-???"] = {
        target_pos = { x = 91.1, y = -3.7, z = -16.4 },
        visual_mode = "arc",
        zone = "Valley of Sorrows",
        floor_id = 0,
        max_distance = 20
    },
    --behemoth's dominion
    ["behemoth's-dominion-zm5-cermet-headstone"] = {
        target_pos = { x = -74.8, y = -5.3, z = -89.2},
        visual_mode = "arc",
        zone = "Behemoth's Dominion"
    },
    -- Bubu
    -- Bibiki Bay
    ["bibiki-bay-1-???-f6"] = {
        target_pos = { x = 100.2, y = -44.7, z = 940.5 },
        visual_mode = "arc",
        zone = "Bibiki Bay",
        floor_id = 1,
        max_distance = 30,
        draw_in_combat = false,
    },
    -- Bibiki Bay 2 - Purgonorgo Isle
    ["bibiki-bay-2-warmachine"] = {
        target_pos = { x = -345.2, y = -6.2, z = -976.6 },
        visual_mode = "arc",
        zone = "Bibiki Bay",
        floor_id = 2,
        max_distance = 35
    },
    --sanctuary of zitah
    ["sanctuary-of-zitah-zm5-cermet-headstone"] = {
        target_pos = { x = 231.8, y = -1, z = 279.9},
        visual_mode = "arc",
        zone = "The Sanctuary of Zi'Tah"
    },
    -- Guardian Treant ??? (L-10, up the rocks at the base of the tree, unmapped area
    -- east of K-10) - Samurai unlock, hatchet to pop, sacred sprig for the branch
    ["zitah-guardian-treant-qm-l10"] = {
        target_pos = { x = 642.0, y = -5.0, z = -150.0 },
        visual_mode = "arc",
        zone = "The Sanctuary of Zi'Tah",
        max_distance = 50
    },
    --delkfutts tower
    ["delkfutts-tower-zm8-lift-???"] = {
        target_pos = { x = 260.1, y = 19.4, z = 20.2},
        visual_mode = "arc",
        zone = "Upper Delkfutt's Tower",
        floor_id = 6
    },
    --Hall of the Gods
    ["hall-of-gods-zm10-gate"] = {
        target_pos = { x = 0.1, y = -14.3 , z = 49.7},
        visual_mode = "arc",
        zone = "Hall of the Gods",
        floor_id = 1
    },
    ["hall-of-gods-zm12-shimmering"] = {
        target_pos = { x = 0.1, y = -20.7 , z = 149.1},
        visual_mode = "arc",
        zone = "Hall of the Gods",
        floor_id = 1
    },
    --Rabao
    ["maryoh-comyujah"] = {
        target_pos = { x = -0.8, y = 6.5, z = 75.2 },
        visual_mode = "arc",
        zone = "Rabao"
    },
    --Quicksand Caves
    ["zm12-ancient-vessel-qm7"] = {
        target_pos = { x = -506.8, y = 17.5, z = -420.3 },
        visual_mode = "arc",
        zone = "Quicksand Caves",
        floor_id = 7
    },
    -- Ro'Maeve
    ["ro-maeve-qu-hau-spring"] = {
        target_pos = { x = 0.2, y = -27.4, z = 67.8 },
        visual_mode = "arc",
        zone = "Ro'Maeve",
        floor_id = 0,
        max_distance = 25
    },
    -- The Boyahda Tree
    ["the-boyahda-tree-mandragora-warden"] = {
        target_pos = { x = 82.0, y = 7.8, z = 139.6 },
        visual_mode = "arc",
        zone = "The Boyahda Tree",
        floor_id = 1,
        max_distance = 15
    },
    --The Shrine of Ru'Avitau
    ["zm14-ark-angel-cs-locale"] = {
        target_pos = { x = -39.9, y = -1.3, z = -147.8 },
        visual_mode = "arc",
        zone = "The Shrine of Ru'Avitau",
        floor_id = 1
    },
    -- La'Loff Amphitheater
    ["zm14-la-loff-ark-tt-shimmering-circle"] = {
        target_pos = {x = -264.6, y = -137.3, z = 374.7 },
        visual_mode = "arc",
        zone = "La'Loff Amphitheater",
        floor_id = 0,
        max_distance = 35
    },
    ["zm14-la-loff-ark-mr-shimmering-circle"] = {
        target_pos = {x = 14.4, y = -224.3, z = 488.1 },
        visual_mode = "arc",
        zone = "La'Loff Amphitheater",
        floor_id = 0,
        max_distance = 35
    },
    ["zm14-la-loff-ark-hm-shimmering-circle"] = {
        target_pos = {x = -605, y = -22.7, z = 483.7 },
        visual_mode = "arc",
        zone = "La'Loff Amphitheater",
        floor_id = 0,
        max_distance = 35
    },
    ["zm14-la-loff-ark-ev-shimmering-circle"] = {
        target_pos = { x = 235.6, y = -173.6, z = 361.3 },
        visual_mode = "arc",
        zone = "La'Loff Amphitheater",
        floor_id = 0,
        max_distance = 35
    },
    ["zm14-la-loff-ark-gk-shimmering-circle"] = {
        target_pos = { x = 556.0, y = -38.2, z = 520.6 },
        visual_mode = "arc",
        zone = "La'Loff Amphitheater",
        floor_id = 0,
        max_distance = 35
    },
    ["zm16-shrine-of-ru-avitau-yellow-monolith"] = {
        target_pos = { x = 7.9, y = -2.3, z = -116.0 },
        visual_mode = "arc",
        zone = "The Shrine of Ru'Avitau",
        floor_id = 1,
        max_distance = 35
    },
    -- Phomiuna Aqueducts - CoP 2-3
    ["phomiuna-aqueducts-wooden-ladder"] = {
        target_pos = { x = -159.32, y = -2.5, z = 60.0 },
        visual_mode = "arc",
        zone = "Phomiuna Aqueducts",
        floor_id = 2,
        max_distance = 30
    },
    ["phomiuna-aqueducts-???"] = {
        target_pos = { x = -75.3, y = -24.6, z = 92.5 },
            visual_mode = "arc",
            zone = "Phomiuna Aqueducts",
            floor_id = 3,
            max_distance = 2.5
    },

    -- CoP 2-3 Oil Lamps (corridor F-8, south to north: Fire/Earth/Water/Wind/Ice/Lightning/Light/Dark)
    ["phomiuna-aqueducts-fire-oil-lamp"] = {
        target_pos = { x = -63.7, y = -26.2, z = 43.0 },
        visual_mode = "arc",
        zone = "Phomiuna Aqueducts",
        floor_id = 3,
        max_distance = 35
        },
    ["phomiuna-aqueducts-earth-oil-lamp"] = {
        target_pos = { x = -63.7, y = -26.2, z = 47.0 },
        visual_mode = "arc",
        zone = "Phomiuna Aqueducts",
        floor_id = 3,
        max_distance = 35
    },
    ["phomiuna-aqueducts-water-oil-lamp"] = {
        target_pos = { x = -63.7, y = -26.2, z = 53.0 },
        visual_mode = "arc",
        zone = "Phomiuna Aqueducts",
        floor_id = 3,
        max_distance = 35
    },
    ["phomiuna-aqueducts-wind-oil-lamp"] = {
        target_pos = { x = -63.7, y = -26.2, z = 57.0 },
        visual_mode = "arc",
        zone = "Phomiuna Aqueducts",
        floor_id = 3,
        max_distance = 35
    },
    ["phomiuna-aqueducts-ice-oil-lamp"] = {
        target_pos = { x = -63.7, y = -26.2, z = 63.0 },
        visual_mode = "arc",
        zone = "Phomiuna Aqueducts",
        floor_id = 3,
        max_distance = 35
    },
    ["phomiuna-aqueducts-thunder-oil-lamp"] = {
        target_pos = { x = -63.7, y = -26.2, z = 67.0 },
        visual_mode = "arc",
        zone = "Phomiuna Aqueducts",
        floor_id = 3,
        max_distance = 35
    },
    ["phomiuna-aqueducts-light-oil-lamp"] = {
        target_pos = { x = -63.7, y = -26.2, z = 73.0 },
        visual_mode = "arc",
        zone = "Phomiuna Aqueducts",
        floor_id = 3,
        max_distance = 35
    },
    ["phomiuna-aqueducts-darkness-oil-lamp"] = {
        target_pos = { x = -63.7, y = -26.2, z = 77.0 },
        visual_mode = "arc",
        zone = "Phomiuna Aqueducts",
        floor_id = 3,
        max_distance = 35
    },
    ["phomiuna-aqueducts-ornate-gate"] = {
        target_pos = { x = -99.0, y = -25.5, z = 60.0 },
        visual_mode = "arc",
        zone = "Phomiuna Aqueducts",
        floor_id = 3,
        max_distance = 35
    },
    -- Al'Taieu (CoP 8-1)
    ["altaieu-crystalline-field"] = {
        target_pos = { x = 0.0, y = -12.5, z = -460.0 },
        visual_mode = "arc",
        zone = "Al'Taieu",
        floor_id = 0,
        max_distance = 35
    },
    ["altaieu-rubious-crystal-h13"] = {
        target_pos = { x = 0.0, y = -6.3, z = -738.9 },
        visual_mode = "arc",
        zone = "Al'Taieu",
        floor_id = 0,
        max_distance = 45,
        draw_in_combat = false
    },
    ["altaieu-rubious-crystal-d10"] = {
        target_pos = { x = -683.7, y = -6.3, z = -222.1 },
        visual_mode = "arc",
        zone = "Al'Taieu",
        floor_id = 0,
        max_distance = 40,
        draw_in_combat = false
    },
    ["altaieu-rubious-crystal-l10"] = {
        target_pos = { x = 683.7, y = -6.3, z = -222.2 },
        visual_mode = "arc",
        zone = "Al'Taieu",
        floor_id = 0,
        max_distance = 35,
        draw_in_combat = false
    },
    -- Grand Palace of Hu'Xzoi (CoP 8-1)
    ["grand-palace-of-hu-xzoi-gate-of-the-gods-north"] = {
        target_pos = { x = -20.0, y = -2.3, z = -280.2 },
        visual_mode = "arc",
        zone = "Grand Palace of Hu'Xzoi",
        floor_id = 1,
        max_distance = 40
    },
    ["grand-palace-of-hu-xzoi-particle-gate-east"] = {
        target_pos = { x = 5.0, y = -1.5, z = -320.0 },
        visual_mode = "arc",
        zone = "Grand Palace of Hu'Xzoi",
        floor_id = 1,
        max_distance = 40
    },
    ["grand-palace-of-hu-xzoi-particle-gate-west"] = {
        target_pos = { x = -45.0, y = -1.5, z = -320.0 },
        visual_mode = "arc",
        zone = "Grand Palace of Hu'Xzoi",
        floor_id = 1,
        max_distance = 35
    },
    -- escort cermet alcove
    ["grand-palace-of-hu-xzoi-cermet-alcove-j8"] = {
        target_pos = { x = -260.0, y = -1.0, z = 422.5 },
        visual_mode = "arc",
        zone = "Grand Palace of Hu'Xzoi",
        floor_id = 15,
        max_distance = 8
    },
    ["grand-palace-of-hu-xzoi-quasilumin-j7"] = {
        target_pos = { x = -260.0, y = -3.0, z = 497.0 },
        visual_mode = "arc",
        zone = "Grand Palace of Hu'Xzoi",
        floor_id = 15,
        max_distance = 8
    },
    ["grand-palace-of-hu-xzoi-cermet-alcove-m8"] = {
        target_pos = { x = 797.5, y = -1.0, z = 460.0 },
        visual_mode = "arc",
        zone = "Grand Palace of Hu'Xzoi",
        floor_id = 16,
        max_distance = 8
    },
    ["grand-palace-of-hu-xzoi-quasilumin-j8"] = {
        target_pos = { x = 540.0, y = -3.0, z = 423.0 },
        visual_mode = "arc",
        zone = "Grand Palace of Hu'Xzoi",
        floor_id = 16,
        max_distance = 8
    },
    ["grand-palace-of-hu-xzoi-cermet-alcove-j10"] = {
        target_pos = { x = 540.0, y = -1.0, z = 297.5 },
        visual_mode = "arc",
        zone = "Grand Palace of Hu'Xzoi",
        floor_id = 16,
        max_distance = 9
    },
    ["grand-palace-of-hu-xzoi-quasilumin-g10"] = {
        target_pos = { x = 300.0, y = -3.0, z = 297.0 },
        visual_mode = "arc",
        zone = "Grand Palace of Hu'Xzoi",
        floor_id = 16,
        max_distance = 9
    },
    ["grand-palace-of-hu-xzoi-cermet-alcove-g10"] = {
        target_pos = { x = -540.0, y = -1.0, z = 297.5 },
        visual_mode = "arc",
        zone = "Grand Palace of Hu'Xzoi",
        floor_id = 15,
        max_distance = 9
    },
    ["grand-palace-of-hu-xzoi-quasilumin-h7"] = {
        target_pos = { x = -382.0, y = -3.0, z = 500.0 },
        visual_mode = "arc",
        zone = "Grand Palace of Hu'Xzoi",
        floor_id = 15,
        max_distance = 9
    },
    ["grand-palace-of-hu-xzoi-cermet-portal-h8"] = {
        target_pos = { x = 420.0, y = -1.9, z = 400.0 },
        visual_mode = "arc",
        zone = "Grand Palace of Hu'Xzoi",
        floor_id = 16,
        max_distance = 35,
        draw_in_combat = false
    },
    -- CoP 8-3
    ["the-garden-of-ru-hmet-ebon-panel-taru"] = {
        target_pos = { x = 257.6, y = -5.2, z = -700.0 },
        visual_mode = "arc",
        zone = "The Garden of Ru'Hmet",
        floor_id = 4,
        max_distance = 35
    },
    ["the-garden-of-ru-hmet-ebon-panel-galka"] = {
        target_pos = { x = 577.6, y = -5.2, z = -700.0 },
        visual_mode = "arc",
        zone = "The Garden of Ru'Hmet",
        floor_id = 4,
        max_distance = 35
    },
    ["the-garden-of-ru-hmet-ebon-panel-hume"] = {
        target_pos = { x = 422.4, y = -5.2, z = -100.0 },
        visual_mode = "arc",
        zone = "The Garden of Ru'Hmet",
        floor_id = 4,
        max_distance = 35
    },
    ["the-garden-of-ru-hmet-ebon-panel-mithra"] = {
        target_pos = { x = 100.0, y = -5.2, z = -337.7 },
        visual_mode = "arc",
        zone = "The Garden of Ru'Hmet",
        floor_id = 4,
        max_distance = 35
    },
    ["the-garden-of-ru-hmet-ebon-panel-elvaan"] = {
        target_pos = { x = 740.0, y = -5.2, z = -342.4 },
        visual_mode = "arc",
        zone = "The Garden of Ru'Hmet",
        floor_id = 4,
        max_distance = 35
    },
    --Brand of Dawn
    ["the-garden-of-ru-hmet-particle-gate-h7"] = {
        target_pos = { x = -420.0, y = -1.9, z = -280.0 },
        visual_mode = "arc",
        zone = "The Garden of Ru'Hmet",
        floor_id = 2,
        max_distance = 30
    },
    --Brand of Twilight
    ["the-garden-of-ru-hmet-particle-gate-h10"] = {
        target_pos = { x = -420.0, y = -1.9, z = -560.0 },
        visual_mode = "arc",
        zone = "The Garden of Ru'Hmet",
        floor_id = 2,
        max_distance = 30
    },
    --BCNM POIS
    ["the-garden-of-ru-hmet-particle-gate-h8"] = {
        target_pos = { x = 420.0, y = -2.0, z = 400.0 },
        visual_mode = "arc",
        zone = "The Garden of Ru'Hmet",
        floor_id = 3,
        max_distance = 35,
        draw_in_combat = false
    },
    ["the-garden-of-ru-hmet-luminous-convergence"] = {
        target_pos = { x = 420.0, y = -2.7, z = 520.0 },
        visual_mode = "arc",
        zone = "The Garden of Ru'Hmet",
        floor_id = 3,
        max_distance = 30
    },
    ["the-garden-of-ru-hmet-cermet-portal-h9"] = {
        target_pos = { x = -420.0, y = -2.0, z = 360.0 },
        visual_mode = "arc",
        zone = "The Garden of Ru'Hmet",
        floor_id = 1,
        max_distance = 5
    },
    ["empyreal-paradox-transcendental-radiance"] = {
        target_pos = { x = 540.0, y = -1.2, z = -597.7 },
        visual_mode = "arc",
        zone = "Empyreal Paradox",
        floor_id = 0,
        max_distance = 25
    },
}