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
| ...scoped to a zone | `trigger_on_event_id = {id, "Zone Name"}` | A string in the list is a zone filter. Use it for any low id. |
| Accept with an accept-message | `trigger_on_talk = {"You have accepted the mission"}` | Only if server sends that `messageSpecial`. Verify first. |
| Obtain a normal item (mob drop / NPC gives) | `trigger_on_item_obtain = {"Item Name"}` | Pair with `items_needed = {"Item Name"}`. `require_all_items = true` for a set. |
| Obtain N of an item | `trigger_on_item_obtain = {{item = "Name", quantity = 4}}` | Fires on the obtain/buy message, then verifies the real inventory count. |
| Skip a gather step the player has already done | `skip_if_have = {item = "name", quantity = 4}` | Periodic inventory check, OR semantics. Catches AH purchases and stock on hand. |
| Obtain a key item | `trigger_on_keyitem_obtain = {id,...}` | Pair with `keyitems_needed = {id,...}`. `require_all_keyitems = true` for a set. |
| Enter a zone / battlefield / area cutscene | `zone_trigger = "Zone Name"` | Matches by `zones.lua` ID. Name must exist there. |
| Kill N mobs in the open world | `kill_requirement = {...}` | See below. Add a `trigger_on_event_id` too if a CS follows the kills. |
| Gain a status effect | `trigger_on_buff = <id>` | Rare (e.g. Beadeaux Silence). |
| Witness weather types | `weather_watch = {...}` | Banks elements seen on ZONE-IN. See below. |

`weather_watch` shape (SMN "I Can Hear a Rainbow" is the only user so far):
```lua
weather_watch = {
    label = "Colours shown to the ruby",
    slots = {                                    -- valid keys: clear fire water earth wind ice thunder
        { key = "fire", label = "Fire (Hot Spell / Heat Wave)" },
    },
    zones = { "Valkurm Dunes", ... },            -- optional: only these zones credit
    requires_item = "Carbuncle's Ruby",          -- optional but usually essential, see below
    display_only = true,                         -- optional: track but never auto-complete
},
```
Completes the step once every declared slot has been seen, unless `display_only`.

