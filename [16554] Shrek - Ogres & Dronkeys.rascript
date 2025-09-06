// Shrek: Ogres & Dronkeys
// #ID = 16554

//--------------------------------------------------
// Adresses
GameState        = dword(0x0F4280)
LoadingState     = dword(0x0F427C)
RoomNotLoaded    = byte(0x0F428C)
DataPointer      = tbyte(0x0F42C4)
MinigamePointer  = tbyte(0x12263C)
DebugFlag        = byte(0x0F42B8)
BabyID1          = byte(0x0F42D0)
BabyID2          = byte(0x0F42D1)
CurrentPoints    = dword(DataPointer + 0x4)
TotalPoints      = dword(DataPointer + 0x8)
ActionBabyID     = byte(byte(0x0F42C0) + 0x0F42D0)
MinigameState    = dword(MinigamePointer + 0x08)
MinigameStateCG  = dword(MinigamePointer + 0x30)

Baby1Pointer     = tbyte(DataPointer + 0x2740)
Baby1Animation   = dword(tbyte(Baby1Pointer + 0x04) + 0x2A4)
Baby1Fullness    = dword(Baby1Pointer + 0x288)
Baby1Fun         = dword(Baby1Pointer + 0x28C)
Baby1Energy      = dword(Baby1Pointer + 0x290)
Baby1Contentment = dword(Baby1Pointer + 0x294)
Baby1OralHygene  = dword(Baby1Pointer + 0x298)
Baby1EarHygene   = dword(Baby1Pointer + 0x29C)
Baby1HairHygene  = dword(Baby1Pointer + 0x2A0)
Baby1BodyHygene  = dword(Baby1Pointer + 0x2A4)
Baby1Bowels      = dword(Baby1Pointer + 0x2A8)
Baby1SugarHigh   = dword(Baby1Pointer + 0x2AC)
Baby1ItemHolding = dword(tbyte(tbyte(Baby1Pointer + 0x3C0) + 0x16C) + 0x14)
Baby1ItemOnFace  = dword(tbyte(tbyte(Baby1Pointer + 0x3C4) + 0x16C) + 0x14)
Baby1ItemOnHat   = dword(tbyte(tbyte(Baby1Pointer + 0x3CC) + 0x16C) + 0x14)

Baby2Pointer     = tbyte(DataPointer + 0x2744)
Baby2Animation   = dword(tbyte(Baby2Pointer + 0x04) + 0x2A4)
Baby2Fullness    = dword(Baby2Pointer + 0x288)
Baby2Fun         = dword(Baby2Pointer + 0x28C)
Baby2Energy      = dword(Baby2Pointer + 0x290)
Baby2Contentment = dword(Baby2Pointer + 0x294)
Baby2OralHygene  = dword(Baby2Pointer + 0x298)
Baby2EarHygene   = dword(Baby2Pointer + 0x29C)
Baby2HairHygene  = dword(Baby2Pointer + 0x2A0)
Baby2BodyHygene  = dword(Baby2Pointer + 0x2A4)
Baby2Bowels      = dword(Baby2Pointer + 0x2A8)
Baby2SugarHigh   = dword(Baby2Pointer + 0x2AC)
Baby2ItemHolding = dword(tbyte(tbyte(Baby2Pointer + 0x3C0) + 0x16C) + 0x14)
Baby2ItemOnFace  = dword(tbyte(tbyte(Baby2Pointer + 0x3C4) + 0x16C) + 0x14)
Baby2ItemOnHat   = dword(tbyte(tbyte(Baby2Pointer + 0x3CC) + 0x16C) + 0x14)

//--------------------------------------------------
// Arrays and Dictionaries

babyLookup = {
    00: "Ogre Jr.",
    01: "Ogre Girl",
    02: "Ogre Boy",
    03: "Debbie",
    04: "Bananas",
    05: "Peanut",
    06: "Coco",
    07: "Parfait",
}

locationInLookup = {
    0x12: "Shrek's Hut",
    0x13: "the Candy House",
    0x14: "the Pig's House",
    0x15: "the Dragon's Tower",
}

locationOutLookup = {
    0x18: "outside Shrek's Hut",
    0x19: "in the Swamp",
    0x1A: "outside the Dragon's Tower",
    0x1B: "on the Pig's Hill",
    0x1C: "in Gingyland",
}

minigameLookup = {
    0x1E: "Snail Bowling",
    0x1F: "Firefly Catch",
    0x20: "Pig Builders",
    0x21: "Target Practice",
    0x22: "Candy Gobble",
    0x23: "Snail Bowling",
    0x24: "Firefly Catch",
    0x25: "Pig Builders",
    0x26: "Target Practice",
    0x27: "Candy Gobble",
}

items = [
    [0x00, "Toy",  "A Block"],
    [0x01, "Toy",  "Red Ball"],
    [0x02, "Toy",  "Rattle"],
    [0x03, "Tool", "Bottle"],
    [0x04, "Toy",  "Donkey Doll"],
    [0x05, "Food", "Meat"],
    [0x06, "Tool", "Pacifier"],
    [0x07, "Tool", "Diaper"],
    [0x08, "Toy",  "B Block"],
    [0x09, "Toy",  "Wizard Hat"],
    [0x0A, "Toy",  "Spider"],
    [0x0B, "Toy",  "Small Hammer"],
    [0x0C, "Toy",  "Jack In The Box"],
    [0x0D, "Food", "Carrot"],
    [0x0E, "Toy",  "Green Ball"],
    [0x0F, "Toy",  "Whistle"],
    [0x10, "Tool", "Plain Box"],
    [0x11, "Tool", "Toothbrush"],
    [0x12, "Toy",  "Red Balloon"],
    [0x13, "Toy",  "Bowler Hat"],
    [0x14, "Toy",  "Funny Mask"],
    [0x15, "Food", "Taffy"],
    [0x16, "Food", "Sour Candy"],
    [0x17, "Food", "Potato"],
    [0x18, "Tool", "Long Box"],
    [0x19, "Toy",  "Small Horn"],
    [0x1A, "Tool", "Hair Brush"],
    [0x1B, "Toy",  "Piano"],
    [0x1C, "Toy",  "Large Hammer"],
    [0x1D, "Food", "Lemon Drop"],
    [0x1E, "Toy",  "Wooden Cart"],
    [0x1F, "Food", "Broccoli"],
    [0x20, "Toy",  "C Block"],
    [0x21, "Toy",  "Witch In The Box"],
    [0x22, "Toy",  "Scary Mask"],
    [0x23, "Toy",  "Carriage"],
    [0x24, "Tool", "Cotton Swab"],
    [0x25, "Toy",  "Dolly"],
    [0x26, "Toy",  "Xylophone"],
    [0x27, "Toy",  "Large Horn"],
    [0x28, "Tool", "Bouncy Mattress"],
    [0x29, "Food", "Bread Loaf"],
    [0x2A, "Food", "Caramel Chew"],
    [0x2B, "Toy",  "Happy Ball"],
    [0x2C, "Toy",  "Small Bucket"],
    [0x2D, "Toy",  "Shrek Mask"],
    [0x2E, "Toy",  "Frog Balloon"],
    [0x2F, "Toy",  "Fancy Car"],
    [0x30, "Toy",  "Silly Hat"],
    [0x31, "Food", "Cupcake"],
    [0x32, "Tool", "Castle Box"],
    [0x33, "Toy",  "Knight Doll"],
    [0x34, "Toy",  "Donkey Mask"],
    [0x35, "Tool", "Crib"],
    [0x36, "Toy",  "Large Bucket"],
    [0x37, "Food", "Cabbage"],
    [0x38, "Toy",  "Drum Set"],
    [0x39, "Toy",  "Shiny Block"],
    [0x3A, "Toy",  "Top Hat"],
    [0x3B, "Food", "Cake Slice"],
    [0x3C, "Toy",  "Teddy Bear"],
    [0x3D, "Toy",  "Snail Shell"],
    [0x3E, "Toy",  "Plain Block"],
    [0x3F, "Tool", "Barrel"],
]

actions = [
    [0x3F,   "launch"],
    [0x47,   "tap"],
    [0x4F,   "pick up"],
    [0x57,   "eat"],
    [0x5F,   "blow"],
    [0x67,   "wear"],
    [0x77,   "climb on"],
    [0x87,   "stay"],
    [0x8F,   "jump off"],
    [0xBF,   "talk"],
    [0xC7,   "destroy"],
    [0xCF,   "hug"],
    [0xDF,   "climb in"],
    [0xE7,   "examine"],
    [0x10F,  "roll to you"],
    [0x117,  "catch"],
    [0x11F,  "not happy"],
    [0x127,  "climb out"],
    [0x137,  "pop"],
    [0x13F,  "throw"],
    [0x147,  "kick"],
    [0x16F,  "drop"],
    [0x187,  "roll"],
    [0xB8F,  "place in"],
    [0xD8F,  "place on"],
    [0x138F, "hit with"],
]

//--------------------------------------------------
// Functions

function saveProtection() {
    return DebugFlag == 0 &&
           GameState == prev(GameState) &&
           DataPointer == prev(DataPointer)
}

function gameState() {
    return GameState
}

function inGame() {
    return gameState() > 9
}

function getTotalPoints() {
    return dword(DataPointer + 0x08)
}

function eventTrigger(offset, bit) {
    return bit(bit, DataPointer + offset) > prev(bit(bit, DataPointer + offset))
}

function getItemID(itemName) {
    for item in items {
        if (item[2] == itemName) {
            return item[0]
        }
    }
    assert(0 == 1,
        message = "Could not find item ID of '" + itemName + "'"
    )
}

function getActionOffset(actionName) {
    for action in actions {
        if (action[1] == actionName) {
            return action[0]
        }
    }
    assert(0 == 1,
        message = "Could not find action offset of '" + actionName + "'"
    )
}

