// Professor Layton and the Unwound Future
// #ID = 9831

//--------------------------------------------------
// Addresses

mem_PuzzleDataMainPointer   = 0x00071b20
mem_PoiterMenuEvent         = 0x000725b0
mem_PointerPuzzleID         = 0x000725d8
mem_SavefileDataFlags       = 0x000fe464
mem_MinigameClearFlags      = 0x000fe48a
mem_ObjectiveID             = 0x000fe544
mem_LocationID              = 0x000fe546
mem_TotalPicarats           = 0x000fe724
mem_PuzzleIndexData         = 0x000fe764
mem_PuzzleSolverID          = 0x0010386e
mem_PuzzleState             = 0x00103870

PointerMask = 0x00ffffff

//--------------------------------------------------
// Functions

function calculateMinigameToyCarCoursesCleared() {
    Address = mem_MinigameClearFlags + 0x04
    Sum     = 0
    for Book in range(1, 10) {
        Sum = Sum + bit(1 + (Book - 1), Address)
    }
    return Sum
}

function calculateMinigameParrotDeliveriesCleared() {
    Address = mem_MinigameClearFlags + 0x02
    Sum     = 0
    for Book in range(1, 12) {
        Sum = Sum + bit(2 + (Book - 1), Address)
    }
    return Sum
}

function calculateMinigameStoryBooksCleared() {
    Address = mem_MinigameClearFlags + 0x00
    Sum     = 0
    for Book in range(1, 3) {
        Sum = Sum + bit(0 + (Book - 1), Address)
    }
    return Sum
}

function calculatePuzzlesSolvedRegular() {
    Sum = 0
    for Num in range(1, 168) {
        PuzzleID = 000
        if (Num < 10) {
            PuzzleID = "00" + Num
        } else
        if (Num < 100) {
            PuzzleID = "0" + Num
        } else
        if (Num < 1000) {
            PuzzleID = "" + Num
        }
        Sum = Sum + getPuzzleSolveFlagByPuzzleID(PuzzleID)
    }
    return Sum
}

function calculatePuzzleSolvedWiFi(Region) {
    Sum = 0
    for Num in range(1, 33) {
        if (Num == 27) {
            if (Region == "US") { // Check Flag for Puzzle ⓦ27 in the US
                Sum = Sum + bit1(mem_PuzzleIndexData + (0xD4 - 1) * 0x02)
            } else
            if (Region == "EU") { // Check Flag for Puzzle ⓦ27 in the EU
                Sum = Sum + bit1(mem_PuzzleIndexData + (0xD7 - 1) * 0x02)
            } else
            {
                assert(0 == 1, "Region \"" + Region + "\" is not available.")
            }
        } else {
            PuzzleID = 000
            if (Num < 10) {
                PuzzleID = "ⓦ0" + Num
            } else
            if (Num < 100) {
                PuzzleID = "ⓦ" + Num
            }
            Sum = Sum + getPuzzleSolveFlagByPuzzleID(PuzzleID)
        }
    }
    return Sum
}

function checkInBonus() {
    PointerChain = (dword((dword((dword(mem_PoiterMenuEvent) & PointerMask) + 0x40) & PointerMask) + 0x13C) & PointerMask)
    return once(dword_be(PointerChain + 0x0C) == 0x73637274 &&
                dword_be(PointerChain + 0x10) == 0x5F6D6F64 &&
                dword_be(PointerChain + 0x14) == 0x652E6362) &&
           never(dword_be(PointerChain + 0x0C) == 0x6D656E75 &&
                 dword_be(PointerChain + 0x10) == 0x5F746974 &&
                 dword_be(PointerChain + 0x14) == 0x6C652E63)
}

function checkInGame() {
    return always_true()
}

function checkInPuzzle() {
    return __ornext(prev(getPuzzleState() == 0x00FF ||
                         getPuzzleState() == 0x01FF ||
                         getPuzzleState() == 0x02FF ||
                         getPuzzleState() == 0x03FF ||
                         getPuzzleState() == 0x04FF ||
                         getPuzzleState() == 0x05FF))
}

function checkInPuzzleOrPuzzleResult() {
    return __ornext(checkInPuzzle() ||
                    prev(getPuzzleState() == 0x0000 ||
                         getPuzzleState() == 0x0001 ||
                         getPuzzleState() == 0x0700 ||
                         getPuzzleState() == 0x0701))
}

function checkPuzzleSolved() {
    return __ornext(getPuzzleState() == 0x0001 ||
                    getPuzzleState() == 0x0701)
}

function getCurrentPuzzleID() {
    return dword((dword(mem_PointerPuzzleID) & PointerMask) + 0x2C)
}

function getCutsceneID() {
    return dword((dword((dword(mem_PoiterMenuEvent) & PointerMask) + 0x40) & PointerMask) + 0x12C)
}

function getGameBeatenFlag() {
    return bit0(mem_SavefileDataFlags)
}

function getGameStateID() {
    return dword((dword(mem_PoiterMenuEvent) & PointerMask) + 0x04)
}

function getLocationID() {
    return word(mem_LocationID)
}

function getObjectiveID() {
    return word(mem_ObjectiveID)
}

function getParrotDeliveryStageID() {
    return dword((dword((dword(mem_PoiterMenuEvent) & PointerMask) + 0x40) & PointerMask) + 0x810)
}

function getParrotDeliveryStageClearFlag() {
    return bit(14, (dword((dword(mem_PoiterMenuEvent) & PointerMask) + 0x40) & PointerMask) + 0x9AC)
}

function getParty() {
    return bit3(mem_SavefileDataFlags + 0x00) * 0x01 + 
           bit4(mem_SavefileDataFlags + 0x00) * 0x02 + 
           bit5(mem_SavefileDataFlags + 0x00) * 0x04 + 
           bit6(mem_SavefileDataFlags + 0x00) * 0x08 + 
           bit7(mem_SavefileDataFlags + 0x00) * 0x10 + 
           bit0(mem_SavefileDataFlags + 0x01) * 0x20 + 
           bit1(mem_SavefileDataFlags + 0x01) * 0x40 + 
           bit2(mem_SavefileDataFlags + 0x01) * 0x80 + 
           bit4(mem_SavefileDataFlags + 0x01) * 0x100
}

function getPuzzlePointerArraySize() {
    return dword(mem_PuzzleDataMainPointer + 0x04)
}

function getPuzzleSolveFlagByPuzzleID(PuzzleNumber) {
    PuzzleOffset = 000 
    for PuzzleID in PuzzleIDs {
        if (PuzzleIDs[PuzzleID] == PuzzleNumber) {
            PuzzleOffset = (PuzzleID - 1) * 0x02
        }
    }
    return bit1(mem_PuzzleIndexData + PuzzleOffset)
}

function getPuzzleSolverID() {
    return byte(mem_PuzzleSolverID)
}

function getPuzzleState() {
    return word_be(mem_PuzzleState)
}

function getTotalHintCoinsFound() {
    return word(mem_TotalPicarats + 0x04)
}

function getTotalHintCoinsInInventory() {
    return word(mem_TotalPicarats + 0x06)
}

function getTotalPicarats() {
    return word(mem_TotalPicarats)
}

function getTotalPuzzlesFound() {
    return byte(mem_TotalPicarats + 0x02)
}

function getTotalPuzzlesSolved() {
    return byte(mem_TotalPicarats + 0x03)
}

//--------------------------------------------------
// Arrays and Dictionaries

LocationIDs = {
    0x3E8: "at the Exhibition Terrace [🕛]",
    0x3E9: "at the Midland Road Bus Stop [🕛]",
    0x3EA: "on Midland Road [🕛]",
    0x3EB: "at the Midland Road Fork [🕛]",
    0x3EC: "at the Clock Shop Front [🕛]",
    0x3ED: "in the Clock Shop [🕛]",
    0x3EE: "in the Back Room [🕛]",
    0x3EF: "at Scotland Yard [🕛]",
    0x3F0: "at the Scotland Yard Reception [🕛]",
    0x3F1: "in Chelmey's Office [🕛]",
    0x3F2: "in the Archives [🕛]",
    0x3F3: "at the Gressenheller Bus Stop [🕛]",
    0x3F4: "in the Gressenheller University [🕛]",
    0x3F5: "in Layton's Office [🕛]",
    0x44D: "at the Derelict Bus Stop [🕙]",
    0x44E: "on Midland Road [🕙]",
    0x44F: "at the Midland Road Fork [🕙]",
    0x450: "at the Clock Shop Front [🕙]",
    0x451: "in the Clock Shop [🕙]",
    0x452: "in the Back Room [🕙]",
    0x453: "in Anita's Café [🕙]",
    0x454: "at the Arcade Entrance [🕙]",
    0x455: "in the Arcade [🕙]",
    0x456: "in the Restaurant [🕙]",
    0x457: "on Southern Street [🕙]",
    0x458: "in the Hotel Lobby [🕙]",
    0x459: "in the Hotel Room [🕙]",
    0x45A: "at the Arcade East Exit [🕙]",
    0x45B: "in the Abandoned Shop [🕙]",
    0x4B0: "on Flatstone Street South [🕙]",
    0x4B1: "on Flatstone Street [🕙]",
    0x4B2: "on Flatstone Street North [🕙]",
    0x4B3: "in the Flatstone Street Station [🕙]",
    0x4B4: "at the Casino Entrance [🕙]",
    0x4B5: "in the Casino Lobby [🕙]",
    0x4B6: "in the Auckland Lane Station [🕙]",
    0x4B7: "at the Green Hospital [🕙]",
    0x4B8: "at the Hospital Reception [🕙]",
    0x4B9: "in the Patient's Room [🕙]",
    0x4BA: "at the Back of the Hospital [🕙]",
    0x4BD: "at the Statue Plaza [🕙]",
    0x4BE: "at the Park Gate [🕙]",
    0x4BF: "in the Park Observatory [🕙]",
    0x4C0: "in the Casino Storeroom [🕙]",
    0x4C1: "at the Casino Entrance [🕙]",
    0x4C2: "in the Casino Floor [🕙]",
    0x514: "in the Alley [🕙]",
    0x515: "at the Passageway [🕙]",
    0x516: "on the Riverside Hill [🕙]",
    0x517: "at the Iron Bridge [🕙]",
    0x518: "in the Shady Grove [🕙]",
    0x519: "at the Black Market Bazaar [🕙]",
    0x51A: "at the Chinatown Gate [🕙]",
    0x51B: "on the Riverside Stairs [🕙]",
    0x578: "at the Chinatown Plaza [🕙]",
    0x579: "on Scarlet Street [🕙]",
    0x57A: "in the Noodle Bar [🕙]",
    0x57B: "in the Toy Shop [🕙]",
    0x57C: "at the Belltower Gate [🕙]",
    0x57D: "in the Chinatown Station [🕙]",
    0x57E: "on Azure Avenue [🕙]",
    0x57F: "in the Bookshop [🕙]",
    0x580: "at the Edge of Chinatown [🕙]",
    0x581: "in the Pet Shop [🕙]",
    0x582: "at the Warehouse District [🕙]",
    0x583: "at the Towering Pagoda [🕙]",
    0x585: "in the Puzzle Hut [🕙]",
    0x586: "at the Neighbourhood Wall [🕙]",
    0x5DC: "in the Grand Foyer [🕙]",
    0x5DD: "at the Mechanical Door [🕙]",
    0x5DE: "at the lower Staircase [🕙]",
    0x5DF: "at the Crimson Bridge [🕙]",
    0x5E0: "in the Hall of Mirrors [🕙]",
    0x5E1: "at the upper Staircase [🕙]",
    0x5E2: "at the Dragon Walkway [🕙]",
    0x5E3: "in the Boss's Room [🕙]",
    0x5E4: "at the Emergency Stairs [🕙]",
    0x640: "at the Riverside Area [🕙]",
    0x641: "at the Thames Arms Front [🕙]",
    0x642: "in the Thames Arms [🕙]",
    0x643: "at the South Bank [🕙]",
    0x644: "in the Tunnel [🕙]",
    0x645: "at the North Bank [🕙]",
    0x6A4: "at the Facility Yard [🕙]",
    0x6A5: "at the Service Entrance [🕙]",
    0x6A6: "in the Facility Warehouse [🕙]",
    0x6A7: "in the Facility Hallway [🕙]",
    0x6A8: "in the Central Research [🕙]",
    0x708: "at the Fortress Door [🕙]",
    0x709: "at the Pod Entrance [🕙]",
    0x70A: "in the Transport Pod [🕙]",
    0x70B: "at the Ventilation Floor [🕙]",
    0x70C: "in the Ventilation Room [🕙]",
    0x70D: "in the Surveillance Floor [🕙]",
    0x70E: "at the Fortress Deck [🕙]",
    0x70F: "in the Surveillance Room [🕙]",
    0x710: "in the Generator Room [🕙]",
    0x711: "in the Riverside Park [🕙]",
    0x712: "in the Transport Pod [🕙]",
    0x713: "in the Transport Pod [🕙]",
    0x714: "in the Transport Pod [🕙]",
}

