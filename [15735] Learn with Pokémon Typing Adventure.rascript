// Learn with Pokémon: Typing Adventure
// #ID = 15735

//----------------------------------------
// Memory Addresses

mem_savefile             = 0x0013aa00
mem_save1StageHighscores = 0x00135c7c
mem_save1CaptureData     = 0x00136175
mem_lastLocationID       = 0x000c38dc

//----------------------------------------
// Functions

function getLocationID() {
    return word(mem_lastLocationID)
}

function getStageHighscore(stageID, rank) {
    stageOffset = mem_save1StageHighscores + (byte(mem_savefile) * 4128) + ((stageID - 1) * 10)
    startingBit = 6 + ((rank - 1) * 20)

    return bit((startingBit + 19) % 8, stageOffset + ((startingBit + 19) / 8)) * 0x80000
         + bit((startingBit + 18) % 8, stageOffset + ((startingBit + 18) / 8)) * 0x40000
         + bit((startingBit + 17) % 8, stageOffset + ((startingBit + 17) / 8)) * 0x20000
         + bit((startingBit + 16) % 8, stageOffset + ((startingBit + 16) / 8)) * 0x10000
         + bit((startingBit + 15) % 8, stageOffset + ((startingBit + 15) / 8)) * 0x8000
         + bit((startingBit + 14) % 8, stageOffset + ((startingBit + 14) / 8)) * 0x4000
         + bit((startingBit + 13) % 8, stageOffset + ((startingBit + 13) / 8)) * 0x2000
         + bit((startingBit + 12) % 8, stageOffset + ((startingBit + 12) / 8)) * 0x1000
         + bit((startingBit + 11) % 8, stageOffset + ((startingBit + 11) / 8)) * 0x800
         + bit((startingBit + 10) % 8, stageOffset + ((startingBit + 10) / 8)) * 0x400
         + bit((startingBit + 09) % 8, stageOffset + ((startingBit + 09) / 8)) * 0x200
         + bit((startingBit + 08) % 8, stageOffset + ((startingBit + 08) / 8)) * 0x100
         + bit((startingBit + 07) % 8, stageOffset + ((startingBit + 07) / 8)) * 0x80
         + bit((startingBit + 06) % 8, stageOffset + ((startingBit + 06) / 8)) * 0x40
         + bit((startingBit + 05) % 8, stageOffset + ((startingBit + 05) / 8)) * 0x20
         + bit((startingBit + 04) % 8, stageOffset + ((startingBit + 04) / 8)) * 0x10
         + bit((startingBit + 03) % 8, stageOffset + ((startingBit + 03) / 8)) * 0x8
         + bit((startingBit + 02) % 8, stageOffset + ((startingBit + 02) / 8)) * 0x4
         + bit((startingBit + 01) % 8, stageOffset + ((startingBit + 01) / 8)) * 0x2
         + bit((startingBit + 00) % 8, stageOffset + ((startingBit + 00) / 8)) * 0x1
}

function getTotalPokemonCaught() {
    captureOffset = mem_save1CaptureData + (byte(mem_savefile) * 4128)
    code = 0

    for pokemonSlot in range(1, 404) {
        accessedBit = 7 + pokemonSlot * 2 - 1
        
        code = code + bit(accessedBit % 8, captureOffset + accessedBit / 8)
    }
    return code
}

//----------------------------------------
// Achievements

achievement(
    id          = 0, 
    badge       = "0",
    type        = "",
    title       = "Test",
    description = "Test Logic",
    points      = 0,
    trigger     = measured(getTotalPokemonCaught() >= 404)
)