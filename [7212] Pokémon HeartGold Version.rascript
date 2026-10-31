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

function calculatePokeathlonBeatenNormalRecords() {
    return tally(10, once(getSavefileDataRemember("16-bit", 0xDCB0) < 3000 &&  // Hurdle Dash -> 100.0
                          getSavefileDataRemember("16-bit", 0xDCB0) > 0),
                     once(getSavefileDataRemember("16-bit", 0xDCDC) > 35 &&    // Pennant Capture
                          getSavefileDataRemember("16-bit", 0xDCDC) < 5000),
                     once(getSavefileDataRemember("16-bit", 0xDD08) > 40 &&    // Circle Push
                          getSavefileDataRemember("16-bit", 0xDD08) < 5000),
                     once(getSavefileDataRemember("16-bit", 0xDD34) > 80 &&    // Block Smash
                          getSavefileDataRemember("16-bit", 0xDD34) < 5000),
                     once(getSavefileDataRemember("16-bit", 0xDD60) > 40 &&    // Disc Catch
                          getSavefileDataRemember("16-bit", 0xDD60) < 5000),
                     once(getSavefileDataRemember("16-bit", 0xDD8C) > 350 &&   // Lamp Jump
                          getSavefileDataRemember("16-bit", 0xDD8C) < 5000),
                     once(getSavefileDataRemember("16-bit", 0xDDB8) > 12288 && // Relay Run -> 12.0
                          getSavefileDataRemember("16-bit", 0xDDB8) < 50000),
                     once(getSavefileDataRemember("16-bit", 0xDDE4) > 70 &&    // Ring Drop
                          getSavefileDataRemember("16-bit", 0xDDE4) < 5000),
                     once(getSavefileDataRemember("16-bit", 0xDE10) > 30 &&    // Snow Throw
                          getSavefileDataRemember("16-bit", 0xDE10) < 5000),
                     once(getSavefileDataRemember("16-bit", 0xDE3C) > 3 &&    // Goal Roll
                          getSavefileDataRemember("16-bit", 0xDE3C) < 5000))
}

