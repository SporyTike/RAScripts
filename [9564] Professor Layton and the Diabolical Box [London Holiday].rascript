// Professor Layton and the Diabolical Box [Subset - London Holiday]
// #ID = 17587

//--------------------------------------------------
// Addresses

Mem_GameVersion                 = 0x003ffe0c

// [YELJ] Level5 Premium Silver
Mem_S_ExecutionID               = 0x003ffc20
Mem_S_IE_Demo_GameState         = 0x000e17a8
Mem_S_IE_Demo_GoalsTeam1        = 0x000e199c
Mem_S_IE_Demo_GoalsTeam2        = 0x000e199d
Mem_S_IE_Demo_MapID             = 0x000e19e0
Mem_S_IE_Demo_StoryProgress     = 0x000ea608
Mem_S_PLLH_EventID              = 0x0025b320
Mem_S_PLLH_PuzzleID             = 0x0025b324
Mem_S_PLLH_EventState           = 0x0025b32a
Mem_S_PLLH_GameState            = 0x0025b32f
Mem_S_PLLH_PuzzleData           = 0x0025b346
Mem_S_PLLH_Puzzle003Record      = 0x0025b390
Mem_S_PLLH_LettersUnlocked      = 0x0025b392
Mem_S_PLLH_CurrentHintCoins     = 0x0025b45c
Mem_S_PLLH_LettersRead          = 0x0025b528
Mem_S_PLLH_Picarats             = 0x0025b52c

// [YEWJ] Level5 Premium Gold
Mem_G_ExecutionID               = 0x003ffc20
Mem_G_IE_Demo_GameState         = 0x000e7764
Mem_G_IE_Demo_GoalsTeam1        = 0x000e7980
Mem_G_IE_Demo_GoalsTeam2        = 0x000e7981
Mem_G_IE_Demo_MapID             = 0x000e7b88
Mem_G_IE_Demo_StoryProgress     = 0x000f19d8
Mem_G_PL2_Demo_PuzzleData       = 0x001fffdc
Mem_G_PL2_Demo_CurrentHintCoins = 0x002000f4
Mem_G_PL2_Demo_TotalHintCoins   = 0x002000f6
Mem_G_PL2_Demo_Picarats         = 0x002000f8
Mem_G_PL2_Demo_LocationID       = 0x00200100
Mem_G_PL2_Demo_State            = 0x002002c0
Mem_G_PLLH_EventID              = 0x00265d20
Mem_G_PLLH_PuzzleID             = 0x00265d24
Mem_G_PLLH_EventState           = 0x00265d2a
Mem_G_PLLH_GameState            = 0x00265d2f
Mem_G_PLLH_PuzzleData           = 0x00265d46
Mem_G_PLLH_Puzzle003Record      = 0x00265d90
Mem_G_PLLH_LettersUnlocked      = 0x00265d92
Mem_G_PLLH_CurrentHintCoins     = 0x00265e5c
Mem_G_PLLH_LettersRead          = 0x00265f28
Mem_G_PLLH_Picarats             = 0x00265f2c

//--------------------------------------------------
// Arrays and Dictionaries

IEDemoCharacterParty = {
    0x00: "Mark is",
    0x01: "Mark is",
    0x02: "Mark, Todd, Nathan and Sam are",
    0x03: "Mark, Todd, Nathan, Sam and Jack are",
    0x04: "Mark, Todd, Nathan, Sam and Jack are",
    0x05: "Mark, Todd, Nathan, Sam and Jack are",
    0x06: "Mark, Todd, Nathan, Sam and Jack are",
}

IEDemoLocationIDs = {
    0x31693032: "inside the Raimon Jr. High",
    0x4B30324D: "inside the Raimon Jr. High",
    0x31624041: "outside the Raimon Jr. High",
    0x4B30334D: "outside the Raimon Jr. High",
    0x32623032: "outside the Raimon Jr. High",
}

PL2DemoLocationIDs = {
    0x01: "in Layton's Study",
    0x02: "at Schrader's Home",
    0x03: "at Schrader's Home",
    0x04: "in the Doctor's Hall",
    0x08: "in Layton's Room",
    0x09: "in Carriage 3 - Hall",
    0x5B: "in the Study Entrance",
}

Level5Collections = {
    0x59454C4A: "Silver",
    0x5945574A: "Gold",
}

//--------------------------------------------------
// Functions

function getGameVersion() {
    return dword_be(Mem_GameVersion)
}

