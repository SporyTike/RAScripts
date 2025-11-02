// LEGO Harry Potter Potter: Years 1-4
// #ID = 11077

//--------------------------------------------------
// Addresses

mapID            = 0x00868a38
levelID          = 0x008628d8
levelMode        = 0x0086865c
pointerMapString = 0x00857904
pointerChar1     = 0x0085a4a8
pointerBoss      = 0x00868BE0
savedTransition  = 0x00859630
initialCharacter = 0x0085a4e8
brickEventFlags  = 0x100833DC
extrasUnlocked   = 0x10084E19

//--------------------------------------------------
// Values / Arrays / Dictionaries

mapIDs = {
    0x35: "in the Bonus Level: Harry Potter's Destiny",
    0x36: "in the Bonus Level: Harry Potter's Destiny",
    0x37: "in the Bonus Level: Harry Potter's Destiny",
    0x39: "Titlescreen",
    0x3A: "Intro",
    0x3B: "Credits",
    0x3D: "in Little Whinging",
    0x3E: "in Little Whinging",
    0x3F: "driving to the Hut-on-the-Rock",
    0x40: "in the Hut-on-the-Rock",
    0x41: "in front of the Leaky Cauldron",
    0x42: "in the Leaky Cauldron",
    0x43: "in the Diagon Alley",
    0x44: "in Gringotts Vault",
    0x45: "in the Knockturn Alley",
    0x46: "in Madam Malkin's Robes",
    0x47: "in the Leaky Cauldron",
    0x48: "in the Diagon Alley",
    0x49: "in Gringotts Wizarding Bank",
    0x4A: "in Gringotts Vault",
    0x4B: "in the Level 1 Results Screen",
    0x4C: "in the King's Cross Station",
    0x4D: "at the Hogsmeade Station",
    0x4E: "in the Great Hall",
    0x4F: "in the Grand Staircase",
    0x51: "in the Main Foyer",
    0x52: "on the Covered Bridge",
    0x53: "in Hagrid's Hut",
    0x54: "near Hagrid's Hut",
    0x55: "in the Forbidden Forest",
    0x56: "in the Forbidden Forest",
    0x57: "in the Forbidden Forest",
    0x58: "in the Forbidden Forest",
    0x59: "in the Grand Staircase",
    0x5A: "in the Level 5 Result Screen",
    0x5B: "on the Quidditch Field",
    0x5C: "near the Quidditch Field",
    0x5D: "on the Quidditch Field Stand",
    0x5E: "on the Level 3 Result Screen",
    0x5F: "on the Quidditch Field Stand",
    0x60: "in the Class Foyer",
    0x61: "in the Charms Class",
    0x62: "in the Lumos Class",
    0x64: "in the Potions Class",
    0x65: "in the Transfiguration Class",
    0x66: "in the Clock Tower Courtyard",
    0x67: "in the Training Grounds",
    0x68: "in Herbology Class",
    0x69: "in the Main Corridor",
    0x6A: "in the Great Hall",
    0x6C: "in the Girl's Bathroom Corridor",
    0x6D: "in the Girl's Bathroom",
    0x6E: "in the Level 2 Results Screen",
    0x6F: "in the Grand Staircase",
    0x70: "in Fluffy's Room",
    0x71: "the Devil's Snare Room",
    0x72: "in the Chess Room",
    0x73: "at the Mirror of Erised",
    0x74: "at the Mirror of Erised",
    0x75: "in the Level 6 Result Screen",
    0x76: "in the Gryffindor Dorm",
    0x77: "in the Grand Staircase",
    0x78: "in the Library",
    0x79: "in the Library",
    0x7A: "in the Restricted Section",
    0x7B: "on the Level 4 Result Screen",
    0x7C: "in the Dorm Hallway",
    0x7D: "in the Class Foyer",
    0x7E: "in the Gryffindor Dorm",
    0x7F: "in the Gryffindor Dorm",
    0x80: "in the Hospital Wing",
    0x81: "in Little Whinging",
    0x82: "in Little Whinging",
    0x83: "in Little Whinging",
    0x84: "inside the Burrow",
    0x85: "at the Burrow",
    0x86: "in Borgin & Burkes",
    0x87: "in the Knockturn Alley",
    0x88: "in the Diagon Alley",
    0x89: "in the King's Cross Station",
    0x8A: "following the Hogwarts Express",
    0x8B: "arriving in Hogwarts",
    0x8C: "arriving in Hogwarts",
    0x8D: "in the Level 7 Result Screen",
    0x8E: "in the Main Foyer",
    0x8F: "near Hagrid's Hut",
    0x90: "in Hagrid's Garden",
    0x91: "in Hagrid's Hut",
    0x92: "in the Forbidden Forest",
    0x93: "in Aragog's Nest",
    0x94: "in the Forbidden Forest",
    0x95: "in the Level 11 Result Screen",
    0x96: "in the Forbidden Forest",
    0x97: "in the Grand Staircase",
    0x98: "near the Quidditch Field",
    0x99: "on the Quidditch Field",
    0x9A: "on the Quidditch Field Stand",
    0x9B: "on the Quidditch Field Stand",
    0x9C: "on the Quidditch Field Stand",
    0x9D: "in the Hospital Wing",
    0x9E: "in the Level 8 Result Screen",
    0x9F: "in the Class Foyer",
    0xA0: "in the Main Foyer",
    0xA1: "in the Potions Class",
    0xA2: "in the Defence Against the Dark Arts Class",
    0xA3: "in the Defence Against the Dark Arts Class",
    0xA4: "in the Bathroom Corridor",
    0xA5: "in the Moaning Bathroom",
    0xA6: "in the Corridor of Secrets",
    0xA7: "in the Chamber of Secrets",
    0xA8: "in the Level 12 Result Screen",
    0xA9: "in the Clock Tower Courtyard",
    0xAA: "in the Training Grounds",
    0xAB: "in Herbology Class",
    0xAC: "in the Main Corridor",
    0xAD: "in the Great Hall",
    0xAE: "in the Great Hall",
    0xAF: "in the Bathroom Corridor",
    0xB0: "in the Moaning Bathroom",
    0xB1: "in the Slytherin Dorm",
    0xB2: "in the Slytherin Dorm",
    0xB3: "in the Level 9 Result Screen",
    0xB4: "in the Moaning Bathroom",
    0xB5: "in Tom Riddle's Diary",
    0xB6: "in Tom Riddle's Diary",
    0xB7: "in the Moaning Bathroom",
    0xB8: "in the Level 10 Result Screen",
    0xB9: "in the Bathroom Corridor",
    0xBA: "in the Hospital Wing",
    0xBB: "in the Bathroom Corridor",
    0xBC: "in the Slytherin Dorm",
    0xBD: "in the Grand Staircase",
    0xBE: "in the Dorm Hallway",
    0xBF: "in the Gryffindor Dorm",
    0xC0: "in the Hufflepuff Dorm",
    0xC1: "in Professor Dumbledore's Office",
    0xC2: "in the Clock Tower Courtyard",
    0xC3: "in the Great Hall",
    0xC4: "in Little Whinging",
    0xC5: "in Little Whinging",
    0xC6: "in the Knight Bus",
    0xC7: "in the Leaky Cauldron",
    0xC8: "in the Leaky Cauldron",
    0xC9: "in the King's Cross Station",
    0xCB: "in the Hogwarts Express",
    0xCC: "in the Level 13 Result Screen",
    0xCD: "in the Great Hall",
    0xCE: "in the Main Foyer",
    0xCF: "near Hagrid's Hut",
    0xD0: "in Hagrid's Hut",
    0xD1: "at the Whomping Willow",
    0xD2: "below the Whomping Willow",
    0xD3: "in the Skrieking Shack",
    0xD4: "in the Forbidden Forest",
    0xD5: "in the Forbidden Forest",
    0xD6: "in the Forbidden Forest",
    0xD7: "in the Hospital Wing",
    0xD8: "in the Level 16 Result Screen",
    0xD9: "in the Forbidden Forest",
    0xDA: "in Hagrid's Garden",
    0xDB: "in Hagrid's Garden",
    0xDC: "near the Quidditch Field",
    0xDD: "near the Quidditch Field",
    0xDE: "in the Class Foyer",
    0xDF: "in the Defence Against the Dark Arts Class",
    0xE0: "in the Defence Against the Dark Arts Class",
    0xE1: "in the Divination Class",
    0xE3: "in the Training Grounds",
    0xE4: "in the Clock Tower Courtyard",
    0xE5: "at the Owl Tower",
    0xE6: "at the Owl Tower",
    0xE7: "in the Clock Tower",
    0xE8: "in the Clock Tower",
    0xE9: "in the Hospital Wing",
    0xEA: "in Hagrid's Garden",
    0xEB: "in the Forbidden Forest",
    0xEC: "in the Forbidden Forest",
    0xED: "in the Transfiguration Courtyard",
    0xEE: "in the Transfiguration Courtyard",
    0xEF: "in the Level 17 Result Screen",
    0xF0: "on the Hogwarts Castle Walls",
    0xF1: "on the Hogwarts Castle Walls",
    0xF2: "on the Hogwarts Castle Walls",
    0xF3: "on the Hogwarts Castle Walls",
    0xF4: "on the Hogwarts Castle Walls",
    0xF5: "on the Hogwarts Castle Walls",
    0xF6: "in the Level 18 Result Screen",
    0xF7: "in the Main Corridor",
    0xF8: "in the Great Hall",
    0xF9: "in the Bathroom Corridor",
    0xFA: "in the One-Eyed Witch Passage",
    0xFB: "in Hogsmeade",
    0xFC: "in Hogsmeade",
    0xFD: "in the Three Broomsticks Inn",
    0xFE: "in the Level 14 Result Screen",
    0xFF: "in the Grand Staircase",
    0x100: "in the Library",
    0x101: "in the Dorm Hallway",
    0x102: "in the Gryffindor Dorm",
    0x103: "in the Gryffindor Dome",
    0x104: "in the Gryffindor Dorm",
    0x105: "in a Hogwarts Corridor",
    0x106: "in a Hogwarts Corridor",
    0x107: "in the Level 15 Result Screen",
    0x108: "in the Ravenclaw Dorm",
    0x109: "in the Hufflepuff Dorm",
    0x10A: "in the Defence Against the Dark Arts Class",
    0x10B: "in the Great Hall",
    0x10C: "in the Transfiguration Courtyard",
    0x10D: "flying around Hogwarts",
    0x10E: "in Little Hangleton",
    0x10F: "near the Quidditch World Cup",
    0x110: "near the Quidditch World Cup",
    0x111: "near the Quidditch World Cup",
    0x112: "near the Quidditch World Cup",
    0x113: "near the Quidditch World Cup",
    0x114: "near the Quidditch World Cup",
    0x115: "in the Level 19 Result Screen",
    0x116: "arriving in Hogwarts",
    0x117: "in the Great Hall",
    0x118: "in the Main Foyer",
    0x119: "near Hagrid's Hut",
    0x11A: "in Hagrid's Garden",
    0x11B: "in the Forbidden Forest",
    0x11C: "in the Forbidden Forest",
    0x11D: "in the Forbidden Forest",
    0x11E: "in the Level 20 Result Screen",
    0x11F: "near the Dragon Task",
    0x120: "in the Dragon Task",
    0x121: "flying around Hogwarts",
    0x122: "on the Hogwarts Castle Walls",
    0x123: "flying around Hogwarts",
    0x124: "in the Dragon Task",
    0x125: "in the Gryffindor Dorm",
    0x126: "in the Level 21 Result Screen",
    0x127: "on the Covered Bridge",
    0x128: "near the Quidditch Field",
    0x129: "in Hagrid's Garden",
    0x12A: "at the Black Lake",
    0x12B: "at the Black Lake",
    0x12C: "in the Black Lake",
    0x12D: "in the Black Lake",
    0x12F: "in the Black Lake",
    0x130: "at the Black Lake",
    0x131: "in the Level 23 Result Screen",
    0x132: "in Professor Dumbledore's Office",
    0x133: "in the Labyrinth Maze",
    0x134: "in the Labyrinth Maze",
    0x135: "in the Labyrinth Maze",
    0x136: "Little Hangleton",
    0x137: "at the Labyrinth Maze",
    0x138: "in the Defence Against the Dark Arts Class",
    0x139: "in the Level 24 Result Screen",
    0x13A: "in the Class Foyer",
    0x13B: "in the Potions Class",
    0x13C: "in the Defence Against the Dark Arts Class",
    0x13D: "in the Training Grounds",
    0x13E: "in the Training Grounds",
    0x13F: "at the Owl Tower",
    0x140: "in the Clock Tower",
    0x141: "in the Main Corridor",
    0x142: "in the Great Hall",
    0x143: "in the Great Hall",
    0x144: "in the Bathroom Corridor",
    0x145: "in the Prefects' Bathroom",
    0x146: "in the Prefects' Bathroom",
    0x147: "in the Level 22 Result Screen",
    0x148: "in the Grand Staircase",
    0x149: "in the Library",
    0x14A: "in the Muggle Room",
    0x14B: "in Professor Dumbledore's Office",
    0x14C: "in the Dorm Hallway",
    0x14D: "in the Gryffindor Dorm",
    0x14E: "in the Slytherin Dorm",
    0x14F: "in the Ravenclaw Dorm",
    0x150: "in the Hufflepuff Dorm",
    0x151: "in the Transfiguration Courtyard",
    0x152: "in Gringotts Bonus Level 1",
    0x153: "in Gringotts Bonus Level 2",
    0x154: "in Gringotts Bonus Level 3",
    0x155: "in Gringotts Bonus Level 4",
    0x156: "in Gringotts Bonus Level 5",
    0x157: "in Gringotts Bonus Level 6",
    0x158: "in Gringotts Bonus Level 7",
    0x159: "in Gringotts Bonus Level 8",
    0x15A: "in Gringotts Bonus Level 9",
    0x15B: "in Gringotts Bonus Level 10",
    0x15E: "in Builder Level 1",
    0x15F: "in Builder Level 2",
    0x160: "in Builder Level 3",
    0x161: "in Builder Level 4",
}

levelIDs = {
    0x01: "Level 1: The Magic Begins",
    0x06: "Level 2: Out of the Dungeon",
    0x07: "Level 3: A Jinxed Broom",
    0x0A: "Level 4: The Restricted Section",
    0x08: "Level 5: The Forbidden Forest",
    0x0B: "Level 6: Face of the Enemy",
    0x0C: "Level 7: Floo Powder!",
    0x10: "Level 8: Dobby's Plan",
    0x11: "Level 9: Crabbe and Goyle",
    0x13: "Level 10: Tom Riddle's Diary",
    0x14: "Level 11: Follow the Spiders",
    0x15: "Level 12: The Basilisk",
    0x16: "Level 13: News From Azkaban",
    0x18: "Level 14: Hogsmeade",
    0x19: "Level 15: Mischief Managed",
    0x1A: "Level 16: The Shrieking Shack",
    0x1B: "Level 17: Dementor's Kiss",
    0x1C: "Level 18: The Dark Tower",
    0x1D: "Level 19: The Quidditch World Cup",
    0x1F: "Level 20: Dragons",
    0x20: "Level 21: The First Task",
    0x22: "Level 22: Secret of the Egg",
    0x23: "Level 23: The Black Lake",
    0x24: "Level 24: The Dark Lord Returns",
}

levelModes = {
    0x00: "Story",
    0x01: "Free Play",
}

useMapHashes = {
    0x43: "in the Diagon Alley",
    0x45: "in the Knockturn Alley",
    0x51: "in the Main Foyer",
    0x52: "near Hagrid's Hut",
    0x60: "in the Class Foyer",
    0x66: "in the Training Grounds",
    0x7C: "in the Dorm Hallway",
    0x8E: "in the Main Foyer",
    0x8F: "near Hagrid's Hut",
    0x9F: "in the Class Foyer",
    0xA9: "in the Clock Tower Courtyard",
    0xAF: "in the Bathroom Corridor",
    0xBE: "in the Dorm Hallway",
    0xCE: "in the Main Foyer",
    0xCF: "near Hagrid's Hut",
    0xDE: "in the Class Foyer",
    0xDF: "in the Defence Against the Dark Arts Class",
    0xE2: "in the Clock Tower Courtyard",
    0xE3: "in the Clock Tower Courtyard",
    0xF9: "in the Bathroom Corridor",
    0x101: "in the Dorm Hallway",
    0x118: "in the Main Foyer",
    0x119: "near Hagrid's Hut",
    0x13A: "in the Class Foyer",
    0x13B: "in the Potions Class",
    0x13D: "in the Training Grounds",
    0x144: "in the Bathroom Corridor",
    0x14C: "in the Dorm Hallway",
}

