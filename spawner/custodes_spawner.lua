--[[ CUSTODES_SPAWNER
  Adeptus Custodes toolkit spawner for Tabletop Simulator (lives on a model)
  Spawns detachment rule cards and stratagem decks, army rules, ka'tah stances,
  the ka'tah token (7 states).

  SETUP: upload the custodes_tts_kit folder to a public GitHub repo, then set BASE_URL
  below to that repo's raw address, keeping the slash at the end.

  AUTO-UPDATE: every time the model loads, it downloads this file from BASE_URL and,
  if the copy on GitHub is different, installs it and reloads. Edit the script on
  GitHub and every copy of the model picks up the change the next time it loads.
]]

BASE_URL = "https://raw.githubusercontent.com/Oliver-Sheaky/Custodes11thCodex/main/"

TOKEN_SCALE       = 0.6    -- size of spawned tokens
TOKEN_THICKNESS   = 0.02   -- thickness of the custom tile tokens (TTS minimum)
PANEL_SCALE       = 1.0    -- size of the button panel (2 = twice as big)
PANEL_HEIGHT      = 0.5    -- how far above the table the buttons float; raise this if they sit below the table
AUTO_UPDATE       = true   -- set to false to freeze this copy of the script
SCRIPT_PATH       = "spawner/custodes_spawner.lua"