function checkGameVersion(version) {
      if (version == "YELJ") {
        return getGameVersion() == 0x59454C4A
    } if (version == "YEWJ") {
        return getGameVersion() == 0x5945574A
    } else {
        assert(0 == 1, "checkGameVersion: Version \"" + version + "\" not found.")
    }
}

function getExecutionID(version) {
      if (version == "YELJ") {
        return low4(Mem_S_ExecutionID)
    } if (version == "YEWJ") {
        return low4(Mem_G_ExecutionID)
    } else {
        assert(0 == 1, "getExecutionID: Version \"" + version + "\" not found.")
    }
}

function getIEDemoGameState(version) {
      if (version == "YELJ") {
        return dword(Mem_S_IE_Demo_GameState)
    } if (version == "YEWJ") {
        return dword(Mem_G_IE_Demo_GameState)
    } else {
        assert(0 == 1, "getIEDemoGameState: Version \"" + version + "\" not found.")
    }
}

function getIEDemoLocationID(version) {
      if (version == "YELJ") {
        return dword_be(Mem_S_IE_Demo_MapID)
    } if (version == "YEWJ") {
        return dword_be(Mem_G_IE_Demo_MapID + 0x03)
    } else {
        assert(0 == 1, "getIEDemoLocationID: Version \"" + version + "\" not found.")
    }
}

function getIEDemoStoryProgress(version) {
      if (version == "YELJ") {
        return dword(Mem_S_IE_Demo_StoryProgress)
    } if (version == "YEWJ") {
        return dword(Mem_G_IE_Demo_StoryProgress)
    } else {
        assert(0 == 1, "getIEStoryProgress: Version \"" + version + "\" not found.")
    }
}

function getIEDemoTeamGoals(version, team) {
      if (team == "Team 1") {
        offset = 0x00
    } else if (team == "Team 2") {
        offset = 0x01
    } else {
        assert(0 == 1, "getIEDemoTeamGoals: Team \"" + team + "\" not found.")
    }
      if (version == "YELJ") {
        return byte(Mem_S_IE_Demo_GoalsTeam1 + offset)
    } if (version == "YEWJ") {
        return byte(Mem_G_IE_Demo_GoalsTeam1 + offset)
    } else {
        assert(0 == 1, "getIEDemoTeamGoals: Version \"" + version + "\" not found.")
    }
}

function getPL2DemoPuzzlesSolved(version) {
      code = 0
      if (version == "YEWJ") {
        for puzzle in range (1, 138) {
            code = code + 
                   bit1(Mem_G_PL2_Demo_PuzzleData + (puzzle - 1))
        }
        return code
    } else {
        assert(0 == 1, "getPL2DemoPuzzlesSolved: Version \"" + version + "\" not found.")
    }
}

function getPL2DemoPuzzlesFound(version) {
      code = 0
      if (version == "YEWJ") {
        for puzzle in range (1, 138) {
            code = code + 
                   bit0(Mem_G_PL2_Demo_PuzzleData + (puzzle - 1)) + 
                   bit1(Mem_G_PL2_Demo_PuzzleData + (puzzle - 1)) 
        }
        return code
    } else {
        assert(0 == 1, "getPL2DemoPuzzlesFound: Version \"" + version + "\" not found.")
    }
}

function getPL2DemoCurrentHintCoins(version) {
      if (version == "YEWJ") {
        return word(Mem_G_PL2_Demo_CurrentHintCoins)
    } else {
        assert(0 == 1, "getPL2DemoCurrentHintCoins: Version \"" + version + "\" not found.")
    }
}

function getPL2DemoTotaltHintCoins(version) {
      if (version == "YEWJ") {
        return word(Mem_G_PL2_Demo_TotalHintCoins)
    } else {
        assert(0 == 1, "getPL2DemoTotaltHintCoins: Version \"" + version + "\" not found.")
    }
}

function getPL2DemoPicarats(version) {
      if (version == "YEWJ") {
        return word(Mem_G_PL2_Demo_Picarats)
    } else {
        assert(0 == 1, "getPL2DemoPicarats: Version \"" + version + "\" not found.")
    }
}

function getPL2DemoLocationID(version) {
      if (version == "YEWJ") {
        return word(Mem_G_PL2_Demo_LocationID)
    } else {
        assert(0 == 1, "getPL2DemoCurrentHintCoins: Version \"" + version + "\" not found.")
    }
}

