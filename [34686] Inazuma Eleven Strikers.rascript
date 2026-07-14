// Inazuma Eleven Strikers
// #ID = 34686

//--------------------------------------------------
// Addresses

mem_SubState            = 0x003e8840
mem_GameState           = 0x003e8844

mem_Team1EmblemID       = 0x00420d50
mem_Team1Type           = 0x00420d70
mem_Team2EmblemID       = 0x0042207c
mem_Team2Type           = 0x0042209c

mem_MatchType           = 0x00420d44
mem_MatchPhase          = 0x0040c1e8
mem_PhaseTime           = 0x0040c1ec
mem_MatchState          = 0x0040c1fc
mem_Team1Goals          = 0x0040c1f8
mem_Team2Goals          = 0x0040c1f9
mem_StadiumID           = 0x004233dc

mem_MGSlot1State        = 0x004233a8
mem_MGSlot1CharID       = 0x004233ac
mem_MGSlot2State        = 0x004233b4
mem_MGSlot2CharID       = 0x004233b8
mem_MGSlot3State        = 0x004233c0
mem_MGSlot3CharID       = 0x004233c4
mem_MGSlot4State        = 0x004233cc
mem_MGSlot4CharID       = 0x004233d0

mem_InazumaPoints       = 0x004bd0cc
mem_SupporterFlags      = 0x004bd0c0
mem_PlayerBuyableFlags  = 0x004bcfb4
mem_PlayerScoutFlags    = 0x004bd014
mem_StoryCompetition    = 0x004bd3d0
mem_StoryMatch          = 0x004bd3d1
mem_CompetitionID       = 0x004bd3d4
mem_CompetitionResult   = 0x004bd3d2
mem_TrophyFlags         = 0x004bd062
mem_ManagerID           = 0x004bd144
mem_FriendlyMatchData   = 0x004bd420
mem_MinigameMedals      = 0x004f131c
mem_TournamentMatch     = 0x0042397c
mem_TournamentStartFlag = 0x00423983
mem_TournamentTeamData  = 0x00423984
mem_DifficultyCOM       = 0x004233ed
mem_HalfTime            = 0x00420d48
mem_ExtraTimePenalties  = 0x00420d43
mem_SpecialShotsPerTeam = 0x00409535

mem_PointerBusPull      = 0x003e98c0
mem_PointerTyrePunch    = 0x003e98a8
mem_PointerVolley       = 0x003e98b0
mem_PointerTyreDash     = 0x003e98b8
mem_PointerBungeeShot   = 0x003e9970
mem_PointerTournament   = 0x003e9a68
mem_PointerSpecialMove  = 0x003e9730

pointerMask = 0x3fffffff

//--------------------------------------------------
// Functions

function checkGameState(GameState) {
    return dword_be(mem_GameState) == GameState
}

function checkSubState(GameState, SubState) {
    return checkGameState(GameState) &&
           getSubState() == SubState
}

function getSubState() {
    return dword_be(mem_SubState)
}

function getFullNameByCharID(charID) {
    characterData = characterIDs[charID]
    return characterData[1]
}

function getTeamID(team) {
    if (team == "Team 1") {
        addressID   = mem_Team1EmblemID
        addressType = mem_Team1Type
    }
    if (team == "Team 2") {
        addressID   = mem_Team2EmblemID
        addressType = mem_Team2Type
    }
    return dword_be(addressID) * ~bit0(addressType)
}

function getTeamGoals(team) {
    if (team == "Team 1") {
        address = mem_Team1Goals
    }
    if (team == "Team 2") {
        address = mem_Team2Goals
    }
    return byte(address)
}

function getStadiumID() {
    return dword_be(mem_StadiumID)
}

function getMatchType() {
    return dword_be(mem_MatchType)
}

function getMatchPhase() {
    return dword_be(mem_MatchPhase)
}

function getPhaseTime() {
    return dword_be(mem_PhaseTime)
}

function getMatchState() {
    return dword_be(mem_MatchState)
}

function getMinigamePlayerAmount() {
    return 4
         - dword_be(mem_MGSlot1State) / 2
         - dword_be(mem_MGSlot2State) / 2
         - dword_be(mem_MGSlot3State) / 2
         - dword_be(mem_MGSlot4State) / 2
}

function getMinigameSlotState(slot) {
    if (slot == "Player 1") {
        return dword_be(mem_MGSlot1State)    
    }
    if (slot == "Player 2") {
        return dword_be(mem_MGSlot2State)    
    }
    if (slot == "Player 3") {
        return dword_be(mem_MGSlot3State)    
    }
    if (slot == "Player 4") {
        return dword_be(mem_MGSlot4State)    
    }
}

function getMinigameSlotCharID(slot) {
    if (slot == "Player 1") {
        return dword_be(mem_MGSlot1CharID)    
    }
    if (slot == "Player 2") {
        return dword_be(mem_MGSlot2CharID)    
    }
    if (slot == "Player 3") {
        return dword_be(mem_MGSlot3CharID)    
    }
    if (slot == "Player 4") {
        return dword_be(mem_MGSlot4CharID)    
    }
}

function getInazumaPoints() {
    return dword_be(mem_InazumaPoints)
}

function countPlayersScouted() {
    code = 0
    for characterID in range(1, 210) {
        if ((characterID >= 0x01 && characterID <= 0xC2) || (characterID >= 0xCE && characterID <= 0xD1)) {
            code = code + bit((characterID + 27) % 8, mem_PlayerScoutFlags + 0x03 - (((characterID + 27) / 8) % 4) + (((characterID + 27) / 32) * 4))
        }
    }
    return code
}

function getPlayerScoutableFlag(characterID) {
    return bit((characterID + 27) % 8, mem_PlayerBuyableFlags + 0x03 - (((characterID + 27) / 8) % 4) + (((characterID + 27) / 32) * 4))
}

function getPlayerScoutedFlag(characterID) {
    return bit((characterID + 27) % 8, mem_PlayerScoutFlags + 0x03 - (((characterID + 27) / 8) % 4) + (((characterID + 27) / 32) * 4))
}

function countCoachesUnlocked() {
    return 0
         + bit1(mem_SupporterFlags + 0x00)
         + bit2(mem_SupporterFlags + 0x00)
         + bit3(mem_SupporterFlags + 0x00)
         + bit4(mem_SupporterFlags + 0x00)
}

function countManagersUnlocked() {
    return 0
         + bit7(mem_SupporterFlags + 0x00)
         + bit0(mem_SupporterFlags + 0x07)
         + bit1(mem_SupporterFlags + 0x07)
         + bit2(mem_SupporterFlags + 0x07)
}

function countManagersForAureliaWithoutCammy() {
    aureliaFlag = remembered((getPlayerScoutedFlag(0x9D)
                             + getPlayerScoutedFlag(0xA4)
                             + getPlayerScoutedFlag(0xA6)) / 3)
    return aureliaFlag
           + countManagersUnlocked()
}

function countManagersForAureliaWithCammy() {
    aureliaFlag = remembered((getPlayerScoutedFlag(0x9D)
                             + getPlayerScoutedFlag(0xA0)
                             + getPlayerScoutedFlag(0xA4)
                             + getPlayerScoutedFlag(0xA6)) / 4)
    return aureliaFlag
           + countManagersUnlocked()
}

function checkStoryCompetitionProgress(competition, match) {
    return byte(mem_StoryCompetition) == competition &&
           byte(mem_StoryMatch) == match
}

function getCompetitionID() {
    return byte(mem_CompetitionID)
}

function getCompetitionResult() {
    return byte(mem_CompetitionResult)
}

function getCompetitionTrophy(competition, trophy) {
    if (trophy == "Platinum") {
        address = mem_TrophyFlags
    }
    if (trophy == "Gold") {
        competition = competition + 4
        address = mem_TrophyFlags + 0x01
    }
    return bit(competition - 1, address)
}

function getManagerID() {
    return dword_be(mem_ManagerID)
}

function getFriendlyMatchMedal(teamName) {
    offset = 0x00
    for teamID in teamIDs {
        if (teamIDs[teamID] == teamName) {
            offset = teamID
        }
    }
    if (offset != 0x00) {
        return byte(mem_FriendlyMatchData + ((offset - 1) * 8) + 0x06)
    }
}

function calculatePlatinumFriendlyMatchMedals() {
    return getFriendlyMatchMedal("Raimon")           / 4
         + getFriendlyMatchMedal("Royal Academy")    / 4
         + getFriendlyMatchMedal("Zeus")             / 4
         + getFriendlyMatchMedal("Raimon II")        / 4
         + getFriendlyMatchMedal("Chaos")            / 4
         + getFriendlyMatchMedal("Alius Academy")    / 4
         + getFriendlyMatchMedal("Dark Emperors")    / 4
         + getFriendlyMatchMedal("Inazuma National") / 4
         + getFriendlyMatchMedal("Neo National")     / 4
         + getFriendlyMatchMedal("Int'l Allstars")   / 4
         + getFriendlyMatchMedal("Dark Angels")      / 4
         + getFriendlyMatchMedal("Team Ogre")        / 4
         + getFriendlyMatchMedal("Girl's Team")      / 4
}

function calculateUnlockedPasswordCharacters() {
    return getPlayerScoutableFlag(0xB9)
         + getPlayerScoutableFlag(0xBA)
         + getPlayerScoutableFlag(0xBB)
         + getPlayerScoutableFlag(0xBC)
         + getPlayerScoutableFlag(0xBD)
         + getPlayerScoutableFlag(0xBE)
         + getPlayerScoutableFlag(0xBF)
}

function getMinigameBusPullPlayerAmount() {
    return byte((dword_be(mem_PointerBusPull) & pointerMask) + 0x0D)
}

function getMinigameBusPullState() {
    return dword_be((dword_be(mem_PointerBusPull) & pointerMask) + 0x5D2C)
}

function getMinigameBusPullDistance() {
    return float_be((dword_be(mem_PointerBusPull) & pointerMask) + 0x5D38)
}

function getMinigameBusPullCharacterID(player) {
    return dword_be((dword_be(mem_PointerBusPull) & pointerMask) + 0x5D4C + (player * 0x04))
}

function getMinigameTyrePunchPlayerAmount() {
    return byte((dword_be(mem_PointerTyrePunch) & pointerMask) + 0x0D)
}

function getMinigameTyrePunchState() {
    return dword_be((dword_be(mem_PointerTyrePunch) & pointerMask) + 0x5D2C)
}

function getMinigameTyrePunchPoints(player) {
    return dword_be((dword_be(mem_PointerTyrePunch) & pointerMask) + 0x5D38 + (player * 0x04))
}

function getMinigameTyrePunchCharacterID(player) {
    return dword_be((dword_be(mem_PointerTyrePunch) & pointerMask) + 0x5D88 + (player * 0x04))
}

function getMinigameVolleyPlayerAmount() {
    return byte((dword_be(mem_PointerVolley) & pointerMask) + 0x0D)
}

function getMinigameVolleyState() {
    return dword_be((dword_be(mem_PointerVolley) & pointerMask) + 0x5D2C)
}

function getMinigameVolleyPoints(player) {
    return dword_be((dword_be(mem_PointerVolley) & pointerMask) + 0x5D50 + (player * 0x04))
}

function getMinigameVolleyCharacterID(player) {
    return dword_be((dword_be(mem_PointerVolley) & pointerMask) + 0x5D94 + (player * 0x04))
}

function getMinigameTyreDashPlayerAmount() {
    return byte((dword_be(mem_PointerTyreDash) & pointerMask) + 0x0D)
}

function getMinigameTyreDashState() {
    return dword_be((dword_be(mem_PointerTyreDash) & pointerMask) + 0x5D2C)
}

function getMinigameTyreDashTime(player) {
    return dword_be((dword_be(mem_PointerTyreDash) & pointerMask) + 0x5D98 + (player * 0x04))
}

function getMinigameTyreDashCharacterID(player) {
    return dword_be((dword_be(mem_PointerTyreDash) & pointerMask) + 0x5D58 + (player * 0x04))
}

function getMinigameBungeeShotPlayerAmount() {
    return byte((dword_be(mem_PointerBungeeShot) & pointerMask) + 0x0D)
}

function getMinigameBungeeShotState() {
    return dword_be((dword_be(mem_PointerBungeeShot) & pointerMask) + 0x5D28)
}

function getMinigameBungeeShotGoals(player) {
    return dword_be((dword_be(mem_PointerBungeeShot) & pointerMask) + 0x5D34 + (player * 0x04))
}

function getMinigameBungeeCharacterID(player) {
    return dword_be((dword_be(mem_PointerBungeeShot) & pointerMask) + 0x378 + (player * 0x04))
}

function getMinigameMedal(minigame, playerAmount, medal) {
           if (minigame == "Bus Pull!") {
        minigame = 0
    } else if (minigame == "Tyre Punch!") {
        minigame = 1
    } else if (minigame == "Volley!") {
        minigame = 2
    } else if (minigame == "Tyre Dash!") {
        minigame = 3
    } else if (minigame == "Bungee Shot!") {
        minigame = 4
    }
    playerAmount = playerAmount - 1
           if (medal == "Bronze") {
        medal = 0
    } else if (medal == "Silver") {
        medal = 1
    } else if (medal == "Gold") {
        medal = 2
    } else if (medal == "Platinum") {
        medal = 3
    }
    return bit(medal, mem_MinigameMedals + minigame + playerAmount * 0x05)
}

function getDifficultyCOM() {
    return byte(mem_DifficultyCOM)
}

function getHalfLength() {
    return dword_be(mem_HalfTime)
}

function getExtraTime() {
    return bit0(mem_ExtraTimePenalties)
}

function getPenalties() {
    return bit1(mem_ExtraTimePenalties)
}

function getTournamentStart() {
    return byte(mem_TournamentStartFlag)
}

function getTeamSlotOfPlayer(slot) {
    return getMinigameSlotState(slot)
}

function calculateTotalTournamentPlayerTeams() {
    return getPlayerFlagValueOfTournamentTeam(1) / getPlayerFlagValueOfTournamentTeam(1)
           + getPlayerFlagValueOfTournamentTeam(2) / getPlayerFlagValueOfTournamentTeam(2)
           + getPlayerFlagValueOfTournamentTeam(3) / getPlayerFlagValueOfTournamentTeam(3)
           + getPlayerFlagValueOfTournamentTeam(4) / getPlayerFlagValueOfTournamentTeam(4)
}

function getTeamIDOfTournamentTeam(slot) {
    slot = slot - 1
    return dword_be(mem_TournamentTeamData + 0x04 + (slot * 0xDC0))
}

function getPlayerFlagValueOfTournamentTeam(slot) {
    slot = slot - 1
    return dword_be(mem_TournamentTeamData + 0x0C + (slot * 0xDC0))
}

function getTournamentMatch() {
    return word_be(mem_TournamentMatch)
}

function getTotalTournamentMatches() {
    return word_be(mem_TournamentMatch + 0x02)
}

function getTournamentTeamIDInSlot(slot) {
    slot = slot - 1
    return dword_be((dword_be((dword_be((dword_be(mem_PointerTournament) & pointerMask) + 0x00) & pointerMask) + 0x180) & pointerMask) + 0x218 + (slot * 0x18))
}

function getTournamentTeamFlagsValue(slot) {
    slot = slot - 1
    return dword_be((dword_be((dword_be((dword_be(mem_PointerTournament) & pointerMask) + 0x00) & pointerMask) + 0x180) & pointerMask) + 0x214 + (slot * 0x18))
}

function getTournamentTeamPlayerValue(slot) {
    slot = slot - 1
    return dword_be((dword_be((dword_be((dword_be(mem_PointerTournament) & pointerMask) + 0x00) & pointerMask) + 0x180) & pointerMask) + 0x21C + (slot * 0x18))
}

function checkTournamentChallengeWin(totalPlayers) {
    if (totalPlayers == 4) {
        totalMatches = 3
        finalSlot    = 7}
    if (totalPlayers == 8) {
        totalMatches = 7
        finalSlot    = 15}
    return trigger_when(checkSubState(0x02, 0x16)) &&
           calculateTotalTournamentPlayerTeams() == 1 &&
           getTotalTournamentMatches() == totalMatches &&
           trigger_when(getTournamentMatch() == totalMatches) &&
           trigger_when(getTournamentTeamFlagsValue(finalSlot) == 0x00) &&
           trigger_when(prev(getTournamentTeamFlagsValue(finalSlot) == 0x28)) &&
           never(getTournamentMatch() < prev(getTournamentMatch())) &&
           never(checkSubState(0x02, 0x07)) &&
           never(checkSubState(0x02, 0x16) &&
                 getTournamentTeamIDInSlot(15) >= 0x01 &&
                 getTournamentTeamIDInSlot(15) <= 0x0D &&
                 getTournamentTeamPlayerValue(15) == 0xFFFFFFFF) &&
           never(checkSubState(0x02, 03) &&
                 getDifficultyCOM() != 0x01) &&
           never(checkSubState(0x02, 03) &&
                 getHalfLength() != 0x00) &&
           once(checkSubState(0x02, 0x16) &&
                getTournamentMatch() == 0 &&
                getTotalTournamentMatches() == totalMatches &&
                getTournamentStart() > prev(getTournamentStart()))
}

