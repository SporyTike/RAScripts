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
Mem_PartyPlayerControlling = 0x0025fb6a
Mem_StarBattleCharacter    = 0x0025fcdd
Mem_StarBattleProgress     = 0x0025fd04
Mem_CeremonyData           = 0x007737a4
Mem_BoardID                = 0x0025fb68
Mem_CurrentTurn            = 0x0025fb64
Mem_TotalTurns             = 0x0025fb65
Mem_CurrentPlayerPlaying   = 0x0025fb6a
Mem_EventFlags             = 0x002602e0
Mem_MinigameUnlockFlags    = 0x0025fdaf
Mem_PointerMinigameData    = 0x00778470
Mem_PointerMinigameTimer   = 0x003051c4
Mem_KingBooMansionMapFlags = 0x0025fbbc
Mem_ExpressCarOrder        = 0x0025fba8
Mem_KoopaHotelInvestments  = 0x0025fba8
Mem_BowserBoardDirection   = 0x0025fba8
Mem_CrownShowdownDynamic   = 0x007781a8

pointerMask = 0x7FFFFFFF

//--------------------------------------------------
// Arrays and Dictionaries

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
    0x0D: "Hammer Bro",
    0x0E: "Mii"
}

boardIDs = {
    0x00: "DK's Treetop Temple",
    0x01: "Goomba's Booty Boardwalk",
    0x02: "King Boo's Haunted Hideaway",
    0x03: "Shy Guy's Perplex Express",
    0x04: "Koopa's Tycoon Town",
    0x05: "Bowser's Warped Orbit"
}

extraZoneLocations = {
    0x00: "Lobby",
    0x45: "'Table Menace'",
    0x46: "'Flagging Rights'",
    0x47: "'Trial by Tile'",
    0x48: "'Star Carnival Bowling'",
    0x49: "'Puzzle Pillars'",
    0x4A: "'Canyon Cruisers'",
    0x4B: "'Chomping Frenzy'",
    0x4C: "'Moped Mayhem'",
}

//--------------------------------------------------
// Functions

function notLoadingSave() {
    return !getGameState(0x06)
}

function getGameState(gameStateID) {
    return __ornext(word_be(Mem_GameState + 2) + word_be(Mem_GameState + 6) * 0x10000 == 0xFFFF0000 + gameStateID ||
                    word_be(Mem_GameState + 6) + word_be(Mem_GameState + 2) * 0x10000 == 0xFFFF0000 + gameStateID)
}