function getPL2DemoGameState(version) {
      if (version == "YEWJ") {
        return byte(0x002002c0)
    } else {
        assert(0 == 1, "getPL2DemoState: Version \"" + version + "\" not found.")
    }
}

function getPLLHGameState(version) {
      if (version == "YELJ") {
        return byte(Mem_S_PLLH_GameState)
    } if (version == "YEWJ") {
        return byte(Mem_G_PLLH_GameState)
    } else {
        assert(0 == 1, "getPLLHState: Version \"" + version + "\" not found.")
    }
}

function getPLLHPuzzlesSolved(version) {
      code = 0
      if (version == "YELJ") {
        for puzzle in range (1, 12) {
            code = code + 
                   bit1(Mem_S_PLLH_PuzzleData + (puzzle - 1))
        }
        return code
    } if (version == "YEWJ") {
        for puzzle in range (1, 12) {
            code = code + 
                   bit1(Mem_G_PLLH_PuzzleData + (puzzle - 1))
        }
        return code
    } else {
        assert(0 == 1, "getPLLHPuzzlesSolved: Version \"" + version + "\" not found.")
    }
}

function getPLLHPuzzlesFound(version) {
      code = 0
      if (version == "YELJ") {
        for puzzle in range (1, 12) {
            code = code + 
                   bit0(Mem_S_PLLH_PuzzleData + (puzzle - 1))
        }
        return code
    } if (version == "YEWJ") {
        for puzzle in range (1, 12) {
            code = code + 
                   bit0(Mem_G_PLLH_PuzzleData + (puzzle - 1))
        }
        return code
    } else {
        assert(0 == 1, "getPLLHPuzzlesFound: Version \"" + version + "\" not found.")
    }
}

function getPLLHPuzzleExclamationMarksSet(version) {
      code = 0
      if (version == "YELJ") {
        for puzzle in range (1, 12) {
            code = code + 
                   bit2(Mem_S_PLLH_PuzzleData + (puzzle - 1))
        }
        return code
    } if (version == "YEWJ") {
        for puzzle in range (1, 12) {
            code = code + 
                   bit2(Mem_G_PLLH_PuzzleData + (puzzle - 1))
        }
        return code
    } else {
        assert(0 == 1, "getPLLHPuzzlesFound: Version \"" + version + "\" not found.")
    }
}

function getPLLHLettersUnlocked(version) {
      if (version == "YELJ") {
        return byte(Mem_S_PLLH_LettersUnlocked)
    } if (version == "YEWJ") {
        return byte(Mem_G_PLLH_LettersUnlocked)
    } else {
        assert(0 == 1, "getPLLHLettersUnlocked: Version \"" + version + "\" not found.")
    }
}

function getPLLHLettersRead(version) {
      code = 0
      if (version == "YELJ") {
        for letter in range (1, 12) {
            code = code + 
                   bit(letter, Mem_S_PLLH_LettersRead)
        }
        return code
    } if (version == "YEWJ") {
        for letter in range (1, 12) {
            code = code + 
                   bit(letter, Mem_G_PLLH_LettersRead)
        }
        return code
    } else {
        assert(0 == 1, "getPLLHLettersRead: Version \"" + version + "\" not found.")
    }
}

function getPLLHPicarats(version) {
      if (version == "YELJ") {
        return word(Mem_S_PLLH_Picarats)
    } if (version == "YEWJ") {
        return word(Mem_G_PLLH_Picarats)
    } else {
        assert(0 == 1, "getPLLHPicarats: Version \"" + version + "\" not found.")
    }
}

function getPLLHCurrentHintCoins(version) {
      if (version == "YELJ") {
        return word(Mem_S_PLLH_CurrentHintCoins)
    } if (version == "YEWJ") {
        return word(Mem_G_PLLH_CurrentHintCoins)
    } else {
        assert(0 == 1, "getPLLHCurrentHintCoins: Version \"" + version + "\" not found.")
    }
}

function getPLLHEventID(version) {
      if (version == "YELJ") {
        return dword(Mem_S_PLLH_EventID)
    } if (version == "YEWJ") {
        return dword(Mem_G_PLLH_EventID)
    } else {
        assert(0 == 1, "getPLLHEventID: Version \"" + version + "\" not found.")
    }
}

