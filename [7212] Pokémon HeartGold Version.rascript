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

mem_ContextPointer  = 0x000BA8

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
    return dword(getContextPointer() + 0x20) >= 0x02000000 &&
           dword(getContextPointer() + 0x20) <= 0x02FFFFFF &&
           getSavefileData("8-bit", 0x1000) == prev(getSavefileData("8-bit", 0x1000))
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

function getRotation() {
    return dword(tbyte(tbyte(tbyte(getContextPointer() + 0xC28F8) + 0x40) + 0x30) + 0x28)
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

function calculatePhotoAlbumPicturesCity() {
    return measured(tally(24, once(checkPhotoAlbumAnyPictureHashHash(0x003C, 0x02B7, 0x018F, 0x0000)), // New Bark Town
                              once(checkPhotoAlbumAnyPictureHashHash(0x0043, 0x0232, 0x018E, 0x0000)), // Cherrygrove City
                              once(checkPhotoAlbumAnyPictureHashHash(0x00C7, 0x0011, 0x0006, 0x0000)), // Goldenrod Tunnel
                              once(checkPhotoAlbumAnyPictureHashHash(0x0118, 0x0029, 0x0019, 0x0000)), // Pokéathlon Dome
                              once(checkPhotoAlbumAnyPictureHashHash(0x0118, 0x0013, 0x001A, 0x0000)), // Pokéathlon Dome
                              once(checkPhotoAlbumAnyPictureHashHash(0x004E, 0x0186, 0x009C, 0x0000)), // Ecruteak City
                              once(checkPhotoAlbumAnyPictureHashHash(0x004D, 0x0116, 0x00FD, 0x0000)), // Olivine City
                              once(checkPhotoAlbumAnyPictureHashHash(0x00E0, 0x0002, 0x000A, 0x0000)), // Olivine Lighthouse
                              once(checkPhotoAlbumAnyPictureHashHash(0x004B, 0x00B9, 0x015F, 0x0000)), // Cianwood City
                              once(checkPhotoAlbumAnyPictureHashHash(0x00AE, 0x0057, 0x0128, 0x0000)), // Safari Zone Gate
                              once(checkPhotoAlbumAnyPictureHashHash(0x0059, 0x02AC, 0x00AB, 0x0000)), // Blackthorn City
                              once(checkPhotoAlbumAnyPictureHashHash(0x019B, 0x000D, 0x000C, 0x0000)), // Goldenrod Tunnel
                              once(checkPhotoAlbumAnyPictureHashHash(0x0031, 0x0407, 0x016F, 0x0000)), // Pallet Town
                              once(checkPhotoAlbumAnyPictureHashHash(0x0032, 0x040D, 0x0100, 0x0000)), // Viridian City
                              once(checkPhotoAlbumAnyPictureHashHash(0x0033, 0x0417, 0x0051, 0x0000)), // Pewter City
                              once(checkPhotoAlbumAnyPictureHashHash(0x01D7, 0x0008, 0x0004, 0x0000)), // Pewter Museum of Science
                              once(checkPhotoAlbumAnyPictureHashHash(0x0034, 0x052D, 0x0068, 0x0000)), // Cerulean City
                              once(checkPhotoAlbumAnyPictureHashHash(0x0036, 0x0526, 0x012E, 0x0000)), // Vermilion City
                              once(checkPhotoAlbumAnyPictureHashHash(0x003B, 0x051B, 0x00E8, 0x0000)), // Saffron City
                              once(checkPhotoAlbumAnyPictureHashHash(0x003B, 0x0507, 0x00D3, 0x0000)), // Saffron City
                              once(checkPhotoAlbumAnyPictureHashHash(0x0037, 0x04B0, 0x00FC, 0x0000)), // Celadon City
                              once(checkPhotoAlbumAnyPictureHashHash(0x0173, 0x0003, 0x0006, 0x0000)), // Celadon Dept. Store
                              once(checkPhotoAlbumAnyPictureHashHash(0x0038, 0x04B1, 0x01B9, 0x0000)), // Fuchsia City
                              once(checkPhotoAlbumAnyPictureHashHash(0x0066, 0x000A, 0x0005, 0x0000))  // National Park Lobby
                         )
                    )
}

function calculatePhotoAlbumPicturesNature() {
    return measured(tally(21, once(checkPhotoAlbumAnyPictureHashHash(0x0071, 0x01B3, 0x0118, 0x0000)), // Ruins of Alph
                              once(checkPhotoAlbumAnyPictureHashHash(0x0143, 0x0004, 0x0004, 0x0000)), // Ruins of Alph
                              once(checkPhotoAlbumAnyPictureHashHash(0x0024, 0x01D4, 0x018B, 0x0000)), // Route 32
                              once(checkPhotoAlbumAnyPictureHashHash(0x0072, 0x0010, 0x0006, 0x0000)), // Slowpoke Well
                              once(checkPhotoAlbumAnyPictureHashHash(0x0075, 0x000B, 0x0014, 0x0000)), // Ilex Forest
                              once(checkPhotoAlbumAnyPictureHashHash(0x0027, 0x0174, 0x012F, 0x0000)), // Route 35
                              once(checkPhotoAlbumAnyPictureHashHash(0x0060, 0x0034, 0x004E, 0x0000)), // National Park
                              once(checkPhotoAlbumAnyPictureHashHash(0x0060, 0x0036, 0x0030, 0x0000)), // National Park
                              once(checkPhotoAlbumAnyPictureHashHash(0x002B, 0x0106, 0x00A8, 0x0000)), // Route 39
                              once(checkPhotoAlbumAnyPictureHashHash(0x0098, 0x0065, 0x0153, 0x0000)), // Route 48
                              once(checkPhotoAlbumAnyPictureHashHash(0x0078, 0x0026, 0x0011, 0x0000)), // Ice Path
                              once(checkPhotoAlbumAnyPictureHashHash(0x002F, 0x0288, 0x00FE, 0x0000)), // Route 45
                              once(checkPhotoAlbumAnyPictureHashHash(0x005A, 0x0334, 0x010B, 0x0000)), // Mt. Silver
                              once(checkPhotoAlbumAnyPictureHashHash(0x007A, 0x000C, 0x0024, 0x0000)), // Mt. Silver
                              once(checkPhotoAlbumAnyPictureHashHash(0x0009, 0x040C, 0x013C, 0x0000)), // Route 1
                              once(checkPhotoAlbumAnyPictureHashHash(0x0014, 0x0593, 0x0113, 0x0000)), // Route 12
                              once(checkPhotoAlbumAnyPictureHashHash(0x0016, 0x054D, 0x0183, 0x0000)), // Route 14
                              once(checkPhotoAlbumAnyPictureHashHash(0x01C5, 0x0021, 0x0009, 0x0000)), // Seafoam Island
                              once(checkPhotoAlbumAnyPictureHashHash(0x005D, 0x0413, 0x019C, 0x0000)), // Route 21
                              once(checkPhotoAlbumAnyPictureHashHash(0x001B, 0x03B8, 0x010B, 0x0000)), // Route 22
                              once(checkPhotoAlbumAnyPictureHashHash(0x001E, 0x0392, 0x0182, 0x0000))  // Route 26
                         )
                    )
}

function calculatePhotoAlbumPicturesCelebrity() {
    return measured(tally(19, once(checkPhotoAlbumAnyPictureHashHash(0x0175, 0x000C, 0x0005, 0x0160)), // Celadon Dept. Store       Falkner
                              once(checkPhotoAlbumAnyPictureHashHash(0x0060, 0x003A, 0x0028, 0x0161)), // National Park             Bugsy
                              once(checkPhotoAlbumAnyPictureHashHash(0x00C4, 0x0003, 0x0004, 0x0162)), // Goldenrod Dept. Store     Whitney
                              once(checkPhotoAlbumAnyPictureHashHash(0x0006, 0x001F, 0x000C, 0x0163)), // Bellchime Trail           Morty
                              once(checkPhotoAlbumAnyPictureHashHash(0x0097, 0x004F, 0x0173, 0x0164)), // Route 47                  Chuck
                              once(checkPhotoAlbumAnyPictureHashHash(0x00E7, 0x0007, 0x0005, 0x0165)), // Olivine City              Jasmine
                              once(checkPhotoAlbumAnyPictureHashHash(0x008C, 0x0006, 0x0005, 0x0166)), // Mahagony Gym              Pryce
                              once(checkPhotoAlbumAnyPictureHashHash(0x00FD, 0x001B, 0x000D, 0x0167)), // Dragon's Den              Clair
                              once(checkPhotoAlbumAnyPictureHashHash(0x006A, 0x0023, 0x0005, 0x0175)), // Diglett's Cave            Brock
                              once(checkPhotoAlbumAnyPictureHashHash(0x001D, 0x058C, 0x002C, 0x0172)), // Route 25                  Misty
                              once(checkPhotoAlbumAnyPictureHashHash(0x002B, 0x0105, 0x00BC, 0x0170)), // Route 39                  Lt. Surge
                              once(checkPhotoAlbumAnyPictureHashHash(0x0037, 0x04B0, 0x00FC, 0x0173)), // Celadon City              Erika
                              once(checkPhotoAlbumAnyPictureHashHash(0x012B, 0x000A, 0x0008, 0x0174)), // Victory Road Gate         Janine
                              once(checkPhotoAlbumAnyPictureHashHash(0x014A, 0x0010, 0x0016, 0x0171)), // Olivine Pier              Sabrina
                              once(checkPhotoAlbumAnyPictureHashHash(0x0039, 0x040B, 0x01F8, 0x0176)), // Cinnabar Island           Blaine
                              once(checkPhotoAlbumAnyPictureHashHash(0x0039, 0x040A, 0x01EF, 0x0177)), // Cinnabar Island           Blue
                              once(checkPhotoAlbumAnyPictureHashHash(0x0026, 0x016B, 0x019A, 0x014A)), // Pokémon Day-Care          Day-Care Man
                              once(checkPhotoAlbumAnyPictureHashHash(0x0120, 0x0005, 0x000B, 0x0183)), // Dragon's Den              Master
                              once(checkPhotoAlbumAnyPictureHashHash(0x01F9, 0x0006, 0x0006, 0x016E))  // Oak Pokémon Research Lab  Professor Oak
                         )
                    )
}

function checkPhotoAlbumAnyPictureHashHash(mapID, xAxis, yAxis, characterID) {
    code = always_false()
    for i in range (0, 35) {
        code = __ornext(code || checkPhotoAlbumPictureHasHash(i, mapID, xAxis, yAxis, characterID))
    }
    return code
}

function checkPhotoAlbumPictureObtained() {
    code = always_false()
    for albumSlot in range (0, 35) {
        baseOffset = 0xC754 + (albumSlot * 132)
        code = __ornext(code || getSavefileData("32-bit", baseOffset + 0x2E) > prev(getSavefileData("32-bit", baseOffset + 0x2E)))
    }
    return code
}

function checkPhotoAlbumPictureHasHash(albumSlot, mapID, xAxis, yAxis, characterID) {
    baseOffset = 0xC754 + (albumSlot * 132)
    return getSavefileDataRemember("32-bit", baseOffset + 0x2E)
         + getSavefileDataRemember("Bit0", baseOffset + 0x41) * 0x10000000  == hashPhotoAlbumPicture(mapID, xAxis, yAxis, characterID)
}

function hashPhotoAlbumPicture(mapID, xAxis, yAxis, characterID) {
    if (characterID != 0x00) {
        characterID = 1
    }
    return mapID
         + xAxis * 0x10000
         + characterID * 0x10000000
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

function checkItemObtained() {
    return getContextPointer() != 0x00 &&
           tbyte(getContextPointer() + 0xC28F8) != 0x00 &&
           tbyte(tbyte(getContextPointer() + 0xC28F8) + 0x10) != 0x00 &&
           tbyte(tbyte(tbyte(getContextPointer() + 0xC28F8) + 0x10) + 0x0C) != 0x00 &&
           dword(tbyte(tbyte(tbyte(getContextPointer() + 0xC28F8) + 0x10) + 0x0C) + 0x94) != prev(dword(tbyte(tbyte(tbyte(getContextPointer() + 0xC28F8) + 0x10) + 0x0C) + 0x94))
}

function getItemIDObtained() {
    return word(tbyte(tbyte(tbyte(getContextPointer() + 0xC28F8) + 0x10) + 0x0C) + 0x94)
}

function getItemAmountObtained() {
    return word(tbyte(tbyte(tbyte(getContextPointer() + 0xC28F8) + 0x10) + 0x0C) + 0x96)
}

function getBugCatchingContestScorePlayer() {
    return word(tbyte(tbyte(getContextPointer() + 0xC28F8) + 0x118) + 0xAE)
}

function checkBackdropsLoaded() {
    code = always_true()
    for i in range(0x00, 0x11) {
        code = code && getSavefileDataRemember("8-bit", 0x3F9C + i) <= 0x12
    }
    return code
}

function calculateGBARewards() {
    return 3
         - getSavefileDataRemember("8-bit", 0x3FAA) / 0x12
         - getSavefileDataRemember("8-bit", 0x3FAB) / 0x12
         - getSavefileDataRemember("8-bit", 0x3FAC) / 0x12
         + getSavefileDataRemember("Bit4", 0x3F98)
         + getSavefileDataRemember("Bit5", 0x3F98)
}

function checkBattleHallNewRecord(mode) {
    return __ornext(getBattleHallCurrentStreak(mode) != prev(getBattleHallCurrentStreak(mode)) ||
                    getBattleHallNationalPokedexID(mode) != prev(getBattleHallNationalPokedexID(mode)))
}

function getBattleHallCurrentStreak(mode) {
    if (mode == "Single") {
        return word(getContextPointer() + 0xC12E0)
    }
    if (mode == "Double") {
        return word(getContextPointer() + 0xC12F8)
    }
}

function getBattleHallNationalPokedexID(mode) {
    if (mode == "Single") {
        return word(getContextPointer() + 0xC12E4)
    }
    if (mode == "Double") {
        return word(getContextPointer() + 0xC12FC)
    }
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

// National Pokédex ID, Name, Battle Hall Single Leaderboard ID, Battle Hall Double Leaderboard ID
nationalIDs = [
    [001, "Bulbasaur",  178665, 179140],
    [002, "Ivysaur",    178666, 179141],
    [003, "Venusaur",   178667, 179142],
    [004, "Charmander", 178668, 179143],
    [005, "Charmeleon", 178669, 179144],
    [006, "Charizard",  178670, 179145],
    [007, "Squirtle",   178671, 179146],
    [008, "Wartortle",  178672, 179147],
    [009, "Blastoise",  178673, 179148],
    [010, "Caterpie",   178674, 179149],
    [011, "Metapod",    178675, 179155],
    [012, "Butterfree", 178676, 179156],
    [013, "Weedle",     178677, 179157],
    [014, "Kakuna",     178678, 179158],
    [015, "Beedrill",   178679, 179159],
    [016, "Pidgey",     178680, 179160],
    [017, "Pidgeotto",  178681, 179161],
    [018, "Pidgeot",    178682, 179162],
    [019, "Rattata",    178683, 179163],
    [020, "Raticate",   178684, 179164],
    [021, "Spearow",    178685, 179165],
    [022, "Fearow",     178686, 179166],
    [023, "Ekans",      178687, 179167],
    [024, "Arbok",      178688, 179168],
    [025, "Pikachu",    178689, 179169],
    [026, "Raichu",     178690, 179170],
    [027, "Sandshrew",  178691, 179171],
    [028, "Sandslash",  178692, 179172],
    [029, "Nidoran♀",   178693, 179173],
    [030, "Nidorina",   178694, 179174],
    [031, "Nidoqueen",  178695, 179175],
    [032, "Nidoran♂",   178696, 179176],
    [033, "Nidorino",   178697, 179177],
    [034, "Nidoking",   178698, 179178],
    [035, "Clefairy",   178699, 179179],
    [036, "Clefable",   178700, 179180],
    [037, "Vulpix",     178701, 179181],
    [038, "Ninetales",  178702, 179182],
    [039, "Jigglypuff", 178703, 179183],
    [040, "Wigglytuff", 178704, 179184],
    [041, "Zubat",      178705, 179185],
    [042, "Golbat",     178706, 179186],
    [043, "Oddish",     178707, 179187],
    [044, "Gloom",      178708, 179188],
    [045, "Vileplume",  178709, 179189],
    [046, "Paras",      178710, 179190],
    [047, "Parasect",   178711, 179191],
    [048, "Venonat",    178712, 179192],
    [049, "Venomoth",   178713, 179193],
    [050, "Diglett",    178714, 179194],
    [051, "Dugtrio",    178715, 179195],
    [052, "Meowth",     178716, 179196],
    [053, "Persian",    178717, 179197],
    [054, "Psyduck",    178718, 179198],
    [055, "Golduck",    178719, 179199],
    [056, "Mankey",     178720, 179200],
    [057, "Primeape",   178721, 179201],
    [058, "Growlithe",  178722, 179202],
    [059, "Arcanine",   178723, 179203],
    [060, "Poliwag",    178724, 179204],
    [061, "Poliwhirl",  178725, 179205],
    [062, "Poliwrath",  178726, 179206],
    [063, "Abra",       178727, 179207],
    [064, "Kadabra",    178728, 179208],
    [065, "Alakazam",   178729, 179209],
    [066, "Machop",     178730, 179210],
    [067, "Machoke",    178731, 179211],
    [068, "Machamp",    178732, 179212],
    [069, "Bellsprout", 178733, 179213],
    [070, "Weepinbell", 178734, 179214],
    [071, "Victreebel", 178735, 179215],
    [072, "Tentacool",  178736, 179216],
    [073, "Tentacruel", 178737, 179217],
    [074, "Geodude",    178738, 179218],
    [075, "Graveler",   178739, 179219],
    [076, "Golem",      178740, 179220],
    [077, "Ponyta",     178741, 179221],
    [078, "Rapidash",   178742, 179222],
    [079, "Slowpoke",   178743, 179223],
    [080, "Slowbro",    178744, 179224],
    [081, "Magnemite",  178745, 179225],
    [082, "Magneton",   178746, 179226],
    [083, "Farfetch'd", 178747, 179227],
    [084, "Doduo",      178748, 179228],
    [085, "Dodrio",     178749, 179229],
    [086, "Seel",       178750, 179230],
    [087, "Dewgong",    178751, 179231],
    [088, "Grimer",     178752, 179232],
    [089, "Muk",        178753, 179233],
    [090, "Shellder",   178754, 179234],
    [091, "Cloyster",   178755, 179235],
    [092, "Gastly",     178756, 179236],
    [093, "Haunter",    178757, 179237],
    [094, "Gengar",     178758, 179238],
    [095, "Onix",       178759, 179239],
    [096, "Drowzee",    178760, 179240],
    [097, "Hypno",      178761, 179241],
    [098, "Krabby",     178762, 179242],
    [099, "Kingler",    178763, 179243],
    [100, "Voltorb",    178764, 179244],
    [101, "Electrode",  178765, 179245],
    [102, "Exeggcute",  178766, 179246],
    [103, "Exeggutor",  178767, 179247],
    [104, "Cubone",     178768, 179248],
    [105, "Marowak",    178769, 179249],
    [106, "Hitmonlee",  178770, 179250],
    [107, "Hitmonchan", 178771, 179251],
    [108, "Lickitung",  178772, 179252],
    [109, "Koffing",    178773, 179253],
    [110, "Weezing",    178774, 179254],
    [111, "Rhyhorn",    178775, 179255],
    [112, "Rhydon",     178776, 179256],
    [113, "Chansey",    178777, 179257],
    [114, "Tangela",    178778, 179258],
    [115, "Kangaskhan", 178779, 179259],
    [116, "Horsea",     178780, 179260],
    [117, "Seadra",     178781, 179261],
    [118, "Goldeen",    178782, 179262],
    [119, "Seaking",    178783, 179263],
    [120, "Staryu",     178784, 179264],
    [121, "Starmie",    178785, 179265],
    [122, "Mr. Mime",   178786, 179266],
    [123, "Scyther",    178787, 179267],
    [124, "Jynx",       178788, 179268],
    [125, "Electabuzz", 178789, 179269],
    [126, "Magmar",     178790, 179270],
    [127, "Pinsir",     178791, 179271],
    [128, "Tauros",     178792, 179272],
    [129, "Magikarp",   178793, 179273],
    [130, "Gyarados",   178794, 179274],
    [131, "Lapras",     178795, 179275],
    [132, "Ditto",      178796, 179276],
    [133, "Eevee",      178797, 179277],
    [134, "Vaporeon",   178798, 179278],
    [135, "Jolteon",    178799, 179279],
    [136, "Flareon",    178800, 179280],
    [137, "Porygon",    178801, 179281],
    [138, "Omanyte",    178802, 179282],
    [139, "Omastar",    178803, 179283],
    [140, "Kabuto",     178804, 179284],
    [141, "Kabutops",   178805, 179285],
    [142, "Aerodactyl", 178806, 179286],
    [143, "Snorlax",    178807, 179287],
    [144, "Articuno",   178808, 179288],
    [145, "Zapdos",     178809, 179289],
    [146, "Moltres",    178810, 179290],
    [147, "Dratini",    178811, 179291],
    [148, "Dragonair",  178812, 179292],
    [149, "Dragonite",  178813, 179293],
    [150, "Mewtwo"      ],
    [151, "Mew"         ],
    [152, "Chikorita",  178814, 179294],
    [153, "Bayleef",    178815, 179295],
    [154, "Meganium",   178816, 179296],
    [155, "Cyndaquil",  178817, 179297],
    [156, "Quilava",    178818, 179298],
    [157, "Typhlosion", 178819, 179299],
    [158, "Totodile",   178820, 179300],
    [159, "Croconaw",   178821, 179301],
    [160, "Feraligatr", 178822, 179302],
    [161, "Sentret",    178823, 179303],
    [162, "Furret",     178824, 179304],
    [163, "Hoothoot",   178825, 179305],
    [164, "Noctowl",    178826, 179306],
    [165, "Ledyba",     178827, 179307],
    [166, "Ledian",     178828, 179308],
    [167, "Spinarak",   178829, 179309],
    [168, "Ariados",    178830, 179310],
    [169, "Crobat",     178831, 179311],
    [170, "Chinchou",   178832, 179312],
    [171, "Lanturn",    178833, 179313],
    [172, "Pichu",      178834, 179314],
    [173, "Cleffa",     178835, 179315],
    [174, "Igglybuff",  178836, 179316],
    [175, "Togepi",     178837, 179317],
    [176, "Togetic",    178838, 179318],
    [177, "Natu",       178839, 179319],
    [178, "Xatu",       178840, 179320],
    [179, "Mareep",     178841, 179321],
    [180, "Flaaffy",    178842, 179322],
    [181, "Ampharos",   178843, 179323],
    [182, "Bellossom",  178844, 179324],
    [183, "Marill",     178845, 179325],
    [184, "Azumarill",  178846, 179326],
    [185, "Sudowoodo",  178847, 179327],
    [186, "Politoed",   178848, 179328],
    [187, "Hoppip",     178849, 179329],
    [188, "Skiploom",   178850, 179330],
    [189, "Jumpluff",   178851, 179331],
    [190, "Aipom",      178852, 179332],
    [191, "Sunkern",    178853, 179333],
    [192, "Sunflora",   178854, 179334],
    [193, "Yanma",      178855, 179335],
    [194, "Wooper",     178856, 179336],
    [195, "Quagsire",   178857, 179337],
    [196, "Espeon",     178858, 179338],
    [197, "Umbreon",    178859, 179339],
    [198, "Murkrow",    178860, 179340],
    [199, "Slowking",   178861, 179341],
    [200, "Misdreavous",178862, 179342],
    [201, "Unown",      178863, 179343],
    [202, "Wobbuffet",  178864, 179344],
    [203, "Girafarig",  178865, 179345],
    [204, "Pineco",     178866, 179346],
    [205, "Forretress", 178867, 179347],
    [206, "Dunsparce",  178868, 179348],
    [207, "Gligar",     178869, 179349],
    [208, "Steelix",    178870, 179350],
    [209, "Snubbull",   178871, 179351],
    [210, "Granbull",   178872, 179352],
    [211, "Qwilfish",   178873, 179353],
    [212, "Scizor",     178874, 179354],
    [213, "Shuckle",    178875, 179355],
    [214, "Heracross",  178876, 179356],
    [215, "Sneasel",    178877, 179357],
    [216, "Teddiursa",  178878, 179358],
    [217, "Ursaring",   178879, 179359],
    [218, "Slugma",     178880, 179360],
    [219, "Magcargo",   178881, 179361],
    [220, "Swinub",     178882, 179362],
    [221, "Piloswine",  178883, 179363],
    [222, "Corsola",    178884, 179364],
    [223, "Remoraid",   178885, 179365],
    [224, "Octillery",  178886, 179366],
    [225, "Delibird",   178887, 179367],
    [226, "Mantine",    178888, 179368],
    [227, "Skarmory",   178889, 179369],
    [228, "Houndour",   178890, 179370],
    [229, "Houndoom",   178891, 179371],
    [230, "Kingdra",    178892, 179372],
    [231, "Phanpy",     178893, 179373],
    [232, "Donphan",    178894, 179374],
    [233, "Porygon2",   178895, 179375],
    [234, "Stantler",   178896, 179376],
    [235, "Smeargle",   178897, 179377],
    [236, "Tyrogue",    178898, 179378],
    [237, "Hitmontop",  178899, 179379],
    [238, "Smoochum",   178900, 179380],
    [239, "Elekid",     178901, 179381],
    [240, "Magby",      178902, 179382],
    [241, "Miltank",    178903, 179383],
    [242, "Blissey",    178904, 179384],
    [243, "Raikou",     178905, 179385],
    [244, "Entei",      178906, 179386],
    [245, "Suicune",    178907, 179387],
    [246, "Larvitar",   178908, 179388],
    [247, "Pupitar",    178909, 179389],
    [248, "Tyranitar",  178910, 179390],
    [249, "Lugia",      ],
    [250, "Ho-oh",      ],
    [251, "Celebi",     ],
    [252, "Treecko",    178911, 179391],
    [253, "Grovyle",    178912, 179392],
    [254, "Sceptile",   178913, 179393],
    [255, "Torchic",    178914, 179394],
    [256, "Combusken",  178915, 179395],
    [257, "Blaziken",   178916, 179396],
    [258, "Mudkip",     178917, 179397],
    [259, "Marshtomp",  178918, 179398],
    [260, "Swampert",   178919, 179399],
    [261, "Poochyena",  178920, 179400],
    [262, "Mightyena",  178921, 179401],
    [263, "Zigzagoon",  178922, 179402],
    [264, "Linoone",    178923, 179403],
    [265, "Wurmple",    178924, 179404],
    [266, "Silcoon",    178925, 179405],
    [267, "Beautifly",  178926, 179406],
    [268, "Cascoon",    178927, 179407],
    [269, "Dustox",     178928, 179408],
    [270, "Lotad",      178929, 179409],
    [271, "Lombre",     178930, 179410],
    [272, "Ludicolo",   178931, 179411],
    [273, "Seedot",     178932, 179412],
    [274, "Nuzleaf",    178933, 179413],
    [275, "Shiftry",    178934, 179414],
    [276, "Taillow",    178935, 179415],
    [277, "Swellow",    178936, 179416],
    [278, "Wingull",    178937, 179417],
    [279, "Pelipper",   178938, 179418],
    [280, "Ralts",      178939, 179419],
    [281, "Kirlia",     178940, 179420],
    [282, "Gardevoir",  178941, 179421],
    [283, "Surskit",    178942, 179422],
    [284, "Masquerain", 178943, 179423],
    [285, "Shroomish",  178944, 179424],
    [286, "Breloom",    178945, 179425],
    [287, "Slakoth",    178946, 179426],
    [288, "Vigoroth",   178947, 179427],
    [289, "Slaking",    178948, 179428],
    [290, "Nincada",    178949, 179429],
    [291, "Ninjask",    178950, 179430],
    [292, "Shedinja",   178951, 179431],
    [293, "Whismur",    178952, 179432],
    [294, "Loudred",    178953, 179433],
    [295, "Exploud",    178954, 179434],
    [296, "Makuhita",   178955, 179435],
    [297, "Hariyama",   178956, 179436],
    [298, "Azurill",    178957, 179437],
    [299, "Nosepass",   178958, 179438],
    [300, "Skitty",     178959, 179439],
    [301, "Delcatty",   178960, 179440],
    [302, "Sableye",    178961, 179441],
    [303, "Mawile",     178962, 179442],
    [304, "Aron",       178963, 179443],
    [305, "Lairon",     178964, 179444],
    [306, "Aggron",     178965, 179445],
    [307, "Meditite",   178966, 179446],
    [308, "Medicham",   178967, 179447],
    [309, "Electrike",  178968, 179448],
    [310, "Manectric",  178969, 179449],
    [311, "Plusle",     178970, 179450],
    [312, "Minun",      178971, 179451],
    [313, "Volbeat",    178972, 179452],
    [314, "Illumise",   178973, 179453],
    [315, "Roselia",    178974, 179454],
    [316, "Gulpin",     178975, 179455],
    [317, "Swalot",     178976, 179456],
    [318, "Carvanha",   178977, 179457],
    [319, "Sharpedo",   178978, 179458],
    [320, "Wailmer",    178979, 179459],
    [321, "Wailord",    178980, 179460],
    [322, "Numel",      178981, 179461],
    [323, "Camerupt",   178982, 179462],
    [324, "Torkoal",    178983, 179463],
    [325, "Spoink",     178984, 179464],
    [326, "Grumpig",    178985, 179465],
    [327, "Spinda",     178986, 179466],
    [328, "Trapinch",   178987, 179467],
    [329, "Vibrava",    178988, 179468],
    [330, "Flygon",     178989, 179469],
    [331, "Cacnea",     178990, 179470],
    [332, "Cacturne",   178991, 179471],
    [333, "Swablu",     178992, 179472],
    [334, "Altaria",    178993, 179473],
    [335, "Zangoose",   178994, 179474],
    [336, "Seviper",    178995, 179475],
    [337, "Lunatone",   178996, 179476],
    [338, "Solrock",    178997, 179477],
    [339, "Barboach",   178998, 179478],
    [340, "Whiscash",   178999, 179479],
    [341, "Corphish",   179000, 179480],
    [342, "Crawdaunt",  179001, 179481],
    [343, "Baltoy",     179002, 179482],
    [344, "Claydol",    179003, 179483],
    [345, "Lileep",     179004, 179484],
    [346, "Cradily",    179005, 179485],
    [347, "Anorith",    179006, 179486],
    [348, "Armaldo",    179007, 179487],
    [349, "Feebas",     179008, 179488],
    [350, "Milotic",    179009, 179489],
    [351, "Castform",   179010, 179490],
    [352, "Kecleon",    179011, 179491],
    [353, "Shuppet",    179012, 179492],
    [354, "Banette",    179013, 179493],
    [355, "Duskull",    179014, 179494],
    [356, "Dusclops",   179015, 179495],
    [357, "Tropius",    179016, 179496],
    [358, "Chimecho",   179017, 179497],
    [359, "Absol",      179018, 179498],
    [360, "Wynaut",     179019, 179499],
    [361, "Snorunt",    179020, 179500],
    [362, "Glalie",     179021, 179501],
    [363, "Spheal",     179022, 179502],
    [364, "Sealeo",     179023, 179503],
    [365, "Walrein",    179024, 179504],
    [366, "Clamperl",   179025, 179505],
    [367, "Huntail",    179026, 179506],
    [368, "Gorebyss",   179027, 179507],
    [369, "Relicanth",  179028, 179508],
    [370, "Luvdisc",    179029, 179509],
    [371, "Bagon",      179030, 179510],
    [372, "Shelgon",    179031, 179511],
    [373, "Salamence",  179032, 179512],
    [374, "Beldum",     179033, 179513],
    [375, "Metang",     179034, 179514],
    [376, "Metagross",  179035, 179515],
    [377, "Regirock",   179036, 179516],
    [378, "Regice",     179037, 179517],
    [379, "Registeel",  179038, 179518],
    [380, "Latias",     179039, 179519],
    [381, "Latios",     179040, 179520],
    [382, "Kyogre",     ],
    [383, "Groudon",    ],
    [384, "Rayquaza",   ],
    [385, "Jirachi",    ],
    [386, "Deoxys",     ],
    [387, "Turtwig",    179041, 179521],
    [388, "Grotle",     179042, 179522],
    [389, "Torterra",   179043, 179523],
    [390, "Chimchar",   179044, 179524],
    [391, "Monferno",   179045, 179525],
    [392, "Infernape",  179046, 179526],
    [393, "Piplup",     179047, 179527],
    [394, "Prinplup",   179048, 179528],
    [395, "Empoleon",   179049, 179529],
    [396, "Starly",     179050, 179530],
    [397, "Staravia",   179051, 179531],
    [398, "Staraptor",  179052, 179532],
    [399, "Bidoof",     179053, 179533],
    [400, "Bibarel",    179054, 179534],
    [401, "Kricketot",  179055, 179535],
    [402, "Kricketune", 179056, 179536],
    [403, "Shinx",      179057, 179537],
    [404, "Luxio",      179058, 179538],
    [405, "Luxray",     179059, 179539],
    [406, "Budew",      179060, 179540],
    [407, "Roserade",   179061, 179541],
    [408, "Cranidos",   179062, 179542],
    [409, "Rampardos",  179063, 179543],
    [410, "Shieldon",   179064, 179544],
    [411, "Bastiodon",  179065, 179545],
    [412, "Burmy",      179066, 179546],
    [413, "Wormadam",   179067, 179547],
    [414, "Mothim",     179068, 179548],
    [415, "Combee",     179069, 179549],
    [416, "Vespiquen",  179070, 179550],
    [417, "Pachirisu",  179071, 179551],
    [418, "Buizel",     179072, 179552],
    [419, "Floatzel",   179073, 179553],
    [420, "Cherubi",    179074, 179554],
    [421, "Cherrim",    179075, 179555],
    [422, "Shellos",    179076, 179556],
    [423, "Gastrodon",  179077, 179557],
    [424, "Ambipom",    179078, 179558],
    [425, "Drifloon",   179079, 179559],
    [426, "Drifblim",   179080, 179560],
    [427, "Buneary",    179081, 179561],
    [428, "Lopunny",    179082, 179562],
    [429, "Mismagius",  179083, 179563],
    [430, "Honchkrow",  179084, 179564],
    [431, "Glameow",    179085, 179565],
    [432, "Purugly",    179086, 179566],
    [433, "Chingling",  179087, 179567],
    [434, "Stunky",     179088, 179568],
    [435, "Skuntank",   179089, 179569],
    [436, "Bronzor",    179090, 179570],
    [437, "Bronzong",   179091, 179571],
    [438, "Bonsly",     179092, 179572],
    [439, "Mime Jr.",   179093, 179573],
    [440, "Happiny",    179094, 179574],
    [441, "Chatot",     179095, 179575],
    [442, "Spiritomb",  179096, 179576],
    [443, "Gible",      179097, 179577],
    [444, "Gabite",     179098, 179578],
    [445, "Garchomp",   179099, 179579],
    [446, "Munchlax",   179100, 179580],
    [447, "Riolu",      179101, 179581],
    [448, "Lucario",    179102, 179582],
    [449, "Hippopotas", 179103, 179583],
    [450, "Hippowdon",  179104, 179584],
    [451, "Skorupi",    179105, 179585],
    [452, "Drapion",    179106, 179586],
    [453, "Croagunk",   179107, 179587],
    [454, "Toxicroak",  179108, 179588],
    [455, "Carnivine",  179109, 179589],
    [456, "Finneon",    179110, 179590],
    [457, "Lumineon",   179111, 179591],
    [458, "Mantyke",    179112, 179592],
    [459, "Snover",     179113, 179593],
    [460, "Abomasnow",  179114, 179594],
    [461, "Weavile",    179115, 179595],
    [462, "Magnezone",  179116, 179596],
    [463, "Lickilicky", 179117, 179597],
    [464, "Rhyperior",  179118, 179598],
    [465, "Tangrowth",  179119, 179599],
    [466, "Electivire", 179120, 179600],
    [467, "Magmortar",  179121, 179601],
    [468, "Togekiss",   179122, 179602],
    [469, "Yanmega",    179123, 179603],
    [470, "Leafeon",    179124, 179604],
    [471, "Glaceon",    179125, 179605],
    [472, "Gliscor",    179126, 179606],
    [473, "Mamoswine",  179127, 179607],
    [474, "Porygon-Z",  179128, 179608],
    [475, "Gallade",    179129, 179609],
    [476, "Probopass",  179130, 179610],
    [477, "Dusknoir",   179131, 179611],
    [478, "Froslass",   179132, 179612],
    [479, "Rotom",      179133, 179613],
    [480, "Uxie",       179134, 179614],
    [481, "Mesprit",    179135, 179615],
    [482, "Azelf",      179136, 179616],
    [483, "Dialga",     ],
    [484, "Palkia",     ],
    [485, "Heatran",    179137, 179617],
    [486, "Regigigas",  179138, 179618],
    [487, "Giratina",   ],
    [488, "Cresselia",  179139, 179619],
    [489, "Phione"      ],
    [490, "Manaphy"     ],
    [491, "Darkrai"     ],
    [492, "Shaymin"     ],
    [493, "Arceus"      ]
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

bannedPokemonInBattleHall = [
    getNationalIDOfPokemon("Mewtwo"),
    getNationalIDOfPokemon("Mew"),
    getNationalIDOfPokemon("Lugia"),
    getNationalIDOfPokemon("Ho-oh"),
    getNationalIDOfPokemon("Celebi"),
    getNationalIDOfPokemon("Kyogre"),
    getNationalIDOfPokemon("Groudon"),
    getNationalIDOfPokemon("Rayquaza"),
    getNationalIDOfPokemon("Jirachi"),
    getNationalIDOfPokemon("Deoxys"),
    getNationalIDOfPokemon("Dialga"),
    getNationalIDOfPokemon("Palkia"),
    getNationalIDOfPokemon("Giratina"),
    getNationalIDOfPokemon("Phione"),
    getNationalIDOfPokemon("Manaphy"),
    getNationalIDOfPokemon("Darkrai"),
    getNationalIDOfPokemon("Shaymin"),
    getNationalIDOfPokemon("Arceus"),
]

//--------------------------------------------------
// Completionist - Achievements

achievement(
    title = "Special Forest Dwellers", points = 5, type = "missable",
    description = "Find and befriend the Spiky-eared Pichu in Ilex Forest and show it to Professor Elm.",
    id = 123514, badge = "745905", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x3D &&
              getSavefileDataRemember("16-bit", 0x104A) == 0x02 &&
              getSavefileDataRemember("16-bit", 0x1052) == 0x01 &&
              prev(getSavefileDataRemember("16-bit", 0x1052)) == 0x00
)

achievement(
    title = "Hero of Time", points = 5, type = "missable",
    description = "Travel through time with the help of Celebi and stop Team Rocket's comeback.",
    id = 123533, badge = "745906", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x75 &&
              getSavefileDataRemember("16-bit", 0xFF0) == 0x05 &&
              prev(getSavefileDataRemember("16-bit", 0xFF0)) == 0x04
)

achievement(
    title = "Mystery Inside the Enigma Stone", points = 5,
    description = "Bring the Enigma Stone to the Pewter Museum of Science and capture the Eon Pokemon that gets summoned.",
    id = 123534, badge = "745907", set = 45861,
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
    id = 124349, badge = "745909", set = 45861,
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
    id = 123473, badge = "745912", set = 45861,
    trigger = checkSaveLoaded() &&
              __ornext(getMapID() == 0x13B ||
                       getMapID() == 0x1EC) &&
              getSavefileDataRemember("16-bit", 0xFEA) == 0x0A &&
              prev(getSavefileDataRemember("16-bit", 0xFEA)) == 0x09
)

achievement(
    title = "A Second Chance of Life", points = 3,
    description = "Witness the creation of another legendary Pokémon egg by an Arceus in the Sinjoh Ruins.",
    id = 650846, badge = "743159", set = 45861,
    trigger = checkSaveLoaded() &&
              __ornext(getMapID() == 0x13B ||
                       getMapID() == 0x1EC) &&
              prev(getMapID() == 0x20A) &&
              getSavefileDataRemember("16-bit", 0xFEA) == 0x0E
)

achievement(
    title = "Joy of Joy", points = 5,
    description = "Show Nurse Joy a black trainer card and get special treatment from her.",
    id = 651491, badge = "743853", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == prev(getMapID()) &&
              getSavefileDataRemember("Bit4", 0x10E0) > prev(getSavefileDataRemember("Bit4", 0x10E0))
)

achievement(
    title = "Illness of Strength", points = 10,
    description = "Show Nurse Joy a Pokémon that got infected with Pokérus.",
    id = 651492, badge = "743852", set = 45861,
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
    title = "Something Is Bugging Me", points = 25,
    description = "Win the Bug-Catching Contest with a Pokémon that has a score of 380 points or higher.",
    id = 653630, badge = "745588", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x60 &&
              checkItemObtained() &&
              __ornext(getItemIDObtained() == 0x50 ||
                       getItemIDObtained() == 0x51 ||
                       getItemIDObtained() == 0x52 ||
                       getItemIDObtained() == 0x53 ||
                       getItemIDObtained() == 0x54 ||
                       getItemIDObtained() == 0x55 ||
                       getItemIDObtained() == 0x6B ||
                       getItemIDObtained() == 0x6C ||
                       getItemIDObtained() == 0x6D ||
                       getItemIDObtained() == 0x6E ||
                       getItemIDObtained() == 0xE5 ||
                       getItemIDObtained() == 0x9E ||
                       getItemIDObtained() == 0x127) &&
              getItemAmountObtained() == 0x01 &&
              getBugCatchingContestScorePlayer() >= 380 &&
              getBugCatchingContestScorePlayer() <= 400
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
    title = "Atomic Brain", points = 50,
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

achievement(
    title = "Presents From the Past", points = 2,
    description = "Obtain the Crown, the Tiara, the Underground backdrop, the Seafloor backdrop and the Sky backdrop from the woman in the Pal Park.",
    id = 653649, badge = "745591", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == 0x1DF &&
              measured(calculateGBARewards() == 5,
                       when = checkBackdropsLoaded()) &&
              prev(calculateGBARewards()) == 4
)

achievement(
    title = "Sightseeing in the City", points = 25,
    description = "Fill the photo album with a picture of every possible photo location that is inside a city, a town or a building.",
    id = 653626, badge = "745584", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == prev(getMapID()) &&
              calculatePhotoAlbumPicturesCity() &&
              checkPhotoAlbumPictureObtained() &&
              never(checkHeapLoaded(0x0B) &&
                    getField2DataStateID() == 0x6D)
)

achievement(
    title = "Sightseeing in the Nature", points = 25,
    description = "Fill the photo album with a picture of every possible photo location that is on a route, in a cave, in a forest, at the Ruins of Alph, at the National Park or at Mt. Silver.",
    id = 653627, badge = "745585", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == prev(getMapID()) &&
              calculatePhotoAlbumPicturesNature() &&
              checkPhotoAlbumPictureObtained() &&
              never(checkHeapLoaded(0x0B) &&
                    getField2DataStateID() == 0x6D)
)

achievement(
    title = "Sightseeing with Someone Special", points = 25, type = "missable",
    description = "Fill the photo album with a picture of every possible photo location with a gym leader, Professor Oak, the Day-Care Man and the Dragon's Den master.",
    id = 653628, badge = "745586", set = 45861,
    trigger = checkSaveLoaded() &&
              getMapID() == prev(getMapID()) &&
              calculatePhotoAlbumPicturesCelebrity() &&
              checkPhotoAlbumPictureObtained() &&
              never(checkHeapLoaded(0x0B) &&
                    getField2DataStateID() == 0x6D)
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
             checkTalkingToNPCID(0x11A) &&
             checkTalkingToNPCIDChanged() &&
             ((getCoordinateX() >= 0x07 &&
               getCoordinateX() <= 0x09 &&
               getCoordinateY() >= 0x07 &&
               getCoordinateY() <= 0x08) ||
              (getCoordinateX() >= 0x08 &&
               getCoordinateX() <= 0x09 &&
               getCoordinateY() >= 0x07 &&
               getCoordinateY() <= 0x09)),
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

for pokemon in nationalIDs {
    if (none_of(bannedPokemonInBattleHall, bannedNationalID => pokemon[0] == bannedNationalID)) {
        leaderboard(
            id = nationalIDs[pokemon[0] - 1][2], set = 45861, title = "Battle Hall",
            description = format("Highest win streak with {0} in the Single Battle mode of the Battle Hall.", nationalIDs[pokemon[0] - 1][1]),
            start  = checkSaveLoaded() &&
                     getMapID() == 0x114 &&
                     getCoordinateX() == 0x07 &&
                     getCoordinateY() == 0x09 &&
                     checkBattleHallNewRecord("Single") &&
                     getBattleHallNationalPokedexID("Single") == nationalIDs[pokemon[0] - 1][0],
            cancel = always_false(),
            submit = always_true(),
            value  = getBattleHallCurrentStreak("Single"),
            format = "VALUE",
            lower_is_better = false
        )
    }
}

for pokemon in nationalIDs {
    if (none_of(bannedPokemonInBattleHall, bannedNationalID => pokemon[0] == bannedNationalID)) {
        leaderboard(
            id = nationalIDs[pokemon[0] - 1][3], set = 45861, title = "Battle Hall",
            description = format("Highest win streak with {0} in the Double Battle mode of the Battle Hall.", nationalIDs[pokemon[0] - 1][1]),
            start  = checkSaveLoaded() &&
                     getMapID() == 0x114 &&
                     getCoordinateX() == 0x07 &&
                     getCoordinateY() == 0x09 &&
                     checkBattleHallNewRecord("Double") &&
                     getBattleHallNationalPokedexID("Double") == nationalIDs[pokemon[0] - 1][0],
            cancel = always_false(),
            submit = always_true(),
            value  = getBattleHallCurrentStreak("Double"),
            format = "VALUE",
            lower_is_better = false
        )
    }
}

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

