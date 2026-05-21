// ~Hack~ Pokémon Snap: Custom Levels
// #ID = 15385

//--------------------------------------------------
// Arrays and Dictionaries

lettersAscii = {
    0x20: " ",
    0x42: "B",
    0x45: "E",
    0x52: "R",
    0x61: "a",
    0x65: "e",
    0x68: "h",
    0x69: "i",
    0x6D: "m",
    0x6E: "n",
    0x73: "s",
    0x74: "t",
    
}

//--------------------------------------------------
// Functions

function getGameState() {
    return byte(0x0479EC)
}

function getCourseID() {
    return byte(0x0AC0C0)
}

function checkCourse1Name(name) {
    letterArray = []
    for letter in range(0, length(name)) {
        currentLetter = substring(name, letter, 1)
        for letterAscii in lettersAscii {
            if (lettersAscii[letterAscii] == currentLetter) {
                array_push(letterArray, letterAscii)
    }   }   }
    code = always_true()
    address = 0x0AF3E0
    arrayIndex = 0
    for letter in letterArray {
        code = code && byte(address + 0x03 - (arrayIndex % 4) + (arrayIndex / 4) * 4) == letter
        arrayIndex = arrayIndex + 1
    }
    return code
}

function getCurrentPhotoScore() {
    return word(0x232A6C)
}

function checkPictureShownToProfessorOak(pokemonID) {
    pictureDataStart = 0x2291A0
    currentPictureSlot = byte(0x232F74)
    currentPictureData = pictureDataStart + (currentPictureSlot * 28)
    return word(currentPictureData + 0x08) == pokemonID &&
           word(currentPictureData + 0x04) == getCurrentPhotoScore()
}

function checkScoreOfPictureShownToProfessorOak(pokemonID, score) {
    pictureDataStart = 0x2291A0
    currentPictureSlot = byte(0x232F74)
    currentPictureData = pictureDataStart + (currentPictureSlot * 28)
    return checkPictureShownToProfessorOak(pokemonID) &&
           word(currentPictureData + 0x04) >= score
}

function checkMultiplePokemonFlagOfPictureShownToProfessorOak(pokemonID) {
    pictureDataStart = 0x2291A0
    currentPictureSlot = byte(0x232F74)
    currentPictureData = pictureDataStart + (currentPictureSlot * 28)
    return checkPictureShownToProfessorOak(pokemonID) &&
           word(currentPictureData + 0x1A) == 0x01
}

function hitOnPokemonPhotographedInCourse(course, pokemonID) {
    return once(checkCourse1Name(course) &&
                byte(0x3AE408) == byte(0x3AE470) &&
                byte(0x3AE408) == pokemonID)
}

//--------------------------------------------------
// Achievements

achievement(
    title = "Hunt in the Basement", points = 5, type="progression",
    description = "[Basement] Take a pictures of eight Pokémon species in the Basement in one session.",
    id = 151441, badge = "169745", published = "28.04.2021 17:17:05", modified = "15.05.2024 11:46:42",
    trigger = measured(tally(8,
                  hitOnPokemonPhotographedInCourse("Basement", 0x10),
                  hitOnPokemonPhotographedInCourse("Basement", 0x19),
                  hitOnPokemonPhotographedInCourse("Basement", 0x34),
                  hitOnPokemonPhotographedInCourse("Basement", 0x54),
                  hitOnPokemonPhotographedInCourse("Basement", 0x71),
                  hitOnPokemonPhotographedInCourse("Basement", 0x73),
                  hitOnPokemonPhotographedInCourse("Basement", 0x7B),
                  hitOnPokemonPhotographedInCourse("Basement", 0x83),
                  hitOnPokemonPhotographedInCourse("Basement", 0x85),
                  hitOnPokemonPhotographedInCourse("Basement", 0x8F)))
)

achievement(
    title = "Pidgeon in the Garage", points = 3,
    description = "[Basement] Take a picture of a Pidgey which is worth at least 2,500 points.",
    id = 151455, badge = "169759", published = "28.04.2021 17:59:41", modified = "01.06.2021 17:07:09",
    trigger = checkCourse1Name("Basement") &&
              getGameState() == 0x0F &&
              checkScoreOfPictureShownToProfessorOak(0x10, 2500)
)