function getPLLHEventState(version) {
      if (version == "YELJ") {
        return byte(Mem_S_PLLH_EventState)
    } if (version == "YEWJ") {
        return byte(Mem_G_PLLH_EventState)
    } else {
        assert(0 == 1, "getPLLHEventState: Version \"" + version + "\" not found.")
    }
}

function getPLLHPuzzle003Record(version) {
      if (version == "YELJ") {
        return word(Mem_S_PLLH_Puzzle003Record)
    } if (version == "YEWJ") {
        return word(Mem_G_PLLH_Puzzle003Record)
    } else {
        assert(0 == 1, "getPLLHPuzzle003Record: Version \"" + version + "\" not found.")
    }
}

//--------------------------------------------------
// Achievements

achievement(
    title       = "Note to Get Another Notebook", 
    points      = 1,
    type        = "",
    description = "Solve the first puzzle and find one of Dr. Schrader's notes.",
    id          = 636060, 
    badge       = "726456", 
    trigger     = (unless(!checkGameVersion("YELJ")) &&
                          getExecutionID("YELJ") == 0x02 &&
                          getPLLHGameState("YELJ") == 0x03 &&
                          getPLLHEventID("YELJ") == 0x12 &&
                          getPLLHEventState("YELJ") == 0x00 &&
                          prev(getPLLHEventState("YELJ")) == 0x01) ||
                  (unless(!checkGameVersion("YEWJ")) &&
                          getExecutionID("YEWJ") == 0x03 &&
                          getPLLHGameState("YEWJ") == 0x03 &&
                          getPLLHEventID("YEWJ") == 0x12 &&
                          getPLLHEventState("YEWJ") == 0x00 &&
                          prev(getPLLHEventState("YEWJ")) == 0x01)
)

achievement(
    title       = "Tea as Black as the Professor's Top Hat", 
    points      = 5,
    type        = "",
    description = "Solve the sixth puzzle and take a tea break.",
    id          = 636061, 
    badge       = "726457", 
    trigger     = (unless(!checkGameVersion("YELJ")) &&
                          getExecutionID("YELJ") == 0x02 &&
                          getPLLHGameState("YELJ") == 0x03 &&
                          getPLLHEventID("YELJ") == 0x10 &&
                          getPLLHEventState("YELJ") == 0x00 &&
                          prev(getPLLHEventState("YELJ")) == 0x01) ||
                  (unless(!checkGameVersion("YEWJ")) &&
                          getExecutionID("YEWJ") == 0x03 &&
                          getPLLHGameState("YEWJ") == 0x03 &&
                          getPLLHEventID("YEWJ") == 0x10 &&
                          getPLLHEventState("YEWJ") == 0x00 &&
                          prev(getPLLHEventState("YEWJ")) == 0x01)
)

achievement(
    title       = "A Message From Elysium", 
    points      = 10,
    type        = "",
    description = "Solve all twelve puzzle and receive a mail that leads to the next adventure.",
    id          = 636062, 
    badge       = "726458", 
    trigger     = (unless(!checkGameVersion("YELJ")) &&
                          getExecutionID("YELJ") == 0x02 &&
                          getPLLHGameState("YELJ") == 0x00 &&
                          prev(getPLLHGameState("YELJ")) == 0x03 &&
                          getPLLHEventID("YELJ") == 0x13) || 
                  (unless(!checkGameVersion("YEWJ")) &&
                          getExecutionID("YEWJ") == 0x03 &&
                          getPLLHGameState("YEWJ") == 0x00 &&
                          prev(getPLLHGameState("YEWJ")) == 0x03 &&
                          getPLLHEventID("YEWJ") == 0x13)
)

achievement(
    title       = "Sharp Minded Foil", 
    points      = 1,
    type        = "",
    description = "Learn more about Professor Layton's past.",
    id          = 636067, 
    badge       = "726459", 
    trigger     = (unless(!checkGameVersion("YELJ")) &&
                          getExecutionID("YELJ") == 0x02 &&
                          getPLLHGameState("YELJ") == 0x03 &&
                          getPLLHEventID("YELJ") == 0x0F &&
                          getPLLHEventState("YELJ") == 0x00 &&
                          prev(getPLLHEventState("YELJ")) == 0x01) ||
                  (unless(!checkGameVersion("YEWJ")) &&
                          getExecutionID("YEWJ") == 0x03 &&
                          getPLLHGameState("YEWJ") == 0x03 &&
                          getPLLHEventID("YEWJ") == 0x0F &&
                          getPLLHEventState("YEWJ") == 0x00 &&
                          prev(getPLLHEventState("YEWJ")) == 0x01)
)

