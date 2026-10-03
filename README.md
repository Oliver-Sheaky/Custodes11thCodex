# Adeptus Custodes toolkit for Tabletop Simulator
 
Everything in this folder is loaded by `spawner/custodes_spawner.lua` straight from this repo,
so anyone who loads the spawner sees the same cards, tokens and dice.
 
## Folder layout
- `cards/stratagems/` - one stratagem sheet per detachment, plus the shared back
- `cards/detachment_rules/` - one rule card per detachment, plus the shared back
- `cards/army/` - army rules and ka'tah stance sheets and their backs
- `tokens/` - ka'tah token states (1 readied, 2-7 stances) and marker tokens
- `dice/` - D6 textures (crest and spear versions)
- `spawner/` - the board image and the Lua script
## Setup
1. Upload this whole folder to a public GitHub repo, keeping the subfolders.
2. In `spawner/custodes_spawner.lua`, set `BASE_URL` to
   `https://raw.githubusercontent.com/<your name>/<repo>/main/` (keep the final slash).
3. In TTS: Objects > Components > Custom > Tile. For the image, paste the raw URL of
   `spawner/spawner_board.png` and import.
4. Right-click the board > Scripting > Scripting Editor, paste the script into the board's tab,
   then Save & Play.
5. Right-click the board > Save Object. Share the saved object file with friends,
   or keep it in your chest.
TTS caches images by URL. If you replace an image in the repo, give it a new file name
(and update the script) so players don't keep seeing the old one.
