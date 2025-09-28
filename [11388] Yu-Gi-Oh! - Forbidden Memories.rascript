// Yu-Gi-Oh! Forbidden Memories
// #ID = 11388

//--------------------------------------------------
// Addresses
playerLP         = word(0x0EA004)
opponentLP       = word(0x0EA024)
opponentDuelist  = byte(0x09B361)
currentStarchips = dword(0x1D07E0)
opponentID       = byte(0x09B361)
duelState        = byte(0x09B23A)
locationID       = word(0x09B270)
currentEvent     = word(0x0EB12E)

playerName       = 0x1D060C

playerMonsterATK = word((byte(0x0E9F57) * 28) + 0x1A7B72)
targetMonsterATK = word(((5 - byte(0x0E9F73)) * 28) + 0x1A7D16 - 28)

//--------------------------------------------------
// Arrays and Dictionaries

locLookup = {
    0x0000: "wandering around in Egypt",
    0x0001: "in front of the Pharaoh's Palace",
    0x0002: "in the Duel Ground",
    0x0003: "in front of the Shrine",
    0x0004: "in the Card Shop",
    0x0005: "inside the Pharaoh's Palace",
    0x0006: "behind the Pharaoh's Palace",
    0x0007: "inside the Millennium Puzzle",
    0x0008: "in the Championship Hall",
    0x0009: "in the Championship Arena",
    0x0010: "in the Championship Card Shop",
    0x0011: "in the Championship Hall",
    0x0012: "near the Shrine of Glory",
    0x0013: "near Pharaoh's Old Palace",
    0x0014: "inside Pharaoh's Old Palace",
    0x0015: "in the old Card Shop",
    0x0016: "in the old Duel Ground",
    0x0017: "in King's Valley",
    0x0018: "inside the Dark Shrine",
    0x0019: "in the Hidden Duel Ground",
    0x0020: "in the Hidden Card Shop",
    0x0021: "near the Vast Shrine",
    0x0022: "inside the Vast Shrine",
    0x0023: "near the Sea Shrine",
    0x0024: "inside the Sea Shrine",
    0x0025: "near the Forest Shrine",
    0x0026: "inside the Forest Shrine",
    0x0027: "near the Mountain Shrine",
    0x0028: "inside the Mountain Shrine",
    0x0029: "near the Desert Shrine",
    0x0030: "inside the Desert Shrine",
    0x0031: "near the Meadow Shrine",
    0x0032: "inside the Meadow Shrine",
    0x0033: "near the Dark Shrine",
    0x0034: "near the Dark Shrine",
    0x0035: "inside the Forbidden Tomb",
    0x0036: "on the Town Plaza",
    0x0037: "near the Shrine",
    0x0038: "inside the Vast Shrine",
    0x0039: "inside the Vast Shrine",
    0x0100: "inside the Royal Tomb",
    0x0101: "inside the Royal Tomb",
    0x0102: "inside the Pharaoh's Palace",
    0x0103: "inside the Pharaoh's Palace",
    0x0104: "inside the Pharaoh's Palace",
    0x0105: "behind the Pharaoh's Palace",
    0x0106: "behind the Pharaoh's Palace",
    0x0107: "behind the Pharaoh's Palace",
    0x0109: "inside the Millennium Puzzle",
    0x0110: "in the Championship Hall",
    0x0111: "in the Championship Arena",
    0x0112: "in the Championship Arena",
    0x0113: "inside the Mountain Shrine",
    0x0114: "in the Championship Arena",
    0x0115: "inside the Meadow Shrine",
    0x0116: "in the Championship Arena",
    0x0117: "inside the Sea Shrine",
    0x0118: "in the Championship Arena",
    0x0119: "in the Championship Arena",
    0x0120: "in the Championship Arena",
    0x0121: "in the Championship Arena",
    0x0122: "inside the Millennium Puzzle",
    0x0124: "inside Pharaoh's Old Palace",
    0x0125: "inside the Royal Tomb",
    0x0126: "inside the Vast Shrine",
    0x0127: "inside the Forest Shrine",
    0x0128: "inside the Desert Shrine",
    0x0129: "inside the Forbidden Tomb",
    0x0132: "inside the Dark Shrine",
    0x0133: "inside the Forbidden Tomb",
    0x0134: "inside the Forbidden Tomb",
    0x0135: "inside the Forbidden Tomb",
    0x0136: "inside the Forbidden Tomb",
    0x0137: "on the Town Plaza",
    0x0138: "near the Shrine",
    0x0140: "inside the Vast Shrine",
    0x0141: "inside the Vast Shrine",
    0x0200: "in the Intro",
    0x0201: "inside the Royal Tomb",
    0x0202: "listening to the Duel Monsters story",
    0x0203: "in the Duel Ground",
    0x0204: "inside the Pharaoh's Palace",
    0x0205: "in the Championship Arena",
    0x0206: "in the Pharaoh's New Palace",
    0x0207: "somewhere Outside",
    0x0208: "near the Dark Shrine",
    0x0209: "inside the Royal Tomb",
    0x8200: "inside the Royal Tomb",
    0x8201: "inside the Forbidden Tomb",
    0x8202: "in front of the Pharaoh's Palace",
    0x8203: "in the Duel Ground",
    0x8204: "inside the Pharaoh's Palace",
    0x8205: "in the Championship Arena",
    0x8206: "in the Pharaoh's New Palace",
    0x8207: "outside the Domino Stadium",
    0x8208: "outside the Dark Shrine",
    0x8209: "inside the Forbidden Tomb"
}

locYugiLookup = {
    0x0007: "inside the Millennium Puzzle",
    0x0008: "in the Championship Hall",
    0x0009: "in the Championship Arena",
    0x0010: "in the Championship Card Shop",
    0x0011: "in the Championship Hall",
    0x0109: "inside the Millennium Puzzle",
    0x0110: "in the Championship Hall",
    0x0111: "in the Championship Arena",
    0x0112: "in the Championship Arena",
    0x0113: "in the Championship Arena",
    0x0114: "in the Championship Arena",
    0x0115: "in the Championship Arena",
    0x0116: "in the Championship Arena",
    0x0117: "in the Championship Arena",
    0x0118: "in the Championship Arena",
    0x0119: "in the Championship Arena",
    0x0120: "in the Championship Arena",
    0x0121: "in the Championship Arena",
    0x8205: "in the Championship Arena",
    0x8206: "in the Championship Arena",
    0x8207: "outside the Domino Stadium"
}

duelistLookup = {
    0x01: "Simon Muran",
    0x02: "Teana",
    0x03: "Jono",
    0x04: "the Village Man",
    0x05: "the Village Boy",
    0x06: "the Village Elder",
    0x07: "Seto",
    0x08: "Heishin",
    0x09: "Rex Raptor",
    0x0A: "Weevil Underwood",
    0x0B: "Mai Valentine",
    0x0C: "Bandit Keith",
    0x0D: "Shadi",
    0x0E: "Yami Bakura",
    0x0F: "Pegasus",
    0x10: "Isis",
    0x11: "Kaiba",
    0x12: "the Mage Soldier",
    0x13: "Jono",
    0x14: "Teana",
    0x15: "the Ocean Mage",
    0x16: "High Mage Secmeton",
    0x17: "the Forest Mage",
    0x18: "High Mage Anubisius",
    0x19: "the Mountain Mage",
    0x1A: "High Mage Atenza",
    0x1B: "the Desert Mage",
    0x1C: "High Mage Martis",
    0x1D: "the Meadow Mage",
    0x1E: "High Mage Kepura",
    0x1F: "the Labyrinth Mage",
    0x20: "Seto",
    0x21: "Guardian Sebek",
    0x22: "Guardian Neku",
    0x23: "Heishin",
    0x24: "Seto",
    0x25: "DarkNite",
    0x26: "Nitemare",
    0x27: "Duel Master K"
}

protagonistLookup = {
    0x01: "Prince Atem",
    0x02: "Prince Atem",
    0x03: "Prince Atem",
    0x04: "Prince Atem",
    0x05: "Prince Atem",
    0x06: "Prince Atem",
    0x07: "Prince Atem",
    0x08: "Prince Atem",
    0x09: "Yugi Muto",
    0x0A: "Yugi Muto",
    0x0B: "Yugi Muto",
    0x0C: "Yugi Muto",
    0x0D: "Yugi Muto",
    0x0E: "Yugi Muto",
    0x0F: "Yugi Muto",
    0x10: "Yugi Muto",
    0x11: "Yugi Muto",
    0x12: "Prince Atem",
    0x13: "Prince Atem",
    0x14: "Prince Atem",
    0x15: "Prince Atem",
    0x16: "Prince Atem",
    0x17: "Prince Atem",
    0x18: "Prince Atem",
    0x19: "Prince Atem",
    0x1A: "Prince Atem",
    0x1B: "Prince Atem",
    0x1C: "Prince Atem",
    0x1D: "Prince Atem",
    0x1E: "Prince Atem",
    0x1F: "Prince Atem",
    0x20: "Prince Atem",
    0x21: "Prince Atem",
    0x22: "Prince Atem",
    0x23: "Prince Atem",
    0x24: "Prince Atem",
    0x25: "Prince Atem",
    0x26: "Prince Atem",
    0x27: "Prince Atem"
}

fillerLookup = {
    0: "0"
}

stateLookup = {
    0: "Main Menu",
    2: "Campaign",
    6: "Free Duel",
    8: "Main Menu"
}

//--------------------------------------------------
// Functions

function getEvent(id) {
    return currentEvent == id
}



function eventTriggered(address, bit) {
    return bit(bit, address) > prev(bit(bit, address))
}



function gameState() {
    return low4(0x09B26C)
}



function getLetterID(index, char) {
    letters = [
        ["A", 0x8260],
        ["T", 0x8273],
        ["E", 0x8264],
        ["M", 0x826C]
    ]
    
    for letter in letters {
        if (letter[0] == char) {          
            return __ornext(word(0x1D060C + index * 2) == letter[1] ||
                            word(0x1D060C + index * 2) == letter[1] + 0x21)
        }
    }
    
    return word(0x1D060C + index * 2) == 0x0000
}



function inCampaign() {
    return __ornext(gameState() == 2 ||
                    gameState() == 5)
}



function measuredCampaign() {
    return once(gameState() == 2) &&
           never(gameState() == 8)
}



function winDuel() {
    return prev(duelState) == 0x0C &&
           duelState == 0x0D &&
           byte(0x09B362) == 0x00
}



function createFusion(id) {
    return gameState() == 0x03 &&
           byte(0x09B1D5) == 0x00 &&
           word(0x0EA118) == id &&
           duelState >= 0x07 &&
           duelState <= 0x08 &&
           byte(0x0E9FF8) > prev(byte(0x0E9FF8)) &&
           never(duelState < 0x07) &&
           never(duelState > 0x08) &&
           never(word(0x0E9F1E) != prev(word(0x0E9F1E))) &&
           never(word(0x0E9F3B) != prev(word(0x0E9F3B))) &&
           never(word(0x0E9F57) != prev(word(0x0E9F57))) &&
           never(word(0x0E9F73) != prev(word(0x0E9F73)))
}


function createEndFusion(id) {
    return gameState() == 3 &&
           byte(0x09B1D5) == 0x00 &&
           word(0x0EA118) == id &&
           prev(duelState == 0x07) &&
           duelState == 0x08 &&
           once(byte(0x0E9FF8) > prev(byte(0x0E9FF8))) &&
           never(duelState < 0x07) &&
           never(duelState > 0x08)
}


function summonMonster(ritualID, summonID) {
    return gameState() == 3 &&
           byte(0x09B1D5) == 0x00 &&
           word(0x0EA118) == ritualID &&
           word(0x09B338) != prev(word(0x09B338)) &&
           word(0x09B338) == summonID &&
           duelState == 0x06
}



function isYugiMuto() {
    return (currentEvent >= 0x547 && currentEvent <= 0x548 && locationID != 0x07) || 
           (currentEvent >= 0x549 && currentEvent <= 0x573 && currentEvent != 0x567 && currentEvent != 0x56A) ||
           (currentEvent == 0x567 && locationID != 0x07) || 
           (locationID >= 0x08 && locationID <= 0x11) ||
           (currentEvent >= 0x547 && currentEvent <= 0x548 && locationID != 0x07) || 
           (currentEvent >= 0x547 && currentEvent <= 0x573 && locationID >= 0x108 && locationID <= 0x121)
}



function totalLibraryEntries() {
    libraryFlags = 0x1D063C
    offset       = 0   
    startBit     = 1
    
    code = (bitcount(libraryFlags) & 0x7F)
    
    for i in range(0, 90 - 2) {
        code = code + bitcount(libraryFlags + i + 1)
    }
    
    code = code + (bitcount(libraryFlags + 0x5A) & 0xE0)
    
    return code
}



function freeDuelWins(opponentID, amount) {
    opponentID = opponentID - 1
    return __ornext(gameState() == 0x03 ||
                    gameState() == 0x06) &&
           measured(word(0x1D0720 + opponentID * 4) == amount, when = gameState() > 0) &&
           prev(word(0x1D0720 + opponentID * 4)) == amount - 1
}