PuzzleIDs = {
    0x01: "001",
    0x02: "002",
    0x03: "003",
    0x04: "004",
    0x05: "005",
    0x06: "006",
    0x07: "007",
    0x08: "008",
    0x09: "009",
    0x0A: "010",
    0x0B: "011",
    0x0C: "012",
    0x0D: "013",
    0x0E: "014",
    0x0F: "015",
    0x10: "016",
    0x11: "017",
    0x12: "018",
    0x13: "019",
    0x14: "020",
    0x15: "021",
    0x16: "022",
    0x17: "023",
    0x18: "024",
    0x19: "025",
    0x1A: "026",
    0x1B: "027",
    0x1C: "028",
    0x1D: "029",
    0x1E: "030",
    0x1F: "031",
    0x20: "032",
    0x21: "033",
    0x22: "034",
    0x23: "035",
    0x24: "036",
    0x25: "037",
    0x26: "038",
    0x27: "039",
    0x28: "040",
    0x29: "041",
    0x2A: "042",
    0x2B: "043",
    0x2C: "044",
    0x2D: "045",
    0x2E: "046",
    0x2F: "047",
    0x30: "048",
    0x31: "049",
    0x32: "050",
    0x33: "051",
    0x34: "052",
    0x35: "053",
    0x36: "054",
    0x37: "055",
    0x38: "056",
    0x39: "057",
    0x3A: "058",
    0x3B: "059",
    0x3C: "060",
    0x3D: "061",
    0x3E: "062",
    0x3F: "063",
    0x40: "064",
    0x41: "065",
    0x42: "066",
    0x43: "067",
    0x44: "068",
    0x45: "069",
    0x46: "070",
    0x47: "071",
    0x48: "072",
    0x49: "073",
    0x4A: "074",
    0x4B: "075",
    0x4C: "076",
    0x4D: "077",
    0x4E: "078",
    0x4F: "079",
    0x50: "080",
    0x51: "081",
    0x52: "082",
    0x53: "083",
    0x54: "084",
    0x55: "085",
    0x56: "086",
    0x57: "087",
    0x58: "088",
    0x59: "089",
    0x5A: "090",
    0x5B: "091",
    0x5C: "092",
    0x5D: "093",
    0x5E: "094",
    0x5F: "095",
    0x60: "096",
    0x61: "097",
    0x62: "098",
    0x63: "099",
    0x64: "100",
    0x65: "101",
    0x66: "102",
    0x67: "103",
    0x68: "104",
    0x69: "105",
    0x6A: "106",
    0x6B: "107",
    0x6C: "108",
    0x6D: "109",
    0x6E: "110",
    0x6F: "111",
    0x70: "112",
    0x71: "113",
    0x72: "114",
    0x73: "115",
    0x74: "116",
    0x75: "117",
    0x76: "118",
    0x77: "119",
    0x78: "120",
    0x79: "121",
    0x7A: "122",
    0x7B: "123",
    0x7C: "124",
    0x7D: "125",
    0x7E: "126",
    0x7F: "127",
    0x80: "128",
    0x81: "129",
    0x82: "130",
    0x83: "131",
    0x84: "132",
    0x85: "133",
    0x86: "134",
    0x87: "135",
    0x88: "136",
    0x89: "137",
    0x8A: "138",
    0x8B: "139",
    0x8C: "140",
    0x8D: "141",
    0x8E: "142",
    0x8F: "143",
    0x90: "144",
    0x91: "145",
    0x92: "146",
    0x93: "147",
    0x94: "148",
    0x95: "149",
    0x96: "150",
    0x97: "151",
    0x98: "152",
    0x99: "153",
    0x9A: "154",
    0x9B: "155",
    0x9C: "156",
    0x9D: "157",
    0x9E: "158",
    0x9F: "159",
    0xA0: "160",
    0xA1: "161",
    0xA2: "162",
    0xA3: "163",
    0xA4: "164",
    0xA5: "165",
    0xA6: "166",
    0xA7: "167",
    0xA8: "168",
    0xA9: "ⓦ02",
    0xAA: "ⓦ04",
    0xAB: "ⓦ09",
    0xAC: "ⓦ10",
    0xAD: "ⓦ11",
    0xAE: "ⓦ12",
    0xAF: "ⓦ05",
    0xB0: "ⓦ13",
    0xB1: "ⓦ14",
    0xB2: "ⓦ15",
    0xB3: "ⓦ16",
    0xB5: "ⓦ17",
    0xB6: "ⓦ19",
    0xB7: "ⓦ23",
    0xB8: "ⓦ22",
    0xB9: "ⓦ20",
    0xBA: "ⓦ03",
    0xBC: "ⓦ21",
    0xC5: "ⓦ01",
    0xCA: "ⓦ31",
    0xCB: "ⓦ08",
    0xCC: "ⓦ32",
    0xCF: "ⓦ30",
    0xD1: "ⓦ33",
    0xD2: "ⓦ29",
    0xD4: "ⓦ27",
    0xD5: "ⓦ28",
    0xD6: "ⓦ26",
    0xD7: "ⓦ27",
    0xD8: "ⓦ25",
    0xDB: "ⓦ06",
    0xDC: "ⓦ18",
    0xDD: "ⓦ07",
    0xDE: "ⓦ24",
    0xE0: "???",
}

