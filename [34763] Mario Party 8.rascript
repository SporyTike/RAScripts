// Mario Party 8
// #ID = 34763

//--------------------------------------------------
// Addresses
Mem_GameState              = 0x003051dc
Mem_PlayersInMinigame      = 0x003057c8
Mem_MinigameState          = 0x00272d60
Mem_Player1CharacterID     = 0x0025f6d0
Mem_Player1PartyData       = 0x0025f6f8
Mem_PartyMode1             = 0x0025fb60
Mem_PartyMode2             = 0x0025fd1a
Mem_StarBattleCharacter    = 0x0025fcdd
Mem_StarBattleProgress     = 0x0025fd04
Mem_BoardID                = 0x0025fb68
Mem_CurrentTurn            = 0x0025fb64
Mem_TotalTurns             = 0x0025fb65
Mem_EventFlags             = 0x002602e0
Mem_MinigameUnlockFlags    = 0x0025fdaf
Mem_PointerMinigameData    = 0x00778470
Mem_PointerMinigameTimer   = 0x003051c4

pointerMask = 0x7FFFFFFF

//--------------------------------------------------
// Arrays and Dictionaries

//--------------------------------------------------
// Functions

function notLoadingSave() {
    return !getGameState(0x06)
}

function getGameState(gameStateID) {
    return __ornext(word_be(Mem_GameState + 2) + word_be(Mem_GameState + 6) * 0x10000 == 0xFFFF0000 + gameStateID ||
                    word_be(Mem_GameState + 6) + word_be(Mem_GameState + 2) * 0x10000 == 0xFFFF0000 + gameStateID)
}

function wasInGameState(gameStateID) {
    return once(getGameState(gameStateID) &&
                never(getGameState(0x5C)))
}

function onPartyBoard() {
    return (word_be(Mem_GameState + 2) + word_be(Mem_GameState + 6) * 0x10000 >= 0xFFFF0070 && 
            word_be(Mem_GameState + 2) + word_be(Mem_GameState + 6) * 0x10000 <= 0xFFFF0075) ||
           (word_be(Mem_GameState + 6) + word_be(Mem_GameState + 2) * 0x10000 >= 0xFFFF0070 && 
            word_be(Mem_GameState + 6) + word_be(Mem_GameState + 2) * 0x10000 <= 0xFFFF0075) 
}

function inMinigame() {
    return (word_be(Mem_GameState + 2) + word_be(Mem_GameState + 6) * 0x10000 >= 0xFFFF0009 && 
            word_be(Mem_GameState + 2) + word_be(Mem_GameState + 6) * 0x10000 <= 0xFFFF0054) ||
            word_be(Mem_GameState + 2) + word_be(Mem_GameState + 6) * 0x10000 == 0xFFFF0061 ||
            word_be(Mem_GameState + 2) + word_be(Mem_GameState + 6) * 0x10000 == 0xFFFF0064 ||
           (word_be(Mem_GameState + 6) + word_be(Mem_GameState + 2) * 0x10000 >= 0xFFFF0009 && 
            word_be(Mem_GameState + 6) + word_be(Mem_GameState + 2) * 0x10000 <= 0xFFFF0054) ||
            word_be(Mem_GameState + 6) + word_be(Mem_GameState + 2) * 0x10000 == 0xFFFF0061 ||
            word_be(Mem_GameState + 6) + word_be(Mem_GameState + 2) * 0x10000 == 0xFFFF0064
}

function checkPartyMode(gameMode) {
    if (gameMode == "Party") {
        return bit7(Mem_PartyMode1) == 1
    }
    if (gameMode == "Star Battle") {
        return bit7(Mem_PartyMode1) == 0
    }
}

function checkPartySubMode(partyMode) {
    if (partyMode == "Battle Royale") {
        return bit6(Mem_PartyMode1) == 0 &&
               bit0(Mem_PartyMode2) == 0
    }
    if (partyMode == "Tag Battle") {
        return bit6(Mem_PartyMode1) == 1 &&
               bit0(Mem_PartyMode2) == 0
    }
    if (partyMode == "Duel Battle") {
        return bit6(Mem_PartyMode1) == 0 &&
               bit0(Mem_PartyMode2) == 1
    }
}

function getStarBattleCharacter() {
    return byte(Mem_StarBattleCharacter)
}

function getStarBattleProgress() {
    return high4(Mem_StarBattleProgress)
}

function getTotalPlayersInMinigame() {
    return dword_be(Mem_PlayersInMinigame)
}

function getMinigameUnlockFlag(minigameID) {
    return bit(minigameID % 8, Mem_MinigameUnlockFlags - ((minigameID / 8) % 4) + ((minigameID / 32) * 4))
}