function getDuelRank() {
    return gameState() == 3 &&
           duelState == 0x0D &&
           bit7(0x09B23B) > prev(bit7(0x09B23B))
}



function getDuelReward(cardID) {
    return getDuelRank() &&
           word(0x09B338) == cardID
}



function getStarships(amount) {
    return __ornext(gameState() == 0x02 ||
                    gameState() == 0x03 ||
                    gameState() == 0x06) &&
                    prev(dword(0x1D07E0)) < amount &&
                    prev(dword(0x1D07E0)) >= amount - 50 &&
                    dword(0x1D07E0) <= amount + 50 &&
                    measured(dword(0x1D07E0) >= amount, when = gameState() > 0)
}



function attackSuccessful() {
    return __ornext(gameState() == 0x01 || 
                    gameState() == 0x03) &&
           byte(0x09B1D5) == 0x00 &&
           duelState == 0x09 &&
           byte(0x0E9FFB) > prev(byte(0x0E9FFB))
}



function usedAllGuardianStars() {
    guardianStars = []
    
    for i in range(0x18, 0x21) {
        array_push(guardianStars, i)
    }
    
    return tally_of(guardianStars, 10, guardianStar => never(gameState() != 1 &&
                                                             gameState() != 3) &&
                                                        once(duelState == 0x05 &&
                                                             byte(0x09B1D5) == 0x00 &&
                                                             word(0x09B35A) != 0xFFFF &&
                                                             word(0x09B35A) != prev(word(0x09B35A)) &&
                                                             byte(0x09B344) == guardianStars[guardianStar - 0x18]))                                                
}

function addCardToTrunk(id) {
    trunkStart = 0x1D0250

    return byte(trunkStart + id - 1) > prev(byte(trunkStart + id - 1))
}


//--------------------------------------------------
// Achievements

achievement(
    title = "Holding My Name With Pride", points = 1, type = "Missable",
    description = "Begin your adventure as the real pharaoh.",
    id = 83233, badge = "89906", published = "08.09.2019 11:59:12", modified = "08.09.2019 12:56:58",
    trigger = __ornext(getEvent(0x500) || 
                       getEvent(0x546)) &&
              prev(getEvent(0xF3)) &&
              ((getLetterID(0, "A") &&
                getLetterID(1, "T") &&
                getLetterID(2, "E") &&
                getLetterID(3, "M") &&
                getLetterID(4, " ") &&
                getLetterID(5, " ")) || 
               (getLetterID(0, " ") &&
                getLetterID(1, "A") &&
                getLetterID(2, "T") &&
                getLetterID(3, "E") &&
                getLetterID(4, "M") &&
                getLetterID(5, " ")) ||
               (getLetterID(0, " ") &&
                getLetterID(1, " ") &&
                getLetterID(2, "A") &&
                getLetterID(3, "T") &&
                getLetterID(4, "E") &&
                getLetterID(5, "M")))
)

achievement(
    title = "The Student Has Surpassed the Teacher", points = 1, type="missable",
    description = "Defeat Simon Muran at the Pharaoh's Palace.",
    id = 81271, badge = "90974", published = "22.08.2019 19:28:33", modified = "18.09.2019 19:28:10",
    trigger = inCampaign() &&
              locationID == 0x01 &&
              eventTriggered(0x1D061C, 7)
)

achievement(
    title = "A Practice Duel", points = 1, type="missable",
    description = "Defeat Teana at the Duel Ground.",
    id = 81272, badge = "90975", published = "22.08.2019 19:28:37", modified = "18.09.2019 19:28:25",
    trigger = inCampaign() &&
              locationID == 0x02 &&
              eventTriggered(0x1D061C, 6)
)

achievement(
    title = "Getting to Know Your Subjects", points = 5, type="missable",
    description = "Defeat all three villagers at any Duel Ground.",
    id = 81273, badge = "90976", published = "22.08.2019 19:28:39", modified = "18.09.2019 19:28:31",
    trigger = inCampaign() &&
              __ornext(locationID == 0x02 || 
                       locationID == 0x19) &&
              measured(bit(2, 0x1D061C)
                     + bit(3, 0x1D061C)
                     + bit(4, 0x1D061C) == 3, when = measuredCampaign()) &&
              prev(bit(2, 0x1D061C)
                 + bit(3, 0x1D061C)
                 + bit(4, 0x1D061C)) == 2
)

achievement(
    title = "Friendly Competition", points = 2, type="missable",
    description = "Defeat Jono at the Duel Ground.",
    id = 81274, badge = "90977", published = "22.08.2019 19:28:42", modified = "18.09.2019 19:28:35",
    trigger = inCampaign() &&
              locationID == 0x02 &&
              eventTriggered(0x1D061C, 5)
)

achievement(
    title = "Justice for Jono", points = 3, type="missable",
    description = "Defeat Seto at the Duel Ground.",
    id = 81275, badge = "90978", published = "22.08.2019 19:28:45", modified = "20.04.2025 05:47:40",
    trigger = inCampaign() &&
              locationID == 0x02 &&
              eventTriggered(0x1D061C, 1)
)

achievement(
    title = "Not Bad, Boy", points = 10, type="missable",
    description = "Defeat Heishin in a duel during his revolution.",
    id = 542708, badge = "616944", published = "22.08.2019 19:28:48", modified = "18.09.2019 19:28:47",
    trigger = gameState() == 0x03 &&
              prev(gameState()) == 0x02 &&
              locationID == 0x06 &&
              getEvent(0x545)
)

achievement(
    title = "All Is Lost", points = 1, type="progression",
    description = "Perform a last ditch effort after losing to Heishin.",
    id = 81276, badge = "90979", published = "22.08.2019 19:28:48", modified = "18.09.2019 19:28:47",
    trigger = inCampaign() &&
              prev(locationID) == 0x107 &&
              locationID == 0x07
)

achievement(
    title = "Jurassic Showdown", points = 3, type="progression",
    description = "Defeat Rex Raptor in the first preliminary match of the tournament.",
    id = 81277, badge = "91077", published = "22.08.2019 19:28:53", modified = "20.09.2019 00:01:03",
    trigger = inCampaign() &&
              locationID == 0x09 &&
              eventTriggered(0x1D061D, 7)
)

achievement(
    title = "An Army of Insects", points = 3, type="progression",
    description = "Defeat Weevil Underwood in the second preliminary match of the tournament.",
    id = 81278, badge = "91078", published = "22.08.2019 19:28:56", modified = "20.09.2019 00:01:09",
    trigger = inCampaign() &&
              locationID == 0x09 &&
              eventTriggered(0x1D061D, 6)
)

achievement(
    title = "Avian Assault", points = 3, type="progression",
    description = "Defeat Mai Valentine in the third preliminary match of the tournament.",
    id = 81279, badge = "91079", published = "22.08.2019 19:29:00", modified = "20.09.2019 00:01:13",
    trigger = inCampaign() &&
              locationID == 0x09 &&
              eventTriggered(0x1D061D, 5)
)

achievement(
    title = "The Card Professor", points = 3, type="progression",
    description = "Defeat Bandit Keith in the fourth preliminary match of the tournament.",
    id = 81280, badge = "91080", published = "22.08.2019 19:29:06", modified = "18.06.2021 08:23:36",
    trigger = inCampaign() &&
              locationID == 0x09 &&
              eventTriggered(0x1D061D, 4)
)

achievement(
    title = "The Pharaoh's Plan", points = 5, type="progression",
    description = "Defeat Shadi in the first match of the tournament finals.",
    id = 81281, badge = "90984", published = "22.08.2019 19:30:58", modified = "10.10.2019 17:50:02",
    trigger = inCampaign() &&
              locationID == 0x09 &&
              eventTriggered(0x1D061D, 3)
)

achievement(
    title = "Bakura's Millennium Ring", points = 5, type="progression",
    description = "Defeat Yami Bakura in the second match of the tournament finals.",
    id = 81282, badge = "90985", published = "22.08.2019 19:31:02", modified = "22.10.2019 21:03:01",
    trigger = inCampaign() &&
              locationID == 0x09 &&
              eventTriggered(0x1D061D, 2)
)

achievement(
    title = "Pegasus' Millennium Eye", points = 5, type="progression",
    description = "Defeat Pegasus in the quarterfinals.",
    id = 81283, badge = "90986", published = "22.08.2019 19:31:04", modified = "18.09.2019 19:29:22",
    trigger = inCampaign() &&
              locationID == 0x09 &&
              eventTriggered(0x1D061D, 1)
)

achievement(
    title = "Isis' Millennium Necklace", points = 5, type="progression",
    description = "Defeat Isis in the semifinals.",
    id = 81284, badge = "90987", published = "22.08.2019 19:31:07", modified = "25.09.2019 15:21:01",
    trigger = inCampaign() &&
              locationID == 0x09 &&
              eventTriggered(0x1D061D, 0)
)

achievement(
    title = "Kaiba's Millennium Rod", points = 5, type="progression",
    description = "Defeat Kaiba in the final match of the tournament.",
    id = 81285, badge = "90988", published = "22.08.2019 19:31:15", modified = "01.10.2019 15:50:01",
    trigger = inCampaign() &&
              locationID == 0x09 &&
              eventTriggered(0x1D061E, 7)
)

achievement(
    title = "Reuniting With Friends", points = 5, type="missable",
    description = "Defeat Jono and Teana at the Hidden Duel Ground.",
    id = 81287, badge = "90990", published = "22.08.2019 19:31:35", modified = "20.04.2025 05:47:59",
    trigger = inCampaign() &&
              locationID == 0x019 &&
              measured(bit(4, 0x1D061E)
                     + bit(5, 0x1D061E) == 2, when = measuredCampaign()) &&
              prev(bit(4, 0x1D061E)
                 + bit(5, 0x1D061E)) == 1
)

achievement(
    title = "Returning Home", points = 3, type="progression",
    description = "Defeat the Mage Soldier at the palace.",
    id = 81286, badge = "90989", published = "22.08.2019 19:31:27", modified = "18.09.2019 19:29:36",
    trigger = inCampaign() &&
              locationID == 0x14 &&
              eventTriggered(0x1D061E, 6)
)

achievement(
    title = "Ransacking the Sea Shrine", points = 10, type="progression",
    description = "Obtain the Millennium Necklace from High Mage Secmeton.",
    id = 81288, badge = "90991", published = "22.08.2019 19:31:40", modified = "07.12.2020 15:06:59",
    trigger = inCampaign() &&
              getEvent(0x595) &&
              locationID == 0x117 &&
              locationID != prev(locationID)
)

achievement(
    title = "Ransacking the Forest Shrine", points = 10, type="progression",
    description = "Obtain the Millennium Key from High Mage Anubisius.",
    id = 81289, badge = "90992", published = "22.08.2019 19:31:47", modified = "07.12.2020 15:07:03",
    trigger = inCampaign() &&
              getEvent(0x59F) &&
              locationID == 0x127 &&
              locationID != prev(locationID)
)

achievement(
    title = "Ransacking the Mountain Shrine", points = 10, type="progression",
    description = "Obtain the Millennium Ring from High Mage Atenza",
    id = 81290, badge = "90993", published = "22.08.2019 19:31:52", modified = "07.12.2020 15:07:10",
    trigger = inCampaign() &&
              getEvent(0x5A9) &&
              locationID == 0x113 &&
              locationID != prev(locationID)
)

achievement(
    title = "Ransacking the Desert Shrine", points = 10, type="progression",
    description = "Obtain the Millennium Scales from High Mage Martis.",
    id = 81291, badge = "90994", published = "22.08.2019 19:31:56", modified = "07.12.2020 15:07:21",
    trigger = inCampaign() &&
              getEvent(0x5B3) &&
              locationID == 0x128 &&
              locationID != prev(locationID)
)

achievement(
    title = "Ransacking the Meadow Shrine", points = 10, type="progression",
    description = "Obtain the Millennium Eye from High Mage Kepura.",
    id = 81292, badge = "90995", published = "22.08.2019 19:32:04", modified = "07.12.2020 15:07:20",
    trigger = inCampaign() &&
              getEvent(0x5BD) &&
              locationID == 0x115 &&
              locationID != prev(locationID)
)

achievement(
    title = "The End of the Maze", points = 10, type="progression",
    description = "Defeat the Labyrinth Mage and successfully navigate his domain.",
    id = 81293, badge = "90996", published = "22.08.2019 19:32:11", modified = "13.10.2019 18:34:02",
    trigger = inCampaign() &&
              locationID >= 0x140 &&
              locationID <= 0x141 &&
              prev(locationID) == 0x39
)

achievement(
    title = "A Long-Awaited Rematch", points = 5, type="missable",
    description = "Defeat Seto in the Vast Shrine and rescue Teana.",
    id = 81294, badge = "90998", published = "22.08.2019 19:32:18", modified = "16.10.2019 19:19:01",
    trigger = inCampaign() &&
              getEvent(0x5F4) &&
              locationID == 0x19 &&
              prev(locationID) == 0x22
)