function getTeamStatSpecialShots(team) {
    
    if (team == "Team 1") {
        index = (0 + getMatchPhase()) % 2
        return byte(mem_SpecialShotsPerTeam + (0x3F4 * index))
    }
    if (team == "Team 2") {
        index = (1 + getMatchPhase()) % 2
        return byte(mem_SpecialShotsPerTeam + (0x3F4 * index))
    }
}

function check2CharactersPerformingSpecialMove(specialMoveID, character1, character2) {
    codeSpecialMoveID = any_of(array_filter(specialMoveIDs, ID => specialMoveIDs[ID] == specialMoveID), ID => __ornext(dword_be((dword_be(mem_PointerSpecialMove) & pointerMask) + 0xAB0) == ID))
    codeCharacter1ID  = any_of(array_filter(characterNicknames, ID => characterNicknames[ID] == character1), ID => __ornext(dword_be((dword_be(mem_PointerSpecialMove) & pointerMask) + 0xAB4) == ID ||
                                                                                                                            dword_be((dword_be(mem_PointerSpecialMove) & pointerMask) + 0xAB8) == ID))
    codeCharacter2ID  = any_of(array_filter(characterNicknames, ID => characterNicknames[ID] == character2), ID => __ornext(dword_be((dword_be(mem_PointerSpecialMove) & pointerMask) + 0xAB4) == ID ||
                                                                                                                            dword_be((dword_be(mem_PointerSpecialMove) & pointerMask) + 0xAB8) == ID))
    return codeSpecialMoveID &&
           codeCharacter1ID &&
           codeCharacter2ID
}

function check3CharactersPerformingSpecialMove(specialMoveID, character1, character2, character3) {
    codeSpecialMoveID = any_of(array_filter(specialMoveIDs, ID => specialMoveIDs[ID] == specialMoveID), ID => __ornext(dword_be((dword_be(mem_PointerSpecialMove) & pointerMask) + 0xAB0) == ID))
    codeCharacter1ID  = any_of(array_filter(characterNicknames, ID => characterNicknames[ID] == character1), ID => __ornext(dword_be((dword_be(mem_PointerSpecialMove) & pointerMask) + 0xAB4) == ID ||
                                                                                                                            dword_be((dword_be(mem_PointerSpecialMove) & pointerMask) + 0xAB8) == ID ||
                                                                                                                            dword_be((dword_be(mem_PointerSpecialMove) & pointerMask) + 0xABC) == ID))
    codeCharacter2ID  = any_of(array_filter(characterNicknames, ID => characterNicknames[ID] == character2), ID => __ornext(dword_be((dword_be(mem_PointerSpecialMove) & pointerMask) + 0xAB4) == ID ||
                                                                                                                            dword_be((dword_be(mem_PointerSpecialMove) & pointerMask) + 0xAB8) == ID ||
                                                                                                                            dword_be((dword_be(mem_PointerSpecialMove) & pointerMask) + 0xABC) == ID))
    codeCharacter3ID  = any_of(array_filter(characterNicknames, ID => characterNicknames[ID] == character3), ID => __ornext(dword_be((dword_be(mem_PointerSpecialMove) & pointerMask) + 0xAB4) == ID ||
                                                                                                                            dword_be((dword_be(mem_PointerSpecialMove) & pointerMask) + 0xAB8) == ID ||
                                                                                                                            dword_be((dword_be(mem_PointerSpecialMove) & pointerMask) + 0xABC) == ID))
    return codeSpecialMoveID &&
           codeCharacter1ID &&
           codeCharacter2ID &&
           codeCharacter3ID
}

//--------------------------------------------------
// Arrays and Dictionaries

// Character ID, Short Name, Full Name, Team, Other
characterIDs = {
    0x01: ["Mark",      "Mark Evans",       "Raimon",           ""],
    0x02: ["Mark",      "Mark Evans",       "Raimon II",        ""],
    0x03: ["Mark",      "Mark Evans",       "Inazuma National", ""],
    0x04: ["Nathan",    "Nathan Swift",     "Raimon",           ""],
    0x05: ["Nathan",    "Nathan Swift",     "Inazuma National", ""],
    0x06: ["Nathan",    "Nathan Swift",     "Dark Emperors",    ""],
    0x07: ["Jack",      "Jack Wallside",    "Raimon",           ""],
    0x08: ["Jack",      "Jack Wallside",    "Raimon II",        ""],
    0x09: ["Jack",      "Jack Wallside",    "Inazuma National", ""],
    0x0A: ["Jim",       "Jim Wraith",       "Raimon",           ""],
    0x0B: ["Jim",       "Jim Wraith",       "Dark Emperors",    ""],
    0x0C: ["Tod",       "Tod Ironside",     "Raimon",           ""],
    0x0D: ["Tod",       "Tod Ironside",     "Inazuma National", ""],
    0x0E: ["Tod",       "Tod Ironside",     "Dark Emperors",    ""],
    0x0F: ["Steve",     "Steve Grim",       "Raimon",           ""],
    0x10: ["Steve",     "Steve Grim",       "Dark Emperors",    ""],
    0x11: ["Timmy",     "Tim Saunders",     "Raimon",           ""],
    0x12: ["Timmy",     "Tim Saunders",     "Dark Emperors",    ""],
    0x13: ["Sam",       "Sam Kincaid",      "Raimon",           ""],
    0x14: ["Sam",       "Sam Kincaid",      "Dark Emperors",    ""],
    0x15: ["Max",       "Maxwell Carson",   "Raimon",           ""],
    0x16: ["Max",       "Maxwell Carson",   "Dark Emperors",    ""],
    0x17: ["Axel",      "Axel Blaze",       "Raimon",           ""],
    0x18: ["Axel",      "Axel Blaze",       "Raimon II",        ""],
    0x19: ["Axel",      "Axel Blaze",       "Inazuma National", ""],
    0x1A: ["Kevin",     "Kevin Dragonfly",  "Raimon",           ""],
    0x1B: ["Kevin",     "Kevin Dragonfly",  "Inazuma National", ""],
    0x1C: ["Kevin",     "Kevin Dragonfly",  "Dark Emperors",    ""],
    0x1D: ["Willy",     "William Glass",    "Raimon",           ""],
    0x1E: ["Willy",     "William Glass",    "Raimon II",        ""],
    0x1F: ["Bobby",     "Bobby Shearer",    "Raimon",           ""],
    0x20: ["Bobby",     "Bobby Shearer",    "Raimon II",        ""],
    0x21: ["Bobby",     "Bobby Shearer",    "Int'l Allstars",   ""],
    0x22: ["Jude",      "Jude Sharp",       "Raimon",           ""],
    0x23: ["Jude",      "Jude Sharp",       "Raimon II",        ""],
    0x24: ["Jude",      "Jude Sharp",       "Inazuma National", ""],
    0x25: ["Jude",      "Jude Sharp",       "Royal Academy",    ""],
    0x26: ["Erik",      "Erik Eagle",       "Raimon",           ""],
    0x27: ["Erik",      "Erik Eagle",       "Raimon II",        ""],
    0x28: ["Erik",      "Erik Eagle",       "Int'l Allstars",   ""],
    0x29: ["LaChance",  "Darren LaChance",  "Raimon II",        ""],
    0x2A: ["LaChance",  "Darren LaChance",  "Inazuma National", ""],
    0x2B: ["Kane",      "Hurley Kane",      "Raimon II",        ""],
    0x2C: ["Kane",      "Hurley Kane",      "Inazuma National", ""],
    0x2D: ["Banyan",    "Scott Banyan",     "Raimon II",        ""],
    0x2E: ["Banyan",    "Scott Banyan",     "Inazuma National", ""],
    0x2F: ["Tori",      "Victoria Vanguard","Raimon II",        ""],
    0x30: ["Froste",    "Shawn Froste",     "Inazuma National", ""],
    0x31: ["Froste",    "Shawn Froste",     "Raimon II",        "Shawn"],
    0x32: ["Froste",    "Shawn Froste",     "Raimon II",        "Aiden"],
    0x33: ["Hartland",  "Suzette Hartland", "Raimon II",        ""],
    0x34: ["Hawkins",   "Archer Hawkins",   "Inazuma National", ""],
    0x35: ["Stonewall", "Caleb Stonewall",  "Inazuma National", ""],
    0x36: ["Stonewall", "Caleb Stonewall",  "Royal Redux",      ""],
    0x37: ["Hobbes",    "Austin Hobbes",    "Inazuma National", ""],
    0x38: ["Xavier",    "Xavier Foster",    "Inazuma National", ""],
    0x39: ["Xene",      "Xene",             "Alius Academy",    ""],
    0x3A: ["Stoutberg", "Thor Stoutberg",   "Inazuma National", ""],
    0x3B: ["Samford",   "David Samford",    "Inazuma National", ""],
    0x3C: ["Samford",   "David Samford",    "Royal Academy",    ""],
    0x3D: ["Samford",   "David Samford",    "Royal Redux",      ""],
    0x3E: ["Greenway",  "Jordan Greenway",  "Inazuma National", ""],
    0x3F: ["Janus",     "Janus",            "Alius Academy",    ""],
    0x40: ["King",      "Joseph King",      "Royal Academy",    ""],
    0x41: ["King",      "Joseph King",      "Neo National",     ""],
    0x42: ["King",      "Joseph King",      "Royal Redux",      ""],
    0x43: ["Drent",     "Peter Drent",      "Royal Academy",    ""],
    0x44: ["Simmons",   "Ben Simmons",      "Royal Academy",    ""],
    0x45: ["Master",    "Alan Master",      "Royal Academy",    ""],
    0x46: ["Master",    "Alan Master",      "Neo National",     ""],
    0x47: ["Martin",    "Gus Martin",       "Royal Academy",    ""],
    0x48: ["Waldon",    "Herman Waldon",    "Royal Academy",    ""],
    0x49: ["Bloom",     "John Bloom",       "Royal Academy",    ""],
    0x4A: ["Swing",     "Derek Swing",      "Royal Academy",    ""],
    0x4B: ["Hatch",     "Daniel Hatch",     "Royal Academy",    ""],
    0x4C: ["Hatch",     "Daniel Hatch",     "Neo National",     ""],
    0x4D: ["Poseidon",  "Paul Siddon",      "Zeus",             ""],
    0x4E: ["Apollo",    "Apollo Light",     "Zeus",             ""],
    0x4F: ["Hephestus", "Jeff Iron",        "Zeus",             ""],
    0x50: ["Ares",      "Lane War",         "Zeus",             ""],
    0x51: ["Dionysus",  "Danny Wood",       "Zeus",             ""],
    0x52: ["Artemis",   "Artie Mishman",    "Zeus",             ""],
    0x53: ["Hermes",    "Arion Matlock",    "Zeus",             ""],
    0x54: ["Athena",    "Wesley Knox",      "Zeus",             ""],
    0x55: ["Demeter",   "Jonas Demetrius",  "Zeus",             ""],
    0x56: ["Demeter",   "Jonas Demetrius",  "Neo National",     ""],
    0x57: ["Aphrodite", "Byron Love",       "Zeus",             ""],
    0x58: ["Aphrodite", "Byron Love",       "Int'l Allstars",   ""],
    0x59: ["Hera",      "Henry House",      "Zeus",             ""],
    0x5A: ["Hera",      "Henry House",      "Neo National",     ""],
    0x5B: ["Quagmire",  "Dave Quagmire",    "Neo National",     ""],
    0x5C: ["Dvalin",    "Dvalin",           "Alius Academy",    ""],
    0x5D: ["Arkew",     "Alan Downhill",    "Alius Academy",    ""],
    0x5E: ["Ganymede",  "Grant Icewater",   "Alius Academy",    ""],
    0x5F: ["Icer",      "Lucy Hailstone",   "Alius Academy",    ""],
    0x60: ["Bellatrix", "Isabelle Trick",   "Alius Academy",    ""],
    0x61: ["Metron",    "Ronny Metcalf",    "Alius Academy",    ""],
    0x62: ["Krypto",    "Karen Ripton",     "Alius Academy",    ""],
    0x63: ["Mercury",   "Carrie McCuring",  "Alius Academy",    ""],
    0x64: ["Diam",      "Dylan Bluemoon",   "Alius Academy",    ""],
    0x65: ["Nero",      "Nelson Rockwell",  "Alius Academy",    ""],
    0x66: ["Kiburn",    "Kim Powell",       "Alius Academy",    ""],
    0x67: ["Kiwill",    "Katie Brown",      "Alius Academy",    ""],
    0x68: ["Pandora",   "Pat Box",          "Alius Academy",    ""],
    0x69: ["Rihm",      "Rhona Countdown",  "Alius Academy",    ""],
    0x6A: ["Grent",     "Grant Cook",       "Chaos",            ""],
    0x6B: ["Gocker",    "Albert Denver",    "Chaos",            ""],
    0x6C: ["Baller",    "Bonnie Sparks",    "Chaos",            ""],
    0x6D: ["Clear",     "Claire Lesnow",    "Chaos",            ""],
    0x6E: ["Bomber",    "Ben Blowton",      "Chaos",            ""],
    0x6F: ["Heat",      "Ethan Whitering",  "Chaos",            ""],
    0x70: ["Heat",      "Ethan Whitering",  "Neo National",     ""],
    0x71: ["Neppten",   "Nigel August",     "Chaos",            ""],
    0x72: ["Rhine",     "Ving Rice",        "Chaos",            ""],
    0x73: ["Droll",     "Dawson Foxx",      "Chaos",            ""],
    0x74: ["Torch",     "Claude Beacons",   "Chaos",            ""],
    0x75: ["Gazelle",   "Bryce Whitingale", "Chaos",            ""],
    0x76: ["Feldt",     "Thomas Feldt",     "Brianwashing",     ""],
    0x77: ["Feldt",     "Thomas Feldt",     "Dark Emperors",    ""],
    0x78: ["Night",     "Malcolm Night",    "Kirkwood",         ""],
    0x79: ["Night",     "Malcolm Night",    "Dark Emperors",    ""],
    0x7A: ["Shadow",    "Shadow Cimmerian", "Raimon",           ""],
    0x7B: ["Shadow",    "Shadow Cimmerian", "Dark Emperors",    ""],
    0x7C: ["Bargie",    "Argie Bargie",     "Neo National",     ""],
    0x7D: ["Zohen",     "Zack Cummings",    "Neo National",     ""],
    0x7E: ["Talisman",  "Johan Tassman",    "Neo National",     ""],
    0x7F: ["Cloak",     "Sail Bluesea",     "Neo National",     ""],
    0x80: ["Turner",    "Neil Turner",      "Neo National",     ""],
    0x81: ["Zell",      "Zeke Valanche",    "Neo National",     ""],
    0x82: ["Wittz",     "Wilbur Watkins",   "Neo National",     ""],
    0x83: ["Hillvalley","Mark Hillvalley",  "Neo National",     ""],
    0x84: ["Tyler",     "Tyler Murdock",    "Neo National",     ""],
    0x85: ["Helio",     "Hector Helio",     "Int'l Allstars",   ""],
    0x86: ["Kalil",     "Bilal Kalil",      "Int'l Allstars",   ""],
    0x87: ["Torres",    "Thiago Torres",    "Int'l Allstars",   ""],
    0x88: ["Krueger",   "Mark Krueger",     "Int'l Allstars",   ""],
    0x89: ["Choi",      "Changsu Choi",     "Int'l Allstars",   ""],
    0x8A: ["Robingo",   "Mac Robingo",      "Int'l Allstars",   ""],
    0x8B: ["Partinus",  "Edgar Partinus",   "Int'l Allstars",   ""],
    0x8C: ["Bianchi",   "Paolo Bianchi",    "Int'l Allstars",   ""],
    0x8D: ["Blasi",     "Gigi Blasi",       "Int'l Allstars",   ""],
    0x8E: ["Mountain",  "Walte Mountain",   "Int'l Allstars",   ""],
    0x8F: ["Lagarto",   "Carlos Lagarto",   "Int'l Allstars",   ""],
    0x90: ["Dolphin",   "Dolph Hensen",     "Int'l Allstars",   ""],
    0x91: ["Keats",     "Dylan Keats",      "Int'l Allstars",   ""],
    0x92: ["Astaroth",  "Astaroth",         "Dark Angel",       ""],
    0x93: ["Nenel",     "Nenel",            "Dark Angel",       ""],
    0x94: ["Lephiel",   "Lephiel",          "Dark Angel",       ""],
    0x95: ["Behemoth",  "Behemoth",         "Dark Angel",       ""],
    0x96: ["Bael",      "Bael",             "Dark Angel",       ""],
    0x97: ["Wenel",     "Wenel",            "Dark Angel",       ""],
    0x98: ["Malphas",   "Malphas",          "Dark Angel",       ""],
    0x99: ["Gaiel",     "Gaiel",            "Dark Angel",       ""],
    0x9A: ["Thanatos",  "Thanatos",         "Dark Angel",       ""],
    0x9B: ["Sactus",    "Sanctus",          "Dark Angel",       ""],
    0x9C: ["Destra",    "Destra",           "Dark Angel",       ""],
    0x9D: ["Silvia",    "Silvia Woods",     "Girl's Team",      ""],
    0x9E: ["Downtown",  "Joaquine Downtown","Girl's Team",      ""],
    0x9F: ["Earth",     "Hellen Hearth",    "Girl's Team",      ""],
    0xA0: ["Cammy",     "Camellia Travis",  "Girl's Team",      ""],
    0xA1: ["Greenland", "Esther Greenland", "Girl's Team",      ""],
    0xA2: ["Sparrow",   "Sue Sparrow",      "Girl's Team",      ""],
    0xA3: ["Bluebells", "Bela Bluebells",   "Girl's Team",      ""],
    0xA4: ["Celia",     "Celia Hills",      "Girl's Team",      ""],
    0xA5: ["Agent M",   "Marge Fielding",   "Girl's Team",      ""],
    0xA6: ["Nelly",     "Nelly Raimon",     "Girl's Team",      ""],
    0xA7: ["Millie",    "Millie Moonlight", "Girl's Team",      ""],
    0xA8: ["Daisy",     "Daisy Fields",     "Girl's Team",      ""],
    0xA9: ["Sand",      "Alexia Sand",      "Girl's Team",      ""],
    0xAA: ["Delight",   "Dora Delight",     "Girl's Team",      ""],
    0xAB: ["Bootgaiter","Kerry Bootgaiter", "Girl's Team",      ""],
    0xAC: ["Willow",    "Lily Willow",      "Girl's Team",      ""],
    0xAD: ["Luceafăr",  "Lars Luceafăr",    "Team Ogre",        ""],
    0xAE: ["L. Trungus","Lump Trungus",     "Team Ogre",        ""],
    0xAF: ["B. Trungus","Bump Trungus",     "Team Ogre",        ""],
    0xB0: ["Jenkins",   "Jynx Jenkins",     "Team Ogre",        ""],
    0xB1: ["Ischer",    "Radd Ischer",      "Team Ogre",        ""],
    0xB2: ["Gunther",   "Drachen Gunther",  "Team Ogre",        ""],
    0xB3: ["Triumvir",  "Oni Triumvir",     "Team Ogre",        ""],
    0xB4: ["Stark",     "Ichabod Stark",    "Team Ogre",        ""],
    0xB5: ["Callous",   "Mystral Callous",  "Team Ogre",        ""],
    0xB6: ["Malice",    "Escavan Malice",   "Team Ogre",        ""],
    0xB7: ["Lancer",    "Bash Lancer",      "Team Ogre",        ""],
    0xB8: ["Canon",     "Canon Evans",      "Raimon",           ""],
    0xB9: ["Syon",      "Syon Blaze",       "Raimon",           ""],
    0xBA: ["Miles",     "Miles Ryan",       "Raimon",           ""],
    0xBB: ["Peabody",   "Paul Peabody",     "Raimon",           ""],
    0xBC: ["Soundtown", "Cadence Soundtown","Mary Times",       ""],
    0xBD: ["Kappa",     "Karl Kappa",       "",                 ""],
    0xBE: ["Minion",    "Phil A. Minion",   "Team Garshield",   ""],
    0xBF: ["Acuto",     "Giulio Acuto",     "Team K",           ""],
    0xC0: ["Arion",     "Arion Sherwind",   "New Raimon",       ""],
    0xC1: ["Victor",    "Victor Blade",     "New Raimon",       ""],
    0xC2: ["Riccardo",  "Riccardo Di Rigo", "New Raimon",       ""],
    0xC3: ["Nelly",     "Nelly Raimon",     "",                 ""],
    0xC4: ["Celia",     "Celia Hills",      "",                 ""],
    0xC5: ["Cammy",     "Camellia Travis",  "",                 ""],
    0xC6: ["Silvia",    "Silvia Woods",     "",                 ""],
    0xC7: ["Aurelia",   "Aurelia Dingle",   "",                 ""],
    0xC8: ["Evans",     "David Evans",      "",                 ""],
    0xC9: ["Hillman",   "Seymour Hillman",  "",                 ""],
    0xCA: ["Travis",    "Percival Travis",  "",                 ""],
    0xCB: ["Lina",      "Aquilina Schiller","",                 ""],
    0xCE: ["Beacons",   "Claude Beacons",   "Fire Dragon",      ""],
    0xCF: ["Whitingale","Bryce Whitingale", "Fire Dragon",      ""],
    0xD0: ["Gabi",      "Gabriel Garcia",   "New Raimon",       ""],
    0xD1: ["'J.P.'",    "Jean-Pierre Lapin","New Raimon",       ""],
}