mapHashes = {
    // 
    0x43000000: "in the Diagon Alley",
    // DIAG2GRING
    0x43179390: "in the Diagon Alley",
    // DIAGON2KNOCKTUR
    0x432C08DD: "in the Diagon Alley",
    // DIAGON2LEAKY
    0x4318BEEC: "in the Diagon Alley",
    // KNOCKTURN2DIAGO
    0x431C37DE: "in the Diagon Alley",
    // LEAKY2DIAGON
    0x430ED4E2: "in the Diagon Alley",
    // OWL2STREET
    0x430F9E77: "in the Diagon Alley",
    // ROBE2STREET
    0x4317EA97: "in the Diagon Alley",
    // CUSTOMISER2ROBE
    0x431713F9: "in Madam Malkin's Robes",
    // ROBE2CUSTOMISER
    0x432736E1: "in Madam Malkin's Robes",
    // STREET2ROBE
    0x430AC997: "in Madam Malkin's Robes",
    // STREET2OWL
    0x43148494: "in Eeylops Owl Emporium",
    // OWL2TOWER
    0x4316A377: "in Eeylops Owl Emporium",
    // TOWER2OWL
    0x4311A69C: "in Eeylops Owl Emporium",
    // STREET2CAULDRON
    0x431D1ECC: "in Wiseacre's Wizarding Supplies",
    // 
    0x45000000: "in the Knockturn Alley",
    // DIAGON2KNOCKTUR
    0x452C08DD: "in the Knockturn Alley",
    // borgins2street
    0x452657FE: "in the Knockturn Alley",
    // KNOCKTURN2DIAGO
    0x451C37DE: "in the Knockturn Alley",
    // knockturn2Voldemort
    0x4519A0B1: "in in Borgin & Burkes",
    // street2Borgins
    0x450E0C10: "in in Borgin & Burkes",
    //
    0x51000000: "in the Main Foyer",
    0x8E000000: "in the Main Foyer",
    0xCE000000: "in the Main Foyer",
    0x18000000: "in the Main Foyer",
    // ARCHWAYS2FOYER
    0x510BEBF4: "in the Main Foyer",
    0x8E0BEBF4: "in the Main Foyer",
    0xCE0BEBF4: "in the Main Foyer",
    0x180BEBF4: "in the Main Foyer",
    // CLASSFOYER
    0x511490AC: "in the Main Foyer",
    0x8E1490AC: "in the Main Foyer",
    0xCE1490AC: "in the Main Foyer",
    0x181490AC: "in the Main Foyer",
    // FOYERLIBRARY
    0x511CF4E0: "in the Main Foyer",
    0x8E1CF4E0: "in the Main Foyer",
    0xCE1CF4E0: "in the Main Foyer",
    0x181CF4E0: "in the Main Foyer",
    // FOYERMAINCORR
    0x511FE9E0: "in the Main Foyer",
    0x8E1FE9E0: "in the Main Foyer",
    0xCE1FE9E0: "in the Main Foyer",
    0x181FE9E0: "in the Main Foyer",
    // FOYERSTAIRS
    0x51150086: "in the Main Foyer",
    0x8E150086: "in the Main Foyer",
    0xCE150086: "in the Main Foyer",
    0x18150086: "in the Main Foyer",
    // Y1FOYER_START
    0x510ADA00: "in the Main Foyer",
    0x8E0ADA00: "in the Main Foyer",
    0xCE0ADA00: "in the Main Foyer",
    0x180ADA00: "in the Main Foyer",
    // CEDRIC
    0x51084452: "in the Entrance Courtyard",
    0x8E084452: "in the Entrance Courtyard",
    0xCE084452: "in the Entrance Courtyard",
    0x18084452: "in the Entrance Courtyard",
    // FOYER2ARCHWAYS
    0x511CF1D8: "in the Entrance Courtyard",
    0x8E1CF1D8: "in the Entrance Courtyard",
    0xCE1CF1D8: "in the Entrance Courtyard",
    0x181CF1D8: "in the Entrance Courtyard",
    // FOYERGROUNDS
    0x5124EFE7: "in the Entrance Courtyard",
    0x8E24EFE7: "in the Entrance Courtyard",
    0xCE24EFE7: "in the Entrance Courtyard",
    0x1824EFE7: "in the Entrance Courtyard",
    // OUTSIDE2WIPE
    0x5112E9CA: "in the Entrance Courtyard",
    0x8E12E9CA: "in the Entrance Courtyard",
    0xCE12E9CA: "in the Entrance Courtyard",
    0x1812E9CA: "in the Entrance Courtyard",
    // QUADFOYER
    0x51149A89: "in the Entrance Courtyard",
    0x8E149A89: "in the Entrance Courtyard",
    0xCE149A89: "in the Entrance Courtyard",
    0x18149A89: "in the Entrance Courtyard",
    // QuadFoyer
    0x5114DAC9: "in the Entrance Courtyard",
    0x8E14DAC9: "in the Entrance Courtyard",
    0xCE14DAC9: "in the Entrance Courtyard",
    0x1814DAC9: "in the Entrance Courtyard",
    // WIPE2OUTSIDE
    0x5121E9DE: "in the Entrance Courtyard",
    0x8E21E9DE: "in the Entrance Courtyard",
    0xCE21E9DE: "in the Entrance Courtyard",
    0x1821E9DE: "in the Entrance Courtyard",
    // 
    0x52000000: "near Hagrid's Hut",
    0x8F000000: "near Hagrid's Hut",
    0xCF000000: "near Hagrid's Hut",
    0x19000000: "near Hagrid's Hut",
    // bridge2main
    0x521109D1: "near Hagrid's Hut",
    0x8F1109D1: "near Hagrid's Hut",
    0xCF1109D1: "near Hagrid's Hut",
    0x191109D1: "near Hagrid's Hut",
    // GROUNDSBOATHOUSE
    0x520D4A24: "near Hagrid's Hut",
    0x8F0D4A24: "near Hagrid's Hut",
    0xCF0D4A24: "near Hagrid's Hut",
    0x190D4A24: "near Hagrid's Hut",
    // GROUNDSQUIDDITCH
    0x52142A32: "near Hagrid's Hut",
    0x8F142A32: "near Hagrid's Hut",
    0xCF142A32: "near Hagrid's Hut",
    0x19142A32: "near Hagrid's Hut",
    // GROUNDSY2GARDEN
    0x52133200: "near Hagrid's Hut",
    0x8F133200: "near Hagrid's Hut",
    0xCF133200: "near Hagrid's Hut",
    0x19133200: "near Hagrid's Hut",
    // TAMINGBUCKBEAK
    0x521ED1E3: "near Hagrid's Hut",
    0x8F1ED1E3: "near Hagrid's Hut",
    0xCF1ED1E3: "near Hagrid's Hut",
    0x191ED1E3: "near Hagrid's Hut",
    // Y1_FOREST
    0x5203A499: "near Hagrid's Hut",
    0x8F03A499: "near Hagrid's Hut",
    0xCF03A499: "near Hagrid's Hut",
    0x1903A499: "near Hagrid's Hut",
    // Y2_ARAGOG
    0x5203A690: "near Hagrid's Hut",
    0x8F03A690: "near Hagrid's Hut",
    0xCF03A690: "near Hagrid's Hut",
    0x1903A690: "near Hagrid's Hut",
    // Y3_SHACK
    0x5204A29E: "near Hagrid's Hut",
    0x8F04A29E: "near Hagrid's Hut",
    0xCF04A29E: "near Hagrid's Hut",
    0x1904A29E: "near Hagrid's Hut",
    // Y4_SPOTTING
    0x5221FAA7: "near Hagrid's Hut",
    0x8F21FAA7: "near Hagrid's Hut",
    0xCF21FAA7: "near Hagrid's Hut",
    0x1921FAA7: "near Hagrid's Hut",
    // Y4FIGHTSTORY
    0x521BECF5: "near Hagrid's Hut",
    0x8F1BECF5: "near Hagrid's Hut",
    0xCF1BECF5: "near Hagrid's Hut",
    0x191BECF5: "near Hagrid's Hut",
    // CEDRIC
    0x52084452: "on the Covered Bridge",
    0x8F084452: "on the Covered Bridge",
    0xCF084452: "on the Covered Bridge",
    0x19084452: "on the Covered Bridge",
    // FOYERGROUNDS
    0x5224EFE7: "on the Covered Bridge",
    0x8F24EFE7: "on the Covered Bridge",
    0xCF24EFE7: "on the Covered Bridge",
    0x1924EFE7: "on the Covered Bridge",
    // GROUNDSquidditchTT
    0x52146A92: "on the Covered Bridge",
    0x8F146A92: "on the Covered Bridge",
    0xCF146A92: "on the Covered Bridge",
    0x19146A92: "on the Covered Bridge",
    // main2bridge
    0x520B40D7: "on the Covered Bridge",
    0x8F0B40D7: "on the Covered Bridge",
    0xCF0B40D7: "on the Covered Bridge",
    0x190B40D7: "on the Covered Bridge",
    // Y2NORRIS
    0x520497A2: "on the Covered Bridge",
    0x8F0497A2: "on the Covered Bridge",
    0xCF0497A2: "on the Covered Bridge",
    0x190497A2: "on the Covered Bridge",
    // 
    0x60000000: "in the Class Foyer",
    0x9F000000: "in the Class Foyer",
    0xDE000000: "in the Class Foyer",
    0x3A000000: "in the Class Foyer",
    // Charms
    0x600B6172: "in the Class Foyer",
    0x9F0B6172: "in the Class Foyer",
    0xDE0B6172: "in the Class Foyer",
    0x3A0B6172: "in the Class Foyer",
    // CLASSFOYER
    0x601490AC: "in the Class Foyer",
    0x9F1490AC: "in the Class Foyer",
    0xDE1490AC: "in the Class Foyer",
    0x3A1490AC: "in the Class Foyer",
    // DA_PATRONUM
    0x600AFE9F: "in the Class Foyer",
    0x9F0AFE9F: "in the Class Foyer",
    0xDE0AFE9F: "in the Class Foyer",
    0x3A0AFE9F: "in the Class Foyer",
    // DARK_ARTS3
    0x6005A49F: "in the Class Foyer",
    0x9F05A49F: "in the Class Foyer",
    0xDE05A49F: "in the Class Foyer",
    0x3A05A49F: "in the Class Foyer",
    // DarkArts
    0x6003E6DE: "in the Class Foyer",
    0x9F03E6DE: "in the Class Foyer",
    0xDE03E6DE: "in the Class Foyer",
    0x3A03E6DE: "in the Class Foyer",
    // LeftHALL1 + LeftHALL2
    0x6006B2C0: "in the Class Foyer",
    0x9F06B2C0: "in the Class Foyer",
    0xDE06B2C0: "in the Class Foyer",
    0x3A06B2C0: "in the Class Foyer",
    // LOBBY2LUMOS
    0x6020E197: "in the Class Foyer",
    0x9F20E197: "in the Class Foyer",
    0xDE20E197: "in the Class Foyer",
    0x3A20E197: "in the Class Foyer",
    // OUT2LOBBY
    0x60149674: "in the Class Foyer",
    0x9F149674: "in the Class Foyer",
    0xDE149674: "in the Class Foyer",
    0x3A149674: "in the Class Foyer",
    // Transfigure
    0x600B2FD5: "in the Class Foyer",
    0x9F0B2FD5: "in the Class Foyer",
    0xDE0B2FD5: "in the Class Foyer",
    0x3A0B2FD5: "in the Class Foyer",
    // Y2BASILISKSTORY
    0x60193ADE: "in the Class Foyer",
    0x9F193ADE: "in the Class Foyer",
    0xDE193ADE: "in the Class Foyer",
    0x3A193ADE: "in the Class Foyer",
    // Y2POTIONS
    0x600B9F9D: "in the Class Foyer",
    0x9F0B9F9D: "in the Class Foyer",
    0xDE0B9F9D: "in the Class Foyer",
    0x3A0B9F9D: "in the Class Foyer",
    // Y4DARKARTS
    0x60128593: "in the Class Foyer",
    0x9F128593: "in the Class Foyer",
    0xDE128593: "in the Class Foyer",
    0x3A128593: "in the Class Foyer",
    // Y4POTIONS
    0x600D9F9D: "in the Class Foyer",
    0x9F0D9F9D: "in the Class Foyer",
    0xDE0D9F9D: "in the Class Foyer",
    0x3A0D9F9D: "in the Class Foyer",
    // CLASSDIVINATION
    0x602E19FD: "in the Divination Courtyard",
    0x9F2E19FD: "in the Divination Courtyard",
    0xDE2E19FD: "in the Divination Courtyard",
    0x3A2E19FD: "in the Divination Courtyard",
    // RightHALL1
    0x6012A8B4: "in the Divination Courtyard",
    0x9F12A8B4: "in the Divination Courtyard",
    0xDE12A8B4: "in the Divination Courtyard",
    0x3A12A8B4: "in the Divination Courtyard",
    // SCQUADCLASS
    0x600AE7A1: "in the Divination Courtyard",
    0x9F0AE7A1: "in the Divination Courtyard",
    0xDE0AE7A1: "in the Divination Courtyard",
    0x3A0AE7A1: "in the Divination Courtyard",
    //
    0xDF000000: "in the Defence Against the Dark Arts Class",
    // BOGGART2CLASS
    0xDF1DDCCC: "in the Defence Against the Dark Arts Class",
    // DARK_ARTS3
    0xDF05A49F: "in the Defence Against the Dark Arts Class",
    // CLASS2BOGGART
    0xDF15C4F4: "in the Clock Tower Engine Room",
    // Class2Immobulus
    0xDF238055: "in the Clock Tower Hallway",
    // IMMOBULUS2CLASS
    0xDF182FF0: "in the Clock Tower Hallway",
    // ImmobulusTop2Bottom	
    0xDF19B8C8: "in the Clock Tower Hallway",
    // 
    0x3B000000: "in the Potions Class",
    // TEST2LESSON
    0x3B20E6A7: "in the Potions Class",
    // Y4POTIONS
    0x3B0D9F9D: "in the Potions Class",
    // CLASS2TESTPOTION
    0x3B1C3535: "in the Slytherin Bathroom",
    // 
    0x66000000: "in the Clock Tower Courtyard",
    0xA9000000: "in the Clock Tower Courtyard",
    0xE3000000: "in the Clock Tower Courtyard",
    0x3D000000: "in the Clock Tower Courtyard",
    // BACK2MAIN
    0x660E8494: "in the Clock Tower Courtyard",
    0xA90E8494: "in the Clock Tower Courtyard",
    0xE30E8494: "in the Clock Tower Courtyard",
    0x3D0E8494: "in the Clock Tower Courtyard",
    // BROOMGREEN2QUAD
    0x661917E5: "in the Clock Tower Courtyard",
    0xA91917E5: "in the Clock Tower Courtyard",
    0xE31917E5: "in the Clock Tower Courtyard",
    0x3D1917E5: "in the Clock Tower Courtyard",
    // GINGERS
    0x660BA147: "in the Clock Tower Courtyard",
    0xA90BA147: "in the Clock Tower Courtyard",
    0xE30BA147: "in the Clock Tower Courtyard",
    0x3D0BA147: "in the Clock Tower Courtyard",
    // QUAD2CLOCK
    0x66138D93: "in the Clock Tower Courtyard",
    0xA9138D93: "in the Clock Tower Courtyard",
    0xE3138D93: "in the Clock Tower Courtyard",
    0x3D138D93: "in the Clock Tower Courtyard",
    // QUADFOYER
    0x66149A89: "in the Clock Tower Courtyard",
    0xA9149A89: "in the Clock Tower Courtyard",
    0xE3149A89: "in the Clock Tower Courtyard",
    0x3D149A89: "in the Clock Tower Courtyard",
    // QuadFoyer
    0x6614DAC9: "in the Clock Tower Courtyard",
    0xA914DAC9: "in the Clock Tower Courtyard",
    0xE314DAC9: "in the Clock Tower Courtyard",
    0x3D14DAC9: "in the Clock Tower Courtyard",
    // SCQUADCLASS
    0x660AE7A1: "in the Clock Tower Courtyard",
    0xA90AE7A1: "in the Clock Tower Courtyard",
    0xE30AE7A1: "in the Clock Tower Courtyard",
    0x3D0AE7A1: "in the Clock Tower Courtyard",
    // Y3BUCKBEAK
    0x6619849A: "in the Clock Tower Courtyard",
    0xA919849A: "in the Clock Tower Courtyard",
    0xE319849A: "in the Clock Tower Courtyard",
    0x3D19849A: "in the Clock Tower Courtyard",
    // Y3buckbeak
    0x6619C4DA: "in the Clock Tower Courtyard",
    0xA919C4DA: "in the Clock Tower Courtyard",
    0xE319C4DA: "in the Clock Tower Courtyard",
    0x3D19C4DA: "in the Clock Tower Courtyard",
    // QUAD2BROOMGREEN
    0x661A28E5: "in the Training Grounds",
    0xA91A28E5: "in the Training Grounds",
    0xE31A28E5: "in the Training Grounds",
    0x3D1A28E5: "in the Training Grounds",
    // Quad2GrnHs
    0x660FD3D2: "in the Training Grounds",
    0xA90FD3D2: "in the Training Grounds",
    0xE30FD3D2: "in the Training Grounds",
    0x3D0FD3D2: "in the Training Grounds",
    // QUADBROOM
    0x66079093: "in the Training Grounds",
    0xA9079093: "in the Training Grounds",
    0xE3079093: "in the Training Grounds",
    0x3D079093: "in the Training Grounds",
    // Y2_GREENHOUSE
    0x6616F9E8: "in the Training Grounds",
    0xA916F9E8: "in the Training Grounds",
    0xE316F9E8: "in the Training Grounds",
    0x3D16F9E8: "in the Training Grounds",
    // MAIN2BACK
    0x66038A91: "in the Transfiguration Courtyard",
    0xA9038A91: "in the Transfiguration Courtyard",
    0xE3038A91: "in the Transfiguration Courtyard",
    0x3D038A91: "in the Transfiguration Courtyard",
    // MAIN2BACK2
    0x66058A91: "in the Transfiguration Courtyard",
    0xA9058A91: "in the Transfiguration Courtyard",
    0xE3058A91: "in the Transfiguration Courtyard",
    0x3D058A91: "in the Transfiguration Courtyard",
    // QUADOWL
    0x660C8D44: "in the Transfiguration Courtyard",
    0xA90C8D44: "in the Transfiguration Courtyard",
    0xE30C8D44: "in the Transfiguration Courtyard",
    0x3D0C8D44: "in the Transfiguration Courtyard",
    // QuadOWL
    0x660CAD64: "in the Transfiguration Courtyard",
    0xA90CAD64: "in the Transfiguration Courtyard",
    0xE30CAD64: "in the Transfiguration Courtyard",
    0x3D0CAD64: "in the Transfiguration Courtyard",
    // Y2START
    0x6604A754: "in the Transfiguration Courtyard",
    0xA904A754: "in the Transfiguration Courtyard",
    0xE304A754: "in the Transfiguration Courtyard",
    0x3D04A754: "in the Transfiguration Courtyard",
    // 
    0x7C000000: "in the Dorm Hallway",
    0xBE000000: "in the Dorm Hallway",
    0x01000000: "in the Dorm Hallway",
    0x4C000000: "in the Dorm Hallway",
    // DORM2STAIRS
    0x7C14F98E: "in the Dorm Hallway",
    0xBE14F98E: "in the Dorm Hallway",
    0x0114F98E: "in the Dorm Hallway",
    0x4C14F98E: "in the Dorm Hallway",
    // DORMGRYFF
    0x7C11AB93: "in the Dorm Hallway",
    0xBE11AB93: "in the Dorm Hallway",
    0x0111AB93: "in the Dorm Hallway",
    0x4C11AB93: "in the Dorm Hallway",
    // DORMSTAIRS
    0x7C169396: "in the Dorm Hallway",
    0xBE169396: "in the Dorm Hallway",
    0x01169396: "in the Dorm Hallway",
    0x4C169396: "in the Dorm Hallway",
    // FOYERSTAIRS
    0x7C150086: "in the Dorm Hallway",
    0xBE150086: "in the Dorm Hallway",
    0x01150086: "in the Dorm Hallway",
    0x4C150086: "in the Dorm Hallway",
    // huffleArea2dorm
    0x7C0E473C: "in the Dorm Hallway",
    0xBE0E473C: "in the Dorm Hallway",
    0x010E473C: "in the Dorm Hallway",
    0x4C0E473C: "in the Dorm Hallway",
    // ravencArea2dorm
    0x7C08573B: "in the Dorm Hallway",
    0xBE08573B: "in the Dorm Hallway",
    0x0108573B: "in the Dorm Hallway",
    0x4C08573B: "in the Dorm Hallway",
    // slytheArea2dorm
    0x7C155A4A: "in the Dorm Hallway",
    0xBE155A4A: "in the Dorm Hallway",
    0x01155A4A: "in the Dorm Hallway",
    0x4C155A4A: "in the Dorm Hallway",
    // Y1LIBRARYSTORY
    0x7C0FE1EA: "in the Dorm Hallway",
    0xBE0FE1EA: "in the Dorm Hallway",
    0x010FE1EA: "in the Dorm Hallway",
    0x4C0FE1EA: "in the Dorm Hallway",
    // Y3MAPSTORY
    0x7C0FA190: "in the Dorm Hallway",
    0xBE0FA190: "in the Dorm Hallway",
    0x010FA190: "in the Dorm Hallway",
    0x4C0FA190: "in the Dorm Hallway",
    // dorm2huffleArea
    0x7C29AE14: "in the Hufflepuff Dorm",
    0xBE29AE14: "in the Hufflepuff Dorm",
    0x0129AE14: "in the Hufflepuff Dorm",
    0x4C29AE14: "in the Hufflepuff Dorm",
    // DORMHUFFLEPUFF
    0x7C1FE8E8: "in the Hufflepuff Dorm",
    0xBE1FE8E8: "in the Hufflepuff Dorm",
    0x011FE8E8: "in the Hufflepuff Dorm",
    0x4C1FE8E8: "in the Hufflepuff Dorm",
    // DormHufflepuff
    0x7C204948: "in the Hufflepuff Dorm",
    0xBE204948: "in the Hufflepuff Dorm",
    0x01204948: "in the Hufflepuff Dorm",
    0x4C204948: "in the Hufflepuff Dorm",
    // DormRavenclaw
    0x7C145533: "in the Ravenclaw Dorm",
    0xBE145533: "in the Ravenclaw Dorm",
    0x01145533: "in the Ravenclaw Dorm",
    0x4C145533: "in the Ravenclaw Dorm",
    // dorm2ravenCarea
    0x7C257844: "in the Ravenclaw Dorm",
    0xBE257844: "in the Ravenclaw Dorm",
    0x01257844: "in the Ravenclaw Dorm",
    0x4C257844: "in the Ravenclaw Dorm",
    // DORMSLYTHERIN
    0x7C20FDEA: "in the Slytherin Dorm",
    0xBE20FDEA: "in the Slytherin Dorm",
    0x0120FDEA: "in the Slytherin Dorm",
    0x4C20FDEA: "in the Slytherin Dorm",
    // DORMSTORY
    0x7C13A19F: "in the Slytherin Dorm",
    0xBE13A19F: "in the Slytherin Dorm",
    0x0113A19F: "in the Slytherin Dorm",
    0x4C13A19F: "in the Slytherin Dorm",
    // dorm2slytheArea
    0x7C20A527: "in the Slytherin Dorm",
    0xBE20A527: "in the Slytherin Dorm",
    0x0120A527: "in the Slytherin Dorm",
    0x4C20A527: "in the Slytherin Dorm",
    // BOYS2BLOCK
    0xAF1CA5A2: "in the Bathroom Corridor",
    0xF91CA5A2: "in the Bathroom Corridor",
    0x441CA5A2: "in the Bathroom Corridor",
    // MAINCORRTOILET
    0xAF23E4EC: "in the Bathroom Corridor",
    0xF923E4EC: "in the Bathroom Corridor",
    0x4423E4EC: "in the Bathroom Corridor",
    // Y2POLYJUICE
    0xAF0EDFA4: "in the Bathroom Corridor",
    0xF90EDFA4: "in the Bathroom Corridor",
    0x440EDFA4: "in the Bathroom Corridor",
    // Y2RIDDLE
    0xAF069E8E: "in the Bathroom Corridor",
    0xF9069E8E: "in the Bathroom Corridor",
    0x44069E8E: "in the Bathroom Corridor",
    // Y4EGGSTORY
    0xAF109996: "in the Bathroom Corridor",
    0xF9109996: "in the Bathroom Corridor",
    0x44109996: "in the Bathroom Corridor",
    // BLOCK2BOYS
    0xAF119192: "in the Boys' Bathroom",
    0xF9119192: "in the Boys' Bathroom",
    0x44119192: "in the Boys' Bathroom",
}

