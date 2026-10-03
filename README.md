# Adeptus Custodes toolkit for Tabletop Simulator

Everything in this folder is loaded by `spawner/custodes_spawner.lua` straight from this repo,
so anyone who loads the spawner sees the same cards and tokens. The script lives on a 3D
model (not a board tile) and spawns a button panel beside it.

## Folder layout
- `cards/stratagems/` - one stratagem sheet per detachment, plus the shared back
- `cards/detachment_rules/` - one rule card per detachment, plus the shared back
- `cards/army/` - army rules and ka'tah stance sheets and their backs
- `tokens/` - ka'tah token states (1 readied, 2-7 stances)
- `spawner/` - the Lua script

## Setup
1. Upload this whole folder to a public GitHub repo, keeping the subfolders.
2. In `spawner/custodes_spawner.lua`, set `BASE_URL` to
   `https://raw.githubusercontent.com/<your name>/<repo>/main/` (keep the final slash).
3. In TTS, get the model you want the spawner to live on onto the table (e.g. a Custodes
   miniature).
4. Right-click the model > Scripting > Scripting Editor, paste the script into the model's
   tab, then Save & Play.
5. Right-click the model > Save Object. Share the saved object file with friends,
   or keep it in your chest.

The model loads with its menu collapsed to a single "Open Custodes spawner" button; click it
to reveal the full panel (Army rules/stances/token/kit, then the 13 detachments). Cards and
decks spawn face down so their back design shows which type they are, and repeated spawns of
the same card type stack into one pile.

TTS caches images by URL. If you replace an image in the repo, give it a new file name
(and update the script) so players don't keep seeing the old one.
