-- Zone Connection Graph
-- Defines which zones connect to each other and the exit coordinates
-- Format: ["Zone Name"] = { {zone = "Connected Zone", exit = "Grid Coordinate", floor_id = 1}, ... }
--
-- Optional floor_id parameter (which floor of the CURRENT zone this exit is on):
--   - If specified: Only show that floor's map with these exits (use for multi-floor dungeons)
--   - If omitted: Show all floors with all exits (default, fine for single-floor zones)
--
-- Example for multi-floor zone:
-- ["Windurst Waters"] = {
--     {zone = "Windurst Walls", exit = "L-9", floor_id = 1},
--     {zone = "West Sarutabaruta", exit = "G-4", floor_id = 1},
--     {zone = "Port Windurst", exit = "G-10", floor_id = 2},
--     {zone = "Windurst Woods", exit = "G-8", floor_id = 2},
-- },

return {
    -- Bastok Area
    ["Bastok Mines"] = {
        {zone = "Bastok Markets", exit = "F-4"},
        {zone = "South Gustaberg", exit = "H-10"},
        {zone = "Zeruhn Mines", exit = "D-7"}
    },
    ["Bastok Markets"] = {
        {zone = "Metalworks", exit = "H-6"},
        {zone = "South Gustaberg", exit = "D-11"},
        {zone = "Bastok Mines", exit = "H-13"},
        {zone = "Port Bastok", exit = "G-3"}
    },
    ["Port Bastok"] = {
        {zone = "Bastok Markets", exit = "D-11"},
        {zone = "North Gustaberg", exit = "L-6"}
    },
    ["Metalworks"] = {
        {zone = "Bastok Markets", exit = "E-8"}
    },
    ["South Gustaberg"] = {
        {zone = "Bastok Markets", exit = "J-7"},
        {zone = "Bastok Mines", exit = "L-8"},
        {zone = "Dangruf Wadi", exit = "D-9"},
        {zone = "North Gustaberg", exit = "E-6"},
        {zone = "North Gustaberg", exit = "H-5"}
    },
    ["North Gustaberg"] = {
        {zone = "Port Bastok", exit = "L-8"},
        {zone = "South Gustaberg", exit = "E-12"},
        {zone = "South Gustaberg", exit = "H-11"},
        {zone = "Palborough Mines 1", exit = "K-3"},
        {zone = "Konschtat Highlands", exit = "E-6"},
        {zone = "Oldton Movalpolos", exit = "J-6"}
    },
    ["Konschtat Highlands"] = {
        {zone = "North Gustaberg", exit = "I-12"},
        {zone = "Valkurm Dunes", exit = "G-2"},
        {zone = "Gusgen Mines", exit = "L-7"},
        {zone = "Pashhow Marshlands", exit = "K-3"}
    },
    ["Valkurm Dunes"] = {
        {zone = "Konschtat Highlands", exit = "M-11"},
        {zone = "Gustav Tunnel", exit = "B-8"},
        {zone = "Selbina", exit = "G-9"},
        {zone = "La Theine Plateau", exit = "L-5"},
        {zone = "Lufaise Meadows", exit = "I-9"}
    },
    ["Lufaise Meadows"] = {
        {zone = "Valkurm Dunes", exit = "K-8"},
        {zone = "Tavnazian Safehold 2", exit = "E-8"},
        {zone = "Tavnazian Safehold 2", exit = "F-10"},
    },
    ["Misareaux Coast"] = {
        {zone = "Qufim Island", exit = "G-7"},
        {zone = "Tavnazian Safehold 2", exit = "K-8"},
        {zone = "Tavnazian Safehold 2", exit = "K-10"},
        {zone = "Riverne - Site #A01", exit = "D-6", floor_id = 2},
        {zone = "Riverne - Site #B01", exit = "M-9", floor_id = 2},
        {zone = "Sacrarium", exit = "G-4"},
    },
    ["Riverne - Site #A01"] = {
        --{zone = "Misareaux Coast", exit = "M-9"},
    },
    ["Riverne - Site #B01"] = {
        --{zone = "Misareaux Coast", exit = "M-9"},
    },
    ["Sacrarium"] = {
       -- {zone = "Misareaux Coast", exit = "E-7"},
    },
    ["Tavnazian Safehold 2"] = {
        {zone = "Lufaise Meadows", exit = "I-5"},
        {zone = "Lufaise Meadows", exit = "I-6"},
        {zone = "Misareaux Coast", exit = "G-5"},
        {zone = "Misareaux Coast", exit = "G-6"},
        {zone = "Tavnazian Safehold 1", exit = "I-9"},
        {zone = "Tavnazian Safehold 3", exit = "H-9"},
    },
    ["Tavnazian Safehold 1"] = {
        {zone = "Tavnazian Safehold 2", exit = "H-8"},
    },
    ["Tavnazian Safehold 3"] = {
        {zone = "Tavnazian Safehold 2", exit = "H-8"},
        {zone = "Phomiuna Aqueducts", exit = "I-7"},
        {zone = "Sealion's Den", exit= "H-9"}
    },
    ["Sealion's Den"] = {
        {zone = "Tavnazian Safehold 3", exit = "H-5"},
        {zone = "Al'Taieu", exit = "H-6"},
    },
    ["Al'Taieu"] = {
        {zone = "Sealion's Den", exit = "H-12"},
        {zone = "Grand Palace of Hu'Xzoi", exit = "H-11"},
    },
    ["Grand Palace of Hu'Xzoi"] = {
        {zone = "Al'Taieu", exit = "H-8", floor_id =1},
        {zone = "The Garden of Ru'Hmet", exit = "H-8", floor_id =1},
    },
    ["The Garden of Ru'Hmet"] = {
        {zone = "Grand Palace of Hu'Xzoi", exit = "H-11"},
    },
    ["Phomiuna Aqueducts"] = {
        --{zone = "Tavnazian Safehold 3", exit = "J-11"},
    },
    ["Dangruf Wadi"] = {
        {zone = "South Gustaberg", exit = "I-6"},
        {zone = "North Gustaberg", exit = "J-3"}
    },

    -- San d'Oria Area
    ["Southern San d'Oria"] = {
        {zone = "Northern San d'Oria", exit = "I-7"},
        {zone = "West Ronfaure", exit = "F-10"},
        {zone = "East Ronfaure", exit = "L-10"}
    },
    ["Northern San d'Oria"] = {
        {zone = "Southern San d'Oria", exit = "J-11"},
        {zone = "Port San d'Oria", exit = "F-3"},
        {zone = "Chateau d'Oraguille", exit = "J-6"},
        {zone = "West Ronfaure", exit = "C-8"},
        --{zone = "Carpenters' Landing", exit = "F-5"}
    },
    ["Port San d'Oria"] = {
        {zone = "Northern San d'Oria", exit = "F-10"}
    },
    ["Chateau d'Oraguille"] = {
        {zone = "Northern San d'Oria", exit = "I-9"},
        {zone = "Bostaunieux Oubliette", exit = "I-8"}
    },
    ["West Ronfaure"] = {
        {zone = "Southern San d'Oria", exit = "I-6"},
        {zone = "Northern San d'Oria", exit = "I-5"},
        {zone = "East Ronfaure", exit = "J-7"},
        {zone = "East Ronfaure", exit = "J-9"},
        {zone = "Ghelsba Outpost", exit = "E-4"},
        {zone = "La Theine Plateau", exit = "F-12"}
    },
    ["East Ronfaure"] = {
        {zone = "Southern San d'Oria", exit = "G-6"},
        {zone = "West Ronfaure", exit = "F-7"},
        {zone = "West Ronfaure", exit = "F-9"},
        {zone = "King Ranperre's Tomb", exit = "H-12"},
        {zone = "Ranguemont Pass", exit = "K-4"}
    },
    ["La Theine Plateau"] = {
        {zone = "West Ronfaure", exit = "E-3"},
        {zone = "Valkurm Dunes", exit = "I-13"},
        {zone = "Jugner Forest", exit = "M-8"},
        {zone = "Ordelle's Caves", exit = "F-7"}
    },

    -- Windurst Area
    ["Windurst Waters North"] = {
        {zone = "Windurst Walls", exit = "L-9"},
        {zone = "West Sarutabaruta", exit = "G-4"},
        {zone = "Windurst Waters South", exit = "G-12"}
    },
    ["Windurst Waters South"] = {
        {zone = "Port Windurst", exit = "G-10"},
        {zone = "Windurst Waters North", exit = "H-5"}
    },
    ["Windurst Walls"] = {
        {zone = "Windurst Waters North", exit = "B-6"},
        {zone = "Windurst Woods", exit = "J-14"},
        {zone = "Heavens Tower", exit = "H-7"}
    },
    ["Port Windurst"] = {
        {zone = "Windurst Waters South", exit = "E-3"},
        {zone = "Windurst Woods", exit = "N-5"},
        {zone = "West Sarutabaruta", exit = "A-4"}
    },
    ["Windurst Woods"] = {
        {zone = "Windurst Walls", exit = "F-5"},
        {zone = "Port Windurst", exit = "E-11"},
        {zone = "East Sarutabaruta", exit = "K-10"}
    },
    ["Heavens Tower"] = {
        {zone = "Windurst Walls", exit = "H-8"}
    },
    ["West Sarutabaruta"] = {
        {zone = "Windurst Waters North", exit = "J-8"},
        {zone = "Port Windurst", exit = "I-10"},
        {zone = "East Sarutabaruta", exit = "K-4"},
        {zone = "East Sarutabaruta", exit = "L-8"},
        {zone = "Giddeus", exit = "F-7"},
        {zone = "Outer Horutoto Ruins", exit = "F-11", floor_id = 4},
        {zone = "Outer Horutoto Ruins", exit = "F-4", floor_id = 1},
    },
    ["East Sarutabaruta"] = {
        {zone = "Windurst Woods", exit = "G-11"},
        {zone = "West Sarutabaruta", exit = "E-4"},
        {zone = "Tahrongi Canyon", exit = "J-4"},
        {zone = "Inner Horutoto Ruins", exit = "J-7", floor_id = 1},
        {zone = "Outer Horutoto Ruins", exit = "J-11", floor_id = 3},
    },
    ["Inner Horutoto Ruins"] = {
         {zone = "East Sarutabaruta", exit = "I-7"},
    },
    ["Outer Horutoto Ruins"] = {
         {zone = "East Sarutabaruta", exit = "I-7", floor_id = 3},
         {zone = "West Sarutabaruta", exit = "G-7", floor_id = 4},
    },
    ["Tahrongi Canyon"] = {
        {zone = "East Sarutabaruta", exit = "H-13"},
        {zone = "Buburimu Peninsula", exit = "K-8"},
        {zone = "Meriphataud Mountains", exit = "G-3"},
        {zone = "Maze of Shakhrami", exit = "K-5"}
    },
    ["Buburimu Peninsula"] = {
        {zone = "Tahrongi Canyon", exit = "D-7"},
        {zone = "Mhaura", exit = "I-9"},
        {zone = "Maze of Shakhrami", exit = "F-6"},
        {zone = "Labyrinth of Onzozo", exit = "K-6"},
        {zone = "Bibiki Bay 1", exit = "E-10"}
    },
    ["Bibiki Bay 1"] = {
        {zone = "Buburimu Peninsula", exit = "I-6"},
        {zone = "Bibiki Bay 2", exit = "H-7"},
    },
    ["Bibiki Bay 2"] = {
        {zone = "Bibiki Bay 1", exit = "H-7"},
    },
    ["Maze of Shakhrami"] = {
        {zone = "Tahrongi Canyon", exit = "C-9"},
        {zone = "Attohwa Chasm", exit = "F-5"},
        --{zone = "Buburimu Peninsula", exit = "N-11"}
    },
    ["Attohwa Chasm"] = {
        {zone = "Maze of Shakhrami", exit = "G-10"},
        --{zone = "Buburimu Peninsula", exit = "N-11"}
    },
    ["Mhaura"] = {
        {zone = "Buburimu Peninsula", exit = "H-5"},
        {zone = "Selbina", exit = "H-10"}
    },
    ["Selbina"] = {
        {zone = "Valkurm Dunes", exit = "H-6"},
        {zone = "Mhaura", exit = "H-10"}
    },
    ["Meriphataud Mountains"] = {
        {zone = "Tahrongi Canyon", exit = "F-12"},
        {zone = "Sauromugue Champaign", exit = "D-4"},
        {zone = "Castle Oztroja", exit = "L-8"},
        {zone = "The Sanctuary of Zi'Tah", exit = "L-4"}
    },
    ["Castle Oztroja"] = {
        {zone = "Meriphataud Mountains", exit = "F-8"}
    },
    ["The Sanctuary of Zi'Tah"] = {
        {zone = "Meriphataud Mountains", exit = "E-12"},
        {zone = "Ro'Maeve", exit = "F-5"},
        {zone = "The Boyahda Tree", exit = "K-12"}
    },
    ["The Boyahda Tree"] = {
        {zone = "The Sanctuary of Zi'Tah", exit = "M-9"}
    },
    ["Ro'Maeve"] = {
        {zone = "The Sanctuary of Zi'Tah", exit = "H-11"},
        {zone = "Hall of the Gods", exit = "H-5"}
    },
    ["Hall of the Gods"] = {
        {zone = "Ro'Maeve", exit = "H-13"},
        {zone = "Ru'Aun Gardens", exit = "H-4"},
    },
    ["Ru'Aun Gardens"] = {
        {zone = "Hall of the Gods", exit = "H-13"},
    },
    ["The Shrine of Ru'Avitau"] = {
        {zone = "Ru'Aun Gardens", exit = "H-12"},
    },
    -- Jeuno Area
    ["Ru'Lude Gardens"] = {
        {zone = "Upper Jeuno", exit = "H-11"},
    },
    ["Upper Jeuno"] = {
        {zone = "Ru'Lude Gardens", exit = "J-10"},
        {zone = "Lower Jeuno", exit = "H-11"},
        {zone = "Batallia Downs", exit = "F-4"}
    },
    ["Lower Jeuno"] = {
        {zone = "Upper Jeuno", exit = "I-5"},
        {zone = "Port Jeuno", exit = "K-6"},
        {zone = "Rolanberry Fields", exit = "F-12"}
    },
    ["Port Jeuno"] = {
        {zone = "Lower Jeuno", exit = "E-10"},
        {zone = "Qufim Island", exit = "E-6"},
        {zone = "Sauromugue Champaign", exit = "K-8"},
        {zone = "Kazham", exit = "I-7"}
    },
    ["Kazham"] = {
        {zone = "Port Jeuno", exit = "G-6"},
        {zone = "Yuhtunga Jungle", exit = "F-10"}
    },
    ["Yuhtunga Jungle"] = {
        {zone = "Kazham", exit = "G-5"},
        {zone = "Sea Serpent Grotto", exit = "E-11", floor_id = 1},
        {zone = "Yhoator Jungle", exit = "I-8"},
        {zone = "Yhoator Jungle", exit = "I-10"},
        {zone = "Yhoator Jungle", exit = "I-11"},
    },
    ["Yhoator Jungle"] = {
        {zone = "Temple of Uggalepih", exit = "J-11"},
        {zone = "Ifrit's Cauldron", exit = "G-6"},
        {zone = "Ifrit's Cauldron", exit = "I-5"},
        {zone = "Yuhtunga Jungle", exit = "E-7"},
        {zone = "Yuhtunga Jungle", exit = "D-9"},
        {zone = "Yuhtunga Jungle", exit = "F-11"}
    },
    ["Temple of Uggalepih"] = {
        --static
    },
    ["Ifrit's Cauldron"] = {
        {zone = "Yhoator Jungle", exit = "K-9"},
    },
    ["Sea Serpent Grotto"] = {
        {zone = "Yuhtunga Jungle", exit = "M-3", floor_id = 1},
        {zone = "Norg", exit = "F-2", floor_id = 1}
    },
    ["Norg"] = {
        {zone = "Sea Serpent Grotto", exit = "H-10", floor_id = 1}
    },
    ["Qufim Island"] = {
        {zone = "Port Jeuno", exit = "I-11"},
        {zone = "Lower Delkfutt's Tower", exit = "F-6"},
        {zone = "Behemoth's Dominion", exit = "D-5"},
        {zone = "Misareaux Coast", exit = "E-6"}
    },
    ["Behemoth's Dominion"] = {
        {zone = "Qufim Island", exit = "M-9"},
    },
    ["Rolanberry Fields"] = {
        {zone = "Lower Jeuno", exit = "K-4"},
        {zone = "Pashhow Marshlands", exit = "H-14"},
        {zone = "Crawlers' Nest", exit = "F-13"},
        {zone = "Sauromugue Champaign", exit = "K-5"}
    },
    ["Pashhow Marshlands"] = {
        {zone = "Rolanberry Fields", exit = "K-4"},
        {zone = "Konschtat Highlands", exit = "E-12"},
        {zone = "Beadeaux", exit = "K-11"}
    },
    ["Sauromugue Champaign"] = {
        {zone = "Meriphataud Mountains", exit = "K-11"},
        {zone = "Rolanberry Fields", exit = "E-7"},
        {zone = "Garlaige Citadel", exit = "H-10"},
    },
    ["Garlaige Citadel"] = {
        {zone = "Sauromugue Champaign", exit = "G-6"},
    },
    ["Batallia Downs"] = {
        {zone = "Upper Jeuno", exit = "L-9"},
        {zone = "Rolanberry Fields", exit = "K-9"},
        {zone = "Jugner Forest", exit = "F-9"},
        {zone = "The Eldieme Necropolis", exit = "J-10"},
    },
    ["The Eldieme Necropolis"] = {
        {zone = "Batallia Downs", exit = "J-10"},
    },
    ["Jugner Forest"] = {
        {zone = "La Theine Plateau", exit = "D-11"},
        {zone = "Batallia Downs", exit = "L-4"},
        {zone = "Davoi", exit = "G-12"},
        {zone = "Carpenters' Landing", exit = "E-6"},
        {zone = "Carpenters' Landing", exit = "J-8"}
    },
    ["Davoi"] = {
        {zone = "Jugner Forest", exit = "J-6"}
    },
    -- Dungeons/Other
    ["Zeruhn Mines"] = {
        {zone = "Bastok Mines", exit = "I-7"},
        {zone = "Korroloka Tunnel 1", exit = "F-7"}
    },
    ["Korroloka Tunnel 1"] = {
        {zone = "Zeruhn Mines", exit = "N-6"},
        {zone = "Korroloka Tunnel 2", exit = "A-9"}
    },
    ["Korroloka Tunnel 2"] = {
        {zone = "Korroloka Tunnel 1", exit = "N-7"},
        {zone = "Eastern Altepa Desert", exit = "C-8"}
    },
    ["Eastern Altepa Desert"] = {
        {zone = "Korroloka Tunnel 2", exit = "J-8"},
        {zone = "Western Altepa Desert", exit = "I-6"}
    },
    ["Western Altepa Desert"] = {
        {zone = "Eastern Altepa Desert", exit = "K-7"},
        {zone = "Rabao", exit = "L-5"},
        {zone = "Kuftal Tunnel 1", exit = "H-4"},
    },
    ["Kuftal Tunnel 1"] = {
        {zone = "Western Altepa Desert", exit = "H-10"},
        {zone = "Kuftal Tunnel 2", exit = "J-6"},

    },
    ["Kuftal Tunnel 2"] = {
        {zone = "Kuftal Tunnel 1", exit = "H-13"},
        {zone = "Cape Teriggan", exit = "G-2"},
    },
    ["Cape Teriggan"] = {
        {zone = "Kuftal Tunnel 2", exit = "G-10"},
        {zone = "Valley of Sorrows", exit = "J-8"},
    },
    ["Valley of Sorrows"] = {
        {zone = "Cape Teriggan", exit = "E-8"},
    },
    ["Rabao"] = {
        {zone = "Western Altepa Desert", exit = "G-11"}
    },
    ["Palborough Mines 1"] = {
        {zone = "North Gustaberg", exit = "F-8"},
        {zone = "Palborough Mines 3", exit = "I-8"}
    },
    ["Palborough Mines 3"] = {
        {zone = "Palborough Mines 1", exit = "I-8"},
        {zone = "Palborough Mines 2", exit = "I-7"},
        {zone = "Waughroon Shrine", exit = "H-10"}
    },
    ["Palborough Mines 2"] = {
        {zone = "Palborough Mines 3", exit = "I-7"},
    },
    ["Oldton Movalpolos"] = {
        {zone = "North Gustaberg", exit = "E-11"},
    },
    ["Waughroon Shrine"] = {
    },
    ["Gusgen Mines"] = {
        {zone = "Konschtat Highlands", exit = "D-6"}
    },
    ["Beadeaux"] = {
        {zone = "Pashhow Marshlands", exit = "E-7"}
    },
    ["Ghelsba Outpost"] = {
        {zone = "West Ronfaure", exit = "J-11"},
        {zone = "Yughott Grotto 1", exit = "I-11"}
    },
    ["Yughott Grotto 1"] = {
        {zone = "Ghelsba Outpost", exit = "E-9"}
    },
    ["Giddeus"] = {
        {zone = "West Sarutabaruta", exit = "H-3", floor_id = 1},
        {zone = "Balga's Dais", exit = "F-12", floor_id = 1},
        {zone = "Giddeus 2", exit = "F-8", floor_id = 15},
    },
    ["Giddeus 2"] = {
        {zone = "Giddeus", exit = "F-8", floor_id = 1},
        {zone = "Giddeus", exit = "J-8", floor_id = 1},
    },
    ["Balga's Dais"] = {
        --{zone = "Giddeus", exit = "J-8"}
    },
    ["Ordelle's Caves"] = {
        {zone = "La Theine Plateau", exit = "H-2"}
    },
    ["Crawlers' Nest"] = {
        {zone = "Rolanberry Fields", exit = "M-8"}
    },
    ["Carpenters' Landing"] = {
        --{zone = "Northern San d'Oria", exit = "H-8"},
        {zone = "Jugner Forest", exit = "F-11", floor_id = 1},
        {zone = "Jugner Forest", exit = "H-12", floor_id = 1}
    },
    ["Bostaunieux Oubliette"] = {
        {zone = "Chateau d'Oraguille", exit = "I-8"}
    },
    ["King Ranperre's Tomb"] = {
        {zone = "East Ronfaure", exit = "G-5"}
    },
    ["Ranguemont Pass"] = {
        {zone = "East Ronfaure", exit = "G-12"},
        {zone = "Beaucedine Glacier", exit = "L-4"}
    },
    ["Beaucedine Glacier"] = {
        {zone = "Ranguemont Pass", exit = "E-11"},
        {zone = "Batallia Downs", exit = "H-11"},
        {zone = "Xarcabard", exit = "F-6"},
        {zone = "Fei'Yin 1", exit = "J-4"},
        {zone = "Pso'Xja", exit = "H-8", label = "6"},
        {zone = "Pso'Xja", exit = "F-7", label = "5"},
        {zone = "Pso'Xja", exit = "J-8", label = "1"},
        {zone = "Pso'Xja", exit = "H-10", label = "2"},

    },
    ["Pso'Xja"] = {
        {zone = "Beaucedine Glacier", exit = "G-11"}
    },
    ["Fei'Yin 1"] = {
        {zone = "Beaucedine Glacier", exit = "F-11"},
        {zone = "Fei'Yin 15", exit = "G-9"}
    },
    ["Fei'Yin 15"] = {
        {zone = "Fei'Yin 1", exit = "G-9"}
    },
    ["Xarcabard"] = {
        {zone = "Beaucedine Glacier", exit = "K-9"},
        {zone = "Castle Zvahl Baileys", exit = "D-8"},
        {zone = "Uleguerand Range", exit = "F-6"}
    },
    ["Uleguerand Range"] = {
        {zone = "Xarcabard", exit = "F-12"},
    },

}

