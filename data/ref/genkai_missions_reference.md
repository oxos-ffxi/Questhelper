# Limit Break (Genkai) quests - shared 1-4, Maat fight (5) is per-job
[G1] In Defiant Challenge - Item Drop route - DONE
[G1] In Defiant Challenge - Key Item route - DONE
[G2] Atop the Highest Mountains (Cap 55 -> 60) - DONE
[G3] Whence Blows the Wind (Cap 60 -> 65) - DONE
[G4] Riding on the Clouds (Cap 65 -> 70) - DONE (dynamic, clues via data/clue_tables.lua)
[G5] Shattering Stars / Maat fight (Cap 70 -> 75) - IN PROGRESS, 2/15

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
[ ]  2  Monk           1427  TODO                                      Balga's Dais
[x]  3  White Mage     1428  Goblin Alchemist 65-68, Cape Teriggan     Balga's Dais
[ ]  4  Black Mage     1429  TODO                                      Horlais Peak
[ ]  5  Red Mage       1430  TODO                                      Waughroon Shrine
[ ]  6  Thief          1431  TODO                                      Waughroon Shrine
[ ]  7  Paladin        1432  TODO                                      Qu'Bia Arena
[ ]  8  Dark Knight    1433  TODO                                      Qu'Bia Arena
[ ]  9  Beastmaster    1434  TODO                                      Waughroon Shrine
[ ] 10  Bard           1435  TODO                                      Qu'Bia Arena
[ ] 11  Ranger         1436  TODO                                      Horlais Peak
[ ] 12  Samurai        1437  TODO                                      Chamber of Oracles
[ ] 13  Ninja          1438  TODO                                      Chamber of Oracles
[ ] 14  Dragoon        1439  TODO                                      Chamber of Oracles
[ ] 15  Summoner       1440  TODO                                      Balga's Dais

## Battlefield approaches - author each route once, copy to its 3 jobs
[x] Horlais Peak        Ghelsba Outpost -> Yughott Grotto -> Fort Ghelsba (J-8)
                        -> Yughott Grotto 2 (J-6). Arrows copied from Bastok.lua step 11.
[x] Balga's Dais        via Giddeus (F-12). Arrows copied from SanDoria.lua step 12.
                        Home Point Giddeus #1 (G-12) drops you right outside.
[ ] Waughroon Shrine    via Palborough Mines 3 (H-10). In zone_connections.
[ ] Qu'Bia Arena        via Fei'Yin. NOT in zone_connections yet.
[ ] Chamber of Oracles  via Quicksand Caves. NOT in zone_connections yet.

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