PartyHashes = {
    0x001: "Professor Layton",
    0x002: "Luke",
    0x003: "Professor Layton and Luke",
    0x004: "Flora",
    0x005: "Professor Layton and Flora",
    0x006: "Luke and Flora",
    0x007: "Professor Layton, Luke and Flora",
    0x008: "Future Luke",
    0x009: "Professor Layton and Future Luke",
    0x00A: "Luke and Future Luke",
    0x00B: "Professor Layton, Luke and Future Luke",
    0x00C: "Flora and Future Luke",
    0x00D: "Professor Layton, Flora and Future Luke",
    0x00E: "Luke, Flora and Future Luke",
    0x00F: "Professor Layton, Luke, Flora and Future Luke",
    0x010: "Celeste",
    0x011: "Professor Layton and Celeste",
    0x012: "Luke and Celeste",
    0x013: "Professor Layton, Luke and Celeste",
    0x014: "Flora and Celeste",
    0x015: "Professor Layton, Flora and Celeste",
    0x016: "Luke, Flora and Celeste",
    0x017: "Professor Layton, Luke, Flora and Celeste",
    0x018: "Future Luke and Celeste",
    0x019: "Professor Layton, Future Luke and Celeste",
    0x01A: "Luke, Future Luke and Celeste",
    0x01B: "Professor Layton, Luke, Future Luke and Celeste",
    0x01C: "Flora, Future Luke and Celeste",
    0x01D: "Professor Layton, Flora, Future Luke and Celeste",
    0x01E: "Luke, Flora, Future Luke and Celeste",
    0x01F: "Professor Layton, Luke, Flora, Future Luke and Celeste",
    0x020: "Don Paolo",
    0x021: "Professor Layton and Don Paolo",
    0x022: "Luke and Don Paolo",
    0x023: "Professor Layton, Luke and Don Paolo",
    0x024: "Flora and Don Paolo",
    0x025: "Professor Layton, Flora and Don Paolo",
    0x026: "Luke, Flora and Don Paolo",
    0x027: "Professor Layton, Luke, Flora and Don Paolo",
    0x028: "Future Luke and Don Paolo",
    0x029: "Professor Layton, Future Luke and Don Paolo",
    0x02A: "Luke, Future Luke and Don Paolo",
    0x02B: "Professor Layton, Luke, Future Luke and Don Paolo",
    0x02C: "Flora, Future Luke and Don Paolo",
    0x02D: "Professor Layton, Flora, Future Luke and Don Paolo",
    0x02E: "Luke, Flora, Future Luke and Don Paolo",
    0x02F: "Professor Layton, Luke, Flora, Future Luke and Don Paolo",
    0x030: "Celeste and Don Paolo",
    0x031: "Professor Layton, Celeste and Don Paolo",
    0x032: "Luke, Celeste and Don Paolo",
    0x033: "Professor Layton, Luke, Celeste and Don Paolo",
    0x034: "Flora, Celeste and Don Paolo",
    0x035: "Professor Layton, Flora, Celeste and Don Paolo",
    0x036: "Luke, Flora, Celeste and Don Paolo",
    0x037: "Professor Layton, Luke, Flora, Celeste and Don Paolo",
    0x038: "Future Luke, Celeste and Don Paolo",
    0x039: "Professor Layton, Future Luke, Celeste and Don Paolo",
    0x03A: "Luke, Future Luke, Celeste and Don Paolo",
    0x03B: "Professor Layton, Luke, Future Luke, Celeste and Don Paolo",
    0x03C: "Flora, Future Luke, Celeste and Don Paolo",
    0x03D: "Professor Layton, Flora, Future Luke, Celeste and Don Paolo",
    0x03E: "Luke, Flora, Future Luke, Celeste and Don Paolo",
    0x03F: "Professor Layton, Luke, Flora, Future Luke, Celeste and Don Paolo",
    0x040: "Chelmey",
    0x041: "Professor Layton and Chelmey",
    0x042: "Luke and Chelmey",
    0x043: "Professor Layton, Luke and Chelmey",
    0x044: "Flora and Chelmey",
    0x045: "Professor Layton, Flora and Chelmey",
    0x046: "Luke, Flora and Chelmey",
    0x047: "Professor Layton, Luke, Flora and Chelmey",
    0x048: "Future Luke and Chelmey",
    0x049: "Professor Layton, Future Luke and Chelmey",
    0x04A: "Luke, Future Luke and Chelmey",
    0x04B: "Professor Layton, Luke, Future Luke and Chelmey",
    0x04C: "Flora, Future Luke and Chelmey",
    0x04D: "Professor Layton, Flora, Future Luke and Chelmey",
    0x04E: "Luke, Flora, Future Luke and Chelmey",
    0x04F: "Professor Layton, Luke, Flora, Future Luke and Chelmey",
    0x050: "Celeste and Chelmey",
    0x051: "Professor Layton, Celeste and Chelmey",
    0x052: "Luke, Celeste and Chelmey",
    0x053: "Professor Layton, Luke, Celeste and Chelmey",
    0x054: "Flora, Celeste and Chelmey",
    0x055: "Professor Layton, Flora, Celeste and Chelmey",
    0x056: "Luke, Flora, Celeste and Chelmey",
    0x057: "Professor Layton, Luke, Flora, Celeste and Chelmey",
    0x058: "Future Luke, Celeste and Chelmey",
    0x059: "Professor Layton, Future Luke, Celeste and Chelmey",
    0x05A: "Luke, Future Luke, Celeste and Chelmey",
    0x05B: "Professor Layton, Luke, Future Luke, Celeste and Chelmey",
    0x05C: "Flora, Future Luke, Celeste and Chelmey",
    0x05D: "Professor Layton, Flora, Future Luke, Celeste and Chelmey",
    0x05E: "Luke, Flora, Future Luke, Celeste and Chelmey",
    0x05F: "Professor Layton, Luke, Flora, Future Luke, Celeste and Chelmey",
    0x060: "Don Paolo and Chelmey",
    0x061: "Professor Layton, Don Paolo and Chelmey",
    0x062: "Luke, Don Paolo and Chelmey",
    0x063: "Professor Layton, Luke, Don Paolo and Chelmey",
    0x064: "Flora, Don Paolo and Chelmey",
    0x065: "Professor Layton, Flora, Don Paolo and Chelmey",
    0x066: "Luke, Flora, Don Paolo and Chelmey",
    0x067: "Professor Layton, Luke, Flora, Don Paolo and Chelmey",
    0x068: "Future Luke, Don Paolo and Chelmey",
    0x069: "Professor Layton, Future Luke, Don Paolo and Chelmey",
    0x06A: "Luke, Future Luke, Don Paolo and Chelmey",
    0x06B: "Professor Layton, Luke, Future Luke, Don Paolo and Chelmey",
    0x06C: "Flora, Future Luke, Don Paolo and Chelmey",
    0x06D: "Professor Layton, Flora, Future Luke, Don Paolo and Chelmey",
    0x06E: "Luke, Flora, Future Luke, Don Paolo and Chelmey",
    0x06F: "Professor Layton, Luke, Flora, Future Luke, Don Paolo and Chelmey",
    0x070: "Celeste, Don Paolo and Chelmey",
    0x071: "Professor Layton, Celeste, Don Paolo and Chelmey",
    0x072: "Luke, Celeste, Don Paolo and Chelmey",
    0x073: "Professor Layton, Luke, Celeste, Don Paolo and Chelmey",
    0x074: "Flora, Celeste, Don Paolo and Chelmey",
    0x075: "Professor Layton, Flora, Celeste, Don Paolo and Chelmey",
    0x076: "Luke, Flora, Celeste, Don Paolo and Chelmey",
    0x077: "Professor Layton, Luke, Flora, Celeste, Don Paolo and Chelmey",
    0x078: "Future Luke, Celeste, Don Paolo and Chelmey",
    0x079: "Professor Layton, Future Luke, Celeste, Don Paolo and Chelmey",
    0x07A: "Luke, Future Luke, Celeste, Don Paolo and Chelmey",
    0x07B: "Professor Layton, Luke, Future Luke, Celeste, Don Paolo and Chelmey",
    0x07C: "Flora, Future Luke, Celeste, Don Paolo and Chelmey",
    0x07D: "Professor Layton, Flora, Future Luke, Celeste, Don Paolo and Chelmey",
    0x07E: "Luke, Flora, Future Luke, Celeste, Don Paolo and Chelmey",
    0x07F: "Professor Layton, Luke, Flora, Future Luke, Celeste, Don Paolo and Chelmey",
    0x080: "Barton",
    0x081: "Professor Layton and Barton",
    0x082: "Luke and Barton",
    0x083: "Professor Layton, Luke and Barton",
    0x084: "Flora and Barton",
    0x085: "Professor Layton, Flora and Barton",
    0x086: "Luke, Flora and Barton",
    0x087: "Professor Layton, Luke, Flora and Barton",
    0x088: "Future Luke and Barton",
    0x089: "Professor Layton, Future Luke and Barton",
    0x08A: "Luke, Future Luke and Barton",
    0x08B: "Professor Layton, Luke, Future Luke and Barton",
    0x08C: "Flora, Future Luke and Barton",
    0x08D: "Professor Layton, Flora, Future Luke and Barton",
    0x08E: "Luke, Flora, Future Luke and Barton",
    0x08F: "Professor Layton, Luke, Flora, Future Luke and Barton",
    0x090: "Celeste and Barton",
    0x091: "Professor Layton, Celeste and Barton",
    0x092: "Luke, Celeste and Barton",
    0x093: "Professor Layton, Luke, Celeste and Barton",
    0x094: "Flora, Celeste and Barton",
    0x095: "Professor Layton, Flora, Celeste and Barton",
    0x096: "Luke, Flora, Celeste and Barton",
    0x097: "Professor Layton, Luke, Flora, Celeste and Barton",
    0x098: "Future Luke, Celeste and Barton",
    0x099: "Professor Layton, Future Luke, Celeste and Barton",
    0x09A: "Luke, Future Luke, Celeste and Barton",
    0x09B: "Professor Layton, Luke, Future Luke, Celeste and Barton",
    0x09C: "Flora, Future Luke, Celeste and Barton",
    0x09D: "Professor Layton, Flora, Future Luke, Celeste and Barton",
    0x09E: "Luke, Flora, Future Luke, Celeste and Barton",
    0x09F: "Professor Layton, Luke, Flora, Future Luke, Celeste and Barton",
    0x0A0: "Don Paolo and Barton",
    0x0A1: "Professor Layton, Don Paolo and Barton",
    0x0A2: "Luke, Don Paolo and Barton",
    0x0A3: "Professor Layton, Luke, Don Paolo and Barton",
    0x0A4: "Flora, Don Paolo and Barton",
    0x0A5: "Professor Layton, Flora, Don Paolo and Barton",
    0x0A6: "Luke, Flora, Don Paolo and Barton",
    0x0A7: "Professor Layton, Luke, Flora, Don Paolo and Barton",
    0x0A8: "Future Luke, Don Paolo and Barton",
    0x0A9: "Professor Layton, Future Luke, Don Paolo and Barton",
    0x0AA: "Luke, Future Luke, Don Paolo and Barton",
    0x0AB: "Professor Layton, Luke, Future Luke, Don Paolo and Barton",
    0x0AC: "Flora, Future Luke, Don Paolo and Barton",
    0x0AD: "Professor Layton, Flora, Future Luke, Don Paolo and Barton",
    0x0AE: "Luke, Flora, Future Luke, Don Paolo and Barton",
    0x0AF: "Professor Layton, Luke, Flora, Future Luke, Don Paolo and Barton",
    0x0B0: "Celeste, Don Paolo and Barton",
    0x0B1: "Professor Layton, Celeste, Don Paolo and Barton",
    0x0B2: "Luke, Celeste, Don Paolo and Barton",
    0x0B3: "Professor Layton, Luke, Celeste, Don Paolo and Barton",
    0x0B4: "Flora, Celeste, Don Paolo and Barton",
    0x0B5: "Professor Layton, Flora, Celeste, Don Paolo and Barton",
    0x0B6: "Luke, Flora, Celeste, Don Paolo and Barton",
    0x0B7: "Professor Layton, Luke, Flora, Celeste, Don Paolo and Barton",
    0x0B8: "Future Luke, Celeste, Don Paolo and Barton",
    0x0B9: "Professor Layton, Future Luke, Celeste, Don Paolo and Barton",
    0x0BA: "Luke, Future Luke, Celeste, Don Paolo and Barton",
    0x0BB: "Professor Layton, Luke, Future Luke, Celeste, Don Paolo and Barton",
    0x0BC: "Flora, Future Luke, Celeste, Don Paolo and Barton",
    0x0BD: "Professor Layton, Flora, Future Luke, Celeste, Don Paolo and Barton",
    0x0BE: "Luke, Flora, Future Luke, Celeste, Don Paolo and Barton",
    0x0BF: "Professor Layton, Luke, Flora, Future Luke, Celeste, Don Paolo and Barton",
    0x0C0: "Chelmey and Barton",
    0x0C1: "Professor Layton, Chelmey and Barton",
    0x0C2: "Luke, Chelmey and Barton",
    0x0C3: "Professor Layton, Luke, Chelmey and Barton",
    0x0C4: "Flora, Chelmey and Barton",
    0x0C5: "Professor Layton, Flora, Chelmey and Barton",
    0x0C6: "Luke, Flora, Chelmey and Barton",
    0x0C7: "Professor Layton, Luke, Flora, Chelmey and Barton",
    0x0C8: "Future Luke, Chelmey and Barton",
    0x0C9: "Professor Layton, Future Luke, Chelmey and Barton",
    0x0CA: "Luke, Future Luke, Chelmey and Barton",
    0x0CB: "Professor Layton, Luke, Future Luke, Chelmey and Barton",
    0x0CC: "Flora, Future Luke, Chelmey and Barton",
    0x0CD: "Professor Layton, Flora, Future Luke, Chelmey and Barton",
    0x0CE: "Luke, Flora, Future Luke, Chelmey and Barton",
    0x0CF: "Professor Layton, Luke, Flora, Future Luke, Chelmey and Barton",
    0x0D0: "Celeste, Chelmey and Barton",
    0x0D1: "Professor Layton, Celeste, Chelmey and Barton",
    0x0D2: "Luke, Celeste, Chelmey and Barton",
    0x0D3: "Professor Layton, Luke, Celeste, Chelmey and Barton",
    0x0D4: "Flora, Celeste, Chelmey and Barton",
    0x0D5: "Professor Layton, Flora, Celeste, Chelmey and Barton",
    0x0D6: "Luke, Flora, Celeste, Chelmey and Barton",
    0x0D7: "Professor Layton, Luke, Flora, Celeste, Chelmey and Barton",
    0x0D8: "Future Luke, Celeste, Chelmey and Barton",
    0x0D9: "Professor Layton, Future Luke, Celeste, Chelmey and Barton",
    0x0DA: "Luke, Future Luke, Celeste, Chelmey and Barton",
    0x0DB: "Professor Layton, Luke, Future Luke, Celeste, Chelmey and Barton",
    0x0DC: "Flora, Future Luke, Celeste, Chelmey and Barton",
    0x0DD: "Professor Layton, Flora, Future Luke, Celeste, Chelmey and Barton",
    0x0DE: "Luke, Flora, Future Luke, Celeste, Chelmey and Barton",
    0x0DF: "Professor Layton, Luke, Flora, Future Luke, Celeste, Chelmey and Barton",
    0x0E0: "Don Paolo, Chelmey and Barton",
    0x0E1: "Professor Layton, Don Paolo, Chelmey and Barton",
    0x0E2: "Luke, Don Paolo, Chelmey and Barton",
    0x0E3: "Professor Layton, Luke, Don Paolo, Chelmey and Barton",
    0x0E4: "Flora, Don Paolo, Chelmey and Barton",
    0x0E5: "Professor Layton, Flora, Don Paolo, Chelmey and Barton",
    0x0E6: "Luke, Flora, Don Paolo, Chelmey and Barton",
    0x0E7: "Professor Layton, Luke, Flora, Don Paolo, Chelmey and Barton",
    0x0E8: "Future Luke, Don Paolo, Chelmey and Barton",
    0x0E9: "Professor Layton, Future Luke, Don Paolo, Chelmey and Barton",
    0x0EA: "Luke, Future Luke, Don Paolo, Chelmey and Barton",
    0x0EB: "Professor Layton, Luke, Future Luke, Don Paolo, Chelmey and Barton",
    0x0EC: "Flora, Future Luke, Don Paolo, Chelmey and Barton",
    0x0ED: "Professor Layton, Flora, Future Luke, Don Paolo, Chelmey and Barton",
    0x0EE: "Luke, Flora, Future Luke, Don Paolo, Chelmey and Barton",
    0x0EF: "Professor Layton, Luke, Flora, Future Luke, Don Paolo, Chelmey and Barton",
    0x0F0: "Celeste, Don Paolo, Chelmey and Barton",
    0x0F1: "Professor Layton, Celeste, Don Paolo, Chelmey and Barton",
    0x0F2: "Luke, Celeste, Don Paolo, Chelmey and Barton",
    0x0F3: "Professor Layton, Luke, Celeste, Don Paolo, Chelmey and Barton",
    0x0F4: "Flora, Celeste, Don Paolo, Chelmey and Barton",
    0x0F5: "Professor Layton, Flora, Celeste, Don Paolo, Chelmey and Barton",
    0x0F6: "Luke, Flora, Celeste, Don Paolo, Chelmey and Barton",
    0x0F7: "Professor Layton, Luke, Flora, Celeste, Don Paolo, Chelmey and Barton",
    0x0F8: "Future Luke, Celeste, Don Paolo, Chelmey and Barton",
    0x0F9: "Professor Layton, Future Luke, Celeste, Don Paolo, Chelmey and Barton",
    0x0FA: "Luke, Future Luke, Celeste, Don Paolo, Chelmey and Barton",
    0x0FB: "Professor Layton, Luke, Future Luke, Celeste, Don Paolo, Chelmey and Barton",
    0x0FC: "Flora, Future Luke, Celeste, Don Paolo, Chelmey and Barton",
    0x0FD: "Professor Layton, Flora, Future Luke, Celeste, Don Paolo, Chelmey and Barton",
    0x0FE: "Luke, Flora, Future Luke, Celeste, Don Paolo, Chelmey and Barton",
    0x0FF: "Professor Layton, Luke, Flora, Future Luke, Celeste, Don Paolo, Chelmey and Barton",
    0x100: "Bill Hawks",
    0x101: "Professor Layton and Bill Hawks",
    0x102: "Luke and Bill Hawks",
    0x103: "Professor Layton, Luke and Bill Hawks",
    0x104: "Flora and Bill Hawks",
    0x105: "Professor Layton, Flora and Bill Hawks",
    0x106: "Luke, Flora and Bill Hawks",
    0x107: "Professor Layton, Luke, Flora and Bill Hawks",
    0x108: "Future Luke and Bill Hawks",
    0x109: "Professor Layton, Future Luke and Bill Hawks",
    0x10A: "Luke, Future Luke and Bill Hawks",
    0x10B: "Professor Layton, Luke, Future Luke and Bill Hawks",
    0x10C: "Flora, Future Luke and Bill Hawks",
    0x10D: "Professor Layton, Flora, Future Luke and Bill Hawks",
    0x10E: "Luke, Flora, Future Luke and Bill Hawks",
    0x10F: "Professor Layton, Luke, Flora, Future Luke and Bill Hawks",
    0x110: "Celeste and Bill Hawks",
    0x111: "Professor Layton, Celeste and Bill Hawks",
    0x112: "Luke, Celeste and Bill Hawks",
    0x113: "Professor Layton, Luke, Celeste and Bill Hawks",
    0x114: "Flora, Celeste and Bill Hawks",
    0x115: "Professor Layton, Flora, Celeste and Bill Hawks",
    0x116: "Luke, Flora, Celeste and Bill Hawks",
    0x117: "Professor Layton, Luke, Flora, Celeste and Bill Hawks",
    0x118: "Future Luke, Celeste and Bill Hawks",
    0x119: "Professor Layton, Future Luke, Celeste and Bill Hawks",
    0x11A: "Luke, Future Luke, Celeste and Bill Hawks",
    0x11B: "Professor Layton, Luke, Future Luke, Celeste and Bill Hawks",
    0x11C: "Flora, Future Luke, Celeste and Bill Hawks",
    0x11D: "Professor Layton, Flora, Future Luke, Celeste and Bill Hawks",
    0x11E: "Luke, Flora, Future Luke, Celeste and Bill Hawks",
    0x11F: "Professor Layton, Luke, Flora, Future Luke, Celeste and Bill Hawks",
    0x120: "Don Paolo and Bill Hawks",
    0x121: "Professor Layton, Don Paolo and Bill Hawks",
    0x122: "Luke, Don Paolo and Bill Hawks",
    0x123: "Professor Layton, Luke, Don Paolo and Bill Hawks",
    0x124: "Flora, Don Paolo and Bill Hawks",
    0x125: "Professor Layton, Flora, Don Paolo and Bill Hawks",
    0x126: "Luke, Flora, Don Paolo and Bill Hawks",
    0x127: "Professor Layton, Luke, Flora, Don Paolo and Bill Hawks",
    0x128: "Future Luke, Don Paolo and Bill Hawks",
    0x129: "Professor Layton, Future Luke, Don Paolo and Bill Hawks",
    0x12A: "Luke, Future Luke, Don Paolo and Bill Hawks",
    0x12B: "Professor Layton, Luke, Future Luke, Don Paolo and Bill Hawks",
    0x12C: "Flora, Future Luke, Don Paolo and Bill Hawks",
    0x12D: "Professor Layton, Flora, Future Luke, Don Paolo and Bill Hawks",
    0x12E: "Luke, Flora, Future Luke, Don Paolo and Bill Hawks",
    0x12F: "Professor Layton, Luke, Flora, Future Luke, Don Paolo and Bill Hawks",
    0x130: "Celeste, Don Paolo and Bill Hawks",
    0x131: "Professor Layton, Celeste, Don Paolo and Bill Hawks",
    0x132: "Luke, Celeste, Don Paolo and Bill Hawks",
    0x133: "Professor Layton, Luke, Celeste, Don Paolo and Bill Hawks",
    0x134: "Flora, Celeste, Don Paolo and Bill Hawks",
    0x135: "Professor Layton, Flora, Celeste, Don Paolo and Bill Hawks",
    0x136: "Luke, Flora, Celeste, Don Paolo and Bill Hawks",
    0x137: "Professor Layton, Luke, Flora, Celeste, Don Paolo and Bill Hawks",
    0x138: "Future Luke, Celeste, Don Paolo and Bill Hawks",
    0x139: "Professor Layton, Future Luke, Celeste, Don Paolo and Bill Hawks",
    0x13A: "Luke, Future Luke, Celeste, Don Paolo and Bill Hawks",
    0x13B: "Professor Layton, Luke, Future Luke, Celeste, Don Paolo and Bill Hawks",
    0x13C: "Flora, Future Luke, Celeste, Don Paolo and Bill Hawks",
    0x13D: "Professor Layton, Flora, Future Luke, Celeste, Don Paolo and Bill Hawks",
    0x13E: "Luke, Flora, Future Luke, Celeste, Don Paolo and Bill Hawks",
    0x13F: "Professor Layton, Luke, Flora, Future Luke, Celeste, Don Paolo and Bill Hawks",
    0x140: "Chelmey and Bill Hawks",
    0x141: "Professor Layton, Chelmey and Bill Hawks",
    0x142: "Luke, Chelmey and Bill Hawks",
    0x143: "Professor Layton, Luke, Chelmey and Bill Hawks",
    0x144: "Flora, Chelmey and Bill Hawks",
    0x145: "Professor Layton, Flora, Chelmey and Bill Hawks",
    0x146: "Luke, Flora, Chelmey and Bill Hawks",
    0x147: "Professor Layton, Luke, Flora, Chelmey and Bill Hawks",
    0x148: "Future Luke, Chelmey and Bill Hawks",
    0x149: "Professor Layton, Future Luke, Chelmey and Bill Hawks",
    0x14A: "Luke, Future Luke, Chelmey and Bill Hawks",
    0x14B: "Professor Layton, Luke, Future Luke, Chelmey and Bill Hawks",
    0x14C: "Flora, Future Luke, Chelmey and Bill Hawks",
    0x14D: "Professor Layton, Flora, Future Luke, Chelmey and Bill Hawks",
    0x14E: "Luke, Flora, Future Luke, Chelmey and Bill Hawks",
    0x14F: "Professor Layton, Luke, Flora, Future Luke, Chelmey and Bill Hawks",
    0x150: "Celeste, Chelmey and Bill Hawks",
    0x151: "Professor Layton, Celeste, Chelmey and Bill Hawks",
    0x152: "Luke, Celeste, Chelmey and Bill Hawks",
    0x153: "Professor Layton, Luke, Celeste, Chelmey and Bill Hawks",
    0x154: "Flora, Celeste, Chelmey and Bill Hawks",
    0x155: "Professor Layton, Flora, Celeste, Chelmey and Bill Hawks",
    0x156: "Luke, Flora, Celeste, Chelmey and Bill Hawks",
    0x157: "Professor Layton, Luke, Flora, Celeste, Chelmey and Bill Hawks",
    0x158: "Future Luke, Celeste, Chelmey and Bill Hawks",
    0x159: "Professor Layton, Future Luke, Celeste, Chelmey and Bill Hawks",
    0x15A: "Luke, Future Luke, Celeste, Chelmey and Bill Hawks",
    0x15B: "Professor Layton, Luke, Future Luke, Celeste, Chelmey and Bill Hawks",
    0x15C: "Flora, Future Luke, Celeste, Chelmey and Bill Hawks",
    0x15D: "Professor Layton, Flora, Future Luke, Celeste, Chelmey and Bill Hawks",
    0x15E: "Luke, Flora, Future Luke, Celeste, Chelmey and Bill Hawks",
    0x15F: "Professor Layton, Luke, Flora, Future Luke, Celeste, Chelmey and Bill Hawks",
    0x160: "Don Paolo, Chelmey and Bill Hawks",
    0x161: "Professor Layton, Don Paolo, Chelmey and Bill Hawks",
    0x162: "Luke, Don Paolo, Chelmey and Bill Hawks",
    0x163: "Professor Layton, Luke, Don Paolo, Chelmey and Bill Hawks",
    0x164: "Flora, Don Paolo, Chelmey and Bill Hawks",
    0x165: "Professor Layton, Flora, Don Paolo, Chelmey and Bill Hawks",
    0x166: "Luke, Flora, Don Paolo, Chelmey and Bill Hawks",
    0x167: "Professor Layton, Luke, Flora, Don Paolo, Chelmey and Bill Hawks",
    0x168: "Future Luke, Don Paolo, Chelmey and Bill Hawks",
    0x169: "Professor Layton, Future Luke, Don Paolo, Chelmey and Bill Hawks",
    0x16A: "Luke, Future Luke, Don Paolo, Chelmey and Bill Hawks",
    0x16B: "Professor Layton, Luke, Future Luke, Don Paolo, Chelmey and Bill Hawks",
    0x16C: "Flora, Future Luke, Don Paolo, Chelmey and Bill Hawks",
    0x16D: "Professor Layton, Flora, Future Luke, Don Paolo, Chelmey and Bill Hawks",
    0x16E: "Luke, Flora, Future Luke, Don Paolo, Chelmey and Bill Hawks",
    0x16F: "Professor Layton, Luke, Flora, Future Luke, Don Paolo, Chelmey and Bill Hawks",
    0x170: "Celeste, Don Paolo, Chelmey and Bill Hawks",
    0x171: "Professor Layton, Celeste, Don Paolo, Chelmey and Bill Hawks",
    0x172: "Luke, Celeste, Don Paolo, Chelmey and Bill Hawks",
    0x173: "Professor Layton, Luke, Celeste, Don Paolo, Chelmey and Bill Hawks",
    0x174: "Flora, Celeste, Don Paolo, Chelmey and Bill Hawks",
    0x175: "Professor Layton, Flora, Celeste, Don Paolo, Chelmey and Bill Hawks",
    0x176: "Luke, Flora, Celeste, Don Paolo, Chelmey and Bill Hawks",
    0x177: "Professor Layton, Luke, Flora, Celeste, Don Paolo, Chelmey and Bill Hawks",
    0x178: "Future Luke, Celeste, Don Paolo, Chelmey and Bill Hawks",
    0x179: "Professor Layton, Future Luke, Celeste, Don Paolo, Chelmey and Bill Hawks",
    0x17A: "Luke, Future Luke, Celeste, Don Paolo, Chelmey and Bill Hawks",
    0x17B: "Professor Layton, Luke, Future Luke, Celeste, Don Paolo, Chelmey and Bill Hawks",
    0x17C: "Flora, Future Luke, Celeste, Don Paolo, Chelmey and Bill Hawks",
    0x17D: "Professor Layton, Flora, Future Luke, Celeste, Don Paolo, Chelmey and Bill Hawks",
    0x17E: "Luke, Flora, Future Luke, Celeste, Don Paolo, Chelmey and Bill Hawks",
    0x17F: "Professor Layton, Luke, Flora, Future Luke, Celeste, Don Paolo, Chelmey and Bill Hawks",
    0x180: "Barton and Bill Hawks",
    0x181: "Professor Layton, Barton and Bill Hawks",
    0x182: "Luke, Barton and Bill Hawks",
    0x183: "Professor Layton, Luke, Barton and Bill Hawks",
    0x184: "Flora, Barton and Bill Hawks",
    0x185: "Professor Layton, Flora, Barton and Bill Hawks",
    0x186: "Luke, Flora, Barton and Bill Hawks",
    0x187: "Professor Layton, Luke, Flora, Barton and Bill Hawks",
    0x188: "Future Luke, Barton and Bill Hawks",
    0x189: "Professor Layton, Future Luke, Barton and Bill Hawks",
    0x18A: "Luke, Future Luke, Barton and Bill Hawks",
    0x18B: "Professor Layton, Luke, Future Luke, Barton and Bill Hawks",
    0x18C: "Flora, Future Luke, Barton and Bill Hawks",
    0x18D: "Professor Layton, Flora, Future Luke, Barton and Bill Hawks",
    0x18E: "Luke, Flora, Future Luke, Barton and Bill Hawks",
    0x18F: "Professor Layton, Luke, Flora, Future Luke, Barton and Bill Hawks",
    0x190: "Celeste, Barton and Bill Hawks",
    0x191: "Professor Layton, Celeste, Barton and Bill Hawks",
    0x192: "Luke, Celeste, Barton and Bill Hawks",
    0x193: "Professor Layton, Luke, Celeste, Barton and Bill Hawks",
    0x194: "Flora, Celeste, Barton and Bill Hawks",
    0x195: "Professor Layton, Flora, Celeste, Barton and Bill Hawks",
    0x196: "Luke, Flora, Celeste, Barton and Bill Hawks",
    0x197: "Professor Layton, Luke, Flora, Celeste, Barton and Bill Hawks",
    0x198: "Future Luke, Celeste, Barton and Bill Hawks",
    0x199: "Professor Layton, Future Luke, Celeste, Barton and Bill Hawks",
    0x19A: "Luke, Future Luke, Celeste, Barton and Bill Hawks",
    0x19B: "Professor Layton, Luke, Future Luke, Celeste, Barton and Bill Hawks",
    0x19C: "Flora, Future Luke, Celeste, Barton and Bill Hawks",
    0x19D: "Professor Layton, Flora, Future Luke, Celeste, Barton and Bill Hawks",
    0x19E: "Luke, Flora, Future Luke, Celeste, Barton and Bill Hawks",
    0x19F: "Professor Layton, Luke, Flora, Future Luke, Celeste, Barton and Bill Hawks",
    0x1A0: "Don Paolo, Barton and Bill Hawks",
    0x1A1: "Professor Layton, Don Paolo, Barton and Bill Hawks",
    0x1A2: "Luke, Don Paolo, Barton and Bill Hawks",
    0x1A3: "Professor Layton, Luke, Don Paolo, Barton and Bill Hawks",
    0x1A4: "Flora, Don Paolo, Barton and Bill Hawks",
    0x1A5: "Professor Layton, Flora, Don Paolo, Barton and Bill Hawks",
    0x1A6: "Luke, Flora, Don Paolo, Barton and Bill Hawks",
    0x1A7: "Professor Layton, Luke, Flora, Don Paolo, Barton and Bill Hawks",
    0x1A8: "Future Luke, Don Paolo, Barton and Bill Hawks",
    0x1A9: "Professor Layton, Future Luke, Don Paolo, Barton and Bill Hawks",
    0x1AA: "Luke, Future Luke, Don Paolo, Barton and Bill Hawks",
    0x1AB: "Professor Layton, Luke, Future Luke, Don Paolo, Barton and Bill Hawks",
    0x1AC: "Flora, Future Luke, Don Paolo, Barton and Bill Hawks",
    0x1AD: "Professor Layton, Flora, Future Luke, Don Paolo, Barton and Bill Hawks",
    0x1AE: "Luke, Flora, Future Luke, Don Paolo, Barton and Bill Hawks",
    0x1AF: "Professor Layton, Luke, Flora, Future Luke, Don Paolo, Barton and Bill Hawks",
    0x1B0: "Celeste, Don Paolo, Barton and Bill Hawks",
    0x1B1: "Professor Layton, Celeste, Don Paolo, Barton and Bill Hawks",
    0x1B2: "Luke, Celeste, Don Paolo, Barton and Bill Hawks",
    0x1B3: "Professor Layton, Luke, Celeste, Don Paolo, Barton and Bill Hawks",
    0x1B4: "Flora, Celeste, Don Paolo, Barton and Bill Hawks",
    0x1B5: "Professor Layton, Flora, Celeste, Don Paolo, Barton and Bill Hawks",
    0x1B6: "Luke, Flora, Celeste, Don Paolo, Barton and Bill Hawks",
    0x1B7: "Professor Layton, Luke, Flora, Celeste, Don Paolo, Barton and Bill Hawks",
    0x1B8: "Future Luke, Celeste, Don Paolo, Barton and Bill Hawks",
    0x1B9: "Professor Layton, Future Luke, Celeste, Don Paolo, Barton and Bill Hawks",
    0x1BA: "Luke, Future Luke, Celeste, Don Paolo, Barton and Bill Hawks",
    0x1BB: "Professor Layton, Luke, Future Luke, Celeste, Don Paolo, Barton and Bill Hawks",
    0x1BC: "Flora, Future Luke, Celeste, Don Paolo, Barton and Bill Hawks",
    0x1BD: "Professor Layton, Flora, Future Luke, Celeste, Don Paolo, Barton and Bill Hawks",
    0x1BE: "Luke, Flora, Future Luke, Celeste, Don Paolo, Barton and Bill Hawks",
    0x1BF: "Professor Layton, Luke, Flora, Future Luke, Celeste, Don Paolo, Barton and Bill Hawks",
    0x1C0: "Chelmey, Barton and Bill Hawks",
    0x1C1: "Professor Layton, Chelmey, Barton and Bill Hawks",
    0x1C2: "Luke, Chelmey, Barton and Bill Hawks",
    0x1C3: "Professor Layton, Luke, Chelmey, Barton and Bill Hawks",
    0x1C4: "Flora, Chelmey, Barton and Bill Hawks",
    0x1C5: "Professor Layton, Flora, Chelmey, Barton and Bill Hawks",
    0x1C6: "Luke, Flora, Chelmey, Barton and Bill Hawks",
    0x1C7: "Professor Layton, Luke, Flora, Chelmey, Barton and Bill Hawks",
    0x1C8: "Future Luke, Chelmey, Barton and Bill Hawks",
    0x1C9: "Professor Layton, Future Luke, Chelmey, Barton and Bill Hawks",
    0x1CA: "Luke, Future Luke, Chelmey, Barton and Bill Hawks",
    0x1CB: "Professor Layton, Luke, Future Luke, Chelmey, Barton and Bill Hawks",
    0x1CC: "Flora, Future Luke, Chelmey, Barton and Bill Hawks",
    0x1CD: "Professor Layton, Flora, Future Luke, Chelmey, Barton and Bill Hawks",
    0x1CE: "Luke, Flora, Future Luke, Chelmey, Barton and Bill Hawks",
    0x1CF: "Professor Layton, Luke, Flora, Future Luke, Chelmey, Barton and Bill Hawks",
    0x1D0: "Celeste, Chelmey, Barton and Bill Hawks",
    0x1D1: "Professor Layton, Celeste, Chelmey, Barton and Bill Hawks",
    0x1D2: "Luke, Celeste, Chelmey, Barton and Bill Hawks",
    0x1D3: "Professor Layton, Luke, Celeste, Chelmey, Barton and Bill Hawks",
    0x1D4: "Flora, Celeste, Chelmey, Barton and Bill Hawks",
    0x1D5: "Professor Layton, Flora, Celeste, Chelmey, Barton and Bill Hawks",
    0x1D6: "Luke, Flora, Celeste, Chelmey, Barton and Bill Hawks",
    0x1D7: "Professor Layton, Luke, Flora, Celeste, Chelmey, Barton and Bill Hawks",
    0x1D8: "Future Luke, Celeste, Chelmey, Barton and Bill Hawks",
    0x1D9: "Professor Layton, Future Luke, Celeste, Chelmey, Barton and Bill Hawks",
    0x1DA: "Luke, Future Luke, Celeste, Chelmey, Barton and Bill Hawks",
    0x1DB: "Professor Layton, Luke, Future Luke, Celeste, Chelmey, Barton and Bill Hawks",
    0x1DC: "Flora, Future Luke, Celeste, Chelmey, Barton and Bill Hawks",
    0x1DD: "Professor Layton, Flora, Future Luke, Celeste, Chelmey, Barton and Bill Hawks",
    0x1DE: "Luke, Flora, Future Luke, Celeste, Chelmey, Barton and Bill Hawks",
    0x1DF: "Professor Layton, Luke, Flora, Future Luke, Celeste, Chelmey, Barton and Bill Hawks",
    0x1E0: "Don Paolo, Chelmey, Barton and Bill Hawks",
    0x1E1: "Professor Layton, Don Paolo, Chelmey, Barton and Bill Hawks",
    0x1E2: "Luke, Don Paolo, Chelmey, Barton and Bill Hawks",
    0x1E3: "Professor Layton, Luke, Don Paolo, Chelmey, Barton and Bill Hawks",
    0x1E4: "Flora, Don Paolo, Chelmey, Barton and Bill Hawks",
    0x1E5: "Professor Layton, Flora, Don Paolo, Chelmey, Barton and Bill Hawks",
    0x1E6: "Luke, Flora, Don Paolo, Chelmey, Barton and Bill Hawks",
    0x1E7: "Professor Layton, Luke, Flora, Don Paolo, Chelmey, Barton and Bill Hawks",
    0x1E8: "Future Luke, Don Paolo, Chelmey, Barton and Bill Hawks",
    0x1E9: "Professor Layton, Future Luke, Don Paolo, Chelmey, Barton and Bill Hawks",
    0x1EA: "Luke, Future Luke, Don Paolo, Chelmey, Barton and Bill Hawks",
    0x1EB: "Professor Layton, Luke, Future Luke, Don Paolo, Chelmey, Barton and Bill Hawks",
    0x1EC: "Flora, Future Luke, Don Paolo, Chelmey, Barton and Bill Hawks",
    0x1ED: "Professor Layton, Flora, Future Luke, Don Paolo, Chelmey, Barton and Bill Hawks",
    0x1EE: "Luke, Flora, Future Luke, Don Paolo, Chelmey, Barton and Bill Hawks",
    0x1EF: "Professor Layton, Luke, Flora, Future Luke, Don Paolo, Chelmey, Barton and Bill Hawks",
    0x1F0: "Celeste, Don Paolo, Chelmey, Barton and Bill Hawks",
    0x1F1: "Professor Layton, Celeste, Don Paolo, Chelmey, Barton and Bill Hawks",
    0x1F2: "Luke, Celeste, Don Paolo, Chelmey, Barton and Bill Hawks",
    0x1F3: "Professor Layton, Luke, Celeste, Don Paolo, Chelmey, Barton and Bill Hawks",
    0x1F4: "Flora, Celeste, Don Paolo, Chelmey, Barton and Bill Hawks",
    0x1F5: "Professor Layton, Flora, Celeste, Don Paolo, Chelmey, Barton and Bill Hawks",
    0x1F6: "Luke, Flora, Celeste, Don Paolo, Chelmey, Barton and Bill Hawks",
    0x1F7: "Professor Layton, Luke, Flora, Celeste, Don Paolo, Chelmey, Barton and Bill Hawks",
    0x1F8: "Future Luke, Celeste, Don Paolo, Chelmey, Barton and Bill Hawks",
    0x1F9: "Professor Layton, Future Luke, Celeste, Don Paolo, Chelmey, Barton and Bill Hawks",
    0x1FA: "Luke, Future Luke, Celeste, Don Paolo, Chelmey, Barton and Bill Hawks",
    0x1FB: "Professor Layton, Luke, Future Luke, Celeste, Don Paolo, Chelmey, Barton and Bill Hawks",
    0x1FC: "Flora, Future Luke, Celeste, Don Paolo, Chelmey, Barton and Bill Hawks",
    0x1FD: "Professor Layton, Flora, Future Luke, Celeste, Don Paolo, Chelmey, Barton and Bill Hawks",
    0x1FE: "Luke, Flora, Future Luke, Celeste, Don Paolo, Chelmey, Barton and Bill Hawks",
    0x1FF: "Professor Layton, Luke, Flora, Future Luke, Celeste, Don Paolo, Chelmey, Barton and Bill Hawks",
}