achievement(
    title = "Sworn Protectors", points = 10, type="progression",
    description = "Defeat Sebek the Powerful and Neku the Skillful outside the Dark Shrine.",
    id = 81295, badge = "90999", published = "22.08.2019 19:32:22", modified = "19.10.2019 20:11:01",
    trigger = inCampaign() &&
              locationID == 0x033 &&
              measured(bit(6, 0x1D0620)
                     + bit(7, 0x1D0620) == 2, when = measuredCampaign()) &&
              prev(bit(6, 0x1D0620)
                 + bit(7, 0x1D0620)) == 1
)

achievement(
    title = "Sweet Revenge", points = 10, type="progression",
    description = "Defeat Heishin outside the Dark Shrine.",
    id = 81296, badge = "91000", published = "22.08.2019 19:32:27", modified = "19.10.2019 20:11:01",
    trigger = inCampaign() &&
              locationID == 0x33 &&
              eventTriggered(0x1D0620, 5)
)

achievement(
    title = "One Final Duel", points = 10, type="progression",
    description = "Defeat Seto in the Forbidden Tomb.",
    id = 81297, badge = "91001", published = "22.08.2019 19:32:31", modified = "19.10.2019 20:11:01",
    trigger = inCampaign() &&
              locationID == 0x35 &&
              eventTriggered(0x1D0620, 4)
)

achievement(
    title = "Great Duelist Tournament", points = 10, type="missable",
    description = "With the intention to rescue Teana, enter the Vast Shrine and defeat the Labyrinth Mage, Guardian Sebek, Guardian Neku, Heishin, Seto, DarkNite and Nitemare in one go.",
    id = 180573, badge = "617863", published = "22.08.2019 19:32:34", modified = "19.10.2019 20:11:01",
    trigger = inCampaign() &&
              locationID == 0x035 &&
              measured(bit(1, 0x1D061F)
                     + bit(2, 0x1D0620)
                     + bit(3, 0x1D0620)
                     + bit(4, 0x1D0620)
                     + bit(5, 0x1D0620)
                     + bit(6, 0x1D0620)
                     + bit(7, 0x1D0620) == 7, when = measuredCampaign() &&
                                                     bit2(0x1D0625) == 1) &&
              prev(bit(1, 0x1D061F)
                 + bit(2, 0x1D0620)
                 + bit(3, 0x1D0620)
                 + bit(4, 0x1D0620)
                 + bit(5, 0x1D0620)
                 + bit(6, 0x1D0620)
                 + bit(7, 0x1D0620)) == 6
)

achievement(
    title = "The Greatest of Pharaohs", points = 25, type="progression",
    description = "Defeat Nitemare and bring prosperity to all.",
    id = 81298, badge = "91002", published = "22.08.2019 19:32:34", modified = "19.10.2019 20:11:01",
    trigger = gameState() == 0x0F &&
              prev(gameState()) == 0x02 &&
              __ornext(getEvent(0x5D6) ||
                       getEvent(0x5D7))
)

achievement(
    title = "Teaching the Teacher", points = 3,
    description = "Defeat Simon Muran 10 times in Free Duel mode.",
    id = 81299, badge = "91081", published = "22.08.2019 20:01:44", modified = "14.09.2020 12:06:52",
    trigger = freeDuelWins(0x01, 10)
)

achievement(
    title = "Daily Training", points = 3,
    description = "Defeat Teana 10 times in Free Duel mode.",
    id = 81300, badge = "91082", published = "22.08.2019 20:02:08", modified = "14.09.2020 12:07:05",
    trigger = freeDuelWins(0x02, 10)
)

achievement(
    title = "Keep Trying, Jono!", points = 5,
    description = "Defeat Jono 10 times in Free Duel mode.",
    id = 81301, badge = "91083", published = "22.08.2019 20:02:16", modified = "14.09.2020 12:07:17",
    trigger = freeDuelWins(0x03, 10)
)

achievement(
    title = "A Slow Study", points = 3,
    description = "Defeat Villager 1 10 times in Free Duel mode.",
    id = 81302, badge = "91084", published = "22.08.2019 20:02:35", modified = "14.09.2020 12:07:30",
    trigger = freeDuelWins(0x04, 10)
)

achievement(
    title = "Babysitter", points = 5,
    description = "Defeat Villager 2 10 times in Free Duel mode.",
    id = 81303, badge = "91085", published = "22.08.2019 20:02:57", modified = "14.09.2020 12:07:47",
    trigger = freeDuelWins(0x05, 10)
)

achievement(
    title = "Geriatric Care", points = 5,
    description = "Defeat Villager 3 10 times in Free Duel mode.",
    id = 81304, badge = "91086", published = "22.08.2019 20:03:14", modified = "14.09.2020 12:07:54",
    trigger = freeDuelWins(0x06, 10)
)

achievement(
    title = "Ancient Rivalry", points = 5,
    description = "Defeat Seto 10 times in Free Duel mode.",
    id = 81305, badge = "91087", published = "22.08.2019 20:03:20", modified = "14.09.2020 12:08:06",
    trigger = freeDuelWins(0x07, 10)
)

achievement(
    title = "Quelling Insurrection", points = 10,
    description = "Defeat Heishin 10 times in Free Duel mode.",
    id = 81306, badge = "91088", published = "22.08.2019 20:03:39", modified = "14.09.2020 12:08:13",
    trigger = freeDuelWins(0x08, 10)
)

achievement(
    title = "Extinction", points = 5,
    description = "Defeat Rex Raptor 10 times in Free Duel mode.",
    id = 81307, badge = "91089", published = "22.08.2019 20:03:45", modified = "14.09.2020 12:08:21",
    trigger = freeDuelWins(0x09, 10)
)

achievement(
    title = "Squashing Bugs", points = 5,
    description = "Defeat Weevil Underwood 10 times in Free Duel mode.",
    id = 81308, badge = "91090", published = "22.08.2019 20:03:58", modified = "14.09.2020 12:08:30",
    trigger = freeDuelWins(0x0A, 10)
)

achievement(
    title = "Clipping Wings", points = 5,
    description = "Defeat Mai Valentine 10 times in Free Duel mode.",
    id = 81309, badge = "91091", published = "22.08.2019 20:04:05", modified = "14.09.2020 12:08:38",
    trigger = freeDuelWins(0x0B, 10)
)

achievement(
    title = "Cheaters Never Prosper", points = 5,
    description = "Defeat Bandit Keith 10 times in Free Duel mode.",
    id = 81310, badge = "91092", published = "22.08.2019 20:04:10", modified = "14.09.2020 12:08:44",
    trigger = freeDuelWins(0x0C, 10)
)

achievement(
    title = "Nothing But a Spirit", points = 5,
    description = "Defeat Shadi 10 times in Free Duel mode.",
    id = 81311, badge = "91093", published = "22.08.2019 20:04:15", modified = "14.09.2020 12:08:50",
    trigger = freeDuelWins(0x0D, 10)
)

achievement(
    title = "Split Personality", points = 10,
    description = "Defeat Yami Bakura 10 times in Free Duel mode.",
    id = 81312, badge = "91094", published = "22.08.2019 20:04:23", modified = "14.09.2020 12:08:58",
    trigger = freeDuelWins(0x0E, 10)
)

achievement(
    title = "Mind Games", points = 10,
    description = "Defeat Pegasus 10 times in Free Duel mode.",
    id = 81313, badge = "91095", published = "22.08.2019 20:04:27", modified = "14.09.2020 12:09:06",
    trigger = freeDuelWins(0x0F, 10)
)

achievement(
    title = "Ready for Marik", points = 10,
    description = "Defeat Isis 10 times in Free Duel mode.",
    id = 81314, badge = "91096", published = "22.08.2019 20:04:31", modified = "14.09.2020 12:09:15",
    trigger = freeDuelWins(0x10, 10)
)

achievement(
    title = "Still the King of Games", points = 10,
    description = "Defeat Kaiba 10 times in Free Duel mode.",
    id = 81315, badge = "91099", published = "22.08.2019 20:04:35", modified = "14.09.2020 12:09:22",
    trigger = freeDuelWins(0x11, 10)
)

achievement(
    title = "Commanding Respect", points = 5,
    description = "Defeat Mage Soldier 10 times in Free Duel mode.",
    id = 81316, badge = "91100", published = "22.08.2019 20:04:41", modified = "14.09.2020 12:09:28",
    trigger = freeDuelWins(0x12, 10)
)

achievement(
    title = "Better, But Not Good Enough", points = 5,
    description = "Defeat Jono 2nd 10 times in Free Duel mode.",
    id = 81317, badge = "91101", published = "22.08.2019 20:04:46", modified = "14.09.2020 12:09:34",
    trigger = freeDuelWins(0x13, 10)
)

achievement(
    title = "You Still Have A Long Way to Go", points = 5,
    description = "Defeat Teana 2nd 10 times in Free Duel mode.",
    id = 81318, badge = "91102", published = "22.08.2019 20:04:51", modified = "14.09.2020 12:09:55",
    trigger = freeDuelWins(0x14, 10)
)

achievement(
    title = "Apprentice Ocean Mage", points = 5,
    description = "Defeat Ocean Mage 10 times in Free Duel mode.",
    id = 81319, badge = "91103", published = "22.08.2019 20:04:54", modified = "14.09.2020 12:10:01",
    trigger = freeDuelWins(0x15, 10)
)

achievement(
    title = "The New Warden of the Seas", points = 10,
    description = "Defeat High Mage Secmeton 10 times in Free Duel mode.",
    id = 81320, badge = "91104", published = "22.08.2019 20:04:58", modified = "14.09.2020 12:10:07",
    trigger = freeDuelWins(0x16, 10)
)

achievement(
    title = "Apprentice Forest Mage", points = 5,
    description = "Defeat Forest Mage 10 times in Free Duel mode.",
    id = 81321, badge = "91105", published = "22.08.2019 20:05:01", modified = "14.09.2020 12:10:14",
    trigger = freeDuelWins(0x17, 10)
)

achievement(
    title = "The New Ruler of the Forest", points = 10,
    description = "Defeat High Mage Anubisius 10 times in Free Duel mode.",
    id = 81322, badge = "91106", published = "22.08.2019 20:05:04", modified = "14.09.2020 12:10:19",
    trigger = freeDuelWins(0x18, 10)
)

achievement(
    title = "Apprentice Mountain Mage", points = 5,
    description = "Defeat Mountain Mage 10 times in Free Duel mode.",
    id = 81323, badge = "91107", published = "22.08.2019 20:05:09", modified = "14.09.2020 12:10:26",
    trigger = freeDuelWins(0x19, 10)
)

achievement(
    title = "The New Protector of the Mountains", points = 10,
    description = "Defeat High Mage Atenza 10 times in Free Duel mode.",
    id = 81324, badge = "91108", published = "22.08.2019 20:05:15", modified = "14.09.2020 12:10:34",
    trigger = freeDuelWins(0x1A, 10)
)

achievement(
    title = "Apprentice Desert Mage", points = 5,
    description = "Defeat Desert Mage 10 times in Free Duel mode.",
    id = 81325, badge = "91109", published = "22.08.2019 20:05:25", modified = "14.09.2020 12:10:39",
    trigger = freeDuelWins(0x1B, 10)
)

achievement(
    title = "The New Lord of the Desert", points = 10,
    description = "Defeat High Mage Martis 10 times in Free Duel mode.",
    id = 81326, badge = "91110", published = "22.08.2019 20:05:30", modified = "14.09.2020 12:10:45",
    trigger = freeDuelWins(0x1C, 10)
)

achievement(
    title = "Apprentice Meadow Mage", points = 5,
    description = "Defeat Meadow Mage 10 times in Free Duel mode.",
    id = 81327, badge = "91111", published = "22.08.2019 20:05:33", modified = "14.09.2020 12:10:52",
    trigger = freeDuelWins(0x1D, 10)
)

achievement(
    title = "The New Guardian of the Plains", points = 10,
    description = "Defeat High Mage Kepura 10 times in Free Duel mode.",
    id = 81328, badge = "91113", published = "22.08.2019 20:05:36", modified = "14.09.2020 12:11:03",
    trigger = freeDuelWins(0x1E, 10)
)

achievement(
    title = "An Amazing Sense of Direction", points = 10,
    description = "Defeat Labyrinth Mage 10 times in Free Duel mode.",
    id = 81329, badge = "91114", published = "22.08.2019 20:05:40", modified = "14.09.2020 12:11:08",
    trigger = freeDuelWins(0x1F, 10)
)

achievement(
    title = "Is That It?", points = 10,
    description = "Defeat Seto 2nd 10 times in Free Duel mode.",
    id = 81330, badge = "91124", published = "22.08.2019 20:05:45", modified = "14.09.2020 12:11:14",
    trigger = freeDuelWins(0x20, 10)
)

achievement(
    title = "Sebek the Impotent", points = 10,
    description = "Defeat Guardian Sebek 10 times in Free Duel mode.",
    id = 81331, badge = "91117", published = "22.08.2019 20:05:54", modified = "14.09.2020 12:11:20",
    trigger = freeDuelWins(0x21, 10)
)

achievement(
    title = "Neku the Inept", points = 10,
    description = "Defeat Guardian Neku 10 times in Free Duel mode.",
    id = 81332, badge = "91118", published = "22.08.2019 20:05:58", modified = "14.09.2020 12:11:26",
    trigger = freeDuelWins(0x22, 10)
)