characterNicknames = {}

for character in characterIDs {
    characterNicknames[character] = characterIDs[character][0]
}

specialMoveIDs = {
    0x01: "Earthquake",
    0x02: "Iron Wall",
    0x03: "Land of Ice",
    0x04: "Ignite Steal",
    0x05: "Killer Slide",
    0x06: "Quick Draw",
    0x07: "Sleeping Dust",
    0x08: "Gravitation",
    0x09: "Ground Quake",
    0x0A: "Coil Turn",
    0x0B: "Heaven's Ascent",
    0x0C: "Hell's Descent",
    0x0D: "The Wall",
    0x0E: "The Tower",
    0x0F: "The Mountain",
    0x10: "Mystifying Mist",
    0x11: "Cyclone",
    0x12: "Divine Stamp",
    0x13: "Shooting Star",
    0x14: "Vac Attack",
    0x15: "Super Sumo Stomp",
    0x16: "Snow Angel",
    0x17: "Whirly-Whirly",
    0x18: "Spinning Cut",
    0x19: "The Wall",
    0x1A: "Whirlwind Force",
    0x1B: "Diabolical Cut",
    0x1C: "Desert Blast",
    0x1D: "Barbarian Shield",
    0x1E: "Perfect Tower",
    0x1F: "Power Charge",
    0x20: "Fake Bomber",
    0x21: "Flame Dance",
    0x22: "Frozen Steal",
    0x23: "Volcano Cut",
    0x24: "Mega Quake",
    0x25: "Rolling Slide",
    0x26: "Hammer of Fury",
    0x27: "Dimensional Hand",
    0x28: "Electrap",
    0x29: "Omega Hand",
    0x2A: "Gigant Wall",
    0x2B: "God Catch",
    0x2C: "God Hand (Evans)",
    0x2D: "God Hand (LaChance)",
    0x2E: "God Hand X",
    0x2F: "Colosseum Guard",
    0x30: "Colosseum Guard +1",
    0x31: "The End",
    0x32: "Temporal Wall",
    0x33: "Shot Pocket",
    0x34: "Fist of Justice",
    0x35: "Double Rocket",
    0x36: "Soul Hand",
    0x37: "Tsunami Wall",
    0x38: "Dual Smash",
    0x39: "Drill Smasher",
    0x3A: "Drill Smasher V2",
    0x3B: "Flower Power",
    0x3C: "Flower Power +1",
    0x3D: "Burnout",
    0x3E: "Burnout V2",
    0x3F: "High Voltage",
    0x40: "Power Shield",
    0x41: "Beast Fang",
    0x42: "Procyon Net",
    0x43: "Fiend Hand",
    0x44: "Majin the Hand (Evans)",
    0x45: "Majin the Hand +2",
    0x46: "Majin the Hand (LaChance)",
    0x47: "Mugen the Hand",
    0x48: "Infinite Wall",
    0x49: "Wormhole",
    0x4A: "", // Normal Keeper Catch
    0x4B: "", // Normal Keeper Catch
    0x4C: "Aikido",
    0x4D: "Illusion Ball",
    0x4E: "Water Veil",
    0x4F: "Echo Ball",
    0x50: "Angel Ball",
    0x51: "Field of Force",
    0x52: "Afterimage",
    0x53: "The Ikaros",
    0x54: "Bewilder Blast",
    0x55: "Flurry Dash",
    0x56: "Breakthrough 2",
    0x57: "Breakthrough 3",
    0x58: "Super Elastico",
    0x59: "Easy Breezy",
    0x5A: "Dash Accelerator",
    0x5B: "Dash Storm",
    0x5C: "Whirlwind Twister",
    0x5D: "Rodeo Clown",
    0x5E: "Devil Ball",
    0x5F: "Abaddon Drop",
    0x60: "Bubble Gum",
    0x61: "Prima Donna",
    0x62: "Flame Veil",
    0x63: "Hey Presto",
    0x64: "Clone Faker",
    0x65: "Heaven's Time",
    0x66: "Matador Feint",
    0x67: "Deceptor Dribble",
    0x68: "Meteor Shower",
    0x69: "Liar Shot",
    0x6A: "Lightning Sprint",
    0x6B: "Warp Drive",
    0x6C: "Flurry Dash",
    0x6D: "Wind God's Dance",
    0x6E: "Remote Combustion",
    0x6F: "X Blast",
    0x70: "Astro Break",
    0x71: "Atomic Flare",
    0x72: "Inazuma-1",
    0x73: "Inazuma-1 Drop",
    0x74: "Inazuma Drop",
    0x75: "Inazuma Break",
    0x76: "Legendary Wolf",
    0x77: "Excalibur",
    0x78: "Odin Sword",
    0x79: "Gaia Break",
    0x7A: "Chaos Break",
    0x7B: "Ganymede Ray",
    0x7C: "Gladius Arch",
    0x7D: "Grand Fire",
    0x7E: "Grand Fenrir",
    0x7F: "Grenade Shot",
    0x80: "Cross Drive",
    0x81: "Cross Fire",
    0x82: "Cross Fire",
    0x83: "Gungnir",
    0x84: "Emperor Penguin No. 1",
    0x85: "Emperor Penguin No. 3",
    0x86: "Emperor Penguin X",
    0x87: "Almighty Cannon",
    0x88: "God Knows",
    0x89: "God Break",
    0x8A: "The Typhoon",
    0x8B: "The Dawn",
    0x8C: "The Hurricane",
    0x8D: "The Phoenix",
    0x8E: "Thunder Beast",
    0x8F: "The Earth",
    0x90: "Jet Stream",
    0x91: "Shadow Ray",
    0x92: "Comet Shot",
    0x93: "Supernova",
    0x94: "Samba Strike",
    0x95: "Spiral Shot",
    0x96: "Spinning Shot",
    0x97: "Space Penguin",
    0x98: "Dark Tornado",
    0x99: "Dark Tornado +1",
    0x9A: "Dark Phoenix",
    0x9B: "Dark Matter",
    0x9C: "Tiger Storm",
    0x9D: "Tiger Drive",
    0x9E: "Whirlwind Drop",
    0x9F: "Twin Boost",
    0xA0: "Twin Boost F",
    0xA1: "Tsunami Boost",
    0xA2: "Divine Arrows",
    0xA3: "Doom Spear",
    0xA4: "Doomsword Slash",
    0xA5: "Death Zone",
    0xA6: "Death Zone 2",
    0xA7: "Doom Dive Drive",
    0xA8: "Doom Break",
    0xA9: "Doom Rain",
    0xAA: "Celestial Smash",
    0xAB: "Triangle Z",
    0xAC: "Tri-Pegasus",
    0xAD: "Dragon Cannon",
    0xAE: "Dragon Crash",
    0xAF: "Dragon Crash +1",
    0xB0: "Dragon Slayer",
    0xB1: "Dragon Tornado",
    0xB2: "Triple Boost",
    0xB3: "Northern Impact",
    0xB4: "Fireball Screw",
    0xB5: "Fireball Storm",
    0xB6: "Butterfly Trance",
    0xB7: "Back Tornado",
    0xB8: "Paladin Strike",
    0xB9: "Big Bang",
    0xBA: "Wrath Shot",
    0xBB: "Fire Tornado",
    0xBC: "Fire Tornado +1",
    0xBD: "Fire Blizzard",
    0xBE: "Fire Blizzard",
    0xBF: "Phantom Shot",
    0xC0: "Fortissimo Foot",
    0xC1: "Jumping Jack",
    0xC2: "Prime Legend",
    0xC3: "Pegasus Shot",
    0xC4: "Heavenly Drive",
    0xC5: "Fire Rooster",
    0xC6: "Maximum Fire",
    0xC7: "Mirage Shot",
    0xC8: "Megaton Head",
    0xC9: "Spectacle Crash",
    0xCA: "Spectacle Crash",
    0xCB: "Megalodon",
    0xCC: "Unicorn Boost",
    0xCD: "Cosmic Blast",
    0xCE: "Reflect Buster",
    0xCF: "Meteor Blade",
    0xD0: "Revolution V",
    0xD1: "Bed of Roses",
    0xD2: "Bed of Roses V2",
    0xD3: "Rolling Kick",
    0xD4: "Wyvern Crash",
    0xD5: "Wyvern Blizzard",
    0xD6: "Emperor Penguin No. 2",
    0xD7: "Eternal Blizzard",
}

teamIDs = {
    0x00: "Original Team",
    0x01: "Raimon",
    0x02: "Royal Academy",
    0x03: "Zeus",
    0x04: "Raimon II",
    0x05: "Alius Academy",
    0x06: "Chaos",
    0x07: "Dark Emperors",
    0x08: "Inazuma National",
    0x09: "Neo National",
    0x0A: "Int'l Allstars",
    0x0B: "Dark Angels",
    0x0C: "Team Ogre",
    0x0D: "Girl's Team",
    0x0E: "New Raimon",
    0x10: "Genesis",
    0x11: "Diamond Dust",
    0x12: "Prominence",
    0x13: "Gemini Storm",
    0x14: "Epsilon",
    0x15: "Little Gigantes",
    0x16: "Orpheus",
    0x17: "Unicorn",
    0x18: "The Kingdom",
    0x19: "Queen's Knights",
    0x1A: "Royal Redux",
    0x1B: "Fire Dragon",
    0x1C: "The Empire",
}

stadiumIDs = {
    0x01: "New Raimon Stadium",
    0x02: "Football Frontier Stadium",
    0x03: "Titanic Stadium",
    0x04: "Zeus Stadium",
    0x05: "Alius Academy Stadium",
    0x06: "Royal Academy Stadium",
    0x07: "Ogre Land",
    0x08: "Legendary Land",
    0x09: "Royal Redux Stadium",
    0x0A: "Old Raimon Stadium",
    0x0B: "New Raimon Stadium",
}

matchTypeIDs = {
    0x01: "Exhibition",
    0x02: "Tournament",
    0x04: "Friendly",
    0x05: "Competition",
}

matchPhaseIDs = {
    0x00: "1H",
    0x01: "2H",
    0x02: "ET1",
    0x03: "ET2",
}

minigameIDs = {
    0x00: "Bus Pull!",
    0x01: "Tyre Punch!",
    0x02: "Volley!",
    0x03: "Tyre Dash!",
    0x04: "Bungee Shot!",
}

competitionIDs = {
    0x00: "1st Competition",
    0x01: "2nd Competition",
    0x02: "3rd Competition",
    0x03: "4th Competition",
}

fillerZero = {
    0: "0"
}

//--------------------------------------------------
// Achievements

achievement(
    title = "Royal Rank Demotion", type = "progression",
    description = "Win against Royal Academy in the 1st competition.",
    id = 620796, badge = "705549", points = 5,
    trigger = getMatchType() == 0x05 &&
              getTeamID("Team 2") == 0x02 &&
              checkStoryCompetitionProgress(0x00, 0x00) &&
              getCompetitionResult() == 0x01 &&
              getCompetitionResult() != prev(getCompetitionResult())
)

achievement(
    title = "Fall of the Olymp", type = "progression",
    description = "Win against Zeus in the 1st competition.",
    id = 620797, badge = "705550", points = 5,
    trigger = getMatchType() == 0x05 &&
              getTeamID("Team 2") == 0x03 &&
              checkStoryCompetitionProgress(0x00, 0x01) &&
              getCompetitionResult() == 0x01 &&
              getCompetitionResult() != prev(getCompetitionResult())
)

achievement(
    title = "Legendary Beast Tamer", type = "win_condition",
    description = "Win against Team Ogre in the 1st competition.",
    id = 620900, badge = "705557", points = 10,
    trigger = getMatchType() == 0x05 &&
              getTeamID("Team 2") == 0x0C &&
              checkStoryCompetitionProgress(0x00, 0x02) &&
              getCompetitionResult() == 0x01 &&
              getCompetitionResult() != prev(getCompetitionResult())
)

achievement(
    title = "Cold-Heated Downfall", type = "progression",
    description = "Win against Chaos in the 2nd competition.",
    id = 620800, badge = "705551", points = 5,
    trigger = getMatchType() == 0x05 &&
              getTeamID("Team 2") == 0x06 &&
              checkStoryCompetitionProgress(0x01, 0x00) &&
              getCompetitionResult() == 0x01 &&
              getCompetitionResult() != prev(getCompetitionResult())
)

achievement(
    title = "Blast to Another Planet", type = "progression",
    description = "Win against Alius Academy in the 2nd competition.",
    id = 620801, badge = "705552", points = 5,
    trigger = getMatchType() == 0x05 &&
              getTeamID("Team 2") == 0x05 &&
              checkStoryCompetitionProgress(0x01, 0x01) &&
              getCompetitionResult() == 0x01 &&
              getCompetitionResult() != prev(getCompetitionResult())
)

achievement(
    title = "Piercing Light of Friendship", type = "progression",
    description = "Win against Dark Emperors in the 2nd competition.",
    id = 620862, badge = "705553", points = 10,
    trigger = getMatchType() == 0x05 &&
              getTeamID("Team 2") == 0x07 &&
              checkStoryCompetitionProgress(0x01, 0x02) &&
              getCompetitionResult() == 0x01 &&
              getCompetitionResult() != prev(getCompetitionResult())
)

