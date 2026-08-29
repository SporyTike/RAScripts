// Unsupported Game Version (Gyakuten Saiban)
// #ID = 7760

//--------------------------------------------------
// Memory Addresses
mem_GameStateID         = 0x003734
mem_SubGameStateID      = 0x003735
mem_BackgroundID        = 0x003758
mem_LocationID          = 0x0037bc
mem_ChapterID           = 0x0037bd
mem_ExclamationMarks    = 0x0037bf
mem_TextboxXAxis        = 0x003a88
mem_TextboxYAxis        = 0x003a8a
mem_EventID             = 0x003a8e

//--------------------------------------------------
// Arrays and Dictionaries

ChapterData = {
    0x00: ["The First Turnabout",   "Day 1",    "Court"],
    0x01: ["Turnabout Sisters",     "Day 1",    "Investigation"],
    0x02: ["Turnabout Sisters",     "Day 2",    "Court"],
    0x03: ["Turnabout Sisters",     "Day 2",    "Investigation"],
    0x04: ["Turnabout Sisters",     "Day 3",    "Court"],
    0x05: ["Turnabout Samurai",     "Day 1",    "Investigation"],
    0x06: ["Turnabout Samurai",     "Day 2",    "Court"],
    0x07: ["Turnabout Samurai",     "Day 2",    "Investigation"],
    0x08: ["Turnabout Samurai",     "Day 3",    "Court"],
    0x09: ["Turnabout Samurai",     "Day 3",    "Investigation"],
    0x0A: ["Turnabout Samurai",     "Day 4",    "Court"],
    0x0B: ["Turnabout Goodbyes",    "Day 1",    "Investigation"],
    0x0C: ["Turnabout Goodbyes",    "Day 2",    "Court"],
    0x0D: ["Turnabout Goodbyes",    "Day 2",    "Investigation"],
    0x0E: ["Turnabout Goodbyes",    "Day 3",    "Court"],
    0x0F: ["Turnabout Goodbyes",    "Day 3",    "Investigation"],
    0x10: ["Turnabout Goodbyes",    "Day 4",    "Court"],
}

ChapterDataCase = {}
ChapterDataDay  = {}
ChapterDataType = {}

for Chapter in ChapterData {
    ChapterDataCase[Chapter] = ChapterData[Chapter][0]
    ChapterDataDay[Chapter]  = ChapterData[Chapter][1]
    ChapterDataType[Chapter] = ChapterData[Chapter][2]
}

LocationIDs = {
    0x00: "in the Fey & Co. Law Offices",
    0x01: "in the Fey & Co. Law Offices",
    0x02: "in the Detention Center",
    0x03: "in the Grossberg Law Office",
    0x04: "in Bluecorp",
    0x05: "in the Gatewater Hotel",
    0x06: "in the Wright & Co. Law Offices",
    0x07: "at the Studio Main Gate",
    0x08: "in the Studio Employee Area",
    0x09: "in the Studio Dressing Room",
    0x0A: "outside Studio One",
    0x0B: "inside Studio One",
    0x0C: "outside Studio Two",
    0x0D: "in the Studio Trailer",
    0x0E: "in the Criminal Affairs Department",
    0x0F: "in the Criminal Affairs Records Room",
    0x10: "at the Guard Lake Entrance",
    0x11: "at the Guard Lake Public Beach",
    0x12: "at the Guard Lake Woods",
    0x13: "at the Boat Rental Shop",
    0x14: "in the Caretaker's Shack",
}

//--------------------------------------------------
// Functions

function get_GameState() {
    return byte(mem_GameStateID)
}

function get_SubGameState() {
    return byte(mem_SubGameStateID)
}

function get_BackgroundID() {
    return word(mem_BackgroundID)
}

function get_LocationID() {
    return byte(mem_LocationID)
}

function get_ChapterID() {
    return byte(mem_ChapterID)
}

function get_ExclamationMarks() {
    return byte(mem_ExclamationMarks)
}

function get_EventID() {
    return word(mem_EventID)
}

function check_InTrial() {
    return get_GameState() >= 0x03 &&
           get_GameState() != 0x04 &&
           get_GameState() <= 0x09
}

function check_GotVerdict() {
    return get_GameState() == 0x09 &&
           get_SubGameState() == 0x03 &&
           prev(get_SubGameState()) < 0x03
}