---------------------------------------------------------------------------
-- Content (generated from the card files; names show on hover and in deck search)
---------------------------------------------------------------------------
DETACHMENTS = {
  {name = "Auric Champions", rule = "Assemblage of Might", sheet = "01_auric_champions.png", ruleFile = "01_auric_champions_rule.png", w = 2, h = 2,
    cards = {{"Gilded Champion", "Battle Tactic stratagem, 1 CP"}, {"Duty Unto Death", "Battle Tactic stratagem, 1 CP"}}},
  {name = "Honoured Companions", rule = "Companion's Watch", sheet = "02_honoured_companions.png", ruleFile = "02_honoured_companions_rule.png", w = 2, h = 2,
    cards = {{"Emperor's Domain", "Battle Tactic stratagem, 1 CP"}, {"Avenge the Fallen", "Battle Tactic stratagem, 1 CP"}, {"Swift as the Eagle", "Epic Deed stratagem, 1 CP"}}},
  {name = "Emperor's Chosen", rule = "Magna Imperator", sheet = "03_emperors_chosen.png", ruleFile = "03_emperors_chosen_rule.png", w = 2, h = 2,
    cards = {{"Superhuman Focus", "Battle Tactic stratagem, 1 CP"}, {"In Auramite Clad", "Battle Tactic stratagem, 1 CP"}, {"Impenetrable Bastion", "Strategic Ploy stratagem, 1 CP"}}},
  {name = "Guardians of the Throne", rule = "Martial Mastery", sheet = "04_guardians_of_the_throne.png", ruleFile = "04_guardians_of_the_throne_rule.png", w = 4, h = 2,
    cards = {{"Superhuman Focus", "Battle Tactic stratagem, 1 CP"}, {"Unlimited Endurance", "Strategic Ploy stratagem, 1 CP"}, {"Shield of Honour", "Battle Tactic stratagem, 1 CP"}, {"Prime Target", "Strategic Ploy stratagem, 1 CP"}, {"In Auramite Clad", "Battle Tactic stratagem, 1 CP"}, {"Swift as the Eagle", "Epic Deed stratagem, 1 CP"}}},
  {name = "Null Maiden Vigil", rule = "Silent Sisterhood", sheet = "05_null_maiden_vigil.png", ruleFile = "05_null_maiden_vigil_rule.png", w = 2, h = 2,
    cards = {{"Anathema Blademastery", "Battle Tactic stratagem, 1 CP"}, {"Psy-chaff Volley", "Strategic Ploy stratagem, 1 CP"}, {"Purgation Sweep", "Strategic Ploy stratagem, 1 CP"}}},
  {name = "Lions of the Emperor", rule = "On Gilded Wings", sheet = "06_lions_of_the_emperor.png", ruleFile = "06_lions_of_the_emperor_rule.png", w = 2, h = 2,
    cards = {{"Vigil Unending", "Battle Tactic stratagem, 2 CP"}, {"Unleash the Lions", "Strategic Ploy stratagem, 1 CP"}, {"Fury of the Emperor", "Strategic Ploy stratagem, 1 CP"}}},
  {name = "Might of the Moritoi", rule = "Moritoi Ancients", sheet = "07_might_of_the_moritoi.png", ruleFile = "07_might_of_the_moritoi_rule.png", w = 2, h = 2,
    cards = {{"Honoured Interred", "Battle Tactic stratagem, 1 CP"}, {"Unceasing Onslaught", "Strategic Ploy stratagem, 1 CP"}, {"Unstoppable Momentum", "Strategic Ploy stratagem, 1 CP"}}},
  {name = "Grav-Assault Force", rule = "Flare Shields", sheet = "08_grav_assault_force.png", ruleFile = "08_grav_assault_force_rule.png", w = 2, h = 2,
    cards = {{"Victory Before Death", "Battle Tactic stratagem, 1 CP"}, {"Advanced Stabilisers", "Strategic Ploy stratagem, 1 CP"}, {"Inevitable Annihilation", "Strategic Ploy stratagem, 1 CP"}}},
  {name = "Aquilan Shield", rule = "Gilded Guardians", sheet = "09_aquilan_shield.png", ruleFile = "09_aquilan_shield_rule.png", w = 2, h = 2,
    cards = {{"Manoeuvre and Fire", "Strategic Ploy stratagem, 1 CP"}, {"Tip of the Talon", "Strategic Ploy stratagem, 1 CP"}, {"Rapid Reactions", "Epic Deed stratagem, 1 CP"}}},
  {name = "Dread Host", rule = "Instruments of the Emperor's Wrath", sheet = "10_dread_host.png", ruleFile = "10_dread_host_rule.png", w = 2, h = 2,
    cards = {{"Lightning Wrath", "Battle Tactic stratagem, 1 CP"}, {"Golden Light of the Moiraides", "Strategic Ploy stratagem, 2 CP"}, {"Preternatural Rapidity", "Strategic Ploy stratagem, 1 CP"}}},
  {name = "Emissaries Imperatus", rule = "Heralds of the Throne", sheet = "11_emissaries_imperatus.png", ruleFile = "11_emissaries_imperatus_rule.png", w = 2, h = 2,
    cards = {{"Bearers of His Light", "Battle Tactic stratagem, 1 CP"}, {"Slayers of Nightmares", "Battle Tactic stratagem, 1 CP"}, {"Selfless Service", "Epic Deed stratagem, 1 CP"}}},
  {name = "Shadowkeepers", rule = "Wardens of the Dark Cells", sheet = "12_shadowkeepers.png", ruleFile = "12_shadowkeepers_rule.png", w = 2, h = 2,
    cards = {{"Grim Responsibility", "Battle Tactic stratagem, 1 CP"}, {"No Escape", "Epic Deed stratagem, 2 CP"}, {"Indomitable Guardians", "Epic Deed stratagem, 1 CP"}}},
  {name = "Solar Watch", rule = "Talon Sortie", sheet = "13_solar_watch.png", ruleFile = "13_solar_watch_rule.png", w = 2, h = 2,
    cards = {{"Inexorable", "Strategic Ploy stratagem, 1 CP"}, {"At Spear's Length", "Strategic Ploy stratagem, 1 CP"}, {"Gravimetric Grenade", "Epic Deed stratagem, 1 CP"}}},
}

ARMY_RULES = {
  {"Martial Ka'tah", "Army rule"},
  {"Aegis of the Emperor", "Army rule"},
  {"Aquila Commander", "Army rule"},
  {"Daughters of the Abyss", "Army rule"},
}