function getItemAction1(action, itemName) {
    actionOffset = getActionOffset(action)
    itemOffset   = getItemID(itemName) / 8
    itemBit      = getItemID(itemName) % 8
    
    return bit(itemBit, DataPointer 
                      + actionOffset 
                      + itemOffset)
}

function getItemAction2(action, mainItemName, subItemName) {
    actionOffset   = getActionOffset(action)
    mainItemOffset = getItemID(mainItemName) * 8
    subitemOffset  = getItemID(subItemName) / 8
    subitemBit     = getItemID(subItemName) % 8
    
    return bit(subitemBit, DataPointer 
                         + actionOffset 
                         + mainItemOffset 
                         + subitemOffset)
}

function getItemUnlock(itemName) {
    itemOffset = getItemID(itemName)
    
    return byte(DataPointer + 0x198F + itemOffset) / byte(DataPointer + 0x198F + itemOffset)
}

function getSnailsInLoc(locationIndex) {
    return byte(DataPointer + 0x10 + locationIndex)
}

function getOnionsInLoc(locationIndex) {
    return byte(DataPointer + 0x15 + locationIndex)
}

function unlockedAllItems() {
    logic = 0

    for item in items {
        if (item[1] == "Toy" || item[1] == "Food") {
            logic = logic + getItemUnlock(item[2])
        }
    }
    
    return logic
}

function isInside() {
    return gameState() >= 0x12 &&
           gameState() <= 0x15 
}

function isOutside() {
    return gameState() >= 0x18 &&
           gameState() <= 0x1C
}

function babyIsOgre(id) {
    return byte(0x0F42D0 + id) >= 0x00 &&
           byte(0x0F42D0 + id) <= 0x02
}

function babyIsDronkey(id) {
    return byte(0x0F42D0 + id) >= 0x03 &&
           byte(0x0F42D0 + id) <= 0x08
}

function endMinigameSnailBowling() {
    return saveProtection() &&
           __ornext(GameState == 0x1E || GameState == 0x23) &&
           MinigameState == 0x1E &&
           prev(MinigameState != 0x1E)
}

function getScoreOfSnailBowling() {
    BabyOffset = byte(MinigamePointer + 0x17D)
    return byte(tbyte(MinigamePointer + 0x30) + 0x294 + BabyOffset)
}

function getScoreOfSnailBowlingSpecificBaby(index) {
    return byte(tbyte(MinigamePointer + 0x30) + 0x294 + index)
}

function getBabyOfSnailBowling() {
    BabyOffset = byte(MinigamePointer + 0x17D)
    return byte(BabyOffset + 0x0E83D0)
}

function endMinigameFireflyCatch() {
    return saveProtection() &&
           __ornext(GameState == 0x1F || GameState == 0x24) &&
           MinigameState == 0x08 &&
           prev(MinigameState != 0x08)
}

function getScoreOfFireflyCatch() {
    BabyOffset = byte(MinigamePointer + 0x30)
    return byte(tbyte(MinigamePointer + 0x40) + 0x108 + BabyOffset * 0x18)
}

function getScoreOfFireflyCatchSpecificBaby(index) {
    return byte(tbyte(MinigamePointer + 0x40) + 0x108 + index * 0x18)
}

function getBabyOfFireflyCatch() {
    BabyOffset = byte(MinigamePointer + 0x30)
    return byte(BabyOffset + 0x0E83D0)
}

function endMinigameTargetPractice() {
    return saveProtection() &&
           __ornext(GameState == 0x21 || GameState == 0x26) &&
           MinigameState == 0x08 &&
           prev(MinigameState != 0x08)
}

function getScoreOfTargetPractice() {
    BabyOffset = byte(MinigamePointer + 0x40)
    return byte(tbyte(MinigamePointer + 0x38) + 0x108 + BabyOffset * 0x18)
}

function getScoreOfTargetPracticeSpecificBaby(index) {
    return byte(tbyte(MinigamePointer + 0x38) + 0x108 + index * 0x18)
}

function getBabyOfTargetPractice() {
    BabyOffset = byte(MinigamePointer + 0x40)
    return byte(BabyOffset + 0x0E83D0)
}

function endMinigamePigBuilders() {
    return saveProtection() &&
           __ornext(GameState == 0x20 || GameState == 0x25) &&
           MinigameState == 0x08 &&
           prev(MinigameState != 0x08)
}

function getScoreOfPigBuilders() {
    return getScoreOfFireflyCatch()
}

function getScoreOfPigBuildersSpecificBaby(index) {
    return getScoreOfFireflyCatchSpecificBaby(index)
}

function getBabyOfPigBuilders() {
    return getBabyOfFireflyCatch()
}

function endMinigameCandyGobble() {
    return saveProtection() &&
           __ornext(GameState == 0x22 || GameState == 0x27) &&
           MinigameStateCG == 0x06 &&
           prev(MinigameStateCG != 0x06)
}

function getScoreOfCandyGobble() {
    BabyOffset = byte(MinigamePointer + 0x17C)
    return byte(tbyte(MinigamePointer + 0xA4) + 0x108 + BabyOffset * 0x18)
}

function getScoreOfCandyGobbleSpecificBaby(index) {
    return byte(tbyte(MinigamePointer + 0xA4) + 0x108 + index * 0x18)
}

function getBabyOfCandyGobble() {
    BabyOffset = byte(MinigamePointer + 0x17C)
    return byte(BabyOffset + 0x0E83D0)
}

//--------------------------------------------------
// Achievements

achievement(
    title = "To the Dronkey's Mother", points = 10, type="progression",
    description = "Collect a total of 250 activity points and unlock Dragon's Tower.",
    id = 178594, badge = "199104", published = "16.10.2021 20:34:14", modified = "07.08.2025 17:58:51",
    trigger = saveProtection() &&
              measured(getTotalPoints() >= 250,
                  when = inGame()
              ) &&
              eventTrigger(0x19D8, 1)
)

achievement(
    title = "Three Little Babysitters", points = 10, type="progression",
    description = "Collect a total of 420 activity points and unlock the Pig's Hill.",
    id = 178742, badge = "199103", published = "17.10.2021 12:15:55", modified = "07.08.2025 17:58:51",
    trigger = saveProtection() &&
              measured(getTotalPoints() >= 420,
                  when = inGame()
              ) &&
              eventTrigger(0x19D8, 2)
)

achievement(
    title = "Sweet Babies", points = 10, type="progression",
    description = "Collect a total of 600 activity points and unlock Gingyland.",
    id = 178833, badge = "199198", published = "17.10.2021 20:18:42", modified = "07.08.2025 17:58:51",
    trigger = saveProtection() &&
              measured(getTotalPoints() >= 600,
                  when = inGame()
              ) &&
              eventTrigger(0x19D8, 3)
)

achievement(
    title = "Princess' Dreams", points = 10,
    description = "Collect all snails, onions and items outside Shrek's Hut.",
    id = 179021, badge = "199373", published = "18.10.2021 12:10:40", modified = "03.08.2025 11:44:29",
    trigger = saveProtection() &&
              gameState() == 0x18 &&
              measured(getItemUnlock("Frog Balloon")
                     + getItemUnlock("Plain Block") 
                     + getSnailsInLoc(0)
                     + getOnionsInLoc(0) == 22,
                when = inGame()
              ) && 
              prev(getItemUnlock("Frog Balloon")
                 + getItemUnlock("Plain Block") 
                 + getSnailsInLoc(0)
                 + getOnionsInLoc(0) == 21
              )
)

achievement(
    title = "Out of My Swamp", points = 10,
    description = "Collect all snails, onions and items in the Swamp.",
    id = 179022, badge = "199374", published = "18.10.2021 12:17:23", modified = "03.08.2025 11:44:29",
    trigger = saveProtection() &&
              gameState() == 0x19 &&
              measured(getItemUnlock("Shrek Mask")
                     + getItemUnlock("Snail Shell") 
                     + getSnailsInLoc(1)
                     + getOnionsInLoc(1) == 22,
                when = inGame()
              ) && 
              prev(getItemUnlock("Shrek Mask")
                 + getItemUnlock("Snail Shell") 
                 + getSnailsInLoc(1)
                 + getOnionsInLoc(1) == 21
              )
)

achievement(
    title = "I Can Fly!", points = 10,
    description = "Collect all snails, onions and items outside the Dragon's Tower.",
    id = 178737, badge = "199098", published = "17.10.2021 11:44:57", modified = "03.08.2025 11:44:29",
    trigger = saveProtection() &&
              gameState() == 0x1A &&
              measured(getItemUnlock("Donkey Doll")
                     + getItemUnlock("Carriage") 
                     + getSnailsInLoc(2)
                     + getOnionsInLoc(2) == 22,
                when = inGame()
              ) && 
              prev(getItemUnlock("Donkey Doll")
                 + getItemUnlock("Carriage") 
                 + getSnailsInLoc(2)
                 + getOnionsInLoc(2) == 21
              )
)

achievement(
    title = "Pig, Pigg and Piggy", points = 10,
    description = "Collect all snails, onions and items on the Pig's Hill.",
    id = 179404, badge = "199755", published = "19.10.2021 13:40:46", modified = "03.08.2025 11:44:30",
    trigger = saveProtection() &&
              gameState() == 0x1B &&
              measured(getItemUnlock("Small Horn")
                     + getItemUnlock("Silly Hat") 
                     + getSnailsInLoc(3)
                     + getOnionsInLoc(3) == 22,
                when = inGame()
              ) && 
              prev(getItemUnlock("Small Horn")
                 + getItemUnlock("Silly Hat") 
                 + getSnailsInLoc(3)
                 + getOnionsInLoc(3) == 21
              )
)

