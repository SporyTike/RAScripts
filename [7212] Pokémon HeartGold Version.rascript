// Pokémon HeartGold Version
// #ID = 7212

achievementSetPokeahlon     = achievement_set("Pokéathlon", 
                                              type = "BONUS",
                                              id = 45860)
achievementSetCompletionist = achievement_set("Completionist", 
                                              type = "BONUS", 
                                              id = 45861)
                                              
//--------------------------------------------------
// Addresses

mem_ContextPointer              = 0x000BA8

//--------------------------------------------------
// Functions

function pseudoImpossibleCondition() {
    return dword(mem_ContextPointer) == 0x12345678
}

function checkHeapLoaded(heapIndex) {
    return byte(tbyte(getContextPointer() + 0xBFD34) + heapIndex) != 0x1C
}

function checkSaveLoaded() {
    return getSavefileData("8-bit", 0x1000) == prev(getSavefileData("8-bit", 0x1000))
}

function getContextPointer() {
    return tbyte(mem_ContextPointer)
}

function getSavefilePointer() {
    return remembered(tbyte(getContextPointer() + 0x20))
}

function getData(memorySize, address) {
    if (memorySize == "8-bit") {
        return byte(address)
    } else
    if (memorySize == "16-bit") {
        return word(address)
    } else
    if (memorySize == "24-bit") {
        return tbyte(address)
    } else
    if (memorySize == "32-bit") {
        return dword(address)
    } else
    if (memorySize == "Bit0") {
        return bit0(address)
    } else
    if (memorySize == "Bit1") {
        return bit1(address)
    } else
    if (memorySize == "Bit2") {
        return bit2(address)
    } else
    if (memorySize == "Bit3") {
        return bit3(address)
    } else
    if (memorySize == "Bit4") {
        return bit4(address)
    } else
    if (memorySize == "Bit5") {
        return bit5(address)
    } else
    if (memorySize == "Bit6") {
        return bit6(address)
    } else
    if (memorySize == "Bit7") {
        return bit7(address)
    } else
    if (memorySize == "BitCount") {
        return bitcount(address)
    }
}

function getMapID() {
    return getSavefileData("16-bit", 0x1244)
}

function getMusicID() {
    return word(tbyte(0x000BA8) + 0xBECF4)
}

function getHeapData(heapIndex, memorySize, offset) {
    headOffset = remembered(byte(tbyte(getContextPointer() + 0xBFD34) + heapIndex) * 0x04)
    address = remembered(tbyte(tbyte(tbyte(getContextPointer() + 0xBFD24) + headOffset) + 0x18))
    address = address + offset
    return getData(memorySize, address)
}

function getSavefileData(memorySize, offset) {
    address = tbyte(getContextPointer() + 0x20) + offset
    return getData(memorySize, address)
}

function getSavefileDataRemember(memorySize, offset) {
    address = remembered(getSavefilePointer()) + offset
    return getData(memorySize, address)
}

function calculatePokeathlonSolidaryCrowns() {
    return getSavefileDataRemember("16-bit", 0xD9EA) / 420
         + getSavefileDataRemember("16-bit", 0xD9EA) / 450
         - getSavefileDataRemember("16-bit", 0xD9EA) / 840
         - getSavefileDataRemember("16-bit", 0xD9EA) / 900
         + getSavefileDataRemember("16-bit", 0xDA16) / 420
         + getSavefileDataRemember("16-bit", 0xDA16) / 450
         - getSavefileDataRemember("16-bit", 0xDA16) / 840
         - getSavefileDataRemember("16-bit", 0xDA16) / 900
         + getSavefileDataRemember("16-bit", 0xDA42) / 420
         + getSavefileDataRemember("16-bit", 0xDA42) / 450
         - getSavefileDataRemember("16-bit", 0xDA42) / 840
         - getSavefileDataRemember("16-bit", 0xDA42) / 900
         + getSavefileDataRemember("16-bit", 0xDA6E) / 420
         + getSavefileDataRemember("16-bit", 0xDA6E) / 450
         - getSavefileDataRemember("16-bit", 0xDA6E) / 840
         - getSavefileDataRemember("16-bit", 0xDA6E) / 900
         + getSavefileDataRemember("16-bit", 0xDA9A) / 420
         + getSavefileDataRemember("16-bit", 0xDA9A) / 450
         - getSavefileDataRemember("16-bit", 0xDA9A) / 840
         - getSavefileDataRemember("16-bit", 0xDA9A) / 900
}

function calculatePokeathlonMedals() {
    sum = 0
    for pokemon in range (0, 492) {
        sum = sum + getSavefileDataRemember("BitCount", 0xDAC0 + pokemon)
    }
    return sum
}

function calculatePokeathlonMedalistPokemon() {
    return calculatePokeathlonMedalistPokemonInRange(001, 0493)
}

function calculatePokeathlonMedalistPokemonInRange(startNationalID, endNationalID) {
    sum = 0
    for nationalID in range (startNationalID, endNationalID) {
        sum = sum + (getSavefileDataRemember("BitCount", 0xDAC0 + (nationalID - 1)) / 5)
    }
    return sum
}

function calculatePokeathlonBeatenNormalRecords(type) {
    extraCondition = always_true()
    if (type == "Save Protection") {
        extraCondition = getMusicID() == 0x3F0
    }
    return tally(10, once(extraCondition &&
                          getSavefileDataRemember("16-bit", 0xDCB0) < 3000 &&  // Hurdle Dash -> 100.0
                          getSavefileDataRemember("16-bit", 0xDCB0) > 0),
                     once(extraCondition &&
                          getSavefileDataRemember("16-bit", 0xDCDC) > 35 &&    // Pennant Capture
                          getSavefileDataRemember("16-bit", 0xDCDC) < 5000),
                     once(extraCondition &&
                          getSavefileDataRemember("16-bit", 0xDD08) > 40 &&    // Circle Push
                          getSavefileDataRemember("16-bit", 0xDD08) < 5000),
                     once(extraCondition &&
                          getSavefileDataRemember("16-bit", 0xDD34) > 80 &&    // Block Smash
                          getSavefileDataRemember("16-bit", 0xDD34) < 5000),
                     once(extraCondition &&
                          getSavefileDataRemember("16-bit", 0xDD60) > 40 &&    // Disc Catch
                          getSavefileDataRemember("16-bit", 0xDD60) < 5000),
                     once(extraCondition &&
                          getSavefileDataRemember("16-bit", 0xDD8C) > 350 &&   // Lamp Jump
                          getSavefileDataRemember("16-bit", 0xDD8C) < 5000),
                     once(extraCondition &&
                          getSavefileDataRemember("16-bit", 0xDDB8) > 12288 && // Relay Run -> 12.0
                          getSavefileDataRemember("16-bit", 0xDDB8) < 50000),
                     once(extraCondition &&
                          getSavefileDataRemember("16-bit", 0xDDE4) > 70 &&    // Ring Drop
                          getSavefileDataRemember("16-bit", 0xDDE4) < 5000),
                     once(extraCondition &&
                          getSavefileDataRemember("16-bit", 0xDE10) > 30 &&    // Snow Throw
                          getSavefileDataRemember("16-bit", 0xDE10) < 5000),
                     once(extraCondition &&
                          getSavefileDataRemember("16-bit", 0xDE3C) > 3 &&    // Goal Roll
                          getSavefileDataRemember("16-bit", 0xDE3C) < 5000))
}

