# Ranger
[Unlock] The Fanged One - DONE, triggers from the server file
[AF]     Hunter's set - TODO
[Hands]  Borghertz's Wild/Chasing Hands - TODO (confirm which is RNG)

## Event ids

DONE - The Fanged One, Log 2 / Quest 31:
  Perih Vashai   351    accept, needs getMainLvl() >= ADVANCED_JOB_LEVEL  -> quest:begin
  Perih Vashai   352    reminder while Prog == 0, no handler, not a step
  Muhk Johldy    353    optional guard dialogue, no handler
  Kapeh Myohrye  354    optional guard dialogue, no handler
  Perih Vashai   356    optional Black Tiger Fang trade - tradeComplete only, EATS the fang
  Perih Vashai   357    hand in Old Tiger's Fang -> quest:complete, unlockJob(RNG), setMustZone
  Perih Vashai   358    post-completion scene, gated on getMustZone, so needs a zone change first
  Reward: Ranger's Necklace, title The Fanged One, KI Job Gesture Ranger, Windurst fame +20.

Key item: 117 Old Tiger's Fang, now in data/keyitems.lua. Cross-checks against 121 Tenshodo
Application Form and 131 White Orb, both of which that file already had right.

## Tiger Bones - read the onTrigger before touching step 2

Everything about this step comes from the two-branch `Tiger_Bones` onTrigger, and the branch
order is what makes it work:

1. `Timer > GetSystemTime()` and no fang yet -> GIVES the fang, sets Prog = 1.
2. else `Prog == 0` and `Wait <= GetSystemTime()` and not spawned -> SPAWNS Old Sabertooth.

So one clickable object does both jobs, which is why step 2 is one step and not two.

- `Timer` is set by the natural death in Old_Sabertooth.lua, NOT by a kill. Killing it arms
  nothing, hence the CRITICAL. The wiki's "wait five minutes and re-pop" is the `Wait` var, so it
  is a delay, not a dead end - an earlier draft called it a forfeit and overstated it.
- Branch 1 does not care who popped it. Witness the death on someone else's pop and clicking the
  bones hands you the fang directly.
- `Timer` is a deadline, so the fang window does close.

Only the first of those is in the step text. The step was condensed hard on request and the other
two came out - they are edge cases that cost three lines each and change nothing about what the
player does. Keep them here, not there. Same for the Survival Guide at (J-9/J-10) being the
nearest warp, and Old Sabertooth pacing near the bones with battle music playing while it dies
(alarming, harmless). **Do not re-expand step 2** without asking; its length is a decision, not an
oversight.

The step triggers on `trigger_on_keyitem_obtain = {117}`. It previously had NO trigger at all and
never auto-advanced.

`onmob_enemy` highlights Old Sabertooth in **white**, deliberately not the red used everywhere
else - here the highlight means "this is the thing to keep away from", the opposite of the usual
"kill this". If a future step needs the same sense, reuse white rather than inventing a colour.

## locations.lua entries
Both present and matching the !pos comments in the server file:
  Perih Vashai                 117 -3 92    (Windurst Woods, zone 241)
  sauromugue-tiger-bones-l10   666 -8 -379  (Sauromugue Champaign, zone 120)
The bones entry carries no floor_id; Sauromugue is open world so it draws regardless.

## Levels
requirements.level = 30 comes from `xi.settings.main.ADVANCED_JOB_LEVEL`, not a literal - same
setting as the Paladin unlock, and the same caveat: 30 is retail and the default, but a server
that retuned it makes the row wrong. Section 1's check includes the level, so under Lv30 Perih
Vashai has no accept dialogue at all.

## Gotchas not in the server file
- Holding a Ranger's Necklace already (a mule handed you one) blocks the turn-in, with a message
  about sorting your inventory that reads like a full-bags error. Wiki-sourced, flagged CRITICAL
  on step 3.
- The three Sabertooth Tigers outside the cave stop aggroing at Lv40.

## Dead fields removed
Step 2's `destination_highlight` entries carried `color = "yellow"` / `color = "cyan"`. Highlight
entries only read `position`, `offsetX`, `offsetY`, `label` and `floor_id` (`pathfinding.lua`
~396-440, ~665-715) - there is no colour support, so those were silently ignored. Do not re-add
them; `visual_zones` is where colour lives.

Two callouts were also written as `- WARNING: ...` and hard-wrapped across `\n`. Both kill the
callout colour (see step_authoring_guide.md §5) - one callout is one unwrapped source line with
no leading dash.