achievement(
    title = "National Neo-No", type = "progression",
    description = "Win against Neo National in the 3rd competition.",
    id = 620864, badge = "705554", points = 5,
    trigger = getMatchType() == 0x05 &&
              getTeamID("Team 2") == 0x09 &&
              checkStoryCompetitionProgress(0x02, 0x00) &&
              getCompetitionResult() == 0x01 &&
              getCompetitionResult() != prev(getCompetitionResult())
)

achievement(
    title = "All Stars In My Team", type = "progression",
    description = "Win against Int'l Allstars in the 3rd competition.",
    id = 620874, badge = "705555", points = 5,
    trigger = getMatchType() == 0x05 &&
              getTeamID("Team 2") == 0x0A &&
              checkStoryCompetitionProgress(0x02, 0x01) &&
              getCompetitionResult() == 0x01 &&
              getCompetitionResult() != prev(getCompetitionResult())
)

achievement(
    title = "From Heaven to Hell", type = "progression",
    description = "Win against Dark Angels in the 3rd competition.",
    id = 620899, badge = "705556", points = 10,
    trigger = getMatchType() == 0x05 &&
              getTeamID("Team 2") == 0x0B &&
              checkStoryCompetitionProgress(0x02, 0x02) &&
              getCompetitionResult() == 0x01 &&
              getCompetitionResult() != prev(getCompetitionResult())
)

achievement(
    title = "Beauties and the Beat", type = "",
    description = "Win against Girl's Team in the 4th competition.",
    id = 620958, badge = "705548", points = 25,
    trigger = getMatchType() == 0x05 &&
              getTeamID("Team 2") == 0x0D &&
              checkStoryCompetitionProgress(0x03, 0x03) &&
              getCompetitionID() == 0x03 &&
              __ornext(getCompetitionTrophy(4, "Gold") > prev(getCompetitionTrophy(4, "Gold")) ||
                       getCompetitionTrophy(4, "Platinum") > prev(getCompetitionTrophy(4, "Platinum"))) &&
              prev(getCompetitionTrophy(4, "Gold"))
              + prev(getCompetitionTrophy(4, "Platinum")) == 0
)

achievement(
    title = "Best of the Best", type = "",
    description = "Obtain a platinum trophy in all competitions.",
    id = 620982, badge = "705545", points = 10,
    trigger = __ornext(checkSubState(0x02, 0x18) ||
                       checkGameState(0x03)) &&
              getMatchType() == 0x05 &&
              checkStoryCompetitionProgress(0x03, 0x03) &&
              measured(getCompetitionTrophy(1, "Platinum")
                       + getCompetitionTrophy(2, "Platinum")
                       + getCompetitionTrophy(3, "Platinum")
                       + getCompetitionTrophy(4, "Platinum") == 4) &&
               prev(getCompetitionTrophy(1, "Platinum"))
               + prev(getCompetitionTrophy(2, "Platinum"))
               + prev(getCompetitionTrophy(3, "Platinum"))
               + prev(getCompetitionTrophy(4, "Platinum")) == 3
)

achievement(
    title = "Wins Hand Down", type = "",
    description = "Obtain a platinum medal in a friendly match against every teams.",
    id = 621099, badge = "705624", points = 25,
    trigger = __ornext(checkSubState(0x02, 0x18) ||
                       checkGameState(0x03)) &&
              getMatchType() == 0x04 &&
              measured(calculatePlatinumFriendlyMatchMedals() == 13) &&
              prev(calculatePlatinumFriendlyMatchMedals()) == 12
)

achievement(
    title = "Right Things to Say", type = "",
    description = "Unlock every secret password character in the scout menu.",
    id = 621114, badge = "705625", points = 3,
    trigger = checkSubState(0x02, 0x10) &&
              measured(calculateUnlockedPasswordCharacters() == 7) &&
              prev(calculateUnlockedPasswordCharacters()) == 6
)

achievement(
    title = "Secret Admirer of Soccer", type = "",
    description = "Let Aurelia be the manager by using all other available managers in the team.",
    id = 620984, badge = "705546", points = 3,
    trigger = checkGameState(0x04) &&
              getManagerID() == 0xC7 &&
              getManagerID() != prev(getManagerID())
)

achievement(
    title = "Leading Voices", type = "",
    description = "Unlock all five managers for the support team.",
    id = 621324, badge = "705933", points = 3,
    trigger = checkGameState(0x04) &&
              ((measured(countManagersForAureliaWithoutCammy() == 5,
                         when = bit1(mem_SupporterFlags + 0x07) == 0x00) &&
                prev(countManagersForAureliaWithoutCammy() == 4)) || 
               (measured(countManagersForAureliaWithCammy() == 5,
                         when = bit1(mem_SupporterFlags + 0x07) == 0x01) &&
                prev(countManagersForAureliaWithCammy() == 4)))
)

achievement(
    title = "Stories of the Past", type = "",
    description = "Unlock all four coaches for the support team.",
    id = 621330, badge = "705937", points = 2,
    trigger = checkGameState(0x04) &&
              measured(countCoachesUnlocked() == 4) &&
              prev(countCoachesUnlocked()) == 3
)

achievement(
    title = "Great Team from the Very Beginning", type = "",
    description = "Win an tournament of 8 teams by using Raimon with each match being against strong COMs and half length being 5 minutes.",    
    id = 622873, badge = "707240", points = 25,
    trigger = checkTournamentChallengeWin(8) &&
              ((getPlayerFlagValueOfTournamentTeam(1) != 0x00 &&
                getTeamIDOfTournamentTeam(1) == 0x01) ||
               (getPlayerFlagValueOfTournamentTeam(2) != 0x00 &&
                getTeamIDOfTournamentTeam(2) == 0x01) ||
               (getPlayerFlagValueOfTournamentTeam(3) != 0x00 &&
                getTeamIDOfTournamentTeam(3) == 0x01) ||
               (getPlayerFlagValueOfTournamentTeam(4) != 0x00 &&
                getTeamIDOfTournamentTeam(4) == 0x01))
)

achievement(
    title = "A Team Born to Win", type = "",
    description = "Win an tournament of 8 teams by using Royal Academy with each match being against strong COMs and half length being 5 minutes.",
    id = 622874, badge = "707241", points = 25,
    trigger = checkTournamentChallengeWin(8) &&
              ((getPlayerFlagValueOfTournamentTeam(1) != 0x00 &&
                getTeamIDOfTournamentTeam(1) == 0x02) ||
               (getPlayerFlagValueOfTournamentTeam(2) != 0x00 &&
                getTeamIDOfTournamentTeam(2) == 0x02) ||
               (getPlayerFlagValueOfTournamentTeam(3) != 0x00 &&
                getTeamIDOfTournamentTeam(3) == 0x02) ||
               (getPlayerFlagValueOfTournamentTeam(4) != 0x00 &&
                getTeamIDOfTournamentTeam(4) == 0x02))
)

achievement(
    title = "Rise of the Gods", type = "",
    description = "Win an tournament of 8 teams by using Zeus with each match being against strong COMs and half length being 5 minutes.",
    id = 622875, badge = "707242", points = 25,
    trigger = checkTournamentChallengeWin(8) &&
              ((getPlayerFlagValueOfTournamentTeam(1) != 0x00 &&
                getTeamIDOfTournamentTeam(1) == 0x03) ||
               (getPlayerFlagValueOfTournamentTeam(2) != 0x00 &&
                getTeamIDOfTournamentTeam(2) == 0x03) ||
               (getPlayerFlagValueOfTournamentTeam(3) != 0x00 &&
                getTeamIDOfTournamentTeam(3) == 0x03) ||
               (getPlayerFlagValueOfTournamentTeam(4) != 0x00 &&
                getTeamIDOfTournamentTeam(4) == 0x03))
)

achievement(
    title = "Not Quite the Number Two", type = "",
    description = "Win an tournament of 8 teams by using Raimon II with each match being against strong COMs and half length being 5 minutes.",
    id = 622876, badge = "707243", points = 25,
    trigger = checkTournamentChallengeWin(8) &&
              ((getPlayerFlagValueOfTournamentTeam(1) != 0x00 &&
                getTeamIDOfTournamentTeam(1) == 0x04) ||
               (getPlayerFlagValueOfTournamentTeam(2) != 0x00 &&
                getTeamIDOfTournamentTeam(2) == 0x04) ||
               (getPlayerFlagValueOfTournamentTeam(3) != 0x00 &&
                getTeamIDOfTournamentTeam(3) == 0x04) ||
               (getPlayerFlagValueOfTournamentTeam(4) != 0x00 &&
                getTeamIDOfTournamentTeam(4) == 0x04))
)

achievement(
    title = "Fiercy Strategies Make Everyone Look Cool", type = "",
    description = "Win an tournament of 8 teams by using Chaos with each match being against strong COMs and half length being 5 minutes.",
    id = 622877, badge = "708261", points = 25,
    trigger = checkTournamentChallengeWin(8) &&
              ((getPlayerFlagValueOfTournamentTeam(1) != 0x00 &&
                getTeamIDOfTournamentTeam(1) == 0x06) ||
               (getPlayerFlagValueOfTournamentTeam(2) != 0x00 &&
                getTeamIDOfTournamentTeam(2) == 0x06) ||
               (getPlayerFlagValueOfTournamentTeam(3) != 0x00 &&
                getTeamIDOfTournamentTeam(3) == 0x06) ||
               (getPlayerFlagValueOfTournamentTeam(4) != 0x00 &&
                getTeamIDOfTournamentTeam(4) == 0x06))
)

achievement(
    title = "Not From This World", type = "",
    description = "Win an tournament of 8 teams by using Alius Academy with each match being against strong COMs and half length being 5 minutes.",
    id = 622878, badge = "707245", points = 25,
    trigger = checkTournamentChallengeWin(8) &&
              ((getPlayerFlagValueOfTournamentTeam(1) != 0x00 &&
                getTeamIDOfTournamentTeam(1) == 0x05) ||
               (getPlayerFlagValueOfTournamentTeam(2) != 0x00 &&
                getTeamIDOfTournamentTeam(2) == 0x05) ||
               (getPlayerFlagValueOfTournamentTeam(3) != 0x00 &&
                getTeamIDOfTournamentTeam(3) == 0x05) ||
               (getPlayerFlagValueOfTournamentTeam(4) != 0x00 &&
                getTeamIDOfTournamentTeam(4) == 0x05))
)

achievement(
    title = "Soldiers of the Dark", type = "",
    description = "Win an tournament of 8 teams by using Dark Emperors with each match being against strong COMs and half length being 5 minutes.",
    id = 622879, badge = "707246", points = 25,
    trigger = checkTournamentChallengeWin(8) &&
              ((getPlayerFlagValueOfTournamentTeam(1) != 0x00 &&
                getTeamIDOfTournamentTeam(1) == 0x07) ||
               (getPlayerFlagValueOfTournamentTeam(2) != 0x00 &&
                getTeamIDOfTournamentTeam(2) == 0x07) ||
               (getPlayerFlagValueOfTournamentTeam(3) != 0x00 &&
                getTeamIDOfTournamentTeam(3) == 0x07) ||
               (getPlayerFlagValueOfTournamentTeam(4) != 0x00 &&
                getTeamIDOfTournamentTeam(4) == 0x07))
)

achievement(
    title = "The Best of Japan", type = "",
    description = "Win an tournament of 8 teams by using Inazuma National with each match being against strong COMs and half length being 5 minutes.",
    id = 622880, badge = "707247", points = 25,
    trigger = checkTournamentChallengeWin(8) &&
              ((getPlayerFlagValueOfTournamentTeam(1) != 0x00 &&
                getTeamIDOfTournamentTeam(1) == 0x08) ||
               (getPlayerFlagValueOfTournamentTeam(2) != 0x00 &&
                getTeamIDOfTournamentTeam(2) == 0x08) ||
               (getPlayerFlagValueOfTournamentTeam(3) != 0x00 &&
                getTeamIDOfTournamentTeam(3) == 0x08) ||
               (getPlayerFlagValueOfTournamentTeam(4) != 0x00 &&
                getTeamIDOfTournamentTeam(4) == 0x08))
)

achievement(
    title = "When Plan B Becomes Plan A", type = "",
    description = "Win an tournament of 8 teams by using Neo National with each match being against strong COMs and half length being 5 minutes.",
    id = 622881, badge = "707248", points = 25,
    trigger = checkTournamentChallengeWin(8) &&
              ((getPlayerFlagValueOfTournamentTeam(1) != 0x00 &&
                getTeamIDOfTournamentTeam(1) == 0x09) ||
               (getPlayerFlagValueOfTournamentTeam(2) != 0x00 &&
                getTeamIDOfTournamentTeam(2) == 0x09) ||
               (getPlayerFlagValueOfTournamentTeam(3) != 0x00 &&
                getTeamIDOfTournamentTeam(3) == 0x09) ||
               (getPlayerFlagValueOfTournamentTeam(4) != 0x00 &&
                getTeamIDOfTournamentTeam(4) == 0x09))
)

achievement(
    title = "The Dream Everyone Shares", type = "",
    description = "Win an tournament of 8 teams by using Int'l Allstars with each match being against strong COMs and half length being 5 minutes.",
    id = 622882, badge = "707249", points = 25,
    trigger = checkTournamentChallengeWin(8) &&
              ((getPlayerFlagValueOfTournamentTeam(1) != 0x00 &&
                getTeamIDOfTournamentTeam(1) == 0x0A) ||
               (getPlayerFlagValueOfTournamentTeam(2) != 0x00 &&
                getTeamIDOfTournamentTeam(2) == 0x0A) ||
               (getPlayerFlagValueOfTournamentTeam(3) != 0x00 &&
                getTeamIDOfTournamentTeam(3) == 0x0A) ||
               (getPlayerFlagValueOfTournamentTeam(4) != 0x00 &&
                getTeamIDOfTournamentTeam(4) == 0x0A))
)

achievement(
    title = "Sacrifices for the Demon King", type = "",
    description = "Win an tournament of 8 teams by using Raimon with each match being against strong COMs and half length being 5 minutes.",
    id = 622883, badge = "707250", points = 25,
    trigger = checkTournamentChallengeWin(8) &&
              ((getPlayerFlagValueOfTournamentTeam(1) != 0x00 &&
                getTeamIDOfTournamentTeam(1) == 0x0B) ||
               (getPlayerFlagValueOfTournamentTeam(2) != 0x00 &&
                getTeamIDOfTournamentTeam(2) == 0x0B) ||
               (getPlayerFlagValueOfTournamentTeam(3) != 0x00 &&
                getTeamIDOfTournamentTeam(3) == 0x0B) ||
               (getPlayerFlagValueOfTournamentTeam(4) != 0x00 &&
                getTeamIDOfTournamentTeam(4) == 0x0B))
)

achievement(
    title = "Military God Eaters", type = "",
    description = "Win an tournament of 8 teams by using Team Ogre with each match being against strong COMs and half length being 5 minutes.",
    id = 622884, badge = "707251", points = 25,
    trigger = checkTournamentChallengeWin(8) &&
              ((getPlayerFlagValueOfTournamentTeam(1) != 0x00 &&
                getTeamIDOfTournamentTeam(1) == 0x0C) ||
               (getPlayerFlagValueOfTournamentTeam(2) != 0x00 &&
                getTeamIDOfTournamentTeam(2) == 0x0C) ||
               (getPlayerFlagValueOfTournamentTeam(3) != 0x00 &&
                getTeamIDOfTournamentTeam(3) == 0x0C) ||
               (getPlayerFlagValueOfTournamentTeam(4) != 0x00 &&
                getTeamIDOfTournamentTeam(4) == 0x0C))
)

achievement(
    title = "Woman Instincts", type = "",
    description = "Win an tournament of 8 teams by using Girl's Team with each match being against strong COMs and half length being 5 minutes.",
    id = 622885, badge = "707252", points = 25,
    trigger = checkTournamentChallengeWin(8) &&
              ((getPlayerFlagValueOfTournamentTeam(1) != 0x00 &&
                getTeamIDOfTournamentTeam(1) == 0x0D) ||
               (getPlayerFlagValueOfTournamentTeam(2) != 0x00 &&
                getTeamIDOfTournamentTeam(2) == 0x0D) ||
               (getPlayerFlagValueOfTournamentTeam(3) != 0x00 &&
                getTeamIDOfTournamentTeam(3) == 0x0D) ||
               (getPlayerFlagValueOfTournamentTeam(4) != 0x00 &&
                getTeamIDOfTournamentTeam(4) == 0x0D))
)

