# Step Text Style Guide

Companion to `step_authoring_guide.md`. That one owns **mechanics** - triggers, maps, floor ids.
This one owns **prose** - the words inside `text = "..."` and the names you reference.

Read this before writing a new mission, quest or job file, so the Bastok chain and the Windurst
chain read like the same person wrote them.

---

## 0. The one thing to understand first

**Step text is not free text. `modules/ui_theme.lua` parses it.** `renderStepText` splits your
string on `\n` and inspects every line. Get the pattern right and it renders as a styled block;
get it wrong and the same words render as flat grey body text.

So the wording rules below are not taste. They are the input format for the renderer.

Everything in §1 is derived from `buildStepLines` / `PREFIX_COLORS` in
`modules/ui_theme.lua:297-359`. If that file changes, this section is the thing to re-check.

---

## 1. The renderer contract

### 1.1 First line becomes the step title
`stepTitle` matches `^[Ss]tep%s*%d+%s*(.-)%s*:%s*(.+)$` on the first non-empty line only.

    "Step 1: Speak with Gumbah in Bastok Mines (J-7)."   -> title: "Speak with Gumbah..."
    "Step 4 (Optional): Speak to Ailbeche again."        -> title: "(Optional)  Speak to Ailbeche again."

The **"Step N" is stripped** - the nav row already shows the number, so repeating it is noise.
An optional parenthetical tag between the number and the colon is moved to the front.

Consequence: **always start a step with `Step N: `**. Drop it and you get no title line at all,
just body text, and the step reads flat next to every other step in the file.

### 1.2 Section headings
`^=+%s*(.-)%s*=+$` -> rendered gold and **force-uppercased**.

    "===== The fight ====="      renders as   THE FIGHT

Don't bother shouting in the source; the renderer uppercases for you. Use headings only when a step
has genuinely separate parts (getting there / the fight / the reward). A three-line step needs none.

### 1.3 Callout prefixes - use them SPARINGLY

Before the mechanics, the house rule: **a callout is an exception, not a paragraph style.** The
default for everything is a plain `- ` bullet. Measured across the repo:

| File | Callouts per step |
|---|---|
| `Missions/Bastok.lua`, `ChainsOfPromathia.lua` | **0.05** |
| `Missions/Windurst.lua`, `Zilart.lua` | 0.06 - 0.07 |
| `Missions/SanDoria.lua` | 0.11 |
| `Limit Breaks/Genkai.lua` | 1.03 |

The nation and expansion chains - the bulk of the addon, and the tone to match - use roughly **one
callout every 10 to 20 steps**. Genkai is the outlier, not the model. Job files written against
Genkai's density landed at 0.25-1.60 per step and read as shouty next to everything else.

Ask: *if this line were a plain bullet, would the player actually fail?* If not, it is a bullet.
Level requirements, travel advice, drop rates, "he is upstairs", optional flavour - all bullets.
Reserve a callout for a genuine do-or-fail mechanic: the trade window that eats your item, the
weather that only counts on zone-in, the NM you must not attack.

One per step is plenty. Two is usually a sign the step is doing too much.

### Callout mechanics - EXACT, case-sensitive, at line start
`PREFIX_COLORS`, checked in order against the **trimmed** line:

| Prefix | Colour | Use it for |
|---|---|---|
| `CRITICAL:` | red | Do this or the step/quest fails. Irreversible or run-ending. |
| `WARNING:` | red | Physical danger - aggro, level checks, a trip that gets you killed. |
| `IMPORTANT:` | red | Reserved. Prefer CRITICAL or WARNING; do not introduce new uses. |
| `TIP:` | cyan | Optional shortcut - Home Point, Survival Guide, cheaper route. |
| `NOTE:` | cyan | Caveat or clarification that is neither dangerous nor optional. |
| `REWARD:` | gold | Rarely needed in steps - rewards belong in the `reward` block. |

**These colours are state-dependent.** On a **completed** step every line collapses to green -
body, headings and callouts alike - because a finished step is scanned for "is this done?", not
read for instructions, and one red `CRITICAL:` still shouting inside a green block reads as
unfinished. So do not lean on a callout's colour to carry meaning that must survive completion;
put the meaning in the words.