achievement(
    title = "Ousting the Usurper", points = 10,
    description = "Defeat Heishin 2nd 10 times in Free Duel mode.",
    id = 81333, badge = "91119", published = "22.08.2019 20:06:01", modified = "14.09.2020 12:11:32",
    trigger = freeDuelWins(0x23, 10)
)

achievement(
    title = "The Final Showdown", points = 10,
    description = "Defeat Seto 3rd 10 times in Free Duel mode.",
    id = 81334, badge = "91120", published = "22.08.2019 20:06:05", modified = "14.09.2020 12:11:39",
    trigger = freeDuelWins(0x24, 10)
)

achievement(
    title = "Suppressing Evil", points = 10,
    description = "Defeat DarkNite 10 times in Free Duel mode.",
    id = 81335, badge = "91122", published = "22.08.2019 20:06:09", modified = "14.09.2020 12:11:44",
    trigger = freeDuelWins(0x25, 10)
)

achievement(
    title = "Overcoming the Nightmare", points = 10,
    description = "Defeat Nitemare 10 times in Free Duel mode.",
    id = 81336, badge = "90190", published = "22.08.2019 20:06:13", modified = "14.09.2020 12:11:50",
    trigger = freeDuelWins(0x26, 10)
)

achievement(
    title = "The Better Duelist", points = 10,
    description = "Defeat Duel Master K 10 times in Free Duel mode.",
    id = 81337, badge = "90191", published = "22.08.2019 20:06:19", modified = "14.09.2020 12:11:56",
    trigger = freeDuelWins(0x27, 10)
)

achievement(
    title = "Budding Collector", points = 10,
    description = "Fill your Library with 200 different cards.",
    id = 82797, badge = "91530", published = "03.09.2019 19:57:20", modified = "31.05.2020 21:07:55",
    trigger = gameState() >= 0x01 &&
              gameState() <= 0x0F &&
              measured(totalLibraryEntries() >= 200, when = dword(playerName + 0) + dword(playerName + 4) + dword(playerName + 8) > 0) &&
              prev(totalLibraryEntries()) < 200
)

achievement(
    title = "Ardent Collector", points = 25,
    description = "Fill your Library with 400 different cards.",
    id = 82798, badge = "91531", published = "03.09.2019 19:57:22", modified = "31.05.2020 21:07:56",
    trigger = gameState() >= 0x01 &&
              gameState() <= 0x0F &&
              measured(totalLibraryEntries() >= 400, when = dword(playerName + 0) + dword(playerName + 4) + dword(playerName + 8) > 0) &&
              prev(totalLibraryEntries()) < 400
)

achievement(
    title = "Committed Collector", points = 50,
    description = "Fill your Library with 600 different cards.",
    id = 82799, badge = "91532", published = "03.09.2019 19:57:24", modified = "31.05.2020 21:09:12",
    trigger = gameState() >= 0x01 &&
              gameState() <= 0x0F &&
              measured(totalLibraryEntries() >= 600, when = dword(playerName + 0) + dword(playerName + 4) + dword(playerName + 8) > 0) &&
              prev(totalLibraryEntries()) < 600
)

achievement(
    title = "Weighing Your Options", points = 5,
    description = "Have a total of 100 Star Chips.",
    id = 82793, badge = "91526", published = "03.09.2019 19:57:12", modified = "18.05.2022 09:52:04",
    trigger = getStarships(100)
)

achievement(
    title = "A Comfortable Sum", points = 10,
    description = "Have a total of 500 Star Chips.",
    id = 82794, badge = "91527", published = "03.09.2019 19:57:14", modified = "18.05.2022 09:52:04",
    trigger = getStarships(500)
)

achievement(
    title = "I'm Rich!", points = 10,
    description = "Have a total of 1,000 Star Chips.",
    id = 82795, badge = "91528", published = "03.09.2019 19:57:16", modified = "18.05.2022 09:52:05",
    trigger = getStarships(1000)
)

achievement(
    title = "Fusion is Overrated", points = 25,
    description = "Have a total of 1,900 Star Chips, enough to purchase a 'Twin-Headed Thunder Dragon' card.",
    id = 82796, badge = "91529", published = "03.09.2019 19:57:18", modified = "29.04.2021 21:21:09",
    trigger = getStarships(1900)
)

achievement(
    title = "Overwhelming Offense", points = 5,
    description = "Achieve a Power-based S-Rank.",
    id = 82784, badge = "91522", published = "03.09.2019 18:05:37", modified = "25.09.2019 02:47:41",
    trigger = getDuelRank() &&
              byte(0x179A12) == 5 &&
              byte(0x179A11) == 0
)

achievement(
    title = "Impregnable Defense", points = 10,
    description = "Achieve a Tech-based S-Rank.",
    id = 82785, badge = "91523", published = "03.09.2019 18:05:39", modified = "01.10.2019 15:50:02",
    trigger = getDuelRank() &&
              byte(0x179A12) == 5 &&
              byte(0x179A11) == 1
)

achievement(
    title = "Ascent", points = 2,
    description = "Win a battle against the opponent's monster by using the bonus of a superior Guardian Star.",
    id = 82781, badge = "91519", published = "03.09.2019 18:05:29", modified = "25.09.2019 02:47:47",
    trigger = attackSuccessful() &&
              byte(0x09B320) == 0x01 &&
              playerMonsterATK <= targetMonsterATK &&
              playerMonsterATK + 500 >= targetMonsterATK
)

achievement(
    title = "Eclipse", points = 2,
    description = "Win a battle against the opponent's monster despite having an inferior Guardian Star.",
    id = 82782, badge = "91520", published = "03.09.2019 18:05:31", modified = "25.09.2019 02:47:48",
    trigger = attackSuccessful() &&
              byte(0x09B320) == 0x06
)

achievement(
    title = "Personal Solar System", points = 5,
    description = "Assign all ten Guardian Stars to your monsters in a single duel.",
    id = 82783, badge = "91521", published = "03.09.2019 18:05:33", modified = "31.12.2019 12:06:43",
    trigger = measured(usedAllGuardianStars())
)

achievement(
    title = "Army of Doppelgangers", points = 10,
    description = "Have the same monster occupy every monster card zone on your side of the field.",
    id = 84287, badge = "91674", published = "28.09.2019 18:56:18", modified = "22.10.2019 21:03:01",
    trigger = __ornext(gameState() == 0x01 ||
                       gameState() == 0x03) &&
              duelState == 0x05 &&
              word(0x1A7B70 + 28 * 0) != 0x00 &&
              bit7(0x1A7B7B + 28 * 0) != 0x00 &&
              word(0x1A7B70 + 28 * 0) + (bit7(0x1A7B7B + 28 * 0) * 0x10000) == word(0x1A7B70 + 28 * 1) + (bit7(0x1A7B7B + 28 * 1) * 0x10000) &&
              word(0x1A7B70 + 28 * 0) + (bit7(0x1A7B7B + 28 * 0) * 0x10000) == word(0x1A7B70 + 28 * 2) + (bit7(0x1A7B7B + 28 * 2) * 0x10000) &&
              word(0x1A7B70 + 28 * 0) + (bit7(0x1A7B7B + 28 * 0) * 0x10000) == word(0x1A7B70 + 28 * 3) + (bit7(0x1A7B7B + 28 * 3) * 0x10000) &&
              word(0x1A7B70 + 28 * 0) + (bit7(0x1A7B7B + 28 * 0) * 0x10000) == word(0x1A7B70 + 28 * 4) + (bit7(0x1A7B7B + 28 * 4) * 0x10000)
               
)

achievement(
    title = "Combination Artist", points = 10,
    description = "Successfully combine all five cards in your hand in a single turn.",
    id = 82939, badge = "91533", published = "05.09.2019 21:52:39", modified = "14.03.2022 16:02:32",
    trigger = never(gameState() != 0x03) &&
              never(duelState != 0x04 &&
                    duelState != 0x06 &&
                    duelState != 0x07) &&
              byte(0x09B1D5) == 0x00 &&
              tally(4, byte(0x0E9FF8) - prev(byte(0x0E9FF8)) == 1 ||
                       byte(0x0E9FF9) - prev(byte(0x0E9FF9)) == 1)
)

achievement(
    title = "Seeing the Light", points = 2,
    description = "Fuse two or more cards with the result being 'Mystical Elf'.",
    id = 82898, badge = "89983", published = "05.09.2019 20:41:50", modified = "19.07.2025 09:50:49",
    trigger = createFusion(002)
)

achievement(
    title = "Newborn Winged Reptile", points = 3,
    description = "Fuse two or more cards with the result being 'Baby Dragon'.",
    id = 82786, badge = "617781", published = "03.09.2019 18:59:59", modified = "25.09.2019 02:43:13",
    trigger = createFusion(004)
)

achievement(
    title = "Smoking Skull", points = 2,
    description = "Fuse two or more cards with the result being 'Shadow Specter'.",
    id = 82792, badge = "617782", published = "03.09.2019 19:57:10", modified = "25.09.2019 02:41:00",
    trigger = createFusion(009)
)

achievement(
    title = "Dwelling in the Darkness", points = 2,
    description = "Fuse two or more cards with the result being 'Blackland Fire Dragon'.",
    id = 82845, badge = "89930", published = "05.09.2019 20:40:14", modified = "19.07.2025 09:50:31",
    trigger = createFusion(010)
)

achievement(
    title = "Dragon Tail Strike", points = 2,
    description = "Fuse two or more cards with the result being 'Sword Arm of Dragon'.",
    id = 82918, badge = "90003", published = "05.09.2019 20:42:24", modified = "19.07.2025 09:50:54",
    trigger = createFusion(011)
)

achievement(
    title = "Flaming Sword of Battle", points = 2,
    description = "Fuse two or more cards with the result being 'Flame Swordsman'.",
    id = 82874, badge = "89959", published = "05.09.2019 20:41:06", modified = "19.07.2025 09:50:40",
    trigger = createFusion(015)
)

achievement(
    title = "Archfiend", points = 3,
    description = "Fuse two or more cards with the result being 'Summoned Skull'.",
    id = 82917, badge = "90002", published = "05.09.2019 20:42:23", modified = "19.07.2025 09:50:54",
    trigger = createFusion(022)
)

achievement(
    title = "Wicked Combination", points = 4,
    description = "Fuse two or more cards with the result being 'The Wicked Worm Beast'.",
    id = 83461, badge = "617784", published = "14.09.2019 09:10:50", modified = "14.09.2019 09:26:31",
    trigger = createFusion(023)
)

achievement(
    title = "Skeletal Soldier", points = 2,
    description = "Fuse two or more cards with the result being 'Zombie Warrior'.",
    id = 82935, badge = "90020", published = "05.09.2019 20:42:55", modified = "19.07.2025 09:51:00",
    trigger = createFusion(030)
)

achievement(
    title = "Corrupting Influence", points = 2,
    description = "Fuse two or more cards with the result being 'Koumori Dragon'.",
    id = 82886, badge = "89971", published = "05.09.2019 20:41:28", modified = "19.07.2025 09:50:44",
    trigger = createFusion(031)
)

achievement(
    title = "Judge and Executioner", points = 3,
    description = "Fuse two or more cards with the result being 'Judge Man'.",
    id = 82882, badge = "89967", published = "05.09.2019 20:41:20", modified = "19.07.2025 09:50:43",
    trigger = createFusion(033)
)

achievement(
    title = "Gorgon's Stare", points = 3,
    description = "Fuse two or more cards with the result being 'The Snake Hair'.",
    id = 82921, badge = "90006", published = "05.09.2019 20:42:29", modified = "19.07.2025 09:50:56",
    trigger = createFusion(036)
)

achievement(
    title = "Diamond Dragon Lance", points = 4,
    description = "Fuse two or more cards with the result being 'Gaia the Dragon Champion'.",
    id = 83237, badge = "617785", published = "08.09.2019 12:01:25", modified = "18.09.2019 20:43:03",
    trigger = createFusion(037)
)

achievement(
    title = "Hell Flame", points = 2,
    description = "Fuse two or more cards with the result being 'Curse of Dragon'.",
    id = 82853, badge = "89938", published = "05.09.2019 20:40:27", modified = "19.07.2025 09:50:33",
    trigger = createFusion(039)
)

achievement(
    title = "Elven Warrior", points = 2,
    description = "Fuse two or more cards with the result being 'Celtic Guardian'.",
    id = 82848, badge = "89933", published = "05.09.2019 20:40:19", modified = "19.07.2025 09:50:32",
    trigger = createFusion(041)
)

achievement(
    title = "Triangle Ecstasy Spark", points = 4,
    description = "Fuse two or more cards with the result being 'Harpie Lady Sisters'.",
    id = 83239, badge = "89912", published = "08.09.2019 12:01:36", modified = "18.09.2019 20:43:12",
    trigger = createFusion(63)
)

achievement(
    title = "Tiger Warrior", points = 2,
    description = "Fuse two or more cards with the result being 'Tiger Axe'.",
    id = 82924, badge = "90009", published = "05.09.2019 20:42:35", modified = "19.07.2025 09:50:56",
    trigger = createFusion(064)
)