PuzzleSolverIDs = {
    0x01: "Professor Layton",
    0x02: "Luke",
    0x03: "Flora",
    0x04: "Future Luke",
}

ToBe = {
    0x001: "is",
    0x002: "is",
    0x004: "is",
    0x008: "is",
    0x010: "is",
    0x020: "is",
    0x040: "is",
    0x080: "is",
    0x100: "is",
}

ChapterValues = {}
for ChapterValue in range(0x0000, 0xFFFF) {
    if (ChapterValue >= 0x0000 && ChapterValue < 0x0064) {
        ChapterValues[ChapterValue] = "Prologue"
    } else
    if (ChapterValue >= 0x0064 && ChapterValue < 0x00136) {
        ChapterValues[ChapterValue] = "Chapter 1"
    } else
    if (ChapterValue >= 0x0136 && ChapterValue < 0x0017C) {
        ChapterValues[ChapterValue] = "Chapter 2"
    } else
    if (ChapterValue >= 0x017C && ChapterValue < 0x019A) {
        ChapterValues[ChapterValue] = "Chapter 3"
    } else
    if (ChapterValue >= 0x019A && ChapterValue < 0x01EA) {
        ChapterValues[ChapterValue] = "Chapter 4"
    } else
    if (ChapterValue >= 0x01EA && ChapterValue < 0x0258) {
        ChapterValues[ChapterValue] = "Chapter 5"
    } else
    if (ChapterValue >= 0x0258 && ChapterValue < 0x02BC) {
        ChapterValues[ChapterValue] = "Chapter 6"
    } else
    if (ChapterValue >= 0x02BC && ChapterValue < 0x0320) {
        ChapterValues[ChapterValue] = "Chapter 7"
    } else
    if (ChapterValue >= 0x0320 && ChapterValue < 0x0384) {
        ChapterValues[ChapterValue] = "Chapter 8"
    } else
    if (ChapterValue >= 0x0384 && ChapterValue < 0x03ED) {
        ChapterValues[ChapterValue] = "Chapter 9"
    } else
    if (ChapterValue >= 0x03ED && ChapterValue < 0x041A) {
        ChapterValues[ChapterValue] = "Chapter 10"
    } else
    if (ChapterValue >= 0x041A && ChapterValue < 0x043B) {
        ChapterValues[ChapterValue] = "Chapter 11"
    } else
    if (ChapterValue >= 0x044C && ChapterValue < 0x044C) {
        ChapterValues[ChapterValue] = "Chapter 12"
    } else
    if (ChapterValue >= 0x044C && ChapterValue < 0x0471) {
        ChapterValues[ChapterValue] = "Chapter 13"
    } else
    if (ChapterValue >= 0x0471) {
        ChapterValues[ChapterValue] = "Epilogue"
    }
}

