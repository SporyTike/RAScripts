// Case Closed: The Mirapolis Investigation
// #ID = 35406

//--------------------------------------------------
// Addresses

mem_extrasUnlockFlags    = 0x0033b092
mem_conanHintsLeft       = 0x0033b204
mem_storyProgress        = 0x0033b2a0
mem_clueChainLink        = 0x0033b3ea
mem_conanAnimationID     = 0x0033b48c
mem_gameState            = 0x003fb2e0
mem_currentMusicID       = 0x003facd6
mem_currentMapID         = 0x003fae68
mem_totalPlaytime        = 0x003fae6c
mem_actResultScreenState = 0x003faf70
mem_Mem1LinkedListStart  = 0x0080ecf8
mem_Mem2LinkedListStart  = 0x10000818

pointerMask = 0x3fffffff

//--------------------------------------------------
// Arrays and Dictionaries

mapIDs = {
    0x00: "in the Hotel Hall 1F",
    0x01: "in the Hotel Lobby 1F",
    0x02: "in the Courtyard",
    0x03: "in the Entrance Underground Passage",
    0x04: "in the Hotel Underground Entrance 1F",
    0x05: "in the Hotel Shop 3F",
    0x06: "in the Hotel Hall 3F",
    0x07: "in the Hotel Restaurant 4F",
    0x08: "in the Hotel Hall 4F",
    0x09: "in the Hotel Lounge 5F",
    0x0A: "in the Hotel Ceremony Hall 5F",
    0x0B: "in the Hotel Hallway 7F",
    0x0C: "in Room 701 on Hotel 7F",
    0x0D: "in Room 705 on Hotel 7F",
    0x0E: "in the Hotel Hallway 8F",
    0x0F: "in Room 803 on Hotel 8F",
    0x10: "in Room 804 on Hotel 8F",
    0x11: "in Room 805 on Hotel 8F",
    0x12: "in the Hotel Hallway 9F",
    0x13: "in Room 901 on Hotel 9F",
    0x14: "in Room 905 on Hotel 9F",
    0x15: "in the Hotel Hallway 10F",
    0x16: "in Room 1001 on Hotel 10F",
    0x17: "in Room 1003 on Hotel 10F",
    0x18: "in the Hotel Hallway 11F",
    0x19: "in Room 1101 on Hotel 11F",
    0x1A: "in Room 1102 on Hotel 11F",
    0x1B: "in Room 1104 on Hotel 11F",
    0x1C: "in the Hotel Hallway 12F",
    0x1D: "in the Royal Suite on Hotel 12F",
    0x1E: "in the Royal Suite on Hotel 12F",
    0x1F: "in the Annex Shop 1F",
    0x20: "in the Annex Passageway 1F",
    0x21: "in the Annex Underground Passage 1F",
    0x22: "in the Annex Boathouse 1F",
    0x23: "in the Annex Reception Area 2F",
    0x24: "in the Annex Reception Area 3F",
    0x25: "in the Annex Reception Area 4F",
    0x26: "in the Labyrinth of Ice 4F",
    0x27: "in the Annex Lounge 5F",
    0x28: "in the Labyrinth of Ice 5F",
    0x29: "in the Annex Lounge 6F",
    0x2A: "in the Annex Arcade 6F",
    0x2B: "in the Annex Central Control Room 7F",
    0x2C: "in the Gym Lounge 1F",
    0x2D: "in the Gym Hallway 2F",
    0x2E: "in the Gym Hallway 4F",
    0x2F: "at the Gym Pool 4F",
}

minigameIDs = {
    0x00: "'Futsal' in the Annex Area 2F",
    0x01: "'Gunsuits Aguni' in the Annex Arcade 6F",
    0x02: "'Masked Yaiba vs. The Phantom Army' in the Annex Arcade 6F",
    0x03: "'Curling' in the Annex Area 3F",
    0x04: "'Holey Moley Panic Room' in the Annex Arcade 6F",
    0x05: "'Labyrinth of Ice' in the Annex Area 5F",
}

gameModes = {
    0x00: "Story",
    0x01: "Extras",
}

actIDs = {
    0x00: "Act I",
    0x01: "Act I",
    0x02: "Act I",
    0x03: "Act I",
    0x04: "Act I",
    0x05: "Act I",
    0x06: "Act I",
    0x07: "Act I",
    0x08: "Act I",
    0x09: "Act II",
    0x0A: "Act II",
    0x0B: "Act II",
    0x0C: "Act II",
    0x0D: "Act II",
    0x0E: "Act II",
    0x0F: "Act II",
    0x10: "Act III",
    0x11: "Act III",
    0x12: "Act III",
    0x13: "Act III",
    0x14: "Act III",
    0x15: "Act III",
    0x16: "Act III",
    0x17: "Act III",
    0x18: "Act III",
    0x19: "Act IV",
}