achievement(
    title = "Time Magic", points = 3,
    description = "Fuse two or more cards with the result being 'Thousand Dragon'.",
    id = 82922, badge = "90007", published = "05.09.2019 20:42:31", modified = "19.07.2025 09:50:56",
    trigger = createFusion(069)
)

achievement(
    title = "Insect of the Underworld", points = 3,
    description = "Fuse two or more cards with the result being 'Cocoon of Evolution'.",
    id = 82787, badge = "89918", published = "03.09.2019 19:57:00", modified = "18.09.2019 20:45:46",
    trigger = createFusion(072)
)

achievement(
    title = "Legendary Leviathan", points = 2,
    description = "Fuse two or more cards with the result being 'Kairyu-Shin'.",
    id = 82883, badge = "89968", published = "05.09.2019 20:41:22", modified = "19.07.2025 09:50:43",
    trigger = createFusion(073)
)

achievement(
    title = "Reaping Souls with a Smile", points = 4,
    description = "Fuse two or more cards with the result being 'Reaper of the Cards'.",
    id = 83713, badge = "91058", published = "19.09.2019 15:35:36", modified = "19.09.2019 15:35:36",
    trigger = createFusion(084)
)

achievement(
    title = "Minocentaur", points = 4,
    description = "Fuse two or more cards with the result being 'Rabid Horseman'.",
    id = 83244, badge = "89917", published = "08.09.2019 12:02:06", modified = "18.09.2019 20:43:36",
    trigger = createFusion(092)
)

achievement(
    title = "Unfazed by Death", points = 2,
    description = "Fuse two or more cards with the result being 'Armored Zombie'.",
    id = 82842, badge = "89927", published = "05.09.2019 20:40:08", modified = "19.07.2025 09:50:30",
    trigger = createFusion(096)
)

achievement(
    title = "Deadly Zombie Breath", points = 2,
    description = "Fuse two or more cards with the result being 'Dragon Zombie'.",
    id = 82864, badge = "89949", published = "05.09.2019 20:40:48", modified = "19.07.2025 09:50:37",
    trigger = createFusion(097)
)

achievement(
    title = "Soul-Burning Laughter", points = 4,
    description = "Fuse two or more cards with the result being 'Clown Zombie'.",
    id = 82788, badge = "617787", published = "03.09.2019 19:57:02", modified = "18.09.2019 20:45:51",
    trigger = createFusion(098)
)

achievement(
    title = "The King of Ghosts", points = 2,
    description = "Fuse two or more cards with the result being 'Pumpking the King of Ghosts'.",
    id = 82902, badge = "89987", published = "05.09.2019 20:41:57", modified = "19.07.2025 09:50:50",
    trigger = createFusion(099)
)

achievement(
    title = "Warrior Spirit Unlocked", points = 4,
    description = "Fuse two or more cards with the result being 'Battle Warrior'.",
    id = 83706, badge = "91051", published = "19.09.2019 15:34:12", modified = "19.09.2019 15:34:12",
    trigger = createFusion(100)
)

achievement(
    title = "Disciple of Thoth", points = 3,
    description = "Fuse two or more cards with the result being 'Spirit of the Books'.",
    id = 82914, badge = "89999", published = "05.09.2019 20:42:18", modified = "19.07.2025 09:50:53",
    trigger = createFusion(117)
)

achievement(
    title = "Wish From the Graveyard", points = 3,
    description = "Fuse two or more cards with the result being 'The 13th Grave'.",
    id = 82906, badge = "617788", published = "05.09.2019 20:42:04", modified = "18.09.2019 20:46:29",
    trigger = createFusion(132)
)

achievement(
    title = "Fire-Resistant Armor", points = 2,
    description = "Fuse two or more cards with the result being 'Charubin the Fire Knight'.",
    id = 82849, badge = "89934", published = "05.09.2019 20:40:21", modified = "19.07.2025 09:50:32",
    trigger = createFusion(133)
)

achievement(
    title = "Welcome to Darkness", points = 3,
    description = "Fuse two or more cards with the result being 'Witty Phantom'.",
    id = 83710, badge = "617789", published = "19.09.2019 15:34:53", modified = "19.09.2019 15:34:53",
    trigger = createFusion(136)
)

achievement(
    title = "Soul Implantation", points = 2,
    description = "Fuse two or more cards with the result being 'Dragon Statue'.",
    id = 82863, badge = "89948", published = "05.09.2019 20:40:47", modified = "19.07.2025 09:50:37",
    trigger = createFusion(138)
)

achievement(
    title = "Granting Wishes", points = 3,
    description = "Fuse two or more cards with the result being 'Lord of the Lamp'.",
    id = 82888, badge = "89973", published = "05.09.2019 20:41:31", modified = "19.07.2025 09:50:44",
    trigger = createFusion(149)
)

achievement(
    title = "Flaming Arrows", points = 2,
    description = "Fuse two or more cards with the result being 'Fire Reaper'.",
    id = 82871, badge = "89956", published = "05.09.2019 20:41:00", modified = "19.07.2025 09:50:38",
    trigger = createFusion(154)
)

achievement(
    title = "Volcanic Plant", points = 2,
    description = "Fuse two or more cards with the result being 'Firegrass'.",
    id = 82869, badge = "89954", published = "05.09.2019 20:40:57", modified = "19.07.2025 09:50:39",
    trigger = createFusion(157)
)

achievement(
    title = "Mother Brain", points = 4,
    description = "Fuse two or more cards with the result being 'Tainted Wisdom'.",
    id = 82961, badge = "617790", published = "05.09.2019 21:53:08", modified = "24.09.2019 17:45:48",
    trigger = createFusion(162)
)

achievement(
    title = "Breath of Fire", points = 4,
    description = "Fuse two or more cards with the result being 'Darkfire Dragon'.",
    id = 82963, badge = "617791", published = "05.09.2019 21:53:12", modified = "24.09.2019 17:45:54",
    trigger = createFusion(168)
)

achievement(
    title = "Eye Can See You", points = 4,
    description = "Fuse two or more cards with the result being 'Big Eye'.",
    id = 82969, badge = "90149", published = "05.09.2019 21:53:21", modified = "24.09.2019 17:45:59",
    trigger = createFusion(171)
)

achievement(
    title = "Shell Thief", points = 2,
    description = "Fuse two or more cards with the result being 'Turtle Tiger'.",
    id = 82928, badge = "90012", published = "05.09.2019 20:42:42", modified = "19.07.2025 09:50:57",
    trigger = createFusion(193)
)

achievement(
    title = "Smouldering Corpse", points = 2,
    description = "Fuse two or more cards with the result being 'Flame Ghost'.",
    id = 82873, badge = "89958", published = "05.09.2019 20:41:04", modified = "19.07.2025 09:50:40",
    trigger = createFusion(215)
)

achievement(
    title = "Molten Fireball Attack", points = 5,
    description = "Fuse two or more cards with the result being 'Black Skull Dragon'.",
    id = 83235, badge = "89908", published = "08.09.2019 12:01:11", modified = "18.09.2019 20:42:53",
    trigger = createFusion(217)
)

achievement(
    title = "Tree Spirit", points = 2,
    description = "Fuse two or more cards with the result being 'Wood Remains'.",
    id = 82933, badge = "90018", published = "05.09.2019 20:42:51", modified = "19.07.2025 09:51:00",
    trigger = createFusion(228)
)

achievement(
    title = "Actual Sealion", points = 2,
    description = "Fuse two or more cards with the result being 'Rare Fish'.",
    id = 82905, badge = "89990", published = "05.09.2019 20:42:03", modified = "19.07.2025 09:50:50",
    trigger = createFusion(230)
)

achievement(
    title = "Magma Monster", points = 2,
    description = "Fuse two or more cards with the result being 'Dissolverock'.",
    id = 82862, badge = "89946", published = "05.09.2019 20:40:45", modified = "19.07.2025 09:50:36",
    trigger = createFusion(244)
)

achievement(
    title = "Beautiful Siren", points = 2,
    description = "Fuse two or more cards with the result being 'Enchanting Mermaid'.",
    id = 82867, badge = "89952", published = "05.09.2019 20:40:54", modified = "19.07.2025 09:50:38",
    trigger = createFusion(251)
)

achievement(
    title = "From the Ashes", points = 2,
    description = "Fuse two or more cards with the result being 'Mavelus'.",
    id = 82891, badge = "89976", published = "05.09.2019 20:41:36", modified = "19.07.2025 09:50:46",
    trigger = createFusion(272)
)

achievement(
    title = "Dragonscale Armor", points = 2,
    description = "Fuse two or more cards with the result being 'Dragoness the Wicked Knight'.",
    id = 82865, badge = "89950", published = "05.09.2019 20:40:50", modified = "19.07.2025 09:50:37",
    trigger = createFusion(294)
)

achievement(
    title = "Watering A Burning Sword", points = 4,
    description = "Fuse two or more cards with the result being 'Legendary Sword'.",
    id = 83236, badge = "617793", published = "08.09.2019 12:01:19", modified = "18.09.2019 20:42:58",
    trigger = createFusion(301)
)

achievement(
    title = "Resting An Eternal Soul", points = 4,
    description = "Fuse two or more cards with the result being 'Sword of Dark Destruction'.",
    id = 83238, badge = "617794", published = "08.09.2019 12:01:30", modified = "18.09.2019 20:43:08",
    trigger = createFusion(302)
)

achievement(
    title = "Darkness Within", points = 4,
    description = "Fuse two or more cards with the result being 'Dark Energy'.",
    id = 83240, badge = "617795", published = "08.09.2019 12:01:41", modified = "18.09.2019 20:43:16",
    trigger = createFusion(303)
)

achievement(
    title = "Hunt For A Tiger", points = 5,
    description = "Fuse two or more cards with the result being 'Axe of Despair'.",
    id = 83241, badge = "617796", published = "08.09.2019 12:01:46", modified = "18.09.2019 20:43:20",
    trigger = createFusion(304)
)

achievement(
    title = "Striking Metal Force", points = 4,
    description = "Fuse two or more cards with the result being 'Laser Cannon Armor'.",
    id = 83242, badge = "617804", published = "08.09.2019 12:01:52", modified = "18.09.2019 20:43:27",
    trigger = createFusion(305)
)

achievement(
    title = "Beams of A Critter", points = 4,
    description = "Fuse two or more cards with the result being 'Insect Armor with Laser Cannon'.",
    id = 83243, badge = "617805", published = "08.09.2019 12:01:58", modified = "18.09.2019 20:43:31",
    trigger = createFusion(306)
)

achievement(
    title = "Mystical Light", points = 4,
    description = "Fuse two or more cards with the result being 'Elf's Light'.",
    id = 83460, badge = "617806", published = "14.09.2019 09:10:45", modified = "14.09.2019 09:26:26",
    trigger = getDuelReward(307)
)

achievement(
    title = "Burned to the Teeth", points = 4,
    description = "Fuse two or more cards with the result being 'Beast Fang'.",
    id = 83707, badge = "617807", published = "19.09.2019 15:34:21", modified = "19.09.2019 15:34:21",
    trigger = createFusion(308)
)

achievement(
    title = "Turtle Soup Bowl", points = 4,
    description = "Fuse two or more cards with the result being 'Steel Shell'.",
    id = 83708, badge = "617808", published = "19.09.2019 15:34:32", modified = "19.09.2019 15:34:32",
    trigger = createFusion(309)
)

achievement(
    title = "Spores in the Woods", points = 5,
    description = "Fuse two or more cards with the result being 'Vile Germs'.",
    id = 83709, badge = "617809", published = "19.09.2019 15:34:40", modified = "19.09.2019 15:34:40",
    trigger = createFusion(310)
)

achievement(
    title = "Jewelry of Dusk", points = 4,
    description = "Fuse two or more cards with the result being 'Black Pendant'.",
    id = 83711, badge = "617810", published = "19.09.2019 15:35:04", modified = "19.09.2019 15:35:04",
    trigger = createFusion(311)
)

achievement(
    title = "Grow A Horn", points = 5,
    description = "Fuse two or more cards with the result being 'Horn of the Unicorn'.",
    id = 83712, badge = "617811", published = "19.09.2019 15:35:25", modified = "19.09.2019 15:35:25",
    trigger = createFusion(314)
)

achievement(
    title = "Slashing With Bolts", points = 4,
    description = "Fuse two or more cards with the result being 'Electro-Whip'.",
    id = 83714, badge = "617812", published = "19.09.2019 15:35:43", modified = "19.09.2019 15:35:43",
    trigger = createFusion(316)
)

achievement(
    title = "Mirrored Elegance", points = 3,
    description = "Fuse two or more cards with the result being 'Elegant Egotist'.",
    id = 178527, badge = "617829", published = "19.09.2019 15:35:43", modified = "19.09.2019 15:35:43",
    trigger = createFusion(318)
)

achievement(
    title = "Reverting Defense", points = 10,
    description = "Fuse two or more cards with the result being 'Stop Defense'.",
    id = 178528, badge = "617830", published = "19.09.2019 15:35:43", modified = "19.09.2019 15:35:43",
    trigger = createFusion(320)
)

