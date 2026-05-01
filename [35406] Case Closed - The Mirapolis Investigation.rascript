// Case Closed: The Mirapolis Investigation
// #ID = 35406

//--------------------------------------------------
// Addresses

mem_storyProgress        = 0x0033b2a0
mem_clueChainLink        = 0x0033b3ea
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

function getMusicID() {
    return word_be(mem_currentMusicID)
}

function inMinigame() {
    return byte(mem_gameState - 0x06) != 0x00
}

function getMinigameID() {
    return dword_be(mem_gameState + 0x2C)
}

function getPlaytime() {
    return dword_be(mem_totalPlaytime)
}

function getPoints() {
    return dword_be(mem_totalPlaytime + 0x04)
}

function increasedClueChain() {
    return word_be(mem_clueChainLink) == prev(word_be(mem_clueChainLink) + 1)
}

function getMem1LinkedListNode(node) {
    pointerChain = dword_be((dword_be(mem_Mem1LinkedListStart) & pointerMask) + 0x0C) & pointerMask
    
    for node in range(0, node - 3) {
        pointerChain = dword_be(pointerChain + 0x0C) & pointerMask
    }
    
    return pointerChain
}

function getMem2LinkedListNode(node) {
    pointerChain = dword_be((dword_be(mem_Mem2LinkedListStart) & pointerMask) + 0x0C) & pointerMask
    
    for node in range(0, node - 3) {
        pointerChain = dword_be(pointerChain + 0x0C) & pointerMask
    }
    
    return pointerChain
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

    code = dword_be(mem_actResultScreenState) == 9 &&
           prev(dword_be(mem_actResultScreenState)) < 9 &&
           dword_be((dword_be(mem_actResultScreenState + 0x0C) & pointerMask) - 0x10 + 0x04) == 0x14

    if (category == "Clue Chain") {
        return code && 
               byte((dword_be(mem_actResultScreenState + 0x0C) & pointerMask) + 0x01) == rank
    }
    if (category == "Imagination") {
        return code && 
               byte((dword_be(mem_actResultScreenState + 0x0C) & pointerMask) + 0x03) == rank
    }
    if (category == "Reasoning") {
        return code && 
               byte((dword_be(mem_actResultScreenState + 0x0C) & pointerMask) + 0x05) == rank
    }
    if (category == "Inspiration") {
        return code && 
               byte((dword_be(mem_actResultScreenState + 0x0C) & pointerMask) + 0x07) == rank
    }
    if (category == "Detective Rank") {
        return code && 
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

function getFutsalState() {
    return dword_be(getMem2LinkedListNode(143) + 0x14) 
}

function getFutsalConanTeamGoals() {
    return dword_be(getMem2LinkedListNode(153) + 0x18) 
}

function getFutsalOpponentTeamGoals() {
    return dword_be(getMem2LinkedListNode(153) + 0x1C) 
}

function getFutsalTime() {
    return dword_be(getMem2LinkedListNode(153) + 0x10) 
}

function getFutsalCurrentHalf() {
    return dword_be(getMem2LinkedListNode(153) + 0x14) 
}

function getMaskedYaibaMaskedYaibaHealth() {
    return word_be(getMem1LinkedListNode(34) + 0x28) 
}

function getMaskedYaibaMaskedYaibaPowerGauge() {
    return word_be(getMem1LinkedListNode(34) + 0x2A) 
}

function getMaskedYaibaPhantomArmyHealth() {
    return word_be(getMem1LinkedListNode(35) + 0x1C) 
}

function getHoleyMoleyScore() {
    return dword_be(getMem1LinkedListNode(34) + 0x78) 
}

function getHoleyMoleyTime() {
    return dword_be(getMem1LinkedListNode(34) + 0x7C) 
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
    description = "Get a Detective Rank with the rating \"S\" in Act I.",
    id = 605372, badge = "687307", points = 10,
    trigger = getGameState() == 0x07 &&
              getStoryProgress() == 0x0E &&
              getMapID() == 0x28 &&
              checkStageResultDetectiveRankIsS()
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
    getGameState() == 0x07 && checkGameMode("Extras") && inMinigame(), 
    "Conan is playing {0} [Extras]",
    rich_presence_lookup("minigameIDs",
                         getMinigameID(),
                         minigameIDs,
                         fallback = minigameIDs[0])
)

rich_presence_conditional_display(
    getGameState() == 0x07 && checkGameMode("Extras"), 
    "Conan is {0} [Extras]",
    rich_presence_lookup("mapID",
                         getMapID(),
                         mapIDs,
                         fallback = mapIDs[0])
)

rich_presence_conditional_display(
    getGameState() == 0x07 && inMinigame(), 
    "Conan is playing {0} [Story] [{1}] [🎟{2}]",
    rich_presence_lookup("minigameIDs",
                         getMinigameID(),
                         minigameIDs,
                         fallback = minigameIDs[0]),
    rich_presence_lookup("storyActID",
                         getStoryProgress(),
                         actIDs,
                         fallback = actIDs[0x19]),
    rich_presence_macro("Number",
                        getPoints())
)

rich_presence_display(
    "Conan is {0} [Story] [{1}] [🎟️{2}]",
    rich_presence_lookup("mapID",
                         getMapID(),
                         mapIDs,
                         fallback = mapIDs[0]),
    rich_presence_lookup("storyActID",
                         getStoryProgress(),
                         actIDs,
                         fallback = actIDs[0x19]),
    rich_presence_macro("Number",
                        getPoints())
)
