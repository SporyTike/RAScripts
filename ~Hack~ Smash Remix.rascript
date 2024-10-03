// ~Hack~ Smash Remix
// #ID = 15964

// ----------------------------------------------------------------------------------------------------
// Dynamic Addresses
Mem_Bonus12RecordData   = 0x48BCF0    
//               v1.1.0 - 0x45034C  
// Bonus 1 / Bonus 2 - Records (new Characters - Normal) [1600 Bytes; 32 Bytes per Character ID]
//  +16 | Bonus 1 - Record Time (32bit)
//  +23 | Bonus 1 - Target Record
//  +24 | Bonus 2 - Record Time (32bit)
//  +31 | Bonus 2 - Platform Record            
                        
Mem_RulesData           = 0x452888                        
//               v1.1.0 - 0x452880

Mem_HighscoreOn         = 0x4C9BE0

Mem_BattleSetting       = 0x4462C8

Mem_GameMode            = 0x4CBD04
//               v1.1.0 - 0x4752BC
// Game Mode
// 00 | 1P Game
// 01 | Race to the Finish
// 02 | Multi-Man Mode
// 03 | Cruel Multi-Man Mode
// 04 | 1P Remix
// 05 | All-Star Mode
// 06 | Home-Run Contest

Mem_12CharacterStocks   = 0x4D7618
//               v1.1.0 - 0x47E91C
// 12-Character Battle - Set Stocks [32bit]

Mem_HomerunDistance     = 0x4D1DB0
//               v1.1.0 - 0x479694
// Home-Run Contest - Distance (Graphic) [32bit]

Mem_FreeModeComboData   = 0x4C7780
//               v1.1.0 - 0x4715AC
// Free-for-All - 1P - Combo [16 Bytes]
//  +00 | Combo against 1P
//  +04 | Combo against 2P
//  +08 | Combo against 3P
//  +12 | Combo against 4P

Mem_PlayerTagStart      = 0x4590DB
// Array that stores Player Tags

Mem_KirbyHatOption      = 0x546178
// Option for Pre-Selected Kirby Hat [16 Bytes; 32bit each]

Val_WarioComplain       = 0x8050E910
//               v1.1.0 - 0x8049BCE4
// Wario's Idle Animation [32bit]

// ----------------------------------------------------------------------------------------------------
// Static Addresses
Mem_VSRecordsOldChars   = 0x0A44E0
Mem_NormalModeData      = 0x0A4938
Mem_FreeModeData        = 0x0A4D0E
Mem_FreeModePlacement   = 0x139BB0
Mem_GameState           = 0x0A4AD3
Mem_PointerPlayerData   = 0x130D84
Mem_Bonus12Data         = 0x1313FF
Mem_ContinueState       = 0x13433C
Mem_TrainingSelectData  = 0x1385A0
Mem_NormalSelectData    = 0x138F08
Mem_MultiManKills       = 0x1936A0
Mem_World1_1Progress    = 0x269D70

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
    [0x48, "Polygon Wario",             true,   "Polygon"],
    [0x49, "Polygon Lucas",             true,   "Polygon"],
    [0x4A, "Polygon Bowser",            true,   "Polygon"],
    [0x4B, "Polygon Wolf",              true,   "Polygon"],
    [0x4C, "Polygon Dr. Mario",         true,   "Polygon"],
    [0x4D, "Polygon Sonic",             true,   "Polygon"],
    [0x4E, "Polygon Sheik",             true,   "Polygon"],
    [0x4F, "Polygon Marina",            true,   "Polygon"],
    [0x50, "Polygon Falco",             true,   "Polygon"],
    [0x51, "Polygon Ganondorf",         true,   "Polygon"],
    [0x52, "Polygon Dark Samus",        true,   "Polygon"],
    [0x53, "Polygon Marth",             true,   "Polygon"],
    [0x54, "Polygon Mewtwo",            true,   "Polygon"],
    [0x55, "Polygon King Dedede",       true,   "Polygon"],
    [0x56, "Polygon Young Link",        true,   "Polygon"],
    [0x57, "Polygon Goemon",            true,   "Polygon"],
    [0x58, "Polygon Conker",            true,   "Polygon"],
    [0x59, "Polygon Banjo & Kazooie",   true,   "Polygon"],
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
    [0x0F, "Race to the Finish - Normal"],
    [0x10, "Final Destination"],
    [0x11, "Bonus 1 - Mario / Metal Mario"],
    [0x12, "Bonus 1 - Fox / Peppy"],
    [0x13, "Bonus 1 - Fox / Peppy"],
    [0x14, "Bonus 1 - Samus"],
    [0x15, "Bonus 1 - Luigi / Metal Luigi"],
    [0x16, "Bonus 1 - Link"],
    [0x17, "Bonus 1 - Yoshi"],
    [0x18, "Bonus 1 - Captain Falcon / Dragon King"],
    [0x19, "Bonus 1 - Kirby"],
    [0x1A, "Bonus 1 - Pikachu"],
    [0x1B, "Bonus 1 - Jigglypuff"],
    [0x1C, "Bonus 1 - Ness"],
    [0x1D, "Bonus 2 - Mario / Metal Mario"],
    [0x1E, "Bonus 2 - Fox / Peppy"],
    [0x1F, "Bonus 2 - Donkey Kong"],
    [0x20, "Bonus 2 - Samus"],
    [0x21, "Bonus 2 - Luigi / Metal Luigi"],
    [0x22, "Bonus 2 - Link"],
    [0x23, "Bonus 2 - Yoshi"],
    [0x24, "Bonus 2 - Captain Falcon / Dragon King"],
    [0x25, "Bonus 2 - Kirby"],
    [0x26, "Bonus 2 - Pikachu"],
    [0x27, "Bonus 2 - Jigglypuff"],
    [0x28, "Bonus 2 - Ness"],
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
    [0x4D, "Bonus 1 - Dr. Mario"],
    [0x4E, "Bonus 1 - Ganondorf"],
    [0x4F, "Bonus 1 - Young Link"],
    [0x50, "Battlefield DL"],
    [0x51, "Bonus 1 - Dark Samus"],
    [0x52, "Bonus 1 - Polygon Team / Mad Piano"],
    [0x53, "Bonus 1 - Falco / Slippy"],
    [0x54, "Bonus 1 - Wario"],
    [0x55, "Hyrule Temple"],
    [0x56, "Bonus 1 - Lucas"],
    [0x57, "Bonus 2 - Ganondorf"],
    [0x58, "New Pork City"],
    [0x59, "Bonus 2 - Dark Samus"],
    [0x5A, "Smashketball"],
    [0x5B, "Bonus 2 - Dr. Mario"],
    [0x5C, "Norfair"],
    [0x5D, "Corneria City"],
    [0x5E, "Congo Falls"],
    [0x5F, "Osohe Castle"],
    [0x60, "Yoshi's Story"],
    [0x61, "World 1-1"],
    [0x62, "Flat Zone II"],
    [0x63, "Gerudo Valley"],
    [0x64, "Bonus 2 - Young Link"],
    [0x65, "Bonus 2 - Falco / Slippy"],
    [0x66, "Bonus 2 - Polygon Team / Mad Piano"],
    [0x67, "Hyrule Castle DL"],
    [0x68, "Hyrule Castle Ω"],
    [0x69, "Congo Jungle DL"],
    [0x6A, "Congo Jungle Ω"],
    [0x6B, "Peach's Castle DL"],
    [0x6C, "Peach's Castle Ω"],
    [0x6D, "Bonus 2 - Wario"],
    [0x6E, "Fray's Stage - Night"],
    [0x6F, "Goomba Road"],
    [0x70, "Bonus 2 - Lucas"],
    [0x71, "Sector Z DL"],
    [0x72, "Saffron City DL"],
    [0x73, "Yoshi's Island DL"],
    [0x74, "Zebes DL"],
    [0x75, "Sector Z Ω"],
    [0x76, "Saffron City Ω"],
    [0x77, "Yoshi's Island Ω"],
    [0x78, "Dream Land Ω"],
    [0x79, "Zebes Ω"],
    [0x7A, "Bonus 1 - Bowser / Giga Bowser"],
    [0x7B, "Bonus 2 - Bowser / Giga Bowser"],
    [0x7C, "Bowser's Keep"],
    [0x7D, "Rith Essa"],
    [0x7E, "Venom"],
    [0x7F, "Bonus 1 - Wolf"],
    [0x80, "Bonus 2 - Wolf"],
    [0x81, "Bonus 1 - Conker"],
    [0x82, "Bonus 2 - Conker"],
    [0x83, "Windy"],
    [0x84, "dataDyne Central"],
    [0x85, "Planet Clancer"],
    [0x86, "Jungle Japes"],
    [0x87, "Bonus 1 - Marth"],
    [0x88, "Game Boy Land"],
    [0x89, "Bonus 1 - Mewtwo"],
    [0x8A, "Bonus 2 - Marth"],
    [0x8B, "All-Star Lobby"],
    [0x8C, "Bonus 2 - Mewtwo"],
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
    [0xA0, "Bonus 1 - Sonic / Super Sonic"],
    [0xA1, "Bonus 2 - Sonic / Super Sonic"],
    [0xA2, "Metallic Madness"],
    [0xA3, "Rainbow Road"],
    [0xA4, "Pokemon Stadium 2"],
    [0xA5, "Norfair Remix"],
    [0xA6, "Toad's Turnpike"],
    [0xA7, "Tal Tal Heights Remix"],
    [0xA8, "Bonus 2 - Sheik"],
    [0xA9, "Winter Dream Land"],
    [0xAA, "Bonus 1 - Sheik"],
    [0xAB, "Glacial River Remix"],
    [0xAC, "Bonus 1 - Marina"],
    [0xAD, "Dragon King Remix"],
    [0xAE, "Bonus 2 - Marina"],
    [0xAF, "Bonus 1 - King Dedede"],
    [0xB0, "Dracula's Castle"],
    [0xB1, "Reverse Castle"],
    [0xB2, "Bonus 2 - King Dedede"],
    [0xB3, "Mt. Dedede"],
    [0xB4, "Edo Town"],
    [0xB5, "Deku Tree DL"],
    [0xB6, "Crateria DL"],
    [0xB7, "Bonus 1 - Goemon / Ebisumaru"],
    [0xB8, "First Destination Remix"],
    [0xB9, "Bonus 2 - Goemon / Ebisumaru"],
    [0xBA, "Twilight City"],
    [0xBB, "Melrode"],
    [0xBC, "Meta Crystent"],
    [0xBD, "Race to the Finish - Remix"],
    [0xBE, "Grim Reaper's Cavern"],
    [0xBF, "Scuttle Town"],
    [0xC0, "Big Boo's Haunt"],
    [0xC1, "Dinosaur Land"],
    [0xC2, "Bonus 1 - Banjo & Kazooie"],
    [0xC3, "Spawned Fear"],
    [0xC4, "Smashville Remix"],
    [0xC5, "Bonus 2 - Banjo & Kazooie"],
    [0xC6, "Poke Floats"],
    [0xC7, "Big Snowman"]
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
    [GetCharID("Mario"), "Mario", false],
    [GetCharID("Fox"), "Fox", false],
    [GetCharID("Donkey Kong"), "Donkey Kong", false],
    [GetCharID("Samus"), "Samus", false],
    [GetCharID("Luigi"), "Luigi", false],
    [GetCharID("Link"), "Link", false],
    [GetCharID("Yoshi"), "Yoshi", false],
    [GetCharID("Captain Falcon"), "Captain Falcon", false],
    [GetCharID("Pikachu"), "Pikachu", false],
    [GetCharID("Jigglypuff"), "Jigglypuff", false],
    [GetCharID("Ness"), "Ness", false],
    [0x1C, "???", true],
    [GetCharID("Falco"), "Falco", true],
    [GetCharID("Ganondorf"), "Ganondorf", true],
    [GetCharID("Young Link"), "Young Link", true],
    [GetCharID("Dr. Mario"), "Dr. Mario", true],
    [GetCharID("Wario"), "Wario", true],
    [GetCharID("Dark Samus"), "Dark Samus", true],
    [GetCharID("Lucas"), "Lucas", true],
    [GetCharID("Bowser"), "Bowser", true],
    [GetCharID("Mad Piano"), "Mad Piano", true],
    [GetCharID("Wolf"), "Wolf", true],
    [GetCharID("Conker"), "Conker", true],
    [GetCharID("Mewtwo"), "Mewtwo", true],
    [GetCharID("Marth"), "Marth", true],
    [GetCharID("Sonic"), "Sonic", true],
    [GetCharID("Sheik"), "Sheik", true],
    [GetCharID("Marina"), "Marina", true],
    [GetCharID("King Dedede"), "King Dedede", true],
    [GetCharID("Goemon"), "Goemon", true],
    [GetCharID("Slippy"), "Slippy", true],
    [GetCharID("Peppy"), "Peppy", true],
    [GetCharID("Banjo & Kazooie"), "Banjo & Kazooie", true],
    [GetCharID("Ebisumaru"), "Ebisumaru", true],
    [GetCharID("Dragon King"), "Dragon King", true],
]

// Stage ID, Bonus 1 Map, Bonus 2 Map, Stage Character 1, Stage Character 2
BonusStages = [
    [1, 0x11, 0x1D, "Mario", "Metal Mario"],
    [2, 0x12, 0x1E, "Fox", "Peppy"],
    [3, 0x13, 0x1F, "Donkey Kong", ""],
    [4, 0x14, 0x20, "Samus", ""],
    [5, 0x15, 0x21, "Luigi", "Metal Luigi"],
    [6, 0x16, 0x22, "Link", ""],
    [7, 0x17, 0x23, "Yoshi", ""],
    [8, 0x18, 0x24, "Captain Falcon", "Dragon King"],
    [9, 0x19, 0x25, "Kirby", ""],
    [10, 0x1A, 0x26, "Pikachu", ""],
    [11, 0x1B, 0x27, "Jigglypuff", ""],
    [12, 0x1C, 0x28, "Ness", ""],
    [13, 0x4D, 0x5B, "Dr. Mario", ""],
    [14, 0x4E, 0x57, "Ganondorf", ""],
    [15, 0x4F, 0x64, "Young Link", ""],
    [16, 0x51, 0x59, "Dark Samus", ""],
    [17, 0x52, 0x66, "Polygon Team", "Mad Piano"],
    [18, 0x53, 0x65, "Falco", "Slippy"],
    [19, 0x54, 0x6D, "Wario", ""],
    [20, 0x56, 0x70, "Lucas", ""],
    [21, 0x7A, 0x7B, "Bowser", "Giga Bowser"],
    [22, 0x7F, 0x80, "Wolf", ""],
    [23, 0x81, 0x82, "Conker", ""],
    [24, 0x87, 0x8A, "Marth", ""],
    [25, 0x89, 0x8C, "Mewtwo", ""],
    [26, 0xA0, 0xA1, "Sonic", "Super Sonic"],
    [27, 0xAA, 0xA8, "Sheik", ""],
    [28, 0xAC, 0xAE, "Marina", ""],
    [29, 0xAF, 0xB2, "King Dedede", ""],
    [30, 0xB7, 0xB9, "Goemon", "Ebisumaru"],
    [31, 0xC2, 0xC5, "Banjo & Kazooie", ""],
]

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

function NormalModeChar2Stocks() => byte(Mem_NormalModeData + 628)
// 1P Game / Remix Mode - Player 2 - Stocks in Reserve [8bit]
function NormalModeChar2Percentage() => word(Mem_NormalModeData + 704)
// 1P Game / Remix Mode - Player 2 - Percentage [16bit]

function NormalModeChar3Stocks() => byte(Mem_NormalModeData + 744)
// 1P Game / Remix Mode - Player 3 - Stocks in Reserve [8bit]
function NormalModeChar3Percentage() => word(Mem_NormalModeDate + 820)
// 1P Game / Remix Mode - Player 3 - Percentage [16bit]

function NormalModeChar4Stocks() => byte(Mem_NormalModeData + 860)
// 1P Game / Remix Mode - Player 4 - Stocks in Reserve [8bit]
function NormalModeChar4Percentage() => word(Mem_NormalModeData + 936)
// 1P Game / Remix Mode - Player 4 - Percentage [16bit]

function NormalModeScore() => dword(Mem_NormalModeData + 440)
// 1P Game / Remix 1P / All-Star Mode - Total Score [32bit]

function NormalModeStage() => byte(Mem_NormalModeData + 482)
// 1P Game / Remix Mode / Bonus 3 - Stage ID [8bit]

function NormalModeNumFighters() => byte(Mem_NormalModeData + 486)
// 1P Game / Remix Mode - Number of Fighters in Battle [8bit]

function NormalModeTimer() => dword(Mem_NormalModeData + 500)
// 1P Game / Remix Mode - Battle Timer [32bit]

function NormalSelectChar1() => byte(Mem_NormalSelectData)
// 1P Player Game - Character Select - Player 1 - Character ID [8bit]