achievement(
    title = "Sweets and Disgusts", points = 10,
    description = "Collect all snails, onions and items in Gingyland.",
    id = 179403, badge = "199754", published = "19.10.2021 13:23:12", modified = "03.08.2025 11:44:30",
    trigger = saveProtection() &&
              gameState() == 0x1C &&
              measured(getItemUnlock("Lemon Drop")
                     + getItemUnlock("Caramel Chew") 
                     + getSnailsInLoc(4)
                     + getOnionsInLoc(4) == 22,
                when = inGame()
              ) && 
              prev(getItemUnlock("Lemon Drop")
                 + getItemUnlock("Caramel Chew") 
                 + getSnailsInLoc(4)
                 + getOnionsInLoc(4) == 21
              )
)

achievement(
    title = "There Is No Place Like Swamp", points = 10, type="win_condition",
    description = "Collect all snails and onions in every location.",
    id = 179405, badge = "199756", published = "19.10.2021 13:40:46", modified = "03.08.2025 11:44:30",
    trigger = saveProtection() &&
              isOutside() &&
              measured(getSnailsInLoc(0)
                     + getSnailsInLoc(1)
                     + getSnailsInLoc(2)
                     + getSnailsInLoc(3)
                     + getSnailsInLoc(4)
                     + getOnionsInLoc(0)
                     + getOnionsInLoc(1)
                     + getOnionsInLoc(2)
                     + getOnionsInLoc(3)
                     + getOnionsInLoc(4) == 100,
                when = inGame()
              ) && 
              prev(getSnailsInLoc(0)
                 + getSnailsInLoc(1)
                 + getSnailsInLoc(2)
                 + getSnailsInLoc(3)
                 + getSnailsInLoc(4)
                 + getOnionsInLoc(0)
                 + getOnionsInLoc(1)
                 + getOnionsInLoc(2)
                 + getOnionsInLoc(3)
                 + getOnionsInLoc(4) == 99
              )
)

achievement(
    title = "Happiest Babies on the World", points = 25,
    description = "Unlock all toys and every food.",
    id = 180431, badge = "200944", published = "27.10.2021 14:26:58", modified = "03.08.2025 11:44:30",
    trigger = saveProtection() &&
              measured(unlockedAllItems() == 52,
                when = inGame()) &&
              prev(unlockedAllItems() == 51)
)

achievement(
    title = "Nothing Is Out of Reach", points = 2,
    description = "Teach a baby how to climb.",
    id = 178736, badge = "610703", published = "17.10.2021 11:20:39", modified = "10.08.2025 07:10:47",
    trigger = saveProtection() &&
              isInside() &&
              eventTrigger(0x1A2D, 1)
    
)

achievement(
    title = "Not in the House!", points = 1,
    description = "Teach a baby how to throw balls.",
    id = 178735, badge = "610706", published = "17.10.2021 11:20:38", modified = "10.08.2025 07:18:43",
    trigger = saveProtection() &&
              isInside() &&
              eventTrigger(0x1A2D, 3)
)

achievement(
    title = "To Infinity and Beyond", points = 2,
    description = "Teach a baby how to launch themselves with a Jack-in-the-Box.",
    id = 178746, badge = "610705", published = "17.10.2021 12:58:28", modified = "10.08.2025 07:16:37",
    trigger = saveProtection() &&
              isInside() &&
              eventTrigger(0x1A2D, 6)
)

achievement(
    title = "Mud Surfer", points = 3,
    description = "Teach a baby how to climb into a bucket.",
    id = 179406, badge = "610702", published = "19.10.2021 14:02:35", modified = "10.08.2025 07:07:32",
    trigger = saveProtection() &&
              isInside() &&
              eventTrigger(0x1A2E, 2)
)

achievement(
    title = "Bob the Unbuilder", points = 2,
    description = "Teach a baby how to swing a hammer.",
    id = 179407, badge = "610707", published = "19.10.2021 14:03:32", modified = "10.08.2025 07:23:23",
    trigger = saveProtection() &&
              isInside() &&
              eventTrigger(0x1A2E, 6)
)

achievement(
    title = "OgreCraft", points = 10,
    description = "Finish all activities in the category with the A Block, B Block, C Block, Shiny Block and Plain Block.",
    id = 178516, badge = "198936", published = "16.10.2021 13:17:56", modified = "07.08.2025 18:00:31",
    trigger = saveProtection() &&
              isInside() &&
              measured(getItemAction1("pick up", "A Block")
                     + getItemAction1("pick up", "B Block")
                     + getItemAction1("pick up", "C Block") 
                     + getItemAction1("climb on", "A Block")
                     + getItemAction1("climb on", "Shiny Block")
                     + getItemAction1("throw", "B Block")
                     + getItemAction1("throw", "Plain Block")
                     + getItemAction2("place on", "A Block", "B Block")
                     + getItemAction2("place on", "B Block", "C Block")
                     + getItemAction2("place on", "Plain Block", "Shiny Block") == 10,
                when = inGame()) &&
                  prev(getItemAction1("pick up", "A Block")
                     + getItemAction1("pick up", "B Block")
                     + getItemAction1("pick up", "C Block") 
                     + getItemAction1("climb on", "A Block")
                     + getItemAction1("climb on", "Shiny Block")
                     + getItemAction1("throw", "B Block")
                     + getItemAction1("throw", "Plain Block")
                     + getItemAction2("place on", "A Block", "B Block")
                     + getItemAction2("place on", "B Block", "C Block")
                     + getItemAction2("place on", "Plain Block", "Shiny Block") <= 9) &&
                  prev(getItemAction1("pick up", "A Block")
                     + getItemAction1("pick up", "B Block")
                     + getItemAction1("pick up", "C Block") 
                     + getItemAction1("climb on", "A Block")
                     + getItemAction1("climb on", "Shiny Block")
                     + getItemAction1("throw", "B Block")
                     + getItemAction1("throw", "Plain Block")
                     + getItemAction2("place on", "A Block", "B Block")
                     + getItemAction2("place on", "B Block", "C Block")
                     + getItemAction2("place on", "Plain Block", "Shiny Block") >= 5)
)

achievement(
    title = "Rhythm Swamp", points = 5,
    description = "Finish all activities in the category with the Rattle.",
    id = 178517, badge = "200960", published = "16.10.2021 13:17:57", modified = "07.08.2025 18:00:31",
    trigger = saveProtection() &&
              isInside() &&
              measured(getItemAction1("pick up", "Rattle")
                     + getItemAction2("hit with", "Rattle", "A Block")
                     + getItemAction1("throw", "Rattle") 
                     + getItemAction1("kick", "Rattle")
                     + getItemAction2("place on", "Rattle", "A Block")
                     + getItemAction2("place on", "Rattle", "B Block")
                     + getItemAction2("place on", "Rattle", "C Block")
                     + getItemAction2("place in", "Rattle", "Large Bucket") == 8,
                when = inGame()) &&
                  prev(getItemAction1("pick up", "Rattle")
                     + getItemAction2("hit with", "Rattle", "A Block")
                     + getItemAction1("throw", "Rattle") 
                     + getItemAction1("kick", "Rattle")
                     + getItemAction2("place on", "Rattle", "A Block")
                     + getItemAction2("place on", "Rattle", "B Block")
                     + getItemAction2("place on", "Rattle", "C Block")
                     + getItemAction2("place in", "Rattle", "Large Bucket") <= 7) &&
                  prev(getItemAction1("pick up", "Rattle")
                     + getItemAction2("hit with", "Rattle", "A Block")
                     + getItemAction1("throw", "Rattle") 
                     + getItemAction1("kick", "Rattle")
                     + getItemAction2("place on", "Rattle", "A Block")
                     + getItemAction2("place on", "Rattle", "B Block")
                     + getItemAction2("place on", "Rattle", "C Block")
                     + getItemAction2("place in", "Rattle", "Large Bucket") >= 2)
)

achievement(
    title = "Rolling Around", points = 10,
    description = "Finish all activities in the category with the Red Ball, Green Ball, Happy Ball and Snail Shell.",
    id = 178521, badge = "198941", published = "16.10.2021 13:20:29", modified = "07.08.2025 18:00:32",
    trigger = saveProtection() &&
              isInside() &&
              measured(getItemAction1("pick up", "Red Ball")
                     + getItemAction1("throw", "Red Ball")
                     + getItemAction2("place on", "Red Ball", "A Block") 
                     + getItemAction1("pick up", "Green Ball")
                     + getItemAction1("throw", "Green Ball")
                     + getItemAction2("place on", "Green Ball", "B Block")
                     + getItemAction2("place on", "Snail Shell", "C Block")
                     + getItemAction1("throw", "Happy Ball")
                     + getItemAction1("kick", "Happy Ball")
                     + getItemAction2("place in", "Happy Ball", "Large Bucket") == 10,
                when = inGame()) &&
                  prev(getItemAction1("pick up", "Red Ball")
                     + getItemAction1("throw", "Red Ball")
                     + getItemAction2("place on", "Red Ball", "A Block") 
                     + getItemAction1("pick up", "Green Ball")
                     + getItemAction1("throw", "Green Ball")
                     + getItemAction2("place on", "Green Ball", "B Block")
                     + getItemAction2("place on", "Snail Shell", "C Block")
                     + getItemAction1("throw", "Happy Ball")
                     + getItemAction1("kick", "Happy Ball")
                     + getItemAction2("place in", "Happy Ball", "Large Bucket") <= 9) &&
                  prev(getItemAction1("pick up", "Red Ball")
                     + getItemAction1("throw", "Red Ball")
                     + getItemAction2("place on", "Red Ball", "A Block") 
                     + getItemAction1("pick up", "Green Ball")
                     + getItemAction1("throw", "Green Ball")
                     + getItemAction2("place on", "Green Ball", "B Block")
                     + getItemAction2("place on", "Snail Shell", "C Block")
                     + getItemAction1("throw", "Happy Ball")
                     + getItemAction1("kick", "Happy Ball")
                     + getItemAction2("place in", "Happy Ball", "Large Bucket") >= 5)
)