achievement(
    title = "Can't Stop the Rolling Train", type = "",
    description = "Get all medals in the training lesson \"Bus Pull!\" in any mode.",
    id = 621984, badge = "706481", points = 10,
    trigger = checkSubState(0x05, 0x00) &&
              ((measured(getMinigameMedal("Bus Pull!", 1, "Bronze")
                       + getMinigameMedal("Bus Pull!", 1, "Silver")
                       + getMinigameMedal("Bus Pull!", 1, "Gold")
                       + getMinigameMedal("Bus Pull!", 1, "Platinum") == 4) &&
                prev(getMinigameMedal("Bus Pull!", 1, "Bronze")
                   + getMinigameMedal("Bus Pull!", 1, "Silver")
                   + getMinigameMedal("Bus Pull!", 1, "Gold")
                   + getMinigameMedal("Bus Pull!", 1, "Platinum")) == 3) ||
               (measured(getMinigameMedal("Bus Pull!", 2, "Bronze")
                       + getMinigameMedal("Bus Pull!", 2, "Silver")
                       + getMinigameMedal("Bus Pull!", 2, "Gold")
                       + getMinigameMedal("Bus Pull!", 2, "Platinum") == 4) &&
                prev(getMinigameMedal("Bus Pull!", 2, "Bronze")
                   + getMinigameMedal("Bus Pull!", 2, "Silver")
                   + getMinigameMedal("Bus Pull!", 2, "Gold")
                   + getMinigameMedal("Bus Pull!", 2, "Platinum")) == 3) ||
               (measured(getMinigameMedal("Bus Pull!", 3, "Bronze")
                       + getMinigameMedal("Bus Pull!", 3, "Silver")
                       + getMinigameMedal("Bus Pull!", 3, "Gold")
                       + getMinigameMedal("Bus Pull!", 3, "Platinum") == 4) &&
                prev(getMinigameMedal("Bus Pull!", 3, "Bronze")
                   + getMinigameMedal("Bus Pull!", 3, "Silver")
                   + getMinigameMedal("Bus Pull!", 3, "Gold")
                   + getMinigameMedal("Bus Pull!", 3, "Platinum")) == 3) ||
               (measured(getMinigameMedal("Bus Pull!", 4, "Bronze")
                       + getMinigameMedal("Bus Pull!", 4, "Silver")
                       + getMinigameMedal("Bus Pull!", 4, "Gold")
                       + getMinigameMedal("Bus Pull!", 4, "Platinum") == 4) &&
                prev(getMinigameMedal("Bus Pull!", 4, "Bronze")
                   + getMinigameMedal("Bus Pull!", 4, "Silver")
                   + getMinigameMedal("Bus Pull!", 4, "Gold")
                   + getMinigameMedal("Bus Pull!", 4, "Platinum")) == 3))
)

achievement(
    title = "No Time or Tyre to Spare", type = "",
    description = "Get all medals in the training lesson \"Tyre Punch!\" in any mode.",
    id = 622056, badge = "706483", points = 10,
    trigger = checkSubState(0x05, 0x01) &&
              ((measured(getMinigameMedal("Tyre Punch!", 1, "Bronze")
                       + getMinigameMedal("Tyre Punch!", 1, "Silver")
                       + getMinigameMedal("Tyre Punch!", 1, "Gold")
                       + getMinigameMedal("Tyre Punch!", 1, "Platinum") == 4) &&
                prev(getMinigameMedal("Tyre Punch!", 1, "Bronze")
                   + getMinigameMedal("Tyre Punch!", 1, "Silver")
                   + getMinigameMedal("Tyre Punch!", 1, "Gold")
                   + getMinigameMedal("Tyre Punch!", 1, "Platinum")) == 3) ||
               (measured(getMinigameMedal("Tyre Punch!", 2, "Bronze")
                       + getMinigameMedal("Tyre Punch!", 2, "Silver")
                       + getMinigameMedal("Tyre Punch!", 2, "Gold")
                       + getMinigameMedal("Tyre Punch!", 2, "Platinum") == 4) &&
                prev(getMinigameMedal("Tyre Punch!", 2, "Bronze")
                   + getMinigameMedal("Tyre Punch!", 2, "Silver")
                   + getMinigameMedal("Tyre Punch!", 2, "Gold")
                   + getMinigameMedal("Tyre Punch!", 2, "Platinum")) == 3) ||
               (measured(getMinigameMedal("Tyre Punch!", 3, "Bronze")
                       + getMinigameMedal("Tyre Punch!", 3, "Silver")
                       + getMinigameMedal("Tyre Punch!", 3, "Gold")
                       + getMinigameMedal("Tyre Punch!", 3, "Platinum") == 4) &&
                prev(getMinigameMedal("Tyre Punch!", 3, "Bronze")
                   + getMinigameMedal("Tyre Punch!", 3, "Silver")
                   + getMinigameMedal("Tyre Punch!", 3, "Gold")
                   + getMinigameMedal("Tyre Punch!", 3, "Platinum")) == 3) ||
               (measured(getMinigameMedal("Tyre Punch!", 4, "Bronze")
                       + getMinigameMedal("Tyre Punch!", 4, "Silver")
                       + getMinigameMedal("Tyre Punch!", 4, "Gold")
                       + getMinigameMedal("Tyre Punch!", 4, "Platinum") == 4) &&
                prev(getMinigameMedal("Tyre Punch!", 4, "Bronze")
                   + getMinigameMedal("Tyre Punch!", 4, "Silver")
                   + getMinigameMedal("Tyre Punch!", 4, "Gold")
                   + getMinigameMedal("Tyre Punch!", 4, "Platinum")) == 3))
)

achievement(
    title = "Tree of Determination", type = "",
    description = "Get all medals in the training lesson \"Volley!\" in any mode.",
    id = 622072, badge = "706503", points = 10,
    trigger = checkSubState(0x05, 0x02) &&
              ((measured(getMinigameMedal("Volley!", 1, "Bronze")
                       + getMinigameMedal("Volley!", 1, "Silver")
                       + getMinigameMedal("Volley!", 1, "Gold")
                       + getMinigameMedal("Volley!", 1, "Platinum") == 4) &&
                prev(getMinigameMedal("Volley!", 1, "Bronze")
                   + getMinigameMedal("Volley!", 1, "Silver")
                   + getMinigameMedal("Volley!", 1, "Gold")
                   + getMinigameMedal("Volley!", 1, "Platinum")) == 3) ||
               (measured(getMinigameMedal("Volley!", 2, "Bronze")
                       + getMinigameMedal("Volley!", 2, "Silver")
                       + getMinigameMedal("Volley!", 2, "Gold")
                       + getMinigameMedal("Volley!", 2, "Platinum") == 4) &&
                prev(getMinigameMedal("Volley!", 2, "Bronze")
                   + getMinigameMedal("Volley!", 2, "Silver")
                   + getMinigameMedal("Volley!", 2, "Gold")
                   + getMinigameMedal("Volley!", 2, "Platinum")) == 3) ||
               (measured(getMinigameMedal("Volley!", 3, "Bronze")
                       + getMinigameMedal("Volley!", 3, "Silver")
                       + getMinigameMedal("Volley!", 3, "Gold")
                       + getMinigameMedal("Volley!", 3, "Platinum") == 4) &&
                prev(getMinigameMedal("Volley!", 3, "Bronze")
                   + getMinigameMedal("Volley!", 3, "Silver")
                   + getMinigameMedal("Volley!", 3, "Gold")
                   + getMinigameMedal("Volley!", 3, "Platinum")) == 3) ||
               (measured(getMinigameMedal("Volley!", 4, "Bronze")
                       + getMinigameMedal("Volley!", 4, "Silver")
                       + getMinigameMedal("Volley!", 4, "Gold")
                       + getMinigameMedal("Volley!", 4, "Platinum") == 4) &&
                prev(getMinigameMedal("Volley!", 4, "Bronze")
                   + getMinigameMedal("Volley!", 4, "Silver")
                   + getMinigameMedal("Volley!", 4, "Gold")
                   + getMinigameMedal("Volley!", 4, "Platinum")) == 3))
)

achievement(
    title = "Smells Like Burned Rubber", type = "",
    description = "Get all medals in the training lesson \"Tyre Dash!\" in any mode.",
    id = 622073, badge = "706504", points = 10,
    trigger = checkSubState(0x05, 0x03) &&
              ((measured(getMinigameMedal("Tyre Dash!", 1, "Bronze")
                       + getMinigameMedal("Tyre Dash!", 1, "Silver")
                       + getMinigameMedal("Tyre Dash!", 1, "Gold")
                       + getMinigameMedal("Tyre Dash!", 1, "Platinum") == 4) &&
                prev(getMinigameMedal("Tyre Dash!", 1, "Bronze")
                   + getMinigameMedal("Tyre Dash!", 1, "Silver")
                   + getMinigameMedal("Tyre Dash!", 1, "Gold")
                   + getMinigameMedal("Tyre Dash!", 1, "Platinum")) == 3) ||
               (measured(getMinigameMedal("Tyre Dash!", 2, "Bronze")
                       + getMinigameMedal("Tyre Dash!", 2, "Silver")
                       + getMinigameMedal("Tyre Dash!", 2, "Gold")
                       + getMinigameMedal("Tyre Dash!", 2, "Platinum") == 4) &&
                prev(getMinigameMedal("Tyre Dash!", 2, "Bronze")
                   + getMinigameMedal("Tyre Dash!", 2, "Silver")
                   + getMinigameMedal("Tyre Dash!", 2, "Gold")
                   + getMinigameMedal("Tyre Dash!", 2, "Platinum")) == 3) ||
               (measured(getMinigameMedal("Tyre Dash!", 3, "Bronze")
                       + getMinigameMedal("Tyre Dash!", 3, "Silver")
                       + getMinigameMedal("Tyre Dash!", 3, "Gold")
                       + getMinigameMedal("Tyre Dash!", 3, "Platinum") == 4) &&
                prev(getMinigameMedal("Tyre Dash!", 3, "Bronze")
                   + getMinigameMedal("Tyre Dash!", 3, "Silver")
                   + getMinigameMedal("Tyre Dash!", 3, "Gold")
                   + getMinigameMedal("Tyre Dash!", 3, "Platinum")) == 3) ||
               (measured(getMinigameMedal("Tyre Dash!", 4, "Bronze")
                       + getMinigameMedal("Tyre Dash!", 4, "Silver")
                       + getMinigameMedal("Tyre Dash!", 4, "Gold")
                       + getMinigameMedal("Tyre Dash!", 4, "Platinum") == 4) &&
                prev(getMinigameMedal("Tyre Dash!", 4, "Bronze")
                   + getMinigameMedal("Tyre Dash!", 4, "Silver")
                   + getMinigameMedal("Tyre Dash!", 4, "Gold")
                   + getMinigameMedal("Tyre Dash!", 4, "Platinum")) == 3))
)

achievement(
    title = "Sick Kicks Between Backwards Flicks", type = "",
    description = "Get all medals in the training lesson \"Bungee Shot!\" in any mode.",
    id = 622081, badge = "706512", points = 10,
    trigger = checkSubState(0x05, 0x04) &&
              ((measured(getMinigameMedal("Bungee Shot!", 1, "Bronze")
                       + getMinigameMedal("Bungee Shot!", 1, "Silver")
                       + getMinigameMedal("Bungee Shot!", 1, "Gold")
                       + getMinigameMedal("Bungee Shot!", 1, "Platinum") == 4) &&
                prev(getMinigameMedal("Bungee Shot!", 1, "Bronze")
                   + getMinigameMedal("Bungee Shot!", 1, "Silver")
                   + getMinigameMedal("Bungee Shot!", 1, "Gold")
                   + getMinigameMedal("Bungee Shot!", 1, "Platinum")) == 3) ||
               (measured(getMinigameMedal("Bungee Shot!", 2, "Bronze")
                       + getMinigameMedal("Bungee Shot!", 2, "Silver")
                       + getMinigameMedal("Bungee Shot!", 2, "Gold")
                       + getMinigameMedal("Bungee Shot!", 2, "Platinum") == 4) &&
                prev(getMinigameMedal("Bungee Shot!", 2, "Bronze")
                   + getMinigameMedal("Bungee Shot!", 2, "Silver")
                   + getMinigameMedal("Bungee Shot!", 2, "Gold")
                   + getMinigameMedal("Bungee Shot!", 2, "Platinum")) == 3) ||
               (measured(getMinigameMedal("Bungee Shot!", 3, "Bronze")
                       + getMinigameMedal("Bungee Shot!", 3, "Silver")
                       + getMinigameMedal("Bungee Shot!", 3, "Gold")
                       + getMinigameMedal("Bungee Shot!", 3, "Platinum") == 4) &&
                prev(getMinigameMedal("Bungee Shot!", 3, "Bronze")
                   + getMinigameMedal("Bungee Shot!", 3, "Silver")
                   + getMinigameMedal("Bungee Shot!", 3, "Gold")
                   + getMinigameMedal("Bungee Shot!", 3, "Platinum")) == 3) ||
               (measured(getMinigameMedal("Bungee Shot!", 4, "Bronze")
                       + getMinigameMedal("Bungee Shot!", 4, "Silver")
                       + getMinigameMedal("Bungee Shot!", 4, "Gold")
                       + getMinigameMedal("Bungee Shot!", 4, "Platinum") == 4) &&
                prev(getMinigameMedal("Bungee Shot!", 4, "Bronze")
                   + getMinigameMedal("Bungee Shot!", 4, "Silver")
                   + getMinigameMedal("Bungee Shot!", 4, "Gold")
                   + getMinigameMedal("Bungee Shot!", 4, "Platinum")) == 3))
)

achievement(
    title = "Feeling the Breath of the Dragon", type = "",
    description = "Perform Dragon Tornado with Axel and Kevin.",
    id = 622921, badge = "707415", points = 2,
    trigger = checkGameState(0x03) &&
              getMatchPhase() == prev(getMatchPhase()) &&
              check2CharactersPerformingSpecialMove("Dragon Tornado", "Axel", "Kevin") &&
              ((getTeamStatSpecialShots("Team 1") > prev(getTeamStatSpecialShots("Team 1")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x00 ||
                         getTeamSlotOfPlayer("Player 2") == 0x00 ||
                         getTeamSlotOfPlayer("Player 3") == 0x00 ||
                         getTeamSlotOfPlayer("Player 4") == 0x00)) ||
               (getTeamStatSpecialShots("Team 2") > prev(getTeamStatSpecialShots("Team 2")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x01 ||
                         getTeamSlotOfPlayer("Player 2") == 0x01 ||
                         getTeamSlotOfPlayer("Player 3") == 0x01 ||
                         getTeamSlotOfPlayer("Player 4") == 0x01)))  
              
)

achievement(
    title = "No Fear About Heights", type = "",
    description = "Perform Inazuma Drop with Jack and Axel.",
    id = 623136, badge = "707583", points = 2,
    trigger = checkGameState(0x03) &&
              getMatchPhase() == prev(getMatchPhase()) &&
              check2CharactersPerformingSpecialMove("Inazuma Drop", "Jack", "Axel") &&
              ((getTeamStatSpecialShots("Team 1") > prev(getTeamStatSpecialShots("Team 1")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x00 ||
                         getTeamSlotOfPlayer("Player 2") == 0x00 ||
                         getTeamSlotOfPlayer("Player 3") == 0x00 ||
                         getTeamSlotOfPlayer("Player 4") == 0x00)) ||
               (getTeamStatSpecialShots("Team 2") > prev(getTeamStatSpecialShots("Team 2")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x01 ||
                         getTeamSlotOfPlayer("Player 2") == 0x01 ||
                         getTeamSlotOfPlayer("Player 3") == 0x01 ||
                         getTeamSlotOfPlayer("Player 4") == 0x01)))  
              
)

achievement(
    title = "Strength of Friendship", type = "",
    description = "Perform Inazuma-1 with Mark and Axel.",
    id = 623144, badge = "707620", points = 3,
    trigger = checkGameState(0x03) &&
              getMatchPhase() == prev(getMatchPhase()) &&
              check2CharactersPerformingSpecialMove("Inazuma-1", "Mark", "Axel") &&
              ((getTeamStatSpecialShots("Team 1") > prev(getTeamStatSpecialShots("Team 1")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x00 ||
                         getTeamSlotOfPlayer("Player 2") == 0x00 ||
                         getTeamSlotOfPlayer("Player 3") == 0x00 ||
                         getTeamSlotOfPlayer("Player 4") == 0x00)) ||
               (getTeamStatSpecialShots("Team 2") > prev(getTeamStatSpecialShots("Team 2")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x01 ||
                         getTeamSlotOfPlayer("Player 2") == 0x01 ||
                         getTeamSlotOfPlayer("Player 3") == 0x01 ||
                         getTeamSlotOfPlayer("Player 4") == 0x01)))  
              
)

achievement(
    title = "Three Turn Two Into One", type = "",
    description = "Perform Inazuma-1 Drop with Mark, Jack and Axel.",
    id = 623252, badge = "708091", points = 5,
    trigger = checkGameState(0x03) &&
              getMatchPhase() == prev(getMatchPhase()) &&
              check3CharactersPerformingSpecialMove("Inazuma-1 Drop", "Mark", "Jack", "Axel") &&
              ((getTeamStatSpecialShots("Team 1") > prev(getTeamStatSpecialShots("Team 1")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x00 ||
                         getTeamSlotOfPlayer("Player 2") == 0x00 ||
                         getTeamSlotOfPlayer("Player 3") == 0x00 ||
                         getTeamSlotOfPlayer("Player 4") == 0x00)) ||
               (getTeamStatSpecialShots("Team 2") > prev(getTeamStatSpecialShots("Team 2")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x01 ||
                         getTeamSlotOfPlayer("Player 2") == 0x01 ||
                         getTeamSlotOfPlayer("Player 3") == 0x01 ||
                         getTeamSlotOfPlayer("Player 4") == 0x01)))  
              
)

