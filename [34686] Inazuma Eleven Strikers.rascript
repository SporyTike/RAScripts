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

function checkPlayerScoutabeFlag(characterID) {
    return bit((characterID + 27) % 8, mem_PlayerBuyableFlags + 0x03 - (((characterID + 27) / 8) % 4) + (((characterID + 27) / 32) * 4))
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
    return checkPlayerScoutabeFlag(0xB9)
         + checkPlayerScoutabeFlag(0xBA)
         + checkPlayerScoutabeFlag(0xBB)
         + checkPlayerScoutabeFlag(0xBC)
         + checkPlayerScoutabeFlag(0xBD)
         + checkPlayerScoutabeFlag(0xBE)
         + checkPlayerScoutabeFlag(0xBF)
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
    description = "Win against the Royal Academy in the 1st competition.",
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
    description = "Win against the Alius Academy in the 2nd competition.",
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
    description = "Win against the Girl's Team in the 4th competition.",
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

//--------------------------------------------------
// Leaderboards

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
                                  checkSubState(0x02, 0x14) ||
                                  checkSubState(0x02, 0x15) ||
                                  checkSubState(0x02, 0x16),
    "The Team is preparing itself for a Tournament Match [{0}]",
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
    "The Team is waiting in the Club Room for the next Match [⚡{0}] [🫂{1}/198] [🧑🏻‍💼{2}/4] [👧🏻{3}/4]",
        rich_presence_macro("Number",
                            getInazumaPoints()),
        rich_presence_macro("Number",
                            countPlayersScouted()),
        rich_presence_macro("Number",
                            countCoachesUnlocked()),
        rich_presence_macro("Number",
                            countManagersUnlocked())
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
    "The Team is waiting in the Club Room for the next Match [⚡{0}] [🫂{1}/198] [🧑🏻‍💼{2}/4] [👧🏻{3}/4]",
        rich_presence_macro("Number",
                            getInazumaPoints()),
        rich_presence_macro("Number",
                            countPlayersScouted()),
        rich_presence_macro("Number",
                            countCoachesUnlocked()),
        rich_presence_macro("Number",
                            countManagersUnlocked())
)