STANCES = {
  {"Conservai", "Ka'tah stance, Command phase"},
  {"Calistus", "Ka'tah stance, Movement phase"},
  {"Salvus", "Ka'tah stance, Shooting phase"},
  {"Dacatarai", "Ka'tah stance, Fight phase"},
  {"Kaptaris", "Ka'tah stance, Fight phase"},
  {"Rendax", "Ka'tah stance, Fight phase"},
}

-- state 1 is the face the token spawns on; number keys 1-7 switch states
KATAH_STATES = {
  {file = "katah_state1_readied.png", name = "Readied", desc = [==[[68C878][b]READIED[/b][-]  [9C978C]Army rule: Martial Ka'tah[-]

At the start of your Command phase, your units with this ability become readied. A readied unit may use one ka'tah ability below when its timing comes up; using it means the unit is no longer readied. Some characters and stratagems ready a unit again.

[9C978C]Keys 2-7: mark the stance used[-]]==]},
  {file = "katah_state2_conservai.png", name = "Conservai (stance used)", desc = [==[[DA584A][b]STANCE USED[/b][-]  [9C978C]This unit is no longer readied[-]

[D6A840][b]WHEN[/b][-]  Your Command phase.
[D6A840][b]TARGET[/b][-]  One friendly readied unit.
[D6A840][b]EFFECT[/b][-]  Until the end of the turn:
• Being engaged/battle-shocked does not stop your unit being eligible to start an action.
• Starting an action does not stop your unit being eligible to shoot.

[9C978C]Key 1: ready again[-]]==]},
  {file = "katah_state3_calistus.png", name = "Calistus (stance used)", desc = [==[[DA584A][b]STANCE USED[/b][-]  [9C978C]This unit is no longer readied[-]

[D6A840][b]WHEN[/b][-]  Your Movement phase, when a friendly readied unit is selected to move.
[D6A840][b]TARGET[/b][-]  That unit.
[D6A840][b]EFFECT[/b][-]  When it makes a normal/advance/fall-back move, it may move through all types of model.

[9C978C]Key 1: ready again[-]]==]},
  {file = "katah_state4_salvus.png", name = "Salvus (stance used)", desc = [==[[DA584A][b]STANCE USED[/b][-]  [9C978C]This unit is no longer readied[-]

[D6A840][b]WHEN[/b][-]  Your Shooting phase, when a friendly readied unit is selected to shoot.
[D6A840][b]TARGET[/b][-]  That unit.
[D6A840][b]EFFECT[/b][-]  It may ignore modifiers to its BS, and to its hit rolls and wound rolls.

[9C978C]Key 1: ready again[-]]==]},
  {file = "katah_state5_dacatarai.png", name = "Dacatarai (stance used)", desc = [==[[DA584A][b]STANCE USED[/b][-]  [9C978C]This unit is no longer readied[-]

[D6A840][b]WHEN[/b][-]  Start of the Fight phase.
[D6A840][b]TARGET[/b][-]  One friendly readied unit.
[D6A840][b]EFFECT[/b][-]  Its melee attacks against an enemy unit (excluding [b]MONSTER/VEHICLE[/b] units) may re-roll hit rolls of 1.

[9C978C]Key 1: ready again[-]]==]},
  {file = "katah_state6_kaptaris.png", name = "Kaptaris (stance used)", desc = [==[[DA584A][b]STANCE USED[/b][-]  [9C978C]This unit is no longer readied[-]

[D6A840][b]WHEN[/b][-]  Start of the Fight phase.
[D6A840][b]TARGET[/b][-]  One friendly readied unit.
[D6A840][b]EFFECT[/b][-]  Melee attacks against it have -1 to hit rolls.

[9C978C]Key 1: ready again[-]]==]},
  {file = "katah_state7_rendax.png", name = "Rendax (stance used)", desc = [==[[DA584A][b]STANCE USED[/b][-]  [9C978C]This unit is no longer readied[-]

[D6A840][b]WHEN[/b][-]  Fight phase, when a friendly readied unit is selected to fight.
[D6A840][b]TARGET[/b][-]  That unit.
[D6A840][b]EFFECT[/b][-]  Its melee attacks have [EECE80][LETHAL HITS: MONSTER/VEHICLE][-].

[9C978C]Key 1: ready again[-]]==]},
}