function checkAllMinigameFlags() {
    return 0
         // Duel
         + getMinigameUnlockFlag(0x01)
         + getMinigameUnlockFlag(0x0D)
         + getMinigameUnlockFlag(0x19)
         + getMinigameUnlockFlag(0x1C)
         + getMinigameUnlockFlag(0x1D)
         + getMinigameUnlockFlag(0x1F)
         + getMinigameUnlockFlag(0x26)
         + getMinigameUnlockFlag(0x28)
         + getMinigameUnlockFlag(0x29)
         + getMinigameUnlockFlag(0x2A)
         + getMinigameUnlockFlag(0x2B)
         + getMinigameUnlockFlag(0x2C)
         + getMinigameUnlockFlag(0x2D)
         + getMinigameUnlockFlag(0x2E)
         + getMinigameUnlockFlag(0x2F)
         + getMinigameUnlockFlag(0x30)
         + getMinigameUnlockFlag(0x31)
         + getMinigameUnlockFlag(0x32)
         + getMinigameUnlockFlag(0x33)
         + getMinigameUnlockFlag(0x35)
         + getMinigameUnlockFlag(0x36)
         + getMinigameUnlockFlag(0x37)
         + getMinigameUnlockFlag(0x39)
         + getMinigameUnlockFlag(0x3A)
         + getMinigameUnlockFlag(0x3B)
         + getMinigameUnlockFlag(0x43)
         + getMinigameUnlockFlag(0x45)
         // 1-Vs.-3
         + getMinigameUnlockFlag(0x0F)
         + getMinigameUnlockFlag(0x10)
         + getMinigameUnlockFlag(0x11)
         + getMinigameUnlockFlag(0x12)
         + getMinigameUnlockFlag(0x13)
         + getMinigameUnlockFlag(0x14)
         + getMinigameUnlockFlag(0x15)
         + getMinigameUnlockFlag(0x16)
         + getMinigameUnlockFlag(0x17)
         // 2-Vs.-2
         + getMinigameUnlockFlag(0x09)
         + getMinigameUnlockFlag(0x19)
         + getMinigameUnlockFlag(0x1A)
         + getMinigameUnlockFlag(0x1B)
         + getMinigameUnlockFlag(0x1C)
         + getMinigameUnlockFlag(0x1D)
         + getMinigameUnlockFlag(0x1E)
         + getMinigameUnlockFlag(0x20)
         + getMinigameUnlockFlag(0x21)
         + getMinigameUnlockFlag(0x22)
         // 4-Player
         + getMinigameUnlockFlag(0x00)
         + getMinigameUnlockFlag(0x01)
         + getMinigameUnlockFlag(0x02)
         + getMinigameUnlockFlag(0x03)
         + getMinigameUnlockFlag(0x04)
         + getMinigameUnlockFlag(0x05)
         + getMinigameUnlockFlag(0x06)
         + getMinigameUnlockFlag(0x07)
         + getMinigameUnlockFlag(0x0A)
         + getMinigameUnlockFlag(0x0B)
         + getMinigameUnlockFlag(0x0E)
         + getMinigameUnlockFlag(0x18)
         + getMinigameUnlockFlag(0x1F)
         + getMinigameUnlockFlag(0x23)
         + getMinigameUnlockFlag(0x38)
         + getMinigameUnlockFlag(0x45)
         + getMinigameUnlockFlag(0x4A)
         + getMinigameUnlockFlag(0x4B)
         // Battle
         + getMinigameUnlockFlag(0x0D)
         + getMinigameUnlockFlag(0x24)
         + getMinigameUnlockFlag(0x25)
         + getMinigameUnlockFlag(0x26)
         + getMinigameUnlockFlag(0x27)
         // Challenge
         + getMinigameUnlockFlag(0x46)
         + getMinigameUnlockFlag(0x47)
         + getMinigameUnlockFlag(0x48)
         // Last
         + getMinigameUnlockFlag(0x49)
}

function getMinigameState() {
    return word_be(Mem_MinigameState)
}

function getPlayerCharacterID(playerSlot) {
    return word_be(Mem_Player1CharacterID + 0x0A * playerSlot)
}

function getPlayerPlayerType(playerSlot) {
    return bit5(Mem_Player1PartyData + playerSlot * 0x118 + 0x00)
}

function getPlayerStarAmount(playerSlot) {
    return word_be(Mem_Player1PartyData + playerSlot * 0x118 + 0x38)
}

function getPlayerSpaceID(playerSlot) {
    return word_be(Mem_Player1PartyData + playerSlot * 0x118 + 0x10)
}

function getBoardID() {
    return byte(Mem_BoardID)
}