partnerIDs = {
    0x00: "is",
    0x03: "and Rachel are",
    0x04: "and Richard are",
    0x05: "and Richard are",
    0x06: "and Anita are",
    0x07: "and Amy are",
    0x08: "and Amy are",
    0x09: "and George are",
    0x0A: "and Mitch are",
    0x0B: "and Harley are",
    0x0C: "and Katrina are",
}

//--------------------------------------------------
// Functions

function getGameState() {
    return dword_be(mem_gameState)
}

function checkGameMode(mode) {
    if (mode == "Story") {
      return getGameMode() == 0x00 
    } 
    if (mode == "Extras") {
      return getGameMode() != 0x00
    }
}

function getGameMode() {
    return byte(mem_gameState - 0x07)
}

function getMapID() {
    return word_be(mem_currentMapID)
}

function getStoryProgress() {
    return dword_be(mem_storyProgress)
}

function getPartnerID() {
    return word_be(mem_storyProgress - 0x0A)
}

function getMusicID() {
    return word_be(mem_currentMusicID)
}

function inMinigame() {
    return byte(mem_gameState - 0x06) != 0x00
}

function getMinigameID() {
    return dword_be(mem_gameState + 0x2C)
}

function getConanAnimationID() {
    return dword_be(mem_conanAnimationID)
}

function getPlaytime() {
    return dword_be(mem_totalPlaytime)
}

function getPoints() {
    return dword_be(mem_totalPlaytime + 0x04)
}

function getConanHints() {
    return byte(mem_conanHintsLeft)
}

function increasedClueChain() {
    return word_be(mem_clueChainLink) == prev(word_be(mem_clueChainLink) + 1)
}

function checkStageCompleted() {
    return dword_be(mem_actResultScreenState) == 9 &&
           prev(dword_be(mem_actResultScreenState)) < 9 &&
           dword_be((dword_be(mem_actResultScreenState + 0x0C) & pointerMask) - 0x10 + 0x04) == 0x14
}

function checkStageResultRank(category, rank) {
    if (rank == "S") {
        rank = 0
    }
    if (rank == "A") {
        rank = 1
    }
    if (rank == "B") {
        rank = 2
    }
    if (rank == "C") {
        rank = 3
    }
    if (rank == "D") {
        rank = 4
    }

    if (category == "Clue Chain") {
        return checkStageCompleted() && 
               byte((dword_be(mem_actResultScreenState + 0x0C) & pointerMask) + 0x01) == rank
    }
    if (category == "Imagination") {
        return checkStageCompleted() && 
               byte((dword_be(mem_actResultScreenState + 0x0C) & pointerMask) + 0x03) == rank
    }
    if (category == "Reasoning") {
        return checkStageCompleted() && 
               byte((dword_be(mem_actResultScreenState + 0x0C) & pointerMask) + 0x05) == rank
    }
    if (category == "Inspiration") {
        return checkStageCompleted() && 
               byte((dword_be(mem_actResultScreenState + 0x0C) & pointerMask) + 0x07) == rank
    }
    if (category == "Detective Rank") {
        return checkStageCompleted() && 
               byte((dword_be(mem_actResultScreenState + 0x0C) & pointerMask) + 0x09) == rank
    }
}

function checkStageResultDetectiveRankIsS() {
    return checkStageResultRank("Clue Chain", "S") &&
           checkStageResultRank("Imagination", "S") &&
           checkStageResultRank("Reasoning", "S") &&
           checkStageResultRank("Inspiration", "S") &&
           checkStageResultRank("Detective Rank", "S")
}

function getMinigameResultScore() {
    return word_be((dword_be(mem_gameState - 0x20) & pointerMask) + 0x0C)
}

function getMinigameResultState() {
    return dword_be(mem_gameState - 0x28)
}

function getFutsalMinigameState() {
    return dword_be((dword_be(mem_gameState - 0x154) & pointerMask) + 0x04) 
}

function getFutsalConanTeamGoals() {
    return dword_be((dword_be(mem_gameState - 0x16C) & pointerMask) + 0x08) 
}

function getFutsalOpponentTeamGoals() {
    return dword_be((dword_be(mem_gameState - 0x16C) & pointerMask) + 0x0C) 
}