**Always give it a `requires_item` if the quest has one.** `current_mission` is whatever the player
has *selected in the UI*, not what they are actually on - so merely browsing a weather quest would
otherwise bank colours for a quest they have never started. `requires_item` mirrors the server's own
precondition (SMN's section check is `hasItem(CARBUNCLES_RUBY)`), which makes the addon inactive in
exactly the cases the server would refuse credit. The handler also skips missions already marked
complete.

Debug with `/qh_weather` (current weather, banked list, whether tracking is ACTIVE), `test` to force
a capture past the item gate, `set <name>` / `unset <name>` to correct a slot by hand, and
`clear` / `clearall` to wipe. `set` matters for players who were part-way through the quest before
installing the addon - without it their only option is re-hunting weather the server already
credited.

**It fires on ZONE CHANGE only, and that is deliberate** - the server grants credit in each
zone's `onZoneIn`, so weather that rolls over while the player stands still earns nothing.
Polling every frame would show colours as banked that were never credited. The check is also
deferred ~4s past the zone change (`WEATHER_SETTLE_DELAY` in `questhelper.lua`) because the
weather value in client memory still holds the previous zone's reading for a moment after the
zone id flips.

**Never name a slot key after a table operation** - `clear`, `copy`, `map`, `keys`. These keys are
table indexes, and the state tables are Ashita `T{}`s whose metatable exposes the table library
through `__index`, so `seen['clear']` returns that *function* and reads as true forever. The SMN
tracker shipped with exactly that bug: its Clear slot showed DONE regardless of weather and
survived every wipe. Reads go through `quest_state.hasWeatherSeen`, which uses `rawget`; the key
itself is `none`, matching `xi.weather.NONE`.

Only the seven elemental buckets exist. Clouds and Fog are not elemental, and Light/Dark
(Auroras/Gloom) are not in the quest's table - `WEATHER_ELEMENT` in `triggers.lua` leaves all of
them unmapped on purpose, so they can never tick a slot. Sunshine folds into `clear`, matching the
server. State is stored in `weather_progress`, persistent like `quest_choices` (**not** day-stamped
like `daily_progress`) since these sightings hold across days and relogs.

**Item name matching differs by mechanism, and this catches people out.** The *message* match in
`trigger_on_item_obtain` is a case-sensitive plain `find` against chat text, so the casing has to
match the log line. The *inventory* checks - `skip_if_have`, and the quantity verification inside
`trigger_on_item_obtain` - go through `inventory.hasItem`, which is **case-insensitive substring**
across the item's Name, LogNameSingular and LogNamePlural. So a short lowercase fragment
(`"gausebit"`) is the robust choice for anything inventory-backed, while message triggers may need
both casings listed. See `data/Quests/Upper Jeuno.lua` for the pattern.

**Scope low event ids to a zone.** Put the zone name as a string anywhere in the
`trigger_on_event_id` list and the trigger only fires in that zone:

```lua
trigger_on_event_id = { 0, "Buburimu Peninsula" },
```

Server event ids restart per zone, so single-digit ids like 0, 2 and 5 are common everywhere.
Without a filter, a step waiting on event 2 can be completed by an unrelated cutscene somewhere
else - and event 0 doubles as the "text interaction" case (`event_id == 0 and param0 == target`),
making it the most collision-prone value there is. Anything below ~10 should carry a zone.
Handled in `triggers.handlePacketIn`.

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

### `route_choices` - let the player pick the destination
When a step is valid in many zones (the SMN weather hunt has 25), drawing every route is
useless. List them instead and the player clicks one:

```lua
route_choices_label = "Route to (click one):",   -- optional
route_choices_per_row = 3,                       -- optional, default 3

-- Either a flat list...
route_choices = { "Valkurm Dunes", "Konschtat Highlands", ... },

-- ...or grouped, when the zones need explaining:
route_choices = {
    { group = "Fire",  zones = { "Valkurm Dunes", "Cape Teriggan" } },
    { group = "Ice",   zones = { "Beaucedine Glacier", "Xarcabard" } },
},
```

**Collapsing finished groups.** `route_choices` knows nothing about *why* a group might be done -
keep it that way, it is meant to be reusable by any step with several valid destinations. The
coupling belongs on the feature that owns the progress. For weather, a `weather_watch` slot names
the group it satisfies:

```lua
slots = { { key = "fire", label = "Fire (...)", route_group = "Fire" } },
```

Once that colour is banked the matching group is **hidden**, and when every group is done the whole
block disappears rather than leaving an empty header. Hiding is safe here precisely because the
tracker itself is on screen listing every colour as DONE / ____ - leaving a "Fire - DONE" line in
the route block as well was just duplication. `/qh_weather clear` is the recovery path if a tick is
ever wrong. Any future tracker can do the same by pointing at a group label.

Group when a bare list of 20+ zones would mean nothing to the player. The group label carries
the "why", which usually lets you delete the same information from the step text - the SMN
weather step dropped its whole per-colour table this way. A zone may appear in several groups
(Valkurm Dunes gets both fire and earth weather); picking it from either routes to the same
place, so both buttons show as active.

The pick becomes that step's effective `route_to` (maps and the Route panel both follow it),
persists per step, and clicking the active one clears it. A pick that is no longer in the list -
because the data file changed - is ignored rather than routing somewhere the step no longer
mentions. Resolution lives in `quest_state.resolveRouteTo`; never read `step_data.route_to`
directly in new code.

### `route_to` and `images` are mutually exclusive - never both on one step

Pick one per step:

- **`route_to` + `destination_highlight`** - cities, towns, outposts, open zones. Anywhere the
  player just needs to *get there*. Maps are generated for you.
- **`images`** - specific dungeons where you must pinpoint a spot the router cannot express
  (a particular floor, a lever, a coffer room).

This is not a style preference, it is how the code branches. In `utils.lua` the `images` check
comes first and **returns unconditionally** (`return matched`, ~line 174), so the `route_to` map
branch below it is **unreachable whenever `images` is present**. Putting both on a step does not
give you both - the `images` win and the route maps you thought you were getting never render.

Two consequences worth knowing:

- `images` does its **own** routing. If the player is not in one of the `zone_name` zones, it paths
  them to the nearest one and uses that image's `highlights` as the destination highlights. So a
  dungeon step with `images` and no `route_to` still guides the player there.
- If **no** `images` entry matches the current `state`, `matched` is empty and it *still* returns -
  so a mis-synced `state` does not merely hide one map, it leaves the step with **no maps at all**.

Need several marked spots without a dungeon map? Use the **array form of `destination_highlight`**
rather than reaching for `images`:

```lua
route_to = "Sauromugue Champaign",
destination_highlight = {
    { position = "L-8",  label = "Cliff" },
    { position = "L-10", label = "Cave"  },
},
```

`generateRouteImages` accepts that array and supports per-entry `floor_id` and `label`
(`pathfinding.lua:340-344`).

Note `route_to` still drives the textual **Route** panel in `ui_main.lua` independently of all
this - that panel reads `step_data.route_to` directly. It is only the *maps* that short-circuit.

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

**See `step_text_style_guide.md` for the full rules.** That document owns the prose layer and is
derived from the renderer in `modules/ui_theme.lua`, which *parses* step text - the conventions
below are load-bearing, not cosmetic. The short version:

- Prefix every step: `"Step N: ..."`.
- Paragraph break is `" \n \n"` (space-newline-space-newline); single line break is `" \n"`.
- Section headers inside a step: `"===== Header ====="`.
- Callout prefixes: `WARNING:` (aggro/danger), `CRITICAL:` (do-or-fail), `NOTE:` (caveat),
  `TIP:` (shortcut/optional). Wrap purely-optional info in `( ... )`.
  These are matched EXACTLY and case-sensitively at the start of a line - `Note:` renders grey, a
  leading `- ` kills the colour, and a callout hard-wrapped across `\n` loses its colour on the
  second line. One callout = one source line; let the renderer wrap it.
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
