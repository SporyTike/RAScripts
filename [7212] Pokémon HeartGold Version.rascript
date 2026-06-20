// Pokémon HeartGold Version | Pokémon SoulSilver Version
// #ID = 7212

//--------------------------------------------------
// Functions

function pseudoImpossibleCondition() {
    return dword(0x000BA8) == 0x12345678
}

function getVersionPointer() {
    return remembered(tbyte(tbyte(0x000BA8) + 0x20))
}

function calculateSolidaryCrowns() {
    return word(getVersionPointer() + 0xD9EA) / 420
         + word(getVersionPointer() + 0xD9EA) / 450
         - word(getVersionPointer() + 0xD9EA) / 840
         - word(getVersionPointer() + 0xD9EA) / 900
         + word(getVersionPointer() + 0xDA16) / 420
         + word(getVersionPointer() + 0xDA16) / 450
         - word(getVersionPointer() + 0xDA16) / 840
         - word(getVersionPointer() + 0xDA16) / 900
         + word(getVersionPointer() + 0xDA42) / 420
         + word(getVersionPointer() + 0xDA42) / 450
         - word(getVersionPointer() + 0xDA42) / 840
         - word(getVersionPointer() + 0xDA42) / 900
         + word(getVersionPointer() + 0xDA6E) / 420
         + word(getVersionPointer() + 0xDA6E) / 450
         - word(getVersionPointer() + 0xDA6E) / 840
         - word(getVersionPointer() + 0xDA6E) / 900
         + word(getVersionPointer() + 0xDA9A) / 420
         + word(getVersionPointer() + 0xDA9A) / 450
         - word(getVersionPointer() + 0xDA9A) / 840
         - word(getVersionPointer() + 0xDA9A) / 900
}

function calculatePokeathlonMedals() {
    sum = 0
    for pokemon in range (0, 492) {
        sum = sum + bitcount(getVersionPointer() + 0xDAC0 + pokemon)
    }
    
    return sum
}

function calculateMedalistPokemon() {
    sum = 0
    for pokemon in range (0, 492) {
        sum = sum + (bitcount(getVersionPointer() + 0xDAC0 + pokemon) / 5)
    }
    
    return sum
}

function calculateBeatenNormalRecords() {
    return tally(10, once(word(getVersionPointer() + 0xDCB0) < 3000 &&  // Hurdle Dash -> 100.0
                          word(getVersionPointer() + 0xDCB0) > 0),
                     once(word(getVersionPointer() + 0xDCDC) > 35 &&    // Pennant Capture
                          word(getVersionPointer() + 0xDCDC) < 5000),
                     once(word(getVersionPointer() + 0xDD08) > 40 &&    // Circle Push
                          word(getVersionPointer() + 0xDD08) < 5000),
                     once(word(getVersionPointer() + 0xDD34) > 80 &&    // Block Smash
                          word(getVersionPointer() + 0xDD34) < 5000),
                     once(word(getVersionPointer() + 0xDD60) > 40 &&    // Disc Catch
                          word(getVersionPointer() + 0xDD60) < 5000),
                     once(word(getVersionPointer() + 0xDD8C) > 350 &&   // Lamp Jump
                          word(getVersionPointer() + 0xDD8C) < 5000),
                     once(word(getVersionPointer() + 0xDDB8) > 12288 && // Relay Run -> 12.0
                          word(getVersionPointer() + 0xDDB8) < 50000),
                     once(word(getVersionPointer() + 0xDDE4) > 70 &&    // Ring Drop
                          word(getVersionPointer() + 0xDDE4) < 5000),
                     once(word(getVersionPointer() + 0xDE10) > 30 &&    // Snow Throw
                          word(getVersionPointer() + 0xDE10) < 5000),
                     once(word(getVersionPointer() + 0xDE3C) > 3 &&    // Goal Roll
                          word(getVersionPointer() + 0xDE3C) < 5000))
}

function calculateBeatenMasterRecords() {
    return tally(10, once(word(getVersionPointer() + 0xDCB0) < 2400 &&  // Hurdle Dash -> 80.0
                          word(getVersionPointer() + 0xDCB0) > 0),
                     once(word(getVersionPointer() + 0xDCDC) > 50 &&    // Pennant Capture
                          word(getVersionPointer() + 0xDCDC) < 5000),
                     once(word(getVersionPointer() + 0xDD08) > 60 &&    // Circle Push
                          word(getVersionPointer() + 0xDD08) < 5000),
                     once(word(getVersionPointer() + 0xDD34) > 130 &&   // Block Smash
                          word(getVersionPointer() + 0xDD34) < 5000),
                     once(word(getVersionPointer() + 0xDD60) > 70 &&    // Disc Catch
                          word(getVersionPointer() + 0xDD60) < 5000),
                     once(word(getVersionPointer() + 0xDD8C) > 500 &&   // Lamp Jump
                          word(getVersionPointer() + 0xDD8C) < 5000),
                     once(word(getVersionPointer() + 0xDDB8) > 16384 && // Relay Run -> 16.0
                          word(getVersionPointer() + 0xDDB8) < 50000),
                     once(word(getVersionPointer() + 0xDDE4) > 100 &&   // Ring Drop
                          word(getVersionPointer() + 0xDDE4) < 5000),
                     once(word(getVersionPointer() + 0xDE10) > 55 &&    // Snow Throw
                          word(getVersionPointer() + 0xDE10) < 5000),
                     once(word(getVersionPointer() + 0xDE3C) > 9 &&     // Goal Roll
                          word(getVersionPointer() + 0xDE3C) < 5000))
}

