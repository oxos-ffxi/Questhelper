# data/ref

Reference notes. None of this is loaded by the addon - it is here so the next person (or the next
you) does not have to re-derive it from the server scripts.

    Contrib/    how to write content - read these before authoring
    Jobs/       one file per job: what is done, what is left, and the gotchas
    Missions/   one file per mission chain, same idea
    Todos/      known work not yet done

## Contrib
- `step_authoring_guide.md` - mechanics. Triggers, maps, routing, item checks, the fields a step
  can carry and which ones fight each other.
- `step_text_style_guide.md` - prose. The renderer parses step text, so the wording rules are an
  input format, not taste.

Read the authoring guide first; the style guide assumes it.

## Jobs / Missions
Short status lists, not walkthroughs - the walkthrough lives in the data file. These exist to
record what a future contributor cannot see from the code: which quests are done, which server
file a quest actually lives in, and the traps that cost an hour to find the first time.

Keep them terse. If a note is longer than the thing it describes, it belongs in the data file's
header comment instead.

## Todos
- `refactor_backlog.md` - places that have grown awkward, ranked by value-for-effort, with the
  reasoning recorded while it was fresh. Also lists what is deliberately *not* worth doing.