function calculatePokeathlonBeatenMasterRecords(type) {
    extraCondition = always_true()
    if (type == "Save Protection") {
        extraCondition = getMusicID() == 0x3F0
    }
    return tally(10, once(extraCondition &&
                          getSavefileDataRemember("16-bit", 0xDCB0) < 2400 &&  // Hurdle Dash -> 80.0
                          getSavefileDataRemember("16-bit", 0xDCB0) > 0),
                     once(extraCondition &&
                          getSavefileDataRemember("16-bit", 0xDCDC) > 50 &&    // Pennant Capture
                          getSavefileDataRemember("16-bit", 0xDCDC) < 5000),
                     once(extraCondition &&
                          getSavefileDataRemember("16-bit", 0xDD08) > 60 &&    // Circle Push
                          getSavefileDataRemember("16-bit", 0xDD08) < 5000),
                     once(extraCondition &&
                          getSavefileDataRemember("16-bit", 0xDD34) > 130 &&   // Block Smash
                          getSavefileDataRemember("16-bit", 0xDD34) < 5000),
                     once(extraCondition &&
                          getSavefileDataRemember("16-bit", 0xDD60) > 70 &&    // Disc Catch
                          getSavefileDataRemember("16-bit", 0xDD60) < 5000),
                     once(extraCondition &&
                          getSavefileDataRemember("16-bit", 0xDD8C) > 500 &&   // Lamp Jump
                          getSavefileDataRemember("16-bit", 0xDD8C) < 5000),
                     once(extraCondition &&
                          getSavefileDataRemember("16-bit", 0xDDB8) > 16384 && // Relay Run -> 16.0
                          getSavefileDataRemember("16-bit", 0xDDB8) < 50000),
                     once(extraCondition &&
                          getSavefileDataRemember("16-bit", 0xDDE4) > 100 &&   // Ring Drop
                          getSavefileDataRemember("16-bit", 0xDDE4) < 5000),
                     once(extraCondition &&
                          getSavefileDataRemember("16-bit", 0xDE10) > 55 &&    // Snow Throw
                          getSavefileDataRemember("16-bit", 0xDE10) < 5000),
                     once(extraCondition &&
                          getSavefileDataRemember("16-bit", 0xDE3C) > 9 &&     // Goal Roll
                          getSavefileDataRemember("16-bit", 0xDE3C) < 5000))
}

function calculatePokeathlonDataCards() {
           code = 0
           for dataCard in range(1, 27) {
               code = code + getPokeathlonDataCard(dataCard)
           }

    return code
}

function calculatePokeathlonMinigames50Wins(type) {
    extraCondition = always_true()
    if (type == "Save Protection") {
        extraCondition = getMusicID() == 0x3F0
    }
    return tally(10, once(extraCondition &&
                          getSavefileDataRemember("32-bit", 0xE528) >= 50 &&   // Hurdle Dash
                          getSavefileDataRemember("32-bit", 0xE528) < 100000),
                     once(extraCondition &&
                          getSavefileDataRemember("32-bit", 0xE52C) >= 50 &&   // Pennant Capture
                          getSavefileDataRemember("32-bit", 0xE52C) < 100000),
                     once(extraCondition &&
                          getSavefileDataRemember("32-bit", 0xE530) >= 50 &&   // Circle Push
                          getSavefileDataRemember("32-bit", 0xE530) < 100000),
                     once(extraCondition &&
                          getSavefileDataRemember("32-bit", 0xE534) >= 50 &&   // Block Smash
                          getSavefileDataRemember("32-bit", 0xE534) < 100000),
                     once(extraCondition &&
                          getSavefileDataRemember("32-bit", 0xE538) >= 50 &&   // Disc Catch
                          getSavefileDataRemember("32-bit", 0xE538) < 100000),
                     once(extraCondition &&
                          getSavefileDataRemember("32-bit", 0xE53C) >= 50 &&   // Lamp Jump
                          getSavefileDataRemember("32-bit", 0xE53C) < 100000),
                     once(extraCondition &&
                          getSavefileDataRemember("32-bit", 0xE540) >= 50 &&   // Relay Run
                          getSavefileDataRemember("32-bit", 0xE540) < 100000),
                     once(extraCondition &&
                          getSavefileDataRemember("32-bit", 0xE544) >= 50 &&   // Ring Drop
                          getSavefileDataRemember("32-bit", 0xE544) < 100000),
                     once(extraCondition &&
                          getSavefileDataRemember("32-bit", 0xE548) >= 50 &&   // Snow Throw
                          getSavefileDataRemember("32-bit", 0xE548) < 100000),
                     once(extraCondition &&
                          getSavefileDataRemember("32-bit", 0xE54C) >= 50 &&   // Goal Roll
                          getSavefileDataRemember("32-bit", 0xE54C) < 100000))
}

function calculatePokeathlonFriendshipPoints() {
    return getSavefileDataRemember("16-bit", 0xD9EA)
         + getSavefileDataRemember("16-bit", 0xDA16)
         + getSavefileDataRemember("16-bit", 0xDA42)
         + getSavefileDataRemember("16-bit", 0xDA6E)
         + getSavefileDataRemember("16-bit", 0xDA9A)
         + getSavefileDataRemember("16-bit", 0xE4D0)
         + getSavefileDataRemember("16-bit", 0xE4D2)
         + getSavefileDataRemember("16-bit", 0xE4D4)
         + getSavefileDataRemember("16-bit", 0xE4D6)
         + getSavefileDataRemember("16-bit", 0xE4D8)
         + getSavefileDataRemember("16-bit", 0xE4DA)
         + getSavefileDataRemember("16-bit", 0xE4DC)
         + getSavefileDataRemember("16-bit", 0xE4DE)
         + getSavefileDataRemember("16-bit", 0xE4E0)
         + getSavefileDataRemember("16-bit", 0xE4E2)
         + calculatePokeathlonMedals()
}



function getPokeathlonCourseID() {
    return getHeapData(92, "32-bit", 0x29C)
}

function getPokeathlonCurrentPhase() {
    return getHeapData(92, "32-bit", 0x210)
}

function getPokeathlonDataCard(dataCardNumber) {
    dataCardBit    = (dataCardNumber - 1) % 8
    dataCardOffset = (dataCardNumber - 1) / 8
    return getSavefileDataRemember("Bit" + dataCardBit, 0xE55C + dataCardOffset)
}

function getPokeathlonMinigameID() {
    return getHeapData(92, "8-bit", 0x208 + getPokeathlonCurrentPhase())
}

function getPokeathlonMinigameScore() {
    return getHeapData(92, "16-bit", 0xD4A)
}