---------------------------------------------------------------------------
-- Colours (match the cards)
---------------------------------------------------------------------------
local GOLD      = {0.839, 0.659, 0.251}
local MUTED     = {0.612, 0.592, 0.549}
local BTN       = {0.106, 0.110, 0.133}
local BTN_HOVER = {0.180, 0.172, 0.150}
local BTN_PRESS = {0.420, 0.330, 0.130}
local CLEAR     = {0, 0, 0, 0}

local layout = nil

---------------------------------------------------------------------------
-- Button panel
---------------------------------------------------------------------------
function onLoad()
  if AUTO_UPDATE then checkForUpdate() end
  -- wait for the model to load so its size is known, then lay out the buttons
  Wait.condition(function() Wait.frames(buildUI, 3) end,
                 function() return not self.loading_custom end, 20, buildUI)
end

---------------------------------------------------------------------------
-- Auto-update from GitHub
---------------------------------------------------------------------------
local UPDATE_FLAG = "custodes-spawner-just-updated"

local function normalise(text)
  text = string.gsub(text or "", "\r", "")
  text = string.gsub(text, "%s+$", "")
  return text
end

function checkForUpdate()
  -- straight after an update the model reloads; skip one check so it can never loop
  if self.memo == UPDATE_FLAG then
    self.memo = ""
    return
  end
  local link = BASE_URL .. SCRIPT_PATH .. "?nocache=" .. tostring(os.time())
  WebRequest.get(link, function(req)
    if req.is_error or (req.response_code and req.response_code ~= 200) then return end
    local remote = req.text
    -- only accept a real copy of this script, never an error page
    if not remote or not string.find(remote, "CUSTODES_SPAWNER", 1, true) then return end
    if normalise(remote) ~= normalise(self.getLuaScript()) then
      broadcastToAll("Custodes spawner: installing the latest version from GitHub", GOLD)
      self.memo = UPDATE_FLAG
      self.setLuaScript(remote)
      self.reload()
    end
  end)
end

function noop() end

menuOpen = false

-- The buttons sit on a panel lying on the table just in front of the model. Sizes are in
-- table units and divided by the model's scale, so the panel looks the same whatever the model.
function computeLayout()
  local b  = self.getBoundsNormalized()
  local sc = self.getScale().x
  local u  = PANEL_SCALE / sc                                  -- one layout unit, in local units
  local front = (b.offset.z + b.size.z / 2) / sc               -- front edge of the model
  layout = {
    u  = u,
    x0 = b.offset.x / sc,
    y  = (b.offset.y - b.size.y / 2 + PANEL_HEIGHT) / sc,      -- just above the table
    z0 = front + 0.6 / sc + 3.6 * u,                           -- centre of the 8 x 7.2 panel
  }
  layout.spawnFrom = layout.z0 + 3.6 * u                       -- spawns land in front of the panel
end

function buildUI()
  self.clearButtons()
  computeLayout()
  if not menuOpen then
    button("Open Custodes spawner", "toggleMenu", 0, -3.1, "Show the spawner buttons", 3.4)
    return
  end

  label("ADEPTUS CUSTODES", 0, -3.0, 0.42, GOLD)
  label("Cards and tokens", 0, -2.58, 0.17, MUTED)
  button("Hide", "toggleMenu", 3.0, -3.0, "Hide the spawner buttons", 1.2)

  local cols = {-2.6, 0, 2.6}

  label("Army", 0, -2.05, 0.22, GOLD)
  button("Army rules",     "btnArmyRules", cols[1], -1.5,  "Spawn the 4 army rule cards")
  button("Ka'tah stances", "btnStances",   cols[2], -1.5,  "Spawn the 6 stance cards")
  button("Ka'tah token",   "btnKatah",     cols[3], -1.5,  "Spawn a ready/stance token (keys 1-7 switch state)")
  button("Full army kit",  "btnKit",       cols[2], -0.92, "Army rules, stances and tokens")

  label("Detachments", 0, -0.34, 0.22, GOLD)
  for i, det in ipairs(DETACHMENTS) do
    local fn = "spawnDetachment_" .. i
    _G[fn] = function(obj, color, alt) spawnDetachment(i) end
    local col = ((i - 1) % 3) + 1
    local row = math.floor((i - 1) / 3)
    if i == #DETACHMENTS and #DETACHMENTS % 3 == 1 then col = 2 end   -- centre a lone last button
    button(det.name, fn, cols[col], 0.24 + row * 0.58,
           "Spawn the " .. det.name .. " rule card and stratagem deck")
  end
