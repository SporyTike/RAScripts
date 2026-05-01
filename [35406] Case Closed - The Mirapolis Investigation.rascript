// Case Closed: The Mirapolis Investigation
// #ID = 35406

//--------------------------------------------------
// Addresses

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
    0x0C: "in a Hotel Room 7F",
    0x0D: "in a Hotel Room 7F",
    0x0E: "in the Hotel Hallway 8F",
    0x0F: "in a Hotel Room 8F",
    0x10: "in a Hotel Room 8F",
    0x11: "in a Hotel Room 8F",
    0x12: "in the Hotel Hallway 9F",
    0x13: "in a Hotel Room 9F",
    0x14: "in a Hotel Room 9F",
    0x15: "in the Hotel Hallway 10F",
    0x16: "in a Hotel Room 10F",
    0x17: "in a Hotel Room 10F",
    0x18: "in the Hotel Hallway 11F",
    0x19: "in a Hotel Room 11F",
    0x1A: "in a Hotel Room 11F",
    0x1B: "in a Hotel Room 11F",
    0x1C: "in the Hotel Hallway 12F",
    0x1D: "in a Hotel Room 12F",
    0x1E: "in a Hotel Room 12F",
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
    description = "Figure out what happened to Richard's handkerchief.",
    id = 605105, badge = "687093", points = 5,
    trigger = getGameState() == 0x07 &&
              getMapID() == 0x2A &&
              getMusicID() == 0x08 &&
              increasedClueChain() &&
              bit5(mem_clueChainLink + 0x2E)
              + bit6(mem_clueChainLink + 0x2E)
              + bit7(mem_clueChainLink + 0x2E) == 3
)

achievement(
    title = "Wellness For Good", type = "progression",
    description = "Connect all clues about the incident at the pool.",
    id = 605106, badge = "687094", points = 5,
    trigger = getGameState() == 0x07 &&
              getMapID() == 0x2F &&
              getMusicID() == 0x08 &&
              increasedClueChain() &&
              bit0(mem_clueChainLink + 0x35)
              + bit1(mem_clueChainLink + 0x35)
              + bit2(mem_clueChainLink + 0x35) == 3
)

achievement(
    title = "Death to the Curious", type = "progression",
    description = "Get an idea what kind of person the murderer is.",
    id = 605109, badge = "687101", points = 5,
    trigger = getGameState() == 0x07 &&
              getMusicID() == 0x08 &&
              increasedClueChain() &&
              bit3(mem_clueChainLink + 0x35)
              + bit4(mem_clueChainLink + 0x35)
              + bit5(mem_clueChainLink + 0x35) == 3
)

achievement(
    title = "Clear", type = "progression",
    description = "Get an idea what kind of person the murderer is.",
    id = 0, badge = "687101", points = 5,
    trigger = checkStageResultDetectiveRankIsS()
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

rich_presence_conditional_display(getGameState() == 0x07 && inMinigame(), 
    "Conan is playing {0} [{1}] []",
        rich_presence_lookup("minigameIDs",
                         getMinigameID(),
                         minigameIDs,
                         fallback = minigameIDs[0]),
        rich_presence_lookup("gameModes",
                         getGameMode(),
                         gameModes,
                         fallback = gameModes[1])
)

rich_presence_display("Conan is {0} [{1}] [🎟️{2}]",
    rich_presence_lookup("mapID",
                         getMapID(),
                         mapIDs,
                         fallback = mapIDs[0]),
    rich_presence_lookup("gameModes",
                         getGameMode(),
                         gameModes,
                         fallback = gameModes[1]),
    rich_presence_macro("Number",
                        getPoints())
)