# Summoner
[Unlock] I Can Hear a Rainbow - DONE
[AF1]    The Puppet Master - TODO
[AF]     Evoker's set - TODO
[Hands]  Borghertz's ? Hands - TODO (confirm which is SMN)

Note: this quest drove the new weather_watch tracker AND route_choices (quest_state / triggers /
utils / ui_main / questhelper).

/qh_weather commands:
  (none)          current weather + banked list + whether tracking is ACTIVE
  test            force a capture now, ignoring the item gate
  set <name>      mark one weather as seen - for a player already part-way before installing
  unset <name>    undo a mistyped set
  clear           wipe this mission's banked weather
  clearall        wipe every mission's

set/unset match the slot key first then the label, so "none" and "clear" both find
Clear / Sunshine. An ambiguous fragment reports the candidates instead of guessing, and filling
the last slot by hand ticks the step exactly as a real capture would.

Bug worth remembering: the slot key was `clear`, which collides with a T{} helper method, so
`seen['clear']` returned the FUNCTION and always read as DONE. Key is now `none` and all reads
use rawget via quest_state.hasWeatherSeen.

Confirmed from the server file:
- SEVEN colours. The bitmask loops bits 0-6, and the "lightCounter == 6" check reads 6 only
  because the 7th bit is set after the event update. Do not drop the `clear` slot.
- Ruby must be in INVENTORY. The check is hasItem(CARBUNCLES_RUBY, inventoryLocation.INVENTORY),
  so Mog Satchel does NOT count, contrary to the wikis.
- Sunshine is folded into NONE by the server, same as our WEATHER_ELEMENT map.
- Reward is title Rainbow Weaver + Windurst fame 20. No job-gesture key item.