achievement(
    title = "Chicken Al Dente", type = "",
    description = "Perform Fire Rooster with Nathan and Axel.",
    id = 623138, badge = "707584", points = 2,
    trigger = checkGameState(0x03) &&
              getMatchPhase() == prev(getMatchPhase()) &&
              check2CharactersPerformingSpecialMove("Fire Rooster", "Nathan", "Axel") &&
              ((getTeamStatSpecialShots("Team 1") > prev(getTeamStatSpecialShots("Team 1")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x00 ||
                         getTeamSlotOfPlayer("Player 2") == 0x00 ||
                         getTeamSlotOfPlayer("Player 3") == 0x00 ||
                         getTeamSlotOfPlayer("Player 4") == 0x00)) ||
               (getTeamStatSpecialShots("Team 2") > prev(getTeamStatSpecialShots("Team 2")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x01 ||
                         getTeamSlotOfPlayer("Player 2") == 0x01 ||
                         getTeamSlotOfPlayer("Player 3") == 0x01 ||
                         getTeamSlotOfPlayer("Player 4") == 0x01)))  
              
)

achievement(
    title = "Hail of Lightning Strikes", type = "",
    description = "Perform Inazuma Break with Mark, Axel and Jude.",
    id = 623253, badge = "708092", points = 4,
    trigger = checkGameState(0x03) &&
              getMatchPhase() == prev(getMatchPhase()) &&
              check3CharactersPerformingSpecialMove("Inazuma Break", "Mark", "Axel", "Jude") &&
              ((getTeamStatSpecialShots("Team 1") > prev(getTeamStatSpecialShots("Team 1")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x00 ||
                         getTeamSlotOfPlayer("Player 2") == 0x00 ||
                         getTeamSlotOfPlayer("Player 3") == 0x00 ||
                         getTeamSlotOfPlayer("Player 4") == 0x00)) ||
               (getTeamStatSpecialShots("Team 2") > prev(getTeamStatSpecialShots("Team 2")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x01 ||
                         getTeamSlotOfPlayer("Player 2") == 0x01 ||
                         getTeamSlotOfPlayer("Player 3") == 0x01 ||
                         getTeamSlotOfPlayer("Player 4") == 0x01)))  
              
)

achievement(
    title = "Granting a Horse Its Wings", type = "",
    description = "Perform Tri-Pegasus with Mark, Bobby and Erik.",
    id = 623254, badge = "708107", points = 3,
    trigger = checkGameState(0x03) &&
              getMatchPhase() == prev(getMatchPhase()) &&
              check3CharactersPerformingSpecialMove("Tri-Pegasus", "Mark", "Bobby", "Erik") &&
              ((getTeamStatSpecialShots("Team 1") > prev(getTeamStatSpecialShots("Team 1")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x00 ||
                         getTeamSlotOfPlayer("Player 2") == 0x00 ||
                         getTeamSlotOfPlayer("Player 3") == 0x00 ||
                         getTeamSlotOfPlayer("Player 4") == 0x00)) ||
               (getTeamStatSpecialShots("Team 2") > prev(getTeamStatSpecialShots("Team 2")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x01 ||
                         getTeamSlotOfPlayer("Player 2") == 0x01 ||
                         getTeamSlotOfPlayer("Player 3") == 0x01 ||
                         getTeamSlotOfPlayer("Player 4") == 0x01)))  
              
)

achievement(
    title = "Born to Burn", type = "",
    description = "Perform The Phoenix with Mark, Bobby and Erik.",
    id = 623270, badge = "708109", points = 4,
    trigger = checkGameState(0x03) &&
              getMatchPhase() == prev(getMatchPhase()) &&
              check3CharactersPerformingSpecialMove("The Phoenix", "Mark", "Bobby", "Erik") &&
              ((getTeamStatSpecialShots("Team 1") > prev(getTeamStatSpecialShots("Team 1")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x00 ||
                         getTeamSlotOfPlayer("Player 2") == 0x00 ||
                         getTeamSlotOfPlayer("Player 3") == 0x00 ||
                         getTeamSlotOfPlayer("Player 4") == 0x00)) ||
               (getTeamStatSpecialShots("Team 2") > prev(getTeamStatSpecialShots("Team 2")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x01 ||
                         getTeamSlotOfPlayer("Player 2") == 0x01 ||
                         getTeamSlotOfPlayer("Player 3") == 0x01 ||
                         getTeamSlotOfPlayer("Player 4") == 0x01)))  
              
)

achievement(
    title = "Royal Fire Twins", type = "",
    description = "Perform Twin Boost F with Axel and Jude.",
    id = 623272, badge = "708110", points = 2,
    trigger = checkGameState(0x03) &&
              getMatchPhase() == prev(getMatchPhase()) &&
              check2CharactersPerformingSpecialMove("Twin Boost F", "Axel", "Jude") &&
              ((getTeamStatSpecialShots("Team 1") > prev(getTeamStatSpecialShots("Team 1")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x00 ||
                         getTeamSlotOfPlayer("Player 2") == 0x00 ||
                         getTeamSlotOfPlayer("Player 3") == 0x00 ||
                         getTeamSlotOfPlayer("Player 4") == 0x00)) ||
               (getTeamStatSpecialShots("Team 2") > prev(getTeamStatSpecialShots("Team 2")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x01 ||
                         getTeamSlotOfPlayer("Player 2") == 0x01 ||
                         getTeamSlotOfPlayer("Player 3") == 0x01 ||
                         getTeamSlotOfPlayer("Player 4") == 0x01)))  
              
)

achievement(
    title = "Dragon in the Snowstorm", type = "",
    description = "Perform Wyvern Blizzard with Axel and Jude.",
    id = 623273, badge = "708236", points = 2,
    trigger = checkGameState(0x03) &&
              getMatchPhase() == prev(getMatchPhase()) &&
              check2CharactersPerformingSpecialMove("Wyvern Blizzard", "Kevin", "Froste") &&
              ((getTeamStatSpecialShots("Team 1") > prev(getTeamStatSpecialShots("Team 1")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x00 ||
                         getTeamSlotOfPlayer("Player 2") == 0x00 ||
                         getTeamSlotOfPlayer("Player 3") == 0x00 ||
                         getTeamSlotOfPlayer("Player 4") == 0x00)) ||
               (getTeamStatSpecialShots("Team 2") > prev(getTeamStatSpecialShots("Team 2")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x01 ||
                         getTeamSlotOfPlayer("Player 2") == 0x01 ||
                         getTeamSlotOfPlayer("Player 3") == 0x01 ||
                         getTeamSlotOfPlayer("Player 4") == 0x01)))  
              
)

achievement(
    title = "Wings of Love", type = "",
    description = "Perform Butterfly Trance with Tori and Hartland.",
    id = 623305, badge = "708248", points = 2,
    trigger = checkGameState(0x03) &&
              getMatchPhase() == prev(getMatchPhase()) &&
              check2CharactersPerformingSpecialMove("Butterfly Trance", "Tori", "Hartland") &&
              ((getTeamStatSpecialShots("Team 1") > prev(getTeamStatSpecialShots("Team 1")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x00 ||
                         getTeamSlotOfPlayer("Player 2") == 0x00 ||
                         getTeamSlotOfPlayer("Player 3") == 0x00 ||
                         getTeamSlotOfPlayer("Player 4") == 0x00)) ||
               (getTeamStatSpecialShots("Team 2") > prev(getTeamStatSpecialShots("Team 2")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x01 ||
                         getTeamSlotOfPlayer("Player 2") == 0x01 ||
                         getTeamSlotOfPlayer("Player 3") == 0x01 ||
                         getTeamSlotOfPlayer("Player 4") == 0x01)))  
              
)

achievement(
    title = "Royal Roots Inside", type = "",
    description = "Perform Death Zone 2 with Mark, Bobby and Jude.",
    id = 623310, badge = "708253", points = 5,
    trigger = checkGameState(0x03) &&
              getMatchPhase() == prev(getMatchPhase()) &&
              check3CharactersPerformingSpecialMove("Death Zone 2", "Mark", "Bobby", "Jude") &&
              ((getTeamStatSpecialShots("Team 1") > prev(getTeamStatSpecialShots("Team 1")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x00 ||
                         getTeamSlotOfPlayer("Player 2") == 0x00 ||
                         getTeamSlotOfPlayer("Player 3") == 0x00 ||
                         getTeamSlotOfPlayer("Player 4") == 0x00)) ||
               (getTeamStatSpecialShots("Team 2") > prev(getTeamStatSpecialShots("Team 2")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x01 ||
                         getTeamSlotOfPlayer("Player 2") == 0x01 ||
                         getTeamSlotOfPlayer("Player 3") == 0x01 ||
                         getTeamSlotOfPlayer("Player 4") == 0x01)))  
              
)

achievement(
    title = "Thermal Shock", type = "",
    description = "Perform Fire Blizzard with Torch and Gazelle.",
    id = 623350, badge = "708262", points = 4,
    trigger = checkGameState(0x03) &&
              getMatchPhase() == prev(getMatchPhase()) &&
              check2CharactersPerformingSpecialMove("Fire Blizzard", "Torch", "Gazelle") &&
              ((getTeamStatSpecialShots("Team 1") > prev(getTeamStatSpecialShots("Team 1")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x00 ||
                         getTeamSlotOfPlayer("Player 2") == 0x00 ||
                         getTeamSlotOfPlayer("Player 3") == 0x00 ||
                         getTeamSlotOfPlayer("Player 4") == 0x00)) ||
               (getTeamStatSpecialShots("Team 2") > prev(getTeamStatSpecialShots("Team 2")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x01 ||
                         getTeamSlotOfPlayer("Player 2") == 0x01 ||
                         getTeamSlotOfPlayer("Player 3") == 0x01 ||
                         getTeamSlotOfPlayer("Player 4") == 0x01)))  
              
)

achievement(
    title = "Tower of Lights", type = "",
    description = "Perform Perfect Tower with Kane, Banyan and Tori.",
    id = 623376, badge = "708310", points = 3,
    trigger = checkGameState(0x03) &&
              getMatchPhase() == prev(getMatchPhase()) &&
              check3CharactersPerformingSpecialMove("Perfect Tower", "Kane", "Banyan", "Tori") &&
              ((getTeamStatSpecialShots("Team 1") > prev(getTeamStatSpecialShots("Team 1")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x00 ||
                         getTeamSlotOfPlayer("Player 2") == 0x00 ||
                         getTeamSlotOfPlayer("Player 3") == 0x00 ||
                         getTeamSlotOfPlayer("Player 4") == 0x00)) ||
               (getTeamStatSpecialShots("Team 2") > prev(getTeamStatSpecialShots("Team 2")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x01 ||
                         getTeamSlotOfPlayer("Player 2") == 0x01 ||
                         getTeamSlotOfPlayer("Player 3") == 0x01 ||
                         getTeamSlotOfPlayer("Player 4") == 0x01)))  
              
)

achievement(
    title = "Ultimate Boundary Break", type = "",
    description = "Perform Supernova with Xene, Bellatrix and Wittz.",
    id = 623402, badge = "708336", points = 5,
    trigger = checkGameState(0x03) &&
              getMatchPhase() == prev(getMatchPhase()) &&
              check3CharactersPerformingSpecialMove("Supernova", "Xene", "Bellatrix", "Wittz") &&
              ((getTeamStatSpecialShots("Team 1") > prev(getTeamStatSpecialShots("Team 1")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x00 ||
                         getTeamSlotOfPlayer("Player 2") == 0x00 ||
                         getTeamSlotOfPlayer("Player 3") == 0x00 ||
                         getTeamSlotOfPlayer("Player 4") == 0x00)) ||
               (getTeamStatSpecialShots("Team 2") > prev(getTeamStatSpecialShots("Team 2")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x01 ||
                         getTeamSlotOfPlayer("Player 2") == 0x01 ||
                         getTeamSlotOfPlayer("Player 3") == 0x01 ||
                         getTeamSlotOfPlayer("Player 4") == 0x01)))  
              
)

achievement(
    title = "First Penguin on the Moon", type = "",
    description = "Perform Space Penguin with Xene, Bellatrix and Wittz.",
    id = 623409, badge = "708344", points = 4,
    trigger = checkGameState(0x03) &&
              getMatchPhase() == prev(getMatchPhase()) &&
              check3CharactersPerformingSpecialMove("Space Penguin", "Xene", "Bellatrix", "Wittz") &&
              ((getTeamStatSpecialShots("Team 1") > prev(getTeamStatSpecialShots("Team 1")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x00 ||
                         getTeamSlotOfPlayer("Player 2") == 0x00 ||
                         getTeamSlotOfPlayer("Player 3") == 0x00 ||
                         getTeamSlotOfPlayer("Player 4") == 0x00)) ||
               (getTeamStatSpecialShots("Team 2") > prev(getTeamStatSpecialShots("Team 2")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x01 ||
                         getTeamSlotOfPlayer("Player 2") == 0x01 ||
                         getTeamSlotOfPlayer("Player 3") == 0x01 ||
                         getTeamSlotOfPlayer("Player 4") == 0x01)))  
              
)

achievement(
    title = "Temperature Gradient Blast", type = "",
    description = "Perform Cross Fire with Axel and Froste.",
    id = 623412, badge = "708348", points = 3,
    trigger = checkGameState(0x03) &&
              getMatchPhase() == prev(getMatchPhase()) &&
              check2CharactersPerformingSpecialMove("Cross Fire", "Axel", "Froste") &&
              ((getTeamStatSpecialShots("Team 1") > prev(getTeamStatSpecialShots("Team 1")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x00 ||
                         getTeamSlotOfPlayer("Player 2") == 0x00 ||
                         getTeamSlotOfPlayer("Player 3") == 0x00 ||
                         getTeamSlotOfPlayer("Player 4") == 0x00)) ||
               (getTeamStatSpecialShots("Team 2") > prev(getTeamStatSpecialShots("Team 2")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x01 ||
                         getTeamSlotOfPlayer("Player 2") == 0x01 ||
                         getTeamSlotOfPlayer("Player 3") == 0x01 ||
                         getTeamSlotOfPlayer("Player 4") == 0x01)))  
              
)

achievement(
    title = "United We Are Strong", type = "",
    description = "Perform The Earth with Mark, Axel and Froste.",
    id = 623413, badge = "708349", points = 5,
    trigger = checkGameState(0x03) &&
              getMatchPhase() == prev(getMatchPhase()) &&
              check3CharactersPerformingSpecialMove("The Earth", "Mark", "Axel", "Froste") &&
              ((getTeamStatSpecialShots("Team 1") > prev(getTeamStatSpecialShots("Team 1")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x00 ||
                         getTeamSlotOfPlayer("Player 2") == 0x00 ||
                         getTeamSlotOfPlayer("Player 3") == 0x00 ||
                         getTeamSlotOfPlayer("Player 4") == 0x00)) ||
               (getTeamStatSpecialShots("Team 2") > prev(getTeamStatSpecialShots("Team 2")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x01 ||
                         getTeamSlotOfPlayer("Player 2") == 0x01 ||
                         getTeamSlotOfPlayer("Player 3") == 0x01 ||
                         getTeamSlotOfPlayer("Player 4") == 0x01)))  
              
)

achievement(
    title = "Drop Kick From the Sky", type = "",
    description = "Perform Shooting Star with Timmy and Sam.",
    id = 623531, badge = "708563", points = 2,
    trigger = checkGameState(0x03) &&
              getMatchPhase() == prev(getMatchPhase()) &&
              check2CharactersPerformingSpecialMove("Shooting Star", "Timmy", "Sam") &&
              ((getTeamStatSpecialShots("Team 1") > prev(getTeamStatSpecialShots("Team 1")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x00 ||
                         getTeamSlotOfPlayer("Player 2") == 0x00 ||
                         getTeamSlotOfPlayer("Player 3") == 0x00 ||
                         getTeamSlotOfPlayer("Player 4") == 0x00)) ||
               (getTeamStatSpecialShots("Team 2") > prev(getTeamStatSpecialShots("Team 2")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x01 ||
                         getTeamSlotOfPlayer("Player 2") == 0x01 ||
                         getTeamSlotOfPlayer("Player 3") == 0x01 ||
                         getTeamSlotOfPlayer("Player 4") == 0x01)))  
              
)

achievement(
    title = "Coordination Is the Key", type = "",
    description = "Perform Dual Smash with Jim and Feldt.",
    id = 623534, badge = "708564", points = 2,
    trigger = checkGameState(0x03) &&
              getMatchPhase() == prev(getMatchPhase()) &&
              check2CharactersPerformingSpecialMove("Dual Smash", "Jim", "Feldt") &&
              ((getTeamStatSpecialShots("Team 1") > prev(getTeamStatSpecialShots("Team 1")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x00 ||
                         getTeamSlotOfPlayer("Player 2") == 0x00 ||
                         getTeamSlotOfPlayer("Player 3") == 0x00 ||
                         getTeamSlotOfPlayer("Player 4") == 0x00)) ||
               (getTeamStatSpecialShots("Team 2") > prev(getTeamStatSpecialShots("Team 2")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x01 ||
                         getTeamSlotOfPlayer("Player 2") == 0x01 ||
                         getTeamSlotOfPlayer("Player 3") == 0x01 ||
                         getTeamSlotOfPlayer("Player 4") == 0x01)))  
              
)