function calculatePokeathlonBeatenMasterRecords() {
    return tally(10, once(getSavefileDataRemember("16-bit", 0xDCB0) < 2400 &&  // Hurdle Dash -> 80.0
                          getSavefileDataRemember("16-bit", 0xDCB0) > 0),
                     once(wetSavefileDataRemember("16-bit", 0xDCDC) > 50 &&    // Pennant Capture
                          getSavefileDataRemember("16-bit", 0xDCDC) < 5000),
                     once(getSavefileDataRemember("16-bit", 0xDD08) > 60 &&    // Circle Push
                          getSavefileDataRemember("16-bit", 0xDD08) < 5000),
                     once(getSavefileDataRemember("16-bit", 0xDD34) > 130 &&   // Block Smash
                          getSavefileDataRemember("16-bit", 0xDD34) < 5000),
                     once(getSavefileDataRemember("16-bit", 0xDD60) > 70 &&    // Disc Catch
                          getSavefileDataRemember("16-bit", 0xDD60) < 5000),
                     once(getSavefileDataRemember("16-bit", 0xDD8C) > 500 &&   // Lamp Jump
                          getSavefileDataRemember("16-bit", 0xDD8C) < 5000),
                     once(getSavefileDataRemember("16-bit", 0xDDB8) > 16384 && // Relay Run -> 16.0
                          getSavefileDataRemember("16-bit", 0xDDB8) < 50000),
                     once(getSavefileDataRemember("16-bit", 0xDDE4) > 100 &&   // Ring Drop
                          getSavefileDataRemember("16-bit", 0xDDE4) < 5000),
                     once(getSavefileDataRemember("16-bit", 0xDE10) > 55 &&    // Snow Throw
                          getSavefileDataRemember("16-bit", 0xDE10) < 5000),
                     once(getSavefileDataRemember("16-bit", 0xDE3C) > 9 &&     // Goal Roll
                          getSavefileDataRemember("16-bit", 0xDE3C) < 5000))
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

function calculatePokeathlon50WinsPerEvent() {
    return tally(10, once(getSavefileDataRemember("32-bit", 0xE528) >= 50 &&   // Hurdle Dash
                          getSavefileDataRemember("32-bit", 0xE528) < 100000),
                     once(getSavefileDataRemember("32-bit", 0xE52C) >= 50 &&   // Pennant Capture
                          getSavefileDataRemember("32-bit", 0xE52C) < 100000),
                     once(getSavefileDataRemember("32-bit", 0xE530) >= 50 &&   // Circle Push
                          getSavefileDataRemember("32-bit", 0xE530) < 100000),
                     once(getSavefileDataRemember("32-bit", 0xE534) >= 50 &&   // Block Smash
                          getSavefileDataRemember("32-bit", 0xE534) < 100000),
                     once(getSavefileDataRemember("32-bit", 0xE538) >= 50 &&   // Disc Catch
                          getSavefileDataRemember("32-bit", 0xE538) < 100000),
                     once(getSavefileDataRemember("32-bit", 0xE53C) >= 50 &&   // Lamp Jump
                          getSavefileDataRemember("32-bit", 0xE53C) < 100000),
                     once(getSavefileDataRemember("32-bit", 0xE540) >= 50 &&   // Relay Run
                          getSavefileDataRemember("32-bit", 0xE540) < 100000),
                     once(getSavefileDataRemember("32-bit", 0xE544) >= 50 &&   // Ring Drop
                          getSavefileDataRemember("32-bit", 0xE544) < 100000),
                     once(getSavefileDataRemember("32-bit", 0xE548) >= 50 &&   // Snow Throw
                          getSavefileDataRemember("32-bit", 0xE548) < 100000),
                     once(getSavefileDataRemember("32-bit", 0xE54C) >= 50 &&   // Goal Roll
                          getSavefileDataRemember("32-bit", 0xE54C) < 100000))
}

function getPokeathlonCurrentPhase() {
    return getHeapData(92, "32-bit", 0x210)
}

function getPokeathlonMinigameIDInSlot(eventSlot) {
    return getHeapData(92, "8-bit", 0x208 + eventSlot)
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
    id = 125519, badge = "138582", set = 45860,
    trigger = checkSaveLoaded() //DEL &&
              //DEL getMapID() == 0x119 &&
              //DEL measured(calculatePokeathlonSolidaryCrowns() == 10) &&
              //DEL prev(calculatePokeathlonSolidaryCrowns()) >= 8 &&
              //DEL prev(calculatePokeathlonSolidaryCrowns()) < 10
)

achievement(
    title = "The Half of Ten Is Not Eight", points = 50,
    description = "Obtain 8 Trust Crowns in the Pokéathlon Dome by registering at least 100 Medalist Pokémon.",
    id = 646778, badge = "80", set = 45860,
    trigger = checkSaveLoaded() //DEL &&
              //DEL getMapID() == 0x119 &&
              //DEL measured(calculatePokeathlonMedalistPokemon() == 100) &&
              //DEL prev(calculatePokeathlonMedalistPokemon()) >= 90 &&
              //DEL prev(calculatePokeathlonMedalistPokemon()) < 100
)

achievement(
    title = "Get Potential out of Everything", points = 50,
    description = "Obtain all 10 Trust Crowns in the Pokéathlon Dome by registering at least 200 Medalist Pokémon.",
    id = 125520, badge = "138583", set = 45860,
    trigger = checkSaveLoaded() //DEL &&
              //DEL getMapID() == 0x119 &&
              //DEL measured(calculatePokeathlonMedalistPokemon() == 200) &&
              //DEL prev(calculatePokeathlonMedalistPokemon()) >= 190 &&
              //DEL prev(calculatePokeathlonMedalistPokemon()) < 200
)

achievement(
    title = "Keen Athletes Nominate Three Originals", points = 100,
    description = "Get all 151 Pokémon from the Kanto region registered as Medalist Pokémon.",
    id = 646774, badge = "80", set = 45860,
    trigger = checkSaveLoaded() //DEL &&
              //DEL getMapID() == 0x119 &&
              //DEL measured(calculatePokeathlonMedalistPokemonInRange(001, 151) == 151) &&
              //DEL prev(calculatePokeathlonMedalistPokemonInRange(001, 151)) >= 141 &&
              //DEL prev(calculatePokeathlonMedalistPokemonInRange(001, 151)) < 151
)

achievement(
    title = "Journey of Heroes Toward Olympia", points = 100,
    description = "Get all 100 Pokémon from the Johto region registered as Medalist Pokémon.",
    id = 646775, badge = "80", set = 45860,
    trigger = checkSaveLoaded() //DEL &&
              //DEL getMapID() == 0x119 &&
              //DEL measured(calculatePokeathlonMedalistPokemonInRange(152, 251) == 100) &&
              //DEL prev(calculatePokeathlonMedalistPokemonInRange(152, 251)) >= 90 &&
              //DEL prev(calculatePokeathlonMedalistPokemonInRange(152, 251)) < 100
)

achievement(
    title = "Highly Outstanding Elite Never Naps", points = 100,
    description = "Get all 135 Pokémon from the Hoenn region registered as Medalist Pokémon.",
    id = 646776, badge = "80", set = 45860,
    trigger = checkSaveLoaded() //DEL &&
              //DEL getMapID() == 0x119 &&
              //DEL measured(calculatePokeathlonMedalistPokemonInRange(252, 386) == 135) &&
              //DEL prev(calculatePokeathlonMedalistPokemonInRange(252, 386)) >= 125 &&
              //DEL prev(calculatePokeathlonMedalistPokemonInRange(252, 386)) < 135
)

achievement(
    title = "Sports Icons Neutralize New Opponents Hastily", points = 100,
    description = "Get all 107 Pokémon from the Sinnoh region registered as Medalist Pokémon.",
    id = 646777, badge = "80", set = 45860,
    trigger = checkSaveLoaded() //DEL &&
              //DEL getMapID() == 0x119 &&
              //DEL measured(calculatePokeathlonMedalistPokemonInRange(387, 493) == 107) &&
              //DEL prev(calculatePokeathlonMedalistPokemonInRange(387, 493)) >= 97 &&
              //DEL prev(calculatePokeathlonMedalistPokemonInRange(387, 493)) < 107
)

achievement(
    title = "Not Even Mr. Mime's Barrier Can Stop Me", points = 10,
    description = "Get a record of 80.0 seconds or better in the single-player Pokéathlon event \"Hurdle Dash\" and finish the course.",
    id = 646892, badge = "80", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              getSavefileData("16-bit", 0xDCB0) >= 1 &&
              getSavefileData("16-bit", 0xDCB0) <= 960 &&
              prev(getSavefileData("16-bit", 0xDCB0)) > 960
)

achievement(
    title = "Cheeky Rivals and Sandy Cheeks", points = 10,
    description = "Get a record of 50 flags or better in the single-player Pokéathlon event \"Pennant Capture\" and finish the course.",
    id = 646893, badge = "80", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              getSavefileData("16-bit", 0xDCDC) >= 50 &&
              getSavefileData("16-bit", 0xDCDC) <= 1000 &&
              prev(getSavefileData("16-bit", 0xDCDC)) < 50
)

achievement(
    title = "Pushing In the Spotlight", points = 10,
    description = "Get a record of 60 points or better in the single-player Pokéathlon event \"Circle Push\" and finish the course.",
    id = 646894, badge = "80", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              getSavefileData("16-bit", 0xDD08) >= 60 &&
              getSavefileData("16-bit", 0xDD08) <= 1000 &&
              prev(getSavefileData("16-bit", 0xDD08)) < 60
)

achievement(
    title = "Breaking the Paws of Physics", points = 5,
    description = "Get a record of 130 pieces or better in the single-player Pokéathlon event \"Block Smash\" and finish the course.",
    id = 646895, badge = "80", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              getSavefileData("16-bit", 0xDD34) >= 130 &&
              getSavefileData("16-bit", 0xDD34) <= 1000 &&
              prev(getSavefileData("16-bit", 0xDD34)) < 130
)

achievement(
    title = "The Early Dog Catches the Disc", points = 5,
    description = "Get a record of 70 points or better in the single-player Pokéathlon event \"Disc Catch\" and finish the course.",
    id = 646896, badge = "80", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              getSavefileData("16-bit", 0xDD60) >= 70 &&
              getSavefileData("16-bit", 0xDD60) <= 1000 &&
              prev(getSavefileData("16-bit", 0xDD60)) < 70
)

achievement(
    title = "Bouncing Into the Lights of Glory", points = 5,
    description = "Get a record of 500 points or better in the single-player Pokéathlon event \"Lamp Jump\" and finish the course.",
    id = 646897, badge = "80", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              getSavefileData("16-bit", 0xDD8C) >= 500 &&
              getSavefileData("16-bit", 0xDD8C) <= 5000 &&
              prev(getSavefileData("16-bit", 0xDD8C)) < 500
)

achievement(
    title = "I Would Walk 10 Miles To Be The Mon", points = 10,
    description = "Get a record of 16.0 laps or better in the single-player Pokéathlon event \"Relay Run\" and finish the course.",
    id = 646898, badge = "80", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              getSavefileData("16-bit", 0xDDB8) >= 16384 &&
              getSavefileData("16-bit", 0xDDB8) <= 50000 &&
              prev(getSavefileData("16-bit", 0xDDB8)) < 16384
)

achievement(
    title = "Power Beyond the Boundaries", points = 5,
    description = "Get a record of 100 points or better in the single-player Pokéathlon event \"Ring Drop\" and finish the course.",
    id = 646899, badge = "80", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              getSavefileData("16-bit", 0xDDE4) >= 100 &&
              getSavefileData("16-bit", 0xDDE4) <= 1000 &&
              prev(getSavefileData("16-bit", 0xDDE4)) < 100
)

achievement(
    title = "Strike Outs in the Cold", points = 5,
    description = "Get a record of 55 hits or better in the single-player Pokéathlon event \"Snow Throw\" and finish the course.",
    id = 646900, badge = "80", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              getSavefileData("16-bit", 0xDE10) >= 100 &&
              getSavefileData("16-bit", 0xDE10) <= 1000 &&
              prev(getSavefileData("16-bit", 0xDE10)) < 100
)

achievement(
    title = "Triple Hat-Trick Strikers", points = 3,
    description = "Get a record of 9 points or better in the single-player Pokéathlon event \"Goal Roll\" and finish the course.",
    id = 646901, badge = "80", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              getSavefileData("16-bit", 0xDE3C) >= 9 &&
              getSavefileData("16-bit", 0xDE3C) <= 1000 &&
              prev(getSavefileData("16-bit", 0xDE3C)) < 9
)

achievement(
    title = "Professional Team Captain", points = 5,
    description = "Obtain all 10 Potential Crowns in the Pokéathlon Dome by beating the master record of every Pokéathlon discipline.",
    id = 125522, badge = "138587", set = 45860,
    trigger = checkSaveLoaded() //DEL &&
              //DEL getMapID() == 0x119 &&
              //DEL (measured(calculatePokeathlonBeatenMasterRecords(), 
              //DEL           getSavefileData("8-bit", 0x1000) != 0x00 &&
              //DEL                  once(getMusicID() == 0x3F0)) &&
              //DEL  unless(getMusicID() == 0x3F0 &&
              //DEL         calculatePokeathlonBeatenMasterRecords()) ||
              //DEL (pseudoImpossibleCondition() &&
              //DEL  never(getContextPointer() == 0x00000000) &&
              //DEL  never(getSavefileData("8-bit", 0x1000) == 0x00)))
)

achievement(
    title = "Greatest Pokéathlete of All Time", points = 50,
    description = "Obtain all 10 Friendship Crowns in the Pokéathlon Dome by having a total of 4.500 Pokéathlon Points.",
    id = 125523, badge = "138585", set = 45860,
    trigger = checkSaveLoaded() //DEL &&
              //DEL getMapID() == 0x119 &&
              //DEL measured(calculatePokeathlonFriendshipPoints() >= 4500) &&
              //DEL prev(calculatePokeathlonFriendshipPoints()) >= 4000 &&
              //DEL prev(calculatePokeathlonFriendshipPoints()) < 4500
)

achievement(
    title = "Run, Forretress! Run!", points = 5,
    description = "Obtain the golden running shoes trophy in the Pokéathlon Dome by dashing a total of 5.000 times in the event \"Hurdle Dash\".",
    id = 647644, badge = "80", set = 45860,
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
    id = 647815, badge = "80", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              measured(getSavefileData("32-bit", 0xE4E8) == 50) &&
                  prev(getSavefileData("32-bit", 0xE4E8)) == 49
)

achievement(
    title = "What's the Matter, Trainer?", points = 2,
    description = "Obtain the golden flag trophy in the Pokéathlon Dome by switching Pokémon a total of 200 times.",
    id = 647862, badge = "80", set = 45860,
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
    id = 847863, badge = "80", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              measured(getSavefileData("32-bit", 0xE4EC) == 100) &&
                  prev(getSavefileData("32-bit", 0xE4EC)) == 99
)
achievement(
    title = "Star of the Dome", points = 25,
    description = "Obtain the Poké Ball trophy in the Pokéathlon Dome by winning every event at least 50 times.",
    id = 0, badge = "138587", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              (measured(calculatePokeathlon50WinsPerEvent(), 
                        when = getSavefileData("8-bit", 0x1000) != 0x00 &&
                               once(getMusicID() == 0x3F0)) &&
               unless(getMusicID() == 0x3F0 &&
                      calculatePokeathlon50WinsPerEvent()) ||
              (pseudoImpossibleCondition() &&
               never(getContextPointer() == 0x00000000) &&
               never(getSavefileData("8-bit", 0x1000) == 0x00)))
)

//--------------------------------------------------
// Pokéathlon - Leaderboards

leaderboard(
    id = 19141, set = 45860, title = "Hurdle Dash",
    description = "Least time needed in a single event.",
    start  = always_false() && checkSaveLoaded() &&
             checkHeapLoaded(92) &&
             getMapID() == 0x119 &&
             getPokeathlonPhaseState() == 0x12 &&
             getPokeathlonResultState() == 0x02 &&
             prev(getPokeathlonResultState()) == 0x01 &&
             ((getPokeathlonCurrentPhase() == 0x00 && getPokeathlonMinigameIDInSlot(0) == 0x00) ||
              (getPokeathlonCurrentPhase() == 0x01 && getPokeathlonMinigameIDInSlot(1) == 0x00) ||
              (getPokeathlonCurrentPhase() == 0x02 && getPokeathlonMinigameIDInSlot(2) == 0x00) ||
              (getPokeathlonCurrentPhase() == 0x03 && getPokeathlonMinigameIDInSlot(3) == 0x00)),
    cancel = always_false(),
    submit = always_true(),
    value  = getPokeathlonMinigameScore() / 3,
    format = "FIXED1",
    lower_is_better = true
)

leaderboard(
    id = 19143, set = 45860, title = "Pennant Capture",
    description = "Most pennants captured in a single event.",
    start  = checkSaveLoaded() &&
             checkHeapLoaded(92) &&
             getMapID() == 0x119 &&
             getPokeathlonPhaseState() == 0x12 &&
             getPokeathlonResultState() == 0x02 &&
             prev(getPokeathlonResultState()) == 0x01 &&
             ((getPokeathlonCurrentPhase() == 0x00 && getPokeathlonMinigameIDInSlot(0) == 0x01) ||
              (getPokeathlonCurrentPhase() == 0x01 && getPokeathlonMinigameIDInSlot(1) == 0x01) ||
              (getPokeathlonCurrentPhase() == 0x02 && getPokeathlonMinigameIDInSlot(2) == 0x01) ||
              (getPokeathlonCurrentPhase() == 0x03 && getPokeathlonMinigameIDInSlot(3) == 0x01)),
    cancel = always_false(),
    submit = always_true(),
    value  = getPokeathlonMinigameScore(),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 19138, set = 45860, title = "Circle Push",
    description = "Most points collected in a single event.",
    start  = always_false() && checkSaveLoaded() &&
             checkHeapLoaded(92) &&
             getMapID() == 0x119 &&
             getPokeathlonPhaseState() == 0x12 &&
             getPokeathlonResultState() == 0x02 &&
             prev(getPokeathlonResultState()) == 0x01 &&
             ((getPokeathlonCurrentPhase() == 0x00 && getPokeathlonMinigameIDInSlot(0) == 0x02) ||
              (getPokeathlonCurrentPhase() == 0x01 && getPokeathlonMinigameIDInSlot(1) == 0x02) ||
              (getPokeathlonCurrentPhase() == 0x02 && getPokeathlonMinigameIDInSlot(2) == 0x02) ||
              (getPokeathlonCurrentPhase() == 0x03 && getPokeathlonMinigameIDInSlot(3) == 0x02)),
    cancel = always_false(),
    submit = always_true(),
    value  = getPokeathlonMinigameScore() / 3,
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 19137, set = 45860, title = "Block Smash",
    description = "Most blocks destroyed in a single event.",
    start  = always_false() && checkSaveLoaded() &&
             checkHeapLoaded(92) &&
             getMapID() == 0x119 &&
             getPokeathlonPhaseState() == 0x12 &&
             getPokeathlonResultState() == 0x02 &&
             prev(getPokeathlonResultState()) == 0x01 &&
             ((getPokeathlonCurrentPhase() == 0x00 && getPokeathlonMinigameIDInSlot(0) == 0x03) ||
              (getPokeathlonCurrentPhase() == 0x01 && getPokeathlonMinigameIDInSlot(1) == 0x03) ||
              (getPokeathlonCurrentPhase() == 0x02 && getPokeathlonMinigameIDInSlot(2) == 0x03) ||
              (getPokeathlonCurrentPhase() == 0x03 && getPokeathlonMinigameIDInSlot(3) == 0x03)),
    cancel = always_false(),
    submit = always_true(),
    value  = getPokeathlonMinigameScore() / 3,
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 19139, set = 45860, title = "Disc Catch",
    description = "Most points collected in a single event.",
    start  = always_false() && checkSaveLoaded() &&
             checkHeapLoaded(92) &&
             getMapID() == 0x119 &&
             getPokeathlonPhaseState() == 0x12 &&
             getPokeathlonResultState() == 0x02 &&
             prev(getPokeathlonResultState()) == 0x01 &&
             ((getPokeathlonCurrentPhase() == 0x00 && getPokeathlonMinigameIDInSlot(0) == 0x04) ||
              (getPokeathlonCurrentPhase() == 0x01 && getPokeathlonMinigameIDInSlot(1) == 0x04) ||
              (getPokeathlonCurrentPhase() == 0x02 && getPokeathlonMinigameIDInSlot(2) == 0x04) ||
              (getPokeathlonCurrentPhase() == 0x03 && getPokeathlonMinigameIDInSlot(3) == 0x04)),
    cancel = always_false(),
    submit = always_true(),
    value  = getPokeathlonMinigameScore() / 3,
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 19142, set = 45860, title = "Lamp Jump",
    description = "Most points collected in a single event.",
    start  = always_false() && checkSaveLoaded() &&
             checkHeapLoaded(92) &&
             getMapID() == 0x119 &&
             getPokeathlonPhaseState() == 0x12 &&
             getPokeathlonResultState() == 0x02 &&
             prev(getPokeathlonResultState()) == 0x01 &&
             ((getPokeathlonCurrentPhase() == 0x00 && getPokeathlonMinigameIDInSlot(0) == 0x05) ||
              (getPokeathlonCurrentPhase() == 0x01 && getPokeathlonMinigameIDInSlot(1) == 0x05) ||
              (getPokeathlonCurrentPhase() == 0x02 && getPokeathlonMinigameIDInSlot(2) == 0x05) ||
              (getPokeathlonCurrentPhase() == 0x03 && getPokeathlonMinigameIDInSlot(3) == 0x05)),
    cancel = always_false(),
    submit = always_true(),
    value  = getPokeathlonMinigameScore() / 3,
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 19144, set = 45860, title = "Relay Run",
    description = "Most distance ran in a single event.",
    start  = checkSaveLoaded() &&
             checkHeapLoaded(92) &&
             getMapID() == 0x119 &&
             getPokeathlonPhaseState() == 0x12 &&
             getPokeathlonResultState() == 0x02 &&
             prev(getPokeathlonResultState()) == 0x01 &&
             ((getPokeathlonCurrentPhase() == 0x00 && getPokeathlonMinigameIDInSlot(0) == 0x06) ||
              (getPokeathlonCurrentPhase() == 0x01 && getPokeathlonMinigameIDInSlot(1) == 0x06) ||
              (getPokeathlonCurrentPhase() == 0x02 && getPokeathlonMinigameIDInSlot(2) == 0x06) ||
              (getPokeathlonCurrentPhase() == 0x03 && getPokeathlonMinigameIDInSlot(3) == 0x06)),
    cancel = always_false(),
    submit = always_true(),
    value  = getPokeathlonMinigameScore() / 102.4,
    format = "FIXED1",
    lower_is_better = false
)

leaderboard(
    id = 19145, set = 45860, title = "Ring Drop",
    description = "Most points collected in a single event.",
    start  = checkSaveLoaded() &&
             checkHeapLoaded(92) &&
             getMapID() == 0x119 &&
             getPokeathlonPhaseState() == 0x12 &&
             getPokeathlonResultState() == 0x02 &&
             prev(getPokeathlonResultState()) == 0x01 &&
             ((getPokeathlonCurrentPhase() == 0x00 && getPokeathlonMinigameIDInSlot(0) == 0x07) ||
              (getPokeathlonCurrentPhase() == 0x01 && getPokeathlonMinigameIDInSlot(1) == 0x07) ||
              (getPokeathlonCurrentPhase() == 0x02 && getPokeathlonMinigameIDInSlot(2) == 0x07) ||
              (getPokeathlonCurrentPhase() == 0x03 && getPokeathlonMinigameIDInSlot(3) == 0x07)),
    cancel = always_false(),
    submit = always_true(),
    value  = getPokeathlonMinigameScore(),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 19146, set = 45860, title = "Snow Throw",
    description = "Most Pokémon hit in a single event.",
    start  = checkSaveLoaded() &&
             checkHeapLoaded(92) &&
             getMapID() == 0x119 &&
             getPokeathlonPhaseState() == 0x12 &&
             getPokeathlonResultState() == 0x02 &&
             prev(getPokeathlonResultState()) == 0x01 &&
             ((getPokeathlonCurrentPhase() == 0x00 && getPokeathlonMinigameIDInSlot(0) == 0x08) ||
              (getPokeathlonCurrentPhase() == 0x01 && getPokeathlonMinigameIDInSlot(1) == 0x08) ||
              (getPokeathlonCurrentPhase() == 0x02 && getPokeathlonMinigameIDInSlot(2) == 0x08) ||
              (getPokeathlonCurrentPhase() == 0x03 && getPokeathlonMinigameIDInSlot(3) == 0x08)),
    cancel = always_false(),
    submit = always_true(),
    value  = getPokeathlonMinigameScore(),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 19140, set = 45860, title = "Goal Roll",
    description = "Most points collected in a single event.",
    start  = checkSaveLoaded() &&
             checkHeapLoaded(92) &&
             getMapID() == 0x119 &&
             getPokeathlonPhaseState() == 0x12 &&
             getPokeathlonResultState() == 0x02 &&
             prev(getPokeathlonResultState()) == 0x01 &&
             ((getPokeathlonCurrentPhase() == 0x00 && getPokeathlonMinigameIDInSlot(0) == 0x09) ||
              (getPokeathlonCurrentPhase() == 0x01 && getPokeathlonMinigameIDInSlot(1) == 0x09) ||
              (getPokeathlonCurrentPhase() == 0x02 && getPokeathlonMinigameIDInSlot(2) == 0x09) ||
              (getPokeathlonCurrentPhase() == 0x03 && getPokeathlonMinigameIDInSlot(3) == 0x09)),
    cancel = always_false(),
    submit = always_true(),
    value  = getPokeathlonMinigameScore(),
    format = "VALUE",
    lower_is_better = false
)
