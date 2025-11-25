// Game Boy Advance Video Series
// #ID = 11843

//--------------------------------------------------
// Addresses

mem_romType1EpisodePointer  = 0x006868
mem_romType1VideoState      = mem_romType1EpisodePointer - 0x10
mem_romType1PlaytimeCounter = mem_romType1EpisodePointer + 0x0C
mem_romType1VideoPlaytime   = mem_romType1EpisodePointer + 0x14
mem_romType1CurrentChapter  = mem_romType1EpisodePointer + 0x20
mem_romType1Input           = 0x007EC4
mem_romType1Runtime         = mem_romType1Input + 0x2C

//--------------------------------------------------
// Arrays and Dictionaries

inputArrow = [
    "🠉", "🠈", "🠋", "🠊"
]

episodes = [
    [
        "SpongeBob SquarePants",
        "Bubblestand",
        "SpongeBob SquarePants - Volume 1",
        0x080225B0, // Episode Pointer
        0x00000005, // Chapters
        0x00001F00, // Total Playtime
    ],
    [
        "SpongeBob SquarePants",
        "Ripped Pants",
        "SpongeBob SquarePants - Volume 1",
        0x0878A2E0, // Episode Pointer
        0x00000005, // Chapters
        0x00001EF9, // Total Playtime
    ],
    [
        "SpongeBob SquarePants",
        "Jellyfishing",
        "SpongeBob SquarePants - Volume 1",
        0x08F9FF40, // Episode Pointer
        0x00000005, // Chapters
        0x00001EFF, // Total Playtime
    ],
    [
        "SpongeBob SquarePants",
        "Plankton!",
        "SpongeBob SquarePants - Volume 1",
        0x09791CA0, // Episode Pointer
        0x00000005, // Chapters
        0x00001EF9, // Total Playtime
    ]
]

questions = [
    [
        0101,
        "Do not forget to land on ___?",
            "Left Arm",
            "Left Foot",
            "Right Arm",
            "Right Foot"
    ],
    [
        0102,
        "How much did Blowing Bubbles cost?",
            "10 Cents",
            "25 Cents",
            "50 Cents",
            "1 Dollar"
    ],
    [
        0103,
        "Who made the gigantic bubble?",
            "SpongeBob",
            "Patrick",
            "Squidward",
            "Sandy"
    ],
    [
        0104,
        "What animal-shaped bubble did SpongeBob not create?",
            "Duck",
            "Giraffe",
            "Elephant",
            "Caterpillar"
    ],
    [
        0201,
        "What kind of sand pizza did SpongeBob deliver?",
            "Olive",
            "Broccoli",
            "Pineapple",
            "Pepperoni"
    ],
    [
        0202,
        "What did SpongeBob use as weights?",
            "Shells",
            "Stones",
            "Mashmallows",
            "Milkshake Cups"
    ],
    [
        0203,
        "What joke was second on SpongeBob's list?",
            "Snack Bar",
            "Volleyball",
            "Frisbee",
            "Surfing"
    ],
    [
        0204,
        "Which instrument did the male fish play?",
            "Guitar",
            "Bass Guitar",
            "Tambourine",
            "Drums"
    ],
    [
        0301,
        "How many jellyfish nets were in the locker?",
            "Two",
            "Three",
            "Four",
            "Five"
    ],
    [
        0302,
        "Who was seen with SpongeBob in the picture on the table?",
            "Patrick",
            "Gary",
            "Squidward",
            "Mr. Krabs"
    ],
    [
        0303,
        "What was the best day ever meal?",
            "Soup",
            "Cake",
            "Krabby Patty",
            "Pizza"
    ],
    [
        0304,
        "What present did Squidward get?",
            "Cake",
            "Jellyfish Net",
            "Jellyfish",
            "Picture"
    ],
    [
        0401,
        "What sauce did SpongeBob shoot into his eye?",
            "Ketchup",
            "Mayonnaise",
            "Mustard",
            "Horseradish"
    ],
    [
        0402,
        "What did Plankton dress up as?",
            "Gary",
            "Bean",
            "Krabby Patty",
            "Flower"
    ],
    [
        0403,
        "What kind of dog did Plankton own?",
            "Beagle",
            "Rottweiler",
            "Labrador",
            "Spaniel"
    ],
    [
        0404,
        "What is between cheese and lettuce on a Krabby Patty?",
            "Pickles",
            "Onions",
            "Tomatoes",
            "Sauce"
    ]
]