function get4PlayerMinigameTime() {
    return dword_be((dword_be((dword_be((dword_be(Mem_PointerMinigameTimer) & pointerMask) 
                                                  + 0x00) & pointerMask) 
                                                  + 0x12C) & pointerMask) 
                                                  + 0x30)
}

function get2VS2MinigameTime() {
    return dword_be((dword_be((dword_be((dword_be((dword_be(Mem_PointerMinigameTimer) & pointerMask) 
                                                            + 0x00) & pointerMask) 
                                                            + 0x00) & pointerMask) 
                                                            + 0x12C) & pointerMask) 
                                                            + 0x30)
}

function getMinigameScore_SwingKings(player) {
    player = player - 1
    return dword_be((dword_be((dword_be(Mem_PointerMinigameData) & pointerMask) + 0x5C) & pointerMask) + 0x18 + player * 0x20)
}

function getMinigameHuman_SwingKings(player) {
    player = player - 1
    return dword_be((dword_be((dword_be(Mem_PointerMinigameData) & pointerMask) + 0x5C) & pointerMask) + 0x258 + player * 0x2A0)
}

//--------------------------------------------------
// Achievements
achievement(
    id          = 586749, 
    badge       = "665339",
    type        = "progression",
    title       = "King of the Jungle",
    description = "In the Star Battle Arena on the board \"DK's Treetop Temple\" get 2 Stars and win the match.",
    points      = 5,
    trigger     = checkPartyMode("Star Battle") &&
                  getBoardID() == 0x00 &&
                  getStarBattleProgress() == 0x1 &&
                  prev(getStarBattleProgress()) == 0x0
)

achievement(
    id          = 586750, 
    badge       = "665340",
    type        = "progression",
    title       = "Treasure Chest Hunter",
    description = "In the Star Battle Arena on the board \"Goomba's Booty Boardwalk\" trade 50 Coins with Captain Goomba and win the match.",
    points      = 5,
    trigger     = checkPartyMode("Star Battle") &&
                  getBoardID() == 0x01 &&
                  getStarBattleProgress() == 0x2 &&
                  prev(getStarBattleProgress()) == 0x1
)

achievement(
    id          = 586751, 
    badge       = "665341",
    type        = "progression",
    title       = "A-Maze-Ing Paranormal Investigation",
    description = "In the Star Battle Arena on the board \"King Boo's Haunted Hideaway\" trade 10 Coins with King Boo twice and win the match.",
    points      = 5,
    trigger     = checkPartyMode("Star Battle") &&
                  getBoardID() == 0x02 &&
                  getStarBattleProgress() == 0x3 &&
                  prev(getStarBattleProgress()) == 0x2
)

achievement(
    id          = 586752, 
    badge       = "665342",
    type        = "progression",
    title       = "A Day with a Celebrity",
    description = "In the Star Battle Arena on the board \"Shy Guy's Perplex Express\" give Holly Koopa 50 Coins and win the match.",
    points      = 10,
    trigger     = checkPartyMode("Star Battle") &&
                  getBoardID() == 0x03 &&
                  getStarBattleProgress() == 0x4 &&
                  prev(getStarBattleProgress()) == 0x3
)

achievement(
    id          = 586753, 
    badge       = "665343",
    type        = "progression",
    title       = "Investing for Good",
    description = "In the Star Battle Arena on the board \"Koopa's Tycoon Town\" own hotels worth a total of 4 Stars and win the match.",
    points      = 10,
    trigger     = checkPartyMode("Star Battle") &&
                  getBoardID() == 0x04 &&
                  getStarBattleProgress() == 0x5 &&
                  prev(getStarBattleProgress()) == 0x4
)

achievement(
    id          = 586754, 
    badge       = "665344",
    type        = "progression",
    title       = "Superstar Countdown",
    description = "In the Star Battle Arena on the board \"Bowser's Warped Orbit\" make the opponent lose all their Stars and win the match.",
    points      = 10,
    trigger     = checkPartyMode("Star Battle") &&
                  getBoardID() == 0x05 &&
                  getStarBattleProgress() == 0x5 &&
                  ((__ornext(getPlayerCharacterID(0) == 0x0C ||
                             getPlayerCharacterID(0) == 0x0D) &&
                   getPlayerPlayerType(0) == 1 &&
                   getPlayerStarAmount(0) == 0 && 
                   getPlayerPlayerType(1) == 0 &&
                   getPlayerStarAmount(1) > 0 &&
                   getPlayerSpaceID(1) == 0x27 &&
                   getPlayerSpaceID(1) != prev(getPlayerSpaceID(1))) ||
                   (__ornext(getPlayerCharacterID(1) == 0x0C ||
                             getPlayerCharacterID(1) == 0x0D) &&
                   getPlayerPlayerType(1) == 1 &&
                   getPlayerStarAmount(1) == 0 && 
                   getPlayerPlayerType(0) == 0 &&
                   getPlayerStarAmount(0) > 0 &&
                   getPlayerSpaceID(0) == 0x27 &&
                   getPlayerSpaceID(0) != prev(getPlayerSpaceID(0))))
)

