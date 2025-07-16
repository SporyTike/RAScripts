// ~Hack~ Smash Remix
// #ID = 15964

// ----------------------------------------------------------------------------------------------------
// Dynamic Addresses
Mem_Bonus12RecordData   = 0x4A2CA7
//               v1.5.2 - 0x48BCF0    
//               v1.1.0 - 0x45034C  
// Bonus 1 / Bonus 2 - Records (new Characters - Normal) [1600 Bytes; 32 Bytes per Character ID]
//  +16 | Bonus 1 - Record Time (32bit)
//  +23 | Bonus 1 - Target Record
//  +24 | Bonus 2 - Record Time (32bit)
//  +31 | Bonus 2 - Platform Record            
                        
Mem_RulesData           = 0x4617A8
//               v1.5.2 - 0x452888                        
//               v1.1.0 - 0x452880

Mem_HighscoreOn         = 0x4E79D0
//               v1.5.2 - 0x4C9BE0

Mem_BattleSetting       = 0x453748
//               v1.5.2 - 0x4462C8

Mem_GameMode            = 0x4E9C94
//               v1.5.2 - 0x4CBD04
//               v1.1.0 - 0x4752BC
// Game Mode
// 00 | 1P Game
// 01 | Race to the Finish
// 02 | Multi-Man Mode
// 03 | Cruel Multi-Man Mode
// 04 | 1P Remix
// 05 | All-Star Mode
// 06 | Home-Run Contest

Mem_12CharacterStocks   = 0x4F6D10
//               v1.5.2 - 0x4D7618
//               v1.1.0 - 0x47E91C
// 12-Character Battle - Set Stocks [32bit]

Mem_HomerunDistance     = 0x4F00A0
//               v1.5.2 - 0x4D1DB0
//               v1.1.0 - 0x479694
// Home-Run Contest - Distance (Graphic) [32bit]

Mem_FreeModeComboData   = 0x4E5360
//               v1.5.2 - 0x4C7780
//               v1.1.0 - 0x4715AC
// Free-for-All - 1P - Combo [16 Bytes]
//  +00 | Combo against 1P
//  +04 | Combo against 2P
//  +08 | Combo against 3P
//  +12 | Combo against 4P

Mem_PlayerTagStart      = 0x468D9F
//               v1.5.2 - 0x4590DB
// Array that stores Player Tags

Mem_GallerySounds       = 0x5139AC
// Gallery - Sound Mode [32bit]

Mem_SonicVariation      = 0x559F90
// Sonic Variation currently played by Player [4 Bytes; 8bit each]

Mem_KirbyHatOption      = 0x584160
//               v1.5.2 - 0x546178
// Option for Pre-Selected Kirby Hat [16 Bytes; 32bit each]

Mem_1PGameNewScores     = 0x4A2CA0
// 1P Game - Highscore Data - Master Hand [32 Bytes]

Mem_Remix1PScores       = 0x4A3750
// Remix 1P - Highscore Data - Mario [32 Bytes]

Mem_MultiManScores      = 0x4A5170
// Multi-Man Mode - Highscore Data - Mario [4 Bytes]

Mem_HomeRunScores       = 0x4A5650
// Home-Run Contest - Highscore Data - Mario [4 Bytes]

Val_WarioComplain       = 0x8053DE80
//               v1.5.2 - 0x8050E910
//               v1.1.0 - 0x8049BCE4
// Wario's Idle Animation [32bit]

// ----------------------------------------------------------------------------------------------------
// Static Addresses
Mem_CurrentMusicTrack   = 0x096710
Mem_VSRecordsOldChars   = 0x0A44E0
Mem_NormalModeData      = 0x0A4938
Mem_1PGameOldScores     = Mem_NormalModeData + 0x4
Mem_FreeModeData        = 0x0A4D0E
Mem_FreeModePlacement   = 0x139BB0
Mem_GameState           = 0x0A4AD3
Mem_PointerPlayerData   = 0x130D84
Mem_Bonus12Data         = 0x1313FF
Mem_ContinueState       = 0x13433C
Mem_TrainingSelectData  = 0x1385A0
Mem_NormalSelectData    = 0x138F08
Mem_MultiManKills       = 0x1936A0
Mem_World1_1Progress    = 0x1313E0
Mem_CameraData          = 0x131460

Mem_VSMode              = Mem_12CharacterStocks - 0x9F8
Mem_SmashketballData    = Mem_HomerunDistance + 0x12088

// ----------------------------------------------------------------------------------------------------

// ID, Name, New Character, Species
Characters = [
    [0x00, "Mario",                     false,  "Mario"],
    [0x01, "Fox",                       false,  "Fox"],
    [0x02, "Donkey Kong",               false,  "Donkey Kong"],
    [0x03, "Samus",                     false,  "Samus"],
    [0x04, "Luigi",                     false,  "Luigi"],
    [0x05, "Link",                      false,  "Link"],
    [0x06, "Yoshi",                     false,  "Yoshi"],
    [0x07, "Captain Falcon",            false,  "Captain Falcon"],
    [0x08, "Kirby",                     false,  "Kirby"],
    [0x09, "Pikachu",                   false,  "Pikachu"],
    [0x0A, "Jigglypuff",                false,  "Jigglypuff"],
    [0x0B, "Ness",                      false,  "Ness"],
    [0x0C, "Master Hand",               true,   "Master Hand"],
    [0x0D, "Metal Mario",               true,   "Metal Mario"],
    [0x0E, "Polygon Mario",             true,   "Polygon"],
    [0x0F, "Polygon Fox",               true,   "Polygon"],
    [0x10, "Polygon Donkey Kong",       true,   "Polygon"],
    [0x11, "Polygon Samus",             true,   "Polygon"],
    [0x12, "Polygon Luigi",             true,   "Polygon"],
    [0x13, "Polygon Link",              true,   "Polygon"],
    [0x14, "Polygon Yoshi",             true,   "Polygon"],
    [0x15, "Polygon Captain Falcon",    true,   "Polygon"],
    [0x16, "Polygon Kirby",             true,   "Polygon"],
    [0x17, "Polygon Pikachu",           true,   "Polygon"],
    [0x18, "Polygon Jigglypuff",        true,   "Polygon"],
    [0x19, "Polygon Ness",              true,   "Polygon"],
    [0x1A, "Giant Donkey Kong",         true,   "Giant Donkey Kong"],
    [0x1B, "",                          false,  ""],
    [0x1C, "",                          false,  ""],
    [0x1D, "Falco",                     true,   "Falco"],
    [0x1E, "Ganondorf",                 true,   "Ganondorf"],
    [0x1F, "Young Link",                true,   "Young Link"],
    [0x20, "Dr. Mario",                 true,   "Dr. Mario"],
    [0x21, "Wario",                     true,   "Wario"],
    [0x22, "Dark Samus",                true,   "Dark Samus"],
    [0x23, "EU Link",                   true,   "Link"],
    [0x24, "JP Samus",                  true,   "Samus"],
    [0x25, "JP Ness",                   true,   "Ness"],
    [0x26, "Lucas",                     true,   "Lucas"],
    [0x27, "JP Link",                   true,   "Link"],
    [0x28, "JP Captain Falcon",         true,   "Captain Falcon"],
    [0x29, "JP Fox",                    true,   "Fox"],
    [0x2A, "JP Mario",                  true,   "Mario"],
    [0x2B, "JP Luigi",                  true,   "Luigi"],
    [0x2C, "JP Donkey Kong",            true,   "Donkey Kong"],
    [0x2D, "EU Pikachu",                true,   "Pikachu"],
    [0x2E, "JP Jigglypuff",             true,   "Jigglypuff"],
    [0x2F, "EU Jigglypuff",             true,   "Jigglypuff"],
    [0x30, "JP Kirby",                  true,   "Kirby"],
    [0x31, "JP Yoshi",                  true,   "Yoshi"],
    [0x32, "JP Pikachu",                true,   "Pikachu"],
    [0x33, "EU Samus",                  true,   "Samus"],
    [0x34, "Bowser",                    true,   "Bowser"],
    [0x35, "Giga Bowser",               true,   "Giga Bowser"],
    [0x36, "Mad Piano",                 true,   "Mad Piano"],
    [0x37, "Wolf",                      true,   "Wolf"],
    [0x38, "Conker",                    true,   "Conker"],
    [0x39, "Mewtwo",                    true,   "Mewtwo"],
    [0x3A, "Marth",                     true,   "Marth"],
    [0x3B, "Sonic",                     true,   "Sonic"],
    [0x3C, "Sandbag",                   true,   "Sandbag"],
    [0x3D, "Super Sonic",               true,   "Super Sonic"],
    [0x3E, "Sheik",                     true,   "Sheik"],
    [0x3F, "Marina",                    true,   "Marina"],
    [0x40, "King Dedede",               true,   "King Dedede"],
    [0x41, "Goemon",                    true,   "Goemon"],
    [0x42, "Peppy",                     true,   "Peppy"],
    [0x43, "Slippy",                    true,   "Slippy"],
    [0x44, "Banjo & Kazooie",           true,   "Banjo & Kazooie"],
    [0x45, "Metal Luigi",               true,   "Metal Luigi"],
    [0x46, "Ebisumaru",                 true,   "Ebisumaru"],
    [0x47, "Dragon King",               true,   "Dragon King"],
    [0x48, "Crash",                     true,   "Crash"],
    [0x49, "Peach",                     true,   "Peach"],
    [0x4A, "Roy",                       true,   "Roy"],
    [0x4B, "Dr. Luigi",                 true,   "Dr. Luigi"],
    [0x4C, "Lanky Kong",                true,   "Lanky Kong"],
    [0x4D, "Polygon Wario",             true,   "Polygon"],
    [0x4E, "Polygon Lucas",             true,   "Polygon"],
    [0x4F, "Polygon Bowser",            true,   "Polygon"],
    [0x50, "Polygon Wolf",              true,   "Polygon"],
    [0x51, "Polygon Dr. Mario",         true,   "Polygon"],
    [0x52, "Polygon Sonic",             true,   "Polygon"],
    [0x53, "Polygon Sheik",             true,   "Polygon"],
    [0x54, "Polygon Marina",            true,   "Polygon"],
    [0x55, "Polygon Falco",             true,   "Polygon"],
    [0x56, "Polygon Ganondorf",         true,   "Polygon"],
    [0x57, "Polygon Dark Samus",        true,   "Polygon"],
    [0x58, "Polygon Marth",             true,   "Polygon"],
    [0x59, "Polygon Mewtwo",            true,   "Polygon"],
    [0x5A, "Polygon King Dedede",       true,   "Polygon"],
    [0x5B, "Polygon Young Link",        true,   "Polygon"],
    [0x5C, "Polygon Goemon",            true,   "Polygon"],
    [0x5D, "Polygon Conker",            true,   "Polygon"],
    [0x5E, "Polygon Banjo & Kazooie",   true,   "Polygon"],
    [0x5F, "Polygon Peach",             true,   "Polygon"],
    [0x60, "Polygon Crash",             true,   "Polygon"],
]

function GetCharID(name) {
    for character in Characters {
        if(character[1] == name) {
            return character[0]
        }
    }
}

// ID, Name
Stages = [
    [0x00, "Peach's Castle"],
    [0x01, "Sector Z"],
    [0x02, "Congo Jungle"],
    [0x03, "Planet Zebes"],
    [0x04, "Hyrule Castle"],
    [0x05, "Yoshi's Island"],
    [0x06, "Dream Land"],
    [0x07, "Saffron City"],
    [0x08, "Mushroom Kingdom"],
    [0x09, "Dream Land Beta 1"],
    [0x0A, "Dream Land Beta 2"],
    [0x0B, "How to Play"],
    [0x0C, "Mini Yoshi's Island"],
    [0x0D, "Meta Crystal"],
    [0x0E, "Duel Zone"],
    [0x0F, "Racing to the Normal Finish"],
    [0x10, "Final Destination"],
    [0x11, "Breaking the Targets of Mario and Metal Mario"],
    [0x12, "Breaking the Targets of Fox and Peppy"],
    [0x13, "Breaking the Targets of Donkey Kong and Lanky Kong"],
    [0x14, "Breaking the Targets of Samus"],
    [0x15, "Breaking the Targets of Luigi and Metal Luigi"],
    [0x16, "Breaking the Targets of Link"],
    [0x17, "Breaking the Targets of Yoshi"],
    [0x18, "Breaking the Targets of Captain Falcon and Dragon King"],
    [0x19, "Breaking the Targets of Kirby"],
    [0x1A, "Breaking the Targets of Pikachu"],
    [0x1B, "Breaking the Targets of Jigglypuff"],
    [0x1C, "Breaking the Targets of Ness"],
    [0x1D, "Boarding the Platforms of Mario and Metal Mario"],
    [0x1E, "Boarding the Platforms of Fox and Peppy"],
    [0x1F, "Boarding the Platforms of Donkey Kong and Lanky Kong"],
    [0x20, "Boarding the Platforms of Samus"],
    [0x21, "Boarding the Platforms of Luigi and Metal Luigi"],
    [0x22, "Boarding the Platforms of Link"],
    [0x23, "Boarding the Platforms of Yoshi"],
    [0x24, "Boarding the Platforms of Captain Falcon and Dragon King"],
    [0x25, "Boarding the Platforms of Kirby"],
    [0x26, "Boarding the Platforms of Pikachu"],
    [0x27, "Boarding the Platforms of Jigglypuff"],
    [0x28, "Boarding the Platforms of Ness"],
    [0x29, "Deku Tree"],
    [0x2A, "First Destination"],
    [0x2B, "Ganon's Tower"],
    [0x2C, "Gym Leader Castle"],
    [0x2D, "Pokemon Stadium"],
    [0x2E, "Tal Tal Heights"],
    [0x2F, "Glacial River"],
    [0x30, "WarioWare, Inc."],
    [0x31, "Battlefield"],
    [0x32, "Flat Zone"],
    [0x33, "Dr. Mario"],
    [0x34, "Cool Cool Mountain"],
    [0x35, "Dragon King"],
    [0x36, "Great Bay"],
    [0x37, "Fray's Stage"],
    [0x38, "Tower of Heaven"],
    [0x39, "Fountain of Dreams"],
    [0x3A, "Muda Kingdom"],
    [0x3B, "Mementos"],
    [0x3C, "Showdown"],
    [0x3D, "Spiral Mountain"],
    [0x3E, "N64"],
    [0x3F, "Mute City DL"],
    [0x40, "Mad Monster Mansion"],
    [0x41, "Mushroom Kingdom DL"],
    [0x42, "Mushroom Kingdom Ω"],
    [0x43, "Bowser's Stadium"],
    [0x44, "Peach's Castle II"],
    [0x45, "Delfino Plaza"],
    [0x46, "Corneria"],
    [0x47, "Kitchen Island"],
    [0x48, "Big Blue"],
    [0x49, "Onett"],
    [0x4A, "Crateria"],
    [0x4B, "Frosty Village"],
    [0x4C, "Smashville"],
    [0x4D, "Breaking the Targets of Dr. Mario and Dr. Luigi"],
    [0x4E, "Breaking the Targets of Ganondorf"],
    [0x4F, "Breaking the Targets of Young Link"],
    [0x50, "Battlefield DL"],
    [0x51, "Breaking the Targets of Dark Samus"],
    [0x52, "Breaking the Targets of Polygon Team and Mad Piano"],
    [0x53, "Breaking the Targets of Falco and Slippy"],
    [0x54, "Breaking the Targets of Wario"],
    [0x55, "Hyrule Temple"],
    [0x56, "Breaking the Targets of Lucas"],
    [0x57, "Boarding the Platforms of Ganondorf"],
    [0x58, "New Pork City"],
    [0x59, "Boarding the Platforms of Dark Samus"],
    [0x5A, "Smashketball"],
    [0x5B, "Boarding the Platforms of Dr. Mario and Dr. Luigi"],
    [0x5C, "Norfair"],
    [0x5D, "Raid Blue"],
    [0x5E, "Congo Falls"],
    [0x5F, "Pigmask Fortress"],
    [0x60, "Yoshi's Story"],
    [0x61, "World 1-1"],
    [0x62, "Flat Zone II"],
    [0x63, "Gerudo Valley"],
    [0x64, "Boarding the Platforms of Young Link"],
    [0x65, "Boarding the Platforms of Falco and Slippy"],
    [0x66, "Boarding the Platforms of Polygon Team and Mad Piano"],
    [0x67, "Hyrule Castle DL"],
    [0x68, "Hyrule Castle Ω"],
    [0x69, "Congo Jungle DL"],
    [0x6A, "Congo Jungle Ω"],
    [0x6B, "Peach's Castle DL"],
    [0x6C, "Peach's Castle Ω"],
    [0x6D, "Boarding the Platforms of Wario"],
    [0x6E, "Fray's Stage - Night"],
    [0x6F, "Goomba Road"],
    [0x70, "Boarding the Platforms of Lucas"],
    [0x71, "Sector Z DL"],
    [0x72, "Saffron City DL"],
    [0x73, "Yoshi's Island DL"],
    [0x74, "Planet Zebes DL"],
    [0x75, "Sector Z Ω"],
    [0x76, "Saffron City Ω"],
    [0x77, "Yoshi's Island Ω"],
    [0x78, "Dream Land Ω"],
    [0x79, "Planet Zebes Ω"],
    [0x7A, "Breaking the Targets of Bowser and Giga Bowser"],
    [0x7B, "Boarding the Platforms of Bowser and Giga Bowser"],
    [0x7C, "Bowser's Keep"],
    [0x7D, "Rith Essa"],
    [0x7E, "Venom"],
    [0x7F, "Breaking the Targets of Wolf"],
    [0x80, "Boarding the Platforms of Wolf"],
    [0x81, "Breaking the Targets of Conker"],
    [0x82, "Boarding the Platforms of Conker"],
    [0x83, "Windy"],
    [0x84, "dataDyne Central"],
    [0x85, "Planet Clancer"],
    [0x86, "Jungle Japes"],
    [0x87, "Breaking the Targets of Marth and Roy"],
    [0x88, "Game Boy Land"],
    [0x89, "Breaking the Targets of Mewtwo"],
    [0x8A, "Boarding the Platforms of Marth and Roy"],
    [0x8B, "All-Star Lobby"],
    [0x8C, "Boarding the Platforms of Mewtwo"],
    [0x8D, "Castle Siege"],
    [0x8E, "Yoshi's Island II"],
    [0x8F, "Final Destination DL"],
    [0x90, "Final Tentination"],
    [0x91, "Cool Cool Mountain SR"],
    [0x92, "Duel Zone DL"],
    [0x93, "Cool Cool Mountain DL"],
    [0x94, "Meta Crystal DL"],
    [0x95, "Dream Greens"],
    [0x96, "Peach's Castle Beta"],
    [0x97, "Hyrule Castle SR"],
    [0x98, "Sector Z SR"],
    [0x99, "Mute City"],
    [0x9A, "Home-Run Contest"],
    [0x9B, "Mushroom Kingdom SR"],
    [0x9C, "Green Hill Zone"],
    [0x9D, "Subcon"],
    [0x9E, "Pirate Land"],
    [0x9F, "Casino Night Zone"],
    [0xA0, "Breaking the Targets of Sonic and Super Sonic"],
    [0xA1, "Boarding the Platforms of Sonic and Super Sonic"],
    [0xA2, "Metallic Madness"],
    [0xA3, "Rainbow Road"],
    [0xA4, "Pokemon Stadium 2"],
    [0xA5, "Norfair Remix"],
    [0xA6, "Toad's Turnpike"],
    [0xA7, "Tal Tal Heights Remix"],
    [0xA8, "Boarding the Platforms of Sheik"],
    [0xA9, "Winter Dream Land"],
    [0xAA, "Breaking the Targets of Sheik"],
    [0xAB, "Glacial River Remix"],
    [0xAC, "Breaking the Targets of Marina"],
    [0xAD, "Dragon King Remix"],
    [0xAE, "Boarding the Platforms of Marina"],
    [0xAF, "Breaking the Targets of King Dedede"],
    [0xB0, "Dracula's Castle"],
    [0xB1, "Reverse Castle"],
    [0xB2, "Boarding the Platforms of King Dedede"],
    [0xB3, "Mt. Dedede"],
    [0xB4, "Edo Town"],
    [0xB5, "Deku Tree DL"],
    [0xB6, "Crateria DL"],
    [0xB7, "Breaking the Targets of Goemon and Ebisumaru"],
    [0xB8, "First Destination Remix"],
    [0xB9, "Boarding the Platforms of Goemon and Ebisumaru"],
    [0xBA, "Twilight City"],
    [0xBB, "Melrode"],
    [0xBC, "Meta Crystent"],
    [0xBD, "Racing to the Remix Finish"],
    [0xBE, "Grim Reaper's Cavern"],
    [0xBF, "Scuttle Town"],
    [0xC0, "Big Boo's Haunt"],
    [0xC1, "Dinosaur Land"],
    [0xC2, "Breaking the Targets of Banjo & Kazooie"],
    [0xC3, "Spawned Fear"],
    [0xC4, "Smashville Remix"],
    [0xC5, "Boarding the Platforms of Banjo & Kazooie"],
    [0xC6, "Poke Floats"],
    [0xC7, "Big Snowman"],
    [0xC8, "Dream Land Beta DL"],
    [0xC9, "LMAO Castle"],
    [0xCA, "Discovery Falls"],
    [0xCB, "Breaking the Targets of Crash"],
    [0xCC, "Discovery Falls Remix"],
    [0xCD, "N64 Remix"],
    [0xCE, "Boarding the Platforms of Crash"],
    [0xCF, "Breaking the Targets of Peach"],
    [0xD0, "Breaking the Targets of Peach"],
    [0xD1, "Smashketball 2"],
    [0xD2, "Time Twister"],
    [0xD3, "Time Twister"],
    [0xD4, "N. Sanity Beach"],
    [0xD5, "Snow Go"],
    [0xD6, "Future Frenzy"],
]

function GetStageID(name) {
    for stage in Stages {
        if(stage[1] == name) {
            return stage[0]
        }
    }
}

// ID, Character Ability, New Ability
KirbyAbility = [
    [GetCharID("Mario"),            "Mario",            false],
    [GetCharID("Fox"),              "Fox",              false],
    [GetCharID("Donkey Kong"),      "Donkey Kong",      false],
    [GetCharID("Samus"),            "Samus",            false],
    [GetCharID("Luigi"),            "Luigi",            false],
    [GetCharID("Link"),             "Link",             false],
    [GetCharID("Yoshi"),            "Yoshi",            false],
    [GetCharID("Captain Falcon"),   "Captain Falcon",   false],
    [GetCharID("Pikachu"),          "Pikachu",          false],
    [GetCharID("Jigglypuff"),       "Jigglypuff",       false],
    [GetCharID("Ness"),             "Ness",             false],
    [GetCharID("Falco"),            "Falco",            true],
    [GetCharID("Ganondorf"),        "Ganondorf",        true],
    [GetCharID("Young Link"),       "Young Link",       true],
    [GetCharID("Dr. Mario"),        "Dr. Mario",        true],
    [GetCharID("Wario"),            "Wario",            true],
    [GetCharID("Bowser"),           "Bowser",           true],
    [GetCharID("Wolf"),             "Wolf",             true],
    [GetCharID("Conker"),           "Conker",           true],
    [GetCharID("Mewtwo"),           "Mewtwo",           true],
    [GetCharID("Marth"),            "Marth",            true],
    [GetCharID("Sonic"),            "Sonic",            true],
    [GetCharID("Sheik"),            "Sheik",            true],
    [GetCharID("Marina"),           "Marina",           true],
    [GetCharID("King Dedede"),      "King Dedede",      true],
    [GetCharID("Goemon"),           "Goemon",           true],
    [GetCharID("Banjo & Kazooie"),  "Banjo & Kazooie",  true],
    [GetCharID("Crash"),            "Crash",            true],
    [GetCharID("Peach"),            "Peach",            true],
    [GetCharID("Dark Samus"),       "Dark Samus",       true],
    [GetCharID("Lucas"),            "Lucas",            true],
    [GetCharID("Peppy"),            "Peppy",            true],
    [GetCharID("Slippy"),           "Slippy",           true],
    [GetCharID("Roy"),              "Roy",              true],
    [GetCharID("Dr. Luigi"),        "Dr. Luigi",        true],
    [GetCharID("Lanky Kong"),       "Lanky Kong",       true],
    [GetCharID("Dragon King"),      "Dragon King",      true],
    [GetCharID("Ebisumaru"),        "Ebisumaru",        true],
    [GetCharID("Mad Piano"),        "Mad Piano",        true],
    [0x1C,                          "???",              true],
]

// Stage ID, Bonus 1 Map, Bonus 2 Map, Stage Character 1, Stage Character 2
BonusStages = [
    [1,  0x11, 0x1D, "Mario",           "Metal Mario"],
    [2,  0x12, 0x1E, "Fox",             "Peppy"],
    [3,  0x13, 0x1F, "Donkey Kong",     "Lanky Kong"],
    [4,  0x14, 0x20, "Samus",           ""],
    [5,  0x15, 0x21, "Luigi",           "Metal Luigi"],
    [6,  0x16, 0x22, "Link",            ""],
    [7,  0x17, 0x23, "Yoshi",           ""],
    [8,  0x18, 0x24, "Captain Falcon",  "Dragon King"],
    [9,  0x19, 0x25, "Kirby",           ""],
    [10, 0x1A, 0x26, "Pikachu",         ""],
    [11, 0x1B, 0x27, "Jigglypuff",      ""],
    [12, 0x1C, 0x28, "Ness",            ""],
    [13, 0x4D, 0x5B, "Dr. Mario",       "Dr. Luigi"],
    [14, 0x4E, 0x57, "Ganondorf",       ""],
    [15, 0x4F, 0x64, "Young Link",      ""],
    [16, 0x51, 0x59, "Dark Samus",      ""],
    [17, 0x52, 0x66, "Polygon Team",    "Mad Piano"],
    [18, 0x53, 0x65, "Falco",           "Slippy"],
    [19, 0x54, 0x6D, "Wario",           ""],
    [20, 0x56, 0x70, "Lucas",           ""],
    [21, 0x7A, 0x7B, "Bowser",          "Giga Bowser"],
    [22, 0x7F, 0x80, "Wolf",            ""],
    [23, 0x81, 0x82, "Conker",          ""],
    [24, 0x87, 0x8A, "Marth",           "Roy"],
    [25, 0x89, 0x8C, "Mewtwo",          ""],
    [26, 0xA0, 0xA1, "Sonic",           "Super Sonic"],
    [27, 0xAA, 0xA8, "Sheik",           ""],
    [28, 0xAC, 0xAE, "Marina",          ""],
    [29, 0xAF, 0xB2, "King Dedede",     ""],
    [30, 0xB7, 0xB9, "Goemon",          "Ebisumaru"],
    [31, 0xC2, 0xC5, "Banjo & Kazooie", ""],
    [32, 0xCB, 0xCE, "Crash",           ""],
    [33, 0xCF, 0xD0, "Peach",           ""],
]

// Track ID, Track Name
MusicTracks = [
    [0x16F, "Crash Bash Loading Screen"]
]

function GetTrackID(name) {
    for track in MusicTracks {
        if(track[1] == name) {
            return track[0]
        }
    }
}

// ----------------------------------------------------------------------------------------------------
// 1P Game, Remix Mode, All-Star Mode
function NormalModeStocks() => byte(Mem_NormalModeData)
// 1P Game / Remix Mode - Start Stocks [8bit]
// --- 00 | 1 Stock
// --- 01 | 2 Stocks
// --- 02 | 3 Stocks
// --- 03 | 4 Stocks
// --- 04 | 5 Stocks

function NormalModeDifficulty() => byte(Mem_NormalModeData + 1)
// 1P Game / Remix Mode - Difficulty [8bit]
// --- 00 | Very Easy
// --- 01 | Easy
// --- 02 | Normal
// --- 03 | Hard
// --- 04 | Very Hard

function NormalModeProgress() => byte(Mem_NormalModeData + 428)
// 1P Game / Remix Mode - Progress [8bit]

function NormalModeChar1() => byte(Mem_NormalModeData + 431)
// 1P Game / Remix Mode - Character ID [8bit]
function NormalModeChar1Stocks() => byte(Mem_NormalModeData + 520)
// 1P Game / Remix Mode - Player 1 - Stocks in Reserve [8bit]
function NormalModeChar1Percentage() => word(Mem_NormalModeData + 588)
// 1P Game / Remix Mode - Player 1 - Percentage [16bit]

function NormalModeScore() => dword(Mem_NormalModeData + 440)
// 1P Game / Remix 1P / All-Star Mode - Total Score [32bit]

function NormalModeStage() => byte(Mem_NormalModeData + 482)
// 1P Game / Remix Mode / Bonus 3 - Stage ID [8bit]

// ----------------------------------------------------------------------------------------------------
// Free-for-all

function FreeModeStage() => byte(Mem_FreeModeData - 0x04)
// Free-for-all - Stage ID [8bit]

function FreeModeNumFighters() => byte(Mem_FreeModeData)
// Free-for-all - Number of Fighters in Battle [8bit]

function FreeModeTimer() => dword(Mem_FreeModeData + 14)
// Free-for-all - Battle Timer [32bit]

function FreeModeChar1() => byte(Mem_FreeModeData + 26)
// Free-for-all - Player 1 - Character ID [8bit]
function FreeModeChar1CPU() => byte(Mem_FreeModeData + 29)
// Free-for-all - Player 1 - CPU Level [8bit]
function FreeModeChar1Stocks() => byte(Mem_FreeModeData + 34)
// Free-for-all - Player 1 - Stocks in Reserve [8bit]
function FreeModeChar1Control() => byte(Mem_FreeModeData + 35)
// Free-for-all - Player 1 - Player controlling [8bit]
// --- 0 | Player 1
// --- 1 | Player 2
// --- 2 | Player 3
// --- 3 | Player 4
// --- 4 | COM

function FreeModeChar2() => byte(Mem_FreeModeData + 142)
// Free-for-all - Player 2 - Character ID [8bit]
function FreeModeChar2CPU() => byte(Mem_FreeModeData + 145)
// Free-for-all - Player 2 - CPU Level [8bit]
function FreeModeChar2Stocks() => byte(Mem_FreeModeData + 150)
// Free-for-all - Player 2 - Stocks in Reserve [8bit]
function FreeModeChar2Control() => byte(Mem_FreeModeData +151)
// Free-for-all - Player 2 - Player controlling [8bit]
// --- 0 | Player 1
// --- 1 | Player 2
// --- 2 | Player 3
// --- 3 | Player 4
// --- 4 | COM

function FreeModeChar3() => byte(Mem_FreeModeData + 258)
// Free-for-all - Player 3 - Character ID [8bit]
function FreeModeChar3CPU() => byte(Mem_FreeModeData + 261)
// Free-for-all - Player 3 - CPU Level [8bit]
function FreeModeChar3Stocks() => byte(Mem_FreeModeData + 266)
// Free-for-all - Player 3 - Stocks in Reserve [8bit]
function FreeModeChar3Control() => byte(Mem_FreeModeData +267)
// Free-for-all - Player 3 - Player controlling [8bit]
// --- 0 | Player 1
// --- 1 | Player 2
// --- 2 | Player 3
// --- 3 | Player 4
// --- 4 | COM

function FreeModeChar4() => byte(Mem_FreeModeData + 374)
// Free-for-all - Player 4 - Character ID [8bit]
function FreeModeChar4CPU() => byte(Mem_FreeModeData + 377)
// Free-for-all - Player 4 - CPU Level [8bit]
function FreeModeChar4Stocks() => byte(Mem_FreeModeData + 382)
// Free-for-all - Player 4 - Stocks in Reserve [8bit]
function FreeModeChar4Control() => byte(Mem_FreeModeData +383)
// Free-for-all - Player 4 - Player controlling [8bit]
// --- 0 | Player 1
// --- 1 | Player 2
// --- 2 | Player 3
// --- 3 | Player 4
// --- 4 | COM

function FreeModeCombo(char, enemy) {
    address = dword(Mem_FreeModeComboData + ((char - 1)*0x38 + ((enemy - 1)*0x04)))

    return byte(Mem_FreeModeData + 35 + ((char - 1)*0x74)) != 0x04 &&
           byte(Mem_FreeModeData + 35 + ((enemy - 1)*0x74)) == 0x04 &&
           address >= 15 &&
           address <= 17 &&
           prev(address) >= 12 &&
           prev(address) <= 14
}

// ----------------------------------------------------------------------------------------------------
// Bonus 1, Bonus 2, Bonus 3
function Bonus1RecordsOldChars(id) => byte(Mem_NormalModeData + 4 + 23 + id*32)
// Records - Bonus 1 / Bonus 2 - Original Characters [384 Bytes; 32 Bytes per Character ID]
// --- +16 | Bonus 1 - Record Time [32bit]
// --- +23 | Bonus 1 - Targets Record [8bit]
// --- +24 | Bonus 2 - Record Time [32bit]
// --- +31 | Bonus 2 - Platform Record [8bit]

function Bonus1RecordsNewChars(id) => byte(Mem_Bonus12RecordData + 23 + (id - GetCharID("Master Hand"))*32)

