# Support Job unlock - Elder Memories / The Old Lady

Two quests, one reward, mutually exclusive. Both live in Log 4 (Other Areas).
  Elder Memories  Quest 24  Isacio, Selbina (G-10)  !pos -54 -1 -44  zone 248
  The Old Lady    Quest 10  Vera,   Mhaura  (G-10)  !pos -49 -5 20   zone 249
Filed as `data/Quests/Selbina.lua` and `data/Quests/Mhaura.lua` - one per town, matching where
the player actually stands.

## Event ids

Elder Memories (Isacio):
  111  accept, needs getMainLvl() >= SUBJOB_QUEST_LEVEL, option 40 accepts
  119  under-level brush-off, no handler
  114  "still need X" while the quest runs, no handler
  115  trade Magicked Skull   -> Prog 1
  116  trade Damselfly Worm   -> Prog 2
  117  trade Crab Apron       -> quest:complete, unlockJob(0)
  118  post-completion line

The Old Lady (Vera):
  131  accept, same level gate, option 40 accepts
  133  under-level brush-off, no handler
  132  "still need X", no handler
  135  trade Wild Rabbit Tail       -> Prog 1
  136  trade Cup of Dhalmel Saliva  -> Prog 2
  137  trade Bloody Robe            -> quest:complete, unlockJob(0)
  138  post-completion line
  Vera also answers 130 in Selbina's quest, and Isacio answers 99 in Vera's - cross-town brush-offs
  once the other quest is running. Neither is a step.

Both accepts branch on `option == 40`, which `trigger_on_event_id` cannot see - the same caveat as
Paladin's 616/631 and Samurai's 25. Nothing is handed over on accept, so there is no key item to
wait on instead. Declining ticks step 1; untick it.

## THE TRADE ORDER IS ENFORCED
`onTrade` reads `subJobItems[Prog]` and only matches that one item. Trading the right item at the
wrong time matches nothing and is silently refused - no message, no cutscene.

  Selbina   Magicked Skull -> Damselfly Worm -> Crab Apron
  Mhaura    Wild Rabbit Tail -> Cup of Dhalmel Saliva -> Bloody Robe

**Selbina's order is not the order the wiki lists.** The wiki's Items Needed box reads "Damselfly
Worm, Magicked Skull, Crab Apron"; the server wants the SKULL first. Follow anyone's write-up
literally and the first trade does nothing. That is why step 3 carries a CRITICAL. Mhaura's order
happens to match, so it does not need one.

## Gilgamesh's Introductory Letter
From Rhapsodies of Vana'diel "Set Free". `onTrigger` checks it BEFORE the Prog lookup and jumps
straight to the completing event (117 / 137), so the whole item collection is skipped - talk, do
not trade.

Its key item id is NOT in data/keyitems.lua and was not found in the LSB enum fetch. It has no
engine use here anyway: there is no `skip_if_have` for key items, only for items, so steps 2-5
cannot auto-skip for letter holders. It is a TIP on step 1 instead. If a key-item skip is ever
added, this is the first case for it.

## Levels
requirements.level = 18 is `xi.settings.main.SUBJOB_QUEST_LEVEL`, a setting rather than a literal -
same caveat as ADVANCED_JOB_LEVEL on the job unlocks. 18 is retail and the wiki agrees.

## Drop sources
Both quests are three gather steps then three trades, and both have the SAME shape: two mobs in
the town's own outdoor zone, then one undead drop that is night-locked there with Gusgen Mines as
the any-time alternative.

  Selbina                                    Mhaura
  Crab Apron      Snipper   Valkurm          Wild Rabbit Tail  Mighty Rarab  Buburimu
  Damselfly Worm  Damselfly Valkurm          Dhalmel Saliva    Bull Dhalmel  Buburimu
  Magicked Skull  Ghoul/Bogy  Valkurm night  Bloody Robe       Bogy          Buburimu night
                              or Gusgen                                      or Gusgen

**Bogy drops both undead items** - the Magicked Skull and the Bloody Robe - which is why Gusgen
Mines is the fallback on both quests. Gusgen's Bogys are also already a Revival Tree Root source
in `data/Jobs/Paladin.lua`, so that camp serves three separate quests.

Selbina's skull step lists `{ "Ghoul", "Bogy" }`: Ghoul for the Valkurm branch, Bogy for the
Gusgen one. A name absent from the current zone simply never matches, so covering both branches
costs nothing. Mhaura's robe step needs only `"Bogy"` - it is the mob in both of its zones.

Only the undead steps carry `route_choices`, because they are the only ones with a real choice -
a single-zone step would render a one-button block, and the guide is explicit that route_choices
is opt-in rather than "always use it". The town's own zone defaults, since the player is already
stood there having done the first two gathers; Gusgen is the daytime escape hatch.

Gather order is free, TRADE order is not. Selbina's therefore diverge - gathers run Apron, Worm,
Skull (one Valkurm trip, then deal with the night problem) while trades run Skull, Worm, Apron.
Mhaura's happen to line up, so both run Tail, Saliva, Robe.

`skip_if_have` on all six, so an AH shopper skips straight past.

## Unconfirmed
- The Valkurm night undead's exact mob name, and whatever drops it in Gusgen. Step 4 therefore has
  NO `onmob_enemy` - a wrong name is a silent no-op that reads as a broken highlight. Snipper and
  Damselfly are named and highlighted; add the skull mob when someone confirms it.
- Camp coordinates for any of them. All three gather steps route to the zone with no
  `destination_highlight`, rather than borrowing a grid ref.
- Whether Valkurm's night undead really is Ghoul. That name was supplied by hand; Bogy was added
  alongside it for the Gusgen branch. If Valkurm's is also Bogy, drop the Ghoul entry.
- Camp coordinates for Mhaura's undead step. The other four gather steps carry
  `destination_highlight` arrays; the two `route_choices` steps carry none, because with several
  destinations a bare highlight draws on whichever zone was picked. Per-group highlights are the
  fix if camps are ever pinned - see the route_choices section of the authoring guide.
- Whether routing reaches Mhaura cleanly. Both towns are ferry stops; `route_to` only needs the
  zone to exist in zones.lua, which it does, but the pathfinder was not exercised for Mhaura.

## No engine support for mutual exclusion
Nothing stops a player opening both quests in the UI and ticking steps on the wrong one. The only
guard is the CRITICAL on step 1 of each, pointing at the other. A `mutually_exclusive = {...}`
field would be the real fix if this pattern turns up again.