//--------------------------------------------------
// Achievements

achievement(
    title = "Is This the Future?", points = 5, type="progression",
    description = "Finish Chapter 1.",
    id = 116476, badge = "119188",
    trigger = checkInGame() &&
              getLocationID() == 0x4BA &&
              getObjectiveID() == 0x136 &&
              prev(getObjectiveID()) == 0x12C
)

achievement(
    title = "A Boy Named Luke", points = 5, type="progression",
    description = "Finish Chapter 2.",
    id = 116477, badge = "127298",
    trigger = checkInGame() &&
              getLocationID() == 0x4B5 &&
              getObjectiveID() == 0x17C &&
              prev(getObjectiveID()) == 0x172
)

achievement(
    title = "The Enigmatic Future", points = 5, type="progression",
    description = "Finish Chapter 3.",
    id = 116478, badge = "127299",
    trigger = checkInGame() &&
              getLocationID() == 0x518 &&
              getObjectiveID() == 0x19A &&
              prev(getObjectiveID()) == 0x195
)

achievement(
    title = "Back to the Present", points = 5, type="progression",
    description = "Finish Chapter 4.",
    id = 116479, badge = "127304",
    trigger = checkInGame() &&
              getLocationID() == 0x3F3 &&
              getObjectiveID() == 0x1EA &&
              prev(getObjectiveID()) == 0x1E5
)

