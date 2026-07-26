# QuestHelper Step Authoring Guide

Derived from the mature Windurst chain (`data/Missions/Windurst.lua`) and the engine in
`modules/triggers.lua`, `modules/utils.lua`, `modules/pathfinding.lua`, `questhelper.lua`.
Use this when turning a wiki walkthrough + server mission Lua into QuestHelper steps.

The one rule that matters most: **triggers must be correct; visuals (arrows/`visual_zones`) are
icing and can be filled in later.** A step with the right trigger but no arrows still works.

---

## 1. How to break a mission into steps

Read the **server mission script** first, not the wiki. The server is the source of truth for
progression. Work from `setMissionStatus` transitions and `onEventFinish` handlers.

Rules:

1. **One step per status-advancing event / NPC interaction.** Each server event that calls
   `setMissionStatus` (or gives the key item / completes the mission) is a step boundary. The
   event ID that causes that transition is that step's trigger.
2. **Never collapse a chain of distinct events into one step keyed on the last event.** If you
   talk to 6 knights in sequence (6 different event IDs), that's 6 steps. A single trigger leaves
   the highlight/arrow stuck on the first NPC while the player has moved on. (See Rescue Drill 2-1.)
3. **Optional / flavor dialogue = not a step.** Events with no `setMissionStatus` handler are
   just talk. Mention them in the step text (`(NPC nearby has optional dialogue.)`), don't gate on them.
4. **Random branches → one step, list every possibility.** When the server rolls a var and routes
   to one of several NPCs/events (e.g. a random knight gives the item), put all the event IDs in
   one `trigger_on_event_id` and all NPCs in `onmob_target`. (See Rescue Drill step 9: `{112,113,114}`.)