achievement(
    title = "Sweet and Sour", points = 10,
    description = "Finish all activities in the category with the Taffy, Sour Candy, Lemon Drop and Caramel Chew.",
    id = 178568, badge = "201086", published = "16.10.2021 15:25:57", modified = "07.08.2025 18:00:32",
    trigger = saveProtection() &&
              isInside() &&
              measured(getItemAction1("eat", "Taffy")
                     + getItemAction1("eat", "Sour Candy")
                     + getItemAction1("eat", "Lemon Drop") 
                     + getItemAction1("eat", "Caramel Chew")
                     + getItemAction1("throw", "Taffy")
                     + getItemAction1("throw", "Sour Candy")
                     + getItemAction1("throw", "Caramel Chew")
                     + getItemAction1("throw", "Lemon Drop")
                     + getItemAction2("place in", "Caramel Chew", "Large Bucket")
                     + getItemAction1("kick", "Taffy") == 10,
                when = inGame()) &&
                  prev(getItemAction1("eat", "Taffy")
                     + getItemAction1("eat", "Sour Candy")
                     + getItemAction1("eat", "Lemon Drop") 
                     + getItemAction1("eat", "Caramel Chew")
                     + getItemAction1("throw", "Taffy")
                     + getItemAction1("throw", "Sour Candy")
                     + getItemAction1("throw", "Caramel Chew")
                     + getItemAction1("throw", "Lemon Drop")
                     + getItemAction2("place in", "Caramel Chew", "Large Bucket")
                     + getItemAction1("kick", "Taffy") <= 9) &&
                  prev(getItemAction1("eat", "Taffy")
                     + getItemAction1("eat", "Sour Candy")
                     + getItemAction1("eat", "Lemon Drop") 
                     + getItemAction1("eat", "Caramel Chew")
                     + getItemAction1("throw", "Taffy")
                     + getItemAction1("throw", "Sour Candy")
                     + getItemAction1("throw", "Caramel Chew")
                     + getItemAction1("throw", "Lemon Drop")
                     + getItemAction2("place in", "Caramel Chew", "Large Bucket")
                     + getItemAction1("kick", "Taffy") >= 5)
)

achievement(
    title = "Itsy Bitsy Spider", points = 5,
    description = "Finish all activities in the category with the Spider.",
    id = 178529, badge = "201092", published = "16.10.2021 14:58:49", modified = "07.08.2025 18:00:33",
    trigger = saveProtection() &&
              isInside() &&
              measured(getItemAction1("not happy", "Spider")
                     + getItemAction1("pick up", "Spider")
                     + getItemAction1("throw", "Spider") 
                     + getItemAction1("drop", "Spider")
                     + getItemAction1("kick", "Spider") == 5,
                when = inGame()) &&
                  prev(getItemAction1("not happy", "Spider")
                     + getItemAction1("pick up", "Spider")
                     + getItemAction1("throw", "Spider") 
                     + getItemAction1("drop", "Spider")
                     + getItemAction1("kick", "Spider") <= 4) &&
                  prev(getItemAction1("not happy", "Spider")
                     + getItemAction1("pick up", "Spider")
                     + getItemAction1("throw", "Spider") 
                     + getItemAction1("drop", "Spider")
                     + getItemAction1("kick", "Spider") >= 1)
)

achievement(
    title = "Who Is Jack Anyway?", points = 10,
    description = "Finish all activities in the category with the Jack in the Box and Witch in the Box.",
    id = 178747, badge = "199107", published = "17.10.2021 12:58:28", modified = "07.08.2025 18:00:33",
    trigger = saveProtection() &&
              isInside() &&
              measured(getItemAction1("climb on", "Jack In The Box")
                     + getItemAction1("pick up", "Jack In The Box")
                     + getItemAction1("pop", "Jack In The Box") 
                     + getItemAction1("pick up", "Witch In The Box")
                     + getItemAction1("pop", "Witch In The Box")
                     + getItemAction1("kick", "Witch In The Box")
                     + getItemAction2("place on", "Jack In The Box", "A Block") 
                     + getItemAction2("place on", "Witch In The Box", "B Block")
                     + getItemAction2("place on", "Jack In The Box", "Witch In The Box")
                     + getItemAction2("place on", "Witch In The Box", "Jack In The Box") == 10,
                when = inGame()) &&
                  prev(getItemAction1("climb on", "Jack In The Box")
                     + getItemAction1("pick up", "Jack In The Box")
                     + getItemAction1("pop", "Jack In The Box") 
                     + getItemAction1("pick up", "Witch In The Box")
                     + getItemAction1("pop", "Witch In The Box")
                     + getItemAction1("kick", "Witch In The Box")
                     + getItemAction2("place on", "Jack In The Box", "A Block") 
                     + getItemAction2("place on", "Witch In The Box", "B Block")
                     + getItemAction2("place on", "Jack In The Box", "Witch In The Box")
                     + getItemAction2("place on", "Witch In The Box", "Jack In The Box") <= 9) &&
                  prev(getItemAction1("climb on", "Jack In The Box")
                     + getItemAction1("pick up", "Jack In The Box")
                     + getItemAction1("pop", "Jack In The Box") 
                     + getItemAction1("pick up", "Witch In The Box")
                     + getItemAction1("pop", "Witch In The Box")
                     + getItemAction1("kick", "Witch In The Box")
                     + getItemAction2("place on", "Jack In The Box", "A Block") 
                     + getItemAction2("place on", "Witch In The Box", "B Block")
                     + getItemAction2("place on", "Jack In The Box", "Witch In The Box")
                     + getItemAction2("place on", "Witch In The Box", "Jack In The Box") >= 5)
)

achievement(
    title = "Pimp My Carriage", points = 10,
    description = "Finish all activities in the category with the Wooden Cart, Carriage and Fancy Car.",
    id = 178744, badge = "211060", published = "17.10.2021 12:42:32", modified = "07.08.2025 18:00:34",
    trigger = saveProtection() &&
              isInside() &&
              measured(getItemAction1("pick up", "Wooden Cart")
                     + getItemAction1("pick up", "Carriage")
                     + getItemAction1("pick up", "Fancy Car") 
                     + getItemAction1("roll", "Wooden Cart")
                     + getItemAction1("roll", "Carriage")
                     + getItemAction1("roll", "Fancy Car")
                     + getItemAction1("throw", "Wooden Cart") 
                     + getItemAction1("throw", "Carriage")
                     + getItemAction1("throw", "Fancy Car")
                     + getItemAction1("kick", "Wooden Cart") == 10,
                when = inGame()) &&
                  prev(getItemAction1("pick up", "Wooden Cart")
                     + getItemAction1("pick up", "Carriage")
                     + getItemAction1("pick up", "Fancy Car") 
                     + getItemAction1("roll", "Wooden Cart")
                     + getItemAction1("roll", "Carriage")
                     + getItemAction1("roll", "Fancy Car")
                     + getItemAction1("throw", "Wooden Cart") 
                     + getItemAction1("throw", "Carriage")
                     + getItemAction1("throw", "Fancy Car")
                     + getItemAction1("kick", "Wooden Cart") <= 9) &&
                  prev(getItemAction1("pick up", "Wooden Cart")
                     + getItemAction1("pick up", "Carriage")
                     + getItemAction1("pick up", "Fancy Car") 
                     + getItemAction1("roll", "Wooden Cart")
                     + getItemAction1("roll", "Carriage")
                     + getItemAction1("roll", "Fancy Car")
                     + getItemAction1("throw", "Wooden Cart") 
                     + getItemAction1("throw", "Carriage")
                     + getItemAction1("throw", "Fancy Car")
                     + getItemAction1("kick", "Wooden Cart") >= 5)
)

achievement(
    title = "Sweet Tunes That Don't Smell", points = 10,
    description = "Finish all activities in the category with the Whistle, Small Horn and Large Horn.",
    id = 178522, badge = "610700", published = "16.10.2021 14:24:01", modified = "10.08.2025 08:08:12",
    trigger = saveProtection() &&
              isInside() &&
              measured(getItemAction1("blow", "Whistle")
                     + getItemAction1("blow", "Small Horn")
                     + getItemAction1("blow", "Large Horn") 
                     + getItemAction1("throw", "Whistle")
                     + getItemAction1("throw", "Small Horn")
                     + getItemAction1("throw", "Large Horn")
                     + getItemAction1("kick", "Whistle") 
                     + getItemAction1("kick", "Small Horn")
                     + getItemAction1("kick", "Large Horn")
                     + getItemAction2("place on", "Large Horn", "Piano") == 10,
                when = inGame()) &&
                  prev(getItemAction1("blow", "Whistle")
                     + getItemAction1("blow", "Small Horn")
                     + getItemAction1("blow", "Large Horn") 
                     + getItemAction1("throw", "Whistle")
                     + getItemAction1("throw", "Small Horn")
                     + getItemAction1("throw", "Large Horn")
                     + getItemAction1("kick", "Whistle") 
                     + getItemAction1("kick", "Small Horn")
                     + getItemAction1("kick", "Large Horn")
                     + getItemAction2("place on", "Large Horn", "Piano") <= 9) &&
                  prev(getItemAction1("blow", "Whistle")
                     + getItemAction1("blow", "Small Horn")
                     + getItemAction1("blow", "Large Horn") 
                     + getItemAction1("throw", "Whistle")
                     + getItemAction1("throw", "Small Horn")
                     + getItemAction1("throw", "Large Horn")
                     + getItemAction1("kick", "Whistle") 
                     + getItemAction1("kick", "Small Horn")
                     + getItemAction1("kick", "Large Horn")
                     + getItemAction2("place on", "Large Horn", "Piano") >= 5)
)