function getFutsalTimeLeft() {
    return dword_be((dword_be(mem_gameState - 0x16C) & pointerMask) + 0x00) 
}

function getFutsalCurrentHalf() {
    return dword_be((dword_be(mem_gameState - 0x16C) & pointerMask) + 0x01)
}

function getGunsuitsAguniMinigameState() {
    return dword_be(mem_gameState - 0x124)
}

function getGunsuitsAguniHealth() {
    return word_be((dword_be(mem_gameState - 0x20) & pointerMask) + 0x00)
}

function getGunsuitsAguniRobotsDestroyed() {
    return dword_be((dword_be(mem_gameState - 0x20) & pointerMask) + 0x10)
}

function getMaskedYaibaMinigameState() {
    return dword_be(mem_gameState - 0x74)
}

function getMaskedYaibaMaskedYaibaHealth() {
    return word_be((dword_be(mem_gameState - 0x64) & pointerMask) + 0x18) 
}

function checkMaskedYaibaOpponent(name) {
    address = byte((dword_be(mem_gameState - 0x60) & pointerMask) + 0x03) 
    
    if (name == "Mushroomhead Alien") {
        return address == 0
    }
    if (name == "Purple Slasher Alien") {
        return address == 1
    }
}

function getMaskedYaibaPhantomArmyHealth() {
    return word_be((dword_be(mem_gameState - 0x60) & pointerMask) + 0x0C) 
}

function getCurlingMinigameState() {
    return dword_be((dword_be(mem_gameState - 0x198) & pointerMask) + 0x04) 
}

function getCurlingConanTeamPoints() {
    return dword_be((dword_be(mem_gameState - 0x180) & pointerMask) + 0x00) 
}

function getHoleyMoleyScore() {
    return dword_be((dword_be(mem_gameState - 0x3C) & pointerMask) + 0x68) 
}

function getHoleyMoleyTimeLeft() {
    return dword_be((dword_be(mem_gameState - 0x3C) & pointerMask) + 0x6C)
}

function getHoleyMoleyFinishTimer() {
    return dword_be((dword_be(mem_gameState - 0x3C) & pointerMask) + 0x78)
}

function getLabyrinthOfIceMinigameState() {
    return dword_be(mem_gameState - 0xF8)
}

function getLabyrinthOfIceTotalTime() {
    return dword_be(mem_gameState - 0x8C)
}

function calculateImageUnlocks() {
    return bit0(mem_extrasUnlockFlags + 0x01)
         + bit1(mem_extrasUnlockFlags + 0x01)
         + bit2(mem_extrasUnlockFlags + 0x01)
         + bit3(mem_extrasUnlockFlags + 0x01)
         + bit4(mem_extrasUnlockFlags + 0x01)
         + bit5(mem_extrasUnlockFlags + 0x01)
         + bit6(mem_extrasUnlockFlags + 0x01)
         + bit7(mem_extrasUnlockFlags + 0x01)
         + bit0(mem_extrasUnlockFlags + 0x00)
         + bit1(mem_extrasUnlockFlags + 0x00)
         + bit2(mem_extrasUnlockFlags + 0x00)
         + bit3(mem_extrasUnlockFlags + 0x00)
         + bit4(mem_extrasUnlockFlags + 0x00)
         + bit5(mem_extrasUnlockFlags + 0x00)
         + bit6(mem_extrasUnlockFlags + 0x00)
         + bit7(mem_extrasUnlockFlags + 0x00)
         + bit0(mem_extrasUnlockFlags + 0x03)
         + bit1(mem_extrasUnlockFlags + 0x03)
         + bit2(mem_extrasUnlockFlags + 0x03)
         + bit3(mem_extrasUnlockFlags + 0x03)
         + bit4(mem_extrasUnlockFlags + 0x03)
         + bit5(mem_extrasUnlockFlags + 0x03)
         + bit6(mem_extrasUnlockFlags + 0x03)
         + bit7(mem_extrasUnlockFlags + 0x03)
         + bit0(mem_extrasUnlockFlags + 0x02)
         + bit1(mem_extrasUnlockFlags + 0x02)
         + bit2(mem_extrasUnlockFlags + 0x02)
         + bit3(mem_extrasUnlockFlags + 0x02)
         + bit4(mem_extrasUnlockFlags + 0x02)
         + bit5(mem_extrasUnlockFlags + 0x02)
         + bit6(mem_extrasUnlockFlags + 0x02)
         + bit7(mem_extrasUnlockFlags + 0x02)
         + bit0(mem_extrasUnlockFlags + 0x05)
         + bit1(mem_extrasUnlockFlags + 0x05)
         + bit2(mem_extrasUnlockFlags + 0x05)
}