function getPokeathlonPhaseState() {
    return getHeapData(92, "8-bit", 0x3EA)
}

function getPokeathlonResultState() {
    return getHeapData(92, "8-bit", 0x3F2)
}

//--------------------------------------------------
// Pokéathlon - Achievements

achievement(
    title = "Unbeatable Pokéathlete", points = 25,
    description = "Obtain all 10 Solidarity Crowns in the Pokéathlon Dome by getting an end result of 450 or more in every course.",
    id = 125519, badge = "741783", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              measured(calculatePokeathlonSolidaryCrowns() == 10) &&
              prev(calculatePokeathlonSolidaryCrowns()) >= 8 &&
              prev(calculatePokeathlonSolidaryCrowns()) < 10
)

achievement(
    title = "The Half of Ten Is Not Eight", points = 100,
    description = "Obtain 8 Trust Crowns in the Pokéathlon Dome by registering at least 100 Medalist Pokémon.",
    id = 646778, badge = "741651", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              measured(calculatePokeathlonMedalistPokemon() == 100) &&
              prev(calculatePokeathlonMedalistPokemon()) >= 90 &&
              prev(calculatePokeathlonMedalistPokemon()) < 100
)

achievement(
    title = "Get Potential out of Everything", points = 50,
    description = "Obtain all 10 Trust Crowns in the Pokéathlon Dome by registering at least 200 Medalist Pokémon.",
    id = 125520, badge = "741784", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              measured(calculatePokeathlonMedalistPokemon() == 200) &&
              prev(calculatePokeathlonMedalistPokemon()) >= 190 &&
              prev(calculatePokeathlonMedalistPokemon()) < 200
)

achievement(
    title = "Keen Athletes Nominate Three Originals", points = 100,
    description = "Get all 151 Pokémon from the Kanto region registered as Medalist Pokémon.",
    id = 649248, badge = "741072", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              measured(calculatePokeathlonMedalistPokemonInRange(001, 151) == 151) &&
              prev(calculatePokeathlonMedalistPokemonInRange(001, 151)) >= 141 &&
              prev(calculatePokeathlonMedalistPokemonInRange(001, 151)) < 151
)

achievement(
    title = "Journey of Heroes Toward Olympia", points = 100,
    description = "Get all 100 Pokémon from the Johto region registered as Medalist Pokémon.",
    id = 649249, badge = "741073", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              measured(calculatePokeathlonMedalistPokemonInRange(152, 251) == 100) &&
              prev(calculatePokeathlonMedalistPokemonInRange(152, 251)) >= 90 &&
              prev(calculatePokeathlonMedalistPokemonInRange(152, 251)) < 100
)

achievement(
    title = "Highly Outstanding Elite Never Naps", points = 100,
    description = "Get all 135 Pokémon from the Hoenn region registered as Medalist Pokémon.",
    id = 649250, badge = "741074", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              measured(calculatePokeathlonMedalistPokemonInRange(252, 386) == 135) &&
              prev(calculatePokeathlonMedalistPokemonInRange(252, 386)) >= 125 &&
              prev(calculatePokeathlonMedalistPokemonInRange(252, 386)) < 135
)

achievement(
    title = "Sports Icons Neutralize New Opponents Hastily", points = 100,
    description = "Get all 107 Pokémon from the Sinnoh region registered as Medalist Pokémon.",
    id = 649251, badge = "741075", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              measured(calculatePokeathlonMedalistPokemonInRange(387, 493) == 107) &&
              prev(calculatePokeathlonMedalistPokemonInRange(387, 493)) >= 97 &&
              prev(calculatePokeathlonMedalistPokemonInRange(387, 493)) < 107
)

achievement(
    title = "Not Even Mr. Mime's Barrier Can Stop Me", points = 10,
    description = "Get a record of 80.0 seconds or better in the single-player Pokéathlon event \"Hurdle Dash\" and finish the course.",
    id = 646892, badge = "741076", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              getSavefileData("16-bit", 0xDCB0) >= 1 &&
              getSavefileData("16-bit", 0xDCB0) <= 960 &&
              prev(getSavefileData("16-bit", 0xDCB0)) > 960
)

achievement(
    title = "Cheeky Rivals and Sandy Cheeks", points = 10,
    description = "Get a record of 50 flags or better in the single-player Pokéathlon event \"Pennant Capture\" and finish the course.",
    id = 646893, badge = "741077", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              getSavefileData("16-bit", 0xDCDC) >= 50 &&
              getSavefileData("16-bit", 0xDCDC) <= 1000 &&
              prev(getSavefileData("16-bit", 0xDCDC)) < 50
)

achievement(
    title = "Pushing In the Spotlight", points = 10,
    description = "Get a record of 60 points or better in the single-player Pokéathlon event \"Circle Push\" and finish the course.",
    id = 646894, badge = "741078", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              getSavefileData("16-bit", 0xDD08) >= 60 &&
              getSavefileData("16-bit", 0xDD08) <= 1000 &&
              prev(getSavefileData("16-bit", 0xDD08)) < 60
)

achievement(
    title = "Breaking the Paws of Physics", points = 5,
    description = "Get a record of 130 pieces or better in the single-player Pokéathlon event \"Block Smash\" and finish the course.",
    id = 646895, badge = "741079", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              getSavefileData("16-bit", 0xDD34) >= 130 &&
              getSavefileData("16-bit", 0xDD34) <= 1000 &&
              prev(getSavefileData("16-bit", 0xDD34)) < 130
)

achievement(
    title = "The Early Dog Catches the Disc", points = 5,
    description = "Get a record of 70 points or better in the single-player Pokéathlon event \"Disc Catch\" and finish the course.",
    id = 646896, badge = "741080", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              getSavefileData("16-bit", 0xDD60) >= 70 &&
              getSavefileData("16-bit", 0xDD60) <= 1000 &&
              prev(getSavefileData("16-bit", 0xDD60)) < 70
)

achievement(
    title = "Bouncing Into the Lights of Glory", points = 5,
    description = "Get a record of 500 points or better in the single-player Pokéathlon event \"Lamp Jump\" and finish the course.",
    id = 646897, badge = "741081", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              getSavefileData("16-bit", 0xDD8C) >= 500 &&
              getSavefileData("16-bit", 0xDD8C) <= 5000 &&
              prev(getSavefileData("16-bit", 0xDD8C)) < 500
)

achievement(
    title = "I Would Walk 10 Miles To Be The Mon", points = 10,
    description = "Get a record of 16.0 laps or better in the single-player Pokéathlon event \"Relay Run\" and finish the course.",
    id = 646898, badge = "741082", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              getSavefileData("16-bit", 0xDDB8) >= 16384 &&
              getSavefileData("16-bit", 0xDDB8) <= 50000 &&
              prev(getSavefileData("16-bit", 0xDDB8)) < 16384
)

achievement(
    title = "Power Beyond the Boundaries", points = 5,
    description = "Get a record of 100 points or better in the single-player Pokéathlon event \"Ring Drop\" and finish the course.",
    id = 646899, badge = "741083", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              getSavefileData("16-bit", 0xDDE4) >= 100 &&
              getSavefileData("16-bit", 0xDDE4) <= 1000 &&
              prev(getSavefileData("16-bit", 0xDDE4)) < 100
)