Three ways to silently lose the colour:

1. **Wrong case.** `Note:` and `Notes:` do **not** match `^NOTE:`. They render as plain body.
2. **A bullet in front.** The match is anchored to the start of the trimmed line, so
   `- CRITICAL: ...` never matches. A callout is its own line, never a bullet.
3. **Hard-wrapping across `\n`.** Each source line is coloured independently. Split a callout over
   two `"..."` lines and the second half turns grey mid-sentence.

That third one is the big one, so:

> **Write each callout as ONE logical line and let the renderer wrap it.**
> `wrap_fn` wraps a long line into several visual lines that all keep the callout colour.
> Manual `\n` inside a callout breaks it.

```lua
-- WRONG - second line renders grey
"CRITICAL: The 10 minute clock starts when you ZONE IN, not when you engage - resting\n" ..
"and buffing inside eats your timer.\n \n" ..

-- RIGHT - one line, renderer wraps it, stays red throughout
"CRITICAL: The 10 minute clock starts when you ZONE IN, not when you engage - resting and buffing inside eats your timer.\n \n" ..
```

Yes, this makes some source lines long. That is fine - correctness of the rendered panel beats
tidiness of the Lua source.

### 1.4 Bullets and continuation
A line is indented (12px, wrapped 3 chars narrower) when **either**:
- the trimmed line starts with `- ` (a bullet), or
- the raw line starts with **two or more spaces** (a manual continuation).

```lua
"- Ostalie in Southern San d'Oria sells pickaxes. Buy several - excavation points do not\n" ..
"  always give the egg and the pickaxe breaks.\n" ..
```

Bullets may be hard-wrapped this way; they are body-coloured anyway, so nothing is lost.

### 1.5 Blank lines
Any line that trims to empty becomes a thin 3px gap. The legacy `" \n \n"` idiom (space-newline-
space-newline) works because that middle `" "` trims to empty - but so does a plain `"\n\n"`.
Keep `" \n \n"` in existing files for consistency; either is correct.

### 1.6 Failure mode
`buildStepLines` is `pcall`ed. A malformed step shows raw text under a red
"(could not format this step)" line rather than taking the panel down. If you ever see that in
game, the step's `text` is not a string or contains something pathological.

---

## 2. House voice

- **Second person, imperative.** "Talk to Gumbah", not "The player should talk to Gumbah".
- **Say the outcome, not the lore.** "Trade the sprig for the Sacred Branch", not a retelling of
  the cutscene. Flavour goes in `reward.text` if anywhere.
- **Coordinates inline, in parentheses:** `Gumbah in Bastok Mines (J-7)`. Always the letter-dash-
  number form. Never "at J7" or "around J-7ish".
- **Levels:** `Lv30`, `Level 30+` in a requirements sentence. Not "lvl 30" or "30+".
- **Items in Title Case** as the game shows them: `Lump of Bomb Steel`, `Clump of Gausebit
  Wildgrass`. Key items get the `Key Item:` prefix on first mention: `Key Item: Dragon Curse Remedy`.
- **Plain hyphens, plain quotes.** ASCII only - no en/em dashes, no smart quotes. The font renders
  them inconsistently and they make grepping the data files miserable.
- **Numbers:** spell out counts under ten in prose ("kill three leeches") but use digits for
  anything the player must count precisely ("100 kills", "6 players", "15 minute limit").
- **No hedging.** "Roughly 3 minutes" is fine when the source is genuinely unclear; "may or may not
  work depending" is not. If it is unknown, say what is known and put the unknown in the ref doc.
- **Never invent a coordinate, a floor id, or an event id.** If the server file and the wiki do not
  give it, use a beam (`locations.lua`) or plain text and record the gap in the job's ref doc.

### 2.1 Item sourcing - never make the player leave the addon
**The whole point of QuestHelper is that nobody opens a wiki mid-quest.** An item named in a step
without a source is a wiki trip, so it is a defect.

Any item the player has to supply gets a source, every time, in this order of preference:

1. **Auction House path**, in the game's own category form:
   `Auction House: [Weapons > Ammo & Misc. > Pet Items]`
   Write the full path exactly as the AH menus read - a category name alone is not enough, since
   the player still has to hunt for it.
