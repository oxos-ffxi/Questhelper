# Limit Break (Genkai) quests - shared 1-4, Maat fight (5) is per-job
[G1] In Defiant Challenge - Item Drop route - DONE
[G1] In Defiant Challenge - Key Item route - DONE
[G2] Atop the Highest Mountains (Cap 55 -> 60) - DONE
[G3] Whence Blows the Wind (Cap 60 -> 65) - DONE
[G4] Riding on the Clouds (Cap 65 -> 70) - DONE (dynamic, clues via data/clue_tables.lua)
[G5] Shattering Stars / Maat fight (Cap 70 -> 75) - DONE, 15/15
[G5b] Beyond the Sun / Maat's Cap - DONE (Log 3 / Quest 76). Talk to Maat once all 15
      wins are in. Sits OUTSIDE the progress_group and lists all 15 as prerequisites,
      so the prereq panel doubles as the Maat's Cap checklist. Named "5b" so plain
      table.sort puts it after the group - "5-2" would have sorted BEFORE it.

Castle Oztroja floor 1 (before the password doors) covers BRD, NIN and BLM - one trip
can farm all three. Strip the show_if_password / hide_if_password conditionals off the
Genkai 3 Oztroja arrows; only the entrance-to-first-door section is needed.

Farming zones so far: Cape Teriggan goblins (WAR/WHM/THF/BST), Davoi orcs (MNK/DRG/RNG),
Ro'Maeve (RDM), Gustav Tunnel (DRK), Temple of Uggalepih tonberries (SMN).
Temple of Ugg arrows come from SanDoria.lua 8-2 step 4. Den of Rancor is NOT in
zone_connections and is gated behind the Temple painting puzzle (Zilart ZM04) - avoid
it as a farm target unless there is no alternative.

Declare the testimony in items_needed ONCE, on the farm step. getAllItemsNeeded in
ui_main.lua sums items_needed across every step, so repeating it on the trade step
asks the player for two testimonies.

TODO: locations.lua has burning-circle entries for balga-dais, horlais-peak,
waughroon-shrine and qu-bia-arena, but NOT chamber-of-oracles. Add one and wire it
into onmob_target on the SAM/NIN/DRG fight steps like the other battlefields.

## [G5] Shattering Stars - the 15 jobs
One self-contained entry each, all sharing progress_group "Genkai 5: Shattering Stars".
Any ONE win caps you at 75; all 15 earns Maat's Cap.

Every entry is the same 5 steps - only the testimony and the battlefield change:
  1 talk to Maat, Ru'Lude Gardens H-5     (event 92, first fight only)
  2 farm the testimony                    (trigger_on_item_obtain)
  3 trade the testimony to Maat           (event 64, first fight only - he warps you in)
  4 beat Maat at the burning circle       (event 32001)
  5 return to Maat                        (event 93, first fight only)

Steps 1, 3 and 5 only fire on your first ever Maat fight - after that the quest is
QUEST_COMPLETED and those events are dead. All three carry:

    skip_if_any_job_level = 71

Nothing can pass 70 until the cap is broken, so a job at 71+ proves those events are
already spent and the steps read as done - even when the job you are fighting on is
only 66. If no job is past 70 yet they show as normal and the player ticks them.

The battlefield images all use state = 4; re-sync if a job needs a different step count.

Testimony item id = 1426 + job_id - 1. Drop tables: ffxidb.com/items/<id>

job_id  job            item  testimony source                          battlefield
[x]  1  Warrior        1426  Goblin Mercenary 65-68, Cape Teriggan     Horlais Peak
[x]  2  Monk           1427  Orcish Champion 64-68, Davoi              Balga's Dais
[x]  3  White Mage     1428  Goblin Alchemist 65-68, Cape Teriggan     Balga's Dais
[x]  4  Black Mage     1429  Yagudo Prelate, Castle Oztroja floor 1    Horlais Peak
[x]  5  Red Mage       1430  Magic Flagon, Ro'Maeve (roams zone)       Waughroon Shrine
[x]  6  Thief          1431  Goblin Bandit 65-68, Cape Teriggan STEAL  Waughroon Shrine
[x]  7  Paladin        1432  Orcish Overlord NM / Protector, Monastic  Qu'Bia Arena
[x]  8  Dark Knight    1433  Doom Soldier, Gustav Tunnel               Qu'Bia Arena
[x]  9  Beastmaster    1434  Goblin Shepherd 65-68, Cape Teriggan      Waughroon Shrine
[x] 10  Bard           1435  Yagudo Conductor ~16%, Castle Oztroja    Qu'Bia Arena
                            floor 1, BEFORE the password doors - no
                            passwords needed. (Abyss Sahagin in Sea
                            Serpent Grotto is ~25% if preferred.)