achievement(
    title = "The Forgotten Case", points = 5, type="progression",
    description = "Finish Chapter 5.",
    id = 116480, badge = "127305",
    trigger = checkInGame() &&
              getLocationID() == 0x3EB &&
              getObjectiveID() == 0x258 &&
              prev(getObjectiveID()) == 0x24E
)

achievement(
    title = "Travelling Companions?", points = 5, type="progression",
    description = "Finish Chapter 6.",
    id = 116481, badge = "127314",
    trigger = checkInGame() &&
              getLocationID() == 0x4BF &&
              getObjectiveID() == 0x2BC &&
              prev(getObjectiveID()) == 0x2B7
)

achievement(
    title = "Chinatown", points = 5, type="progression",
    description = "Finish Chapter 7.",
    id = 116482, badge = "127553",
    trigger = checkInGame() &&
              getLocationID() == 0x578 &&
              getObjectiveID() == 0x320 &&
              prev(getObjectiveID()) == 0x31B
)

achievement(
    title = "A Meeting by the River", points = 5, type="progression",
    description = "Finish Chapter 8.",
    id = 116483, badge = "127554",
    trigger = checkInGame() &&
              getLocationID() == 0x516 &&
              getObjectiveID() == 0x384 &&
              prev(getObjectiveID()) == 0x352
)