characterIDs = {
    0x00: "",
    0x5A: "Harry Potter",
    0x5E: "Harry Potter",
    0x5F: "Harry Potter",
    0x60: "Ron Weasley",
    0x61: "Hermione Granger",
    0x62: "Hermione Granger",
    0x64: "Hermione Granger",
    0x65: "Professor Dumbledore",
    0x66: "Professor McGonagall",
    0x67: "Professor McGonagall",
    0x68: "Professor Snape",
    0x69: "Sirius Black",
    0x6A: "Sirius Black",
    0x6B: "Mad-Eye Moody",
    0x6C: "Madam Hooch",
    0x6D: "Professor Sprout",
    0x6E: "Madam Pomfrey",
    0x6F: "Professor Lupin",
    0x70: "Professor Lupin",
    0x71: "Professor Trelawney",
    0x72: "Fleur Delacour",
    0x73: "Fleur Delacour",
    0x74: "Fleur Delacour",
    0x75: "Fleur Delacour",
    0x76: "Neville Longbottom",
    0x77: "Neville Longbottom",
    0x78: "Neville Longbottom",
    0x79: "Seamus Finnigan",
    0x7A: "Colin Ceevey",
    0x7B: "Katie Bell",
    0x7C: "Padma Patil",
    0x7D: "Parvati Patil",
    0x7E: "Cho Chang",
    0x7F: "Ginny Weasley",
    0x80: "Ginny Weasley",
    0x81: "Ginny Weasley",
    0x82: "Fred Weasley",
    0x83: "Fred Weasley",
    0x84: "Fred Weasley",
    0x85: "George Weasley",
    0x86: "George Weasley",
    0x87: "George Weasley",
    0x88: "Percy Weasley",
    0x89: "Percy Weasley",
    0x8A: "Arthur Weasley",
    0x8B: "Molly Weasley",
    0x8C: "Cornelius Fudge",
    0x8D: "Macnair",
    0x8E: "Amos Diggory",
    0x8F: "Dean Thomas",
    0x90: "Gabrielle Delacour",
    0x91: "The Fat Lady",
    0x92: "Hermione Granger",
    0x93: "Hermione Granger",
    0x95: "A Witch",
    0x96: "A Witch",
    0x97: "A Witch",
    0x98: "A Witch",
    0x99: "Hermione Granger",
    0x9A: "Padma Patil",
    0x9B: "Parvati Patil",
    0x9C: "Ron Weasley",
    0x9E: "Ron Weasley",
    0x9F: "Ron Weasley",
    0xA0: "Ron Weasley",
    0xA1: "Harry Potter",
    0xA2: "Harry Potter",
    0xA3: "Harry Potter",
    0xA4: "Harry Potter",
    0xA5: "Harry Potter",
    0xA6: "Harry Potter",
    0xA7: "Harry Potter",
    0xA8: "Harry Potter",
    0xA9: "Lee Jordan",
    0xAA: "Alicia Spinnet",
    0xAB: "Angelina Johnson",
    0xAC: "Hannah Abbott",
    0xAD: "Ernie Macmillan",
    0xAE: "Millicent Bulstrode",
    0xAF: "Penelope Clearwater",
    0xB0: "Susan Bones",
    0xB1: "A Mummy Boggart",
    0xB2: "A Banshee",
    0xB3: "Draco Malfoy",
    0xB4: "Draco Malfoy",
    0xB5: "Draco Malfoy",
    0xB6: "Draco Malfoy",
    0xB7: "Draco Malfoy",
    0xB8: "Vincent Crabbe",
    0xB9: "Vincent Crabbe",
    0xBA: "Gregory Goyle",
    0xBB: "Gregory Goyle",
    0xBC: "Professor Quirrell",
    0xBD: "Professor Quirrell",
    0xBE: "Tom Riddle",
    0xBF: "Tom Riddle",
    0xC0: "A Death Eater",
    0xC1: "Lucius Malfoy",
    0xC2: "Lucius Malfoy",
    0xC3: "Lucius Malfoy",
    0xC4: "Lucius Malfoy",
    0xC5: "Peter Pettigrew",
    0xC6: "Vernon Dursley",
    0xC7: "Vernon Dursley",
    0xC8: "Petunia Dursley",
    0xC9: "Dudley Dursley",
    0xCA: "Marge Dursley",
    0xCB: "Marcus Flint",
    0xCC: "Justin Finch-Fletchley",
    0xCD: "Nearly Headless Nick",
    0xCE: "Nearly Headless Nick",
    0xCF: "The Bloody Baron",
    0xD0: "The Fat Friar",
    0xD1: "The Grey Lady",
    0xD2: "Professor Sinistra",
    0xD3: "Professor Vector",
    0xD4: "Professor Binns",
    0xD5: "Doris Crockford",
    0xD6: "A Vocalist",
    0xD7: "A Guitarist",
    0xD8: "A Bassist",
    0xD9: "A Bassist",
    0xDA: "A Drummer",
    0xDB: "A Mandrake",
    0xDD: "A Trolley Witch",
    0xDE: "Griphook",
    0xDF: "A Goblin",
    0xE0: "A Cart Goblin",
    0xE1: "Oliver Wood",
    0xE2: "Oliver Wood",
    0xE3: "Professor Flitwick",
    0xE4: "Mr Ollivander",
    0xE5: "Filch",
    0xE6: "James Potter",
    0xE7: "James Potter",
    0xE8: "Lily Potter",
    0xE9: "Lily Potter",
    0xEA: "The Shopkeeper",
    0xEB: "Dobby",
    0xEC: "Gilderoy Lockhart",
    0xED: "Gilderoy Lockhart",
    0xEE: "Moaning Myrtle",
    0xEF: "Moaning Myrtle",
    0xF0: "Moaning Myrtle",
    0xF1: "Mrs Mason",
    0xF2: "Mr Mason",
    0xF3: "Ernie Prang",
    0xF4: "Stan Shunpike",
    0xF5: "Madam Rosmerta",
    0xF7: "Fleur Delacour",
    0xF8: "Fleur Delacour",
    0xF9: "Fleur Delacour",
    0xFA: "Fleur Delacour",
    0xFB: "A Beauxbatons Student",
    0xFC: "Viktor Krum",
    0xFD: "Viktor Krum",
    0xFE: "Viktor Krum",
    0xFF: "Viktor Krum",
    0x100: "Viktor Krum",
    0x101: "Viktor Krum",
    0x102: "Igor Karkaroff",
    0x104: "A Durmstrang Student",
    0x105: "A Durmstrang Student",
    0x106: "Cedric Diggory",
    0x107: "Cedric Diggory",
    0x108: "Cedric Diggory",
    0x109: "Cedric Diggory",
    0x10A: "Cedric Diggory",
    0x10B: "Cedric Diggory",
    0x10C: "Rita Skeeter",
    0x10D: "Barty Crouch Senior",
    0x10E: "Barty Crouch Junior",
    0x10F: "Barty Crouch Junior",
    0x110: "Harry Potter",
    0x111: "Harry Potter",
    0x112: "Harry Potter",
    0x113: "Harry Potter",
    0x114: "Harry Potter",
    0x115: "Harry Potter",
    0x116: "Harry Potter",
    0x117: "Harry Potter",
    0x118: "Harry Potter",
    0x119: "Harry Potter",
    0x11A: "Harry Potter",
    0x11B: "Harry Potter",
    0x11C: "Harry Potter",
    0x11D: "Harry Potter",
    0x11F: "Harry Potter",
    0x120: "Harry Potter",
    0x121: "Harry Potter",
    0x122: "Harry Potter",
    0x123: "Harry Potter",
    0x124: "Harry Potter",
    0x125: "Ron Weasley",
    0x126: "Ron Weasley",
    0x127: "Ron Weasley",
    0x128: "Ron Weasley",
    0x129: "Ron Weasley",
    0x12B: "Ron Weasley",
    0x12C: "Ron Weasley",
    0x12D: "Hermione Granger",
    0x12E: "Hermione Granger",
    0x12F: "Ginny Weasley",
    0x130: "Professor Dumbledore",
    0x131: "Sirius Black",
    0x133: "Hermione Granger",
    0x134: "Professor Quirrell",
    0x135: "A Wizard",
    0x136: "A Wizard",
    0x137: "Professor Quirrell",
    0x138: "A Vocalist",
    0x139: "Lord Voldemort",
    0x13A: "Lord Voldemort",
    0x13B: "Lord Voldemort",
    0x13C: "A Gryffindor Boy",
    0x13D: "A Gryffindor Boy",
    0x13E: "A Gryffindor Boy",
    0x13F: "A Boy",
    0x140: "A Boy",
    0x141: "A Slytherin Boy",
    0x142: "A Slytherin Boy",
    0x143: "A Slytherin Boy",
    0x144: "A Ravenclaw Boy",
    0x145: "A Ravenclaw Boy",
    0x146: "A Ravenclaw Boy",
    0x147: "A Hufflepuff Boy",
    0x148: "A Hufflepuff Boy",
    0x149: "A Hufflepuff Boy",
    0x14A: "A Gryffindor Girl",
    0x14B: "A Gryffindor Girl",
    0x14C: "A Gryffindor Girl",
    0x14D: "A Girl",
    0x14E: "A Girl",
    0x14F: "A Slytherin Girl",
    0x150: "A Slytherin Girl",
    0x151: "A Slytherin Girl",
    0x152: "A Ravenclaw Girl",
    0x153: "A Ravenclaw Girl",
    0x154: "A Ravenclaw Girl",
    0x155: "A Hufflepuff Girl",
    0x156: "A Hufflepuff Girl",
    0x157: "A Hufflepuff Girl",
    0x158: "A Gryffindor Prefect",
    0x159: "A Slytherin Prefect",
    0x15A: "A Ravenclaw Prefect",
    0x15B: "A Hufflepuff Prefect",
    0x15C: "A Gryffindor Boy",
    0x15D: "A Gryffindor Girl",
    0x15E: "A Slytherin Boy",
    0x15F: "A Slytherin Girl",
    0x160: "A Boy",
    0x161: "A Wizard",
    0x162: "A Wizard",
    0x163: "A Wizard",
    0x164: "A Wizard",
    0x165: "A Witch",
    0x166: "A Witch",
    0x167: "A Shifty Wizard",
    0x169: "A Witch",
    0x16A: "Professor Snape",
    0x16D: "A Busker",
    0x16E: "A Soldier",
    0x172: "A Business Man",
    0x173: "A Tourist",
    0x174: "Madam Hooch",
    0x176: "Madam Pince",
    0x177: "Madam Malkin",
    0x178: "Professor Sprout",
    0x179: "A Milkman",
    0x17A: "A Dragon Handler",
    0x17B: "A Station Guard",
    0x17C: "Hermione Granger",
    0x181: "Ron Weasley",
    0x182: "Lord Voldemort",
    0x183: "Lord Voldemort",
    0x184: "Lord Voldemort",
    0x185: "Lord Voldemort",
    0x186: "Tom the Innkeeper",
    0x187: "The White King",
    0x188: "The White Queen",
    0x189: "A White Bishop",
    0x18A: "A White Pawn",
    0x18B: "The Black King",
    0x18C: "The Black Queen",
    0x18D: "A Black Bishop",
    0x18E: "A Black Pawn",
    0x193: "A Construction Worker",
    0x194: "Nagini",
    0x195: "A Seagull",
    0x196: "A Crow",
    0x197: "A Flying Horse",
    0x198: "Rita Skeeter",
    0x199: "A Swedish Short-Snout",
    0x19A: "A Dementor",
    0x19B: "A Dementor",
    0x19F: "Padfoot",
    0x1A0: "A Brown Dog",
    0x1A1: "A Grindylow",
    0x1A3: "A Merman",
    0x1A5: "Aragog",
    0x1A6: "Aragog",
    0x1A7: "A Bat",
    0x1A9: "A Spider",
    0x1AA: "A Spider",
    0x1AB: "Fluffy",
    0x1AC: "A Snake",
    0x1AD: "Nagini",
    0x1AE: "A Library Statue",
    0x1AF: "The Merman Statue",
    0x1B1: "Fang",
    0x1B2: "A Parseltongue Gate",
    0x1B4: "A Cat",
    0x1B5: "Mrs Norris",
    0x1B6: "Professor McGonagall",
    0x1B7: "Crookshanks",
    0x1B8: "A Rat",
    0x1B9: "A Frog",
    0x1BA: "Trevor",
    0x1BB: "Hagrid",
    0x1BC: "Hagrid",
    0x1BD: "The Troll",
    0x1BE: "The Security Troll",
    0x1BF: "Hedwig",
    0x1C0: "An Owl",
    0x1C1: "An Owl",
    0x1C3: "A Devil's Snare",
    0x1C6: "Hagrid",
    0x1C7: "An Enchanted Book",
    0x1CA: "The Snake from Potions Class",
    0x1CC: "A Spider Boggart",
    0x1CD: "A Forest Spider",
    0x1CF: "A Forest Spider",
    0x1D0: "A Mannequin",
    0x1D2: "The Snitch",
    0x1D3: "A Whoopee",
    0x1D4: "Norbert",
    0x1D5: "Norbert",
    0x1D6: "A Cornish Pixie",
    0x1D8: "A Classic Bird",
    0x1D9: "A Bowtruckle",
    0x1DA: "A Dementor",
    0x1DB: "A Dementor",
    0x1DC: "Voldemort's Fireball",
    0x1E1: "The Sorting Hat",
    0x1E2: "A Unicorn",
    0x1E3: "A Centaur",
    0x1E4: "A Library Statue",
    0x1E5: "A Crab",
    0x1E6: "A Mole",
    0x1E8: "A Plimpy",
    0x1EC: "A Fire Crab",
    0x1EE: "A Snail",
    0x1EF: "A Slug",
    0x1F1: "A Warthog",
    0x1F2: "A Snowman",
    0x1F3: "The Basilisk",
    0x1F4: "A Hungarian Horntail",
    0x1F5: "A Chinese Fireball Dragon",
    0x1F6: "A Welsh Green Dragon",
    0x1F7: "A Dragon Statue",
    0x1F8: "Monster Book of Monsters",
    0x1FA: "A Snake Boggart",
    0x1FB: "Buckbeak",
    0x1FC: "Buckbeak",
    0x1FD: "The Whomping Willow",
    0x1FE: "A Skeleton",
    0x1FF: "Madam Maxime",
    0x200: "Fawkes",
    0x201: "A Ghost Horse",
    0x207: "A Rabbit",
    0x208: "Scabbers",
    0x209: "Scabbers",
    0x20B: "A Gnome",
    0x20E: "A Moon Balloon",
    0x20F: "An Eyeball",
    0x212: "A Fly",
    0x214: "A Swedish Short-Snout",
    0x216: "A Stag",
    0x25E: "Landscape Constructor",
    0x25F: "Object Constructor",
    0x260: "Baseplate Constructor",
    0x261: "Creatures Constructor",
    0x266: "Custom A",
    0x267: "Custom B",
    0x268: "Custom C",
    0x269: "Custom D",
    0x26A: "Custom E",
    0x26B: "Custom F",
    0x26C: "Custom G",
    0x26D: "Custom H",
    0x26E: "Custom I",
    0x26F: "Custom J",
    0x270: "Custom K",
    0x271: "Custom L",
    0x272: "Custom M",
    0x273: "Custom N",
    0x274: "Custom O",
    0x275: "Custom P",
    0x276: "Custom Q",
    0x277: "Custom R",
}

hermioneIDs = {
    0x61: "Hermione Granger",
    0x62: "Hermione Granger",
    0x64: "Hermione Granger",
    0x92: "Hermione Granger",
    0x93: "Hermione Granger",
    0x99: "Hermione Granger",
    0x12D: "Hermione Granger",
    0x12E: "Hermione Granger",
    0x133: "Hermione Granger",
    0x17C: "Hermione Granger",
}

vehicleIDs = {
    0x1C9: "Red Car",
    0x1CB: "Tree Stump",
    0x20C: "Frog",
    0x21B: "Whomping Willow",
    0x220: "Broomstick",
    0x221: "Broomstick",
    0x222: "Broomstick",
    0x223: "Broomstick",
    0x224: "Broomstick",
    0x225: "Broomstick",
    0x226: "Broomstick",
    0x227: "Broomstick",
    0x228: "Broomstick",
    0x229: "London Bus",
    0x22A: "Taxi",
    0x22B: "Gringotts Carriage",
    0x22C: "Bicycle",
    0x22D: "Milk Float",
    0x22E: "Motorbike",
    0x22F: "Estate Car",
    0x230: "Goblin Car",
    0x231: "Stool",
    0x232: "Stool",
    0x234: "Hogwarts Express Engine",
    0x235: "Hogwarts Express Wagon",
    0x236: "Knight Bus",
    0x237: "Caravan",
    0x238: "Weasley Car",
    0x239: "Weasley Car",
    0x23A: "Broom Machine",
    0x23B: "Jungle Boat",
    0x23C: "Plunger Machine",
    0x23D: "Owl Plunger Machine",
    0x23E: "Durmstrang Ship",
    0x23F: "Scooter",
    0x240: "Scooter",
    0x241: "Pumpkin Hopper",
    0x242: "Pumpkin Helicopter",
    0x243: "Pumpkin Tower",
    0x244: "White Rook",
    0x245: "Black Rook",
    0x246: "Plunger",
    0x247: "Stool",
    0x248: "Tractor",
    0x249: "Sledge",
    0x24A: "Giant Snowball",
    0x24B: "Armchair",
    0x24C: "Bathtub Dragon",
    0x24D: "Bathtub Ship",
    0x24E: "Wheelchair",
    0x24F: "Giant Hornet",
    0x250: "Stroller",
    0x251: "Snow Cannon",
    0x252: "Red Car",
    0x253: "Car 2",
    0x254: "Wooden Carriage",
    0x255: "Book Truck",
    0x256: "Wagon",
    0x259: "Pumpkin Car",
    0x25B: "Excavator",
    0x25C: "White Knight",
    0x25D: "Black Knight",
}

groupConnect = {
    0: "",
    1: ", ",
}

collectibleStudent = {
    0: "☹️",
    1: "😀",
}

collectibleWizard = {
    0: "❌",
    1: "🧙",
}

collectibleCrest = {
    0: "❌",
    1: "🟥",
    2: "🟩",
    3: "🟦",
    4: "🟨",
}

//--------------------------------------------------
// Functions

function inGame() {
    return !checkLevelID(0x39) && 
           !checkLevelID(0x3B)
}