achievement(
    title = "Once Upon A Hug", points = 10,
    description = "Finish all activities in the category with the Donkey Doll, Dolly, Knight Doll and Teddy Bear.",
    id = 179402, badge = "610708", published = "19.10.2021 13:14:41", modified = "10.08.2025 08:08:20",
    trigger = saveProtection() &&
              isInside() &&
              measured(getItemAction1("pick up", "Donkey Doll")
                     + getItemAction1("pick up", "Dolly")
                     + getItemAction1("pick up", "Knight Doll") 
                     + getItemAction1("pick up", "Teddy Bear")
                     + getItemAction1("hug", "Dolly")
                     + getItemAction1("talk", "Knight Doll")
                     + getItemAction1("hug", "Teddy Bear") 
                     + getItemAction1("throw", "Donkey Doll")
                     + getItemAction2("place on", "Donkey Doll", "Wooden Cart")
                     + getItemAction2("place on", "Knight Doll", "Fancy Car") == 10,
                when = inGame()) &&
                  prev(getItemAction1("pick up", "Donkey Doll")
                     + getItemAction1("pick up", "Dolly")
                     + getItemAction1("pick up", "Knight Doll") 
                     + getItemAction1("pick up", "Teddy Bear")
                     + getItemAction1("hug", "Dolly")
                     + getItemAction1("talk", "Knight Doll")
                     + getItemAction1("hug", "Teddy Bear") 
                     + getItemAction1("throw", "Donkey Doll")
                     + getItemAction2("place on", "Donkey Doll", "Wooden Cart")
                     + getItemAction2("place on", "Knight Doll", "Fancy Car") <= 9) &&
                  prev(getItemAction1("pick up", "Donkey Doll")
                     + getItemAction1("pick up", "Dolly")
                     + getItemAction1("pick up", "Knight Doll") 
                     + getItemAction1("pick up", "Teddy Bear")
                     + getItemAction1("hug", "Dolly")
                     + getItemAction1("talk", "Knight Doll")
                     + getItemAction1("hug", "Teddy Bear") 
                     + getItemAction1("throw", "Donkey Doll")
                     + getItemAction2("place on", "Donkey Doll", "Wooden Cart")
                     + getItemAction2("place on", "Knight Doll", "Fancy Car") >= 5)
)

achievement(
    title = "Put That Thing in the Thing", points = 10,
    description = "Finish all activities in the category with the Small Bucket and Large Bucket.",
    id = 178738, badge = "610709", published = "17.10.2021 11:52:15", modified = "10.08.2025 08:32:22",
    trigger = saveProtection() &&
              isInside() &&
              measured(getItemAction1("climb in", "Large Bucket")
                     + getItemAction1("climb out", "Large Bucket")
                     + getItemAction1("pick up", "Small Bucket") 
                     + getItemAction1("throw", "Small Bucket")
                     + getItemAction1("kick", "Small Bucket")
                     + getItemAction2("place in", "Red Ball", "Large Bucket")
                     + getItemAction2("place in", "Dolly", "Large Bucket") 
                     + getItemAction2("place in", "Small Bucket", "Large Bucket")
                     + getItemAction2("place on", "Small Bucket", "Plain Block")
                     + getItemAction2("place on", "Small Bucket", "Small Bucket") == 10,
                when = inGame()) &&
                  prev(getItemAction1("climb in", "Large Bucket")
                     + getItemAction1("climb out", "Large Bucket")
                     + getItemAction1("pick up", "Small Bucket") 
                     + getItemAction1("throw", "Small Bucket")
                     + getItemAction1("kick", "Small Bucket")
                     + getItemAction2("place in", "Red Ball", "Large Bucket")
                     + getItemAction2("place in", "Dolly", "Large Bucket") 
                     + getItemAction2("place in", "Small Bucket", "Large Bucket")
                     + getItemAction2("place on", "Small Bucket", "Plain Block")
                     + getItemAction2("place on", "Small Bucket", "Small Bucket") <= 9) &&
                  prev(getItemAction1("climb in", "Large Bucket")
                     + getItemAction1("climb out", "Large Bucket")
                     + getItemAction1("pick up", "Small Bucket") 
                     + getItemAction1("throw", "Small Bucket")
                     + getItemAction1("kick", "Small Bucket")
                     + getItemAction2("place in", "Red Ball", "Large Bucket")
                     + getItemAction2("place in", "Dolly", "Large Bucket") 
                     + getItemAction2("place in", "Small Bucket", "Large Bucket")
                     + getItemAction2("place on", "Small Bucket", "Plain Block")
                     + getItemAction2("place on", "Small Bucket", "Small Bucket") >= 5)
)

achievement(
    title = "Right Hat My Alley", points = 10,
    description = "Finish all activities in the category with the Wizard Hat, Bowler Hat, Silly Hat and Top Hat.",
    id = 180432, badge = "610710", published = "27.10.2021 14:35:19", modified = "10.08.2025 08:42:44",
    trigger = saveProtection() &&
              isInside() &&
              measured(getItemAction1("pick up", "Wizard Hat")
                     + getItemAction1("pick up", "Bowler Hat")
                     + getItemAction1("pick up", "Silly Hat") 
                     + getItemAction1("pick up", "Top Hat")
                     + getItemAction1("wear", "Wizard Hat")
                     + getItemAction1("wear", "Bowler Hat")
                     + getItemAction1("wear", "Silly Hat") 
                     + getItemAction1("wear", "Top Hat")
                     + getItemAction1("throw", "Top Hat")
                     + getItemAction1("kick", "Silly Hat") == 10,
                when = inGame()) &&
                  prev(getItemAction1("pick up", "Wizard Hat")
                     + getItemAction1("pick up", "Bowler Hat")
                     + getItemAction1("pick up", "Silly Hat") 
                     + getItemAction1("pick up", "Top Hat")
                     + getItemAction1("wear", "Wizard Hat")
                     + getItemAction1("wear", "Bowler Hat")
                     + getItemAction1("wear", "Silly Hat") 
                     + getItemAction1("wear", "Top Hat")
                     + getItemAction1("throw", "Top Hat")
                     + getItemAction1("kick", "Silly Hat") <= 9) &&
                  prev(getItemAction1("pick up", "Wizard Hat")
                     + getItemAction1("pick up", "Bowler Hat")
                     + getItemAction1("pick up", "Silly Hat") 
                     + getItemAction1("pick up", "Top Hat")
                     + getItemAction1("wear", "Wizard Hat")
                     + getItemAction1("wear", "Bowler Hat")
                     + getItemAction1("wear", "Silly Hat") 
                     + getItemAction1("wear", "Top Hat")
                     + getItemAction1("throw", "Top Hat")
                     + getItemAction1("kick", "Silly Hat") >= 5)
)

achievement(
    title = "Meat the Insatiable", points = 10,
    description = "Finish all activities in the category with the Meat, Carrot, Potato and Broccoli.",
    id = 178523, badge = "614652", published = "16.10.2021 14:27:51", modified = "01.01.2022 14:20:48",
    trigger = saveProtection() &&
              isInside() &&
              measured(getItemAction1("eat", "Meat")
                     + getItemAction1("eat", "Carrot")
                     + getItemAction1("eat", "Potato") 
                     + getItemAction1("eat", "Broccoli")
                     + getItemAction1("throw", "Meat")
                     + getItemAction2("place in", "Carrot", "Large Bucket")
                     + getItemAction2("place on", "Potato", "Plain Block") 
                     + getItemAction2("place on", "Broccoli", "B Block")
                     + getItemAction2("place on", "Carrot", "C Block")
                     + getItemAction1("throw", "Potato") == 10,
                when = inGame()) &&
                  prev(getItemAction1("eat", "Meat")
                     + getItemAction1("eat", "Carrot")
                     + getItemAction1("eat", "Potato") 
                     + getItemAction1("eat", "Broccoli")
                     + getItemAction1("throw", "Meat")
                     + getItemAction2("place in", "Carrot", "Large Bucket")
                     + getItemAction2("place on", "Potato", "Plain Block") 
                     + getItemAction2("place on", "Broccoli", "B Block")
                     + getItemAction2("place on", "Carrot", "C Block")
                     + getItemAction1("throw", "Potato") <= 9) &&
                  prev(getItemAction1("eat", "Meat")
                     + getItemAction1("eat", "Carrot")
                     + getItemAction1("eat", "Potato") 
                     + getItemAction1("eat", "Broccoli")
                     + getItemAction1("throw", "Meat")
                     + getItemAction2("place in", "Carrot", "Large Bucket")
                     + getItemAction2("place on", "Potato", "Plain Block") 
                     + getItemAction2("place on", "Broccoli", "B Block")
                     + getItemAction2("place on", "Carrot", "C Block")
                     + getItemAction1("throw", "Potato") >= 5)
)

achievement(
    title = "Dough Like You Want", points = 10,
    description = "Finish all activities in the category with the Bread Loaf, Cupcake, Cabbage and Cake Slice.",
    id = 178530, badge = "614653", published = "16.10.2021 15:05:56", modified = "01.01.2022 14:20:49",
    trigger = saveProtection() &&
              isInside() &&
              measured(getItemAction1("eat", "Cabbage")
                     + getItemAction1("eat", "Bread Loaf")
                     + getItemAction1("eat", "Cupcake") 
                     + getItemAction1("eat", "Cake Slice")
                     + getItemAction1("pick up", "Cabbage")
                     + getItemAction2("place in", "Bread Loaf", "Large Bucket")
                     + getItemAction1("throw", "Cupcake") 
                     + getItemAction2("place in", "Cake Slice", "Large Bucket")
                     + getItemAction1("throw", "Cabbage")
                     + getItemAction1("kick", "Cupcake") == 10,
                when = inGame()) &&
                  prev(getItemAction1("eat", "Cabbage")
                     + getItemAction1("eat", "Bread Loaf")
                     + getItemAction1("eat", "Cupcake") 
                     + getItemAction1("eat", "Cake Slice")
                     + getItemAction1("pick up", "Cabbage")
                     + getItemAction2("place in", "Bread Loaf", "Large Bucket")
                     + getItemAction1("throw", "Cupcake") 
                     + getItemAction2("place in", "Cake Slice", "Large Bucket")
                     + getItemAction1("throw", "Cabbage")
                     + getItemAction1("kick", "Cupcake") <= 9) &&
                  prev(getItemAction1("eat", "Cabbage")
                     + getItemAction1("eat", "Bread Loaf")
                     + getItemAction1("eat", "Cupcake") 
                     + getItemAction1("eat", "Cake Slice")
                     + getItemAction1("pick up", "Cabbage")
                     + getItemAction2("place in", "Bread Loaf", "Large Bucket")
                     + getItemAction1("throw", "Cupcake") 
                     + getItemAction2("place in", "Cake Slice", "Large Bucket")
                     + getItemAction1("throw", "Cabbage")
                     + getItemAction1("kick", "Cupcake") >= 5)
)

