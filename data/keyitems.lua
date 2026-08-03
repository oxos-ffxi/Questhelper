-- Key Items Database
-- Reference: https://github.com/LandSandBoat/server/blob/base/scripts/enum/key_item.lua
--
-- This database maps key item IDs to their display names.
-- You can use IDs directly in your quest files - names are optional for better display.
-- Just add entries as needed instead of storing all 3000+ key items.
--
-- Usage in quest files:
--   keyitems_needed = {78}  -- Display in UI only (shows "KI: Gustaberg Supplies")
--
--   trigger_on_keyitem_obtain = {78}  -- Auto-complete step when obtained
--   trigger_on_keyitem_obtain = {78, 79}  -- Any ONE key item triggers completion
--   trigger_on_keyitem_obtain = {78, 79}, require_all_keyitems = true  -- Need BOTH key items

local keyitems = {}

-- Key item ID to name mapping
local id_to_name = {
    [3] = "Blue Acidity Tester",
    [4] = "Red Acidity Tester",
    [9] = "Airship Pass for Kazham",
    [14] = "Magicite Optistone",
    [15] = "Magicite Aurastone",
    [16] = "Magicite Orastone",
    [17] = "Food Offering",
    [18] = "Drink Offering",
    [20] = "Yagudo Torch",
    [21] = "Crest of Davoi",
    [37] = "First Dark Mana Orb",
    [46] = "Coruscant Rosary",
    [47] = "Black Matinee Necklace",
    [51] = "Second Dark Mana Orb",
    [52] = "Third Dark Mana Orb",
    [53] = "Fourth Dark Mana Orb",
    [54] = "Fifth Dark Mana Orb",
    [55] = "Sixth Dark Mana Orb",
    [59] = "First Glowing Mana Orb",
    [60] = "Second Glowing Mana Orb",
    [61] = "Third Glowing Mana Orb",
    [62] = "Fourth Glowing Mana Orb",
    [63] = "Fifth Glowing Mana Orb",
    [64] = "Sixth Glowing Mana Orb",
    [68] = "Lapis Coral",
    [74] = "Shadow Fragment",
    [75] = "Ronfaure Supplies",
    [78] = "Gustaberg Supplies",
    [103] = "Lost Document",
    [117] = "Old Tiger's Fang",       -- The Fanged One (Ranger unlock)
    [121] = "Tenshodo Application Form",
    [131] = "White Orb",             -- Crimson Orb quest (Davoi, Wall of Banishing)
    [132] = "Pink Orb",              -- Crimson Orb quest (after 1 pool)
    [133] = "Red Orb",               -- Crimson Orb quest (after 2 pools)
    [134] = "Blood Orb",             -- Crimson Orb quest (after 3 pools)
    [135] = "Cursed Orb",            -- Crimson Orb quest (after 4 pools; applies Curse)
    [136] = "Crimson Orb",           -- Crimson Orb quest reward (opens Wall of Banishing)
    [141] = "Stalactite Dew",
    [143] = "Book of Tasks",         -- A Knight's Test (Balasiel)
    [144] = "Book of the East",      -- A Knight's Test (Cahaurme)
    [145] = "Book of the West",      -- A Knight's Test (Baunise)
    [146] = "Knight's Soul",         -- A Knight's Test (Davoi, Disused Well)
    [195] = "Portal Charm",
    [200] = "Holy One's Oath",
    [222] = "Round Frigicite",       -- Genkai 2 (Atop the Highest Mountains)
    [223] = "Square Frigicite",      -- Genkai 2
    [224] = "Triangular Frigicite",  -- Genkai 2
    [238] = "Sacrificial Chamber Key",
    [239] = "Fire Fragment",
    [240] = "Water Fragment",
    [241] = "Earth Fragment",
    [242] = "Wind Fragment",
    [243] = "Lightning Fragment",
    [244] = "Ice Fragment",
    [245] = "Light Fragment",
    [246] = "Dark Fragment",
    [247] = "Prismatic Fragment",
    [250] = "Optistery Ring",
    [257] = "Strangely Shaped Coral",
    [266] = "Altepa Moonpebble",
    [268] = "Dreamrose",
    [272] = "Paintbrush of Souls",
    [273] = "Old Rusty Key",
    [280] = "Rhinostery Ring",
    [281] = "Manustery Ring",
    [283] = "Ancient San Dorian Tablet",
    [285] = "Piece of a Broken Key (1st)",
    [286] = "Piece of a Broken Key (2nd)",
    [287] = "Piece of a Broken Key (3rd)",
    [288] = "Drops of Amnio",
    [289] = "Reinforced Cermet",
    [290] = "Letter From Werei",
    [293] = "Old Piece of Wood",
    [294] = "Dragon Curse Remedy",
    [336] = "Orcish Crest",          -- Genkai 3 (Whence Blows the Wind)
    [337] = "Quadav Crest",          -- Genkai 3
    [338] = "Yagudo Crest",          -- Genkai 3
    [417] = "Map of Norg",
    [451] = "Scrap of Papyrus",
    [452] = "Cerulean Crystal",
    [455] = "Shard of Apathy",
    [456] = "Shard of Arrogance",
    [457] = "Shard of Cowardice",
    [458] = "Shard of Envy",
    [459] = "Shard of Rage",
    [466] = "Smiling Stone",         -- Genkai 4 (Riding on the Clouds) - Bastok
    [467] = "Scowling Stone",        -- Genkai 4 - San d'Oria
    [468] = "Somber Stone",          -- Genkai 4 - Selbina/Mhaura
    [469] = "Spirited Stone",        -- Genkai 4 - Windurst
    [477] = "Miracle Salt",
    [481] = "Figure of Leviathan",
    [482] = "Figure of Garuda",
    [483] = "Figure of Titan",
    [581] = "Cracked Mimeo Mirror",
    [582] = "Reliquiarium Key",
    [583] = "Mimeo Stone",
    [586] = "Mimeo Jewel",
    [590] = "Light of Holla",
    [591] = "Light of Dem",
    [592] = "Light of Mea",
    [593] = "Light of Vahzl",
    [594] = "Light of Altaieu",
    [604] = "Psoxja Pass",
    [613] = "Delkfutt Recognition Device",
    [710] = "Brand of Dawn",
    [711] = "Brand of Twilight",
    [1111] = "Delkfutt Key",
    [1846] = "Pouch of Weighted Stones",
    [2051] = "Loadstone",
    [2134] = "Ancient Papyrus Shred (1st)",
    [2135] = "Ancient Papyrus Shred (2nd)",
    [2136] = "Ancient Papyrus Shred (3rd)",
    [2137] = "Exoray Mold Crumb (1st)",
    [2138] = "Exoray Mold Crumb (2nd)",
    [2139] = "Exoray Mold Crumb (3rd)",
    [2140] = "Bomb Coal Fragment (1st)",
    [2141] = "Bomb Coal Fragment (2nd)",
    [2142] = "Bomb Coal Fragment (3rd)",
    [2506] = "Temple Knight Key",
    [2578] = "Magicked Astrolabe",

    -- Add more key items as needed:
    -- [ID] = "Key Item Name",
}