function getMapID() {
    return dword_be(mapID)
}

function checkMapID(id) {
    return getMapID() == id
}

function checkMapText(text) {  
    return ascii_string_equals(0x00857904, text)
}

function hashMapText() {
   
    return (dword_be(savedTransition + 0x00) & 0x000FFFFF)
         + (dword_be(savedTransition + 0x04) & 0x000FFFFF)
         + (dword_be(savedTransition + 0x08) & 0x000FFFFF)
         + (dword_be(savedTransition + 0x0C) & 0x000FFFFF)  
         + (dword_be(mapID) & 0xFF) * 0x1000000
}

function hashPriorMapText() {
   
    return prior((dword_be(savedTransition + 0x00) & 0x000FFFFF)
               + (dword_be(savedTransition + 0x04) & 0x000FFFFF)
               + (dword_be(savedTransition + 0x08) & 0x000FFFFF)
               + (dword_be(savedTransition + 0x0C) & 0x000FFFFF))  
         + (dword_be(mapID) & 0xFF) * 0x1000000
}

function checkLevelID(id) {
    return dword_be(levelID) == id
}

function isInLevel() {
    return any_of(levelIDs, level => checkLevelID(level))
}

function levelMode(mode) {
    if (mode == "Story") {
        return dword_be(levelMode) == 0
    }
    if (mode == "Free") {
        return dword_be(levelMode) == 1
    }
}

function getPointerChar(slot) {
    return dword_be(pointerChar1 + slot * 0x04)
}

function getCharacterID(slot) {
    return word_be((getPointerChar(slot) & 0x7FFFFFFF) + 0x1362)
}

function getInitialCharacterID(slot) {
    return word_be(initialCharacter + slot * 2)
}

function getPriorCharacterID(slot) {
    return word_be((prior(getPointerChar(slot) & 0x7FFFFFFF)) + 0x1362)
}

function getCharacterExistence(slot) {
    return bit6((getPointerChar(slot) & 0x7FFFFFFF) + 0x04)
}

function checkCharacterExistence(slot) {
    return getCharacterExistence(slot) + bit7(pointerChar1 + (slot * 0x04)) == 2
}

function getCharacterIsPlayer(slot) {
    return bit6((getPointerChar(slot) & 0x7FFFFFFF) + 0x05)
}

function getCharacterAnimation(slot) {
    return word_be((getPointerChar(slot) & 0x7FFFFFFF) + 0x5CC)
}

function getCharacterMaxHealth(slot) {
    return byte((getPointerChar(slot) & 0x7FFFFFFF) + 0x137A)
}

function getCharacterHealth(slot) {
    return byte((getPointerChar(slot) & 0x7FFFFFFF) + 0x137B)
}

function getCharacterYCoordinate(slot) {
    return float_be((dword_be((getPointerChar(slot) & 0x7FFFFFFF) + 0x168C) & 0x7FFFFFFF) + 0x5C)
}

function getCharacterIsVehicle(slot) {
    return __ornext(word_be((getPointerChar(slot) & 0x7FFFFFFF) + 0x1362) == 0x1C9 ||
                    word_be((getPointerChar(slot) & 0x7FFFFFFF) + 0x1362) == 0x1CB ||
                    word_be((getPointerChar(slot) & 0x7FFFFFFF) + 0x1362) == 0x20C ||
                   (word_be((getPointerChar(slot) & 0x7FFFFFFF) + 0x1362) >= 0x21B &&
                    word_be((getPointerChar(slot) & 0x7FFFFFFF) + 0x1362) <= 0x25D))
}

function getCharacterFunnyEarmuffs(slot) {
    funnyEarmuffs = {
        0x0150: "Antenna Headset",
        0x0151: "Spear",
    }
    
    code = always_false()
    
    return any_of(funnyEarmuffs, earmuffID => __ornext(word_be((getPointerChar(slot) & 0x7FFFFFFF) + 0x1276) == earmuffID))
}

function getGroupSize() {
    return getCharacterExistence(0) * bit7((getPointerChar(0) & 0x7FFFFFFF) + 0x20)
         + getCharacterExistence(1) * bit7((getPointerChar(1) & 0x7FFFFFFF) + 0x20)
         + getCharacterExistence(2) * bit7((getPointerChar(2) & 0x7FFFFFFF) + 0x20)
         + getCharacterExistence(3) * bit7((getPointerChar(3) & 0x7FFFFFFF) + 0x20)
}

function characterTookDamage(slot) {
    return bit6((getPointerChar(slot) & 0x7FFFFFFF) + 0x05) == 1 &&
           byte((getPointerChar(slot) & 0x7FFFFFFF) + 0x137A) == prev(byte((getPointerChar(slot) & 0x7FFFFFFF) + 0x137A)) &&
           byte((getPointerChar(slot) & 0x7FFFFFFF) + 0x137B) < prev(byte((getPointerChar(slot) & 0x7FFFFFFF) + 0x137B))
}

function isInvincible() {
    return byte(0x006CC486) != 0x00
}

function startBossFight(charID) {
    return once(prev(dword_be(pointerBoss)) == 0 &&
                dword_be(pointerBoss) > 0 &&
                word_be((dword_be(pointerBoss) & 0x7FFFFFFF) + 0x1362) == charID)
}

function winBossFight(loadedMapID) {
    return trigger_when(byte((dword_be(pointerBoss) & 0x7FFFFFFF) + 0x137B) <= 1 &&
                        dword_be(0x00868f40) != prev(dword_be(0x00868f40)) &&
                        dword_be(0x00868f40) == loadedMapID)
}

function getBossHealth() {
    return byte((dword_be(pointerBoss) & 0x7FFFFFFF) + 0x137B)
}

function winBossFightHealth() {
    return trigger_when(getBossHealth()  == 0 &&
                   prev(getBossHealth()) == 1)
}

function resetOnLevelLeave() {
    return never(dword_be(0x0084FE94) == 0 &&
            prev(dword_be(0x0084FE94)) == 1 &&
                 dword_be(0x00826728) == 3)
}

function levelCollectibleFlag(levelID, collectible) {
    address = 0x10084796 + (levelID * 0x14)
    if(collectible == "Story") {
        return bit2(address)
    }
    if(collectible == "Student") {
        return bit0(address)
    }
    if(collectible == "Wizard") {
        return word_be(address - 0x06) / word_be(address - 0x06)
    }
    if(collectible == "Crests") {
        return high4(address) / 15
    }
}

function brickEventFlag(roomID, bit) {
    return bit(bit, brickEventFlags + 0x03 + (roomID * 0x0C))
}

function skillEventFlag(offset, bit) {
    return bit(bit, 0x1008A198 + offset)
}

function diagonGoldBrick(bit) {
    return bit(bit, (dword_be(0x0086847C) & 0x7FFFFFFF) + 0x53) 
}

function cutsceneUnlocked(offset, bit) {
    return bit(bit, (dword_be(0x0086847C) & 0x7FFFFFFF)) 
}

function calculateUnlockedExtras() {
    return bitcount(extrasUnlocked + 0)
         + bitcount(extrasUnlocked + 1)
         + bitcount(extrasUnlocked + 2)
}

function cheatUsedForExtra() {
    return (bitcount(extrasUnlocked + 0) > prev(bitcount(extrasUnlocked + 0)) ||
            bitcount(extrasUnlocked + 1) > prev(bitcount(extrasUnlocked + 1)) ||
            bitcount(extrasUnlocked + 2) > prev(bitcount(extrasUnlocked + 2))) &&
           checkMapText("STREET2CAULDRON")
}

function checkTokenBuyable(charID) {
    // 0x10089e7f
    bitOfChar      = charID % 8
    offsetOfChar   = (charID / 32) * 4
    negativeOfChar = (charID / 8) % 4

    return bit(bitOfChar, 0x10089E7F + offsetOfChar - negativeOfChar)
}

function calculateTokensBuyable() {
    return checkTokenBuyable(0x05F) + checkTokenBuyable(0x062) + checkTokenBuyable(0x065) + checkTokenBuyable(0x066) +
           checkTokenBuyable(0x068) + checkTokenBuyable(0x06A) + checkTokenBuyable(0x06B) + checkTokenBuyable(0x06C) +
           checkTokenBuyable(0x06D) + checkTokenBuyable(0x06E) + checkTokenBuyable(0x06F) + checkTokenBuyable(0x071) +
           checkTokenBuyable(0x072) + checkTokenBuyable(0x073) + checkTokenBuyable(0x074) + checkTokenBuyable(0x075) +
           checkTokenBuyable(0x076) + checkTokenBuyable(0x078) + checkTokenBuyable(0x079) + checkTokenBuyable(0x07A) +
           checkTokenBuyable(0x07B) + checkTokenBuyable(0x07C) + checkTokenBuyable(0x07D) + checkTokenBuyable(0x07E) +
           checkTokenBuyable(0x07F) + checkTokenBuyable(0x080) + checkTokenBuyable(0x082) + checkTokenBuyable(0x083) +
           checkTokenBuyable(0x084) + checkTokenBuyable(0x085) + checkTokenBuyable(0x086) + checkTokenBuyable(0x087) +
           checkTokenBuyable(0x088) + checkTokenBuyable(0x089) + checkTokenBuyable(0x08A) + checkTokenBuyable(0x08B) +
           checkTokenBuyable(0x08C) + checkTokenBuyable(0x08D) + checkTokenBuyable(0x08E) + checkTokenBuyable(0x08F) +
           checkTokenBuyable(0x090) + checkTokenBuyable(0x092) + checkTokenBuyable(0x093) + checkTokenBuyable(0x099) +
           checkTokenBuyable(0x09A) + checkTokenBuyable(0x09B) + checkTokenBuyable(0x09C) + checkTokenBuyable(0x09F) +
           checkTokenBuyable(0x0A0) + checkTokenBuyable(0x0A5) + checkTokenBuyable(0x0A6) + checkTokenBuyable(0x0A8) +
           checkTokenBuyable(0x0A9) + checkTokenBuyable(0x0AA) + checkTokenBuyable(0x0AB) + checkTokenBuyable(0x0AC) +
           checkTokenBuyable(0x0AD) + checkTokenBuyable(0x0AE) + checkTokenBuyable(0x0AF) + checkTokenBuyable(0x0B0) +
           checkTokenBuyable(0x0B3) + checkTokenBuyable(0x0B5) + checkTokenBuyable(0x0B6) + checkTokenBuyable(0x0B7) + 
           checkTokenBuyable(0x0B8) + checkTokenBuyable(0x0B9) + checkTokenBuyable(0x0BA) + checkTokenBuyable(0x0BB) + 
           checkTokenBuyable(0x0BC) + checkTokenBuyable(0x0BD) + checkTokenBuyable(0x0BE) + checkTokenBuyable(0x0C0) + 
           checkTokenBuyable(0x0C1) + checkTokenBuyable(0x0C5) + checkTokenBuyable(0x0C6) + checkTokenBuyable(0x0C8) + 
           checkTokenBuyable(0x0C9) + checkTokenBuyable(0x0CB) + checkTokenBuyable(0x0CC) + checkTokenBuyable(0x0CD) + 
           checkTokenBuyable(0x0CF) + checkTokenBuyable(0x0D0) + checkTokenBuyable(0x0D1) + checkTokenBuyable(0x0D2) +
           checkTokenBuyable(0x0D3) + checkTokenBuyable(0x0D4) + checkTokenBuyable(0x0D5) + checkTokenBuyable(0x0D6) + 
           checkTokenBuyable(0x0D7) + checkTokenBuyable(0x0D8) + checkTokenBuyable(0x0DA) + checkTokenBuyable(0x0DD) + 
           checkTokenBuyable(0x0DE) + checkTokenBuyable(0x0E2) + checkTokenBuyable(0x0E3) + checkTokenBuyable(0x0E4) + 
           checkTokenBuyable(0x0E5) + checkTokenBuyable(0x0E7) + checkTokenBuyable(0x0E9) + checkTokenBuyable(0x0EB) + 
           checkTokenBuyable(0x0EC) + checkTokenBuyable(0x0ED) + checkTokenBuyable(0x0EF) + checkTokenBuyable(0x0F0) + 
           checkTokenBuyable(0x0F1) + checkTokenBuyable(0x0F2) + checkTokenBuyable(0x0F3) + checkTokenBuyable(0x0F4) + 
           checkTokenBuyable(0x0F5) + checkTokenBuyable(0x0FC) + checkTokenBuyable(0x0FD) + checkTokenBuyable(0x0FE) + 
           checkTokenBuyable(0x0FF) + checkTokenBuyable(0x101) + checkTokenBuyable(0x102) + checkTokenBuyable(0x104) + 
           checkTokenBuyable(0x106) + checkTokenBuyable(0x107) + checkTokenBuyable(0x108) + checkTokenBuyable(0x109) + 
           checkTokenBuyable(0x10B) + checkTokenBuyable(0x10C) + checkTokenBuyable(0x10D) + checkTokenBuyable(0x10E) + 
           checkTokenBuyable(0x110) + checkTokenBuyable(0x114) + checkTokenBuyable(0x115) + checkTokenBuyable(0x116) + 
           checkTokenBuyable(0x118) + checkTokenBuyable(0x11A) + checkTokenBuyable(0x124) + checkTokenBuyable(0x125) + 
           checkTokenBuyable(0x127) + checkTokenBuyable(0x128) + checkTokenBuyable(0x129) + checkTokenBuyable(0x12B) + 
           checkTokenBuyable(0x12D) + checkTokenBuyable(0x12E) + checkTokenBuyable(0x12F) + checkTokenBuyable(0x130) + 
           checkTokenBuyable(0x13A) + checkTokenBuyable(0x13C) + checkTokenBuyable(0x13F) + checkTokenBuyable(0x141) + 
           checkTokenBuyable(0x144) + checkTokenBuyable(0x147) + checkTokenBuyable(0x14A) + checkTokenBuyable(0x14D) + 
           checkTokenBuyable(0x14F) + checkTokenBuyable(0x152) + checkTokenBuyable(0x155) + checkTokenBuyable(0x159) + 
           checkTokenBuyable(0x15A) + checkTokenBuyable(0x15B) + checkTokenBuyable(0x161) + checkTokenBuyable(0x162) + 
           checkTokenBuyable(0x165) + checkTokenBuyable(0x166) + checkTokenBuyable(0x167) + checkTokenBuyable(0x176) + 
           checkTokenBuyable(0x177) + checkTokenBuyable(0x179) + checkTokenBuyable(0x17A) + checkTokenBuyable(0x17B) + 
           checkTokenBuyable(0x186) + checkTokenBuyable(0x1B1) + checkTokenBuyable(0x1BB)
}

function checkTokenUnlocked(charID) {
    return byte(0x10089ED4 + charID) / byte(0x10089ED4 + charID)
}

function calculateTokensUnlocked() {
    return checkTokenUnlocked(0x05F) + checkTokenUnlocked(0x062) + checkTokenUnlocked(0x065) + checkTokenUnlocked(0x066) +
           checkTokenUnlocked(0x068) + checkTokenUnlocked(0x06A) + checkTokenUnlocked(0x06B) + checkTokenUnlocked(0x06C) +
           checkTokenUnlocked(0x06D) + checkTokenUnlocked(0x06E) + checkTokenUnlocked(0x06F) + checkTokenUnlocked(0x071) +
           checkTokenUnlocked(0x072) + checkTokenUnlocked(0x073) + checkTokenUnlocked(0x074) + checkTokenUnlocked(0x075) +
           checkTokenUnlocked(0x076) + checkTokenUnlocked(0x078) + checkTokenUnlocked(0x079) + checkTokenUnlocked(0x07A) +
           checkTokenUnlocked(0x07B) + checkTokenUnlocked(0x07C) + checkTokenUnlocked(0x07D) + checkTokenUnlocked(0x07E) +
           checkTokenUnlocked(0x07F) + checkTokenUnlocked(0x080) + checkTokenUnlocked(0x082) + checkTokenUnlocked(0x083) +
           checkTokenUnlocked(0x084) + checkTokenUnlocked(0x085) + checkTokenUnlocked(0x086) + checkTokenUnlocked(0x087) +
           checkTokenUnlocked(0x088) + checkTokenUnlocked(0x089) + checkTokenUnlocked(0x08A) + checkTokenUnlocked(0x08B) +
           checkTokenUnlocked(0x08C) + checkTokenUnlocked(0x08D) + checkTokenUnlocked(0x08E) + checkTokenUnlocked(0x08F) +
           checkTokenUnlocked(0x090) + checkTokenUnlocked(0x092) + checkTokenUnlocked(0x093) + checkTokenUnlocked(0x099) +
           checkTokenUnlocked(0x09A) + checkTokenUnlocked(0x09B) + checkTokenUnlocked(0x09C) + checkTokenUnlocked(0x09F) +
           checkTokenUnlocked(0x0A0) + checkTokenUnlocked(0x0A5) + checkTokenUnlocked(0x0A6) + checkTokenUnlocked(0x0A8) +
           checkTokenUnlocked(0x0A9) + checkTokenUnlocked(0x0AA) + checkTokenUnlocked(0x0AB) + checkTokenUnlocked(0x0AC) +
           checkTokenUnlocked(0x0AD) + checkTokenUnlocked(0x0AE) + checkTokenUnlocked(0x0AF) + checkTokenUnlocked(0x0B0) +
           checkTokenUnlocked(0x0B3) + checkTokenUnlocked(0x0B5) + checkTokenUnlocked(0x0B6) + checkTokenUnlocked(0x0B7) + 
           checkTokenUnlocked(0x0B8) + checkTokenUnlocked(0x0B9) + checkTokenUnlocked(0x0BA) + checkTokenUnlocked(0x0BB) + 
           checkTokenUnlocked(0x0BC) + checkTokenUnlocked(0x0BD) + checkTokenUnlocked(0x0BE) + checkTokenUnlocked(0x0C0) + 
           checkTokenUnlocked(0x0C1) + checkTokenUnlocked(0x0C5) + checkTokenUnlocked(0x0C6) + checkTokenUnlocked(0x0C8) + 
           checkTokenUnlocked(0x0C9) + checkTokenUnlocked(0x0CB) + checkTokenUnlocked(0x0CC) + checkTokenUnlocked(0x0CD) + 
           checkTokenUnlocked(0x0CF) + checkTokenUnlocked(0x0D0) + checkTokenUnlocked(0x0D1) + checkTokenUnlocked(0x0D2) +
           checkTokenUnlocked(0x0D3) + checkTokenUnlocked(0x0D4) + checkTokenUnlocked(0x0D5) + checkTokenUnlocked(0x0D6) + 
           checkTokenUnlocked(0x0D7) + checkTokenUnlocked(0x0D8) + checkTokenUnlocked(0x0DA) + checkTokenUnlocked(0x0DD) + 
           checkTokenUnlocked(0x0DE) + checkTokenUnlocked(0x0E2) + checkTokenUnlocked(0x0E3) + checkTokenUnlocked(0x0E4) + 
           checkTokenUnlocked(0x0E5) + checkTokenUnlocked(0x0E7) + checkTokenUnlocked(0x0E9) + checkTokenUnlocked(0x0EB) + 
           checkTokenUnlocked(0x0EC) + checkTokenUnlocked(0x0ED) + checkTokenUnlocked(0x0EF) + checkTokenUnlocked(0x0F0) + 
           checkTokenUnlocked(0x0F1) + checkTokenUnlocked(0x0F2) + checkTokenUnlocked(0x0F3) + checkTokenUnlocked(0x0F4) + 
           checkTokenUnlocked(0x0F5) + checkTokenUnlocked(0x0FC) + checkTokenUnlocked(0x0FD) + checkTokenUnlocked(0x0FE) + 
           checkTokenUnlocked(0x0FF) + checkTokenUnlocked(0x101) + checkTokenUnlocked(0x102) + checkTokenUnlocked(0x104) + 
           checkTokenUnlocked(0x106) + checkTokenUnlocked(0x107) + checkTokenUnlocked(0x108) + checkTokenUnlocked(0x109) + 
           checkTokenUnlocked(0x10B) + checkTokenUnlocked(0x10C) + checkTokenUnlocked(0x10D) + checkTokenUnlocked(0x10E) + 
           checkTokenUnlocked(0x110) + checkTokenUnlocked(0x114) + checkTokenUnlocked(0x115) + checkTokenUnlocked(0x116) + 
           checkTokenUnlocked(0x118) + checkTokenUnlocked(0x11A) + checkTokenUnlocked(0x124) + checkTokenUnlocked(0x125) + 
           checkTokenUnlocked(0x127) + checkTokenUnlocked(0x128) + checkTokenUnlocked(0x129) + checkTokenUnlocked(0x12B) + 
           checkTokenUnlocked(0x12D) + checkTokenUnlocked(0x12E) + checkTokenUnlocked(0x12F) + checkTokenUnlocked(0x130) + 
           checkTokenUnlocked(0x13A) + checkTokenUnlocked(0x13C) + checkTokenUnlocked(0x13F) + checkTokenUnlocked(0x141) + 
           checkTokenUnlocked(0x144) + checkTokenUnlocked(0x147) + checkTokenUnlocked(0x14A) + checkTokenUnlocked(0x14D) + 
           checkTokenUnlocked(0x14F) + checkTokenUnlocked(0x152) + checkTokenUnlocked(0x155) + checkTokenUnlocked(0x159) + 
           checkTokenUnlocked(0x15A) + checkTokenUnlocked(0x15B) + checkTokenUnlocked(0x161) + checkTokenUnlocked(0x162) + 
           checkTokenUnlocked(0x165) + checkTokenUnlocked(0x166) + checkTokenUnlocked(0x167) + checkTokenUnlocked(0x176) + 
           checkTokenUnlocked(0x177) + checkTokenUnlocked(0x179) + checkTokenUnlocked(0x17A) + checkTokenUnlocked(0x17B) + 
           checkTokenUnlocked(0x186) + checkTokenUnlocked(0x1B1) + checkTokenUnlocked(0x1BB) + 
           checkTokenUnlocked(0x05A) + checkTokenUnlocked(0x060) + checkTokenUnlocked(0x061) +
         0
}

