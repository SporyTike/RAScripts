// Nintendogs: Labrador & Friends
// #ID = 17434

//--------------------------------------------------
// Addresses
mem_mapID         = 0x00158ef0
mem_objectIDOnMap = 0x00158fb2
pointer_dogData   = 0x0014f384
pointer_walkData1 = 0x00170180
pointer_walkData2 = 0x0015bca4

pointerMask = 0x00ffffff

//--------------------------------------------------
// Functions

function getMapID() {
    return byte(mem_mapID)
}

function getTotalDogsOnMap() {
    return dword((dword(pointer_dogData) & pointerMask) + 0x54) / dword((dword(pointer_dogData) & pointerMask) + 0x54)
         + dword((dword(pointer_dogData) & pointerMask) + 0x58) / dword((dword(pointer_dogData) & pointerMask) + 0x58)
         + dword((dword(pointer_dogData) & pointerMask) + 0x5C) / dword((dword(pointer_dogData) & pointerMask) + 0x5C)
}

function getObjectIDOnMap() {
    return word(mem_objectIDOnMap)
}

function getDogExistance(slot) {
    return dword((dword(pointer_dogData) & pointerMask) + 0x54 + slot * 0x04) != 0x00
}

function getDogSpeciesID(slot) {
    return word((dword((dword(pointer_dogData) & pointerMask) + 0x54 + slot * 0x04) & pointerMask) + 0x00)
}

function getDogAnimationID(slot) {
    return word((dword((dword(pointer_dogData) & pointerMask) + 0x54 + slot * 0x04) & pointerMask) + 0xEA)
}

function getWalkPresentItemCategory() {
    return byte((dword(pointer_walkData1) & pointerMask) + 0x33A0)
}

function getWalkPresentItemIDWithinCategory() {
    return byte((dword(pointer_walkData1) & pointerMask) + 0x33A1)
}

function checkWalkPresentType(type) {
    if (type == "Event") {
        return dword((dword(pointer_walkData1) & pointerMask) + 0x33A8) == 0x00
    }
    if (type == "Random") {
        return dword((dword(pointer_walkData1) & pointerMask) + 0x33A8) == 0x01
    }
}

function getWalkingSpeed() {
    return dword((dword(pointer_walkData2) & pointerMask) + 0x0C)
}

//--------------------------------------------------
// Achievements

achievement(
    title = "Lost and Found", points = 2,
    description = "Pick up a present that someone dropped on the ground while taking a walk with the dog.",
    id = 140987, badge = "157137", published = "10.02.2021 00:14:08", modified = "10.02.2021 08:44:43",
    trigger = getMapID() == 0x18 &&
              getTotalDogsOnMap() == 1 &&
              prev(getObjectIDOnMap()) == 0x70 &&
              getObjectIDOnMap() == 0xFFFF &&
              checkWalkPresentType("Random") &&
              prev(getWalkingSpeed()) == 0 &&
              getWalkingSpeed() == 0
)

achievement(
    title = "My Little Scout Dog", points = 3,
    description = "Pick up three presents during a single walk with a dog.",
    id = 140988, badge = "157136", published = "10.02.2021 00:14:08", modified = "10.02.2021 08:44:43",
    trigger = never(getMapID() != 0x0D &&
                    getMapID() != 0x18 &&
                    getMapID() != 0x1A) &&
              measured(tally(3, getMapID() == 0x18 &&
                                getTotalDogsOnMap() == 1 &&
                                prev(getWalkingSpeed()) == 0 &&
                                getWalkingSpeed() == 0 &&
                                prev(getObjectIDOnMap()) == 0x70 &&
                                getObjectIDOnMap() == 0xFFFF))
)

achievement(
    title = "A Lucky Day", points = 3,
    description = "Pick up five presents during a single walk with a dog.",
    id = 140989, badge = "157139", published = "10.02.2021 00:14:08", modified = "10.02.2021 08:44:43",
    trigger = never(getMapID() != 0x0D &&
                    getMapID() != 0x18 &&
                    getMapID() != 0x1A) &&
              measured(tally(5, getMapID() == 0x18 &&
                                getTotalDogsOnMap() == 1 &&
                                prev(getWalkingSpeed()) == 0 &&
                                getWalkingSpeed() == 0 &&
                                prev(getObjectIDOnMap()) == 0x70 &&
                                getObjectIDOnMap() == 0xFFFF))
)

achievement(
    title = "Homemade Tastes Better", points = 1,
    description = "Prevent the dog from getting sick by eating garbage during a walk.",
    id = 140996, badge = "157212", published = "10.02.2021 00:14:26", modified = "07.09.2025 09:13:21",
    trigger = getMapID() == 0x18 &&
              getTotalDogsOnMap() == 1 &&
              prev(getObjectIDOnMap()) >= 0x72 &&
              prev(getObjectIDOnMap()) <= 0x74 &&
              getObjectIDOnMap() == 0xFFFF &&
              ((getDogExistance(0) &&
                getDogSpeciesID(0) <= 0x15 &&
                getDogAnimationID(0) != 0x4C6) ||
               (getDogExistance(1) &&
                getDogSpeciesID(1) <= 0x15 &&
                getDogAnimationID(1) != 0x4C6) ||
               (getDogExistance(2) &&
                getDogSpeciesID(2) <= 0x15 &&
                getDogAnimationID(2) != 0x4C6))
)
