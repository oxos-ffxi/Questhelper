# Dragoon
[Unlock] The Holy Crest - DONE
[Next]   A Craftsman's Work - TODO
[AF]     Drachen set - TODO
[Legs]   Chasing Quotas - TODO (Ceraulian, Port San d'Oria; gives Drachen Brais)
[Hands]  Borghertz's Dragon Hands - TODO

Note: no quest file in LSB. It lives across the zone NPC scripts, all driving TheHolyCrest_Event.

Wyvern Egg (zones/Maze_of_Shakhrami/npcs/Excavation_Point.lua): trading a pickaxe at
TheHolyCrest_Event == 3 gives the egg outright - no roll, no pickaxe break. Anything else falls
through to xi.helm. So one pickaxe, not a stack; retail wiki advice to buy several does not apply.

Excavation spawn spots come from globals/hobbies/helm/data.lua, [xi.zone.MAZE_OF_SHAKHRAMI].points -
13 fixed spots, a point hops to a random one of them after 4 harvests. All 13 are on step 5 as
visual_zones. Which map (floor_id 15/16) each spot belongs to is UNVERIFIED.