function calculateMusicUnlocks() {
    return bit3(mem_extrasUnlockFlags + 0x05)
         + bit4(mem_extrasUnlockFlags + 0x05)
         + bit5(mem_extrasUnlockFlags + 0x05)
         + bit6(mem_extrasUnlockFlags + 0x05)
         + bit7(mem_extrasUnlockFlags + 0x05)
         + bit0(mem_extrasUnlockFlags + 0x04)
         + bit1(mem_extrasUnlockFlags + 0x04)
         + bit2(mem_extrasUnlockFlags + 0x04)
         + bit3(mem_extrasUnlockFlags + 0x04)
         + bit4(mem_extrasUnlockFlags + 0x04)
         + bit5(mem_extrasUnlockFlags + 0x04)
         + bit6(mem_extrasUnlockFlags + 0x04)
         + bit7(mem_extrasUnlockFlags + 0x04)
         + bit0(mem_extrasUnlockFlags + 0x07)
         + bit1(mem_extrasUnlockFlags + 0x07)
         + bit2(mem_extrasUnlockFlags + 0x07)
         + bit3(mem_extrasUnlockFlags + 0x07)
         + bit4(mem_extrasUnlockFlags + 0x07)
         + bit5(mem_extrasUnlockFlags + 0x07)
         + bit6(mem_extrasUnlockFlags + 0x07)
         + bit7(mem_extrasUnlockFlags + 0x07)
         + bit0(mem_extrasUnlockFlags + 0x06)
         + bit1(mem_extrasUnlockFlags + 0x06)
         + bit2(mem_extrasUnlockFlags + 0x06)
         + bit3(mem_extrasUnlockFlags + 0x06)
         + bit4(mem_extrasUnlockFlags + 0x06)
}

//--------------------------------------------------
// Achievements

achievement(
    title = "Dedicated Deduction", type = "progression",
    description = "Complete the first clue chain of Act I.",
    id = 605105, badge = "687249", points = 5,
    trigger = getGameState() == 0x07 &&
              getStoryProgress() == 0x02 &&
              increasedClueChain() &&
              bit5(mem_clueChainLink + 0x2E)
              + bit6(mem_clueChainLink + 0x2E)
              + bit7(mem_clueChainLink + 0x2E) == 3
)

achievement(
    title = "Wellness For Good", type = "progression",
    description = "Complete the second clue chain of Act I.",
    id = 605106, badge = "687248", points = 5,
    trigger = getGameState() == 0x07 &&
              getStoryProgress() == 0x06 &&
              increasedClueChain() &&
              bit0(mem_clueChainLink + 0x35)
              + bit1(mem_clueChainLink + 0x35)
              + bit2(mem_clueChainLink + 0x35) == 3
)

achievement(
    title = "Death to the Curious", type = "progression",
    description = "Complete the third clue chain of Act I.",
    id = 605109, badge = "687247", points = 5,
    trigger = getGameState() == 0x07 &&
              getStoryProgress() == 0x07 &&
              increasedClueChain() &&
              bit3(mem_clueChainLink + 0x35)
              + bit4(mem_clueChainLink + 0x35)
              + bit5(mem_clueChainLink + 0x35) == 3
)

achievement(
    title = "Especially Good Performance", type = "missable",
    description = "Get a Detective Rank with the rating \"S\" in Act I.",
    id = 605308, badge = "687309", points = 10,
    trigger = getGameState() == 0x07 &&
              getStoryProgress() == 0x08 &&
              getMapID() == 0x16 &&
              checkStageResultDetectiveRankIsS()
)

achievement(
    title = "Nobody Left on the Right Path", type = "progression",
    description = "Complete the first clue chain of Act II.",
    id = 605319, badge = "687250", points = 5,
    trigger = getGameState() == 0x07 &&
              getStoryProgress() == 0x0A &&
              increasedClueChain() &&
              bit6(mem_clueChainLink + 0x35)
              + bit7(mem_clueChainLink + 0x35)
              + bit0(mem_clueChainLink + 0x34) == 3
)