achievement(
    title = "Two-Headed Bird", points = 3,
    description = "[Basement] Take a picture of a Doduo which is worth at least 3,000 points.",
    id = 151456, badge = "169760", published = "28.04.2021 18:10:30", modified = "01.06.2021 17:07:09",
    trigger = checkCourse1Name("Basement") &&
              getGameState() == 0x0F &&
              checkScoreOfPictureShownToProfessorOak(0x54, 3000)
)

achievement(
    title = "Come on! Give Me a Smile!", points = 3,
    description = "[Basement] Take a picture of a Kangaskhan which is worth at least 1,500 points.",
    id = 151457, badge = "169761", published = "28.04.2021 18:10:30", modified = "01.06.2021 17:07:09",
    trigger = checkCourse1Name("Basement") &&
              getGameState() == 0x0F &&
              checkScoreOfPictureShownToProfessorOak(0x73, 1500)
)

achievement(
    title = "The Monster in the Basement", points = 3,
    description = "[Basement] Take a picture of a Lapras which is worth at least 3,500 points.",
    id = 151458, badge = "169762", published = "28.04.2021 18:10:31", modified = "01.06.2021 17:07:10",
    trigger = checkCourse1Name("Basement") &&
              getGameState() == 0x0F &&
              checkScoreOfPictureShownToProfessorOak(0x83, 3500)
)

achievement(
    title = "Outer Space", points = 5, type="progression",
    description = "[Rith Essa] Take a pictures of eleven Pokémon species on Rith Essa in one session.",
    id = 151442, badge = "169749", published = "28.04.2021 17:29:54", modified = "28.04.2021 17:32:11",
    trigger = measured(tally(11,
                  hitOnPokemonPhotographedInCourse("Rith Essa", 0x0C),
                  hitOnPokemonPhotographedInCourse("Rith Essa", 0x10),
                  hitOnPokemonPhotographedInCourse("Rith Essa", 0x19),
                  hitOnPokemonPhotographedInCourse("Rith Essa", 0x34),
                  hitOnPokemonPhotographedInCourse("Rith Essa", 0x54),
                  hitOnPokemonPhotographedInCourse("Rith Essa", 0x71),
                  hitOnPokemonPhotographedInCourse("Rith Essa", 0x73),
                  hitOnPokemonPhotographedInCourse("Rith Essa", 0x7B),
                  hitOnPokemonPhotographedInCourse("Rith Essa", 0x83),
                  hitOnPokemonPhotographedInCourse("Rith Essa", 0x85),
                  hitOnPokemonPhotographedInCourse("Rith Essa", 0x8F)))
)

achievement(
    title = "Beautiful Flight", points = 3,
    description = "[Rith Essa] Take a picture of a Butterfree which is worth at least 3,000 points.",
    id = 151459, badge = "169763", published = "28.04.2021 18:18:27", modified = "01.06.2021 17:07:10",
    trigger = checkCourse1Name("Rith Essa") &&
              getGameState() == 0x0F &&
              checkScoreOfPictureShownToProfessorOak(0x0C, 3000)
)

achievement(
    title = "Don't Disturb the Bird", points = 3,
    description = "[Rith Essa] Take a picture of a Pidgey which is worth at least 4,000 points.",
    id = 151460, badge = "169765", published = "28.04.2021 18:22:47", modified = "01.06.2021 17:07:10",
    trigger = checkCourse1Name("Rith Essa") &&
              getGameState() == 0x0F &&
              checkScoreOfPictureShownToProfessorOak(0x10, 4000)
)

achievement(
    title = "Street Surfer", points = 3,
    description = "[Rith Essa] Take a picture of a Pikachu which is worth at least 5,000 points.",
    id = 151461, badge = "169766", published = "28.04.2021 18:26:18", modified = "01.06.2021 17:07:11",
    trigger = checkCourse1Name("Rith Essa") &&
              getGameState() == 0x0F &&
              checkScoreOfPictureShownToProfessorOak(0x19, 5000)
)

achievement(
    title = "Angry Dancer", points = 3,
    description = "[Rith Essa] Take a picture of a Meowth which is worth at least 4,000 points.",
    id = 151462, badge = "169767", published = "28.04.2021 18:30:57", modified = "01.06.2021 17:07:11",
    trigger = checkCourse1Name("Rith Essa") &&
              getGameState() == 0x0F &&
              checkScoreOfPictureShownToProfessorOak(0x34, 4000)
)

