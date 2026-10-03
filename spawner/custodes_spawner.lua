--[[
  Adeptus Custodes toolkit spawner for Tabletop Simulator
  Spawns detachment rule cards and stratagem decks, army rules, ka'tah stances,
  the ka'tah token (7 states), marker tokens and custom D6s.

  SETUP: upload the custodes_tts_kit folder to a public GitHub repo, then set BASE_URL
  below to that repo's raw address, keeping the slash at the end.
]]

BASE_URL = "https://raw.githubusercontent.com/YOUR_GITHUB_NAME/YOUR_REPO_NAME/main/"

KATAH_TOKEN_COUNT = 6      -- ka'tah tokens spawned per click (one per unit)
DICE_COUNT        = 10     -- dice spawned per click
DICE_FILE         = "dice/custodes_d6_crest.png"   -- or "dice/custodes_d6_spear.png"
TOKEN_SCALE       = 0.6    -- size of spawned tokens
BUTTON_SCALE      = 500    -- if buttons overlap each other, lower this a little

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

MARKERS = {
  {file = "dreadful_foe.png", name = "Dreadful Foe", desc = [==[[E89242][b]ENEMY MARKER[/b][-]  [9C978C]Auric Champions detachment rule[-]

[D6A840][b]Assemblage of Might[/b][-]
In your Command phase, you may name one enemy unit as a dreadful foe unit until the start of your next Command phase. Attacks by friendly [b]ADEPTUS CUSTODES CHARACTER[/b] models against a dreadful foe unit have +1 to wound rolls.

[D6A840][b]DURATION[/b][-]  Until the start of your next Command phase.]==]},
  {file = "prosecuted.png", name = "Prosecuted", desc = [==[[E89242][b]ENEMY MARKER[/b][-]  [9C978C]Null Maiden Vigil stratagem[-]

[D6A840][b]Psy-chaff Volley[/b][-]
Pick one enemy unit hit by those attacks; it is prosecuted until the end of the turn:
• Attacks against a prosecuted unit have +1 AP.

[D6A840][b]DURATION[/b][-]  Until the end of the turn.]==]},
  {file = "gravimetric_grenade.png", name = "Gravimetric Grenade", desc = [==[[E89242][b]ENEMY MARKER[/b][-]  [9C978C]Solar Watch stratagem[-]

Pick one visible enemy unit within 12" of your unit. When that unit declares a charge, it has -1 to charge rolls.]==]},
  {file = "golden_light.png", name = "Golden Light of the Moiraides", desc = [==[[D6A840][b]YOUR UNIT[/b][-]  [9C978C]Dread Host stratagem[-]

Until the start of your next turn:
• Attacks against your unit have -1 to hit rolls.
• Enemy units cannot make snap shooting attacks against your unit.

[D6A840][b]DURATION[/b][-]  Until the start of your next turn.]==]},
  {file = "honoured_interred.png", name = "Honoured Interred (Aura)", desc = [==[[D6A840][b]YOUR UNIT[/b][-]  [9C978C]Might of the Moritoi stratagem[-]

Your unit gains this ability:
[b]Honoured Interred (Aura):[/b] Friendly [b]ADEPTUS CUSTODES[/b] units within 6" of this unit may re-roll hit rolls of 1.]==]},
  {file = "objective_secured.png", name = "Objective Secured", desc = [==[[D6A840][b]OBJECTIVE[/b][-]  [9C978C]Emperor's Chosen and Grav-Assault Force stratagems[-]

[D6A840][b]Impenetrable Bastion[/b][-]
Pick one objective your unit is controlling: that objective is secured.

[D6A840][b]Victory Before Death[/b][-]
Pick one objective that your unit was controlling when it was destroyed and that has no enemy units (excluding [b]AIRCRAFT[/b] units) within range: that objective is secured.]==]},
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
-- Board UI
---------------------------------------------------------------------------
function onLoad()
  -- wait for the board image to load so its size is known, then lay out the buttons
  Wait.condition(function() Wait.frames(buildUI, 3) end,
                 function() return not self.loading_custom end, 20, buildUI)
end

function noop() end

function buildUI()
  self.clearButtons()
  local b  = self.getBoundsNormalized()
  local sc = self.getScale()
  local w, h, th = b.size.x / sc.x, b.size.z / sc.z, b.size.y / sc.y
  if not (w > 0 and h > 0) then w, h, th = 8, 7.2, 0.2 end
  -- the layout is designed on an 8 x 7.2 board and stretched to the real one
  layout = {fx = w / 8, fz = h / 7.2, f = math.min(w / 8, h / 7.2), y = th / 2 + 0.05, halfH = h / 2}

  label("ADEPTUS CUSTODES", -3.0, 0.42, GOLD)
  label("Cards, tokens and dice", -2.58, 0.17, MUTED)
  label("Detachments", -2.05, 0.22, GOLD)

  local cols = {-2.6, 0, 2.6}
  for i, det in ipairs(DETACHMENTS) do
    local fn = "spawnDetachment_" .. i
    _G[fn] = function(obj, color, alt) spawnDetachment(i) end
    local col = ((i - 1) % 3) + 1
    local row = math.floor((i - 1) / 3)
    if i == #DETACHMENTS and #DETACHMENTS % 3 == 1 then col = 2 end   -- centre a lone last button
    button(det.name, fn, cols[col], -1.5 + row * 0.58,
           "Spawn the " .. det.name .. " rule card and stratagem deck")
  end

  label("Army", 1.45, 0.22, GOLD)
  button("Army rules",              "btnArmyRules", cols[1], 2.0,  "Spawn the 4 army rule cards")
  button("Ka'tah stances",          "btnStances",   cols[2], 2.0,  "Spawn the 6 stance cards")
  button("Dice x" .. DICE_COUNT,    "btnDice",      cols[3], 2.0,  "Spawn custom D6s")
  button("Ka'tah tokens x" .. KATAH_TOKEN_COUNT, "btnKatah", cols[1], 2.58, "Spawn ready/stance tokens (keys 1-7 switch state)")
  button("Markers",                 "btnMarkers",   cols[2], 2.58, "Spawn one of each marker token")
  button("Full army kit",           "btnKit",       cols[3], 2.58, "Army rules, stances, tokens, markers and dice")
end

function label(text, z, size, color)
  self.createButton({
    label = text, click_function = "noop", function_owner = self,
    position = {0, layout.y, z * layout.fz}, width = 0, height = 0,
    font_size = size * layout.f * BUTTON_SCALE, font_color = color,
  })
end

function button(text, fn, x, z, tip)
  local f = layout.f * BUTTON_SCALE
  self.createButton({
    label = text, click_function = fn, function_owner = self,
    position = {x * layout.fx, layout.y, z * layout.fz},
    width = 2.3 * f, height = 0.44 * f, font_size = 0.17 * f,
    color = BTN, hover_color = BTN_HOVER, press_color = BTN_PRESS, font_color = GOLD,
    tooltip = tip,
  })
end

---------------------------------------------------------------------------
-- Button handlers
---------------------------------------------------------------------------
function btnArmyRules() spawnArmyRules(1, 1, 0) end
function btnStances()   spawnStances(1, 1, 0) end
function btnDice()      spawnDice(0) end
function btnKatah()     spawnKatahTokens(0) end
function btnMarkers()   spawnMarkers(0) end
function btnKit()
  spawnArmyRules(1, 2, 0)
  spawnStances(2, 2, 0)
  spawnKatahTokens(1)
  spawnMarkers(2)
  spawnDice(3)
end

---------------------------------------------------------------------------
-- Spawning
---------------------------------------------------------------------------
local function url(path) return BASE_URL .. path end

local function T(s)
  s = s or 1
  return {posX = 0, posY = 0, posZ = 0, rotX = 0, rotY = 0, rotZ = 0, scaleX = s, scaleY = 1, scaleZ = s}
end

-- item i of n in a row below the board; spacing is in world units
local function spawnPos(i, n, row, spacing)
  local sc = self.getScale()
  local xl = ((i - (n + 1) / 2) * spacing) / sc.x
  local zl = layout.halfH + (2.6 + row * 3.8) / sc.z
  local p = self.positionToWorld({xl, 0, zl})
  return {p.x, p.y + 1.5, p.z}
end

local function spawnRot()
  return {0, self.getRotation().y, 0}
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
  return spawnObjectJSON({json = JSON.encode(data), position = pos, rotation = spawnRot()})
end

function spawnSingleCard(key, face, back, name, desc, pos)
  local entry = deckEntry(face, back, 1, 1, true)
  local data = cardObj(key, 0, entry, name, desc, true)
  return spawnObjectJSON({json = JSON.encode(data), position = pos, rotation = spawnRot()})
end

local function tokenData(file, name, desc)
  return {Name = "Custom_Token", Transform = T(TOKEN_SCALE), Nickname = name, Description = desc, Tooltip = true,
          ColorDiffuse = {r = 1, g = 1, b = 1},
          CustomImage = {ImageURL = url("tokens/" .. file), ImageSecondaryURL = "", ImageScalar = 1.0, WidthScale = 0.0,
                         CustomToken = {Thickness = 0.2, MergeDistancePixels = 15.0, StandUp = false, Stackable = false}}}
end

function spawnDetachment(i)
  local d = DETACHMENTS[i]
  spawnSingleCard(520 + i, "cards/detachment_rules/" .. d.ruleFile, "cards/detachment_rules/00_detachment_rule_back.png",
                  d.rule, d.name .. " detachment rule", spawnPos(1, 2, 0, 3.2))
  spawnDeck(500 + i, "cards/stratagems/" .. d.sheet, "cards/stratagems/00_card_back.png",
            d.w, d.h, d.cards, d.name .. " stratagems", spawnPos(2, 2, 0, 3.2))
end

function spawnArmyRules(i, n, row)
  spawnDeck(541, "cards/army/army_rules_sheet.png", "cards/army/army_rule_back.png", 3, 2,
            ARMY_RULES, "Army rules", spawnPos(i, n, row, 3.2))
end

function spawnStances(i, n, row)
  spawnDeck(542, "cards/army/stances_sheet.png", "cards/army/stance_back.png", 4, 2,
            STANCES, "Ka'tah stances", spawnPos(i, n, row, 3.2))
end

function spawnKatahTokens(row)
  for t = 1, KATAH_TOKEN_COUNT do
    local first = KATAH_STATES[1]
    local data = tokenData(first.file, first.name, first.desc)
    local states = {}
    for s = 2, #KATAH_STATES do
      local st = KATAH_STATES[s]
      states[tostring(s)] = tokenData(st.file, st.name, st.desc)
    end
    data.States = states
    spawnObjectJSON({json = JSON.encode(data), position = spawnPos(t, KATAH_TOKEN_COUNT, row, 2.2), rotation = spawnRot()})
  end
end

function spawnMarkers(row)
  for m, mk in ipairs(MARKERS) do
    spawnObjectJSON({json = JSON.encode(tokenData(mk.file, mk.name, mk.desc)),
                     position = spawnPos(m, #MARKERS, row, 2.2), rotation = spawnRot()})
  end
end

function spawnDice(row)
  for k = 1, DICE_COUNT do
    local die = spawnObject({type = "Custom_Dice", position = spawnPos(k, DICE_COUNT, row, 1.3), rotation = spawnRot()})
    die.setCustomObject({image = url(DICE_FILE), type = 1})
    die.setName("Custodes D6")
  end
end