function NormalSelectChar1Confirm() => byte(Mem_NormalSelectData + 12)
// 1P Player Game - Character Select - Player 1 - Character confirmed [8bit]

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
function FreeModeChar1DMG1() => dword(Mem_FreeModeData + 86)
// Free-for-all - Player 1 - Damage taken from 1P [32bit]
function FreeModeChar1DMG2() => dword(Mem_FreeModeData + 90)
// Free-for-all - Player 1 - Damage taken from 2P [32bit]
function FreeModeChar1DMG3() => dword(Mem_FreeModeData + 94)
// Free-for-all - Player 1 - Damage taken from 3P [32bit]
function FreeModeChar1DMG4() => dword(Mem_FreeModeData + 98)
// Free-for-all - Player 1 - Damage taken from 4P [32bit]
function FreeModeChar1Percentage() => word(Mem_FreeModeData + 102)
// Free-for-all - Player 1 - Percentage [16bit]

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
function FreeModeChar2DMG1() => dword(Mem_FreeModeData + 202)
// Free-for-all - Player 2 - Damage taken from 1P [32bit]
function FreeModeChar2DMG2() => dword(Mem_FreeModeData + 206)
// Free-for-all - Player 2 - Damage taken from 2P [32bit]
function FreeModeChar2DMG3() => dword(Mem_FreeModeData + 210)
// Free-for-all - Player 2 - Damage taken from 3P [32bit]
function FreeModeChar2DMG4() => dword(Mem_FreeModeData + 214)
// Free-for-all - Player 2 - Damage taken from 4P [32bit]
function FreeModeChar2Percentage() => word(Mem_FreeModeData + 218)
// Free-for-all - Player 2 - Percentage [16bit]

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
function FreeModeChar3DMG1() => dword(Mem_FreeModeData + 318)
// Free-for-all - Player 3 - Damage taken from 1P [32bit]
function FreeModeChar3DMG2() => dword(Mem_FreeModeData + 322)
// Free-for-all - Player 3 - Damage taken from 2P [32bit]
function FreeModeChar3DMG3() => dword(Mem_FreeModeData + 326)
// Free-for-all - Player 3 - Damage taken from 3P [32bit]
function FreeModeChar3DMG4() => dword(Mem_FreeModeData + 330)
// Free-for-all - Player 3 - Damage taken from 4P [32bit]
function FreeModeChar3Percentage() => word(Mem_FreeModeData + 334)
// Free-for-all - Player 3 - Percentage [16bit]

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
function FreeModeChar4DMG1() => dword(Mem_FreeModeData + 434)
// Free-for-all - Player 4 - Damage taken from 1P [32bit]
function FreeModeChar4DMG2() => dword(Mem_FreeModeData + 438)
// Free-for-all - Player 4 - Damage taken from 2P [32bit]
function FreeModeChar4DMG3() => dword(Mem_FreeModeData + 442)
// Free-for-all - Player 4 - Damage taken from 3P [32bit]
function FreeModeChar4DMG4() => dword(Mem_FreeModeData + 446)
// Free-for-all - Player 4 - Damage taken from 4P [32bit]
function FreeModeChar4Percentage() => word(Mem_FreeModeData + 450)
// Free-for-all - Player 4 - Percentage [16bit]

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
        if(character[0] != GetCharID("Master Hand")) {
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
        if(character[0] != GetCharID("Master Hand")) {
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
    return Beat1PNormal() //&&
    //never(NormalModeChar1Stocks() == 0xFF)
}

function BeatRemix1PVeryHard() {
    return never(NormalModeDifficulty() != 4) && 
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

function BeatRemix1PVeryHard3Stocks() {
    return BeatRemix1PVeryHard() &&
    never(NormalModeStocks() > 2) &&
    never(dword(Mem_HighscoreOn)  == 0x00)
}

function BeatAllstarsVeryHard() {
    return never(NormalModeDifficulty() != 4) && 
    never(BothGameStates() == 0x1B1B) &&
    never(BothGameStates() == 0x1B34) &&
    never(BothGameStates() == 0x0834) &&
    once(NormalModeStage() == 0x8B &&
        byte(Mem_GameMode + 20) == 0) &&
    trigger_when(prev(NormalModeProgress()) == 0x0D 
        && NormalModeProgress() == 0x0E) &&
    never(byte(Mem_GameMode) != 0x05) &&
    never(dword(Mem_HighscoreOn)  == 0x00)
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
    return once(FreeModeChar2CPU() >= 0x09 &&
        prev(byte(Mem_12CharacterStocks + 0x07) == 0x1C) &&
        byte(Mem_12CharacterStocks + 0x07) != 0x1C &&
        prev(byte(Mem_12CharacterStocks + 0xDB) == 0x1C) &&
        byte(Mem_12CharacterStocks + 0xDB) != 0x1C) &&
        never(prev(byte(Mem_GameState) == 0x15) && 
        byte(Mem_GameState) == 0x16 &&
        FreeModeChar1Control() == 4) &&
        never(prev(byte(Mem_GameState) == 0x15) && 
        byte(Mem_GameState) == 0x16 &&
        FreeModeChar2Control() != 4) &&
        never(prev(byte(Mem_GameState) == 0x15) && 
        byte(Mem_GameState) == 0x16 &&
        FreeModeChar2CPU() < 9) &&
        never(BothGameStates() == 0x1B1B) &&
        never(GameState() == 0x09) &&
        never(player12Loses == 12) &&
        trigger_when(com12LosesM == 12) &&
        trigger_when(com12LosesD == 11) &&
        ResetCheating(0) &&
        ResetCheating(1)
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
    
    char1Code = tally_of(player1IDs, 1, id => (byte(PointerPlayerData() + 0x08 + 0xB50*0) == id))
    char2Code = tally_of(player2IDs, 1, id => (byte(PointerPlayerData() + 0x08 + 0xB50*1) == id))
    char3Code = tally_of(player3IDs, 1, id => (byte(PointerPlayerData() + 0x08 + 0xB50*2) == id))
    char4Code = tally_of(player4IDs, 1, id => (byte(PointerPlayerData() + 0x08 + 0xB50*3) == id))
                                            
    return never(GameState() != 0x16 &&
               GameState() != 0x18) &&
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

function BeatAllBonus1() {
    stageClears = []
    charIDs = []
    for stages in BonusStages {
        array_push(stageClears, stages[1])
    }
    for character in Characters {
        array_push(charIDs, character[0])
    }
    
    i = length(stageClears)
    codeStages = tally_of(stageClears, i, stage => tally(1, (PreGameState() == 0x13 || 
                                                   (PreGameState() == 0x34 &&
                                                   NormalModeProgress() == 0x03)) &&
                                                   GameState() == 0x35 &&
                                                   dword(Mem_HighscoreOn)  == 0x01 &&
                                                   prev(Bonus1Targets() >= 0x01) &&
                                                   Bonus1Targets() == 0x00 &&
                                                   Bonus12Stage() == stage))
                                                   
    codeReset = tally_of(charIDs, 2, char => tally(1, (PreGameState() == 0x13 || 
                                                   (PreGameState() == 0x34 &&
                                                   NormalModeProgress() == 0x03)) &&
                                                   GameState() == 0x35 &&
                                                   dword(Mem_HighscoreOn)  == 0x01 &&
                                                   Bonus12Char() == char))
                                                   
    return measured(codeStages) && never(codeReset)
}

function BeatAllBonus2() {
    stageClears = []
    charIDs = []
    for stages in BonusStages {
        array_push(stageClears, stages[2])
    }
    for character in Characters {
        array_push(charIDs, character[0])
    }
    
    i = length(stageClears)
    codeStages = tally_of(stageClears, i, stage => tally(1, (PreGameState() == 0x14 || 
                                                   (PreGameState() == 0x34 &&
                                                   NormalModeProgress() == 0x07)) &&
                                                   GameState() == 0x35 &&
                                                   dword(Mem_HighscoreOn)  == 0x01 &&
                                                   prev(Bonus2Platforms() >= 0x01) &&
                                                   Bonus2Platforms() == 0x00 &&
                                                   Bonus12Stage() == stage))
                                                   
    codeReset = tally_of(charIDs, 2, char => tally(1, (PreGameState() == 0x14 || 
                                                   (PreGameState() == 0x34 &&
                                                   NormalModeProgress() == 0x07)) &&
                                                   GameState() == 0x35 &&
                                                   dword(Mem_HighscoreOn)  == 0x01 &&
                                                   Bonus12Char() == char))
                                                   
    return measured(codeStages) && never(codeReset)
}

function RulesCommunity() {
    return true
}

function NoCheating(id) {
    address = id
    return dword(Mem_BattleSetting + 0x00 + id*4) == 0 &&
           dword(Mem_BattleSetting + 0x25C + id*4) == 0 &&
           dword(Mem_BattleSetting + 0x95F4C + id*4) == 0 &&
           dword(Mem_BattleSetting + 0x9A0A8 + id*4) == 0 &&
           dword(Mem_BattleSetting + 0x9C2C8 + id*4) == 0 &&
           dword(Mem_BattleSetting + 0xAD274 + id*4) == 0 &&
           dword(Mem_BattleSetting + 0xAD9A0 + id*4) == 0 &&
           dword(Mem_BattleSetting + 0xADB3C + id*4) == 0
}

function NoCheatingNoHat(id) {
    return NoCheating(id) &&
           dword(Mem_BattleSetting + 0xFFEB0 + id*4) == 0
}

function ResetCheating(id) {
    return never(dword(Mem_BattleSetting + 0x00 + id*4) != 0 ||
           dword(Mem_BattleSetting + 0x25C + id*4) != 0 ||
           dword(Mem_BattleSetting + 0x95F4C + id*4) != 0 ||
           dword(Mem_BattleSetting + 0x9A0A8 + id*4) != 0 ||
           dword(Mem_BattleSetting + 0x9C2C8 + id*4) != 0 ||
           dword(Mem_BattleSetting + 0xAD274 + id*4) != 0 ||
           dword(Mem_BattleSetting + 0xAD9A0 + id*4) != 0 ||
           dword(Mem_BattleSetting + 0xADB3C + id*4) != 0 ||
           dword(Mem_BattleSetting + 0xFFEB0 + id*4) != 0)
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

function SetPlayerTag(num) {
    return byte(Mem_PlayerTagStart + 0x3C*(num-1)) != 0x00
}

function CharacterCostume(char, costume, slot) {
    return byte(PointerPlayerData() + 0x08 + 0xB50*slot) == GetCharID(char) &&
           byte(PointerPlayerData() + 0x13 + 0xB50*slot) == costume
}

// ----------------------------------------------------------------------------------------------------
// Leaderboard Logic
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

function LB_Remix1PGame(name) {
    return NormalModeChar1() == GetCharID(name) &&
           byte(Mem_GameMode) == 0x01 &&
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

function LB_Allstars(name) {
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
    title = "Don't Get Rusty", points = 5, type="progression",
    description = "Complete 1P Game with Metal Mario on Normal or higher.",
    id = 165928, badge = "523035", published = "14.08.2021 15:04:25", modified = "08.09.2024 13:29:37",
    trigger =  never(HomerunChar() != GetCharID("Metal Mario")) &&
               Beat1PNormalNoContinues() &&
               RulesCommunity()
)

achievement(
    title = "King of Swing", points = 5, type="progression",
    description = "Complete 1P Game with Giant Donkey Kong on Normal or higher.",
    id = 165929, badge = "523040", published = "14.08.2021 15:04:25", modified = "08.09.2024 13:29:38",
    trigger = never(HomerunChar() != GetCharID("Giant Donkey Kong")) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Force of Power", points = 5, type="progression",
    description = "Complete 1P Game with Ganondorf on Normal or higher.",
    id = 165930, badge = "523046", published = "14.08.2021 15:04:25", modified = "08.09.2024 13:29:40",
    trigger = never((HomerunChar() != GetCharID("Ganondorf")) &&
                (HomerunChar() != GetCharID("Polygon Ganondorf"))) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "An Adventure Begins", points = 5, type="progression",
    description = "Complete 1P Game with Young Link on Normal or higher.",
    id = 165931, badge = "523049", published = "14.08.2021 15:04:26", modified = "08.09.2024 13:29:41",
    trigger = never((HomerunChar() != GetCharID("Young Link")) &&
                  (HomerunChar() != GetCharID("Polygon Young Link"))) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Hawk Eyes!", points = 5, type="progression",
    description = "Complete 1P Game with Falco on Normal or higher.",
    id = 165932, badge = "523043", published = "14.08.2021 15:04:26", modified = "08.09.2024 13:29:39",
    trigger = never((HomerunChar() != GetCharID("Falco")) &&
                  (HomerunChar() != GetCharID("Polygon Falco"))) && 
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Time For Your Medicine", points = 5, type="progression",
    description = "Complete 1P Game with Dr. Mario on Normal or higher.",
    id = 165926, badge = "523052", published = "14.08.2021 15:04:24", modified = "08.09.2024 13:29:42",
    trigger = never((HomerunChar() != GetCharID("Dr. Mario")) &&
                  (HomerunChar() != GetCharID("Polygon Dr. Mario"))) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Dark Memories", points = 5, type="progression",
    description = "Complete 1P Game with Dark Samus on Normal or higher.",
    id = 165933, badge = "523058", published = "14.08.2021 15:04:26", modified = "08.09.2024 14:00:49",
    trigger = never((HomerunChar() != GetCharID("Dark Samus")) &&
                  (HomerunChar() != GetCharID("Polygon Dark Samus"))) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Stealing the Show!", points = 5, type="progression",
    description = "Complete 1P Game with Wario on Normal or higher.",
    id = 165934, badge = "523055", published = "14.08.2021 15:04:27", modified = "08.09.2024 13:29:43", 
    trigger = never((HomerunChar() != GetCharID("Wario")) &&
                  (HomerunChar() != GetCharID("Polygon Wario"))) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Yeah!", points = 5, type="progression",
    description = "Complete 1P Game with Lucas on Normal or higher.",
    id = 165935, badge = "523061", published = "14.08.2021 15:04:27", modified = "08.09.2024 13:29:45", 
    trigger = never((HomerunChar() != GetCharID("Lucas")) &&
                  (HomerunChar() != GetCharID("Polygon Lucas"))) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Gwahahahaha!", points = 5, type="progression",
    description = "Complete 1P Game with Bowser on Normal or higher.",
    id = 165936, badge = "523088", published = "14.08.2021 15:04:27", modified = "08.09.2024 14:14:49", 
    trigger = never((HomerunChar() != GetCharID("Bowser")) &&
                  (HomerunChar() != GetCharID("Polygon Bowser"))) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Ultimate Koopa", points = 5, type="progression",
    description = "Complete 1P Game with Giga Bowser on Normal or higher.",
    id = 165937, badge = "523064", published = "14.08.2021 15:04:28", modified = "08.09.2024 14:01:09", 
    trigger = never(HomerunChar() != GetCharID("Giga Bowser")) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Hunting Nightmare", points = 5, type="progression",
    description = "Complete 1P Game with Mad Piano on Normal or higher.",
    id = 165927, badge = "523068", published = "14.08.2021 15:04:24", modified = "08.09.2024 14:14:20", 
    trigger = never(HomerunChar() != GetCharID("Mad Piano")) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Unleash the Wolf", points = 5, type="progression",
    description = "Complete 1P Game with Wolf on Normal or higher.",
    id = 165938, badge = "523071", published = "14.08.2021 15:04:28", modified = "08.09.2024 14:14:21", 
    trigger = never((HomerunChar() != GetCharID("Wolf")) &&
                  (HomerunChar() != GetCharID("Polygon Wolf"))) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "I'm Confident!", points = 5, type="progression",
    description = "Complete 1P Game with Conker on Normal or higher.",
    id = 165939, badge = "523074", published = "14.08.2021 15:04:28", modified = "08.09.2024 14:14:21", 
    trigger = never((HomerunChar() != GetCharID("Conker")) &&
                  (HomerunChar() != GetCharID("Polygon Conker"))) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Cosmic Power", points = 5, type="progression",
    description = "Complete 1P Game with Mewtwo on Normal or higher.",
    id = 173151, badge = "523076", published = "21.09.2021 12:23:09", modified = "08.09.2024 14:14:21",
    trigger = never((HomerunChar() != GetCharID("Mewtwo")) &&
                  (HomerunChar() != GetCharID("Polygon Mewtwo"))) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "A Known Swordfighter", points = 5, type="progression",
    description = "Complete 1P Game with Marth on Normal or higher.",
    id = 173152, badge = "523079", published = "21.09.2021 12:23:09", modified = "08.09.2024 14:14:22", 
    trigger = never((HomerunChar() != GetCharID("Marth")) &&
                  (HomerunChar() != GetCharID("Polygon Marth"))) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "In Sonic Speed", points = 5, type="progression",
    description = "Complete 1P Game with Sonic on Normal or higher.",
    id = 197073, badge = "523082", published = "11.02.2022 19:39:39", modified = "08.09.2024 14:14:24", 
    trigger = never((HomerunChar() != GetCharID("Sonic")) &&
                  (HomerunChar() != GetCharID("Polygon Sonic"))) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Super Power", points = 5, type="progression",
    description = "Complete 1P Game with Super Sonic on Normal or higher.",
    id = 197074, badge = "523085", published = "11.02.2022 19:39:40", modified = "08.09.2024 14:14:24", 
    trigger = never(HomerunChar() != GetCharID("Super Sonic")) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Royal Invasion", points = 5, type="progression",
    description = "Complete 1P Game with Sheik on Normal or higher.",
    id = 161715, badge = "523954", published = "11.02.2022 19:39:39", modified = "08.09.2024 14:14:24", 
    trigger = never((HomerunChar() != GetCharID("Sheik")) &&
                  (HomerunChar() != GetCharID("Polygon Sheik"))) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Shake It Up", points = 5, type="progression",
    description = "Complete 1P Game with Marina on Normal or higher.",
    id = 161717, badge = "523957", published = "11.02.2022 19:39:39", modified = "08.09.2024 14:14:24", 
    trigger = never((HomerunChar() != GetCharID("Marina")) &&
                  (HomerunChar() != GetCharID("Polygon Marina"))) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Dreaming of a Kingdom", points = 5, type="progression",
    description = "Complete 1P Game with King Dedede on Normal or higher.",
    id = 161719, badge = "523958", published = "11.02.2022 19:39:39", modified = "08.09.2024 14:14:24", 
    trigger = never((HomerunChar() != GetCharID("King Dedede")) &&
                  (HomerunChar() != GetCharID("Polygon King Dedede"))) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Japanese Spirits", points = 5, type="progression",
    description = "Complete 1P Game with Goemon on Normal or higher.",
    id = 161707, badge = "523961", published = "11.02.2022 19:39:39", modified = "08.09.2024 14:14:24", 
    trigger = never((HomerunChar() != GetCharID("Goemon")) &&
                  (HomerunChar() != GetCharID("Polygon Goemon"))) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Spicy Combat Skills", points = 5, type="progression",
    description = "Complete 1P Game with Peppy on Normal or higher.",
    id = 161708, badge = "523962", published = "11.02.2022 19:39:39", modified = "08.09.2024 14:14:24", 
    trigger = never(HomerunChar() != GetCharID("Peppy")) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Slip' Slidin' Away", points = 5, type="progression",
    description = "Complete 1P Game with Slippy on Normal or higher.",
    id = 161709, badge = "523965", published = "11.02.2022 19:39:39", modified = "08.09.2024 14:14:24", 
    trigger = never(HomerunChar() != GetCharID("Slippy")) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Battle For the Jiggy", points = 5, type="progression",
    description = "Complete 1P Game with Banjo & Kazooie on Normal or higher.",
    id = 161710, badge = "523966", published = "11.02.2022 19:39:39", modified = "08.09.2024 14:14:24", 
    trigger = never((HomerunChar() != GetCharID("Banjo & Kazooie")) &&
                  (HomerunChar() != GetCharID("Polygon Banjo & Kazooie"))) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "More Comedy Than Stealth", points = 5, type="progression",
    description = "Complete 1P Game with Ebisumaru on Normal or higher.",
    id = 462596, badge = "523969", published = "11.02.2022 19:39:39", modified = "08.09.2024 14:14:24", 
    trigger = never(HomerunChar() != GetCharID("Ebisumaru")) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Lead of Faith", points = 5, type="progression",
    description = "Complete 1P Game with Metal Luigi on Normal or higher.",
    id = 462597, badge = "523970", published = "11.02.2022 19:39:39", modified = "08.09.2024 14:14:24", 
    trigger = never(HomerunChar() != GetCharID("Metal Luigi")) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Ryou-Chou Majesty", points = 5, type="progression",
    description = "Complete 1P Game with Dragon King on Normal or higher.",
    id = 462600, badge = "523973", published = "11.02.2022 19:39:39", modified = "08.09.2024 14:14:24", 
    trigger = never(HomerunChar() != GetCharID("Dragon King")) &&
              Beat1PNormalNoContinues() &&
              RulesCommunity()
)

achievement(
    title = "Limited Controls", points = 10, type="progression",
    description = "Complete 1P Game with any Polygon Fighter on Normal or higher.",
    id = 173153, badge = "523037", published = "21.09.2021 12:23:11", modified = "08.09.2024 13:29:37", 
    trigger = never(HomerunChar() < GetCharID("Polygon Mario")) &&
              never((HomerunChar() > GetCharID("Polygon Ness")) &&
                (HomerunChar() < GetCharID("Polygon Wario"))) &&
              Beat1PNormal() &&
              RulesCommunity()
)

achievement(
    title = "Plumbing Away", points = 25,
    description = "Complete Remix 1P with Mario on Very Hard and 3 Stocks.",
    id = 165944, badge = "523010", published = "14.08.2021 16:37:34", modified = "08.09.2024 13:29:29", 
    trigger = never((HomerunChar() != GetCharID("Mario")) &&
                (HomerunChar() != GetCharID("JP Mario")) &&
                (HomerunChar() != GetCharID("Polygon Mario"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "HAYAAAAH!", points = 25,
    description = "Complete Remix 1P with Fox on Very Hard and 3 Stocks.",
    id = 165945, badge = "523012", published = "14.08.2021 16:37:37", modified = "08.09.2024 13:29:29", 
    trigger = never((HomerunChar() != GetCharID("Fox")) &&
                (HomerunChar() != GetCharID("JP Fox")) &&
                (HomerunChar() != GetCharID("Polygon Fox"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Jungle Beat", points = 25,
    description = "Complete Remix 1P with Donkey Kong on Very Hard and 3 Stocks.",
    id = 165946, badge = "523014", published = "14.08.2021 16:41:51", modified = "08.09.2024 13:29:30", 
    trigger = never((HomerunChar() != GetCharID("Donkey Kong")) &&
                (HomerunChar() != GetCharID("JP Donkey Kong")) &&
                (HomerunChar() != GetCharID("Polygon Donkey Kong"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Complete Meltdown", points = 25,
    description = "Complete Remix 1P with Samus on Very Hard and 3 Stocks.",
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
    description = "Complete Remix 1P with Luigi on Very Hard and 3 Stocks.",
    id = 165948, badge = "523018", published = "14.08.2021 16:55:44", modified = "08.09.2024 13:29:31",
    trigger = never((HomerunChar() != GetCharID("Luigi")) &&
                (HomerunChar() != GetCharID("JP Luigi")) &&
                (HomerunChar() != GetCharID("Polygon Luigi"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "A Real Hero", points = 25,
    description = "Complete Remix 1P with Link on Very Hard and 3 Stocks.",
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
    description = "Complete Remix 1P with Yoshi on Very Hard and 3 Stocks.",
    id = 165950, badge = "523022", published = "14.08.2021 17:04:42", modified = "08.09.2024 13:29:32", 
    trigger = never((HomerunChar() != GetCharID("Yoshi")) &&
                (HomerunChar() != GetCharID("JP Yoshi")) &&
                (HomerunChar() != GetCharID("Polygon Yoshi"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Rising Phoenix", points = 25,
    description = "Complete Remix 1P with Captain Falcon on Very Hard and 3 Stocks.",
    id = 165951, badge = "523024", published = "14.08.2021 17:11:09", modified = "08.09.2024 13:29:33",
    trigger = never((HomerunChar() != GetCharID("Captain Falcon")) &&
                (HomerunChar() != GetCharID("JP Captain Falcon")) &&
                (HomerunChar() != GetCharID("Polygon Captain Falcon"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Cute and Dangerous", points = 25,
    description = "Complete Remix 1P with Kirby on Very Hard and 3 Stocks.",
    id = 165952, badge = "523026", published = "14.08.2021 17:16:04", modified = "08.09.2024 13:29:33", 
    trigger = never((HomerunChar() != GetCharID("Kirby")) &&
                (HomerunChar() != GetCharID("JP Kirby")) &&
                (HomerunChar() != GetCharID("Polygon Kirby"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "End of the Thunderstorm", points = 25,
    description = "Complete Remix 1P with Pikachu on Very Hard and 3 Stocks.",
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
    description = "Complete Remix 1P with Jigglypuff on Very Hard and 3 Stocks.",
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
    description = "Complete Remix 1P with Ness on Very Hard and 3 Stocks.",
    id = 165955, badge = "523032", published = "14.08.2021 17:30:26", modified = "08.09.2024 13:29:35", 
    trigger = never((HomerunChar() != GetCharID("Ness")) &&
                (HomerunChar() != GetCharID("JP Ness")) &&
                (HomerunChar() != GetCharID("Polygon Ness"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Heavy Fighter", points = 25,
    description = "Complete Remix 1P with Metal Mario on Very Hard and 3 Stocks.",
    id = 165956, badge = "523036", published = "14.08.2021 17:30:43", modified = "08.09.2024 13:29:37",
    trigger = never(HomerunChar() != GetCharID("Metal Mario")) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Bigger Is Better", points = 25,
    description = "Complete Remix 1P with Giant Donkey Kong on Very Hard and 3 Stocks.",
    id = 165957, badge = "523041", published = "14.08.2021 17:38:48", modified = "08.09.2024 13:29:38",
    trigger = never(HomerunChar() != GetCharID("Giant Donkey Kong")) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "The Dark Lord", points = 25,
    description = "Complete Remix 1P with Ganondorf on Very Hard and 3 Stocks.",
    id = 165958, badge = "523047", published = "14.08.2021 17:42:46", modified = "08.09.2024 13:29:41",
    trigger = never((HomerunChar() != GetCharID("Ganondorf")) &&
                (HomerunChar() != GetCharID("Polygon Ganondorf"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Kid of Courage", points = 25,
    description = "Complete Remix 1P with Young Link on Very Hard and 3 Stocks.",
    id = 165967, badge = "523050", published = "14.08.2021 18:05:15", modified = "08.09.2024 13:29:41", 
    trigger = never((HomerunChar() != GetCharID("Young Link")) &&
                (HomerunChar() != GetCharID("Polygon Young Link"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Revali But Better", points = 25,
    description = "Complete Remix 1P with Falco on Very Hard and 3 Stocks.",
    id = 165968, badge = "523044", published = "14.08.2021 18:08:56", modified = "08.09.2024 13:29:39",
    trigger = never((HomerunChar() != GetCharID("Falco")) &&
                (HomerunChar() != GetCharID("Polygon Falco"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "You're Ready For the Hospital", points = 25,
    description = "Complete Remix 1P with Dr. Mario on Very Hard and 3 Stocks.",
    id = 165971, badge = "523053", published = "14.08.2021 18:14:15", modified = "08.09.2024 14:00:27",
    trigger = never((HomerunChar() != GetCharID("Dr. Mario")) &&
                (HomerunChar() != GetCharID("Polygon Dr. Mario"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Perfect Clone", points = 25,
    description = "Complete Remix 1P with Dark Samus on Very Hard and 3 Stocks.",
    id = 165972, badge = "523059", published = "14.08.2021 18:18:06", modified = "08.09.2024 13:29:44",
    trigger = never((HomerunChar() != GetCharID("Dark Samus")) &&
                (HomerunChar() != GetCharID("Polygon Dark Samus"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Doing It For the Money", points = 25,
    description = "Complete Remix 1P with Wario on Very Hard and 3 Stocks.",
    id = 165973, badge = "523056", published = "14.08.2021 18:22:07", modified = "08.09.2024 14:00:40",
    trigger = never((HomerunChar() != GetCharID("Wario")) &&
                (HomerunChar() != GetCharID("Polygon Wario"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Newcomer Out of Nowhere", points = 25,
    description = "Complete Remix 1P with Lucas on Very Hard and 3 Stocks.",
    id = 165974, badge = "523062", published = "14.08.2021 18:27:46", modified = "08.09.2024 13:29:45", 
    trigger = never((HomerunChar() != GetCharID("Lucas")) &&
                (HomerunChar() != GetCharID("Polygon Lucas"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Defending the Title", points = 25,
    description = "Complete Remix 1P with Bowser on Very Hard and 3 Stocks.",
    id = 165975, badge = "523089", published = "14.08.2021 18:36:52", modified = "08.09.2024 14:14:50",
    trigger = never((HomerunChar() != GetCharID("Bowser")) &&
                (HomerunChar() != GetCharID("Polygon Bowser"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Unbanished Beast", points = 25,
    description = "Complete Remix 1P with Giga Bowser on Very Hard and 3 Stocks.",
    id = 165976, badge = "523065", published = "14.08.2021 18:36:53", modified = "08.09.2024 14:01:15",
    trigger = never(HomerunChar() != GetCharID("Giga Bowser")) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Your Worst Nightmare", points = 25,
    description = "Complete Remix 1P with Mad Piano on Very Hard and 3 Stocks.",
    id = 165977, badge = "523069", published = "14.08.2021 18:40:00", modified = "08.09.2024 14:14:20",
    trigger = never(HomerunChar() != GetCharID("Mad Piano")) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "A Wild Beast", points = 25,
    description = "Complete Remix 1P with Wolf on Very Hard and 3 Stocks.",
    id = 165978, badge = "523072", published = "14.08.2021 18:42:23", modified = "08.09.2024 14:14:21", 
    trigger = never((HomerunChar() != GetCharID("Wolf")) &&
                (HomerunChar() != GetCharID("Polygon Wolf"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Not So Child-Friendly", points = 25,
    description = "Complete Remix 1P with Conker on Very Hard and 3 Stocks.",
    id = 165979, badge = "523066", published = "14.08.2021 18:45:04", modified = "08.09.2024 14:01:34", 
    trigger = never((HomerunChar() != GetCharID("Conker")) &&
                (HomerunChar() != GetCharID("Polygon Conker"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Legendary Victory", points = 25,
    description = "Complete Remix 1P with Mewtwo on Very Hard and 3 Stocks.",
    id = 173154, badge = "523077", published = "21.09.2021 12:23:15", modified = "08.09.2024 14:14:22", 
    trigger = never((HomerunChar() != GetCharID("Mewtwo")) &&
                (HomerunChar() != GetCharID("Polygon Mewtwo"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Feeling the Blade", points = 25,
    description = "Complete Remix 1P with Marth on Very Hard and 3 Stocks.",
    id = 173155, badge = "523080", published = "21.09.2021 12:23:15", modified = "08.09.2024 14:14:24", 
    trigger = never((HomerunChar() != GetCharID("Marth")) &&
                (HomerunChar() != GetCharID("Polygon Marth"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Where's Eggman?", points = 25,
    description = "Complete Remix 1P with Sonic on Very Hard and 3 Stocks.",
    id = 197075, badge = "523083", published = "11.02.2022 19:39:40", modified = "08.09.2024 14:14:24", 
    trigger = never((HomerunChar() != GetCharID("Sonic")) &&
                (HomerunChar() != GetCharID("Polygon Sonic"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Power of the Chaos Emeralds", points = 25,
    description = "Complete Remix 1P with Super Sonic on Very Hard and 3 Stocks.",
    id = 197076, badge = "523086", published = "11.02.2022 19:39:40", modified = "08.09.2024 14:14:25", 
    trigger = never(HomerunChar() != GetCharID("Super Sonic")) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Hidden Techniques", points = 25,
    description = "Complete Remix 1P with Sheik on Very Hard and 3 Stocks.",
    id = 161714, badge = "523955", published = "11.02.2022 19:39:40", modified = "08.09.2024 14:14:24", 
    trigger = never((HomerunChar() != GetCharID("Sheik")) &&
                (HomerunChar() != GetCharID("Polygon Sheik"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Mischief Master", points = 25,
    description = "Complete Remix 1P with Marina on Very Hard and 3 Stocks.",
    id = 161716, badge = "523956", published = "11.02.2022 19:39:40", modified = "08.09.2024 14:14:24", 
    trigger = never((HomerunChar() != GetCharID("Marina")) &&
                (HomerunChar() != GetCharID("Polygon Marina"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Waddle Dee Commander", points = 25,
    description = "Complete Remix 1P with King Dedede on Very Hard and 3 Stocks.",
    id = 161718, badge = "523959", published = "11.02.2022 19:39:40", modified = "08.09.2024 14:14:24", 
    trigger = never((HomerunChar() != GetCharID("King Dedede")) &&
                (HomerunChar() != GetCharID("Polygon King Dedede"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Ninja Quickness", points = 25,
    description = "Complete Remix 1P with Goemon on Very Hard and 3 Stocks.",
    id = 161720, badge = "523960", published = "11.02.2022 19:39:40", modified = "08.09.2024 14:14:24", 
    trigger = never((HomerunChar() != GetCharID("Goemon")) &&
                (HomerunChar() != GetCharID("Polygon Goemon"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Never Give Up", points = 25,
    description = "Complete Remix 1P with Peppy on Very Hard and 3 Stocks.",
    id = 161722, badge = "523963", published = "11.02.2022 19:39:40", modified = "08.09.2024 14:14:25", 
    trigger = never(HomerunChar() != GetCharID("Peppy")) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Toadally Easy", points = 25,
    description = "Complete Remix 1P with Slippy on Very Hard and 3 Stocks.",
    id = 161724, badge = "523964", published = "11.02.2022 19:39:40", modified = "08.09.2024 14:14:25", 
    trigger = never(HomerunChar() != GetCharID("Slippy")) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Eggstraordinary", points = 25,
    description = "Complete Remix 1P with Banjo & Kazooie on Very Hard and 3 Stocks.",
    id = 161726, badge = "523967", published = "11.02.2022 19:39:40", modified = "08.09.2024 14:14:24", 
    trigger = never((HomerunChar() != GetCharID("Banjo & Kazooie")) &&
                (HomerunChar() != GetCharID("Polygon Banjo & Kazooie"))) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Great Ebisumaru", points = 25,
    description = "Complete Remix 1P with Ebisumaru on Very Hard and 3 Stocks.",
    id = 161728, badge = "523968", published = "11.02.2022 19:39:40", modified = "08.09.2024 14:14:25", 
    trigger = never(HomerunChar() != GetCharID("Ebisumaru")) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Silver Is Real", points = 25,
    description = "Complete Remix 1P with Metal Luigi on Very Hard and 3 Stocks.",
    id = 462598, badge = "523971", published = "11.02.2022 19:39:40", modified = "08.09.2024 14:14:25", 
    trigger = never(HomerunChar() != GetCharID("Metal Luigi")) &&
              BeatRemix1PVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Remnants of Sakurai's Past", points = 25,
    description = "Complete Remix 1P with Dragon King on Very Hard and 3 Stocks.",
    id = 462599, badge = "523972", published = "11.02.2022 19:39:40", modified = "08.09.2024 14:14:25", 
    trigger = never(HomerunChar() != GetCharID("Dragon King")) &&
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
    description = "Complete All-Star Mode with Mario on Very Hard and 3 Stocks.",
    id = 173158, badge = "523011", published = "21.09.2021 17:45:35", modified = "08.09.2024 13:29:29", 
    trigger = never((HomerunChar() != GetCharID("Mario")) &&
                (HomerunChar() != GetCharID("JP Mario")) &&
                (HomerunChar() != GetCharID("Polygon Mario"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Space Adventure", points = 10,
    description = "Complete All-Star Mode with Fox on Very Hard and 3 Stocks.",
    id = 173159, badge = "523013", published = "21.09.2021 17:45:35", modified = "08.09.2024 13:29:30", 
    trigger = never((HomerunChar() != GetCharID("Fox")) &&
                (HomerunChar() != GetCharID("JP Fox")) &&
                (HomerunChar() != GetCharID("Polygon Fox"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Donkey Konga", points = 10,
    description = "Complete All-Star Mode with Donkey Kong on Very Hard and 3 Stocks.",
    id = 173160, badge = "523015", published = "21.09.2021 17:45:35", modified = "08.09.2024 13:29:30", 
    trigger = never((HomerunChar() != GetCharID("Donkey Kong")) &&
                (HomerunChar() != GetCharID("JP Donkey Kong")) &&
                (HomerunChar() != GetCharID("Polygon Donkey Kong"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Mother Brain", points = 10,
    description = "Complete All-Star Mode with Samus on Very Hard and 3 Stocks.",
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
    description = "Complete All-Star Mode with Luigi on Very Hard and 3 Stocks.",
    id = 173162, badge = "523019", published = "21.09.2021 17:45:36", modified = "08.09.2024 13:29:31", 
    trigger = never((HomerunChar() != GetCharID("Luigi")) &&
                (HomerunChar() != GetCharID("JP Luigi")) &&
                (HomerunChar() != GetCharID("Polygon Luigi"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Hero of Time", points = 10,
    description = "Complete All-Star Mode with Link on Very Hard and 3 Stocks.",
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
    description = "Complete All-Star Mode with Yoshi on Very Hard and 3 Stocks.",
    id = 173164, badge = "523023", published = "21.09.2021 17:45:37", modified = "08.09.2024 13:29:32",
    trigger = never((HomerunChar() != GetCharID("Yoshi")) &&
                (HomerunChar() != GetCharID("JP Yoshi")) &&
                (HomerunChar() != GetCharID("Polygon Yoshi"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Falco Punch!", points = 10,
    description = "Complete All-Star Mode with Captain Falcon on Very Hard and 3 Stocks.",
    id = 173165, badge = "523025", published = "21.09.2021 17:45:37", modified = "08.09.2024 13:29:33", 
    trigger = never((HomerunChar() != GetCharID("Captain Falcon")) &&
                (HomerunChar() != GetCharID("JP Captain Falcon")) &&
                (HomerunChar() != GetCharID("Polygon Captain Falcon"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Poyo!", points = 10,
    description = "Complete All-Star Mode with Kirby on Very Hard and 3 Stocks.",
    id = 173166, badge = "523027", published = "21.09.2021 17:45:37", modified = "08.09.2024 13:29:34", 
    trigger = never((HomerunChar() != GetCharID("Kirby")) &&
                (HomerunChar() != GetCharID("JP Kirby")) &&
                (HomerunChar() != GetCharID("Polygon Kirby"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Electric Shock Showdown", points = 10,
    description = "Complete All-Star Mode with Pikachu on Very Hard and 3 Stocks.",
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
    description = "Complete All-Star Mode with Jigglypuff on Very Hard and 3 Stocks.",
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
    description = "Complete All-Star Mode with Ness on Very Hard and 3 Stocks.",
    id = 173169, badge = "523033", published = "21.09.2021 17:45:38", modified = "08.09.2024 13:29:35", 
    trigger = never((HomerunChar() != GetCharID("Ness")) &&
                (HomerunChar() != GetCharID("JP Ness")) &&
                (HomerunChar() != GetCharID("Polygon Ness"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Full Metal Marionist", points = 10,
    description = "Complete All-Star Mode with Metal Mario on Very Hard and 3 Stocks.",
    id = 173170, badge = "523034", published = "21.09.2021 17:45:39", modified = "08.09.2024 13:29:36",
    trigger = never(HomerunChar() != GetCharID("Metal Mario")) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Monkey D. Kong", points = 10,
    description = "Complete All-Star Mode with Giant Donkey Kong on Very Hard and 3 Stocks.",
    id = 173171, badge = "523042", published = "21.09.2021 17:45:39", modified = "08.09.2024 13:29:38", 
    trigger = never(HomerunChar() != GetCharID("Giant Donkey Kong")) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "From the Shadows", points = 10,
    description = "Complete All-Star Mode with Ganondorf on Very Hard and 3 Stocks.",
    id = 173172, badge = "523048", published = "21.09.2021 17:45:39", modified = "08.09.2024 13:29:41", 
    trigger = never((HomerunChar() != GetCharID("Ganondorf")) &&
                (HomerunChar() != GetCharID("Polygon Ganondorf"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Oracle of Triumph", points = 10,
    description = "Complete All-Star Mode with Young Link on Very Hard and 3 Stocks.",
    id = 173173, badge = "523051", published = "21.09.2021 17:45:40", modified = "08.09.2024 13:29:42", 
    trigger = never((HomerunChar() != GetCharID("Young Link")) &&
                (HomerunChar() != GetCharID("Polygon Young Link"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Early Bird", points = 10,
    description = "Complete All-Star Mode with Falco on Very Hard and 3 Stocks.",
    id = 173174, badge = "523045", published = "21.09.2021 17:45:40", modified = "08.09.2024 13:29:39", 
    trigger = never((HomerunChar() != GetCharID("Falco")) &&
                (HomerunChar() != GetCharID("Polygon Falco"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Just In Time", points = 10,
    description = "Complete All-Star Mode with Dr. Mario on Very Hard and 3 Stocks.",
    id = 173175, badge = "523054", published = "21.09.2021 17:45:40", modified = "08.09.2024 13:29:43", 
    trigger = never((HomerunChar() != GetCharID("Dr. Mario")) &&
                (HomerunChar() != GetCharID("Polygon Dr. Mario"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Phazontastico", points = 10,
    description = "Complete All-Star Mode with Dark Samus on Very Hard and 3 Stocks.",
    id = 173176, badge = "523060", published = "21.09.2021 17:45:41", modified = "08.09.2024 13:29:45", 
    trigger = never((HomerunChar() != GetCharID("Dark Samus")) &&
                (HomerunChar() != GetCharID("Dark Samus"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Farting Hero", points = 10,
    description = "Complete All-Star Mode with Wario on Very Hard and 3 Stocks.",
    id = 173177, badge = "523057", published = "21.09.2021 17:45:41", modified = "08.09.2024 13:29:43", 
    trigger = never((HomerunChar() != GetCharID("Wario")) &&
                (HomerunChar() != GetCharID("Polygon Wario"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Little Snake", points = 10,
    description = "Complete All-Star Mode with Lucas on Very Hard and 3 Stocks.",
    id = 173178, badge = "523063", published = "21.09.2021 17:45:41", modified = "08.09.2024 13:29:45", 
    trigger = never((HomerunChar() != GetCharID("Lucas")) &&
                (HomerunChar() != GetCharID("Polygon Lucas"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "King of the Koopas", points = 10,
    description = "Complete All-Star Mode with Bowser on Very Hard and 3 Stocks.",
    id = 173179, badge = "523090", published = "21.09.2021 17:45:42", modified = "08.09.2024 14:14:50", 
    trigger = never((HomerunChar() != GetCharID("Bowser")) &&
                (HomerunChar() != GetCharID("Polygon Bowser"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Nightmare Beast", points = 10,
    description = "Complete All-Star Mode with Giga Bowser on Very Hard and 3 Stocks.",
    id = 173180, badge = "523067", published = "21.09.2021 17:45:42", modified = "08.09.2024 14:14:20", 
    trigger = never(HomerunChar() != GetCharID("Giga Bowser")) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Haunted Object", points = 10,
    description = "Complete All-Star Mode with Mad Piano on Very Hard and 3 Stocks.",
    id = 173181, badge = "523070", published = "21.09.2021 17:45:42", modified = "08.09.2024 14:14:20", 
    trigger = never(HomerunChar() != GetCharID("Mad Piano")) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Fangs of Terror", points = 10,
    description = "Complete All-Star Mode with Wolf on Very Hard and 3 Stocks.",
    id = 173182, badge = "523073", published = "21.09.2021 17:45:43", modified = "08.09.2024 14:14:21", 
    trigger = never((HomerunChar() != GetCharID("Wolf")) &&
                (HomerunChar() != GetCharID("Polygon Wolf"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "That's Nuts!", points = 10,
    description = "Complete All-Star Mode with Conker on Very Hard and 3 Stocks.",
    id = 173183, badge = "523075", published = "21.09.2021 17:45:43", modified = "08.09.2024 14:14:21", 
    trigger = never((HomerunChar() != GetCharID("Conker")) &&
                (HomerunChar() != GetCharID("Polygon Conker"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Mewtwo Strikes Back", points = 10,
    description = "Complete All-Star Mode with Mewtwo on Very Hard and 3 Stocks.",
    id = 173184, badge = "523078", published = "21.09.2021 17:45:43", modified = "08.09.2024 14:14:22", 
    trigger = never((HomerunChar() != GetCharID("Mewtwo")) &&
                (HomerunChar() != GetCharID("Polygon Mewtwo"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "For the Kingdom", points = 10,
    description = "Complete All-Star Mode with Marth on Very Hard and 3 Stocks.",
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
    title = "Classic Sonic", points = 10,
    description = "Complete All-Star Mode with Sonic on Very Hard and 3 Stocks.",
    id = 197077, badge = "523084", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:14:24", 
    trigger = never((HomerunChar() != GetCharID("Sonic")) &&
                (HomerunChar() != GetCharID("Polygon Sonic"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Chaos Control!", points = 10,
    description = "Complete All-Star Mode with Super Sonic on Very Hard and 3 Stocks.",
    id = 197078, badge = "523087", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:14:26", 
    trigger = never(HomerunChar() != GetCharID("Super Sonic")) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Princess' Secret", points = 10,
    description = "Complete All-Star Mode with Sheik on Very Hard and 3 Stocks.",
    id = 161704, badge = "523872", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:14:26", 
    trigger = never((HomerunChar() != GetCharID("Sheik")) &&
                  (HomerunChar() != GetCharID("Polygon Sheik"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Shake, Shake!", points = 10,
    description = "Complete All-Star Mode with Marina on Very Hard and 3 Stocks.",
    id = 161705, badge = "523873", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:14:26", 
    trigger = never((HomerunChar() != GetCharID("Marina")) &&
                  (HomerunChar() != GetCharID("Polygon Marina"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Good Penguin", points = 10,
    description = "Complete All-Star Mode with King Dedede on Very Hard and 3 Stocks.",
    id = 161706, badge = "523874", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:14:26", 
    trigger = never((HomerunChar() != GetCharID("King Dedede")) &&
                  (HomerunChar() != GetCharID("Polygon King Dedede"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Hero of Odeo", points = 10,
    description = "Complete All-Star Mode with Goemon on Very Hard and 3 Stocks.",
    id = 161721, badge = "523875", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:14:26", 
    trigger = never((HomerunChar() != GetCharID("Goemon")) &&
                  (HomerunChar() != GetCharID("Polygon Goemon"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Hare's Legacy", points = 10,
    description = "Complete All-Star Mode with Peppy on Very Hard and 3 Stocks.",
    id = 161723, badge = "523876", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:14:26", 
    trigger = never(HomerunChar() != GetCharID("Peppy")) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Tactical Expert", points = 10,
    description = "Complete All-Star Mode with Slippy on Very Hard and 3 Stocks.",
    id = 161725, badge = "523877", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:14:26", 
    trigger = never(HomerunChar() != GetCharID("Slippy")) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Double Trouble", points = 10,
    description = "Complete All-Star Mode with Banjo & Kazooie on Very Hard and 3 Stocks.",
    id = 161727, badge = "523905", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:14:26", 
    trigger = never((HomerunChar() != GetCharID("Banjo & Kazooie")) &&
                  (HomerunChar() != GetCharID("Polygon Banjo & Kazooie"))) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Mighty? I Thought You Mean Weighty...", points = 10,
    description = "Complete All-Star Mode with Ebisumaru on Very Hard and 3 Stocks.",
    id = 161711, badge = "523906", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:14:26", 
    trigger = never(HomerunChar() != GetCharID("Ebisumaru")) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Not Just Scrap Metal", points = 10,
    description = "Complete All-Star Mode with Metal Luigi on Very Hard and 3 Stocks.",
    id = 161712, badge = "523907", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:14:26", 
    trigger = never(HomerunChar() != GetCharID("Metal Luigi")) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "King of the Fists", points = 10,
    description = "Complete All-Star Mode with Dragon King on Very Hard and 3 Stocks.",
    id = 161713, badge = "523953", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:14:26", 
    trigger = never(HomerunChar() != GetCharID("Dragon King")) &&
              BeatAllstarsVeryHard3Stocks() &&
              RulesCommunity()
)

achievement(
    title = "Sharp Shots on Targets", points = 25,
    description = "Complete all Bonus 1 'Break The Targets' Stages in a Row with a single Character.",
    id = 166068, badge = "523105", published = "15.08.2021 02:02:32", modified = "08.09.2024 14:31:05", 
    trigger = BeatAllBonus1()
)

achievement(
    title = "Precise Jumps on Platforms", points = 25,
    description = "Complete all Bonus 2 'Board The Platforms' Stages in a Row with a single Character.",
    id = 166069, badge = "523106", published = "15.08.2021 02:02:32", modified = "08.09.2024 14:31:05", 
    trigger = BeatAllBonus2()
)

achievement(
    title = "Speeding Away", points = 3,
    description = "Complete the Normal Version of Bonus 3 'Race To The Finish' within 20 Seconds.",
    id = 463455, badge = "525007", published = "15.08.2021 02:02:32", modified = "08.09.2024 14:31:05", 
    trigger = LB_Bonus3("Normal") && 
              Bonus3Timer() >= 1 &&    
              Bonus3Timer() <= 1200 &&
              dword(Mem_HighscoreOn) == 1
)

achievement(
    title = "In One Motion", points = 4,
    description = "Complete the Remix Version of Bonus 3 'Race To The Finish' within 20 Seconds.",
    id = 463456, badge = "525008", published = "15.08.2021 02:02:32", modified = "08.09.2024 14:31:05", 
    trigger = LB_Bonus3("Remix") && 
              Bonus3Timer() >= 1 &&    
              Bonus3Timer() <= 1200 &&
              dword(Mem_HighscoreOn) == 1
)

achievement(
    title = "Smash Royal", points = 10, type="progression",
    description = "Finish a Multi-Man Battle with 100 or more Kills.",
    id = 166085, badge = "523091", published = "15.08.2021 12:14:16", modified = "08.09.2024 14:18:30", 
    trigger = prev(NormalModeChar1Stocks()) == 0 &&
              NormalModeChar1Stocks() == 0xFF &&
              GameState() == 0x77 &&
              dword(Mem_MultiManKills) >= 100 &&
              byte(Mem_GameMode) == 0x02 &&
              RulesCommunity()
)

achievement(
    title = "Expert Training", points = 10, type="progression",
    description = "Finish a Cruel Multi-Man Battle with 5 or more Kills.",
    id = 166086, badge = "523092", published = "15.08.2021 12:14:16", modified = "08.09.2024 14:18:31", 
    trigger = prev(NormalModeChar1Stocks()) == 0 &&
              NormalModeChar1Stocks() == 0xFF &&
              GameState() == 0x77 &&
              dword(Mem_MultiManKills) >= 5 &&
              byte(Mem_GameMode) == 0x03 &&
              RulesCommunity()
)

achievement(
    title = "Original Battle Royale", points = 25, type="progression",
    description = "Win a 12-Character Battle with the Default Team against a COM using the same Team on Level 9 or higher in one Session and without leaving the Mode.",
    id = 166165, badge = "523217", published = "15.08.2021 17:18:38", modified = "08.09.2024 17:22:06",
    trigger = Beat12CharacterBattle() &&
              never(byte(Mem_12CharacterStocks + 0xBC) != 0) &&
              never(byte(Mem_12CharacterStocks + 0xBC) != byte(Mem_12CharacterStocks + 0x190)) &&
              RulesCommunity()
)

achievement(
    title = "From A Foreign Country", points = 25,
    description = "Win a 12-Character Battle with the Japanese Team against a COM using the same Team on Level 9 or higher in one Session and without leaving the Mode.",
    id = 462249, badge = "523500", published = "09.09.2024 17:19:48", modified = "09.09.2024 17:33:50", 
    trigger = Beat12CharacterBattle() &&
              never(byte(Mem_12CharacterStocks + 0xBC) != 1) &&
              never(byte(Mem_12CharacterStocks + 0xBC) != byte(Mem_12CharacterStocks + 0x190)) &&
              RulesCommunity()
)

achievement(
    title = "Count the Polygons", points = 25,
    description = "Win a 12-Character Battle with the Polygon Team against a COM using the same Team on Level 9 or higher in one Session and without leaving the Mode.",
    id = 462250, badge = "523499", published = "09.09.2024 17:24:34", modified = "09.09.2024 17:31:43", 
    trigger = Beat12CharacterBattle() &&
              never(byte(Mem_12CharacterStocks + 0xBC) != 2) &&
              never(byte(Mem_12CharacterStocks + 0xBC) != byte(Mem_12CharacterStocks + 0x190)) &&
              RulesCommunity()
)

achievement(
    title = "Mixing Everything Up", points = 25, type="progression",
    description = "Win a 12-Character Battle with the Remix Team against a COM using the same Team on Level 9 or higher in one Session and without leaving the Mode.",
    id = 462251, badge = "523501", published = "09.09.2024 17:24:34", modified = "09.09.2024 17:31:48", 
    trigger = Beat12CharacterBattle() &&
              never(byte(Mem_12CharacterStocks + 0xBC) != 3) &&
              never(byte(Mem_12CharacterStocks + 0xBC) != byte(Mem_12CharacterStocks + 0x190)) &&
              RulesCommunity()
)

achievement(
    title = "How to Make Mochi!", points = 10, type="progression",
    description = "Reach a Distance of 3750.0 Feet or more in Home-Run Contest.",
    id = 197079, badge = "523093", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:18:55", 
    trigger = byte(Mem_GameMode) == 0x06 &&
              prev(Bonus3State()) != 0x06 &&
              Bonus3State() == 0x06 &&
              dword(Mem_HomerunDistance) >= 37500 &&
              dword(Mem_HomerunDistance) <= 1000000 &&
              RulesCommunity() &&
              never(dword(Mem_HighscoreOn)  == 0x00)
)

achievement(
    title = "Combo King", points = 5,
    description = "Get a Combo of 15 Hits against a CPU in a Free-for-All or 12-Character Battle.",
    id = 166087, badge = "523094", published = "15.08.2021 13:40:15", modified = "08.09.2024 14:19:29", 
    trigger = FreeModeCombo(1, 2) ||
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
              FreeModeCombo(4, 3) &&
              RulesCommunity() &&
              never(dword(Mem_HighscoreOn)  == 0x00)
)

achievement(
    title = "Wanna Be A New Fighter", points = 5,
    description = "Copy as Kirby the Ability of every other Character.",
    id = 166084, badge = "523095", published = "15.08.2021 11:46:21", modified = "08.09.2024 14:19:29", 
    trigger = KirbyCopyAbility(0) ||
              KirbyCopyAbility(1) ||
              KirbyCopyAbility(2) ||
              KirbyCopyAbility(3)
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
               prev(dword(PointerPlayerData() + 0x0013BC)) == 2152316132 &&
                dword(PointerPlayerData() + 0x0013BC) == 2152316144) ||
               (GameState() == 18 &&
               byte(0x138658) == GetCharID("Wario") &&
               prev(dword(PointerPlayerData() + 0x00086C)) == 2152316132 &&
                dword(PointerPlayerData() + 0x00086C) == 2152316144))
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
              ((byte(PointerPlayerData() + 0x08 + 0xB50*0) == GetCharID("Sandbag") && byte(PointerPlayerData() + 0x20 + 0xB50*0) == 0) ||
              (byte(PointerPlayerData() + 0x08 + 0xB50*1) == GetCharID("Sandbag") && byte(PointerPlayerData() + 0x20 + 0xB50*1) == 0) ||
              (byte(PointerPlayerData() + 0x08 + 0xB50*2) == GetCharID("Sandbag") && byte(PointerPlayerData() + 0x20 + 0xB50*2) == 0) ||
              (byte(PointerPlayerData() + 0x08 + 0xB50*3) == GetCharID("Sandbag") && byte(PointerPlayerData() + 0x20 + 0xB50*3) == 0))
)

achievement(
    title = "Hands Up", points = 1,
    description = "Unlock Master Hand as a playable Character.",
    id = 462601, badge = "523974", published = "11.02.2022 19:39:41", modified = "08.09.2024 14:14:26", 
    trigger = BothGameStates() == 0x3907 &&
              SetPlayerTag(20)
)

achievement(
    title = "Fight Your Nightmares", points = 3,
    description = "Win a Free-for-All Battle as Luigi against Mad Piano on the Stage 'Big Boo's Haunt' with Level 9 CPU.",
    id = 166158, badge = "523097", published = "15.08.2021 15:58:15", modified = "09.09.2024 17:17:28",
    trigger = (Beat1COM("Big Boo's Haunt", "Luigi", "Mad Piano", 0) ||
              Beat1COM("Big Boo's Haunt", "Luigi", "Mad Piano", 1)) &&
              RulesCommunity()
)

achievement(
    title = "Intergalactic Showdown", points = 3,
    description = "Win a Free-for-All Battle as Fox against Wolf on the Stage 'Venom' with Level 9 CPU.",
    id = 166159, badge = "523098", published = "15.08.2021 15:58:18", modified = "09.09.2024 17:17:26", 
    trigger = (Beat1COM("Venom", "Fox", "Wolf", 0) ||
              Beat1COM("Venom", "Fox", "Wolf", 1)) &&
              RulesCommunity()
)

achievement(
    title = "Decisive Fight", points = 3,
    description = "Win a Free-for-All Battle as Link against Ganondorf on the Stage 'Ganon's Tower' with Level 9 CPU.",
    id = 166160, badge = "523099", published = "15.08.2021 15:58:20", modified = "09.09.2024 17:17:26", 
    trigger = (Beat1COM("Ganon's Tower", "Link", "Ganondorf", 0) ||
              Beat1COM("Ganon's Tower", "Link", "Ganondorf", 1)) &&
              RulesCommunity()
)

achievement(
    title = "Lost In Time", points = 3,
    description = "Win a Free-for-All Battle as Young Link against Link on the Stage 'Deku Tree' with Level 9 CPU.",
    id = 463029, badge = "524288", published = "21.09.2021 17:45:45", modified = "09.09.2024 17:17:26", 
    trigger = (Beat1COM("Deku Tree", "Young Link", "Link", 0) ||
              Beat1COM("Deku Tree", "Young Link", "Link", 1)) &&
              RulesCommunity() 
)

achievement(
    title = "Metal of Dishonor", points = 3,
    description = "Win a Free-for-All Battle as Mario or Luigi against their Metallic Version on the Stage 'Metallic Madness' with Level 9 CPU.",
    id = 463030, badge = "524289", published = "21.09.2021 17:45:45", modified = "09.09.2024 17:17:26", 
    trigger = (Beat1COM("Metallic Madness", "Mario", "Metal Mario", 0) ||
              Beat1COM("Metallic Madness", "Mario", "Metal Mario", 1) ||
              Beat1COM("Metallic Madness", "Luigi", "Metal Luigi", 0) ||
              Beat1COM("Metallic Madness", "Luigi", "Metal Luigi", 1)) &&
              RulesCommunity()
)

achievement(
    title = "Twin Phazon Fury", points = 3,
    description = "Win a Free-for-All Battle as Dark Samus against Samus on the Stage 'Norfair' with Level 9 CPU.",
    id = 463031, badge = "524290", published = "21.09.2021 17:45:45", modified = "09.09.2024 17:17:26", 
    trigger = (Beat1COM("Norfair", "Dark Samus", "Samus", 0) ||
              Beat1COM("Norfair", "Dark Samus", "Samus", 1)) &&
              RulesCommunity()
)

achievement(
    title = "A Well-Known Rematch", points = 3,
    description = "Win a Free-for-All Battle as King Dedede against Kirby on the Stage 'Mt. Dedede' with Level 9 CPU.",
    id = 462745, badge = "524082", published = "21.09.2021 17:45:45", modified = "09.09.2024 17:17:26", 
    trigger = (Beat1COM("Mt. Dedede", "King Dedede", "Kirby", 0) ||
              Beat1COM("Mt. Dedede", "King Dedede", "Kirby", 1)) &&
              RulesCommunity()  
)

achievement(
    title = "Magic In Vegas", points = 3,
    description = "Win a Free-for-All Battle as Kirby using the Top Hat on the Stage 'Casino Night Zone' against a Level 9 CPU.",
    id = 463452, badge = "525005", published = "15.08.2021 16:54:21", modified = "08.09.2024 14:22:11", 
    trigger = (Beat1COMKirbyRandom(0) ||
              Beat1COMKirbyRandom(1)) &&
              RulesCommunity()
)

achievement(
    title = "Coming Soon...", points = 3,
    description = "Win a Free-for-All Battle between Giga Bowser and Giant Donkey Kong on the Stage 'New Pork City' with Level 9 CPU.",
    id = 166161, badge = "523100", published = "15.08.2021 15:58:23", modified = "09.09.2024 17:17:26", 
    trigger = (Beat1COM("New Pork City", "Giga Bowser", "Giant Donkey Kong", 0) ||
              Beat1COM("New Pork City", "Giga Bowser", "Giant Donkey Kong", 1) ||
              Beat1COM("New Pork City", "Giant Donkey Kong", "Giga Bowser", 0) ||
              Beat1COM("New Pork City", "Giant Donkey Kong", "Giga Bowser", 1)) &&
              RulesCommunity()
)

achievement(
    title = "Oh Snap!", points = 3,
    description = "Win a Free-for-All Battle between Pikachu and Mewtwo on the Stage 'Meta Crystal' with Level 9 CPU.",
    id = 173187, badge = "523101", published = "21.09.2021 17:45:45", modified = "09.09.2024 17:17:26", 
    trigger = (Beat1COM("Meta Crystal", "Pikachu", "Mewtwo", 0) ||
              Beat1COM("Meta Crystal", "Pikachu", "Mewtwo", 1) ||
              Beat1COM("Meta Crystal", "Mewtwo", "Pikachu", 0) ||
              Beat1COM("Meta Crystal", "Mewtwo", "Pikachu", 1)) &&
              RulesCommunity()
)

achievement(
    title = "Diddy's Christmas Knockout", points = 3,
    description = "Win a Free-for-All Battle between Conker and Banjo & Kazooie on the Stage 'Frosty Village' with Level 9 CPU.",
    id = 462962, badge = "524235", published = "15.08.2021 16:54:21", modified = "08.09.2024 14:22:11", 
    trigger = (Beat1COM("Frosty Village", "Conker", "Banjo & Kazooie", 0) ||
              Beat1COM("Frosty Village", "Conker", "Banjo & Kazooie", 1) ||
              Beat1COM("Frosty Village", "Banjo & Kazooie", "Conker", 0) ||
              Beat1COM("Frosty Village", "Banjo & Kazooie", "Conker", 1)) &&
              RulesCommunity()
)

achievement(
    title = "Historical Lession", points = 3,
    description = "Win a Free-for-All Battle between Goemon and Ebisumaru on the Stage 'Edo Town' with Level 9 CPU.",
    id = 463028, badge = "524287", published = "15.08.2021 16:54:21", modified = "08.09.2024 14:22:11", 
    trigger = (Beat1COM("Edo Town", "Goemon", "Ebisumaru", 0) ||
              Beat1COM("Edo Town", "Goemon", "Ebisumaru", 1) ||
              Beat1COM("Edo Town", "Ebisumaru", "Goemon", 0) ||
              Beat1COM("Edo Town", "Ebisumaru", "Goemon", 1)) &&
              RulesCommunity()
)

achievement(
    title = "Without Fear", points = 5,
    description = "Win a Free-for-All Battle against a Level 10 CPU.",
    id = 463449, badge = "525004", published = "15.08.2021 16:54:21", modified = "08.09.2024 14:22:11", 
    trigger = (Beat1COMLevel10(0) ||
              Beat1COMLevel10(1)) &&
              RulesCommunity()
)


achievement(
    title = "Not This Again...", points = 5,
    description = "Win a Free-for-All Battle between Yoshi, Mario, Luigi and Wario on the Stage 'Peach's Castle II' with Level 9 CPU.",
    id = 166162, badge = "523102", published = "15.08.2021 16:54:20", modified = "08.09.2024 14:21:57", 
    trigger = (Beat4COMs("Peach's Castle II", "Yoshi", "Mario", "Luigi", "Wario", 0) ||
              Beat4COMs("Peach's Castle II", "Yoshi", "Mario", "Luigi", "Wario", 1) ||
              Beat4COMs("Peach's Castle II", "Yoshi", "Mario", "Luigi", "Wario", 2) ||
              Beat4COMs("Peach's Castle II", "Yoshi", "Mario", "Luigi", "Wario", 3)) &&
              RulesCommunity()
)

achievement(
    title = "Star Fox Assault", points = 5,
    description = "Win a Free-for-All Battle between Fox, Falco, Peppy and Slippy on the Stage 'Sector Z' with Level 9 CPU.",
    id = 463049, badge = "524322", published = "15.08.2021 16:54:20", modified = "08.09.2024 14:21:57", 
    trigger = (Beat4COMs("Sector Z", "Fox", "Falco", "Peppy", "Slippy", 0) ||
              Beat4COMs("Sector Z", "Fox", "Falco", "Peppy", "Slippy", 1) ||
              Beat4COMs("Sector Z", "Fox", "Falco", "Peppy", "Slippy", 2) ||
              Beat4COMs("Sector Z", "Fox", "Falco", "Peppy", "Slippy", 3)) &&
              RulesCommunity()
)

achievement(
    title = "Dragon King: The Fighting Game", points = 5,
    description = "Win a Free-for-All Battle between four Dragon King on the Stage 'Dragon King' with Level 9 CPU.",
    id = 463050, badge = "524359", published = "15.08.2021 16:54:21", modified = "08.09.2024 14:22:11", 
    trigger = (Beat4COMsSame("Dragon King", 0, "Dragon King", "Dragon King") ||
              Beat4COMsSame("Dragon King", 1, "Dragon King", "Dragon King") ||
              Beat4COMsSame("Dragon King", 2, "Dragon King", "Dragon King") ||
              Beat4COMsSame("Dragon King", 3, "Dragon King", "Dragon King")) &&
              RulesCommunity()
)

achievement(
    title = "Still In Beta", points = 5,
    description = "Win a Free-for-All Battle between four Polygon Fighters on the Stage 'Dream Land Beta 1' or 'Dream Land Beta 2' with Level 9 CPU.",
    id = 166163, badge = "523103", published = "15.08.2021 16:54:21", modified = "08.09.2024 14:22:11", 
    trigger = (Beat4COMsSame("Polygon", 0, "Dream Land Beta 1", "Dream Land Beta 2") ||
              Beat4COMsSame("Polygon", 1, "Dream Land Beta 1", "Dream Land Beta 2") ||
              Beat4COMsSame("Polygon", 2, "Dream Land Beta 1", "Dream Land Beta 2") ||
              Beat4COMsSame("Polygon", 3, "Dream Land Beta 1", "Dream Land Beta 2")) &&
              RulesCommunity()
)

achievement(
    title = "Feels Nostalgic!", points = 2,
    description = "In a Free-for-All Battle as Mario against Bowser on the Stage 'Bowser's Stadium' throw Bowser directly into a Bomb using the Backthrow with Level 5 CPU.",
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
    description = "In a Free-for-All Battle as Mario or Luigi against Bowser on the Stage 'World 1-1' do a full cycle on the Stage without taking Damage with Level 5 CPU.",
    id = 463472, badge = "525023", published = "14.09.2024 15:42:42", modified = "14.09.2024 15:42:42",
    trigger = (GameState() == 0x16 && 
              FreeModeStage() == GetStageID("World 1-1") && 
              FreeModeNumFighters() == 1 &&
              once((prev(dword(Mem_World1_1Progress)) == 0x80221B9C || 
                prev(dword(Mem_World1_1Progress)) == 0x80221BDC) && 
              dword(Mem_World1_1Progress) == 0x80221BA8) &&
              trigger_when((once(dword(Mem_World1_1Progress) == 0x80221BC0) &&
                dword(Mem_World1_1Progress) == 0x80221BA8)) &&
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

leaderboard(
    id = 24642, title = "Mario",
    description = "1P Game",
    start  = LB_1PGame("Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24643, title = "Mario",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24661, title = "Mario",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24662, title = "Mario",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25995, title = "Mario",
    description = "All-Star Mode",
    start  = LB_Allstars("Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30442, title = "Mario",
    description = "Home-Run Contest",
    start  = LB_Homerun("Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24663, title = "Mario JP",
    description = "1P Game",
    start  = LB_1PGame("JP Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24716, title = "Mario JP",
    description = "Remix 1P",
    start  = LB_Remix1PGame("JP Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24940, title = "Mario JP",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("JP Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24993, title = "Mario JP",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("JP Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25996, title = "Mario JP",
    description = "All-Star Mode",
    start  = LB_Allstars("JP Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30443, title = "Mario JP",
    description = "Home-Run Contest",
    start  = LB_Homerun("JP Mario"),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24688, title = "Polygon Mario",
    description = "1P Game",
    start  = LB_1PGame("Polygon Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24717, title = "Polygon Mario",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Polygon Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24941, title = "Polygon Mario",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Polygon Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24994, title = "Polygon Mario",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Polygon Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25997, title = "Polygon Mario",
    description = "All-Star Mode",
    start  = LB_Allstars("Polygon Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30444, title = "Polygon Mario",
    description = "Home-Run Contest",
    start  = LB_Homerun("Polygon Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24664, title = "Fox",
    description = "1P Game",
    start  = LB_1PGame("Fox") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24718, title = "Fox",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Fox") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24942, title = "Fox",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Fox") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24995, title = "Fox",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Fox") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25998, title = "Fox",
    description = "All-Star Mode",
    start  = LB_Allstars("Fox") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30445, title = "Fox",
    description = "Home-Run Contest",
    start  = LB_Homerun("Fox") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24665, title = "Fox JP",
    description = "1P Game",
    start  = LB_1PGame("JP Fox") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24719, title = "Fox JP",
    description = "Remix 1P",
    start  = LB_Remix1PGame("JP Fox") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24943, title = "Fox JP",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("JP Fox") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24996, title = "Fox JP",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("JP Fox") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25999, title = "Fox JP",
    description = "All-Star Mode",
    start  = LB_Allstars("JP Fox") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30446, title = "Fox JP",
    description = "Home-Run Contest",
    start  = LB_Homerun("JP Fox") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24666, title = "Polygon Fox",
    description = "1P Game",
    start  = LB_1PGame("Polygon Fox") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24720, title = "Polygon Fox",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Polygon Fox") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24944, title = "Polygon Fox",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Polygon Fox") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24997, title = "Polygon Fox",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Polygon Fox") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26000, title = "Polygon Fox",
    description = "All-Star Mode",
    start  = LB_Allstars("Polygon Fox") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30447, title = "Polygon Fox",
    description = "Home-Run Contest",
    start  = LB_Homerun("Polygon Fox") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24667, title = "Donkey Kong",
    description = "1P Game",
    start  = LB_1PGame("Donkey Kong") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24721, title = "Donkey Kong",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Donkey Kong") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24945, title = "Donkey Kong",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Donkey Kong") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24998, title = "Donkey Kong",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Donkey Kong") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26001, title = "Donkey Kong",
    description = "All-Star Mode",
    start  = LB_Allstars("Donkey Kong") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30448, title = "Donkey Kong",
    description = "Home-Run Contest",
    start  = LB_Homerun("Donkey Kong") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24668, title = "Donkey Kong JP",
    description = "1P Game",
    start  = LB_1PGame("JP Donkey Kong") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24722, title = "Donkey Kong JP",
    description = "Remix 1P",
    start  = LB_Remix1PGame("JP Donkey Kong") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24946, title = "Donkey Kong JP",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("JP Donkey Kong") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24999, title = "Donkey Kong JP",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("JP Donkey Kong") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26002, title = "Donkey Kong JP",
    description = "All-Star Mode",
    start  = LB_Allstars("JP Donkey Kong") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30449, title = "Donkey Kong JP",
    description = "Home-Run Contest",
    start  = LB_Homerun("JP Donkey Kong") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24669, title = "Polygon Donkey Kong",
    description = "1P Game",
    start  = LB_1PGame("Polygon Donkey Kong") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24723, title = "Polygon Donkey Kong",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Polygon Donkey Kong") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24947, title = "Polygon Donkey Kong",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Polygon Donkey Kong") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25000, title = "Polygon Donkey Kong",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Polygon Donkey Kong") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26003, title = "Polygon Donkey Kong",
    description = "All-Star Mode",
    start  = LB_Allstars("Polygon Donkey Kong") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30450, title = "Polygon Donkey Kong",
    description = "Home-Run Contest",
    start  = LB_Homerun("Polygon Donkey Kong") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24670, title = "Samus",
    description = "1P Game",
    start  = LB_1PGame("Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24724, title = "Samus",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24948, title = "Samus",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25001, title = "Samus",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26004, title = "Samus",
    description = "All-Star Mode",
    start  = LB_Allstars("Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30451, title = "Samus",
    description = "Home-Run Contest",
    start  = LB_Homerun("Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24671, title = "Samus JP",
    description = "1P Game",
    start  = LB_1PGame("JP Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24725, title = "Samus JP",
    description = "Remix 1P",
    start  = LB_Remix1PGame("JP Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24949, title = "Samus JP",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("JP Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25002, title = "Samus JP",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("JP Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26014, title = "Samus JP",
    description = "All-Star Mode",
    start  = LB_Allstars("JP Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30452, title = "Samus JP",
    description = "Home-Run Contest",
    start  = LB_Homerun("JP Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24672, title = "Samus EU",
    description = "1P Game",
    start  = LB_1PGame("EU Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24726, title = "Samus EU",
    description = "Remix 1P",
    start  = LB_Remix1PGame("EU Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24950, title = "Samus EU",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("EU Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25003, title = "Samus EU",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("EU Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26006, title = "Samus EU",
    description = "All-Star Mode",
    start  = LB_Allstars("EU Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30453, title = "Samus EU",
    description = "Home-Run Contest",
    start  = LB_Homerun("EU Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24673, title = "Polygon Samus",
    description = "1P Game",
    start  = LB_1PGame("Polygon Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24727, title = "Polygon Samus",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Polygon Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24951, title = "Polygon Samus",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Polygon Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25004, title = "Polygon Samus",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Polygon Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26007, title = "Polygon Samus",
    description = "All-Star Mode",
    start  = LB_Allstars("Polygon Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30454, title = "Polygon Samus",
    description = "Home-Run Contest",
    start  = LB_Homerun("Polygon Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24674, title = "Luigi",
    description = "1P Game",
    start  = LB_1PGame("Luigi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24728, title = "Luigi",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Luigi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24952, title = "Luigi",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Luigi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25005, title = "Luigi",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Luigi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26008, title = "Luigi",
    description = "All-Star Mode",
    start  = LB_Allstars("Luigi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30455, title = "Luigi",
    description = "Home-Run Contest",
    start  = LB_Homerun("Luigi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24675, title = "Luigi JP",
    description = "1P Game",
    start  = LB_1PGame("JP Luigi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24729, title = "Luigi JP",
    description = "Remix 1P",
    start  = LB_Remix1PGame("JP Luigi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24953, title = "Luigi JP",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("JP Luigi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25006, title = "Luigi JP",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("JP Luigi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26009, title = "Luigi JP",
    description = "All-Star Mode",
    start  = LB_Allstars("JP Luigi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30456, title = "Luigi JP",
    description = "Home-Run Contest",
    start  = LB_Homerun("JP Luigi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24676, title = "Polygon Luigi",
    description = "1P Game",
    start  = LB_1PGame("Polygon Luigi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24730, title = "Polygon Luigi",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Polygon Luigi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24954, title = "Polygon Luigi",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Polygon Luigi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25007, title = "Polygon Luigi",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Polygon Luigi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26010, title = "Polygon Luigi",
    description = "All-Star Mode",
    start  = LB_Allstars("Polygon Luigi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30457, title = "Polygon Luigi",
    description = "Home-Run Contest",
    start  = LB_Homerun("Polygon Luigi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24677, title = "Link",
    description = "1P Game",
    start  = LB_1PGame("Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24731, title = "Link",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24955, title = "Link",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25008, title = "Link",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26011, title = "Link",
    description = "All-Star Mode",
    start  = LB_Allstars("Link"),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30458, title = "Link",
    description = "Home-Run Contest",
    start  = LB_Homerun("Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24678, title = "Link JP",
    description = "1P Game",
    start  = LB_1PGame("JP Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24732, title = "Link JP",
    description = "Remix 1P",
    start  = LB_Remix1PGame("JP Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24956, title = "Link JP",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("JP Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25009, title = "Link JP",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("JP Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26012, title = "Link JP",
    description = "All-Star Mode",
    start  = LB_Allstars("JP Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30459, title = "Link JP",
    description = "Home-Run Contest",
    start  = LB_Homerun("JP Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24679, title = "Link EU",
    description = "1P Game",
    start  = LB_1PGame("EU Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24733, title = "Link EU",
    description = "Remix 1P",
    start  = LB_Remix1PGame("EU Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24957, title = "Link EU",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("EU Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25010, title = "Link EU",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("EU Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26013, title = "Link EU",
    description = "All-Star Mode",
    start  = LB_Allstars("EU Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30460, title = "Link EU",
    description = "Home-Run Contest",
    start  = LB_Homerun("EU Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24680, title = "Polygon Link",
    description = "1P Game",
    start  = LB_1PGame("Polygon Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24734, title = "Polygon Link",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Polygon Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24958, title = "Polygon Link",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Polygon Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25011, title = "Polygon Link",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Polygon Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26005, title = "Polygon Link",
    description = "All-Star Mode",
    start  = LB_Allstars("Polygon Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30461, title = "Polygon Link",
    description = "Home-Run Contest",
    start  = LB_Homerun("Polygon Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24681, title = "Yoshi",
    description = "1P Game",
    start  = LB_1PGame("Yoshi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24735, title = "Yoshi",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Yoshi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24959, title = "Yoshi",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Yoshi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25012, title = "Yoshi",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Yoshi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26015, title = "Yoshi",
    description = "All-Star Mode",
    start  = LB_Allstars("Yoshi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30462, title = "Yoshi",
    description = "Home-Run Contest",
    start  = LB_Homerun("Yoshi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24682, title = "Yoshi JP",
    description = "1P Game",
    start  = LB_1PGame("JP Yoshi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24736, title = "Yoshi JP",
    description = "Remix 1P",
    start  = LB_Remix1PGame("JP Yoshi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24960, title = "Yoshi JP",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("JP Yoshi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25013, title = "Yoshi JP",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("JP Yoshi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26016, title = "Yoshi JP",
    description = "All-Star Mode",
    start  = LB_Allstars("JP Yoshi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30463, title = "Yoshi JP",
    description = "Home-Run Contest",
    start  = LB_Homerun("JP Yoshi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24683, title = "Polygon Yoshi",
    description = "1P Game",
    start  = LB_1PGame("Polygon Yoshi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24737, title = "Polygon Yoshi",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Polygon Yoshi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24961, title = "Polygon Yoshi",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Polygon Yoshi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25014, title = "Polygon Yoshi",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Polygon Yoshi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26017, title = "Polygon Yoshi",
    description = "All-Star Mode",
    start  = LB_Allstars("Polygon Yoshi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30464, title = "Polygon Yoshi",
    description = "Home-Run Contest",
    start  = LB_Homerun("Polygon Yoshi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24684, title = "Captain Falcon",
    description = "1P Game",
    start  = LB_1PGame("Captain Falcon") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24738, title = "Captain Falcon",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Captain Falcon") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24962, title = "Captain Falcon",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Captain Falcon") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25015, title = "Captain Falcon",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Captain Falcon") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26018, title = "Captain Falcon",
    description = "All-Star Mode",
    start  = LB_Allstars("Captain Falcon") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30465, title = "Captain Falcon",
    description = "Home-Run Contest",
    start  = LB_Homerun("Captain Falcon") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24685, title = "Captain Falcon JP",
    description = "1P Game",
    start  = LB_1PGame("JP Captain Falcon") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24739, title = "Captain Falcon JP",
    description = "Remix 1P",
    start  = LB_Remix1PGame("JP Captain Falcon") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24963, title = "Captain Falcon JP",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("JP Captain Falcon") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25016, title = "Captain Falcon JP",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("JP Captain Falcon") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26019, title = "Captain Falcon JP",
    description = "All-Star Mode",
    start  = LB_Allstars("JP Captain Falcon") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30466, title = "Captain Falcon JP",
    description = "Home-Run Contest",
    start  = LB_Homerun("JP Captain Falcon") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24686, title = "Polygon Captain Falcon",
    description = "1P Game",
    start  = LB_1PGame("Polygon Captain Falcon") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24740, title = "Polygon Captain Falcon",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Polygon Captain Falcon") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24964, title = "Polygon Captain Falcon",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Polygon Captain Falcon") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25017, title = "Polygon Captain Falcon",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Polygon Captain Falcon") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26020, title = "Polygon Captain Falcon",
    description = "All-Star Mode",
    start  = LB_Allstars("Polygon Captain Falcon") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30467, title = "Polygon Captain Falcon",
    description = "Home-Run Contest",
    start  = LB_Homerun("Polygon Captain Falcon") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24687, title = "Kirby",
    description = "1P Game",
    start  = LB_1PGame("Kirby") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24741, title = "Kirby",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Kirby") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24965, title = "Kirby",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Kirby") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25018, title = "Kirby",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Kirby") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26021, title = "Kirby",
    description = "All-Star Mode",
    start  = LB_Allstars("Kirby") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30468, title = "Kirby",
    description = "Home-Run Contest",
    start  = LB_Homerun("Kirby") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24689, title = "Kirby JP",
    description = "1P Game",
    start  = LB_1PGame("JP Kirby") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24742, title = "Kirby JP",
    description = "Remix 1P",
    start  = LB_Remix1PGame("JP Kirby") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24966, title = "Kirby JP",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("JP Kirby") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25019, title = "Kirby JP",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("JP Kirby") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26022, title = "Kirby JP",
    description = "All-Star Mode",
    start  = LB_Allstars("JP Kirby") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30469, title = "Kirby JP",
    description = "Home-Run Contest",
    start  = LB_Homerun("JP Kirby") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24715, title = "Polygon Kirby",
    description = "1P Game",
    start  = LB_1PGame("Polygon Kirby") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24743, title = "Polygon Kirby",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Polygon Kirby") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24967, title = "Polygon Kirby",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Polygon Kirby") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25020, title = "Polygon Kirby",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Polygon Kirby") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26023, title = "Polygon Kirby",
    description = "All-Star Mode",
    start  = LB_Allstars("Polygon Kirby") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30470, title = "Polygon Kirby",
    description = "Home-Run Contest",
    start  = LB_Homerun("Polygon Kirby") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24690, title = "Pikachu",
    description = "1P Game",
    start  = LB_1PGame("Pikachu") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24744, title = "Pikachu",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Pikachu") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24968, title = "Pikachu",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Pikachu") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25021, title = "Pikachu",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Pikachu") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26024, title = "Pikachu",
    description = "All-Star Mode",
    start  = LB_Allstars("Pikachu") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30471, title = "Pikachu",
    description = "Home-Run Contest",
    start  = LB_Homerun("Pikachu") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24691, title = "Pikachu JP",
    description = "1P Game",
    start  = LB_1PGame("JP Pikachu") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24745, title = "Pikachu JP",
    description = "Remix 1P",
    start  = LB_Remix1PGame("JP Pikachu") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24969, title = "Pikachu JP",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("JP Pikachu") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25022, title = "Pikachu JP",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("JP Pikachu") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26025, title = "Pikachu JP",
    description = "All-Star Mode",
    start  = LB_Allstars("JP Pikachu") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30472, title = "Pikachu JP",
    description = "Home-Run Contest",
    start  = LB_Homerun("JP Pikachu") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24692, title = "Pikachu EU",
    description = "1P Game",
    start  = LB_1PGame("EU Pikachu") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24756, title = "Pikachu EU",
    description = "Remix 1P",
    start  = LB_Remix1PGame("EU Pikachu") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24970, title = "Pikachu EU",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("EU Pikachu") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25023, title = "Pikachu EU",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("EU Pikachu") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26026, title = "Pikachu EU",
    description = "All-Star Mode",
    start  = LB_Allstars("EU Pikachu") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30473, title = "Pikachu EU",
    description = "Home-Run Contest",
    start  = LB_Homerun("EU Pikachu") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24693, title = "Polygon Pikachu",
    description = "1P Game",
    start  = LB_1PGame("Polygon Pikachu") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24757, title = "Polygon Pikachu",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Polygon Pikachu") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24971, title = "Polygon Pikachu",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Polygon Pikachu") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25024, title = "Polygon Pikachu",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Polygon Pikachu") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26027, title = "Polygon Pikachu",
    description = "All-Star Mode",
    start  = LB_Allstars("Polygon Pikachu") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30474, title = "Polygon Pikachu",
    description = "Home-Run Contest",
    start  = LB_Homerun("Polygon Pikachu") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24694, title = "Jigglypuff",
    description = "1P Game",
    start  = LB_1PGame("Jigglypuff") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24748, title = "Jigglypuff",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Jigglypuff") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24972, title = "Jigglypuff",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Jigglypuff") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25025, title = "Jigglypuff",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Jigglypuff") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26028, title = "Jigglypuff",
    description = "All-Star Mode",
    start  = LB_Allstars("Jigglypuff") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30475, title = "Jigglypuff",
    description = "Home-Run Contest",
    start  = LB_Homerun("Jigglypuff") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24695, title = "Jigglypuff JP",
    description = "1P Game",
    start  = LB_1PGame("JP Jigglypuff") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24749, title = "Jigglypuff JP",
    description = "Remix 1P",
    start  = LB_Remix1PGame("JP Jigglypuff") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24973, title = "Jigglypuff JP",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("JP Jigglypuff") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25026, title = "Jigglypuff JP",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("JP Jigglypuff") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26029, title = "Jigglypuff JP",
    description = "All-Star Mode",
    start  = LB_Allstars("JP Jigglypuff") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30476, title = "Jigglypuff JP",
    description = "Home-Run Contest",
    start  = LB_Homerun("JP Jigglypuff") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24696, title = "Jigglypuff EU",
    description = "1P Game",
    start  = LB_1PGame("EU Jigglypuff") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24760, title = "Jigglypuff EU",
    description = "Remix 1P",
    start  = LB_Remix1PGame("EU Jigglypuff") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24974, title = "Jigglypuff EU",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("EU Jigglypuff") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25027, title = "Jigglypuff EU",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("EU Jigglypuff") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26030, title = "Jigglypuff EU",
    description = "All-Star Mode",
    start  = LB_Allstars("EU Jigglypuff") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30477, title = "Jigglypuff EU",
    description = "Home-Run Contest",
    start  = LB_Homerun("EU Jigglypuff") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24697, title = "Polygon Jigglypuff",
    description = "1P Game",
    start  = LB_1PGame("Polygon Jigglypuff") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24761, title = "Polygon Jigglypuff",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Polygon Jigglypuff") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24975, title = "Polygon Jigglypuff",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Polygon Jigglypuff") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25028, title = "Polygon Jigglypuff",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Polygon Jigglypuff") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26031, title = "Polygon Jigglypuff",
    description = "All-Star Mode",
    start  = LB_Allstars("Polygon Jigglypuff") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30478, title = "Polygon Jigglypuff",
    description = "Home-Run Contest",
    start  = LB_Homerun("Polygon Jigglypuff") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24698, title = "Ness",
    description = "1P Game",
    start  = LB_1PGame("Ness") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24752, title = "Ness",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Ness") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24976, title = "Ness",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Ness") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25029, title = "Ness",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Ness") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26032, title = "Ness",
    description = "All-Star Mode",
    start  = LB_Allstars("Ness") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30479, title = "Ness",
    description = "Home-Run Contest",
    start  = LB_Homerun("Ness") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24699, title = "Ness JP",
    description = "1P Game",
    start  = LB_1PGame("JP Ness") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24763, title = "Ness JP",
    description = "Remix 1P",
    start  = LB_Remix1PGame("JP Ness") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24977, title = "Ness JP",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("JP Ness") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25030, title = "Ness JP",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("JP Ness") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26033, title = "Ness JP",
    description = "All-Star Mode",
    start  = LB_Allstars("JP Ness") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30480, title = "Ness JP",
    description = "Home-Run Contest",
    start  = LB_Homerun("JP Ness") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24700, title = "Polygon Ness",
    description = "1P Game",
    start  = LB_1PGame("Polygon Ness") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24764, title = "Polygon Ness",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Polygon Ness") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24978, title = "Polygon Ness",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Polygon Ness") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25031, title = "Polygon Ness",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Polygon Ness") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26034, title = "Polygon Ness",
    description = "All-Star Mode",
    start  = LB_Allstars("Polygon Ness") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30481, title = "Polygon Ness",
    description = "Home-Run Contest",
    start  = LB_Homerun("Polygon Ness") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24701, title = "Metal Mario",
    description = "1P Game",
    start  = LB_1PGame("Metal Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24765, title = "Metal Mario",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Metal Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24979, title = "Metal Mario",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Metal Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25032, title = "Metal Mario",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Metal Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26035, title = "Metal Mario",
    description = "All-Star Mode",
    start  = LB_Allstars("Metal Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30482, title = "Metal Mario",
    description = "Home-Run Contest",
    start  = LB_Homerun("Metal Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24702, title = "Giant Donkey Kong",
    description = "1P Game",
    start  = LB_1PGame("Giant Donkey Kong") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24771, title = "Giant Donkey Kong",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Giant Donkey Kong") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24980, title = "Giant Donkey Kong",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Giant Donkey Kong") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25033, title = "Giant Donkey Kong",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Giant Donkey Kong") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26036, title = "Giant Donkey Kong",
    description = "All-Star Mode",
    start  = LB_Allstars("Giant Donkey Kong") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30483, title = "Giant Donkey Kong",
    description = "Home-Run Contest",
    start  = LB_Homerun("Giant Donkey Kong") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24703, title = "Ganondorf",
    description = "1P Game",
    start  = LB_1PGame("Ganondorf"),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24772, title = "Ganondorf",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Ganondorf") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24981, title = "Ganondorf",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Ganondorf") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25034, title = "Ganondorf",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Ganondorf") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26037, title = "Ganondorf",
    description = "All-Star Mode",
    start  = LB_Allstars("Ganondorf") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30484, title = "Ganondorf",
    description = "Home-Run Contest",
    start  = LB_Homerun("Ganondorf"),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 115286, title = "Polygon Ganondorf",
    description = "1P Game",
    start  = LB_1PGame("Polygon Ganondorf") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 115287, title = "Polygon Ganondorf",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Polygon Ganondorf") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 115288, title = "Polygon Ganondorf",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Polygon Ganondorf") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 115289, title = "Polygon Ganondorf",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Polygon Ganondorf") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 115290, title = "Polygon Ganondorf",
    description = "All-Star Mode",
    start  = LB_Allstars("Polygon Ganondorf") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 115291, title = "Polygon Ganondorf",
    description = "Home-Run Contest",
    start  = LB_Homerun("Polygon Ganondorf") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24704, title = "Young Link",
    description = "1P Game",
    start  = LB_1PGame("Young Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24773, title = "Young Link",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Young Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24982, title = "Young Link",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Young Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25035, title = "Young Link",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Young Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26038, title = "Young Link",
    description = "All-Star Mode",
    start  = LB_Allstars("Young Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30485, title = "Young Link",
    description = "Home-Run Contest",
    start  = LB_Homerun("Young Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 115292, title = "Polygon Young Link",
    description = "1P Game",
    start  = LB_1PGame("Polygon Young Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 115293, title = "Polygon Young Link",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Polygon Young Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 115294, title = "Polygon Young Link",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Polygon Young Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 115295, title = "Polygon Young Link",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Polygon Young Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 115296, title = "Polygon Young Link",
    description = "All-Star Mode",
    start  = LB_Allstars("Polygon Young Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 115297, title = "Polygon Young Link",
    description = "Home-Run Contest",
    start  = LB_Homerun("Polygon Young Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24705, title = "Falco",
    description = "1P Game",
    start  = LB_1PGame("Falco") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24774, title = "Falco",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Falco") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24983, title = "Falco",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Falco") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25036, title = "Falco",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Falco") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26039, title = "Falco",
    description = "All-Star Mode",
    start  = LB_Allstars("Falco") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30486, title = "Falco",
    description = "Home-Run Contest",
    start  = LB_Homerun("Falco") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 115280, title = "Polygon Falco",
    description = "1P Game",
    start  = LB_1PGame("Polygon Falco") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 115281, title = "Polygon Falco",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Polygon Falco") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 115282, title = "Polygon Falco",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Polygon Falco") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 115283, title = "Polygon Falco",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Polygon Falco") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 115284, title = "Polygon Falco",
    description = "All-Star Mode",
    start  = LB_Allstars("Polygon Falco") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 115285, title = "Polygon Falco",
    description = "Home-Run Contest",
    start  = LB_Homerun("Polygon Falco") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24706, title = "Dr. Mario",
    description = "1P Game",
    start  = LB_1PGame("Dr. Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24775, title = "Dr. Mario",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Dr. Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24984, title = "Dr. Mario",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Dr. Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25037, title = "Dr. Mario",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Dr. Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26040, title = "Dr. Mario",
    description = "All-Star Mode",
    start  = LB_Allstars("Dr. Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30487, title = "Dr. Mario",
    description = "Home-Run Contest",
    start  = LB_Homerun("Dr. Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 115262, title = "Polygon Dr. Mario",
    description = "1P Game",
    start  = LB_1PGame("Polygon Dr. Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 115263, title = "Polygon Dr. Mario",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Polygon Dr. Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 115264, title = "Polygon Dr. Mario",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Polygon Dr. Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 115265, title = "Polygon Dr. Mario",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Polygon Dr. Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 115266, title = "Polygon Dr. Mario",
    description = "All-Star Mode",
    start  = LB_Allstars("Polygon Dr. Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 115267, title = "Polygon Dr. Mario",
    description = "Home-Run Contest",
    start  = LB_Homerun("Polygon Dr. Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24707, title = "Dark Samus",
    description = "1P Game",
    start  = LB_1PGame("Dark Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24777, title = "Dark Samus",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Dark Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24985, title = "Dark Samus",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Dark Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25038, title = "Dark Samus",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Dark Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26041, title = "Dark Samus",
    description = "All-Star Mode",
    start  = LB_Allstars("Dark Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30488, title = "Dark Samus",
    description = "Home-Run Contest",
    start  = LB_Homerun("Dark Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 115298, title = "Polygon Dark Samus",
    description = "1P Game",
    start  = LB_1PGame("Polygon Dark Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 115299, title = "Polygon Dark Samus",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Polygon Dark Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 115300, title = "Polygon Dark Samus",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Polygon Dark Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 115301, title = "Polygon Dark Samus",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Polygon Dark Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 115302, title = "Polygon Dark Samus",
    description = "All-Star Mode",
    start  = LB_Allstars("Polygon Dark Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 115303, title = "Polygon Dark Samus",
    description = "Home-Run Contest",
    start  = LB_Homerun("Polygon Dark Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24708, title = "Wario",
    description = "1P Game",
    start  = LB_1PGame("Wario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24762, title = "Wario",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Wario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24986, title = "Wario",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Wario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25039, title = "Wario",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Wario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26042, title = "Wario",
    description = "All-Star Mode",
    start  = LB_Allstars("Wario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30489, title = "Wario",
    description = "Home-Run Contest",
    start  = LB_Homerun("Wario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24920, title = "Polygon Wario",
    description = "1P Game",
    start  = LB_1PGame("Polygon Wario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24866, title = "Polygon Wario",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Polygon Wario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24813, title = "Polygon Wario",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Polygon Wario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24919, title = "Polygon Wario",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Polygon Wario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24865, title = "Polygon Wario",
    description = "All-Star Mode",
    start  = LB_Allstars("Polygon Wario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24812, title = "Polygon Wario",
    description = "Home-Run Contest",
    start  = LB_Homerun("Polygon Wario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24709, title = "Lucas",
    description = "1P Game",
    start  = LB_1PGame("Lucas") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24766, title = "Lucas",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Lucas") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24987, title = "Lucas",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Lucas") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25040, title = "Lucas",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Lucas") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26043, title = "Lucas",
    description = "All-Star Mode",
    start  = LB_Allstars("Lucas") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30490, title = "Lucas",
    description = "Home-Run Contest",
    start  = LB_Homerun("Lucas") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24918, title = "Polygon Lucas",
    description = "1P Game",
    start  = LB_1PGame("Polygon Lucas") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24864, title = "Polygon Lucas",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Polygon Lucas") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24811, title = "Polygon Lucas",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Polygon Lucas") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24917, title = "Polygon Lucas",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Polygon Lucas") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24863, title = "Polygon Lucas",
    description = "All-Star Mode",
    start  = LB_Allstars("Polygon Lucas") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24808, title = "Polygon Lucas",
    description = "Home-Run Contest",
    start  = LB_Homerun("Polygon Lucas") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24714, title = "Bowser",
    description = "1P Game",
    start  = LB_1PGame("Bowser") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24776, title = "Bowser",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Bowser") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24992, title = "Bowser",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Bowser") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25045, title = "Bowser",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Bowser") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26044, title = "Bowser",
    description = "All-Star Mode",
    start  = LB_Allstars("Bowser") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30491, title = "Bowser",
    description = "Home-Run Contest",
    start  = LB_Homerun("Bowser") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24810, title = "Polygon Bowser",
    description = "1P Game",
    start  = LB_1PGame("Polygon Bowser") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24916, title = "Polygon Bowser",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Polygon Bowser") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24862, title = "Polygon Bowser",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Polygon Bowser") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24809, title = "Polygon Bowser",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Polygon Bowser") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24915, title = "Polygon Bowser",
    description = "All-Star Mode",
    start  = LB_Allstars("Polygon Bowser") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24861, title = "Polygon Bowser",
    description = "Home-Run Contest",
    start  = LB_Homerun("Polygon Bowser") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24710, title = "Giga Bowser",
    description = "1P Game",
    start  = LB_1PGame("Giga Bowser") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24767, title = "Giga Bowser",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Giga Bowser") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24988, title = "Giga Bowser",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Giga Bowser") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25041, title = "Giga Bowser",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Fox") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26045, title = "Giga Bowser",
    description = "All-Star Mode",
    start  = LB_Allstars("Giga Bowser") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30492, title = "Giga Bowser",
    description = "Home-Run Contest",
    start  = LB_Homerun("Giga Bowser") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24711, title = "Mad Piano",
    description = "1P Game",
    start  = LB_1PGame("Mad Piano") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24768, title = "Mad Piano",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Mad Piano") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24989, title = "Mad Piano",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Mad Piano") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25042, title = "Mad Piano",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Fox") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26046, title = "Mad Piano",
    description = "All-Star Mode",
    start  = LB_Allstars("Mad Piano") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30493, title = "Mad Piano",
    description = "Home-Run Contest",
    start  = LB_Homerun("Mad Piano") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24712, title = "Wolf",
    description = "1P Game",
    start  = LB_1PGame("Wolf") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24769, title = "Wolf",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Wolf") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24990, title = "Wolf",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Wolf") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25043, title = "Wolf",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Wolf") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26047, title = "Wolf",
    description = "All-Star Mode",
    start  = LB_Allstars("Wolf") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30494, title = "Wolf",
    description = "Home-Run Contest",
    start  = LB_Homerun("Wolf") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24914, title = "Polygon Wolf",
    description = "1P Game",
    start  = LB_1PGame("Polygon Wolf") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24860, title = "Polygon Wolf",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Polygon Wolf") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24807, title = "Polygon Wolf",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Polygon Wolf") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24913, title = "Polygon Wolf",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Polygon Wolf") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24859, title = "Polygon Wolf",
    description = "All-Star Mode",
    start  = LB_Allstars("Polygon Wolf") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24806, title = "Polygon Wolf",
    description = "Home-Run Contest",
    start  = LB_Homerun("Polygon Wolf") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24713, title = "Conker",
    description = "1P Game",
    start  = LB_1PGame("Conker") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24770, title = "Conker",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Conker") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24991, title = "Conker",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Conker") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25044, title = "Conker",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Conker") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26048, title = "Conker",
    description = "All-Star Mode",
    start  = LB_Allstars("Conker") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30495, title = "Conker",
    description = "Home-Run Contest",
    start  = LB_Homerun("Conker") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24912, title = "Polygon Conker",
    description = "1P Game",
    start  = LB_1PGame("Polygon Conker") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24831, title = "Polygon Conker",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Polygon Conker") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24805, title = "Polygon Conker",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Polygon Conker") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24911, title = "Polygon Conker",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Polygon Conker") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24858, title = "Polygon Conker",
    description = "All-Star Mode",
    start  = LB_Allstars("Polygon Conker") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24803, title = "Polygon Conker",
    description = "Home-Run Contest",
    start  = LB_Homerun("Polygon Conker") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 25981, title = "Mewtwo",
    description = "1P Game",
    start  = LB_1PGame("Mewtwo") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 25983, title = "Mewtwo",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Mewtwo") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 25991, title = "Mewtwo",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Mewtwo") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25993, title = "Mewtwo",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Mewtwo") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26049, title = "Mewtwo",
    description = "All-Star Mode",
    start  = LB_Allstars("Mewtwo") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30496, title = "Mewtwo",
    description = "Home-Run Contest",
    start  = LB_Homerun("Mewtwo") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24910, title = "Polygon Mewtwo",
    description = "1P Game",
    start  = LB_1PGame("Polygon Mewtwo") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24857, title = "Polygon Mewtwo",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Polygon Mewtwo") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24802, title = "Polygon Mewtwo",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Polygon Mewtwo") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24909, title = "Polygon Mewtwo",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Polygon Mewtwo") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24856, title = "Polygon Mewtwo",
    description = "All-Star Mode",
    start  = LB_Allstars("Polygon Mewtwo") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24801, title = "Polygon Mewtwo",
    description = "Home-Run Contest",
    start  = LB_Homerun("Polygon Mewtwo") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 25982, title = "Marth",
    description = "1P Game",
    start  = LB_1PGame("Marth") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 25984, title = "Marth",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Marth") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 25992, title = "Marth",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Marth") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25994, title = "Marth",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Marth") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 26050, title = "Marth",
    description = "All-Star Mode",
    start  = LB_Allstars("Marth") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30497, title = "Marth",
    description = "Home-Run Contest",
    start  = LB_Homerun("Marth") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24908, title = "Polygon Marth",
    description = "1P Game",
    start  = LB_1PGame("Polygon Marth") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24855, title = "Polygon Marth",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Polygon Marth") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24800, title = "Polygon Marth",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Polygon Marth") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24907, title = "Polygon Marth",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Polygon Marth") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24854, title = "Polygon Marth",
    description = "All-Star Mode",
    start  = LB_Allstars("Polygon Marth") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24799, title = "Polygon Marth",
    description = "Home-Run Contest",
    start  = LB_Homerun("Polygon Marth") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 30432, title = "Sonic",
    description = "1P Game",
    start  = LB_1PGame("Sonic") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30434, title = "Sonic",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Sonic") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30436, title = "Sonic",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Sonic") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 30438, title = "Sonic",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Sonic") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 30440, title = "Sonic",
    description = "All-Star Mode",
    start  = LB_Allstars("Sonic") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30498, title = "Sonic",
    description = "Home-Run Contest",
    start  = LB_Homerun("Sonic") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24906, title = "Polygon Sonic",
    description = "1P Game",
    start  = LB_1PGame("Polygon Sonic") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24853, title = "Polygon Sonic",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Polygon Sonic") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 115259, title = "Polygon Sonic",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Polygon Sonic") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 115260, title = "Polygon Sonic",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Polygon Sonic") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 115261, title = "Polygon Sonic",
    description = "All-Star Mode",
    start  = LB_Allstars("Polygon Sonic") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 115258, title = "Polygon Sonic",
    description = "Home-Run Contest",
    start  = LB_Homerun("Polygon Sonic") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 30433, title = "Super Sonic",
    description = "1P Game",
    start  = LB_1PGame("Super Sonic") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30435, title = "Super Sonic",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Fox") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30437, title = "Super Sonic",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Super Sonic") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 30439, title = "Super Sonic",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Super Sonic") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 30441, title = "Super Sonic",
    description = "All-Star Mode",
    start  = LB_Allstars("Super Sonic") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 30499, title = "Super Sonic",
    description = "Home-Run Contest",
    start  = LB_Homerun("Super Sonic") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24804, title = "Sheik",
    description = "1P Game",
    start  = LB_1PGame("Sheik") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 25989, title = "Sheik",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Sheik") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 25987, title = "Sheik",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Sheik") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 25985, title = "Sheik",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Sheik") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24937, title = "Sheik",
    description = "All-Star Mode",
    start  = LB_Allstars("Sheik") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24884, title = "Sheik",
    description = "Home-Run Contest",
    start  = LB_Homerun("Sheik") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 115268, title = "Polygon Sheik",
    description = "1P Game",
    start  = LB_1PGame("Polygon Sheik") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 115269, title = "Polygon Sheik",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Polygon Sheik") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 115270, title = "Polygon Sheik",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Polygon Sheik") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 115271, title = "Polygon Sheik",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Polygon Sheik") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 115272, title = "Polygon Sheik",
    description = "All-Star Mode",
    start  = LB_Allstars("Polygon Sheik") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 115273, title = "Polygon Sheik",
    description = "Home-Run Contest",
    start  = LB_Homerun("Polygon Sheik") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24830, title = "Marina",
    description = "1P Game",
    start  = LB_1PGame("Marina") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24936, title = "Marina",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Marina") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24883, title = "Marina",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Marina") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24829, title = "Marina",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Marina") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24935, title = "Marina",
    description = "All-Star Mode",
    start  = LB_Allstars("Marina") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24882, title = "Marina",
    description = "Home-Run Contest",
    start  = LB_Homerun("Marina") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 115274, title = "Polygon Marina",
    description = "1P Game",
    start  = LB_1PGame("Polygon Marina") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 115275, title = "Polygon Marina",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Polygon Marina") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 115276, title = "Polygon Marina",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Polygon Marina") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 115277, title = "Polygon Marina",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Polygon Marina") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 115278, title = "Polygon Marina",
    description = "All-Star Mode",
    start  = LB_Allstars("Polygon Marina") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 115279, title = "Polygon Marina",
    description = "Home-Run Contest",
    start  = LB_Homerun("Polygon Marina") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24939, title = "King Dedede",
    description = "1P Game",
    start  = LB_1PGame("King Dedede") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24881, title = "King Dedede",
    description = "Remix 1P",
    start  = LB_Remix1PGame("King Dedede") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24828, title = "King Dedede",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("King Dedede") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24938, title = "King Dedede",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("King Dedede") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24885, title = "King Dedede",
    description = "All-Star Mode",
    start  = LB_Allstars("King Dedede") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24886, title = "King Dedede",
    description = "Home-Run Contest",
    start  = LB_Homerun("King Dedede") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 115304, title = "Polygon King Dedede",
    description = "1P Game",
    start  = LB_1PGame("Polygon King Dedede") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 115305, title = "Polygon King Dedede",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Polygon King Dedede") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 115306, title = "Polygon King Dedede",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Polygon King Dedede") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 115307, title = "Polygon King Dedede",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Polygon King Dedede") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 115308, title = "Polygon King Dedede",
    description = "All-Star Mode",
    start  = LB_Allstars("Polygon King Dedede") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 115309, title = "Polygon King Dedede",
    description = "Home-Run Contest",
    start  = LB_Homerun("Polygon King Dedede") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24934, title = "Goemon",
    description = "1P Game",
    start  = LB_1PGame("Goemon") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24880, title = "Goemon",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Goemon") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24827, title = "Goemon",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Goemon") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24933, title = "Goemon",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Goemon") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24879, title = "Goemon",
    description = "All-Star Mode",
    start  = LB_Allstars("Goemon") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24826, title = "Goemon",
    description = "Home-Run Contest",
    start  = LB_Homerun("Goemon") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 115310, title = "Polygon Goemon",
    description = "1P Game",
    start  = LB_1PGame("Polygon Goemon") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 115311, title = "Polygon Goemon",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Polygon Goemon") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 115312, title = "Polygon Goemon",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Polygon Goemon") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 115313, title = "Polygon Goemon",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Polygon Goemon") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 115314, title = "Polygon Goemon",
    description = "All-Star Mode",
    start  = LB_Allstars("Polygon Goemon") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 115315, title = "Polygon Goemon",
    description = "Home-Run Contest",
    start  = LB_Homerun("Polygon Goemon") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24932, title = "Peppy",
    description = "1P Game",
    start  = LB_1PGame("Peppy") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24878, title = "Peppy",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Peppy") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24825, title = "Peppy",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Peppy") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24931, title = "Peppy",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Peppy") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24877, title = "Peppy",
    description = "All-Star Mode",
    start  = LB_Allstars("Peppy") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24824, title = "Peppy",
    description = "Home-Run Contest",
    start  = LB_Homerun("Peppy") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24930, title = "Slippy",
    description = "1P Game",
    start  = LB_1PGame("Slippy") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24876, title = "Slippy",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Slippy") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24823, title = "Slippy",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Slippy") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24929, title = "Slippy",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Slippy") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24875, title = "Slippy",
    description = "All-Star Mode",
    start  = LB_Allstars("Slippy") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24822, title = "Slippy",
    description = "Home-Run Contest",
    start  = LB_Homerun("Slippy") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24928, title = "Banjo & Kazooie",
    description = "1P Game",
    start  = LB_1PGame("Banjo & Kazooie") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24874, title = "Banjo & Kazooie",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Banjo & Kazooie") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24821, title = "Banjo & Kazooie",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Banjo & Kazooie") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24927, title = "Banjo & Kazooie",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Banjo & Kazooie") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24873, title = "Banjo & Kazooie",
    description = "All-Star Mode",
    start  = LB_Allstars("Banjo & Kazooie") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24820, title = "Banjo & Kazooie",
    description = "Home-Run Contest",
    start  = LB_Homerun("Banjo & Kazooie") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 115316, title = "Polygon Banjo & Kazooie",
    description = "1P Game",
    start  = LB_1PGame("Polygon Banjo & Kazooie") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 115317, title = "Polygon Banjo & Kazooie",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Polygon Banjo & Kazooie") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 115318, title = "Polygon Banjo & Kazooie",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Polygon Banjo & Kazooie") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 115319, title = "Polygon Banjo & Kazooie",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Polygon Banjo & Kazooie") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 115320, title = "Polygon Banjo & Kazooie",
    description = "All-Star Mode",
    start  = LB_Allstars("Polygon Banjo & Kazooie") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 115321, title = "Polygon Banjo & Kazooie",
    description = "Home-Run Contest",
    start  = LB_Homerun("Polygon Banjo & Kazooie") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24926, title = "Ebisumaru",
    description = "1P Game",
    start  = LB_1PGame("Ebisumaru") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24872, title = "Ebisumaru",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Ebisumaru") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24819, title = "Ebisumaru",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Ebisumaru") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24925, title = "Ebisumaru",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Ebisumaru") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24871, title = "Ebisumaru",
    description = "All-Star Mode",
    start  = LB_Allstars("Ebisumaru") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24818, title = "Ebisumaru",
    description = "Home-Run Contest",
    start  = LB_Homerun("Ebisumaru") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24924, title = "Metal Luigi",
    description = "1P Game",
    start  = LB_1PGame("Metal Luigi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24870, title = "Metal Luigi",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Metal Luigi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24817, title = "Metal Luigi",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Metal Luigi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24923, title = "Metal Luigi",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Metal Luigi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24869, title = "Metal Luigi",
    description = "All-Star Mode",
    start  = LB_Allstars("Metal Luigi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24816, title = "Metal Luigi",
    description = "Home-Run Contest",
    start  = LB_Homerun("Metal Luigi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 24922, title = "Dragon King",
    description = "1P Game",
    start  = LB_1PGame("Dragon King") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24868, title = "Dragon King",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Dragon King") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24815, title = "Dragon King",
    description = "Multi-Man Mode",
    start  = LB_MultiMan("Dragon King") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24921, title = "Dragon King",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiMan("Dragon King") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 24867, title = "Dragon King",
    description = "All-Star Mode",
    start  = LB_Allstars("Dragon King") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24814, title = "Dragon King",
    description = "Home-Run Contest",
    start  = LB_Homerun("Dragon King") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_HomerunDistance),
    format = "FIXED1"
)

leaderboard(
    id = 115322, title = "Master Hand",
    description = "1P Game",
    start  = LB_1PGame("Master Hand") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 115323, title = "Master Hand",
    description = "Remix 1P",
    start  = LB_Remix1PGame("Master Hand") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 115324, title = "Master Hand",
    description = "Multi-Man Mode",
    start  = LB_MultiManHealth("Master Hand") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 115325, title = "Master Hand",
    description = "Cruel Multi-Man Mode",
    start  = LB_CruelMultiManHealth("Master Hand") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = dword(Mem_MultiManKills),
    format = "VALUE"
)

leaderboard(
    id = 115326, title = "Master Hand",
    description = "All-Star Mode",
    start  = LB_Allstars("Master Hand") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = NormalModeScore(),
    format = "VALUE"
)

leaderboard(
    id = 24658, title = "Bonus 1: Break The Targets - Stage 1",
    description = "Stage of Mario / Metal Mario",
    start  = LB_Bonus1("Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24659, title = "Bonus 1: Break The Targets - Stage 2",
    description = "Stage of Fox / Peppy",
    start  = LB_Bonus1("Fox") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24660, title = "Bonus 1: Break The Targets - Stage 3",
    description = "Stage of Donkey Kong",
    start  = LB_Bonus1("Donkey Kong") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 25990, title = "Bonus 1: Break The Targets - Stage 4",
    description = "Stage of Samus",
    start  = LB_Bonus1("Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24779, title = "Bonus 1: Break The Targets - Stage 5",
    description = "Stage of Luigi / Metal Luigi",
    start  = LB_Bonus1("Luigi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24834, title = "Bonus 1: Break The Targets - Stage 6",
    description = "Stage of Link",
    start  = LB_Bonus1("Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES"
)

leaderboard(
    id = 24887, title = "Bonus 1: Break The Targets - Stage 7",
    description = "Stage of Yoshi",
    start  = LB_Bonus1("Yoshi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24780, title = "Bonus 1: Break The Targets - Stage 8",
    description = "Stage of Captain Falcon / Dragon King",
    start  = LB_Bonus1("Captain Falcon") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24835, title = "Bonus 1: Break The Targets - Stage 9",
    description = "Stage of Kirby",
    start  = LB_Bonus1("Kirby") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24888, title = "Bonus 1: Break The Targets - Stage 10",
    description = "Stage of Pikachu",
    start  = LB_Bonus1("Pikachu") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24781, title = "Bonus 1: Break The Targets - Stage 11",
    description = "Stage of Jigglypuff",
    start  = LB_Bonus1("Jigglypuff") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24836, title = "Bonus 1: Break The Targets - Stage 12",
    description = "Stage of Ness",
    start  = LB_Bonus1("Ness") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24889, title = "Bonus 1: Break The Targets - Stage 13",
    description = "Stage of Falco / Slippy",
    start  = LB_Bonus1("Falco") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24782, title = "Bonus 1: Break The Targets - Stage 14",
    description = "Stage of Ganondorf",
    start  = LB_Bonus1("Ganondorf") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24837, title = "Bonus 1: Break The Targets - Stage 15",
    description = "Stage of Young Link",
    start  = LB_Bonus1("Young Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24890, title = "Bonus 1: Break The Targets - Stage 16",
    description = "Stage of Dr. Mario",
    start  = LB_Bonus1("Dr. Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24783, title = "Bonus 1: Break The Targets - Stage 17",
    description = "Stage of Wario",
    start  = LB_Bonus1("Wario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24838, title = "Bonus 1: Break The Targets - Stage 18",
    description = "Stage of Dark Samus",
    start  = LB_Bonus1("Dark Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24891, title = "Bonus 1: Break The Targets - Stage 19",
    description = "Stage of Lucas",
    start  = LB_Bonus1("Lucas") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES"
)

leaderboard(
    id = 24784, title = "Bonus 1: Break The Targets - Stage 20",
    description = "Stage of Bowser / Giga Bowser",
    start  = LB_Bonus1("Bowser") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24839, title = "Bonus 1: Break The Targets - Stage 21",
    description = "Stage of Wolf",
    start  = LB_Bonus1("Wolf") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24892, title = "Bonus 1: Break The Targets - Stage 22",
    description = "Stage of Conker",
    start  = LB_Bonus1("Conker") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24785, title = "Bonus 1: Break The Targets - Stage 23",
    description = "Stage of Mewtwo",
    start  = LB_Bonus1("Mewtwo") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24840, title = "Bonus 1: Break The Targets - Stage 24",
    description = "Stage of Marth",
    start  = LB_Bonus1("Marth") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24893, title = "Bonus 1: Break The Targets - Stage 25",
    description = "Stage of Sonic / Super Sonic",
    start  = LB_Bonus1("Sonic") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24786, title = "Bonus 1: Break The Targets - Stage 26",
    description = "Stage of Sheik",
    start  = LB_Bonus1("Sheik") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24841, title = "Bonus 1: Break The Targets - Stage 27",
    description = "Stage of Marina",
    start  = LB_Bonus1("Marina") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24895, title = "Bonus 1: Break The Targets - Stage 28",
    description = "Stage of King Dedede",
    start  = LB_Bonus1("King Dedede") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24842, title = "Bonus 1: Break The Targets - Stage 29",
    description = "Stage of Goemon / Ebisumaru",
    start  = LB_Bonus1("Goemon") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24787, title = "Bonus 1: Break The Targets - Stage 30",
    description = "Stage of Banjo & Kazooie",
    start  = LB_Bonus1("Banjo & Kazooie"),
    cancel = always_false() &&
              RulesCommunity(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24894, title = "Bonus 1: Break The Targets - Stage 31",
    description = "Stage of Polygon Team / Mad Piano",
    start  = LB_Bonus1("Polygon Team") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24788, title = "Bonus 2: Break The Targets - Stage 1",
    description = "Stage of Mario / Metal Mario",
    start  = LB_Bonus2("Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24843, title = "Bonus 2: Break The Targets - Stage 2",
    description = "Stage of Fox / Peppy Mario",
    start  = LB_Bonus2("Fox") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24896, title = "Bonus 2: Break The Targets - Stage 3",
    description = "Stage of Donkey Kong",
    start  = LB_Bonus2("Donkey Kong") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24789, title = "Bonus 2: Break The Targets - Stage 4",
    description = "Stage of Samus",
    start  = LB_Bonus2("Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24844, title = "Bonus 2: Break The Targets - Stage 5",
    description = "Stage of Luigi / Metal Luigi",
    start  = LB_Bonus2("Luigi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24897, title = "Bonus 2: Break The Targets - Stage 6",
    description = "Stage of Link",
    start  = LB_Bonus2("Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24790, title = "Bonus 2: Break The Targets - Stage 7",
    description = "Stage of Yoshi",
    start  = LB_Bonus2("Yoshi") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24845, title = "Bonus 2: Break The Targets - Stage 8",
    description = "Stage of Captain Falcon / Dragon King",
    start  = LB_Bonus2("Captain Falcon") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24898, title = "Bonus 2: Break The Targets - Stage 9",
    description = "Stage of Kirby",
    start  = LB_Bonus2("Kirby") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24791, title = "Bonus 2: Break The Targets - Stage 10",
    description = "Stage of Pikachu",
    start  = LB_Bonus2("Pikachu") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24846, title = "Bonus 2: Break The Targets - Stage 11",
    description = "Stage of Jigglypuff",
    start  = LB_Bonus2("Jigglypuff") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24899, title = "Bonus 2: Break The Targets - Stage 12",
    description = "Stage of Ness",
    start  = LB_Bonus2("Ness") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24792, title = "Bonus 2: Break The Targets - Stage 13",
    description = "Stage of Falco / Slippy",
    start  = LB_Bonus2("Falco") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24847, title = "Bonus 2: Break The Targets - Stage 14",
    description = "Stage of Ganondorf",
    start  = LB_Bonus2("Ganondorf") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24900, title = "Bonus 2: Break The Targets - Stage 15",
    description = "Stage of Young Link",
    start  = LB_Bonus2("Young Link") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24793, title = "Bonus 2: Break The Targets - Stage 16",
    description = "Stage of Dr. Mario",
    start  = LB_Bonus2("Dr. Mario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24848, title = "Bonus 2: Break The Targets - Stage 17",
    description = "Stage of Wario",
    start  = LB_Bonus2("Wario") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24901, title = "Bonus 2: Break The Targets - Stage 18",
    description = "Stage of Dark Samus",
    start  = LB_Bonus2("Dark Samus") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24794, title = "Bonus 2: Break The Targets - Stage 19",
    description = "Stage of Lucas",
    start  = LB_Bonus2("Lucas") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24849, title = "Bonus 2: Break The Targets - Stage 20",
    description = "Stage of Bowser / Giga Bowser",
    start  = LB_Bonus2("Bowser") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)


leaderboard(
    id = 24902, title = "Bonus 2: Break The Targets - Stage 21",
    description = "Stage of Wolf",
    start  = LB_Bonus2("Wolf") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24795, title = "Bonus 2: Break The Targets - Stage 22",
    description = "Stage of Conker",
    start  = LB_Bonus2("Conker") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24850, title = "Bonus 2: Break The Targets - Stage 23",
    description = "Stage of Mewtwo",
    start  = LB_Bonus2("Mewtwo") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24903, title = "Bonus 2: Break The Targets - Stage 24",
    description = "Stage of Marth",
    start  = LB_Bonus2("Marth") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24796, title = "Bonus 2: Break The Targets - Stage 25",
    description = "Stage of Sonic / Super Sonic",
    start  = LB_Bonus2("Sonic") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24851, title = "Bonus 2: Break The Targets - Stage 26",
    description = "Stage of Sheik",
    start  = LB_Bonus2("Sheik") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24904, title = "Bonus 2: Break The Targets - Stage 27",
    description = "Stage of Marina",
    start  = LB_Bonus2("Marina") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24797, title = "Bonus 2: Break The Targets - Stage 28",
    description = "Stage of King Dedede",
    start  = LB_Bonus2("King Dedede") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24852, title = "Bonus 2: Break The Targets - Stage 29",
    description = "Stage of Goemon / Ebisumaru",
    start  = LB_Bonus2("Goemon") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24905, title = "Bonus 2: Break The Targets - Stage 30",
    description = "Stage of Banjo & Kazooie",
    start  = LB_Bonus2("Banjo & Kazooie") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 24798, title = "Bonus 2: Break The Targets - Stage 31",
    description = "Stage of Polygon Team / Mad Piano",
    start  = LB_Bonus2("Polygon Team") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus12Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 25988, title = "Bonus 3: Race To The Finish - Stage 1",
    description = "Normal Stage",
    start  = LB_Bonus3("Normal") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus3Timer(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 25986, title = "Bonus 3: Race To The Finish - Stage 2",
    description = "Remix Stage",
    start  = LB_Bonus3("Remix") &&
              RulesCommunity(),
    cancel = always_false(),
    submit = always_true(),
    value  = Bonus3Timer(),
    format = "FRAMES",
    lower_is_better = true
)