function calculateRedBricks() {
           // Year 1 - Flag         | Year 2 - Flag            | Year 3 - Flag            | Year 4 - Flag
    return                                                       brickEventFlag(0x0AB, 3) +                            // Red Brick 1 'Singing Mandrake'
           brickEventFlag(0x062, 3) +                                                                                  // Red Brick 2 'Character Token Detector'
           brickEventFlag(0x07F, 3) + brickEventFlag(0x0BF, 3) + brickEventFlag(0x102, 3) + brickEventFlag(0x14D, 3) + // Red Brick 3 'Fall Rescue'
           brickEventFlag(0x06B, 3) + brickEventFlag(0x0AD, 3) + brickEventFlag(0x0F8, 3) + brickEventFlag(0x142, 3) + // Red Brick 4 'Character Studs'
                                                                 brickEventFlag(0x0E7, 3) + brickEventFlag(0x140, 3) + // Red Brick 5 'Score x2'
                                                                                            brickEventFlag(0x14E, 3) + // Red Brick 6 'Score x4'
                                                                                            brickEventFlag(0x14A, 3) + // Red Brick 7 'Score x6'
                                      brickEventFlag(0x0AF, 3) + brickEventFlag(0x0F9, 3) + brickEventFlag(0x144, 3) + // Red Brick 8 'Score x8'
                                                                                            brickEventFlag(0x13B, 3) + // Red Brick 9 'Score x10'
                                                                 brickEventFlag(0x0DD, 3) +                            // Red Brick 10 'Stud Magnet'
                                                                 brickEventFlag(0x0DF, 3) +                            // Red Brick 11 'Regenerate Hearts'
           brickEventFlag(0x061, 3) +                                                                                  // Red Brick 12 'Extra Hearts'
                                                                                            brickEventFlag(0x14B, 3) + // Red Brick 13 'Invincibility
                                                                 brickEventFlag(0x100, 3) + brickEventFlag(0x149, 3) + // Red Brick 14 'Red Brick Detector'
                                                                 brickEventFlag(0x108, 3) + brickEventFlag(0x14F, 3) + // Red Brick 15 'Hogwarts Crest Detector'
                                                                 brickEventFlag(0x0E6, 3) +                            // Red Brick 17 'Gold Brick Detector'
                                      brickEventFlag(0x0C0, 3) + brickEventFlag(0x109, 3) + brickEventFlag(0x150, 3) + // Red Brick 17 'Christmas'
           brickEventFlag(0x066, 3) + brickEventFlag(0x0A9, 3) + brickEventFlag(0x0E3, 3) + brickEventFlag(0x13D, 3) + // Red Brick 18 'Collect Ghost Studs'
                                                                                            brickEventFlag(0x13C, 3) + // Red Brick 19 'Fast Magic'
           brickEventFlag(0x052, 3) + brickEventFlag(0x08F, 3) + brickEventFlag(0x0CF, 3) + brickEventFlag(0x119, 3) + // Red Brick 20 'Fast Dig'
         0   
}

function calculateTrueWizards() {
    return levelCollectibleFlag(0x01, "Wizard") +
           levelCollectibleFlag(0x06, "Wizard") +
           levelCollectibleFlag(0x07, "Wizard") +
           levelCollectibleFlag(0x0A, "Wizard") +
           levelCollectibleFlag(0x08, "Wizard") +
           levelCollectibleFlag(0x0B, "Wizard") +
           levelCollectibleFlag(0x0C, "Wizard") +
           levelCollectibleFlag(0x10, "Wizard") + 
           levelCollectibleFlag(0x11, "Wizard") + 
           levelCollectibleFlag(0x13, "Wizard") + 
           levelCollectibleFlag(0x14, "Wizard") + 
           levelCollectibleFlag(0x15, "Wizard") + 
           levelCollectibleFlag(0x16, "Wizard") + 
           levelCollectibleFlag(0x18, "Wizard") + 
           levelCollectibleFlag(0x19, "Wizard") + 
           levelCollectibleFlag(0x1A, "Wizard") + 
           levelCollectibleFlag(0x1B, "Wizard") + 
           levelCollectibleFlag(0x1C, "Wizard") + 
           levelCollectibleFlag(0x1D, "Wizard") + 
           levelCollectibleFlag(0x1F, "Wizard") + 
           levelCollectibleFlag(0x20, "Wizard") + 
           levelCollectibleFlag(0x22, "Wizard") + 
           levelCollectibleFlag(0x23, "Wizard") + 
           levelCollectibleFlag(0x24, "Wizard")
}

function calculateCrests() {
    return levelCollectibleFlag(0x01, "Crests") +
           levelCollectibleFlag(0x06, "Crests") +
           levelCollectibleFlag(0x07, "Crests") +
           levelCollectibleFlag(0x0A, "Crests") +
           levelCollectibleFlag(0x08, "Crests") +
           levelCollectibleFlag(0x0B, "Crests") +
           levelCollectibleFlag(0x0C, "Crests") +
           levelCollectibleFlag(0x10, "Crests") + 
           levelCollectibleFlag(0x11, "Crests") + 
           levelCollectibleFlag(0x13, "Crests") + 
           levelCollectibleFlag(0x14, "Crests") + 
           levelCollectibleFlag(0x15, "Crests") + 
           levelCollectibleFlag(0x16, "Crests") + 
           levelCollectibleFlag(0x18, "Crests") + 
           levelCollectibleFlag(0x19, "Crests") + 
           levelCollectibleFlag(0x1A, "Crests") + 
           levelCollectibleFlag(0x1B, "Crests") + 
           levelCollectibleFlag(0x1C, "Crests") + 
           levelCollectibleFlag(0x1D, "Crests") + 
           levelCollectibleFlag(0x1F, "Crests") + 
           levelCollectibleFlag(0x20, "Crests") + 
           levelCollectibleFlag(0x22, "Crests") + 
           levelCollectibleFlag(0x23, "Crests") + 
           levelCollectibleFlag(0x24, "Crests")
}

function calculateStudentsInPeril() {
   return levelCollectibleFlag(0x01, "Student") +
          levelCollectibleFlag(0x06, "Student") +
          levelCollectibleFlag(0x07, "Student") +
          levelCollectibleFlag(0x0A, "Student") +
          levelCollectibleFlag(0x08, "Student") +
          levelCollectibleFlag(0x0B, "Student") +
          levelCollectibleFlag(0x0C, "Student") +
          levelCollectibleFlag(0x10, "Student") +
          levelCollectibleFlag(0x11, "Student") +
          levelCollectibleFlag(0x13, "Student") +
          levelCollectibleFlag(0x14, "Student") +
          levelCollectibleFlag(0x15, "Student") +
          levelCollectibleFlag(0x16, "Student") +
          levelCollectibleFlag(0x18, "Student") +
          levelCollectibleFlag(0x19, "Student") +
          levelCollectibleFlag(0x1A, "Student") +
          levelCollectibleFlag(0x1B, "Student") +
          levelCollectibleFlag(0x1C, "Student") +
          levelCollectibleFlag(0x1D, "Student") +
          levelCollectibleFlag(0x1F, "Student") +
          levelCollectibleFlag(0x20, "Student") +
          levelCollectibleFlag(0x22, "Student") +
          levelCollectibleFlag(0x23, "Student") +
          levelCollectibleFlag(0x24, "Student") +
          // Year 1 - Flag         | Year 2 - Flag            | Year 3 - Flag            | Year 4 - Flag
          brickEventFlag(0x052, 1) + brickEventFlag(0x08F, 1) + brickEventFlag(0x0CF, 1) + brickEventFlag(0x119, 1) + // Student captured in Devil's Snare near Hagrid's Hut
          brickEventFlag(0x051, 1) + brickEventFlag(0x08E, 1) + brickEventFlag(0x0CE, 1) + brickEventFlag(0x118, 1) + // Student hanging above Bookcase in Main Foyer
          brickEventFlag(0x05C, 1) + brickEventFlag(0x098, 1) + brickEventFlag(0x0DC, 1) + brickEventFlag(0x128, 1) + // Student stuck on the Viewer Ledge at Quidditch Field
                                     brickEventFlag(0x090, 1) + brickEventFlag(0x0DA, 1) + brickEventFlag(0x129, 1) + // Student in Basket-Pumpkin-Balloon in Hagrid's Garden
                                                                                           brickEventFlag(0x12A, 1) + // Student on Post which needs Bridge at Black Lake
                                                                brickEventFlag(0x0DB, 1) +                            // Student stuck under Pumpkin in Hagrid's Harden
                                                                brickEventFlag(0x0DD, 1) +                            // Student stuck in Chest at Quidditch Field
          brickEventFlag(0x060, 1) + brickEventFlag(0x09F, 1) + brickEventFlag(0x0DE, 1) + brickEventFlag(0x13A, 1) + // Student trying to get Ball near Charms Class
                                                                brickEventFlag(0x0DF, 1) +                            // Student captured in Spider Web in Clock Tower Engine Room
          brickEventFlag(0x066, 1) + brickEventFlag(0x0A9, 1) + brickEventFlag(0x0E3, 1) + brickEventFlag(0x13D, 1) + // Student bullied by other Students in Clock Tower Courtyard
                                     brickEventFlag(0x0AB, 1) +                                                       // Student imprisoned in Cell in Herbology Class
          brickEventFlag(0x061, 1) +                                                                                  // Student captured in Spider Web in Charms Class Dungeon
          brickEventFlag(0x062, 1) +                                                                                  // Student captured in Devil's Snare in Lumos Dungeon
                                                                brickEventFlag(0x0E5, 1) + brickEventFlag(0x13F, 1) + // Student captured in Scroll in Owl Tower
                                                                brickEventFlag(0x0E6, 1) +                            // Student captured in Feeding Stand in Owl Tower
                                                                brickEventFlag(0x0E7, 1) + brickEventFlag(0x140, 1) + // Student daptured in Spider Web in Clock Tower
          brickEventFlag(0x069, 1) + brickEventFlag(0x0AC, 1) + brickEventFlag(0x0F7, 1) + brickEventFlag(0x141, 1) + // Student stuck in Banner in Main Corridor
          brickEventFlag(0x06B, 1) + brickEventFlag(0x0AD, 1) + brickEventFlag(0x0F8, 1) + brickEventFlag(0x142, 1) + // Student captured in Spider Web in Great Hall
                                     brickEventFlag(0x0AF, 1) + brickEventFlag(0x0F9, 1) + brickEventFlag(0x144, 1) + // Student stuck in Toilet in Boys' Bathroom
          brickEventFlag(0x06F, 1) + brickEventFlag(0x0BD, 1) + brickEventFlag(0x0FF, 1) + brickEventFlag(0x148, 1) + // Student captured in Spider Web in Grand Staircase
                                                                brickEventFlag(0x100, 1) + brickEventFlag(0x149, 1) + // Student harassed by Mandrake in Library
          brickEventFlag(0x07C, 1) + brickEventFlag(0x0BE, 1) + brickEventFlag(0x101, 1) + brickEventFlag(0x14C, 1) + // Student harassed by Mandrake in Hufflepuff Dorm
          brickEventFlag(0x07F, 1) + brickEventFlag(0x0BF, 1) + brickEventFlag(0x102, 1) + brickEventFlag(0x14D, 1) + // Student wrapped inside the Couch in Gryffindor Dome
                                                                                           brickEventFlag(0x14E, 1) + // Student locked behind Bookshelf in Slytherin Dome
                                                                brickEventFlag(0x108, 1) + brickEventFlag(0x14F, 1) + // Student afraid by Living Book in Ravenclaw Dome
                                     brickEventFlag(0x0C0, 1) + brickEventFlag(0x109, 1) + brickEventFlag(0x150, 1) + // Student locked inside Fireplace in Hufflepuff Dome
        0
}

function calculateGoldBricks() {
    return levelCollectibleFlag(0x01, "Story") + 
           levelCollectibleFlag(0x06, "Story") + 
           levelCollectibleFlag(0x07, "Story") + 
           levelCollectibleFlag(0x0A, "Story") + 
           levelCollectibleFlag(0x08, "Story") + 
           levelCollectibleFlag(0x0B, "Story") + 
           levelCollectibleFlag(0x0C, "Story") + 
           levelCollectibleFlag(0x10, "Story") + 
           levelCollectibleFlag(0x11, "Story") + 
           levelCollectibleFlag(0x13, "Story") + 
           levelCollectibleFlag(0x14, "Story") + 
           levelCollectibleFlag(0x15, "Story") + 
           levelCollectibleFlag(0x16, "Story") + 
           levelCollectibleFlag(0x18, "Story") + 
           levelCollectibleFlag(0x19, "Story") + 
           levelCollectibleFlag(0x1A, "Story") + 
           levelCollectibleFlag(0x1B, "Story") + 
           levelCollectibleFlag(0x1C, "Story") + 
           levelCollectibleFlag(0x1D, "Story") + 
           levelCollectibleFlag(0x1F, "Story") + 
           levelCollectibleFlag(0x20, "Story") + 
           levelCollectibleFlag(0x22, "Story") + 
           levelCollectibleFlag(0x23, "Story") + 
           levelCollectibleFlag(0x24, "Story") + 
           calculateStudentsInPeril() +
           calculateTrueWizards() +
           calculateCrests() +
           skillEventFlag(0x03, 0) +
           skillEventFlag(0x03, 1) +
           skillEventFlag(0x03, 2) +
           skillEventFlag(0x03, 5) +
           skillEventFlag(0x03, 6) +
           skillEventFlag(0x03, 7) +
           skillEventFlag(0x04, 2) +
           skillEventFlag(0x04, 3) +
           skillEventFlag(0x04, 4) +
           skillEventFlag(0x04, 5) +
           skillEventFlag(0x04, 6) +
           skillEventFlag(0x04, 7) +
           skillEventFlag(0x05, 2) +
           skillEventFlag(0x05, 7) +
           skillEventFlag(0x06, 6) +
           // Year 1 - Flag         | Year 2 - Flag            | Year 3 - Flag            | Year 4 - Flag
           brickEventFlag(0x043, 2) +                                                                                  // Gold Brick for cöeaning Eeylops Owl Emporium
           brickEventFlag(0x045, 2) +                                                                                  // Gold Brick behind Borgin & Burkes Counter
           brickEventFlag(0x051, 2) + brickEventFlag(0x08E, 2) + brickEventFlag(0x0CE, 2) + brickEventFlag(0x118, 2) + // Gold Brick for hitting six Candles in Main Foyer
           brickEventFlag(0x052, 2) + brickEventFlag(0x08F, 2) + brickEventFlag(0x0CF, 2) + brickEventFlag(0x119, 2) + // Gold Brick for cleaning three Monoliths near Hagrid's Hut
           brickEventFlag(0x05C, 2) + brickEventFlag(0x098, 2) + brickEventFlag(0x0DC, 2) + brickEventFlag(0x128, 2) + // Gold Brick for rolling Ball into Chest at Quidditch Field
                                      brickEventFlag(0x090, 2) + brickEventFlag(0x0DA, 2) + brickEventFlag(0x129, 2) + // Gold Brick for curing Ron's Slugulus Eructo
                                                                                            brickEventFlag(0x12A, 2) + // Gold Brick for swimming through all Poles with Frog at Black Lake                                                          brickEventFlag(0x0DB, 2) +                            // Gold Brick for hatching Norbert in Hagrid's Garden
                                                                 brickEventFlag(0x0DB, 2) +                            // Gold Brick for hatching Norbert in Hagrid's Garden
                                                                 brickEventFlag(0x0DD, 2) +                            // Gold Brick for doing Musical at Quidditch Field
                                                                 brickEventFlag(0x0DF, 2) +                            // Gold Brick for destroying the Pixie Statue in the Clock Tower
                                                                 brickEventFlag(0x0E1, 2) +                            // Gold Brick for placing 3 Coffee Cups in Divination Class
                                                                 brickEventFlag(0x0E8, 2) +                            // Gold Brick for repairing and setting up the Clock Tower Clock
           brickEventFlag(0x061, 2) +                                                                                  // Gold Brick for escaping Charms Class Dungeon with Dragon
           brickEventFlag(0x062, 2) +                                                                                  // Gold Brick for finishing Lumos Class Dungeon
           brickEventFlag(0x065, 2) +                                                                                  // Gold Brick for finishing Transfiguration Challenge 2
           brickEventFlag(0x060, 2) + brickEventFlag(0x09F, 2) + brickEventFlag(0x0DE, 2) + brickEventFlag(0x13A, 2) + // Gold Brick for solving H-Puzzle and its Maze in Class Foyer
                                                                                            brickEventFlag(0x13B, 2) + // Gold Brick for solving the Slytherin Bathroom
                                                                                            brickEventFlag(0x13C, 2) + // Gold Brick for destroying all seven Metallic Objects in Defence Against the Dark Arts Class II
           brickEventFlag(0x066, 2) + brickEventFlag(0x0A9, 2) + brickEventFlag(0x0E3, 2) + brickEventFlag(0x13D, 2) + // Gold Brick for flying through all Rings in the Clock Tower Courtyard
           brickEventFlag(0x067, 2) + brickEventFlag(0x0AA, 2) + brickEventFlag(0x0E4, 2) + brickEventFlag(0x13E, 2) + // Gold Brick for flying through all Rings in the Training Grounds
                                      brickEventFlag(0x0AB, 1) +                                                       // Gold Brick high in the Air in Herbology Class
                                                                 brickEventFlag(0x0E5, 2) + brickEventFlag(0x13F, 2) + // Gold Brick for opening the upper Chest in Owl Tower
                                                                 brickEventFlag(0x0E6, 2) +                            // Gold Brick for using Owl Mail Boxes in Owl Tower
                                                                 brickEventFlag(0x0E7, 2) + brickEventFlag(0x140, 2) + // Gold Brick for ringing the Clock Tower Bell
           brickEventFlag(0x069, 2) + brickEventFlag(0x0AC, 2) + brickEventFlag(0x0F7, 2) + brickEventFlag(0x141, 2) + // Gold Brick for hitting four Banners in Main Corridor
           brickEventFlag(0x06B, 2) + brickEventFlag(0x0AD, 2) + brickEventFlag(0x0F8, 2) + brickEventFlag(0x142, 2) + // Gold Brick for preparing all Dining Tables in Great Hall
                                      brickEventFlag(0x0AF, 2) + brickEventFlag(0x0F9, 2) + brickEventFlag(0x144, 2) + // Gold Brick left behind the Snail in the Bathroom Corridor
           brickEventFlag(0x06F, 2) + brickEventFlag(0x0BD, 2) + brickEventFlag(0x0FF, 2) + brickEventFlag(0x148, 2) + // Gold Brick for leading Quidditch Ball to Dog Painting
                                                                 brickEventFlag(0x100, 2) + brickEventFlag(0x149, 2) + // Gold Brick for hitting three Wizard Hats in Library
                                                                                            brickEventFlag(0x14A, 2) + // Gold Brick for finding three Bunnies in Muggle Room
                                                                                            brickEventFlag(0x14B, 2) + // Gold Brick for opening the Chest in Professor Dumbledore's Office
           brickEventFlag(0x07C, 2) + brickEventFlag(0x0BE, 2) + brickEventFlag(0x101, 2) + brickEventFlag(0x14C, 2) + // Gold Brick for hitting five Banners in Dorm Hallway
           brickEventFlag(0x07F, 2) + brickEventFlag(0x0BF, 2) + brickEventFlag(0x102, 2) + brickEventFlag(0x14D, 2) + // Gold Brick for hitting four Beds in Gryffindor Dome
                                                                                            brickEventFlag(0x14E, 2) + // Gold Brick for filling Bath with Water in Slytherin Room
                                                                 brickEventFlag(0x103, 2) +                            // Gold Brick hidden inside Chest in Gryffindor Boy Room
                                                                 brickEventFlag(0x108, 2) + brickEventFlag(0x14F, 2) + // Gold Brick for hitting five Yellow Books in Ravenclaw Dorm
                                      brickEventFlag(0x0C0, 2) + brickEventFlag(0x109, 2) + brickEventFlag(0x150, 2) + // Gold Brick for taking Cake out of Oven to Painting in Hufflepuff Dome
           calculateClearedBonusLevels() +
           diagonGoldBrick(0) +
           diagonGoldBrick(1) +
           diagonGoldBrick(2) +
           diagonGoldBrick(3) +
           bit0(extrasUnlocked - 0xE) +
           bit1(extrasUnlocked - 0xE) +
           bit2(extrasUnlocked - 0xE) +
           bit3(extrasUnlocked - 0xE) +
           bit4(extrasUnlocked - 0xE) +
           bit5(extrasUnlocked - 0xE) +
           bit6(extrasUnlocked - 0xE) +
           bit7(extrasUnlocked - 0xE) +
           bit0(extrasUnlocked - 0xF) +
           bit1(extrasUnlocked - 0xF) +
           bit2(extrasUnlocked - 0xF) +
           bit3(extrasUnlocked - 0xF) +
         0
}