achievement(
    title       = "Mind of the Doctor", 
    points      = 1,
    type        = "",
    description = "Read all of Dr. Schrader's notes.",
    id          = 636063, 
    badge       = "726460", 
    trigger     = (unless(!checkGameVersion("YELJ")) &&
                          getExecutionID("YELJ") == 0x02 &&
                          getPLLHGameState("YELJ") == 0x0C &&
                          measured(getPLLHLettersRead("YELJ") == 12,
                                   when = getExecutionID("YELJ") == 0x02 &&
                                          getPLLHGameState("YELJ") != 0x00) &&
                          prev(getPLLHLettersRead("YELJ")) == 11) ||
                  (unless(!checkGameVersion("YEWJ")) &&
                          getExecutionID("YEWJ") == 0x03 &&
                          getPLLHGameState("YEWJ") == 0x0C &&
                          measured(getPLLHLettersRead("YEWJ") == 12,
                                   when = getExecutionID("YEWJ") == 0x03 &&
                                          getPLLHGameState("YEWJ") != 0x00) &&
                          prev(getPLLHLettersRead("YEWJ")) == 11)
)

achievement(
    title       = "Mr. Pennyworth", 
    points      = 5,
    type        = "missable",
    description = "Solve every puzzles without using any hint coin.",
    id          = 636064, 
    badge       = "726461", 
    trigger     = (unless(!checkGameVersion("YELJ")) &&
                          getExecutionID("YELJ") == 0x02 &&
                          getPLLHGameState("YELJ") == 0x03 &&
                          getPLLHPuzzleExclamationMarksSet("YELJ") == 12 &&
                          prev(getPLLHPuzzleExclamationMarksSet("YELJ")) == 11 &&
                          measured(getPLLHCurrentHintCoins("YELJ") == 10,
                                   when = getExecutionID("YELJ") == 0x02 &&
                                          getPLLHGameState("YELJ") != 0x00)) ||
                  (unless(!checkGameVersion("YEWJ")) &&
                          getExecutionID("YEWJ") == 0x03 &&
                          getPLLHGameState("YEWJ") == 0x03 &&
                          getPLLHPuzzleExclamationMarksSet("YEWJ") == 12 &&
                          prev(getPLLHPuzzleExclamationMarksSet("YEWJ")) == 11 &&
                          measured(getPLLHCurrentHintCoins("YEWJ") == 10,
                                   when = getExecutionID("YEWJ") == 0x03 &&
                                          getPLLHGameState("YEWJ") != 0x00))
)

achievement(
    title       = "In the Professor's Footprints", 
    points      = 5,
    type        = "missable",
    description = "Solve every puzzles without failing and obtain 500 picarats.",
    id          = 636065, 
    badge       = "726462", 
    trigger     = (unless(!checkGameVersion("YELJ")) &&
                          getExecutionID("YELJ") == 0x02 &&
                          getPLLHGameState("YELJ") == 0x03 &&
                          getPLLHPuzzleExclamationMarksSet("YELJ") == 12 &&
                          prev(getPLLHPuzzleExclamationMarksSet("YELJ")) == 11 &&
                          measured(getPLLHPicarats("YELJ") == 500,
                                   when = getExecutionID("YELJ") == 0x02 &&
                                          getPLLHGameState("YELJ") != 0x00)) ||
                  (unless(!checkGameVersion("YEWJ")) &&
                          getExecutionID("YEWJ") == 0x03 &&
                          getPLLHGameState("YEWJ") == 0x03 &&
                          getPLLHPuzzleExclamationMarksSet("YEWJ") == 12 &&
                          prev(getPLLHPuzzleExclamationMarksSet("YEWJ")) == 11 &&
                          measured(getPLLHPicarats("YEWJ") == 500,
                                   when = getExecutionID("YEWJ") == 0x03 &&
                                          getPLLHGameState("YEWJ") != 0x00))
)