end

function toggleMenu()
  menuOpen = not menuOpen
  buildUI()
end

-- x and z are in layout units on an 8 x 7.2 grid centred on the panel
local function place(x, z)
  return {layout.x0 + x * layout.u, layout.y, layout.z0 + z * layout.u}
end

function label(text, x, z, size, color)
  self.createButton({
    label = text, click_function = "noop", function_owner = self,
    position = place(x, z), width = 0, height = 0,
    font_size = size * layout.u * 500, font_color = color,
  })
end

function button(text, fn, x, z, tip, w)
  local f = layout.u * 500
  self.createButton({
    label = text, click_function = fn, function_owner = self,
    position = place(x, z),
    width = (w or 2.3) * f, height = 0.44 * f, font_size = 0.17 * f,
    color = BTN, hover_color = BTN_HOVER, press_color = BTN_PRESS, font_color = GOLD,
    tooltip = tip,
  })
end

---------------------------------------------------------------------------
-- Button handlers
---------------------------------------------------------------------------
function btnArmyRules() spawnArmyRules() end
function btnStances()   spawnStances() end
function btnKatah()     spawnKatahTokens() end
function btnKit()
  spawnArmyRules()
  spawnStances()
  spawnKatahTokens()
end

---------------------------------------------------------------------------
-- Spawning
---------------------------------------------------------------------------
local function url(path) return BASE_URL .. path end

local function T(s)
  s = s or 1
  return {posX = 0, posY = 0, posZ = 0, rotX = 0, rotY = 0, rotZ = 0, scaleX = s, scaleY = 1, scaleZ = s}
end

-- item i of n in a row in front of the panel; spacing is in table units
local function spawnPos(i, n, row, spacing)
  if not layout then computeLayout() end
  local sc = self.getScale().x
  local xl = layout.x0 + ((i - (n + 1) / 2) * spacing) / sc
  local zl = layout.spawnFrom + (2.6 + row * 3.8) / sc
  local p = self.positionToWorld({xl, layout.y, zl})
  return {p.x, p.y + 1.5, p.z}
end

local function spawnRot(faceDown)
  return {0, self.getRotation().y, faceDown and 180 or 0}
end

local function deckEntry(face, back, w, h, hidden)
  return {FaceURL = url(face), BackURL = url(back), NumWidth = w, NumHeight = h,
          BackIsHidden = hidden, UniqueBack = false, Type = 0}
end

local function cardObj(key, idx, entry, name, desc, single)
  local cd = {}
  cd[tostring(key)] = entry
  return {Name = single and "CardCustom" or "Card", Transform = T(), Nickname = name, Description = desc or "",
          CardID = key * 100 + idx, CustomDeck = cd, Hands = true, HideWhenFaceDown = true, Tooltip = true,
          ColorDiffuse = {r = 0.713, g = 0.713, b = 0.713}}
end

function spawnDeck(key, face, back, w, h, cards, deckName, pos)
  local entry = deckEntry(face, back, w, h, false)
  local cd = {}
  cd[tostring(key)] = entry
  local ids, objs = {}, {}
  for i, c in ipairs(cards) do
    table.insert(ids, key * 100 + i - 1)
    table.insert(objs, cardObj(key, i - 1, entry, c[1], c[2]))
  end
  local data = {Name = "DeckCustom", Transform = T(), Nickname = deckName, Description = "",
                DeckIDs = ids, CustomDeck = cd, ContainedObjects = objs, Hands = false, Tooltip = true,
                ColorDiffuse = {r = 0.713, g = 0.713, b = 0.713}}
  return spawnObjectJSON({json = JSON.encode(data), position = pos, rotation = spawnRot(true)})
