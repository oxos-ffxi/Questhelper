
# QuestHelper Addon

QuestHelper is an Ashita v4 addon for Final Fantasy XI that guides you through quests, missions, and other content step-by-step. It draws routes and highlights directly into the game world and onto in-game maps, and advances steps automatically as you play - talk to the right NPC, obtain a key item, zone in, or defeat a target, and the guide moves on.

Guides are written in a readable Lua format, so anyone can extend or add their own.

**Current release: v0.1** - first public release. Nation missions, Rise of the Zilart, Chains of Promathia, all nine advanced job unlocks and the Support Job quest are authored end-to-end and are being verified server-by-server; expect some rough edges (see [Content](#content)).

## Showcase

**Create guides for quests by drawing arrows/squares to help navigate the player**
<img width="1595" height="900" alt="image" src="https://github.com/user-attachments/assets/1a822ef4-e34c-47fb-a61a-713a6b3335bc" />

**Routing and Quest markers, with items and keyitem tracking**
<img width="1452" height="1022" alt="image" src="https://github.com/user-attachments/assets/c6869bbe-c0e9-424a-9eac-60ce9fc4e6df" />
<img width="1635" height="722" alt="image" src="https://github.com/user-attachments/assets/d9aa6156-f5ab-493b-a5f2-abda92bfacbe" />


**Some help with the moutain...**


https://github.com/user-attachments/assets/9adad046-2d7d-4914-a8d2-8087700cd908




**Syncs to your characters quest/mission progress automagically**
<img width="982" height="971" alt="image" src="https://github.com/user-attachments/assets/a5f7ca87-79be-4871-ba0b-e5a2548b0810" />

---

## Features

**Tracking & UI**
- Content organised by category (Missions, Quests, Jobs, NMs) and broken into ordered steps.
- Per-step completion with automatic detection, plus manual override when you need it.
- Prerequisite chains between missions/quests, including "choose one" groups and optional/recommended entries.
- A level-ordered **Progression guide** that stitches the separate chains into one "what next" list.
- Requirement checks shown live where possible - main-job level, and Fame captured from reputation NPC dialogue.

**In-world guidance**
- Live map rendering pulled from the game's own DAT files, with per-floor maps for dungeons.
- Routes, arrows, squares and lines drawn into the 3D world and onto the map to point you where to go.
- Target beams to specific NPCs (via OnMob), resolved to the correct entity rather than fixed coordinates.
- Marker icons that say what an NPC is *for* at a glance - `!` to start, `?` to hand in, a speech bubble for talk-only, or the **actual in-game icon of the item** you need to trade, several side by side when a step wants more than one.
- Zone-to-zone **pathfinding** with floor awareness and death/backtrack recovery across split entrances.
- **Route choices** for steps valid in several places, so the guide offers the options (rate vs. proximity, night-only vs. any-time) and lets you pick rather than deciding for you.

**Automatic step triggers**
- Dialogue text, event/cutscene IDs, item obtain, key-item obtain (single or "need all").
- Zone entry, walk-through trigger zones (box and line), and kill requirements (with party-kill credit).
- Buff/status checks, and time-of-day aware content (e.g. Vana'diel daily-password capture for Castle Oztroja).

**Inventory & items**
- Key items you have vs. still need, shown per mission.
- Items needed with quantity, inventory/storage location lookup, and `optional` / pick-up-on-the-way flags.

**Authoring & debugging**
- A built-in validator that flags broken zone/map references (handy after renaming a zone).
- A debug UI and command suite for teleport-testing, triggering steps, checking floor IDs, and inspecting maps.

---

## Content

Included guide data (`data/`):

- **Nation Missions** - San d'Oria, Bastok, and Windurst, full chains (Rank 1-1 through 9-2).
- **Rise of the Zilart** - full chain.
- **Chains of Promathia** - full chain.
- **Jobs** - unlock quests for all nine advanced jobs: Bard, Beastmaster, Dark Knight, Dragoon, Ninja, Paladin, Ranger, Samurai and Summoner. Paladin also carries its full artifact chain through to Borghertz's Stalwart Hands.
- **Support Job** - Elder Memories (Selbina) and The Old Lady (Mhaura), the two mutually exclusive halves of the subjob unlock.
- **Quests** - a selection of key/enabler quests (Tenshodo membership, Kazham airship pass, and others).
- **Custom** - sample entries and a feature-demo file for authors.

Work in progress (not ready for v0.1):
- **NMs** - sample entries (South Gustaberg) on the current format, not yet verified.
- Advanced-job quests beyond the unlocks (artifact armour) exist only for Paladin so far.

> v0.1 note: the mission chains are the focus of this release. They are authored end-to-end, and in-game sign-off is ongoing. The Rise of the Zilart chain was built on a live server without GM commands, so it may need the most polishing.
>
> Job unlocks were authored against the server's own quest scripts, so their triggers and event IDs are accurate; where a level requirement comes from a server *setting* rather than a hard-coded number (the advanced jobs use `ADVANCED_JOB_LEVEL`, the subjob quest `SUBJOB_QUEST_LEVEL`), the guide shows the retail default and a retuned server may differ. Notes on every quest live in `data/ref/`.

---

## Roadmap

**v0.2**
- **Artifact armour quests** for the remaining advanced jobs, following the Paladin chain already in v0.1.
- **Common enabler quests for Chains of Promathia and Zilart** - the quests those two mission chains depend on, and nothing wider.
- **Quest marker icons rolled out across all existing content.** The vocabulary shipped in v0.1 but is only applied to the newest entries; everything else still draws the default `!`.

---

## Installation

**Recommended - clone it.** The folder gets the right name automatically, and updating later is just `git pull`:

```
cd "<your Ashita folder>/addons"
git clone https://github.com/oxos-ffxi/QuestHelper.git
```

**Or download the ZIP** from the green **Code** button. GitHub names the archive after the branch, so rename the extracted folder before using it:

> `QuestHelper-main` → `QuestHelper`

Ashita loads an addon from `addons/<name>/<name>.lua`, so the folder name has to match the `.lua` inside it. That applies to every Ashita addon, not just this one - it is why cloning is the easier route.

Then:

1. Check the folder sits at `<Ashita>/addons/QuestHelper/`.
2. Load it in-game with `/addon load questhelper` (or add it to your startup script).
3. Toggle the window with `/questhelper`.

Guide data lives in `addons/QuestHelper/data/` as `.lua` files - drop new files in the matching category folder and they are picked up automatically.

### Ashita compatibility

Runs on **Ashita 4.2 and 4.3**, tested on both.

4.3 moved to ImGui 1.92, which removed `SetWindowFontScale` and changed the argument lists of `BeginChild` and `Image`. Addons that call those unguarded fail on `d3d_present` and get unloaded - `attempt to call field 'SetWindowFontScale' (a nil value)`, or `sol: no matching function call takes this number of arguments`. QuestHelper detects the interface version at load and calls the right shape for the build it is on, so a single copy works either way.

> One known gap on 4.3: font scaling is skipped, so the **UI Scale** setting resizes windows but not text. At the default scale of 1.0 there is no visible difference. Everything else - maps, opacity, scrolling panes - works on both.

The version it detected is printed in the load banner (`Ashita interface 4.3`); please include that line in any bug report.

---

## Commands

Player commands:

| Command | Description |
| --- | --- |
| `/questhelper` | Toggle the main window. |
| `/qh_find <item>` | Locate an item across your inventory and storage. |
| `/qh_item <item>` | Show what the game's own resources hold for an item - level, jobs, stats, icon. Useful when authoring reward entries or marker icons. |
| `/qh_validate` | Validate the loaded guide data for broken zone/map references. |
| `/qh_pos [x] [y]` | Reset the map window position (defaults to 100, 100). |
| `/qh_day` | Show the current Vana'diel day (used by password-gated steps). |

A wider debug suite is also available (`/qh_debug`, `/qh_verbose`, `/qh_trigger`, `/qh_checkfloor`, `/qh_mapinfo`, `/qh_keyitems`, `/qh_buffs`, `onmob_*`, and more) for authoring and testing guides.

---

## Authoring Your Own Guides

Guides are plain Lua tables describing steps and their triggers. Each step can carry text, map images, in-world `visual_zones`, an NPC target, and one or more completion triggers.

See:
- `data/ref/Contrib/step_authoring_guide.md` - rules for turning a walkthrough + server Lua into steps.
- `modules/README.md` - module architecture and the addon's internals.
- `data/Custom/FeatureDemo.lua` - a worked example covering the common fields.

---

## Credits and Thanks

This addon wouldn't have been possible without the incredible work from the Ashita community. Special thanks to:

- **[Atom0s](https://github.com/atom0s)** - Floor ID detection and Texture loading code samples via Ashita Discord
- **[Thorny](https://github.com/ThornyFFXI)** - Key items packet handling code examples via Ashita Discord
- **[Loonsies](https://github.com/loonsies/boussole)** - DAT map loading implementation from [Boussole](https://github.com/loonsies/boussole)
  - Map table memory scanning and signature detection
  - ImageHeader structure and bitmap/DXT parsing
  - DXT texture decompression support
  - DAT index calculation from map entries

### AI Assistance

The design and architecture are mine - what the addon does, how the pieces tie together, and how a guide is structured. **Claude** (Anthropic) was used to help build the backend against that design - the modules behind map parsing, trigger detection and the UI - along with refactoring, debugging, and documentation, including much of this README. It has been used across the code, the guide data and these docs.

What it did not do is the playing. Every mission and quest entry in here has been run in-game, by me: steps triggered, NPC positions tracked down, and every route co-ordinate plotted by hand from actually standing on the spot. That is why it took so bloody long, and it is the part no assistance did for me - FFXI exposes no quest data, so all of it has to be done manually and with a custom amount of steps per entry.

The data behind it is sourced rather than recalled, too. Event IDs, key item IDs, trade orders and level gates are read out of **LandSandBoat's server scripts**; walkthrough text is adapted from **FFXIclopedia**; map data is parsed from the game's own DAT files.

### Additional References

- **[MalRD](https://github.com/MalRD/)** - Item finding and inventory reference code
- **[Jyouya/Will](https://github.com/Jyouya/targetlines)** - Target lines base code references used to draw from player -> NPC.

### Content Sources

- **[LandSandBoat](https://github.com/LandSandBoat/server)** - For the sandbox to test in, and for the mission and quest scripts to read. Nearly every trigger in this addon - event IDs, key item IDs, trade orders, the level gates - was taken from those scripts rather than guessed at, which is the only reason steps advance when they should. Thank you.
- **[FFXIclopedia](https://ffxiclopedia.fandom.com/)** - Mission and quest walkthrough content adapted from FFXIclopedia, licensed under [CC-BY-SA 3.0](https://creativecommons.org/licenses/by-sa/3.0/)

---

## License

QuestHelper is licensed under the **MIT License**. See [LICENSE](LICENSE) for details.

**Mission Walkthrough Content**: Adapted from [FFXIclopedia](https://ffxiclopedia.fandom.com/) and licensed under [CC-BY-SA 3.0](https://creativecommons.org/licenses/by-sa/3.0/).

This project uses code and techniques from various open-source projects in the FFXI community. All original authors are credited above. Please respect their licenses and contributions.

If you use this code, please maintain these credits - Thank you! - Oxos
