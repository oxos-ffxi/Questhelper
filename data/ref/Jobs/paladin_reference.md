# Paladin
[Tests]  A Squire's Test / II / A Knight's Test - text reformatted, triggers TODO
[Chain]  Father and Son -> Sharpening the Sword -> A Boy's Dream -> Under Oath - same
[Hands]  Borghertz's Stalwart Hands - same

No LSB quest files were read for any of this. The 2025 pass was prose, structure and map fields
only; every step still completes by hand. Everything below is what a server-file pass needs.

## Missing: event ids
No step in Paladin.lua carries trigger_on_event_id. The quest scripts live in
scripts/quests/sandoria (the Squire/Knight tests, Father and Son, Sharpening the Sword, A Boy's
Dream, Under Oath) and scripts/quests/jeuno (Borghertz's Stalwart Hands). Pull the onEventFinish
ids from those the way Ninja was done.

## Missing: key item ids
None of these are in data/keyitems.lua, so no keyitems_needed / trigger_on_keyitem_obtain:
  Stalactite Dew, Book of Tasks, Book of the West, Book of the East, Knight's Soul,
  Ordelle Whetstone, Knight's Boots, Mique's Paintbrush, Strange Sheet of Paper,
  Knight's Confession, Old Gauntlets, Shadow Flames

## Missing: locations.lua entries
onmob_target does NOTHING without a locations.lua entry - questhelper.lua:509 gates on
`location_data[name]`, so a bare display name is a silent no-op, not a live highlight. Only
Sobane exists today, and he is the only onmob_target in the file. Needs !pos for:
  NPCs    Balasiel, Ailbeche, Exoroche, Baunise, Cahaurme, Vemalpeau, Najjar, Ullasa,
          Guslam, Yin Pocanakhu, Zaldon, Chanpau
  Objects Ordelle's Caves - the two ??? on map 2, and the Stalagmite on map 1
          Davoi - Disused Well (E-10), Village Well (G-9)
          Port Jeuno - the ??? by the Duty-Free Shop (H-8)
          Castle Zvahl Baileys - the torch at (F-8)

## Levels - VERIFY
Confirmed from the quests themselves: A Boy's Dream, Under Oath and Borghertz's Stalwart Hands
are Lv50 Paladin, and those carry requirements.level = 50.

A Squire's Test, A Squire's Test II, A Knight's Test and Sharpening the Sword have NO
requirements block, because the level is unconfirmed and a wrong "Recommended Level" row is worse
than none. Read them off the quest log and fill them in. Any fame requirement is unknown too.

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
  The step uses route_choices so the player picks rate (Gusgen) or proximity (Ronfaure), with
  onmob_enemy on all three mobs. No destination_highlight: with route_choices the highlight lands
  on whichever zone was picked, so a Gusgen grid ref would draw a stray pin on the Ronfaure map.
  Grid refs live in the step text instead.
  Still unknown: exact drop percentages for Bandersnatch/Bogy (11% is approximate) and whether
  Bogy has its own preferred camp spot on Map 1.
- Castle Zvahl Baileys is not a node in zone_connections - it only appears as a destination edge
  (line 513), so routing TO it works and routing FROM inside it returns nil.
- Father and Son is filed under Paladin because Sharpening the Sword will not start until the
  Willow Fishing Rod is handed back. That last trade is flagged CRITICAL for the same reason,
  even though most write-ups call it optional.