achievement(
    title = "Swing Your Thing", points = 10,
    description = "Finish all activities in the category with the Small Hammer and Large Hammer.",
    id = 178531, badge = "614654", published = "16.10.2021 15:10:35", modified = "01.01.2022 14:20:49",
    trigger = saveProtection() &&
              isInside() &&
              measured(getItemAction1("pick up", "Small Hammer")
                     + getItemAction1("pick up", "Large Hammer")
                     + getItemAction2("hit with", "Small Hammer", "Plain Block") 
                     + getItemAction2("hit with", "Large Hammer", "Shiny Block")
                     + getItemAction2("hit with", "Small Hammer", "Piano")
                     + getItemAction2("hit with", "Large Hammer", "Drum Set")
                     + getItemAction2("hit with", "Small Hammer", "Xylophone") 
                     + getItemAction2("hit with", "Large Hammer", "Green Ball")
                     + getItemAction2("hit with", "Small Hammer", "Broccoli")
                     + getItemAction2("hit with", "Large Hammer", "Small Hammer") == 10,
                when = inGame()) &&
                  prev(getItemAction1("pick up", "Small Hammer")
                     + getItemAction1("pick up", "Large Hammer")
                     + getItemAction2("hit with", "Small Hammer", "Plain Block") 
                     + getItemAction2("hit with", "Large Hammer", "Shiny Block")
                     + getItemAction2("hit with", "Small Hammer", "Piano")
                     + getItemAction2("hit with", "Large Hammer", "Drum Set")
                     + getItemAction2("hit with", "Small Hammer", "Xylophone") 
                     + getItemAction2("hit with", "Large Hammer", "Green Ball")
                     + getItemAction2("hit with", "Small Hammer", "Broccoli")
                     + getItemAction2("hit with", "Large Hammer", "Small Hammer") <= 9) &&
                  prev(getItemAction1("pick up", "Small Hammer")
                     + getItemAction1("pick up", "Large Hammer")
                     + getItemAction2("hit with", "Small Hammer", "Plain Block") 
                     + getItemAction2("hit with", "Large Hammer", "Shiny Block")
                     + getItemAction2("hit with", "Small Hammer", "Piano")
                     + getItemAction2("hit with", "Large Hammer", "Drum Set")
                     + getItemAction2("hit with", "Small Hammer", "Xylophone") 
                     + getItemAction2("hit with", "Large Hammer", "Green Ball")
                     + getItemAction2("hit with", "Small Hammer", "Broccoli")
                     + getItemAction2("hit with", "Large Hammer", "Small Hammer") >= 5)
)

achievement(
    title = "Frog On the Loose", points = 10,
    description = "Finish all activities in the category with the Red Balloon and Frog Balloon.",
    id = 180435, badge = "614655", published = "27.10.2021 14:42:52", modified = "01.01.2022 14:20:49",
    trigger = saveProtection() &&
              isInside() &&
              measured(getItemAction1("pick up", "Red Balloon")
                     + getItemAction1("pick up", "Frog Balloon")
                     + getItemAction1("throw", "Red Balloon")
                     + getItemAction1("throw", "Frog Balloon")
                     + getItemAction1("kick", "Red Balloon")
                     + getItemAction1("kick", "Frog Balloon")
                     + getItemAction2("place on", "Red Balloon", "A Block") 
                     + getItemAction2("place in", "Frog Balloon", "Large Bucket")
                     + getItemAction2("place on", "Red Balloon", "Frog Balloon")
                     + getItemAction2("place on", "Frog Balloon", "Red Balloon") == 10,
                when = inGame()) &&
                  prev(getItemAction1("pick up", "Red Balloon")
                     + getItemAction1("pick up", "Frog Balloon")
                     + getItemAction1("throw", "Red Balloon")
                     + getItemAction1("throw", "Frog Balloon")
                     + getItemAction1("kick", "Red Balloon")
                     + getItemAction1("kick", "Frog Balloon")
                     + getItemAction2("place on", "Red Balloon", "A Block") 
                     + getItemAction2("place in", "Frog Balloon", "Large Bucket")
                     + getItemAction2("place on", "Red Balloon", "Frog Balloon")
                     + getItemAction2("place on", "Frog Balloon", "Red Balloon") <= 9) &&
                  prev(getItemAction1("pick up", "Red Balloon")
                     + getItemAction1("pick up", "Frog Balloon")
                     + getItemAction1("throw", "Red Balloon")
                     + getItemAction1("throw", "Frog Balloon")
                     + getItemAction1("kick", "Red Balloon")
                     + getItemAction1("kick", "Frog Balloon")
                     + getItemAction2("place on", "Red Balloon", "A Block") 
                     + getItemAction2("place in", "Frog Balloon", "Large Bucket")
                     + getItemAction2("place on", "Red Balloon", "Frog Balloon")
                     + getItemAction2("place on", "Frog Balloon", "Red Balloon") >= 5)
)

achievement(
    title = "Face Creatures of a Fairy Tale", points = 10,
    description = "Finish all activities in the category with the Funny Mask, Scary Mask, Shrek Mask and Donkey Mask.",
    id = 180436, badge = "615822", published = "27.10.2021 14:42:52", modified = "01.01.2022 14:20:50",
    trigger = saveProtection() &&
              isInside() &&
              measured(getItemAction1("wear", "Funny Mask")
                     + getItemAction1("wear", "Scary Mask")
                     + getItemAction1("wear", "Shrek Mask")
                     + getItemAction1("wear", "Donkey Mask")
                     + getItemAction1("catch", "Funny Mask")
                     + getItemAction1("catch", "Scary Mask")
                     + getItemAction1("kick", "Shrek Mask") 
                     + getItemAction1("kick", "Donkey Mask")
                     + getItemAction1("throw", "Shrek Mask")
                     + getItemAction1("throw", "Donkey Mask") == 10,
                when = inGame()) &&
                   prev(getItemAction1("wear", "Funny Mask")
                     + getItemAction1("wear", "Scary Mask")
                     + getItemAction1("wear", "Shrek Mask")
                     + getItemAction1("wear", "Donkey Mask")
                     + getItemAction1("catch", "Funny Mask")
                     + getItemAction1("catch", "Scary Mask")
                     + getItemAction1("kick", "Shrek Mask") 
                     + getItemAction1("kick", "Donkey Mask")
                     + getItemAction1("throw", "Shrek Mask")
                     + getItemAction1("throw", "Donkey Mask") <= 9) &&
                   prev(getItemAction1("wear", "Funny Mask")
                     + getItemAction1("wear", "Scary Mask")
                     + getItemAction1("wear", "Shrek Mask")
                     + getItemAction1("wear", "Donkey Mask")
                     + getItemAction1("catch", "Funny Mask")
                     + getItemAction1("catch", "Scary Mask")
                     + getItemAction1("kick", "Shrek Mask") 
                     + getItemAction1("kick", "Donkey Mask")
                     + getItemAction1("throw", "Shrek Mask")
                     + getItemAction1("throw", "Donkey Mask") >= 5)
)

achievement(
    title = "Give Me The Beat", points = 10,
    description = "Finish all activities in the category with the Piano, Xylophone and Drum Set.",
    id = 178518, badge = "614668", published = "16.10.2021 13:17:57", modified = "01.01.2022 14:28:22",
    trigger = saveProtection() &&
              isInside() &&
              measured(getItemAction1("tap", "Piano")
                     + getItemAction1("tap", "Xylophone")
                     + getItemAction1("tap", "Drum Set")
                     + getItemAction1("pick up", "Drum Set")
                     + getItemAction2("place on", "Drum Set", "Drum Set")
                     + getItemAction2("place on", "Drum Set", "Piano")
                     + getItemAction2("place on", "Drum Set", "Xylophone") 
                     + getItemAction1("kick", "Xylophone")
                     + getItemAction1("kick", "Drum Set")
                     + getItemAction1("kick", "Piano") == 10,
                when = inGame()) &&
                  prev(getItemAction1("tap", "Piano")
                     + getItemAction1("tap", "Xylophone")
                     + getItemAction1("tap", "Drum Set")
                     + getItemAction1("pick up", "Drum Set")
                     + getItemAction2("place on", "Drum Set", "Drum Set")
                     + getItemAction2("place on", "Drum Set", "Piano")
                     + getItemAction2("place on", "Drum Set", "Xylophone") 
                     + getItemAction1("kick", "Xylophone")
                     + getItemAction1("kick", "Drum Set")
                     + getItemAction1("kick", "Piano") <= 9) &&
                  prev(getItemAction1("tap", "Piano")
                     + getItemAction1("tap", "Xylophone")
                     + getItemAction1("tap", "Drum Set")
                     + getItemAction1("pick up", "Drum Set")
                     + getItemAction2("place on", "Drum Set", "Drum Set")
                     + getItemAction2("place on", "Drum Set", "Piano")
                     + getItemAction2("place on", "Drum Set", "Xylophone") 
                     + getItemAction1("kick", "Xylophone")
                     + getItemAction1("kick", "Drum Set")
                     + getItemAction1("kick", "Piano") >= 5)
)

