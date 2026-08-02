# Ninja
[Unlock] Ayame and Kaede - DONE
[AF]     Koga set - TODO
[Hands]  Borghertz's Sneaky/Shadowy Hands - TODO (confirm which is NIN)

Note: quest file is scripts/quests/bastok/Ayame_and_Kaede.lua, Log 1 / Quest 60.

Prog chain, read off the server file - Korroloka BEFORE Norg, opposite of most wiki write-ups:
  Kaede 240 -> Prog 0
  Kagetora 241 -> Prog 1        (Ensetsu 242 needs Prog 1-2, so Kagetora is mandatory)
  Ensetsu 242 -> Prog 2
  Korroloka qm2, 3 leeches      -> Prog 3 + KI Strangely Shaped Coral
  Ensetsu 245 -> Prog 4         (Ryoma is gated on Prog 4 - going to Norg early is a dead trip)
  Ryoma 95    -> Prog 5         (gives KI Sealed Dagger, deletes the coral)
  Ensetsu 246 -> complete, unlockJob(NIN), delKeyItem(SEALED_DAGGER)

NPC positions, from the !pos block at the top of the server file (x y z zone):
  Kaede     48  -6  67   236 Port Bastok  (J-5, northernmost house)
  Ensetsu   33  -6  67   236 Port Bastok  (J-5, next door to Kaede)
  Kagetora -96  -2  29   236 Port Bastok  (F-6 warehouse - same building as Jabbar at -99.7/-3.8/26.1)
  qm2     -208  -9 176   173 Korroloka Tunnel
  Ryoma    -23   0  -9   252 Norg         (H-8)
All five are in locations.lua. Kaede's entry is hand-tuned to 48.3/-8.1/69.2 for the arc, so it
does not match the server value exactly - that is deliberate, leave it.

Port Bastok grid calibration, derived from these plus Jabbar (F-6) and the CoP Travel Agency (F-7):
~36 yalms per cell, and z INCREASES as the row number DECREASES (map north is +z). That is why
Kagetora at z=29 is row 6 while Kaede at z=67 is row 5.

Korroloka Tunnel route to the ??? (walked in-game, from the Zeruhn Mines side):
  Map 1 (C-8) -> Map 3 (I-9) -> Map 2 (K-7) -> Map 3 (F-10) -> Map 2 (G-7) -> Map 5 (L-8) = ???

Maps 2 and 3 are each crossed TWICE at different spots, so this route cannot be modelled in
zone_connections - BFS visits a node once, and a map node cannot say which ledge of itself you
are standing on. Step 4 uses hand-authored `images` with numbered pins instead, one entry per
map, and no route_to. Do not "fix" this by adding Korroloka Tunnel 3/4/5 to the graph.

Getting the player TO the tunnel needed an engine change: `images` with zone_name =
"Korroloka Tunnel" could not route, because zone_connections only keys the sub-zones
"Korroloka Tunnel 1"/"2". pathfinding.getRoutableZoneNames now retries a base name against its
sub-zones, and utils.get_images_for_step uses it. Applies to Kuftal/Fei'Yin/Bibiki Bay too.

Ensetsu at Prog 4 gives event 243, a non-progressing reminder scene.
TODO: keyitems_needed / trigger_on_keyitem_obtain for the coral and dagger - need the numeric ids.