achievement(
    title = "Breeze of Prisms", points = 10,
    description = "Fuse two or more cards with the result being 'Violet Crystal'.",
    id = 178593, badge = "617831", published = "19.09.2019 15:35:43", modified = "19.09.2019 15:35:43",
    trigger = createFusion(322)
)

achievement(
    title = "Spells of Peace", points = 10,
    description = "Fuse two or more cards with the result being 'Book of Secret Arts'.",
    id = 178733, badge = "617832", published = "19.09.2019 15:35:43", modified = "19.09.2019 15:35:43",
    trigger = createFusion(323)
)

achievement(
    title = "Colorful Power", points = 10,
    description = "Fuse two or more cards with the result being 'Invigoration'.",
    id = 178734, badge = "617833", published = "19.09.2019 15:35:43", modified = "19.09.2019 15:35:43",
    trigger = createFusion(324)
)

achievement(
    title = "Tweak the Machines", points = 10,
    description = "Fuse two or more cards with the result being 'Machine Conversion Factory'.",
    id = 178745, badge = "617834", published = "19.09.2019 15:35:43", modified = "19.09.2019 15:35:43",
    trigger = createFusion(325)
)

achievement(
    title = "The Powers of Darkness", points = 3,
    description = "Fuse two or more cards with the result being 'Ryu-Kishin Powered'.",
    id = 82908, badge = "89993", published = "05.09.2019 20:42:08", modified = "19.07.2025 09:50:51",
    trigger = createFusion(377)
)

achievement(
    title = "Inside the Jar", points = 2,
    description = "Fuse two or more cards with the result being 'Ushi Oni'.",
    id = 82929, badge = "90014", published = "05.09.2019 20:42:44", modified = "19.07.2025 09:50:59",
    trigger = createFusion(401)
)

achievement(
    title = "Hippocampus", points = 2,
    description = "Fuse two or more cards with the result being 'Tatsunootoshigo'.",
    id = 82919, badge = "90004", published = "05.09.2019 20:42:26", modified = "19.07.2025 09:50:55",
    trigger = createFusion(404)
)

achievement(
    title = "Dragonfire", points = 2,
    description = "Fuse two or more cards with the result being 'Metal Dragon'.",
    id = 82892, badge = "89977", published = "05.09.2019 20:41:38", modified = "19.07.2025 09:50:46",
    trigger = createFusion(409)
)

achievement(
    title = "Mechanized Wolf", points = 2,
    description = "Fuse two or more cards with the result being 'Giga-Tech Wolf'.",
    id = 82878, badge = "89963", published = "05.09.2019 20:41:13", modified = "19.07.2025 09:50:41",
    trigger = createFusion(412)
)

achievement(
    title = "The Royal Guard", points = 2,
    description = "Fuse two or more cards with the result being 'Cyber Soldier'.",
    id = 82855, badge = "89940", published = "05.09.2019 20:40:31", modified = "19.07.2025 09:50:34",
    trigger = createFusion(413)
)

achievement(
    title = "A Peculiar Experiment", points = 2,
    description = "Fuse two or more cards with the result being 'Dice Armadillo'.",
    id = 82860, badge = "89944", published = "05.09.2019 20:40:42", modified = "19.07.2025 09:50:35",
    trigger = createFusion(423)
)

achievement(
    title = "Lord of Thunder", points = 2,
    description = "Fuse two or more cards with the result being 'Thunder Dragon'.",
    id = 82923, badge = "90008", published = "05.09.2019 20:42:33", modified = "19.07.2025 09:50:56",
    trigger = createFusion(425)
)

achievement(
    title = "Stone Serpent", points = 2,
    description = "Fuse two or more cards with the result being 'Stone Dragon'.",
    id = 82915, badge = "90000", published = "05.09.2019 20:42:19", modified = "19.07.2025 09:50:53",
    trigger = createFusion(426)
)

achievement(
    title = "Murderous Mermaid", points = 2,
    description = "Fuse two or more cards with the result being 'Ice Water'.",
    id = 82881, badge = "89966", published = "05.09.2019 20:41:19", modified = "19.07.2025 09:50:43",
    trigger = createFusion(431)
)

achievement(
    title = "Robo-Fish", points = 2,
    description = "Fuse two or more cards with the result being 'Metal Fish'.",
    id = 82893, badge = "89978", published = "05.09.2019 20:41:40", modified = "19.07.2025 09:50:46",
    trigger = createFusion(438)
)

achievement(
    title = "Vicious Rainbow", points = 2,
    description = "Fuse two or more cards with the result being '7 Colored Fish'.",
    id = 82839, badge = "89923", published = "05.09.2019 20:40:01", modified = "19.07.2025 09:50:29",
    trigger = createFusion(440)
)

achievement(
    title = "King of the Seas", points = 2,
    description = "Fuse two or more cards with the result being 'Sea King Dragon'.",
    id = 82909, badge = "89994", published = "05.09.2019 20:42:10", modified = "19.07.2025 09:50:51",
    trigger = createFusion(443)
)

achievement(
    title = "Giant Eel", points = 2,
    description = "Fuse two or more cards with the result being 'Spike Seadra'.",
    id = 82913, badge = "89998", published = "05.09.2019 20:42:16", modified = "19.07.2025 09:50:53",
    trigger = createFusion(448)
)

achievement(
    title = "Spell for Immortality", points = 2,
    description = "Fuse two or more cards with the result being '30,000-Year White Turtle'.",
    id = 82838, badge = "89924", published = "05.09.2019 20:39:59", modified = "19.07.2025 09:50:29",
    trigger = createFusion(449)
)

achievement(
    title = "Killer Kappa", points = 3,
    description = "Fuse two or more cards with the result being 'Kappa Avenger'.",
    id = 82885, badge = "89970", published = "05.09.2019 20:41:25", modified = "19.07.2025 09:50:44",
    trigger = createFusion(450)
)

achievement(
    title = "Stone Age", points = 2,
    description = "Fuse two or more cards with the result being 'Minomushi Warrior'.",
    id = 82894, badge = "89979", published = "05.09.2019 20:41:41", modified = "19.07.2025 09:50:46",
    trigger = createFusion(456)
)

achievement(
    title = "Eruption", points = 2,
    description = "Fuse two or more cards with the result being 'Stone Ghost'.",
    id = 82916, badge = "90001", published = "05.09.2019 20:42:21", modified = "19.07.2025 09:50:54",
    trigger = createFusion(457)
)

achievement(
    title = "Vengeful Sorcerer", points = 2,
    description = "Fuse two or more cards with the result being 'Kaminari Attack'.",
    id = 82884, badge = "89969", published = "05.09.2019 20:41:24", modified = "19.07.2025 09:50:43",
    trigger = createFusion(458)
)

achievement(
    title = "Electromagnetic Waves", points = 2,
    description = "Fuse two or more cards with the result being 'Tripwire Beast'.",
    id = 82926, badge = "90010", published = "05.09.2019 20:42:39", modified = "19.07.2025 09:50:56",
    trigger = createFusion(459)
)

achievement(
    title = "Hydroelectric", points = 2,
    description = "Fuse two or more cards with the result being 'Bolt Escargot'.",
    id = 82846, badge = "89931", published = "05.09.2019 20:40:15", modified = "19.07.2025 09:50:31",
    trigger = createFusion(460)
)

achievement(
    title = "Wizened Warlock", points = 2,
    description = "Fuse two or more cards with the result being 'The Immortal of Thunder'.",
    id = 82920, badge = "90005", published = "05.09.2019 20:42:27", modified = "19.07.2025 09:50:55",
    trigger = createFusion(462)
)

achievement(
    title = "Judge of the Skies", points = 3,
    description = "Fuse two or more cards with the result being 'Punished Eagle'.",
    id = 82903, badge = "89988", published = "05.09.2019 20:41:59", modified = "19.07.2025 09:50:50",
    trigger = createFusion(465)
)

achievement(
    title = "Raining Fire", points = 2,
    description = "Fuse two or more cards with the result being 'Crimson Sunbird'.",
    id = 82852, badge = "89937", published = "05.09.2019 20:40:26", modified = "19.07.2025 09:50:32",
    trigger = createFusion(467)
)

achievement(
    title = "Sorcerous Spirit", points = 2,
    description = "Fuse two or more cards with the result being 'Magical Ghost'.",
    id = 82889, badge = "89974", published = "05.09.2019 20:41:33", modified = "19.07.2025 09:50:45",
    trigger = createFusion(470)
)

achievement(
    title = "Pet Lizard", points = 2,
    description = "Fuse two or more cards with the result being 'Soul Hunter'.",
    id = 82912, badge = "89997", published = "05.09.2019 20:42:15", modified = "19.07.2025 09:50:53",
    trigger = createFusion(471)
)

achievement(
    title = "Fighting With Fire", points = 2,
    description = "Fuse two or more cards with the result being 'Vermilion Sparrow'.",
    id = 82930, badge = "90015", published = "05.09.2019 20:42:46", modified = "19.07.2025 09:50:59",
    trigger = createFusion(473)
)

achievement(
    title = "Brutal Bug", points = 2,
    description = "Fuse two or more cards with the result being 'Cockroach Knight'.",
    id = 82850, badge = "89935", published = "05.09.2019 20:40:22", modified = "19.07.2025 09:50:32",
    trigger = createFusion(479)
)

achievement(
    title = "Taking to the Sky", points = 2,
    description = "Fuse two or more cards with the result being 'Garvas'.",
    id = 82876, badge = "89961", published = "05.09.2019 20:41:10", modified = "19.07.2025 09:50:41",
    trigger = createFusion(483)
)

achievement(
    title = "Floral Camouflage", points = 2,
    description = "Fuse two or more cards with the result being 'Flower Wolf'.",
    id = 82875, badge = "89960", published = "05.09.2019 20:41:07", modified = "19.07.2025 09:50:40",
    trigger = createFusion(487)
)

achievement(
    title = "Guitar Solo", points = 2,
    description = "Fuse two or more cards with the result being 'Musician King'.",
    id = 82897, badge = "89982", published = "05.09.2019 20:41:46", modified = "19.07.2025 09:50:49",
    trigger = createFusion(495)
)

achievement(
    title = "Fang of a Dragon", points = 2,
    description = "Fuse two or more cards with the result being 'Dragon Human'.",
    id = 82856, badge = "89947", published = "05.09.2019 20:40:33", modified = "19.07.2025 09:50:36",
    trigger = createFusion(502)
)

achievement(
    title = "Mechanical Upgrade", points = 2,
    description = "Fuse two or more cards with the result being 'Cyber Saurus'.",
    id = 82854, badge = "89939", published = "05.09.2019 20:40:29", modified = "19.07.2025 09:50:33",
    trigger = createFusion(508)
)

achievement(
    title = "Deadly Seed", points = 2,
    description = "Fuse two or more cards with the result being 'Bean Soldier'.",
    id = 82844, badge = "89928", published = "05.09.2019 20:40:12", modified = "19.07.2025 09:50:30",
    trigger = createFusion(511)
)

achievement(
    title = "Rock-Solid Shell", points = 2,
    description = "Fuse two or more cards with the result being 'Boulder Tortoise'.",
    id = 82847, badge = "89932", published = "05.09.2019 20:40:17", modified = "19.07.2025 09:50:31",
    trigger = createFusion(518)
)

achievement(
    title = "Underwater Inferno", points = 3,
    description = "Fuse two or more cards with the result being 'Fire Kraken'.",
    id = 82870, badge = "89955", published = "05.09.2019 20:40:59", modified = "19.07.2025 09:50:38",
    trigger = createFusion(519)
)

achievement(
    title = "Air, Land and Sea", points = 2,
    description = "Fuse two or more cards with the result being 'Turtle Bird'.",
    id = 82927, badge = "90011", published = "05.09.2019 20:42:40", modified = "19.07.2025 09:50:57",
    trigger = createFusion(520)
)

achievement(
    title = "Underworld Guardian", points = 2,
    description = "Fuse two or more cards with the result being 'Flame Cerebrus'.",
    id = 82872, badge = "89957", published = "05.09.2019 20:41:02", modified = "19.07.2025 09:50:40",
    trigger = createFusion(529)
)

achievement(
    title = "Riding the Desert Wind", points = 2,
    description = "Fuse two or more cards with the result being 'Mystical Sand'.",
    id = 82899, badge = "89984", published = "05.09.2019 20:41:52", modified = "19.07.2025 09:50:49",
    trigger = createFusion(531)
)

achievement(
    title = "Alpha Beetle", points = 3,
    description = "Fuse two or more cards with the result being 'Kwagar Hercules'.",
    id = 82887, badge = "89972", published = "05.09.2019 20:41:29", modified = "19.07.2025 09:50:44",
    trigger = createFusion(533)
)

achievement(
    title = "Zombie Shark", points = 2,
    description = "Fuse two or more cards with the result being 'Corroding Shark'.",
    id = 82851, badge = "89936", published = "05.09.2019 20:40:24", modified = "19.07.2025 09:50:32",
    trigger = createFusion(539)
)

achievement(
    title = "Torpedo Shark", points = 2,
    description = "Fuse two or more cards with the result being 'Misairuzame'.",
    id = 82895, badge = "89980", published = "05.09.2019 20:41:43", modified = "19.07.2025 09:50:47",
    trigger = createFusion(542)
)