achievement(
    title       = "Wiggle in the Apple", 
    points      = 10,
    type        = "",
    description = "Solve Puzzle 003 \"Apple's Bug\" in 23 moves.",
    id          = 636066, 
    badge       = "726463", 
    trigger     = (unless(!checkGameVersion("YELJ")) &&
                          getExecutionID("YELJ") == 0x02 &&
                          __ornext(getPLLHGameState("YELJ") == 0x01 ||
                                   getPLLHGameState("YELJ") == 0x04) &&
                          getPLLHPuzzle003Record("YELJ") == 23 &&
                          getPLLHPuzzle003Record("YELJ") < prev(getPLLHPuzzle003Record("YELJ"))) ||
                  (unless(!checkGameVersion("YEWJ")) &&
                          getExecutionID("YEWJ") == 0x03 &&
                          __ornext(getPLLHGameState("YEWJ") == 0x01 ||
                                   getPLLHGameState("YEWJ") == 0x04) &&
                          getPLLHPuzzle003Record("YEWJ") == 23 &&
                          getPLLHPuzzle003Record("YEWJ") < prev(getPLLHPuzzle003Record("YEWJ")))
)

//--------------------------------------------------
// Rich Presence

rich_presence_conditional_display(checkGameVersion("YELJ") &&
                                  getExecutionID("YELJ") == 0x01 &&
                                  getIEDemoGameState("YELJ") <= 0x01, 
    "In the Titlescreen [IE v1.0]"
)

rich_presence_conditional_display(checkGameVersion("YELJ") &&
                                  getExecutionID("YELJ") == 0x01 &&
                                  getIEDemoGameState("YELJ") == 0x02, 
    "Raimon Football Club is playing against Royal Academy [{0}-{1}] [IE v1.0]",
    rich_presence_macro("Number",
                            getIEDemoTeamGoals("YELJ", "Team 1")),
    rich_presence_macro("Number",
                            getIEDemoTeamGoals("YELJ", "Team 2"))                       
)

rich_presence_conditional_display(checkGameVersion("YELJ") &&
                                  getExecutionID("YELJ") == 0x01, 
    "{0} {1} [IE v1.0]",
    rich_presence_lookup("IECharacterParty",
                             getIEDemoStoryProgress("YELJ"),
                             IEDemoCharacterParty,
                             fallback = "Mark is"),
    rich_presence_lookup("IELocationIDs",
                             getIEDemoLocationID("YELJ"),
                             IEDemoLocationIDs,
                             fallback = IEDemoLocationIDs[0x4B30334D])
)

rich_presence_conditional_display(checkGameVersion("YEWJ") &&
                                  getExecutionID("YEWJ") == 0x01 &&
                                  getIEDemoGameState("YEWJ") <= 0x01, 
    "In the Titlescreen [IE v2.1]"
)

rich_presence_conditional_display(checkGameVersion("YEWJ") &&
                                  getExecutionID("YEWJ") == 0x01 &&
                                  getIEDemoGameState("YEWJ") == 0x02, 
    "Raimon Football Club is playing against Royal Academy [{0}-{1}] [IE v2.1]",
    rich_presence_macro("Number",
                            getIEDemoTeamGoals("YEWJ", "Team 1")),
    rich_presence_macro("Number",
                            getIEDemoTeamGoals("YEWJ", "Team 2"))                       
)

rich_presence_conditional_display(checkGameVersion("YEWJ") &&
                                  getExecutionID("YEWJ") == 0x01, 
    "{0} {1} [IE v2.1]",
    rich_presence_lookup("IECharacterParty",
                             getIEDemoStoryProgress("YEWJ"),
                             IEDemoCharacterParty,
                             fallback = "Mark is"),
    rich_presence_lookup("IELocationIDs",
                             getIEDemoLocationID("YEWJ"),
                             IEDemoLocationIDs,
                             fallback = IEDemoLocationIDs[0x4B30334D])
)

rich_presence_conditional_display(checkGameVersion("YEWJ") &&
                                  getExecutionID("YEWJ") == 0x02 &&
                                  __ornext(getPL2DemoGameState("YEWJ") == 0x00 ||
                                           getPL2DemoGameState("YEWJ") == 0x0C), 
    "In the Titlescreen [PLatDB]"
)

rich_presence_conditional_display(checkGameVersion("YEWJ") &&
                                  getExecutionID("YEWJ") == 0x02, 
    "Professor Layton and Luke are {0} [🎩{1}/{2}|{3}] [Ⓛ{4}/{5}] [PLatDB]",
        rich_presence_lookup("PL2LocationIDs",
                             getPL2DemoLocationID("YEWJ"),
                             PL2DemoLocationIDs,
                             fallback = PL2DemoLocationIDs[1]),
        rich_presence_macro("Number",
                            getPL2DemoPuzzlesSolved("YEWJ")),
        rich_presence_macro("Number",
                            getPL2DemoPuzzlesFound("YEWJ")),
        rich_presence_macro("Number",
                            getPL2DemoPicarats("YEWJ")),
        rich_presence_macro("Number",
                            getPL2DemoCurrentHintCoins("YEWJ")),
        rich_presence_macro("Number",
                            getPL2DemoCurrentHintCoins("YEWJ"))
)