function Bonus1Records() {
    totalSum = []
    for character in Characters {
        if(character[0] != GetCharID("Master Hand") && character[1] != "") {
            if(character[2] == false) {
                array_push(totalSum, Bonus1RecordsOldChars(character[0]))
            }
            if(character[2] == true) {
                array_push(totalSum, Bonus1RecordsNewChars(character[0]))
            }
        }
    }   
    total = length(totalSum)
    mems = sum_of(totalSum, sum => sum/10)
    deltas = sum_of(totalSum, sum => prev(sum)/10)

    return measured(mems == total) && deltas == (total - 1)
}

function Bonus2RecordsOldChars(id) => byte(Mem_NormalModeData + 4 + 31 + id*32)

function Bonus2RecordsNewChars(id) => byte(Mem_Bonus12RecordData + 31 + (id - GetCharID("Master Hand"))*32)

function Bonus2Records() {
    totalSum = []
    for character in Characters {
        if(character[0] != GetCharID("Master Hand") && character[1] != "") {
            if(character[2] == false) {
                array_push(totalSum, Bonus2RecordsOldChars(character[0]))
            }
            if(character[2] == true) {
                array_push(totalSum, Bonus2RecordsNewChars(character[0]))
            }
        }
    }   
    total = length(totalSum)
    mems = sum_of(totalSum, sum => sum/10)
    deltas = sum_of(totalSum, sum => prev(sum)/10)

    return measured(mems == total) && deltas == (total - 1)
}

function Bonus1Targets() => byte(Mem_Bonus12Data)
// Bonus 1 - Targets left [8bit]

function Bonus2Platforms() => byte(Mem_Bonus12Data + 4)
// Bonus 2 - Platforms left [8bit]

function Bonus3State() => byte(Mem_NormalModeData + 498)
// Bonus 3 - Game State [8bit]
// --- 00 | Not started
// --- 01 | In Race
// --- 05 | Finished
// --- 06 | Finished 2
// --- 07 | Left

function Bonus12Char() => byte(0x18F1D0)
// Bonus 1 / Bonus 2 - Player 1 - Character ID [8bit]

function Bonus12Stage() => byte(0x18F1B2)
// Bonus 1 / Bonus 2 - Stage ID [8bit]

function Bonus12State() => byte(0x18F1C2)
// Bonus 1 / Bonus 2 - State ID [8bit]

function Bonus12Timer() => dword(0x18F1C8)
// Bonus 1 / Bonus 2 - Timer [32bit]

function Bonus3Timer() => dword(Mem_NormalModeData + 504)
// Bonus 3 - Timer [32bit]

// ----------------------------------------------------------------------------------------------------
// Training Mode
function TrainingModeStage() => byte(Mem_GameState + 9)
// Training Mode - Stage ID [8bit]

function TrainingModeChar1() => byte(Mem_GameState + 53)
// Training Mode - Player 1 - Character ID [8bit]

function TrainingModeChar2() => byte(Mem_GameState + 59)
// Training Mode - Player 2 - Character ID [8bit]

function TrainingSelectChar1() => byte(Mem_TrainingSelectData)
// Training Mode - Character Select - Player 1 - Character ID [8bit]
function TrainingSelectChar1Confirm() => byte(Mem_TrainingSelectData + 12)
// Training Mode - Character Select - Player 1 - Character confirmed [8bit]

function TrainingSelectChar2() => byte(Mem_TrainingSelectData + 184)
// Training Mode - Character Select - Player 2 - Character ID [8bit]
function TrainingSelectChar2Confirm() => byte(Mem_TrainingSelectData + 196)
// Training Mode - Character Select - Player 2 - Character confirmed [8bit]

function HomerunChar() => byte(Mem_NormalModeData + 512)
// 1P Game / Remix Mode / Home-Run Contest - Player 1 - Character ID [8bit]

// ----------------------------------------------------------------------------------------------------
// Misc.
function GameState() => byte(Mem_GameState)
// Current Game State [8bit]
// --- 01 | Titlescreen / In Battle
// --- 03 | Debug Menu
// --- 07 | Mode Select
// --- 08 | 1P Game Mode - Menu
// --- 09 | VS Game Mode - Menu
// --- 0E | VS Screen (1P Game/Smash Remix)
// --- 10 | Free-for-all - Character Select
// --- 11 | 1 Player Game / Remix 1P / All-Star Mode - Character Select
// --- 12 | Training Mode - Character Select
// --- 13 | Bonus 1 - Character Select
// --- 14 | Bonus 2 / Bonus 3 / Multi-Man Mode / Cruel Multi-Man Mode / Home-Run Contest - Character Select
// --- 19 | VS Record
// --- 1B | N64 Logo
// --- 1C | Intro
// --- 37 | Smash Remix Disclaimer
// --- 38 | Credits
// --- 39 | Option / Settings
// --- 3A | Data
// --- 3B | Sound Test
// --- 3C | How to Play
// --- 3D | Battle Demo

function PreGameState() => byte(Mem_GameState - 1)
// Previous Game State [8bit]

function BothGameStates() => word(Mem_GameState -1)
// Previous Game State [8bit] + Current Game State [8bit]

function GameMode() => bit0(Mem_GameState + 565)
// Game Mode [8bit]
// --- Bit0 | Data
// ------ 0 | Free-for-all
// ------ 1 | 12-Character Battle

function PointerPlayerData() => tbyte(Mem_PointerPlayerData)
// Pointer - Player Data [24bit]
//  +0x08   | Player 1 - Character ID [8bit]
//  +0x10   | Player 1 - CPU Level [8bit]
//  +0x20   | Player 1 - CPU controls [8bit]
//  +0x24   | Player 1 - Animation ID [16bit]
//  +0x2C   | Player 1 - Percentage [8bit]
//  +0x86C  | Player 1 - Wario's Idle Animation [32bit]
//  +0xADC  | Player 1 - Kirby's Ability [8bit]
//  +0xB58  | Player 2 - Character ID [8bit]
//  +0xB60  | Player 2 - CPU Level [8bit]
//  +0xB70  | Player 2 - CPU controls [8bit]
//  +0xB74  | Player 2 - Animation ID [16bit]
//  +0xB7C  | Player 2 - Percentage [8bit]
//  +0x13BC | Player 2 - Wario's Idle Animation [32bit]
//  +0x162C | Player 2 - Kirby's Ability [8bit]
//  +0x16A8 | Player 3 - Character ID [8bit]
//  +0x16B0 | Player 3 - CPU Level [8bit]
//  +0x16C0 | Player 3 - CPU controls [8bit]
//  +0x16C4 | Player 3 - Animation ID [16bit]
//  +0x16CC | Player 3 - Percentage [8bit]
//  +0x1F0C | Player 3 - Wario's Idle Animation [32bit]
//  +0x217C | Player 3 - Kirby's Ability [8bit]
//  +0x21F8 | Player 4 - Character ID [8bit]
//  +0x2200 | Player 4 - CPU Level [8bit]
//  +0x2210 | Player 4 - CPU controls [8bit]
//  +0x2214 | Player 4 - Animation ID [16bit]
//  +0x221C | Player 4 - Percentage  [8bit]
//  +0x2A5C | Player 4 - Wario's Idle Animation [32bit]
//  +0x2CCC | Player 4 - Kirby's Ability [8bit]

function PointerChar1() => byte(PointerPlayerData() + 0x08)
// Player 1 - Character ID [8bit] from Player Data Pointer
function PointerChar1Ani() => word(PointerPlayerData() + 0x24)
// Player 1 - Animation ID [16bit] from Player Data Pointer
function PointerChar1Wario() => dword(PointerPlayerData() + 0x86C)
// Player 1 - Wario's Idle Animation [32bit] from Player Data Pointer
function PointerChar1Kirby() => byte(PointerPlayerData() + 0xADC)
// Player 1 - Kirby's Ability [8bit] from Player Data Pointer

function PointerChar2() => byte(PointerPlayerData() + 0xB58)
// Player 2 - Character ID [8bit] from Player Data Pointer
function PointerChar2Ani() => word(PointerPlayerData() + 0xB74)
// Player 2 - Animation ID [16bit] from Player Data Pointer
function PointerChar2Wario() => dword(PointerPlayerData() + 0x13BC)
// Player 2 - Wario's Idle Animation [32bit] from Player Data Pointer
function PointerChar2Kirby() => byte(PointerPlayerData() + 0x162C)
// Player 2 - Kirby's Ability [8bit] from Player Data Pointer

function PointerChar3() => byte(PointerPlayerData() + 0x16A8)
// Player 3 - Character ID [8bit] from Player Data Pointer
function PointerChar3Ani() => word(PointerPlayerData() + 0x16C4)
// Player 3 - Animation ID [16bit] from Player Data Pointer
function PointerChar3Wario() => dword(PointerPlayerData() + 0x1F0C)
// Player 3 - Wario's Idle Animation [32bit] from Player Data Pointer
function PointerChar3Kirby() => byte(PointerPlayerData() + 0x217C)
// Player 3 - Kirby's Ability [8bit] from Player Data Pointer

function PointerChar4() => byte(PointerPlayerData() + 0x21F8)
// Player 4 - Character ID [8bit] from Player Data Pointer
function PointerChar4Ani() => word(PointerPlayerData() + 0x2214)
// Player 4 - Animation ID [16bit] from Player Data Pointer
function PointerChar4Wario() => dword(PointerPlayerData() + 0x2A5C)
// Player 4 - Wario's Idle Animation [32bit] from Player Data Pointer
function PointerChar4Kirby() => byte(PointerPlayerData() + 0x2CCC)
// Player 4 - Kirby's Ability [8bit] from Player Data Pointer

// ----------------------------------------------------------------------------------------------------
// Logic Functions

function Beat1PNormal() {
    return never(NormalModeDifficulty() < 2) && 
    never(NormalModeDifficulty() > 4) && 
    never(BothGameStates() == 0x1B1B) &&
    never(BothGameStates() == 0x1B34) &&
    never(BothGameStates() == 0x0834) &&
    once(GameState() == 0x0E &&
        NormalModeProgress() == 0) &&
    trigger_when(prev(NormalModeProgress()) == 0x0D 
        && NormalModeProgress() == 0x0E) &&
    never(byte(Mem_GameMode) != 0x00) &&
    never(dword(Mem_HighscoreOn)  == 0x00)
}

function Beat1PNormalNoContinues() {
    return Beat1PNormal() &&
    never(NormalModeChar1Stocks() == 0xFF)
}

function BeatRemix1PNormal() {
    return never(NormalModeDifficulty() < 2) && 
    never(NormalModeDifficulty() > 4) && 
    never(BothGameStates() == 0x1B1B) &&
    never(BothGameStates() == 0x1B34) &&
    never(BothGameStates() == 0x0834) &&
    once(GameState() == 0x0E &&
        NormalModeProgress() == 0) &&
    trigger_when(prev(NormalModeProgress()) == 0x0D 
        && NormalModeProgress() == 0x0E) &&
    never(byte(Mem_GameMode) != 0x04) &&
    never(dword(Mem_HighscoreOn)  == 0x00)
}

function BeatRemix1PVeryHard() {
    return never(NormalModeDifficulty() != 4) && 
           BeatRemix1PNormal()
}

function BeatRemix1PVeryHard3Stocks() {
    return BeatRemix1PVeryHard() &&
    never(NormalModeStocks() > 2) &&
    never(dword(Mem_HighscoreOn)  == 0x00)
}

function BeatAllstarsNormal() {
    return never(NormalModeDifficulty() < 2) && 
    never(NormalModeDifficulty() > 4) && 
    never(BothGameStates() == 0x1B1B) &&
    never(BothGameStates() == 0x1B34) &&
    never(BothGameStates() == 0x0834) &&
    once(NormalModeStage() == 0x8B &&
        byte(Mem_GameMode + 20) == 0 &&
        BothGameStates() == 0x770E) &&
    trigger_when(prev(GameState()) >= 0x33 &&
        prev(GameState()) <= 0x34 &&
        GameState() == 0x30) &&
    never(byte(Mem_GameMode) != 0x05) &&
    never(dword(Mem_HighscoreOn)  == 0x00)
}

function BeatAllstarsVeryHard() {
    return never(NormalModeDifficulty() != 4) && 
    BeatAllstarsNormal()
}

function BeatAllstarsVeryHard3Stocks() {
    return BeatAllstarsVeryHard() &&
    never(NormalModeStocks() > 2) &&
    never(dword(Mem_HighscoreOn)  == 0x00)
}

function Beat12CharacterBattle() {
    player12Chars = []
    com12Chars = []
    i = 0
    for index in range(1, 23) {
        array_push(player12Chars, bit7(Mem_12CharacterStocks + 0x05 + i*8))
        array_push(com12Chars, bit7(Mem_12CharacterStocks +0xD9 + i*8))
        i = i + 1
    }  
    player12Loses = sum_of(player12Chars, p => p)
    com12LosesM = sum_of(com12Chars, m => m)
    com12LosesD = sum_of(com12Chars, d => prev(d)) 
    return never(byte(Mem_VSMode) != 1) &&
           never(prev(byte(Mem_GameState) == 0x15) && 
           byte(Mem_GameState) == 0x16 &&
           FreeModeChar1Control() == 4) &&
           never(prev(byte(Mem_GameState) == 0x15) && 
           byte(Mem_GameState) == 0x16 &&
           FreeModeChar2Control() != 4) &&
           never(prev(byte(Mem_GameState) == 0x15) && 
           byte(Mem_GameState) == 0x16 &&
           FreeModeChar2CPU() < 5) &&
           never(BothGameStates() == 0x1B1B) &&
           never(GameState() == 0x09) &&
           never(player12Loses == 12) &&
           trigger_when(com12LosesM == 12) &&
           trigger_when(com12LosesD == 11) &&
           ResetCheating(0) &&
           ResetCheating(1)
}

function Beat12CharacterBattleCPU5() {
    return once(FreeModeChar2CPU() >= 0x05 &&
              prev(byte(Mem_12CharacterStocks + 0x07) == 0x1C) &&
              byte(Mem_12CharacterStocks + 0x07) != 0x1C &&
              prev(byte(Mem_12CharacterStocks + 0xDB) == 0x1C) &&
              byte(Mem_12CharacterStocks + 0xDB) != 0x1C) &&
           Beat12CharacterBattle() &&
           never(prev(byte(Mem_GameState) == 0x15) && 
              byte(Mem_GameState) == 0x16 &&
              FreeModeChar2CPU() < 5)
}

function Beat12CharacterBattleCPU9() {
    return once(FreeModeChar2CPU() >= 0x09 &&
              prev(byte(Mem_12CharacterStocks + 0x07) == 0x1C) &&
              byte(Mem_12CharacterStocks + 0x07) != 0x1C &&
              prev(byte(Mem_12CharacterStocks + 0xDB) == 0x1C) &&
              byte(Mem_12CharacterStocks + 0xDB) != 0x1C) &&
           Beat12CharacterBattle() &&
           never(prev(byte(Mem_GameState) == 0x15) && 
              byte(Mem_GameState) == 0x16 &&
              FreeModeChar2CPU() < 9)
}

function Beat1COM(stage, char1, char2, slot) {
    player1IDs = []
    player2IDs = []
    control = [0, 0]
    control[slot] = 1
    
    for id in Characters {
        if(id[3] == char1) {
            array_push(player1IDs, id[0])
        }
        if(id[3] == char2) {
            array_push(player2IDs, id[0])
        }
    }
    
    player1Code = any_of(player1IDs, id => (byte(PointerPlayerData() + 0x08 + 0xB50*(1-control[0])) == id))
    player2Code = any_of(player2IDs, id => (byte(PointerPlayerData() + 0x08 + 0xB50*(1-control[1])) == id))

    return never(GameState() != 0x16 &&
                 GameState() != 0x18) &&
           never(byte(Mem_VSMode) != 0) &&
           never(FreeModeNumFighters() != 1) &&
           never(FreeModeStage() != GetStageID(stage)) && 
           once(player1Code &&
           byte(PointerPlayerData() + 0x20 + 0xB50*(1-control[0])) != 1) &&
           trigger_when(byte(Mem_FreeModePlacement) == 1-control[0]) &&
           once(player2Code &&
           byte(PointerPlayerData() + 0x20 + 0xB50*(1-control[1])) == 1) &&
           trigger_when(byte(Mem_FreeModePlacement + 4) == 1-control[1]) &&
           once(GameState() == 0x16 &&
           byte(PointerPlayerData() + 0x10 + 0xB50*(1-slot)) >= 9) &&
           trigger_when(GameState() == 0x18 &&
           byte(PointerPlayerData() + 0x24 + 0xB50*slot) != 0x00) &&
           NoCheatingNoHat(0) &&
           NoCheatingNoHat(1) &&
           NoCheatingNoHat(2) &&
           NoCheatingNoHat(3)
}

function Beat1COMKirbyRandom(slot) {
    playerIDs = []
    control = [0, 0]
    control[slot] = 1
    
    for id in Characters {
        if (id[3] == "Kirby") {
            array_push(playerIDs, id[0])
        }
    }
    
    playerCode= any_of(playerIDs, id => (byte(PointerPlayerData() + 0x08 + 0xB50*(1-control[0])) == id))

    return never(GameState() != 0x16 &&
                 GameState() != 0x18) &&
           never(byte(Mem_VSMode) != 0) &&
           never(FreeModeNumFighters() != 1) &&
           never(FreeModeStage() != GetStageID("Casino Night Zone")) &&
           once(playerCode &&
           byte(PointerPlayerData() + 0xADC + 0xB50*(1-control[0])) == 0x1C &&
           byte(PointerPlayerData() + 0x20 + 0xB50*(1-control[0])) != 1) &&
           trigger_when(byte(Mem_FreeModePlacement) == 1-control[0]) &&
           once(byte(PointerPlayerData() + 0x20 + 0xB50*(1-control[1])) == 1) &&
           trigger_when(byte(Mem_FreeModePlacement + 4) == 1-control[1]) &&
           once(GameState() == 0x16 &&
           byte(PointerPlayerData() + 0x10 + 0xB50*(1-slot)) >= 9) &&
           trigger_when(GameState() == 0x18 &&
           byte(PointerPlayerData() + 0x24 + 0xB50*slot) != 0x00) &&
           NoCheating(0) &&
           NoCheating(1) &&
           NoCheating(2) &&
           NoCheating(3)
}

function Beat1COMLevel10(slot) {
    control = [0, 0]
    control[slot] = 1

    return never(GameState() != 0x16 &&
                 GameState() != 0x18) &&
           never(byte(Mem_VSMode) != 0) &&
           never(FreeModeNumFighters() != 1) &&
           once(byte(PointerPlayerData() + 0x20 + 0xB50*(1-control[0])) != 1) &&
           trigger_when(byte(Mem_FreeModePlacement) == 1-control[0]) &&
           once(byte(PointerPlayerData() + 0x20 + 0xB50*(1-control[1])) == 1) &&
           trigger_when(byte(Mem_FreeModePlacement + 4) == 1-control[1]) &&
           once(GameState() == 0x16 &&
           byte(PointerPlayerData() + 0x10 + 0xB50*(1-slot)) == 10) &&
           trigger_when(GameState() == 0x18 &&
           byte(PointerPlayerData() + 0x24 + 0xB50*slot) != 0x00) &&
           NoCheatingNoHat(0) &&
           NoCheatingNoHat(1) &&
           NoCheatingNoHat(2) &&
           NoCheatingNoHat(3)
}

function Beat4COMs(stage, char1, char2, char3, char4, slot) {
    player1IDs = []
    player2IDs = []
    player3IDs = []
    player4IDs = []
    control = [1, 1, 1, 1]
    control[slot] = 0
    
    for id in Characters {
        if(id[3] == char1) {
            array_push(player1IDs, id[0])
        }
        if(id[3] == char2) {
            array_push(player2IDs, id[0])
        }
        if(id[3] == char3) {
            array_push(player3IDs, id[0])
        }
        if(id[3] == char4) {
            array_push(player4IDs, id[0])
        }
    }
    
    char1Code = tally(1, (byte(PointerPlayerData() + 0x08 + 0xB50*0) == GetCharID(char1)) ||
                                              (byte(PointerPlayerData() + 0x08 + 0xB50*1) == GetCharID(char1)) ||
                                              (byte(PointerPlayerData() + 0x08 + 0xB50*2) == GetCharID(char1)) ||
                                              (byte(PointerPlayerData() + 0x08 + 0xB50*3) == GetCharID(char1)))
    char2Code = tally(1, (byte(PointerPlayerData() + 0x08 + 0xB50*0) == GetCharID(char2)) ||
                                              (byte(PointerPlayerData() + 0x08 + 0xB50*1) == GetCharID(char2)) ||
                                              (byte(PointerPlayerData() + 0x08 + 0xB50*2) == GetCharID(char2)) ||
                                              (byte(PointerPlayerData() + 0x08 + 0xB50*3) == GetCharID(char2)))
    char3Code = tally(1, (byte(PointerPlayerData() + 0x08 + 0xB50*0) == GetCharID(char3)) ||
                                              (byte(PointerPlayerData() + 0x08 + 0xB50*1) == GetCharID(char3)) ||
                                              (byte(PointerPlayerData() + 0x08 + 0xB50*2) == GetCharID(char3)) ||
                                              (byte(PointerPlayerData() + 0x08 + 0xB50*3) == GetCharID(char3)))
    char4Code = tally(1, (byte(PointerPlayerData() + 0x08 + 0xB50*0) == GetCharID(char4)) ||
                                              (byte(PointerPlayerData() + 0x08 + 0xB50*1) == GetCharID(char4)) ||
                                              (byte(PointerPlayerData() + 0x08 + 0xB50*2) == GetCharID(char4)) ||
                                              (byte(PointerPlayerData() + 0x08 + 0xB50*3) == GetCharID(char4)))
                                            
    return never(GameState() != 0x16 &&
                 GameState() != 0x18) &&
           never(byte(Mem_VSMode) != 0) &&
           never(FreeModeNumFighters() != 3) &&
           never(FreeModeStage() != GetStageID(stage)) && 
           char1Code &&
           char2Code &&
           char3Code &&
           char4Code &&
           tally(3, once(GameState() == 0x16 &&
                            bit0(PointerPlayerData() + 0x20 + 0xB50*0) == 1 &&
                            byte(PointerPlayerData() + 0x10 + 0xB50*0) >= 9),
                    once(GameState() == 0x16 &&
                            bit0(PointerPlayerData() + 0x20 + 0xB50*1) == 1 &&
                            byte(PointerPlayerData() + 0x10 + 0xB50*1) >= 9),
                    once(GameState() == 0x16 &&
                            bit0(PointerPlayerData() + 0x20 + 0xB50*2) == 1 &&
                            byte(PointerPlayerData() + 0x10 + 0xB50*2) >= 9),
                    once(GameState() == 0x16 &&
                            bit0(PointerPlayerData() + 0x20 + 0xB50*3) == 1 &&
                            byte(PointerPlayerData() + 0x10 + 0xB50*3) >= 9)) &&
           trigger_when(GameState() == 0x18) &&
           once(GameState() == 0x16 &&
           (bit0(PointerPlayerData() + 0x20 + 0xB50*0) +
           bit0(PointerPlayerData() + 0x20 + 0xB50*1) +
           bit0(PointerPlayerData() + 0x20 + 0xB50*2) + 
           bit0(PointerPlayerData() + 0x20 + 0xB50*3) == 3 &&
           bit0(PointerPlayerData() + 0x20 + 0xB50*slot) == 0)) &&
           trigger_when(byte(Mem_FreeModePlacement + slot*4) == 0) &&
           trigger_when(byte(PointerPlayerData() + 0x24 + 0xB50*slot) != 0x00) &&
           trigger_when((byte(Mem_FreeModePlacement + 0) / byte(Mem_FreeModePlacement + 0) 
           + byte(Mem_FreeModePlacement + 4) / byte(Mem_FreeModePlacement + 4)
           + byte(Mem_FreeModePlacement + 8) / byte(Mem_FreeModePlacement + 8)
           + byte(Mem_FreeModePlacement + 12) / byte(Mem_FreeModePlacement + 12)) == 3) &&
           NoCheatingNoHat(0) &&
           NoCheatingNoHat(1) &&
           NoCheatingNoHat(2) &&
           NoCheatingNoHat(3)
}

function Beat4COMsSame(char, slot, stage1, stage2) {
    player1IDs = []
    player2IDs = []
    player3IDs = []
    player4IDs = []
    control = [1, 1, 1, 1]
    control[slot] = 0
    
    for id in Characters {
        if(id[3] == char) {
            array_push(player1IDs, id[0])
        }
        if(id[3] == char) {
            array_push(player2IDs, id[0])
        }
        if(id[3] == char) {
            array_push(player3IDs, id[0])
        }
        if(id[3] == char) {
            array_push(player4IDs, id[0])
        }
    }
    
    char1Code = tally_of(player1IDs, 1, id => (byte(PointerPlayerData() + 0x08 + 0xB50*0) == id))
    char2Code = tally_of(player2IDs, 1, id => (byte(PointerPlayerData() + 0x08 + 0xB50*1) == id))
    char3Code = tally_of(player3IDs, 1, id => (byte(PointerPlayerData() + 0x08 + 0xB50*2) == id))
    char4Code = tally_of(player4IDs, 1, id => (byte(PointerPlayerData() + 0x08 + 0xB50*3) == id))
                                            
    return never(GameState() != 0x16 &&
                 GameState() != 0x18) &&
           never(byte(Mem_VSMode) != 0) &&
           never(FreeModeNumFighters() != 3) &&
           never(FreeModeStage() != GetStageID(stage1) &&
               FreeModeStage() != GetStageID(stage2)) && 
           char1Code &&
           char2Code &&
           char3Code &&
           char4Code &&
           tally(3, once(GameState() == 0x16 &&
                            bit0(PointerPlayerData() + 0x20 + 0xB50*0) == 1 &&
                            byte(PointerPlayerData() + 0x10 + 0xB50*0) >= 9),
                    once(GameState() == 0x16 &&
                            bit0(PointerPlayerData() + 0x20 + 0xB50*1) == 1 &&
                            byte(PointerPlayerData() + 0x10 + 0xB50*1) >= 9),
                    once(GameState() == 0x16 &&
                            bit0(PointerPlayerData() + 0x20 + 0xB50*2) == 1 &&
                            byte(PointerPlayerData() + 0x10 + 0xB50*2) >= 9),
                    once(GameState() == 0x16 &&
                            bit0(PointerPlayerData() + 0x20 + 0xB50*3) == 1 &&
                            byte(PointerPlayerData() + 0x10 + 0xB50*3) >= 9)) &&
           trigger_when(GameState() == 0x18) &&
           once(GameState() == 0x16 &&
           (bit0(PointerPlayerData() + 0x20 + 0xB50*0) +
           bit0(PointerPlayerData() + 0x20 + 0xB50*1) +
           bit0(PointerPlayerData() + 0x20 + 0xB50*2) + 
           bit0(PointerPlayerData() + 0x20 + 0xB50*3) == 3 &&
           bit0(PointerPlayerData() + 0x20 + 0xB50*slot) == 0)) &&
           trigger_when(byte(Mem_FreeModePlacement + slot*4) == 0) &&
           trigger_when(byte(PointerPlayerData() + 0x24 + 0xB50*slot) != 0x00) &&
           trigger_when((byte(Mem_FreeModePlacement + 0) / byte(Mem_FreeModePlacement + 0) 
           + byte(Mem_FreeModePlacement + 4) / byte(Mem_FreeModePlacement + 4)
           + byte(Mem_FreeModePlacement + 8) / byte(Mem_FreeModePlacement + 8)
           + byte(Mem_FreeModePlacement + 12) / byte(Mem_FreeModePlacement + 12)) == 3) &&
           NoCheatingNoHat(0) &&
           NoCheatingNoHat(1) &&
           NoCheatingNoHat(2) &&
           NoCheatingNoHat(3)
}

function BeatSmashketball(mode, slot) {
    playerIDs = []
    control = [0, 0]
    control[slot] = 1
    
    
    playerCode= any_of(playerIDs, id => (byte(PointerPlayerData() + 0x08 + 0xB50*(1-control[0])) == id))

    return never(GameState() != 0x16 &&
                 GameState() != 0x18) &&
           never(byte(Mem_VSMode) != 4) &&
           never(FreeModeNumFighters() != 1) &&
           never(byte(Mem_SmashketballData + 0x73) 
               + byte(Mem_SmashketballData + 0x72)
               + byte(Mem_SmashketballData + 0x71)
               + byte(Mem_SmashketballData + 0x70) != 2) &&
           once(GameState() == 0x16 &&
                byte(PointerPlayerData() + 0x20 + 0xB50*(1-control[0])) != 1) &&
           trigger_when(byte(Mem_FreeModePlacement + 4*0)
                      + byte(Mem_FreeModePlacement + 4*1)
                      + byte(Mem_FreeModePlacement + 4*2) 
                      + byte(Mem_FreeModePlacement + 4*3) == 1) &&
           once(GameState() == 0x16 &&
           byte(PointerPlayerData() + 0x10 + 0xB50*(1-slot)) >= 9) &&
           trigger_when(GameState() == 0x18 &&
           byte(PointerPlayerData() + 0x24 + 0xB50*slot) != 0x00) && 
           NoCheatingNoHat(0) &&
           NoCheatingNoHat(1)
}

function BeatSmashketball5Points(mode, slot) {
    playerIDs = []
    control = [0, 0]
    control[slot] = 1
    
    if (mode == "Basketball") {
        SmashketballMode = 0
    } else if (mode == "Soccer") {
        SmashketballMode = 1
    }

    return BeatSmashketball(mode, slot) &&
           never(byte(Mem_SmashketballData) != SmashketballMode) &&
           trigger_when(once(dword(byte(PointerPlayerData() + 0xF + 0xB50*(1-control[0]))*4 + Mem_SmashketballData + 0x50)
                           - dword(byte(PointerPlayerData() + 0xF + 0xB50*(1-control[1]))*4 + Mem_SmashketballData + 0x50) >= 5 &&
                             dword(byte(PointerPlayerData() + 0xF + 0xB50*(1-control[0]))*4 + Mem_SmashketballData + 0x50)
                           - dword(byte(PointerPlayerData() + 0xF + 0xB50*(1-control[1]))*4 + Mem_SmashketballData + 0x50) <= 0x80000000 &&
                             byte(Mem_FreeModeData + 0x0C) == 0x06))
}

function BeatSmashketballCOM0(mode, slot) {
    playerIDs = []
    control = [0, 0]
    control[slot] = 1

    return BeatSmashketball(mode, slot) &&
           trigger_when(once(dword(byte(PointerPlayerData() + 0xF + 0xB50*(1-control[0]))*4 + Mem_SmashketballData + 0x50) >= 1 &&
                             dword(byte(PointerPlayerData() + 0xF + 0xB50*(1-control[1]))*4 + Mem_SmashketballData + 0x50) == 0 &&
                             byte(Mem_FreeModeData + 0x0C) == 0x06)) &&
           once(GameState() == 0x16 &&
                byte(Mem_FreeModeData + 0x0C) == 0x00) &&
           never(prev(dword(byte(PointerPlayerData() + 0xF + 0xB50*(1-control[0]))*4 + Mem_SmashketballData + 0x50)) == 0 &&
                      dword(byte(PointerPlayerData() + 0xF + 0xB50*(1-control[0]))*4 + Mem_SmashketballData + 0x50) == 1 &&
                      byte(PointerPlayerData() + 0x20 + 0xB50*(1-control[0])) != 0)
}