2. **Mob source**, with level range, zone and coords, and which one is actually worth camping:
   `Crane Fly (Lv18-21) around the outpost in Meriphataud Mountains (E-5). Best drop rate by a
   wide margin.`
   If several mobs drop it, say which is best and why - "hares also drop it, far less often" saves
   the player a bad decision.
3. **Vendor**, with NPC name, zone and coords.

Give both AH and mob sources when both exist. Buying and farming are different players.

If the item name differs between the drop log, the inventory and the AH, **say so** - that
mismatch is exactly what sends people to a wiki:

    NOTE: The drop is called a clump of gausebit wildgrass in the log, and Gausebit Wildgrass in
    your inventory and on the Auction House. Same item.

Gathering deserves its **own step** ahead of the step that consumes the item, carrying
`items_needed`, `skip_if_have` and a quantity-checked `trigger_on_item_obtain` (see
`step_authoring_guide.md` §2). The step then completes itself however the player sourced the item,
and vanishes for anyone who already had it.

Declare `items_needed` **once**, on the gathering step. `getAllItemsNeeded` sums it across every
step, so repeating it on the consuming step asks the player for double.

### Callout wording
Keep them short and lead with the consequence:

    CRITICAL: Both items go in the SAME trade window. Trading them one at a time does nothing.
    WARNING: Sahagin in Sea Serpent Grotto aggro. Sneak is strongly recommended at Lv30.
    TIP: Home Point Palborough Mines #1 puts you right outside the BCNM.
    NOTE: The ??? goes on a 10 minute cooldown after the NM despawns.

`CAUTION:`, `HINT:`, `Note:`, `Notes:` are **not** part of the vocabulary. They render grey.

---

## 3. Names you reference

Three data files own names, and step text must match them exactly.

| File | Owns | Referenced by |
|---|---|---|
| `data/zones.lua` | display zone names -> zone id | `zone_trigger`, `images.zone_name`, `visual_zones.zone_name`, `kill_requirement.zone` |
| `data/zone_connections.lua` | routing **node** names | `route_to` only |
| `data/locations.lua` | beam targets | `onmob_target` |

### 3.1 The node-vs-zone trap
Multi-map dungeons are split into routing nodes that are **not** in `zones.lua`:

    route_to   = "Palborough Mines 3"   -- zone_connections node
    zone_name  = "Palborough Mines"     -- zones.lua / images / visual_zones

Same for `Korroloka Tunnel 1` / `2`, `Yughott Grotto 1`, `Fei'Yin 1`. Get these backwards and the
route silently fails to resolve. Check both files before typing either.

### 3.2 locations.lua key conventions
- **NPCs: the exact display name.** `["Gumbah"]`, `["Perih Vashai"]`, `["Bki Tbujhja"]`.
  Add `trigger_npc` with the same string.
- **Objects, doors, ???: kebab-case, zone-prefixed, grid-suffixed where it disambiguates.**
  `["palborough-mines-elevator-lever-i8"]`, `["konschtat-forger-qm-d8"]`,
  `["zitah-guardian-treant-qm-l10"]`, `["jeuno-merchants-house-door"]`.
- **Never use a generic entity name as a key.** `["Chocobo"]` would match every bird in the zone,
  because `onmob_target` also resolves display names - hence
  `["upper-jeuno-wounded-chocobo"]`.
- **Coordinates come from the server `!pos` comment**, which maps directly onto
  `target_pos = {x, y, z}`. Do not eyeball them from a map.
- **Moving NPCs** get `onmob_target = "<Name>"` with no `locations.lua` entry (live radar
  highlight), or an entry with `dynamic_pos = true` like `Faurie`. A fixed `target_pos` on a
  patrolling NPC points at where they are not.

### 3.3 Grid coords in text vs beams
A grid square in the text (`(K-8)`) and a beam are different things and you usually want both. When
the server gives you `!pos` but you have no reliable grid square, use the beam and describe the
landmark in words - do **not** guess a square to fill the `destination_highlight` field.

---

## 4. Step skeleton