achievement(
    id          = 586755, 
    badge       = "665347",
    type        = "win_condition",
    title       = "A Rod for a Superstar",
    description = "In the Star Battle Arena defeat Bowser and bring back the Star Rod.",
    points      = 5,
    trigger     = checkPartyMode("Star Battle") &&
                  getStarBattleProgress() == 0x6 &&
                  wasInGameState(0x6F) &&
                  getGameState(0x6E)
)

achievement(
    id          = 586788, 
    badge       = "665358",
    type        = "",
    title       = "Blooper Trooper Betrayal",
    description = "Unlock Blooper as a playable character by defeating them in the Star Battle Arena and bringing back the Star Rod.",
    points      = 2,
    trigger     = checkPartyMode("Star Battle") &&
                  getStarBattleProgress() == 0x6 &&
                  wasInGameState(0x6E) &&
                  bit2(Mem_EventFlags + 0x06) > prev(bit2(Mem_EventFlags + 0x06))
)

achievement(
    id          = 586789, 
    badge       = "665367",
    type        = "",
    title       = "Let Bro Join In",
    description = "Unlock Hammer Bro as a playable character by defeating them in the Star Battle Arena and bringing back the Star Rod.",
    points      = 2,
    trigger     = checkPartyMode("Star Battle") &&
                  getStarBattleProgress() == 0x6 &&
                  wasInGameState(0x6E) &&
                  bit3(Mem_EventFlags + 0x06) > prev(bit3(Mem_EventFlags + 0x06))
)

achievement(
    id          = 587253, 
    badge       = "665857",
    type        = "",
    title       = "Bringing Home the Big Twenty",
    description = "Beat the staff record in the minigame \"Swing Kings\" by getting a score of 20.",
    points      = 2,
    trigger     = getGameState(0x0A) &&
                  dword_be(0x0025fdbc) > prev(dword_be(0x0025fdbc)) &&
                  dword_be(0x0025fdbc) >= 20
)

achievement(
    id          = 587316, 
    badge       = "665914",
    type        = "",
    title       = "Flag Pole Enthusiast",
    description = "Beat the staff record in the minigame \"Crank to Rank\" by getting a time of 0\'05\"12 or less.",
    points      = 1,
    trigger     = getGameState(0x0D) &&
                  dword_be(0x0025fdc0) < prev(dword_be(0x0025fdc0)) &&
                  dword_be(0x0025fdc0) > 0 &&
                  dword_be(0x0025fdc0) <= 512 / 2
)

achievement(
    id          = 587922, 
    badge       = "666453",
    type        = "",
    title       = "Chaotic Driver",
    description = "Beat the staff record in the minigame \"Kartastrophe\" by getting a time of 0\'47\"98 or less.",
    points      = 3,
    trigger     = getGameState(0x14) &&
                  dword_be(0x0025fdc4) < prev(dword_be(0x0025fdc4)) &&
                  dword_be(0x0025fdc4) > 0 &&
                  dword_be(0x0025fdc4) <= 4798 / 2
)

achievement(
    id          = 589811, 
    badge       = "668568",
    type        = "",
    title       = "River Raft Chaser",
    description = "Beat the staff record in the minigame \"Lean, Mean Ravine\" by getting a time of 0\'34\"84 or less.",
    points      = 3,
    trigger     = getGameState(0x29) &&
                  dword_be(0x0025fdc8) < prev(dword_be(0x0025fdc8)) &&
                  dword_be(0x0025fdc8) > 0 &&
                  dword_be(0x0025fdc8) <= 3484 / 2
)

achievement(
    id          = 589813, 
    badge       = "668569",
    type        = "",
    title       = "Earth Defence Force",
    description = "Beat the staff record in the minigame \"Saucer Swarm\" by getting a score of 44 or more.",
    points      = 2,
    trigger     = getGameState(0x2F) &&
                  dword_be(0x0025fdcc) > prev(dword_be(0x0025fdcc)) &&
                  dword_be(0x0025fdcc) >= 44
)