function BeatTagTeam(slot) {
    playerIDs = []
    control = [0, 0]
    control[slot] = 1
    
    playerCode= any_of(playerIDs, id => (byte(PointerPlayerData() + 0x08 + 0xB50*(1-control[0])) == id))

    return never(GameState() != 0x16 &&
                 GameState() != 0x18) &&
           never(byte(Mem_VSMode) != 2) &&
           never(FreeModeNumFighters() != 1) &&
           once(GameState() == 0x16 && 
                byte(PointerPlayerData() + 0x20 + 0xB50*(1-control[0])) != 1) &&
           trigger_when(byte(Mem_FreeModePlacement) == 1-control[0]) &&
           trigger_when(byte(Mem_FreeModePlacement + 4) == 1-control[1]) &&
           once(GameState() == 0x16 &&
                byte(PointerPlayerData() + 0x10 + 0xB50*(1-slot)) >= 5) &&
                trigger_when(GameState() == 0x18 &&
           byte(PointerPlayerData() + 0x24 + 0xB50*slot) != 0x00) &&
           byte(Mem_12CharacterStocks + 0x4E70 + 0x60 + 0x3 - byte(PointerPlayerData() + 0xE + 0xB50*(1-control[0]))) == 0x5 &&
           never(GameState() == 0x16 &&
                byte(byte(PointerPlayerData() + 0xE + 0xB50*(1-control[0]))*24 + Mem_12CharacterStocks + 0x4E70 + 0x3 +0x4*0) != 0x1B) &&
           never(GameState() == 0x16 &&
                byte(byte(PointerPlayerData() + 0xE + 0xB50*(1-control[0]))*24 + Mem_12CharacterStocks + 0x4E70 + 0x3 +0x4*1) != 0x1B) &&
           never(GameState() == 0x16 &&
                byte(byte(PointerPlayerData() + 0xE + 0xB50*(1-control[0]))*24 + Mem_12CharacterStocks + 0x4E70 + 0x3 +0x4*2) != 0x1B) &&
           never(GameState() == 0x16 &&
                byte(byte(PointerPlayerData() + 0xE + 0xB50*(1-control[0]))*24 + Mem_12CharacterStocks + 0x4E70 + 0x3 +0x4*3) != 0x1B) &&
           never(GameState() == 0x16 &&
                byte(byte(PointerPlayerData() + 0xE + 0xB50*(1-control[0]))*24 + Mem_12CharacterStocks + 0x4E70 + 0x3 +0x4*4) != 0x1B) &&
           never(GameState() == 0x16 &&
                byte(byte(PointerPlayerData() + 0xE + 0xB50*(1-control[0]))*24 + Mem_12CharacterStocks + 0x4E70 + 0x3 +0x4*5) != 0x1B) &&
           never(GameState() == 0x16 &&
                byte(byte(PointerPlayerData() + 0xE + 0xB50*(1-control[1]))*24 + Mem_12CharacterStocks + 0x4E70 + 0x3 +0x4*0) != 0x1B) &&
           never(GameState() == 0x16 &&
                byte(byte(PointerPlayerData() + 0xE + 0xB50*(1-control[1]))*24 + Mem_12CharacterStocks + 0x4E70 + 0x3 +0x4*1) != 0x1B) &&
           never(GameState() == 0x16 &&
                byte(byte(PointerPlayerData() + 0xE + 0xB50*(1-control[1]))*24 + Mem_12CharacterStocks + 0x4E70 + 0x3 +0x4*2) != 0x1B) &&
           never(GameState() == 0x16 &&
                byte(byte(PointerPlayerData() + 0xE + 0xB50*(1-control[1]))*24 + Mem_12CharacterStocks + 0x4E70 + 0x3 +0x4*3) != 0x1B) &&
           never(GameState() == 0x16 &&
                byte(byte(PointerPlayerData() + 0xE + 0xB50*(1-control[1]))*24 + Mem_12CharacterStocks + 0x4E70 + 0x3 +0x4*4) != 0x1B) &&
           never(GameState() == 0x16 &&
                byte(byte(PointerPlayerData() + 0xE + 0xB50*(1-control[1]))*24 + Mem_12CharacterStocks + 0x4E70 + 0x3 +0x4*5) != 0x1B) &&
           NoCheatingNoHat(0) &&
           NoCheatingNoHat(1)
}

function BeatKingOfTheHill(slot) {
    player1IDs = []
    player2IDs = []
    player3IDs = []
    player4IDs = []
    control = [1, 1, 1, 1]
    control[slot] = 0
                                            
    return never(GameState() != 0x16 &&
                 GameState() != 0x18) &&
           never(byte(Mem_VSMode) != 3) &&
           never(FreeModeNumFighters() != 3) &&
           tally(3, once(GameState() == 0x16 &&
                            bit0(PointerPlayerData() + 0x20 + 0xB50*0) == 1 &&
                            byte(PointerPlayerData() + 0x10 + 0xB50*0) >= 5),
                    once(GameState() == 0x16 &&
                            bit0(PointerPlayerData() + 0x20 + 0xB50*1) == 1 &&
                            byte(PointerPlayerData() + 0x10 + 0xB50*1) >= 5),
                    once(GameState() == 0x16 &&
                            bit0(PointerPlayerData() + 0x20 + 0xB50*2) == 1 &&
                            byte(PointerPlayerData() + 0x10 + 0xB50*2) >= 5),
                    once(GameState() == 0x16 &&
                            bit0(PointerPlayerData() + 0x20 + 0xB50*3) == 1 &&
                            byte(PointerPlayerData() + 0x10 + 0xB50*3) >= 5)) &&
           trigger_when(GameState() == 0x18) &&
           once(GameState() == 0x16 &&
           (bit0(PointerPlayerData() + 0x20 + 0xB50*0) +
           bit0(PointerPlayerData() + 0x20 + 0xB50*1) +
           bit0(PointerPlayerData() + 0x20 + 0xB50*2) + 
           bit0(PointerPlayerData() + 0x20 + 0xB50*3) == 3 &&
           bit0(PointerPlayerData() + 0x20 + 0xB50*slot) == 0)) &&
           trigger_when(byte(Mem_FreeModePlacement + slot*4) == 0) &&
           trigger_when(byte(PointerPlayerData() + 0x24 + 0xB50*slot) != 0x00) &&
           trigger_when((byte(Mem_FreeModePlacement + 0) / byte(Mem_FreeModePlacement + 0) 
           + byte(Mem_FreeModePlacement + 4) / byte(Mem_FreeModePlacement + 4)
           + byte(Mem_FreeModePlacement + 8) / byte(Mem_FreeModePlacement + 8)
           + byte(Mem_FreeModePlacement + 12) / byte(Mem_FreeModePlacement + 12)) == 3) &&
           NoCheatingNoHat(0) &&
           NoCheatingNoHat(1) &&
           NoCheatingNoHat(2) &&
           NoCheatingNoHat(3)
}

function PlayingBonus1(address) {
    code = always_false()

    for stage in BonusStages {
        code = code || byte(address) == stage[1]
    }
    
    return code
}

function BeatAllBonus(bonusIndex) {
    code = 0
    totalStages = length(Characters) - 4 // Do not count 0x0C (Master Hand), 0x1B, 0x1C and 0x3C (Sandbag)
    
    loop = 0
    for char in Characters {
        if (char[0] != 0x0C && char[0] != 0x1B && char[0] != 0x1C && char[0] != 0x3C) {
            if(loop <= GetCharID("Ness")) {
                code = code + byte(Mem_1PGameOldScores + 23 + bonusIndex*8 + (loop - 0x00)*32) / 10
            } else {
                code = code + byte(Mem_1PGameNewScores + 23 + bonusIndex*8 + (loop - 0x0C)*32) / 10
            }
        }
        loop = loop + 1
    }
    
    return BothGameStates() != 0x1B1B &&
           BothGameStates() != 0x800D &&
           measured(code == totalStages) &&
               prev(code) == totalStages - 1
}

// ----- Old Logic for beating all with one Character -----
// function BeatAllBonus1WithSingleChar() {
//     stageClears = []
//     charIDs = []
//     for stages in BonusStages {
//         array_push(stageClears, stages[1])
//     }
//     for character in Characters {
//         if(character[1] != "") {
//             array_push(charIDs, character[0])
//         }
//     }
//     
//     i = length(stageClears)
//     codeStages = tally_of(stageClears, i, stage => tally(1, (PreGameState() == 0x13 || 
//                                                    (PreGameState() == 0x34 &&
//                                                    NormalModeProgress() == 0x03)) &&
//                                                    GameState() == 0x35 &&
//                                                    dword(Mem_HighscoreOn)  == 0x01 &&
//                                                    Bonus1Targets() == 0 &&
//                                                    prev(Bonus12State() == 0x05) &&
//                                                    Bonus12State() == 0x06 &&
//                                                    Bonus12Stage() == stage))
//                                                    
//     codeReset = tally_of(charIDs, 2, char => tally(1, (PreGameState() == 0x13 || 
//                                                    (PreGameState() == 0x34 &&
//                                                    NormalModeProgress() == 0x03)) &&
//                                                    GameState() == 0x35 &&
//                                                    dword(Mem_HighscoreOn)  == 0x01 &&
//                                                    Bonus12Char() == char))
//                                                    
//     return measured(codeStages) && never(codeReset)
// }

function BeatAllBonus1() {
    return BeatAllBonus(0)
}

function PlayingBonus2(address) {
    code = always_false()

    for stage in BonusStages {
        code = code || byte(address) == stage[2]
    }
    
    return code
}

// ----- Old Logic for beating all with one Character -----
// function BeatAllBonus2WithSingleChar() {
//     stageClears = []
//     charIDs = []
//     for stages in BonusStages {
//         array_push(stageClears, stages[2])
//     for character in Characters {
//         if(character[1] != "") {
//             array_push(charIDs, character[0])
//         }
//     }
//     
//     i = length(stageClears)
//     codeStages = tally_of(stageClears, i, stage => tally(1, (PreGameState() == 0x14 || 
//                                                    (PreGameState() == 0x34 &&
//                                                    NormalModeProgress() == 0x07)) &&
//                                                    GameState() == 0x35 &&
//                                                    dword(Mem_HighscoreOn)  == 0x01 &&
//                                                    Bonus2Platforms() == 0 &&
//                                                    prev(Bonus12State() == 0x05) &&
//                                                    Bonus12State() == 0x06 &&
//                                                    Bonus12Stage() == stage))
//                                                    
//     codeReset = tally_of(charIDs, 2, char => tally(1, (PreGameState() == 0x14 || 
//                                                    (PreGameState() == 0x34 &&
//                                                    NormalModeProgress() == 0x07)) &&
//                                                    GameState() == 0x35 &&
//                                                    dword(Mem_HighscoreOn)  == 0x01 &&
//                                                    Bonus12Char() == char))
//                                                    
//     return measured(codeStages) && never(codeReset)
// }

function BeatAllBonus2() {
    return BeatAllBonus(1)
}

function TotalScoreAchievement(mode, score) {
    return byte(Mem_GameMode) == mode &&
           measured(LB_TotalScoreSum(mode) >= score) &&
               prev(LB_TotalScoreSum(mode)) < score &&
               prev(LB_TotalScoreSum(mode)) >= score - score/5
}

function RulesCommunity() {
    return true
}

function NoCheating(id) {
    address = id
    return dword(Mem_BattleSetting + 0x00 + id*4) == 0 &&
           dword(Mem_BattleSetting + 0x260 + id*4) == 0 &&
           dword(Mem_BattleSetting + 0xB5398 + id*4) == 0 &&
           dword(Mem_BattleSetting + 0xB8CC8 + id*4) == 0 &&
           dword(Mem_BattleSetting + 0xCE6E8 + id*4) == 0 &&
           dword(Mem_BattleSetting + 0xCE884 + id*4) == 0 &&
           dword(Mem_BattleSetting + 0xCDFBC + id*4) == 0
}

function NoCheatingNoHat(id) {
    return NoCheating(id) &&
           dword(Mem_BattleSetting + 0x130A18 + id*4) == 0
}

function ResetCheating(id) {
    return never(
              dword(Mem_BattleSetting + 0x00 + id*4) != 0 ||
              dword(Mem_BattleSetting + 0x260 + id*4) != 0 ||
              dword(Mem_BattleSetting + 0xB5398 + id*4) != 0 ||
              dword(Mem_BattleSetting + 0xB8CC8 + id*4) != 0 ||
              dword(Mem_BattleSetting + 0xCE6E8 + id*4) != 0 ||
              dword(Mem_BattleSetting + 0xCE884 + id*4) != 0 ||
              dword(Mem_BattleSetting + 0xCDFBC + id*4) != 0 ||
              dword(Mem_BattleSetting + 0x130A18 + id*4) != 0
            )
}

function KirbyCopyAbility(slot) {
    abilities = []
    for ability in KirbyAbility {
        if(ability[1] != "???") {
            array_push(abilities, ability[0])
        }
    }   
    
    total = length(abilities)
    code = tally_of(abilities, total, id => once(((byte(Mem_KirbyHatOption + 0x04*slot) == 0x00 &&
                                                   byte(PointerPlayerData() +  0x08 + 0xB50*slot) == GetCharID("Kirby") ||
                                                   byte(PointerPlayerData() +  0x08 + 0xB50*slot) == GetCharID("JP Kirby")) &&
                                                   prev(byte(PointerPlayerData() + 0xADC + 0xB50*slot) != id) &&
                                                   byte(PointerPlayerData() + 0xADC + 0xB50*slot) == id))) 

    return measured(code)
}

function SetPlayerTag(slot) {
    return byte(Mem_PlayerTagStart + 0x3C*(slot-1)) != 0x00 &&
           byte(Mem_PlayerTagStart + 0x3C*(slot-1)) != prev(byte(Mem_PlayerTagStart + 0x3C*(slot-1)))
}

function CharacterCostume(char, costume, slot) {
    return byte(PointerPlayerData() + 0x08 + 0xB50*slot) == GetCharID(char) &&
           byte(PointerPlayerData() + 0x13 + 0xB50*slot) == costume
}

function GallerySounds(index, input) {
    return GameState() == 0x37 &&
           PreGameState() >= 0x37 &&
           PreGameState() != 0x38 &&
           PreGameState() != 0x39 &&
           PreGameState() <= 0x3A &&
           dword(Mem_GallerySounds) == index &&
           (bit(4 + input, 0x9EFA6 + 8*0) > prev(bit(4 + input, 0x9EFA6 + 8*0)) ||
            bit(4 + input, 0x9EFA6 + 8*1) > prev(bit(4 + input, 0x9EFA6 + 8*1)) ||
            bit(4 + input, 0x9EFA6 + 8*2) > prev(bit(4 + input, 0x9EFA6 + 8*2)) ||
            bit(4 + input, 0x9EFA6 + 8*3) > prev(bit(4 + input, 0x9EFA6 + 8*3)))
}

function LuigiKnockDown(attacker, target) {
    return (byte(PointerPlayerData() + 0x08 + 0xB50*attacker) == GetCharID("Luigi") ||
            byte(PointerPlayerData() + 0x08 + 0xB50*attacker) == GetCharID("Polygon Luigi") ||
            byte(PointerPlayerData() + 0x08 + 0xB50*attacker) == GetCharID("JP Luigi") ||
            byte(PointerPlayerData() + 0x08 + 0xB50*attacker) == GetCharID("Metal Luigi") ||
            byte(PointerPlayerData() + 0x08 + 0xB50*attacker) == GetCharID("Dr. Luigi")) &&
            bit0(PointerPlayerData() + 0x20 + 0xB50*attacker) == 0 &&
            bit0(PointerPlayerData() + 0x20 + 0xB50*target) == 1 &&
           word(PointerPlayerData() + 0x24 + 0xB50*attacker) == 0xBD &&
           dword(byte(PointerPlayerData() + 0x0E + 0xB50*target)*0x74 + 0xA4D64 + byte(PointerPlayerData() + 0x0E + 0xB50*attacker)*4) > prev(dword(byte(PointerPlayerData() + 0x0E + 0xB50*target)*0x74 + 0xA4D64 + byte(PointerPlayerData() + 0x0E + 0xB50*attacker)*4)) &&
           prev(word(PointerPlayerData() + 0x24 + 0xB50*target) >= 0x54) && 
           prev(word(PointerPlayerData() + 0x24 + 0xB50*target) <= 0x56) &&
           word(PointerPlayerData() + 0x24 + 0xB50*target) >= 0x33 &&
           word(PointerPlayerData() + 0x24 + 0xB50*target) <= 0x37 &&
           float(PointerPlayerData() + 0x58 + 0xB50*target) <= -110.0
}

function WarioGoing(slot) {
    return byte(PointerPlayerData() + 0x08 + 0xB50*slot) == GetCharID("Wario") &&
           prev(byte(PointerPlayerData() + 0xADC + 0xB50*slot)) == 0 &&
           byte(PointerPlayerData() + 0xADC + 0xB50*slot) == 1
}

function MarinaShaking(slot) {
    return byte(PointerPlayerData() + 0x08 + 0xB50*slot) == GetCharID("Marina") &&
           prev(word(PointerPlayerData() + 0x24 + 0xB50*slot) != 0xFB) && 
           word(PointerPlayerData() + 0x24 + 0xB50*slot) == 0xFB &&
           ((dword(Mem_BattleSetting - 0x105F8 + slot*4) == 0 &&
             bit5(0x9EFA0 + 0x06 + byte(PointerPlayerData() + 0x0E + 0xB50*slot)*8) == 1) ||
            (dword(Mem_BattleSetting - 0x105F8 + slot*4) == 1 &&
             bit3(0x9EFA0 + 0x06 + byte(PointerPlayerData() + 0x0E + 0xB50*slot)*8) == 1) ||
            (dword(Mem_BattleSetting - 0x105F8 + slot*4) == 2 &&
             bit2(0x9EFA0 + 0x06 + byte(PointerPlayerData() + 0x0E + 0xB50*slot)*8) == 1) ||
            (dword(Mem_BattleSetting - 0x105F8 + slot*4) == 3 &&
             bit1(0x9EFA0 + 0x06 + byte(PointerPlayerData() + 0x0E + 0xB50*slot)*8) == 1) ||
            (dword(Mem_BattleSetting - 0x105F8 + slot*4) == 4 &&
             bit0(0x9EFA0 + 0x06 + byte(PointerPlayerData() + 0x0E + 0xB50*slot)*8) == 1) ||
            (dword(Mem_BattleSetting - 0x105F8 + slot*4) == 5 &&
             bit3(0x9EFA0 + 0x07 + byte(PointerPlayerData() + 0x0E + 0xB50*slot)*8) == 1) ||
            (dword(Mem_BattleSetting - 0x105F8 + slot*4) == 6 &&
             bit2(0x9EFA0 + 0x07 + byte(PointerPlayerData() + 0x0E + 0xB50*slot)*8) == 1) ||
            (dword(Mem_BattleSetting - 0x105F8 + slot*4) == 7 &&
             bit1(0x9EFA0 + 0x07 + byte(PointerPlayerData() + 0x0E + 0xB50*slot)*8) == 1) ||
            (dword(Mem_BattleSetting - 0x105F8 + slot*4) == 8 &&
             bit0(0x9EFA0 + 0x07 + byte(PointerPlayerData() + 0x0E + 0xB50*slot)*8) == 1))
}

function PeppyBarrelRolling(slot) {
    return byte(PointerPlayerData() + 0x08 + 0xB50*slot) == GetCharID("Peppy") &&
           prev(word(PointerPlayerData() + 0x24 + 0xB50*slot) != 0xE8) && 
           word(PointerPlayerData() + 0x24 + 0xB50*slot) == 0xE8 &&
           ((dword(Mem_BattleSetting - 0x105F8 + slot*4) == 0 &&
             bit5(0x9EFA0 + 0x06 + byte(PointerPlayerData() + 0x0E + 0xB50*slot)*8) == 1) ||
            (dword(Mem_BattleSetting - 0x105F8 + slot*4) == 1 &&
             bit3(0x9EFA0 + 0x06 + byte(PointerPlayerData() + 0x0E + 0xB50*slot)*8) == 1) ||
            (dword(Mem_BattleSetting - 0x105F8 + slot*4) == 2 &&
             bit2(0x9EFA0 + 0x06 + byte(PointerPlayerData() + 0x0E + 0xB50*slot)*8) == 1) ||
            (dword(Mem_BattleSetting - 0x105F8 + slot*4) == 3 &&
             bit1(0x9EFA0 + 0x06 + byte(PointerPlayerData() + 0x0E + 0xB50*slot)*8) == 1) ||
            (dword(Mem_BattleSetting - 0x105F8 + slot*4) == 4 &&
             bit0(0x9EFA0 + 0x06 + byte(PointerPlayerData() + 0x0E + 0xB50*slot)*8) == 1) ||
            (dword(Mem_BattleSetting - 0x105F8 + slot*4) == 5 &&
             bit3(0x9EFA0 + 0x07 + byte(PointerPlayerData() + 0x0E + 0xB50*slot)*8) == 1) ||
            (dword(Mem_BattleSetting - 0x105F8 + slot*4) == 6 &&
             bit2(0x9EFA0 + 0x07 + byte(PointerPlayerData() + 0x0E + 0xB50*slot)*8) == 1) ||
            (dword(Mem_BattleSetting - 0x105F8 + slot*4) == 7 &&
             bit1(0x9EFA0 + 0x07 + byte(PointerPlayerData() + 0x0E + 0xB50*slot)*8) == 1) ||
            (dword(Mem_BattleSetting - 0x105F8 + slot*4) == 8 &&
             bit0(0x9EFA0 + 0x07 + byte(PointerPlayerData() + 0x0E + 0xB50*slot)*8) == 1))
}

function SonicIsClassic(slot) {
    return byte(PointerPlayerData() + 0x8 + 0xB50*slot) == GetCharID("Sonic") && 
           byte(Mem_SonicVariation + 3 - 1*slot) == 1 &&
           byte(PointerPlayerData() + 0x20 + 0xB50*slot) == 0
}

function SoundWasPlayed(sound) {
    code = always_false()
    
    for i in range(0, 11, 1) {
        code = code ||
               (prev(byte(0x95B15 + i*0x98)) == 0 &&
               byte(0x95B15 + i*0x98) == 1 &&
               dword(tbyte(0x95B2C + i*0x98)) == sound)
    }
    
    return code
}

// ----------------------------------------------------------------------------------------------------
// Leaderboard Logic
function LB_TotalScoreUpdate1PGame(mode) {
    objectSize = 0x20
    
    loop = 0
    code = always_false()

    for character in Characters {
        // Character ID is an original Character and uses Static Memory Chunk
        if (loop < 12) {
            code = code || dword(Mem_NormalModeData + 0x04 + loop*objectSize) > prev(dword(Mem_NormalModeData + 0x04 + loop*objectSize))
        }
        // Character ID is a new Character and uses Dynamic Memory Chunk
        if (loop >= 12) {
            code = code || dword(Mem_1PGameNewScores + (loop-12)*objectSize) > prev(dword(Mem_1PGameNewScores + (loop-12)*objectSize))
        }
        loop = loop + 1
    }
    
    return byte(Mem_GameMode) == 0x00 &&
           code
}

function LB_TotalScoreSum1PGame(mode) {
    objectSize = 0x20
    
    loop = 0
    score = 0

    for character in Characters {
        // Character ID is an original Character and uses Static Memory Chunk
        if (loop < 12) {
            score = score + dword(Mem_NormalModeData + 0x04 + loop*objectSize)
        }
        // Character ID is a new Character and uses Dynamic Memory Chunk
        if (loop >= 12) {
            score = score + dword(Mem_1PGameNewScores + (loop-12)*objectSize)
        }
        loop = loop + 1
    }
    
    return score
}

function LB_TotalScoreUpdate(mode) {
    objectSize = 0x04
    
    // Remix 1P
    if (mode == 4) {
        objectSize = 0x20
        address = Mem_Remix1PScores
    }
    // All-Star Mode
    if (mode == 5) {
        objectSize = 0x20
        address = Mem_Remix1PScores + length(Characters)*objectSize + 0x10
    }
    // Multi-Man Mode
    if (mode == 2) {
        address = Mem_MultiManScores
    }
    // Cruel Multi-Man Mode
    if (mode == 3) {
        address = Mem_MultiManScores + length(Characters)*objectSize - 0x04 + 0x20
    }
    // Home-Run Contest
    if (mode == 6) {
        address = Mem_HomeRunScores
    }
    
    loop = 0
    code = always_false()

    for character in Characters {
        code = code || dword(address + loop*objectSize) > prev(dword(address + loop*objectSize))
        loop = loop + 1
    }
    
    return byte(Mem_GameMode) == mode &&
           code
}

function LB_TotalScoreSum(mode) {
    objectSize = 0x04
    
    // Remix 1P
    if (mode == 4) {
        objectSize = 0x20
        address = Mem_Remix1PScores
    }
    // All-Star Mode
    if (mode == 5) {
        objectSize = 0x20
        address = Mem_Remix1PScores + length(Characters)*objectSize + 0x10
    }
    // Multi-Man Mode
    if (mode == 2) {
        address = Mem_MultiManScores
    }
    // Cruel Multi-Man Mode
    if (mode == 3) {
        address = Mem_MultiManScores + length(Characters)*objectSize - 0x04 + 0x20
    }
        // Home-Run Contest
    if (mode == 6) {
        address = Mem_HomeRunScores
    }
    
    loop = 0
    score = 0

    for character in Characters {
        score = score + dword(address + loop*objectSize)
        loop = loop + 1
    }
    
    return score
}

function LB_1PGame(name) {
    return NormalModeChar1() == GetCharID(name) &&
           byte(Mem_GameMode) == 0x00 &&
           byte(Mem_GameMode) == prev(byte(Mem_GameMode)) &&
           ((prev(NormalModeProgress()) == 0x0D &&
               NormalModeProgress() == 0x0E) ||
           (NormalModeChar1Stocks() == 0xFF &&
               dword(Mem_ContinueState) == 0x02 &&
               prev(dword(Mem_ContinueState)) == 0x00)) &&
           never(dword(Mem_HighscoreOn)  == 0x00)
}

function LB_Remix1P(name) {
    return NormalModeChar1() == GetCharID(name) &&
           byte(Mem_GameMode) == 0x04 &&
           byte(Mem_GameMode) == prev(byte(Mem_GameMode)) &&
           ((prev(NormalModeProgress()) == 0x0D &&
               NormalModeProgress() == 0x0E) ||
           (NormalModeChar1Stocks() == 0xFF &&
               dword(Mem_ContinueState) == 0x02 &&
               prev(dword(Mem_ContinueState)) == 0x00)) &&
           never(dword(Mem_HighscoreOn)  == 0x00)
}

function LB_Bonus1(stage) {
    stageID = ""
    for stages in BonusStages {
        if(stages[3] == stage || stages[4] == stage) {
            stageID = stages[1]
            
            return Bonus12Stage() == stageID &&
                Bonus12Timer() != 0 &&
                Bonus1Targets() == 0 &&
                prev(Bonus1Targets() >= 1) &&
                prev(Bonus1Targets() <= 10) &&
                (BothGameStates() == 0x3513 ||
                (BothGameStates() == 0x3534) &&
                NormalModeProgress() == 0x03) &&
                never(dword(Mem_HighscoreOn)  == 0x00)
        }
    }
}

function LB_Bonus2(stage) {
    stageID = 0
    for stages in BonusStages {
        if(stages[3] == stage || stages[4] == stage) {
            stageID = stages[2]
            
            return Bonus12Stage() == stageID &&
                   Bonus12Timer() != 0 &&
                   Bonus2Platforms() == 0 &&
                   prev(Bonus2Platforms() >= 1) &&
                   prev(Bonus2Platforms() <= 10) &&
                   (BothGameStates() == 0x3514 ||
                   (BothGameStates() == 0x3534) &&
                   NormalModeProgress() == 0x03) &&
                   never(dword(Mem_HighscoreOn)  == 0x00)
        }   
    }
}

function LB_Bonus3(stage) {
    stageID = 0
    if (stage == "Normal") {
        stageID = 0x0F
    } 
    if (stage == "Remix") {
        stageID = 0xBD
    }
    
    if (stageID != 0) {
        return NormalModeStage() == stageID &&
               Bonus3Timer() != 0 &&
               prev(Bonus3State()) == 0x06 &&
               Bonus3State() == 0x07 &&
               ((NormalModeProgress() == 0x0B &&
               BothGameStates() == 0x010E) ||
               BothGameStates() == 0x770E) &&
               never(dword(Mem_HighscoreOn)  == 0x00)
    }
}

function LB_MultiMan(name) {
    return NormalModeChar1() == GetCharID(name) &&
           byte(Mem_GameMode) == 0x02 &&
           prev(NormalModeChar1Stocks()) == 0x00 &&
           NormalModeChar1Stocks() == 0xFF &&
           GameState() == 0x77 &&
           never(dword(Mem_HighscoreOn)  == 0x00)
}

function LB_MultiManHealth(name) {
    return NormalModeChar1() == GetCharID(name) &&
           byte(Mem_GameMode) == 0x02 &&
           prev(NormalModeChar1Percentage()) < 300 &&
           NormalModeChar1Percentage() >= 300 &&
           GameState() == 0x77 &&
           never(dword(Mem_HighscoreOn)  == 0x00)
}

function LB_CruelMultiMan(name) {
    return NormalModeChar1() == GetCharID(name) &&
           byte(Mem_GameMode) == 0x03 &&
           prev(NormalModeChar1Stocks()) == 0x00 &&
           NormalModeChar1Stocks() == 0xFF &&
           GameState() == 0x77 &&
           never(dword(Mem_HighscoreOn)  == 0x00)
}

function LB_CruelMultiManHealth(name) {
    return NormalModeChar1() == GetCharID(name) &&
           byte(Mem_GameMode) == 0x03 &&
           prev(NormalModeChar1Percentage()) < 300 &&
           NormalModeChar1Percentage() >= 300 &&
           GameState() == 0x77 &&
           never(dword(Mem_HighscoreOn)  == 0x00)
}

function LB_AllStars(name) {
    return NormalModeChar1() == GetCharID(name) &&
           byte(Mem_GameMode) == 0x05 &&
           byte(Mem_GameMode) == prev(byte(Mem_GameMode)) &&
           ((prev(NormalModeProgress()) == 0x0D &&
               NormalModeProgress() == 0x0E) ||
           (NormalModeChar1Stocks() == 0xFF &&
               dword(Mem_ContinueState) == 0x02 &&
               prev(dword(Mem_ContinueState)) == 0x00)) &&
           never(dword(Mem_HighscoreOn)  == 0x00)
}

function LB_Homerun(name) {
    return NormalModeChar1() == GetCharID(name) &&
           byte(Mem_GameMode) == 0x06 &&
           prev(Bonus3State()) != 0x06 &&
           Bonus3State() == 0x06 &&
           never(dword(Mem_HighscoreOn)  == 0x00)
}

// ----------------------------------------------------------------------------------------------------

NumberOfOldChars            = GetCharID("Ness")
NumberOfNewChars            = length(Characters) - NumberOfOldChars

// ----------------------------------------------------------------------------------------------------
// Achievements
achievement(
    title = "Keep It Normal", points = 5, type="progression",
    description = "Complete 1P Game on Normal.",
    id = 532081, badge = "599784", published = "21.09.2021 12:23:11", modified = "08.09.2024 13:29:37", 
    trigger = Beat1PNormal() &&
              RulesCommunity()
)

achievement(
    title = "Don't Get Rusty", points = 5, type="",
    description = "Complete 1P Game with Metal Mario on Normal without using continues.",
    id = 165928, badge = "523035", published = "14.08.2021 15:04:25", modified = "08.09.2024 13:29:37",
    trigger =  never(HomerunChar() != GetCharID("Metal Mario")) &&
               Beat1PNormalNoContinues() &&
               RulesCommunity()
)