[x] 11  Ranger         1436  Orcish Farkiller 64-68, Davoi             Horlais Peak
[x] 12  Samurai        1437  Gore Demon ~33% / Blood Demon ~16%,       Chamber of Oracles
                            Castle Zvahl Baileys. (Yagudo Templar in
                            Castle Oztroja is ~51% but needs passwords.)
[x] 13  Ninja          1438  Yagudo Assassin ~16%, Castle Oztroja      Chamber of Oracles
                            (deep route, needs passwords). Easier:
                            Tonberry Chopper ~14% in Yhoator Jungle,
                            open zone, no doors.
[x] 14  Dragoon        1439  Orcish Dragoon 64-68, Davoi               Chamber of Oracles
[x] 15  Summoner       1440  Tonberry Dismayer 61-67, Temple of Ugg    Balga's Dais

## Battlefield approaches - author each route once, copy to its 3 jobs
[x] Horlais Peak        Ghelsba Outpost -> Yughott Grotto -> Fort Ghelsba (J-8)
                        -> Yughott Grotto 2 (J-6). Arrows copied from Bastok.lua step 11.
[x] Balga's Dais        via Giddeus (F-12). Arrows copied from SanDoria.lua step 12.
                        Home Point Giddeus #1 (G-12) drops you right outside.
[x] Waughroon Shrine    via Palborough Mines: North Gustaberg (K-3) in, elevator on floor
                        1 at (I-8), across floor 3 to (H-10). Arrows from SanDoria.lua
                        step 9. route_to = "Palborough Mines 3" (a zone_connections node,
                        NOT in zones.lua - visual_zones use zone_name "Palborough Mines").
                        Home Point Palborough Mines #1 drops you right outside.
[x] Qu'Bia Arena        Entrance is (K-8) in Fei'Yin. route_to = "Fei'Yin 1" (the
                        zone_connections node; zones.lua and visual_zones use plain
                        "Fei'Yin"). Beaucedine Glacier (J-4) in. Arrows + map from
                        SanDoria.lua step 5 of "The Heir to the Light".
                        Home Point Fei'Yin #1 drops you at the entrance; Domenic in
                        Lower Jeuno (J-7) warps there if Beyond Infinity is done.
[x] Chamber of Oracles  Quicksand Caves is NOT in zone_connections, so route_to the parent
                        zone instead: "Western Altepa Desert" (C-11), tunnel at (D-11),
                        drop at (D-12). Then pads at (I-9) and (H-7), hole at (F-7), zone
                        at (D-4). Route + Quicksand map (floor_id 4) from Zilart.lua ZM06.
                        NEEDS KeyItem 2051 "Loadstone" for the (I-9) pad unless the player
                        is a Galka (weight 3). Sneak the whole way - Antica aggro.
                        Home Point Quicksand Caves #1 warps straight to the entrance.

Maat warps you in for your FIRST fight only (trade the testimony to him, pick yes).
Every fight after that you walk, so the routes matter.

## Not Genkai - the ToAU+ jobs have their own cap-70 quests
Any ONE of these breaks the cap for every job, same as Shattering Stars.
[ ] Blue Mage      The Beast Within
[ ] Puppetmaster   Achieving True Power
[ ] Corsair        Breaking the Bonds of Fate
[ ] Dancer         A Furious Finale
[ ] Scholar        Survival of the Wisest
[ ] Geomancer      Elementary, My Dear Sylvie
[ ] Rune Fencer    Endeavoring to Awaken