achievement(
    title = "Eye of the Hurricane", type = "",
    description = "Perform Revolution V with Steve and Max.",
    id = 623537, badge = "708568", points = 2,
    trigger = checkGameState(0x03) &&
              getMatchPhase() == prev(getMatchPhase()) &&
              check2CharactersPerformingSpecialMove("Revolution V", "Steve", "Max") &&
              ((getTeamStatSpecialShots("Team 1") > prev(getTeamStatSpecialShots("Team 1")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x00 ||
                         getTeamSlotOfPlayer("Player 2") == 0x00 ||
                         getTeamSlotOfPlayer("Player 3") == 0x00 ||
                         getTeamSlotOfPlayer("Player 4") == 0x00)) ||
               (getTeamStatSpecialShots("Team 2") > prev(getTeamStatSpecialShots("Team 2")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x01 ||
                         getTeamSlotOfPlayer("Player 2") == 0x01 ||
                         getTeamSlotOfPlayer("Player 3") == 0x01 ||
                         getTeamSlotOfPlayer("Player 4") == 0x01)))  
              
)

achievement(
    title = "Born In Darkness", type = "",
    description = "Perform Dark Phoenix with Nathan, Max and Kevin.",
    id = 623535, badge = "708566", points = 5,
    trigger = checkGameState(0x03) &&
              getMatchPhase() == prev(getMatchPhase()) &&
              check3CharactersPerformingSpecialMove("Dark Phoenix", "Nathan", "Max", "Kevin") &&
              ((getTeamStatSpecialShots("Team 1") > prev(getTeamStatSpecialShots("Team 1")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x00 ||
                         getTeamSlotOfPlayer("Player 2") == 0x00 ||
                         getTeamSlotOfPlayer("Player 3") == 0x00 ||
                         getTeamSlotOfPlayer("Player 4") == 0x00)) ||
               (getTeamStatSpecialShots("Team 2") > prev(getTeamStatSpecialShots("Team 2")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x01 ||
                         getTeamSlotOfPlayer("Player 2") == 0x01 ||
                         getTeamSlotOfPlayer("Player 3") == 0x01 ||
                         getTeamSlotOfPlayer("Player 4") == 0x01)))  
              
)

achievement(
    title = "Triple Kick Off", type = "",
    description = "Perform Triple Boost with Nathan, Tod and Sam.",
    id = 623602, badge = "708633", points = 4,
    trigger = checkGameState(0x03) &&
              getMatchPhase() == prev(getMatchPhase()) &&
              check3CharactersPerformingSpecialMove("Triple Boost", "Nathan", "Tod", "Sam") &&
              ((getTeamStatSpecialShots("Team 1") > prev(getTeamStatSpecialShots("Team 1")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x00 ||
                         getTeamSlotOfPlayer("Player 2") == 0x00 ||
                         getTeamSlotOfPlayer("Player 3") == 0x00 ||
                         getTeamSlotOfPlayer("Player 4") == 0x00)) ||
               (getTeamStatSpecialShots("Team 2") > prev(getTeamStatSpecialShots("Team 2")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x01 ||
                         getTeamSlotOfPlayer("Player 2") == 0x01 ||
                         getTeamSlotOfPlayer("Player 3") == 0x01 ||
                         getTeamSlotOfPlayer("Player 4") == 0x01)))  
              
)

achievement(
    title = "Perfect Balance of Three", type = "",
    description = "Perform Triangle Z with Quagmire, Zell and Wittz.",
    id = 623410, badge = "708345", points = 4,
    trigger = checkGameState(0x03) &&
              getMatchPhase() == prev(getMatchPhase()) &&
              check3CharactersPerformingSpecialMove("Triangle Z", "Quagmire", "Zell", "Wittz") &&
              ((getTeamStatSpecialShots("Team 1") > prev(getTeamStatSpecialShots("Team 1")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x00 ||
                         getTeamSlotOfPlayer("Player 2") == 0x00 ||
                         getTeamSlotOfPlayer("Player 3") == 0x00 ||
                         getTeamSlotOfPlayer("Player 4") == 0x00)) ||
               (getTeamStatSpecialShots("Team 2") > prev(getTeamStatSpecialShots("Team 2")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x01 ||
                         getTeamSlotOfPlayer("Player 2") == 0x01 ||
                         getTeamSlotOfPlayer("Player 3") == 0x01 ||
                         getTeamSlotOfPlayer("Player 4") == 0x01)))  
              
)

achievement(
    title = "King of the Castle", type = "",
    description = "Perform Infinite Wall with King, Bargie and Hillvalley.",
    id = 623755, badge = "708718", points = 4,
    trigger = checkGameState(0x03) &&
              getMatchPhase() == prev(getMatchPhase()) &&
              check3CharactersPerformingSpecialMove("Infinite Wall", "King", "Bargie", "Hillvalley") &&
              ((getTeamStatSpecialShots("Team 1") > prev(getTeamStatSpecialShots("Team 1")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x00 ||
                         getTeamSlotOfPlayer("Player 2") == 0x00 ||
                         getTeamSlotOfPlayer("Player 3") == 0x00 ||
                         getTeamSlotOfPlayer("Player 4") == 0x00)) ||
               (getTeamStatSpecialShots("Team 2") > prev(getTeamStatSpecialShots("Team 2")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x01 ||
                         getTeamSlotOfPlayer("Player 2") == 0x01 ||
                         getTeamSlotOfPlayer("Player 3") == 0x01 ||
                         getTeamSlotOfPlayer("Player 4") == 0x01)))  
              
)

achievement(
    title = "Howling Wind and Thunderstorms", type = "",
    description = "Perform Thunder Beast with Froste and Stoutberg.",
    id = 623758, badge = "708752", points = 3,
    trigger = checkGameState(0x03) &&
              getMatchPhase() == prev(getMatchPhase()) &&
              check2CharactersPerformingSpecialMove("Thunder Beast", "Froste", "Stoutberg") &&
              ((getTeamStatSpecialShots("Team 1") > prev(getTeamStatSpecialShots("Team 1")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x00 ||
                         getTeamSlotOfPlayer("Player 2") == 0x00 ||
                         getTeamSlotOfPlayer("Player 3") == 0x00 ||
                         getTeamSlotOfPlayer("Player 4") == 0x00)) ||
               (getTeamStatSpecialShots("Team 2") > prev(getTeamStatSpecialShots("Team 2")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x01 ||
                         getTeamSlotOfPlayer("Player 2") == 0x01 ||
                         getTeamSlotOfPlayer("Player 3") == 0x01 ||
                         getTeamSlotOfPlayer("Player 4") == 0x01)))  
              
)

achievement(
    title = "Acrobatic Air Screw", type = "",
    description = "Perform Whirlwind Drop with Nathan and Jack.",
    id = 623760, badge = "708753", points = 2,
    trigger = checkGameState(0x03) &&
              getMatchPhase() == prev(getMatchPhase()) &&
              check2CharactersPerformingSpecialMove("Whirlwind Drop", "Nathan", "Jack") &&
              ((getTeamStatSpecialShots("Team 1") > prev(getTeamStatSpecialShots("Team 1")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x00 ||
                         getTeamSlotOfPlayer("Player 2") == 0x00 ||
                         getTeamSlotOfPlayer("Player 3") == 0x00 ||
                         getTeamSlotOfPlayer("Player 4") == 0x00)) ||
               (getTeamStatSpecialShots("Team 2") > prev(getTeamStatSpecialShots("Team 2")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x01 ||
                         getTeamSlotOfPlayer("Player 2") == 0x01 ||
                         getTeamSlotOfPlayer("Player 3") == 0x01 ||
                         getTeamSlotOfPlayer("Player 4") == 0x01)))  
              
)

achievement(
    title = "Black Hole Into the Void", type = "",
    description = "Perform Field of Force with Jude and Stonewall.",
    id = 623762, badge = "708754", points = 2,
    trigger = checkGameState(0x03) &&
              getMatchPhase() == prev(getMatchPhase()) &&
              check2CharactersPerformingSpecialMove("Field of Force", "Jude", "Stonewall") &&
              ((getTeamStatSpecialShots("Team 1") > prev(getTeamStatSpecialShots("Team 1")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x00 ||
                         getTeamSlotOfPlayer("Player 2") == 0x00 ||
                         getTeamSlotOfPlayer("Player 3") == 0x00 ||
                         getTeamSlotOfPlayer("Player 4") == 0x00)) ||
               (getTeamStatSpecialShots("Team 2") > prev(getTeamStatSpecialShots("Team 2")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x01 ||
                         getTeamSlotOfPlayer("Player 2") == 0x01 ||
                         getTeamSlotOfPlayer("Player 3") == 0x01 ||
                         getTeamSlotOfPlayer("Player 4") == 0x01)))  
              
)

achievement(
    title = "He Who Banished the Beast", type = "",
    description = "Perform Tiger Storm with Axel and Hobbes.",
    id = 623763, badge = "708768", points = 2,
    trigger = checkGameState(0x03) &&
              getMatchPhase() == prev(getMatchPhase()) &&
              check2CharactersPerformingSpecialMove("Tiger Storm", "Axel", "Hobbes") &&
              ((getTeamStatSpecialShots("Team 1") > prev(getTeamStatSpecialShots("Team 1")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x00 ||
                         getTeamSlotOfPlayer("Player 2") == 0x00 ||
                         getTeamSlotOfPlayer("Player 3") == 0x00 ||
                         getTeamSlotOfPlayer("Player 4") == 0x00)) ||
               (getTeamStatSpecialShots("Team 2") > prev(getTeamStatSpecialShots("Team 2")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x01 ||
                         getTeamSlotOfPlayer("Player 2") == 0x01 ||
                         getTeamSlotOfPlayer("Player 3") == 0x01 ||
                         getTeamSlotOfPlayer("Player 4") == 0x01)))  
              
)

achievement(
    title = "Deity of Another Galaxy", type = "",
    description = "Perform Chaos Break with Aphrodite, Beacons and Whitingale.",
    id = 623765, badge = "708778", points = 5,
    trigger = checkGameState(0x03) &&
              getMatchPhase() == prev(getMatchPhase()) &&
              check3CharactersPerformingSpecialMove("Chaos Break", "Aphrodite", "Beacons", "Whitingale") &&
              ((getTeamStatSpecialShots("Team 1") > prev(getTeamStatSpecialShots("Team 1")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x00 ||
                         getTeamSlotOfPlayer("Player 2") == 0x00 ||
                         getTeamSlotOfPlayer("Player 3") == 0x00 ||
                         getTeamSlotOfPlayer("Player 4") == 0x00)) ||
               (getTeamStatSpecialShots("Team 2") > prev(getTeamStatSpecialShots("Team 2")) &&
                __ornext(getTeamSlotOfPlayer("Player 1") == 0x01 ||
                         getTeamSlotOfPlayer("Player 2") == 0x01 ||
                         getTeamSlotOfPlayer("Player 3") == 0x01 ||
                         getTeamSlotOfPlayer("Player 4") == 0x01)))  
              
)

//--------------------------------------------------
// Leaderboards

leaderboard(
    id = 166442, title = "Bus Pull!",
    description = "Furthest Distance with 1 Player.",
    start  = checkSubState(0x05, 0x00) &&
             getMinigameBusPullPlayerAmount() == 1 &&
             prev(getMinigameBusPullState()) == 0x06 &&
             getMinigameBusPullState() == 0x07,
    cancel = always_false(),
    submit = always_true(),
    value  = getMinigameBusPullDistance() * 100,
    format = "FIXED2",
    lower_is_better = false
)

leaderboard(
    id = 166443, title = "Bus Pull!",
    description = "Furthest Distance with 2 Players.",
    start  = checkSubState(0x05, 0x00) &&
             getMinigameBusPullPlayerAmount() == 2 &&
             prev(getMinigameBusPullState()) == 0x06 &&
             getMinigameBusPullState() == 0x07,
    cancel = always_false(),
    submit = always_true(),
    value  = getMinigameBusPullDistance() * 100,
    format = "FIXED2",
    lower_is_better = false
)

leaderboard(
    id = 166444, title = "Bus Pull!",
    description = "Furthest Distance with 3 Players.",
    start  = checkSubState(0x05, 0x00) &&
             getMinigameBusPullPlayerAmount() == 3 &&
             prev(getMinigameBusPullState()) == 0x06 &&
             getMinigameBusPullState() == 0x07,
    cancel = always_false(),
    submit = always_true(),
    value  = getMinigameBusPullDistance() * 100,
    format = "FIXED2",
    lower_is_better = false
)

leaderboard(
    id = 166445, title = "Bus Pull!",
    description = "Furthest Distance with 4 Players.",
    start  = checkSubState(0x05, 0x00) &&
             getMinigameBusPullPlayerAmount() == 4 &&
             prev(getMinigameBusPullState()) == 0x06 &&
             getMinigameBusPullState() == 0x07,
    cancel = always_false(),
    submit = always_true(),
    value  = getMinigameBusPullDistance() * 100,
    format = "FIXED2",
    lower_is_better = false
)

leaderboard(
    id = 166446, title = "Tyre Punch!",
    description = "Most Points with 1 Player.",
    start  = checkSubState(0x05, 0x01) &&
             getMinigameTyrePunchPlayerAmount() == 1 &&
             prev(getMinigameTyrePunchState()) == 0x06 &&
             getMinigameTyrePunchState() == 0x07,
    cancel = always_false(),
    submit = always_true(),
    value  = getMinigameTyrePunchPoints(0)
             + getMinigameTyrePunchPoints(1),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 166447, title = "Tyre Punch!",
    description = "Most Points with 2 Players.",
    start  = checkSubState(0x05, 0x01) &&
             getMinigameTyrePunchPlayerAmount() == 2 &&
             prev(getMinigameTyrePunchState()) == 0x06 &&
             getMinigameTyrePunchState() == 0x07,
    cancel = always_false(),
    submit = always_true(),
    value  = getMinigameTyrePunchPoints(0)
             + getMinigameTyrePunchPoints(1),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 166448, title = "Tyre Punch!",
    description = "Most Points with 3 Players.",
    start  = checkSubState(0x05, 0x01) &&
             getMinigameTyrePunchPlayerAmount() == 3 &&
             prev(getMinigameTyrePunchState()) == 0x06 &&
             getMinigameTyrePunchState() == 0x07,
    cancel = always_false(),
    submit = always_true(),
    value  = getMinigameTyrePunchPoints(0)
             + getMinigameTyrePunchPoints(1)
             + getMinigameTyrePunchPoints(2),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 166449, title = "Tyre Punch!",
    description = "Most Points with 4 Players.",
    start  = checkSubState(0x05, 0x01) &&
             getMinigameTyrePunchPlayerAmount() == 4 &&
             prev(getMinigameTyrePunchState()) == 0x06 &&
             getMinigameTyrePunchState() == 0x07,
    cancel = always_false(),
    submit = always_true(),
    value  = getMinigameTyrePunchPoints(0)
             + getMinigameTyrePunchPoints(1)
             + getMinigameTyrePunchPoints(2)
             + getMinigameTyrePunchPoints(3),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 166450, title = "Volley!",
    description = "Most Points with 1 Player.",
    start  = checkSubState(0x05, 0x02) &&
             getMinigameVolleyPlayerAmount() == 1 &&
             prev(getMinigameVolleyState()) == 0x07 &&
             getMinigameVolleyState() == 0x08,
    cancel = always_false(),
    submit = always_true(),
    value  = getMinigameVolleyPoints(0)
             + getMinigameVolleyPoints(1),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 166451, title = "Volley!",
    description = "Most Points with 2 Player.",
    start  = checkSubState(0x05, 0x02) &&
             getMinigameVolleyPlayerAmount() == 2 &&
             prev(getMinigameVolleyState()) == 0x07 &&
             getMinigameVolleyState() == 0x08,
    cancel = always_false(),
    submit = always_true(),
    value  = getMinigameVolleyPoints(0)
             + getMinigameVolleyPoints(1),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 166452, title = "Volley!",
    description = "Most Points with 3 Player.",
    start  = checkSubState(0x05, 0x02) &&
             getMinigameVolleyPlayerAmount() == 3 &&
             prev(getMinigameVolleyState()) == 0x07 &&
             getMinigameVolleyState() == 0x08,
    cancel = always_false(),
    submit = always_true(),
    value  = getMinigameVolleyPoints(0)
             + getMinigameVolleyPoints(1)
             + getMinigameVolleyPoints(2),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 166453, title = "Volley!",
    description = "Most Points with 4 Player.",
    start  = checkSubState(0x05, 0x02) &&
             getMinigameVolleyPlayerAmount() == 4 &&
             prev(getMinigameVolleyState()) == 0x07 &&
             getMinigameVolleyState() == 0x08,
    cancel = always_false(),
    submit = always_true(),
    value  = getMinigameVolleyPoints(0)
             + getMinigameVolleyPoints(1)
             + getMinigameVolleyPoints(2)
             + getMinigameVolleyPoints(3),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 166457, title = "Tyre Dash!",
    description = "Fastest Average Time with 1 Player.",
    start  = checkSubState(0x05, 0x03) &&
             getMinigameTyreDashPlayerAmount() == 1 &&
             prev(getMinigameTyreDashState()) == 0x08 &&
             getMinigameTyreDashState() == 0x09,
    cancel = always_false(),
    submit = always_true(),
    value  = (getMinigameTyreDashTime(0) * (1 / 19.2)
              + getMinigameTyreDashTime(1) * (1 / 19.2)) / 2,
    format = "MILLISECS",
    lower_is_better = true
)