```lua
{
    text = "Step 3: <imperative sentence with the NPC/target and (X-0)>.\n \n" ..
           "- <supporting detail>\n" ..
           "- <supporting detail that wraps, continued with two spaces>\n" ..
           "  <continuation>\n \n" ..
           "===== Optional section =====\n" ..
           "- <detail>\n \n" ..
           "CRITICAL: <one line, no manual wrapping, consequence first>\n \n" ..
           "TIP: <one line>\n \n",
    onmob_target = "<locations.lua key or display name>",
    route_to = "<zone_connections node>",
    destination_highlight = { position = "K-8", offsetX = 16, offsetY = 16 },
    trigger_on_event_id = { 0 },
},
```

Order the keys that way - text, targeting, routing, trigger - so diffs between files line up.

---

## 5. Checklist

1. First line is `Step N: ` (or `Step N (Tag): `).
2. Callouts are rare - roughly one per 10-20 steps across a file, at most one per step. Everything
   else is a plain `- ` bullet. If it would not make the player fail, it is a bullet.
3. Every callout that survives that test is `CRITICAL:` / `WARNING:` / `TIP:` / `NOTE:` - exact
   case, line start, **no leading bullet**, **no manual `\n` inside it**.
4. No `Note:`, `Notes:`, `CAUTION:`, `HINT:`.
5. Headings are `===== Like This =====`, used only when the step has real sections.
6. Coords as `(K-8)`, levels as `Lv30`, items in Title Case, ASCII punctuation only.
7. `route_to` uses a `zone_connections` node; `zone_name` uses a `zones.lua` name.
8. Every `onmob_target` key exists in `locations.lua` (or is a live display name on purpose).
9. Nothing invented - unknowns are recorded in the job/mission ref doc instead.
10. `state` on every `images` entry equals the step index (see `step_authoring_guide.md` §4).

---

## 6. Known drift - backlog

Measured across `data/**/*.lua` at the time of writing. None of it is broken data; it all renders,
just not in the intended colour.

| Issue | Count | Effect |
|---|---|---|
| Callouts hard-wrapped across `\n` | **126** | second half of the callout renders grey |
| Line starts `Note:` / `Notes:` instead of `NOTE:` | **106** | renders as plain body text |
| Callouts prefixed with `- ` | **15** | no colour at all |
| `CAUTION:` / `HINT:` | 1 | no colour at all |
| Steps carrying **both** `route_to` and `images` | **29** | `images` win, route maps never render (see `step_authoring_guide.md` §3) |

The `route_to` + `images` pairing breaks down as `ChainsOfPromathia.lua` (10), `Windurst.lua` (7),
`SanDoria.lua` (7), `Genkai.lua` (2), and one each in `Zilart.lua`, `Bastok.lua` and
`Quests/Garlaige Citadel.lua`. The job files were cleaned of it; `Paladin.lua` never had it
(images-only, which is the correct dungeon pattern).

The two issues live in almost completely different files, which is worth knowing before starting a
cleanup pass:

**Hard-wrapped callouts** are concentrated in `Limit Breaks/Genkai.lua` (**94**) and in the job
files (`Samurai.lua` 7, `Dark Knight.lua` 7, `Dragoon.lua` 5, `Beastmaster.lua` 4, `Bard.lua` 3,
`Ranger.lua` 1, `Ninja.lua` 1). The mission files are nearly clean - one each in Windurst,
SanDoria and ChainsOfPromathia.

**`Note:` drift** is the opposite: it is almost entirely the mission files -
`Missions/Windurst.lua` (**36**), `ChainsOfPromathia.lua` (26), `Bastok.lua` (14), `Zilart.lua`
(11), `SanDoria.lua` (9) - and barely touches the job files at all.

So the per-nation drift is real, but it is a *vocabulary* drift (`Note:` vs `NOTE:`), while the
hard-wrap problem came in later with Genkai and the job files. Two different cleanups, two
different sets of files.

### Counting these yourself
Naive `grep` gets this wrong: in BRE, `\\n` collapses to `n` and matches correctly-formed
`\n \n"` endings, which inflates the hard-wrap count badly (it reported 185 against a true 126).
Build the backslash with `sprintf("%c", 92)` in awk and compare against the extracted string
literal instead - the working scripts are the ones used to produce this table.