function check_SpecialDialogue(currentEventID, previousEventID) {
    return __ornext(get_GameState() == 0x03 ||
                    get_GameState() == 0x07) &&
           trigger_when(get_EventID() == currentEventID) &&
           prev(get_EventID()) == previousEventID
}

function check_ChapterClear(ChapterID) {
    return __ornext(get_GameState() == 0x03 ||
                    get_GameState() == 0x0A ||
                    get_GameState() == 0x0B) &&
           get_ChapterID() == ChapterID + 1 &&
           prev(get_ChapterID()) == ChapterID
}

//--------------------------------------------------
// Achievements

achievement(
    title       = "When Something Smells, It's Usually the Butz", 
    points      = 10,
    type        = "missable",
    description = "Get the not guilty verdict in \"The First Turnabout\" without getting penalized by the judge.",
    id          = 61601, 
    badge       = "64704", 
    trigger     = check_InTrial() &&
                  get_ChapterID() == 0x00 &&
                  get_ExclamationMarks() == 5 &&
                  trigger_when(get_EventID() == 0xEA &&
                               check_GotVerdict())
)

achievement(
    title       = "Signs of Love", 
    points      = 5,
    type        = "missable",
    description = "At the end of \"The First Turnabout\", show Larry some evidence that proves Cindy's love.",
    id          = 61602, 
    badge       = "64705",
    trigger     = get_ChapterID() == 0x00 &&
                  check_SpecialDialogue(0xEF, 0xED)
)

achievement(
    title       = "Larry's First Turnabout", 
    points      = 5, 
    type        = "progression",
    description = "Finish the first episode \"The First Turnabout\".",
    id          = 61600, 
    badge       = "64703",
    trigger     = check_ChapterClear(0x00)
)

achievement(
    title       = "Red... White... Blue", 
    points      = 10, 
    type        = "progression",
    description = "Finish the investigation of the first day of \"Turnabout Sisters\".",
    id          = 61631, 
    badge       = "64735", 
    trigger     = check_ChapterClear(0x01)
)

achievement(
    title       = "My Friends Call Me Blanco Niño", 
    points      = 10, 
    type        = "progression",
    description = "Finish the investigation of the second day of \"Turnabout Sisters\".",
    id          = 61632, 
    badge       = "64739",
    trigger     = check_ChapterClear(0x03)
)

achievement(
    title       = "An Avengeful Turnabout", 
    points      = 10,
    type        = "missable",
    description = "Get the not guilty verdict in \"Turnabout Sisters\" without getting penalized by the judge.",
    id          = 61634, 
    badge       = "64704", 
    trigger     = check_InTrial() &&
                  get_ChapterID() == 0x04 &&
                  get_ExclamationMarks() == 5 &&
                  trigger_when(get_EventID() == 0xE6 &&
                               check_GotVerdict())
)

achievement(
    title       = "A Sisterly Turnabout", 
    points      = 25, 
    type        = "progression",
    description = "Finish the second episode \"Turnabout Sisters\".",
    id          = 61633, 
    badge       = "64703", 
    trigger     = check_ChapterClear(0x04)
)

achievement(
    title       = "Murder. At Least Once. Maybe Twice", 
    points      = 10, 
    type        = "progression",
    description = "Finish the investigation of the first day of \"Turnabout Samurai\".",
    id          = 61635, 
    badge       = "64758", 
    trigger     = check_ChapterClear(0x05)
)

achievement(
    title       = "TR1663R1N6 T3H CR34T1V3 P0W3RZ", 
    points      = 10, 
    type        = "progression",
    description = "Finish the investigation of the second day of \"Turnabout Samurai\".",
    id          = 61636, 
    badge       = "64759", 
    trigger     = check_ChapterClear(0x07)
)

achievement(
    title       = "I'm Watching the Clouds", 
    points      = 10, 
    type        = "progression",
    description = "Finish the investigation of the third day of \"Turnabout Samurai\".",
    id          = 61637, 
    badge       = "64761", 
    trigger     = check_ChapterClear(0x09)
)

achievement(
    title       = "A Battle of Wits", 
    points      = 10,
    type        = "missable",
    description = "Get the not guilty verdict in \"Turnabout Samurai\" without getting penalized by the judge.",
    id          = 61639, 
    badge       = "64704", 
    trigger     = check_InTrial() &&
                  get_ChapterID() == 0x0A &&
                  get_ExclamationMarks() == 5 &&
                  trigger_when(get_EventID() == 0xD9 &&
                               check_GotVerdict())
)