rich_presence_conditional_display(checkGameVersion("YELJ") &&
                                  getExecutionID("YELJ") == 0x02 &&
                                  getPLLHGameState("YELJ") == 0x00, 
    "In the Titlescreen [PLLH]"
)

rich_presence_conditional_display(checkGameVersion("YELJ") &&
                                  getExecutionID("YELJ") == 0x02 &&
                                  getPLLHGameState("YELJ") != 0x00 &&
                                  getPLLHEventID("YELJ") <= 0x01 &&
                                  getPLLHPuzzlesFound("YELJ") == 0, 
    "Luke is going to Layton's Study [🎩{0}/{1}|{2}] [Ⓛ{3}/10] [PLLH]",
        rich_presence_macro("Number",
                            getPLLHPuzzlesSolved("YELJ")),
        rich_presence_macro("Number",
                            getPLLHPuzzlesFound("YELJ")),
        rich_presence_macro("Number",
                            getPLLHPicarats("YELJ")),
        rich_presence_macro("Number",
                            getPLLHCurrentHintCoins("YELJ"))
)

rich_presence_conditional_display(checkGameVersion("YELJ") &&
                                  getExecutionID("YELJ") == 0x02 &&
                                  getPLLHGameState("YELJ") != 0x00, 
    "Professor Layton and Luke are in Layton's Study [🎩{0}/{1}|{2}] [Ⓛ{3}/10] [PLLH]",
        rich_presence_macro("Number",
                            getPLLHPuzzlesSolved("YELJ")),
        rich_presence_macro("Number",
                            getPLLHPuzzlesFound("YELJ")),
        rich_presence_macro("Number",
                            getPLLHPicarats("YELJ")),
        rich_presence_macro("Number",
                            getPLLHCurrentHintCoins("YELJ"))
)

rich_presence_conditional_display(checkGameVersion("YEWJ") &&
                                  getExecutionID("YEWJ") == 0x03 &&
                                  getPLLHGameState("YEWJ") == 0x00, 
    "In the Titlescreen [PLLH]"
)

rich_presence_conditional_display(checkGameVersion("YEWJ") &&
                                  getExecutionID("YEWJ") == 0x03 &&
                                  getPLLHGameState("YEWJ") != 0x00 &&
                                  getPLLHEventID("YEWJ") <= 0x01 &&
                                  getPLLHPuzzlesFound("YEWJ") == 0, 
    "Luke is going to Layton's Study [🎩{0}/{1}|{2}] [Ⓛ{3}/10] [PLLH]",
        rich_presence_macro("Number",
                            getPLLHPuzzlesSolved("YEWJ")),
        rich_presence_macro("Number",
                            getPLLHPuzzlesFound("YEWJ")),
        rich_presence_macro("Number",
                            getPLLHPicarats("YEWJ")),
        rich_presence_macro("Number",
                            getPLLHCurrentHintCoins("YEWJ"))
)

rich_presence_conditional_display(checkGameVersion("YEWJ") &&
                                  getExecutionID("YEWJ") == 0x03 &&
                                  getPLLHGameState("YEWJ") != 0x00, 
    "Professor Layton and Luke are in Layton's Study [🎩{0}/{1}|{2}] [Ⓛ{3}/10] [PLLH]",
        rich_presence_macro("Number",
                            getPLLHPuzzlesSolved("YEWJ")),
        rich_presence_macro("Number",
                            getPLLHPuzzlesFound("YEWJ")),
        rich_presence_macro("Number",
                            getPLLHPicarats("YEWJ")),
        rich_presence_macro("Number",
                            getPLLHCurrentHintCoins("YEWJ"))
)

rich_presence_conditional_display(checkGameVersion("YELJ") ||
                                  checkGameVersion("YEWJ"), 
    "In the Main Menu of the Level5 {0} Collection",
        rich_presence_lookup("Level5Collection",
                             getGameVersion(),
                             Level5Collections)
)

rich_presence_display(
    "~Insert original game Rich Presence here~"
)