achievement(
    title = "Lucky Chance", points = 4,
    description = "[Rith Essa] Take a picture of a Chansey which is worth at least 4,000 points.",
    id = 151463, badge = "169769", published = "28.04.2021 18:36:32", modified = "01.06.2021 17:07:11",
    trigger = checkCourse1Name("Rith Essa") &&
              getGameState() == 0x0F &&
              checkScoreOfPictureShownToProfessorOak(0x71, 4000)
)

achievement(
    title = "Happy Family", points = 4,
    description = "[Rith Essa] Take a picture of a Kangaskhan which is worth at least 4,000 points.",
    id = 151464, badge = "169770", published = "28.04.2021 18:55:06", modified = "01.06.2021 17:07:12",
    trigger = checkCourse1Name("Rith Essa") &&
              getGameState() == 0x0F &&
              checkScoreOfPictureShownToProfessorOak(0x73, 4000)
)

achievement(
    title = "Hidden in the Grass", points = 3,
    description = "[Rith Essa] Take a picture of a Scyther which is worth at least 3,000 points.",
    id = 151465, badge = "169771", published = "28.04.2021 18:55:06", modified = "01.06.2021 17:07:12",
    trigger = checkCourse1Name("Rith Essa") &&
              getGameState() == 0x0F &&
              checkScoreOfPictureShownToProfessorOak(0x7B, 3000)
)

achievement(
    title = "Visitor from the Depth", points = 3,
    description = "[Rith Essa] Take a picture of a Lapras which is worth at least 3,500 points.",
    id = 151466, badge = "169772", published = "28.04.2021 18:55:07", modified = "01.06.2021 17:07:12",
    trigger = checkCourse1Name("Rith Essa") &&
              getGameState() == 0x0F &&
              checkScoreOfPictureShownToProfessorOak(0x83, 3500)
)

achievement(
    title = "The Pika-Bros", points = 2,
    description = "[Rith Essa] Take a picture of two Pikachu and get the bonus for multiple Pokémon in one picture.",
    id = 151467, badge = "169773", published = "28.04.2021 19:11:23", modified = "28.04.2021 19:11:23",
    trigger = checkCourse1Name("Rith Essa") &&
              getGameState() == 0x0F &&
              checkMultiplePokemonFlagOfPictureShownToProfessorOak(0x19)
)

//--------------------------------------------------
// Leaderboards

leaderboard(
    id = 22295, title = "[Basement] Pidgey",
    description = "Highest score with a picture.",
    start  = checkCourse1Name("Basement") &&
             getGameState() == 0x0F &&
             checkPictureShownToProfessorOak(0x10),
    cancel = always_false(),
    submit = always_true(),
    value  = word(0x232A6C),
    format = "VALUE"
)

leaderboard(
    id = 22297, title = "[Basement] Pikachu",
    description = "Highest score with a picture.",
    start  = checkCourse1Name("Basement") &&
             getGameState() == 0x0F &&
             checkPictureShownToProfessorOak(0x19),
    cancel = always_false(),
    submit = always_true(),
    value  = word(0x232A6C),
    format = "VALUE"
)

leaderboard(
    id = 22298, title = "[Basement] Meowth",
    description = "Highest score with a picture.",
    start  = checkCourse1Name("Basement") &&
             getGameState() == 0x0F &&
             checkPictureShownToProfessorOak(0x34),
    cancel = always_false(),
    submit = always_true(),
    value  = word(0x232A6C),
    format = "VALUE"
)

leaderboard(
    id = 22299, title = "[Basement] Doduo",
    description = "Highest score with a picture.",
    start  = checkCourse1Name("Basement") &&
             getGameState() == 0x0F &&
             checkPictureShownToProfessorOak(0x54),
    cancel = always_false(),
    submit = always_true(),
    value  = word(0x232A6C),
    format = "VALUE"
)

leaderboard(
    id = 22300, title = "[Basement] Chansey",
    description = "Highest score with a picture.",
    start  = checkCourse1Name("Basement") &&
             getGameState() == 0x0F &&
             checkPictureShownToProfessorOak(0x71),
    cancel = always_false(),
    submit = always_true(),
    value  = word(0x232A6C),
    format = "VALUE"
)