function calculateClearedBonusLevels() {
    return brickEventFlag(0x152, 7) + // Gold Brick for Bonus Level 1
           brickEventFlag(0x153, 7) + // Gold Brick for Bonus Level 2
           brickEventFlag(0x154, 7) + // Gold Brick for Bonus Level 3
           brickEventFlag(0x155, 7) + // Gold Brick for Bonus Level 4
           brickEventFlag(0x156, 7) + // Gold Brick for Bonus Level 5
           brickEventFlag(0x157, 7) + // Gold Brick for Bonus Level 6
           brickEventFlag(0x158, 7) + // Gold Brick for Bonus Level 7
           brickEventFlag(0x159, 7) + // Gold Brick for Bonus Level 8
           brickEventFlag(0x15A, 7) + // Gold Brick for Bonus Level 9
           brickEventFlag(0x15B, 7) + // Gold Brick for Bonus Level 10
         0
}

function checkBuilderProgress() {
    return brickEventFlag(0x15E, 7) + // Builder Level - Part 1
           brickEventFlag(0x15F, 7) + // Builder Level - Part 2
           brickEventFlag(0x160, 7) + // Builder Level - Part 3
           brickEventFlag(0x161, 7) + // Builder Level - Part 4
         0
}

function sleepyNevilleGotFrozen() {
    code = always_false()
    
    for i in range (1, 6) {
        spellIndexCalc1 = dword_be(0x868254) + 32
        spellIndexCalc2 = spellIndexCalc1 - i
        spellIndexCalc3 = spellIndexCalc2 % 32
        spellIndexCalc4 = spellIndexCalc3 * 0x168
    
        for j in range (0x00, 0x07) {
            addressForSlotStart = (dword_be(0x868250) & 0x7FFFFFFF) + (spellIndexCalc4)
            
            code = code || // Check for Neville being frozen
                           (checkCharacterExistence(j) &&
                            (getCharacterID(j) >= 0x76 &&
                             getCharacterID(j) <= 0x78) &&
                            getCharacterAnimation(j) == 0x1D &&
                            prev(getCharacterAnimation(j)) != 0x1D &&
                            // Check for spell "freeze" and spell disappears
                            dword_be((dword_be(addressForSlotStart) & 0x7FFFFFFF) + 0) == 0x66726565 &&
                             word_be((dword_be(addressForSlotStart) & 0x7FFFFFFF) + 4) == 0x7A65 &&
                            bit7(addressForSlotStart + 0x118) < prev(bit7(addressForSlotStart + 0x118)) // &&
                            // Check for Hermione shot Spell
                            // any_of(hermioneIDs, hermioneID => __ornext(word_be((dword_be(addressForSlotStart + 0x04) & 0x7FFFFFFF) + 0x1362) == hermioneID))
                            )
        }
    }
    
    return code
}

function hitTentacleCrate() {
    code = always_false() 
    
    for i in range (1, 6) {
        spellIndexCalc1 = dword_be(0x868254) + 32
        spellIndexCalc2 = spellIndexCalc1 - i
        spellIndexCalc3 = spellIndexCalc2 % 32
        spellIndexCalc4 = spellIndexCalc3 * 0x168
        
        addressForSlotStart = (dword_be(0x868250) & 0x7FFFFFFF) + (spellIndexCalc4)
        
        code = code || (ascii_string_equals(prev((dword_be((addressForSlotStart + 0x08) & 0x7FFFFFFF) & 0x7FFFFFFF) + 0x1C) , "icrate_lock_t") &&
                       bit6(prev(dword_be((addressForSlotStart + 0x08) & 0x7FFFFFFF) & 0x7FFFFFFF) + 0x4E) <
                        prev(bit6(prev(dword_be((addressForSlotStart + 0x08) & 0x7FFFFFFF) & 0x7FFFFFFF) + 0x4E)))
    }
    
    return code
}

function hitCelebrationLocker() {
    code = always_false() 
    
    for i in range (1, 6) {
        spellIndexCalc1 = dword_be(0x868254) + 32
        spellIndexCalc2 = spellIndexCalc1 - i
        spellIndexCalc3 = spellIndexCalc2 % 32
        spellIndexCalc4 = spellIndexCalc3 * 0x168
        
        addressForSlotStart = (dword_be(0x868250) & 0x7FFFFFFF) + (spellIndexCalc4)
        
        code = code || (ascii_string_equals(prev((dword_be((addressForSlotStart + 0x08) & 0x7FFFFFFF) & 0x7FFFFFFF) + 0x1C) , "LOCK8") &&
                       bit2(prev(dword_be((addressForSlotStart + 0x08) & 0x7FFFFFFF) & 0x7FFFFFFF) + 0x4E) <
                        prev(bit2(prev(dword_be((addressForSlotStart + 0x08) & 0x7FFFFFFF) & 0x7FFFFFFF) + 0x4E)))
    }
    
    return code
}

function hitWhompingWillowNotWithNeville() {
    code = always_false() 
    
    for i in range (1, 6) {
        spellIndexCalc1 = dword_be(0x868254) + 32
        spellIndexCalc2 = spellIndexCalc1 - i
        spellIndexCalc3 = spellIndexCalc2 % 32
        spellIndexCalc4 = spellIndexCalc3 * 0x168
        
        addressForSlotStart = (dword_be(0x868250) & 0x7FFFFFFF) + (spellIndexCalc4)
        addressChainForWillowObject = (dword_be(prev((dword_be(addressForSlotStart + 0x08) & 0x7FFFFFFF) & 0x7FFFFFFF) + 0xD04) & 0x7FFFFFFF)
        
        code = code || // Check for spell "freeze" and spell disappears
                       word_be(addressChainForWillowObject + 0x1362) == 0x1FD &&
                       prev(word_be(addressChainForWillowObject + 0x1362)) == 0x1FD &&
                       byte(addressChainForWillowObject + 0x137B) < prev(byte(addressChainForWillowObject + 0x137B)) &&
                       // Check for Neville did not shot Spell
                       word_be((dword_be(addressForSlotStart + 0x04) & 0x7FFFFFFF) + 0x1362) != 0x76 &&
                       word_be((dword_be(addressForSlotStart + 0x04) & 0x7FFFFFFF) + 0x1362) != 0x77 &&
                       word_be((dword_be(addressForSlotStart + 0x04) & 0x7FFFFFFF) + 0x1362) != 0x78
    }
    
    return code
}

//--------------------------------------------------
// Achievements
achievement(
    title = "Wizard with a Name", type = "progression",
    description = "Complete 'The Magic Begins' in Story mode.",
    id = 546986, badge = "622228", points = 5,
    trigger = checkLevelID(0x01) && 
              levelMode("Story") &&
              prev(checkMapID(0x48)) &&
                   checkMapID(0x4B)
)

achievement(
    title = "Down the Drain", type = "progression",
    description = "Complete 'Out of the Dungeon' in Story mode.",
    id = 546987, badge = "622128", points = 5,
    trigger = checkLevelID(0x06) && 
              levelMode("Story") &&
              prev(checkMapID(0x6D)) &&
                   checkMapID(0x6E)
)

achievement(
    title = "Celebrating Fireworks", type = "progression",
    description = "Complete 'A Jinxed Broom' in Story mode.",
    id = 546988, badge = "622129", points = 5,
    trigger = checkLevelID(0x07) && 
              levelMode("Story") &&
              prev(checkMapID(0x5D)) &&
                   checkMapID(0x5E)
)

achievement(
    title = "Mood Relive on Peek", type = "progression",
    description = "Complete 'The Restricted Section' in Story mode.",
    id = 547189, badge = "622691", points = 5,
    trigger = checkLevelID(0x0A) && 
              levelMode("Story") &&
              prev(checkMapID(0x7A)) &&
                   checkMapID(0x7B)
)

achievement(
    title = "Sight Between Woods", type = "progression",
    description = "Complete 'The Forbidden Forest' in Story mode.",
    id = 547411, badge = "622420", points = 5,
    trigger = checkLevelID(0x08) && 
              levelMode("Story") &&
              prev(checkMapID(0x58)) &&
                   checkMapID(0x5A)
)

achievement(
    title = "Desire to Protect", type = "progression",
    description = "Complete 'Face of the Enemy' in Story mode.",
    id = 547676, badge = "622685", points = 10,
    trigger = checkLevelID(0x0B) && 
              levelMode("Story") &&
              prev(checkMapID(0x74)) &&
                   checkMapID(0x75)
)

achievement(
    title = "Burrow with Detours", type = "progression",
    description = "Complete 'Floo Powder!' in Story mode.",
    id = 547680, badge = "622689", points = 5,
    trigger = checkLevelID(0x0C) && 
              levelMode("Story") &&
              prev(checkMapID(0x88)) &&
                   checkMapID(0x8D)
)

achievement(
    title = "Harry in Mortal Danger", type = "progression",
    description = "Complete 'Dobby's Plan' in Story mode.",
    id = 548212, badge = "623313", points = 5,
    trigger = checkLevelID(0x10) && 
              levelMode("Story") &&
              prev(checkMapID(0x9D)) &&
                   checkMapID(0x9E)
)

achievement(
    title = "Slitherin' In", type = "progression",
    description = "Complete 'Crabbe and Goyle' in Story mode.",
    id = 548213, badge = "623315", points = 5,
    trigger = checkLevelID(0x11) && 
              levelMode("Story") &&
              prev(checkMapID(0xB2)) &&
                   checkMapID(0xB3)
)

achievement(
    title = "Blast Through the Past", type = "progression",
    description = "Complete 'Tom Riddle's Diary' in Story mode.",
    id = 548388, badge = "623506", points = 5,
    trigger = checkLevelID(0x13) && 
              levelMode("Story") &&
              prev(checkMapID(0xB7)) &&
                   checkMapID(0xB8)
)

achievement(
    title = "Humans Are Food, Not Friends!", type = "progression",
    description = "Complete 'Follow the Spiders' in Story mode.",
    id = 548639, badge = "623760", points = 5,
    trigger = checkLevelID(0x14) && 
              levelMode("Story") &&
              prev(checkMapID(0x96)) &&
                   checkMapID(0x95)
)

achievement(
    title = "Salazar Slytherin's Secret Serpent", type = "progression",
    description = "Complete 'The Basilisk' in Story mode.",
    id = 549153, badge = "623864", points = 10,
    trigger = checkLevelID(0x15) && 
              levelMode("Story") &&
              prev(checkMapID(0xA7)) &&
                   checkMapID(0xA8)
)

achievement(
    title = "Soul Freezing Moonlight", type = "progression",
    description = "Complete 'News From Azkaban' in Story mode.",
    id = 549551, badge = "624156", points = 5,
    trigger = checkLevelID(0x16) && 
              levelMode("Story") &&
              prev(checkMapID(0xCB)) &&
                   checkMapID(0xCC)
)

achievement(
    title = "Passage to the Village", type = "progression",
    description = "Complete 'Hogsmeade' in Story mode.",
    id = 549946, badge = "624381", points = 5,
    trigger = checkLevelID(0x18) && 
              levelMode("Story") &&
              prev(checkMapID(0xFD)) &&
                   checkMapID(0xFE)
)

achievement(
    title = "Midnight Tag Hunting", type = "progression",
    description = "Complete 'Mischief Managed' in Story mode.",
    id = 549960, badge = "624389", points = 5,
    trigger = checkLevelID(0x19) && 
              levelMode("Story") &&
              prev(checkMapID(0x106)) &&
                   checkMapID(0x107)
)

achievement(
    title = "Beast Inside You", type = "progression",
    description = "Complete 'The Shrieking Shack' in Story mode.",
    id = 550167, badge = "624806", points = 5,
    trigger = checkLevelID(0x1A) && 
              levelMode("Story") &&
              prev(checkMapID(0xD6)) &&
                   checkMapID(0xD8)
)

achievement(
    title = "Portable Déjà Two", type = "progression",
    description = "Complete 'Dementor's Kiss' in Story mode.",
    id = 550210, badge = "624805", points = 5,
    trigger = checkLevelID(0x1B) && 
              levelMode("Story") &&
              prev(checkMapID(0xEC)) &&
                   checkMapID(0xEF)
)

achievement(
    title = "Escape of the Outlaws", type = "progression",
    description = "Complete 'The Dark Tower' in Story mode.",
    id = 550365, badge = "624952", points = 10,
    trigger = checkLevelID(0x1C) && 
              levelMode("Story") &&
              prev(checkMapID(0xF5)) &&
                   checkMapID(0xF6)
)

achievement(
    title = "An Unforgettable Event", type = "progression",
    description = "Complete 'The Quidditch World Cup' in Story mode.",
    id = 550393, badge = "625029", points = 5,
    trigger = checkLevelID(0x1D) && 
              levelMode("Story") &&
              prev(checkMapID(0x114)) &&
                   checkMapID(0x115)
)

achievement(
    title = "Forbidden Knowledge in the Woods", type = "progression",
    description = "Complete 'Dragons' in Story mode.",
    id = 550409, badge = "625042", points = 5,
    trigger = checkLevelID(0x1F) && 
              levelMode("Story") &&
              prev(checkMapID(0x11D)) &&
                   checkMapID(0x11E)
)

achievement(
    title = "Like Snatching an Egg from A Chicken", type = "progression",
    description = "Complete 'The First Task' in Story mode.",
    id = 550571, badge = "625502", points = 5,
    trigger = checkLevelID(0x20) && 
              levelMode("Story") &&
              prev(checkMapID(0x124)) &&
                   checkMapID(0x126)
)

achievement(
    title = "A Message from Beyond", type = "progression",
    description = "Complete 'Secret of the Egg' in Story mode.",
    id = 550577, badge = "625509", points = 5,
    trigger = checkLevelID(0x22) && 
              levelMode("Story") &&
              prev(checkMapID(0x146)) &&
                   checkMapID(0x147)
)

achievement(
    title = "One You Need, Three You Freed", type = "progression",
    description = "Complete 'The Black Lake' in Story mode.",
    id = 550581, badge = "625511", points = 5,
    trigger = checkLevelID(0x23) && 
              levelMode("Story") &&
              prev(checkMapID(0x130)) &&
                   checkMapID(0x131)
)

achievement(
    title = "An Unpleasant Triumph", type = "progression",
    description = "Complete 'The Dark Lord Returns' in Story mode.",
    id = 550583, badge = "625513", points = 10,
    trigger = checkLevelID(0x24) && 
              levelMode("Story") &&
              prev(checkMapID(0x138)) &&
                   checkMapID(0x139)
)

achievement(
    title = "Secret Gardens of Gringotts", type = "",
    description = "Complete all 10 bonus levels in the Gringotts Vault.",
    id = 552124, badge = "627112", points = 10,
    trigger = checkLevelID(0x25) && 
              __ornext(checkMapID(0x152) || 
                       checkMapID(0x153) || 
                       checkMapID(0x154) || 
                       checkMapID(0x155) || 
                       checkMapID(0x156) || 
                       checkMapID(0x157) || 
                       checkMapID(0x158) || 
                       checkMapID(0x159) || 
                       checkMapID(0x15A) || 
                       checkMapID(0x15B)) &&
              measured(calculateClearedBonusLevels() == 10) &&
              prev(calculateClearedBonusLevels()) == 9
)

achievement(
    title = "Everything Is Awesome!", type = "",
    description = "Become a Master Builder by completing all Builder Levels.",
    id = 552125, badge = "627118", points = 5,
    trigger = checkLevelID(0x26) &&
              checkMapID(0x44) &&
              measured(checkBuilderProgress() == 4) &&
              prev(checkBuilderProgress()) == 3
)

achievement(
    title = "Destiny of a Young Wizard", type = "",
    description = "Complete 'Harry's Destiny' in Borgin & Burkes.",
    id = 552294, badge = "627307", points = 5,
    trigger = checkLevelID(0x27) && 
              levelMode("Story") &&
              prev(checkMapID(0x36)) &&
                   checkMapID(0x37)
)

achievement(
    title = "Her Might Nausea", type = "",
    description = "Win the fight against the Troll within 60 seconds.",
    id = 553054, badge = "628021", points = 3,
    trigger = checkLevelID(0x06) &&
              never(getMapID() == prev(getMapID()) &&
                    dword_be(0x00868f40) == prev(dword_be(0x00868f40)) &&
                    !checkMapID(0x6D) &&
                    !checkMapID(0x6E)) && 
              startBossFight(0x1BD) &&
              winBossFightHealth() &&
              never(repeated(3601, word_be((dword_be(pointerBoss) & 0x7FFFFFFF) + 0x1362) == 0x1BD))
)

achievement(
    title = "Burned to Pieces", type = "",
    description = "Win the fight against Professor Quirrell without taking damage.",
    id = 553060, badge = "628032", points = 5,
    trigger = checkLevelID(0x0B) &&
              never(isInvincible()) &&
              never(getMapID() == prev(getMapID()) &&
                    dword_be(0x00868f40) == prev(dword_be(0x00868f40)) &&
                    !checkMapID(0x74)) && 
              startBossFight(0xBD) &&
              winBossFightHealth() &&
              never(checkCharacterExistence(0) &&
                    getCharacterIsPlayer(0) == 1 && 
                    characterTookDamage(0)) &&
              never(checkCharacterExistence(1) &&
                    getCharacterIsPlayer(1) == 1 && 
                    characterTookDamage(1))
)

