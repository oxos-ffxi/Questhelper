
# QuestHelper Addon

QuestHelper is an Ashita v4 addon for Final Fantasy XI that guides you through quests, missions, and other content step-by-step. It draws routes and highlights directly into the game world and onto in-game maps, and advances steps automatically as you play — talk to the right NPC, obtain a key item, zone in, or defeat a target, and the guide moves on.

Guides are written in a readable Lua format, so anyone can extend or add their own.

**Current release: v0.1** — first public release. Mission content is authored end-to-end and is being verified server-by-server; expect some rough edges (see [Content](#content)).

## Showcase

https://github.com/user-attachments/assets/265b56bf-0233-4322-b043-6df8b3daf903

<img width="2186" height="777" alt="questhelpergit1" src="https://github.com/user-attachments/assets/b302d260-a1e5-474e-ae17-03193ce309dc" />

<img width="1731" height="797" alt="questhelpergit2" src="https://github.com/user-attachments/assets/50b4347e-3eb0-4078-a466-ef592beeb1d7" />


---

## Features

**Tracking & UI**
- Content organised by category (Missions, Quests, Jobs, NMs) and broken into ordered steps.
- Per-step completion with automatic detection, plus manual override when you need it.
- Prerequisite chains between missions/quests, including "choose one" groups and optional/recommended entries.
- A level-ordered **Progression guide** that stitches the separate chains into one "what next" list.
- Requirement checks shown live where possible — main-job level, and Fame captured from reputation NPC dialogue.

**In-world guidance**
- Live map rendering pulled from the game's own DAT files, with per-floor maps for dungeons.
- Routes, arrows, squares and lines drawn into the 3D world and onto the map to point you where to go.
- Target beams to specific NPCs (via OnMob), resolved to the correct entity rather than fixed coordinates.
- Zone-to-zone **pathfinding** with floor awareness and death/backtrack recovery across split entrances.

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

- **Nation Missions** — San d'Oria, Bastok, and Windurst, full chains (Rank 1-1 through 9-2).
- **Rise of the Zilart** — full chain.
- **Chains of Promathia** — full chain.
- **Quests** — a selection of key/enabler quests (Tenshodo membership, Kazham airship pass, and others).
- **Custom** — sample entries and a feature-demo file for authors.

Work in progress (not ready for v0.1):
- **Jobs** — Dancer and Paladin unlock quests are on the current format but not yet verified; the remaining unlockable jobs are scaffolded stubs to be authored later.
- **NMs** — sample entries (South Gustaberg) on the current format, not yet verified.

> v0.1 note: the mission chains are the focus of this release. They are authored end-to-end, and in-game sign-off is ongoing. The Rise of the Zilart chain was built on a live server without GM commands, so it may need the most polishing.

---

## Installation

1. Place the `QuestHelper` folder in the `addons` directory of your Ashita v4 installation.
2. Load it in-game with `/addon load questhelper` (or add it to your startup script).
3. Toggle the window with `/questhelper`.

Guide data lives in `addons/QuestHelper/data/` as `.lua` files — drop new files in the matching category folder and they are picked up automatically.

---

## Commands

Player commands:

| Command | Description |
| --- | --- |
| `/questhelper` | Toggle the main window. |
| `/qh_find <item>` | Locate an item across your inventory and storage. |
| `/qh_validate` | Validate the loaded guide data for broken zone/map references. |
| `/qh_pos [x] [y]` | Reset the map window position (defaults to 100, 100). |
| `/qh_day` | Show the current Vana'diel day (used by password-gated steps). |

A wider debug suite is also available (`/qh_debug`, `/qh_verbose`, `/qh_trigger`, `/qh_checkfloor`, `/qh_mapinfo`, `/qh_keyitems`, `/qh_buffs`, `onmob_*`, and more) for authoring and testing guides.

---

## Authoring Your Own Guides

Guides are plain Lua tables describing steps and their triggers. Each step can carry text, map images, in-world `visual_zones`, an NPC target, and one or more completion triggers.

See:
- `data/ref/step_authoring_guide.md` — rules for turning a walkthrough + server Lua into steps.
- `modules/README.md` — module architecture and the addon's internals.
- `data/Custom/FeatureDemo.lua` — a worked example covering the common fields.

---

## Credits and Thanks

This addon wouldn't have been possible without the incredible work and support from the Ashita community. Special thanks to:

### Core Contributors

- **[Atom0s](https://github.com/atom0s)** - Floor ID detection and Texture loading code samples via Ashita Discord
- **[Thorny](https://github.com/ThornyFFXI)** - Key items packet handling, and Ashita development support via Ashita Discord
- **[Loonsies](https://github.com/loonsies/boussole)** - DAT map loading implementation from [Boussole](https://github.com/loonsies/boussole)
  - Map table memory scanning and signature detection
  - ImageHeader structure and bitmap/DXT parsing
  - DXT texture decompression support
  - DAT index calculation from map entries

### Additional References

- **[MalRD](https://github.com/MalRD/)** - Item finding and inventory reference code
- **[Jyouya/Will](https://github.com/Jyouya/targetlines)** - Target lines base code references used to draw from player -> NPC.

### Content Sources

- **[FFXIclopedia](https://ffxiclopedia.fandom.com/)** - Mission and quest walkthrough content adapted from FFXIclopedia, licensed under [CC-BY-SA 3.0](https://creativecommons.org/licenses/by-sa/3.0/)

---

## License

QuestHelper is licensed under the **MIT License**. See [LICENSE](LICENSE) for details.

**Mission Walkthrough Content**: Adapted from [FFXIclopedia](https://ffxiclopedia.fandom.com/) and licensed under [CC-BY-SA 3.0](https://creativecommons.org/licenses/by-sa/3.0/).

This project uses code and techniques from various open-source projects in the FFXI community. All original authors are credited above. Please respect their licenses and contributions.

If you use this code, please maintain these credits - Thank you! - Oxos