achievement(
    title = "Strike Outs in the Cold", points = 5,
    description = "Get a record of 55 hits or better in the single-player Pokéathlon event \"Snow Throw\" and finish the course.",
    id = 646900, badge = "741084", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              getSavefileData("16-bit", 0xDE10) >= 100 &&
              getSavefileData("16-bit", 0xDE10) <= 1000 &&
              prev(getSavefileData("16-bit", 0xDE10)) < 100
)

achievement(
    title = "Triple Hat-Trick Strikers", points = 3,
    description = "Get a record of 9 points or better in the single-player Pokéathlon event \"Goal Roll\" and finish the course.",
    id = 646901, badge = "741085", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              getSavefileData("16-bit", 0xDE3C) >= 9 &&
              getSavefileData("16-bit", 0xDE3C) <= 1000 &&
              prev(getSavefileData("16-bit", 0xDE3C)) < 9
)

achievement(
    title = "Professional Team Captain", points = 5,
    description = "Obtain all 10 Potential Crowns in the Pokéathlon Dome by beating the master record of every Pokéathlon discipline.",
    id = 125522, badge = "741785", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              (measured(calculatePokeathlonBeatenMasterRecords(""), 
                        getSavefileData("8-bit", 0x1000) != 0x00 &&
                               once(getMusicID() == 0x3F0)) &&
               unless(getMusicID() == 0x3F0 &&
                      calculatePokeathlonBeatenMasterRecords("Save Protection")) ||
              (pseudoImpossibleCondition() &&
               never(getContextPointer() == 0x00000000) &&
               never(getSavefileData("8-bit", 0x1000) == 0x00)))
)

achievement(
    title = "Greatest Pokéathlete of All Time", points = 50,
    description = "Obtain all 10 Friendship Crowns in the Pokéathlon Dome by having a total of 4.500 Pokéathlon Points.",
    id = 125523, badge = "741786", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              measured(calculatePokeathlonFriendshipPoints() >= 4500) &&
              prev(calculatePokeathlonFriendshipPoints()) >= 4000 &&
              prev(calculatePokeathlonFriendshipPoints()) < 4500
)

achievement(
    title = "Run, Forretress! Run!", points = 10,
    description = "Obtain the golden running shoes trophy in the Pokéathlon Dome by dashing a total of 5.000 times in the event \"Hurdle Dash\".",
    id = 647644, badge = "741526", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              ((measured(getSavefileData("32-bit", 0xE510) >= 5000) &&
                    prev(getSavefileData("32-bit", 0xE510)) < 5000) ||
               (measured(getHeapData(92, "32-bit", 0xB78)
                       + getHeapData(92, "32-bit", 0xB98)
                       + getHeapData(92, "32-bit", 0xBB8)
                       + getSavefileData("32-bit", 0xE510) >= 5000,
                       when = checkHeapLoaded(92) &&
                              getHeapData(92, "32-bit", 0x210) * 0x100
                              + getPokeathlonPhaseState() < 0x325) &&
                    prev(getHeapData(92, "32-bit", 0xB78)
                       + getHeapData(92, "32-bit", 0xB98)
                       + getHeapData(92, "32-bit", 0xBB8)
                       + getSavefileData("32-bit", 0xE510)) < 5000))
)

achievement(
    title = "Let's Get to Business!", points = 2,
    description = "Obtain the golden jersey trophy in the Pokéathlon Dome by participating in a total of 50 courses.",
    id = 647815, badge = "741527", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              measured(getSavefileData("32-bit", 0xE4E8) == 50) &&
                  prev(getSavefileData("32-bit", 0xE4E8)) == 49
)

achievement(
    title = "What's the Matter, Trainer?", points = 2,
    description = "Obtain the golden flag trophy in the Pokéathlon Dome by switching Pokémon a total of 200 times.",
    id = 647862, badge = "741524", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              ((measured(getSavefileData("32-bit", 0xE514) == 200) &&
                    prev(getSavefileData("32-bit", 0xE514)) == 199) ||
               (measured(getHeapData(92, "32-bit", 0x764)
                       + getHeapData(92, "32-bit", 0x784)
                       + getHeapData(92, "32-bit", 0x7A4)
                       + getSavefileData("32-bit", 0xE514) == 200,
                       when = checkHeapLoaded(92) &&
                              getHeapData(92, "32-bit", 0x210) * 0x100
                              + getPokeathlonPhaseState() < 0x325) &&
                    prev(getHeapData(92, "32-bit", 0x764)
                       + getHeapData(92, "32-bit", 0x784)
                       + getHeapData(92, "32-bit", 0x7A4)
                       + getSavefileData("32-bit", 0xE514)) == 199))
)

achievement(
    title = "Call Me a Champion!", points = 2,
    description = "Obtain the golden Pokégear trophy in the Pokéathlon Dome by winning a total of 100 courses.",
    id = 847863, badge = "741525", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              measured(getSavefileData("32-bit", 0xE4EC) == 100) &&
                  prev(getSavefileData("32-bit", 0xE4EC)) == 99
)

achievement(
    title = "Get the Jump, Avoid the Bump", points = 10,
    description = "Win the single-player Pokéathlon event \"Hurdle Dash\" a total of 50 times and finish the course.",
    id = 741513, badge = "80", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              measured(getSavefileData("32-bit", 0xE528) == 50) &&
                  prev(getSavefileData("32-bit", 0xE528)) == 49
)

achievement(
    title = "Quick Race Through Piles of Sand", points = 10,
    description = "Win the single-player Pokéathlon event \"Pennant Capture\" a total of 50 times and finish the course.",
    id = 741514, badge = "80", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              measured(getSavefileData("32-bit", 0xE52C) == 50) &&
                  prev(getSavefileData("32-bit", 0xE52C)) == 49
)

achievement(
    title = "Taking a Stance", points = 10,
    description = "Win the single-player Pokéathlon event \"Circle Push\" a total of 50 times and finish the course.",
    id = 741515, badge = "80", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              measured(getSavefileData("32-bit", 0xE530) == 50) &&
                  prev(getSavefileData("32-bit", 0xE530)) == 49
)

achievement(
    title = "De-Constructor of the Month", points = 10,
    description = "Win the single-player Pokéathlon event \"Block Smash\" a total of 50 times and finish the course.",
    id = 741516, badge = "80", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              measured(getSavefileData("32-bit", 0xE534) == 50) &&
                  prev(getSavefileData("32-bit", 0xE534)) == 49
)

achievement(
    title = "Catch It If You Can", points = 10,
    description = "Win the single-player Pokéathlon event \"Disc Catch\" a total of 50 times and finish the course.",
    id = 741517, badge = "80", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              measured(getSavefileData("32-bit", 0xE538) == 50) &&
                  prev(getSavefileData("32-bit", 0xE538)) == 49
)

