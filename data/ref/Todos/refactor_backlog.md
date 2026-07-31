# Refactor backlog

Nothing here is broken. This is the list of places that have grown awkward, written down while
the reasons are fresh so they can be picked up after the job quests are finished.

Measured after the job-quest commit (~+1815 lines: 993 data, 674 code, 148 docs).

Order is by value-for-effort, best first.

---

## 1. Extract the per-step sub-blocks in `ui_main.lua`
**Cost: ~45 min. No behaviour change.**

The step render loop now carries four sibling blocks, all inline, all the same shape:

    1571  if not st and step_data.kill_requirement then      ~25 lines
    1598  if not st and ... step_data.daily_passwords then    ~20 lines
    1618  if not st and ... step_data.route_choices then      ~96 lines
    1714  if not st and ... step_data.weather_watch then      ~27 lines

That is ~170 lines of drawing inline in a function that already runs ~900, and the route block
reaches 11 levels of indentation. Each new tracker so far has been added by copying its
neighbour.

Pull each into a local `renderKillCounter(step_data, i, ...)` etc., or a
`{field = 'weather_watch', render = fn}` table the loop walks. The loop then reads as a list of
features. This is the single biggest readability win available.

**Signal that it has become urgent:** adding a tracker starts touching more than
`quest_state` + `triggers` + `ui_main` + the data file.

---

## 2. Move `/qh_weather` (and friends) out of the command chain
**Cost: ~30 min. No behaviour change.**

`/qh_weather` is ~146 lines inline inside `questhelper.lua`'s flat
`if command_base == '...' then ... elseif ...` chain, which is itself ~900 lines. The next person
adding a command will copy a 146-line neighbour.

Either give each command a named function in `questhelper.lua`, or move the debug commands into
a `modules/commands.lua` with a `{name = handler}` table. The latter also makes a `/qh help`
listing trivial, which does not exist today.

---

## 3. Make the `T{}` key collision impossible, not just documented
**Cost: ~20 min. Prevents a repeat of a real bug.**

State tables are Ashita `T{}`s whose metatable exposes the table library through `__index`. A key
that shares a helper's name resolves to that *function* and reads as true forever. This shipped:
the SMN tracker's `clear` slot showed DONE regardless of weather and survived every wipe.

Fixed for weather via `quest_state.hasWeatherSeen` (uses `rawget`) and by renaming the key to
`none`, and warned about in `../Contrib/step_authoring_guide.md`. But the trap is still live for any future
state table keyed by author-supplied strings.

Options: have the getters return plain `{}` copies, namespace stored keys (`w:none`), or provide
one shared `stateHas(tbl, key)` helper and forbid direct indexing in review.

---

## 4. `quest_state.lua` public surface
**Cost: judgement, not typing.**

Went 449 -> 618 lines and gained 9 public functions in one commit (5 weather, 3 route choice,
1 flattener). Each is documented, but there is no index - a contributor will not guess that
`hasWeatherSeen` exists and that indexing the table directly is wrong.

A short header comment grouping the API by concern (step state / kill counts / daily / choices /
weather / routing) would cover most of it. Splitting the module is probably overkill.

---

## 5. `.gitattributes`
**Cost: 1 line.**

There isn't one, and git warns about LF -> CRLF on every touched file. Add:

    *.lua text eol=lf
    *.md  text eol=lf

Without it, contributors on other platforms generate whole-file line-ending diffs that bury the
real change.

---

## Not worth doing
- **The route-display nesting in `ui_main.lua` (~line 1436, 13 levels).** Pre-existing, ugly, but
  isolated and working. High risk, no functional payoff.
- **Re-toning `Genkai.lua`.** 129 callouts against a house norm of ~1 per 10-20 steps, and 94
  hard-wrapped ones. It is a big diff on a file that works, and it is not blocking anything.
  See `../Contrib/step_text_style_guide.md` for the counts if it is ever revisited.