achievement(
    id          = 587924, 
    badge       = "666457",
    type        = "",
    title       = "Quick Flicks to the Top",
    description = "Beat the staff record in the minigame \"Rotation Station\" by getting a time of 0\'44\"16 or less.",
    points      = 3,
    trigger     = getGameState(0x43) &&
                  dword_be(0x0025fdd4) < prev(dword_be(0x0025fdd4)) &&
                  dword_be(0x0025fdd4) > 0 &&
                  dword_be(0x0025fdd4) <= 4416 / 2
)

achievement(
    id          = 587923, 
    badge       = "666456",
    type        = "",
    title       = "1080° Blizzard",
    description = "Beat the staff record in the minigame \"Alpine Assault\" by getting a time of 0\'39\"12 or less.",
    points      = 3,
    trigger     = getGameState(0x53) &&
                  dword_be(0x0025fe00) < prev(dword_be(0x0025fe00)) &&
                  dword_be(0x0025fe00) > 0 &&
                  dword_be(0x0025fe00) <= 3912 / 2
)

achievement(
    id          = 589815, 
    badge       = "668570",
    type        = "",
    title       = "Red'y to White'out",
    description = "Beat the staff record in the minigame \"Flagging Rights\" by getting a score of 33 or more.",
    points      = 2,
    trigger     = getGameState(0x46) &&
                  dword_be(0x0025fdd8) > prev(dword_be(0x0025fdd8)) &&
                  dword_be(0x0025fdd8) >= 33
)

achievement(
    id          = 589816, 
    badge       = "668571",
    type        = "",
    title       = "Picture This, Picture That",
    description = "Beat the staff record in the minigame \"Trial by Tial\" by getting a time of 0\'33\"48 or less.",
    points      = 1,
    trigger     = getGameState(0x47) &&
                  dword_be(0x0025fddc) < prev(dword_be(0x0025fddc)) &&
                  dword_be(0x0025fddc) > 0 &&
                  dword_be(0x0025fddc) <= 3348 / 2
)

achievement(
    id          = 589817, 
    badge       = "668572",
    type        = "",
    title       = "Keepin' These Pins Rollin'",
    description = "Beat the staff record in the minigame \"Star Carnival Bowling\" by getting a score of 183 or more in a 10 Frames game.",
    points      = 5,
    trigger     = getGameState(0x48) &&
                  dword_be(0x0025fde4) > prev(dword_be(0x0025fde4)) &&
                  dword_be(0x0025fde4) >= 183
)

achievement(
    id          = 587252, 
    badge       = "665856",
    type        = "",
    title       = "Minigame Maestro",
    description = "Unlock all normal minigames in the Free Play Arcade.",
    points      = 10,
    trigger     = notLoadingSave() &&
                  measured(checkAllMinigameFlags() == 73) &&
                      prev(checkAllMinigameFlags()) <= 72 &&
                      prev(checkAllMinigameFlags()) >= 70
)

//--------------------------------------------------
// Leaderboards

leaderboard(
    id = 157084,
    title       = "Swing Kings", 
    description = "Highest score in the minigame.",
    start  = getGameState(0x0A) &&
             dword_be(0x0025fdbc) > prev(dword_be(0x0025fdbc)),
    cancel = always_false(), 
    submit = always_true(), 
    value  = dword_be(0x0025fdbc),
    format = "Value",
    lower_is_better = false
)

leaderboard(
    id = 157097,
    title       = "Crank to Rank", 
    description = "Fastest time in the minigame.",
    start  = getGameState(0x0D) &&
             dword_be(0x0025fdc0) > 0 &&
             dword_be(0x0025fdc0) < prev(dword_be(0x0025fdc0)),
    cancel = always_false(), 
    submit = always_true(), 
    value  = dword_be(0x0025fdc0) * 2,
    format = "Centisecs",
    lower_is_better = true
)

leaderboard(
    id = 157141,
    title       = "Kartastrophe", 
    description = "Fastest time in the minigame.",
    start  = getGameState(0x14) &&
             dword_be(0x0025fdc4) > 0 &&
             dword_be(0x0025fdc4) < prev(dword_be(0x0025fdc4)),
    cancel = always_false(), 
    submit = always_true(), 
    value  = dword_be(0x0025fdc4) * 2,
    format = "Centisecs",
    lower_is_better = true
)

leaderboard(
    id = 157367,
    title       = "Lean, Mean Ravine", 
    description = "Fastest time in the minigame.",
    start  = getGameState(0x29) &&
             dword_be(0x0025fdc8) > 0 &&
             dword_be(0x0025fdc8) < prev(dword_be(0x0025fdc8)),
    cancel = always_false(), 
    submit = always_true(), 
    value  = dword_be(0x0025fdc8) * 2,
    format = "Centisecs",
    lower_is_better = true
)