achievement(
    title = "I Wish I Wear You", points = 3,
    description = "Let an ogre baby wear the Donkey Mask while a dronkey baby is wearing the Shrek Mask.",
    id = 178524, badge = "614662", published = "16.10.2021 14:34:17", modified = "01.01.2022 14:28:22",
    trigger = saveProtection() &&
              isInside() &&
              ((babyIsOgre(0) && babyIsDronkey(1) &&
                    Baby2ItemOnFace == getItemID("Shrek Mask") &&
                    Baby1ItemOnFace == getItemID("Donkey Mask")) ||
                babyIsOgre(1) && babyIsDronkey(0) &&
                    Baby2ItemOnFace == getItemID("Donkey Mask") &&
                    Baby1ItemOnFace == getItemID("Shrek Mask"))
)

achievement(
    title = "Parents' Love Story", points = 2,
    description = "Let Ogre Girl and either Ogre Jr. or Ogre Boy play with the Frog Balloon at the same time.",
    id = 178526, badge = "615862", published = "16.10.2021 14:42:52", modified = "01.01.2022 14:28:23",
    trigger = saveProtection() &&
              isInside() &&
              (BabyID1 == 0x01 &&
                __ornext(BabyID2 == 0x00 ||
                         BabyID2 == 0x02) ||
                BabyID2 == 0x01 &&
                __ornext(BabyID1 == 0x00 ||
                         BabyID1 == 0x02)) &&
              Baby1ItemHolding == getItemID("Frog Balloon") &&
              Baby2ItemHolding == getItemID("Frog Balloon")
)

achievement(
    title = "Does It Smell Weird Here?", points = 1,
    description = "Make the same baby poop three times in 20 seconds.",
    id = 178519, badge = "616025", published = "16.10.2021 13:17:57", modified = "01.01.2022 14:28:23",
    trigger = saveProtection() &&
              never(GameState < 0x12 ||
                    GameState > 0x15) &&
              never(repeated(1201,
                  (once((Baby1Animation == 0x33) ||
                         Baby2Animation == 0x33)) && 
                         always_true())
              ) &&
              (measured(
                repeated(3,
                  (prev(Baby1Animation) == 0x33) &&
                        Baby1Animation != 0x33
                )
               ) ||
               measured(
                repeated(3,
                  (prev(Baby2Animation) == 0x33) &&
                        Baby2Animation != 0x33
                )
               )
              )
)

achievement(
    title = "Sip, Sip, Away", points = 1,
    description = "When a baby is complaining about its stomage, let it eat until it is full.",
    id = 178525, badge = "616024", published = "16.10.2021 14:37:44", modified = "01.01.2022 14:28:23",
    trigger = saveProtection() &&
              RoomNotLoaded == 0 &&
              never(GameState < 0x12 ||
                    GameState > 0x15) &&
              ((once(Baby1Animation == 0x29 &&
                     Baby1Fullness < 0x0001E000) &&
                     Baby1Fullness >= 0x0063F00) ||
               (once(Baby2Animation == 0x29 &&
                     Baby2Fullness < 0x0001E000) &&
                     Baby2Fullness >= 0x0063F00))
)

achievement(
    title = "Brush Your Teeth", points = 1,
    description = "When a baby is complaining about its oral hygene, brush its teeth fully.",
    id = 180447, badge = "616023", published = "27.10.2021 14:54:53", modified = "01.01.2022 14:28:24",
    trigger = saveProtection() &&
              RoomNotLoaded == 0 &&
              never(GameState < 0x12 ||
                    GameState > 0x15) &&
              ((once(Baby1Animation == 0x13 &&
                     Baby1OralHygene < 0x0001E000) &&
                     Baby1OralHygene >= 0x0064000) ||
               (once(Baby2Animation == 0x13 &&
                     Baby2OralHygene < 0x0001E000) &&
                     Baby2OralHygene >= 0x0064000))
)

achievement(
    title = "Still Not Listening", points = 1,
    description = "When a baby is complaining about its ear hygene, clear its ears completely.",
    id = 180448, badge = "616026", published = "27.10.2021 14:54:54", modified = "01.01.2022 14:28:24",
    trigger = saveProtection() &&
              RoomNotLoaded == 0 &&
              never(GameState < 0x12 ||
                    GameState > 0x15) &&
              ((once(Baby1Animation == 0x17 &&
                     Baby1EarHygene < 0x0001E000) &&
                     Baby1EarHygene >= 0x0064000) ||
               (once(Baby2Animation == 0x17 &&
                     Baby2EarHygene < 0x0001E000) &&
                     Baby2EarHygene >= 0x0064000))
)

achievement(
    title = "Heir of the Hair", points = 1,
    description = "When a baby is complaining about itse hair hygene, brush its hair fully.",
    id = 178520, badge = "616022", published = "16.10.2021 13:17:58", modified = "01.01.2022 14:35:53",
    trigger = saveProtection() &&
              RoomNotLoaded == 0 &&
              never(GameState < 0x12 ||
                    GameState > 0x15) &&
              ((once(Baby1Animation == 0x15 &&
                     Baby1HairHygene < 0x0001E000) &&
                     Baby1HairHygene >= 0x0064000) ||
               (once(Baby2Animation == 0x15 &&
                     Baby2HairHygene < 0x0001E000) &&
                     Baby2HairHygene >= 0x0064000))
)

achievement(
    title = "Coup de Poop", points = 1,
    description = "When a baby is needing a new diaper, change it.",
    id = 178739, badge = "616021", published = "17.10.2021 12:09:09", modified = "01.01.2022 14:35:54",
    trigger = saveProtection() &&
              RoomNotLoaded == 0 &&
              never(GameState < 0x12 ||
                    GameState > 0x15) &&
              ((prev(Baby1Animation) == 0x34 && 
                     Baby1Animation != 0x34) || 
               (prev(Baby2Animation) == 0x34 && 
                     Baby2Animation != 0x34))
)

achievement(
    title = "Hot Tub Bubble Pop", points = 1,
    description = "Let your baby take a bath and wash it.",
    id = 178741, badge = "616019", published = "17.10.2021 11:59:59", modified = "01.01.2022 14:35:53",
    trigger = DebugFlag == 0 &&
              DataPointer == prev(DataPointer) &&
              prev(GameState >= 0x16) &&
              prev(GameState <= 0x17) &&
              isInside()
)

achievement(
    title = "Slug and Play", points = 5,
    description = "Finish the minigame 'Snail Bowling' with more than 50 points.",
    id = 178740, badge = "616460", published = "17.10.2021 12:09:09", modified = "01.01.2022 14:35:54",
    trigger = saveProtection() &&
              endMinigameSnailBowling() &&
              (getScoreOfSnailBowlingSpecificBaby(0) > 50 ||
               getScoreOfSnailBowlingSpecificBaby(1) > 50 ||
               getScoreOfSnailBowlingSpecificBaby(2) > 50 ||
               getScoreOfSnailBowlingSpecificBaby(3) > 50)
)

achievement(
    title = "Fairylight Dinner", points = 5,
    description = "Finish the minigame 'Firefly Catch' with more than 20 points.",
    id = 178743, badge = "616461", published = "17.10.2021 12:42:32", modified = "01.01.2022 14:35:54",
    trigger = saveProtection() &&
              endMinigameFireflyCatch() &&
              (getScoreOfFireflyCatchSpecificBaby(0) > 20 ||
               getScoreOfFireflyCatchSpecificBaby(1) > 20 ||
               getScoreOfFireflyCatchSpecificBaby(2) > 20 ||
               getScoreOfFireflyCatchSpecificBaby(3) > 20)
)

achievement(
    title = "High Stack Hay Burn", points = 5,
    description = "Finish the minigame 'Target Practice' with more than 20 points.",
    id = 180464, badge = "616457", published = "27.10.2021 15:11:48", modified = "01.01.2022 14:35:55",
    trigger = saveProtection() &&
              endMinigameTargetPractice() &&
              (getScoreOfTargetPracticeSpecificBaby(0) > 20 ||
               getScoreOfTargetPracticeSpecificBaby(1) > 20 ||
               getScoreOfTargetPracticeSpecificBaby(2) > 20 ||
               getScoreOfTargetPracticeSpecificBaby(3) > 20)
)

achievement(
    title = "Huff, Puff and Repair Your House", points = 5,
    description = "Finish the minigame 'Pig Builders' with more than 20 points.",
    id = 180465, badge = "616464", published = "27.10.2021 15:11:48", modified = "01.01.2022 14:35:55",
    trigger = saveProtection() &&
              endMinigamePigBuilders() &&
              (getScoreOfPigBuildersSpecificBaby(0) > 20 ||
               getScoreOfPigBuildersSpecificBaby(1) > 20 ||
               getScoreOfPigBuildersSpecificBaby(2) > 20 ||
               getScoreOfPigBuildersSpecificBaby(3) > 20)
)

achievement(
    title = "Chew to the Moon", points = 5,
    description = "Finish the minigame 'Candy Gobble' with more than 20 points.",
    id = 180466, badge = "616463", published = "27.10.2021 15:11:49", modified = "01.01.2022 14:35:55",
    trigger = saveProtection() &&
              endMinigameCandyGobble() &&
              (getScoreOfCandyGobbleSpecificBaby(0) > 20 ||
               getScoreOfCandyGobbleSpecificBaby(1) > 20 ||
               getScoreOfCandyGobbleSpecificBaby(2) > 20 ||
               getScoreOfCandyGobbleSpecificBaby(3) > 20)
)

//--------------------------------------------------
// Leaderboards