leaderboard(
    id = 22301, title = "[Basement] Kangaskhan",
    description = "Highest score with a picture.",
    start  = checkCourse1Name("Basement") &&
             getGameState() == 0x0F &&
             checkPictureShownToProfessorOak(0x73),
    cancel = always_false(),
    submit = always_true(),
    value  = word(0x232A6C),
    format = "VALUE"
)

leaderboard(
    id = 22302, title = "[Basement] Scyther",
    description = "Highest score with a picture.",
    start  = checkCourse1Name("Basement") &&
             getGameState() == 0x0F &&
             checkPictureShownToProfessorOak(0x7B),
    cancel = always_false(),
    submit = always_true(),
    value  = word(0x232A6C),
    format = "VALUE"
)

leaderboard(
    id = 22303, title = "[Basement] Lapras",
    description = "Highest score with a picture.",
    start  = checkCourse1Name("Basement") &&
             getGameState() == 0x0F &&
             checkPictureShownToProfessorOak(0x83),
    cancel = always_false(),
    submit = always_true(),
    value  = word(0x232A6C),
    format = "VALUE"
)

leaderboard(
    id = 22304, title = "[Basement] Eevee",
    description = "Highest score with a picture.",
    start  = checkCourse1Name("Basement") &&
             getGameState() == 0x0F &&
             checkPictureShownToProfessorOak(0x85),
    cancel = always_false(),
    submit = always_true(),
    value  = word(0x232A6C),
    format = "VALUE"
)

leaderboard(
    id = 22305, title = "[Basement] Snorlax",
    description = "Highest score with a picture.",
    start  = checkCourse1Name("Basement") &&
             getGameState() == 0x0F &&
             checkPictureShownToProfessorOak(0x8F),
    cancel = always_false(),
    submit = always_true(),
    value  = word(0x232A6C),
    format = "VALUE"
)

leaderboard(
    id = 22285, title = "[Rith Essa] Butterfree",
    description = "Highest score with a picture.",
    start  = checkCourse1Name("Rith Essa") &&
             getGameState() == 0x0F &&
             checkPictureShownToProfessorOak(0x0C),
    cancel = always_false(),
    submit = always_true(),
    value  = word(0x232A6C),
    format = "VALUE"
)

leaderboard(
    id = 22284, title = "[Rith Essa] Pidgey",
    description = "Highest score with a picture.",
    start  = checkCourse1Name("Rith Essa") &&
             getGameState() == 0x0F &&
             checkPictureShownToProfessorOak(0x10),
    cancel = always_false(),
    submit = always_true(),
    value  = word(0x232A6C),
    format = "VALUE"
)

leaderboard(
    id = 22286, title = "[Rith Essa] Pikachu",
    description = "Highest score with a picture.",
    start  = checkCourse1Name("Rith Essa") &&
             getGameState() == 0x0F &&
             checkPictureShownToProfessorOak(0x19),
    cancel = always_false(),
    submit = always_true(),
    value  = word(0x232A6C),
    format = "VALUE"
)

leaderboard(
    id = 22288, title = "[Rith Essa] Meowth",
    description = "Highest score with a picture.",
    start  = checkCourse1Name("Rith Essa") &&
             getGameState() == 0x0F &&
             checkPictureShownToProfessorOak(0x34),
    cancel = always_false(),
    submit = always_true(),
    value  = word(0x232A6C),
    format = "VALUE"
)

leaderboard(
    id = 22289, title = "[Rith Essa] Doduo",
    description = "Highest score with a picture.",
    start  = checkCourse1Name("Rith Essa") &&
             getGameState() == 0x0F &&
             checkPictureShownToProfessorOak(0x54),
    cancel = always_false(),
    submit = always_true(),
    value  = word(0x232A6C),
    format = "VALUE"
)

leaderboard(
    id = 22290, title = "[Rith Essa] Chansey",
    description = "Highest score with a picture.",
    start  = checkCourse1Name("Rith Essa") &&
             getGameState() == 0x0F &&
             checkPictureShownToProfessorOak(0x71),
    cancel = always_false(),
    submit = always_true(),
    value  = word(0x232A6C),
    format = "VALUE"
)