achievement(
    title = "One Breath Too Much", type = "progression",
    description = "Complete the second clue chain of Act II.",
    id = 605370, badge = "687304", points = 5,
    trigger = getGameState() == 0x07 &&
              getStoryProgress() == 0x0E &&
              increasedClueChain() &&
              bit1(mem_clueChainLink + 0x34)
              + bit2(mem_clueChainLink + 0x34)
              + bit3(mem_clueChainLink + 0x34) == 3
)

achievement(
    title = "Essence of a Detective", type = "missable",
    description = "Get a Detective Rank with the rating \"S\" in Act II.",
    id = 605372, badge = "687307", points = 10,
    trigger = getGameState() == 0x07 &&
              getStoryProgress() == 0x0E &&
              getMapID() == 0x28 &&
              checkStageResultDetectiveRankIsS()
)

achievement(
    title = "Blackout and Blackmails", type = "progression",
    description = "Complete the first clue chain of Act III.",
    id = 605416, badge = "687433", points = 5,
    trigger = getGameState() == 0x07 &&
              getStoryProgress() == 0x13 &&
              increasedClueChain() &&
              bit4(mem_clueChainLink + 0x34)
              + bit5(mem_clueChainLink + 0x34)
              + bit6(mem_clueChainLink + 0x34) == 3
)

achievement(
    title = "But the Mermaid Never Came Back...", type = "progression",
    description = "Complete the second clue chain of Act III.",
    id = 605426, badge = "687440", points = 5,
    trigger = getGameState() == 0x07 &&
              getStoryProgress() == 0x15 &&
              increasedClueChain() &&
              bit7(mem_clueChainLink + 0x34)
              + bit0(mem_clueChainLink + 0x33)
              + bit1(mem_clueChainLink + 0x33) == 3
)

achievement(
    title = "Sleeping Beauty and the Ocean", type = "progression",
    description = "Complete the third clue chain of Act III.",
    id = 605429, badge = "687441", points = 5,
    trigger = getGameState() == 0x07 &&
              getStoryProgress() == 0x17 &&
              increasedClueChain() &&
              bit2(mem_clueChainLink + 0x33)
              + bit3(mem_clueChainLink + 0x33)
              + bit4(mem_clueChainLink + 0x33) == 3
)

achievement(
    title = "Establishing a Minimum", type = "missable",
    description = "Get a Detective Rank with the rating \"S\" in Act III.",
    id = 605430, badge = "687472", points = 10,
    trigger = getGameState() == 0x07 &&
              getStoryProgress() == 0x18 &&
              getMapID() == 0x16 &&
              checkStageResultDetectiveRankIsS()
)

achievement(
    title = "One Truth Prevails", type = "progression",
    description = "Complete the first clue chain of Act IV.",
    id = 605464, badge = "687468", points = 5,
    trigger = getGameState() == 0x07 &&
              getStoryProgress() == 0x1A &&
              increasedClueChain() &&
              bit5(mem_clueChainLink + 0x33)
              + bit6(mem_clueChainLink + 0x33)
              + bit7(mem_clueChainLink + 0x33) == 3
)

achievement(
    title = "Lost Hearts among Familiar Faces", type = "win_condition",
    description = "Solve the Mirapolis murder cases.",
    id = 605469, badge = "687473", points = 10,
    trigger = getGameState() == 0x07 &&
              getStoryProgress() == 0x1C &&
              getMapID() == 0x22 &&
              checkStageCompleted()
)

achievement(
    title = "Escape Without Flaws", type = "missable",
    description = "Get a Detective Rank with the rating \"S\" in Act IV.",
    id = 605470, badge = "687474", points = 10,
    trigger = getGameState() == 0x07 &&
              getStoryProgress() == 0x1C &&
              getMapID() == 0x22 &&
              checkStageResultDetectiveRankIsS()
)

achievement(
    title = "When the Logic Just Lines Up", type = "missable",
    description = "Solve the Mirapolis murder cases with a clue chain link of 87.",
    id = 605471, badge = "687475", points = 10,
    trigger = getGameState() == 0x07 &&
              getStoryProgress() == 0x1C &&
              getMapID() == 0x22 &&
              checkStageResultDetectiveRankIsS() &&
              word_be(mem_clueChainLink) == 87
)

achievement(
    title = "Who Did All These Pictures of Us?!", type = "",
    description = "Unlock all scenary images on the computer.",
    id = 605576, badge = "687787", points = 10,
    trigger = getGameState() == 0x07 &&
              prev(getGameState()) == 0x07 &&
              measured(calculateImageUnlocks() == 35, when = getGameState() == 0x07) &&
              prev(calculateImageUnlocks()) >= 1 &&
              prev(calculateImageUnlocks()) <= 34
)