end

function spawnSingleCard(key, face, back, name, desc, pos)
  local entry = deckEntry(face, back, 1, 1, true)
  local data = cardObj(key, 0, entry, name, desc, true)
  return spawnObjectJSON({json = JSON.encode(data), position = pos, rotation = spawnRot(true)})
end

local function tokenData(file, name, desc)
  local img = url("tokens/" .. file)
  return {Name = "Custom_Tile", Transform = T(TOKEN_SCALE), Nickname = name, Description = desc, Tooltip = true,
          ColorDiffuse = {r = 1, g = 1, b = 1},
          CustomImage = {ImageURL = img, ImageSecondaryURL = img, ImageScalar = 1.0, WidthScale = 0.0,
                         CustomTile = {Type = 1, Thickness = TOKEN_THICKNESS, Stackable = false, Stretch = true}}}
end

-- fixed lateral lane per card type, in table units; every spawn of that type lands in the
-- same spot no matter which button or detachment triggered it, so repeats stack into one
-- pile and different types never mix together
local LANES = {rule = -4.8, strat = -1.6, army = 1.6, stance = 4.8}

local function lanePos(lane)
  if not layout then computeLayout() end
  local sc = self.getScale().x
  local xl = layout.x0 + LANES[lane] / sc
  local zl = layout.spawnFrom + 2.6 / sc
  local p = self.positionToWorld({xl, layout.y, zl})
  return {p.x, p.y + 1.5, p.z}
end

function spawnDetachment(i)
  local d = DETACHMENTS[i]
  spawnSingleCard(520 + i, "cards/detachment_rules/" .. d.ruleFile, "cards/detachment_rules/00_detachment_rule_back.png",
                  d.rule, d.name .. " detachment rule", lanePos("rule"))
  spawnDeck(500 + i, "cards/stratagems/" .. d.sheet, "cards/stratagems/00_card_back.png",
            d.w, d.h, d.cards, d.name .. " stratagems", lanePos("strat"))
end

function spawnArmyRules()
  spawnDeck(541, "cards/army/army_rules_sheet.png", "cards/army/army_rule_back.png", 3, 2,
            ARMY_RULES, "Army rules", lanePos("army"))
end

function spawnStances()
  spawnDeck(542, "cards/army/stances_sheet.png", "cards/army/stance_back.png", 4, 2,
            STANCES, "Ka'tah stances", lanePos("stance"))
end

-- TTS only builds a state's image the first time an object switches to it, which is what
-- causes the visible hitch when flipping the ka'tah token; flip through every state once
-- right after spawn so that's already done before a player hits a hotkey mid-game.
local function primeStates(obj, total)
  -- setState() destroys the old object and returns the new state's object,
  -- so the reference has to be threaded through rather than reused
  local function cycle(o, n)
    if o == nil or o.isDestroyed() then return end
    if n > total then
      o.setState(1)
      return
    end
    local nxt = o.setState(n)
    Wait.time(function() cycle(nxt, n + 1) end, 0.15)
  end
  Wait.time(function() cycle(obj, 2) end, 0.15)
end

function spawnKatahTokens()
  local first = KATAH_STATES[1]
  local data = tokenData(first.file, first.name, first.desc)
  local states = {}
  for s = 2, #KATAH_STATES do
    local st = KATAH_STATES[s]
    states[tostring(s)] = tokenData(st.file, st.name, st.desc)
  end
  data.States = states
  local obj = spawnObjectJSON({json = JSON.encode(data), position = spawnPos(1, 1, 0, 2.2), rotation = spawnRot()})
  primeStates(obj, #KATAH_STATES)
end