achievement(
    title = "Enlightment on the Bouncy Castle", points = 10,
    description = "Win the single-player Pokéathlon event \"Lamp Jump\" a total of 50 times and finish the course.",
    id = 741518, badge = "80", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              measured(getSavefileData("32-bit", 0xE53C) == 50) &&
                  prev(getSavefileData("32-bit", 0xE53C)) == 49
)

achievement(
    title = "Ready for a Marathon", points = 10,
    description = "Win the single-player Pokéathlon event \"Relay Run\" a total of 50 times and finish the course.",
    id = 741519, badge = "80", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              measured(getSavefileData("32-bit", 0xE540) == 50) &&
                  prev(getSavefileData("32-bit", 0xE540)) == 49
)

achievement(
    title = "Pushing to the Limit", points = 10,
    description = "Win the single-player Pokéathlon event \"Ring Drop\" a total of 50 times and finish the course.",
    id = 741520, badge = "80", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              measured(getSavefileData("32-bit", 0xE544) == 50) &&
                  prev(getSavefileData("32-bit", 0xE544)) == 49
)

achievement(
    title = "Snowmen and the Ice Princess", points = 10,
    description = "Win the single-player Pokéathlon event \"Snow Throw\" a total of 50 times and finish the course.",
    id = 741521, badge = "80", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              measured(getSavefileData("32-bit", 0xE548) == 50) &&
                  prev(getSavefileData("32-bit", 0xE548)) == 49
)

achievement(
    title = "Pocket World Cup", points = 10,
    description = "Win the single-player Pokéathlon event \"Goal Roll\" a total of 50 times and finish the course.",
    id = 741522, badge = "80", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              measured(getSavefileData("32-bit", 0xE54C) == 50) &&
                  prev(getSavefileData("32-bit", 0xE54C)) == 49
)

achievement(
    title = "Star of the Dome", points = 5,
    description = "Obtain the Poké Ball trophy in the Pokéathlon Dome by winning every event at least 50 times.",
    id = 649076, badge = "741649", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              (measured(calculatePokeathlonMinigames50Wins(""), 
                        when = getSavefileData("8-bit", 0x1000) != 0x00 &&
                               once(getMusicID() == 0x3F0)) &&
               unless(getMusicID() == 0x3F0 &&
                      calculatePokeathlonMinigames50Wins("Save Protection")) ||
              (pseudoImpossibleCondition() &&
               never(getContextPointer() == 0x00000000) &&
               never(getSavefileData("8-bit", 0x1000) == 0x00)))
)

achievement(
    title = "Winner of the Viewer Hearts", points = 25,
    description = "Get a total of 500 bonuses in Pokéathlon courses.",
    id = 648695, badge = "741233", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              getSavefileData("32-bit", 0xE4F4) <= 1000 &&
              measured(getSavefileData("32-bit", 0xE4F4) >= 500) &&
                  prev(getSavefileData("32-bit", 0xE4F4)) <= 499
)

achievement(
    title = "Why Don't You Give Out Information for Free?", points = 25,
    description = "Buy all 27 Data Cards in the Pokéathlon Dome.",
    id = 125518, badge = "741787", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              measured(calculatePokeathlonDataCards() == 27) &&
                  prev(calculatePokeathlonDataCards()) == 26
)

//--------------------------------------------------
// Pokéathlon - Leaderboards

leaderboard(
    id = 19141, set = 45860, title = "Event Record",
    description = "Least time needed in the Pokéathlon event \"Hurdle Dash\".",
    start  = checkSaveLoaded() &&
             checkHeapLoaded(92) &&
             getMapID() == 0x119 &&
             getPokeathlonPhaseState() == 0x12 &&
             getPokeathlonResultState() == 0x02 &&
             prev(getPokeathlonResultState()) == 0x01 &&
             getPokeathlonMinigameID() == 0x00,
    cancel = always_false(),
    submit = always_true(),
    value  = getPokeathlonMinigameScore() / 3,
    format = "FIXED1",
    lower_is_better = true
)

leaderboard(
    id = 19143, set = 45860, title = "Event Record",
    description = "Most pennants captured in the Pokéathlon event \"Pennant Capture\".",
    start  = checkSaveLoaded() &&
             checkHeapLoaded(92) &&
             getMapID() == 0x119 &&
             getPokeathlonPhaseState() == 0x12 &&
             getPokeathlonResultState() == 0x02 &&
             prev(getPokeathlonResultState()) == 0x01 &&
             getPokeathlonMinigameID() == 0x01,
    cancel = always_false(),
    submit = always_true(),
    value  = getPokeathlonMinigameScore(),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 19138, set = 45860, title = "Event Record",
    description = "Most points collected in the Pokéathlon event \"Circle Push\".",
    start  = checkSaveLoaded() &&
             checkHeapLoaded(92) &&
             getMapID() == 0x119 &&
             getPokeathlonPhaseState() == 0x12 &&
             getPokeathlonResultState() == 0x02 &&
             prev(getPokeathlonResultState()) == 0x01 &&
             getPokeathlonMinigameID() == 0x02,
    cancel = always_false(),
    submit = always_true(),
    value  = getPokeathlonMinigameScore() / 3,
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 19137, set = 45860, title = "Event Record",
    description = "Most blocks destroyed in the Pokéathlon event \"Block Smash\".",
    start  = checkSaveLoaded() &&
             checkHeapLoaded(92) &&
             getMapID() == 0x119 &&
             getPokeathlonPhaseState() == 0x12 &&
             getPokeathlonResultState() == 0x02 &&
             prev(getPokeathlonResultState()) == 0x01 &&
             getPokeathlonMinigameID() == 0x03,
    cancel = always_false(),
    submit = always_true(),
    value  = getPokeathlonMinigameScore() / 3,
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 19139, set = 45860, title = "Event Record",
    description = "Most points collected in the Pokéathlon event \"Disc Catch\".",
    start  = checkSaveLoaded() &&
             checkHeapLoaded(92) &&
             getMapID() == 0x119 &&
             getPokeathlonPhaseState() == 0x12 &&
             getPokeathlonResultState() == 0x02 &&
             prev(getPokeathlonResultState()) == 0x01 &&
             getPokeathlonMinigameID() == 0x04,
    cancel = always_false(),
    submit = always_true(),
    value  = getPokeathlonMinigameScore() / 3,
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 19142, set = 45860, title = "Event Record",
    description = "Most points collected in the Pokéathlon event \"Lamp Jump\".",
    start  = checkSaveLoaded() &&
             checkHeapLoaded(92) &&
             getMapID() == 0x119 &&
             getPokeathlonPhaseState() == 0x12 &&
             getPokeathlonResultState() == 0x02 &&
             prev(getPokeathlonResultState()) == 0x01 &&
             getPokeathlonMinigameID() == 0x05,
    cancel = always_false(),
    submit = always_true(),
    value  = getPokeathlonMinigameScore() / 3,
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 19144, set = 45860, title = "Event Record",
    description = "Most distance ran in the Pokéathlon event \"Relay Run\".",
    start  = checkSaveLoaded() &&
             checkHeapLoaded(92) &&
             getMapID() == 0x119 &&
             getPokeathlonPhaseState() == 0x12 &&
             getPokeathlonResultState() == 0x02 &&
             prev(getPokeathlonResultState()) == 0x01 &&
             getPokeathlonMinigameID() == 0x06,
    cancel = always_false(),
    submit = always_true(),
    value  = getPokeathlonMinigameScore() / 102.4,
    format = "FIXED1",
    lower_is_better = false
)