leaderboard(
    id = 157368,
    title       = "Saucer Swarm", 
    description = "Highest score in the minigame.",
    start  = getGameState(0x2F) &&
             dword_be(0x0025fdcc) > prev(dword_be(0x0025fdcc)),
    cancel = always_false(), 
    submit = always_true(), 
    value  = dword_be(0x0025fdcc),
    format = "Value",
    lower_is_better = false
)

leaderboard(
    id = 157143,
    title       = "Rotation Station", 
    description = "Fastest time in the minigame.",
    start  = getGameState(0x43) &&
             dword_be(0x0025fdd4) > 0 &&
             dword_be(0x0025fdd4) < prev(dword_be(0x0025fdd4)),
    cancel = always_false(), 
    submit = always_true(), 
    value  = dword_be(0x0025fdd4) * 2,
    format = "Centisecs",
    lower_is_better = true
)

leaderboard(
    id = 157142,
    title       = "Alpine Assault", 
    description = "Fastest time in the minigame.",
    start  = getGameState(0x53) &&
             dword_be(0x0025fe00) > 0 &&
             dword_be(0x0025fe00) < prev(dword_be(0x0025fe00)),
    cancel = always_false(), 
    submit = always_true(), 
    value  = dword_be(0x0025fe00) * 2,
    format = "Centisecs",
    lower_is_better = true
)

leaderboard(
    id = 157369,
    title       = "Flagging Rights", 
    description = "Highest score in the minigame.",
    start  = getGameState(0x46) &&
             dword_be(0x0025fdd8) > prev(dword_be(0x0025fdd8)),
    cancel = always_false(), 
    submit = always_true(), 
    value  = dword_be(0x0025fdd8),
    format = "Value",
    lower_is_better = false
)

leaderboard(
    id = 157370,
    title       = "Trial by Tile", 
    description = "Fastest time in the minigame.",
    start  = getGameState(0x47) &&
             dword_be(0x0025fddc) > 0 &&
             dword_be(0x0025fddc) < prev(dword_be(0x0025fddc)),
    cancel = always_false(), 
    submit = always_true(), 
    value  = dword_be(0x0025fddc) * 2,
    format = "Centisecs",
    lower_is_better = true
)

leaderboard(
    id = 157371,
    title       = "Star Carnival Bowling", 
    description = "Highest score in the minigame with 10 frames.",
    start  = getGameState(0x48) &&
             dword_be(0x0025fde4) > prev(dword_be(0x0025fde4)),
    cancel = always_false(), 
    submit = always_true(), 
    value  = dword_be(0x0025fde4),
    format = "Value",
    lower_is_better = false
)

//--------------------------------------------------
// Rich Presence

characterIDs = {
    0x00: "Mario",
    0x01: "Luigi",
    0x02: "Peach",
    0x03: "Yoshi",
    0x04: "Wario",
    0x05: "Daisy",
    0x06: "Waluigi",
    0x07: "Toad",
    0x08: "Boo",
    0x09: "Toadette",
    0x0A: "Birdo",
    0x0B: "Dry Bones",
    0x0C: "Blooper",
    0x0D: "Hammer Bro"
}

boardIDs = {
    0x00: "DK's Treetop Temple",
    0x01: "Goomba's Booty Boardwalk",
    0x02: "King Boo's Haunted Hideaway",
    0x03: "Shy Guy's Perplex Express",
    0x04: "Koopa's Tycoon Town",
    0x05: "Bowser's Warped Orbit"
}

rich_presence_conditional_display(getGameState(0x5B),
    "Mario and his Friends are entering the Party Tent"
)

rich_presence_conditional_display(wasInGameState(0x5B) && (onPartyBoard() || inMinigame()) && checkPartySubMode("Battle Royale"),
    "{0}, {1}, {2} and {3} are on the board '{4}' [Turn {5}/{6}] [Party] [Battle Royale]",
    rich_presence_lookup(
        "CharacterID",
        getPlayerCharacterID(0),
        characterIDs,
        fallback = characterIDs[0]
    ),
    rich_presence_lookup(
        "CharacterID",
        getPlayerCharacterID(1),
        characterIDs,
        fallback = characterIDs[0]
    ),
    rich_presence_lookup(
        "CharacterID",
        getPlayerCharacterID(2),
        characterIDs,
        fallback = characterIDs[0]
    ),
    rich_presence_lookup(
        "CharacterID",
        getPlayerCharacterID(3),
        characterIDs,
        fallback = characterIDs[0]
    ),
    rich_presence_lookup(
        "BoardID",
        getBoardID(),
        boardIDs,
        fallback = boardIDs[0]
    ),
    rich_presence_value(
        "Number", 
        max_of(measured(byte(Mem_CurrentTurn), when = byte(Mem_CurrentTurn) <= byte(Mem_TotalTurns)),
               measured(byte(Mem_TotalTurns), when = byte(Mem_CurrentTurn) > byte(Mem_TotalTurns))), 
        "VALUE"
    ),
    rich_presence_value(
        "Number", 
        byte(Mem_TotalTurns), 
        "VALUE"
    )
)