//--------------------------------------------------
// Functions

function getAchievementTitle(series, episode) {
    for episodeData in episodes {
        if (episodeData[0] == series && episodeData[1] == episode) {
            return episodeData[2]           
        }
    }
    assert(0 == 1, "Could not find Episode '" + episode + "' of '" + series + "'")
}

function getAchievementDescription(series, episode) {
    for episodeData in episodes {
        if(episodeData[0] == series && episodeData[1] == episode) {
            return "Answer a question for the episode '" + episode + "' of '" + series + "' correctly."            
        }
    }
    assert(0 == 1, "Could not find Episode '" + episode + "' of '" + series + "'")
}

function getEpisodePointer(series, episode) {
    for episodeData in episodes {
        if (episodeData[0] == series && episodeData[1] == episode) {
            return episodeData[3]           
        }
    }
    assert(0 == 1, "Could not find Episode '" + episode + "' of '" + series + "'")
}

function getTotalChapters(series, episode) {
    for episodeData in episodes {
        if (episodeData[0] == series && episodeData[1] == episode) {
            return episodeData[4]           
        }
    }
    assert(0 == 1, "Could not find Episode '" + episode + "' of '" + series + "'")
}

function getTotalPlaytime(series, episode) {
    for episodeData in episodes {
        if (episodeData[0] == series && episodeData[1] == episode) {
            return episodeData[5]           
        }
    }
    assert(0 == 1, "Could not find Episode '" + episode + "' of '" + series + "'")
}

function getQuestionTitle(questionID) {
    for questionData in questions {
        if (questionData[0] == questionID) {
            return questionData[1]
        }
    }
    assert(0 == 1, "Could not find Question ID " + questionID)
}

function getQuestionDescription(questionID) {
    for questionData in questions {
        if (questionData[0] == questionID) {
            return inputArrow[0] + questionData[2] + " | " + inputArrow[1] + questionData[3] + " | " + inputArrow[2] + questionData[4] + " | " + inputArrow[3] + questionData[5]
        }
    }
    assert(0 == 1, "Could not find Question ID " + questionID)
}



function romType1VideoStarted(series, episode) {
    return once(dword(mem_romType1EpisodePointer) == getEpisodePointer(series, episode) &&
                prev(dword(mem_romType1VideoPlaytime)) == 0x00 &&
                     dword(mem_romType1VideoPlaytime)  == 0x01) &&
           trigger_when(dword(mem_romType1CurrentChapter) == getTotalChapters(series, episode)) &&
           trigger_when(dword(mem_romType1PlaytimeCounter) == 0xFFFFFFFF) &&
           never(dword(mem_romType1EpisodePointer) == getEpisodePointer(series, episode) &&
                 dword(mem_romType1VideoPlaytime) == 0x00) &&
           never(dword(mem_romType1VideoPlaytime) < getTotalPlaytime(series, episode) &&
                 prev(dword(mem_romType1VideoState)) != 0x04 &&
                 prev(dword(mem_romType1VideoState)) != 0x08 &&
                      dword(mem_romType1VideoState)  == 0x08) &&
           never(repeated(600, dword(mem_romType1PlaytimeCounter) == 0xFFFFFFFF))
}

