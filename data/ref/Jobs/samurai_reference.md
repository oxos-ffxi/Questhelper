# Samurai
[Unlock] Forge Your Destiny - DONE, triggers from the server file
[AF1]    The Sacred Katana - TODO (consumes the Mumeito from the unlock)
[AF2]    Yomi Okuri - TODO
[AF3]    A Thief in Norg - TODO
[Hands]  Borghertz's ? Hands - TODO (confirm which Borghertz file is SAM)

Server files: scripts/quests/outlands/

## Event ids

DONE - Forge Your Destiny, Log 5 / Quest 129:
  Jaucribaix 25   accept, needs getMainLvl() >= ADVANCED_JOB_LEVEL, option 1 begins
  Aeka       44   first Lump of Oriental Steel, sets Option bit 0
  Aeka       47   Darksteel Ore repurchase
  Ranemaud   40   first Sacred Sprig, sets Option bit 1
  Ranemaud   43   Platinum + 2x Gold Ore repurchase
  Jaucribaix 27   trade Bomb Steel + Sacred Branch, sets waitTime = now + 10368s
  Jaucribaix 29   collect -> quest:complete, unlockJob(SAM)
  Reward: Mumeito, title Bushido Blade, KI Job Gesture Samurai, Norg fame +20.

Flavour with no handler, do NOT gate on these: 26 (pre-trade), 28 (time remaining, parameter is
Vana'diel hours = seconds/144), 41/42/45/46/48/49/50 (Aeka and Ranemaud reading state back).

Step 1's trigger has the same option problem as Paladin's 616/631 - event 25 fires whether you
accept or decline, and `trigger_on_event_id` cannot see the option. Unlike A Knight's Test there
is no key item handed over on accept, so there is nothing better to wait on. Left as-is with the
caveat in a comment.

10368s = 3 Vana'diel days = 2h52m48s real.

## Items, not key items
This quest uses NO key items - everything is a real inventory item, so steps 4 and 5 wait on
`trigger_on_item_obtain` rather than `trigger_on_keyitem_obtain`.

Step 5's `kill_requirement` is `display_only` and the step advances on the Bomb Steel. Killing
Forger is not the objective; looting the drop is, and the two are not the same event.

## The two QMs
Both take a trade, both pop an NM, both then take a second trade - and both carry a cooldown
enforced by a `localVar` set from the mob's DESPAWN listener:
  Konschtat qm3   Oriental Steel -> Forger.          2 min. Forger drops the Bomb Steel.
  Zi'Tah    qm2   Hatchet -> Guardian Treant.        10 min. Then Sacred Sprig -> Sacred Branch.

Zi'Tah's two trades are two steps (5 and 6) even though they are the same object, because each
wants its own `onmob_target_icon` - hatchet, then sprig - and one step can only carry one. The
kill sits on step 5 as a real `kill_requirement` (not `display_only`) because the kill IS that
step's objective; step 6 waits on the Sacred Branch.

**The hatchet trade is gated on already holding the Sacred Sprig** - qm2's first branch reads
`player:hasItem(SACRED_SPRIG) and trade:getItemQty(HATCHET) == 1`. Turn up without the sprig and
the trade falls through every branch and returns nothing: no message, no pop, no clue why. That is
why Ranemaud is step 4 and it is a CRITICAL on step 5, and it is the one ordering constraint in an
otherwise free-order quest.

The hatchet is not consumed and the Treant's branch trade is per-player, so one kill serves a
whole party. The steel IS consumed by Forger's pop, which is why losing that fight costs a
Darksteel Ore - that asymmetry is the reason step 5 has a CRITICAL and step 4 does not.

Konschtat's qm3 also enforces a 1.6 yalm trade distance with its own "must be closer" message.

## The Hatchet step
Step 1 buys the Hatchet from Toji Mumosulah, M & P's Market, Kazham (I-8) - standard stock, so
always in. It sits first because Kazham is the airship stop the run starts from and step 5 is
where it is finally used; buying it on the way out saves a second trip through the jungle.

It is NOT part of the quest script - no event, no server state - so it completes on
`trigger_on_item_obtain` and carries `skip_if_have`, which is an inventory check and therefore
also catches an AH purchase or one already in the bag. This is the only step in the file that can
complete without the server knowing anything happened.

`onmob_target` is deliberately absent: Toji Mumosulah has no locations.lua entry, and a bare
display name is a silent no-op rather than a highlight. Add the !pos and the entry together.

## locations.lua entries
All five present, from the !pos comments in the server file:
  Jaucribaix  91 -7 -8 / Aeka  4 0 -4 / Ranemaud  15 0 23   (Norg, zone 252)
  konschtat-forger-qm-d8        -709 2 102   (zone 108)
  zitah-guardian-treant-qm-l10   642 -5 -150 (zone 121)
Missing: Toji Mumosulah (Kazham, zone 250) - needs a !pos.

## Levels
requirements.level = 30 is `xi.settings.main.ADVANCED_JOB_LEVEL`, not a literal - same setting and
same caveat as the Paladin and Ranger unlocks.

## Known duplication
The Kazham -> Yuhtunga -> Sea Serpent Grotto -> Norg arrow chain is repeated verbatim on steps 1,
2, 3, 6 and 7. That is deliberate: data files stay longhand, no shared locals or builders. If the
route changes, all five copies change.