achievement(
    title = "King of Swing", points = 5, type="",
    description = "Complete 1P Game with Giant Donkey Kong on Normal without using continues.",
    id = 165929, badge = "523040", published = "14.08.2021 15:04:25", modified = "08.09.2024 13:29:38",
    trigger = never(HomerunChar() != GetCharID("Giant Donkey Kong")) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Force of Power", points = 5, type="",
    description = "Complete 1P Game with Ganondorf on Normal without using continues.",
    id = 165930, badge = "523046", published = "14.08.2021 15:04:25", modified = "08.09.2024 13:29:40",
    trigger = never((HomerunChar() != GetCharID("Ganondorf")) &&
                (HomerunChar() != GetCharID("Polygon Ganondorf"))) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "An Adventure Begins", points = 5, type="",
    description = "Complete 1P Game with Young Link on Normal without using continues.",
    id = 165931, badge = "523049", published = "14.08.2021 15:04:26", modified = "08.09.2024 13:29:41",
    trigger = never((HomerunChar() != GetCharID("Young Link")) &&
                  (HomerunChar() != GetCharID("Polygon Young Link"))) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Hawk Eyes!", points = 5, type="",
    description = "Complete 1P Game with Falco on Normal without using continues.",
    id = 165932, badge = "523043", published = "14.08.2021 15:04:26", modified = "08.09.2024 13:29:39",
    trigger = never((HomerunChar() != GetCharID("Falco")) &&
                  (HomerunChar() != GetCharID("Polygon Falco"))) && 
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Time For Your Medicine", points = 5, type="",
    description = "Complete 1P Game with Dr. Mario on Normal without using continues.",
    id = 165926, badge = "523052", published = "14.08.2021 15:04:24", modified = "08.09.2024 13:29:42",
    trigger = never((HomerunChar() != GetCharID("Dr. Mario")) &&
                  (HomerunChar() != GetCharID("Polygon Dr. Mario"))) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Dark Memories", points = 5, type="",
    description = "Complete 1P Game with Dark Samus on Normal without using continues.",
    id = 165933, badge = "523058", published = "14.08.2021 15:04:26", modified = "08.09.2024 14:00:49",
    trigger = never((HomerunChar() != GetCharID("Dark Samus")) &&
                  (HomerunChar() != GetCharID("Polygon Dark Samus"))) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Stealing the Show!", points = 5, type="",
    description = "Complete 1P Game with Wario on Normal without using continues.",
    id = 165934, badge = "523055", published = "14.08.2021 15:04:27", modified = "08.09.2024 13:29:43", 
    trigger = never((HomerunChar() != GetCharID("Wario")) &&
                  (HomerunChar() != GetCharID("Polygon Wario"))) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Yeah!", points = 5, type="",
    description = "Complete 1P Game with Lucas on Normal without using continues.",
    id = 165935, badge = "523061", published = "14.08.2021 15:04:27", modified = "08.09.2024 13:29:45", 
    trigger = never((HomerunChar() != GetCharID("Lucas")) &&
                  (HomerunChar() != GetCharID("Polygon Lucas"))) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Gwahahahaha!", points = 5, type="",
    description = "Complete 1P Game with Bowser on Normal without using continues.",
    id = 165936, badge = "523088", published = "14.08.2021 15:04:27", modified = "08.09.2024 14:14:49", 
    trigger = never((HomerunChar() != GetCharID("Bowser")) &&
                  (HomerunChar() != GetCharID("Polygon Bowser"))) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Ultimate Koopa", points = 5, type="",
    description = "Complete 1P Game with Giga Bowser on Normal without using continues.",
    id = 165937, badge = "523064", published = "14.08.2021 15:04:28", modified = "08.09.2024 14:01:09", 
    trigger = never(HomerunChar() != GetCharID("Giga Bowser")) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Hunting Nightmare", points = 5, type="",
    description = "Complete 1P Game with Mad Piano on Normal without using continues.",
    id = 165927, badge = "523068", published = "14.08.2021 15:04:24", modified = "08.09.2024 14:14:20", 
    trigger = never(HomerunChar() != GetCharID("Mad Piano")) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Unleash the Wolf", points = 5, type="",
    description = "Complete 1P Game with Wolf on Normal without using continues.",
    id = 165938, badge = "523071", published = "14.08.2021 15:04:28", modified = "08.09.2024 14:14:21", 
    trigger = never((HomerunChar() != GetCharID("Wolf")) &&
                  (HomerunChar() != GetCharID("Polygon Wolf"))) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "I'm Confident!", points = 5, type="",
    description = "Complete 1P Game with Conker on Normal without using continues.",
    id = 165939, badge = "523074", published = "14.08.2021 15:04:28", modified = "08.09.2024 14:14:21", 
    trigger = never((HomerunChar() != GetCharID("Conker")) &&
                  (HomerunChar() != GetCharID("Polygon Conker"))) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Cosmic Power", points = 5, type="",
    description = "Complete 1P Game with Mewtwo on Normal without using continues.",
    id = 173151, badge = "523076", published = "21.09.2021 12:23:09", modified = "08.09.2024 14:14:21",
    trigger = never((HomerunChar() != GetCharID("Mewtwo")) &&
                  (HomerunChar() != GetCharID("Polygon Mewtwo"))) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "A Known Swordfighter", points = 5, type="",
    description = "Complete 1P Game with Marth on Normal without using continues.",
    id = 173152, badge = "523079", published = "21.09.2021 12:23:09", modified = "08.09.2024 14:14:22", 
    trigger = never((HomerunChar() != GetCharID("Marth")) &&
                  (HomerunChar() != GetCharID("Polygon Marth"))) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "In Sonic Speed", points = 5, type="",
    description = "Complete 1P Game with Sonic on Normal without using continues.",
    id = 197073, badge = "523082", published = "11.02.2022 19:39:39", modified = "08.09.2024 14:14:24", 
    trigger = never((HomerunChar() != GetCharID("Sonic")) &&
                  (HomerunChar() != GetCharID("Polygon Sonic"))) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Super Power", points = 5, type="",
    description = "Complete 1P Game with Super Sonic on Normal without using continues.",
    id = 197074, badge = "523085", published = "11.02.2022 19:39:40", modified = "08.09.2024 14:14:24", 
    trigger = never(HomerunChar() != GetCharID("Super Sonic")) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Royal Invasion", points = 5, type="",
    description = "Complete 1P Game with Sheik on Normal without using continues.",
    id = 161715, badge = "523954", published = "11.02.2022 19:39:39", modified = "08.09.2024 14:14:24", 
    trigger = never((HomerunChar() != GetCharID("Sheik")) &&
                  (HomerunChar() != GetCharID("Polygon Sheik"))) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Shake It Up", points = 5, type="",
    description = "Complete 1P Game with Marina on Normal without using continues.",
    id = 161717, badge = "523957", published = "11.02.2022 19:39:39", modified = "08.09.2024 14:14:24", 
    trigger = never((HomerunChar() != GetCharID("Marina")) &&
                  (HomerunChar() != GetCharID("Polygon Marina"))) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Dreaming of a Kingdom", points = 5, type="",
    description = "Complete 1P Game with King Dedede on Normal without using continues.",
    id = 161719, badge = "523958", published = "11.02.2022 19:39:39", modified = "08.09.2024 14:14:24", 
    trigger = never((HomerunChar() != GetCharID("King Dedede")) &&
                  (HomerunChar() != GetCharID("Polygon King Dedede"))) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Japanese Spirits", points = 5, type="",
    description = "Complete 1P Game with Goemon on Normal without using continues.",
    id = 161707, badge = "523961", published = "11.02.2022 19:39:39", modified = "08.09.2024 14:14:24", 
    trigger = never((HomerunChar() != GetCharID("Goemon")) &&
                  (HomerunChar() != GetCharID("Polygon Goemon"))) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Spicy Combat Skills", points = 5, type="",
    description = "Complete 1P Game with Peppy on Normal without using continues.",
    id = 161708, badge = "523962", published = "11.02.2022 19:39:39", modified = "08.09.2024 14:14:24", 
    trigger = never(HomerunChar() != GetCharID("Peppy")) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Slip' Slidin' Away", points = 5, type="",
    description = "Complete 1P Game with Slippy on Normal without using continues.",
    id = 161709, badge = "523965", published = "11.02.2022 19:39:39", modified = "08.09.2024 14:14:24", 
    trigger = never(HomerunChar() != GetCharID("Slippy")) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Battle For the Jiggy", points = 5, type="",
    description = "Complete 1P Game with Banjo & Kazooie on Normal without using continues.",
    id = 161710, badge = "523966", published = "11.02.2022 19:39:39", modified = "08.09.2024 14:14:24", 
    trigger = never((HomerunChar() != GetCharID("Banjo & Kazooie")) &&
                  (HomerunChar() != GetCharID("Polygon Banjo & Kazooie"))) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "More Comedy Than Stealth", points = 5, type="",
    description = "Complete 1P Game with Ebisumaru on Normal without using continues.",
    id = 462596, badge = "523969", published = "11.02.2022 19:39:39", modified = "08.09.2024 14:14:24", 
    trigger = never(HomerunChar() != GetCharID("Ebisumaru")) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Lead of Faith", points = 5, type="",
    description = "Complete 1P Game with Metal Luigi on Normal without using continues.",
    id = 462597, badge = "523970", published = "11.02.2022 19:39:39", modified = "08.09.2024 14:14:24", 
    trigger = never(HomerunChar() != GetCharID("Metal Luigi")) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Ryou-Chou Majesty", points = 5, type="",
    description = "Complete 1P Game with Dragon King on Normal without using continues.",
    id = 462600, badge = "523973", published = "11.02.2022 19:39:39", modified = "08.09.2024 14:14:24", 
    trigger = never(HomerunChar() != GetCharID("Dragon King")) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Crash Landing", points = 5, type="",
    description = "Complete 1P Game with Crash on Normal without using continues.",
    id = 529124, badge = "600034", published = "11.02.2022 19:39:39", modified = "08.09.2024 14:14:24", 
    trigger = never(HomerunChar() != GetCharID("Crash")) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Sweet and Pink", points = 5, type="",
    description = "Complete 1P Game with Peach on Normal without using continues.",
    id = 529125, badge = "600035", published = "11.02.2022 19:39:39", modified = "08.09.2024 14:14:24", 
    trigger = never(HomerunChar() != GetCharID("Peach")) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Blazing Blade", points = 5, type="",
    description = "Complete 1P Game with Roy on Normal without using continues.",
    id = 529126, badge = "600036", published = "11.02.2022 19:39:39", modified = "08.09.2024 14:14:24", 
    trigger = never(HomerunChar() != GetCharID("Roy")) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "PhD in Plumbering", points = 5, type="",
    description = "Complete 1P Game with Dr. Luigi on Normal without using continues.",
    id = 529127, badge = "600037", published = "11.02.2022 19:39:39", modified = "08.09.2024 14:14:24", 
    trigger = never(HomerunChar() != GetCharID("Dr. Luigi")) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "No Style, No Grace", points = 5, type="",
    description = "Complete 1P Game with Lanky Kong on Normal without using continues.",
    id = 529128, badge = "600038", published = "11.02.2022 19:39:39", modified = "08.09.2024 14:14:24", 
    trigger = never(HomerunChar() != GetCharID("Lanky Kong")) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Shuffled Around", points = 5, type="progression",
    description = "Complete Remix 1P on Normal.",
    id = 532082, badge = "599953", published = "21.09.2021 12:23:11", modified = "08.09.2024 13:29:37", 
    trigger = BeatRemix1PNormal() &&
              RulesCommunity()
)

achievement(
    title = "Limited Controls", points = 10, type="",
    description = "Complete 1P Game with any Polygon Fighter on Normal.",
    id = 173153, badge = "523037", published = "21.09.2021 12:23:11", modified = "08.09.2024 13:29:37", 
    trigger = never(HomerunChar() < GetCharID("Polygon Mario")) &&
              never((HomerunChar() > GetCharID("Polygon Ness")) &&
                (HomerunChar() < GetCharID("Polygon Wario"))) &&
              Beat1PNormal() &&
              RulesCommunity()
)