rich_presence_conditional_display(wasInGameState(0x5B) && getGameState(0x01) && checkPartySubMode("Battle Royale"),
    "{0}, {1}, {2} and {3} are celebrating a winner [Party] [Battle Royale]",
    rich_presence_lookup(
        "CharacterID",
        getPlayerCharacterID(0),
        characterIDs,
        fallback = characterIDs[0]
    ),
    rich_presence_lookup(
        "CharacterID",
        getPlayerCharacterID(1),
        characterIDs,
        fallback = characterIDs[0]
    ),
    rich_presence_lookup(
        "CharacterID",
        getPlayerCharacterID(2),
        characterIDs,
        fallback = characterIDs[0]
    ),
    rich_presence_lookup(
        "CharacterID",
        getPlayerCharacterID(3),
        characterIDs,
        fallback = characterIDs[0]
    )
)

rich_presence_conditional_display(wasInGameState(0x5B) && (onPartyBoard() || inMinigame()) && checkPartySubMode("Tag Battle"),
    "{0}, {1}, {2} and {3} are on the board '{4}' [Turn {5}/{6}] [Party] [Tag Battle]",
    rich_presence_lookup(
        "CharacterID",
        getPlayerCharacterID(0),
        characterIDs,
        fallback = characterIDs[0]
    ),
    rich_presence_lookup(
        "CharacterID",
        getPlayerCharacterID(1),
        characterIDs,
        fallback = characterIDs[0]
    ),
    rich_presence_lookup(
        "CharacterID",
        getPlayerCharacterID(2),
        characterIDs,
        fallback = characterIDs[0]
    ),
    rich_presence_lookup(
        "CharacterID",
        getPlayerCharacterID(3),
        characterIDs,
        fallback = characterIDs[0]
    ),
    rich_presence_lookup(
        "BoardID",
        getBoardID(),
        boardIDs,
        fallback = boardIDs[0]
    ),
    rich_presence_value(
        "Number", 
        max_of(measured(byte(Mem_CurrentTurn), when = byte(Mem_CurrentTurn) <= byte(Mem_TotalTurns)),
               measured(byte(Mem_TotalTurns), when = byte(Mem_CurrentTurn) > byte(Mem_TotalTurns))), 
        "VALUE"
    ),
    rich_presence_value(
        "Number", 
        byte(Mem_TotalTurns), 
        "VALUE"
    )
)

rich_presence_conditional_display(wasInGameState(0x5B) && getGameState(0x01) && checkPartySubMode("Tag Battle"),
    "{0}, {1}, {2} and {3} are celebrating a winner [Party] [Tag Battle]",
    rich_presence_lookup(
        "CharacterID",
        getPlayerCharacterID(0),
        characterIDs,
        fallback = characterIDs[0]
    ),
    rich_presence_lookup(
        "CharacterID",
        getPlayerCharacterID(1),
        characterIDs,
        fallback = characterIDs[0]
    ),
    rich_presence_lookup(
        "CharacterID",
        getPlayerCharacterID(2),
        characterIDs,
        fallback = characterIDs[0]
    ),
    rich_presence_lookup(
        "CharacterID",
        getPlayerCharacterID(3),
        characterIDs,
        fallback = characterIDs[0]
    )
)

rich_presence_conditional_display(wasInGameState(0x5B) && (onPartyBoard() || inMinigame()) && checkPartySubMode("Duel Battle"),
    "{0} and {1} are on the board '{2}' [Turn {3}/{4}] [Party] [Duel Battle]",
    rich_presence_lookup(
        "CharacterID",
        getPlayerCharacterID(0),
        characterIDs,
        fallback = characterIDs[0]
    ),
    rich_presence_lookup(
        "CharacterID",
        getPlayerCharacterID(1),
        characterIDs,
        fallback = characterIDs[0]
    ),
    rich_presence_lookup(
        "BoardID",
        getBoardID(),
        boardIDs,
        fallback = boardIDs[0]
    ),
    rich_presence_value(
        "Number", 
        max_of(measured(byte(Mem_CurrentTurn), when = byte(Mem_CurrentTurn) <= byte(Mem_TotalTurns)),
               measured(byte(Mem_TotalTurns), when = byte(Mem_CurrentTurn) > byte(Mem_TotalTurns))), 
        "VALUE"
    ),
    rich_presence_value(
        "Number", 
        byte(Mem_TotalTurns), 
        "VALUE"
    )
)