achievement(
    title = "Quick Quidditch Rescue", type = "",
    description = "Stop Dobby's plan within 150 seconds.",
    id = 553070, badge = "628034", points = 5,
    trigger = checkLevelID(0x10) &&
              never(getMapID() == prev(getMapID()) &&
                    dword_be(0x00868f40) == prev(dword_be(0x00868f40)) &&
                    !checkMapID(0x9A) &&
                    !checkMapID(0x9B)) && 
              startBossFight(0xEB) &&
              winBossFightHealth() &&
              never(repeated(9001, word_be((dword_be(pointerBoss) & 0x7FFFFFFF) + 0x1362) == 0xEB))
)

achievement(
    title = "Calm Down the Clumsy", type = "",
    description = "During the fight against Moaning Myrtle, deplete the health of your partner completely while they are panicking using only thrown objects and without taking damage yourself.",
    id = 548266, badge = "623358", points = 5,
    trigger = checkLevelID(0x13) &&
              never(isInvincible()) &&
              never(!checkMapID(0xB4)) && 
              never(checkCharacterExistence(0) &&
                    getCharacterIsPlayer(0) == 1 && 
                    characterTookDamage(0)) &&
              never(checkCharacterExistence(1) &&
                    getCharacterIsPlayer(1) == 1 && 
                    characterTookDamage(1)) &&
              ((once(getCharacterMaxHealth(1) == getCharacterHealth(1) &&
                     never(getCharacterIsPlayer(1) == 1)) &&
                     trigger_when(prev(getCharacterHealth(1)) == 1 &&
                                  getCharacterHealth(1) == 0)) ||
               (once(getCharacterMaxHealth(2) == getCharacterHealth(2) &&
                     never(getCharacterIsPlayer(2) == 1)) &&
                     trigger_when(prev(getCharacterHealth(2)) == 1 &&
                                  getCharacterHealth(2) == 0)))
)

achievement(
    title = "Arachnia Immortilus", type = "",
    description = "Win the fight against Aragog without taking damage or getting captured in a spider web.",
    id = 548390, badge = "623508", points = 5,
    trigger = checkLevelID(0x14) &&
              never(isInvincible()) &&
              never(getMapID() == prev(getMapID()) &&
                    dword_be(0x00868f40) == prev(dword_be(0x00868f40)) &&
                    !checkMapID(0x93) &&
                    !checkMapID(0x94)) && 
              startBossFight(0x1A5) &&
              winBossFight(0x94) &&
              never(checkCharacterExistence(0) &&
                    getCharacterIsPlayer(0) == 1 && 
                    characterTookDamage(0)) &&
              never(checkCharacterExistence(1) &&
                    getCharacterIsPlayer(1) == 1 && 
                    characterTookDamage(1)) &&
              never(checkCharacterExistence(0) &&
                    getCharacterIsPlayer(0) == 1 && 
                    getCharacterAnimation(0) == 0x9A) &&
              never(checkCharacterExistence(1) &&
                    getCharacterIsPlayer(1) == 1 && 
                    getCharacterAnimation(1) == 0x9A)
)

achievement(
    title = "It's Just a Tiny Bit Bigger Snake", type = "",
    description = "Win the fight against the Basilisk without taking damage or getting paralyzed.",
    id = 549152, badge = "623863", points = 5,
    trigger = checkLevelID(0x15) &&
              never(isInvincible()) &&
              never(getMapID() == prev(getMapID()) &&
                    dword_be(0x00868f40) == prev(dword_be(0x00868f40)) &&
                    !checkMapID(0xA7)) && 
              startBossFight(0x1F3) &&
              winBossFight(0xA8) &&
              never(checkCharacterExistence(0) &&
                    getCharacterIsPlayer(0) == 1 && 
                    characterTookDamage(0)) &&
              never(checkCharacterExistence(1) &&
                    getCharacterIsPlayer(1) == 1 && 
                    characterTookDamage(1)) &&
              never(checkCharacterExistence(0) &&        
                    getCharacterIsPlayer(0) == 1 && 
                    getCharacterAnimation(0) == 0x1D) &&
              never(checkCharacterExistence(1) &&
                    getCharacterIsPlayer(1) == 1 && 
                    getCharacterAnimation(1) == 0x1D) &&
              resetOnLevelLeave()
)

achievement(
    title = "Monsters Under My Bed", type = "",
    description = "Win the fight against the Monster Book of Monsters without touching the floor of the room for more than 1 second with controlled characters.",
    id = 553106, badge = "628036", points = 5,
    trigger = checkLevelID(0x16) &&
              never(getMapID() == prev(getMapID()) &&
                    dword_be(0x00868f40) == prev(dword_be(0x00868f40)) &&
                    !checkMapID(0xC8)) && 
              startBossFight(0x1F8) &&
              winBossFightHealth() &&
              never(tally(61, checkCharacterExistence(0) &&
                                  getCharacterIsPlayer(0) == 1 &&
                                  getCharacterYCoordinate(0) <= 1.398 &&
                                  getCharacterYCoordinate(0) >= 1.370 &&
                                  getCharacterAnimation(0) != 0x69,
                              checkCharacterExistence(1) &&
                                  getCharacterIsPlayer(1) == 1 &&
                                  getCharacterYCoordinate(1) <= 1.398 &&
                                  getCharacterYCoordinate(1) >= 1.370 &&
                                  getCharacterAnimation(1) != 0x69))
)

achievement(
    title = "Snow White and the Thugs", type = "",
    description = "Win the fight against Draco Malfoy in Hogsmeade without taking damage.",
    id = 549824, badge = "624330", points = 3,
    trigger = checkLevelID(0x18) &&
              never(isInvincible()) &&
              never(getMapID() == prev(getMapID()) &&
                    dword_be(0x00868f40) == prev(dword_be(0x00868f40)) &&
                    !checkMapID(0xFC)) && 
              startBossFight(0xB6) &&
              winBossFightHealth() &&
              never(checkCharacterExistence(0) &&
                    getCharacterIsPlayer(0) == 1 && 
                    characterTookDamage(0)) &&
              never(checkCharacterExistence(1) &&
                    getCharacterIsPlayer(1) == 1 && 
                    characterTookDamage(1))
)

achievement(
    title = "Neville and His Revenge on Living Plants", type = "",
    description = "Win the fight against the Whomping Willow without taking damage and only using Neville Longbottom to deal damage.",
    id = 553418, badge = "628402", points = 2,
    trigger = checkLevelID(0x1A) &&
              never(isInvincible()) &&
              never(getMapID() == prev(getMapID()) &&
                    dword_be(0x00868f40) == prev(dword_be(0x00868f40)) &&
                    !checkMapID(0xD1)) && 
              startBossFight(0x1FD) &&
              winBossFightHealth() &&
              never(checkCharacterExistence(0) &&
                    getCharacterIsPlayer(0) == 1 && 
                    characterTookDamage(0)) &&
              never(checkCharacterExistence(1) &&
                    getCharacterIsPlayer(1) == 1 && 
                    characterTookDamage(1)) &&
              never(hitWhompingWillowNotWithNeville()) &&
              tally(1, (checkCharacterExistence(0) &&
                           getCharacterID(0) >= 0x76 &&
                           getCharacterID(0) <= 0x78),
                       (checkCharacterExistence(1) &&
                           getCharacterID(1) >= 0x76 &&
                           getCharacterID(1) <= 0x78),
                       (checkCharacterExistence(2) &&
                           getCharacterID(2) >= 0x76 &&
                           getCharacterID(2) <= 0x78),
                       (checkCharacterExistence(3) &&
                           getCharacterID(3) >= 0x76 &&
                           getCharacterID(3) <= 0x78),
                       (checkCharacterExistence(4) &&
                           getCharacterID(4) >= 0x76 &&
                           getCharacterID(4) <= 0x78),
                       (checkCharacterExistence(5) &&
                           getCharacterID(5) >= 0x76 &&
                           getCharacterID(5) <= 0x78),
                       (checkCharacterExistence(6) &&
                           getCharacterID(6) >= 0x76 &&
                           getCharacterID(6) <= 0x78),
                       (checkCharacterExistence(7) &&
                           getCharacterID(7) >= 0x76 &&
                           getCharacterID(7) <= 0x78))
)

achievement(
    title = "Breathtaking Fight in the Cold", type = "",
    description = "Win the fight against the Master Dementor without taking damage or jumping.",
    id = 550209, badge = "624804", points = 5,
    trigger = checkLevelID(0x1C) &&
              never(isInvincible()) &&
              never(getMapID() == prev(getMapID()) &&
                    dword_be(0x00868f40) == prev(dword_be(0x00868f40)) &&
                    !checkMapID(0xF4) &&
                    !checkMapID(0xF5)) && 
              startBossFight(0x19A) &&
              winBossFight(0xF5) &&
              never(checkCharacterExistence(0) &&
                    getCharacterIsPlayer(0) == 1 && 
                    characterTookDamage(0)) &&
              never(checkCharacterExistence(1) &&
                    getCharacterIsPlayer(1) == 1 && 
                    characterTookDamage(1)) &&
              never(checkCharacterExistence(0) &&
                    getCharacterIsPlayer(0) == 1 && 
                    getCharacterAnimation(0) == 0x00) &&
              never(checkCharacterExistence(1) &&
                    getCharacterIsPlayer(1) == 1 && 
                    getCharacterAnimation(1) == 0x00)
)

achievement(
    title = "Reaper of the Dead", type = "",
    description = "Win the fight against Lord Voldemort without taking damage.",
    id = 550587, badge = "625517", points = 3,
    trigger = checkLevelID(0x24) &&
              never(isInvincible()) &&
              never(getMapID() == prev(getMapID()) &&
                    dword_be(0x00868f40) == prev(dword_be(0x00868f40)) &&
                    !checkMapID(0x136) &&
                    !checkMapID(0x137)) && 
              startBossFight(0x13A) &&
              winBossFight(0x137) &&
              never(checkCharacterExistence(0) &&
                    getCharacterIsPlayer(0) == 1 && 
                    characterTookDamage(0)) &&
              never(checkCharacterExistence(1) &&
                    getCharacterIsPlayer(1) == 1 && 
                    characterTookDamage(1))
)

achievement(
    title = "Become Everything You Want", type = "",
    description = "Learn all the secrets about transfiguration.",
    id = 551199, badge = "626183", points = 2,
    trigger = __ornext(checkLevelID(0x02) || checkLevelID(0x03) || checkLevelID(0x04) || checkLevelID(0x05)) &&
              checkMapID(0x65) &&
              skillEventFlag(0x05, 2) > prev(skillEventFlag(0x05, 2))
)

achievement(
    title = "When Cursing Goes Wrong", type = "",
    description = "Collect the Gold Brick for curing Ron's Slugulus Eructo curse.",
    id = 548176, badge = "623254", points = 3,
    trigger = __ornext(checkLevelID(0x03) || checkLevelID(0x04) || checkLevelID(0x05)) &&
              ((checkMapID(0x90) && 
                brickEventFlag(0x90, 2) > prev(brickEventFlag(0x90, 2))) ||
               (checkMapID(0xDA) && 
                brickEventFlag(0xDA, 2) > prev(brickEventFlag(0xDA, 2))) ||
               (checkMapID(0x129) && 
                brickEventFlag(0x129, 2) > prev(brickEventFlag(0x129, 2))))
)

achievement(
    title = "A Gamekeeper and His Pet", type = "",
    description = "Collect the Gold Brick for hatching Norbert.",
    id = 551433, badge = "626340", points = 3,
    trigger = __ornext(checkLevelID(0x03) || checkLevelID(0x04) || checkLevelID(0x05)) &&
              checkMapID(0xDB) &&
              brickEventFlag(0xDB, 2) > prev(brickEventFlag(0xDB, 2))
)

achievement(
    title = "Wizardry and Witch Craft", type = "",
    description = "Enter Madam Malkin's hidden customisation room.",
    id = 553024, badge = "627998", points = 1,
    trigger = checkMapID(0x46) &&
              prior(checkMapID(0x43)) &&
              dword_be(0x008579AC) == 0
)

achievement(
    title = "Ready for the LeakyCon", type = "",
    description = "Let everyone in the group wear funny earmuffs.",
    id = 548208, badge = "623312", points = 1,
    trigger = dword_be(mapID) == prev(dword_be(mapID)) &&
              ((getGroupSize() == 2 &&
                    getCharacterFunnyEarmuffs(0) &&
                    getCharacterFunnyEarmuffs(1)) ||
               (getGroupSize() == 3 &&
                    getCharacterFunnyEarmuffs(0) &&
                    getCharacterFunnyEarmuffs(1) &&
                    getCharacterFunnyEarmuffs(2)) ||
               (getGroupSize() == 4 &&
                    getCharacterFunnyEarmuffs(0) &&
                    getCharacterFunnyEarmuffs(1) &&
                    getCharacterFunnyEarmuffs(2) &&
                    getCharacterFunnyEarmuffs(3)))
)

achievement(
    title = "Never Seen Again", type = "",
    description = "Make a student of Hogwarts disappear forever in a magical crate.",
    id = 553010, badge = "627982", points = 2,
    trigger = __ornext(checkMapID(0x60) || checkMapID(0x9F) || checkMapID(0xDE) || checkMapID(0x13A)) &&
              hitTentacleCrate()
)

achievement(
    title = "Happy Birthday, Harry!", type = "",
    description = "Celebrate finding a special locker in Hogwarts with some balloons inside.",
    id = 553021, badge = "627996", points = 2,
    trigger = __ornext(checkMapID(0xAF) || checkMapID(0xF9) || checkMapID(0x144)) &&
              hitCelebrationLocker()
)

achievement(
    title = "Neville, I'm Really Really Sorry About This", type = "",
    description = "As Hermione, stop Neville in a brilliant but scary way that would let everyone shiver.",
    // Real ID not provided to prevent overwrite since generated code is unoptimized; id = 552837
    id = 0, badge = "627827", points = 1,
    trigger = sleepyNevilleGotFrozen()
)

achievement(
    title = "Bugged By Mice and Barks", type = "",
    description = "Have all three unregistered Animagi in the group while they are transformed.",
    id = 553022, badge = "627997", points = 2,
    trigger = inGame() &&
              tally(1, once(checkCharacterExistence(0) && getCharacterID(0) == 0x198),
                       once(checkCharacterExistence(1) && getCharacterID(1) == 0x198),
                       once(checkCharacterExistence(2) && getCharacterID(2) == 0x198),
                       once(checkCharacterExistence(3) && getCharacterID(3) == 0x198),
                       once(checkCharacterExistence(4) && getCharacterID(4) == 0x198),
                       once(checkCharacterExistence(5) && getCharacterID(5) == 0x198),
                       once(checkCharacterExistence(6) && getCharacterID(6) == 0x198),
                       once(checkCharacterExistence(7) && getCharacterID(7) == 0x198)) &&
              tally(1, once(checkCharacterExistence(0) && getCharacterID(0) == 0x19F),
                       once(checkCharacterExistence(1) && getCharacterID(1) == 0x19F),
                       once(checkCharacterExistence(2) && getCharacterID(2) == 0x19F),
                       once(checkCharacterExistence(3) && getCharacterID(3) == 0x19F),
                       once(checkCharacterExistence(4) && getCharacterID(4) == 0x19F),
                       once(checkCharacterExistence(5) && getCharacterID(5) == 0x19F),
                       once(checkCharacterExistence(6) && getCharacterID(6) == 0x19F),
                       once(checkCharacterExistence(7) && getCharacterID(7) == 0x19F)) &&
              tally(1, once(checkCharacterExistence(0) && getCharacterID(0) >= 0x208 && getCharacterID(0) <= 0x209),
                       once(checkCharacterExistence(1) && getCharacterID(1) >= 0x208 && getCharacterID(1) <= 0x209),
                       once(checkCharacterExistence(2) && getCharacterID(2) >= 0x208 && getCharacterID(2) <= 0x209),
                       once(checkCharacterExistence(3) && getCharacterID(3) >= 0x208 && getCharacterID(3) <= 0x209),
                       once(checkCharacterExistence(4) && getCharacterID(4) >= 0x208 && getCharacterID(4) <= 0x209),
                       once(checkCharacterExistence(5) && getCharacterID(5) >= 0x208 && getCharacterID(5) <= 0x209),
                       once(checkCharacterExistence(6) && getCharacterID(6) >= 0x208 && getCharacterID(6) <= 0x209),
                       once(checkCharacterExistence(7) && getCharacterID(7) >= 0x208 && getCharacterID(7) <= 0x209)) &&
              never(getCharacterID(0) != prev(getCharacterID(0)) ||
                    getCharacterID(1) != prev(getCharacterID(1)) ||
                    getCharacterID(2) != prev(getCharacterID(2)) ||
                    getCharacterID(3) != prev(getCharacterID(3)) ||
                    getCharacterID(4) != prev(getCharacterID(4)) ||
                    getCharacterID(5) != prev(getCharacterID(5)) ||
                    getCharacterID(6) != prev(getCharacterID(6)))
)

achievement(
    title = "Master of Enchantments", type = "",
    description = "Learn all spells and curses.",
    id = 552989, badge = "627962", points = 5,
    trigger = inGame() &&
              measured(skillEventFlag(0x04, 0) + skillEventFlag(0x04, 2) 
                     + skillEventFlag(0x04, 3) + skillEventFlag(0x04, 4) 
                     + skillEventFlag(0x04, 5) + skillEventFlag(0x04, 6) 
                     + skillEventFlag(0x04, 7) + skillEventFlag(0x05, 0) 
                     + skillEventFlag(0x05, 1) + skillEventFlag(0x05, 2) 
                     + skillEventFlag(0x05, 3) + skillEventFlag(0x05, 7)
                     + skillEventFlag(0x06, 0) + skillEventFlag(0x06, 1) 
                     + skillEventFlag(0x06, 2) + skillEventFlag(0x06, 3) 
                     + skillEventFlag(0x06, 4) + skillEventFlag(0x06, 5) 
                     + skillEventFlag(0x06, 6) + skillEventFlag(0x06, 7)
                     + skillEventFlag(0x07, 1) + skillEventFlag(0x07, 2) 
                     + skillEventFlag(0x07, 3) + skillEventFlag(0x07, 4) 
                     + skillEventFlag(0x07, 5) + skillEventFlag(0x07, 6) 
                     + skillEventFlag(0x07, 7) == 27) &&
                  prev(skillEventFlag(0x04, 0) + skillEventFlag(0x04, 2) 
                     + skillEventFlag(0x04, 3) + skillEventFlag(0x04, 4) 
                     + skillEventFlag(0x04, 5) + skillEventFlag(0x04, 6) 
                     + skillEventFlag(0x04, 7) + skillEventFlag(0x05, 0) 
                     + skillEventFlag(0x05, 1) + skillEventFlag(0x05, 2) 
                     + skillEventFlag(0x05, 3) + skillEventFlag(0x05, 7)
                     + skillEventFlag(0x06, 0) + skillEventFlag(0x06, 1) 
                     + skillEventFlag(0x06, 2) + skillEventFlag(0x06, 3) 
                     + skillEventFlag(0x06, 4) + skillEventFlag(0x06, 5) 
                     + skillEventFlag(0x06, 6) + skillEventFlag(0x06, 7)
                     + skillEventFlag(0x07, 1) + skillEventFlag(0x07, 2) 
                     + skillEventFlag(0x07, 3) + skillEventFlag(0x07, 4) 
                     + skillEventFlag(0x07, 5) + skillEventFlag(0x07, 6) 
                     + skillEventFlag(0x07, 7) == 26)
)