achievement(
    title = "Plumbing Away", points = 25,
    description = "Complete Remix 1P with Mario on Very Hard and 3 stocks.",
    id = 165944, badge = "523010", published = "14.08.2021 16:37:34", modified = "08.09.2024 13:29:29", 
    trigger = never((HomerunChar() != GetCharID("Mario")) &&
                (HomerunChar() != GetCharID("JP Mario")) &&
                (HomerunChar() != GetCharID("Polygon Mario"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "HAYAAAAH!", points = 25,
    description = "Complete Remix 1P with Fox on Very Hard and 3 stocks.",
    id = 165945, badge = "523012", published = "14.08.2021 16:37:37", modified = "08.09.2024 13:29:29", 
    trigger = never((HomerunChar() != GetCharID("Fox")) &&
                (HomerunChar() != GetCharID("JP Fox")) &&
                (HomerunChar() != GetCharID("Polygon Fox"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Jungle Beat", points = 25,
    description = "Complete Remix 1P with Donkey Kong on Very Hard and 3 stocks.",
    id = 165946, badge = "523014", published = "14.08.2021 16:41:51", modified = "08.09.2024 13:29:30", 
    trigger = never((HomerunChar() != GetCharID("Donkey Kong")) &&
                (HomerunChar() != GetCharID("JP Donkey Kong")) &&
                (HomerunChar() != GetCharID("Polygon Donkey Kong"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Complete Meltdown", points = 25,
    description = "Complete Remix 1P with Samus on Very Hard and 3 stocks.",
    id = 165947, badge = "523016", published = "14.08.2021 16:47:33", modified = "08.09.2024 13:29:30", 
    trigger = never((HomerunChar() != GetCharID("Samus")) &&
                (HomerunChar() != GetCharID("JP Samus")) &&
                (HomerunChar() != GetCharID("EU Samus")) &&
                (HomerunChar() != GetCharID("Polygon Samus"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "New Superstar", points = 25,
    description = "Complete Remix 1P with Luigi on Very Hard and 3 stocks.",
    id = 165948, badge = "523018", published = "14.08.2021 16:55:44", modified = "08.09.2024 13:29:31",
    trigger = never((HomerunChar() != GetCharID("Luigi")) &&
                (HomerunChar() != GetCharID("JP Luigi")) &&
                (HomerunChar() != GetCharID("Polygon Luigi"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "A Real Hero", points = 25,
    description = "Complete Remix 1P with Link on Very Hard and 3 stocks.",
    id = 165949, badge = "523020", published = "14.08.2021 17:00:23", modified = "08.09.2024 13:29:31", 
    trigger = never((HomerunChar() != GetCharID("Link")) &&
                (HomerunChar() != GetCharID("JP Link")) &&
                (HomerunChar() != GetCharID("EU Link")) &&
                (HomerunChar() != GetCharID("Polygon Link"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Jurassic Destruction", points = 25,
    description = "Complete Remix 1P with Yoshi on Very Hard and 3 stocks.",
    id = 165950, badge = "523022", published = "14.08.2021 17:04:42", modified = "08.09.2024 13:29:32", 
    trigger = never((HomerunChar() != GetCharID("Yoshi")) &&
                (HomerunChar() != GetCharID("JP Yoshi")) &&
                (HomerunChar() != GetCharID("Polygon Yoshi"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Rising Phoenix", points = 25,
    description = "Complete Remix 1P with Captain Falcon on Very Hard and 3 stocks.",
    id = 165951, badge = "523024", published = "14.08.2021 17:11:09", modified = "08.09.2024 13:29:33",
    trigger = never((HomerunChar() != GetCharID("Captain Falcon")) &&
                (HomerunChar() != GetCharID("JP Captain Falcon")) &&
                (HomerunChar() != GetCharID("Polygon Captain Falcon"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Cute and Dangerous", points = 25,
    description = "Complete Remix 1P with Kirby on Very Hard and 3 stocks.",
    id = 165952, badge = "523026", published = "14.08.2021 17:16:04", modified = "08.09.2024 13:29:33", 
    trigger = never((HomerunChar() != GetCharID("Kirby")) &&
                (HomerunChar() != GetCharID("JP Kirby")) &&
                (HomerunChar() != GetCharID("Polygon Kirby"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "End of the Thunderstorm", points = 25,
    description = "Complete Remix 1P with Pikachu on Very Hard and 3 stocks.",
    id = 165953, badge = "523028", published = "14.08.2021 17:21:17", modified = "08.09.2024 13:29:34", 
    trigger = never((HomerunChar() != GetCharID("Pikachu")) &&
                (HomerunChar() != GetCharID("JP Pikachu")) &&
                (HomerunChar() != GetCharID("EU Pikachu")) &&
                (HomerunChar() != GetCharID("Polygon Pikachu"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Song of Soaring", points = 25,
    description = "Complete Remix 1P with Jigglypuff on Very Hard and 3 stocks.",
    id = 165954, badge = "523030", published = "14.08.2021 17:26:21", modified = "08.09.2024 13:29:35", 
    trigger = never((HomerunChar() != GetCharID("Jigglypuff")) &&
                (HomerunChar() != GetCharID("JP Jigglypuff")) &&
                (HomerunChar() != GetCharID("EU Jigglypuff")) &&
                (HomerunChar() != GetCharID("Polygon Jigglypuff"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "PK Victory", points = 25,
    description = "Complete Remix 1P with Ness on Very Hard and 3 stocks.",
    id = 165955, badge = "523032", published = "14.08.2021 17:30:26", modified = "08.09.2024 13:29:35", 
    trigger = never((HomerunChar() != GetCharID("Ness")) &&
                (HomerunChar() != GetCharID("JP Ness")) &&
                (HomerunChar() != GetCharID("Polygon Ness"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Heavy Fighter", points = 25,
    description = "Complete Remix 1P with Metal Mario on Very Hard and 3 stocks.",
    id = 165956, badge = "523036", published = "14.08.2021 17:30:43", modified = "08.09.2024 13:29:37",
    trigger = never(HomerunChar() != GetCharID("Metal Mario")) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Bigger Is Better", points = 25,
    description = "Complete Remix 1P with Giant Donkey Kong on Very Hard and 3 stocks.",
    id = 165957, badge = "523041", published = "14.08.2021 17:38:48", modified = "08.09.2024 13:29:38",
    trigger = never(HomerunChar() != GetCharID("Giant Donkey Kong")) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "The Dark Lord", points = 25,
    description = "Complete Remix 1P with Ganondorf on Very Hard and 3 stocks.",
    id = 165958, badge = "523047", published = "14.08.2021 17:42:46", modified = "08.09.2024 13:29:41",
    trigger = never((HomerunChar() != GetCharID("Ganondorf")) &&
                (HomerunChar() != GetCharID("Polygon Ganondorf"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Kid of Courage", points = 25,
    description = "Complete Remix 1P with Young Link on Very Hard and 3 stocks.",
    id = 165967, badge = "523050", published = "14.08.2021 18:05:15", modified = "08.09.2024 13:29:41", 
    trigger = never((HomerunChar() != GetCharID("Young Link")) &&
                (HomerunChar() != GetCharID("Polygon Young Link"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Revali But Better", points = 25,
    description = "Complete Remix 1P with Falco on Very Hard and 3 stocks.",
    id = 165968, badge = "523044", published = "14.08.2021 18:08:56", modified = "08.09.2024 13:29:39",
    trigger = never((HomerunChar() != GetCharID("Falco")) &&
                (HomerunChar() != GetCharID("Polygon Falco"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "You're Ready For the Hospital", points = 25,
    description = "Complete Remix 1P with Dr. Mario on Very Hard and 3 stocks.",
    id = 165971, badge = "523053", published = "14.08.2021 18:14:15", modified = "08.09.2024 14:00:27",
    trigger = never((HomerunChar() != GetCharID("Dr. Mario")) &&
                (HomerunChar() != GetCharID("Polygon Dr. Mario"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Perfect Clone", points = 25,
    description = "Complete Remix 1P with Dark Samus on Very Hard and 3 stocks.",
    id = 165972, badge = "523059", published = "14.08.2021 18:18:06", modified = "08.09.2024 13:29:44",
    trigger = never((HomerunChar() != GetCharID("Dark Samus")) &&
                (HomerunChar() != GetCharID("Polygon Dark Samus"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Doing It For the Money", points = 25,
    description = "Complete Remix 1P with Wario on Very Hard and 3 stocks.",
    id = 165973, badge = "523056", published = "14.08.2021 18:22:07", modified = "08.09.2024 14:00:40",
    trigger = never((HomerunChar() != GetCharID("Wario")) &&
                (HomerunChar() != GetCharID("Polygon Wario"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Newcomer Out of Nowhere", points = 25,
    description = "Complete Remix 1P with Lucas on Very Hard and 3 stocks.",
    id = 165974, badge = "523062", published = "14.08.2021 18:27:46", modified = "08.09.2024 13:29:45", 
    trigger = never((HomerunChar() != GetCharID("Lucas")) &&
                (HomerunChar() != GetCharID("Polygon Lucas"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Defending the Title", points = 25,
    description = "Complete Remix 1P with Bowser on Very Hard and 3 stocks.",
    id = 165975, badge = "523089", published = "14.08.2021 18:36:52", modified = "08.09.2024 14:14:50",
    trigger = never((HomerunChar() != GetCharID("Bowser")) &&
                (HomerunChar() != GetCharID("Polygon Bowser"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Unbanished Beast", points = 25,
    description = "Complete Remix 1P with Giga Bowser on Very Hard and 3 stocks.",
    id = 165976, badge = "523065", published = "14.08.2021 18:36:53", modified = "08.09.2024 14:01:15",
    trigger = never(HomerunChar() != GetCharID("Giga Bowser")) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Your Worst Nightmare", points = 25,
    description = "Complete Remix 1P with Mad Piano on Very Hard and 3 stocks.",
    id = 165977, badge = "523069", published = "14.08.2021 18:40:00", modified = "08.09.2024 14:14:20",
    trigger = never(HomerunChar() != GetCharID("Mad Piano")) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "A Wild Beast", points = 25,
    description = "Complete Remix 1P with Wolf on Very Hard and 3 stocks.",
    id = 165978, badge = "523072", published = "14.08.2021 18:42:23", modified = "08.09.2024 14:14:21", 
    trigger = never((HomerunChar() != GetCharID("Wolf")) &&
                (HomerunChar() != GetCharID("Polygon Wolf"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Not So Child-Friendly", points = 25,
    description = "Complete Remix 1P with Conker on Very Hard and 3 stocks.",
    id = 165979, badge = "523066", published = "14.08.2021 18:45:04", modified = "08.09.2024 14:01:34", 
    trigger = never((HomerunChar() != GetCharID("Conker")) &&
                (HomerunChar() != GetCharID("Polygon Conker"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Legendary Victory", points = 25,
    description = "Complete Remix 1P with Mewtwo on Very Hard and 3 stocks.",
    id = 173154, badge = "523077", published = "21.09.2021 12:23:15", modified = "08.09.2024 14:14:22", 
    trigger = never((HomerunChar() != GetCharID("Mewtwo")) &&
                (HomerunChar() != GetCharID("Polygon Mewtwo"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Feeling the Blade", points = 25,
    description = "Complete Remix 1P with Marth on Very Hard and 3 stocks.",
    id = 173155, badge = "523080", published = "21.09.2021 12:23:15", modified = "08.09.2024 14:14:24", 
    trigger = never((HomerunChar() != GetCharID("Marth")) &&
                (HomerunChar() != GetCharID("Polygon Marth"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Where's Eggman?", points = 25,
    description = "Complete Remix 1P with Sonic on Very Hard and 3 stocks.",
    id = 197075, badge = "523083", published = "11.02.2022 19:39:40", modified = "08.09.2024 14:14:24", 
    trigger = never((HomerunChar() != GetCharID("Sonic")) &&
                (HomerunChar() != GetCharID("Polygon Sonic"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Power of the Chaos Emeralds", points = 25,
    description = "Complete Remix 1P with Super Sonic on Very Hard and 3 stocks.",
    id = 197076, badge = "523086", published = "11.02.2022 19:39:40", modified = "08.09.2024 14:14:25", 
    trigger = never(HomerunChar() != GetCharID("Super Sonic")) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Hidden Techniques", points = 25,
    description = "Complete Remix 1P with Sheik on Very Hard and 3 stocks.",
    id = 161714, badge = "523955", published = "11.02.2022 19:39:40", modified = "08.09.2024 14:14:24", 
    trigger = never((HomerunChar() != GetCharID("Sheik")) &&
                (HomerunChar() != GetCharID("Polygon Sheik"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Mischief Master", points = 25,
    description = "Complete Remix 1P with Marina on Very Hard and 3 stocks.",
    id = 161716, badge = "523956", published = "11.02.2022 19:39:40", modified = "08.09.2024 14:14:24", 
    trigger = never((HomerunChar() != GetCharID("Marina")) &&
                (HomerunChar() != GetCharID("Polygon Marina"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Waddle Dee Commander", points = 25,
    description = "Complete Remix 1P with King Dedede on Very Hard and 3 stocks.",
    id = 161718, badge = "523959", published = "11.02.2022 19:39:40", modified = "08.09.2024 14:14:24", 
    trigger = never((HomerunChar() != GetCharID("King Dedede")) &&
                (HomerunChar() != GetCharID("Polygon King Dedede"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Ninja Quickness", points = 25,
    description = "Complete Remix 1P with Goemon on Very Hard and 3 stocks.",
    id = 161720, badge = "523960", published = "11.02.2022 19:39:40", modified = "08.09.2024 14:14:24", 
    trigger = never((HomerunChar() != GetCharID("Goemon")) &&
                (HomerunChar() != GetCharID("Polygon Goemon"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Never Give Up", points = 25,
    description = "Complete Remix 1P with Peppy on Very Hard and 3 stocks.",
    id = 161722, badge = "523963", published = "11.02.2022 19:39:40", modified = "08.09.2024 14:14:25", 
    trigger = never(HomerunChar() != GetCharID("Peppy")) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Toadally Easy", points = 25,
    description = "Complete Remix 1P with Slippy on Very Hard and 3 stocks.",
    id = 161724, badge = "523964", published = "11.02.2022 19:39:40", modified = "08.09.2024 14:14:25", 
    trigger = never(HomerunChar() != GetCharID("Slippy")) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Eggstraordinary", points = 25,
    description = "Complete Remix 1P with Banjo & Kazooie on Very Hard and 3 stocks.",
    id = 161726, badge = "523967", published = "11.02.2022 19:39:40", modified = "08.09.2024 14:14:24", 
    trigger = never((HomerunChar() != GetCharID("Banjo & Kazooie")) &&
                (HomerunChar() != GetCharID("Polygon Banjo & Kazooie"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Great Ebisumaru", points = 25,
    description = "Complete Remix 1P with Ebisumaru on Very Hard and 3 stocks.",
    id = 161728, badge = "523968", published = "11.02.2022 19:39:40", modified = "08.09.2024 14:14:25", 
    trigger = never(HomerunChar() != GetCharID("Ebisumaru")) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Silver Is Real", points = 25,
    description = "Complete Remix 1P with Metal Luigi on Very Hard and 3 stocks.",
    id = 462598, badge = "523971", published = "11.02.2022 19:39:40", modified = "08.09.2024 14:14:25", 
    trigger = never(HomerunChar() != GetCharID("Metal Luigi")) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Remnants of Sakurai's Past", points = 25,
    description = "Complete Remix 1P with Dragon King on Very Hard and 3 stocks.",
    id = 462599, badge = "523972", published = "11.02.2022 19:39:40", modified = "08.09.2024 14:14:25", 
    trigger = never(HomerunChar() != GetCharID("Dragon King")) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "N. Sane Skillz", points = 25,
    description = "Complete Remix 1P with Crash on Very Hard and 3 stocks.",
    id = 529129, badge = "600039", published = "11.02.2022 19:39:40", modified = "08.09.2024 14:14:25", 
    trigger = never(HomerunChar() != GetCharID("Crash")) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Turn 'Ip Around", points = 25,
    description = "Complete Remix 1P with Peach on Very Hard and 3 stocks.",
    id = 529130, badge = "600040", published = "11.02.2022 19:39:40", modified = "08.09.2024 14:14:25", 
    trigger = never(HomerunChar() != GetCharID("Peach")) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Heat Check", points = 25,
    description = "Complete Remix 1P with Roy on Very Hard and 3 stocks.",
    id = 529131, badge = "600041", published = "11.02.2022 19:39:40", modified = "08.09.2024 14:14:25", 
    trigger = never(HomerunChar() != GetCharID("Roy")) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Bitter Pills", points = 25,
    description = "Complete Remix 1P with Dr. Luigi on Very Hard and 3 stocks.",
    id = 529132, badge = "600042", published = "11.02.2022 19:39:40", modified = "08.09.2024 14:14:25", 
    trigger = never(HomerunChar() != GetCharID("Dr. Luigi")) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Trombone Remix", points = 25,
    description = "Complete Remix 1P with Lanky Kong on Very Hard and 3 stocks.",
    id = 529133, badge = "600043", published = "11.02.2022 19:39:40", modified = "08.09.2024 14:14:25", 
    trigger = never(HomerunChar() != GetCharID("Lanky Kong")) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "I Don't Need More Of This", points = 25,
    description = "Complete Remix 1P with any Polygon Fighter on Very Hard.",
    id = 173156, badge = "523038", published = "21.09.2021 12:23:15", modified = "08.09.2024 13:29:37",
    trigger = never(HomerunChar() < GetCharID("Polygon Mario")) &&
              never((HomerunChar() > GetCharID("Polygon Ness")) &&
                (HomerunChar() < GetCharID("Polygon Wario"))) &&
              BeatRemix1PVeryHard() &&
              RulesCommunity()
)

achievement(
    title = "All-Time Favorite", points = 10,
    description = "Complete All-Star Mode with Mario on Very Hard and 3 stocks.",
    id = 173158, badge = "523011", published = "21.09.2021 17:45:35", modified = "08.09.2024 13:29:29", 
    trigger = never((HomerunChar() != GetCharID("Mario")) &&
                (HomerunChar() != GetCharID("JP Mario")) &&
                (HomerunChar() != GetCharID("Polygon Mario"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Space Adventure", points = 10,
    description = "Complete All-Star Mode with Fox on Very Hard and 3 stocks.",
    id = 173159, badge = "523013", published = "21.09.2021 17:45:35", modified = "08.09.2024 13:29:30", 
    trigger = never((HomerunChar() != GetCharID("Fox")) &&
                (HomerunChar() != GetCharID("JP Fox")) &&
                (HomerunChar() != GetCharID("Polygon Fox"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Donkey Konga", points = 10,
    description = "Complete All-Star Mode with Donkey Kong on Very Hard and 3 stocks.",
    id = 173160, badge = "523015", published = "21.09.2021 17:45:35", modified = "08.09.2024 13:29:30", 
    trigger = never((HomerunChar() != GetCharID("Donkey Kong")) &&
                (HomerunChar() != GetCharID("JP Donkey Kong")) &&
                (HomerunChar() != GetCharID("Polygon Donkey Kong"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Mother Brain", points = 10,
    description = "Complete All-Star Mode with Samus on Very Hard and 3 stocks.",
    id = 173161, badge = "523017", published = "21.09.2021 17:45:36", modified = "08.09.2024 13:29:30", 
    trigger = never((HomerunChar() != GetCharID("Samus")) &&
                (HomerunChar() != GetCharID("JP Samus")) &&
                (HomerunChar() != GetCharID("EU Samus")) &&
                (HomerunChar() != GetCharID("Polygon Samus"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Not A Sidekick", points = 10,
    description = "Complete All-Star Mode with Luigi on Very Hard and 3 stocks.",
    id = 173162, badge = "523019", published = "21.09.2021 17:45:36", modified = "08.09.2024 13:29:31", 
    trigger = never((HomerunChar() != GetCharID("Luigi")) &&
                (HomerunChar() != GetCharID("JP Luigi")) &&
                (HomerunChar() != GetCharID("Polygon Luigi"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Hero of Time", points = 10,
    description = "Complete All-Star Mode with Link on Very Hard and 3 stocks.",
    id = 173163, badge = "523021", published = "21.09.2021 17:45:36", modified = "08.09.2024 13:29:32", 
    trigger = never((HomerunChar() != GetCharID("Link")) &&
                (HomerunChar() != GetCharID("JP Link")) &&
                (HomerunChar() != GetCharID("EU Link")) &&
                (HomerunChar() != GetCharID("Polygon Link"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Topsy-Turvy", points = 10,
    description = "Complete All-Star Mode with Yoshi on Very Hard and 3 stocks.",
    id = 173164, badge = "523023", published = "21.09.2021 17:45:37", modified = "08.09.2024 13:29:32",
    trigger = never((HomerunChar() != GetCharID("Yoshi")) &&
                (HomerunChar() != GetCharID("JP Yoshi")) &&
                (HomerunChar() != GetCharID("Polygon Yoshi"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Falco Punch!", points = 10,
    description = "Complete All-Star Mode with Captain Falcon on Very Hard and 3 stocks.",
    id = 173165, badge = "523025", published = "21.09.2021 17:45:37", modified = "08.09.2024 13:29:33", 
    trigger = never((HomerunChar() != GetCharID("Captain Falcon")) &&
                (HomerunChar() != GetCharID("JP Captain Falcon")) &&
                (HomerunChar() != GetCharID("Polygon Captain Falcon"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Poyo!", points = 10,
    description = "Complete All-Star Mode with Kirby on Very Hard and 3 stocks.",
    id = 173166, badge = "523027", published = "21.09.2021 17:45:37", modified = "08.09.2024 13:29:34", 
    trigger = never((HomerunChar() != GetCharID("Kirby")) &&
                (HomerunChar() != GetCharID("JP Kirby")) &&
                (HomerunChar() != GetCharID("Polygon Kirby"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Electric Shock Showdown", points = 10,
    description = "Complete All-Star Mode with Pikachu on Very Hard and 3 stocks.",
    id = 173167, badge = "523029", published = "21.09.2021 17:45:38", modified = "08.09.2024 13:29:34", 
    trigger = never((HomerunChar() != GetCharID("Pikachu")) &&
                (HomerunChar() != GetCharID("JP Pikachu")) &&
                (HomerunChar() != GetCharID("EU Pikachu")) &&
                (HomerunChar() != GetCharID("Polygon Pikachu"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Jigglypuff's Song", points = 10,
    description = "Complete All-Star Mode with Jigglypuff on Very Hard and 3 stocks.",
    id = 173168, badge = "523031", published = "21.09.2021 17:45:38", modified = "08.09.2024 13:29:35",
    trigger = never((HomerunChar() != GetCharID("Jigglypuff")) &&
                (HomerunChar() != GetCharID("JP Jigglypuff")) &&
                (HomerunChar() != GetCharID("EU Jigglypuff")) &&
                (HomerunChar() != GetCharID("Polygon Jigglypuff"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Binding of Earth", points = 10,
    description = "Complete All-Star Mode with Ness on Very Hard and 3 stocks.",
    id = 173169, badge = "523033", published = "21.09.2021 17:45:38", modified = "08.09.2024 13:29:35", 
    trigger = never((HomerunChar() != GetCharID("Ness")) &&
                (HomerunChar() != GetCharID("JP Ness")) &&
                (HomerunChar() != GetCharID("Polygon Ness"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Full Metal Marionist", points = 10,
    description = "Complete All-Star Mode with Metal Mario on Very Hard and 3 stocks.",
    id = 173170, badge = "523034", published = "21.09.2021 17:45:39", modified = "08.09.2024 13:29:36",
    trigger = never(HomerunChar() != GetCharID("Metal Mario")) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Monkey D. Kong", points = 10,
    description = "Complete All-Star Mode with Giant Donkey Kong on Very Hard and 3 stocks.",
    id = 173171, badge = "523042", published = "21.09.2021 17:45:39", modified = "08.09.2024 13:29:38", 
    trigger = never(HomerunChar() != GetCharID("Giant Donkey Kong")) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "From the Shadows", points = 10,
    description = "Complete All-Star Mode with Ganondorf on Very Hard and 3 stocks.",
    id = 173172, badge = "523048", published = "21.09.2021 17:45:39", modified = "08.09.2024 13:29:41", 
    trigger = never((HomerunChar() != GetCharID("Ganondorf")) &&
                (HomerunChar() != GetCharID("Polygon Ganondorf"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Oracle of Triumph", points = 10,
    description = "Complete All-Star Mode with Young Link on Very Hard and 3 stocks.",
    id = 173173, badge = "523051", published = "21.09.2021 17:45:40", modified = "08.09.2024 13:29:42", 
    trigger = never((HomerunChar() != GetCharID("Young Link")) &&
                (HomerunChar() != GetCharID("Polygon Young Link"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Early Bird", points = 10,
    description = "Complete All-Star Mode with Falco on Very Hard and 3 stocks.",
    id = 173174, badge = "523045", published = "21.09.2021 17:45:40", modified = "08.09.2024 13:29:39", 
    trigger = never((HomerunChar() != GetCharID("Falco")) &&
                (HomerunChar() != GetCharID("Polygon Falco"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Just In Time", points = 10,
    description = "Complete All-Star Mode with Dr. Mario on Very Hard and 3 stocks.",
    id = 173175, badge = "523054", published = "21.09.2021 17:45:40", modified = "08.09.2024 13:29:43", 
    trigger = never((HomerunChar() != GetCharID("Dr. Mario")) &&
                (HomerunChar() != GetCharID("Polygon Dr. Mario"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Phazontastico", points = 10,
    description = "Complete All-Star Mode with Dark Samus on Very Hard and 3 stocks.",
    id = 173176, badge = "523060", published = "21.09.2021 17:45:41", modified = "08.09.2024 13:29:45", 
    trigger = never((HomerunChar() != GetCharID("Dark Samus")) &&
                (HomerunChar() != GetCharID("Dark Samus"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Farting Hero", points = 10,
    description = "Complete All-Star Mode with Wario on Very Hard and 3 stocks.",
    id = 173177, badge = "523057", published = "21.09.2021 17:45:41", modified = "08.09.2024 13:29:43", 
    trigger = never((HomerunChar() != GetCharID("Wario")) &&
                (HomerunChar() != GetCharID("Polygon Wario"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Little Snake", points = 10,
    description = "Complete All-Star Mode with Lucas on Very Hard and 3 stocks.",
    id = 173178, badge = "523063", published = "21.09.2021 17:45:41", modified = "08.09.2024 13:29:45", 
    trigger = never((HomerunChar() != GetCharID("Lucas")) &&
                (HomerunChar() != GetCharID("Polygon Lucas"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "King of the Koopas", points = 10,
    description = "Complete All-Star Mode with Bowser on Very Hard and 3 stocks.",
    id = 173179, badge = "523090", published = "21.09.2021 17:45:42", modified = "08.09.2024 14:14:50", 
    trigger = never((HomerunChar() != GetCharID("Bowser")) &&
                (HomerunChar() != GetCharID("Polygon Bowser"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Nightmare Beast", points = 10,
    description = "Complete All-Star Mode with Giga Bowser on Very Hard and 3 stocks.",
    id = 173180, badge = "523067", published = "21.09.2021 17:45:42", modified = "08.09.2024 14:14:20", 
    trigger = never(HomerunChar() != GetCharID("Giga Bowser")) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Haunted Object", points = 10,
    description = "Complete All-Star Mode with Mad Piano on Very Hard and 3 stocks.",
    id = 173181, badge = "523070", published = "21.09.2021 17:45:42", modified = "08.09.2024 14:14:20", 
    trigger = never(HomerunChar() != GetCharID("Mad Piano")) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Fangs of Terror", points = 10,
    description = "Complete All-Star Mode with Wolf on Very Hard and 3 stocks.",
    id = 173182, badge = "523073", published = "21.09.2021 17:45:43", modified = "08.09.2024 14:14:21", 
    trigger = never((HomerunChar() != GetCharID("Wolf")) &&
                (HomerunChar() != GetCharID("Polygon Wolf"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "That's Nuts!", points = 10,
    description = "Complete All-Star Mode with Conker on Very Hard and 3 stocks.",
    id = 173183, badge = "523075", published = "21.09.2021 17:45:43", modified = "08.09.2024 14:14:21", 
    trigger = never((HomerunChar() != GetCharID("Conker")) &&
                (HomerunChar() != GetCharID("Polygon Conker"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Mewtwo Strikes Back", points = 10,
    description = "Complete All-Star Mode with Mewtwo on Very Hard and 3 stocks.",
    id = 173184, badge = "523078", published = "21.09.2021 17:45:43", modified = "08.09.2024 14:14:22", 
    trigger = never((HomerunChar() != GetCharID("Mewtwo")) &&
                (HomerunChar() != GetCharID("Polygon Mewtwo"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "For the Kingdom", points = 10,
    description = "Complete All-Star Mode with Marth on Very Hard and 3 stocks.",
    id = 173185, badge = "523081", published = "21.09.2021 17:45:44", modified = "08.09.2024 14:14:24", 
    trigger = never((HomerunChar() != GetCharID("Marth")) &&
                (HomerunChar() != GetCharID("Polygon Marth"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Half the Power", points = 10,
    description = "Complete All-Star Mode with any Polygon Fighter on Very Hard.",
    id = 173186, badge = "523039", published = "21.09.2021 17:45:44", modified = "08.09.2024 13:29:37", 
    trigger = never(HomerunChar() < GetCharID("Polygon Mario")) &&
              never((HomerunChar() > GetCharID("Polygon Ness")) &&
                (HomerunChar() < GetCharID("Polygon Wario"))) &&
              BeatAllstarsVeryHard() &&
              RulesCommunity()
)

achievement(
    title = "Look At My Sneakers", points = 10,
    description = "Complete All-Star Mode with Sonic on Very Hard and 3 stocks.",
    id = 197077, badge = "523084", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:14:24", 
    trigger = never((HomerunChar() != GetCharID("Sonic")) &&
                (HomerunChar() != GetCharID("Polygon Sonic"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Chaos Control!", points = 10,
    description = "Complete All-Star Mode with Super Sonic on Very Hard and 3 stocks.",
    id = 197078, badge = "523087", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:14:26", 
    trigger = never(HomerunChar() != GetCharID("Super Sonic")) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Princess' Secret", points = 10,
    description = "Complete All-Star Mode with Sheik on Very Hard and 3 stocks.",
    id = 161704, badge = "523872", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:14:26", 
    trigger = never((HomerunChar() != GetCharID("Sheik")) &&
                  (HomerunChar() != GetCharID("Polygon Sheik"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Shaken, Not Stirred!", points = 10,
    description = "Complete All-Star Mode with Marina on Very Hard and 3 stocks.",
    id = 161705, badge = "523873", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:14:26", 
    trigger = never((HomerunChar() != GetCharID("Marina")) &&
                  (HomerunChar() != GetCharID("Polygon Marina"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Good Penguin", points = 10,
    description = "Complete All-Star Mode with King Dedede on Very Hard and 3 stocks.",
    id = 161706, badge = "523874", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:14:26", 
    trigger = never((HomerunChar() != GetCharID("King Dedede")) &&
                  (HomerunChar() != GetCharID("Polygon King Dedede"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Hero of Odeo", points = 10,
    description = "Complete All-Star Mode with Goemon on Very Hard and 3 stocks.",
    id = 161721, badge = "523875", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:14:26", 
    trigger = never((HomerunChar() != GetCharID("Goemon")) &&
                  (HomerunChar() != GetCharID("Polygon Goemon"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Hare's Legacy", points = 10,
    description = "Complete All-Star Mode with Peppy on Very Hard and 3 stocks.",
    id = 161723, badge = "523876", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:14:26", 
    trigger = never(HomerunChar() != GetCharID("Peppy")) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Tactical Expert", points = 10,
    description = "Complete All-Star Mode with Slippy on Very Hard and 3 stocks.",
    id = 161725, badge = "523877", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:14:26", 
    trigger = never(HomerunChar() != GetCharID("Slippy")) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Double Trouble", points = 10,
    description = "Complete All-Star Mode with Banjo & Kazooie on Very Hard and 3 stocks.",
    id = 161727, badge = "523905", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:14:26", 
    trigger = never((HomerunChar() != GetCharID("Banjo & Kazooie")) &&
                  (HomerunChar() != GetCharID("Polygon Banjo & Kazooie"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Mighty? I Thought You Mean Weighty...", points = 10,
    description = "Complete All-Star Mode with Ebisumaru on Very Hard and 3 stocks.",
    id = 161711, badge = "523906", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:14:26", 
    trigger = never(HomerunChar() != GetCharID("Ebisumaru")) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Not Just Scrap Metal", points = 10,
    description = "Complete All-Star Mode with Metal Luigi on Very Hard and 3 stocks.",
    id = 161712, badge = "523907", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:14:26", 
    trigger = never(HomerunChar() != GetCharID("Metal Luigi")) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "King of the Fists", points = 10,
    description = "Complete All-Star Mode with Dragon King on Very Hard and 3 stocks.",
    id = 161713, badge = "523953", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:14:26", 
    trigger = never(HomerunChar() != GetCharID("Dragon King")) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Twisted Adventure", points = 10,
    description = "Complete All-Star Mode with Crash on Very Hard and 3 stocks.",
    id = 529134, badge = "600044", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:14:26", 
    trigger = never(HomerunChar() != GetCharID("Crash")) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Crowned Winner", points = 10,
    description = "Complete All-Star Mode with Peach on Very Hard and 3 stocks.",
    id = 529135, badge = "600045", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:14:26", 
    trigger = never(HomerunChar() != GetCharID("Peach")) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Prince of Pherae", points = 10,
    description = "Complete All-Star Mode with Roy on Very Hard and 3 stocks.",
    id = 529136, badge = "600046", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:14:26", 
    trigger = never(HomerunChar() != GetCharID("Roy")) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Green Medicine, Red Results", points = 10,
    description = "Complete All-Star Mode with Dr. Luigi on Very Hard and 3 stocks.",
    id = 529137, badge = "600047", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:14:26", 
    trigger = never(HomerunChar() != GetCharID("Dr. Luigi")) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Make A Balloon of A Buffoon", points = 10,
    description = "Complete All-Star Mode with Lanky Kong on Very Hard and 3 stocks.",
    id = 529138, badge = "600048", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:14:26", 
    trigger = never(HomerunChar() != GetCharID("Lanky Kong")) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Everyone Is Here", points = 5, type = "progression",
    description = "Complete All-Star Mode on Normal.",
    id = 532083, badge = "599965", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:14:26", 
    trigger = BeatAllstarsNormal() &&
              RulesCommunity()
)

achievement(
    title = "Sharp Shots on Targets", points = 25, type="progression",
    description = "Complete Normal Bonus 1 'Break The Targets' for every character.",
    id = 166068, badge = "523105", published = "15.08.2021 02:02:32", modified = "08.09.2024 14:31:05", 
    trigger = BeatAllBonus1()
)

achievement(
    title = "Precise Jumps on Platforms", points = 25, type="progression",
    description = "Complete Normal Bonus 2 'Board The Platforms' for every character.",
    id = 166069, badge = "523106", published = "15.08.2021 02:02:32", modified = "08.09.2024 14:31:05", 
    trigger = BeatAllBonus2()
)

achievement(
    title = "Speeding Away", points = 3,
    description = "Complete Normal Bonus 3 'Race To The Finish' within 20 seconds.",
    id = 463455, badge = "525007", published = "15.08.2021 02:02:32", modified = "08.09.2024 14:31:05", 
    trigger = LB_Bonus3("Normal") && 
              Bonus3Timer() >= 1 &&    
              Bonus3Timer() <= 1200 &&
              dword(Mem_HighscoreOn) == 1
)

achievement(
    title = "In One Motion", points = 4,
    description = "Complete Remix Bonus 3 'Race To The Finish' within 20 seconds.",
    id = 463456, badge = "525008", published = "15.08.2021 02:02:32", modified = "08.09.2024 14:31:05", 
    trigger = LB_Bonus3("Remix") && 
              Bonus3Timer() >= 1 &&    
              Bonus3Timer() <= 1200 &&
              dword(Mem_HighscoreOn) == 1
)

achievement(
    title = "Smash Royal", points = 10, type="",
    description = "Finish a game of Multi-Man Mode with 100 or more KOs.",
    id = 166085, badge = "523091", published = "15.08.2021 12:14:16", modified = "08.09.2024 14:18:30", 
    trigger = prev(NormalModeChar1Stocks()) == 0 &&
              NormalModeChar1Stocks() == 0xFF &&
              GameState() == 0x77 &&
              dword(Mem_MultiManKills) >= 100 &&
              byte(Mem_GameMode) == 0x02 &&            
              RulesCommunity()
)

achievement(
    title = "Thousands of Victories", points = 25, type="progression",
    description = "Get a total of 2.500 KOs in Multi-Man Mode.",
    id = 531882, badge = "603729", published = "15.08.2021 12:14:16", modified = "08.09.2024 14:18:30", 
    trigger = TotalScoreAchievement(0x02, 2500) &&
              RulesCommunity()
)

achievement(
    title = "Expert Training", points = 10, type="",
    description = "Finish a game of Cruel Multi-Man Mode with 5 or more KOs.",
    id = 166086, badge = "523092", published = "15.08.2021 12:14:16", modified = "08.09.2024 14:18:31", 
    trigger = prev(NormalModeChar1Stocks()) == 0 &&
              NormalModeChar1Stocks() == 0xFF &&
              GameState() == 0x77 &&
              dword(Mem_MultiManKills) >= 5 &&
              byte(Mem_GameMode) == 0x03 &&
              RulesCommunity()
)

achievement(
    title = "All Men Are My Main", points = 25, type="progression",
    description = "Get a total of 50 KOs in Cruel Multi-Man Mode.",
    id = 531884, badge = "603731", published = "15.08.2021 12:14:16", modified = "08.09.2024 14:18:30", 
    trigger = TotalScoreAchievement(0x03, 50) &&
              RulesCommunity()
)

achievement(
    title = "Last One Standing", points = 10, type = "progression",
    description = "Win a 12-Character Battle against a COM on Level 5 without leaving the mode.",
    id = 532084, badge = "600070", published = "15.08.2021 17:18:38", modified = "08.09.2024 17:22:06",
    trigger = Beat12CharacterBattleCPU5() &&
              never(byte(Mem_12CharacterStocks + 0xBC) != 0) &&
              never(byte(Mem_12CharacterStocks + 0xBC) != byte(Mem_12CharacterStocks + 0x190)) &&
              RulesCommunity()
)

achievement(
    title = "Original Battle Royale", points = 25,
    description = "Win a 12-Character Battle with the Default Team against a COM using the same on Level 9 without leaving the mode.",
    id = 166165, badge = "523217", published = "15.08.2021 17:18:38", modified = "08.09.2024 17:22:06",
    trigger = Beat12CharacterBattleCPU9() &&
              never(byte(Mem_12CharacterStocks + 0xBC) != 0) &&
              never(byte(Mem_12CharacterStocks + 0xBC) != byte(Mem_12CharacterStocks + 0x190)) &&
              RulesCommunity()
)

achievement(
    title = "From A Foreign Country", points = 25,
    description = "Win a 12-Character Battle with the Japanese Team against a COM using the same on Level 9 without leaving the mode.",
    id = 462249, badge = "523500", published = "09.09.2024 17:19:48", modified = "09.09.2024 17:33:50", 
    trigger = Beat12CharacterBattleCPU9() &&
              never(byte(Mem_12CharacterStocks + 0xBC) != 1) &&
              never(byte(Mem_12CharacterStocks + 0xBC) != byte(Mem_12CharacterStocks + 0x190)) &&
              RulesCommunity()
)

achievement(
    title = "Count the Polygons", points = 25,
    description = "Win a 12-Character Battle with the Polygon Team against a COM using the same on Level 9 without leaving the mode.",
    id = 462250, badge = "523499", published = "09.09.2024 17:24:34", modified = "09.09.2024 17:31:43", 
    trigger = Beat12CharacterBattleCPU9() &&
              never(byte(Mem_12CharacterStocks + 0xBC) != 2) &&
              never(byte(Mem_12CharacterStocks + 0xBC) != byte(Mem_12CharacterStocks + 0x190)) &&
              RulesCommunity()
)

achievement(
    title = "Mixing Everything Up", points = 25,
    description = "Win a 12-Character Battle with the Remix Team against a COM using the same on Level 9 without leaving the mode.",
    id = 462251, badge = "523501", published = "09.09.2024 17:24:34", modified = "09.09.2024 17:31:48", 
    trigger = Beat12CharacterBattleCPU9() &&
              never(byte(Mem_12CharacterStocks + 0xBD) != 3) &&
              never(byte(Mem_12CharacterStocks + 0xBD) != byte(Mem_12CharacterStocks + 0x190)) &&
              RulesCommunity()
)

achievement(
    title = "How to Make Mochi!", points = 10, type="",
    description = "Get a distance of 4500.0 feet or more in Home-Run Contest.",
    id = 197079, badge = "523093", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:18:55", 
    trigger = byte(Mem_GameMode) == 0x06 &&
              prev(Bonus3State()) != 0x06 &&
              Bonus3State() == 0x06 &&
              dword(Mem_HomerunDistance) >= 45000 &&
              dword(Mem_HomerunDistance) <= 1000000 &&
              RulesCommunity() &&
              never(dword(Mem_HighscoreOn)  == 0x00)
)

achievement(
    title = "Cloudy with a Chance of Sandbags", points = 25, type="progression",
    description = "Get a total distance of 250000.0 in Home-Run Contest.",
    id = 531883, badge = "603730", published = "15.08.2021 12:14:16", modified = "08.09.2024 14:18:30", 
    trigger = TotalScoreAchievement(0x06, 2500000) &&
              RulesCommunity()
)

achievement(
    title = "Smash Randomizer", points = 5, type="progression",
    description = "Win a Tag Team match against a COM on Level 5 with 6 stocks and all stocks of both players set to Random.",
    id = 529741, badge = "600855", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:18:55", 
    trigger = BeatTagTeam(0) ||
              BeatTagTeam(1)
)

achievement(
    title = "Get Out Of My Zone", points = 5, type="progression",
    description = "Win a King of the Hill match against three COMs on Level 5.",
    id = 529737, badge = "600853", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:18:55", 
    trigger = (BeatKingOfTheHill(0) ||
               BeatKingOfTheHill(1) || 
               BeatKingOfTheHill(2) ||
               BeatKingOfTheHill(3)) &&
              RulesCommunity()
)

achievement(
    title = "National Smashketball Association", points = 5, type="progression",
    description = "Win a Smashketball 1 match against a COM on Level 9 with a lead of 5 points or more.",
    id = 529258, badge = "600224", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:18:55", 
    trigger = (BeatSmashketball5Points("Basketball", 0) ||
               BeatSmashketball5Points("Basketball", 1)) &&
              RulesCommunity()
)

achievement(
    title = "Champions League", points = 5, type="progression",
    description = "Win a Smashketball 2 match against a COM on Level 9 with a lead of 5 points or more.",
    id = 529259, badge = "600225", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:18:55", 
    trigger = (BeatSmashketball5Points("Soccer", 0) ||
               BeatSmashketball5Points("Soccer", 1)) &&
              RulesCommunity()
)

achievement(
    title = "Golden Goal", points = 2, type="",
    description = "In Smashketball 2 make a goal that is worth 3 points.",
    id = 531954, badge = "603799", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:18:55", 
    trigger = byte(Mem_VSMode) == 4 &&
              byte(Mem_SmashketballData) == 1 &&
              RulesCommunity() &&
              (dword(Mem_SmashketballData + 0x50) - prev(dword(Mem_SmashketballData + 0x50)) == 3 || 
               dword(Mem_SmashketballData + 0x54) - prev(dword(Mem_SmashketballData + 0x54)) == 3 ||
               dword(Mem_SmashketballData + 0x58) - prev(dword(Mem_SmashketballData + 0x58)) == 3 ||
               dword(Mem_SmashketballData + 0x5C) - prev(dword(Mem_SmashketballData + 0x5C)) == 3)
)

achievement(
    title = "Oh Boy, He's On Fire!", points = 3,
    description = "Win a Smashketball match against a COM on Level 9 without letting the COM score once.",
    id = 529908, badge = "601042", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:18:55", 
    trigger = (BeatSmashketballCOM0("Basketball", 0) ||
               BeatSmashketballCOM0("Basketball", 1) ||
               BeatSmashketballCOM0("Soccer", 0) ||
               BeatSmashketballCOM0("Soccer", 1)) &&
              RulesCommunity()
)

achievement(
    title = "Combo King", points = 5,
    description = "Get a combo of 15 hits against a COM in Free-for-All mode.",
    id = 166087, badge = "523094", published = "15.08.2021 13:40:15", modified = "08.09.2024 14:19:29", 
    trigger = GameState() == 0x16 &&
              byte(Mem_VSMode) == 0 &&
              (FreeModeCombo(1, 2) ||
               FreeModeCombo(1, 3) ||
               FreeModeCombo(1, 4) ||
               FreeModeCombo(2, 1) ||
               FreeModeCombo(2, 3) ||
               FreeModeCombo(2, 4) ||
               FreeModeCombo(3, 1) ||
               FreeModeCombo(3, 2) ||
               FreeModeCombo(3, 4) ||
               FreeModeCombo(4, 1) ||
               FreeModeCombo(4, 2) ||
               FreeModeCombo(4, 3)) &&
              RulesCommunity() &&
              never(dword(Mem_HighscoreOn)  == 0x00)
)

achievement(
    title = "Wanna Be A New Fighter", points = 5,
    description = "Copy as Kirby the ability of every other character in a single session.",
    id = 166084, badge = "523095", published = "15.08.2021 11:46:21", modified = "08.09.2024 14:19:29", 
    trigger = KirbyCopyAbility(0) ||
              KirbyCopyAbility(1) ||
              KirbyCopyAbility(2) ||
              KirbyCopyAbility(3)
)

achievement(
    title = "Watch Your Fingers", points = 2,
    description = "Use any Luigi variant to kick a COM who is grabbing a ledge straight down without ability to recover.",
    id = 529430, badge = "600405", published = "15.08.2021 11:46:21", modified = "08.09.2024 14:19:29", 
    trigger = LuigiKnockDown(0, 1) || 
              LuigiKnockDown(0, 2) || 
              LuigiKnockDown(0, 3) || 
              LuigiKnockDown(1, 0) || 
              LuigiKnockDown(1, 2) || 
              LuigiKnockDown(1, 3) || 
              LuigiKnockDown(2, 0) || 
              LuigiKnockDown(2, 1) || 
              LuigiKnockDown(2, 3) || 
              LuigiKnockDown(3, 0) || 
              LuigiKnockDown(3, 1) || 
              LuigiKnockDown(3, 2) 
)

achievement(
    title = "Hurry Up, Will Yah?!", points = 1,
    description = "Let Wario complain about you.",
    id = 166157, badge = "523096", published = "15.08.2021 14:57:24", modified = "08.09.2024 14:19:55", 
    trigger = (GameState() == 16 || GameState() == 17 || GameState() == 18 || GameState() == 24) &&
              ((GameState() != 18 &&
               byte(PointerPlayerData() + 0x000008) == GetCharID("Wario") &&
                prev(dword(PointerPlayerData() + 0x00086C)) == Val_WarioComplain &&
                dword(PointerPlayerData() + 0x00086C) == Val_WarioComplain + 0x0C) ||
               (GameState() != 18 &&
               byte(PointerPlayerData() + 0x00B588) == GetCharID("Wario") &&
                prev(dword(PointerPlayerData() + 0x0013BC)) == Val_WarioComplain &&
                dword(PointerPlayerData() + 0x0013BC) == Val_WarioComplain + 0x0C) ||
               (GameState() != 18 &&
               byte(PointerPlayerData() + 0x0016A8) == GetCharID("Wario") &&
                prev(dword(PointerPlayerData() + 0x001F0C)) == Val_WarioComplain &&
                dword(PointerPlayerData() + 0x001F0C) == Val_WarioComplain + 0x0C) ||
               (GameState() != 18 &&
               byte(PointerPlayerData() + 0x0021F8) == GetCharID("Wario") &&
                prev(dword(PointerPlayerData() + 0x002A5C)) == Val_WarioComplain &&
                dword(PointerPlayerData() + 0x002A5C) == Val_WarioComplain + 0x0C) ||
               (GameState() == 18 &&
               byte(0x1385A0) == GetCharID("Wario") &&
               prev(dword(PointerPlayerData() + 0x0013BC)) == Val_WarioComplain &&
                dword(PointerPlayerData() + 0x0013BC) == Val_WarioComplain + 0x0C) ||
               (GameState() == 18 &&
               byte(0x138658) == GetCharID("Wario") &&
               prev(dword(PointerPlayerData() + 0x00086C)) == Val_WarioComplain &&
                dword(PointerPlayerData() + 0x00086C) == Val_WarioComplain + 0x0C))
)

achievement(
    title = "There He Goes!", points = 1,
    description = "Let Wario say his famous quote while ramming his enemies.",
    id = 530687, badge = "602093", published = "15.08.2021 14:57:24", modified = "08.09.2024 14:19:55", 
    trigger = WarioGoing(0) || 
              WarioGoing(1) || 
              WarioGoing(2) || 
              WarioGoing(3)
)

achievement(
    title = "Shake! Shake!", points = 1,
    description = "Let Marina say her famous quote while shaking her enemy.",
    id = 529984, badge = "601072", published = "15.08.2021 14:57:24", modified = "08.09.2024 14:19:55", 
    trigger = MarinaShaking(0) || 
              MarinaShaking(1) || 
              MarinaShaking(2) || 
              MarinaShaking(3)
)

achievement(
    title = "Do a Barrel Roll!", points = 1,
    description = "Let Peppy say his famous quote while doing some rolls.",
    id = 530656, badge = "602048", published = "15.08.2021 14:57:24", modified = "08.09.2024 14:19:55", 
    trigger = PeppyBarrelRolling(0) || 
              PeppyBarrelRolling(1) || 
              PeppyBarrelRolling(2) || 
              PeppyBarrelRolling(3)
)

achievement(
    title = "Welcome to Hell", points = 1,
    description = "Listen to a sinister laughing while starting the game.",
    id = 529986, badge = "601073", published = "15.08.2021 14:57:24", modified = "08.09.2024 14:19:55", 
    trigger = GameState() == 0x37 &&
              prev(GameState()) == 0x1B &&
              (bit5(0x9EFA0 + 0x6 + 8*0) == 1 ||
               bit5(0x9EFA0 + 0x6 + 8*1) == 1 ||
               bit5(0x9EFA0 + 0x6 + 8*2) == 1 ||
               bit5(0x9EFA0 + 0x6 + 8*3) == 1)
)

achievement(
    title = "Behind the Scenes", points = 1,
    description = "Listen to all background noises while looking at your images.",
    id = 531953, badge = "603798", published = "15.08.2021 14:57:24", modified = "08.09.2024 14:19:55", 
    trigger = measured(tally(36, once(GallerySounds(0x00, 0)),
                        once(GallerySounds(0x00, 1)),
                        once(GallerySounds(0x01, 0)),
                        once(GallerySounds(0x01, 1)),
                        once(GallerySounds(0x02, 0)),
                        once(GallerySounds(0x02, 1)),
                        once(GallerySounds(0x03, 0)),
                        once(GallerySounds(0x03, 1)),
                        once(GallerySounds(0x04, 0)),
                        once(GallerySounds(0x04, 1)),
                        once(GallerySounds(0x05, 0)),
                        once(GallerySounds(0x05, 1)),
                        once(GallerySounds(0x06, 0)),
                        once(GallerySounds(0x06, 1)),
                        once(GallerySounds(0x07, 0)),
                        once(GallerySounds(0x07, 1)),
                        once(GallerySounds(0x08, 0)),
                        once(GallerySounds(0x08, 1)),
                        once(GallerySounds(0x09, 0)),
                        once(GallerySounds(0x09, 1)),
                        once(GallerySounds(0x0A, 0)),
                        once(GallerySounds(0x0A, 1)),
                        once(GallerySounds(0x0B, 0)),
                        once(GallerySounds(0x0B, 1)),
                        once(GallerySounds(0x0C, 0)),
                        once(GallerySounds(0x0C, 1)),
                        once(GallerySounds(0x0D, 0)),
                        once(GallerySounds(0x0D, 1)),
                        once(GallerySounds(0x0E, 0)),
                        once(GallerySounds(0x0E, 1)),
                        once(GallerySounds(0x0F, 0)),
                        once(GallerySounds(0x0F, 1)),
                        once(GallerySounds(0x10, 0)),
                        once(GallerySounds(0x10, 1)),
                        once(GallerySounds(0x11, 0)),
                        once(GallerySounds(0x11, 1))), when=always_true(), format="raw")
)

achievement(
    title = "Ape-Normal Head Size", points = 3,
    description = "Enable Donkey Kong mode.",
    id = 529988, badge = "601078", published = "15.08.2021 14:57:24", modified = "08.09.2024 14:19:55", 
    trigger = GameState() == 0x10 &&
              dword(Mem_BattleSetting + 0xC1A3C) != prev(dword(Mem_BattleSetting + 0xC1A3C)) &&
              dword(Mem_BattleSetting + 0xC1A3C) == 1
)

achievement(
    title = "Diddy Long Leg", points = 3,
    description = "Enable Lanky Kong mode.",
    id = 529989, badge = "601079", published = "15.08.2021 14:57:24", modified = "08.09.2024 14:19:55", 
    trigger = GameState() == 0x10 &&
              dword(Mem_BattleSetting + 0xC1A3C) != prev(dword(Mem_BattleSetting + 0xC1A3C)) &&
              dword(Mem_BattleSetting + 0xC1A3C) == 2
)

achievement(
    title = "Dear Mario...", points = 1,
    description = "Find a hidden letter from Peach.",
    id = 530000, badge = "601090", published = "15.08.2021 14:57:24", modified = "08.09.2024 14:19:55", 
    trigger = GameState() == 0x1A &&
              byte(PointerPlayerData() + 0x08) != prev(byte(PointerPlayerData() + 0x08)) &&
              byte(PointerPlayerData() + 0x08) == GetCharID("Peach")
)

achievement(
    title = "Giving It Some Extra Touch", points = 1,
    description = "Set your main menu music to a remixed version of Super Mario 64.",
    id = 530051, badge = "601149", published = "15.08.2021 14:57:24", modified = "08.09.2024 14:19:55", 
    trigger = GameState() == 0x39 &&
              dword(0x96710) != prev(dword(0x96710)) &&
              dword(0x96710) == 0x104
)

achievement(
    title = "Game Boy Pak", points = 3,
    description = "Set your main menu music to Game Boy games music.",
    id = 530411, badge = "602037", published = "15.08.2021 14:57:24", modified = "08.09.2024 14:19:55", 
    trigger = GameState() == 0x39 &&
              dword(0x96710) != prev(dword(0x96710)) &&
              dword(0x96710) >= 0xA2 &&
              dword(0x96710) <= 0xA5
)

achievement(
    title = "AFKing for the 1,000,000 VS Mode Matches", points = 2,
    description = "Finish three Free-for-All matches in a row without touching any controller after the characters were selected once.",
    id = 530646, badge = "602036", published = "15.08.2021 14:57:24", modified = "08.09.2024 14:19:55", 
    trigger = once(GameState() == 0x10 &&
                   (byte(0x13BAE0) > prev(byte(0x13BAE0)) ||
                    byte(0x13BB9C) > prev(byte(0x13BB9C)) ||
                    byte(0x13BC58) > prev(byte(0x13BC58)) ||
                    byte(0x13BD14) > prev(byte(0x13BD14)))) &&
              once(prev(GameState() == 0x10) &&
                   GameState() >= 0x15) &&
              trigger_when(tally(3, GameState() == 0x16 &&
                                    prev(byte(0xA4D1A) != 0x06) &&
                                    byte(0xA4D1A) == 0x06)) &&
              never(GameState() == 0x10 &&
                    byte(0x13BAE0) == prev(byte(0x13BAE0)) &&
                    byte(0x13BB9C) == prev(byte(0x13BB9C)) &&
                    byte(0x13BC58) == prev(byte(0x13BC58)) &&
                    byte(0x13BD14) == prev(byte(0x13BD14)) &&
                    (byte(0x9EFA3) != prev(byte(0x9EFA3)) || 
                     dword(0x9EFA4) > prev(dword(0x9EFA4)) ||
                     byte(0x9EFAB) != prev(byte(0x9EFAB)) || 
                     dword(0x9EFAC) > prev(dword(0x9EFAC)) ||
                     byte(0x9EFB3) != prev(byte(0x9EFB3)) || 
                     dword(0x9EFB4) > prev(dword(0x9EFB4)) ||
                     byte(0x9EFBB) != prev(byte(0x9EFBB)) || 
                     dword(0x9EFBC) > prev(dword(0x9EFBC)))) &&
              never(GameState() != 0x10 &&
                    (byte(0x9EFA3) != prev(byte(0x9EFA3)) || 
                     dword(0x9EFA4) > prev(dword(0x9EFA4)) ||
                     byte(0x9EFAB) != prev(byte(0x9EFAB)) || 
                     dword(0x9EFAC) > prev(dword(0x9EFAC)) ||
                     byte(0x9EFB3) != prev(byte(0x9EFB3)) || 
                     dword(0x9EFB4) > prev(dword(0x9EFB4)) ||
                     byte(0x9EFBB) != prev(byte(0x9EFBB)) || 
                     dword(0x9EFBC) > prev(dword(0x9EFBC)))) &&
              never(byte(Mem_VSMode) != 0) &&
              never(GameState() == 0x09)
)

achievement(
    title = "72 Hours Remaining", points = 1,
    description = "Play the Song of Time on the stage 'Great Bay'.",
    id = 530652, badge = "602044", published = "15.08.2021 14:57:24", modified = "08.09.2024 14:19:55", 
    trigger = GameState() == 0x16 &&
              FreeModeStage() == GetStageID("Great Bay") &&
              SoundWasPlayed(0x3CA8788)
)

achievement(
    title = "I Don't Know What Y'all Are Watching", points = 1,
    description = "Take a close look of Charles Barkley.",
    id = 529982, badge = "602724", published = "15.08.2021 14:57:24", modified = "08.09.2024 14:19:55", 
    trigger = (GameState() == 0x10 || GameState() == 0x16) &&
              FreeModeStage() == GetStageID("Smashketball") &&
              float(tbyte(Mem_CameraData) + 0x0D0) >= -500.0 &&
              float(tbyte(Mem_CameraData) + 0x0D0) <= 500.0 &&
              float(tbyte(Mem_CameraData) + 0x0D4) >= 500.0 &&
              float(tbyte(Mem_CameraData) + 0x0D4) <= 1500.0 &&
              float(tbyte(Mem_CameraData) + 0x0CC) >= -2000.0 &&
              float(tbyte(Mem_CameraData) + 0x0CC) <= -800.0 &&
              float(tbyte(Mem_CameraData) + 0x0C4) - float(tbyte(Mem_CameraData) + 0x0D0) >= -200.0 &&
              float(tbyte(Mem_CameraData) + 0x0C4) - float(tbyte(Mem_CameraData) + 0x0D0) <= 200.0 &&
              float(tbyte(Mem_CameraData) + 0x0C8) - float(tbyte(Mem_CameraData) + 0x0D4) >= -200.0 &&
              float(tbyte(Mem_CameraData) + 0x0C8) - float(tbyte(Mem_CameraData) + 0x0D4) <= 200.0
)

achievement(
    title = "Fetching Ball With Your Pal", points = 1,
    description = "Take a close look of Paulie the Dog.",
    id = 529983, badge = "601071", published = "15.08.2021 14:57:24", modified = "08.09.2024 14:19:55", 
    trigger = (GameState() == 0x10 || GameState() == 0x16) &&
              FreeModeStage() == GetStageID("Smashketball 2") &&
              float(tbyte(Mem_CameraData) + 0x0D0) >= -500.0 &&
              float(tbyte(Mem_CameraData) + 0x0D0) <= 500.0 &&
              float(tbyte(Mem_CameraData) + 0x0D4) >= 500.0 &&
              float(tbyte(Mem_CameraData) + 0x0D4) <= 1500.0 &&
              float(tbyte(Mem_CameraData) + 0x0CC) >= -2000.0 &&
              float(tbyte(Mem_CameraData) + 0x0CC) <= -800.0 &&
              float(tbyte(Mem_CameraData) + 0x0C4) - float(tbyte(Mem_CameraData) + 0x0D0) >= -200.0 &&
              float(tbyte(Mem_CameraData) + 0x0C4) - float(tbyte(Mem_CameraData) + 0x0D0) <= 200.0 &&
              float(tbyte(Mem_CameraData) + 0x0C8) - float(tbyte(Mem_CameraData) + 0x0D4) >= -200.0 &&
              float(tbyte(Mem_CameraData) + 0x0C8) - float(tbyte(Mem_CameraData) + 0x0D4) <= 200.0
)

achievement(
    title = "Have a Lunch Break", points = 2,
    description = "Take a close look of a plate filled with sushi.",
    id = 530710, badge = "602143", published = "15.08.2021 14:57:24", modified = "08.09.2024 14:19:55", 
    trigger = (GameState() == 0x10 || GameState() == 0x16) &&
              FreeModeStage() == GetStageID("Mushroom Kingdom SR") &&
              float(tbyte(Mem_CameraData) + 0x0D0) >= -1990.0 &&
              float(tbyte(Mem_CameraData) + 0x0D0) <= -1790.0 &&
              float(tbyte(Mem_CameraData) + 0x0D4) >= 2530.0 &&
              float(tbyte(Mem_CameraData) + 0x0D4) <= 2680.0 &&
              float(tbyte(Mem_CameraData) + 0x0CC) >= 600.0 &&
              float(tbyte(Mem_CameraData) + 0x0CC) <= 750.0 &&
              float(tbyte(Mem_CameraData) + 0x0C4) - float(tbyte(Mem_CameraData) + 0x0D0) >= -100.0 &&
              float(tbyte(Mem_CameraData) + 0x0C4) - float(tbyte(Mem_CameraData) + 0x0D0) <= 100.0 &&
              float(tbyte(Mem_CameraData) + 0x0C8) - float(tbyte(Mem_CameraData) + 0x0D4) >= 200.0 &&
              float(tbyte(Mem_CameraData) + 0x0C8) - float(tbyte(Mem_CameraData) + 0x0D4) <= 400.0
)

achievement(
    title = "Don't Forget To Save", points = 1,
    description = "Take a close look of Resetti.",
    id = 531025, badge = "602563", published = "15.08.2021 14:57:24", modified = "08.09.2024 14:19:55", 
    trigger = (GameState() == 0x10 || GameState() == 0x16) &&
              FreeModeStage() == GetStageID("Smashville") &&
              float(tbyte(Mem_CameraData) + 0x0D0) >= 235.0 &&
              float(tbyte(Mem_CameraData) + 0x0D0) <= 635.0 &&
              float(tbyte(Mem_CameraData) + 0x0D4) >= 150.0 &&
              float(tbyte(Mem_CameraData) + 0x0D4) <= 350.0 &&
              float(tbyte(Mem_CameraData) + 0x0CC) >= -3900.0 &&
              float(tbyte(Mem_CameraData) + 0x0CC) <= -3200.0 &&
              float(tbyte(Mem_CameraData) + 0x0C4) - float(tbyte(Mem_CameraData) + 0x0D0) >= 1450.0 &&
              float(tbyte(Mem_CameraData) + 0x0C4) - float(tbyte(Mem_CameraData) + 0x0D0) <= 1930.0 &&
              float(tbyte(Mem_CameraData) + 0x0C8) - float(tbyte(Mem_CameraData) + 0x0D4) >= -200.0 &&
              float(tbyte(Mem_CameraData) + 0x0C8) - float(tbyte(Mem_CameraData) + 0x0D4) <= 200.0
)

achievement(
    title = "Enjoy Your Stay", points = 1,
    description = "Take a close look of a female villager.",
    id = 530803, badge = "602559", published = "15.08.2021 14:57:24", modified = "08.09.2024 14:19:55", 
    trigger = (GameState() == 0x10 || GameState() == 0x16) &&
              FreeModeStage() == GetStageID("Smashville Remix") &&
              float(tbyte(Mem_CameraData) + 0x0D0) >= 235.0 &&
              float(tbyte(Mem_CameraData) + 0x0D0) <= 635.0 &&
              float(tbyte(Mem_CameraData) + 0x0D4) >= 150.0 &&
              float(tbyte(Mem_CameraData) + 0x0D4) <= 350.0 &&
              float(tbyte(Mem_CameraData) + 0x0CC) >= -3900.0 &&
              float(tbyte(Mem_CameraData) + 0x0CC) <= -3200.0 &&
              float(tbyte(Mem_CameraData) + 0x0C4) - float(tbyte(Mem_CameraData) + 0x0D0) >= 1450.0 &&
              float(tbyte(Mem_CameraData) + 0x0C4) - float(tbyte(Mem_CameraData) + 0x0D0) <= 1930.0 &&
              float(tbyte(Mem_CameraData) + 0x0C8) - float(tbyte(Mem_CameraData) + 0x0D4) >= -200.0 &&
              float(tbyte(Mem_CameraData) + 0x0C8) - float(tbyte(Mem_CameraData) + 0x0D4) <= 200.0
)

achievement(
    title = "Crazy Maneuvers", points = 3,
    description = "Collect the extra life and then break all targets in Crash's Bonus 1 without using Super Sonic.",
    id = 529331, badge = "600294", published = "15.08.2021 11:46:21", modified = "08.09.2024 14:19:29", 
    trigger = never(Bonus12Char() == GetCharID("Super Sonic")) &&
              Bonus12Stage() == GetStageID("Breaking the Targets of Crash") &&
              Bonus12State() >= 1 &&
              Bonus12State() <= 7 &&
              trigger_when(prev(Bonus1Targets() == 1) &&
                           Bonus1Targets() == 0) &&
              disable_when(dword(Mem_CurrentMusicTrack) != GetTrackID("Crash Bash Loading Screen") && 
                           Bonus1Targets() < prev(Bonus1Targets()), 
                   until = (Bonus12State() < prev(Bonus12State()) && 
                              Bonus12State() == 0) || 
                            GameState() != 0x35)
)

achievement(
    title = "Crashing Right In", points = 3,
    description = "Collect the extra life and then board all platforms in Crash's Bonus 2 without using Super Sonic.",
    id = 529332, badge = "600295", published = "15.08.2021 11:46:21", modified = "08.09.2024 14:19:29", 
    trigger = never(Bonus12Char() == GetCharID("Super Sonic")) &&
              Bonus12Stage() == GetStageID("Boarding the Platforms of Crash") &&
              Bonus12State() >= 1 &&
              Bonus12State() <= 7 &&
              trigger_when(prev(Bonus2Platforms() == 1) &&
                           Bonus2Platforms() == 0) &&
              disable_when(dword(Mem_CurrentMusicTrack) != GetTrackID("Crash Bash Loading Screen") && 
                           Bonus2Platforms() < prev(Bonus2Platforms()), 
                   until = (Bonus12State() < prev(Bonus12State()) && 
                              Bonus12State() == 0) || 
                            GameState() != 0x35)
)

achievement(
    title = "Where It All Began", points = 1,
    description = "Play as Classic Sonic.",
    id = 530410, badge = "601597", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:14:26", 
    trigger = (GameState() == 0x01 ||
              GameState() == 0x16 ||
              GameState() == 0x35 ||
              GameState() == 0x36 ||
              GameState() == 0x77) &&
              (SonicIsClassic(0) || 
               SonicIsClassic(1) ||
               SonicIsClassic(2) ||
               SonicIsClassic(3))
)

achievement(
    title = "Not Just A Coke", points = 1,
    description = "Play as Pepsiman.",
    id = 463051, badge = "524614", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:14:26", 
    trigger = (GameState() == 0x01 ||
              GameState() == 0x16 ||
              GameState() == 0x35 ||
              GameState() == 0x36 ||
              GameState() == 0x77) &&
              ((CharacterCostume("Dragon King", 5, 0) && byte(PointerPlayerData() + 0x20 + 0xB50*0) == 0) ||
              (CharacterCostume("Dragon King", 5, 1) && byte(PointerPlayerData() + 0x20 + 0xB50*1) == 0) ||
              (CharacterCostume("Dragon King", 5, 2) && byte(PointerPlayerData() + 0x20 + 0xB50*2) == 0) ||
              (CharacterCostume("Dragon King", 5, 3) && byte(PointerPlayerData() + 0x20 + 0xB50*3) == 0))
)

achievement(
    title = "Punch Me In My Face", points = 1,
    description = "Play as Sandbag.",
    id = 463052, badge = "524615", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:14:26", 
    trigger = (GameState() == 0x01 ||
              GameState() == 0x16 ||
              GameState() == 0x35 ||
              GameState() == 0x36 ||
              GameState() == 0x77) &&
              PointerPlayerData() != 0 &&
              ((byte(PointerPlayerData() + 0x08 + 0xB50*0) == GetCharID("Sandbag") && byte(PointerPlayerData() + 0x20 + 0xB50*0) == 0) ||
              (byte(PointerPlayerData() + 0x08 + 0xB50*1) == GetCharID("Sandbag") && byte(PointerPlayerData() + 0x20 + 0xB50*1) == 0) ||
              (byte(PointerPlayerData() + 0x08 + 0xB50*2) == GetCharID("Sandbag") && byte(PointerPlayerData() + 0x20 + 0xB50*2) == 0) ||
              (byte(PointerPlayerData() + 0x08 + 0xB50*3) == GetCharID("Sandbag") && byte(PointerPlayerData() + 0x20 + 0xB50*3) == 0))
)

achievement(
    title = "Hands Up", points = 1,
    description = "Unlock Master Hand as a playable character.",
    id = 462601, badge = "523974", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:14:26", 
    trigger = GameState() == 0x39 &&
              SetPlayerTag(20)
)

achievement(
    title = "Haunted Madness", points = 3,
    description = "Win a Free-for-All Battle as Mad Piano against Luigi on the stage 'Big Boo's Haunt' with Level 9 CPU.",
    id = 166158, badge = "523097", published = "15.08.2021 15:58:15", modified = "09.09.2024 17:17:28",
    trigger = (Beat1COM("Big Boo's Haunt", "Mad Piano", "Luigi", 0) ||
              Beat1COM("Big Boo's Haunt", "Mad Piano", "Luigi", 1)) &&
              RulesCommunity() &&
              NoCheatingNoHat(0) &&
              NoCheatingNoHat(1) 
)

achievement(
    title = "Intergalactic Showdown", points = 3,
    description = "Win a Free-for-All Battle as Wolf against Fox on the stage 'Venom' with Level 9 CPU.",
    id = 166159, badge = "523098", published = "15.08.2021 15:58:18", modified = "09.09.2024 17:17:26", 
    trigger = (Beat1COM("Venom", "Wolf", "Fox", 0) ||
              Beat1COM("Venom", "Wolf", "Fox", 1)) &&
              RulesCommunity() &&
              NoCheatingNoHat(0) &&
              NoCheatingNoHat(1) 
)

achievement(
    title = "Decisive Fight", points = 3,
    description = "Win a Free-for-All Battle as Ganondorf against Link on the stage 'Ganon's Tower' with Level 9 CPU.",
    id = 166160, badge = "523099", published = "15.08.2021 15:58:20", modified = "09.09.2024 17:17:26", 
    trigger = (Beat1COM("Ganon's Tower", "Ganondorf", "Link", 0) ||
              Beat1COM("Ganon's Tower", "Ganondorf", "Link", 1)) &&
              RulesCommunity() &&
              NoCheatingNoHat(0) &&
              NoCheatingNoHat(1) 
)

achievement(
    title = "Lost In Time", points = 3,
    description = "Win a Free-for-All Battle as Young Link against Link on the stage 'Deku Tree' with Level 9 CPU.",
    id = 463029, badge = "524288", published = "21.09.2021 17:45:45", modified = "09.09.2024 17:17:26", 
    trigger = (Beat1COM("Deku Tree", "Young Link", "Link", 0) ||
              Beat1COM("Deku Tree", "Young Link", "Link", 1)) &&
              RulesCommunity() &&
              NoCheatingNoHat(0) &&
              NoCheatingNoHat(1) 
)

achievement(
    title = "Metal of Honor", points = 3,
    description = "Win a Free-for-All Battle as Metal Mario or Metal Luigi against their normal versions on the stage 'Metallic Madness' with Level 9 CPU.",
    id = 463030, badge = "524289", published = "21.09.2021 17:45:45", modified = "09.09.2024 17:17:26", 
    trigger = (Beat1COM("Metallic Madness", "Metal Mario", "Mario", 0) ||
              Beat1COM("Metallic Madness", "Metal Mario", "Mario", 1) ||
              Beat1COM("Metallic Madness", "Metal Luigi", "Luigi", 0) ||
              Beat1COM("Metallic Madness", "Metal Luigi", "Luigi", 1)) &&
              RulesCommunity() &&
              NoCheatingNoHat(0) &&
              NoCheatingNoHat(1) 
)

achievement(
    title = "Twin Phazon Fury", points = 3,
    description = "Win a Free-for-All Battle as Dark Samus against Samus on the stage 'Norfair' with Level 9 CPU.",
    id = 463031, badge = "524290", published = "21.09.2021 17:45:45", modified = "09.09.2024 17:17:26", 
    trigger = (Beat1COM("Norfair", "Dark Samus", "Samus", 0) ||
              Beat1COM("Norfair", "Dark Samus", "Samus", 1)) &&
              RulesCommunity() &&
              NoCheatingNoHat(0) &&
              NoCheatingNoHat(1) 
)

achievement(
    title = "A Well-Known Rematch", points = 3,
    description = "Win a Free-for-All Battle as King Dedede against Kirby on the stage 'Mt. Dedede' with Level 9 CPU.",
    id = 462745, badge = "524082", published = "21.09.2021 17:45:45", modified = "09.09.2024 17:17:26", 
    trigger = (Beat1COM("Mt. Dedede", "King Dedede", "Kirby", 0) ||
              Beat1COM("Mt. Dedede", "King Dedede", "Kirby", 1)) &&
              RulesCommunity() &&
              NoCheatingNoHat(0) &&
              NoCheatingNoHat(1) 
)

achievement(
    title = "Magic In Vegas", points = 3,
    description = "Win a Free-for-All Battle as Kirby using the Top Hat on the stage 'Casino Night Zone' against a Level 9 CPU.",
    id = 463452, badge = "525005", published = "15.08.2021 16:54:21", modified = "08.09.2024 14:22:11", 
    trigger = (Beat1COMKirbyRandom(0) ||
              Beat1COMKirbyRandom(1)) &&
              RulesCommunity() &&
              NoCheatingNoHat(0) &&
              NoCheatingNoHat(1) 
)

achievement(
    title = "Win For Once!", points = 3,
    description = "Win a Free-for-All Battle as Lanky Kong against Donkey Kong on the stage 'Jungle Japes' with Level 9 CPU.",
    id = 529333, badge = "600297", published = "21.09.2021 17:45:45", modified = "09.09.2024 17:17:26", 
    trigger = (Beat1COM("Jungle Japes", "Lanky Kong", "Donkey Kong", 0) ||
              Beat1COM("Jungle Japes", "Lanky Kong", "Donkey Kong", 1)) &&
              RulesCommunity() &&
              NoCheatingNoHat(0) &&
              NoCheatingNoHat(1) 
)

achievement(
    title = "Coming Soon...", points = 3,
    description = "Win a Free-for-All Battle between Giga Bowser and Giant Donkey Kong on the stage 'New Pork City' with Level 9 CPU.",
    id = 166161, badge = "523100", published = "15.08.2021 15:58:23", modified = "09.09.2024 17:17:26", 
    trigger = (Beat1COM("New Pork City", "Giga Bowser", "Giant Donkey Kong", 0) ||
              Beat1COM("New Pork City", "Giga Bowser", "Giant Donkey Kong", 1) ||
              Beat1COM("New Pork City", "Giant Donkey Kong", "Giga Bowser", 0) ||
              Beat1COM("New Pork City", "Giant Donkey Kong", "Giga Bowser", 1)) &&
              RulesCommunity() &&
              NoCheatingNoHat(0) &&
              NoCheatingNoHat(1) 
)

achievement(
    title = "Oh Snap!", points = 3,
    description = "Win a Free-for-All Battle between Pikachu and Mewtwo on the stage 'Meta Crystal' with Level 9 CPU.",
    id = 173187, badge = "523101", published = "21.09.2021 17:45:45", modified = "09.09.2024 17:17:26", 
    trigger = (Beat1COM("Meta Crystal", "Pikachu", "Mewtwo", 0) ||
              Beat1COM("Meta Crystal", "Pikachu", "Mewtwo", 1) ||
              Beat1COM("Meta Crystal", "Mewtwo", "Pikachu", 0) ||
              Beat1COM("Meta Crystal", "Mewtwo", "Pikachu", 1)) &&
              RulesCommunity() &&
              NoCheatingNoHat(0) &&
              NoCheatingNoHat(1) 
)

achievement(
    title = "Diddy's Christmas Knockout", points = 3,
    description = "Win a Free-for-All Battle between Conker and Banjo & Kazooie on the stage 'Frosty Village' with Level 9 CPU.",
    id = 462962, badge = "524235", published = "15.08.2021 16:54:21", modified = "08.09.2024 14:22:11", 
    trigger = (Beat1COM("Frosty Village", "Conker", "Banjo & Kazooie", 0) ||
              Beat1COM("Frosty Village", "Conker", "Banjo & Kazooie", 1) ||
              Beat1COM("Frosty Village", "Banjo & Kazooie", "Conker", 0) ||
              Beat1COM("Frosty Village", "Banjo & Kazooie", "Conker", 1)) &&
              RulesCommunity() &&
              NoCheatingNoHat(0) &&
              NoCheatingNoHat(1) 
)

achievement(
    title = "Historical Lession", points = 3,
    description = "Win a Free-for-All Battle between Goemon and Ebisumaru on the stage 'Edo Town' with Level 9 CPU.",
    id = 463028, badge = "524287", published = "15.08.2021 16:54:21", modified = "08.09.2024 14:22:11", 
    trigger = (Beat1COM("Edo Town", "Goemon", "Ebisumaru", 0) ||
              Beat1COM("Edo Town", "Goemon", "Ebisumaru", 1) ||
              Beat1COM("Edo Town", "Ebisumaru", "Goemon", 0) ||
              Beat1COM("Edo Town", "Ebisumaru", "Goemon", 1)) &&
              RulesCommunity() &&
              NoCheatingNoHat(0) &&
              NoCheatingNoHat(1)
)

achievement(
    title = "For My Kingdom!", points = 3,
    description = "Win a Free-for-All Battle between Marth and Roy on the stage 'Castle Siege' with Level 9 CPU.",
    id = 529334, badge = "600298", published = "21.09.2021 17:45:45", modified = "09.09.2024 17:17:26", 
    trigger = (Beat1COM("Castle Siege", "Roy", "Marth", 0) ||
              Beat1COM("Castle Siege", "Roy", "Marth", 1) ||
              Beat1COM("Castle Siege", "Marth", "Roy", 0) ||
              Beat1COM("Castle Siege", "Marth", "Roy", 1)) &&
              RulesCommunity() &&
              NoCheatingNoHat(0) &&
              NoCheatingNoHat(1) 
)

achievement(
    title = "Doctor's Order", points = 3,
    description = "Win a Free-for-All Battle between Dr. Mario and Dr. Luigi on the stage 'Dr. Mario' with Level 9 CPU.",
    id = 529335, badge = "600299", published = "21.09.2021 17:45:45", modified = "09.09.2024 17:17:26", 
    trigger = (Beat1COM("Dr. Mario", "Dr. Mario", "Dr. Luigi", 0) ||
              Beat1COM("Dr. Mario", "Dr. Mario", "Dr. Luigi", 1) ||
              Beat1COM("Dr. Mario", "Dr. Luigi", "Dr. Mario", 0) ||
              Beat1COM("Dr. Mario", "Dr. Luigi", "Dr. Mario", 1)) &&
              RulesCommunity() &&
              NoCheatingNoHat(0) &&
              NoCheatingNoHat(1) 
)

achievement(
    title = "Without Fear", points = 5,
    description = "Win a Free-for-All Battle against a Level 10 CPU.",
    id = 463449, badge = "525004", published = "15.08.2021 16:54:21", modified = "08.09.2024 14:22:11", 
    trigger = (Beat1COMLevel10(0) ||
              Beat1COMLevel10(1)) &&
              RulesCommunity() &&
              NoCheatingNoHat(0) &&
              NoCheatingNoHat(1)
)


achievement(
    title = "Not This Again...", points = 5,
    description = "Win a Free-for-All Battle between Yoshi, Mario, Luigi and Wario on the stage 'Peach's Castle II' with Level 9 CPU.",
    id = 166162, badge = "523102", published = "15.08.2021 16:54:20", modified = "08.09.2024 14:21:57", 
    trigger = (Beat4COMs("Peach's Castle II", "Yoshi", "Mario", "Luigi", "Wario", 0) ||
              Beat4COMs("Peach's Castle II", "Yoshi", "Mario", "Luigi", "Wario", 1) ||
              Beat4COMs("Peach's Castle II", "Yoshi", "Mario", "Luigi", "Wario", 2) ||
              Beat4COMs("Peach's Castle II", "Yoshi", "Mario", "Luigi", "Wario", 3)) &&
              RulesCommunity() &&
              NoCheatingNoHat(0) &&
              NoCheatingNoHat(1) &&
              NoCheatingNoHat(2) &&
              NoCheatingNoHat(3)
)

achievement(
    title = "Star Fox Assault", points = 5,
    description = "Win a Free-for-All Battle between Fox, Falco, Peppy and Slippy on the stage 'Sector Z' with Level 9 CPU.",
    id = 463049, badge = "524322", published = "15.08.2021 16:54:20", modified = "08.09.2024 14:21:57", 
    trigger = (Beat4COMs("Sector Z", "Fox", "Falco", "Peppy", "Slippy", 0) ||
              Beat4COMs("Sector Z", "Fox", "Falco", "Peppy", "Slippy", 1) ||
              Beat4COMs("Sector Z", "Fox", "Falco", "Peppy", "Slippy", 2) ||
              Beat4COMs("Sector Z", "Fox", "Falco", "Peppy", "Slippy", 3)) &&
              RulesCommunity() &&
              NoCheatingNoHat(0) &&
              NoCheatingNoHat(1) &&
              NoCheatingNoHat(2) &&
              NoCheatingNoHat(3)
)

achievement(
    title = "Dragon King: The Fighting Game", points = 5,
    description = "Win a Free-for-All Battle between four Dragon King on the stage 'Dragon King' with Level 9 CPU.",
    id = 463050, badge = "524359", published = "15.08.2021 16:54:21", modified = "08.09.2024 14:22:11", 
    trigger = (Beat4COMsSame("Dragon King", 0, "Dragon King", "Dragon King") ||
              Beat4COMsSame("Dragon King", 1, "Dragon King", "Dragon King") ||
              Beat4COMsSame("Dragon King", 2, "Dragon King", "Dragon King") ||
              Beat4COMsSame("Dragon King", 3, "Dragon King", "Dragon King")) &&
              RulesCommunity() &&
              NoCheatingNoHat(0) &&
              NoCheatingNoHat(1) &&
              NoCheatingNoHat(2) &&
              NoCheatingNoHat(3)
)

achievement(
    title = "Superior Animal Mascot", points = 5,
    description = "Win a Free-for-All Battle between Pikachu, Sonic, Banjo & Kazooie and Crash on the stage 'Windy' with Level 9 CPU.",
    id = 529153, badge = "600061", published = "15.08.2021 16:54:20", modified = "08.09.2024 14:21:57", 
    trigger = (Beat4COMs("Windy", "Pikachu", "Sonic", "Banjo & Kazooie", "Crash", 0) ||
              Beat4COMs("Windy", "Pikachu", "Sonic", "Banjo & Kazooie", "Crash", 1) ||
              Beat4COMs("Windy", "Pikachu", "Sonic", "Banjo & Kazooie", "Crash", 2) ||
              Beat4COMs("Windy", "Pikachu", "Sonic", "Banjo & Kazooie", "Crash", 3)) &&
              RulesCommunity() &&
              NoCheatingNoHat(0) &&
              NoCheatingNoHat(1) &&
              NoCheatingNoHat(2) &&
              NoCheatingNoHat(3)
)

achievement(
    title = "Legends of the Seven Stars", points = 5,
    description = "Win a Free-for-All Battle between Mario, Yoshi, Bowser and Peach on the stage 'Bowser's Keep' with Level 9 CPU.",
    id = 529907, badge = "601041", published = "15.08.2021 16:54:20", modified = "08.09.2024 14:21:57", 
    trigger = (Beat4COMs("Bowser's Keep", "Mario", "Yoshi", "Bowser", "Peach", 0) ||
              Beat4COMs("Bowser's Keep", "Mario", "Yoshi", "Bowser", "Peach", 1) ||
              Beat4COMs("Bowser's Keep", "Mario", "Yoshi", "Bowser", "Peach", 2) ||
              Beat4COMs("Bowser's Keep", "Mario", "Yoshi", "Bowser", "Peach", 3)) &&
              RulesCommunity() &&
              NoCheatingNoHat(0) &&
              NoCheatingNoHat(1) &&
              NoCheatingNoHat(2) &&
              NoCheatingNoHat(3)
)

achievement(
    title = "Still In Beta", points = 5,
    description = "Win a Free-for-All Battle between four Polygon Fighters on the stage 'Dream Land Beta 1' or 'Dream Land Beta 2' with Level 9 CPU.",
    id = 166163, badge = "523103", published = "15.08.2021 16:54:21", modified = "08.09.2024 14:22:11", 
    trigger = (Beat4COMsSame("Polygon", 0, "Dream Land Beta 1", "Dream Land Beta 2") ||
              Beat4COMsSame("Polygon", 1, "Dream Land Beta 1", "Dream Land Beta 2") ||
              Beat4COMsSame("Polygon", 2, "Dream Land Beta 1", "Dream Land Beta 2") ||
              Beat4COMsSame("Polygon", 3, "Dream Land Beta 1", "Dream Land Beta 2")) &&
              RulesCommunity() &&
              NoCheatingNoHat(0) &&
              NoCheatingNoHat(1) &&
              NoCheatingNoHat(2) &&
              NoCheatingNoHat(3)
)

achievement(
    title = "Feels Nostalgic!", points = 2,
    description = "In a Free-for-All Battle as Mario against Bowser on the stage 'Bowser's Stadium' throw Bowser directly into a bomb using the backthrow with Level 5 CPU.",
    id = 166164, badge = "523104", published = "15.08.2021 16:54:21", modified = "08.09.2024 14:22:28",
    trigger = (GameState() == 0x16 &&
              FreeModeStage() == GetStageID("Bowser's Stadium") &&
              FreeModeNumFighters() == 1 &&
              (((byte(PointerPlayerData() + 0x08) == GetCharID("Mario") ||
                    byte(PointerPlayerData() + 0x08) == GetCharID("JP Mario")) &&
                    byte(PointerPlayerData() + 0x20) == 0 &&
                    byte(PointerPlayerData() + 0xB58) == GetCharID("Bowser") &&
                    byte(PointerPlayerData() + 0xB60) >= 5 &&
                    byte(PointerPlayerData() + 0xB70) == 1 &&
                    trigger_when(tally(10, (byte(PointerPlayerData() + 0x24) == 0xAA) &&
                        byte(PointerPlayerData() + 0xB74) == 0xB6) &&
                        dword(PointerPlayerData() + 0xB7C) > prev(dword(PointerPlayerData() + 0xB7C)) &&
                        dword(PointerPlayerData() + 0x1580) == 0x8012CD50 &&
                        dword(PointerPlayerData() + 0x1580) != prev(dword(PointerPlayerData() + 0x1580)) &&
                        byte(PointerPlayerData() + 0xB74) >= 0x33 &&
                        byte(PointerPlayerData() + 0xB74) <= 0x34 &&
                        never(byte(PointerPlayerData() + 0xB74) != 0xB6 &&
                            byte(PointerPlayerData() + 0xB74) != 0x33 &&
                            byte(PointerPlayerData() + 0xB74) != 0x34) &&
                            byte(PointerPlayerData() + 0xB58) == GetCharID("Bowser"))) ||
              ((byte(PointerPlayerData() + 0xB58) == GetCharID("Mario") ||
                    byte(PointerPlayerData() + 0xB58) == GetCharID("JP Mario")) &&
                    byte(PointerPlayerData() + 0xB70) == 0 &&
                    byte(PointerPlayerData() + 0x08) == GetCharID("Bowser") &&
                    byte(PointerPlayerData() + 0x10) >= 5 &&
                    byte(PointerPlayerData() + 0x20) == 1 &&
                    trigger_when(tally(10, (byte(PointerPlayerData() + 0xB74) == 0xAA) &&
                        byte(PointerPlayerData() + 0x24) == 0xB6) &&
                        dword(PointerPlayerData() + 0x2C) > prev(dword(PointerPlayerData() + 0x2C)) &&
                        dword(PointerPlayerData() + 0xA30) == 0x8012CD50 &&
                        dword(PointerPlayerData() + 0xA30) != prev(dword(PointerPlayerData() + 0xA30)) &&
                        byte(PointerPlayerData() + 0x24) >= 0x33 &&
                        byte(PointerPlayerData() + 0x24) <= 0x34) &&
                        never(byte(PointerPlayerData() + 0x24) != 0xB6 &&
                            byte(PointerPlayerData() + 0x24) != 0x33 &&
                            byte(PointerPlayerData() + 0x24) != 0x34 &&
                            byte(PointerPlayerData() + 0x08) == GetCharID("Bowser"))))) &&
              RulesCommunity() &&
              NoCheatingNoHat(0) &&
              NoCheatingNoHat(1)
) 

achievement(
    title = "Super Mario Clash.", points = 5,
    description = "In a Free-for-All Battle as Mario or Luigi against Bowser on the stage 'World 1-1' do a full cycle on the stage without taking damage with Level 5 CPU.",
    id = 463472, badge = "525023", published = "14.09.2024 15:42:42", modified = "14.09.2024 15:42:42",
    trigger = (GameState() == 0x16 && 
              FreeModeStage() == GetStageID("World 1-1") && 
              FreeModeNumFighters() == 1 &&
              tally(1,
              once((
                (prev(dword(tbyte(Mem_World1_1Progress) + 0xA30)) == 0x80221B9C) || 
                    prev(dword(tbyte(Mem_World1_1Progress) + 0xA30)) == 0x80221BDC) && 
                dword(tbyte(Mem_World1_1Progress) + 0xA30) == 0x80221BA8),
              once(
                (prev(dword(tbyte(Mem_World1_1Progress) + 0xA30)) == 0x80221B9C || 
                    prev(dword(tbyte(Mem_World1_1Progress) + 0xA30)) == 0x80221BDC) && 
                dword(tbyte(Mem_World1_1Progress) + 0xA30) == 0x80221BE8)) &&
              trigger_when((once(dword(tbyte(Mem_World1_1Progress) + 0xA30) == 0x80221BC0) ||
                    (once(dword(tbyte(Mem_World1_1Progress) + 0xA30) == 0x80221C00))) &&
                (dword(tbyte(Mem_World1_1Progress) + 0xA30) == 0x80221BA8 || 
                    dword(tbyte(Mem_World1_1Progress) + 0xA30) == 0x80221BE8)) &&
              ((((byte(PointerPlayerData() + 0x000008) == GetCharID("Mario")) || 
                byte(PointerPlayerData() + 0x000008) == GetCharID("JP Mario") ||
                byte(PointerPlayerData() + 0x000008) == GetCharID("Luigi") || 
                byte(PointerPlayerData() + 0x000008) == GetCharID("JP Luigi")) &&
                byte(PointerPlayerData() + 0x000020) == 0 && 
                byte(PointerPlayerData() + 0x000B58) == GetCharID("Bowser") &&
                byte(PointerPlayerData() + 0x000B60) >= 5 && 
                byte(PointerPlayerData() + 0x000B70) == 1 &&
                never(((FreeModeChar1Stocks() < prev(FreeModeChar1Stocks()) ||
                    dword(PointerPlayerData() + 0x00002C) > prev(dword(PointerPlayerData() + 0x00002C)))) &&
                    byte(PointerPlayerData() + 0x000008) != GetCharID("Bowser")
                )) ||
               (((byte(PointerPlayerData() + 0x000B58) == GetCharID("Mario")) || 
                byte(PointerPlayerData() + 0x000B58) == GetCharID("JP Mario") ||
                byte(PointerPlayerData() + 0x000B58) == GetCharID("Luigi") || 
                byte(PointerPlayerData() + 0x000B58) == GetCharID("JP Luigi")) &&
                byte(PointerPlayerData() + 0x000B70) == 0 && 
                byte(PointerPlayerData() + 0x000008) == GetCharID("Bowser") &&
                byte(PointerPlayerData() + 0x000010) >= 5 && 
                byte(PointerPlayerData() + 0x000020) == 1 &&
                never(((FreeModeChar2Stocks() < prev(FreeModeChar2Stocks()) ||
                    dword(PointerPlayerData() + 0x000B7C) > prev(dword(PointerPlayerData() + 0x000B7C)))) &&
                    byte(PointerPlayerData() + 0x000B58) != GetCharID("Bowser"))))) &&
              RulesCommunity() &&
              NoCheatingNoHat(0) &&
              NoCheatingNoHat(1)
)

// ----------------------------------------------------------------------------------------------------
// Leaderboards

leaderboard(
    id = 135407, title = "1P Game",
    description = "Highest Total Score",
    start  = BothGameStates() != 0x1B1B &&
             BothGameStates() != 0x800D &&
             LB_TotalScoreUpdate1PGame(0),
    cancel = always_false(),
    submit = always_true(),
    value  = LB_TotalScoreSum1PGame(0),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 135408, title = "Remix 1P",
    description = "Highest Total Score",
    start  = BothGameStates() != 0x1B1B &&
             BothGameStates() != 0x800D && 
             LB_TotalScoreUpdate(4),
    cancel = always_false(),
    submit = always_true(),
    value  = LB_TotalScoreSum(4),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 135409, title = "All-Stars Mode",
    description = "Highest Total Score",
    start  = BothGameStates() != 0x1B1B &&
             BothGameStates() != 0x800D &&
             LB_TotalScoreUpdate(5),
    cancel = always_false(),
    submit = always_true(),
    value  = LB_TotalScoreSum(5),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 135410, title = "Multi-Man Mode",
    description = "Highest Total KOs",
    start  = BothGameStates() != 0x1B1B &&
             BothGameStates() != 0x800D &&
             LB_TotalScoreUpdate(2),
    cancel = always_false(),
    submit = always_true(),
    value  = LB_TotalScoreSum(2),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 135411, title = "Cruel Multi-Man Mode",
    description = "Highest Total KOs",
    start  = BothGameStates() != 0x1B1B &&
             BothGameStates() != 0x800D &&
             LB_TotalScoreUpdate(3),
    cancel = always_false(),
    submit = always_true(),
    value  = LB_TotalScoreSum(3),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 135412, title = "Home-Run Contest",
    description = "Highest Total Distance",
    start  = BothGameStates() != 0x1B1B &&
             BothGameStates() != 0x800D &&
             LB_TotalScoreUpdate(6),
    cancel = always_false(),
    submit = always_true(),
    value  = LB_TotalScoreSum(6),
    format = "FIXED1",
    lower_is_better = false
)

Leaderboard_Params = [
    {
        "Character":    "Mario",
        "ID_1PGame":    24642,
        "ID_Remix1P":   24643,
        "ID_MultiMan":  24661,
        "ID_CruelMan":  24662,
        "ID_AllStar":   25995,
        "ID_Homerun":   30442,
    },
    {
        "Character":    "JP Mario",
        "ID_1PGame":    24663,
        "ID_Remix1P":   24716,
        "ID_MultiMan":  24940,
        "ID_CruelMan":  24993,
        "ID_AllStar":   25996,
        "ID_Homerun":   30443,
    },
    {
        "Character":    "Polygon Mario",
        "ID_1PGame":    24688,
        "ID_Remix1P":   24717,
        "ID_MultiMan":  24941,
        "ID_CruelMan":  24994,
        "ID_AllStar":   25997,
        "ID_Homerun":   30444,
    },
    {
        "Character":    "Fox",
        "ID_1PGame":    24664,
        "ID_Remix1P":   24718,
        "ID_MultiMan":  24942,
        "ID_CruelMan":  24995,
        "ID_AllStar":   25998,
        "ID_Homerun":   30445,
    },
    {
        "Character":    "JP Fox",
        "ID_1PGame":    24665,
        "ID_Remix1P":   24719,
        "ID_MultiMan":  24943,
        "ID_CruelMan":  24996,
        "ID_AllStar":   25999,
        "ID_Homerun":   30446,
    },
    {
        "Character":    "Polygon Fox",
        "ID_1PGame":    24666,
        "ID_Remix1P":   24720,
        "ID_MultiMan":  24944,
        "ID_CruelMan":  24997,
        "ID_AllStar":   26000,
        "ID_Homerun":   30447,
    },
    {
        "Character":    "Donkey Kong",
        "ID_1PGame":    24667,
        "ID_Remix1P":   24721,
        "ID_MultiMan":  24945,
        "ID_CruelMan":  24998,
        "ID_AllStar":   26001,
        "ID_Homerun":   30448,
    },
    {
        "Character":    "JP Donkey Kong",
        "ID_1PGame":    24668,
        "ID_Remix1P":   24722,
        "ID_MultiMan":  24946,
        "ID_CruelMan":  24999,
        "ID_AllStar":   26002,
        "ID_Homerun":   30449,
    },
    {
        "Character":    "Polygon Donkey Kong",
        "ID_1PGame":    24669,
        "ID_Remix1P":   24723,
        "ID_MultiMan":  24947,
        "ID_CruelMan":  25000,
        "ID_AllStar":   26003,
        "ID_Homerun":   30450,
    },
    {
        "Character":    "Samus",
        "ID_1PGame":    24670,
        "ID_Remix1P":   24724,
        "ID_MultiMan":  24948,
        "ID_CruelMan":  25001,
        "ID_AllStar":   26004,
        "ID_Homerun":   30451,
    },
    {
        "Character":    "JP Samus",
        "ID_1PGame":    24671,
        "ID_Remix1P":   24725,
        "ID_MultiMan":  24949,
        "ID_CruelMan":  25002,
        "ID_AllStar":   26014,
        "ID_Homerun":   30452,
    },
    {
        "Character":    "EU Samus",
        "ID_1PGame":    24672,
        "ID_Remix1P":   24726,
        "ID_MultiMan":  24950,
        "ID_CruelMan":  25003,
        "ID_AllStar":   26006,
        "ID_Homerun":   30453,
    },
    {
        "Character":    "Polygon Samus",
        "ID_1PGame":    24673,
        "ID_Remix1P":   24727,
        "ID_MultiMan":  24951,
        "ID_CruelMan":  25004,
        "ID_AllStar":   26007,
        "ID_Homerun":   30454,
    },
    {
        "Character":    "Luigi",
        "ID_1PGame":    24674,
        "ID_Remix1P":   24728,
        "ID_MultiMan":  24952,
        "ID_CruelMan":  25005,
        "ID_AllStar":   26008,
        "ID_Homerun":   30455,
    },
    {
        "Character":    "JP Luigi",
        "ID_1PGame":    24675,
        "ID_Remix1P":   24729,
        "ID_MultiMan":  24953,
        "ID_CruelMan":  25006,
        "ID_AllStar":   26009,
        "ID_Homerun":   30456,
    },
    {
        "Character":    "Polygon Luigi",
        "ID_1PGame":    24676,
        "ID_Remix1P":   24730,
        "ID_MultiMan":  24954,
        "ID_CruelMan":  25007,
        "ID_AllStar":   26010,
        "ID_Homerun":   30457,
    },
    {
        "Character":    "Link",
        "ID_1PGame":    24677,
        "ID_Remix1P":   24731,
        "ID_MultiMan":  24955,
        "ID_CruelMan":  25008,
        "ID_AllStar":   26011,
        "ID_Homerun":   30458,
    },
    {
        "Character":    "JP Link",
        "ID_1PGame":    24678,
        "ID_Remix1P":   24732,
        "ID_MultiMan":  24956,
        "ID_CruelMan":  25009,
        "ID_AllStar":   26012,
        "ID_Homerun":   30459,
    },
    {
        "Character":    "EU Link",
        "ID_1PGame":    24679,
        "ID_Remix1P":   24733,
        "ID_MultiMan":  24957,
        "ID_CruelMan":  25010,
        "ID_AllStar":   26013,
        "ID_Homerun":   30460,
    },
    {
        "Character":    "Polygon Link",
        "ID_1PGame":    24680,
        "ID_Remix1P":   24734,
        "ID_MultiMan":  24958,
        "ID_CruelMan":  25011,
        "ID_AllStar":   26005,
        "ID_Homerun":   30461,
    },
    {
        "Character":    "Yoshi",
        "ID_1PGame":    24681,
        "ID_Remix1P":   24735,
        "ID_MultiMan":  24959,
        "ID_CruelMan":  25012,
        "ID_AllStar":   26015,
        "ID_Homerun":   30462,
    },
    {
        "Character":    "JP Yoshi",
        "ID_1PGame":    24682,
        "ID_Remix1P":   24736,
        "ID_MultiMan":  24960,
        "ID_CruelMan":  25013,
        "ID_AllStar":   26016,
        "ID_Homerun":   30463,
    },
    {
        "Character":    "Polygon Yoshi",
        "ID_1PGame":    24683,
        "ID_Remix1P":   24737,
        "ID_MultiMan":  24961,
        "ID_CruelMan":  25014,
        "ID_AllStar":   26017,
        "ID_Homerun":   30464,
    },
    {
        "Character":    "Captain Falcon",
        "ID_1PGame":    24684,
        "ID_Remix1P":   24738,
        "ID_MultiMan":  24962,
        "ID_CruelMan":  25015,
        "ID_AllStar":   26018,
        "ID_Homerun":   30465,
    },
    {
        "Character":    "JP Captain Falcon",
        "ID_1PGame":    24685,
        "ID_Remix1P":   24739,
        "ID_MultiMan":  24963,
        "ID_CruelMan":  25016,
        "ID_AllStar":   26019,
        "ID_Homerun":   30466,
    },
    {
        "Character":    "Polygon Captain Falcon",
        "ID_1PGame":    24686,
        "ID_Remix1P":   24740,
        "ID_MultiMan":  24964,
        "ID_CruelMan":  25017,
        "ID_AllStar":   26020,
        "ID_Homerun":   30467,
    },
    {
        "Character":    "Kirby",
        "ID_1PGame":    24687,
        "ID_Remix1P":   24741,
        "ID_MultiMan":  24965,
        "ID_CruelMan":  25018,
        "ID_AllStar":   26021,
        "ID_Homerun":   30468,
    },
    {
        "Character":    "JP Kirby",
        "ID_1PGame":    24689,
        "ID_Remix1P":   24742,
        "ID_MultiMan":  24966,
        "ID_CruelMan":  25019,
        "ID_AllStar":   26022,
        "ID_Homerun":   30469,
    },
    {
        "Character":    "Polygon Kirby",
        "ID_1PGame":    24715,
        "ID_Remix1P":   24743,
        "ID_MultiMan":  24967,
        "ID_CruelMan":  25020,
        "ID_AllStar":   26023,
        "ID_Homerun":   30470,
    },
    {
        "Character":    "Pikachu",
        "ID_1PGame":    24690,
        "ID_Remix1P":   24744,
        "ID_MultiMan":  24968,
        "ID_CruelMan":  25021,
        "ID_AllStar":   26024,
        "ID_Homerun":   30471,
    },
    {
        "Character":    "JP Pikachu",
        "ID_1PGame":    24691,
        "ID_Remix1P":   24745,
        "ID_MultiMan":  24969,
        "ID_CruelMan":  25022,
        "ID_AllStar":   26025,
        "ID_Homerun":   30472,
    },
    {
        "Character":    "EU Pikachu",
        "ID_1PGame":    24692,
        "ID_Remix1P":   24756,
        "ID_MultiMan":  24970,
        "ID_CruelMan":  25023,
        "ID_AllStar":   26026,
        "ID_Homerun":   30473,
    },
    {
        "Character":    "Polygon Pikachu",
        "ID_1PGame":    24693,
        "ID_Remix1P":   24757,
        "ID_MultiMan":  24971,
        "ID_CruelMan":  25024,
        "ID_AllStar":   26027,
        "ID_Homerun":   30474,
    },
    {
        "Character":    "Jigglypuff",
        "ID_1PGame":    24694,
        "ID_Remix1P":   24748,
        "ID_MultiMan":  24972,
        "ID_CruelMan":  25025,
        "ID_AllStar":   26028,
        "ID_Homerun":   30475,
    },
    {
        "Character":    "JP Jigglypuff",
        "ID_1PGame":    24695,
        "ID_Remix1P":   24749,
        "ID_MultiMan":  24973,
        "ID_CruelMan":  25026,
        "ID_AllStar":   26029,
        "ID_Homerun":   30476,
    },
    {
        "Character":    "EU Jigglypuff",
        "ID_1PGame":    24696,
        "ID_Remix1P":   24760,
        "ID_MultiMan":  24974,
        "ID_CruelMan":  25027,
        "ID_AllStar":   26030,
        "ID_Homerun":   30477,
    },
    {
        "Character":    "Polygon Jigglypuff",
        "ID_1PGame":    24697,
        "ID_Remix1P":   24761,
        "ID_MultiMan":  24975,
        "ID_CruelMan":  25028,
        "ID_AllStar":   26031,
        "ID_Homerun":   30478,
    },
    {
        "Character":    "Ness",
        "ID_1PGame":    24698,
        "ID_Remix1P":   24752,
        "ID_MultiMan":  24976,
        "ID_CruelMan":  25029,
        "ID_AllStar":   26032,
        "ID_Homerun":   30479,
    },
    {
        "Character":    "JP Ness",
        "ID_1PGame":    24699,
        "ID_Remix1P":   24763,
        "ID_MultiMan":  24977,
        "ID_CruelMan":  25030,
        "ID_AllStar":   26033,
        "ID_Homerun":   30480,
    },
    {
        "Character":    "Polygon Ness",
        "ID_1PGame":    24700,
        "ID_Remix1P":   24764,
        "ID_MultiMan":  24978,
        "ID_CruelMan":  25031,
        "ID_AllStar":   26034,
        "ID_Homerun":   30481,
    },
    {
        "Character":    "Metal Mario",
        "ID_1PGame":    24701,
        "ID_Remix1P":   24765,
        "ID_MultiMan":  24979,
        "ID_CruelMan":  25032,
        "ID_AllStar":   26035,
        "ID_Homerun":   30482,
    },
    {
        "Character":    "Giant Donkey Kong",
        "ID_1PGame":    24702,
        "ID_Remix1P":   24771,
        "ID_MultiMan":  24980,
        "ID_CruelMan":  25033,
        "ID_AllStar":   26036,
        "ID_Homerun":   30483,
    },
    {
        "Character":    "Ganondorf",
        "ID_1PGame":    24703,
        "ID_Remix1P":   24772,
        "ID_MultiMan":  24981,
        "ID_CruelMan":  25034,
        "ID_AllStar":   26037,
        "ID_Homerun":   30484,
    },
    {
        "Character":    "Polygon Ganondorf",
        "ID_1PGame":    115286,
        "ID_Remix1P":   115287,
        "ID_MultiMan":  115288,
        "ID_CruelMan":  115289,
        "ID_AllStar":   115290,
        "ID_Homerun":   115291,
    },
    {
        "Character":    "Young Link",
        "ID_1PGame":    24704,
        "ID_Remix1P":   24773,
        "ID_MultiMan":  24982,
        "ID_CruelMan":  25035,
        "ID_AllStar":   26038,
        "ID_Homerun":   30485,
    },
    {
        "Character":    "Polygon Young Link",
        "ID_1PGame":    115292,
        "ID_Remix1P":   115293,
        "ID_MultiMan":  115294,
        "ID_CruelMan":  115295,
        "ID_AllStar":   115296,
        "ID_Homerun":   115297,
    },
    {
        "Character":    "Falco",
        "ID_1PGame":    24705,
        "ID_Remix1P":   24774,
        "ID_MultiMan":  24983,
        "ID_CruelMan":  25036,
        "ID_AllStar":   26039,
        "ID_Homerun":   30486,
    },
    {
        "Character":    "Polygon Falco",
        "ID_1PGame":    115280,
        "ID_Remix1P":   115281,
        "ID_MultiMan":  115282,
        "ID_CruelMan":  115283,
        "ID_AllStar":   115284,
        "ID_Homerun":   115285,
    },
    {
        "Character":    "Dr. Mario",
        "ID_1PGame":    24706,
        "ID_Remix1P":   24775,
        "ID_MultiMan":  24984,
        "ID_CruelMan":  25037,
        "ID_AllStar":   26040,
        "ID_Homerun":   30487,
    },
    {
        "Character":    "Polygon Dr. Mario",
        "ID_1PGame":    115262,
        "ID_Remix1P":   115263,
        "ID_MultiMan":  115264,
        "ID_CruelMan":  115265,
        "ID_AllStar":   115266,
        "ID_Homerun":   115267,
    },
    {
        "Character":    "Dark Samus",
        "ID_1PGame":    24707,
        "ID_Remix1P":   24777,
        "ID_MultiMan":  24985,
        "ID_CruelMan":  25038,
        "ID_AllStar":   26041,
        "ID_Homerun":   30488,
    },
    {
        "Character":    "Polygon Dark Samus",
        "ID_1PGame":    115298,
        "ID_Remix1P":   115299,
        "ID_MultiMan":  115300,
        "ID_CruelMan":  115301,
        "ID_AllStar":   115302,
        "ID_Homerun":   115303,
    },
    {
        "Character":    "Wario",
        "ID_1PGame":    24708,
        "ID_Remix1P":   24762,
        "ID_MultiMan":  24986,
        "ID_CruelMan":  25039,
        "ID_AllStar":   26042,
        "ID_Homerun":   30489,
    },
    {
        "Character":    "Polygon Wario",
        "ID_1PGame":    24920,
        "ID_Remix1P":   24866,
        "ID_MultiMan":  24813,
        "ID_CruelMan":  24919,
        "ID_AllStar":   24865,
        "ID_Homerun":   24812,
    },
    {
        "Character":    "Lucas",
        "ID_1PGame":    24709,
        "ID_Remix1P":   24766,
        "ID_MultiMan":  24987,
        "ID_CruelMan":  25040,
        "ID_AllStar":   26043,
        "ID_Homerun":   30490,
    },
    {
        "Character":    "Polygon Lucas",
        "ID_1PGame":    24918,
        "ID_Remix1P":   24864,
        "ID_MultiMan":  24811,
        "ID_CruelMan":  24917,
        "ID_AllStar":   24863,
        "ID_Homerun":   24808,
    },
    {
        "Character":    "Bowser",
        "ID_1PGame":    24714,
        "ID_Remix1P":   24776,
        "ID_MultiMan":  24992,
        "ID_CruelMan":  25045,
        "ID_AllStar":   26044,
        "ID_Homerun":   30491,
    },
    {
        "Character":    "Polygon Bowser",
        "ID_1PGame":    24810,
        "ID_Remix1P":   24916,
        "ID_MultiMan":  24862,
        "ID_CruelMan":  24809,
        "ID_AllStar":   24915,
        "ID_Homerun":   24861,
    },
    {
        "Character":    "Giga Bowser",
        "ID_1PGame":    24710,
        "ID_Remix1P":   24767,
        "ID_MultiMan":  24988,
        "ID_CruelMan":  25041,
        "ID_AllStar":   26045,
        "ID_Homerun":   30492,
    },
    {
        "Character":    "Mad Piano",
        "ID_1PGame":    24711,
        "ID_Remix1P":   24768,
        "ID_MultiMan":  24989,
        "ID_CruelMan":  25042,
        "ID_AllStar":   26046,
        "ID_Homerun":   30493,
    },
    {
        "Character":    "Wolf",
        "ID_1PGame":    24712,
        "ID_Remix1P":   24769,
        "ID_MultiMan":  24990,
        "ID_CruelMan":  25043,
        "ID_AllStar":   26047,
        "ID_Homerun":   30494,
    },
    {
        "Character":    "Polygon Wolf",
        "ID_1PGame":    24914,
        "ID_Remix1P":   24860,
        "ID_MultiMan":  24807,
        "ID_CruelMan":  24913,
        "ID_AllStar":   24859,
        "ID_Homerun":   24806,
    },
    {
        "Character":    "Conker",
        "ID_1PGame":    24713,
        "ID_Remix1P":   24770,
        "ID_MultiMan":  24991,
        "ID_CruelMan":  25044,
        "ID_AllStar":   26048,
        "ID_Homerun":   30495,
    },
    {
        "Character":    "Polygon Conker",
        "ID_1PGame":    24912,
        "ID_Remix1P":   24831,
        "ID_MultiMan":  24805,
        "ID_CruelMan":  24911,
        "ID_AllStar":   24858,
        "ID_Homerun":   24803,
    },
    {
        "Character":    "Mewtwo",
        "ID_1PGame":    25981,
        "ID_Remix1P":   25983,
        "ID_MultiMan":  25991,
        "ID_CruelMan":  25993,
        "ID_AllStar":   26049,
        "ID_Homerun":   30496,
    },
    {
        "Character":    "Polygon Mewtwo",
        "ID_1PGame":    24910,
        "ID_Remix1P":   24857,
        "ID_MultiMan":  24802,
        "ID_CruelMan":  24909,
        "ID_AllStar":   24856,
        "ID_Homerun":   24801,
    },
    {
        "Character":    "Marth",
        "ID_1PGame":    25982,
        "ID_Remix1P":   25984,
        "ID_MultiMan":  25992,
        "ID_CruelMan":  25994,
        "ID_AllStar":   26050,
        "ID_Homerun":   30497,
    },
    {
        "Character":    "Polygon Marth",
        "ID_1PGame":    24908,
        "ID_Remix1P":   24855,
        "ID_MultiMan":  24800,
        "ID_CruelMan":  24907,
        "ID_AllStar":   24854,
        "ID_Homerun":   24799,
    },
    {
        "Character":    "Sonic",
        "ID_1PGame":    30432,
        "ID_Remix1P":   30434,
        "ID_MultiMan":  30436,
        "ID_CruelMan":  30438,
        "ID_AllStar":   30440,
        "ID_Homerun":   30498,
    },
    {
        "Character":    "Polygon Sonic",
        "ID_1PGame":    24906,
        "ID_Remix1P":   24853,
        "ID_MultiMan":  115259,
        "ID_CruelMan":  115260,
        "ID_AllStar":   115261,
        "ID_Homerun":   115258,
    },
    {
        "Character":    "Super Sonic",
        "ID_1PGame":    30433,
        "ID_Remix1P":   30435,
        "ID_MultiMan":  30437,
        "ID_CruelMan":  30439,
        "ID_AllStar":   30441,
        "ID_Homerun":   30499,
    },
    {
        "Character":    "Sheik",
        "ID_1PGame":    24804,
        "ID_Remix1P":   25989,
        "ID_MultiMan":  25987,
        "ID_CruelMan":  25985,
        "ID_AllStar":   24937,
        "ID_Homerun":   24884,
    },
    {
        "Character":    "Polygon Sheik",
        "ID_1PGame":    115268,
        "ID_Remix1P":   115269,
        "ID_MultiMan":  115270,
        "ID_CruelMan":  115271,
        "ID_AllStar":   115272,
        "ID_Homerun":   115273,
    },
    {
        "Character":    "Marina",
        "ID_1PGame":    24830,
        "ID_Remix1P":   24936,
        "ID_MultiMan":  24883,
        "ID_CruelMan":  24829,
        "ID_AllStar":   24935,
        "ID_Homerun":   24882,
    },
    {
        "Character":    "Polygon Marina",
        "ID_1PGame":    115274,
        "ID_Remix1P":   115275,
        "ID_MultiMan":  115276,
        "ID_CruelMan":  115277,
        "ID_AllStar":   115278,
        "ID_Homerun":   115279,
    },
    {
        "Character":    "King Dedede",
        "ID_1PGame":    24939,
        "ID_Remix1P":   24881,
        "ID_MultiMan":  24828,
        "ID_CruelMan":  24938,
        "ID_AllStar":   24885,
        "ID_Homerun":   24886,
    },
    {
        "Character":    "Polygon King Dedede",
        "ID_1PGame":    115304,
        "ID_Remix1P":   115305,
        "ID_MultiMan":  115306,
        "ID_CruelMan":  115307,
        "ID_AllStar":   115308,
        "ID_Homerun":   115309,
    },
    {
        "Character":    "Goemon",
        "ID_1PGame":    24934,
        "ID_Remix1P":   24880,
        "ID_MultiMan":  24827,
        "ID_CruelMan":  24933,
        "ID_AllStar":   24879,
        "ID_Homerun":   24826,
    },
    {
        "Character":    "Polygon Goemon",
        "ID_1PGame":    115310,
        "ID_Remix1P":   115311,
        "ID_MultiMan":  115312,
        "ID_CruelMan":  115313,
        "ID_AllStar":   115314,
        "ID_Homerun":   115315,
    },
    {
        "Character":    "Peppy",
        "ID_1PGame":    24932,
        "ID_Remix1P":   24878,
        "ID_MultiMan":  24825,
        "ID_CruelMan":  24931,
        "ID_AllStar":   24877,
        "ID_Homerun":   24824,
    },
    {
        "Character":    "Slippy",
        "ID_1PGame":    24930,
        "ID_Remix1P":   24876,
        "ID_MultiMan":  24823,
        "ID_CruelMan":  24929,
        "ID_AllStar":   24875,
        "ID_Homerun":   24822,
    },
    {
        "Character":    "Banjo & Kazooie",
        "ID_1PGame":    24928,
        "ID_Remix1P":   24874,
        "ID_MultiMan":  24821,
        "ID_CruelMan":  24927,
        "ID_AllStar":   24873,
        "ID_Homerun":   24820,
    },
    {
        "Character":    "Polygon Banjo & Kazooie",
        "ID_1PGame":    115316,
        "ID_Remix1P":   115317,
        "ID_MultiMan":  115318,
        "ID_CruelMan":  115319,
        "ID_AllStar":   115320,
        "ID_Homerun":   115321,
    },
    {
        "Character":    "Ebisumaru",
        "ID_1PGame":    24926,
        "ID_Remix1P":   24872,
        "ID_MultiMan":  24819,
        "ID_CruelMan":  24925,
        "ID_AllStar":   24871,
        "ID_Homerun":   24818,
    },
    {
        "Character":    "Metal Luigi",
        "ID_1PGame":    24924,
        "ID_Remix1P":   24870,
        "ID_MultiMan":  24817,
        "ID_CruelMan":  24923,
        "ID_AllStar":   24869,
        "ID_Homerun":   24816,
    },
    {
        "Character":    "Dragon King",
        "ID_1PGame":    24922,
        "ID_Remix1P":   24868,
        "ID_MultiMan":  24815,
        "ID_CruelMan":  24921,
        "ID_AllStar":   24867,
        "ID_Homerun":   24814,
    },
    {
        "Character":    "Crash",
        "ID_1PGame":    134721,
        "ID_Remix1P":   134722,
        "ID_MultiMan":  134750,
        "ID_CruelMan":  134749,
        "ID_AllStar":   134748,
        "ID_Homerun":   134747,
    },
    {
        "Character":    "Polygon Crash",
        "ID_1PGame":    135324,
        "ID_Remix1P":   135325,
        "ID_MultiMan":  135326,
        "ID_CruelMan":  135327,
        "ID_AllStar":   135328,
        "ID_Homerun":   135329,
    },
    {
        "Character":    "Peach",
        "ID_1PGame":    134746,
        "ID_Remix1P":   134745,
        "ID_MultiMan":  134744,
        "ID_CruelMan":  134743,
        "ID_AllStar":   134742,
        "ID_Homerun":   134741,
    },
    {
        "Character":    "Polygon Peach",
        "ID_1PGame":    135318,
        "ID_Remix1P":   135319,
        "ID_MultiMan":  135320,
        "ID_CruelMan":  135321,
        "ID_AllStar":   135322,
        "ID_Homerun":   135323,
    },
    {
        "Character":    "Roy",
        "ID_1PGame":    134740,
        "ID_Remix1P":   134739,
        "ID_MultiMan":  134738,
        "ID_CruelMan":  134737,
        "ID_AllStar":   134735,
        "ID_Homerun":   134736,
    },
    {
        "Character":    "Dr. Luigi",
        "ID_1PGame":    134734,
        "ID_Remix1P":   134733,
        "ID_MultiMan":  134732,
        "ID_CruelMan":  134731,
        "ID_AllStar":   134730,
        "ID_Homerun":   134729,
    },
    {
        "Character":    "Lanky Kong",
        "ID_1PGame":    134723,
        "ID_Remix1P":   134724,
        "ID_MultiMan":  134725,
        "ID_CruelMan":  134726,
        "ID_AllStar":   134727,
        "ID_Homerun":   134728,
    },
]

// Character-specific Leaderboards
for params in Leaderboard_Params {
    // 1P Game
    leaderboard(
        id = params["ID_1PGame"],
        title = "1P Game",
        description = format("Highest Score with {0}", params["Character"]),
        start  = LB_1PGame(params["Character"]) &&
                 RulesCommunity(),
        cancel = always_false(),
        submit = always_true(),
        value  = NormalModeScore(),
        format = "VALUE"
    )
    
    // Remix 1P
    leaderboard(
        id = params["ID_Remix1P"],
        title = "Remix 1P",
        description = format("Highest Score with {0}", params["Character"]),
        start  = LB_Remix1P(params["Character"]) &&
                 RulesCommunity(),
        cancel = always_false(),
        submit = always_true(),
        value  = NormalModeScore(),
        format = "VALUE"
    )
    
    // All-Star Mode
    leaderboard(
        id = params["ID_AllStar"],
        title = "All-Star Mode",
        description = format("Highest Score with {0}", params["Character"]),
        start  = LB_AllStars(params["Character"]) &&
                 RulesCommunity(),
        cancel = always_false(),
        submit = always_true(),
        value  = NormalModeScore(),
        format = "VALUE"
    )
    
    // Multi-Man Mode
    leaderboard(
        id = params["ID_MultiMan"],
        title = "Multi-Man Mode",
        description = format("Most KOs with {0}", params["Character"]),
        start  = LB_MultiMan(params["Character"]) &&
                 RulesCommunity(),
        cancel = always_false(),
        submit = always_true(),
        value  = dword(Mem_MultiManKills),
        format = "VALUE"
    )
    
    // Cruel Multi-Man Mode
    leaderboard(
        id = params["ID_CruelMan"],
        title = "Cruel Multi-Man Mode",
        description = format("Most KOs with {0}", params["Character"]),
        start  = LB_CruelMultiMan(params["Character"]) &&
                 RulesCommunity(),
        cancel = always_false(),
        submit = always_true(),
        value  = dword(Mem_MultiManKills),
        format = "VALUE"
    )
    
    // Home-Run Contest" {
    leaderboard(
        id = params["ID_Homerun"],
        title = "Home-Run Contest",
        description = format("Longest Distance with {0}", params["Character"]),
        start  = LB_Homerun(params["Character"]) &&
                 RulesCommunity(),
        cancel = always_false(),
        submit = always_true(),
        value  = dword(Mem_HomerunDistance),
        format = "FIXED1"
    )
}

// Master Hand Leaderboards
leaderboard(
    id = 115322, 
    title = "1P Game",
    description = "Highest Score with Master Hand",
    start  = LB_1PGame("Master Hand") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 115323, 
    title = "Remix 1P",
    description = "Highest Score with Master Hand",
    start  = LB_Remix1P("Master Hand") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 115326,
    title = "All-Star Mode",
    description = "Highest Score with Master Hand",
    start  = LB_AllStars("Master Hand") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 115324, 
    title = "Multi-Man Mode",
    description = "Most KOs with Master Hand",
    start  = LB_MultiManHealth("Master Hand") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 115325, 
    title = "Cruel Multi-Man Mode",
    description = "Most KOs with Master Hand",
    start  = LB_CruelMultiManHealth("Master Hand") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

Bonus_Leaderboards = [
    {
        "Character":    "Mario",
        "Stage_Char":   "Mario / Metal Mario",
        "ID_Bonus1":    24658,
        "ID_Bonus2":    24788,
    },
    {
        "Character":    "Fox",
        "Stage_Char":   "Fox / Peppy",
        "ID_Bonus1":    24659,
        "ID_Bonus2":    24843,
    },
    {
        "Character":    "Donkey Kong",
        "Stage_Char":   "Donkey Kong / Lanky Kong",
        "ID_Bonus1":    24660,
        "ID_Bonus2":    24896,
    },
    {
        "Character":    "Samus",
        "Stage_Char":   "Samus",
        "ID_Bonus1":    25990,
        "ID_Bonus2":    24789,
    },
    {
        "Character":    "Luigi",
        "Stage_Char":   "Luigi / Metal Luigi",
        "ID_Bonus1":    24779,
        "ID_Bonus2":    24844,
    },
    {
        "Character":    "Link",
        "Stage_Char":   "Link",
        "ID_Bonus1":    24834,
        "ID_Bonus2":    24897,
    },
    {
        "Character":    "Yoshi",
        "Stage_Char":   "Yoshi",
        "ID_Bonus1":    24887,
        "ID_Bonus2":    24790,
    },
    {
        "Character":    "Captain Falcon",
        "Stage_Char":   "Captain Falcon / Dragon King",
        "ID_Bonus1":    24780,
        "ID_Bonus2":    24845,
    },
    {
        "Character":    "Kirby",
        "Stage_Char":   "Kirby",
        "ID_Bonus1":    24835,
        "ID_Bonus2":    24898,
    },
    {
        "Character":    "Pikachu",
        "Stage_Char":   "Pikachu",
        "ID_Bonus1":    24888,
        "ID_Bonus2":    24791,
    },
    {
        "Character":    "Jigglypuff",
        "Stage_Char":   "Jigglypuff",
        "ID_Bonus1":    24781,
        "ID_Bonus2":    24846,
    },
    {
        "Character":    "Ness",
        "Stage_Char":   "Ness",
        "ID_Bonus1":    24836,
        "ID_Bonus2":    24899,
    },
    {
        "Character":    "Falco",
        "Stage_Char":   "Falco / Slippy",
        "ID_Bonus1":    24889,
        "ID_Bonus2":    24792,
    },
    {
        "Character":    "Ganondorf",
        "Stage_Char":   "Ganondorf",
        "ID_Bonus1":    24782,
        "ID_Bonus2":    24847,
    },
    {
        "Character":    "Young Link",
        "Stage_Char":   "Young Link",
        "ID_Bonus1":    24837,
        "ID_Bonus2":    24900,
    },
    {
        "Character":    "Dr. Mario",
        "Stage_Char":   "Dr. Mario / Dr. Luigi",
        "ID_Bonus1":    24890,
        "ID_Bonus2":    24793,
    },
    {
        "Character":    "Wario",
        "Stage_Char":   "Wario",
        "ID_Bonus1":    24783,
        "ID_Bonus2":    24848,
    },
    {
        "Character":    "Dark Samus",
        "Stage_Char":   "Dark Samus",
        "ID_Bonus1":    24838,
        "ID_Bonus2":    24901,
    },
    {
        "Character":    "Lucas",
        "Stage_Char":   "Lucas",
        "ID_Bonus1":    24891,
        "ID_Bonus2":    24794,
    },
    {
        "Character":    "Bowser",
        "Stage_Char":   "Bowser / Giga Bowser",
        "ID_Bonus1":    24784,
        "ID_Bonus2":    24849,
    },
    {
        "Character":    "Wolf",
        "Stage_Char":   "Wolf",
        "ID_Bonus1":    24839,
        "ID_Bonus2":    24902,
    },
    {
        "Character":    "Conker",
        "Stage_Char":   "Conker",
        "ID_Bonus1":    24892,
        "ID_Bonus2":    24795,
    },
    {
        "Character":    "Mewtwo",
        "Stage_Char":   "Mewtwo",
        "ID_Bonus1":    24785,
        "ID_Bonus2":    24850,
    },
    {
        "Character":    "Marth",
        "Stage_Char":   "Marth / Roy",
        "ID_Bonus1":    24840,
        "ID_Bonus2":    24903,
    },
    {
        "Character":    "Sonic",
        "Stage_Char":   "Sonic / Super Sonic",
        "ID_Bonus1":    24893,
        "ID_Bonus2":    24796,
    },
    {
        "Character":    "Sheik",
        "Stage_Char":   "Sheik",
        "ID_Bonus1":    24786,
        "ID_Bonus2":    24851,
    },
    {
        "Character":    "Marina",
        "Stage_Char":   "Marina",
        "ID_Bonus1":    24841,
        "ID_Bonus2":    24904,
    },
    {
        "Character":    "King Dedede",
        "Stage_Char":   "King Dedede",
        "ID_Bonus1":    24895,
        "ID_Bonus2":    24797,
    },
    {
        "Character":    "Goemon",
        "Stage_Char":   "Goemon / Ebisumaru",
        "ID_Bonus1":    24842,
        "ID_Bonus2":    24852,
    },
    {
        "Character":    "Banjo & Kazooie",
        "Stage_Char":   "Banjo & Kazooie",
        "ID_Bonus1":    24787,
        "ID_Bonus2":    24905,
    },
    {
        "Character":    "Crash",
        "Stage_Char":   "Crash",
        "ID_Bonus1":    134796,
        "ID_Bonus2":    134797,
    },
    {
        "Character":    "Peach",
        "Stage_Char":   "Peach",
        "ID_Bonus1":    134798,
        "ID_Bonus2":    134799,
    },
    {
        "Character":    "Polygon Team",
        "Stage_Char":   "Polygon Team / Mad Piano",
        "ID_Bonus1":    24894,
        "ID_Bonus2":    24798,
    },
]

bonusStage = 0

for params in Bonus_Leaderboards {
    bonusStage = bonusStage + 1
    
    // Bonus 1
    leaderboard(
        id = params["ID_Bonus1"],
        title = format("Bonus 1: Break The Targets", bonusStage),
        description = format("Fastest Time to clear the stage of {0}", params["Stage_Char"]),
        start  = LB_Bonus1(params["Character"]) &&
                 RulesCommunity(),
        cancel = always_false(),
        submit = always_true(),
        value  = Bonus12Timer(),
        format = "FRAMES",
        lower_is_better = true
    )
    
    // Bonus 2
    leaderboard(
        id = params["ID_Bonus2"],
        title = format("Bonus 2: Board The Platforms", bonusStage),
        description = format("Fastest Time to clear the stage of {0}", params["Stage_Char"]),
        start  = LB_Bonus2(params["Character"]) &&
                 RulesCommunity(),
        cancel = always_false(),
        submit = always_true(),
        value  = Bonus12Timer(),
        format = "FRAMES",
        lower_is_better = true
    )
}

leaderboard(
    id = 25988, title = "Bonus 3: Race To The Finish",
    description = "Fastest Time to clear the Normal Stage",
    start  = LB_Bonus3("Normal") &&
             RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus3Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 25986, title = "Bonus 3: Race To The Finish",
    description = "Fastest Time to clear the Remix Stage",
    start  = LB_Bonus3("Remix") &&
             RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus3Timer(),
    format = "FRAMES",
    lower_is_better = true
)

// ----------------------------------------------------------------------------------------------------
// Rich Presence

Lookup_Character = {
}

for character in Characters {
    Lookup_Character[character[0]] = character[1]
}

Lookup_Stage = {
}

for stage in Stages {
    Lookup_Stage[stage[0]] = stage[1]
}

Lookup_1PMode = {
    0x00: "1P Game",
    0x01: "Race to the Finish",
    0x02: "Multi-Man Mode",
    0x03: "Cruel Multi-Man Mode",
    0x04: "Remix 1P",
    0x05: "All-Star Mode",
    0x06: "Home-Run Contest"
}

Lookup_VSMode = {
    0x00: "Free-for-All",
    0x01: "12-Character",
    0x02: "Tag Team",
    0x03: "King of the Hill",
    0x04: "Smashketball"
}

Lookup_Bonus = {
    0x00: "Bonus 1",
    0x01: "Bonus 2",
    0x02: "Bonus 3"
}

Lookup_Smashketball = {
    0x00: "Smashketball 1",
    0x01: "Smashketball 2"
}

Lookup_Challenges = {
    0x00: "/14",
    0x04: "/14",
    0x05: "/30"
}

rich_presence_conditional_display(
    (GameState() == 0x01 || GameState() == 0x08) && (byte(Mem_GameMode) == 0x00 || byte(Mem_GameMode) == 0x04 || byte(Mem_GameMode) == 0x05) && PreGameState() == 0x0E && byte(0xA4B40) == 0xFF,
    "{0} got a Game Over [{1}]",
    rich_presence_lookup("Character", byte(0xA4B38), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("1PMode", byte(Mem_GameMode), Lookup_1PMode, fallback="1P Game")
)
rich_presence_conditional_display(
    (GameState() == 0x01 || GameState() == 0x1B || BothGameStates() == 0x371B || BothGameStates() == 0x800D) && PreGameState() != 0x0E,
    "In the Titlescreen"
)
rich_presence_conditional_display(
    GameState() == 0x01 && PreGameState() == 0x0E && (byte(0xA4B1A) == GetStageID("Racing to the Normal Finish") || byte(0xA4B1A) == GetStageID("Racing to the Remix Finish")),
    "{0} with {1} [⏱️{2}] [{3}] [🏆{4}{5}]",
    rich_presence_lookup("Stage", byte(0xA4B1A), Lookup_Stage, fallback="Peach's Castle"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*0), Lookup_Character, fallback="Mario"),
    rich_presence_value("Secs", measured(dword(0xA4B2C)/60, when=dword(0xA4B2C) <= 0xE10), "SECS"),
    rich_presence_lookup("1PMode", byte(Mem_GameMode), Lookup_1PMode, fallback="1P Game"),
    rich_presence_macro("Number", byte(0xA4AE4)),
    rich_presence_lookup("Challenges", byte(Mem_GameMode), Lookup_Challenges, fallback="")
)
rich_presence_conditional_display(
    GameState() == 0x01 && PreGameState() == 0x0E && byte(PointerPlayerData() + 0x0C + 0xB50*2) == 0,
    "In a Battle between {1} and {2} on the Stage '{3}' [{0}] [🏆{4}{5}]",
    rich_presence_lookup("1PMode", byte(Mem_GameMode), Lookup_1PMode, fallback="1P Game"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*0), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*1), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Stage", byte(0xA4B1A), Lookup_Stage, fallback="Peach's Castle"),
    rich_presence_macro("Number", byte(0xA4AE4)),
    rich_presence_lookup("Challenges", byte(Mem_GameMode), Lookup_Challenges, fallback="")
)
rich_presence_conditional_display(
    GameState() == 0x01 && PreGameState() == 0x0E && byte(PointerPlayerData() + 0x0C + 0xB50*3) == 0,
    "In a Battle between {1}, {2} and {3} on the Stage '{4}' [{0}] [🏆{5}{6}]",
    rich_presence_lookup("1PMode", byte(Mem_GameMode), Lookup_1PMode, fallback="1P Game"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*0), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*1), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*2), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Stage", byte(0xA4B1A), Lookup_Stage, fallback="Peach's Castle"),
    rich_presence_macro("Number", byte(0xA4AE4)),
    rich_presence_lookup("Challenges", byte(Mem_GameMode), Lookup_Challenges, fallback="")
)
rich_presence_conditional_display(
    GameState() == 0x01 && PreGameState() == 0x0E,
    "In a Battle between {1}, {2}, {3} and {4} on the Stage '{5}' [{0}] [🏆{6}{7}]",
    rich_presence_lookup("1PMode", byte(Mem_GameMode), Lookup_1PMode, fallback="1P Game"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*0), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*1), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*2), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*3), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Stage", byte(0xA4B1A), Lookup_Stage, fallback="Peach's Castle"),
    rich_presence_macro("Number", byte(0xA4AE4)),
    rich_presence_lookup("Challenges", byte(Mem_GameMode), Lookup_Challenges, fallback="")
)
rich_presence_conditional_display(
    GameState() == 0x03,
    "In the Debug Menu"
)
rich_presence_conditional_display(
    GameState() == 0x07,
    "In the Main Menu"
)
rich_presence_conditional_display(
    GameState() == 0x08,
    "In the 1P Mode Menu"
)
rich_presence_conditional_display(
    GameState() == 0x09,
    "In the VS Mode Menu"
)
rich_presence_conditional_display(
    GameState() == 0x0E,
    "{0} is waiting for the next Challenge [{1}] [🏆{2}{3}]",
    rich_presence_lookup("Character", byte(0xA4B38), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("1PMode", byte(Mem_GameMode), Lookup_1PMode, fallback="1P Game"),
    rich_presence_macro("Number", byte(0xA4AE4)),
    rich_presence_lookup("Challenges", byte(Mem_GameMode), Lookup_Challenges, fallback="")
)
rich_presence_conditional_display(
    GameState() == 0x0F || GameState() == 0x2F || GameState() == 0x39,
    "In the Options"
)
rich_presence_conditional_display(
    GameState() == 0x11,
    "Preparing {0}",
    rich_presence_lookup("1PMode", byte(Mem_GameMode), Lookup_1PMode, fallback="1P Game")
)
rich_presence_conditional_display(
    (GameState() == 0x10 || BothGameStates() == 0x1510) && byte(Mem_VSMode) != 4,
    "Preparing a {0} Battle",
    rich_presence_lookup("VSMode", byte(Mem_VSMode), Lookup_VSMode, fallback="Free-for-All")
)
rich_presence_conditional_display(
    (GameState() == 0x10 || BothGameStates() == 0x1510) && byte(Mem_VSMode) == 4,
    "Preparing a {0} Battle",
    rich_presence_lookup("Smashketball", byte(Mem_SmashketballData), Lookup_Smashketball, fallback="Smashketball 1")
)
rich_presence_conditional_display(
    GameState() == 0x12 ||
        BothGameStates() == 0x1512,
    "Preparing a Training Session"
)

rich_presence_conditional_display(
    (GameState() == 0x13 || GameState() == 0x14) && (byte(Mem_GameMode) != 2 && byte(Mem_GameMode) != 3 && byte(Mem_GameMode) != 6),
    "Preparing a {0} Practice",
    rich_presence_lookup("Bonus", byte(0x137714), Lookup_Bonus, fallback="Bonus 1")
)

rich_presence_conditional_display(
    (GameState() == 0x13 || GameState() == 0x14) && (byte(Mem_GameMode) == 2 || byte(Mem_GameMode) == 3 || byte(Mem_GameMode) == 6),
    "Preparing a {0}",
    rich_presence_lookup("1PMode", byte(Mem_GameMode), Lookup_1PMode, fallback="1P Game")
)

rich_presence_conditional_display(
    GameState() == 0x16 && byte(Mem_VSMode) != 4 && byte(PointerPlayerData() + 0x0C + 0xB50*2) == 0,
    "In a Battle between {1} and {2} on the Stage '{3}' [{0}]",
    rich_presence_lookup("VSMode", byte(Mem_VSMode), Lookup_VSMode, fallback="Free-for-All"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*0), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*1), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Stage", byte(0xA4D0A), Lookup_Stage, fallback="Peach's Castle")
)
rich_presence_conditional_display(
    GameState() == 0x16 && byte(Mem_VSMode) != 4 && byte(PointerPlayerData() + 0x0C + 0xB50*3) == 0,
    "In a Battle between {1}, {2} and {3} on the Stage '{4}' [{0}]",
    rich_presence_lookup("VSMode", byte(Mem_VSMode), Lookup_VSMode, fallback="Free-for-All"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*0), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*1), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*2), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Stage", byte(0xA4D0A), Lookup_Stage, fallback="Peach's Castle")
)
rich_presence_conditional_display(
    GameState() == 0x16 && byte(Mem_VSMode) != 4,
    "In a Battle between {1}, {2}, {3} and {4} on the Stage '{5}' [{0}]",
    rich_presence_lookup("VSMode", byte(Mem_VSMode), Lookup_VSMode, fallback="Free-for-All"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*0), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*1), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*2), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*3), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Stage", byte(0xA4D0A), Lookup_Stage, fallback="Peach's Castle")
)
rich_presence_conditional_display(
    GameState() == 0x16 && byte(Mem_VSMode) == 4 && byte(PointerPlayerData() + 0x0C + 0xB50*2) == 0,
    "In a Battle between {1} and {2} [{0}]",
    rich_presence_lookup("Smashketball", byte(Mem_SmashketballData), Lookup_Smashketball, fallback="Smashketball 1"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*0), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*1), Lookup_Character, fallback="Mario")
)
rich_presence_conditional_display(
    GameState() == 0x16 && byte(Mem_VSMode) == 4 && byte(PointerPlayerData() + 0x0C + 0xB50*3) == 0,
    "In a Battle between {1}, {2} and {3} [{0}]",
    rich_presence_lookup("Smashketball", byte(Mem_SmashketballData), Lookup_Smashketball, fallback="Smashketball 1"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*0), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*1), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*2), Lookup_Character, fallback="Mario")
)
rich_presence_conditional_display(
    GameState() == 0x16 && byte(Mem_VSMode) == 4,
    "In a Battle between {1}, {2}, {3} and {4} [{0}]",
    rich_presence_lookup("Smashketball", byte(Mem_SmashketballData), Lookup_Smashketball, fallback="Smashketball 1"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*0), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*1), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*2), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*3), Lookup_Character, fallback="Mario")
)
rich_presence_conditional_display(
    GameState() == 0x18 && byte(Mem_VSMode) != 4 && byte(PointerPlayerData() + 0x0C + 0xB50*2) == 0,
    "In the Results of a Battle between {1} and {2} [{0}]",
    rich_presence_lookup("VSMode", byte(Mem_VSMode), Lookup_VSMode, fallback="Free-for-All"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*0), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*1), Lookup_Character, fallback="Mario")
)
rich_presence_conditional_display(
    GameState() == 0x18 && byte(Mem_VSMode) != 4 && byte(PointerPlayerData() + 0x0C + 0xB50*3) == 0,
    "In the Results of a Battle between {1}, {2} and {3} [{0}]",
    rich_presence_lookup("VSMode", byte(Mem_VSMode), Lookup_VSMode, fallback="Free-for-All"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*0), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*1), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*2), Lookup_Character, fallback="Mario")
)
rich_presence_conditional_display(
    GameState() == 0x18 && byte(Mem_VSMode) != 4,
    "In the Results of a Battle between {1}, {2}, {3} and {4} [{0}]",
    rich_presence_lookup("VSMode", byte(Mem_VSMode), Lookup_VSMode, fallback="Free-for-All"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*0), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*1), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*2), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*3), Lookup_Character, fallback="Mario")
)
rich_presence_conditional_display(
    GameState() == 0x18 && byte(Mem_VSMode) == 4 && byte(PointerPlayerData() + 0x0C + 0xB50*2) == 0,
    "In the Results of a Battle between {1} and {2} [{0}]",
    rich_presence_lookup("Smashketball", byte(Mem_SmashketballData), Lookup_Smashketball, fallback="Smashketball 1"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*0), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*1), Lookup_Character, fallback="Mario")
)
rich_presence_conditional_display(
    GameState() == 0x18 && byte(Mem_VSMode) == 4 && byte(PointerPlayerData() + 0x0C + 0xB50*3) == 0,
    "In the Results of a Battle between {1}, {2} and {3} [{0}]",
    rich_presence_lookup("Smashketball", byte(Mem_SmashketballData), Lookup_Smashketball, fallback="Smashketball 1"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*0), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*1), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*2), Lookup_Character, fallback="Mario")
)
rich_presence_conditional_display(
    GameState() == 0x18 && byte(Mem_VSMode) == 4,
    "In the Results of a Battle between {1}, {2}, {3} and {4} [{0}]",
    rich_presence_lookup("Smashketball", byte(Mem_SmashketballData), Lookup_Smashketball, fallback="Smashketball 1"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*0), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*1), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*2), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*3), Lookup_Character, fallback="Mario")
)
rich_presence_conditional_display(
    GameState() == 0x19,
    "Checking the VS Record"
)
rich_presence_conditional_display(
    GameState() == 0x1A,
    "Checking Character Data of {0}",
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08), Lookup_Character, fallback="Mario")
)
rich_presence_conditional_display(
    GameState() >= 0x1C && GameState() <= 0x2E,
    "Watching the Intro Sequence"
)
rich_presence_conditional_display(
    GameState() == 0x30,
    "{0} completed the Mode [{1}] [🏆{2}{2}]",
    rich_presence_lookup("Character", byte(0xA4B38), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("1PMode", byte(Mem_GameMode), Lookup_1PMode, fallback="1P Game"),
    rich_presence_lookup("Challenges", byte(Mem_GameMode), Lookup_Challenges, fallback="")
)
rich_presence_conditional_display(
    GameState() >= 0x33 && GameState() <= 0x34 && byte(Mem_GameMode) != 0x05,
    "{0} completed the current Challenge [{1}] [🏆{2}{3}]",
    rich_presence_lookup("Character", byte(0xA4B38), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("1PMode", byte(Mem_GameMode), Lookup_1PMode, fallback="1P Game"),
    rich_presence_macro("Number", byte(0xA4AE4) + 1),
    rich_presence_lookup("Challenges", byte(Mem_GameMode), Lookup_Challenges, fallback="")
)
rich_presence_conditional_display(
    GameState() >= 0x33 && GameState() <= 0x34 && byte(Mem_GameMode) == 0x05,
    "{0} completed the current Challenge [{1}] [🏆{2}{3}]",
    rich_presence_lookup("Character", byte(0xA4B38), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("1PMode", byte(Mem_GameMode), Lookup_1PMode, fallback="1P Game"),
    rich_presence_macro("Number", byte(Mem_GameMode + 0x14)),
    rich_presence_lookup("Challenges", byte(Mem_GameMode), Lookup_Challenges, fallback="")
)
rich_presence_conditional_display(
    GameState() == 0x35 && byte(Mem_GameMode) != 2 && byte(Mem_GameMode) != 3 && PlayingBonus1(0x18F1B2) && BothGameStates() == 0x3534, //Break the Targets in Game Mode
    "{0} with {1} [🎯{2}/10] [⏱️{3}] [{4}] [🏆{5}{6}]",
    rich_presence_lookup("Stage", byte(0x18F1B2), Lookup_Stage, fallback="Peach's Castle"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*0), Lookup_Character, fallback="Mario"),
    rich_presence_macro("Number", 10 - byte(0x1313FF)),
    rich_presence_value("Secs", word(0x18F1C4)/60, "SECS"),
    rich_presence_lookup("1PMode", byte(Mem_GameMode), Lookup_1PMode, fallback="1P Game"),
    rich_presence_macro("Number", byte(0xA4AE4)),
    rich_presence_lookup("Challenges", byte(Mem_GameMode), Lookup_Challenges, fallback="")
)
rich_presence_conditional_display(
    GameState() == 0x35 && byte(Mem_GameMode) != 2 && byte(Mem_GameMode) != 3 && PlayingBonus1(0x18F1B2) && BothGameStates() != 0x3534, //Break the Targets in Practice
    "{0} with {1} [🎯{2}/10] [⏱️{3}] [Practice]",
    rich_presence_lookup("Stage", byte(0x18F1B2), Lookup_Stage, fallback="Peach's Castle"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*0), Lookup_Character, fallback="Mario"),
    rich_presence_macro("Number", 10 - byte(0x1313FF)),
    rich_presence_value("Frames", dword(0x18F1C8), "FRAMES")
)
rich_presence_conditional_display(
    GameState() == 0x35 && byte(Mem_GameMode) != 2 && byte(Mem_GameMode) != 3 && PlayingBonus2(0x18F1B2) && BothGameStates() == 0x3534, //Board the Platforms in Game Mode
    "{0} with {1} [🕳{2}/10] [⏱️{3}] [{4}] [🏆{5}{6}]",
    rich_presence_lookup("Stage", byte(0x18F1B2), Lookup_Stage, fallback="Peach's Castle"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*0), Lookup_Character, fallback="Mario"),
    rich_presence_macro("Number", 10 - byte(0x131403)),
    rich_presence_value("Secs", word(0x18F1C4)/60, "SECS"),
    rich_presence_lookup("1PMode", byte(Mem_GameMode), Lookup_1PMode, fallback="1P Game"),
    rich_presence_macro("Number", byte(Mem_GameMode + 0x14)),
    rich_presence_lookup("Challenges", byte(Mem_GameMode), Lookup_Challenges, fallback="")
)
rich_presence_conditional_display(
    GameState() == 0x35 && byte(Mem_GameMode) != 2 && byte(Mem_GameMode) != 3 && PlayingBonus2(0x18F1B2) && BothGameStates() != 0x3534, //Board the Platforms in Practice
    "{0} with {1} [🕳{2}/10] [⏱️{3}] [Practice]",
    rich_presence_lookup("Stage", byte(0x18F1B2), Lookup_Stage, fallback="Peach's Castle"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*0), Lookup_Character, fallback="Mario"),
    rich_presence_macro("Number", 10 - byte(0x131403)),
    rich_presence_value("Frames", dword(0x18F1C8), "FRAMES")
)
rich_presence_conditional_display(
    GameState() == 0x36 && byte(PointerPlayerData() + 0x0C + 0xB50*1) == 0,
    "In a Training Session with {0} on the Stage '{1}' [Training]",
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*0), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Stage", byte(0xA4ADC), Lookup_Stage, fallback="Peach's Castle")
)
rich_presence_conditional_display(
    GameState() == 0x36 && byte(PointerPlayerData() + 0x0C + 0xB50*2) == 0,
    "In a Training Session with {0} and {1} on the Stage '{2}' [Training]",
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*0), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*1), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Stage", byte(0xA4ADC), Lookup_Stage, fallback="Peach's Castle")
)
rich_presence_conditional_display(
    GameState() == 0x36 && byte(PointerPlayerData() + 0x0C + 0xB50*3) == 0,
    "In a Training Session with {0}, {1} and {2} on the Stage '{3}' [Training]",
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*0), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*1), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*2), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Stage", byte(0xA4ADC), Lookup_Stage, fallback="Peach's Castle")
)
rich_presence_conditional_display(
    GameState() == 0x36,
    "In a Training Session with {0}, {1}, {2} and {3} on the Stage '{4}' [Training]",
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*0), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*1), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*2), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*3), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Stage", byte(0xA4ADC), Lookup_Stage, fallback="Peach's Castle")
)
rich_presence_conditional_display(
    GameState() == 0x37,
    "In the Gallery"
)
rich_presence_conditional_display(
    GameState() == 0x38,
    "Watching the Credits"
)
rich_presence_conditional_display(
    GameState() == 0x3A,
    "In the Data Menu"
)
rich_presence_conditional_display(
    GameState() == 0x3B,
    "In the Sound Test"
)
rich_presence_conditional_display(
    GameState() == 0x3C,
    "Watching the Tutorial Battle"
)
rich_presence_conditional_display(
    GameState() == 0x3D && byte(PointerPlayerData() + 0x0C + 0xB50*2) == 0,
    "Watching a Battle between {0} and {1} on the Stage '{2}' [Demo]",
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*0), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*1), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Stage", byte(0x18E2F2), Lookup_Stage, fallback="Peach's Castle")
)
rich_presence_conditional_display(
    GameState() == 0x3D && byte(PointerPlayerData() + 0x0C + 0xB50*3) == 0,
    "Watching a Battle between {0}, {1} and {2} on the Stage '{3}' [Demo]",
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*0), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*1), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*2), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Stage", byte(0x18E2F2), Lookup_Stage, fallback="Peach's Castle")
)
rich_presence_conditional_display(
    GameState() == 0x3D,
    "Watching a Battle between {0}, {1}, {2} and {3} on the Stage '{4}' [Demo]",
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*0), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*1), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*2), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*3), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Stage", byte(0x18E2F2), Lookup_Stage, fallback="Peach's Castle")
)
rich_presence_conditional_display(
    GameState() == 0x77 && (byte(0xA4B1A) == GetStageID("Racing to the Normal Finish") || byte(0xA4B1A) == GetStageID("Racing to the Remix Finish")),
    "{0} with {1} [⏱️{2}]",
    rich_presence_lookup("Stage", byte(0xA4B1A), Lookup_Stage, fallback="Peach's Castle"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*0), Lookup_Character, fallback="Mario"),
    rich_presence_value("Frames", dword(0xA4B30), "FRAMES")
)
rich_presence_conditional_display(
    GameState() == 0x77 && (byte(0xA4B1A) == GetStageID("Home-Run Contest")),
    "{0} is punching the Sandbag for a great Distance [Home-Run Contest]",
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*0), Lookup_Character, fallback="Mario")
)
rich_presence_conditional_display(
    GameState() == 0x77 && (byte(Mem_GameMode) == 0x02 || byte(Mem_GameMode) == 0x03),
    "{0} is smashing against endlessly on the Stage '{1}' [⚪{3}] [{2}]",
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*0), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Stage", byte(0xA4B1A), Lookup_Stage, fallback="Peach's Castle"),
    rich_presence_lookup("1PMode", byte(Mem_GameMode), Lookup_1PMode, fallback="1P Game"),
    rich_presence_value("Number", dword(Mem_MultiManKills), "VALUE")
)
rich_presence_conditional_display(
    GameState() == 0x77 && byte(Mem_GameMode) == 0x05 && (byte(0xA4B1A) == GetStageID("All-Star Lobby")),
    "{0} is in the Lobby [All-Star Mode] [🏆{1}{2}]",
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*0), Lookup_Character, fallback="Mario"),
    rich_presence_macro("Number", byte(Mem_GameMode + 0x14)),
    rich_presence_lookup("Challenges", byte(Mem_GameMode), Lookup_Challenges, fallback="")
)
rich_presence_conditional_display(
    GameState() == 0x77 && byte(Mem_GameMode) == 0x05 && PreGameState() == 0x0E && byte(PointerPlayerData() + 0x0C + 0xB50*2) == 0,
    "In a Battle between {1} and {2} on the Stage '{3}' [{0}] [🏆{4}{5}]",
    rich_presence_lookup("1PMode", byte(Mem_GameMode), Lookup_1PMode, fallback="1P Game"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*0), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*1), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Stage", byte(0xA4B1A), Lookup_Stage, fallback="Peach's Castle"),
    rich_presence_macro("Number", byte(Mem_GameMode + 0x14)),
    rich_presence_lookup("Challenges", byte(Mem_GameMode), Lookup_Challenges, fallback="")
)
rich_presence_conditional_display(
    GameState() == 0x77 && byte(Mem_GameMode) == 0x05 && PreGameState() == 0x0E && byte(PointerPlayerData() + 0x0C + 0xB50*3) == 0,
    "In a Battle between {1}, {2} and {3} on the Stage '{4}' [{0}] [🏆{5}{6}]",
    rich_presence_lookup("1PMode", byte(Mem_GameMode), Lookup_1PMode, fallback="1P Game"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*0), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*1), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*2), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Stage", byte(0xA4B1A), Lookup_Stage, fallback="Peach's Castle"),
    rich_presence_macro("Number", byte(Mem_GameMode + 0x14)),
    rich_presence_lookup("Challenges", byte(Mem_GameMode), Lookup_Challenges, fallback="")
)
rich_presence_conditional_display(
    GameState() == 0x77 && byte(Mem_GameMode) == 0x05 && PreGameState() == 0x0E,
    "In a Battle between {1}, {2}, {3} and {4} on the Stage '{5}' [{0}] [🏆{6}{7}]",
    rich_presence_lookup("1PMode", byte(Mem_GameMode), Lookup_1PMode, fallback="1P Game"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*0), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*1), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*2), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Character", byte(PointerPlayerData() + 0x08 + 0xB50*3), Lookup_Character, fallback="Mario"),
    rich_presence_lookup("Stage", byte(0xA4B1A), Lookup_Stage, fallback="Peach's Castle"),
    rich_presence_macro("Number", byte(Mem_GameMode + 0x14)),
    rich_presence_lookup("Challenges", byte(Mem_GameMode), Lookup_Challenges, fallback="")
)
rich_presence_display(
        "In the Main Menu"
)