achievement(
    title = "Bone Dragon", points = 2,
    description = "Fuse two or more cards with the result being 'Skelgon'.",
    id = 82910, badge = "89995", published = "05.09.2019 20:42:11", modified = "19.07.2025 09:50:52",
    trigger = createFusion(545)
)

achievement(
    title = "One Ferocious Fish", points = 2,
    description = "Fuse two or more cards with the result being 'Wow Warrior'.",
    id = 82934, badge = "90019", published = "05.09.2019 20:42:53", modified = "19.07.2025 09:51:00",
    trigger = createFusion(546)
)

achievement(
    title = "Dark Sided Woman", points = 2,
    description = "Fuse two or more cards with the result being 'Dark Elf'.",
    id = 82857, badge = "89941", published = "05.09.2019 20:40:35", modified = "19.07.2025 09:50:34",
    trigger = createFusion(551)
)

achievement(
    title = "Golden Terror", points = 3,
    description = "Fuse two or more cards with the result being 'Great Mammoth of Goldfine'.",
    id = 82879, badge = "89964", published = "05.09.2019 20:41:15", modified = "19.07.2025 09:50:41",
    trigger = createFusion(564)
)

achievement(
    title = "Fiendish Flower", points = 3,
    description = "Fuse two or more cards with the result being 'Darkworld Thorns'.",
    id = 82859, badge = "89943", published = "05.09.2019 20:40:40", modified = "19.07.2025 09:50:34",
    trigger = createFusion(567)
)

achievement(
    title = "Herbivorous Dragon", points = 2,
    description = "Fuse two or more cards with the result being 'Black Dragon Jungle King'.",
    id = 82843, badge = "89929", published = "05.09.2019 20:40:10", modified = "19.07.2025 09:50:31",
    trigger = createFusion(571)
)

achievement(
    title = "Alluring Valkyrie", points = 2,
    description = "Fuse two or more cards with the result being 'Dark Witch'.",
    id = 82858, badge = "89942", published = "05.09.2019 20:40:37", modified = "19.07.2025 09:50:34",
    trigger = createFusion(582)
)

achievement(
    title = "Fully Evolved", points = 3,
    description = "Fuse two or more cards with the result being 'Mon Larvas'.",
    id = 82896, badge = "89981", published = "05.09.2019 20:41:44", modified = "19.07.2025 09:50:47",
    trigger = createFusion(587)
)

achievement(
    title = "Fire Eater", points = 2,
    description = "Fuse two or more cards with the result being 'Giant Turtle Who Feeds on Flames'.",
    id = 82877, badge = "89962", published = "05.09.2019 20:41:12", modified = "19.07.2025 09:50:41",
    trigger = createFusion(593)
)

achievement(
    title = "Demonic Possession", points = 3,
    description = "Fuse two or more cards with the result being 'Rose Spectre of Dunn'.",
    id = 82907, badge = "89992", published = "05.09.2019 20:42:06", modified = "19.07.2025 09:50:50",
    trigger = createFusion(594)
)

achievement(
    title = "Airborne Mirror", points = 2,
    description = "Fuse two or more cards with the result being 'Fiend Refrection #1'.",
    id = 82868, badge = "89953", published = "05.09.2019 20:40:55", modified = "19.07.2025 09:50:38",
    trigger = createFusion(595)
)

achievement(
    title = "Electri-Terrifying", points = 2,
    description = "Fuse two or more cards with the result being 'Electric Lizard'.",
    id = 82866, badge = "89951", published = "05.09.2019 20:40:52", modified = "19.07.2025 09:50:37",
    trigger = createFusion(610)
)

achievement(
    title = "God of Thunder", points = 3,
    description = "Fuse two or more cards with the result being 'Twin-Headed Thunder Dragon'.",
    id = 82925, badge = "90013", published = "05.09.2019 20:42:37", modified = "19.07.2025 09:50:59",
    trigger = createFusion(613)
)

achievement(
    title = "Alpha Sealion", points = 2,
    description = "Fuse two or more cards with the result being 'Marine Beast'.",
    id = 82890, badge = "89975", published = "05.09.2019 20:41:34", modified = "19.07.2025 09:50:46",
    trigger = createFusion(617)
)

achievement(
    title = "Tree of Snakes", points = 2,
    description = "Fuse two or more cards with the result being 'Snakeyashi'.",
    id = 82911, badge = "89996", published = "05.09.2019 20:42:13", modified = "19.07.2025 09:50:52",
    trigger = createFusion(620)
)

achievement(
    title = "Underwater Sentinel", points = 2,
    description = "Fuse two or more cards with the result being 'Amazon of the Seas'.",
    id = 82840, badge = "89925", published = "05.09.2019 20:40:03", modified = "19.07.2025 09:50:30",
    trigger = createFusion(626)
)

achievement(
    title = "Cat Girl", points = 2,
    description = "Fuse two or more cards with the result being 'Nekogal #2'.",
    id = 82901, badge = "89986", published = "05.09.2019 20:41:55", modified = "19.07.2025 09:50:49",
    trigger = createFusion(627)
)

achievement(
    title = "Sprouting Wings", points = 2,
    description = "Fuse two or more cards with the result being 'Winged Egg of New Life'.",
    id = 82932, badge = "90017", published = "05.09.2019 20:42:49", modified = "19.07.2025 09:51:00",
    trigger = createFusion(633)
)

achievement(
    title = "Queen of the Forest", points = 2,
    description = "Fuse two or more cards with the result being 'Queen of Autumn Leaves'.",
    id = 82904, badge = "89989", published = "05.09.2019 20:42:00", modified = "19.07.2025 09:50:50",
    trigger = createFusion(638)
)

achievement(
    title = "Waterproofed Amphibian", points = 3,
    description = "Fuse two or more cards with the result being 'Amphibious Bugroth'.",
    id = 82841, badge = "89926", published = "05.09.2019 20:40:05", modified = "19.07.2025 09:50:30",
    trigger = createFusion(639)
)

achievement(
    title = "Black Sheep", points = 3,
    description = "Fuse two or more cards with the result being 'Mystical Sheep #1'.",
    id = 82900, badge = "89985", published = "05.09.2019 20:41:53", modified = "19.07.2025 09:50:49",
    trigger = createFusion(642)
)

achievement(
    title = "Enchanted Hologram", points = 2,
    description = "Fuse two or more cards with the result being 'Disk Magician'.",
    id = 82861, badge = "89945", published = "05.09.2019 20:40:43", modified = "19.07.2025 09:50:35",
    trigger = createFusion(643)
)

achievement(
    title = "Kappa Companion", points = 2,
    description = "Fuse two or more cards with the result being 'Hyosube'.",
    id = 82880, badge = "89965", published = "05.09.2019 20:41:17", modified = "19.07.2025 09:50:43",
    trigger = createFusion(647)
)

achievement(
    title = "Ryu-Kishin's Versatility", points = 3,
    description = "Fuse two or more cards with the result being 'Whiptail Crow'.",
    id = 82931, badge = "90016", published = "05.09.2019 20:42:48", modified = "19.07.2025 09:50:59",
    trigger = createFusion(650)
)

achievement(
    title = "War-Lion Ritual", points = 5,
    description = "Summon 'Super War-Lion' by sacrificing 'Frenzied Panda', 'Leogun' and 'Garvas'.",
    id = 82947, badge = "90136", published = "05.09.2019 21:52:49", modified = "19.07.2025 09:51:04",
    trigger = summonMonster(673, 356)
)

achievement(
    title = "Yamadron Ritual", points = 5,
    description = "Summon 'Yamadron' by sacrificing 'Mountain Warrior', 'Koumori Dragon' and 'Wings of Wicked Flame'.",
    id = 82942, badge = "90129", published = "05.09.2019 21:52:43", modified = "19.07.2025 09:51:01",
    trigger = summonMonster(666, 357)
)

achievement(
    title = "Zera Ritual", points = 5,
    description = "Summon 'Zera the Mant' by sacrificing 'King of Yamimakai', 'Wicked Dragon with the Ersatz Head' and 'Ryu-Kishin Powered'.",
    id = 82946, badge = "90144", published = "05.09.2019 21:52:48", modified = "19.07.2025 09:51:05",
    trigger = summonMonster(671, 360)
)

achievement(
    title = "Curse of Millennium Shield", points = 5,
    description = "Summon 'Millennium Shield' by sacrificing 'Prevent Rat', 'One-Eyed Shield Dragon' and 'Armored Rat'.",
    id = 82940, badge = "90128", published = "05.09.2019 21:52:41", modified = "19.07.2025 09:51:01",
    trigger = summonMonster(665, 362)
)

achievement(
    title = "Black Luster Ritual", points = 5,
    description = "Summon 'Black Luster Soldier' by sacrificing 'Beaver Warrior', 'Kuriboh' and 'Gaia the Fierce Knight'.",
    id = 82944, badge = "90150", published = "05.09.2019 21:52:46", modified = "19.07.2025 09:51:07",
    trigger = summonMonster(670, 364)
)

achievement(
    title = "Beastly Mirror Ritual", points = 5,
    description = "Summon 'Fiend's Mirror' by sacrificing 'Fiend Refrection #2', 'Wicked Mirror' and 'Fiend Refrection #1'.",
    id = 82948, badge = "90134", published = "05.09.2019 21:52:51", modified = "19.07.2025 09:51:02",
    trigger = summonMonster(674, 365)
)

achievement(
    title = "Gate Guardian Ritual", points = 10,
    description = "Summon 'Gate Guardian' by sacrificing 'Sanga of the Thunder', 'Kazejin' and 'Suijin'.",
    id = 82943, badge = "90151", published = "05.09.2019 21:52:45", modified = "19.07.2025 09:51:07",
    trigger = summonMonster(667, 374)
)

achievement(
    title = "Ultimate Dragon Ritual", points = 25,
    description = "Summon 'Blue-Eyes Ultimate Dragon' by sacrificing three separate 'Blue-Eyes White Dragon'.",
    id = 82949, badge = "90152", published = "05.09.2019 21:52:53", modified = "19.07.2025 09:51:08",
    trigger = summonMonster(675, 380)
)

achievement(
    title = "Commencement Dance", points = 5,
    description = "Summon 'Performance of Sword' by sacrificing 'Water Omotics', 'Dancing Elf' and 'Bean Soldier'.",
    id = 82950, badge = "90131", published = "05.09.2019 21:52:54", modified = "19.07.2025 09:51:01",
    trigger = summonMonster(676, 701)
)

achievement(
    title = "Hamburger Recipe", points = 5,
    description = "Summon 'Hungry Burger' by sacrificing 'Battle Steer', 'Bioplant' and 'Griggle'.",
    id = 82951, badge = "90133", published = "05.09.2019 21:52:56", modified = "19.07.2025 09:51:02",
    trigger = summonMonster(677, 702)
)

achievement(
    title = "Here Comes Sennen Genjin", points = 5,
    description = "Summon 'Sengenjin' by sacrificing 'Hitotsu-me Giant', 'Tiger Axe' and 'Millennium Golem'.",
    id = 82953, badge = "90147", published = "05.09.2019 21:52:57", modified = "19.07.2025 09:51:05",
    trigger = summonMonster(678, 703)
)

achievement(
    title = "Prayer for Fairness", points = 5,
    description = "Summon 'Skull Guardian' by sacrificing 'M-Warrior #1', 'M-Warrior #2' and 'Kamakiriman'.",
    id = 82954, badge = "90139", published = "05.09.2019 21:52:59", modified = "19.07.2025 09:51:04",
    trigger = summonMonster(679, 704)
)

achievement(
    title = "Curse of Tri-Horned Dragon", points = 5,
    description = "Summon 'Tri-Horned Dragon' by sacrificing 'Feral Imp', 'Torike' and 'Black Dragon Jungle King'.",
    id = 82955, badge = "90146", published = "05.09.2019 21:53:01", modified = "19.07.2025 09:51:05",
    trigger = summonMonster(680, 705)
)

achievement(
    title = "Wicked Soul Transfer", points = 5,
    description = "Summon 'Serpent Night Dragon' by sacrificing 'Darkfire Dragon', 'Dragoness the Wicked Knight' and 'Obese Marmot of Nefarious'.",
    id = 82957, badge = "90141", published = "05.09.2019 21:53:03", modified = "19.07.2025 09:51:04",
    trigger = summonMonster(691, 706)
)

achievement(
    title = "Cosmo Queen's Prayer", points = 5,
    description = "Summon 'Cosmo Queen' by sacrificing 'Princess of Tsurugi', 'Queen's Double' and 'Queen of Autumn Leaves'.",
    id = 82965, badge = "90148", published = "05.09.2019 21:53:16", modified = "19.07.2025 09:51:06",
    trigger = summonMonster(698, 708)
)

achievement(
    title = "Turtle Evolution", points = 5,
    description = "Summon 'Crab Turtle' by sacrificing 'Catapult Turtle', 'Kanikabuto' and '30,000-Year White Turtle'.",
    id = 82958, badge = "90143", published = "05.09.2019 21:53:05", modified = "19.07.2025 09:51:05",
    trigger = summonMonster(692, 710)
)