achievement(
    title = "The Master of the Towering Pagoda", points = 5, type="progression",
    description = "Finish Chapter 9.",
    id = 116484, badge = "127555",
    trigger = checkInGame() &&
              getLocationID() == 0x582 &&
              getObjectiveID() == 0x3ED &&
              prev(getObjectiveID()) == 0x3EB
)

achievement(
    title = "Across the Thames", points = 5, type="progression",
    description = "Finish Chapter 10.",
    id = 116485, badge = "127567",
    trigger = checkInGame() &&
              getLocationID() == 0x645 &&
              getObjectiveID() == 0x41A &&
              prev(getObjectiveID()) == 0x415
)

achievement(
    title = "The Time Machine Laboratory", points = 5, type="progression",
    description = "Finish Chapter 11.",
    id = 116486, badge = "127571",
    trigger = checkInGame() &&
              getLocationID() == 0x643 &&
              getObjectiveID() == 0x43B &&
              prev(getObjectiveID()) == 0x439
)

achievement(
    title = "The Truth Revealed", points = 5, type="progression",
    description = "Finish Chapter 12.",
    id = 116487, badge = "127574",
    trigger = checkInGame() &&
              __ornext(getLocationID() == 0x640 ||
                       getLocationID() == 0x642) &&
              getObjectiveID() == 0x44C &&
              prev(getObjectiveID()) == 0x449
)

achievement(
    title = "The Stronghold of Madness", points = 5, type="progression",
    description = "Finish Chapter 13.",
    id = 116488, badge = "127579",
    trigger = checkInGame() &&
              getLocationID() == 0x710 &&
              getObjectiveID() == 0x471 &&
              prev(getObjectiveID()) == 0x470
)

achievement(
    title = "The Lost Future", points = 10, type="progression",
    description = "Finish the Epilogue.",
    id = 116489, badge = "127582",
    trigger = checkInGame() &&
              getPuzzleSolveFlagByPuzzleID("130") == 0x1 &&
              getPuzzleSolveFlagByPuzzleID("130") == prev(getPuzzleSolveFlagByPuzzleID("130")) &&
              ((getLocationID() == 0x708 &&
                getObjectiveID() == 0x488 &&
                getGameBeatenFlag() == 0x00 &&
                prev(getCutsceneID()) == 0x24 &&
                getGameStateID() != 0x09 &&
                prev(getGameStateID()) == 0x09) ||
               (__ornext(getLocationID() == 0x708 ||
                         getLocationID() == 0x710) &&
                getGameBeatenFlag() > prev(getGameBeatenFlag())))
)

achievement(
    title = "The Mysteries of London Are Solved", points = 25,
    description = "Solve all 168 regular puzzles.",
    id = 116776, badge = "127900",
    trigger = checkInGame() &&
              measured(calculatePuzzlesSolvedRegular() == 168) &&
                  prev(calculatePuzzlesSolvedRegular() == 167)
)

achievement(
    title = "London's Best Puzzle-Solver", points = 25, type="missable",
    description = "Solve all 168 regular puzzles without mistake and collect 6000 picarats.",
    id = 116777, badge = "127892",
    trigger = checkInGame() &&
              measured(getTotalPicarats() == 6000) &&
                  prev(getTotalPicarats() >= 5000) &&
                  prev(getTotalPicarats() <= 5999)
)

achievement(
    title = "Archaeologist in London", points = 25, type="missable",
    description = "Collect all 300 hint coins without using any of them.",
    id = 116778, badge = "127898",
    trigger = measured(getTotalHintCoinsInInventory() == 300) &&
                  prev(getTotalHintCoinsInInventory() == 299)
)

achievement(
    title = "London's Weekly Puzzles", points = 10,
    description = "Solve all 33 weekly puzzles.",
    id = 117061, badge = "127909",
    trigger = (measured(calculatePuzzleSolvedWiFi("US") == 33) &&
                   prev(calculatePuzzleSolvedWiFi("US")) == 32) ||
              (measured(calculatePuzzleSolvedWiFi("EU") == 33) &&
                   prev(calculatePuzzleSolvedWiFi("EU")) == 32)
)

achievement(
    title = "Puzzles of the Storyteller", points = 10,
    description = "Solve all three puzzles of the Storyteller's house.",
    id = 117070, badge = "127795",
    trigger = measured(getPuzzleSolveFlagByPuzzleID("154")
                     + getPuzzleSolveFlagByPuzzleID("155")
                     + getPuzzleSolveFlagByPuzzleID("156") == 3) &&
                  prev(getPuzzleSolveFlagByPuzzleID("154")
                     + getPuzzleSolveFlagByPuzzleID("155")
                     + getPuzzleSolveFlagByPuzzleID("156")) == 2
)

achievement(
    title = "Puzzles of the Hotelier", points = 10,
    description = "Solve all three puzzles of the Hotelier's house.",
    id = 117071, badge = "127799",
    trigger = measured(getPuzzleSolveFlagByPuzzleID("157")
                     + getPuzzleSolveFlagByPuzzleID("158")
                     + getPuzzleSolveFlagByPuzzleID("159") == 3) &&
                  prev(getPuzzleSolveFlagByPuzzleID("157")
                     + getPuzzleSolveFlagByPuzzleID("158")
                     + getPuzzleSolveFlagByPuzzleID("159")) == 2
)

achievement(
    title = "Puzzles of the Delivery Bird", points = 10,
    description = "Solve all three puzzles of the Delivery Bird's house.",
    id = 117072, badge = "127802",
    trigger = measured(getPuzzleSolveFlagByPuzzleID("160")
                     + getPuzzleSolveFlagByPuzzleID("161")
                     + getPuzzleSolveFlagByPuzzleID("162") == 3) &&
                  prev(getPuzzleSolveFlagByPuzzleID("160")
                     + getPuzzleSolveFlagByPuzzleID("161")
                     + getPuzzleSolveFlagByPuzzleID("162")) == 2
)

achievement(
    title = "Puzzles of the Time Traveller", points = 10,
    description = "Solve all three puzzles of the Time Traveller's house.",
    id = 117073, badge = "127804",
    trigger = measured(getPuzzleSolveFlagByPuzzleID("163")
                     + getPuzzleSolveFlagByPuzzleID("164")
                     + getPuzzleSolveFlagByPuzzleID("165") == 3) &&
                  prev(getPuzzleSolveFlagByPuzzleID("163")
                     + getPuzzleSolveFlagByPuzzleID("164")
                     + getPuzzleSolveFlagByPuzzleID("165")) == 2
)

achievement(
    title = "Puzzles of the Puzzle Keeper", points = 10,
    description = "Solve all three puzzles of the Puzzle Keeper's house.",
    id = 117074, badge = "127860",
    trigger = measured(getPuzzleSolveFlagByPuzzleID("166")
                     + getPuzzleSolveFlagByPuzzleID("167")
                     + getPuzzleSolveFlagByPuzzleID("168") == 3) &&
                  prev(getPuzzleSolveFlagByPuzzleID("166")
                     + getPuzzleSolveFlagByPuzzleID("167")
                     + getPuzzleSolveFlagByPuzzleID("168")) == 2
)

achievement(
    title = "Car Journey", points = 10,
    description = "Complete all toy car courses.",
    id = 117075, badge = "127621",
    trigger = measured(calculateMinigameToyCarCoursesCleared() == 10) &&
                  prev(calculateMinigameToyCarCoursesCleared()) == 9
)

achievement(
    title = "Carrier Parrot", points = 10,
    description = "Complete all parrot deliveries.",
    id = 117076, badge = "127619",
    trigger = measured(calculateMinigameParrotDeliveriesCleared() == 12) &&
                  prev(calculateMinigameParrotDeliveriesCleared()) == 11
)