leaderboard(
    id = 166458, title = "Tyre Dash!",
    description = "Fastest Average Time with 2 Players.",
    start  = checkSubState(0x05, 0x03) &&
             getMinigameTyreDashPlayerAmount() == 2 &&
             prev(getMinigameTyreDashState()) == 0x08 &&
             getMinigameTyreDashState() == 0x09,
    cancel = always_false(),
    submit = always_true(),
    value  = (getMinigameTyreDashTime(0) * (1 / 19.2)
              + getMinigameTyreDashTime(1) * (1 / 19.2)) / 2,
    format = "MILLISECS",
    lower_is_better = true
)

leaderboard(
    id = 166459, title = "Tyre Dash!",
    description = "Fastest Average Time with 3 Players.",
    start  = checkSubState(0x05, 0x03) &&
             getMinigameTyreDashPlayerAmount() == 3 &&
             prev(getMinigameTyreDashState()) == 0x08 &&
             getMinigameTyreDashState() == 0x09,
    cancel = always_false(),
    submit = always_true(),
    value  = (getMinigameTyreDashTime(0) * (1 / 19.2)
              + getMinigameTyreDashTime(1) * (1 / 19.2)
              + getMinigameTyreDashTime(2) * (1 / 19.2)) / 3,
    format = "MILLISECS",
    lower_is_better = true
)

leaderboard(
    id = 166460, title = "Tyre Dash!",
    description = "Fastest Average Time with 4 Players.",
    start  = checkSubState(0x05, 0x03) &&
             getMinigameTyreDashPlayerAmount() == 4 &&
             prev(getMinigameTyreDashState()) == 0x08 &&
             getMinigameTyreDashState() == 0x09,
    cancel = always_false(),
    submit = always_true(),
    value  = (getMinigameTyreDashTime(0) * (1 / 19.2)
              + getMinigameTyreDashTime(1) * (1 / 19.2)
              + getMinigameTyreDashTime(2) * (1 / 19.2)
              + getMinigameTyreDashTime(3) * (1 / 19.2)) / 4,
    format = "MILLISECS",
    lower_is_better = true
)

leaderboard(
    id = 166461, title = "Bungee Shot!",
    description = "Most Goals with 1 Player.",
    start  = checkSubState(0x05, 0x04) &&
             getMinigameBungeeShotPlayerAmount() == 1 &&
             prev(getMinigameBungeeShotState()) == 0x06 &&
             getMinigameBungeeShotState() == 0x07,
    cancel = always_false(),
    submit = always_true(),
    value  = getMinigameBungeeShotGoals(0)
             + getMinigameBungeeShotGoals(1),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 166462, title = "Bungee Shot!",
    description = "Most Goals with 2 Players.",
    start  = checkSubState(0x05, 0x04) &&
             getMinigameBungeeShotPlayerAmount() == 2 &&
             prev(getMinigameBungeeShotState()) == 0x06 &&
             getMinigameBungeeShotState() == 0x07,
    cancel = always_false(),
    submit = always_true(),
    value  = getMinigameBungeeShotGoals(0)
             + getMinigameBungeeShotGoals(1),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 166463, title = "Bungee Shot!",
    description = "Most Goals with 3 Players.",
    start  = checkSubState(0x05, 0x04) &&
             getMinigameBungeeShotPlayerAmount() == 3 &&
             prev(getMinigameBungeeShotState()) == 0x06 &&
             getMinigameBungeeShotState() == 0x07,
    cancel = always_false(),
    submit = always_true(),
    value  = getMinigameBungeeShotGoals(0)
             + getMinigameBungeeShotGoals(1)
             + getMinigameBungeeShotGoals(2),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 166464, title = "Bungee Shot!",
    description = "Most Goals with 4 Players.",
    start  = checkSubState(0x05, 0x04) &&
             getMinigameBungeeShotPlayerAmount() == 4 &&
             prev(getMinigameBungeeShotState()) == 0x06 &&
             getMinigameBungeeShotState() == 0x07,
    cancel = always_false(),
    submit = always_true(),
    value  = getMinigameBungeeShotGoals(0)
             + getMinigameBungeeShotGoals(1)
             + getMinigameBungeeShotGoals(2)
             + getMinigameBungeeShotGoals(3),
    format = "VALUE",
    lower_is_better = false
)

//--------------------------------------------------
// Rich Presence

rich_presence_conditional_display(checkGameState(0x00), 
    "In the Titlescreen"
)

rich_presence_conditional_display(checkSubState(0x02, 0x00) ||
                                  checkSubState(0x02, 0x01) ||
                                  checkSubState(0x02, 0x09) ||
                                  checkSubState(0x02, 0x1D),
    "The Team is preparing itself for a Match [{0}]",
        rich_presence_lookup("MatchTypeID", 
                             getMatchType(),
                             matchTypeIDs, 
                             fallback = matchTypeIDs[1])
)

rich_presence_conditional_display(checkGameState(0x03) &&
                                  once(getMatchPhase() == 0x00) &&
                                  never(!checkGameState(0x03)), 
    "{0} is playing against {2} [{1}-{3}] in the {4} [{5}|{6}{7}] [{8}]",
        rich_presence_lookup("TeamID", 
                             getTeamID("Team 1"),
                             teamIDs, 
                             fallback = teamIDs[0]),
        rich_presence_macro("Number",
                            max_of(measured(getTeamGoals("Team 1"),
                                            when = getMatchPhase() % 2 == 0),
                                   measured(getTeamGoals("Team 2"),
                                            when = getMatchPhase() % 2 == 1))),
        rich_presence_lookup("TeamID", 
                             getTeamID("Team 2"),
                             teamIDs, 
                             fallback = teamIDs[0]),
        rich_presence_macro("Number",
                            max_of(measured(getTeamGoals("Team 2"),
                                            when = getMatchPhase() % 2 == 0),
                                   measured(getTeamGoals("Team 1"),
                                            when = getMatchPhase() % 2 == 1))),
        rich_presence_lookup("StadiumID", 
                             getStadiumID(),
                             stadiumIDs, 
                             fallback = stadiumIDs[1]),
        rich_presence_lookup("MatchPhaseID", 
                             getMatchPhase(),
                             matchPhaseIDs, 
                             fallback = matchPhaseIDs[3]),
        rich_presence_lookup("FillerZero", 
                             getPhaseTime() / (1920 * 60 * 10),
                             fillerZero),                    
        rich_presence_macro("Seconds",
                            getPhaseTime() / 1920),
        rich_presence_lookup("MatchTypeID", 
                             getMatchType(),
                             matchTypeIDs, 
                             fallback = matchTypeIDs[1])
)

rich_presence_conditional_display(checkSubState(0x02, 0x03) || 
                                  checkGameState(0x03), 
    "{0} is playing against {1} [0-0] in the {2} [1H|00:00] [{3}]",
        rich_presence_lookup("TeamID", 
                             getTeamID("Team 1"),
                             teamIDs, 
                             fallback = teamIDs[0]),
        rich_presence_lookup("TeamID", 
                             getTeamID("Team 2"),
                             teamIDs, 
                             fallback = teamIDs[0]),
        rich_presence_lookup("StadiumID", 
                             getStadiumID(),
                             stadiumIDs, 
                             fallback = stadiumIDs[1]),
        rich_presence_lookup("MatchTypeID", 
                             getMatchType(),
                             matchTypeIDs, 
                             fallback = matchTypeIDs[1])
)

rich_presence_conditional_display(checkSubState(0x02, 0x07), 
    "In the Main Menu"
)

rich_presence_conditional_display(checkSubState(0x02, 0x08) ||
                                  checkSubState(0x02, 0x19), 
    "In the Credits"
)

rich_presence_conditional_display(checkSubState(0x02, 0x0C), 
    "The Team is checking their Training Records [Minigames]"
)

rich_presence_conditional_display(checkSubState(0x02, 0x0D) ||
                                  checkSubState(0x02, 0x0E) ||
                                  checkSubState(0x02, 0x0F),
    "The Team is preparing a Training Session [Minigames]"
)

rich_presence_conditional_display(checkSubState(0x02, 0x10), 
    "In the Settings"
)

rich_presence_conditional_display(checkSubState(0x02, 0x11), 
    "{0} is teaching the Basics of Soccer", 
        getFullNameByCharID(0xC9)
)

rich_presence_conditional_display(checkSubState(0x02, 0x12) ||
                                  checkSubState(0x02, 0x13) ||
                                  checkSubState(0x02, 0x14),
    "The Teams are preparing for a Tournament Match [{0}]",
        matchTypeIDs[2]
)

rich_presence_conditional_display(checkSubState(0x02, 0x15) ||
                                  checkSubState(0x02, 0x16),
    "The Teams are checking the Tournament Match-Ups [{0}]",
        matchTypeIDs[2]
)

rich_presence_conditional_display(checkSubState(0x02, 0x17), 
    "In the File Select"
)

rich_presence_conditional_display(checkSubState(0x02, 0x18), 
    "The Team is celebrating the Victory of the {0}",
        rich_presence_lookup("CompetitionID", 
                             getCompetitionID(),
                             competitionIDs, 
                             fallback = competitionIDs[3])    
)

rich_presence_conditional_display(checkSubState(0x02, 0x1B) || 
                                  checkGameState(0x04), 
    "The Team is waiting in the Club Room for the next Match [⚡{0}] [🫂{1}/198] [🧑🏻‍💼{2}/4] [👧🏻{3}/5]",
        rich_presence_macro("Number",
                            getInazumaPoints()),
        rich_presence_macro("Number",
                            countPlayersScouted()),
        rich_presence_macro("Number",
                            countCoachesUnlocked()),
        rich_presence_macro("Number",
                            max_of(measured(countManagersForAureliaWithoutCammy(),
                                            when = bit1(mem_SupporterFlags + 0x07) == 0x00),
                                   measured(countManagersForAureliaWithCammy(),
                                            when = bit1(mem_SupporterFlags + 0x07) == 0x01)))
)

rich_presence_conditional_display(checkGameState(0x05) && 
                                  getMinigamePlayerAmount() == 1, 
    "{0} is doing the Training Exercise '{1}' [Minigames]",
        rich_presence_lookup("CharacterID", 
                             max_of(measured(getMinigameSlotCharID("Player 1"), 
                                             when = getMinigameSlotState("Player 1") <= 0x01),
                                    measured(getMinigameSlotCharID("Player 2"), 
                                             when = getMinigameSlotState("Player 2") <= 0x01),
                                    measured(getMinigameSlotCharID("Player 3"), 
                                             when = getMinigameSlotState("Player 3") <= 0x01),
                                    measured(getMinigameSlotCharID("Player 4"), 
                                             when = getMinigameSlotState("Player 4") <= 0x01)),
                             characterNicknames, 
                             fallback = characterNicknames[1]),
        rich_presence_lookup("MinigameID", 
                             getSubState(),
                             minigameIDs, 
                             fallback = minigameIDs[0])
)

rich_presence_conditional_display(checkGameState(0x05) && 
                                  getMinigamePlayerAmount() == 2, 
    "{0} and {1} are doing the Training Exercise '{2}' [Minigames]",
        rich_presence_lookup("CharacterID", 
                             max_of(measured(getMinigameSlotCharID("Player 1"), 
                                             when = getMinigameSlotState("Player 1") <= 0x01),
                                    measured(getMinigameSlotCharID("Player 2"), 
                                             when = getMinigameSlotState("Player 1") > 0x01 &&
                                                    getMinigameSlotState("Player 2") <= 0x01),
                                    measured(getMinigameSlotCharID("Player 3"), 
                                             when = getMinigameSlotState("Player 1") > 0x01 &&
                                                    getMinigameSlotState("Player 2") > 0x01 &&
                                                    getMinigameSlotState("Player 3") <= 0x01)),
                             characterNicknames, 
                             fallback = characterNicknames[1]),
        rich_presence_lookup("CharacterID", 
                             max_of(measured(getMinigameSlotCharID("Player 2"), 
                                             when = getMinigameSlotState("Player 1") <= 0x01 &&
                                                    getMinigameSlotState("Player 2") <= 0x01),
                                    measured(getMinigameSlotCharID("Player 3"), 
                                             when = getMinigameSlotState("Player 1") <= 0x01 &&
                                                    getMinigameSlotState("Player 3") <= 0x01),
                                    measured(getMinigameSlotCharID("Player 3"), 
                                             when = getMinigameSlotState("Player 2") <= 0x01 &&
                                                    getMinigameSlotState("Player 3") <= 0x01),
                                    measured(getMinigameSlotCharID("Player 4"), 
                                             when = getMinigameSlotState("Player 4") <= 0x01)),
                             characterNicknames, 
                             fallback = characterNicknames[1]),
        rich_presence_lookup("MinigameID", 
                             getSubState(),
                             minigameIDs, 
                             fallback = minigameIDs[0])
)

rich_presence_conditional_display(checkGameState(0x05) && 
                                  getMinigamePlayerAmount() == 3, 
    "{0}, {1} and {2} are doing the Training Exercise '{3}' [Minigames]",
        rich_presence_lookup("CharacterID", 
                             max_of(measured(getMinigameSlotCharID("Player 1"), 
                                             when = getMinigameSlotState("Player 1") <= 0x01),
                                    measured(getMinigameSlotCharID("Player 2"), 
                                             when = getMinigameSlotState("Player 1") > 0x01 &&
                                                    getMinigameSlotState("Player 2") <= 0x01)),
                             characterNicknames, 
                             fallback = characterNicknames[1]),
        rich_presence_lookup("CharacterID", 
                             max_of(measured(getMinigameSlotCharID("Player 2"), 
                                             when = getMinigameSlotState("Player 1") <= 0x01 &&
                                                    getMinigameSlotState("Player 2") <= 0x01),
                                    measured(getMinigameSlotCharID("Player 3"), 
                                             when = getMinigameSlotState("Player 1") <= 0x01 &&
                                                    getMinigameSlotState("Player 3") <= 0x01),
                                    measured(getMinigameSlotCharID("Player 3"), 
                                             when = getMinigameSlotState("Player 2") <= 0x01 &&
                                                    getMinigameSlotState("Player 3") <= 0x01)),
                             characterNicknames, 
                             fallback = characterNicknames[1]),
        rich_presence_lookup("CharacterID", 
                             max_of(measured(getMinigameSlotCharID("Player 3"), 
                                             when = getMinigameSlotState("Player 1") <= 0x01 &&
                                                    getMinigameSlotState("Player 2") <= 0x01 &&
                                                    getMinigameSlotState("Player 3") <= 0x01),
                                    measured(getMinigameSlotCharID("Player 4"), 
                                             when = getMinigameSlotState("Player 1") <= 0x01 &&
                                                    getMinigameSlotState("Player 2") <= 0x01 &&
                                                    getMinigameSlotState("Player 4") <= 0x01),
                                    measured(getMinigameSlotCharID("Player 4"), 
                                             when = getMinigameSlotState("Player 1") <= 0x01 &&
                                                    getMinigameSlotState("Player 3") <= 0x01 &&
                                                    getMinigameSlotState("Player 4") <= 0x01),
                                    measured(getMinigameSlotCharID("Player 4"), 
                                             when = getMinigameSlotState("Player 2") <= 0x01 &&
                                                    getMinigameSlotState("Player 3") <= 0x01 &&
                                                    getMinigameSlotState("Player 4") <= 0x01)),
                             characterNicknames, 
                             fallback = characterNicknames[1]),
        rich_presence_lookup("MinigameID", 
                             getSubState(),
                             minigameIDs, 
                             fallback = minigameIDs[0])
)

rich_presence_conditional_display(checkGameState(0x05) && 
                                  getMinigamePlayerAmount() == 4, 
    "{0}, {1}, {2} and {3} are doing the Training Exercise '{4}' [Minigames]",
        rich_presence_lookup("CharacterID", 
                             getMinigameSlotCharID("Player 1"),
                             characterNicknames, 
                             fallback = characterNicknames[1]),
        rich_presence_lookup("CharacterID", 
                             getMinigameSlotCharID("Player 2"),
                             characterNicknames, 
                             fallback = characterNicknames[1]),
        rich_presence_lookup("CharacterID", 
                             getMinigameSlotCharID("Player 3"),
                             characterNicknames, 
                             fallback = characterNicknames[1]),
        rich_presence_lookup("CharacterID", 
                             getMinigameSlotCharID("Player 4"),
                             characterNicknames, 
                             fallback = characterNicknames[1]),
        rich_presence_lookup("MinigameID", 
                             getSubState(),
                             minigameIDs, 
                             fallback = minigameIDs[0])
)


rich_presence_display(
    "The Team is waiting in the Club Room for the next Match [⚡{0}] [🫂{1}/198] [🧑🏻‍💼{2}/4] [👧🏻{3}/5]",
        rich_presence_macro("Number",
                            getInazumaPoints()),
        rich_presence_macro("Number",
                            countPlayersScouted()),
        rich_presence_macro("Number",
                            countCoachesUnlocked()),
        rich_presence_macro("Number",
                            max_of(measured(countManagersForAureliaWithoutCammy(),
                                            when = bit1(mem_SupporterFlags + 0x07) == 0x00),
                                   measured(countManagersForAureliaWithCammy(),
                                            when = bit1(mem_SupporterFlags + 0x07) == 0x01)))
)