function calculateFriendshipPoints() {
    return word(getVersionPointer() + 0xD9EA)
         + word(getVersionPointer() + 0xDA16)
         + word(getVersionPointer() + 0xDA42)
         + word(getVersionPointer() + 0xDA6E)
         + word(getVersionPointer() + 0xDA9A)
         + word(getVersionPointer() + 0xE4D0)
         + word(getVersionPointer() + 0xE4D2)
         + word(getVersionPointer() + 0xE4D4)
         + word(getVersionPointer() + 0xE4D6)
         + word(getVersionPointer() + 0xE4D8)
         + word(getVersionPointer() + 0xE4DA)
         + word(getVersionPointer() + 0xE4DC)
         + word(getVersionPointer() + 0xE4DE)
         + word(getVersionPointer() + 0xE4E0)
         + word(getVersionPointer() + 0xE4E2)
         + calculatePokeathlonMedals()
}

//--------------------------------------------------
// Achievements

achievement(
    title = "Unbeatable Pokéathlete", points = 25,
    description = "Obtain all 10 Solidarity Crowns in the Pokéathlon Dome by getting an end result of 450 or more in every course.",
    id = 125519, badge = "138582", published = "14.09.2020 16:23:35", modified = "01.10.2020 23:59:42",
    trigger = measured(calculateSolidaryCrowns() == 10) &&
              prev(calculateSolidaryCrowns()) >= 8 &&
              prev(calculateSolidaryCrowns()) < 10
)

achievement(
    title = "Get Potential out of Everything", points = 100,
    description = "Obtain all 10 Trust Crowns in the Pokéathlon Dome by having at least 200 Medalist Pokémon.",
    id = 125520, badge = "138583", published = "14.09.2020 16:23:40", modified = "22.01.2023 09:27:57",
    trigger = measured(calculateMedalistPokemon() == 200) &&
              prev(calculateMedalistPokemon()) >= 190 &&
              prev(calculateMedalistPokemon()) < 200
)

achievement(
    title = "Novice Team Captain", points = 10,
    description = "Obtain a star on your Trainer Card by beating the normal record of every Pokéathlon discipline.",
    id = 125521, badge = "138586", published = "14.09.2020 16:23:44", modified = "01.10.2020 23:59:48",
    trigger = (measured(calculateBeatenNormalRecords(), when = byte(getVersionPointer() + 0x1000) != 0x00 &&
                                                               once(word(tbyte(0x000BA8) + 0xBECF4) == 0x3F0)) &&
               unless(word(tbyte(0x000BA8) + 0xBECF4) == 0x3F0 &&
                      calculateBeatenNormalRecords()) ||
              (pseudoImpossibleCondition() &&
               never(tbyte(tbyte(0x000BA8) + 0x20) == 0x00000000) &&
               never(byte(getVersionPointer() + 0x1000) == 0x00)))
)

achievement(
    title = "Professional Team Captain", points = 25,
    description = "Obtain all 10 Potential Crowns in the Pokéathlon Dome by beating the master record of every Pokéathlon discipline.",
    id = 125522, badge = "138587", published = "14.09.2020 16:23:45", modified = "26.07.2022 12:38:01",
    trigger = (measured(calculateBeatenMasterRecords(), when = byte(getVersionPointer() + 0x1000) != 0x00 &&
                                                               once(word(tbyte(0x000BA8) + 0xBECF4) == 0x3F0)) &&
               unless(word(tbyte(0x000BA8) + 0xBECF4) == 0x3F0 &&
                      calculateBeatenMasterRecords()) ||
              (pseudoImpossibleCondition() &&
               never(tbyte(tbyte(0x000BA8) + 0x20) == 0x00000000) &&
               never(byte(getVersionPointer() + 0x1000) == 0x00)))
)

achievement(
    title = "Greatest Pokéathlete of All Time", points = 50,
    description = "Obtain all 10 Friendship Crowns in the Pokéathlon Dome by having a total of 4.500 Pokéathlon Points.",
    id = 125523, badge = "138585", published = "14.09.2020 16:23:49", modified = "21.02.2021 21:37:48",
    trigger = measured(calculateFriendshipPoints() >= 4500) &&
              prev(calculateFriendshipPoints()) >= 4000 &&
              prev(calculateFriendshipPoints()) < 4500
)

achievement(
    title = "Look How Good I Am", points = 25,
    description = "Obtain all 5 Special Trophies in the Pokéathlon Dome.",
    id = 125705, badge = "138590", published = "16.09.2020 10:18:23", modified = "01.10.2020 23:59:55",
    trigger = always_true()
)