5. **Accept step trigger depends on the server:** if `handleAcceptMission` calls
   `player:messageSpecial(...YOU_ACCEPT_THE_MISSION)` use `trigger_on_talk`; if it does NOT
   (common), use `trigger_on_event_id` on the accept cutscene IDs (San d'Oria = `{1009, 2009}`).
6. **Turn-in / completion:** trigger on the `onEventFinish` IDs, and include BOTH the first-time
   and repeat IDs (San d'Oria trades are typically `{1003,1023,2003,2023}`-style sets).
7. Note oddities in a `-- comment` or the step text: status numbers that skip (0→2), repeat paths
   that diverge from first-time, inventory-slot requirements.

---

## 2. Which trigger to use

| Situation | Field | Notes |
|---|---|---|
| Talk to NPC / watch cutscene / trade turn-in | `trigger_on_event_id = {id,...}` | Pull IDs from server `onEventFinish`. Most common + most reliable. |
| Accept with an accept-message | `trigger_on_talk = {"You have accepted the mission"}` | Only if server sends that `messageSpecial`. Verify first. |
| Obtain a normal item (mob drop / NPC gives) | `trigger_on_item_obtain = {"Item Name"}` | Pair with `items_needed = {"Item Name"}`. `require_all_items = true` for a set. |
| Obtain a key item | `trigger_on_keyitem_obtain = {id,...}` | Pair with `keyitems_needed = {id,...}`. `require_all_keyitems = true` for a set. |
| Enter a zone / battlefield / area cutscene | `zone_trigger = "Zone Name"` | Matches by `zones.lua` ID. Name must exist there. |
| Kill N mobs in the open world | `kill_requirement = {...}` | See below. Add a `trigger_on_event_id` too if a CS follows the kills. |
| Gain a status effect | `trigger_on_buff = <id>` | Rare (e.g. Beadeaux Silence). |

`kill_requirement` shape:
```lua
kill_requirement = {
    count = 2,
    enemies = {"Dark Dragon","Seeker"},   -- or zone = "Tahrongi Canyon" for "any mob in zone"
    count_party_kills = true,              -- credit party/alliance kills
    reset_on_zone_entry = true,            -- reset counter on zone-in (BCNM)
    display_only = true,                   -- show progress but DON'T auto-advance (advance via 32001)
},
trigger_on_event_id = {32001},             -- BCNM win
```

---

## 3. Which map/visual to use

| Goal | Field | When |
|---|---|---|
| Guide to a town / outpost / open zone target | `route_to = "Zone"` + `destination_highlight = {position="G-10", offsetX=16, offsetY=16}` | Default for simple/open zones. Auto-paths; when already in-zone it just shows that zone's map + highlight. |
| Specific rooms in a multi-floor dungeon | `images = {...}` with `floor_id` + `state` | Only when you need a particular floor's map. |
| In-world directional arrows through a dungeon/zone | `visual_zones = {...}` + `zone_max_distance` | Progressive arrows; markers only draw within `zone_max_distance`. |
| Highlight a roaming enemy to kill | `onmob_enemy = {"Mob"}` (`onmob_enemy_colour`, `onmob_enemy_size`) | No coords needed — radar-highlights the mob live. |
| Highlight a clickable NPC/object | `onmob_target = {"Name"}` | Display or internal names both work (`"Door: Vestal-chamber"`, `"qm_windy_9_2"`). |

Keep the two map approaches consistent within a mission. Prefer `route_to` for towns/outposts;
reserve explicit `images` for the multi-floor dungeons that genuinely need per-floor maps.

`images` entry shape:
```lua
{ zone_name = "Quicksand Caves", floor_id = 4, width = 512, height = 512, state = 5,
  highlights = { { position = "I-9", offsetX = 16, offsetY = 16, label = "1" } } }
```

`visual_zones` marker shape (world coords, drawn in 3D):
```lua
{ zone_name = "East Sarutabaruta", type = 'arrow', center = { x=260.0, y=-17.3, z=-457.3 },
  size = 4, direction = "down", floor_id = 0, colour = "yellow" }
```
- `type`: `'arrow'` (needs `direction`: up/down/left/right/nw/ne/se/sw), `'square'`, `'rect'` (needs `width`/`height`, optional `vertical`/`rotation`/`vertical_axis`).
- **Colour convention:** `yellow` = path/direction arrows, `cyan` = target location, `green` =
  survival guide / warp / start point, `red` = enemy.

---

## 4. Non-obvious conventions (get these wrong and maps silently break)

- **`state` = the step's 1-based index.** An `images` entry only renders when `state` equals the
  step's position in the `steps` array (`utils.lua`); `state = nil` always renders. **When you
  insert or renumber a step, re-sync every `state` in the steps after it**, or their maps vanish.
- **`floor_id` is overloaded** — in `images` it selects which floor's map; in a `highlights` entry
  it filters that highlight to a floor; in `zone_connections` it's the floor an exit sits on (or,
  on an edge into the destination, the destination entrance floor). See `pathfinding.lua`.
- **`backtrack_floor_id`** on a step picks which entrance a multi-entrance dungeon routes to (e.g.
  Outer Horutoto from West Sarutabaruta: `1` = F-4, `4` = F-11).
- **`zone_max_distance`** is a proximity threshold in yalms for drawing `visual_zones` markers;
  a per-marker `max_distance` overrides it. Typical value 35–40.
- Zone names in `route_to`, `zone_trigger`, and `images.zone_name` must exist in `data/zones.lua`
  / `data/zone_connections.lua`. Run `/qh_validate` (or the debug Validate tab) after edits.

---

## 5. Text style

- Prefix every step: `"Step N: ..."`.
- Paragraph break is `" \n \n"` (space-newline-space-newline); single line break is `" \n"`.
- Section headers inside a step: `"===== Header ====="`.
- Callout prefixes: `WARNING:` (aggro/danger), `CRITICAL:` (do-or-fail), `NOTE:` (caveat),
  `TIP:` (shortcut/optional). Wrap purely-optional info in `( ... )`.
- Put grid coords inline: `Galaihaurat at (E-6)`. For fights, include level/job/family and any
  immunities (Sleep/Silence/etc.).

---

## 6. New-step checklist

1. Found the server `setMissionStatus`/`onEventFinish` for this objective → correct trigger + IDs?
2. One step per event (no collapsing, optional dialogue not gated)?
3. `state` on every `images` entry equals the step index?
4. Map field chosen per §3 (route_to for open, images for multi-floor dungeon)?
5. Enemy kills use `onmob_enemy` (roaming) or `kill_requirement` (count)?
6. Zone names exist in `zones.lua` / `zone_connections.lua`? (`/qh_validate`)
7. Text has the `Step N:` prefix, coords, and any WARNING/CRITICAL callouts?