achievement(
    title = "Sounds About Right", type = "",
    description = "Unlock all music tracks in the jukebox.",
    id = 605577, badge = "687788", points = 10,
    trigger = getGameState() == 0x07 &&
              prev(getGameState()) == 0x07 &&
              measured(calculateMusicUnlocks() == 26, when = getGameState() == 0x07) &&
              prev(calculateMusicUnlocks()) >= 1 &&
              prev(calculateMusicUnlocks()) <= 25
)

achievement(
    title = "Neat, But No Need", type = "",
    description = "Get a total of 5 Conan hints.",
    id = 605573, badge = "687760", points = 1,
    trigger = getGameState() == 0x07 &&
              checkGameMode("Story") &&
              getMapID() == 0x1F &&
              prev(getMapID()) == 0x1F &&
              getPoints() >= 1000 &&
              getConanHints() == 5 &&
              prev(getConanHints()) == 4
)

achievement(
    title = "If It Works, It Works", type = "",
    description = "Skateboard inside the Labyrinth of Ice.",
    id = 605579, badge = "687790", points = 1,
    trigger = repeated(180, getConanAnimationID() == 0x04 &&
                      never(getGameState() != 0x07) &&
                      never(getConanAnimationID() <= 0x02) &&
                      never(getMapID() != 0x26 &&
                            getMapID() != 0x28))
)

achievement(
    title = "Mirapolis Three", type = "",
    description = "Finish a round of \"Futsal\" while having a lead of 7 or more goals.",
    id = 605571, badge = "687759", points = 5,
    trigger = getGameState() == 0x07 &&
              getMapID() == 0x23 &&
              inMinigame() &&
              getMinigameID() == 0x00 &&
              once(getFutsalMinigameState() == 0x0C &&
                   prev(getFutsalMinigameState()) >= 0x0A &&
                   prev(getFutsalMinigameState()) <= 0x0B &&
                   getFutsalConanTeamGoals() > getFutsalOpponentTeamGoals() &&
                   getFutsalConanTeamGoals() - getFutsalOpponentTeamGoals() >= 7 &&
                   never(!inMinigame())) &&
              getMinigameResultState() == 0x04 &&
              prev(getMinigameResultState()) < 0x04
)

achievement(
    title = "A Future Without Androids", type = "",
    description = "Finish a round of \"Gunsuits Aguni\" with 30 or more robots destroyed and without letting the health drop below the waisteline.",
    id = 605515, badge = "687586", points = 5,
    trigger = getGameState() == 0x07 &&
              getMapID() == 0x2A &&
              inMinigame() &&
              getMinigameID() == 0x01 &&
              once(getGunsuitsAguniMinigameState() == 0x07 &&
                   prev(getGunsuitsAguniMinigameState()) >= 0x05 &&
                   prev(getGunsuitsAguniMinigameState()) <= 0x06 &&
                   getGunsuitsAguniHealth() >= 48 &&
                   getGunsuitsAguniHealth() <= 100 &&
                   getGunsuitsAguniRobotsDestroyed() >= 30 &&
                   never(!inMinigame())) &&
              getMinigameResultState() == 0x04 &&
              prev(getMinigameResultState()) < 0x04
)

achievement(
    title = "Mash' 'Shrooms", type = "",
    description = "Finish a round of \"Masked Yaiba vs. The Phantom Army!\" against the Mushroomhead Alien.",
    id = 605511, badge = "687582", points = 2,
    trigger = getGameState() == 0x07 &&
              getMapID() == 0x2A &&
              inMinigame() &&
              getMinigameID() == 0x02 &&
              once(getMaskedYaibaMinigameState() == 0x05 &&
                   prev(getMaskedYaibaMinigameState()) >= 0x03 &&
                   prev(getMaskedYaibaMinigameState()) <= 0x04 &&
                   checkMaskedYaibaOpponent("Mushroomhead Alien") &&
                   never(!inMinigame())) &&
              getMinigameResultState() == 0x04 &&
              prev(getMinigameResultState()) < 0x04
)

achievement(
    title = "Less Slash, More Bash", type = "",
    description = "Finish a round of \"Masked Yaiba vs. The Phantom Army!\" against the Purple Slasher Alien.",
    id = 605512, badge = "687583", points = 2,
    trigger = getGameState() == 0x07 &&
              getMapID() == 0x2A &&
              inMinigame() &&
              getMinigameID() == 0x02 &&
              once(getMaskedYaibaMinigameState() == 0x05 &&
                   prev(getMaskedYaibaMinigameState()) >= 0x03 &&
                   prev(getMaskedYaibaMinigameState()) <= 0x04 &&
                   checkMaskedYaibaOpponent("Purple Slasher Alien") &&
                   never(!inMinigame())) &&
              getMinigameResultState() == 0x04 &&
              prev(getMinigameResultState()) < 0x04
)