achievement(
    title = "Elixirs of Mischief", type = "",
    description = "Learn all kinds of potions.",
    id = 553003, badge = "627975", points = 3,
    trigger = inGame() &&
              measured(skillEventFlag(0x03, 5) + skillEventFlag(0x03, 6) 
                     + skillEventFlag(0x03, 7) == 3) &&
                  prev(skillEventFlag(0x03, 5) + skillEventFlag(0x03, 6) 
                     + skillEventFlag(0x03, 7) == 2)
)

achievement(
    title = "Licensed to Wear", type = "",
    description = "Find all 167 Characters Tokens.",
    id = 552296, badge = "627308", points = 25,
    trigger = inGame() && 
              measured(calculateTokensBuyable() == 167) &&
              prev(calculateTokensBuyable()) <= 167 - 1 &&
              prev(calculateTokensBuyable()) >= 167 - 5
)

achievement(
    title = "The Clothes Make the Figurine", type = "",
    description = "Unlock all 170 Characters.",
    id = 552340, badge = "627340", points = 10,
    trigger = inGame() && 
              measured(calculateTokensUnlocked() == 170) &&
              prev(calculateTokensUnlocked()) <= 170 - 1 &&
              prev(calculateTokensUnlocked()) >= 170 - 5
)

achievement(
    title = "Convenient Owl Postal Service", type = "missable",
    description = "Send all 24 Red Bricks to Eeylops Owl Emporium using owls.",
    id = 551849, badge = "627056", points = 25,
    trigger = __ornext(checkLevelID(0x02) || checkLevelID(0x03) || checkLevelID(0x04) || checkLevelID(0x05)) && 
              measured(4 + calculateRedBricks() == 24) &&
              prev(4 + calculateRedBricks()) == 23 &&
              disable_when(cheatUsedForExtra())
)

achievement(
    title = "LEGO Is Expensive These Days", type = "missable",
    description = "Buy all 24 Red Bricks in Eeylops Owl Emporium.",
    id = 552110, badge = "627075", points = 10 ,
    trigger = checkLevelID(0x00) && 
              measured(calculateUnlockedExtras() == 24) &&
              prev(calculateUnlockedExtras()) == 23 &&
              disable_when(cheatUsedForExtra())
)

achievement(
    title = "Perfect Prefect", type = "",
    description = "Save all 50 Students in Peril.",
    id = 552117, badge = "627079", points = 25,
    trigger = inGame() &&
              measured(calculateStudentsInPeril() == 50) &&
              prev(calculateStudentsInPeril()) == 49
)

achievement(
    title = "Merlin's Little Helper", type = "",
    description = "Achieve True Wizard in every level.",
    id = 552342, badge = "627342", points = 10,
    trigger = inGame() &&
              measured(calculateTrueWizards() == 24) &&
              prev(calculateTrueWizards()) == 23
)

achievement(
    title = "No Brick Unturned", type = "",
    description = "Collect all 200 Gold Bricks.",
    id = 552341, badge = "627341", points = 25,
    trigger = inGame() &&
              measured(calculateGoldBricks() == 200) &&
              prev(calculateGoldBricks()) <= 199 &&
              prev(calculateGoldBricks()) >= 190
)

achievement(
    title = "Extra Points for Gryffindor", type = "",
    description = "Complete all of the Hogwarts Crests.",
    id = 552352, badge = "627360", points = 10,
    trigger = inGame() &&
              measured(calculateCrests() == 24) &&
              prev(calculateCrests()) == 23
)

//--------------------------------------------------
// Rich Presence

rich_presence_conditional_display(checkMapID(0x00) || checkMapID(0x39) || checkMapID(0xFFFFFFFF), 
    "In the Titlescreen"
)

rich_presence_conditional_display(isInLevel(), 
    "{13}{12}{11}{10}{9}{8}{7}{6}{5}{4}{3}{2}{1} and {0} are in {14} [{15}] [{16}] [🔰{17}{18}{19}{20}] [{21}]",
    rich_presence_lookup(
        "CharacterID", 
        max_of(measured(getCharacterID(0), when = getPointerChar(0) != 0 && !getCharacterIsVehicle(0)),
               measured(prior(getCharacterID(0)), when = getPointerChar(0) != 0 && getCharacterIsVehicle(0)),
               measured(0x5A, when = getPointerChar(0) == 0 && getInitialCharacterID(0) == 0xFFFF),
               measured(getInitialCharacterID(0), when = getInitialCharacterID(0) != 0xFFFF && (getPointerChar(0) == 0 || getCharacterID(0) == 0))), 
        characterIDs, 
        fallback = "Harry Potter"),
    rich_presence_lookup(
        "CharacterID", 
        max_of(measured(getCharacterID(1), when = getPointerChar(1) != 0 && !getCharacterIsVehicle(1)),
               measured(prior(getCharacterID(1)), when = getPointerChar(1) != 0 && getCharacterIsVehicle(1)),
               measured(0x61, when = getPointerChar(1) == 0 && getInitialCharacterID(1) == 0xFFFF),
               measured(getInitialCharacterID(1), when = getInitialCharacterID(1) != 0xFFFF && (getPointerChar(1) == 0 || getCharacterID(1) == 0))), 
        characterIDs, 
        fallback = "Harry Potter"),
    rich_presence_lookup(
        "GroupConnect", 
        measured(0x01, when = checkCharacterExistence(2)), 
        groupConnect, 
        fallback = ""),
    rich_presence_lookup(
        "CharacterID", 
        measured(getCharacterID(2), when = checkCharacterExistence(2)), 
        characterIDs, 
        fallback = "Harry Potter"),
    rich_presence_lookup(
        "GroupConnect", 
        measured(0x01, when = checkCharacterExistence(3)), 
        groupConnect, 
        fallback = ""),
    rich_presence_lookup(
        "CharacterID", 
        measured(getCharacterID(3), when = checkCharacterExistence(3)),  
        characterIDs, 
        fallback = "Harry Potter"),
    rich_presence_lookup(
        "GroupConnect", 
        measured(0x01, when = checkCharacterExistence(4)), 
        groupConnect, 
        fallback = ""),
    rich_presence_lookup(
        "CharacterID", 
        measured(getCharacterID(4), when = checkCharacterExistence(4)), 
        characterIDs, 
        fallback = "Harry Potter"),
    rich_presence_lookup(
        "GroupConnect", 
        measured(0x01, when = checkCharacterExistence(5)), 
        groupConnect, 
        fallback = ""),
    rich_presence_lookup(
        "CharacterID", 
        measured(getCharacterID(5), when = checkCharacterExistence(5)), 
        characterIDs, 
        fallback = "Harry Potter"),
    rich_presence_lookup(
        "GroupConnect", 
        measured(0x01, when = checkCharacterExistence(6)), 
        groupConnect, 
        fallback = ""),
    rich_presence_lookup(
        "CharacterID", 
        measured(getCharacterID(6), when = checkCharacterExistence(6)),  
        characterIDs, 
        fallback = "Harry Potter"),
    rich_presence_lookup(
        "GroupConnect", 
        measured(0x01, when = checkCharacterExistence(7)), 
        groupConnect, 
        fallback = ""),
    rich_presence_lookup(
        "CharacterID", 
        measured(getCharacterID(7), when = checkCharacterExistence(7)), 
        characterIDs, 
        fallback = "Harry Potter"),
    rich_presence_lookup(
        "LevelID", 
        dword_be(levelID), 
        levelIDs, 
        fallback = levelIDs[1]),
    rich_presence_lookup(
        "CollectibleStudent", 
        measured(1, when = dword_be(0x00853ef8) == 0x02 ||
                           bit0(dword_be(0x008628d8) * 20 + 0x10084796) == 1), 
        collectibleStudent, 
        fallback = collectibleStudent[0]),
    rich_presence_lookup(
        "CollectibleWizard", 
        measured(1, when = dword_be(0x008686f8) > 0 ||
                           word_be(dword_be(0x008628d8) * 20 + 0x10084790) > 0), 
        collectibleWizard, 
        fallback = collectibleWizard[0]),
    rich_presence_lookup(
        "CollectibleCrest", 
        measured(1, when = bit3(0x00853f14) == 1 ||
                           bit4(dword_be(0x008628d8) * 20 + 0x10084796) == 1), 
        collectibleCrest, 
        fallback = collectibleCrest[0]),
    rich_presence_lookup(
        "CollectibleCrest", 
        measured(2, when = bit4(0x00853f14) == 1 ||
                           bit5(dword_be(0x008628d8) * 20 + 0x10084796) == 1), 
        collectibleCrest, 
        fallback = collectibleCrest[0]),
    rich_presence_lookup(
        "CollectibleCrest", 
        measured(3, when = bit5(0x00853f14) == 1 ||
                           bit6(dword_be(0x008628d8) * 20 + 0x10084796) == 1), 
        collectibleCrest, 
        fallback = collectibleCrest[0]),
    rich_presence_lookup(
        "CollectibleCrest", 
        measured(4, when = bit6(0x00853f14) == 1 ||
                           bit7(dword_be(0x008628d8) * 20 + 0x10084796) == 1), 
        collectibleCrest, 
        fallback = collectibleCrest[0]),
    rich_presence_lookup(
        "LevelMode", 
        dword_be(levelMode), 
        levelModes, 
        fallback = levelModes[0])
)

rich_presence_conditional_display(any_of(useMapHashes, map => checkMapID(map)), 
    "{13}{12}{11}{10}{9}{8}{7}{6}{5}{4}{3}{2}{1} and {0} are {14} [👤{15}/167] [🟥{16}/20] [😀{17}/50] [🧙{18}/24] [🟨{19}/200] [🔰{20}/24]",
    rich_presence_lookup(
        "CharacterID", 
        max_of(measured(getCharacterID(0), when = getPointerChar(0) != 0 && !getCharacterIsVehicle(0)),
               measured(prior(getCharacterID(0)), when = getPointerChar(0) != 0 && getCharacterIsVehicle(0)),
               measured(0x5A, when = getPointerChar(0) == 0 && getInitialCharacterID(0) == 0xFFFF),
               measured(getInitialCharacterID(0), when = getInitialCharacterID(0) != 0xFFFF && (getPointerChar(0) == 0 || getCharacterID(0) == 0))), 
        characterIDs, 
        fallback = "Harry Potter"),
    rich_presence_lookup(
        "CharacterID", 
        max_of(measured(getCharacterID(1), when = getPointerChar(1) != 0 && !getCharacterIsVehicle(1)),
               measured(prior(getCharacterID(1)), when = getPointerChar(1) != 0 && getCharacterIsVehicle(1)),
               measured(0x61, when = getPointerChar(1) == 0 && getInitialCharacterID(1) == 0xFFFF),
               measured(getInitialCharacterID(1), when = getInitialCharacterID(1) != 0xFFFF && (getPointerChar(1) == 0 || getCharacterID(1) == 0))), 
        characterIDs, 
        fallback = "Harry Potter"),
    rich_presence_lookup(
        "GroupConnect", 
        measured(0x01, when = checkCharacterExistence(2)), 
        groupConnect, 
        fallback = ""),
    rich_presence_lookup(
        "CharacterID", 
        measured(getCharacterID(2), when = checkCharacterExistence(2)), 
        characterIDs, 
        fallback = "Harry Potter"),
    rich_presence_lookup(
        "GroupConnect", 
        measured(0x01, when = checkCharacterExistence(3)), 
        groupConnect, 
        fallback = ""),
    rich_presence_lookup(
        "CharacterID", 
        measured(getCharacterID(3), when = checkCharacterExistence(3)),  
        characterIDs, 
        fallback = "Harry Potter"),
    rich_presence_lookup(
        "GroupConnect", 
        measured(0x01, when = checkCharacterExistence(4)), 
        groupConnect, 
        fallback = ""),
    rich_presence_lookup(
        "CharacterID", 
        measured(getCharacterID(4), when = checkCharacterExistence(4)), 
        characterIDs, 
        fallback = "Harry Potter"),
    rich_presence_lookup(
        "GroupConnect", 
        measured(0x01, when = checkCharacterExistence(5)), 
        groupConnect, 
        fallback = ""),
    rich_presence_lookup(
        "CharacterID", 
        measured(getCharacterID(5), when = checkCharacterExistence(5)), 
        characterIDs, 
        fallback = "Harry Potter"),
    rich_presence_lookup(
        "GroupConnect", 
        measured(0x01, when = checkCharacterExistence(6)), 
        groupConnect, 
        fallback = ""),
    rich_presence_lookup(
        "CharacterID", 
        measured(getCharacterID(6), when = checkCharacterExistence(6)),  
        characterIDs, 
        fallback = "Harry Potter"),
    rich_presence_lookup(
        "GroupConnect", 
        measured(0x01, when = checkCharacterExistence(7)), 
        groupConnect, 
        fallback = ""),
    rich_presence_lookup(
        "CharacterID", 
        measured(getCharacterID(7), when = checkCharacterExistence(7)), 
        characterIDs, 
        fallback = "Harry Potter"),
    rich_presence_lookup(
        "MapHashes", 
        max_of(measured(0x430ED4E2,         when = getMapID() == 0x43 && checkMapText("LEAKY2DIAGON")),
               measured(0x4318BEEC,         when = getMapID() == 0x43 && checkMapText("DIAGON2LEAKY")),
               measured(0x4317EA97,         when = getMapID() == 0x43 && checkMapText("ROBE2STREET")),
               measured(0x432736E1,         when = getMapID() == 0x43 && checkMapText("ROBE2CUSTOMISER")),
               measured(0x431713F9,         when = getMapID() == 0x43 && checkMapText("CUSTOMISER2ROBE")),
               measured(0x430AC997,         when = getMapID() == 0x43 && checkMapText("STREET2ROBE")),
               measured(0x430F9E77,         when = getMapID() == 0x43 && checkMapText("OWL2STREET")),
               measured(0x43148494,         when = getMapID() == 0x43 && checkMapText("STREET2OWL")),
               measured(0x4316A377,         when = getMapID() == 0x43 && checkMapText("OWL2TOWER")),
               measured(0x43148494,         when = getMapID() == 0x43 && checkMapText("TOWER2OWL")),
               measured(0x430C4CEC,         when = getMapID() == 0x43 && checkMapText("CAULDRON2STREET")),
               measured(0x431D1ECC,         when = getMapID() == 0x43 && checkMapText("STREET2CAULDRON")),
               measured(0x43179390,         when = getMapID() == 0x43 && checkMapText("DIAG2GRING")),
               measured(0x43179390,         when = getMapID() == 0x43 && checkMapText("DIAGON2KNOCKTUR")),
               measured(0x432C08DD,         when = getMapID() == 0x43 && checkMapText("DIAG2GRING")),
               measured(0x431C37DE,         when = getMapID() == 0x43 && checkMapText("KNOCKTURN2DIAGO")),
               measured(0x452C08DD,         when = getMapID() == 0x45 && checkMapText("DIAGON2KNOCKTUR")),
               measured(0x451C37DE,         when = getMapID() == 0x45 && checkMapText("KNOCKTURN2DIAGO")),
               measured(0x4519A0B1,         when = getMapID() == 0x45 && checkMapText("knockturn2Voldemort")),
               measured(0x452657FE,         when = getMapID() == 0x45 && checkMapText("borgins2street")),
               measured(0x450E0C10,         when = getMapID() == 0x45 && checkMapText("street2Borgins")),
               measured(hashMapText(),      when = getMapID() != 0x43 && getMapID() != 0x45)), 
        mapHashes, 
        fallback = "in Hogwarts"),
    rich_presence_macro(
        "Number",
        calculateTokensBuyable()
    ),
    rich_presence_macro(
        "Number",
        calculateRedBricks()
    ),
    rich_presence_macro(
        "Number",
        calculateStudentsInPeril()
    ),
    rich_presence_macro(
        "Number",
        calculateTrueWizards()
    ),
    rich_presence_macro(
        "Number",
        calculateGoldBricks()
    ),
    rich_presence_macro(
        "Number",
        calculateCrests()
    )
)
    
rich_presence_display(
    "{13}{12}{11}{10}{9}{8}{7}{6}{5}{4}{3}{2}{1} and {0} are {14} [👤{15}/167] [🟥{16}/20] [😀{17}/50] [🧙{18}/24] [🟨{19}/200] [🔰{20}/24]",
    rich_presence_lookup(
        "CharacterID", 
        max_of(measured(getCharacterID(0), when = getPointerChar(0) != 0 && !getCharacterIsVehicle(0)),
               measured(prior(getCharacterID(0)), when = getPointerChar(0) != 0 && getCharacterIsVehicle(0)),
               measured(0x5A, when = getPointerChar(0) == 0 && getInitialCharacterID(0) == 0xFFFF),
               measured(getInitialCharacterID(0), when = getInitialCharacterID(0) != 0xFFFF && (getPointerChar(0) == 0 || getCharacterID(0) == 0))), 
        characterIDs, 
        fallback = "Harry Potter"),
    rich_presence_lookup(
        "CharacterID", 
        max_of(measured(getCharacterID(1), when = getPointerChar(1) != 0 && !getCharacterIsVehicle(1)),
               measured(prior(getCharacterID(1)), when = getPointerChar(1) != 0 && getCharacterIsVehicle(1)),
               measured(0x61, when = getPointerChar(1) == 0 && getInitialCharacterID(1) == 0xFFFF),
               measured(getInitialCharacterID(1), when = getInitialCharacterID(1) != 0xFFFF && (getPointerChar(1) == 0 || getCharacterID(1) == 0))), 
        characterIDs, 
        fallback = "Harry Potter"),
    rich_presence_lookup(
        "GroupConnect", 
        measured(0x01, when = checkCharacterExistence(2)), 
        groupConnect, 
        fallback = ""),
    rich_presence_lookup(
        "CharacterID", 
        measured(getCharacterID(2), when = checkCharacterExistence(2)), 
        characterIDs, 
        fallback = "Harry Potter"),
    rich_presence_lookup(
        "GroupConnect", 
        measured(0x01, when = checkCharacterExistence(3)), 
        groupConnect, 
        fallback = ""),
    rich_presence_lookup(
        "CharacterID", 
        measured(getCharacterID(3), when = checkCharacterExistence(3)),  
        characterIDs, 
        fallback = "Harry Potter"),
    rich_presence_lookup(
        "GroupConnect", 
        measured(0x01, when = checkCharacterExistence(4)), 
        groupConnect, 
        fallback = ""),
    rich_presence_lookup(
        "CharacterID", 
        measured(getCharacterID(4), when = checkCharacterExistence(4)), 
        characterIDs, 
        fallback = "Harry Potter"),
    rich_presence_lookup(
        "GroupConnect", 
        measured(0x01, when = checkCharacterExistence(5)), 
        groupConnect, 
        fallback = ""),
    rich_presence_lookup(
        "CharacterID", 
        measured(getCharacterID(5), when = checkCharacterExistence(5)), 
        characterIDs, 
        fallback = "Harry Potter"),
    rich_presence_lookup(
        "GroupConnect", 
        measured(0x01, when = checkCharacterExistence(6)), 
        groupConnect, 
        fallback = ""),
    rich_presence_lookup(
        "CharacterID", 
        measured(getCharacterID(6), when = checkCharacterExistence(6)),  
        characterIDs, 
        fallback = "Harry Potter"),
    rich_presence_lookup(
        "GroupConnect", 
        measured(0x01, when = checkCharacterExistence(7)), 
        groupConnect, 
        fallback = ""),
    rich_presence_lookup(
        "CharacterID", 
        measured(getCharacterID(7), when = checkCharacterExistence(7)), 
        characterIDs, 
        fallback = "Harry Potter"),
    rich_presence_lookup(
        "MapID", 
        getMapID(), 
        mapIDs, 
        fallback = "in Hogwarts"),
    rich_presence_macro(
        "Number",
        calculateTokensBuyable()
    ),
    rich_presence_macro(
        "Number",
        calculateRedBricks()
    ),
    rich_presence_macro(
        "Number",
        calculateStudentsInPeril()
    ),
    rich_presence_macro(
        "Number",
        calculateTrueWizards()
    ),
    rich_presence_macro(
        "Number",
        calculateGoldBricks()
    ),
    rich_presence_macro(
        "Number",
        calculateCrests()
    )
)