function romType1CorrectAnswer(totalQuestion, currentQuestion, index) {
    return trigger_when(once(prev(dword(mem_romType1PlaytimeCounter)) == 0x00000000 &&
                                  dword(mem_romType1PlaytimeCounter)  == 0xFFFFFFFF &&
                                  dword(mem_romType1Runtime) % totalQuestion == currentQuestion)) &&
           trigger_when(bit0(mem_romType1Input + 0x01)
                      + bit1(mem_romType1Input + 0x01) >= 1 &&
                        bit(index % 4 + 4, mem_romType1Input) > prev(bit(index % 4 + 4, mem_romType1Input))) &&
           never(once(dword(mem_romType1PlaytimeCounter) == 0xFFFFFFFF &&
                bit0(mem_romType1Input + 0x01)
              + bit1(mem_romType1Input + 0x01) >= 1 &&
                bit((index + 1) % 4 + 4, mem_romType1Input)
              + bit((index + 2) % 4 + 4, mem_romType1Input)
              + bit((index + 3) % 4 + 4, mem_romType1Input) == 1) &&
                repeated(2, always_true())) &&
           trigger_when(bit((index + 1) % 4 + 4, mem_romType1Input)
                      + bit((index + 2) % 4 + 4, mem_romType1Input)
                      + bit((index + 3) % 4 + 4, mem_romType1Input) == 0)
}

function romType1LeaderboardQuestionSelect(totalQuestion, currentQuestion) {
    return prev(dword(mem_romType1PlaytimeCounter)) == 0x00000000 &&
                dword(mem_romType1PlaytimeCounter)  == 0xFFFFFFFF &&
                dword(mem_romType1Runtime) % totalQuestion == currentQuestion
}

function romType1LeaderboardCancel(series, episode) {
    return (dword(mem_romType1PlaytimeCounter) != 0xFFFFFFFF) ||
           (repeated(600, dword(mem_romType1PlaytimeCounter) == 0xFFFFFFFF &&
                          never(dword(mem_romType1EpisodePointer) == getEpisodePointer(series, episode) &&
                                dword(mem_romType1VideoPlaytime) == 0x00 &&
                                dword(mem_romType1VideoPlaytime) == prev(dword(mem_romType1VideoPlaytime))))) ||
           (dword(mem_romType1EpisodePointer) == getEpisodePointer(series, episode) &&
            dword(mem_romType1VideoPlaytime) == 0x00 &&
            dword(mem_romType1VideoPlaytime) < prev(dword(mem_romType1VideoPlaytime))) ||
           (bit0(mem_romType1Input + 0x01)
          + bit1(mem_romType1Input + 0x01) >= 1 &&
            bit(4, mem_romType1Input)
          + bit(5, mem_romType1Input)
          + bit(6, mem_romType1Input)
          + bit(7, mem_romType1Input) == 1)
}

//--------------------------------------------------
// Achievements