achievement(
    title = "Power Yaiba Super Ninja Steel", type = "",
    description = "Finish a round of \"Masked Yaiba vs. The Phantom Army!\" without getting hit.",
    id = 605513, badge = "687584", points = 5,
    trigger = getGameState() == 0x07 &&
              getMapID() == 0x2A &&
              inMinigame() &&
              getMinigameID() == 0x02 &&
              once(getMaskedYaibaMinigameState() == 0x05 &&
                   prev(getMaskedYaibaMinigameState()) >= 0x03 &&
                   prev(getMaskedYaibaMinigameState()) <= 0x04 &&
                   getMaskedYaibaMaskedYaibaHealth() == 100 &&
                   never(!inMinigame())) &&
              getMinigameResultState() == 0x04 &&
              prev(getMinigameResultState()) < 0x04
)

achievement(
    title = "Stone by Stone, Minute by Minute", type = "",
    description = "Finish a round of \"Curling\" with 6 points.",
    id = 605518, badge = "687588", points = 5,
    trigger = getGameState() == 0x07 &&
              getMapID() == 0x24 &&
              inMinigame() &&
              getMinigameID() == 0x03 &&
              once(getCurlingMinigameState() == 0x0C &&
                   prev(getCurlingMinigameState()) == 0x0B &&
                   getCurlingConanTeamPoints() == 6 &&
                   never(!inMinigame())) &&
              getMinigameResultState() == 0x04 &&
              prev(getMinigameResultState()) < 0x04
)

achievement(
    title = "Conan the Mole Barbarian", type = "",
    description = "Finish a round of \"Holey Moley Panic Room\" with 50 or more moles hit.",
    id = 605514, badge = "687585", points = 2,
    trigger = getGameState() == 0x07 &&
              getMapID() == 0x2A &&
              inMinigame() &&
              getMinigameID() == 0x04 &&
              getMinigameResultScore() == 9999 &&
              getMinigameResultState() == 0x04 &&
              prev(getMinigameResultState()) < 0x04
)

achievement(
    title = "Shining Through the Ice", type = "",
    description = "Finish a round of \"Labyrinth of Ice\" within 35 seconds or less.",
    id = 605517, badge = "687587", points = 5,
    trigger = getGameState() == 0x07 &&
              getMapID() == 0x25 &&
              inMinigame() &&
              getMinigameID() == 0x05 &&
              once(getLabyrinthOfIceMinigameState() == 0x06 &&
                   prev(getLabyrinthOfIceMinigameState()) == 0x05 &&
                   getLabyrinthOfIceTotalTime() <= 2100 &&
                   never(!inMinigame())) &&
              getMinigameResultState() == 0x04 &&
              prev(getMinigameResultState()) < 0x04
)

//--------------------------------------------------
// Leaderboards

leaderboard(
    id = 162204,
    title       = "The Mirapolis Investigation", 
    description = "Fastest time to beat the game.",
    start  = getGameState() == 0x07 &&
             getStoryProgress() == 0x1C &&
             getMapID() == 0x22 &&
             checkStageCompleted(),
    cancel = always_false(), 
    submit = always_true(), 
    value  = getPlaytime(),
    format = "Frames",
    lower_is_better = true
)

leaderboard(
    id = 162211,
    title       = "Futsal", 
    description = "Most Metropolis Points obtained in one game.",
    start  = getGameState() == 0x07 &&
             getMapID() == 0x2A &&
             inMinigame() &&
             getMinigameID() == 0x00 &&
             getMinigameResultState() == 0x04 &&
             prev(getMinigameResultState()) < 0x04,
    cancel = always_false(), 
    submit = always_true(), 
    value  = getMinigameResultScore(),
    format = "Value",
    lower_is_better = false
)

leaderboard(
    id = 162205,
    title       = "Gunsuits Aguni", 
    description = "Most Metropolis Points obtained in one game.",
    start  = getGameState() == 0x07 &&
             getMapID() == 0x2A &&
             inMinigame() &&
             getMinigameID() == 0x01 &&
             getMinigameResultState() == 0x04 &&
             prev(getMinigameResultState()) < 0x04,
    cancel = always_false(), 
    submit = always_true(), 
    value  = getMinigameResultScore(),
    format = "Value",
    lower_is_better = false
)

