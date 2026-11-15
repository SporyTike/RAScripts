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

function getNationalIDOfPokemon(pokemonName) {
    for nationalID in nationalIDs {
        if (nationalID[1] == pokemonName) {
            return nationalID[0]
        }
    }
    assert(0 == 1, "Could not find National ID for Pokémon: " + pokemonName)
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

function getCoordinateX() {
    return getSavefileData("32-bit", 0x124C)
}

function getCoordinateY() {
    return getSavefileData("32-bit", 0x1250)
}

function getMapID() {
    return getSavefileData("32-bit", 0x1244)
}

function getMusicID() {
    return word(tbyte(0x000BA8) + 0xBECF4)
}

function getHeapData18(heapIndex, memorySize, offset) {
    headOffset = remembered(byte(tbyte(getContextPointer() + 0xBFD34) + heapIndex) * 0x04)
    address = remembered(tbyte(tbyte(tbyte(getContextPointer() + 0xBFD24) + headOffset) + 0x18))
    address = address + offset
    return getData(memorySize, address)
}

function getHeapData30(heapIndex, memorySize, offset) {
    headOffset = remembered(byte(tbyte(getContextPointer() + 0xBFD34) + heapIndex) * 0x04)
    address = remembered(tbyte(tbyte(tbyte(getContextPointer() + 0xBFD24) + headOffset) + 0x30))
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

function getField2DataStateID() {
    return getHeapData30(11, "32-bit", 0x2C)
}

function getField2DataSubStateID() {
    return getHeapData30(11, "32-bit", 0x34)
}

function getPokemonDataBlockOrderID(slot) {
    pokemonAddress  = 0xA8 + ((slot - 1) * 0xEC)
    personalityValue = remembered(getSavefileData("32-bit", pokemonAddress + 0x00))
    return ((personalityValue & 0x3E000) / 8192) % 24
}

function getPokemonDataAbility(encryptState, slot, block) {
    blockStart  = 0x08
    blockTarget = 0x14
    blockOffset = blockTarget - blockStart + ((block - 1) * 0x20)
    pokemonAddress  = 0xA8 + ((slot - 1) * 0xEC)
    pokemonSeed = remembered(getSavefileData("16-bit", pokemonAddress + 0x06))
    pokemonWord = 0
    if (encryptState == "encrypted") {
        for word in range (0, blockOffset / 2) {
            pokemonSeed     = remembered(pokemonSeed * 0x41C64E6D + 0x6073)
        }
        pokemonSeed     = pokemonSeed / 0x10000
        pokemonWord     = getSavefileData("16-bit", pokemonAddress + 0x08 + blockOffset) ^ pokemonSeed

    } else
    if (encryptState == "decrypted") {
        pokemonWord     = getSavefileData("16-bit", pokemonAddress + 0x08 + blockOffset)
    }
    return pokemonWord / 0x100
}

function getPokemonDataPokemonID(encryptState, slot, block) {
    blockStart  = 0x08
    blockTarget = 0x08
    blockOffset = blockTarget - blockStart + ((block - 1) * 0x20)
    pokemonAddress  = 0xA8 + ((slot - 1) * 0xEC)
    pokemonSeed = remembered(getSavefileData("16-bit", pokemonAddress + 0x06))
    pokemonWord = 0
    if (encryptState == "encrypted") {
        for word in range (0, blockOffset / 2) {
            pokemonSeed     = remembered(pokemonSeed * 0x41C64E6D + 0x6073)
        }
        pokemonSeed     = pokemonSeed / 0x10000
        pokemonWord     = getSavefileData("16-bit", pokemonAddress + 0x08 + blockOffset) ^ pokemonSeed

    } else
    if (encryptState == "decrypted") {
        pokemonWord     = getSavefileData("16-bit", pokemonAddress + 0x08 + blockOffset)
    }
    return pokemonWord
}

function calculatePokedexCapturedDiplomaRegional() {
    sum = 0
    for nationalID in range (1, 251) {
        bitOffset  = (nationalID - 1) % 8
        byteOffset = (nationalID - 1) / 8
        if (nationalID != getNationalIDOfPokemon("Mew") && 
            nationalID != getNationalIDOfPokemon("Celebi")) {
                sum = sum + getSavefileDataRemember("Bit" + bitOffset, 0x12CC + byteOffset)
        }
    }
    return sum
}

function calculatePokedexCapturedDiplomaNational() {
    sum = 0
    for nationalID in range (1, 493) {
        bitOffset  = (nationalID - 1) % 8
        byteOffset = (nationalID - 1) / 8
        if (nationalID != getNationalIDOfPokemon("Mew") && 
            nationalID != getNationalIDOfPokemon("Celebi") && 
            nationalID != getNationalIDOfPokemon("Jirachi") && 
            nationalID != getNationalIDOfPokemon("Deoxys") && 
            nationalID != getNationalIDOfPokemon("Phione") && 
            nationalID != getNationalIDOfPokemon("Manaphy") && 
            nationalID != getNationalIDOfPokemon("Darkrai") && 
            nationalID != getNationalIDOfPokemon("Shaymin") && 
            nationalID != getNationalIDOfPokemon("Arceus")) {
                sum = sum + getSavefileDataRemember("Bit" + bitOffset, 0x12CC + byteOffset)
        }
    }
    return sum
}

function calculatePokedexCapturedNational() {
    sum = 0
    for nationalID in range (1, 493) {
        bitOffset  = (nationalID - 1) % 8
        byteOffset = (nationalID - 1) / 8
        sum = sum + getSavefileDataRemember("Bit" + bitOffset, 0x12CC + byteOffset)
    }
    return sum
}

function calculatePokedexSeenGenders() {
    sum = 0
    for nationalID in pokemonWithGenderDifference {
        bitOffset  = (nationalID - 1) % 8
        byteOffset = (nationalID - 1) / 8
        sum = sum - getSavefileDataRemember("Bit" + bitOffset, 0x134C + byteOffset) * getSavefileDataRemember("Bit" + bitOffset, 0x138C + byteOffset)
                  - getSavefileDataRemember("Bit" + bitOffset, 0x134C + byteOffset) * getSavefileDataRemember("Bit" + bitOffset, 0x138C + byteOffset)
                  + getSavefileDataRemember("Bit" + bitOffset, 0x134C + byteOffset) + getSavefileDataRemember("Bit" + bitOffset, 0x138C + byteOffset)
    }
    return sum
}

function getSafariZoneAreaLevel(areaID) {
    return getSavefileDataRemember("8-bit", 0xC428 + areaID)
}

function calculateDiscoveredFormsDeoxys() {
    return 4
         - getSavefileData("Bit3", 0x130B)
         - getSavefileData("Bit7", 0x130B)
         - getSavefileData("Bit3", 0x134B)
         - getSavefileData("Bit7", 0x134B)
}

function calculateDiscoveredFormsRotom() {
    return 5
         - getSavefileData("Bit5", 0x1600) * getSavefileData("Bit4", 0x1600)
         - getSavefileData("Bit0", 0x1601) * getSavefileData("Bit7", 0x1600)
         - getSavefileData("Bit3", 0x1601) * getSavefileData("Bit2", 0x1601)
         - getSavefileData("Bit6", 0x1601) * getSavefileData("Bit5", 0x1601)
         - getSavefileData("Bit1", 0x1602) * getSavefileData("Bit0", 0x1602)
}

function getShayminFormsInPokedex() {
    return getSavefileData("Bit0", 0x1604)
         + getSavefileData("Bit1", 0x1604) * 0x02
}

function getMinigameSwalotPlopPlayerScore() {
    return dword(getHeapData18(0x6A, "24-bit", 0x54) + 0x18)
}

function getMinigameSwalotPlopState() {
    return getField2DataSubStateID()
}

function getMinigameMimeJrTopPlayerScore() {
    return getHeapData18(0x71, "24-bit", 0x44)
}

function getMinigameMimeJrTopState() {
    return getField2DataSubStateID()
}

function getMinigameWobbuffetPopPlayerScore() {
    return dword(tbyte(getHeapData18(0x75, "24-bit", 0x48) + 0x1C) + 0x3848)
}

function getMinigameWobbuffetPopState() {
    return dword(tbyte(getHeapData18(0x75, "24-bit", 0x48) + 0x1C) + 0x20)
}

function checkVoltOrbFlipLevelComplete() {
    return word(getHeapData18(0xA0, "24-bit", 0x264) + 0x144) == word(getHeapData18(0xA0, "24-bit", 0x264) + 0x146) &&
           dword(getHeapData18(0xA0, "24-bit", 0x264) + 0x140) == 0x02 &&
           prev(dword(getHeapData18(0xA0, "24-bit", 0x264) + 0x140)) != 0x02
}

function getVoltorbFlipLevel() {
    return byte(getHeapData18(0xA0, "24-bit", 0x264) + 0x14D)
}

function getBattleHallSpecialCharacter() {
    return getSavefileDataRemember("16-bit", 0xE36)
}

function getBattleHallDifferentRecords() {
    return getSavefileDataRemember("16-bit", 0xDF4)
}

function checkTalkingToNPCID(npcID) {
    return getContextPointer() != 0x00 &&
           tbyte(getContextPointer() + 0xC28F8) != 0x00 &&
           tbyte(tbyte(getContextPointer() + 0xC28F8) + 0x10) != 0x00 &&
           tbyte(tbyte(tbyte(getContextPointer() + 0xC28F8) + 0x10) + 0x0C) != 0x00 &&
           tbyte(tbyte(tbyte(tbyte(getContextPointer() + 0xC28F8) + 0x10) + 0x0C) + 0x2C) != 0x00 &&
           word(tbyte(tbyte(tbyte(tbyte(getContextPointer() + 0xC28F8) + 0x10) + 0x0C) + 0x2C) + 0x10) == npcID
}

function checkTalkingToNPCIDChanged() {
    return tbyte(tbyte(getContextPointer() + 0xC28F8) + 0x10) != prev(tbyte(tbyte(getContextPointer() + 0xC28F8) + 0x10))
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
    return getHeapData18(0x5C, "32-bit", 0x29C)
}

function getPokeathlonCurrentPhase() {
    return getHeapData18(0x5C, "32-bit", 0x210)
}

function getPokeathlonDataCard(dataCardNumber) {
    dataCardBit    = (dataCardNumber - 1) % 8
    dataCardOffset = (dataCardNumber - 1) / 8
    return getSavefileDataRemember("Bit" + dataCardBit, 0xE55C + dataCardOffset)
}

function getPokeathlonMinigameID() {
    return getHeapData18(0x5C, "8-bit", 0x208 + getPokeathlonCurrentPhase())
}

function getPokeathlonMinigameScore() {
    return getHeapData18(0x5C, "16-bit", 0xD4A)
}

function getPokeathlonPhaseState() {
    return getHeapData18(0x5C, "8-bit", 0x3EA)
}

function getPokeathlonResultState() {
    return getHeapData18(0x5C, "8-bit", 0x3F2)
} 

//--------------------------------------------------
// Arrays and Dictionaries

nationalIDs = [
    [001, "Bulbasaur"],
    [002, "Ivysaur"],
    [003, "Venusaur"],
    [004, "Charmander"],
    [005, "Charmeleon"],
    [006, "Charizard"],
    [007, "Squirtle"],
    [008, "Wartortle"],
    [009, "Blastoise"],
    [010, "Caterpie"],
    [011, "Metapod"],
    [012, "Butterfree"],
    [013, "Weedle"],
    [014, "Kakuna"],
    [015, "Beedrill"],
    [016, "Pidgey"],
    [017, "Pidgeotto"],
    [018, "Pidgeot"],
    [019, "Rattata"],
    [020, "Raticate"],
    [021, "Spearow"],
    [022, "Fearow"],
    [023, "Ekans"],
    [024, "Arbok"],
    [025, "Pikachu"],
    [026, "Raichu"],
    [027, "Sandshrew"],
    [028, "Sandslash"],
    [029, "Nidoran♀"],
    [030, "Nidorina"],
    [031, "Nidoqueen"],
    [032, "Nidoran♂"],
    [033, "Nidorino"],
    [034, "Nidoking"],
    [035, "Clefairy"],
    [036, "Clefable"],
    [037, "Vulpix"],
    [038, "Ninetales"],
    [039, "Jigglypuff"],
    [040, "Wigglytuff"],
    [041, "Zubat"],
    [042, "Golbat"],
    [043, "Oddish"],
    [044, "Gloom"],
    [045, "Vileplume"],
    [046, "Paras"],
    [047, "Parasect"],
    [048, "Venonat"],
    [049, "Venomoth"],
    [050, "Diglett"],
    [051, "Dugtrio"],
    [052, "Meowth"],
    [053, "Persian"],
    [054, "Psyduck"],
    [055, "Golduck"],
    [056, "Mankey"],
    [057, "Primeape"],
    [058, "Growlithe"],
    [059, "Arcanine"],
    [060, "Poliwag"],
    [061, "Poliwhirl"],
    [062, "Poliwrath"],
    [063, "Abra"],
    [064, "Kadabra"],
    [065, "Alakazam"],
    [066, "Machop"],
    [067, "Machoke"],
    [068, "Machamp"],
    [069, "Bellsprout"],
    [070, "Weepinbell"],
    [071, "Victreebel"],
    [072, "Tentacool"],
    [073, "Tentacruel"],
    [074, "Geodude"],
    [075, "Graveler"],
    [076, "Golem"],
    [077, "Ponyta"],
    [078, "Rapidash"],
    [079, "Slowpoke"],
    [080, "Slowbro"],
    [081, "Magnemite"],
    [082, "Magneton"],
    [083, "Farfetch'd"],
    [084, "Doduo"],
    [085, "Dodrio"],
    [086, "Seel"],
    [087, "Dewgong"],
    [088, "Grimer"],
    [089, "Muk"],
    [090, "Shellder"],
    [091, "Cloyster"],
    [092, "Gastly"],
    [093, "Haunter"],
    [094, "Gengar"],
    [095, "Onix"],
    [096, "Drowzee"],
    [097, "Hypno"],
    [098, "Krabby"],
    [099, "Kingler"],
    [100, "Voltorb"],
    [101, "Electrode"],
    [102, "Exeggcute"],
    [103, "Exeggutor"],
    [104, "Cubone"],
    [105, "Marowak"],
    [106, "Hitmonlee"],
    [107, "Hitmonchan"],
    [108, "Lickitung"],
    [109, "Koffing"],
    [110, "Weezing"],
    [111, "Rhyhorn"],
    [112, "Rhydon"],
    [113, "Chansey"],
    [114, "Tangela"],
    [115, "Kangaskhan"],
    [116, "Horsea"],
    [117, "Seadra"],
    [118, "Goldeen"],
    [119, "Seaking"],
    [120, "Staryu"],
    [121, "Starmie"],
    [122, "Mr. Mime"],
    [123, "Scyther"],
    [124, "Jynx"],
    [125, "Electabuzz"],
    [126, "Magmar"],
    [127, "Pinsir"],
    [128, "Tauros"],
    [129, "Magikarp"],
    [130, "Gyarados"],
    [131, "Lapras"],
    [132, "Ditto"],
    [133, "Eevee"],
    [134, "Vaporeon"],
    [135, "Jolteon"],
    [136, "Flareon"],
    [137, "Porygon"],
    [138, "Omanyte"],
    [139, "Omastar"],
    [140, "Kabuto"],
    [141, "Kabutops"],
    [142, "Aerodactyl"],
    [143, "Snorlax"],
    [144, "Articuno"],
    [145, "Zapdos"],
    [146, "Moltres"],
    [147, "Dratini"],
    [148, "Dragonair"],
    [149, "Dragonite"],
    [150, "Mewtwo"],
    [151, "Mew"],
    [152, "Chikorita"],
    [153, "Bayleef"],
    [154, "Meganium"],
    [155, "Cyndaquil"],
    [156, "Quilava"],
    [157, "Typhlosion"],
    [158, "Totodile"],
    [159, "Croconaw"],
    [160, "Feraligatr"],
    [161, "Sentret"],
    [162, "Furret"],
    [163, "Hoothoot"],
    [164, "Noctowl"],
    [165, "Ledyba"],
    [166, "Ledian"],
    [167, "Spinarak"],
    [168, "Ariados"],
    [169, "Crobat"],
    [170, "Chinchou"],
    [171, "Lanturn"],
    [172, "Pichu"],
    [173, "Cleffa"],
    [174, "Igglybuff"],
    [175, "Togepi"],
    [176, "Togetic"],
    [177, "Natu"],
    [178, "Xatu"],
    [179, "Mareep"],
    [180, "Flaaffy"],
    [181, "Ampharos"],
    [182, "Bellossom"],
    [183, "Marill"],
    [184, "Azumarill"],
    [185, "Sudowoodo"],
    [186, "Politoed"],
    [187, "Hoppip"],
    [188, "Skiploom"],
    [189, "Jumpluff"],
    [190, "Aipom"],
    [191, "Sunkern"],
    [192, "Sunflora"],
    [193, "Yanma"],
    [194, "Wooper"],
    [195, "Quagsire"],
    [196, "Espeon"],
    [197, "Umbreon"],
    [198, "Murkrow"],
    [199, "Slowking"],
    [200, "Misdreavous"],
    [201, "Unown"],
    [202, "Wobbuffet"],
    [203, "Girafarig"],
    [204, "Pineco"],
    [205, "Forretress"],
    [206, "Dunsparce"],
    [207, "Gligar"],
    [208, "Steelix"],
    [209, "Snubbull"],
    [210, "Granbull"],
    [211, "Qwilfish"],
    [212, "Scizor"],
    [213, "Shuckle"],
    [214, "Heracross"],
    [215, "Sneasel"],
    [216, "Teddiursa"],
    [217, "Ursaring"],
    [218, "Slugma"],
    [219, "Magcargo"],
    [220, "Swinub"],
    [221, "Piloswine"],
    [222, "Corsola"],
    [223, "Remoraid"],
    [224, "Octillery"],
    [225, "Delibird"],
    [226, "Mantine"],
    [227, "Skarmory"],
    [228, "Houndour"],
    [229, "Houndoom"],
    [230, "Kingdra"],
    [231, "Phanpy"],
    [232, "Donphan"],
    [233, "Porygon2"],
    [234, "Stantler"],
    [235, "Smeargle"],
    [236, "Tyrogue"],
    [237, "Hitmontop"],
    [238, "Smoochum"],
    [239, "Elekid"],
    [240, "Magby"],
    [241, "Miltank"],
    [242, "Blissey"],
    [243, "Raikou"],
    [244, "Entei"],
    [245, "Suicune"],
    [246, "Larvitar"],
    [247, "Pupitar"],
    [248, "Tyranitar"],
    [249, "Lugia"],
    [250, "Ho-oh"],
    [251, "Celebi"],
    [252, "Treecko"],
    [253, "Grovyle"],
    [254, "Sceptile"],
    [255, "Torchic"],
    [256, "Combusken"],
    [257, "Blaziken"],
    [258, "Mudkip"],
    [259, "Marshtomp"],
    [260, "Swampert"],
    [261, "Poochyena"],
    [262, "Mightyena"],
    [263, "Zigzagoon"],
    [264, "Linoone"],
    [265, "Wurmple"],
    [266, "Silcoon"],
    [267, "Beautifly"],
    [268, "Cascoon"],
    [269, "Dustox"],
    [270, "Lotad"],
    [271, "Lombre"],
    [272, "Ludicolo"],
    [273, "Seedot"],
    [274, "Nuzleaf"],
    [275, "Shiftry"],
    [276, "Taillow"],
    [277, "Swellow"],
    [278, "Wingull"],
    [279, "Pelipper"],
    [280, "Ralts"],
    [281, "Kirlia"],
    [282, "Gardevoir"],
    [283, "Surskit"],
    [284, "Masquerain"],
    [285, "Shroomish"],
    [286, "Breloom"],
    [287, "Slakoth"],
    [288, "Vigoroth"],
    [289, "Slaking"],
    [290, "Nincada"],
    [291, "Ninjask"],
    [292, "Shedinja"],
    [293, "Whismur"],
    [294, "Loudred"],
    [295, "Exploud"],
    [296, "Makuhita"],
    [297, "Hariyama"],
    [298, "Azurill"],
    [299, "Nosepass"],
    [300, "Skitty"],
    [301, "Delcatty"],
    [302, "Sableye"],
    [303, "Mawile"],
    [304, "Aron"],
    [305, "Lairon"],
    [306, "Aggron"],
    [307, "Meditite"],
    [308, "Medicham"],
    [309, "Electrike"],
    [310, "Manectric"],
    [311, "Plusle"],
    [312, "Minun"],
    [313, "Volbeat"],
    [314, "Illumise"],
    [315, "Roselia"],
    [316, "Gulpin"],
    [317, "Swalot"],
    [318, "Carvanha"],
    [319, "Sharpedo"],
    [320, "Wailmer"],
    [321, "Wailord"],
    [322, "Numel"],
    [323, "Camerupt"],
    [324, "Torkoal"],
    [325, "Spoink"],
    [326, "Grumpig"],
    [327, "Spinda"],
    [328, "Trapinch"],
    [329, "Vibrava"],
    [330, "Flygon"],
    [331, "Cacnea"],
    [332, "Cacturne"],
    [333, "Swablu"],
    [334, "Altaria"],
    [335, "Zangoose"],
    [336, "Seviper"],
    [337, "Lunatone"],
    [338, "Solrock"],
    [339, "Barboach"],
    [340, "Whiscash"],
    [341, "Corphish"],
    [342, "Crawdaunt"],
    [343, "Baltoy"],
    [344, "Claydol"],
    [345, "Lileep"],
    [346, "Cradily"],
    [347, "Anorith"],
    [348, "Armaldo"],
    [349, "Feebas"],
    [350, "Milotic"],
    [351, "Castform"],
    [352, "Kecleon"],
    [353, "Shuppet"],
    [354, "Banette"],
    [355, "Duskull"],
    [356, "Dusclops"],
    [357, "Tropius"],
    [358, "Chimecho"],
    [359, "Absol"],
    [360, "Wynaut"],
    [361, "Snorunt"],
    [362, "Glalie"],
    [363, "Spheal"],
    [364, "Sealeo"],
    [365, "Walrein"],
    [366, "Clamperl"],
    [367, "Huntail"],
    [368, "Gorebyss"],
    [369, "Relicanth"],
    [370, "Luvdisc"],
    [371, "Bagon"],
    [372, "Shelgon"],
    [373, "Salamence"],
    [374, "Beldum"],
    [375, "Metang"],
    [376, "Metagross"],
    [377, "Regirock"],
    [378, "Regice"],
    [379, "Registeel"],
    [380, "Latias"],
    [381, "Latios"],
    [382, "Kyogre"],
    [383, "Groudon"],
    [384, "Rayquaza"],
    [385, "Jirachi"],
    [386, "Deoxys"],
    [387, "Turtwig"],
    [388, "Grotle"],
    [389, "Torterra"],
    [390, "Chimchar"],
    [391, "Monferno"],
    [392, "Infernape"],
    [393, "Piplup"],
    [394, "Prinplup"],
    [395, "Empoleon"],
    [396, "Starly"],
    [397, "Staravia"],
    [398, "Staraptor"],
    [399, "Bidoof"],
    [400, "Bibarel"],
    [401, "Kricketot"],
    [402, "Kricketune"],
    [403, "Shinx"],
    [404, "Luxio"],
    [405, "Luxray"],
    [406, "Budew"],
    [407, "Roserade"],
    [408, "Cranidos"],
    [409, "Rampardos"],
    [410, "Shieldon"],
    [411, "Bastiodon"],
    [412, "Burmy"],
    [413, "Wormadam"],
    [414, "Mothim"],
    [415, "Combee"],
    [416, "Vespiquen"],
    [417, "Pachirisu"],
    [418, "Buizel"],
    [419, "Floatzel"],
    [420, "Cherubi"],
    [421, "Cherrim"],
    [422, "Shellos"],
    [423, "Gastrodon"],
    [424, "Ambipom"],
    [425, "Drifloon"],
    [426, "Drifblim"],
    [427, "Buneary"],
    [428, "Lopunny"],
    [429, "Mismagius"],
    [430, "Honchkrow"],
    [431, "Glameow"],
    [432, "Purugly"],
    [433, "Chingling"],
    [434, "Stunky"],
    [435, "Skuntank"],
    [436, "Bronzor"],
    [437, "Bronzong"],
    [438, "Bonsly"],
    [439, "Mime Jr."],
    [440, "Happiny"],
    [441, "Chatot"],
    [442, "Spiritomb"],
    [443, "Gible"],
    [444, "Gabite"],
    [445, "Garchomp"],
    [446, "Munchlax"],
    [447, "Riolu"],
    [448, "Lucario"],
    [449, "Hippopotas"],
    [450, "Hippowdon"],
    [451, "Skorupi"],
    [452, "Drapion"],
    [453, "Croagunk"],
    [454, "Toxicroak"],
    [455, "Carnivine"],
    [456, "Finneon"],
    [457, "Lumineon"],
    [458, "Mantyke"],
    [459, "Snover"],
    [460, "Abomasnow"],
    [461, "Weavile"],
    [462, "Magnezone"],
    [463, "Lickilicky"],
    [464, "Rhyperior"],
    [465, "Tangrowth"],
    [466, "Electivire"],
    [467, "Magmortar"],
    [468, "Togekiss"],
    [469, "Yanmega"],
    [470, "Leafeon"],
    [471, "Glaceon"],
    [472, "Gliscor"],
    [473, "Mamoswine"],
    [474, "Porygon-Z"],
    [475, "Gallade"],
    [476, "Probopass"],
    [477, "Dusknoir"],
    [478, "Froslass"],
    [479, "Rotom"],
    [480, "Uxie"],
    [481, "Mesprit"],
    [482, "Azelf"],
    [483, "Dialga"],
    [484, "Palkia"],
    [485, "Heatran"],
    [486, "Regigigas"],
    [487, "Giratina"],
    [488, "Cresselia"],
    [489, "Phione"],
    [490, "Manaphy"],
    [491, "Darkrai"],
    [492, "Shaymin"],
    [493, "Arceus"]
]

pokemonWithGenderDifference = [
    getNationalIDOfPokemon("Venusaur"),
    getNationalIDOfPokemon("Butterfree"),
    getNationalIDOfPokemon("Rattata"),
    getNationalIDOfPokemon("Raticate"),
    getNationalIDOfPokemon("Pikachu"),
    getNationalIDOfPokemon("Raichu"),
    getNationalIDOfPokemon("Zubat"),
    getNationalIDOfPokemon("Golbat"),
    getNationalIDOfPokemon("Gloom"),
    getNationalIDOfPokemon("Vileplume"),
    getNationalIDOfPokemon("Kadabra"),
    getNationalIDOfPokemon("Alakazam"),
    getNationalIDOfPokemon("Doduo"),
    getNationalIDOfPokemon("Dodrio"),
    getNationalIDOfPokemon("Hypno"),
    getNationalIDOfPokemon("Rhyhorn"),
    getNationalIDOfPokemon("Rhydon"),
    getNationalIDOfPokemon("Goldeen"),
    getNationalIDOfPokemon("Seaking"),
    getNationalIDOfPokemon("Scyther"),
    getNationalIDOfPokemon("Magikarp"),
    getNationalIDOfPokemon("Gyarados"),
    getNationalIDOfPokemon("Eevee"),
    getNationalIDOfPokemon("Meganium"),
    getNationalIDOfPokemon("Ledyba"),
    getNationalIDOfPokemon("Ledian"),
    getNationalIDOfPokemon("Xatu"),
    getNationalIDOfPokemon("Sudowoodo"),
    getNationalIDOfPokemon("Politoed"),
    getNationalIDOfPokemon("Aipom"),
    getNationalIDOfPokemon("Wooper"),
    getNationalIDOfPokemon("Quagsire"),
    getNationalIDOfPokemon("Murkrow"),
    getNationalIDOfPokemon("Wobbuffet"),
    getNationalIDOfPokemon("Girafarig"),
    getNationalIDOfPokemon("Gligar"),
    getNationalIDOfPokemon("Steelix"),
    getNationalIDOfPokemon("Scizor"),
    getNationalIDOfPokemon("Heracross"),
    getNationalIDOfPokemon("Sneasel"),
    getNationalIDOfPokemon("Ursaring"),
    getNationalIDOfPokemon("Piloswine"),
    getNationalIDOfPokemon("Octillery"),
    getNationalIDOfPokemon("Houndoom"),
    getNationalIDOfPokemon("Donphan"),
    getNationalIDOfPokemon("Torchic"),
    getNationalIDOfPokemon("Combusken"),
    getNationalIDOfPokemon("Blaziken"),
    getNationalIDOfPokemon("Beautifly"),
    getNationalIDOfPokemon("Dustox"),
    getNationalIDOfPokemon("Ludicolo"),
    getNationalIDOfPokemon("Nuzleaf"),
    getNationalIDOfPokemon("Shiftry"),
    getNationalIDOfPokemon("Meditite"),
    getNationalIDOfPokemon("Medicham"),
    getNationalIDOfPokemon("Roselia"),
    getNationalIDOfPokemon("Gulpin"),
    getNationalIDOfPokemon("Swalot"),
    getNationalIDOfPokemon("Numel"),
    getNationalIDOfPokemon("Camerupt"),
    getNationalIDOfPokemon("Cacturne"),
    getNationalIDOfPokemon("Milotic"),
    getNationalIDOfPokemon("Relicanth"),
    getNationalIDOfPokemon("Starly"),
    getNationalIDOfPokemon("Staravia"),
    getNationalIDOfPokemon("Staraptor"),
    getNationalIDOfPokemon("Bidoof"),
    getNationalIDOfPokemon("Bibarel"),
    getNationalIDOfPokemon("Kricketot"),
    getNationalIDOfPokemon("Kricketune"),
    getNationalIDOfPokemon("Shinx"),
    getNationalIDOfPokemon("Luxio"),
    getNationalIDOfPokemon("Luxray"),
    getNationalIDOfPokemon("Roserade"),
    getNationalIDOfPokemon("Combee"),
    getNationalIDOfPokemon("Pachirisu"),
    getNationalIDOfPokemon("Buizel"),
    getNationalIDOfPokemon("Floatzel"),
    getNationalIDOfPokemon("Ambipom"),
    getNationalIDOfPokemon("Gible"),
    getNationalIDOfPokemon("Gabite"),
    getNationalIDOfPokemon("Garchomp"),
    getNationalIDOfPokemon("Hippopotas"),
    getNationalIDOfPokemon("Hippowdon"),
    getNationalIDOfPokemon("Croagunk"),
    getNationalIDOfPokemon("Toxicroak"),
    getNationalIDOfPokemon("Finneon"),
    getNationalIDOfPokemon("Lumineon"),
    getNationalIDOfPokemon("Snover"),
    getNationalIDOfPokemon("Abomasnow"),
    getNationalIDOfPokemon("Weavile"),
    getNationalIDOfPokemon("Rhyperior"),
    getNationalIDOfPokemon("Tangrowth"),
    getNationalIDOfPokemon("Mamoswine"),
]

//--------------------------------------------------
// Completionist - Achievements

achievement(
    title = "Special Forest Dwellers", points = 5, type = "missable",
    description = "Find and befriend the Spiky-eared Pichu in Ilex Forest and show it to Professor Elm.",
    id = 123514, badge = "138595", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x3D &&
              getSavefileDataRemember("16-bit", 0x104A) == 0x02 &&
              getSavefileDataRemember("16-bit", 0x1052) == 0x01 &&
              prev(getSavefileDataRemember("16-bit", 0x1052)) == 0x00
)

achievement(
    title = "Hero of Time", points = 5, type = "missable",
    description = "Travel through time with the help of Celebi and stop Team Rocket's comeback.",
    id = 123533, badge = "138974", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x75 &&
              getSavefileDataRemember("16-bit", 0xFF0) == 0x05 &&
              prev(getSavefileDataRemember("16-bit", 0xFF0)) == 0x04
)

achievement(
    title = "Mystery Inside the Enigma Stone", points = 5,
    description = "Bring the Enigma Stone to the Pewter Museum of Science and capture the Eon Pokemon that gets summoned.",
    id = 123534, badge = "138722", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x33 &&
              getSavefileDataRemember("16-bit", 0xEFA) == 0x05 &&
              prev(getSavefileDataRemember("16-bit", 0xEFA)) >= 0x03 &&
              prev(getSavefileDataRemember("16-bit", 0xEFA)) <= 0x04
)

achievement(
    title = "Holy Orbs of the Forgotten Tower", points = 5,
    description = "Bring the Jade Orb to the Embedded Tower, capture Rayquaza, and tell Professor Oak about your success.",
    id = 650852, badge = "743171", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x1F9 &&
              getSavefileDataRemember("16-bit", 0xFE6) == 0x08 &&
              prev(getSavefileDataRemember("16-bit", 0xFE6)) == 0x07
)

achievement(
    title = "Unidentified Space Creature", points = 3,
    description = "Bring Deoxys to the meteorites on Route 3 and discover all of its forms.",
    id = 650585, badge = "742860", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x0B &&
              measured(calculateDiscoveredFormsDeoxys() == 4) &&
              ((calculateDiscoveredFormsDeoxys() == 4 &&
                prev(calculateDiscoveredFormsDeoxys()) == 3) ||
                prev(getCoordinateY()) >= 0x6F &&
                getCoordinateX() >= 0x444 &&
                getCoordinateX() <= 0x44E &&
                getCoordinateY() >= 0x70 &&
                getCoordinateY() <= 0x7A)
)

achievement(
    title = "Multifunctional Device", points = 3,
    description = "Reach the cellar of Silph Co. and let Rotom climb into every device at least once.",
    id = 124349, badge = "138713", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x193 &&
              measured(calculateDiscoveredFormsRotom() == 5) &&
              prev(calculateDiscoveredFormsRotom()) == 4
)

achievement(
    title = "Beauty of Blooming Flowers", points = 3,
    description = "Show the Goldenrod Flower Shop employee a Shaymin, obtain a Gracidea and give it to the Shaymin.",
    id = 650639, badge = "742863", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == prev(getMapID()) &&
              ((getSavefileDataRemember("Bit5", 0x10FF) == 0x01 &&
                getShayminFormsInPokedex() == 0x02 &&
                prev(getShayminFormsInPokedex()) < 0x02) ||
               (getShayminFormsInPokedex() == 0x02 &&
                getSavefileDataRemember("Bit5", 0x10FF) > prev(getSavefileDataRemember("Bit5", 0x10FF))))
)

achievement(
    title = "Creator of the Universe", points = 5,
    description = "Witness the creation of a legendary Pokémon egg by an Arceus in the Sinjoh Ruins.",
    id = 123473, badge = "138591", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x1EC &&
              getSavefileDataRemember("16-bit", 0xFEA) == 0x0A &&
              prev(getSavefileDataRemember("16-bit", 0xFEA)) == 0x09
)

achievement(
    title = "A Second Chance of Life", points = 3,
    description = "Witness the creation of another legendary Pokémon egg by an Arceus in the Sinjoh Ruins.",
    id = 650846, badge = "743159", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x1EC &&
              prev(getMapID() == 0x20A) &&
              getSavefileDataRemember("16-bit", 0xFEA) == 0x0E
)

achievement(
    title = "Joy of Joy", points = 5,
    description = "Show Nurse Joy a black trainer card and get special treatment from her.",
    id = 651491, badge = "743850", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == prev(getMapID()) &&
              getSavefileDataRemember("Bit4", 0x10E0) > prev(getSavefileDataRemember("Bit4", 0x10E0))
)

achievement(
    title = "Illness of Strength", points = 10,
    description = "Show Nurse Joy a Pokémon that got infected with Pokérus.",
    id = 651492, badge = "743853", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == prev(getMapID()) &&
              getSavefileDataRemember("Bit5", 0x10E0) > prev(getSavefileDataRemember("Bit5", 0x10E0))
)

achievement(
    title = "Masuda's Vanity", points = 25,
    description = "Get a diploma from one of the Game Freak employees after completing the Johto Pokédex.",
    id = 651158, badge = "743852", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x17A &&
              getSavefileDataRemember("Bit3", 0x10FC) > prev(getSavefileDataRemember("Bit3", 0x10FC)) &&
              measured(calculatePokedexCapturedDiplomaRegional() == 249)
)

achievement(
    title = "Tajiri's Pride", points = 50,
    description = "Get a diploma from one of the Game Freak employees after completing the National Pokédex.",
    id = 651159, badge = "743529", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x17A &&
              getSavefileDataRemember("Bit4", 0x10FC) > prev(getSavefileDataRemember("Bit4", 0x10FC)) &&
              measured(calculatePokedexCapturedDiplomaNational() == 484)
)

achievement(
    title = "Golden Heart and Silver Soul", points = 5,
    description = "Complete the National Pokédex and capture all 493 Pokémon.",
    id = 651160, badge = "743530", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == prev(getMapID()) &&
              measured(calculatePokedexCapturedNational() == 493) &&
              prev(calculatePokedexCapturedNational() >= 482) &&
              prev(calculatePokedexCapturedNational() <= 492)
)

achievement(
    title = "Spot the Poké-Difference", points = 25,
    description = "Register both genders of Pokémon with gender differences as seen in the Pokédex.",
    id = 651933, badge = "744313", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == prev(getMapID()) &&
              measured(calculatePokedexSeenGenders() == length(pokemonWithGenderDifference)) &&
              prev(calculatePokedexSeenGenders()) >= length(pokemonWithGenderDifference) - 11 &&
              prev(calculatePokedexSeenGenders()) <= length(pokemonWithGenderDifference) - 1
)

achievement(
    title = "Best Standards of All", points = 5,
    description = "Max out the level of the \"Plains\" area in the Safari Zone by having it active for 250 days.",
    id = 651917, badge = "744301", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == prev(getMapID()) &&
              measured(getSafariZoneAreaLevel(0x00) >= 250) &&
              prev(getSafariZoneAreaLevel(0x00) < 250)
)

achievement(
    title = "Growing Flower Farm", points = 5,
    description = "Max out the level of the \"Meadow\" area in the Safari Zone by having it active for 250 days.",
    id = 651918, badge = "744302", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == prev(getMapID()) &&
              measured(getSafariZoneAreaLevel(0x01) >= 250) &&
              prev(getSafariZoneAreaLevel(0x01) < 250)
)

achievement(
    title = "Evergreen Desert", points = 5,
    description = "Max out the level of the \"Savannah\" area in the Safari Zone by having it active for 250 days.",
    id = 651919, badge = "744303", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == prev(getMapID()) &&
              measured(getSafariZoneAreaLevel(0x02) >= 250) &&
              prev(getSafariZoneAreaLevel(0x02) < 250)
)

achievement(
    title = "Hill of Magnetic Fields", points = 5,
    description = "Max out the level of the \"Peak\" area in the Safari Zone by having it active for 250 days.",
    id = 651920, badge = "744304", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == prev(getMapID()) &&
              measured(getSafariZoneAreaLevel(0x03) >= 250) &&
              prev(getSafariZoneAreaLevel(0x03) < 250)
)

achievement(
    title = "Crystal Clear Spring", points = 5,
    description = "Max out the level of the \"Rocky Beach\" area in the Safari Zone by having it active for 250 days.",
    id = 651921, badge = "744305", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == prev(getMapID()) &&
              measured(getSafariZoneAreaLevel(0x04) >= 250) &&
              prev(getSafariZoneAreaLevel(0x04) < 250)
)

achievement(
    title = "Watch Your Steps", points = 5,
    description = "Max out the level of the \"Wetland\" area in the Safari Zone by having it active for 250 days.",
    id = 651922, badge = "744306", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == prev(getMapID()) &&
              measured(getSafariZoneAreaLevel(0x05) >= 250) &&
              prev(getSafariZoneAreaLevel(0x05) < 250)
)

achievement(
    title = "Trees of the Centuries", points = 5,
    description = "Max out the level of the \"Forest\" area in the Safari Zone by having it active for 250 days.",
    id = 651923, badge = "744307", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == prev(getMapID()) &&
              measured(getSafariZoneAreaLevel(0x06) >= 250) &&
              prev(getSafariZoneAreaLevel(0x06) < 250)
)

achievement(
    title = "Muddy Footprints", points = 5,
    description = "Max out the level of the \"Swamp\" area in the Safari Zone by having it active for 250 days.",
    id = 651924, badge = "744308", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == prev(getMapID()) &&
              measured(getSafariZoneAreaLevel(0x07) >= 250) &&
              prev(getSafariZoneAreaLevel(0x07) < 250)
)

achievement(
    title = "Stuck in the Mud", points = 5,
    description = "Max out the level of the \"Marshland\" area in the Safari Zone by having it active for 250 days.",
    id = 651925, badge = "744309", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == prev(getMapID()) &&
              measured(getSafariZoneAreaLevel(0x08) >= 250) &&
              prev(getSafariZoneAreaLevel(0x08) < 250)
)

achievement(
    title = "Natural Training Area", points = 5,
    description = "Max out the level of the \"Wasteland\" area in the Safari Zone by having it active for 250 days.",
    id = 651926, badge = "744310", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == prev(getMapID()) &&
              measured(getSafariZoneAreaLevel(0x09) >= 250) &&
              prev(getSafariZoneAreaLevel(0x09) < 250)
)

achievement(
    title = "High, High to the Sky", points = 5,
    description = "Max out the level of the \"Mountain\" area in the Safari Zone by having it active for 250 days.",
    id = 651927, badge = "744311", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == prev(getMapID()) &&
              measured(getSafariZoneAreaLevel(0x0A) >= 250) &&
              prev(getSafariZoneAreaLevel(0x0A) < 250)
)

achievement(
    title = "Hidden Below the Sand", points = 5,
    description = "Max out the level of the \"Desert\" area in the Safari Zone by having it active for 250 days.",
    id = 651928, badge = "744312", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == prev(getMapID()) &&
              measured(getSafariZoneAreaLevel(0x0B) >= 250) &&
              prev(getSafariZoneAreaLevel(0x0B) < 250)
)

achievement(
    title = "Familiar Faces", points = 10,
    description = "Get a total combined win streak of 500 or more in the Battle Hall and meet Ethan or Lyra inside the lobby.",
    id = 651766, badge = "744052", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x114 &&
              getCoordinateX() >= 0x03 &&
              getCoordinateX() <= 0x05 &&
              getCoordinateY() >= 0x05 &&
              getCoordinateY() <= 0x07 &&
              ((getBattleHallSpecialCharacter() == 0x00 &&
                checkTalkingToNPCID(0x00) &&
                checkTalkingToNPCIDChanged()) ||
               (getBattleHallSpecialCharacter() == 0x61 &&
                checkTalkingToNPCID(0x61) &&
                checkTalkingToNPCIDChanged()))
)

achievement(
    title = "Mommy's Little Star", points = 25,
    description = "Get a total combined win streak of 1,000 or more in the Battle Hall and meet Mom inside the lobby.",
    id = 651767, badge = "744053", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x114 &&
              getCoordinateX() >= 0x03 &&
              getCoordinateX() <= 0x05 &&
              getCoordinateY() >= 0x05 &&
              getCoordinateY() <= 0x07 &&
              getBattleHallSpecialCharacter() == 0x16D &&
              checkTalkingToNPCID(0x16D) &&
              checkTalkingToNPCIDChanged()
)

achievement(
    title = "Giving a Girl Tears Once Again", points = 100,
    description = "Get a total combined win streak of 10,000 or more in the Battle Hall and meet Whitney inside the lobby.",
    id = 651768, badge = "744054", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x114 &&
              getCoordinateX() >= 0x03 &&
              getCoordinateX() <= 0x05 &&
              getCoordinateY() >= 0x05 &&
              getCoordinateY() <= 0x07 &&
              getBattleHallSpecialCharacter() == 0x162 &&
              checkTalkingToNPCID(0x162) &&
              checkTalkingToNPCIDChanged()
)

achievement(
    title = "Investigating the Ins and Outs of Pokémon Battle", points = 100,
    description = "Get a total combined win streak of 10,000 or more in the Battle Hall and meet Professor Oak inside the lobby.",
    id = 651769, badge = "744055", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x114 &&
              getCoordinateX() >= 0x03 &&
              getCoordinateX() <= 0x05 &&
              getCoordinateY() >= 0x05 &&
              getCoordinateY() <= 0x07 &&
              getBattleHallSpecialCharacter() == 0x16E &&
              checkTalkingToNPCID(0x16E) &&
              checkTalkingToNPCIDChanged()
)

achievement(
    title = "Meet and Greet with the Ultimate Fan", points = 50,
    description = "Set a win streak with all 475 Pokémon in the Battle Hall and talk to Serena or Winston.",
    id = 651847, badge = "744160", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x114 &&
              getCoordinateX() >= 0x07 &&
              getCoordinateX() <= 0x09 &&
              getCoordinateY() >= 0x0A &&
              getCoordinateY() <= 0x0C &&
              getBattleHallDifferentRecords() == 475 &&
              __ornext(checkTalkingToNPCID(0x13D) ||
                       checkTalkingToNPCID(0x140)) &&
              checkTalkingToNPCIDChanged()
)

achievement(
    title = "Sparkly Temptation", points = 5,
    description = "Complete level 6 in the minigame \"Voltorb Flip\".",
    id = 649572, badge = "742002", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x218 &&
              checkHeapLoaded(0xA0) &&
              getVoltorbFlipLevel() >= 50 &&
              getVoltorbFlipLevel() <= 59 &&
              checkVoltOrbFlipLevelComplete()
)

achievement(
    title = "Voltsweeper", points = 10,
    description = "Complete level 7 in the minigame \"Voltorb Flip\".",
    id = 649573, badge = "742003", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x218 &&
              checkHeapLoaded(0xA0) &&
              getVoltorbFlipLevel() >= 60 &&
              getVoltorbFlipLevel() <= 69 &&
              checkVoltOrbFlipLevelComplete()
)

achievement(
    title = "Atomic Brain", points = 25,
    description = "Complete level 8 in the minigame \"Voltorb Flip\".",
    id = 124428, badge = "742001", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x218 &&
              checkHeapLoaded(0xA0) &&
              getVoltorbFlipLevel() >= 70 &&
              getVoltorbFlipLevel() <= 79 &&
              checkVoltOrbFlipLevelComplete()
)

achievement(
    title = "Berry Waste Disposal", points = 10,
    description = "Score 20.000 points or more in the Wi-Fi Club minigame \"Swalot Plop\".",
    id = 650178, badge = "742617", set = 45861,
    trigger = checkSaveLoaded() &&
              checkHeapLoaded(0x0B) &&
              checkHeapLoaded(0x6A) &&
              getField2DataStateID() == 0x5B &&
              getMinigameSwalotPlopState() == 0x0B &&
              prev(getMinigameSwalotPlopState()) == 0x0A &&
              getMinigameSwalotPlopPlayerScore() >= 20000
)

achievement(
    title = "Clownish Behavior", points = 10,
    description = "Score 25.000 points or more in the Wi-Fi Club minigame \"Mime Jr. Top\".",
    id = 650180, badge = "742619", set = 45861,
    trigger = checkSaveLoaded() &&
              checkHeapLoaded(0x0B) &&
              checkHeapLoaded(0x75) &&
              getField2DataStateID() == 0x5C &&
              getMinigameMimeJrTopState() == 0x0E &&
              prev(getMinigameMimeJrTopState()) >= 0x0C &&
              prev(getMinigameMimeJrTopState()) <= 0x0D &&
              getMinigameMimeJrTopPlayerScore() >= 25000
)

achievement(
    title = "Defensive Explosions", points = 10,
    description = "Contribute 50.000cc or more in the Wi-Fi Club minigame \"Wobbuffet Pop\".",
    id = 650202, badge = "742641", set = 45861,
    trigger = checkSaveLoaded() &&
              checkHeapLoaded(0x0B) &&
              checkHeapLoaded(0x75) &&
              getField2DataStateID() == 0x5D &&
              getMinigameWobbuffetPopState() == 0x0B &&
              prev(getMinigameWobbuffetPopState()) == 0x0A &&
              getMinigameWobbuffetPopPlayerScore() >= 50000
)

achievement(
    title = "Shipped Right to the Door", points = 3,
    description = "Unlock the PokéWalker route \"Beyond the Sea\" by trading a Pokémon from a foreign country.",
    id = 649591, badge = "742011", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == prev(getMapID()) &&
              getSavefileDataRemember("Bit4", 0xE71E) > prev(getSavefileDataRemember("Bit4", 0xE71E))
)

achievement(
    title = "Shooting Star in the Sky", points = 3,
    description = "Unlock the PokéWalker route \"Night Sky's Edge\" by registering Jirachi in the Pokédex.",
    id = 649593, badge = "742013", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == prev(getMapID()) &&
              getSavefileDataRemember("Bit5", 0xE71E) > prev(getSavefileDataRemember("Bit5", 0xE71E))
)

achievement(
    title = "Miracle Paths", points = 2,
    description = "Unlock the PokéWalker routes \"Yellow Forest\", \"Rally\", \"Sightseeing\", \"Winner's Path\" and \"Amity Meadow\" by downloading their wonder cards and obtaining them from the deliveryman.",
    id = 649592, badge = "742012", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == prev(getMapID()) &&
              measured(getSavefileDataRemember("Bit6", 0xE71E)
                     + getSavefileDataRemember("Bit7", 0xE71E)
                     + getSavefileDataRemember("Bit0", 0xE71F)
                     + getSavefileDataRemember("Bit1", 0xE71F)
                     + getSavefileDataRemember("Bit2", 0xE71F) == 5) &&
                prev(getSavefileDataRemember("Bit6", 0xE71E)
                     + getSavefileDataRemember("Bit7", 0xE71E)
                     + getSavefileDataRemember("Bit0", 0xE71F)
                     + getSavefileDataRemember("Bit1", 0xE71F)
                     + getSavefileDataRemember("Bit2", 0xE71F)) == 4
)

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
               (measured(getHeapData18(0x5C, "32-bit", 0xB78)
                       + getHeapData18(0x5C, "32-bit", 0xB98)
                       + getHeapData18(0x5C, "32-bit", 0xBB8)
                       + getSavefileData("32-bit", 0xE510) >= 5000,
                       when = checkHeapLoaded(0x5C) &&
                              getHeapData18(0x5C, "32-bit", 0x210) * 0x100
                              + getPokeathlonPhaseState() < 0x325) &&
                    prev(getHeapData18(0x5C, "32-bit", 0xB78)
                       + getHeapData18(0x5C, "32-bit", 0xB98)
                       + getHeapData18(0x5C, "32-bit", 0xBB8)
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
               (measured(getHeapData18(0x5C, "32-bit", 0x764)
                       + getHeapData18(0x5C, "32-bit", 0x784)
                       + getHeapData18(0x5C, "32-bit", 0x7A4)
                       + getSavefileData("32-bit", 0xE514) == 200,
                       when = checkHeapLoaded(0x5C) &&
                              getHeapData18(0x5C, "32-bit", 0x210) * 0x100
                              + getPokeathlonPhaseState() < 0x325) &&
                    prev(getHeapData18(0x5C, "32-bit", 0x764)
                       + getHeapData18(0x5C, "32-bit", 0x784)
                       + getHeapData18(0x5C, "32-bit", 0x7A4)
                       + getSavefileData("32-bit", 0xE514)) == 199))
)

achievement(
    title = "Call Me a Champion!", points = 2,
    description = "Obtain the golden Pokégear trophy in the Pokéathlon Dome by winning a total of 100 courses.",
    id = 647863, badge = "741525", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              measured(getSavefileData("32-bit", 0xE4EC) == 100) &&
                  prev(getSavefileData("32-bit", 0xE4EC)) == 99
)

achievement(
    title = "Get the Jump, Avoid the Bump", points = 10,
    description = "Win the single-player Pokéathlon event \"Hurdle Dash\" a total of 50 times and finish the course.",
    id = 648852, badge = "741513", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              measured(getSavefileData("32-bit", 0xE528) == 50) &&
                  prev(getSavefileData("32-bit", 0xE528)) == 49
)

achievement(
    title = "Quick Race Through Piles of Sand", points = 10,
    description = "Win the single-player Pokéathlon event \"Pennant Capture\" a total of 50 times and finish the course.",
    id = 648853, badge = "741514", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              measured(getSavefileData("32-bit", 0xE52C) == 50) &&
                  prev(getSavefileData("32-bit", 0xE52C)) == 49
)

achievement(
    title = "Taking a Stance", points = 10,
    description = "Win the single-player Pokéathlon event \"Circle Push\" a total of 50 times and finish the course.",
    id = 648854, badge = "741515", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              measured(getSavefileData("32-bit", 0xE530) == 50) &&
                  prev(getSavefileData("32-bit", 0xE530)) == 49
)

achievement(
    title = "De-Constructor of the Month", points = 10,
    description = "Win the single-player Pokéathlon event \"Block Smash\" a total of 50 times and finish the course.",
    id = 648855, badge = "741516", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              measured(getSavefileData("32-bit", 0xE534) == 50) &&
                  prev(getSavefileData("32-bit", 0xE534)) == 49
)

achievement(
    title = "Catch It If You Can", points = 10,
    description = "Win the single-player Pokéathlon event \"Disc Catch\" a total of 50 times and finish the course.",
    id = 648856, badge = "741517", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              measured(getSavefileData("32-bit", 0xE538) == 50) &&
                  prev(getSavefileData("32-bit", 0xE538)) == 49
)

achievement(
    title = "Enlightment on the Bouncy Castle", points = 10,
    description = "Win the single-player Pokéathlon event \"Lamp Jump\" a total of 50 times and finish the course.",
    id = 648857, badge = "741518", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              measured(getSavefileData("32-bit", 0xE53C) == 50) &&
                  prev(getSavefileData("32-bit", 0xE53C)) == 49
)

achievement(
    title = "Ready for a Marathon", points = 10,
    description = "Win the single-player Pokéathlon event \"Relay Run\" a total of 50 times and finish the course.",
    id = 648858, badge = "741519", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              measured(getSavefileData("32-bit", 0xE540) == 50) &&
                  prev(getSavefileData("32-bit", 0xE540)) == 49
)

achievement(
    title = "Pushing to the Limit", points = 10,
    description = "Win the single-player Pokéathlon event \"Ring Drop\" a total of 50 times and finish the course.",
    id = 648859, badge = "741520", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              measured(getSavefileData("32-bit", 0xE544) == 50) &&
                  prev(getSavefileData("32-bit", 0xE544)) == 49
)

achievement(
    title = "Snowmen and the Ice Princess", points = 10,
    description = "Win the single-player Pokéathlon event \"Snow Throw\" a total of 50 times and finish the course.",
    id = 648860, badge = "741521", set = 45860,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x119 &&
              measured(getSavefileData("32-bit", 0xE548) == 50) &&
                  prev(getSavefileData("32-bit", 0xE548)) == 49
)

achievement(
    title = "Pocket World Cup", points = 10,
    description = "Win the single-player Pokéathlon event \"Goal Roll\" a total of 50 times and finish the course.",
    id = 648861, badge = "741522", set = 45860,
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
// Completionist - Leaderboards

leaderboard(
    id = 177085, set = 45861, title = "Information",
    description = "Total different Pokémon win streaks in the Battle Hall.",
    start  = checkSaveLoaded() &&
             getMapID() == 0x114 &&
             getCoordinateX() >= 0x07 &&
             getCoordinateX() <= 0x09 &&
             getCoordinateY() >= 0x07 &&
             getCoordinateY() <= 0x09 &&
             checkTalkingToNPCID(0x11A) &&
             checkTalkingToNPCIDChanged(),
    cancel = !checkTalkingToNPCID(0x11A),
    submit = always_false(),
    value  = getBattleHallDifferentRecords(),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 176681, set = 45861, title = "Minigame Record",
    description = "Highest score in the Wi-Fi Plaza minigame \"Swalot Plop\".",
    start  = checkSaveLoaded() &&
             checkHeapLoaded(0x0B) &&
             checkHeapLoaded(0x6A) &&
             getField2DataStateID() == 0x5B &&
             getMinigameSwalotPlopState() == 0x0B &&
             prev(getMinigameSwalotPlopState()) == 0x0A,
    cancel = always_false(),
    submit = always_true(),
    value  = getMinigameSwalotPlopPlayerScore(),
    format = "VALUE",
    lower_is_better = false
)


leaderboard(
    id = 176705, set = 45861, title = "Minigame Record",
    description = "Highest score in the Wi-Fi Plaza minigame \"Mime Jr. Top\".",
    start  = checkSaveLoaded() &&
             checkHeapLoaded(0x0B) &&
             checkHeapLoaded(0x71) &&
             getField2DataStateID() == 0x5C &&
             getMinigameMimeJrTopState() == 0x10 &&
             prev(getMinigameMimeJrTopState()) == 0x0F,
    cancel = always_false(),
    submit = always_true(),
    value  = getMinigameMimeJrTopPlayerScore(),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 176706, set = 45861, title = "Minigame Record",
    description = "Most CC contributed in the Wi-Fi Plaza minigame \"Wobbuffet Pop\".",
    start  = checkSaveLoaded() &&
             checkHeapLoaded(0x0B) &&
             checkHeapLoaded(0x75) &&
             getField2DataStateID() == 0x5D &&
             getMinigameWobbuffetPopState() == 0x08 &&
             prev(getMinigameWobbuffetPopState()) == 0x07,
    cancel = always_false(),
    submit = always_true(),
    value  = getMinigameWobbuffetPopPlayerScore(),
    format = "VALUE",
    lower_is_better = false
)

//--------------------------------------------------
// Pokéathlon - Leaderboards

leaderboard(
    id = 19141, set = 45860, title = "Event Record",
    description = "Least time needed in the Pokéathlon event \"Hurdle Dash\".",
    start  = checkSaveLoaded() &&
             checkHeapLoaded(0x5C) &&
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
             checkHeapLoaded(0x5C) &&
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
             checkHeapLoaded(0x5C) &&
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
             checkHeapLoaded(0x5C) &&
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
             checkHeapLoaded(0x5C) &&
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
             checkHeapLoaded(0x5C) &&
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
             checkHeapLoaded(0x5C) &&
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
             checkHeapLoaded(0x5C) &&
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
             checkHeapLoaded(0x5C) &&
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
             checkHeapLoaded(0x5C) &&
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
             checkHeapLoaded(0x5C) &&
             getMapID() == 0x119 &&
             getPokeathlonCourseID() == 0x00 &&
             getPokeathlonCurrentPhase() == 0x03 &&
             getPokeathlonPhaseState() == 0x21 &&
             getPokeathlonResultState() == 0x02 &&
             prev(getPokeathlonResultState()) == 0x01,
    cancel = always_false(),
    submit = always_true(),
    value  = dword(tbyte(getHeapData18(0x5C, "24-bit", 0x204) + 0x8C) + 0x10),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 19148, set = 45860, title = "Course Record",
    description = "Highest end result in the Pokéathlon Power course.",
    start  = checkSaveLoaded() &&
             checkHeapLoaded(0x5C) &&
             getMapID() == 0x119 &&
             getPokeathlonCourseID() == 0x01 &&
             getPokeathlonCurrentPhase() == 0x03 &&
             getPokeathlonPhaseState() == 0x21 &&
             getPokeathlonResultState() == 0x02 &&
             prev(getPokeathlonResultState()) == 0x01,
    cancel = always_false(),
    submit = always_true(),
    value  = dword(tbyte(getHeapData18(0x5C, "24-bit", 0x204) + 0x8C) + 0x10),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 19149, set = 45860, title = "Course Record",
    description = "Highest end result in the Pokéathlon Skill course.",
    start  = checkSaveLoaded() &&
             checkHeapLoaded(0x5C) &&
             getMapID() == 0x119 &&
             getPokeathlonCourseID() == 0x02 &&
             getPokeathlonCurrentPhase() == 0x03 &&
             getPokeathlonPhaseState() == 0x21 &&
             getPokeathlonResultState() == 0x02 &&
             prev(getPokeathlonResultState()) == 0x01,
    cancel = always_false(),
    submit = always_true(),
    value  = dword(tbyte(getHeapData18(0x5C, "24-bit", 0x204) + 0x8C) + 0x10),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 19150, set = 45860, title = "Course Record",
    description = "Highest end result in the Pokéathlon Stamina course.",
    start  = checkSaveLoaded() &&
             checkHeapLoaded(0x5C) &&
             getMapID() == 0x119 &&
             getPokeathlonCourseID() == 0x03 &&
             getPokeathlonCurrentPhase() == 0x03 &&
             getPokeathlonPhaseState() == 0x21 &&
             getPokeathlonResultState() == 0x02 &&
             prev(getPokeathlonResultState()) == 0x01,
    cancel = always_false(),
    submit = always_true(),
    value  = dword(tbyte(getHeapData18(0x5C, "24-bit", 0x204) + 0x8C) + 0x10),
    format = "VALUE",
    lower_is_better = false
)

leaderboard(
    id = 19151, set = 45860, title = "Course Record",
    description = "Highest end result in the Pokéathlon Jump course.",
    start  = checkSaveLoaded() &&
             checkHeapLoaded(0x5C) &&
             getMapID() == 0x119 &&
             getPokeathlonCourseID() == 0x04 &&
             getPokeathlonCurrentPhase() == 0x03 &&
             getPokeathlonPhaseState() == 0x21 &&
             getPokeathlonResultState() == 0x02 &&
             prev(getPokeathlonResultState()) == 0x01,
    cancel = always_false(),
    submit = always_true(),
    value  = dword(tbyte(getHeapData18(0x5C, "24-bit", 0x204) + 0x8C) + 0x10),
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
    id = 177127, set = 45860, title = "Data Card 06",
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
    id = 177128, set = 45860, title = "Data Card 08",
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