rich_presence_conditional_display(wasInGameState(0x5B) && getGameState(0x01) && checkPartySubMode("Duel Battle"),
    "{0} and {1} are celebrating a winner [Party] [Duel Battle]",
    rich_presence_lookup(
        "CharacterID",
        getPlayerCharacterID(0),
        characterIDs,
        fallback = characterIDs[0]
    ),
    rich_presence_lookup(
        "CharacterID",
        getPlayerCharacterID(1),
        characterIDs,
        fallback = characterIDs[0]
    )
)

rich_presence_conditional_display(getGameState(0x6F),
    "{0} is on the Arena Stage [Star Battle] [👑{1}/6]",
    rich_presence_lookup(
        "CharacterID",
        getStarBattleCharacter(),
        characterIDs,
        fallback = characterIDs[0]
    ),
    rich_presence_value(
        "Number", 
        getStarBattleProgress(), 
        "VALUE"
    )
)

rich_presence_conditional_display(wasInGameState(0x6F) && (onPartyBoard() || inMinigame()),
    "{0} and {1} are on the board '{2}' [Turn {3}] [Star Battle] [👑{4}/6]",
    rich_presence_lookup(
        "CharacterID",
        getPlayerCharacterID(0),
        characterIDs,
        fallback = characterIDs[0]
    ),
    rich_presence_lookup(
        "CharacterID",
        getPlayerCharacterID(1),
        characterIDs,
        fallback = characterIDs[0]
    ),
    rich_presence_lookup(
        "BoardID",
        getBoardID(),
        boardIDs,
        fallback = boardIDs[0]
    ),
    rich_presence_value(
        "Number", 
        max_of(measured(byte(Mem_CurrentTurn), when = byte(Mem_CurrentTurn) <= byte(Mem_TotalTurns)),
               measured(byte(Mem_TotalTurns), when = byte(Mem_CurrentTurn) > byte(Mem_TotalTurns))), 
        "VALUE"
    ),
    rich_presence_value(
        "Number", 
        getStarBattleProgress(), 
        "VALUE"
    )
)

rich_presence_conditional_display(wasInGameState(0x60),
    "{0}, {1}, {2} and {3} are in the Free Play Arcade [Minigames]",
    rich_presence_lookup(
        "CharacterID",
        getPlayerCharacterID(0),
        characterIDs,
        fallback = characterIDs[0]
    ),
    rich_presence_lookup(
        "CharacterID",
        getPlayerCharacterID(1),
        characterIDs,
        fallback = characterIDs[0]
    ),
    rich_presence_lookup(
        "CharacterID",
        getPlayerCharacterID(2),
        characterIDs,
        fallback = characterIDs[0]
    ),
    rich_presence_lookup(
        "CharacterID",
        getPlayerCharacterID(3),
        characterIDs,
        fallback = characterIDs[0]
    )
)

rich_presence_conditional_display(getGameState(0x03),
    "In the Titlescreen"
)

rich_presence_conditional_display(getGameState(0x06),
    "In the File Select"
)

rich_presence_conditional_display(getGameState(0x55),
    "Mario and his Friends are entering the Fun Bazaar"
)

rich_presence_conditional_display(getGameState(0x56),
    "Mario and his Friends are entering the Extras Zone"
)

rich_presence_conditional_display(getGameState(0x57),
    "Mario and his Friends are entering the Minigame Tent"
)

rich_presence_conditional_display(getGameState(0x59) || getGameState(0x5A),
    "{0} is in the Fun Bazaar",
    rich_presence_lookup(
        "CharacterID",
        getPlayerCharacterID(0),
        characterIDs,
        fallback = characterIDs[0]
    )
)

rich_presence_conditional_display(getGameState(0x5C),
    "Mario and his Friends are wandering around at the Star Carnival"
)

rich_presence_conditional_display(getGameState(0x5D),
    "Mario and his Friends are entering the Star Battle Arena"
)

rich_presence_conditional_display(getGameState(0x76) && checkPartySubMode("Battle Royale"),
    "Mario and his Friends are learning about the Battle Royale Rules"
)

rich_presence_conditional_display(getGameState(0x76) && checkPartySubMode("Tag Battle"),
    "Mario and his Friends are learning about the Tag Battle Rules"
)

rich_presence_conditional_display(getGameState(0x76) && checkPartySubMode("Duel Battle"),
    "Mario and his Friends are learning about the Duel Battle Rules"
)

rich_presence_display(
    "Mario and his Friends are wandering around at the Star Carnival"
)