achievement(
    title = "Learning to Fly", points = 3,
    description = "Complete all three 'Fun with Luke' levels in a single session.",
    id = 117077, badge = "127618",
    trigger = measured(tally(3,
                             once(getGameStateID() == 0x1A &&
                                  getParrotDeliveryStageID() == 0x0D &&
                                  getParrotDeliveryStageClearFlag() > prev(getParrotDeliveryStageClearFlag())),
                             once(getGameStateID() == 0x1A &&
                                  getParrotDeliveryStageID() == 0x0E &&
                                  getParrotDeliveryStageClearFlag() > prev(getParrotDeliveryStageClearFlag())),
                             once(getGameStateID() == 0x1A &&
                                  getParrotDeliveryStageID() == 0x0F &&
                                  getParrotDeliveryStageClearFlag() > prev(getParrotDeliveryStageClearFlag()))))
)

achievement(
    title = "My Personal Puzzle Book", points = 10,
    description = "Complete all 3 stories in the picture book.",
    id = 117078, badge = "127620",
    trigger = measured(calculateMinigameStoryBooksCleared() == 3) &&
                  prev(calculateMinigameStoryBooksCleared()) == 2
)

achievement(
    title = "A Present from an Old Friend", points = 10,
    description = "Reopen the Elysian Box and solve the puzzle inside.",
    id = 117079, badge = "127881",
    trigger = getGameStateID() == 0x23 &&
              getCurrentPuzzleID() == 0xE0 &&
              checkPuzzleSolved() &&
              getPuzzleState() != prev(getPuzzleState())
)

achievement(
    title = "Garnet Clutter", points = 3,
    description = "Solve Puzzle 038 'Cluttered Case' in 10 moves.",
    id = 117132, badge = "128043",
    trigger = always_false()
)

achievement(
    title = "Twirl the Maze", points = 3,
    description = "Solve Puzzle 058 'Gravity Maze' in 5 moves.",
    id = 117133, badge = "128044",
    trigger = always_false()
              
)

achievement(
    title = "Juggling with Gravity", points = 5,
    description = "Solve Puzzle 109 'Three Blocks' in 15 moves.",
    id = 117134, badge = "128057",
    trigger = always_false()
)

achievement(
    title = "Gravity Party", points = 10,
    description = "Solve Puzzle 155 'Block Parity' in 32 moves.",
    id = 117135, badge = "128060",
    trigger = always_false()
)

achievement(
    title = "Preparing for Leapfrog", points = 3,
    description = "Solve Puzzle 059 'Leapfrogs' in 8 moves.",
    id = 117136, badge = "128048",
    trigger = always_false()
)

achievement(
    title = "I Do It Even at Night", points = 5,
    description = "Solve Puzzle 062 'Lunar Leapfrogs' in 15 moves.",
    id = 117137, badge = "128052",
    trigger = always_false()
)

achievement(
    title = "Squeezing Through the Gate", points = 5,
    description = "Solve Puzzle 086 'The Impassable Gate' in 17 moves.",
    id = 117138, badge = "128054",
    trigger = always_false()
)

achievement(
    title = "Keep Squeezing", points = 5,
    description = "Solve Puzzle 159 'Impassable Gate 2' in 24 moves.",
    id = 117139, badge = "128139",
    trigger = always_false()
)

achievement(
    title = "Just a Squeeze More", points = 10,
    description = "Solve Puzzle 167 'Impassable Gate 3' in 32 moves.",
    id = 117140, badge = "128142",
    trigger = always_false()
)

achievement(
    title = "Being Part of the Dragon", points = 5,
    description = "Solve Puzzle 094 'The Dragon Walkway' in 19 moves.",
    id = 117141, badge = "128056",
    trigger = always_false()
)

achievement(
    title = "Gold and Silver", points = 10,
    description = "Solve Puzzle 133 'The Two Necklaces' in 45 moves.",
    id = 117142, badge = "128141",
    trigger = always_false()
)

achievement(
    title = "Shiny Victory", points = 10,
    description = "Solve Puzzle 165 'One Big Necklace' in 46 moves.",
    id = 117143, badge = "128140",
    trigger = always_false()
)

achievement(
    title = "Give Me My Time Back", points = 10,
    description = "Solve Puzzle 168 'The Time Machine' in 39 moves.",
    id = 117144, badge = "128143",
    trigger = always_false()
)

achievement(
    title = "Earthbender", points = 3,
    description = "Solve Puzzle W06 'Underground Escape' in 10 moves.",
    id = 117145, badge = "128144",
    trigger = always_false()
)

achievement(
    title = "Cave Escape", points = 5,
    description = "Solve Puzzle W28 'Cave Blockade' in 18 moves.",
    id = 117147, badge = "128148",
    trigger = always_false()
)

achievement(
    title = "Packed Out", points = 5,
    description = "Solve Puzzle W07 'Packed In' in 20 moves.",
    id = 117148, badge = "128145",
    trigger = always_false()
)

achievement(
    title = "Blocked Out", points = 5,
    description = "Solve Puzzle W18 'Blocked In' in 24 moves.",
    id = 117149, badge = "128146",
    trigger = always_false()
)

achievement(
    title = "I like My Name How It Is", points = 10,
    description = "Solve Puzzle W24 'Rearranged Names' in 38 moves.",
    id = 117150, badge = "128147",
    trigger = always_false()
)

achievement(
    title = "The Treasure Inside the Elysian Box", points = 10,
    description = "Solve Puzzle ??? 'The Elysian Box Reopened' in 38 moves.",
    id = 117155, badge = "128149",
    trigger = always_false()
)

//--------------------------------------------------
// Rich Presence

rich_presence_conditional_display(getLocationID() == 0x00, 
                                  "In the Titlescreen"
)

rich_presence_conditional_display(getCurrentPuzzleID() != 0x00 && 
                                        getCurrentPuzzleID() != 0xFFFFFFFF && 
                                        checkInPuzzleOrPuzzleResult() && 
                                        checkInBonus(), 
                                  "{0} is solving Puzzle {1} in the Bonus Menu [{8}] [🎩{3}/{4}|{5}] [Ⓛ{6}/{7}] [🇪🇺]",
                                  rich_presence_lookup("PuzzleSolver", 
                                                       getPuzzleSolverID(), 
                                                       PuzzleSolverIDs,
                                                       fallback = PuzzleSolverIDs[1]),
                                  rich_presence_lookup("PuzzleID", 
                                                       getCurrentPuzzleID(), 
                                                       PuzzleIDs),
                                  rich_presence_lookup("LocationID", 
                                                       getLocationID(), 
                                                       LocationIDs),
                                  rich_presence_value("Value", 
                                                      getTotalPuzzlesSolved()),
                                  rich_presence_value("Value", 
                                                      getTotalPuzzlesFound()),
                                  rich_presence_value("Value", 
                                                      getTotalPicarats()),
                                  rich_presence_value("Value", 
                                                      getTotalHintCoinsInInventory()),
                                  rich_presence_value("Value", 
                                                      getTotalHintCoinsFound()),
                                  rich_presence_lookup("ChapterValue", 
                                                       getObjectiveID(), 
                                                       ChapterValues)
)

rich_presence_conditional_display(checkInBonus(),
                                  "{0} {1} in the Bonus Menu {7} [🎩{2}/{3}|{4}] [Ⓛ{5}/{6}] [🇪🇺]",
                                  rich_presence_lookup("PartyHashes", 
                                                       getParty(), 
                                                       PartyHashes),
                                  rich_presence_lookup("ToBe", 
                                                       getParty(), 
                                                       ToBe, 
                                                       fallback="are"),
                                  rich_presence_value("Value", 
                                                      getTotalPuzzlesSolved()),
                                  rich_presence_value("Value", 
                                                      getTotalPuzzlesFound()),
                                  rich_presence_value("Value", 
                                                      getTotalPicarats()),
                                  rich_presence_value("Value", 
                                                      getTotalHintCoinsInInventory()),
                                  rich_presence_value("Value", 
                                                      getTotalHintCoinsFound()),
                                  rich_presence_lookup("ChapterValue", 
                                                       getObjectiveID(), 
                                                       ChapterValues)
)

rich_presence_conditional_display(getCurrentPuzzleID() != 0x00 && 
                                        getCurrentPuzzleID() != 0xFFFFFFFF && 
                                        checkInPuzzleOrPuzzleResult(), 
                                  "{0} is solving Puzzle {1} {2} [{8}] [🎩{3}/{4}|{5}] [Ⓛ{6}/{7}] [🇪🇺]",
                                  rich_presence_lookup("PuzzleSolver", 
                                                       getPuzzleSolverID(), 
                                                       PuzzleSolverIDs,
                                                       fallback = PuzzleSolverIDs[1]),
                                  rich_presence_lookup("PuzzleID", 
                                                       getCurrentPuzzleID(), 
                                                       PuzzleIDs),
                                  rich_presence_lookup("LocationID", 
                                                       getLocationID(), 
                                                       LocationIDs),
                                  rich_presence_value("Value", 
                                                      getTotalPuzzlesSolved()),
                                  rich_presence_value("Value", 
                                                      getTotalPuzzlesFound()),
                                  rich_presence_value("Value", 
                                                      getTotalPicarats()),
                                  rich_presence_value("Value", 
                                                      getTotalHintCoinsInInventory()),
                                  rich_presence_value("Value", 
                                                      getTotalHintCoinsFound()),
                                  rich_presence_lookup("ChapterValue", 
                                                       getObjectiveID(), 
                                                       ChapterValues)
)

rich_presence_display("{0} {1} {2} [{8}] [🎩{3}/{4}|{5}] [Ⓛ{6}/{7}] [🇪🇺]",
                      rich_presence_lookup("PartyHashes", 
                                           getParty(), 
                                           PartyHashes),
                      rich_presence_lookup("ToBe", 
                                           getParty(), 
                                           ToBe, 
                                           fallback="are"),
                      rich_presence_lookup("LocationID", 
                                           getLocationID(), 
                                           LocationIDs),
                      rich_presence_value("Value", 
                                          getTotalPuzzlesSolved()),
                      rich_presence_value("Value", 
                                          getTotalPuzzlesFound()),
                      rich_presence_value("Value", 
                                          getTotalPicarats()),
                      rich_presence_value("Value", 
                                          getTotalHintCoinsInInventory()),
                      rich_presence_value("Value", 
                                          getTotalHintCoinsFound()),
                      rich_presence_lookup("ChapterValue", 
                                           getObjectiveID(), 
                                           ChapterValues)
)