leaderboard(
    id = 138643,
    title = "Snail Bowling", 
    description = "Highest Score in a Game.",
    start = saveProtection() &&
            endMinigameSnailBowling(), 
    cancel = always_false(), 
    submit = always_true(), 
    value = max_of(getScoreOfSnailBowlingSpecificBaby(0),
                   getScoreOfSnailBowlingSpecificBaby(1),
                   getScoreOfSnailBowlingSpecificBaby(2),
                   getScoreOfSnailBowlingSpecificBaby(3)), 
    format = "Value", 
    lower_is_better = false
)

leaderboard(
    id = 138645,
    title = "Firefly Catch", 
    description = "Highest Score in a Game.",
    start = saveProtection() &&
            endMinigameFireflyCatch(), 
    cancel = always_false(), 
    submit = always_true(), 
    value = max_of(getScoreOfFireflyCatchSpecificBaby(0),
                   getScoreOfFireflyCatchSpecificBaby(1),
                   getScoreOfFireflyCatchSpecificBaby(2),
                   getScoreOfFireflyCatchSpecificBaby(3)), 
    format = "Value", 
    lower_is_better = false
)

leaderboard(
    id = 138646,
    title = "Pig Building", 
    description = "Highest Score in a Game.",
    start = saveProtection() &&
            endMinigamePigBuilders(), 
    cancel = always_false(), 
    submit = always_true(), 
    value = max_of(getScoreOfPigBuildersSpecificBaby(0),
                   getScoreOfPigBuildersSpecificBaby(1),
                   getScoreOfPigBuildersSpecificBaby(2),
                   getScoreOfPigBuildersSpecificBaby(3)), 
    format = "Value", 
    lower_is_better = false
)

leaderboard(
    id = 138648,
    title = "Target Practice", 
    description = "Highest Score in a Game.",
    start = saveProtection() &&
            endMinigameTargetPractice(), 
    cancel = always_false(), 
    submit = always_true(), 
    value = max_of(getScoreOfTargetPracticeSpecificBaby(0),
                   getScoreOfTargetPracticeSpecificBaby(1),
                   getScoreOfTargetPracticeSpecificBaby(2),
                   getScoreOfTargetPracticeSpecificBaby(3)), 
    format = "Value", 
    lower_is_better = false
)

leaderboard(
    id = 138647,
    title = "Candy Gobble", 
    description = "Highest Score in a Game.",
    start = saveProtection() &&
            endMinigameCandyGobble(), 
    cancel = always_false(), 
    submit = always_true(), 
    value = max_of(getScoreOfCandyGobbleSpecificBaby(0),
                   getScoreOfCandyGobbleSpecificBaby(1),
                   getScoreOfCandyGobbleSpecificBaby(2),
                   getScoreOfCandyGobbleSpecificBaby(3)), 
    format = "Value", 
    lower_is_better = false
)

//--------------------------------------------------
// Rich Presence

rich_presence_conditional_display(DebugFlag > 0, 
    "The Babysitter is cheating their Job"
)

rich_presence_conditional_display(gameState() <= 0x09, 
    "In the Titlescreen"
)

rich_presence_conditional_display(gameState() == 0x0A, 
    "In the  Main Menu"
)

rich_presence_conditional_display(gameState() == 0x0B, 
    "In the Settings"
)

rich_presence_conditional_display(gameState() == 0x0C, 
    "The Babysitter is preparing a Multiplayer Match"
)
    
rich_presence_conditional_display(gameState() == 0x0D, 
    "The Babysitter gets hired by Shrek and Fiona"
)
    
rich_presence_conditional_display(gameState() == 0x0E, 
    "The Babysitter is choosing two Babys they want to take care about"
)

rich_presence_conditional_display(gameState() == 0x0F, 
    "The Babysitter is preparing a Minigame Match"
)

rich_presence_conditional_display(gameState() == 0x10, 
    "The Babysitter is selecting a Minigame"
)

rich_presence_conditional_display(gameState() == 0x11, 
    "The Babysitter is selecting a Baby to play Minigames with"
)
    
rich_presence_conditional_display(isInside(), 
    "The Babysitter is playing with {0} and {1} in {2} [🟡{3}]",
        rich_presence_lookup("Baby1", BabyID1, babyLookup, fallback = "Ogre Boy"),
        rich_presence_lookup("Baby2", BabyID2, babyLookup, fallback = "Ogre Girl"),
        rich_presence_lookup("LocationInside", GameState, locationInLookup, fallback = "Shrek's Hut"),
        rich_presence_macro("Number", CurrentPoints)
)

rich_presence_conditional_display(gameState() >= 0x16 && gameState() <= 0x17, 
    "The Babysitter is bathing {0} in {1} [🟡{2}]",
        rich_presence_lookup("Baby1", ActionBabyID, babyLookup, fallback = "Ogre Boy"),
        rich_presence_lookup("LocationInside", prior(GameState), locationInLookup, fallback = "Shrek's Hut"),
        rich_presence_macro("Number", CurrentPoints)
)

rich_presence_conditional_display(isOutside(), 
    "The Babysitter and {0} are walking around {1} [🐌{3}/10] [🧅{4}/10] [🟡{2}]",
        rich_presence_lookup("Baby1", ActionBabyID, babyLookup, fallback = "Ogre Boy"),
        rich_presence_lookup("LocationOutside", GameState, locationOutLookup, fallback = "outside Shrek's Hut"),
        rich_presence_macro("Number", CurrentPoints),
        rich_presence_macro("Number", byte(DataPointer + GameState - 0x18 + 0x10 + 0)),
        rich_presence_macro("Number", byte(DataPointer + GameState - 0x18 + 0x10 + 5))
)

rich_presence_conditional_display(gameState() == 0x1D, 
    "The Babysitter, {0} and {1} are in the Store [🟡{2}]",
        rich_presence_lookup("Baby1", BabyID1, babyLookup, fallback = "Ogre Boy"),
        rich_presence_lookup("Baby2", BabyID2, babyLookup, fallback = "Ogre Girl"),
        rich_presence_macro("Number", CurrentPoints)
)

rich_presence_conditional_display((gameState() == 0x1E || gameState() == 0x23) && dword(0x012263C) != 0, 
    "The Babysitter and {0} are bowling with Snails [🎳{1}] [Round {2}]",
    rich_presence_lookup("Baby1", getBabyOfSnailBowling(), babyLookup, fallback = "Ogre Boy"),
    rich_presence_macro("Number", getScoreOfSnailBowling()),
    rich_presence_macro("Number", 1 + byte(MinigamePointer + 0x110))
)

rich_presence_conditional_display((gameState() == 0x1F || gameState() == 0x24) && dword(0x012263C) != 0, 
    "The Babysitter and {0} are catching Fireflies [🪲{1}] [⏱️{2}]",
    rich_presence_lookup("Baby1", getBabyOfFireflyCatch(), babyLookup, fallback = "Ogre Boy"),
    rich_presence_macro("Number", getScoreOfFireflyCatch()),
    rich_presence_macro("Seconds", dword(MinigamePointer + 0x294)/0x100000)
)

rich_presence_conditional_display((gameState() == 0x20 || gameState() == 0x25) && dword(0x012263C) != 0, 
    "The Babysitter and {0} are repairing Houses [🛖{1}] [🐺🏚️{2}/3]",
    rich_presence_lookup("Baby1", getBabyOfPigBuilders(), babyLookup, fallback = "Ogre Boy"),
    rich_presence_macro("Number", getScoreOfPigBuilders()),
    rich_presence_macro("Number", 3
                                - byte(tbyte(MinigamePointer + 0xA8) + 0x184)
                                - byte(tbyte(tbyte(MinigamePointer + 0xA8) + 0x10C) + 0x184)
                                - byte(tbyte(tbyte(tbyte(MinigamePointer + 0xA8) + 0x10C) + 0x10C) + 0x184))
)

rich_presence_conditional_display((gameState() == 0x21 || gameState() == 0x26) && dword(0x012263C) != 0,
    "The Babysitter and {0} are burning Haystacks [🔥{1}] [⏱️{2}]",
    rich_presence_lookup("Baby1", getBabyOfTargetPractice(), babyLookup, fallback = "Ogre Boy"),
    rich_presence_macro("Number", getScoreOfTargetPractice()),
    rich_presence_macro("Seconds", byte(MinigamePointer + 0x3C))
)

rich_presence_conditional_display((gameState() == 0x22 || gameState() == 0x27) && dword(0x012263C) != 0, 
    "The Babysitter and {0} are eating Candies [🍭{1}] [⏱️{2}]",
    rich_presence_lookup("Baby1", getBabyOfCandyGobble(), babyLookup, fallback = "Ogre Boy"),
    rich_presence_macro("Number", getScoreOfCandyGobble()),
    rich_presence_macro("Seconds", byte(MinigamePointer + 0x200))
)

rich_presence_conditional_display(gameState() == 0x28 || gameState() == 0x29, 
    "The Babysitter is looking at the Rankings of '{0}'",
    rich_presence_lookup("Minigame", prior(gameState()), minigameLookup, fallback = "Snail Bowling")
)

rich_presence_conditional_display(gameState() == 0x2A, 
    "Shrek and Fiona thank the Babysitter for all the babysitting"
)

rich_presence_conditional_display(gameState() == 0x2B, 
    "In the Credits"
)

rich_presence_conditional_display(gameState() == 0x2C, 
    "In the Credits"
)

rich_presence_conditional_display(gameState() == 0x2D, 
    "Shrek and Fiona thank the Babysitter for today's job"
)

rich_presence_conditional_display(gameState() >= 0x1E && gameState() <= 0x29, 
    "The Babysitter is preparing a game of '{0}'",
    rich_presence_lookup("Minigame", LoadingState, minigameLookup, fallback = "Snail Bowling")
)

rich_presence_display("In the Titlescreen")