function getGameStateID() {
    return dword_be(Mem_GameState)
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

function getPlayerIsDoingTurn() {
    return byte(Mem_PartyPlayerControlling) == prev(byte(Mem_PartyPlayerControlling)) &&
           byte(Mem_PartyPlayerControlling) <= 3
}

function getPartyPlayerChanging() {
    return byte(Mem_PartyPlayerControlling) != prev(byte(Mem_PartyPlayerControlling))
}

function getTotalPlayersInMinigame() {
    return dword_be(Mem_PlayersInMinigame)
}

function getMinigameUnlockFlag(minigameID) {
    return bit(minigameID % 8, Mem_MinigameUnlockFlags - ((minigameID / 8) % 4) + ((minigameID / 32) * 4))
}

function getPlayerCharacterID(playerSlot) {
    return word_be(Mem_Player1CharacterID + playerSlot * 0x0A)
}

function getCurrentPlayerCharacterID() {
    return word_be(Mem_Player1CharacterID + byte(Mem_CurrentPlayerPlaying) * 0x0A)
}

function getPlayerControlType(playerSlot) {
    return bit5(Mem_Player1PartyData + playerSlot * 0x118)
}

function getCurrentPlayerControlType() {
    return bit5(Mem_Player1PartyData + byte(Mem_CurrentPlayerPlaying) * 0x118)
}

function getPlayerDifficulty(playerSlot) {
    return word_be(Mem_Player1CharacterID + playerSlot * 0x0A + 0x04)
}

function getPlayerHandicap(playerSlot) {
    return byte(Mem_Player1PartyData + playerSlot * 0x118 + 0x04)
}

function getPlayerTeamSlot(playerSlot) {
    return bit0(Mem_Player1PartyData + playerSlot * 0x118 + 0x0E)
         + bit1(Mem_Player1PartyData + playerSlot * 0x118 + 0x0E) * 2
}

function getCurrentPlayerTeamSlot() {
    return bit0(Mem_Player1PartyData + byte(Mem_CurrentPlayerPlaying) * 0x118 + 0x0E)
         + bit1(Mem_Player1PartyData + byte(Mem_CurrentPlayerPlaying) * 0x118 + 0x0E) * 2
}

function getPlayerStars(playerSlot) {
    return word_be(Mem_Player1PartyData + playerSlot * 0x118 + 0x38)
}

function getCurrentPlayerStars() {
    return word_be(Mem_Player1PartyData + getCurrentPlayerTeamSlot() * 0x118 + 0x38)
}

function getCurrentPlayerCoins() {
    return word_be(Mem_Player1PartyData + getCurrentPlayerTeamSlot() * 0x118 + 0x26)
}

function getPlayerCoinRecord(playerSlot) {
    return word_be(Mem_Player1PartyData + getCurrentPlayerTeamSlot() * 0x118 + 0x2C)
}

function getPlayerCandyEffect(playerSlot) {
    return word_be(Mem_Player1PartyData + playerSlot * 0x118 + 0x1A)
}

function getCurrentPlayerCandyEffect() {
    return word_be(Mem_Player1PartyData + byte(Mem_CurrentPlayerPlaying) * 0x118 + 0x1A)
}

function getPlayerMinigameTeam(playerSlot) {
    return byte(Mem_Player1CharacterID + playerSlot * 0x0A + 0x07)
}

function getPlayerMinigamePrize(playerSlot) {
    return dword_be(Mem_Player1PartyData + playerSlot * 0x118 + 0x30)
}

function getPlayerSpacesWalked(playerSlot) {
    return word_be(Mem_Player1PartyData + playerSlot * 0x118 + 0x18)
}

function getCurrentPlayerSpacesWalked() {
    return word_be(Mem_Player1PartyData + byte(Mem_CurrentPlayerPlaying) * 0x118 + 0x18)
}

function getPlayerSpacesLeftToWalk(playerSlot) {
    return word_be(Mem_Player1PartyData + playerSlot * 0x118 + 0x0E)
}

function getPlayerSpaceStanding(playerSlot) {
    return word_be(Mem_Player1PartyData + playerSlot * 0x118 + 0x10)
}

function getCurrentPlayerSpaceStanding() {
    return word_be(Mem_Player1PartyData + byte(Mem_CurrentPlayerPlaying) * 0x118 + 0x10)
}

function getPlayerGreenSpaces(playerSlot) {
    return word_be(Mem_Player1PartyData + playerSlot * 0x118 + 0x1E)
}

function getCurrentPlayerGreenSpaces() {
    return word_be(Mem_Player1PartyData + byte(Mem_CurrentPlayerPlaying) * 0x118 + 0x1E)
}

function getCurrentPlayerLuckySpaces() {
    return word_be(Mem_Player1PartyData + byte(Mem_CurrentPlayerPlaying) * 0x118 + 0x1F)
}

function getDiscoveredRoomsInMansion() {
    return bitcount(Mem_KingBooMansionMapFlags + 0x00)
         + bitcount(Mem_KingBooMansionMapFlags + 0x01)
         + bitcount(Mem_KingBooMansionMapFlags + 0x02)
         + bitcount(Mem_KingBooMansionMapFlags + 0x03)
         + bitcount(Mem_KingBooMansionMapFlags + 0x04)
         + bitcount(Mem_KingBooMansionMapFlags + 0x05)
}

function getPlayerInvestmentOfHotel(hotelSlot, playerSlot) {
    return byte(Mem_KoopaHotelInvestments + hotelSlot * 4 + playerSlot)
}

function getCurrentPlayerInvestmentOfHotel(hotelSlot) {
    return byte(Mem_KoopaHotelInvestments + hotelSlot * 4 + byte(Mem_CurrentPlayerPlaying) )
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

function checkAllCarnivalFigurineFlags() {
    return bit5(Mem_EventFlags + 0x01)
         + bit6(Mem_EventFlags + 0x01)
         + bit7(Mem_EventFlags + 0x01)
         + bit0(Mem_EventFlags + 0x00)
         + bit5(Mem_EventFlags + 0x00)
         + bit4(Mem_EventFlags + 0x00)
         + bit7(Mem_EventFlags + 0x00)
         + bit6(Mem_EventFlags + 0x00)
         + bit5(Mem_EventFlags + 0x07)
         + bit6(Mem_EventFlags + 0x07)
         + bit7(Mem_EventFlags + 0x07)
         + bit0(Mem_EventFlags + 0x06)
         + bit0(Mem_EventFlags + 0x01)
         + bit7(Mem_EventFlags + 0x02)
         + bit2(Mem_EventFlags + 0x00)
         + bit1(Mem_EventFlags + 0x07)
         + bit3(Mem_EventFlags + 0x00)
         + bit5(Mem_EventFlags + 0x02)
         + bit4(Mem_EventFlags + 0x02)
         + bit4(Mem_EventFlags + 0x01)
         + bit6(Mem_EventFlags + 0x02)
         + bit4(Mem_EventFlags + 0x07)
         + bit1(Mem_EventFlags + 0x01)
         + bit2(Mem_EventFlags + 0x01)
         + bit2(Mem_EventFlags + 0x07)
         + bit3(Mem_EventFlags + 0x07)
         + bit1(Mem_EventFlags + 0x00)
         + bit0(Mem_EventFlags + 0x07)
         + bit3(Mem_EventFlags + 0x01)
         + bit1(Mem_EventFlags + 0x06)
}

function checkAllSurpriseWagonFlags() {
    return bit0(Mem_EventFlags + 0x03)
         + bit1(Mem_EventFlags + 0x03)
         + bit2(Mem_EventFlags + 0x03)
         + bit3(Mem_EventFlags + 0x03)
         + bit4(Mem_EventFlags + 0x03)
         + bit5(Mem_EventFlags + 0x03)
         + bit6(Mem_EventFlags + 0x03)
         + bit7(Mem_EventFlags + 0x03)
         + bit0(Mem_EventFlags + 0x02)
         + bit1(Mem_EventFlags + 0x02)
         + bit2(Mem_EventFlags + 0x02)
         + bit3(Mem_EventFlags + 0x02)
         + checkAllCarnivalFigurineFlags()
}

function getMinigameState() {
    return word_be(Mem_MinigameState)
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

function partyCeremonyFinishedGame() {
    return getGameState(0x01) &&
           prev(getGameState(0x01)) &&
           prev(getPlayerCeremonyStars(0)) + prev(getPlayerCeremonyCoins(0)) > 0 &&
           prev(getPlayerCeremonyStars(1)) + prev(getPlayerCeremonyCoins(1)) > 0 &&
           getPlayerCeremonyStars(0) == prev(getPlayerCeremonyStars(0)) &&
           getPlayerCeremonyCoins(0) == prev(getPlayerCeremonyCoins(0)) &&
           getPlayerCeremonyStars(1) == prev(getPlayerCeremonyStars(1)) &&
           getPlayerCeremonyCoins(1) == prev(getPlayerCeremonyCoins(1)) &&
           __ornext(prev(getTotalPlayersInMinigame()) == 2 ||
                    prev(getTotalPlayersInMinigame()) == 4) &&
           getTotalPlayersInMinigame() == 0
           
}

function getPlayerCeremonyPlacement(playerSlot) {
    return byte(Mem_CeremonyData + 1 + (playerSlot * 52))
}

function getPlayerCeremonyStars(playerSlot) {
    return word_be(Mem_CeremonyData + 2 + (playerSlot * 52))
}

function getPlayerCeremonyCoins(playerSlot) {
    return word_be(Mem_CeremonyData + 4 + (playerSlot * 52))
}

function getExtraPlayerAmount() {
    return 4
         - byte(Mem_Player1CharacterID + 0 * 0x0A + 9)
         - byte(Mem_Player1CharacterID + 1 * 0x0A + 9)
         - byte(Mem_Player1CharacterID + 2 * 0x0A + 9)
         - byte(Mem_Player1CharacterID + 3 * 0x0A + 9)
}

function getCrownShowdownRounds() {
    return byte(Mem_CrownShowdownDynamic + 0x00)
}

function getCrownShowdownMode() {
    return byte(Mem_CrownShowdownDynamic + 0x01)
}

function getCrownShowdownPlayerWins(playerSlot) {
    return byte(Mem_CrownShowdownDynamic + 0x07 + getCrownShowdownPlayerTeam(playerSlot))
}

function getCrownShowdownPlayerTeam(playerSlot) {
    return byte(Mem_CrownShowdownDynamic + 0x1C + playerSlot)
}

function pseudoImpossibleCondition() {
    return getCurrentPlayerCharacterID() == 0xFF
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
    title       = "Shining at the End of the Corridor",
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
                   getPlayerControlType(0) == 1 &&
                   getPlayerStars(0) == 0 && 
                   getPlayerControlType(1) == 0 &&
                   getPlayerStars(1) > 0 &&
                   getPlayerSpaceStanding(1) == 0x27 &&
                   getPlayerSpaceStanding(1) != prev(getPlayerSpaceStanding(1))) ||
                   (__ornext(getPlayerCharacterID(1) == 0x0C ||
                             getPlayerCharacterID(1) == 0x0D) &&
                   getPlayerControlType(1) == 1 &&
                   getPlayerStars(1) == 0 && 
                   getPlayerControlType(0) == 0 &&
                   getPlayerStars(0) > 0 &&
                   getPlayerSpaceStanding(0) == 0x27 &&
                   getPlayerSpaceStanding(0) != prev(getPlayerSpaceStanding(0))))
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
    id          = 594403, 
    badge       = "674008",
    type        = "",
    title       = "No Monkeying Around!",
    description = "Win a Battle Royale on the board \"DK's Treetop Temple\" against three CPUs on Hard without reloading and without using Handicaps.",
    points      = 25,
    trigger     = checkPartySubMode("Battle Royale") &&
                  never(getGameState(0x5C)) &&
                  getBoardID() == 0x00 &&
                  never(getPlayerControlType(0)
                      + getPlayerControlType(1)
                      + getPlayerControlType(2)
                      + getPlayerControlType(3) != 3) &&
                  never(getPlayerCoinRecord(0) > 0 &&
                        getPlayerControlType(0) != prev(getPlayerControlType(0))) &&
                  never(getPlayerControlType(0) == 0x01 &&
                        getPlayerDifficulty(0) < 2) &&
                  never(getPlayerControlType(0) == 0x00 &&
                        getPlayerHandicap(0) > 0) &&
                  never(getPlayerCoinRecord(1) > 0 &&
                        getPlayerControlType(1) != prev(getPlayerControlType(1))) &&
                  never(getPlayerControlType(1) == 0x01 &&
                        getPlayerDifficulty(1) < 2) &&
                  never(getPlayerControlType(1) == 0x00 &&
                        getPlayerHandicap(1) > 0) &&
                  never(getPlayerCoinRecord(2) > 0 &&
                        getPlayerControlType(2) != prev(getPlayerControlType(2))) &&
                  never(getPlayerControlType(2) == 0x01 &&
                        getPlayerDifficulty(2) < 2) &&
                  never(getPlayerControlType(2) == 0x00 &&
                        getPlayerHandicap(2) > 0) &&
                  never(getPlayerCoinRecord(3) > 0 &&
                        getPlayerControlType(3) != prev(getPlayerControlType(3))) &&
                  never(getPlayerControlType(3) == 0x01 &&
                        getPlayerDifficulty(3) < 2) &&
                  never(getPlayerControlType(3) == 0x00 &&
                        getPlayerHandicap(3) > 0) &&
                  tally(2, once(__ornext(getGameState(0x5B) ||
                     	                   getGameState(0x6F))),
                           once(dword_be(Mem_GameState) == 0x70 &&
                     	          byte(Mem_CurrentTurn) == 0x01)) &&
                  trigger_when(partyCeremonyFinishedGame()) &&
                  (trigger_when(getPlayerControlType(0) == 0x00 &&
                                getPlayerCeremonyPlacement(0) == 0x00) ||
                   trigger_when(getPlayerControlType(1) == 0x00 &&
                                getPlayerCeremonyPlacement(1) == 0x00) ||
                   trigger_when(getPlayerControlType(2) == 0x00 &&
                                getPlayerCeremonyPlacement(2) == 0x00) ||
                   trigger_when(getPlayerControlType(3) == 0x00 &&
                                getPlayerCeremonyPlacement(3) == 0x00))
)

achievement(
    id          = 592318, 
    badge       = "671413",
    type        = "",
    title       = "Jungle Barrel Blast",
    description = "Get shot by the barrel cannon 10 times in a party on \"DK's Treetop Temple\" without reloading.",
    points      = 5,
    trigger     = getGameState(0x70) &&
                  never(getGameState(0x5C)) &&
                  getPlayerIsDoingTurn() &&
                  ((measured(tally(10, __ornext(!checkPartySubMode("Duel Battle") &&
                                                getPlayerControlType(0) == 0x00 &&
                                                getPlayerSpaceStanding(0) == 0x1F) &&
                                                prev(getPlayerSpaceStanding(0)) == 0x46,
                                       __ornext(!checkPartySubMode("Duel Battle") &&
                                                getPlayerControlType(0) == 0x00 &&
                                                getPlayerSpaceStanding(0) == 0x1F) &&
                                                prev(getPlayerSpaceStanding(0)) == 0x6A,
                                       __ornext(!checkPartySubMode("Duel Battle") &&
                                                getPlayerControlType(0) == 0x00 &&
                                                getPlayerSpaceStanding(0) == 0x28) &&
                                                prev(getPlayerSpaceStanding(0)) == 0x46,
                                       __ornext(!checkPartySubMode("Duel Battle") &&
                                                getPlayerControlType(0) == 0x00 &&
                                                getPlayerSpaceStanding(0) == 0x28) &&
                                                prev(getPlayerSpaceStanding(0)) == 0x6A),
                                       when = tally(2, once(__ornext(getGameState(0x5B) ||
                     	                                               getGameState(0x6F))),
                                                       once(dword_be(Mem_GameState) == 0x70 &&
                     	                                      byte(Mem_CurrentTurn) == 0x01)) &&
                                              never(getPlayerControlType(0) == 0x01))) ||
                   (measured(tally(10, __ornext(!checkPartySubMode("Duel Battle") &&
                                                getPlayerControlType(1) == 0x00 &&
                                                getPlayerSpaceStanding(1) == 0x1F) &&
                                                prev(getPlayerSpaceStanding(1)) == 0x46,
                                       __ornext(!checkPartySubMode("Duel Battle") &&
                                                getPlayerControlType(1) == 0x00 &&
                                                getPlayerSpaceStanding(1) == 0x1F) &&
                                                prev(getPlayerSpaceStanding(1)) == 0x6A,
                                       __ornext(!checkPartySubMode("Duel Battle") &&
                                                getPlayerControlType(1) == 0x00 &&
                                                getPlayerSpaceStanding(1) == 0x28) &&
                                                prev(getPlayerSpaceStanding(1)) == 0x46,
                                       __ornext(!checkPartySubMode("Duel Battle") &&
                                                getPlayerControlType(1) == 0x00 &&
                                                getPlayerSpaceStanding(1) == 0x28) &&
                                                prev(getPlayerSpaceStanding(1)) == 0x6A),
                                       when = tally(2, once(__ornext(getGameState(0x5B) ||
                     	                                               getGameState(0x6F))),
                                                       once(dword_be(Mem_GameState) == 0x70 &&
                     	                                      byte(Mem_CurrentTurn) == 0x01)) &&
                                              never(getPlayerControlType(1) == 0x01))) ||
                   (measured(tally(10, __ornext(!checkPartySubMode("Duel Battle") &&
                                                getPlayerControlType(2) == 0x00 &&
                                                getPlayerSpaceStanding(2) == 0x1F) &&
                                                prev(getPlayerSpaceStanding(2)) == 0x46,
                                       __ornext(!checkPartySubMode("Duel Battle") &&
                                                getPlayerControlType(2) == 0x00 &&
                                                getPlayerSpaceStanding(2) == 0x1F) &&
                                                prev(getPlayerSpaceStanding(2)) == 0x6A,
                                       __ornext(!checkPartySubMode("Duel Battle") &&
                                                getPlayerControlType(2) == 0x00 &&
                                                getPlayerSpaceStanding(2) == 0x28) &&
                                                prev(getPlayerSpaceStanding(2)) == 0x46,
                                       __ornext(!checkPartySubMode("Duel Battle") &&
                                                getPlayerControlType(2) == 0x00 &&
                                                getPlayerSpaceStanding(2) == 0x28) &&
                                                prev(getPlayerSpaceStanding(2)) == 0x6A),
                                       when = tally(2, once(__ornext(getGameState(0x5B) ||
                     	                                               getGameState(0x6F))),
                                                       once(dword_be(Mem_GameState) == 0x70 &&
                     	                                      byte(Mem_CurrentTurn) == 0x01)) &&
                                              never(getPlayerControlType(2) == 0x01))) ||
                   (measured(tally(10, __ornext(!checkPartySubMode("Duel Battle") &&
                                                getPlayerControlType(3) == 0x00 &&
                                                getPlayerSpaceStanding(3) == 0x1F) &&
                                                prev(getPlayerSpaceStanding(3)) == 0x46,
                                       __ornext(!checkPartySubMode("Duel Battle") &&
                                                getPlayerControlType(3) == 0x00 &&
                                                getPlayerSpaceStanding(3) == 0x1F) &&
                                                prev(getPlayerSpaceStanding(3)) == 0x6A,
                                       __ornext(!checkPartySubMode("Duel Battle") &&
                                                getPlayerControlType(3) == 0x00 &&
                                                getPlayerSpaceStanding(3) == 0x28) &&
                                                prev(getPlayerSpaceStanding(3)) == 0x46,
                                       __ornext(!checkPartySubMode("Duel Battle") &&
                                                getPlayerControlType(3) == 0x00 &&
                                                getPlayerSpaceStanding(3) == 0x28) &&
                                                prev(getPlayerSpaceStanding(3)) == 0x6A),
                                       when = tally(2, once(__ornext(getGameState(0x5B) ||
                     	                                               getGameState(0x6F))),
                                                       once(dword_be(Mem_GameState) == 0x70 &&
                     	                                      byte(Mem_CurrentTurn) == 0x01)) &&
                                              never(getPlayerControlType(3) == 0x01))) ||
                   (measured(tally(10, __ornext(checkPartySubMode("Duel Battle") &&
                                                getPlayerControlType(0) == 0x00 &&
                                                getPlayerSpaceStanding(0) == 0x0E) &&
                                                prev(getPlayerSpaceStanding(0)) == 0x2F,
                                       __ornext(checkPartySubMode("Duel Battle") &&
                                                getPlayerControlType(0) == 0x00 &&
                                                getPlayerSpaceStanding(0) == 0x0E) &&
                                                prev(getPlayerSpaceStanding(0)) == 0x6B,
                                       __ornext(checkPartySubMode("Duel Battle") &&
                                                getPlayerControlType(0) == 0x00 &&
                                                getPlayerSpaceStanding(0) == 0x13) &&
                                                prev(getPlayerSpaceStanding(0)) == 0x2F,
                                       __ornext(checkPartySubMode("Duel Battle") &&
                                                getPlayerControlType(0) == 0x00 &&
                                                getPlayerSpaceStanding(0) == 0x13) &&
                                                prev(getPlayerSpaceStanding(0)) == 0x6B),
                                       when = tally(2, once(__ornext(getGameState(0x5B) ||
                     	                                               getGameState(0x6F))),
                                                       once(dword_be(Mem_GameState) == 0x70 &&
                     	                                      byte(Mem_CurrentTurn) == 0x01)) &&
                                              never(getPlayerControlType(0) == 0x01))) ||
                   (measured(tally(10, __ornext(checkPartySubMode("Duel Battle") &&
                                                getPlayerControlType(1) == 0x00 &&
                                                getPlayerSpaceStanding(1) == 0x0E) &&
                                                prev(getPlayerSpaceStanding(1)) == 0x2F,
                                       __ornext(checkPartySubMode("Duel Battle") &&
                                                getPlayerControlType(1) == 0x00 &&
                                                getPlayerSpaceStanding(1) == 0x0E) &&
                                                prev(getPlayerSpaceStanding(1)) == 0x6B,
                                       __ornext(checkPartySubMode("Duel Battle") &&
                                                getPlayerControlType(1) == 0x00 &&
                                                getPlayerSpaceStanding(1) == 0x13) &&
                                                prev(getPlayerSpaceStanding(1)) == 0x2F,
                                       __ornext(checkPartySubMode("Duel Battle") &&
                                                getPlayerControlType(1) == 0x00 &&
                                                getPlayerSpaceStanding(1) == 0x13) &&
                                                prev(getPlayerSpaceStanding(1)) == 0x6B),
                                       when = tally(2, once(__ornext(getGameState(0x5B) ||
                     	                                               getGameState(0x6F))),
                                                       once(dword_be(Mem_GameState) == 0x70 &&
                     	                                      byte(Mem_CurrentTurn) == 0x01)) &&
                                              never(getPlayerControlType(1) == 0x01))))
)

achievement(
    id          = 593717, 
    badge       = "673063",
    type        = "",
    title       = "Temple Topple",
    description = "Reach the hidden section of \"DK's Treetop Temple\" and get a free Star.",
    points      = 3,
    trigger     = getGameState(0x70) &&
                  !checkPartySubMode("Duel Battle") &&
                  !getPartyPlayerChanging() &&
                  getCurrentPlayerControlType() == 0x00 &&
                  getCurrentPlayerSpaceStanding() >= 0x100 &&
                  getCurrentPlayerStars() > prev(getCurrentPlayerStars())
)

achievement(
    id          = 594404, 
    badge       = "674009",
    type        = "",
    title       = "Summer, Sun, Stars",
    description = "Win a Battle Royale on the board \"Goomba's Booty Boardwalk\" against three CPUs on Hard without reloading and without using Handicaps.",
    points      = 25,
    trigger     = checkPartySubMode("Battle Royale") &&
                  never(getGameState(0x5C)) &&
                  getBoardID() == 0x01 &&
                  never(getPlayerControlType(0)
                      + getPlayerControlType(1)
                      + getPlayerControlType(2)
                      + getPlayerControlType(3) != 3) &&
                  never(getPlayerCoinRecord(0) > 0 &&
                        getPlayerControlType(0) != prev(getPlayerControlType(0))) &&
                  never(getPlayerControlType(0) == 0x01 &&
                        getPlayerDifficulty(0) < 2) &&
                  never(getPlayerControlType(0) == 0x00 &&
                        getPlayerHandicap(0) > 0) &&
                  never(getPlayerCoinRecord(1) > 0 &&
                        getPlayerControlType(1) != prev(getPlayerControlType(1))) &&
                  never(getPlayerControlType(1) == 0x01 &&
                        getPlayerDifficulty(1) < 2) &&
                  never(getPlayerControlType(1) == 0x00 &&
                        getPlayerHandicap(1) > 0) &&
                  never(getPlayerCoinRecord(2) > 0 &&
                        getPlayerControlType(2) != prev(getPlayerControlType(2))) &&
                  never(getPlayerControlType(2) == 0x01 &&
                        getPlayerDifficulty(2) < 2) &&
                  never(getPlayerControlType(2) == 0x00 &&
                        getPlayerHandicap(2) > 0) &&
                  never(getPlayerCoinRecord(3) > 0 &&
                        getPlayerControlType(3) != prev(getPlayerControlType(3))) &&
                  never(getPlayerControlType(3) == 0x01 &&
                        getPlayerDifficulty(3) < 2) &&
                  never(getPlayerControlType(3) == 0x00 &&
                        getPlayerHandicap(3) > 0) &&
                  tally(2, once(__ornext(getGameState(0x5B) ||
                     	                   getGameState(0x6F))),
                           once(dword_be(Mem_GameState) == 0x71 &&
                     	          byte(Mem_CurrentTurn) == 0x01)) &&
                  trigger_when(partyCeremonyFinishedGame()) &&
                  (trigger_when(getPlayerControlType(0) == 0x00 &&
                                getPlayerCeremonyPlacement(0) == 0x00) ||
                   trigger_when(getPlayerControlType(1) == 0x00 &&
                                getPlayerCeremonyPlacement(1) == 0x00) ||
                   trigger_when(getPlayerControlType(2) == 0x00 &&
                                getPlayerCeremonyPlacement(2) == 0x00) ||
                   trigger_when(getPlayerControlType(3) == 0x00 &&
                                getPlayerCeremonyPlacement(3) == 0x00))
)

achievement(
    id          = 592425, 
    badge       = "671467",
    type        = "",
    title       = "The Early Dolphin Gets the Wave",
    description = "Travel from the starting platform to Captain Goomba in a single turn on the bigger version of \"Goomba's Booty Boardwalk\".",
    points      = 5,
    trigger     = getGameState(0x71) &&
                  !checkPartySubMode("Duel Battle") &&
                  never(getGameState(0x5C)) &&
                  never(getPartyPlayerChanging()) &&
                  once(getCurrentPlayerControlType() == 0x00 &&
                       getCurrentPlayerSpaceStanding() == 0x03 &&
                       never(getCurrentPlayerControlType() == 0x01)) &&
                  getCurrentPlayerSpaceStanding() == 0x48 &&
                  prev(getCurrentPlayerSpaceStanding() == 0x47)
)

achievement(
    id          = 593718, 
    badge       = "673069",
    type        = "",
    title       = "Path to Weath and Glory",
    description = "Ride a dolphin to the secret island of \"Goomba's Booty Boardwalk\" and get a free Star.",
    points      = 3,
    trigger     = getGameState(0x71) &&
                  !checkPartySubMode("Duel Battle") &&
                  !getPartyPlayerChanging() &&
                  getCurrentPlayerControlType() == 0x00 &&
                  getCurrentPlayerSpaceStanding() >= 0x100 &&
                  getCurrentPlayerStars() > prev(getCurrentPlayerStars())
)

achievement(
    id          = 594406, 
    badge       = "674011",
    type        = "",
    title       = "I'm Scared Of No-Boo-dy",
    description = "Win a Battle Royale on the board \"King Boo's Haunted Hideaway\" against three CPUs on Hard without reloading and without using Handicaps.",
    points      = 25,
    trigger     = checkPartySubMode("Battle Royale") &&
                  never(getGameState(0x5C)) &&
                  getBoardID() == 0x02 &&
                  never(getPlayerControlType(0)
                      + getPlayerControlType(1)
                      + getPlayerControlType(2)
                      + getPlayerControlType(3) != 3) &&
                  never(getPlayerCoinRecord(0) > 0 &&
                        getPlayerControlType(0) != prev(getPlayerControlType(0))) &&
                  never(getPlayerControlType(0) == 0x01 &&
                        getPlayerDifficulty(0) < 2) &&
                  never(getPlayerControlType(0) == 0x00 &&
                        getPlayerHandicap(0) > 0) &&
                  never(getPlayerCoinRecord(1) > 0 &&
                        getPlayerControlType(1) != prev(getPlayerControlType(1))) &&
                  never(getPlayerControlType(1) == 0x01 &&
                        getPlayerDifficulty(1) < 2) &&
                  never(getPlayerControlType(1) == 0x00 &&
                        getPlayerHandicap(1) > 0) &&
                  never(getPlayerCoinRecord(2) > 0 &&
                        getPlayerControlType(2) != prev(getPlayerControlType(2))) &&
                  never(getPlayerControlType(2) == 0x01 &&
                        getPlayerDifficulty(2) < 2) &&
                  never(getPlayerControlType(2) == 0x00 &&
                        getPlayerHandicap(2) > 0) &&
                  never(getPlayerCoinRecord(3) > 0 &&
                        getPlayerControlType(3) != prev(getPlayerControlType(3))) &&
                  never(getPlayerControlType(3) == 0x01 &&
                        getPlayerDifficulty(3) < 2) &&
                  never(getPlayerControlType(3) == 0x00 &&
                        getPlayerHandicap(3) > 0) &&
                  tally(2, once(__ornext(getGameState(0x5B) ||
                     	                   getGameState(0x6F))),
                           once(dword_be(Mem_GameState) == 0x72 &&
                     	          byte(Mem_CurrentTurn) == 0x01)) &&
                  trigger_when(partyCeremonyFinishedGame()) &&
                  (trigger_when(getPlayerControlType(0) == 0x00 &&
                                getPlayerCeremonyPlacement(0) == 0x00) ||
                   trigger_when(getPlayerControlType(1) == 0x00 &&
                                getPlayerCeremonyPlacement(1) == 0x00) ||
                   trigger_when(getPlayerControlType(2) == 0x00 &&
                                getPlayerCeremonyPlacement(2) == 0x00) ||
                   trigger_when(getPlayerControlType(3) == 0x00 &&
                                getPlayerCeremonyPlacement(3) == 0x00))
)

achievement(
    id          = 592328, 
    badge       = "671420",
    type        = "",
    title       = "A-Maze-Ing Paranormal Investigation",
    description = "Uncover the whole mansion map of the bigger version of \"King Boo's Haunted Hideaway\" without reloading.",
    points      = 10,
    trigger     = getGameState(0x72) &&
                  never(getGameState(0x5C)) &&
                  getPlayerIsDoingTurn() &&
                  measured(getDiscoveredRoomsInMansion() == 24,
                           when = checkPartySubMode("Duel Battle") &&
                                  tally(2, once(__ornext(getGameState(0x5B) ||
                     	                                   getGameState(0x6F))),
                                           once(dword_be(Mem_GameState) == 0x72 &&
                     	                          byte(Mem_CurrentTurn) == 0x01))) &&
                  prev(getDiscoveredRoomsInMansion() == 23)
)

achievement(
    id          = 593719, 
    badge       = "673070",
    type        = "",
    title       = "Attic Fantastic",
    description = "Drop down from the 2nd floor of \"King Boo's Haunted Hideaway\" to find King Boo and get a Star.",
    points      = 3,
    trigger     = getGameState(0x72) &&
                  !checkPartySubMode("Duel Battle") &&
                  !getPartyPlayerChanging() &&
                  getCurrentPlayerControlType() == 0x00 &&
                  prior(getCurrentPlayerSpaceStanding()) >= 0x100 &&
                  getCurrentPlayerStars() > prev(getCurrentPlayerStars())
)

achievement(
    id          = 594435, 
    badge       = "674012",
    type        = "",
    title       = "Ticket to Victory",
    description = "Win a Battle Royale on the board \"Shy Guy's Perplex Express\" against three CPUs on Hard without reloading and without using Handicaps.",
    points      = 25,
    trigger     = checkPartySubMode("Battle Royale") &&
                  never(getGameState(0x5C)) &&
                  getBoardID() == 0x03 &&
                  never(getPlayerControlType(0)
                      + getPlayerControlType(1)
                      + getPlayerControlType(2)
                      + getPlayerControlType(3) != 3) &&
                  never(getPlayerCoinRecord(0) > 0 &&
                        getPlayerControlType(0) != prev(getPlayerControlType(0))) &&
                  never(getPlayerControlType(0) == 0x01 &&
                        getPlayerDifficulty(0) < 2) &&
                  never(getPlayerControlType(0) == 0x00 &&
                        getPlayerHandicap(0) > 0) &&
                  never(getPlayerCoinRecord(1) > 0 &&
                        getPlayerControlType(1) != prev(getPlayerControlType(1))) &&
                  never(getPlayerControlType(1) == 0x01 &&
                        getPlayerDifficulty(1) < 2) &&
                  never(getPlayerControlType(1) == 0x00 &&
                        getPlayerHandicap(1) > 0) &&
                  never(getPlayerCoinRecord(2) > 0 &&
                        getPlayerControlType(2) != prev(getPlayerControlType(2))) &&
                  never(getPlayerControlType(2) == 0x01 &&
                        getPlayerDifficulty(2) < 2) &&
                  never(getPlayerControlType(2) == 0x00 &&
                        getPlayerHandicap(2) > 0) &&
                  never(getPlayerCoinRecord(3) > 0 &&
                        getPlayerControlType(3) != prev(getPlayerControlType(3))) &&
                  never(getPlayerControlType(3) == 0x01 &&
                        getPlayerDifficulty(3) < 2) &&
                  never(getPlayerControlType(3) == 0x00 &&
                        getPlayerHandicap(3) > 0) &&
                  tally(2, once(__ornext(getGameState(0x5B) ||
                     	                   getGameState(0x6F))),
                           once(dword_be(Mem_GameState) == 0x73 &&
                     	          byte(Mem_CurrentTurn) == 0x01)) &&
                  trigger_when(partyCeremonyFinishedGame()) &&
                  (trigger_when(getPlayerControlType(0) == 0x00 &&
                                getPlayerCeremonyPlacement(0) == 0x00) ||
                   trigger_when(getPlayerControlType(1) == 0x00 &&
                                getPlayerCeremonyPlacement(1) == 0x00) ||
                   trigger_when(getPlayerControlType(2) == 0x00 &&
                                getPlayerCeremonyPlacement(2) == 0x00) ||
                   trigger_when(getPlayerControlType(3) == 0x00 &&
                                getPlayerCeremonyPlacement(3) == 0x00))
)

achievement(
    id          = 592423, 
    badge       = "671466",
    type        = "",
    title       = "Plug and Play",
    description = "Shuffle all train cars and bring them back to their original order on the bigger version of \"Shy Guy's Perplex Express\" without reloading.",
    points      = 10,
    trigger     = getGameState(0x73) &&
                  never(getGameState(0x5C)) &&
                  getPlayerIsDoingTurn() &&
                  once(dword_be(Mem_GameState) == 0x73 &&
                       byte(Mem_CurrentTurn) == 0x01) &&
                  once(getCurrentPlayerGreenSpaces() > prev(getCurrentPlayerGreenSpaces()) &&
                       never(getPartyPlayerChanging())) &&
                  ((byte(Mem_ExpressCarOrder) == 0x00 &&
                    prev(byte(Mem_ExpressCarOrder)) == 0x04) ||
                   (pseudoImpossibleCondition() &&
                    measured(byte(Mem_ExpressCarOrder) == 5,
                             when = !checkPartySubMode("Duel Battle") &&
                                    once(dword_be(Mem_GameState) == 0x73 &&
                                         byte(Mem_CurrentTurn) == 0x01))))
)

achievement(
    id          = 593721, 
    badge       = "673071",
    type        = "",
    title       = "Next Stop: Coin Heaven",
    description = "Travel to Payday Waystation using \"Shy Guy's Perplex Express\" and get a free Star.",
    points      = 3,
    trigger     = getGameState(0x73) &&
                  !checkPartySubMode("Duel Battle") &&
                  !getPartyPlayerChanging() &&
                  getCurrentPlayerControlType() == 0x00 &&
                  prior(getCurrentPlayerSpaceStanding()) >= 0x100 &&
                  getCurrentPlayerStars() > prev(getCurrentPlayerStars())
)

achievement(
    id          = 594436, 
    badge       = "674013",
    type        = "",
    title       = "Professional Business Investor",
    description = "Win a Battle Royale on the board \"Koopa's Tycoon Town\" against three CPUs on Hard without reloading and without using Handicaps.",
    points      = 25,
    trigger     = checkPartySubMode("Battle Royale") &&
                  never(getGameState(0x5C)) &&
                  getBoardID() == 0x04 &&
                  never(getPlayerControlType(0)
                      + getPlayerControlType(1)
                      + getPlayerControlType(2)
                      + getPlayerControlType(3) != 3) &&
                  never(getPlayerCoinRecord(0) > 0 &&
                        getPlayerControlType(0) != prev(getPlayerControlType(0))) &&
                  never(getPlayerControlType(0) == 0x01 &&
                        getPlayerDifficulty(0) < 2) &&
                  never(getPlayerControlType(0) == 0x00 &&
                        getPlayerHandicap(0) > 0) &&
                  never(getPlayerCoinRecord(1) > 0 &&
                        getPlayerControlType(1) != prev(getPlayerControlType(1))) &&
                  never(getPlayerControlType(1) == 0x01 &&
                        getPlayerDifficulty(1) < 2) &&
                  never(getPlayerControlType(1) == 0x00 &&
                        getPlayerHandicap(1) > 0) &&
                  never(getPlayerCoinRecord(2) > 0 &&
                        getPlayerControlType(2) != prev(getPlayerControlType(2))) &&
                  never(getPlayerControlType(2) == 0x01 &&
                        getPlayerDifficulty(2) < 2) &&
                  never(getPlayerControlType(2) == 0x00 &&
                        getPlayerHandicap(2) > 0) &&
                  never(getPlayerCoinRecord(3) > 0 &&
                        getPlayerControlType(3) != prev(getPlayerControlType(3))) &&
                  never(getPlayerControlType(3) == 0x01 &&
                        getPlayerDifficulty(3) < 2) &&
                  never(getPlayerControlType(3) == 0x00 &&
                        getPlayerHandicap(3) > 0) &&
                  tally(2, once(__ornext(getGameState(0x5B) ||
                     	                   getGameState(0x6F))),
                           once(dword_be(Mem_GameState) == 0x74 &&
                     	          byte(Mem_CurrentTurn) == 0x01)) &&
                  trigger_when(partyCeremonyFinishedGame()) &&
                  (trigger_when(getPlayerControlType(0) == 0x00 &&
                                getPlayerCeremonyPlacement(0) == 0x00) ||
                   trigger_when(getPlayerControlType(1) == 0x00 &&
                                getPlayerCeremonyPlacement(1) == 0x00) ||
                   trigger_when(getPlayerControlType(2) == 0x00 &&
                                getPlayerCeremonyPlacement(2) == 0x00) ||
                   trigger_when(getPlayerControlType(3) == 0x00 &&
                                getPlayerCeremonyPlacement(3) == 0x00))
)

achievement(
    id          = 592330, 
    badge       = "671422",
    type        = "",
    title       = "Mr. Monopoly",
    description = "Own all hotels on a 3-star rank on the bigger version of \"Koopa's Tycoon Town\" without reloading while playing with three CPUs.",
    points      = 10,
    trigger     = getGameState(0x74) &&
                  never(getGameState(0x5C)) &&
                  never(getPlayerControlType(0)
                      + getPlayerControlType(1)
                      + getPlayerControlType(2)
                      + getPlayerControlType(3) != 3) &&
                  ((measured(getPlayerStars(0) == 21,
                           when = !checkPartySubMode("Duel Battle") &&
                                  tally(2, once(__ornext(getGameState(0x5B) ||
                     	                                   getGameState(0x6F))),
                                           once(dword_be(Mem_GameState) == 0x74 &&
                     	                          byte(Mem_CurrentTurn) == 0x01)) &&
                                  never(getPlayerControlType(0) == 0x01))) ||
                   (measured(getPlayerStars(1) == 21,
                           when = tally(2, once(__ornext(getGameState(0x5B) ||
                     	                                   getGameState(0x6F))),
                                           once(dword_be(Mem_GameState) == 0x74 &&
                     	                          byte(Mem_CurrentTurn) == 0x01)) &&
                                  never(getPlayerControlType(1) == 0x01))) ||
                   (measured(getPlayerStars(2) == 21,
                           when = tally(2, once(__ornext(getGameState(0x5B) ||
                     	                                   getGameState(0x6F))),
                                           once(dword_be(Mem_GameState) == 0x74 &&
                     	                          byte(Mem_CurrentTurn) == 0x01)) &&
                                  never(getPlayerControlType(2) == 0x01))) ||
                   (measured(getPlayerStars(3) == 21,
                           when = tally(2, once(__ornext(getGameState(0x5B) ||
                     	                                   getGameState(0x6F))),
                                           once(dword_be(Mem_GameState) == 0x74 &&
                     	                          byte(Mem_CurrentTurn) == 0x01)) &&
                                  never(getPlayerControlType(3) == 0x01))))
)

achievement(
    id          = 593723, 
    badge       = "673072",
    type        = "",
    title       = "Road of Fortune",
    description = "Visit a luxury hotel in \"Koopa's Tycoon Town\" and invest in it to get three Stars.",
    points      = 3,
    trigger     = getGameState(0x74) &&
                  !checkPartySubMode("Duel Battle") &&
                  !getPartyPlayerChanging() &&
                  getCurrentPlayerControlType() == 0x00 &&
                  prior(getCurrentPlayerSpaceStanding()) >= 0x100 &&
                  getCurrentPlayerStars() > prev(getCurrentPlayerStars())
)

achievement(
    id          = 594437, 
    badge       = "674014",
    type        = "",
    title       = "Master of the Galaxy",
    description = "Win a Battle Royale on the board \"Bowser's Warped Orbit\" against three CPUs on Hard without reloading and without using Handicaps.",
    points      = 25,
    trigger     = checkPartySubMode("Battle Royale") &&
                  never(getGameState(0x5C)) &&
                  getBoardID() == 0x05 &&
                  never(getPlayerControlType(0)
                      + getPlayerControlType(1)
                      + getPlayerControlType(2)
                      + getPlayerControlType(3) != 3) &&
                  never(getPlayerCoinRecord(0) > 0 &&
                        getPlayerControlType(0) != prev(getPlayerControlType(0))) &&
                  never(getPlayerControlType(0) == 0x01 &&
                        getPlayerDifficulty(0) < 2) &&
                  never(getPlayerControlType(0) == 0x00 &&
                        getPlayerHandicap(0) > 0) &&
                  never(getPlayerCoinRecord(1) > 0 &&
                        getPlayerControlType(1) != prev(getPlayerControlType(1))) &&
                  never(getPlayerControlType(1) == 0x01 &&
                        getPlayerDifficulty(1) < 2) &&
                  never(getPlayerControlType(1) == 0x00 &&
                        getPlayerHandicap(1) > 0) &&
                  never(getPlayerCoinRecord(2) > 0 &&
                        getPlayerControlType(2) != prev(getPlayerControlType(2))) &&
                  never(getPlayerControlType(2) == 0x01 &&
                        getPlayerDifficulty(2) < 2) &&
                  never(getPlayerControlType(2) == 0x00 &&
                        getPlayerHandicap(2) > 0) &&
                  never(getPlayerCoinRecord(3) > 0 &&
                        getPlayerControlType(3) != prev(getPlayerControlType(3))) &&
                  never(getPlayerControlType(3) == 0x01 &&
                        getPlayerDifficulty(3) < 2) &&
                  never(getPlayerControlType(3) == 0x00 &&
                        getPlayerHandicap(3) > 0) &&
                  tally(2, once(__ornext(getGameState(0x5B) ||
                     	                   getGameState(0x6F))),
                           once(dword_be(Mem_GameState) == 0x75 &&
                     	          byte(Mem_CurrentTurn) == 0x01)) &&
                  trigger_when(partyCeremonyFinishedGame()) &&
                  (trigger_when(getPlayerControlType(0) == 0x00 &&
                                getPlayerCeremonyPlacement(0) == 0x00) ||
                   trigger_when(getPlayerControlType(1) == 0x00 &&
                                getPlayerCeremonyPlacement(1) == 0x00) ||
                   trigger_when(getPlayerControlType(2) == 0x00 &&
                                getPlayerCeremonyPlacement(2) == 0x00) ||
                   trigger_when(getPlayerControlType(3) == 0x00 &&
                                getPlayerCeremonyPlacement(3) == 0x00))
)

achievement(
    id          = 593727, 
    badge       = "673075",
    type        = "",
    title       = "Where Do We Go Now?!",
    description = "Change the board direction a total of 7 times on the bigger version of \"Bowser's Warped Orbit\" without reloading.",
    points      = 10,
    trigger     = getGameState(0x75) &&
                  never(getGameState(0x5C)) &&
                  getPlayerIsDoingTurn() &&
                  once(dword_be(Mem_GameState) == 0x75 &&
                       byte(Mem_CurrentTurn) == 0x01) &&
                  once(getCurrentPlayerGreenSpaces() > prev(getCurrentPlayerGreenSpaces()) &&
                       never(getPartyPlayerChanging())) &&
                  measured(tally(7, byte(Mem_BowserBoardDirection) != prev(byte(Mem_BowserBoardDirection))),
                           when = once(dword_be(Mem_GameState) == 0x75 &&
                                       byte(Mem_CurrentTurn) == 0x01))
)

achievement(
    id          = 593725, 
    badge       = "673074",
    type        = "",
    title       = "Sugar Space Rush",
    description = "Visit the Space Buffet near \"Bowser's Warped Orbit\" and get three Candies.",
    points      = 3,
    trigger     = getGameState(0x75) &&
                  !checkPartySubMode("Duel Battle") &&
                  !getPartyPlayerChanging() &&
                  getCurrentPlayerControlType() == 0x00 &&
                  prev(getCurrentPlayerSpaceStanding()) == 0x108 &&
                  prev(getCurrentPlayerSpaceStanding()) != getCurrentPlayerSpaceStanding()
)

achievement(
    id          = 594439, 
    badge       = "674016",
    type        = "",
    title       = "Legendary Party King",
    description = "Win a Battle Royale on any board against three CPUs on Very Hard without reloading and without using Handicaps.",
    points      = 25,
    trigger     = checkPartySubMode("Battle Royale") &&
                  never(getGameState(0x5C)) &&
                  getBoardID() >= 0x00 &&
                  getBoardID() <= 0x05 &&
                  never(getPlayerControlType(0)
                      + getPlayerControlType(1)
                      + getPlayerControlType(2)
                      + getPlayerControlType(3) != 3) &&
                  never(getPlayerCoinRecord(0) > 0 &&
                        getPlayerControlType(0) != prev(getPlayerControlType(0))) &&
                  never(getPlayerControlType(0) == 0x01 &&
                        getPlayerDifficulty(0) < 3) &&
                  never(getPlayerControlType(0) == 0x00 &&
                        getPlayerHandicap(0) > 0) &&
                  never(getPlayerCoinRecord(1) > 0 &&
                        getPlayerControlType(1) != prev(getPlayerControlType(1))) &&
                  never(getPlayerControlType(1) == 0x01 &&
                        getPlayerDifficulty(1) < 3) &&
                  never(getPlayerControlType(1) == 0x00 &&
                        getPlayerHandicap(1) > 0) &&
                  never(getPlayerCoinRecord(2) > 0 &&
                        getPlayerControlType(2) != prev(getPlayerControlType(2))) &&
                  never(getPlayerControlType(2) == 0x01 &&
                        getPlayerDifficulty(2) < 3) &&
                  never(getPlayerControlType(2) == 0x00 &&
                        getPlayerHandicap(2) > 0) &&
                  never(getPlayerCoinRecord(3) > 0 &&
                        getPlayerControlType(3) != prev(getPlayerControlType(3))) &&
                  never(getPlayerControlType(3) == 0x01 &&
                        getPlayerDifficulty(3) < 3) &&
                  never(getPlayerControlType(3) == 0x00 &&
                        getPlayerHandicap(3) > 0) &&
                  tally(2, once(__ornext(getGameState(0x5B) ||
                     	                   getGameState(0x6F))),
                           once(dword_be(Mem_GameState) >= 0x70 &&
                     	          dword_be(Mem_GameState) <= 0x75 &&
                                byte(Mem_CurrentTurn) == 0x01)) &&
                  trigger_when(partyCeremonyFinishedGame()) &&
                  (trigger_when(getPlayerControlType(0) == 0x00 &&
                                getPlayerCeremonyPlacement(0) == 0x00) ||
                   trigger_when(getPlayerControlType(1) == 0x00 &&
                                getPlayerCeremonyPlacement(1) == 0x00) ||
                   trigger_when(getPlayerControlType(2) == 0x00 &&
                                getPlayerCeremonyPlacement(2) == 0x00) ||
                   trigger_when(getPlayerControlType(3) == 0x00 &&
                                getPlayerCeremonyPlacement(3) == 0x00))
)

achievement(
    id          = 594440, 
    badge       = "674018",
    type        = "",
    title       = "Fan's Favorite",
    description = "Get all three bonus stars during the ceremony of a Battle Royale.",
    points      = 10,
    trigger     = never(!getGameState(0x01)) &&
                  ((tally(3, getTotalPlayersInMinigame() == 4 &&
                             prev(getPlayerCeremonyPlacement(0))
                           + prev(getPlayerCeremonyPlacement(1)) > 0 &&
                             getPlayerCeremonyStars(0) > prev(getPlayerCeremonyStars(0)) &&
                           never(getPlayerControlType(0) == 0x01))) ||
                   (tally(3, getTotalPlayersInMinigame() == 4 &&
                             prev(getPlayerCeremonyPlacement(0))
                           + prev(getPlayerCeremonyPlacement(1)) > 0 &&
                             getPlayerCeremonyStars(1) > prev(getPlayerCeremonyStars(1)) &&
                           never(getPlayerControlType(1) == 0x01))) ||
                   (tally(3, getTotalPlayersInMinigame() == 4 &&
                             prev(getPlayerCeremonyPlacement(0))
                           + prev(getPlayerCeremonyPlacement(1)) > 0 &&
                             getPlayerCeremonyStars(2) > prev(getPlayerCeremonyStars(2)) &&
                           never(getPlayerControlType(2) == 0x01))) ||
                   (tally(3, getTotalPlayersInMinigame() == 4 &&
                             prev(getPlayerCeremonyPlacement(0))
                           + prev(getPlayerCeremonyPlacement(1)) > 0 &&
                             getPlayerCeremonyStars(3) > prev(getPlayerCeremonyStars(3)) &&
                           never(getPlayerControlType(3) == 0x01))))
)

achievement(
    id          = 590055, 
    badge       = "668767",
    type        = "",
    title       = "Village Incident of 2002",
    description = "As Mario go through a trauma on \"Goomba's Booty Boardwalk\".",
    points      = 2,
    trigger     = never(!getGameState(0x71)) &&
                  never(getCurrentPlayerCharacterID() != 0x00) &&
                  getPlayerIsDoingTurn() &&
                  never(getPartyPlayerChanging()) &&
                  ((__ornext(!checkPartySubMode("Duel Battle")) &&
                    getCurrentPlayerControlType() == 0x00 &&
                    once(getCurrentPlayerSpaceStanding() == 0x07 &&
                         getCurrentPlayerGreenSpaces() > prev(getCurrentPlayerGreenSpaces())) &&
                    prev(getCurrentPlayerSpaceStanding()) == 0x07 &&
                    getCurrentPlayerSpaceStanding() != prev(getCurrentPlayerSpaceStanding())) ||
                   (__ornext(!checkPartySubMode("Duel Battle")) &&
                    getCurrentPlayerControlType() == 0x00 &&
                    once(getCurrentPlayerSpaceStanding() == 0x1E &&
                         getCurrentPlayerGreenSpaces() > prev(getCurrentPlayerGreenSpaces())) &&
                    prev(getCurrentPlayerSpaceStanding()) == 0x1E &&
                    getCurrentPlayerSpaceStanding() != prev(getCurrentPlayerSpaceStanding())) ||
                   (__ornext(!checkPartySubMode("Duel Battle")) &&
                    getCurrentPlayerControlType() == 0x00 &&
                    once(getCurrentPlayerSpaceStanding() == 0x33 &&
                         getCurrentPlayerGreenSpaces() > prev(getCurrentPlayerGreenSpaces())) &&
                    prev(getCurrentPlayerSpaceStanding()) == 0x33 &&
                    getCurrentPlayerSpaceStanding() != prev(getCurrentPlayerSpaceStanding())) ||
                   (__ornext(checkPartySubMode("Duel Battle")) &&
                    getCurrentPlayerControlType() == 0x00 &&
                    once(getCurrentPlayerSpaceStanding() == 0x07 &&
                         getCurrentPlayerGreenSpaces() > prev(getCurrentPlayerGreenSpaces())) &&
                    prev(getCurrentPlayerSpaceStanding()) == 0x07 &&
                    getCurrentPlayerSpaceStanding() != prev(getCurrentPlayerSpaceStanding())) ||
                   (__ornext(checkPartySubMode("Duel Battle")) &&
                    getCurrentPlayerControlType() == 0x00 &&
                    once(getCurrentPlayerSpaceStanding() == 0x1C &&
                         getCurrentPlayerGreenSpaces() > prev(getCurrentPlayerGreenSpaces())) &&
                    prev(getCurrentPlayerSpaceStanding()) == 0x1C &&
                    getCurrentPlayerSpaceStanding() != prev(getCurrentPlayerSpaceStanding())))
)

achievement(
    id          = 590123, 
    badge       = "669024",
    type        = "",
    title       = "Back to the Lobby",
    description = "As Luigi use a unique method to travel through the mansion of \"King Boo's Haunted Hideaway\".",
    points      = 2,
    trigger     = never(!getGameState(0x72)) &&
                  never(getCurrentPlayerCharacterID() != 0x01) &&
                  getPlayerIsDoingTurn() &&
                  never(getPartyPlayerChanging()) &&
                  ((getPlayerControlType(0) == 0x00 &&
                    getPlayerCharacterID(0) == 0x01 &&
                    getPlayerSpaceStanding(0) != prev(getPlayerSpaceStanding(0)) &&
                    getCurrentPlayerCharacterID() != 0x01 &&
                    once(getCurrentPlayerGreenSpaces() > prev(getCurrentPlayerGreenSpaces()))) ||
                   (getPlayerControlType(1) == 0x00 &&
                    getPlayerCharacterID(1) == 0x01 &&
                    getPlayerSpaceStanding(1) != prev(getPlayerSpaceStanding(1)) &&
                    getCurrentPlayerCharacterID() != 0x01 &&
                    once(getCurrentPlayerGreenSpaces() > prev(getCurrentPlayerGreenSpaces()))) ||
                   (getPlayerControlType(2) == 0x00 &&
                    getPlayerCharacterID(2) == 0x01 &&
                    getPlayerSpaceStanding(2) != prev(getPlayerSpaceStanding(2)) &&
                    getCurrentPlayerCharacterID() != 0x01 &&
                    once(getCurrentPlayerGreenSpaces() > prev(getCurrentPlayerGreenSpaces()))) ||
                   (getPlayerControlType(3) == 0x00 &&
                    getPlayerCharacterID(3) == 0x01 &&
                    getPlayerSpaceStanding(3) != prev(getPlayerSpaceStanding(3)) &&
                    getCurrentPlayerCharacterID() != 0x01 &&
                    once(getCurrentPlayerGreenSpaces() > prev(getCurrentPlayerGreenSpaces()))))
)

achievement(
    id          = 590502, 
    badge       = "669860",
    type        = "",
    title       = "Least I Can Do As A Princess",
    description = "As Peach fully trust in the business ambitions of a Koopa in \"Koopa's Tycoon Town\".",
    points      = 2,
    trigger     = getGameState(0x74) &&
                  getPlayerIsDoingTurn() &&
                  ((checkPartySubMode("Battle Royale") &&
                    getCurrentPlayerCharacterID() == 0x02 &&
                    getPlayerControlType(0) == 0x00 &&
                    getCurrentPlayerInvestmentOfHotel(0) == 100 &&
                    getCurrentPlayerInvestmentOfHotel(0) > prev(getCurrentPlayerInvestmentOfHotel(0))) ||
                   (checkPartySubMode("Battle Royale") &&
                    getCurrentPlayerCharacterID() == 0x02 &&
                    getPlayerControlType(0) == 0x00 &&
                    getCurrentPlayerInvestmentOfHotel(1) == 100 &&
                    getCurrentPlayerInvestmentOfHotel(1) > prev(getCurrentPlayerInvestmentOfHotel(1))) ||
                   (checkPartySubMode("Battle Royale") &&
                    getCurrentPlayerCharacterID() == 0x02 &&
                    getPlayerControlType(0) == 0x00 &&
                    getCurrentPlayerInvestmentOfHotel(2) == 100 &&
                    getCurrentPlayerInvestmentOfHotel(2) > prev(getCurrentPlayerInvestmentOfHotel(2))) ||
                   (checkPartySubMode("Battle Royale") && 
                    getCurrentPlayerCharacterID() == 0x02 &&
                    getPlayerControlType(0) == 0x00 &&
                    getCurrentPlayerInvestmentOfHotel(3) == 100 &&
                    getCurrentPlayerInvestmentOfHotel(3) > prev(getCurrentPlayerInvestmentOfHotel(3))) ||
                   (checkPartySubMode("Battle Royale") && 
                    getCurrentPlayerCharacterID() == 0x02 &&
                    getPlayerControlType(0) == 0x00 &&
                    getCurrentPlayerInvestmentOfHotel(4) == 100 &&
                    getCurrentPlayerInvestmentOfHotel(4) > prev(getCurrentPlayerInvestmentOfHotel(4))) ||
                   (checkPartySubMode("Battle Royale") &&
                    getCurrentPlayerCharacterID() == 0x02 &&
                    getPlayerControlType(0) == 0x00 &&
                    getCurrentPlayerInvestmentOfHotel(5) == 100 &&
                    getCurrentPlayerInvestmentOfHotel(5) > prev(getCurrentPlayerInvestmentOfHotel(5))) ||
                   (checkPartySubMode("Battle Royale") &&
                    getCurrentPlayerCharacterID() == 0x02 &&
                    getPlayerControlType(0) == 0x00 &&
                    getCurrentPlayerInvestmentOfHotel(6) == 100 &&
                    getCurrentPlayerInvestmentOfHotel(6) > prev(getCurrentPlayerInvestmentOfHotel(6))) ||
                   (checkPartySubMode("Tag Battle") &&
                    __ornext((getPlayerControlType(0) * 0x10000 + getPlayerTeamSlot(0) * 0x100 + getPlayerCharacterID(0) == 0x0002) ||
                             (getPlayerControlType(1) * 0x10000 + getPlayerTeamSlot(1) * 0x100 + getPlayerCharacterID(1) == 0x0002) ||
                             (getPlayerControlType(2) * 0x10000 + getPlayerTeamSlot(2) * 0x100 + getPlayerCharacterID(2) == 0x0002) ||
                             (getPlayerControlType(3) * 0x10000 + getPlayerTeamSlot(3) * 0x100 + getPlayerCharacterID(3) == 0x0002)) &&
                    getCurrentPlayerTeamSlot() == getPlayerTeamSlot(0) &&
                    getPlayerInvestmentOfHotel(0, 0) == 100 &&
                    getPlayerInvestmentOfHotel(0, 0) > prev(getPlayerInvestmentOfHotel(0, 0))) ||
                   (checkPartySubMode("Tag Battle") &&
                    __ornext((getPlayerControlType(0) * 0x10000 + getPlayerTeamSlot(0) * 0x100 + getPlayerCharacterID(0) == 0x0002) ||
                             (getPlayerControlType(1) * 0x10000 + getPlayerTeamSlot(1) * 0x100 + getPlayerCharacterID(1) == 0x0002) ||
                             (getPlayerControlType(2) * 0x10000 + getPlayerTeamSlot(2) * 0x100 + getPlayerCharacterID(2) == 0x0002) ||
                             (getPlayerControlType(3) * 0x10000 + getPlayerTeamSlot(3) * 0x100 + getPlayerCharacterID(3) == 0x0002)) &&
                    getCurrentPlayerTeamSlot() == getPlayerTeamSlot(0) &&
                    getPlayerInvestmentOfHotel(1, 0) == 100 &&
                    getPlayerInvestmentOfHotel(1, 0) > prev(getPlayerInvestmentOfHotel(1, 0))) ||
                   (checkPartySubMode("Tag Battle") &&
                    __ornext((getPlayerControlType(0) * 0x10000 + getPlayerTeamSlot(0) * 0x100 + getPlayerCharacterID(0) == 0x0002) ||
                             (getPlayerControlType(1) * 0x10000 + getPlayerTeamSlot(1) * 0x100 + getPlayerCharacterID(1) == 0x0002) ||
                             (getPlayerControlType(2) * 0x10000 + getPlayerTeamSlot(2) * 0x100 + getPlayerCharacterID(2) == 0x0002) ||
                             (getPlayerControlType(3) * 0x10000 + getPlayerTeamSlot(3) * 0x100 + getPlayerCharacterID(3) == 0x0002)) &&
                    getCurrentPlayerTeamSlot() == getPlayerTeamSlot(0) &&
                    getPlayerInvestmentOfHotel(2, 0) == 100 &&
                    getPlayerInvestmentOfHotel(2, 0) > prev(getPlayerInvestmentOfHotel(2, 0))) ||
                   (checkPartySubMode("Tag Battle") &&
                    __ornext((getPlayerControlType(0) * 0x10000 + getPlayerTeamSlot(0) * 0x100 + getPlayerCharacterID(0) == 0x0002) ||
                             (getPlayerControlType(1) * 0x10000 + getPlayerTeamSlot(1) * 0x100 + getPlayerCharacterID(1) == 0x0002) ||
                             (getPlayerControlType(2) * 0x10000 + getPlayerTeamSlot(2) * 0x100 + getPlayerCharacterID(2) == 0x0002) ||
                             (getPlayerControlType(3) * 0x10000 + getPlayerTeamSlot(3) * 0x100 + getPlayerCharacterID(3) == 0x0002)) &&
                    getCurrentPlayerTeamSlot() == getPlayerTeamSlot(0) &&
                    getPlayerInvestmentOfHotel(3, 0) == 100 &&
                    getPlayerInvestmentOfHotel(3, 0) > prev(getPlayerInvestmentOfHotel(3, 0))) ||
                   (checkPartySubMode("Tag Battle") &&
                    __ornext((getPlayerControlType(0) * 0x10000 + getPlayerTeamSlot(0) * 0x100 + getPlayerCharacterID(0) == 0x0002) ||
                             (getPlayerControlType(1) * 0x10000 + getPlayerTeamSlot(1) * 0x100 + getPlayerCharacterID(1) == 0x0002) ||
                             (getPlayerControlType(2) * 0x10000 + getPlayerTeamSlot(2) * 0x100 + getPlayerCharacterID(2) == 0x0002) ||
                             (getPlayerControlType(3) * 0x10000 + getPlayerTeamSlot(3) * 0x100 + getPlayerCharacterID(3) == 0x0002)) &&
                    getCurrentPlayerTeamSlot() == getPlayerTeamSlot(0) &&
                    getPlayerInvestmentOfHotel(4, 0) == 100 &&
                    getPlayerInvestmentOfHotel(4, 0) > prev(getPlayerInvestmentOfHotel(4, 0))) ||
                   (checkPartySubMode("Tag Battle") &&
                    __ornext((getPlayerControlType(0) * 0x10000 + getPlayerTeamSlot(0) * 0x100 + getPlayerCharacterID(0) == 0x0002) ||
                             (getPlayerControlType(1) * 0x10000 + getPlayerTeamSlot(1) * 0x100 + getPlayerCharacterID(1) == 0x0002) ||
                             (getPlayerControlType(2) * 0x10000 + getPlayerTeamSlot(2) * 0x100 + getPlayerCharacterID(2) == 0x0002) ||
                             (getPlayerControlType(3) * 0x10000 + getPlayerTeamSlot(3) * 0x100 + getPlayerCharacterID(3) == 0x0002)) &&
                    getCurrentPlayerTeamSlot() == getPlayerTeamSlot(0) &&
                    getPlayerInvestmentOfHotel(5, 0) == 100 &&
                    getPlayerInvestmentOfHotel(5, 0) > prev(getPlayerInvestmentOfHotel(5, 0))) ||
                   (checkPartySubMode("Tag Battle") &&
                    __ornext((getPlayerControlType(0) * 0x10000 + getPlayerTeamSlot(0) * 0x100 + getPlayerCharacterID(0) == 0x0002) ||
                             (getPlayerControlType(1) * 0x10000 + getPlayerTeamSlot(1) * 0x100 + getPlayerCharacterID(1) == 0x0002) ||
                             (getPlayerControlType(2) * 0x10000 + getPlayerTeamSlot(2) * 0x100 + getPlayerCharacterID(2) == 0x0002) ||
                             (getPlayerControlType(3) * 0x10000 + getPlayerTeamSlot(3) * 0x100 + getPlayerCharacterID(3) == 0x0002)) &&
                    getCurrentPlayerTeamSlot() == getPlayerTeamSlot(0) &&
                    getPlayerInvestmentOfHotel(6, 0) == 100 &&
                    getPlayerInvestmentOfHotel(6, 0) > prev(getPlayerInvestmentOfHotel(6, 0))) ||
                   (checkPartySubMode("Tag Battle") &&
                    __ornext((getPlayerControlType(0) * 0x10000 + getPlayerTeamSlot(0) * 0x100 + getPlayerCharacterID(0) == 0x0102) ||
                             (getPlayerControlType(1) * 0x10000 + getPlayerTeamSlot(1) * 0x100 + getPlayerCharacterID(1) == 0x0102) ||
                             (getPlayerControlType(2) * 0x10000 + getPlayerTeamSlot(2) * 0x100 + getPlayerCharacterID(2) == 0x0102) ||
                             (getPlayerControlType(3) * 0x10000 + getPlayerTeamSlot(3) * 0x100 + getPlayerCharacterID(3) == 0x0102) ||
                             (getPlayerControlType(0) * 0x10000 + getPlayerTeamSlot(0) * 0x100 + getPlayerCharacterID(0) == 0x0202) ||
                             (getPlayerControlType(1) * 0x10000 + getPlayerTeamSlot(1) * 0x100 + getPlayerCharacterID(1) == 0x0202) ||
                             (getPlayerControlType(2) * 0x10000 + getPlayerTeamSlot(2) * 0x100 + getPlayerCharacterID(2) == 0x0202) ||
                             (getPlayerControlType(3) * 0x10000 + getPlayerTeamSlot(3) * 0x100 + getPlayerCharacterID(3) == 0x0202) ||
                             (getPlayerControlType(0) * 0x10000 + getPlayerTeamSlot(0) * 0x100 + getPlayerCharacterID(0) == 0x0302) ||
                             (getPlayerControlType(1) * 0x10000 + getPlayerTeamSlot(1) * 0x100 + getPlayerCharacterID(1) == 0x0302) ||
                             (getPlayerControlType(2) * 0x10000 + getPlayerTeamSlot(2) * 0x100 + getPlayerCharacterID(2) == 0x0302) ||
                             (getPlayerControlType(3) * 0x10000 + getPlayerTeamSlot(3) * 0x100 + getPlayerCharacterID(3) == 0x0302)) &&
                    getCurrentPlayerTeamSlot() != getPlayerTeamSlot(0) &&
                    getPlayerInvestmentOfHotel(0, 1) == 100 &&
                    getPlayerInvestmentOfHotel(0, 1) > prev(getPlayerInvestmentOfHotel(0, 1))) ||
                   (checkPartySubMode("Tag Battle") &&
                    __ornext((getPlayerControlType(0) * 0x10000 + getPlayerTeamSlot(0) * 0x100 + getPlayerCharacterID(0) == 0x0102) ||
                             (getPlayerControlType(1) * 0x10000 + getPlayerTeamSlot(1) * 0x100 + getPlayerCharacterID(1) == 0x0102) ||
                             (getPlayerControlType(2) * 0x10000 + getPlayerTeamSlot(2) * 0x100 + getPlayerCharacterID(2) == 0x0102) ||
                             (getPlayerControlType(3) * 0x10000 + getPlayerTeamSlot(3) * 0x100 + getPlayerCharacterID(3) == 0x0102) ||
                             (getPlayerControlType(0) * 0x10000 + getPlayerTeamSlot(0) * 0x100 + getPlayerCharacterID(0) == 0x0202) ||
                             (getPlayerControlType(1) * 0x10000 + getPlayerTeamSlot(1) * 0x100 + getPlayerCharacterID(1) == 0x0202) ||
                             (getPlayerControlType(2) * 0x10000 + getPlayerTeamSlot(2) * 0x100 + getPlayerCharacterID(2) == 0x0202) ||
                             (getPlayerControlType(3) * 0x10000 + getPlayerTeamSlot(3) * 0x100 + getPlayerCharacterID(3) == 0x0202) ||
                             (getPlayerControlType(0) * 0x10000 + getPlayerTeamSlot(0) * 0x100 + getPlayerCharacterID(0) == 0x0302) ||
                             (getPlayerControlType(1) * 0x10000 + getPlayerTeamSlot(1) * 0x100 + getPlayerCharacterID(1) == 0x0302) ||
                             (getPlayerControlType(2) * 0x10000 + getPlayerTeamSlot(2) * 0x100 + getPlayerCharacterID(2) == 0x0302) ||
                             (getPlayerControlType(3) * 0x10000 + getPlayerTeamSlot(3) * 0x100 + getPlayerCharacterID(3) == 0x0302)) &&
                    getCurrentPlayerTeamSlot() != getPlayerTeamSlot(0) &&
                    getPlayerInvestmentOfHotel(1, 1) == 100 &&
                    getPlayerInvestmentOfHotel(1, 1) > prev(getPlayerInvestmentOfHotel(1, 1))) ||
                   (checkPartySubMode("Tag Battle") &&
                    __ornext((getPlayerControlType(0) * 0x10000 + getPlayerTeamSlot(0) * 0x100 + getPlayerCharacterID(0) == 0x0102) ||
                             (getPlayerControlType(1) * 0x10000 + getPlayerTeamSlot(1) * 0x100 + getPlayerCharacterID(1) == 0x0102) ||
                             (getPlayerControlType(2) * 0x10000 + getPlayerTeamSlot(2) * 0x100 + getPlayerCharacterID(2) == 0x0102) ||
                             (getPlayerControlType(3) * 0x10000 + getPlayerTeamSlot(3) * 0x100 + getPlayerCharacterID(3) == 0x0102) ||
                             (getPlayerControlType(0) * 0x10000 + getPlayerTeamSlot(0) * 0x100 + getPlayerCharacterID(0) == 0x0202) ||
                             (getPlayerControlType(1) * 0x10000 + getPlayerTeamSlot(1) * 0x100 + getPlayerCharacterID(1) == 0x0202) ||
                             (getPlayerControlType(2) * 0x10000 + getPlayerTeamSlot(2) * 0x100 + getPlayerCharacterID(2) == 0x0202) ||
                             (getPlayerControlType(3) * 0x10000 + getPlayerTeamSlot(3) * 0x100 + getPlayerCharacterID(3) == 0x0202) ||
                             (getPlayerControlType(0) * 0x10000 + getPlayerTeamSlot(0) * 0x100 + getPlayerCharacterID(0) == 0x0302) ||
                             (getPlayerControlType(1) * 0x10000 + getPlayerTeamSlot(1) * 0x100 + getPlayerCharacterID(1) == 0x0302) ||
                             (getPlayerControlType(2) * 0x10000 + getPlayerTeamSlot(2) * 0x100 + getPlayerCharacterID(2) == 0x0302) ||
                             (getPlayerControlType(3) * 0x10000 + getPlayerTeamSlot(3) * 0x100 + getPlayerCharacterID(3) == 0x0302)) &&
                    getCurrentPlayerTeamSlot() != getPlayerTeamSlot(0) &&
                    getPlayerInvestmentOfHotel(2, 1) == 100 &&
                    getPlayerInvestmentOfHotel(2, 1) > prev(getPlayerInvestmentOfHotel(2, 1))) ||
                   (checkPartySubMode("Tag Battle") &&
                    __ornext((getPlayerControlType(0) * 0x10000 + getPlayerTeamSlot(0) * 0x100 + getPlayerCharacterID(0) == 0x0102) ||
                             (getPlayerControlType(1) * 0x10000 + getPlayerTeamSlot(1) * 0x100 + getPlayerCharacterID(1) == 0x0102) ||
                             (getPlayerControlType(2) * 0x10000 + getPlayerTeamSlot(2) * 0x100 + getPlayerCharacterID(2) == 0x0102) ||
                             (getPlayerControlType(3) * 0x10000 + getPlayerTeamSlot(3) * 0x100 + getPlayerCharacterID(3) == 0x0102) ||
                             (getPlayerControlType(0) * 0x10000 + getPlayerTeamSlot(0) * 0x100 + getPlayerCharacterID(0) == 0x0202) ||
                             (getPlayerControlType(1) * 0x10000 + getPlayerTeamSlot(1) * 0x100 + getPlayerCharacterID(1) == 0x0202) ||
                             (getPlayerControlType(2) * 0x10000 + getPlayerTeamSlot(2) * 0x100 + getPlayerCharacterID(2) == 0x0202) ||
                             (getPlayerControlType(3) * 0x10000 + getPlayerTeamSlot(3) * 0x100 + getPlayerCharacterID(3) == 0x0202) ||
                             (getPlayerControlType(0) * 0x10000 + getPlayerTeamSlot(0) * 0x100 + getPlayerCharacterID(0) == 0x0302) ||
                             (getPlayerControlType(1) * 0x10000 + getPlayerTeamSlot(1) * 0x100 + getPlayerCharacterID(1) == 0x0302) ||
                             (getPlayerControlType(2) * 0x10000 + getPlayerTeamSlot(2) * 0x100 + getPlayerCharacterID(2) == 0x0302) ||
                             (getPlayerControlType(3) * 0x10000 + getPlayerTeamSlot(3) * 0x100 + getPlayerCharacterID(3) == 0x0302)) &&
                    getCurrentPlayerTeamSlot() != getPlayerTeamSlot(0) &&
                    getPlayerInvestmentOfHotel(3, 1) == 100 &&
                    getPlayerInvestmentOfHotel(3, 1) > prev(getPlayerInvestmentOfHotel(3, 1))) ||
                   (checkPartySubMode("Tag Battle") &&
                    __ornext((getPlayerControlType(0) * 0x10000 + getPlayerTeamSlot(0) * 0x100 + getPlayerCharacterID(0) == 0x0102) ||
                             (getPlayerControlType(1) * 0x10000 + getPlayerTeamSlot(1) * 0x100 + getPlayerCharacterID(1) == 0x0102) ||
                             (getPlayerControlType(2) * 0x10000 + getPlayerTeamSlot(2) * 0x100 + getPlayerCharacterID(2) == 0x0102) ||
                             (getPlayerControlType(3) * 0x10000 + getPlayerTeamSlot(3) * 0x100 + getPlayerCharacterID(3) == 0x0102) ||
                             (getPlayerControlType(0) * 0x10000 + getPlayerTeamSlot(0) * 0x100 + getPlayerCharacterID(0) == 0x0202) ||
                             (getPlayerControlType(1) * 0x10000 + getPlayerTeamSlot(1) * 0x100 + getPlayerCharacterID(1) == 0x0202) ||
                             (getPlayerControlType(2) * 0x10000 + getPlayerTeamSlot(2) * 0x100 + getPlayerCharacterID(2) == 0x0202) ||
                             (getPlayerControlType(3) * 0x10000 + getPlayerTeamSlot(3) * 0x100 + getPlayerCharacterID(3) == 0x0202) ||
                             (getPlayerControlType(0) * 0x10000 + getPlayerTeamSlot(0) * 0x100 + getPlayerCharacterID(0) == 0x0302) ||
                             (getPlayerControlType(1) * 0x10000 + getPlayerTeamSlot(1) * 0x100 + getPlayerCharacterID(1) == 0x0302) ||
                             (getPlayerControlType(2) * 0x10000 + getPlayerTeamSlot(2) * 0x100 + getPlayerCharacterID(2) == 0x0302) ||
                             (getPlayerControlType(3) * 0x10000 + getPlayerTeamSlot(3) * 0x100 + getPlayerCharacterID(3) == 0x0302)) &&
                    getCurrentPlayerTeamSlot() != getPlayerTeamSlot(0) &&
                    getPlayerInvestmentOfHotel(4, 1) == 100 &&
                    getPlayerInvestmentOfHotel(4, 1) > prev(getPlayerInvestmentOfHotel(4, 1))) ||
                   (checkPartySubMode("Tag Battle") &&
                    __ornext((getPlayerControlType(0) * 0x10000 + getPlayerTeamSlot(0) * 0x100 + getPlayerCharacterID(0) == 0x0102) ||
                             (getPlayerControlType(1) * 0x10000 + getPlayerTeamSlot(1) * 0x100 + getPlayerCharacterID(1) == 0x0102) ||
                             (getPlayerControlType(2) * 0x10000 + getPlayerTeamSlot(2) * 0x100 + getPlayerCharacterID(2) == 0x0102) ||
                             (getPlayerControlType(3) * 0x10000 + getPlayerTeamSlot(3) * 0x100 + getPlayerCharacterID(3) == 0x0102) ||
                             (getPlayerControlType(0) * 0x10000 + getPlayerTeamSlot(0) * 0x100 + getPlayerCharacterID(0) == 0x0202) ||
                             (getPlayerControlType(1) * 0x10000 + getPlayerTeamSlot(1) * 0x100 + getPlayerCharacterID(1) == 0x0202) ||
                             (getPlayerControlType(2) * 0x10000 + getPlayerTeamSlot(2) * 0x100 + getPlayerCharacterID(2) == 0x0202) ||
                             (getPlayerControlType(3) * 0x10000 + getPlayerTeamSlot(3) * 0x100 + getPlayerCharacterID(3) == 0x0202) ||
                             (getPlayerControlType(0) * 0x10000 + getPlayerTeamSlot(0) * 0x100 + getPlayerCharacterID(0) == 0x0302) ||
                             (getPlayerControlType(1) * 0x10000 + getPlayerTeamSlot(1) * 0x100 + getPlayerCharacterID(1) == 0x0302) ||
                             (getPlayerControlType(2) * 0x10000 + getPlayerTeamSlot(2) * 0x100 + getPlayerCharacterID(2) == 0x0302) ||
                             (getPlayerControlType(3) * 0x10000 + getPlayerTeamSlot(3) * 0x100 + getPlayerCharacterID(3) == 0x0302)) &&
                    getCurrentPlayerTeamSlot() != getPlayerTeamSlot(0) &&
                    getPlayerInvestmentOfHotel(5, 1) == 100 &&
                    getPlayerInvestmentOfHotel(5, 1) > prev(getPlayerInvestmentOfHotel(5, 1))) ||
                   (checkPartySubMode("Tag Battle") &&
                    __ornext((getPlayerControlType(0) * 0x10000 + getPlayerTeamSlot(0) * 0x100 + getPlayerCharacterID(0) == 0x0102) ||
                             (getPlayerControlType(1) * 0x10000 + getPlayerTeamSlot(1) * 0x100 + getPlayerCharacterID(1) == 0x0102) ||
                             (getPlayerControlType(2) * 0x10000 + getPlayerTeamSlot(2) * 0x100 + getPlayerCharacterID(2) == 0x0102) ||
                             (getPlayerControlType(3) * 0x10000 + getPlayerTeamSlot(3) * 0x100 + getPlayerCharacterID(3) == 0x0102) ||
                             (getPlayerControlType(0) * 0x10000 + getPlayerTeamSlot(0) * 0x100 + getPlayerCharacterID(0) == 0x0202) ||
                             (getPlayerControlType(1) * 0x10000 + getPlayerTeamSlot(1) * 0x100 + getPlayerCharacterID(1) == 0x0202) ||
                             (getPlayerControlType(2) * 0x10000 + getPlayerTeamSlot(2) * 0x100 + getPlayerCharacterID(2) == 0x0202) ||
                             (getPlayerControlType(3) * 0x10000 + getPlayerTeamSlot(3) * 0x100 + getPlayerCharacterID(3) == 0x0202) ||
                             (getPlayerControlType(0) * 0x10000 + getPlayerTeamSlot(0) * 0x100 + getPlayerCharacterID(0) == 0x0302) ||
                             (getPlayerControlType(1) * 0x10000 + getPlayerTeamSlot(1) * 0x100 + getPlayerCharacterID(1) == 0x0302) ||
                             (getPlayerControlType(2) * 0x10000 + getPlayerTeamSlot(2) * 0x100 + getPlayerCharacterID(2) == 0x0302) ||
                             (getPlayerControlType(3) * 0x10000 + getPlayerTeamSlot(3) * 0x100 + getPlayerCharacterID(3) == 0x0302)) &&
                    getCurrentPlayerTeamSlot() != getPlayerTeamSlot(0) &&
                    getPlayerInvestmentOfHotel(6, 1) == 100 &&
                    getPlayerInvestmentOfHotel(6, 1) > prev(getPlayerInvestmentOfHotel(6, 1))) ||
                   (checkPartySubMode("Duel Battle") &&
                    getCurrentPlayerCharacterID() == 0x02 &&
                    getPlayerControlType(0) == 0x00 &&
                    getCurrentPlayerInvestmentOfHotel(0) == 100 &&
                    getCurrentPlayerInvestmentOfHotel(0) > prev(getCurrentPlayerInvestmentOfHotel(0))) ||
                   (checkPartySubMode("Duel Battle") &&
                   getPlayerControlType(0) == 0x00 &&
                    getCurrentPlayerCharacterID() == 0x02 &&
                    getCurrentPlayerInvestmentOfHotel(1) == 100 &&
                    getCurrentPlayerInvestmentOfHotel(1) > prev(getCurrentPlayerInvestmentOfHotel(1))) ||
                   (checkPartySubMode("Duel Battle") &&
                   getPlayerControlType(0) == 0x00 &&
                    getCurrentPlayerCharacterID() == 0x02 &&
                    getCurrentPlayerInvestmentOfHotel(4) == 100 &&
                    getCurrentPlayerInvestmentOfHotel(4) > prev(getCurrentPlayerInvestmentOfHotel(4))))
)

achievement(
    id          = 592091, 
    badge       = "671059",
    type        = "",
    title       = "Dinosaur Steak On the Run",
    description = "As Yoshi get attacked by a hungry jungle tribe who is hunting for food on \"DK's Treetop Temple\".",
    points      = 2,
    trigger     = getGameState(0x70) &&
                  getCurrentPlayerCharacterID() == 0x03 &&
                  getCurrentPlayerControlType() == 0x00 &&
                  getPlayerIsDoingTurn() &&
                  !getPartyPlayerChanging() &&
                  getCurrentPlayerCoins() > prev(getCurrentPlayerCoins()) &&
                  ((!checkPartySubMode("Duel Battle") &&
                     getCurrentPlayerSpaceStanding() == 0x31) ||
                   (!checkPartySubMode("Duel Battle") &&
                     getCurrentPlayerSpaceStanding() == 0x60) ||
                   (checkPartySubMode("Duel Battle") &&
                     getCurrentPlayerSpaceStanding() == 0x1C) ||
                   (checkPartySubMode("Duel Battle") &&
                     getCurrentPlayerSpaceStanding() == 0x49))
)

achievement(
    id          = 591538, 
    badge       = "670422",
    type        = "",
    title       = "Wario Blast 2: The Stars",
    description = "As Wario blast away three of your opponents using one explosive in \"Bowser's Warped Orbit\".",
    points      = 2,
    trigger     = never(!getGameState(0x75)) &&
                  never(getCurrentPlayerCharacterID() != 0x04) &&
                  getPlayerIsDoingTurn() &&
                  never(getPartyPlayerChanging()) &&
                  getCurrentPlayerControlType() == 0x00 &&
                  tally(3, (getCurrentPlayerCandyEffect() == 0x0D &&
                               getCurrentPlayerTeamSlot() != getPlayerTeamSlot(0) &&
                               getCurrentPlayerSpaceStanding() != prev(getCurrentPlayerSpaceStanding()) &&
                               getCurrentPlayerSpaceStanding() == getPlayerSpaceStanding(0) &&
                               prev(getCurrentPlayerSpaceStanding()) != prev(getPlayerSpaceStanding(0))),
                           (getCurrentPlayerCandyEffect() == 0x0D &&
                               getCurrentPlayerTeamSlot() != getPlayerTeamSlot(1) &&
                               getCurrentPlayerSpaceStanding() != prev(getCurrentPlayerSpaceStanding()) &&
                               getCurrentPlayerSpaceStanding() == getPlayerSpaceStanding(1) &&
                               prev(getCurrentPlayerSpaceStanding()) != prev(getPlayerSpaceStanding(1))),
                           (getCurrentPlayerCandyEffect() == 0x0D &&
                               !checkPartySubMode("Duel Battle") &&
                               getCurrentPlayerTeamSlot() != getPlayerTeamSlot(2) &&
                               getCurrentPlayerSpaceStanding() != prev(getCurrentPlayerSpaceStanding()) &&
                               getCurrentPlayerSpaceStanding() == getPlayerSpaceStanding(2) &&
                               prev(getCurrentPlayerSpaceStanding()) != prev(getPlayerSpaceStanding(2))),
                           (getCurrentPlayerCandyEffect() == 0x0D &&
                               !checkPartySubMode("Duel Battle") &&
                               getCurrentPlayerTeamSlot() != getPlayerTeamSlot(3) &&
                               getCurrentPlayerSpaceStanding() != prev(getCurrentPlayerSpaceStanding()) &&
                               getCurrentPlayerSpaceStanding() == getPlayerSpaceStanding(3) &&
                               prev(getCurrentPlayerSpaceStanding()) != prev(getPlayerSpaceStanding(3))))
)

achievement(
    id          = 590490, 
    badge       = "669840",
    type        = "",
    title       = "Just What I Need-oh!",
    description = "As Daisy get hit by a coin rain while walking through the streets of \"Koopa's Tycoon Town\".",
    points      = 2,
    trigger     = never(!getGameState(0x74)) &&
                  never(getCurrentPlayerCharacterID() != 0x05) &&
                  getPlayerIsDoingTurn() &&
                  never(getPartyPlayerChanging()) &&
                  getCurrentPlayerControlType() == 0x00 &&
                  getCurrentPlayerCharacterID() == 0x05 &&
                  getCurrentPlayerCoins() > prev(getCurrentPlayerCoins()) &&
                  ((__ornext(!checkPartySubMode("Duel Battle")) &&
                     once(getCurrentPlayerSpaceStanding() == 0x2F &&
                          getCurrentPlayerGreenSpaces() > prev(getCurrentPlayerGreenSpaces())) &&
                     getCurrentPlayerSpaceStanding() == 0x2F) ||
                   (__ornext(!checkPartySubMode("Duel Battle")) &&
                     once(getCurrentPlayerSpaceStanding() == 0x60 &&
                          getCurrentPlayerGreenSpaces() > prev(getCurrentPlayerGreenSpaces())) &&
                     getCurrentPlayerSpaceStanding() == 0x60) ||
                   (__ornext(checkPartySubMode("Duel Battle")) &&
                     once(getCurrentPlayerSpaceStanding() == 0x42 &&
                          getCurrentPlayerGreenSpaces() > prev(getCurrentPlayerGreenSpaces())) &&
                     getCurrentPlayerSpaceStanding() == 0x42))
)

achievement(
    id          = 589986, 
    badge       = "668695",
    type        = "",
    title       = "Biting Heat of the Sun",
    description = "As Waluigi suffer from the sun on \"Goomba's Booty Boardwalk\".",
    points      = 2,
    trigger     = getGameState(0x71) &&
                  getCurrentPlayerCharacterID() == 0x06 &&
                  getCurrentPlayerControlType() == 0x00 &&
                  getPlayerIsDoingTurn() &&
                  !getPartyPlayerChanging() &&
                  getCurrentPlayerCandyEffect() != prev(getCurrentPlayerCandyEffect()) &&
                  getCurrentPlayerCandyEffect() == 0x06
)

achievement(
    id          = 592315, 
    badge       = "671391",
    type        = "",
    title       = "Mischievous Train Mystery",
    description = "As Toad help to arrest a criminal on \"Shy Guy's Perplex Express\".",
    points      = 2,
    trigger     = never(!getGameState(0x73)) &&
                  never(getCurrentPlayerCharacterID() != 0x07) &&
                  getPlayerIsDoingTurn() &&
                  never(getPartyPlayerChanging()) &&
                  ((__ornext(!checkPartySubMode("Duel Battle")) &&
                    getCurrentPlayerControlType() == 0x00 &&
                    getCurrentPlayerCharacterID() == 0x07 &&
                    once(getCurrentPlayerSpaceStanding() == 0x2B &&
                         getCurrentPlayerGreenSpaces() > prev(getCurrentPlayerGreenSpaces())) &&
                    getCurrentPlayerSpaceStanding() == 0x2B &&
                    getCurrentPlayerCoins() > prev(getCurrentPlayerCoins())) ||
                   (__ornext(checkPartySubMode("Duel Battle")) &&
                    getCurrentPlayerControlType() == 0x00 &&
                    getCurrentPlayerCharacterID() == 0x07 &&
                    once(getCurrentPlayerSpaceStanding() == 0x2B &&
                         getCurrentPlayerGreenSpaces() > prev(getCurrentPlayerGreenSpaces())) &&
                    getCurrentPlayerSpaceStanding() == 0x2B &&
                    getCurrentPlayerCoins() > prev(getCurrentPlayerCoins())))
)

achievement(
    id          = 590874, 
    badge       = "670159",
    type        = "",
    title       = "Call of the Haunted King",
    description = "As Boo get a Star from your leader during your first 15 spaces in the mansion on \"King Boo's Haunted Hideaway\".",
    points      = 2,
    trigger     = getGameState(0x72) &&
                  wasInGameState(0x72) &&
                  __ornext(getPlayerControlType(0) * 0x100 + getPlayerCharacterID(0) == 0x08 ||
                           getPlayerControlType(1) * 0x100 + getPlayerCharacterID(1) == 0x08 ||
                           getPlayerControlType(2) * 0x100 + getPlayerCharacterID(2) == 0x08 ||
                           getPlayerControlType(3) * 0x100 + getPlayerCharacterID(3) == 0x08) &&
                  never(getGameState(0x5C)) &&
                  getCurrentPlayerCharacterID() == 0x08 &&
                  getCurrentPlayerControlType() == 0x00 &&
                  getPlayerIsDoingTurn() &&
                  once(getDiscoveredRoomsInMansion() == 0x01 &&
                       never(getDiscoveredRoomsInMansion() == 0x00) &&
                       never(getGameState(0x5C))) &&
                  repeated(1, getCurrentPlayerCharacterID() == 0x08 &&
                              getCurrentPlayerCoins() < prev(getCurrentPlayerCoins()) &&
                              never(getPartyPlayerChanging()) &&
                              never(getCurrentPlayerSpaceStanding() != prev(getCurrentPlayerSpaceStanding())) &&
                              never(getGameState(0x5C))) &&
                  ((getCurrentPlayerStars() > prev(getCurrentPlayerStars())) ||
                   (pseudoImpossibleCondition() && 
                    measured(repeated(15, getCurrentPlayerCharacterID() == 0x08 &&
                                          getCurrentPlayerSpacesWalked() > prev(getCurrentPlayerSpacesWalked()) &&
                                          never(getDiscoveredRoomsInMansion() == 0x00) &&
                                          never(getGameState(0x5C))), when = once(getDiscoveredRoomsInMansion() == 0x01) &&
                                                                             never(getDiscoveredRoomsInMansion() == 0x00) &&
                                                                             never(getGameState(0x5C))) &&
                                                                             never(repeated(16, getCurrentPlayerCharacterID() == 0x08 &&
                                                                                   getCurrentPlayerSpacesWalked() > prev(getCurrentPlayerSpacesWalked()) &&
                                                                                   never(getDiscoveredRoomsInMansion() == 0x00) &&
                                                                                   never(getGameState(0x5C)))))) &&
                  unless(repeated(16, getCurrentPlayerCharacterID() == 0x08 &&
                                      getCurrentPlayerSpacesWalked() > prev(getCurrentPlayerSpacesWalked()) &&
                                      never(getDiscoveredRoomsInMansion() == 0x00) &&
                                      never(getGameState(0x5C))))
)

achievement(
    id          = 591590, 
    badge       = "670424",
    type        = "",
    title       = "Sweet Tooth Delivery Service",
    description = "As Toadette buy some Candy at the shop and immediately share it with one of the other guests in \"Shy Guy's Perplex Express\".",
    points      = 2,
    trigger     = never(!getGameState(0x73)) &&
                  never(getCurrentPlayerCharacterID() != 0x09) &&
                  getPlayerIsDoingTurn() &&
                  never(getPartyPlayerChanging()) &&
                  getCurrentPlayerControlType() == 0x00 &&
                  !checkPartySubMode("Duel Battle") &&
                  tally(1, (getCurrentPlayerSpaceStanding() == 0x33 &&
                            getCurrentPlayerCoins() < prev(getCurrentPlayerCoins())) ||
                           (getCurrentPlayerSpaceStanding() == 0x43 &&
                            getCurrentPlayerCoins() < prev(getCurrentPlayerCoins()))) &&
                  getCurrentPlayerSpaceStanding() == 0x0C &&
                  getCurrentPlayerCoins() > prev(getCurrentPlayerCoins())
)

achievement(
    id          = 592316, 
    badge       = "671392",
    type        = "",
    title       = "Luxury Life of a Queen",
    description = "As Birdo get a free ride in \"Koopa's Tycoon Town\".",
    points      = 2,
    trigger     = never(!getGameState(0x74)) &&
                  never(getCurrentPlayerCharacterID() != 0x0A) &&
                  getPlayerIsDoingTurn() &&
                  never(getPartyPlayerChanging()) &&
                  ((__ornext(!checkPartySubMode("Duel Battle")) &&
                    getCurrentPlayerControlType() == 0x00 &&
                    once(getCurrentPlayerSpaceStanding() == 0x14 &&
                         getCurrentPlayerLuckySpaces() > prev(getCurrentPlayerLuckySpaces())) &&
                    prev(getCurrentPlayerSpaceStanding()) == 0x14 &&
                    getCurrentPlayerSpaceStanding() != prev(getCurrentPlayerSpaceStanding())) ||
                   (__ornext(!checkPartySubMode("Duel Battle")) &&
                    getCurrentPlayerControlType() == 0x00 &&
                    once(getCurrentPlayerSpaceStanding() == 0x15 &&
                         getCurrentPlayerLuckySpaces() > prev(getCurrentPlayerLuckySpaces())) &&
                    prev(getCurrentPlayerSpaceStanding()) == 0x15 &&
                    getCurrentPlayerSpaceStanding() != prev(getCurrentPlayerSpaceStanding())) ||
                   (__ornext(!checkPartySubMode("Duel Battle")) &&
                    getCurrentPlayerControlType() == 0x00 &&
                    once(getCurrentPlayerSpaceStanding() == 0x46 &&
                         getCurrentPlayerGreenSpaces() > prev(getCurrentPlayerGreenSpaces())) &&
                    prev(getCurrentPlayerSpaceStanding()) == 0x46 &&
                    getCurrentPlayerSpaceStanding() != prev(getCurrentPlayerSpaceStanding())) ||
                   (__ornext(checkPartySubMode("Duel Battle")) &&
                    getCurrentPlayerControlType() == 0x00 &&
                    once(getCurrentPlayerSpaceStanding() == 0x2E &&
                         getCurrentPlayerGreenSpaces() > prev(getCurrentPlayerGreenSpaces())) &&
                    prev(getCurrentPlayerSpaceStanding()) == 0x2E &&
                    getCurrentPlayerSpaceStanding() != prev(getCurrentPlayerSpaceStanding())))
)
                    
achievement(
    id          = 592310, 
    badge       = "671361",
    type        = "",
    title       = "Paleontological Discovery",
    description = "As Dry Bones excavate some valuables on \"Goomba's Booty Boardwalk\".",
    points      = 2,
    trigger     = never(!getGameState(0x71)) &&
                  never(getCurrentPlayerCharacterID() != 0x0B) &&
                  getPlayerIsDoingTurn() &&
                  never(getPartyPlayerChanging()) &&
                  ((__ornext(!checkPartySubMode("Duel Battle")) &&
                    getCurrentPlayerControlType() == 0x00 &&
                    getCurrentPlayerCharacterID() == 0x0B &&
                    once(getCurrentPlayerSpaceStanding() == 0x36 &&
                         getCurrentPlayerGreenSpaces() > prev(getCurrentPlayerGreenSpaces())) &&
                    getCurrentPlayerSpaceStanding() == 0x36 &&
                    getCurrentPlayerCoins() > prev(getCurrentPlayerCoins())))
)

achievement(
    id          = 592312, 
    badge       = "671369",
    type        = "",
    title       = "Hyper Space Jelly Experiment",
    description = "As Blooper travel with hyperspeed to the other side of \"Bowser's Warped Orbit\".",
    points      = 2,
    trigger     = getGameState(0x75) &&
                  getCurrentPlayerCharacterID() == 0x0C &&
                  getPlayerIsDoingTurn() &&
                  !getPartyPlayerChanging() &&
                  ((__ornext(!checkPartySubMode("Duel Battle")) &&
                    getCurrentPlayerControlType() == 0x00 &&
                    getCurrentPlayerCharacterID() == 0x0C &&
                    getCurrentPlayerSpaceStanding() == 0x10 && 
                    prev(getCurrentPlayerSpaceStanding()) == 0x36) ||
                   (__ornext(!checkPartySubMode("Duel Battle")) &&
                    getCurrentPlayerControlType() == 0x00 &&
                    getCurrentPlayerCharacterID() == 0x0C &&
                    getCurrentPlayerSpaceStanding() == 0x21 && 
                    prev(getCurrentPlayerSpaceStanding()) == 0x3A) ||
                   (__ornext(!checkPartySubMode("Duel Battle")) &&
                    getCurrentPlayerControlType() == 0x00 &&
                    getCurrentPlayerCharacterID() == 0x0C &&
                    getCurrentPlayerSpaceStanding() == 0x36 && 
                    prev(getCurrentPlayerSpaceStanding()) == 0x10) ||
                   (__ornext(!checkPartySubMode("Duel Battle")) &&
                    getCurrentPlayerControlType() == 0x00 &&
                    getCurrentPlayerCharacterID() == 0x0C &&
                    getCurrentPlayerSpaceStanding() == 0x3A && 
                    prev(getCurrentPlayerSpaceStanding()) == 0x21) ||
                   (__ornext(checkPartySubMode("Duel Battle")) &&
                    getCurrentPlayerControlType() == 0x00 &&
                    getCurrentPlayerCharacterID() == 0x0C &&
                    getCurrentPlayerSpaceStanding() == 0x1D && 
                    prev(getCurrentPlayerSpaceStanding()) == 0x1F) ||
                   (__ornext(checkPartySubMode("Duel Battle")) &&
                    getCurrentPlayerControlType() == 0x00 &&
                    getCurrentPlayerCharacterID() == 0x0C &&
                    getCurrentPlayerSpaceStanding() == 0x1F && 
                    prev(getCurrentPlayerSpaceStanding()) == 0x1D))
)

achievement(
    id          = 591539, 
    badge       = "671058",
    type        = "",
    title       = "King Koopa Knockout",
    description = "As Hammer Bro get 5 Stars in a single turn on \"Bowser's Warped Orbit\".",
    points      = 2,
    trigger     = never(!getGameState(0x75)) &&
                  never(getCurrentPlayerCharacterID() != 0x0D) &&
                  getPlayerIsDoingTurn() &&
                  never(getPartyPlayerChanging()) &&
                  getCurrentPlayerControlType() == 0x00 &&
                  getCurrentPlayerCandyEffect() == 0x0E &&
                  tally(5, !getPartyPlayerChanging() &&
                            getCurrentPlayerStars() > prev(getCurrentPlayerStars()))
)

achievement(
    id          = 594442, 
    badge       = "674020",
    type        = "",
    title       = "Digital Dexterity",
    description = "While using a Twice Candy or Thrice Candy get some Coins by rolling the same number with all dice.",
    points      = 5,
    trigger     = never(!getGameState(0x70) &&
                        !getGameState(0x71) &&
                        !getGameState(0x72) &&
                        !getGameState(0x73) &&
                        !getGameState(0x74) &&
                        !getGameState(0x75)) &&
                  getPlayerIsDoingTurn() &&
                  never(getPartyPlayerChanging()) &&    
                  never(getCurrentPlayerControlType() != 0x00) &&
                  once(getCurrentPlayerCandyEffect() <= 0x01 &&
                       prev(getCurrentPlayerCandyEffect()) == 0xFFFF) &&
                  getCurrentPlayerCoins() > prev(getCurrentPlayerCoins()) &&
                  never(getCurrentPlayerSpaceStanding() != prev(getCurrentPlayerSpaceStanding()))
)

achievement(
    id          = 593728, 
    badge       = "673076",
    type        = "",
    title       = "That's What I Call A Strike!",
    description = "While using the Bowlo Candy hit all three of your opponents in a single turn.",
    points      = 5,
    trigger     = never(!getGameState(0x70) &&
                        !getGameState(0x71) &&
                        !getGameState(0x72) &&
                        !getGameState(0x73) &&
                        !getGameState(0x74) &&
                        !getGameState(0x75)) &&
                  never(!checkPartySubMode("Battle Royale")) &&
                  getPlayerIsDoingTurn() &&
                  never(getPartyPlayerChanging()) &&
                  getCurrentPlayerControlType() == 0x00 &&
                  tally(3, once(getCurrentPlayerCandyEffect() == 0x09 &&
                                getCurrentPlayerTeamSlot() != getPlayerTeamSlot(0) &&
                                getCurrentPlayerSpaceStanding() != prev(getCurrentPlayerSpaceStanding()) &&
                                getCurrentPlayerSpaceStanding() == getPlayerSpaceStanding(0) &&
                                prev(getCurrentPlayerSpaceStanding()) != prev(getPlayerSpaceStanding(0))),
                           once(getCurrentPlayerCandyEffect() == 0x09 &&
                                getCurrentPlayerTeamSlot() != getPlayerTeamSlot(1) &&
                                getCurrentPlayerSpaceStanding() != prev(getCurrentPlayerSpaceStanding()) &&
                                getCurrentPlayerSpaceStanding() == getPlayerSpaceStanding(1) &&
                                prev(getCurrentPlayerSpaceStanding()) != prev(getPlayerSpaceStanding(1))),
                           once(getCurrentPlayerCandyEffect() == 0x09 &&
                                getCurrentPlayerTeamSlot() != getPlayerTeamSlot(2) &&
                                getCurrentPlayerSpaceStanding() != prev(getCurrentPlayerSpaceStanding()) &&
                                getCurrentPlayerSpaceStanding() == getPlayerSpaceStanding(2) &&
                                prev(getCurrentPlayerSpaceStanding()) != prev(getPlayerSpaceStanding(2))),
                           once(getCurrentPlayerCandyEffect() == 0x09 &&
                                getCurrentPlayerTeamSlot() != getPlayerTeamSlot(3) &&
                                getCurrentPlayerSpaceStanding() != prev(getCurrentPlayerSpaceStanding()) &&
                                getCurrentPlayerSpaceStanding() == getPlayerSpaceStanding(3) &&
                                prev(getCurrentPlayerSpaceStanding()) != prev(getPlayerSpaceStanding(3))))
)

achievement(
    id          = 594202, 
    badge       = "673891",
    type        = "",
    title       = "One With the Waves",
    description = "Get 17 Coins in the minigame \"Water Ski Spree\".",
    points      = 3,
    trigger     = getGameState(0x0B) &&
                  ((getPlayerControlType(0) == 0x00 &&
                    getPlayerMinigamePrize(0) == 17 &&
                    prev(getPlayerMinigamePrize(0)) == 0) ||
                   (getPlayerControlType(1) == 0x00 &&
                    getPlayerMinigamePrize(1) == 17 &&
                    prev(getPlayerMinigamePrize(1)) == 0) ||
                   (getPlayerControlType(2) == 0x00 &&
                    getPlayerMinigamePrize(2) == 17 &&
                    prev(getPlayerMinigamePrize(2)) == 0) ||
                   (getPlayerControlType(3) == 0x00 &&
                    getPlayerMinigamePrize(3) == 17 &&
                    prev(getPlayerMinigamePrize(3)) == 0) ||
                   (getPlayerControlType(0) == 0x00 &&
                    getPlayerMinigamePrize(0) == 17 * 0x10000 &&
                    prev(getPlayerMinigamePrize(0)) == 0) ||
                   (getPlayerControlType(1) == 0x00 &&
                    getPlayerMinigamePrize(1) == 17 * 0x10000 &&
                    prev(getPlayerMinigamePrize(1)) == 0) ||
                   (getPlayerControlType(2) == 0x00 &&
                    getPlayerMinigamePrize(2) == 17 * 0x10000 &&
                    prev(getPlayerMinigamePrize(2)) == 0) ||
                   (getPlayerControlType(3) == 0x00 &&
                    getPlayerMinigamePrize(3) == 17 * 0x10000 &&
                    prev(getPlayerMinigamePrize(3)) == 0))
)

achievement(
    id          = 594398, 
    badge       = "673947",
    type        = "",
    title       = "All That Glitters",
    description = "Get 16 Coins as single player in the minigame \"Grabbin' Gold\".",
    points      = 2,
    trigger     = getGameState(0x19) &&
                  ((getPlayerControlType(0) == 0x00 &&
                    getPlayerMinigameTeam(0) != getPlayerMinigameTeam(1) &&
                    getPlayerMinigameTeam(0) != getPlayerMinigameTeam(2) &&
                    getPlayerMinigameTeam(0) != getPlayerMinigameTeam(3) &&
                    getPlayerMinigamePrize(0) >= 16 &&
                    getPlayerMinigamePrize(0) <= 100 &&
                    prev(getPlayerMinigamePrize(0)) == 0) ||
                   (getPlayerControlType(1) == 0x00 &&
                    getPlayerMinigameTeam(1) != getPlayerMinigameTeam(0) &&
                    getPlayerMinigameTeam(1) != getPlayerMinigameTeam(2) &&
                    getPlayerMinigameTeam(1) != getPlayerMinigameTeam(3) &&
                    getPlayerMinigamePrize(1) >= 16 &&
                    getPlayerMinigamePrize(1) <= 100 &&
                    prev(getPlayerMinigamePrize(1)) == 0) ||
                   (getPlayerControlType(2) == 0x00 &&
                    getPlayerMinigameTeam(2) != getPlayerMinigameTeam(0) &&
                    getPlayerMinigameTeam(2) != getPlayerMinigameTeam(1) &&
                    getPlayerMinigameTeam(2) != getPlayerMinigameTeam(3) &&
                    getPlayerMinigamePrize(2) >= 16 &&
                    getPlayerMinigamePrize(2) <= 100 &&
                    prev(getPlayerMinigamePrize(2)) == 0) ||
                   (getPlayerControlType(3) == 0x00 &&
                    getPlayerMinigameTeam(3) != getPlayerMinigameTeam(0) &&
                    getPlayerMinigameTeam(3) != getPlayerMinigameTeam(1) &&
                    getPlayerMinigameTeam(3) != getPlayerMinigameTeam(2) &&
                    getPlayerMinigamePrize(3) >= 16 &&
                    getPlayerMinigamePrize(3) <= 100 &&
                    prev(getPlayerMinigamePrize(3)) == 0) ||
                   (getPlayerControlType(0) == 0x00 &&
                    getPlayerMinigameTeam(0) != getPlayerMinigameTeam(1) &&
                    getPlayerMinigameTeam(0) != getPlayerMinigameTeam(2) &&
                    getPlayerMinigameTeam(0) != getPlayerMinigameTeam(3) &&
                    getPlayerMinigamePrize(0) >= 16 * 0x1000 &&
                    getPlayerMinigamePrize(0) <= 100 * 0x1000 &&
                    prev(getPlayerMinigamePrize(0)) == 0) ||
                   (getPlayerControlType(1) == 0x00 &&
                    getPlayerMinigameTeam(1) != getPlayerMinigameTeam(0) &&
                    getPlayerMinigameTeam(1) != getPlayerMinigameTeam(2) &&
                    getPlayerMinigameTeam(1) != getPlayerMinigameTeam(3) &&
                    getPlayerMinigamePrize(1) >= 16 * 0x1000 &&
                    getPlayerMinigamePrize(1) <= 100 * 0x1000 &&
                    prev(getPlayerMinigamePrize(1)) == 0) ||
                   (getPlayerControlType(2) == 0x00 &&
                    getPlayerMinigameTeam(2) != getPlayerMinigameTeam(0) &&
                    getPlayerMinigameTeam(2) != getPlayerMinigameTeam(1) &&
                    getPlayerMinigameTeam(2) != getPlayerMinigameTeam(3) &&
                    getPlayerMinigamePrize(2) >= 16 * 0x1000 &&
                    getPlayerMinigamePrize(2) <= 100 * 0x1000 &&
                    prev(getPlayerMinigamePrize(2)) == 0) ||
                   (getPlayerControlType(3) == 0x00 &&
                    getPlayerMinigameTeam(3) != getPlayerMinigameTeam(0) &&
                    getPlayerMinigameTeam(3) != getPlayerMinigameTeam(1) &&
                    getPlayerMinigameTeam(3) != getPlayerMinigameTeam(2) &&
                    getPlayerMinigamePrize(3) >= 16 * 0x1000 &&
                    getPlayerMinigamePrize(3) <= 100 * 0x1000 &&
                    prev(getPlayerMinigamePrize(3)) == 0))
)

achievement(
    id          = 594339, 
    badge       = "673892",
    type        = "",
    title       = "Big Money for a Big Dinner",
    description = "Get 20 Coins as a team in the minigame \"Winner or Dinner\".",
    points      = 5,
    trigger     = getGameState(0x24) &&
                  ((getPlayerControlType(0) == 0x00 &&
                    getPlayerMinigamePrize(0) >= 20 &&
                    getPlayerMinigamePrize(0) <= 100 &&
                    prev(getPlayerMinigamePrize(0)) == 0) ||
                   (getPlayerControlType(1) == 0x00 &&
                    getPlayerMinigamePrize(1) >= 20 &&
                    getPlayerMinigamePrize(1) <= 100 &&
                    prev(getPlayerMinigamePrize(1)) == 0) ||
                   (getPlayerControlType(2) == 0x00 &&
                    getPlayerMinigamePrize(2) >= 20 &&
                    getPlayerMinigamePrize(2) <= 100 &&
                    prev(getPlayerMinigamePrize(2)) == 0) ||
                   (getPlayerControlType(3) == 0x00 &&
                    getPlayerMinigamePrize(3) >= 20 &&
                    getPlayerMinigamePrize(3) <= 100 &&
                    prev(getPlayerMinigamePrize(3)) == 0) ||
                   (getPlayerControlType(0) == 0x00 &&
                    getPlayerMinigamePrize(0) >= 20 * 0x10000 &&
                    getPlayerMinigamePrize(0) <= 100 * 0x10000 &&
                    prev(getPlayerMinigamePrize(0)) == 0) ||
                   (getPlayerControlType(1) == 0x00 &&
                    getPlayerMinigamePrize(1) >= 20 * 0x10000 &&
                    getPlayerMinigamePrize(1) <= 100 * 0x10000 &&
                    prev(getPlayerMinigamePrize(1)) == 0) ||
                   (getPlayerControlType(2) == 0x00 &&
                    getPlayerMinigamePrize(2) >= 20 * 0x10000 &&
                    getPlayerMinigamePrize(2) <= 100 * 0x10000 &&
                    prev(getPlayerMinigamePrize(2)) == 0) ||
                   (getPlayerControlType(3) == 0x00 &&
                    getPlayerMinigamePrize(3) >= 20 * 0x10000 &&
                    getPlayerMinigamePrize(3) <= 100 * 0x10000 &&
                    prev(getPlayerMinigamePrize(3)) == 0))
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
    points      = 10,
    trigger     = getGameState(0x48) &&
                  dword_be(0x0025fde4) > prev(dword_be(0x0025fde4)) &&
                  dword_be(0x0025fde4) >= 183
)

achievement(
    id          = 589959, 
    badge       = "668682",
    type        = "",
    title       = "Color Chain Reactions",
    description = "Beat the staff record in the minigame \"Puzzle Pillars\" by getting a score of 11400 or more.",
    points      = 10,
    trigger     = getGameState(0x49) &&
                  dword_be(0x0025fde8) > prev(dword_be(0x0025fde8)) &&
                  dword_be(0x0025fde8) >= 11400
)

achievement(
    id          = 589972, 
    badge       = "668689",
    type        = "",
    title       = "Fast, Faster, Canyon Cruiser",
    description = "Beat the staff record in the minigame \"Canyon Cruisers\" by getting a time of 1\'10\"52 or less.",
    points      = 4,
    trigger     = getGameState(0x4A) &&
                  dword_be(0x0025fdec) < prev(dword_be(0x0025fdec)) &&
                  dword_be(0x0025fdec) > 0 &&
                  dword_be(0x0025fdec) <= 7052 / 2
)

achievement(
    id          = 589973, 
    badge       = "668690",
    type        = "",
    title       = "Easy As Throwing a Bone to a Dog",
    description = "Beat the staff record in the minigame \"Chomping Frenzy\" by getting a score of 117 or more.",
    points      = 4,
    trigger     = getGameState(0x4B) &&
                  dword_be(0x0025fdf0) > prev(dword_be(0x0025fdf0)) &&
                  dword_be(0x0025fdf0) >= 117
)

achievement(
    id          = 589974, 
    badge       = "668691",
    type        = "",
    title       = "Mario Kart Tour",
    description = "Beat the staff record in the minigame \"Moped Mayhem\" by getting a time of 2\'29\"04 or less on Course 1.",
    points      = 5,
    trigger     = getGameState(0x4D) &&
                  dword_be(0x0025fdf4) < prev(dword_be(0x0025fdf4)) &&
                  dword_be(0x0025fdf4) > 0 &&
                  dword_be(0x0025fdf4) <= 14904 / 2
)

achievement(
    id          = 589976, 
    badge       = "668692",
    type        = "",
    title       = "Mario Kart World",
    description = "Beat the staff record in the minigame \"Moped Mayhem\" by getting a time of 2\'52\"60 or less on Course 2.",
    points      = 5,
    trigger     = getGameState(0x4D) &&
                  dword_be(0x0025fdf8) < prev(dword_be(0x0025fdf8)) &&
                  dword_be(0x0025fdf8) > 0 &&
                  dword_be(0x0025fdf8) <= 17260 / 2
)

achievement(
    id          = 589977, 
    badge       = "668693",
    type        = "",
    title       = "Mario Kart Ultimate",
    description = "Beat the staff record in the minigame \"Moped Mayhem\" by getting a time of 5\'19\"60 or less on Course 3.",
    points      = 10,
    trigger     = getGameState(0x4D) &&
                  dword_be(0x0025fdfc) < prev(dword_be(0x0025fdfc)) &&
                  dword_be(0x0025fdfc) > 0 &&
                  dword_be(0x0025fdfc) <= 31960 / 2
)

achievement(
    id          = 589987, 
    badge       = "668697",
    type        = "",
    title       = "King of the Pong ",
    description = "Win a game of \"Table Menace\" against a COM on Hard or Very Hard.",
    points      = 5,
    trigger     = getGameState(0x45) &&
                  ((getPlayerControlType(0) == 0x00 &&
                    getPlayerControlType(1) == 0x01 &&
                    getPlayerDifficulty(1) >= 0x02 &&
                    getPlayerDifficulty(1) <= 0x03 &&
                    getPlayerMinigamePrize(0) > prev(getPlayerMinigamePrize(0))) ||
                   (getPlayerControlType(1) == 0x00 &&
                    getPlayerControlType(0) == 0x01 &&
                    getPlayerDifficulty(0) >= 0x02 &&
                    getPlayerDifficulty(0) <= 0x03 &&
                    getPlayerMinigamePrize(1) > prev(getPlayerMinigamePrize(1))))
)

achievement(
    id          = 594494, 
    badge       = "674039",
    type        = "",
    title       = "Four of a Kind",
    description = "Win a 4-Player Crown Showdown with 7 wins against three CPUs on Hard.",
    points      = 10,
    trigger     = getGameState(0x62) &&
                  __ornext(prev(getGameState(0x62))) &&
                  getPlayerControlType(0)
                  + getPlayerControlType(1)
                  + getPlayerControlType(2)
                  + getPlayerControlType(3) == 3 &&
                  getCrownShowdownRounds() == 2 &&
                  getCrownShowdownMode() == 0x00 &&
                  ((getPlayerControlType(0) == 0x00 &&
                    getPlayerControlType(1) == 0x01 &&
                    getPlayerDifficulty(1) >= 0x02 &&
                    getPlayerControlType(2) == 0x01 &&
                    getPlayerDifficulty(2) >= 0x02 &&
                    getPlayerControlType(3) == 0x01 &&
                    getPlayerDifficulty(3) >= 0x02 &&
                    getCrownShowdownPlayerWins(0) == 7 &&
                    prev(getCrownShowdownPlayerWins(0)) == 6) ||
                   (getPlayerControlType(1) == 0x00 &&
                    getPlayerControlType(0) == 0x01 &&
                    getPlayerDifficulty(0) >= 0x02 &&
                    getPlayerControlType(2) == 0x01 &&
                    getPlayerDifficulty(2) >= 0x02 &&
                    getPlayerControlType(3) == 0x01 &&
                    getPlayerDifficulty(3) >= 0x02 &&
                    getCrownShowdownPlayerWins(1) == 7 &&
                    prev(getCrownShowdownPlayerWins(1)) == 6) ||
                   (getPlayerControlType(2) == 0x00 &&
                    getPlayerControlType(0) == 0x01 &&
                    getPlayerDifficulty(0) >= 0x02 &&
                    getPlayerControlType(1) == 0x01 &&
                    getPlayerDifficulty(1) >= 0x02 &&
                    getPlayerControlType(3) == 0x01 &&
                    getPlayerDifficulty(3) >= 0x02 &&
                    getCrownShowdownPlayerWins(2) == 7 &&
                    prev(getCrownShowdownPlayerWins(2)) == 6) ||
                   (getPlayerControlType(3) == 0x00 &&
                    getPlayerControlType(0) == 0x01 &&
                    getPlayerDifficulty(0) >= 0x02 &&
                    getPlayerControlType(1) == 0x01 &&
                    getPlayerDifficulty(1) >= 0x02 &&
                    getPlayerControlType(2) == 0x01 &&
                    getPlayerDifficulty(2) >= 0x02 &&
                    getCrownShowdownPlayerWins(3) == 7 &&
                    prev(getCrownShowdownPlayerWins(3)) == 6))
)

achievement(
    id          = 594495, 
    badge       = "674040",
    type        = "",
    title       = "Triple Trouble",
    description = "Win a 1-VS-3 Crown Showdown with 7 wins against three CPUs on Hard.",
    points      = 10,
    trigger     = getGameState(0x62) &&
                  __ornext(prev(getGameState(0x62))) &&
                  getPlayerControlType(0)
                  + getPlayerControlType(1)
                  + getPlayerControlType(2)
                  + getPlayerControlType(3) == 3 &&
                  getCrownShowdownRounds() == 2 &&
                  getCrownShowdownMode() == 0x01 &&
                  ((getPlayerControlType(0) == 0x00 &&
                    getPlayerControlType(1) == 0x01 &&
                    getPlayerDifficulty(1) >= 0x02 &&
                    getPlayerControlType(2) == 0x01 &&
                    getPlayerDifficulty(2) >= 0x02 &&
                    getPlayerControlType(3) == 0x01 &&
                    getPlayerDifficulty(3) >= 0x02 &&
                    getCrownShowdownPlayerTeam(0) != getCrownShowdownPlayerTeam(1) &&
                    getCrownShowdownPlayerTeam(0) != getCrownShowdownPlayerTeam(2) &&
                    getCrownShowdownPlayerTeam(0) != getCrownShowdownPlayerTeam(3) &&
                    getCrownShowdownPlayerWins(0) == 7 &&
                    prev(getCrownShowdownPlayerWins(0)) == 6) ||
                   (getPlayerControlType(1) == 0x00 &&
                    getPlayerControlType(0) == 0x01 &&
                    getPlayerDifficulty(0) >= 0x02 &&
                    getPlayerControlType(2) == 0x01 &&
                    getPlayerDifficulty(2) >= 0x02 &&
                    getPlayerControlType(3) == 0x01 &&
                    getPlayerDifficulty(3) >= 0x02 &&
                    getCrownShowdownPlayerTeam(1) != getCrownShowdownPlayerTeam(0) &&
                    getCrownShowdownPlayerTeam(1) != getCrownShowdownPlayerTeam(2) &&
                    getCrownShowdownPlayerTeam(1) != getCrownShowdownPlayerTeam(3) &&
                    getCrownShowdownPlayerWins(1) == 7 &&
                    prev(getCrownShowdownPlayerWins(1)) == 6) ||
                   (getPlayerControlType(2) == 0x00 &&
                    getPlayerControlType(0) == 0x01 &&
                    getPlayerDifficulty(0) >= 0x02 &&
                    getPlayerControlType(1) == 0x01 &&
                    getPlayerDifficulty(1) >= 0x02 &&
                    getPlayerControlType(3) == 0x01 &&
                    getPlayerDifficulty(3) >= 0x02 &&
                    getCrownShowdownPlayerTeam(2) != getCrownShowdownPlayerTeam(0) &&
                    getCrownShowdownPlayerTeam(2) != getCrownShowdownPlayerTeam(1) &&
                    getCrownShowdownPlayerTeam(2) != getCrownShowdownPlayerTeam(3) &&
                    getCrownShowdownPlayerWins(2) == 7 &&
                    prev(getCrownShowdownPlayerWins(2)) == 6) ||
                   (getPlayerControlType(3) == 0x00 &&
                    getPlayerControlType(0) == 0x01 &&
                    getPlayerDifficulty(0) >= 0x02 &&
                    getPlayerControlType(1) == 0x01 &&
                    getPlayerDifficulty(1) >= 0x02 &&
                    getPlayerControlType(2) == 0x01 &&
                    getPlayerDifficulty(2) >= 0x02 &&
                    getCrownShowdownPlayerTeam(3) != getCrownShowdownPlayerTeam(0) &&
                    getCrownShowdownPlayerTeam(3) != getCrownShowdownPlayerTeam(1) &&
                    getCrownShowdownPlayerTeam(3) != getCrownShowdownPlayerTeam(2) &&
                    getCrownShowdownPlayerWins(3) == 7 &&
                    prev(getCrownShowdownPlayerWins(3)) == 6))
)

achievement(
    id          = 594496, 
    badge       = "674041",
    type        = "",
    title       = "Dream Team",
    description = "Win a 2-VS-2 Crown Showdown with 7 wins against two CPUs on Hard.",
    points      = 10,
    trigger     = getGameState(0x62) &&
                  __ornext(prev(getGameState(0x62))) &&
                  getPlayerControlType(0)
                  + getPlayerControlType(1)
                  + getPlayerControlType(2)
                  + getPlayerControlType(3) >= 2 &&
                  getCrownShowdownRounds() == 2 &&
                  getCrownShowdownMode() == 0x02 &&
                  ((getPlayerControlType(0) == 0x00 &&
                    getCrownShowdownPlayerTeam(0) == getCrownShowdownPlayerTeam(1) &&
                    getCrownShowdownPlayerTeam(0) != getCrownShowdownPlayerTeam(2) &&
                    getCrownShowdownPlayerTeam(0) != getCrownShowdownPlayerTeam(3) &&
                    getPlayerControlType(2) == 0x01 &&
                    getPlayerDifficulty(2) >= 0x02 &&
                    getPlayerControlType(3) == 0x01 &&
                    getPlayerDifficulty(3) >= 0x02 &&
                    getCrownShowdownPlayerWins(0) == 7 &&
                    prev(getCrownShowdownPlayerWins(0)) == 6) ||
                   (getPlayerControlType(0) == 0x00 &&
                    getCrownShowdownPlayerTeam(0) == getCrownShowdownPlayerTeam(2) &&
                    getCrownShowdownPlayerTeam(0) != getCrownShowdownPlayerTeam(1) &&
                    getCrownShowdownPlayerTeam(0) != getCrownShowdownPlayerTeam(3) &&
                    getPlayerControlType(1) == 0x01 &&
                    getPlayerDifficulty(1) >= 0x02 &&
                    getPlayerControlType(3) == 0x01 &&
                    getPlayerDifficulty(3) >= 0x02 &&
                    getCrownShowdownPlayerWins(0) == 7 &&
                    prev(getCrownShowdownPlayerWins(0)) == 6) ||
                   (getPlayerControlType(0) == 0x00 &&
                    getCrownShowdownPlayerTeam(0) == getCrownShowdownPlayerTeam(3) &&
                    getCrownShowdownPlayerTeam(0) != getCrownShowdownPlayerTeam(1) &&
                    getCrownShowdownPlayerTeam(0) != getCrownShowdownPlayerTeam(2) &&
                    getPlayerControlType(1) == 0x01 &&
                    getPlayerDifficulty(1) >= 0x02 &&
                    getPlayerControlType(2) == 0x01 &&
                    getPlayerDifficulty(2) >= 0x02 &&
                    getCrownShowdownPlayerWins(0) == 7 &&
                    prev(getCrownShowdownPlayerWins(0)) == 6) ||
                   (getPlayerControlType(1) == 0x00 &&
                    getCrownShowdownPlayerTeam(1) == getCrownShowdownPlayerTeam(0) &&
                    getCrownShowdownPlayerTeam(1) != getCrownShowdownPlayerTeam(2) &&
                    getCrownShowdownPlayerTeam(1) != getCrownShowdownPlayerTeam(3) &&
                    getPlayerControlType(2) == 0x01 &&
                    getPlayerDifficulty(2) >= 0x02 &&
                    getPlayerControlType(3) == 0x01 &&
                    getPlayerDifficulty(3) >= 0x02 &&
                    getCrownShowdownPlayerWins(1) == 7 &&
                    prev(getCrownShowdownPlayerWins(1)) == 6) ||
                   (getPlayerControlType(1) == 0x00 &&
                    getCrownShowdownPlayerTeam(1) == getCrownShowdownPlayerTeam(2) &&
                    getCrownShowdownPlayerTeam(1) != getCrownShowdownPlayerTeam(0) &&
                    getCrownShowdownPlayerTeam(1) != getCrownShowdownPlayerTeam(3) &&
                    getPlayerControlType(0) == 0x01 &&
                    getPlayerDifficulty(0) >= 0x02 &&
                    getPlayerControlType(3) == 0x01 &&
                    getPlayerDifficulty(3) >= 0x02 &&
                    getCrownShowdownPlayerWins(1) == 7 &&
                    prev(getCrownShowdownPlayerWins(1)) == 6) ||
                   (getPlayerControlType(1) == 0x00 &&
                    getCrownShowdownPlayerTeam(1) == getCrownShowdownPlayerTeam(3) &&
                    getCrownShowdownPlayerTeam(1) != getCrownShowdownPlayerTeam(0) &&
                    getCrownShowdownPlayerTeam(1) != getCrownShowdownPlayerTeam(2) &&
                    getPlayerControlType(0) == 0x01 &&
                    getPlayerDifficulty(0) >= 0x02 &&
                    getPlayerControlType(2) == 0x01 &&
                    getPlayerDifficulty(2) >= 0x02 &&
                    getCrownShowdownPlayerWins(1) == 7 &&
                    prev(getCrownShowdownPlayerWins(1)) == 6) ||
                   (getPlayerControlType(2) == 0x00 &&
                    getCrownShowdownPlayerTeam(2) == getCrownShowdownPlayerTeam(0) &&
                    getCrownShowdownPlayerTeam(2) != getCrownShowdownPlayerTeam(1) &&
                    getCrownShowdownPlayerTeam(2) != getCrownShowdownPlayerTeam(3) &&
                    getPlayerControlType(1) == 0x01 &&
                    getPlayerDifficulty(1) >= 0x02 &&
                    getPlayerControlType(3) == 0x01 &&
                    getPlayerDifficulty(3) >= 0x02 &&
                    getCrownShowdownPlayerWins(2) == 7 &&
                    prev(getCrownShowdownPlayerWins(2)) == 6) ||
                   (getPlayerControlType(2) == 0x00 &&
                    getCrownShowdownPlayerTeam(2) == getCrownShowdownPlayerTeam(1) &&
                    getCrownShowdownPlayerTeam(2) != getCrownShowdownPlayerTeam(0) &&
                    getCrownShowdownPlayerTeam(2) != getCrownShowdownPlayerTeam(3) &&
                    getPlayerControlType(0) == 0x01 &&
                    getPlayerDifficulty(0) >= 0x02 &&
                    getPlayerControlType(3) == 0x01 &&
                    getPlayerDifficulty(3) >= 0x02 &&
                    getCrownShowdownPlayerWins(2) == 7 &&
                    prev(getCrownShowdownPlayerWins(2)) == 6) ||
                   (getPlayerControlType(2) == 0x00 &&
                    getCrownShowdownPlayerTeam(2) == getCrownShowdownPlayerTeam(3) &&
                    getCrownShowdownPlayerTeam(2) != getCrownShowdownPlayerTeam(0) &&
                    getCrownShowdownPlayerTeam(2) != getCrownShowdownPlayerTeam(1) &&
                    getPlayerControlType(0) == 0x01 &&
                    getPlayerDifficulty(0) >= 0x02 &&
                    getPlayerControlType(1) == 0x01 &&
                    getPlayerDifficulty(1) >= 0x02 &&
                    getCrownShowdownPlayerWins(2) == 7 &&
                    prev(getCrownShowdownPlayerWins(2)) == 6) ||
                   (getPlayerControlType(3) == 0x00 &&
                    getCrownShowdownPlayerTeam(3) == getCrownShowdownPlayerTeam(0) &&
                    getCrownShowdownPlayerTeam(3) != getCrownShowdownPlayerTeam(1) &&
                    getCrownShowdownPlayerTeam(3) != getCrownShowdownPlayerTeam(2) &&
                    getPlayerControlType(1) == 0x01 &&
                    getPlayerDifficulty(1) >= 0x02 &&
                    getPlayerControlType(2) == 0x01 &&
                    getPlayerDifficulty(2) >= 0x02 &&
                    getCrownShowdownPlayerWins(3) == 7 &&
                    prev(getCrownShowdownPlayerWins(3)) == 6) ||
                   (getPlayerControlType(3) == 0x00 &&
                    getCrownShowdownPlayerTeam(3) == getCrownShowdownPlayerTeam(1) &&
                    getCrownShowdownPlayerTeam(3) != getCrownShowdownPlayerTeam(0) &&
                    getCrownShowdownPlayerTeam(3) != getCrownShowdownPlayerTeam(2) &&
                    getPlayerControlType(0) == 0x01 &&
                    getPlayerDifficulty(0) >= 0x02 &&
                    getPlayerControlType(2) == 0x01 &&
                    getPlayerDifficulty(2) >= 0x02 &&
                    getCrownShowdownPlayerWins(3) == 7 &&
                    prev(getCrownShowdownPlayerWins(3)) == 6) ||
                   (getPlayerControlType(3) == 0x00 &&
                    getCrownShowdownPlayerTeam(3) == getCrownShowdownPlayerTeam(2) &&
                    getCrownShowdownPlayerTeam(3) != getCrownShowdownPlayerTeam(0) &&
                    getCrownShowdownPlayerTeam(3) != getCrownShowdownPlayerTeam(1) &&
                    getPlayerControlType(0) == 0x01 &&
                    getPlayerDifficulty(0) >= 0x02 &&
                    getPlayerControlType(1) == 0x01 &&
                    getPlayerDifficulty(1) >= 0x02 &&
                    getCrownShowdownPlayerWins(3) == 7 &&
                    prev(getCrownShowdownPlayerWins(3)) == 6))
)

achievement(
    id          = 594497, 
    badge       = "674042",
    type        = "",
    title       = "Fight Between Friends",
    description = "Win a Duel Crown Showdown with 7 wins against a CPU on Hard.",
    points      = 10,
    trigger     = getGameState(0x62) &&
                  __ornext(prev(getGameState(0x62))) &&
                  getPlayerControlType(0)
                  + getPlayerControlType(1)
                  + getPlayerControlType(2)
                  + getPlayerControlType(3) >= 1 &&
                  getCrownShowdownRounds() == 2 &&
                  getCrownShowdownMode() == 0x03 &&
                  ((getPlayerControlType(0) == 0x00 &&
                    getCrownShowdownPlayerTeam(0) != getCrownShowdownPlayerTeam(1) &&
                    getCrownShowdownPlayerTeam(0) <= 0x01 &&
                    getCrownShowdownPlayerTeam(1) <= 0x01 &&
                    getPlayerControlType(1) == 0x01 &&
                    getPlayerDifficulty(1) >= 0x02 &&
                    getCrownShowdownPlayerWins(0) == 7 &&
                    prev(getCrownShowdownPlayerWins(0)) == 6) ||
                   (getPlayerControlType(0) == 0x00 &&
                    getCrownShowdownPlayerTeam(0) != getCrownShowdownPlayerTeam(2) &&
                    getCrownShowdownPlayerTeam(0) <= 0x01 &&
                    getCrownShowdownPlayerTeam(2) <= 0x01 &&
                    getPlayerControlType(2) == 0x01 &&
                    getPlayerDifficulty(2) >= 0x02 &&
                    getCrownShowdownPlayerWins(0) == 7 &&
                    prev(getCrownShowdownPlayerWins(0)) == 6) ||
                   (getPlayerControlType(0) == 0x00 &&
                    getCrownShowdownPlayerTeam(0) != getCrownShowdownPlayerTeam(3) &&
                    getCrownShowdownPlayerTeam(0) <= 0x01 &&
                    getCrownShowdownPlayerTeam(3) <= 0x01 &&
                    getPlayerControlType(3) == 0x01 &&
                    getPlayerDifficulty(3) >= 0x02 &&
                    getCrownShowdownPlayerWins(0) == 7 &&
                    prev(getCrownShowdownPlayerWins(0)) == 6) ||
                   (getPlayerControlType(1) == 0x00 &&
                    getCrownShowdownPlayerTeam(1) != getCrownShowdownPlayerTeam(0) &&
                    getCrownShowdownPlayerTeam(1) <= 0x01 &&
                    getCrownShowdownPlayerTeam(0) <= 0x01 &&
                    getPlayerControlType(0) == 0x01 &&
                    getPlayerDifficulty(0) >= 0x02 &&
                    getCrownShowdownPlayerWins(1) == 7 &&
                    prev(getCrownShowdownPlayerWins(1)) == 6) ||
                   (getPlayerControlType(1) == 0x00 &&
                    getCrownShowdownPlayerTeam(1) != getCrownShowdownPlayerTeam(2) &&
                    getCrownShowdownPlayerTeam(1) <= 0x01 &&
                    getCrownShowdownPlayerTeam(2) <= 0x01 &&
                    getPlayerControlType(2) == 0x01 &&
                    getPlayerDifficulty(2) >= 0x02 &&
                    getCrownShowdownPlayerWins(1) == 7 &&
                    prev(getCrownShowdownPlayerWins(1)) == 6) ||
                   (getPlayerControlType(1) == 0x00 &&
                    getCrownShowdownPlayerTeam(1) != getCrownShowdownPlayerTeam(3) &&
                    getCrownShowdownPlayerTeam(1) <= 0x01 &&
                    getCrownShowdownPlayerTeam(3) <= 0x01 &&
                    getPlayerControlType(3) == 0x01 &&
                    getPlayerDifficulty(3) >= 0x02 &&
                    getCrownShowdownPlayerWins(1) == 7 &&
                    prev(getCrownShowdownPlayerWins(1)) == 6) ||
                   (getPlayerControlType(2) == 0x00 &&
                    getCrownShowdownPlayerTeam(2) != getCrownShowdownPlayerTeam(0) &&
                    getCrownShowdownPlayerTeam(2) <= 0x01 &&
                    getCrownShowdownPlayerTeam(0) <= 0x01 &&
                    getPlayerControlType(0) == 0x01 &&
                    getPlayerDifficulty(0) >= 0x02 &&
                    getCrownShowdownPlayerWins(2) == 7 &&
                    prev(getCrownShowdownPlayerWins(2)) == 6) ||
                   (getPlayerControlType(2) == 0x00 &&
                    getCrownShowdownPlayerTeam(2) != getCrownShowdownPlayerTeam(1) &&
                    getCrownShowdownPlayerTeam(2) <= 0x01 &&
                    getCrownShowdownPlayerTeam(1) <= 0x01 &&
                    getPlayerControlType(1) == 0x01 &&
                    getPlayerDifficulty(1) >= 0x02 &&
                    getCrownShowdownPlayerWins(2) == 7 &&
                    prev(getCrownShowdownPlayerWins(2)) == 6) ||
                   (getPlayerControlType(2) == 0x00 &&
                    getCrownShowdownPlayerTeam(2) != getCrownShowdownPlayerTeam(3) &&
                    getCrownShowdownPlayerTeam(2) <= 0x01 &&
                    getCrownShowdownPlayerTeam(3) <= 0x01 &&
                    getPlayerControlType(3) == 0x01 &&
                    getPlayerDifficulty(3) >= 0x02 &&
                    getCrownShowdownPlayerWins(2) == 7 &&
                    prev(getCrownShowdownPlayerWins(2)) == 6) ||
                   (getPlayerControlType(3) == 0x00 &&
                    getCrownShowdownPlayerTeam(3) != getCrownShowdownPlayerTeam(0) &&
                    getCrownShowdownPlayerTeam(3) <= 0x01 &&
                    getCrownShowdownPlayerTeam(0) <= 0x01 &&
                    getPlayerControlType(0) == 0x01 &&
                    getPlayerDifficulty(0) >= 0x02 &&
                    getCrownShowdownPlayerWins(3) == 7 &&
                    prev(getCrownShowdownPlayerWins(3)) == 6) ||
                   (getPlayerControlType(3) == 0x00 &&
                    getCrownShowdownPlayerTeam(3) != getCrownShowdownPlayerTeam(1) &&
                    getCrownShowdownPlayerTeam(3) <= 0x01 &&
                    getCrownShowdownPlayerTeam(1) <= 0x01 &&
                    getPlayerControlType(1) == 0x01 &&
                    getPlayerDifficulty(1) >= 0x02 &&
                    getCrownShowdownPlayerWins(3) == 7 &&
                    prev(getCrownShowdownPlayerWins(3)) == 6) ||
                   (getPlayerControlType(3) == 0x00 &&
                    getCrownShowdownPlayerTeam(3) != getCrownShowdownPlayerTeam(2) &&
                    getCrownShowdownPlayerTeam(3) <= 0x01 &&
                    getCrownShowdownPlayerTeam(2) <= 0x01 &&
                    getPlayerControlType(2) == 0x01 &&
                    getPlayerDifficulty(2) >= 0x02 &&
                    getCrownShowdownPlayerWins(3) == 7 &&
                    prev(getCrownShowdownPlayerWins(3)) == 6))
)

achievement(
    id          = 594498, 
    badge       = "674043",
    type        = "",
    title       = "Mister Unstoppable",
    description = "Win a Random Crown Showdown with 7 wins against three CPUs on Hard.",
    points      = 10,
    trigger     = getGameState(0x62) &&
                  __ornext(prev(getGameState(0x62))) &&
                  getPlayerControlType(0)
                  + getPlayerControlType(1)
                  + getPlayerControlType(2)
                  + getPlayerControlType(3) == 3 &&
                  getCrownShowdownRounds() == 2 &&
                  getCrownShowdownMode() == 0x04 &&
                  ((getPlayerControlType(0) == 0x00 &&
                    getPlayerControlType(1) == 0x01 &&
                    getPlayerDifficulty(1) >= 0x02 &&
                    getPlayerControlType(2) == 0x01 &&
                    getPlayerDifficulty(2) >= 0x02 &&
                    getPlayerControlType(3) == 0x01 &&
                    getPlayerDifficulty(3) >= 0x02 &&
                    getCrownShowdownPlayerWins(0) == 7 &&
                    prev(getCrownShowdownPlayerWins(0)) == 6) ||
                   (getPlayerControlType(1) == 0x00 &&
                    getPlayerControlType(0) == 0x01 &&
                    getPlayerDifficulty(0) >= 0x02 &&
                    getPlayerControlType(2) == 0x01 &&
                    getPlayerDifficulty(2) >= 0x02 &&
                    getPlayerControlType(3) == 0x01 &&
                    getPlayerDifficulty(3) >= 0x02 &&
                    getCrownShowdownPlayerWins(1) == 7 &&
                    prev(getCrownShowdownPlayerWins(1)) == 6) ||
                   (getPlayerControlType(2) == 0x00 &&
                    getPlayerControlType(0) == 0x01 &&
                    getPlayerDifficulty(0) >= 0x02 &&
                    getPlayerControlType(1) == 0x01 &&
                    getPlayerDifficulty(1) >= 0x02 &&
                    getPlayerControlType(3) == 0x01 &&
                    getPlayerDifficulty(3) >= 0x02 &&
                    getCrownShowdownPlayerWins(2) == 7 &&
                    prev(getCrownShowdownPlayerWins(2)) == 6) ||
                   (getPlayerControlType(3) == 0x00 &&
                    getPlayerControlType(0) == 0x01 &&
                    getPlayerDifficulty(0) >= 0x02 &&
                    getPlayerControlType(1) == 0x01 &&
                    getPlayerDifficulty(1) >= 0x02 &&
                    getPlayerControlType(2) == 0x01 &&
                    getPlayerDifficulty(2) >= 0x02 &&
                    getCrownShowdownPlayerWins(3) == 7 &&
                    prev(getCrownShowdownPlayerWins(3)) == 6))
)

achievement(
    id          = 587252, 
    badge       = "665856",
    type        = "",
    title       = "Minigame Maestro",
    description = "Unlock all normal minigames in the Free Play Arcade.",
    points      = 25,
    trigger     = notLoadingSave() &&
                  measured(checkAllMinigameFlags() == 73) &&
                      prev(checkAllMinigameFlags()) <= 72 &&
                      prev(checkAllMinigameFlags()) >= 70
)

achievement(
    id          = 594447, 
    badge       = "674022",
    type        = "",
    title       = "Ballyhoo's Parade of Fun",
    description = "Buy all Carnival Figurines from the Surprise Wagon.",
    points      = 25,
    trigger     = notLoadingSave() &&
                  getGameState(0x59) &&
                  measured(checkAllCarnivalFigurineFlags() == 30) &&
                      prev(checkAllCarnivalFigurineFlags()) == 29
)

achievement(
    id          = 594449, 
    badge       = "674023",
    type        = "",
    title       = "Who Is Surprised Now?",
    description = "Buy everything from the Surprise Wagon.",
    points      = 10,
    trigger     = notLoadingSave() &&
                  getGameState(0x59) &&
                  measured(checkAllSurpriseWagonFlags() == 42) &&
                      prev(checkAllSurpriseWagonFlags()) == 41
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

leaderboard(
    id = 157410,
    title       = "Puzzle Pillars", 
    description = "Highest score in the minigame.",
    start  = getGameState(0x49) &&
             dword_be(0x0025fde8) > prev(dword_be(0x0025fde8)),
    cancel = always_false(), 
    submit = always_true(), 
    value  = dword_be(0x0025fde8),
    format = "Value",
    lower_is_better = false
)

leaderboard(
    id = 157411,
    title       = "Canyon Cruisers", 
    description = "Fastest time in the minigame.",
    start  = getGameState(0x4A) &&
             dword_be(0x0025fdec) > 0 &&
             dword_be(0x0025fdec) < prev(dword_be(0x0025fdec)),
    cancel = always_false(), 
    submit = always_true(), 
    value  = dword_be(0x0025fdec) * 2,
    format = "Centisecs",
    lower_is_better = true
)

leaderboard(
    id = 157412,
    title       = "Chomping Frenzy", 
    description = "Highest score in the minigame.",
    start  = getGameState(0x4B) &&
             dword_be(0x0025fdf0) > prev(dword_be(0x0025fdf0)),
    cancel = always_false(), 
    submit = always_true(), 
    value  = dword_be(0x0025fdf0),
    format = "Value",
    lower_is_better = false
)

leaderboard(
    id = 157414,
    title       = "Moped Mayhem", 
    description = "Fastest time in the minigame on Course 1.",
    start  = getGameState(0x4D) &&
             dword_be(0x0025fdf4) > 0 &&
             dword_be(0x0025fdf4) < prev(dword_be(0x0025fdf4)),
    cancel = always_false(), 
    submit = always_true(), 
    value  = dword_be(0x0025fdf4) * 2,
    format = "Centisecs",
    lower_is_better = true
)

leaderboard(
    id = 157415,
    title       = "Moped Mayhem", 
    description = "Fastest time in the minigame on Course 2.",
    start  = getGameState(0x4D) &&
             dword_be(0x0025fdf8) > 0 &&
             dword_be(0x0025fdf8) < prev(dword_be(0x0025fdf8)),
    cancel = always_false(), 
    submit = always_true(), 
    value  = dword_be(0x0025fdf8) * 2,
    format = "Centisecs",
    lower_is_better = true
)

leaderboard(
    id = 157417,
    title       = "Moped Mayhem", 
    description = "Fastest time in the minigame on Course 3.",
    start  = getGameState(0x4D) &&
             dword_be(0x0025fdfc) > 0 &&
             dword_be(0x0025fdfc) < prev(dword_be(0x0025fdfc)),
    cancel = always_false(), 
    submit = always_true(), 
    value  = dword_be(0x0025fdfc) * 2,
    format = "Centisecs",
    lower_is_better = true
)

//--------------------------------------------------
// Rich Presence



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

rich_presence_conditional_display(getGameState(0x56),
    "Mario and his Friends are entering the Extras Zone"
)

rich_presence_conditional_display(wasInGameState(0x56) && getExtraPlayerAmount() == 4,
    "{0}, {1}, {2} and {3} are in the Minigame {4} [Extra Zone]",
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
        "ExtraZoneLocation",
        getGameStateID(),
        extraZoneLocations,
        fallback = extraZoneLocations[0]
    )
)

rich_presence_conditional_display(wasInGameState(0x56) && getExtraPlayerAmount() == 3,
    "{0}, {1} and {2} are in the Minigame {3} [Extra Zone]",
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
        "ExtraZoneLocation",
        getGameStateID(),
        extraZoneLocations,
        fallback = extraZoneLocations[0]
    )
)