-- Key item name to ID mapping (auto-generated from above)
local name_to_id = {}
for id, name in pairs(id_to_name) do
    name_to_id[name:lower()] = id
end

--- Get key item name from ID
--- @param ki_id number - Key item ID
--- @return string|nil - Key item name, or nil if not found
function keyitems.getName(ki_id)
    return id_to_name[ki_id]
end

--- Get key item ID from name (case-insensitive)
--- @param ki_name string - Key item name
--- @return number|nil - Key item ID, or nil if not found
function keyitems.getId(ki_name)
    if type(ki_name) ~= 'string' then return nil end
    return name_to_id[ki_name:lower()]
end

--- Check if a key item exists in the database
--- @param id_or_name number|string - Key item ID or name
--- @return boolean - true if key item exists
function keyitems.exists(id_or_name)
    if type(id_or_name) == 'number' then
        return id_to_name[id_or_name] ~= nil
    elseif type(id_or_name) == 'string' then
        return name_to_id[id_or_name:lower()] ~= nil
    end
    return false
end

--- Add a new key item to the database at runtime
--- @param ki_id number - Key item ID
--- @param ki_name string - Key item name
function keyitems.add(ki_id, ki_name)
    id_to_name[ki_id] = ki_name
    name_to_id[ki_name:lower()] = ki_id
end

return keyitems
