# Paladin
[Tests]  A Squire's Test / II / A Knight's Test - DONE, triggers from the server files
[Chain]  Father and Son -> Sharpening the Sword -> A Boy's Dream -> Under Oath - text only, triggers TODO
[Hands]  Borghertz's Stalwart Hands - same

No LSB quest files were read for any of this. The 2025 pass was prose, structure and map fields
only; every step still completes by hand. Everything below is what a server-file pass needs.

## Event ids

DONE - A Squire's Test, from scripts/quests/sandoria. Log 0 / Quest 10:
  Balasiel 616          accept, first time            -> quest:begin
  Balasiel 631          accept, after declining once  -> quest:begin
  Balasiel 617          trade Revival Tree Root       -> quest:complete
  Reward: Spatha, title Knight in Training, San d'Oria fame +20.

  CAVEAT on 616: whether it begins the quest depends on the dialogue `option`, and
  trigger_on_event_id matches the event id only - triggers.lua has no option filter. So watching
  616 and DECLINING still ticks step 1. Declining sets Option=1, which is why 631 exists and why
  both ids are listed. Low harm: steps 2 and 3 will not progress, and the step can be unticked.
  If option matching is ever added, 616/631 are the test case.

DONE - A Squire's Test II, Log 0 / Quest 19:
  Balasiel 625          accept, needs getMainLvl() >= 10  -> quest:begin
  Balasiel 671          under Lv10 brush-off, no handler, not a step
  Balasiel 626          hand in Stalactite Dew            -> quest:complete, delKeyItem
  Balasiel 630          "still looking?" when you lack the dew, no handler
  Chanpau  629          optional, sets Option=1
  Morjean  602          optional, gated on Option==1 - so Chanpau MUST come first
  Reward: KI Squire's Certificate, title Spelunker, San d'Oria fame +20.

  The two ??? are a 30 SECOND timer, not "be quick": qm2 sets Timer = GetSystemTime() + 30,
  qm3 grants the dew only while GetSystemTime() <= Timer, else DEW_SLIPS_THROUGH_FINGERS.
  Retryable indefinitely - re-click qm2. Both are now in locations.lua:
    ordelles-caves-stalactite-pool-qm2   -94  1    273   (the pool)
    ordelles-caves-stalactite-dew-qm3   -139  0.1  264   (~45 yalms away)
  Neither carries a floor_id - which map they sit on is unconfirmed.

DONE - A Knight's Test, Log 0 / Quest 29:
  Balasiel 627          accept, first time             -> KI Book of Tasks, quest:begin
  Balasiel 635          accept, after declining once   -> same
  Balasiel 670          under-level brush-off, no handler, not a step
  Baunise  634          -> KI Book of the West
  Cahaurme 633          -> KI Book of the East
  Balasiel 628          hand in Knight's Soul          -> quest:complete, unlockJob(PLD),
                                                          deletes all four key items
  Balasiel 669          "still looking?" without the soul, no handler
  Reward: Kite Shield, title Tried and Tested Knight, KI Job Gesture Paladin, San d'Oria fame +20.

  627/635 carry the SAME option branch as A Squire's Test's 616/631 - option 0 accepts, anything
  else sets Option=1 and 635 is the come-back-later id. Rather than repeat that quest's
  false-positive-on-decline caveat, step 1 waits on trigger_on_keyitem_obtain for the Book of
  Tasks, which only lands on an actual accept. Prefer that shape wherever an accept hands over a
  key item.

  Baunise and Cahaurme are independent of each other - either order. The well is gated on holding
  BOTH books, and its onTrigger has no else branch, so without them clicking it is silent: no
  message, no cutscene. That is in the step text because it reads like a broken ???.

TODO - the other five quests. Scripts are in scripts/quests/sandoria (Father and Son, Sharpening
the Sword, A Boy's Dream, Under Oath) and scripts/quests/jeuno (Borghertz's Stalwart Hands).

## Missing: key item ids
Ids come from LandSandBoat scripts/enum/key_item.lua. Now in data/keyitems.lua:
  141 Stalactite Dew, 143 Book of Tasks, 144 Book of the East, 145 Book of the West,
  146 Knight's Soul
Note 144/145 are east-then-west, which is the reverse of how the walkthrough lists them.

Read off the same enum for the later quests but NOT yet added to keyitems.lua, because nothing
uses them and they have not been cross-checked against a second source the way 141-146 were
(those sit directly under the 131-136 orb block this file already had right):
  210 Old Gauntlets, 211 Shadow Flames, 218 Knight's Boots, 219 Mique's Paintbrush,
  220 Strange Sheet of Paper, 221 Knight's Confession, 233 Ordelle Whetstone
Confirm before use. Those quests are blocked on their event ids anyway.

## Missing: locations.lua entries
onmob_target does NOTHING without a locations.lua entry - questhelper.lua:509 gates on
`location_data[name]`, so a bare display name is a silent no-op, not a live highlight.