rich_presence_conditional_display(wasInGameState(0x56) && getExtraPlayerAmount() == 2,
    "{0} and {1} are in the Minigame {2} [Extra Zone]",
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
        "ExtraZoneLocation",
        getGameStateID(),
        extraZoneLocations,
        fallback = extraZoneLocations[0]
    )
)

rich_presence_conditional_display(wasInGameState(0x56) && getExtraPlayerAmount() <= 1,
    "{0} is in the Minigame {1} [Extra Zone]",
    rich_presence_lookup(
        "CharacterID",
        getPlayerCharacterID(0),
        characterIDs,
        fallback = characterIDs[0]
    ),
    rich_presence_lookup(
        "ExtraZoneLocation",
        getGameStateID(),
        extraZoneLocations,
        fallback = extraZoneLocations[0]
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

rich_presence_conditional_display(wasInGameState(0x60) && never(getGameState(0x57)),
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

rich_presence_conditional_display(wasInGameState(0x62) && never(getGameState(0x57)) && getCrownShowdownMode() == 0x03 && getCrownShowdownPlayerTeam(0) 
                                                                                                                       + getCrownShowdownPlayerTeam(1) 
                                                                                                                       + getCrownShowdownPlayerTeam(2) 
                                                                                                                       + getCrownShowdownPlayerTeam(3) == 5,
    "{0} and {1} are in the Arena [Crown Showdown]",
    rich_presence_lookup(
        "CharacterID",
        max_of(measured(getPlayerCharacterID(0), when = getCrownShowdownPlayerTeam(0) == 0),
               measured(getPlayerCharacterID(1), when = getCrownShowdownPlayerTeam(1) == 0),
               measured(getPlayerCharacterID(2), when = getCrownShowdownPlayerTeam(2) == 0),
               measured(getPlayerCharacterID(3), when = getCrownShowdownPlayerTeam(3) == 0)),
        characterIDs,
        fallback = characterIDs[0]
    ),
    rich_presence_lookup(
        "CharacterID",
        max_of(measured(getPlayerCharacterID(0), when = getCrownShowdownPlayerTeam(0) == 1),
               measured(getPlayerCharacterID(1), when = getCrownShowdownPlayerTeam(1) == 1),
               measured(getPlayerCharacterID(2), when = getCrownShowdownPlayerTeam(2) == 1),
               measured(getPlayerCharacterID(3), when = getCrownShowdownPlayerTeam(3) == 1)),
        characterIDs,
        fallback = characterIDs[0]
    )
)

rich_presence_conditional_display(wasInGameState(0x62) && never(getGameState(0x57)),
    "{0}, {1}, {2} and {3} are in the Arena [Crown Showdown]",
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