achievement(
    title = "Puppet Manipulation", points = 5,
    description = "Summon 'Psycho-Puppet' by sacrificing 'Mysterious Puppeteer', 'Saber Slasher' and 'Blocker'.",
    id = 82962, badge = "90135", published = "05.09.2019 21:53:10", modified = "19.07.2025 09:51:02",
    trigger = summonMonster(695, 715)
)

achievement(
    title = "Rokutoryuu Fighter", points = 5,
    description = "Summon 'Garma Sword' by sacrificing 'Vishwar Randi', 'Swordstalker' and 'Succubus Knight'.",
    id = 82964, badge = "90140", published = "05.09.2019 21:53:14", modified = "19.07.2025 09:51:04",
    trigger = summonMonster(697, 716)
)

achievement(
    title = "Fortress Whale's Oath", points = 5,
    description = "Summon 'Fortress Whale' by sacrificing 'White Dolphin', 'Mech Bass' and 'Misairuzame'.",
    id = 82968, badge = "90138", published = "05.09.2019 21:53:19", modified = "19.07.2025 09:51:04",
    trigger = summonMonster(700, 718)
)

achievement(
    title = "Revival of the Skeleton Rider", points = 5,
    description = "Summon 'Dokurorider' by sacrificing 'Temple of Skulls', 'Cockroach Knight' and 'Korogashi'.",
    id = 82967, badge = "90130", published = "05.09.2019 21:53:18", modified = "19.07.2025 09:51:01",
    trigger = summonMonster(699, 719)
)

achievement(
    title = "Construct of Mask", points = 5,
    description = "Summon 'Mask of Shine & Dark' by sacrificing 'Mask of Darkness', 'Masked Clown' and 'Masked Sorcerer'.",
    id = 82959, badge = "90132", published = "05.09.2019 21:53:07", modified = "19.07.2025 09:51:02",
    trigger = summonMonster(693, 720)
)

achievement(
    title = "Legendary One of Three", points = 10,
    description = "Earn a 'Blue-Eyes White Dragon' in a duel.",
    id = 178825, badge = "617835", published = "03.09.2019 19:57:04", modified = "18.09.2019 20:45:55",
    trigger = getDuelReward(001)
)

achievement(
    title = "Right Arm of the Forbidden One", points = 10,
    description = "Earn a 'Right Arm of the Forbidden One' in a duel.",
    id = 82789, badge = "89920", published = "03.09.2019 19:57:04", modified = "18.09.2019 20:45:55",
    trigger = getDuelReward(019)
)

achievement(
    title = "Left Arm of the Forbidden One", points = 10,
    description = "Earn a 'Left Arm of the Forbidden One' in a duel.",
    id = 82790, badge = "89921", published = "03.09.2019 19:57:06", modified = "18.09.2019 20:45:59",
    trigger = getDuelReward(020)
)

achievement(
    title = "Head of the Forbidden One", points = 25,
    description = "Earn a 'Exodia the Forbidden' in a duel.",
    id = 82791, badge = "89922", published = "03.09.2019 19:57:08", modified = "18.09.2019 20:46:04",
    trigger = getDuelReward(021)
)

achievement(
    title = "The Most Faithful of Servants", points = 10,
    description = "Earn a 'Dark Magician' card in a duel.",
    id = 83234, badge = "91524", published = "08.09.2019 11:59:20", modified = "22.10.2019 21:03:01",
    trigger = getDuelReward(035)
)

achievement(
    title = "David and Gaia", points = 10,
    description = "Earn a 'Gaia the Fierce Knight' card in a duel.",
    id = 178829, badge = "617844", published = "08.09.2019 11:59:20", modified = "22.10.2019 21:03:01",
    trigger = getDuelReward(038)
)

achievement(
    title = "Red'y to Attack", points = 10,
    description = "Earn a 'Red-Eyes Black Dragon' card in a duel.",
    id = 178828, badge = "617839", published = "08.09.2019 11:59:20", modified = "22.10.2019 21:03:01",
    trigger = getDuelReward(082)
)

achievement(
    title = "Slifer's Wrath", points = 10,
    description = "Earn a 'Raigeki' card in a duel.",
    id = 179409, badge = "617864", published = "08.09.2019 11:59:20", modified = "22.10.2019 21:03:01",
    trigger = getDuelReward(337)
)

achievement(
    title = "Golem of Thunder", points = 25,
    description = "Earn a 'Sanga of the Thunder' card in a duel.",
    id = 179019, badge = "617852", published = "08.09.2019 11:59:20", modified = "22.10.2019 21:03:01",
    trigger = getDuelReward(371)
)

achievement(
    title = "Golem of Wind", points = 25,
    description = "Earn a 'Kazejin' card in a duel.",
    id = 179408, badge = "617856", published = "08.09.2019 11:59:20", modified = "22.10.2019 21:03:01",
    trigger = getDuelReward(372)
)

achievement(
    title = "Golem of Water", points = 25,
    description = "Earn a 'Suijin' card in a duel.",
    id = 179020, badge = "617854", published = "08.09.2019 11:59:20", modified = "22.10.2019 21:03:01",
    trigger = getDuelReward(373)
)

achievement(
    title = "Completely Without Fusion", points = 10,
    description = "Earn a 'Twin-Headed Thunder Dragon' card in a duel.",
    id = 180476, badge = "618225", published = "08.09.2019 11:59:20", modified = "22.10.2019 21:03:01",
    trigger = getDuelReward(613)
)

achievement(
    title = "Level Up Your Monsters", points = 10,
    description = "Earn a 'Megamorph' card in a duel.",
    id = 178831, badge = "617849", published = "08.09.2019 11:59:20", modified = "22.10.2019 21:03:01",
    trigger = getDuelReward(657)
)

achievement(
    title = "One of the Strongest", points = 25,
    description = "Earn a 'Meteor Black Dragon' card in a duel.",
    id = 178830, badge = "617847", published = "08.09.2019 11:59:20", modified = "22.10.2019 21:03:01",
    trigger = getDuelReward(713)
)

//--------------------------------------------------
// Rich Presence

rich_presence_conditional_display(
    gameState() == 0x00,
    "In the Titlescreen"
)

rich_presence_conditional_display(
    (gameState() == 0x02 && (getEvent(0x500) || getEvent(0x546))) || gameState() == 0x09, 
    "Heishin is {0} [Campaign]",
    rich_presence_lookup(
        "Location", 
       0x209, 
        locLookup,
        fallback = "wandering around in Egypt"
    )
)

rich_presence_conditional_display(
    gameState() == 0x02 && getEvent(0x53F) && locationID == 0x00, 
    "Prince Atem is {0} [Campaign]",
    rich_presence_lookup(
        "Location", 
        0x05, 
        locLookup,
        fallback = "wandering around in Egypt"
    )
)

rich_presence_conditional_display(
    gameState() == 0x02 && getEvent(0x547) && locationID == 0x00, 
    "Yugi Muto is {0} [Campaign]",
    rich_presence_lookup(
        "Location", 
        0x08, 
        locLookup,
        fallback = "wandering around in Egypt"
    )
)

rich_presence_conditional_display(
    gameState() == 0x02 && getEvent(0x585) && locationID == 0x00, 
    "Prince Atem is in the Forbidden Ruins [Campaign]"
)

rich_presence_conditional_display(
    (gameState() == 0x02 && getEvent(0x5D6)) || locationID == 0x8206, 
    "Prince Atem is in the Forbidden Tomb [Campaign]"
)

rich_presence_conditional_display(
    gameState() == 0x02 && isYugiMuto(), 
    "Yugi Muto is {0} [Campaign]",
    rich_presence_lookup(
        "YugiLocation", 
        word(0x09B270), 
        locYugiLookup,
        fallback = "in the Championship Hall"
    )
)

rich_presence_conditional_display(
    gameState() == 0x02, 
    "Prince Atem is {0} [Campaign]",
    rich_presence_lookup(
        "Location", 
        word(0x09B270), 
        locLookup,
        fallback = "wandering around in Egypt"
    )
)

rich_presence_conditional_display(
    never(gameState() != 0x03) && byte(0x09B368) == 0x02 && once(playerLP == 8000 && opponentLP == 8000), 
    "{10} [{2}{3}{4}{5}ʟᴘ] is dueling {1} [{6}{7}{8}{9}ʟᴘ] {0} [Campaign]",
    rich_presence_lookup(
        "Location", 
        word(0x09B270), 
        locLookup,
        fallback = "wandering around in Egypt"
    ),
    rich_presence_lookup(
        "Duelist", 
        opponentDuelist, 
        duelistLookup,
        fallback = "Simon Muran"
    ),
    rich_presence_lookup(
        "Filler2",
        playerLP / 1000,
        fillerLookup
    ),
    rich_presence_lookup(
        "Filler",
        playerLP / 100,
        fillerLookup
    ),
    rich_presence_lookup(
        "Filler",
        playerLP / 10,
        fillerLookup
    ),
    rich_presence_value(
        "Unformatted",
        playerLP,
        "Value"
    ),
    rich_presence_lookup(
        "Filler2",
        opponentLP / 1000,
        fillerLookup
    ),
    rich_presence_lookup(
        "Filler",
        opponentLP / 100,
        fillerLookup
    ),
    rich_presence_lookup(
        "Filler",
        opponentLP / 10,
        fillerLookup
    ),
    rich_presence_value(
        "Unformatted",
        opponentLP,
        "Value"
    ),
    rich_presence_lookup(
        "Protagonist", 
        opponentDuelist, 
        protagonistLookup,
        fallback = "Prince Atem"
    )
)

rich_presence_conditional_display(
    never(gameState() != 0x03) && byte(0x09B368) == 0x06 && once(playerLP == 8000 && opponentLP == 8000), 
    "{9} [{1}{2}{3}{4}ʟᴘ] is dueling {0} [{5}{6}{7}{8}ʟᴘ] [Free Duel]",
    rich_presence_lookup(
        "Duelist", 
        opponentDuelist, 
        duelistLookup,
        fallback = "Simon Muran"
    ),
    rich_presence_lookup(
        "Filler2",
        playerLP / 1000,
        fillerLookup
    ),
    rich_presence_lookup(
        "Filler",
        playerLP / 100,
        fillerLookup
    ),
    rich_presence_lookup(
        "Filler",
        playerLP / 10,
        fillerLookup
    ),
    rich_presence_value(
        "Unformatted",
        playerLP,
        "Value"
    ),
    rich_presence_lookup(
        "Filler2",
        opponentLP / 1000,
        fillerLookup
    ),
    rich_presence_lookup(
        "Filler",
        opponentLP / 100,
        fillerLookup
    ),
    rich_presence_lookup(
        "Filler",
        opponentLP / 10,
        fillerLookup
    ),
    rich_presence_value(
        "Unformatted",
        opponentLP,
        "Value"
    ),
    rich_presence_lookup(
        "Protagonist", 
        opponentDuelist, 
        protagonistLookup,
        fallback = "Prince Atem"
    )
)

rich_presence_conditional_display(
    gameState() == 0x04, 
    "In the Library [🎴{0}/722]",
    rich_presence_macro(
        "Number",
        totalLibraryEntries()
    )
)

rich_presence_conditional_display(
    gameState() == 0x05, 
    "Prince Atem is wandering around in Egypt [Campaign]"
)

rich_presence_conditional_display(
    gameState() == 0x06, 
    "Prince Atem is selecting a Duelist [Free Duel]"
)

rich_presence_conditional_display(
    gameState() == 0x07 && byte(0x09B269) == 2, 
    "Prince Atem is building his Deck {0} [Campaign]",
    rich_presence_lookup(
        "Location", 
        word(0x09B270), 
        locLookup,
        fallback = "wandering around in Egypt"
    )
)

rich_presence_conditional_display(
    gameState() == 0x07 && byte(0x09B269) != 2, 
    "Prince Atem is building his Deck [{0}]",
    rich_presence_lookup(
        "Mode", 
        word(0x09B269), 
        stateLookup,
        fallback = "Main Menu"
    )
)

rich_presence_conditional_display(
    gameState() == 0x08,
    "In the Main Menu"
)

rich_presence_conditional_display(
    gameState() == 0x0A,
    "In the Password Screen [⭐{0}]",
    rich_presence_macro(
        "Number",
        currentStarchips
    )
)

rich_presence_conditional_display(
    gameState() == 0x0B,
    "In the Options"
)

rich_presence_conditional_display(
    gameState() == 0x0C && isYugiMuto(),
    "Yugi Muto has lost the Tournament [Campaign]"
)

rich_presence_conditional_display(
    gameState() == 0x0C,
    "Prince Atem has lost the Egypt Kingdom [Campaign]"
)

rich_presence_conditional_display(
    gameState() == 0x0F,
    "In the Credits"
)

rich_presence_conditional_display(
    isYugiMuto(),
    "Yugi Muto is {0} [Campaign]",
    rich_presence_lookup(
        "YugiLocation", 
        word(0x09B270), 
        locYugiLookup,
        fallback = "in the Championship Hall"
    )
)

rich_presence_display(
    "Prince Atem is {0} [Campaign]",
    rich_presence_lookup(
        "Location", 
        word(0x09B270), 
        locLookup,
        fallback = "wandering around in Egypt"
    )
)