leaderboard(
    id = 22291, title = "[Rith Essa] Kangaskhan",
    description = "Highest score with a picture.",
    start  = checkCourse1Name("Rith Essa") &&
             getGameState() == 0x0F &&
             checkPictureShownToProfessorOak(0x73),
    cancel = always_false(),
    submit = always_true(),
    value  = word(0x232A6C),
    format = "VALUE"
)

leaderboard(
    id = 22292, title = "[Rith Essa] Scyther",
    description = "Highest score with a picture.",
    start  = checkCourse1Name("Rith Essa") &&
             getGameState() == 0x0F &&
             checkPictureShownToProfessorOak(0x7B),
    cancel = always_false(),
    submit = always_true(),
    value  = word(0x232A6C),
    format = "VALUE"
)

leaderboard(
    id = 22293, title = "[Rith Essa] Lapras",
    description = "Highest score with a picture.",
    start  = checkCourse1Name("Rith Essa") &&
             getGameState() == 0x0F &&
             checkPictureShownToProfessorOak(0x83),
    cancel = always_false(),
    submit = always_true(),
    value  = word(0x232A6C),
    format = "VALUE"
)

leaderboard(
    id = 22294, title = "[Rith Essa] Eevee",
    description = "Highest score with a picture.",
    start  = checkCourse1Name("Rith Essa") &&
             getGameState() == 0x0F &&
             checkPictureShownToProfessorOak(0x85),
    cancel = always_false(),
    submit = always_true(),
    value  = word(0x232A6C),
    format = "VALUE"
)

leaderboard(
    id = 22287, title = "[Rith Essa] Snorlax",
    description = "Highest score with a picture.",
    start  = checkCourse1Name("Rith Essa") &&
             getGameState() == 0x0F &&
             checkPictureShownToProfessorOak(0x8F),
    cancel = always_false(),
    submit = always_true(),
    value  = word(0x232A6C),
    format = "VALUE"
)

//--------------------------------------------------
// Rich Presence

rich_presence_conditional_display(
    getGameState() == 0x00 && checkCourse1Name("Basement"), 
    "Todd is taking pictures of Pokémon in the Basement of GoldenEye 007 [📷{0}/60]",
    rich_presence_macro("Number",
                        byte(0xAC0E0))
)

rich_presence_conditional_display(
    getGameState() == 0x00 && checkCourse1Name("Rith Essa"), 
    "Todd is taking pictures of Pokémon on Rith Essa from Jet Force Gemini [📷{0}/60]",
    rich_presence_macro("Number",
                        byte(0xAC0E0))
)

rich_presence_conditional_display(
    getGameState() == 0x01, 
    "Todd is taking pictures of Pokémon in the Tunnel [📷{0}/60]",
    rich_presence_macro("Number",
                        byte(0xAC0E0))
)

rich_presence_conditional_display(
    getGameState() == 0x02, 
    "Todd is taking pictures of Pokémon at the Volcano [📷{0}/60]",
    rich_presence_macro("Number",
                        byte(0xAC0E0))
)

rich_presence_conditional_display(
    getGameState() == 0x03, 
    "Todd is taking pictures of Pokémon at the River [📷{0}/60]",
    rich_presence_macro("Number",
                        byte(0xAC0E0))
)

rich_presence_conditional_display(
    getGameState() == 0x04, 
    "Todd is taking pictures of Pokémon in the Cave [📷{0}/60]",
    rich_presence_macro("Number",
                        byte(0xAC0E0))
)

rich_presence_conditional_display(
    getGameState() == 0x05, 
    "Todd is taking pictures of Pokémon in the Valley [📷{0}/60]",
    rich_presence_macro("Number",
                        byte(0xAC0E0))
)

rich_presence_conditional_display(
    getGameState() == 0x06, 
    "Todd is taking pictures of Pokémon at the Rainbow Cloud [📷{0}/60]",
    rich_presence_macro("Number",
                        byte(0xAC0E0))
)

rich_presence_conditional_display(
    getGameState() == 0x16, 
    "Todd is checking the Gallery"
)

rich_presence_conditional_display(
    getGameState() >= 0x09 && getGameState() <= 0x1D, 
    "Todd is in Professor Oak's Lab"
)

rich_presence_display(
    "In the Titlescreen"
)