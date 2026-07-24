// Inazuma Eleven 2: Firestorm
// #ID = 16625

//--------------------------------------------------
// Memory Addresses

mem_PointerMapData      = 0x00038a88
mem_PointerGalleryData  = 0x0003ef60 
mem_PointerGameData     = 0x00038a98
mem_PointerGameData2    = 0x00038a8c

//--------------------------------------------------
// Functions

function checkNonDebug() {
    pointerChain = tbyte(tbyte(mem_PointerGameData) + 0x08)
    return dword_be(pointerChain + 0x560 + 0x00) == 0x32313031 &&
           dword_be(pointerChain + 0x560 + 0x04) == 0x30303030
}

function getMapID() {
    return byte(tbyte(mem_PointerMapData) + 0x588 + 0x01) * 0x1000000
         + low4(tbyte(mem_PointerMapData) + 0x588 + 0x02) * 0x100000
         + low4(tbyte(mem_PointerMapData) + 0x588 + 0x03) * 0x10000
         + byte(tbyte(mem_PointerMapData) + 0x588 + 0x04) * 0x100
         + low4(tbyte(mem_PointerMapData) + 0x588 + 0x05) * 0x10
         + low4(tbyte(mem_PointerMapData) + 0x588 + 0x06) * 0x1
}

function checkMapID(mapID) {
    return any_of(array_filter(mapIDs, mapString => mapIDs[mapString][0] == mapID), mapString => getMapID() == mapString)
}

function getStoryProgress() {
    return dword(tbyte(mem_PointerGameData2) + 0x2718)
}

function getMovieFlag(movieAddressOffset, movieAddressBit) {
    return bit(movieAddressBit, tbyte(mem_PointerGalleryData) + 0x28 + movieAddressOffset)
}

//--------------------------------------------------
// Arrays and Dictionaries

mapIDs = {  // check getCurrentMap() for mapID calculation
    0x6CF261CD: ["globalmap",   "on the Inazuma Town Map",          ""],
    0x72016927: ["mr01i27",     "in the Inazuma Hospital",          "Hospital 2F"],         // River Bank Pitch; Event at the same time
    0x72016252: ["mr01b52",     "in the Football Frontier Stadium", ""],                    // River Bank Pitch; Flashback to Football Frontier victory
    0x72027303: ["mr02b03",     "at the River Bank Pitch",          "River Bank Pitch"],
    0x72027304: ["mr02b04",     "at the River Bank",                "River Bank"],
    0x72026205: ["mr02b05",     "in Mark's Street",                 "Mark's Street"],
    0x72026291: ["mr02b91",     "at the Tower",                     ""],                    // River Bank Pitch; Flashback of Mark and Axel meeting at the lake
    0x72026912: ["mr02i12",     "in Mark's House",                  "Mark's House"],
    0x72076201: ["mr07b01",     "at the Raimon Gate",               "Raimon Gate"],
    0x72076902: ["mr07i02",     "in Mark's Room",                   "Mark's Room"],
}

mapIDHashes = {}
for mapID in mapIDs {
    mapIDHashes[mapID] = mapIDs[mapID][1]
}

//--------------------------------------------------
// Achievements

achievement(
    title = "Meteors Over Inazuma Town", type = "progression",
    description = "Finish the Prologue.",
    id = 0, badge = "705553", points = 2,
    trigger = checkNonDebug() &&
              checkMapID("mr07b01") &&
              getStoryProgress() == 0x29cc &&
              getMovieFlag(0x00, 1) > prev(getMovieFlag(0x00, 1))
)

//--------------------------------------------------
// Rich Presence

rich_presence_display(
    "Test Map: {0}",
        rich_presence_lookup("MapIDs",
                             getMapID(),
                             mapIDHashes)
)