leaderboard(
    id = 162206,
    title       = "Masked Yaiba vs. The Phantom Army!", 
    description = "Most Metropolis Points obtained in one game.",
    start  = getGameState() == 0x07 &&
             getMapID() == 0x2A &&
             inMinigame() &&
             getMinigameID() == 0x02 &&
             getMinigameResultState() == 0x04 &&
             prev(getMinigameResultState()) < 0x04,
    cancel = always_false(), 
    submit = always_true(), 
    value  = getMinigameResultScore(),
    format = "Value",
    lower_is_better = false
)

leaderboard(
    id = 162210,
    title       = "Curling", 
    description = "Most Metropolis Points obtained in one game.",
    start  = getGameState() == 0x07 &&
             getMapID() == 0x24 &&
             inMinigame() &&
             getMinigameID() == 0x03 &&
             getMinigameResultState() == 0x04 &&
             prev(getMinigameResultState()) < 0x04,
    cancel = always_false(), 
    submit = always_true(), 
    value  = getMinigameResultScore(),
    format = "Value",
    lower_is_better = false
)

leaderboard(
    id = 162207,
    title       = "Holey Moley Panic Room", 
    description = "Most Metropolis Points obtained in one game.",
    start  = getGameState() == 0x07 &&
             getMapID() == 0x2A &&
             inMinigame() &&
             getMinigameID() == 0x04 &&
             getMinigameResultState() == 0x04 &&
             prev(getMinigameResultState()) < 0x04,
    cancel = always_false(), 
    submit = always_true(), 
    value  = getMinigameResultScore(),
    format = "Value",
    lower_is_better = false
)

leaderboard(
    id = 162209,
    title       = "Labyrinth of Ice", 
    description = "Most Metropolis Points obtained in one game.",
    start  = getGameState() == 0x07 &&
             getMapID() == 0x25 &&
             inMinigame() &&
             getMinigameID() == 0x05 &&
             getMinigameResultState() == 0x04 &&
             prev(getMinigameResultState()) < 0x04,
    cancel = always_false(), 
    submit = always_true(), 
    value  = getMinigameResultScore(),
    format = "Value",
    lower_is_better = false
)

//--------------------------------------------------
// Rich Presence

rich_presence_conditional_display(getGameState() <= 0x03,
    "In the Titlescreen"
)

rich_presence_conditional_display(getGameState() == 0x05,
    "In the File Select"
)

rich_presence_conditional_display(getGameState() == 0x06,
    "In the Options"
)

rich_presence_conditional_display(
    getGameState() == 0x07 && checkGameMode("Extras") && inMinigame() && getMinigameID() <= 0x05, 
    "Conan is playing {0} [Extras]",
    rich_presence_lookup("minigameIDs",
                         getMinigameID(),
                         minigameIDs,
                         fallback = minigameIDs[0])
)

rich_presence_conditional_display(
    getGameState() == 0x07 && checkGameMode("Extras"), 
    "Conan {0} {1} [Extras]",
    rich_presence_lookup("partnerID",
                         getPartnerID(),
                         partnerIDs,
                         fallback = partnerIDs[0]),
    rich_presence_lookup("mapID",
                         getMapID(),
                         mapIDs,
                         fallback = mapIDs[0])
)

rich_presence_conditional_display(
    getGameState() == 0x07 && inMinigame() && getMinigameID() <= 0x05, 
    "Conan is playing {0} [Story] [{1}] [🎟{2}]",
    rich_presence_lookup("minigameIDs",
                         getMinigameID(),
                         minigameIDs,
                         fallback = minigameIDs[0]),
    rich_presence_lookup("storyActID",
                         getStoryProgress(),
                         actIDs,
                         fallback = actIDs[0x19]),
    rich_presence_macro("Score",
                        getPoints())
)

rich_presence_display(
    "Conan {0} {1} [Story] [{2}] [🎟️{3}]",
    rich_presence_lookup("partnerID",
                         getPartnerID(),
                         partnerIDs,
                         fallback = partnerIDs[0]),
    rich_presence_lookup("mapID",
                         getMapID(),
                         mapIDs,
                         fallback = mapIDs[0]),
    rich_presence_lookup("storyActID",
                         getStoryProgress(),
                         actIDs,
                         fallback = actIDs[0x19]),
    rich_presence_macro("Score",
                        getPoints())
)