achievement(
    title = getAchievementTitle("SpongeBob SquarePants", "Bubblestand"), type = "progression",
    description = getAchievementDescription("SpongeBob SquarePants", "Bubblestand"),
    id = 93881, badge = "103410", points = 2,
    trigger = romType1VideoStarted("SpongeBob SquarePants", "Bubblestand") &&
              (romType1CorrectAnswer(4, 0, 4) ||
               romType1CorrectAnswer(4, 1, 5) ||
               romType1CorrectAnswer(4, 2, 6) ||
               romType1CorrectAnswer(4, 3, 5))
)
            leaderboard(
                 id = 7085,
                 title       = getQuestionTitle(0101), 
                 description = getQuestionDescription(0101),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Bubblestand") &&
                          romType1LeaderboardQuestionSelect(4, 0),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Bubblestand"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7086,
                 title       = getQuestionTitle(0102), 
                 description = getQuestionDescription(0102),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Bubblestand") &&
                          romType1LeaderboardQuestionSelect(4, 1),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Bubblestand"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7087,
                 title       = getQuestionTitle(0103), 
                 description = getQuestionDescription(0103),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Bubblestand") &&
                          romType1LeaderboardQuestionSelect(4, 2),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Bubblestand"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7082,
                 title       = getQuestionTitle(0104), 
                 description = getQuestionDescription(0104),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Bubblestand") &&
                          romType1LeaderboardQuestionSelect(4, 3),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Bubblestand"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            
achievement(
    title = getAchievementTitle("SpongeBob SquarePants", "Ripped Pants"), type = "progression",
    description = getAchievementDescription("SpongeBob SquarePants", "Ripped Pants"),
    id = 93982, badge = "103412", points = 2,
    trigger = romType1VideoStarted("SpongeBob SquarePants", "Ripped Pants") &&
              (romType1CorrectAnswer(4, 0, 4) ||
               romType1CorrectAnswer(4, 1, 7) ||
               romType1CorrectAnswer(4, 2, 7) ||
               romType1CorrectAnswer(4, 3, 5))
)
            leaderboard(
                 id = 7101,
                 title       = getQuestionTitle(0201), 
                 description = getQuestionDescription(0201),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Ripped Pants") &&
                          romType1LeaderboardQuestionSelect(4, 0),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Ripped Pants"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7098,
                 title       = getQuestionTitle(0202), 
                 description = getQuestionDescription(0202),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Ripped Pants") &&
                          romType1LeaderboardQuestionSelect(4, 1),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Ripped Pants"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7099,
                 title       = getQuestionTitle(0203), 
                 description = getQuestionDescription(0203),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Ripped Pants") &&
                          romType1LeaderboardQuestionSelect(4, 2),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Ripped Pants"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7100,
                 title       = getQuestionTitle(0204), 
                 description = getQuestionDescription(0204),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Ripped Pants") &&
                          romType1LeaderboardQuestionSelect(4, 3),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Ripped Pants"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            
achievement(
    title = getAchievementTitle("SpongeBob SquarePants", "Jellyfishing"), type = "progression",
    description = getAchievementDescription("SpongeBob SquarePants", "Jellyfishing"),
    id = 93987, badge = "103414", points = 2,
    trigger = romType1VideoStarted("SpongeBob SquarePants", "Jellyfishing") &&
              (romType1CorrectAnswer(4, 0, 5) ||
               romType1CorrectAnswer(4, 1, 7) ||
               romType1CorrectAnswer(4, 2, 6) ||
               romType1CorrectAnswer(4, 3, 7))
)
            leaderboard(
                 id = 7103,
                 title       = getQuestionTitle(0301), 
                 description = getQuestionDescription(0301),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Jellyfishing") &&
                          romType1LeaderboardQuestionSelect(4, 0),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Jellyfishing"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7104,
                 title       = getQuestionTitle(0302), 
                 description = getQuestionDescription(0302),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Jellyfishing") &&
                          romType1LeaderboardQuestionSelect(4, 1),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Jellyfishing"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7105,
                 title       = getQuestionTitle(0303), 
                 description = getQuestionDescription(0303),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Jellyfishing") &&
                          romType1LeaderboardQuestionSelect(4, 2),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Jellyfishing"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7102,
                 title       = getQuestionTitle(0304), 
                 description = getQuestionDescription(0304),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Jellyfishing") &&
                          romType1LeaderboardQuestionSelect(4, 3),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Jellyfishing"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            
achievement(
    title = getAchievementTitle("SpongeBob SquarePants", "Plankton!"), type = "progression",
    description = getAchievementDescription("SpongeBob SquarePants", "Plankton!"),
    id = 93988, badge = "103460", points = 2,
    trigger = romType1VideoStarted("SpongeBob SquarePants", "Plankton!") &&
              (romType1CorrectAnswer(4, 0, 7) ||
               romType1CorrectAnswer(4, 1, 4) ||
               romType1CorrectAnswer(4, 2, 7) ||
               romType1CorrectAnswer(4, 3, 6))
)
            leaderboard(
                 id = 7110,
                 title       = getQuestionTitle(0401), 
                 description = getQuestionDescription(0401),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Plankton!") &&
                          romType1LeaderboardQuestionSelect(4, 0),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Plankton!"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7107,
                 title       = getQuestionTitle(0402), 
                 description = getQuestionDescription(0402),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Plankton!") &&
                          romType1LeaderboardQuestionSelect(4, 1),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Plankton!"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7108,
                 title       = getQuestionTitle(0403), 
                 description = getQuestionDescription(0403),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Plankton!") &&
                          romType1LeaderboardQuestionSelect(4, 2),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Plankton!"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7109,
                 title       = getQuestionTitle(0404), 
                 description = getQuestionDescription(0404),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Plankton!") &&
                          romType1LeaderboardQuestionSelect(4, 3),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Plankton!"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )


