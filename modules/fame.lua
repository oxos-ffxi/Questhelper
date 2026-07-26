-- File: addons/QuestHelper/modules/fame.lua
--
-- Fame (Reputation) reference data and dialogue fingerprinting.
--
-- The client is never sent a numeric fame value. The only way to learn it is to speak
-- to an area's reputation checker NPC, who replies with flavour text that never states
-- a number. This module maps a distinctive fragment of each reply back to its fame
-- level, so the addon can turn "You have emerged as a hero to the people of Jeuno"
-- into "9".
--
-- ZONE GATING IS REQUIRED, NOT AN OPTIMISATION. Some replies are shared verbatim
-- between areas at DIFFERENT levels - San d'Oria 4 and Jeuno 5 are the same sentence
-- word for word ("You have become well known in these parts! I hear much of your
-- accomplishments..."). Text alone cannot tell them apart. Each checker stands in
-- exactly one zone, so the player's zone decides which area a line belongs to, and
-- fragments then only need to be unique WITHIN their own area.
--
-- SCALE: levels here are 1-9, matching the reputation tables on FFXIclopedia and
-- BG Wiki. Some sources number the same tiers 0-8. Mission `requirements.fame`
-- values MUST be authored on the 1-9 scale used here or they will be off by one.
--
-- Fame areas are the six independent counters. Selbina/Rabao feed both San d'Oria
-- and Bastok; Mhaura/Kazham feed Windurst - those are not areas in their own right.

local fame = {}

-- Each fame area's reputation checker, and the single zone they stand in.
fame.AREAS = {
    ["San d'Oria"]    = {checker = "Namonutice, Southern San d'Oria (K-6)",   zone = "Southern San d'Oria"},
    ["Bastok"]        = {checker = "Flaco, Port Bastok (E-6)",                zone = "Port Bastok"},
    ["Windurst"]      = {checker = "Zabirego-Hajigo, Windurst Waters (F-10)", zone = "Windurst Waters"},
    ["Jeuno"]         = {checker = "Mendi, Lower Jeuno (H-8)",                zone = "Lower Jeuno"},
    ["Selbina/Rabao"] = {checker = "Waylea, Rabao (G-9)",                     zone = "Rabao"},
    ["Kazham"]        = {checker = "Ney Hiparujah, Kazham",                   zone = "Kazham"},
    ["Norg"]          = {checker = "Vaultimand, Norg (H-8)",                  zone = "Norg"},
}

-- Distinctive fragment of each checker's reply, keyed by area then fame level.
-- Fragments deliberately avoid the interpolated <Name>, and are matched as plain
-- case-insensitive substrings, so they need not be the full line.
--
-- Adding a line: it must be unique within ITS OWN AREA only (zone gating handles the
-- rest). Avoid curly quotes - the wiki renders some apostrophes as U+2019 where the
-- game sends a plain ASCII "'", so a fragment spanning one would never match.
fame.DIALOGUE = {
    ["San d'Oria"] = {
        [1] = "Do not expect me to learn the name of every recruit",
        [2] = "Keep your nose to the grindstone and work for the people",
        [3] = "That is a name I often hear",
        -- NB: identical to Jeuno 5. Only the zone distinguishes them.
        [4] = "You have become well known in these parts",
        [5] = "You are famous in our kingdom",
        [6] = "I would venture that much the kingdom has heard your name",
        [7] = "Practically all of the kingdom has heard of you now",
        [8] = "Every infant in his cradle knows your name",
        [9] = "There isn't a soul in the kingdom that doesn't consider you a hero",
    },
    ["Bastok"] = {
        [1] = "What is that, some kind of snail",
        [2] = "not many people know who you are",
        [3] = "You're not doing bad for an adventurer",
        [4] = "Quite a few people are talking about the things you've done for Bastok",
        [5] = "A lot of people know about what you've done for Bastok",
        [6] = "I've been following your progress ever since you came to Bastok",
        [7] = "Don't look so surprised, as everyone knows your name",
        [8] = "You are the example every Bastoker should follow",
        [9] = "I've known you since you started off here in Bastok",
    },
    ["Windurst"] = {
        [1] = "Bust your britches",
        [2] = "you're still not making much of a name for yourself here yet",
        [3] = "that people are starting to talk about",
        [4] = "I heard some guys talking about you over their dinners at the eatery",
        [5] = "There aren't many Windurstians who don't know that name",
        [6] = "You'd have to be living in a hole somewhere not to have heard that name",
        [7] = "There isn't a soul in all of Windurst that has yet to hear the tales",
        -- Covers both the citizen and non-citizen variants of the level 8 reply.
        [8] = "go by when I fail to hear a tale of your deeds",
        [9] = "I am honored to have the hero of Windurst in my presence",
    },
    ["Jeuno"] = {
        [1] = "You may be somebody in your little hometown",
        [2] = "That name is vaguely familiar",
        [3] = "I heard some travelers in a tavern talk about you",
        [4] = "I hear your name mentioned quite often these days",
        -- NB: identical to San d'Oria 4. Only the zone distinguishes them.
        [5] = "You have become well known in these parts",
        [6] = "A good deal of people here in Jeuno know about you",
        [7] = "Your growing reputation precedes you",
        [8] = "your name is synonymous with courage",
        [9] = "You have emerged as a hero to the people of Jeuno",
    },
    ["Kazham"] = {
        [1] = "There are too many adventurers these days",
        [2] = "I might have heard that name somewherrre",
        [3] = "I've been hearing your name more often lately",
        [4] = "I've been telling everybody about my new friend",
        [5] = "Nobody has anything bad to say about you",
        [6] = "I don't think there's a person in this village who doesn't know yourrr name",
        [7] = "Arrre you heading out on anotherrr dangerous mission",
        [8] = "You are one smooth cat",
        [9] = "The fame your name carries stretches from here to Windurst",
    },
    ["Norg"] = {
        [1] = "How am I supposed to remember the name of one puny ant",
        [2] = "I meets a lot of people in me line of work",
        [3] = "do a little work, and people start recognizin' ya",
        [4] = "Hear yer name lots 'round these parts lately",
        [5] = "I was just talkin' to me mateys about ya the other day",
        [6] = "There's hardly a soul in Norg that doesn't know yer bloody name",
        [7] = "You've become quite the household name 'round Norg",
        [8] = "There's already rumors of yer last adventure goin' 'round Norg",
        [9] = "yer the most famous person in all'a Norg",
    },
    ["Selbina/Rabao"] = {
        -- Levels 1, 2 and 6 are omitted: the only transcriptions available are wiki
        -- paraphrases ("~~I'm sorry, but I ain't heard of your name before."), not
        -- game text. A guessed fragment would never match and would fail silently,
        -- so those tiers simply do not capture until pulled from the server.
        [3] = "Seems you're building yourself a good reputation",
        [4] = "I've heard your name mentioned once or twice around these parts lately",
        [5] = "Your endeavors in neighboring countries have reached us here in Rabao",
        [7] = "There's hardly a soul in all of Rabao who hasn't heard your name",
        [8] = "I'm gonna have to start making appointments to talk to you",
        [9] = "you've achieved the status of hero in my eyes",
    },
}

-- Lazily built [zone_id] = area_name, resolved via data/zones.lua so zone IDs are not
-- duplicated here. Built once; nil if the zone DB could not be loaded.
local zone_to_area

local function getZoneToArea()
    if zone_to_area ~= nil then return zone_to_area end

    local ok, zones_db = pcall(require, 'data.zones')
    if not ok or type(zones_db) ~= 'table' then
        zone_to_area = false
        return false
    end

    zone_to_area = {}
    for area, info in pairs(fame.AREAS) do
        local zone_id = zones_db[info.zone]
        if zone_id then
            zone_to_area[zone_id] = area
        end
    end
    return zone_to_area
end

-- Returns the fame area whose reputation checker stands in this zone, or nil.
function fame.areaForZone(zone_id)
    local map = getZoneToArea()
    if not map then return nil end
    return map[zone_id]
end

-- Scans a line of text for the reputation checker reply belonging to zone_id.
-- Returns area, level on a hit; nil otherwise.
--
-- zone_id is mandatory: without it, lines shared between areas (San d'Oria 4 vs
-- Jeuno 5) are genuinely ambiguous, and guessing would report a wrong level. Bailing
-- out simply means no capture, which is the safe failure.
function fame.matchDialogue(text, zone_id)
    if type(text) ~= 'string' or text == '' then return nil end
    if not zone_id then return nil end

    local area = fame.areaForZone(zone_id)
    if not area then return nil end

    local tiers = fame.DIALOGUE[area]
    if not tiers then return nil end

    local lower = text:lower()
    for level, fragment in pairs(tiers) do
        -- plain find: fragments contain '.' and apostrophes, not Lua patterns
        if lower:find(fragment:lower(), 1, true) then
            return area, level
        end
    end
    return nil
end

return fame