leaderboard(
    id = 19145, set = 45860, title = "Event Record",
    description = "Most points collected in the Pokéathlon event \"Ring Drop\".",
    start  = checkSaveLoaded() &&
             checkHeapLoaded(92) &&
             getMapID() == 0x119 &&
             getPokeathlonPhaseState() == 0x12 &&
             getPokeathlonResultState() == 0x02 &&
             prev(getPokeathlonResultState()) == 0x01 &&
             getPokeathlonMinigameID() == 0x07,
    cancel = always_false(),
    submit = always_true(),
    value  = getPokeathlonMinigameScore(),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 19146, set = 45860, title = "Event Record",
    description = "Most Pokémon hit in the Pokéathlon event \"Snow Throw\".",
    start  = checkSaveLoaded() &&
             checkHeapLoaded(92) &&
             getMapID() == 0x119 &&
             getPokeathlonPhaseState() == 0x12 &&
             getPokeathlonResultState() == 0x02 &&
             prev(getPokeathlonResultState()) == 0x01 &&
             getPokeathlonMinigameID() == 0x08,
    cancel = always_false(),
    submit = always_true(),
    value  = getPokeathlonMinigameScore(),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 19140, set = 45860, title = "Event Record",
    description = "Most points collected in the Pokéathlon event \"Goal Roll\".",
    start  = checkSaveLoaded() &&
             checkHeapLoaded(92) &&
             getMapID() == 0x119 &&
             getPokeathlonPhaseState() == 0x12 &&
             getPokeathlonResultState() == 0x02 &&
             prev(getPokeathlonResultState()) == 0x01 &&
             getPokeathlonMinigameID() == 0x09,
    cancel = always_false(),
    submit = always_true(),
    value  = getPokeathlonMinigameScore(),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 19147, set = 45860, title = "Course Record",
    description = "Highest end result in the Pokéathlon Speed course.",
    start  = checkSaveLoaded() &&
             checkHeapLoaded(92) &&
             getMapID() == 0x119 &&
             getPokeathlonCourseID() == 0x00 &&
             getPokeathlonCurrentPhase() == 0x03 &&
             getPokeathlonPhaseState() == 0x21 &&
             getPokeathlonResultState() == 0x02 &&
             prev(getPokeathlonResultState()) == 0x01,
    cancel = always_false(),
    submit = always_true(),
    value  = dword(tbyte(getHeapData(92, "24-bit", 0x204) + 0x8C) + 0x10),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 19148, set = 45860, title = "Course Record",
    description = "Highest end result in the Pokéathlon Power course.",
    start  = checkSaveLoaded() &&
             checkHeapLoaded(92) &&
             getMapID() == 0x119 &&
             getPokeathlonCourseID() == 0x01 &&
             getPokeathlonCurrentPhase() == 0x03 &&
             getPokeathlonPhaseState() == 0x21 &&
             getPokeathlonResultState() == 0x02 &&
             prev(getPokeathlonResultState()) == 0x01,
    cancel = always_false(),
    submit = always_true(),
    value  = dword(tbyte(getHeapData(92, "24-bit", 0x204) + 0x8C) + 0x10),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 19149, set = 45860, title = "Course Record",
    description = "Highest end result in the Pokéathlon Skill course.",
    start  = checkSaveLoaded() &&
             checkHeapLoaded(92) &&
             getMapID() == 0x119 &&
             getPokeathlonCourseID() == 0x02 &&
             getPokeathlonCurrentPhase() == 0x03 &&
             getPokeathlonPhaseState() == 0x21 &&
             getPokeathlonResultState() == 0x02 &&
             prev(getPokeathlonResultState()) == 0x01,
    cancel = always_false(),
    submit = always_true(),
    value  = dword(tbyte(getHeapData(92, "24-bit", 0x204) + 0x8C) + 0x10),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 19150, set = 45860, title = "Course Record",
    description = "Highest end result in the Pokéathlon Stamina course.",
    start  = checkSaveLoaded() &&
             checkHeapLoaded(92) &&
             getMapID() == 0x119 &&
             getPokeathlonCourseID() == 0x03 &&
             getPokeathlonCurrentPhase() == 0x03 &&
             getPokeathlonPhaseState() == 0x21 &&
             getPokeathlonResultState() == 0x02 &&
             prev(getPokeathlonResultState()) == 0x01,
    cancel = always_false(),
    submit = always_true(),
    value  = dword(tbyte(getHeapData(92, "24-bit", 0x204) + 0x8C) + 0x10),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 19151, set = 45860, title = "Course Record",
    description = "Highest end result in the Pokéathlon Jump course.",
    start  = checkSaveLoaded() &&
             checkHeapLoaded(92) &&
             getMapID() == 0x119 &&
             getPokeathlonCourseID() == 0x04 &&
             getPokeathlonCurrentPhase() == 0x03 &&
             getPokeathlonPhaseState() == 0x21 &&
             getPokeathlonResultState() == 0x02 &&
             prev(getPokeathlonResultState()) == 0x01,
    cancel = always_false(),
    submit = always_true(),
    value  = dword(tbyte(getHeapData(92, "24-bit", 0x204) + 0x8C) + 0x10),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 176501, set = 45860, title = "Data Card 00",
    description = "Total courses joined in the Single-Player Pokéathlon.",
    start  = checkSaveLoaded() &&
             getMapID() == 0x119 &&
             getSavefileData("32-bit", 0xE4E8) > prev(getSavefileData("32-bit", 0xE4E8)),
    cancel = always_false(),
    submit = always_true(),
    value  = getSavefileData("32-bit", 0xE4E8),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 176502, set = 45860, title = "Data Card 00",
    description = "Total courses joined in the Connection Pokéathlon.",
    start  = checkSaveLoaded() &&
             getMapID() == 0x119 &&
             getSavefileData("32-bit", 0xE51C) > prev(getSavefileData("32-bit", 0xE51C)),
    cancel = always_false(),
    submit = always_true(),
    value  = getSavefileData("32-bit", 0xE51C),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 176503, set = 45860, title = "Data Card 01",
    description = "Total courses finished as 1st place in the Single-Player Pokéathlon.",
    start  = checkSaveLoaded() &&
             getMapID() == 0x119 &&
             getPokeathlonDataCard(01) == 0x01 &&
             getSavefileData("32-bit", 0xE4EC) > prev(getSavefileData("32-bit", 0xE4EC)),
    cancel = always_false(),
    submit = always_true(),
    value  = getSavefileData("32-bit", 0xE4EC),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 176504, set = 45860, title = "Data Card 02",
    description = "Total courses finished as last place in the Single-Player Pokéathlon.",
    start  = checkSaveLoaded() &&
             getMapID() == 0x119 &&
             getPokeathlonDataCard(02) == 0x01 &&
             getSavefileData("32-bit", 0xE4F0) > prev(getSavefileData("32-bit", 0xE4F0)),
    cancel = always_false(),
    submit = always_true(),
    value  = getSavefileData("32-bit", 0xE4F0),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 176505, set = 45860, title = "Data Card 03",
    description = "Total dashes made with Pokémon in the Pokéathlon.",
    start  = checkSaveLoaded() &&
             getMapID() == 0x119 &&
             getPokeathlonDataCard(03) == 0x01 &&
             getSavefileData("32-bit", 0xE510) > prev(getSavefileData("32-bit", 0xE510)),
    cancel = always_false(),
    submit = always_true(),
    value  = getSavefileData("32-bit", 0xE510),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 176506, set = 45860, title = "Data Card 04",
    description = "Total jumps made with Pokémon in the Pokéathlon.",
    start  = checkSaveLoaded() &&
             getMapID() == 0x119 &&
             getPokeathlonDataCard(04) == 0x01 &&
             getSavefileData("32-bit", 0xE500) > prev(getSavefileData("32-bit", 0xE500)),
    cancel = always_false(),
    submit = always_true(),
    value  = getSavefileData("32-bit", 0xE500),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 176507, set = 45860, title = "Data Card 05",
    description = "Total wins in the Pokéathlon event \"Hurdle Dash\".",
    start  = checkSaveLoaded() &&
             getMapID() == 0x119 &&
             getPokeathlonDataCard(05) == 0x01 &&
             getSavefileData("32-bit", 0xE528) > prev(getSavefileData("32-bit", 0xE528)),
    cancel = always_false(),
    submit = always_true(),
    value  = getSavefileData("32-bit", 0xE528),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 0, set = 45860, title = "Data Card 06",
    description = "Total wins in the Pokéathlon event \"Relay Run\".",
    start  = checkSaveLoaded() &&
             getMapID() == 0x119 &&
             getPokeathlonDataCard(06) == 0x01 &&
             getSavefileData("32-bit", 0xE540) > prev(getSavefileData("32-bit", 0xE540)),
    cancel = always_false(),
    submit = always_true(),
    value  = getSavefileData("32-bit", 0xE540),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 176508, set = 45860, title = "Data Card 07",
    description = "Total wins in the Pokéathlon event \"Pennant Capture\".",
    start  = checkSaveLoaded() &&
             getMapID() == 0x119 &&
             getPokeathlonDataCard(07) == 0x01 &&
             getSavefileData("32-bit", 0xE52C) > prev(getSavefileData("32-bit", 0xE52C)),
    cancel = always_false(),
    submit = always_true(),
    value  = getSavefileData("32-bit", 0xE52C),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 0, set = 45860, title = "Data Card 08",
    description = "Total wins in the Pokéathlon event \"Block Smash\".",
    start  = checkSaveLoaded() &&
             getMapID() == 0x119 &&
             getPokeathlonDataCard(08) == 0x01 &&
             getSavefileData("32-bit", 0xE534) > prev(getSavefileData("32-bit", 0xE534)),
    cancel = always_false(),
    submit = always_true(),
    value  = getSavefileData("32-bit", 0xE534),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 176509, set = 45860, title = "Data Card 09",
    description = "Total wins in the Pokéathlon event \"Disc Catch\".",
    start  = checkSaveLoaded() &&
             getMapID() == 0x119 &&
             getPokeathlonDataCard(09) == 0x01 &&
             getSavefileData("32-bit", 0xE538) > prev(getSavefileData("32-bit", 0xE538)),
    cancel = always_false(),
    submit = always_true(),
    value  = getSavefileData("32-bit", 0xE538),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 176510, set = 45860, title = "Data Card 10",
    description = "Total wins in the Pokéathlon event \"Snow Throw\".",
    start  = checkSaveLoaded() &&
             getMapID() == 0x119 &&
             getPokeathlonDataCard(10) == 0x01 &&
             getSavefileData("32-bit", 0xE548) > prev(getSavefileData("32-bit", 0xE548)),
    cancel = always_false(),
    submit = always_true(),
    value  = getSavefileData("32-bit", 0xE548),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 176511, set = 45860, title = "Data Card 11",
    description = "Total acquired points in the Pokéathlon.",
    start  = checkSaveLoaded() &&
             getMapID() == 0x119 &&
             getPokeathlonDataCard(11) == 0x01 &&
             getSavefileData("32-bit", 0xE504) > prev(getSavefileData("32-bit", 0xE504)),
    cancel = always_false(),
    submit = always_true(),
    value  = getSavefileData("32-bit", 0xE504),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 176512, set = 45860, title = "Data Card 12",
    description = "Total fails made with Pokémon in the Pokéathlon.",
    start  = checkSaveLoaded() &&
             getMapID() == 0x119 &&
             getPokeathlonDataCard(12) == 0x01 &&
             getSavefileData("32-bit", 0xE4FC) > prev(getSavefileData("32-bit", 0xE4FC)),
    cancel = always_false(),
    submit = always_true(),
    value  = getSavefileData("32-bit", 0xE4FC),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 176513, set = 45860, title = "Data Card 13",
    description = "Total times that Pokémon self-impeded themselves in the Pokéathlon.",
    start  = checkSaveLoaded() &&
             getMapID() == 0x119 &&
             getPokeathlonDataCard(13) == 0x01 &&
             getSavefileData("32-bit", 0xE518) > prev(getSavefileData("32-bit", 0xE518)),
    cancel = always_false(),
    submit = always_true(),
    value  = getSavefileData("32-bit", 0xE518),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 176514, set = 45860, title = "Data Card 14",
    description = "Total tackles made with Pokémon in the Pokéathlon.",
    start  = checkSaveLoaded() &&
             getMapID() == 0x119 &&
             getPokeathlonDataCard(14) == 0x01 &&
             getSavefileData("32-bit", 0xE508) > prev(getSavefileData("32-bit", 0xE508)),
    cancel = always_false(),
    submit = always_true(),
    value  = getSavefileData("32-bit", 0xE508),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 176515, set = 45860, title = "Data Card 15",
    description = "Total times that Pokémon fell down in the Pokéathlon.",
    start  = checkSaveLoaded() &&
             getMapID() == 0x119 &&
             getPokeathlonDataCard(15) == 0x01 &&
             getSavefileData("32-bit", 0xE50C) > prev(getSavefileData("32-bit", 0xE50C)),
    cancel = always_false(),
    submit = always_true(),
    value  = getSavefileData("32-bit", 0xE50C),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 176516, set = 45860, title = "Data Card 16",
    description = "Total wins in the Pokéathlon event \"Ring Drop\".",
    start  = checkSaveLoaded() &&
             getMapID() == 0x119 &&
             getPokeathlonDataCard(16) == 0x01 &&
             getSavefileData("32-bit", 0xE544) > prev(getSavefileData("32-bit", 0xE544)),
    cancel = always_false(),
    submit = always_true(),
    value  = getSavefileData("32-bit", 0xE544),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 176517, set = 45860, title = "Data Card 17",
    description = "Total wins in the Pokéathlon event \"Lamp Jump\".",
    start  = checkSaveLoaded() &&
             getMapID() == 0x119 &&
             getPokeathlonDataCard(17) == 0x01 &&
             getSavefileData("32-bit", 0xE53C) > prev(getSavefileData("32-bit", 0xE53C)),
    cancel = always_false(),
    submit = always_true(),
    value  = getSavefileData("32-bit", 0xE53C),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 176518, set = 45860, title = "Data Card 18",
    description = "Total wins in the Pokéathlon event \"Circle Push\".",
    start  = checkSaveLoaded() &&
             getMapID() == 0x119 &&
             getPokeathlonDataCard(18) == 0x01 &&
             getSavefileData("32-bit", 0xE530) > prev(getSavefileData("32-bit", 0xE530)),
    cancel = always_false(),
    submit = always_true(),
    value  = getSavefileData("32-bit", 0xE530),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 176519, set = 45860, title = "Data Card 19",
    description = "Total courses finished as 1st place in the Connection Pokéathlon.",
    start  = checkSaveLoaded() &&
             getMapID() == 0x119 &&
             getPokeathlonDataCard(19) == 0x01 &&
             getSavefileData("32-bit", 0xE520) > prev(getSavefileData("32-bit", 0xE520)),
    cancel = always_false(),
    submit = always_true(),
    value  = getSavefileData("32-bit", 0xE520),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 176520, set = 45860, title = "Data Card 20",
    description = "Total courses finished as last place in the Connection Pokéathlon.",
    start  = checkSaveLoaded() &&
             getMapID() == 0x119 &&
             getPokeathlonDataCard(20) == 0x01 &&
             getSavefileData("32-bit", 0xE524) > prev(getSavefileData("32-bit", 0xE524)),
    cancel = always_false(),
    submit = always_true(),
    value  = getSavefileData("32-bit", 0xE524),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 176521, set = 45860, title = "Data Card 21",
    description = "Total events finished as 1st place in the Pokéathlon.",
    start  = checkSaveLoaded() &&
             getMapID() == 0x119 &&
             getPokeathlonDataCard(21) == 0x01 &&
             __ornext(getSavefileData("32-bit", 0xE528) > prev(getSavefileData("32-bit", 0xE528)) ||
                      getSavefileData("32-bit", 0xE52C) > prev(getSavefileData("32-bit", 0xE52C)) ||
                      getSavefileData("32-bit", 0xE530) > prev(getSavefileData("32-bit", 0xE530)) ||
                      getSavefileData("32-bit", 0xE534) > prev(getSavefileData("32-bit", 0xE534)) ||
                      getSavefileData("32-bit", 0xE538) > prev(getSavefileData("32-bit", 0xE538)) ||
                      getSavefileData("32-bit", 0xE53C) > prev(getSavefileData("32-bit", 0xE53C)) ||
                      getSavefileData("32-bit", 0xE540) > prev(getSavefileData("32-bit", 0xE540)) ||
                      getSavefileData("32-bit", 0xE544) > prev(getSavefileData("32-bit", 0xE544)) ||
                      getSavefileData("32-bit", 0xE548) > prev(getSavefileData("32-bit", 0xE548)) ||
                      getSavefileData("32-bit", 0xE54C) > prev(getSavefileData("32-bit", 0xE54C))),
    cancel = always_false(),
    submit = always_true(),
    value  = getSavefileData("32-bit", 0xE528)
           + getSavefileData("32-bit", 0xE52C)
           + getSavefileData("32-bit", 0xE530)
           + getSavefileData("32-bit", 0xE534)
           + getSavefileData("32-bit", 0xE538)
           + getSavefileData("32-bit", 0xE53C)
           + getSavefileData("32-bit", 0xE540)
           + getSavefileData("32-bit", 0xE544)
           + getSavefileData("32-bit", 0xE548)
           + getSavefileData("32-bit", 0xE54C),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 176522, set = 45860, title = "Data Card 22",
    description = "Total events finished as last place in the Pokéathlon.",
    start  = checkSaveLoaded() &&
             getMapID() == 0x119 &&
             getPokeathlonDataCard(22) == 0x01 &&
             getSavefileData("32-bit", 0xE550) > prev(getSavefileData("32-bit", 0xE550)),
    cancel = always_false(),
    submit = always_true(),
    value  = getSavefileData("32-bit", 0xE550),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 176523, set = 45860, title = "Data Card 23",
    description = "Total switches made with Pokémon in the Pokéathlon.",
    start  = checkSaveLoaded() &&
             getMapID() == 0x119 &&
             getPokeathlonDataCard(23) == 0x01 &&
             getSavefileData("32-bit", 0xE514) > prev(getSavefileData("32-bit", 0xE514)),
    cancel = always_false(),
    submit = always_true(),
    value  = getSavefileData("32-bit", 0xE514),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 176524, set = 45860, title = "Data Card 24",
    description = "Total wins in the Pokéathlon event \"Goal Roll\".",
    start  = checkSaveLoaded() &&
             getMapID() == 0x119 &&
             getPokeathlonDataCard(24) == 0x01 &&
             getSavefileData("32-bit", 0xE54C) > prev(getSavefileData("32-bit", 0xE54C)),
    cancel = always_false(),
    submit = always_true(),
    value  = getSavefileData("32-bit", 0xE54C),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 176525, set = 45860, title = "Data Card 25",
    description = "Total bonuses earned in the Pokéathlon.",
    start  = checkSaveLoaded() &&
             getMapID() == 0x119 &&
             getPokeathlonDataCard(25) == 0x01 &&
             getSavefileData("32-bit", 0xE4F4) > prev(getSavefileData("32-bit", 0xE4F4)),
    cancel = always_false(),
    submit = always_true(),
    value  = getSavefileData("32-bit", 0xE4F4),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 176526, set = 45860, title = "Data Card 26",
    description = "Total instructions given to Pokémon in the Pokéathlon.",
    start  = checkSaveLoaded() &&
             getMapID() == 0x119 &&
             getPokeathlonDataCard(26) == 0x01 &&
             getSavefileData("32-bit", 0xE4F8) > prev(getSavefileData("32-bit", 0xE4F8)),
    cancel = always_false(),
    submit = always_true(),
    value  = getSavefileData("32-bit", 0xE4F8),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 176527, set = 45860, title = "Data Card 27",
    description = "Total time spent in the Pokéathlon.",
    start  = checkSaveLoaded() &&
             getMapID() == 0x119 &&
             getPokeathlonDataCard(27) == 0x01 &&
             getSavefileData("32-bit", 0xE4E4) > prev(getSavefileData("32-bit", 0xE4E4)),
    cancel = always_false(),
    submit = always_true(),
    value  = getSavefileData("32-bit", 0xE4E4),
    format = "MINUTES",
    lower_is_better = false
)