Present: Sobane, Balasiel, Baunise, Cahaurme, davoi-disused-well-e10, and the two Ordelle's
Caves ???. The three added for A Knight's Test came from the !pos comments in that quest's own
server file, which is the cheapest source there is - check the header of each script before
hunting coordinates in game.

Still needs !pos for:
  NPCs    Ailbeche, Exoroche, Vemalpeau, Najjar, Ullasa, Guslam, Yin Pocanakhu, Zaldon, Chanpau
  Objects Ordelle's Caves - the Stalagmite on map 1
          Davoi - Village Well (G-9)
          Port Jeuno - the ??? by the Duty-Free Shop (H-8)
          Castle Zvahl Baileys - the torch at (F-8)

## Levels - VERIFY
Confirmed from the server: A Squire's Test II is Lv10 (`player:getMainLvl() >= 10` on Balasiel's
onTrigger). A Boy's Dream, Under Oath and Borghertz's Stalwart Hands are Lv50 Paladin from the
quests themselves.

A Knight's Test now carries requirements.level = 30. Its gate is
`getMainLvl() >= xi.settings.main.ADVANCED_JOB_LEVEL`, NOT a literal - 30 is the retail value and
the default, and the wiki agrees, but a server that has retuned that setting makes the row wrong.
It is the only requirements.level in this file that is a setting rather than a number, so it is
the first thing to re-check if someone reports the gate firing at a different level.

A Squire's Test and Sharpening the Sword still have NO requirements block, because the level is
unconfirmed and a wrong "Recommended Level" row is worse than none. Note A Squire's Test's own
script has no level check at all - its only gate is quest status - so it may genuinely have none.
Any fame requirement is unknown too.

Polevik (Lv65+ advice) and the Davoi well NMs (Lv55+ party) are fight guidance in the step text,
not quest requirements - do not promote them to requirements.level.

## Floor ids
images floor_id is the RAW /qh_checkfloor value, not the map number. Three were map numbers and
are now corrected from data/floor_mappings.lua:
  Crawlers' Nest        map 1 = raw 15   [197]   (was 1)
  The Eldieme Necropolis map 1 = raw 15  [195]   (was 1)
  Castle Zvahl Baileys  map 3 = raw 15   [161]   (was 3)
Correct already: Ordelle's Caves map 1 = raw 1 [193], Castle Oztroja maps 1/2/3 = raw 1/2/3
[151], Castle Zvahl Baileys map 1 = raw 1.

Still unconfirmed - floor_mappings has no entry for these, so the images entries omit floor_id
and fall back to the zone default. Run /qh_checkfloor on each and add both the mapping and the
floor_id:
  Ordelle's Caves map 2        (Squire's Test II step 3, the ??? room)
  Crawlers' Nest map 2         (A Boy's Dream step 2, the Dreadbug ???)
  The Eldieme Necropolis map 2 (Borghertz step 2, five of the seven coffer spots)

## Other gaps
- Giant Shell Bug has no Auction House category path in the step text; only the Dreadbug source
  is given. Add the path once someone confirms which AH menu it sits under.
- Revival Tree Root sources, confirmed in game. The old "undead in King Ranperre's Tomb" line in
  this file was wrong and has been dropped:
    Bandersnatch  Gusgen Mines, Map 1 around (H-7)      ~11%
    Bogy          Gusgen Mines                          ~11%
    Tainted Hound East Ronfaure (10 spawns) / West Ronfaure (7, one around H-9), Lv5-8, 5 min
                  respawn, ONLY spawns 20:00-4:00 Vana'diel. ~5%. Aggro A/H/HP.
    Spook         King Ranperre's Tomb, by the tombstone at (I-10). Rate unknown. This is the
                  spot the quest dialogue points at - section 2's onTrigger is
                  messageName(GO_TO_KING_RANPERRES, REVIVAL_TREE_ROOT).
  The step uses route_choices so the player picks rate (Gusgen) or proximity (Ronfaure), with
  onmob_enemy on all three mobs. No destination_highlight: with route_choices the highlight lands
  on whichever zone was picked, so a Gusgen grid ref would draw a stray pin on the Ronfaure map.
  Grid refs live in the step text instead.
  Still unknown: exact drop percentages for Bandersnatch/Bogy (11% is approximate), Spook's rate,
  and whether Bogy has its own preferred camp spot on Map 1.

  The King Ranperre's arrow chain hangs off that zone entry rather than the step, so it does not
  draw while you cross East Ronfaure heading for Gusgen. Same walked route as SanDoria mission
  2-3 step 2 (SanDoria.lua:161-196), tombstone leg included. Gusgen and Ronfaure have no chains
  yet - both are pin-only.
- Castle Zvahl Baileys is not a node in zone_connections - it only appears as a destination edge
  (line 513), so routing TO it works and routing FROM inside it returns nil.
- Father and Son is filed under Paladin because Sharpening the Sword will not start until the
  Willow Fishing Rod is handed back. That last trade is flagged CRITICAL for the same reason,
  even though most write-ups call it optional.