achievement(
    title       = "Kids Love the Steel Samurai", 
    points      = 5,
    type        = "missable",
    description = "At the end of \"Turnabout Samurai\", show Will some evidence that explains Jack's actions.",
    id          = 61647, 
    badge       = "64770", 
    trigger     = get_ChapterID() == 0x0A &&
                  check_SpecialDialogue(0xDD, 0xDB)
)

achievement(
    title       = "Call of the Samurai", 
    points      = 25, 
    type        = "progression",
    description = "Finish the third episode \"Turnabout Samurai\".",
    id          = 61638, 
    badge       = "64703", 
    trigger     = check_ChapterClear(0x0A)
)

achievement(
    title       = "So, You've Come to Laugh at the Fallen Attorney?", 
    points      = 10, 
    type        = "progression",
    description = "Finish the investigation of the first day of \"Turnabout Goodbyes\".",
    id          = 61640, 
    badge       = "64764", 
    trigger     = check_ChapterClear(0x0B)
)

achievement(
    title       = "Don't Forget DL-6!", 
    points      = 10, 
    type        = "progression",
    description = "Finish the investigation of the second day of \"Turnabout Goodbyes\".",
    id          = 61641, 
    badge       = "64763", 
    trigger     = check_ChapterClear(0x0D)
)

achievement(
    title       = "Uncovering the Scars of Christmas Past", 
    points      = 10,
    type        = "progression",
    description = "Finish the investigation of the third day of \"Turnabout Goodbyes\".",
    id          = 61642, 
    badge       = "64765", 
    trigger     = check_ChapterClear(0x0F)
)

achievement(
    title       = "Almost Christmas Means It Wasn't Christmas", 
    points      = 10,
    type        = "missable",
    description = "Get the second not guilty verdict in \"Turnabout Goodbyes\" without getting penalized by the judge.",
    id          = 61644, 
    badge       = "64704", 
    trigger     = check_InTrial() &&
                  get_ChapterID() == 0x10 &&
                  get_ExclamationMarks() == 5 &&
                  trigger_when(get_EventID() == 0xF0 &&
                               check_GotVerdict())
)

achievement(
    title       = "Ace Attorney and an Ace Medium", 
    points      = 5,
    type        = "missable",
    description = "At the end of \"The First Turnabout\", show Maya some evidence that explains how she helped solving the case.",
    id          = 61648, 
    badge       = "64769", 
    trigger     = get_ChapterID() == 0x10 &&
                  check_SpecialDialogue(0xF4, 0xF2)
)

achievement(
    title       = "A Goodbye for Now", 
    points      = 25, 
    type        = "progression",
    description = "Finish the fourth episode \"Turnabout Goodbyes\".",
    id          = 61643, 
    badge       = "64703", 
    trigger     = get_ChapterID() == 0x10 &&
                  get_EventID() == 0xF6 &&
                  prev(get_EventID()) == 0xF5
)

//--------------------------------------------------
// Rich Presence

rich_presence_conditional_display(get_GameState() <= 0x01,
    "In the Titlescreen"
)

rich_presence_conditional_display(get_GameState() == 0x0C ||
                                  get_GameState() == 0x0D,
    "In the Case Select"
)

rich_presence_conditional_display(any_of(array_filter(ChapterDataType, Chapter => ChapterDataType[Chapter] == "Court"), Chapter => get_ChapterID() == Chapter),
    "Phoenix Wright is in the District Court [❕{0}] [{1}] [{2}]",
        rich_presence_macro("Number",
                            get_ExclamationMarks()),
        rich_presence_lookup("ChapterIDToCase",
                             get_ChapterID(),
                             ChapterDataCase),
        rich_presence_lookup("ChapterIDToDay",
                             get_ChapterID(),
                             ChapterDataDay)
)

rich_presence_display(
    "Phoenix Wright is {3} [❕{0}] [{1}] [{2}]",
        rich_presence_macro("Number",
                            get_ExclamationMarks()),
        rich_presence_lookup("ChapterIDToCase",
                             get_ChapterID(),
                             ChapterDataCase),
        rich_presence_lookup("ChapterIDToDay",
                             get_ChapterID(),
                             ChapterDataDay),
        rich_presence_lookup("LocationID",
                             get_LocationID(),
                             LocationIDs)
)

