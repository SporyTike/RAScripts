// Meitantei Conan: Kieta Hakase to Machigai Sagashi no Tou
// #ID = 27660

//--------------------------------------------------
// Addresses based on Savefile 1
mem_GameState         = 0x000c283e
mem_GameMode          = 0x00187c48
mem_UsedSavefile      = 0x00187c6c
mem_StoryStageData    = 0x0018808c
mem_StoryStageID      = 0x00188120
mem_StoryAreaID       = 0x00188119
mem_StoryFloorID      = 0x00188118
mem_GalleryPuzzleData = 0x00188130
mem_LinkedListStart   = 0x001dcf0c

pointerMask = 0x00ffffff

//--------------------------------------------------
// Functions

function getGameMode() {
    return dword(mem_GameMode)
}

function getLinkedListNode(node) {
    pointerChain = dword((dword(mem_LinkedListStart) & pointerMask) + 0x0C) & pointerMask
    
    for node in range(0, node - 3) {
        pointerChain = dword(pointerChain + 0x0C) & pointerMask
    }
    
    return pointerChain
}

function getNodeSize(node) {
    return dword(getLinkedListNode(node) + 0x04)
}

function getGameState() {
    return dword(getLinkedListNode(44) + 0x68)
}

function getStoryPuzzleState() {
    return dword(getLinkedListNode(6) + 0x64)
}

function getStoryPuzzleScene() {
    return dword(getLinkedListNode(6) + 0x8C)
}

function getStoryPuzzleTime() {
    return dword(getLinkedListNode(6) + 0xCE30)
}

function getStoryBossPuzzleState() {
    return dword(getLinkedListNode(6) + 0x2C)
}

function getStoryBossPuzzleScene() {
    return word(getLinkedListNode(6) + 0x14)
}

function getStoryBossPuzzleTime() {
    return dword(getLinkedListNode(6) + 0xCDB8)
}

function getGalleryPuzzleState() {
    return dword(getLinkedListNode(6) + 0x10)
}

function getGalleryPuzzleScene() {
    return dword(getLinkedListNode(6) + 0x28)
}

function getGalleryPuzzleTime() {
    return dword(getLinkedListNode(6) + 0xCD24)
}

function getSavefilePointer() {
    return dword(mem_UsedSavefile) * 0x170
}

function getCurrentStage() {
    return byte(getSavefilePointer() + getCurrentFloor() + mem_StoryStageID)
}

function getCurrentArea() {
    return byte(getSavefilePointer() + getCurrentFloor() + mem_StoryAreaID)
}

function getCurrentFloor() {
    return byte(getSavefilePointer() + mem_StoryFloorID)
}

function convertFloor(floor) {
    if (floor == -1) {
        floor = 7
    }
    return floor - 1
}

function convertArea(area) {
    return area - 1
}

function convertStage(stage) {
    return stage - 1
}

function checkStageClear(floor, area, stage) {
    floor = convertFloor(floor)
    area  = convertArea(area)
    address = byte(getSavefilePointer() + mem_StoryStageData + floor * 20 + area * 5 + stage - 1)
    
    return address > prev(address)
}

function checkAreaRanks(floor, area, totalStages) {
    floor = convertFloor(floor)
    area  = convertArea(area) 
    code = 0
    
    for stage in range(0, totalStages - 1) {
        address = byte(getSavefilePointer() + mem_StoryStageData + floor * 20 + area * 5 + stage)
        code = code + address / 3
    }
    
    return measured(code == totalStages) &&
           prev(code) == totalStages - 1
}

function checkCredits() {
    floor = convertFloor(6)
    area  = convertArea(4) 
    stage = convertStage(5)
    code = byte(getSavefilePointer() + mem_StoryStageData + floor * 20 + area * 5 + stage)
        
    return prev(byte(mem_GameState)) == 0x02 &&
                byte(mem_GameState)  == 0x05 &&
           getCurrentFloor() == 0x05 &&
           getCurrentArea()  == 0x03 &&
           getCurrentStage() == 0x04 &&
           code >= 0x01
}

function checkGalleryCompletion(finishedScenes) {
    code = 0
    for i in range(0, 300 - 1) {
        code = code + bit(i % 8, getSavefilePointer() + mem_GalleryPuzzleData + (i / 8))
    }
    
    return measured(code  == finishedScenes) &&
               prev(code) == finishedScenes - 1
}

//--------------------------------------------------
// Achievements

achievement(
    title = "The Mysterious Difference's Tower", type = "progression",
    description = "Complete the 1st Floor of the tower.",
    id = 581236, badge = "659524", points = 10,
    trigger = getGameMode() == 0x00 &&
              checkStageClear(1, 4, 5)
)

achievement(
    title = "The Phantom of the Tower", type = "",
    description = "Get 3 stars in all stages of Area 1 on the 1st Floor of the tower.",
    id = 581237, badge = "659525", points = 5,
    trigger = getGameMode() == 0x00 &&
              checkAreaRanks(1, 1, 5)
)

achievement(
    title = "The Missing Spots", type = "",
    description = "Get 3 stars in all stages of Area 2 on the 1st Floor of the tower.",
    id = 581238, badge = "659526", points = 5,
    trigger = getGameMode() == 0x00 &&
              checkAreaRanks(1, 2, 5)
)

achievement(
    title = "A Friend of Pictures", type = "",
    description = "Get 3 stars in all stages of Area 3 on the 1st Floor of the tower.",
    id = 581239, badge = "661011", points = 5,
    trigger = getGameMode() == 0x00 &&
              checkAreaRanks(1, 3, 5)
)

achievement(
    title = "Clash of Light and Black", type = "",
    description = "Get 3 stars in all stages of Area 4 on the 1st Floor of the tower.",
    id = 581240, badge = "659528", points = 5,
    trigger = getGameMode() == 0x00 &&
              checkAreaRanks(1, 4, 5)
)

achievement(
    title = "What the Tower Clock Knew", type = "progression",
    description = "Complete the 2nd Floor of the tower.",
    id = 582680, badge = "661032", points = 10,
    trigger = getGameMode() == 0x00 &&
              checkStageClear(2, 4, 5)
)

achievement(
    title = "The Mystery I Found", type = "",
    description = "Get 3 stars in all stages of Area 1 on the 2nd Floor of the tower.",
    id = 581277, badge = "659549", points = 5,
    trigger = getGameMode() == 0x00 &&
              checkAreaRanks(2, 1, 5)
)

achievement(
    title = "The Secret Rushed Scenaries", type = "",
    description = "Get 3 stars in all stages of Area 2 on the 2nd Floor of the tower.",
    id = 581279, badge = "659551", points = 5,
    trigger = getGameMode() == 0x00 &&
              checkAreaRanks(2, 2, 5)
)

achievement(
    title = "The Man Who Scratched Twice", type = "",
    description = "Get 3 stars in all stages of Area 3 on the 2nd Floor of the tower.",
    id = 582678, badge = "661009", points = 5,
    trigger = getGameMode() == 0x00 &&
              checkAreaRanks(2, 3, 5)
)

achievement(
    title = "A Friend of Pencils", type = "",
    description = "Get 3 stars in all stages of Area 4 on the 2nd Floor of the tower.",
    id = 582681, badge = "661031", points = 5,
    trigger = getGameMode() == 0x00 &&
              checkAreaRanks(2, 4, 5)
)

achievement(
    title = "The Scenary Dissolution Party", type = "progression",
    description = "Complete the 3rd Floor of the tower.",
    id = 583704, badge = "662179", points = 10,
    trigger = getGameMode() == 0x00 &&
              checkStageClear(3, 4, 5)
)

achievement(
    title = "Pictures, Differences, and the Detective Boys", type = "",
    description = "Get 3 stars in all stages of Area 1 on the 3rd Floor of the tower.",
    id = 582702, badge = "661063", points = 5,
    trigger = getGameMode() == 0x00 &&
              checkAreaRanks(3, 1, 5)
)

achievement(
    title = "The Differences Which Came Back", type = "",
    description = "Get 3 stars in all stages of Area 2 on the 3rd Floor of the tower.",
    id = 582704, badge = "661065", points = 5,
    trigger = getGameMode() == 0x00 &&
              checkAreaRanks(3, 2, 5)
)

achievement(
    title = "The Two Images", type = "",
    description = "Get 3 stars in all stages of Area 3 on the 3rd Floor of the tower.",
    id = 583703, badge = "662178", points = 5,
    trigger = getGameMode() == 0x00 &&
              checkAreaRanks(3, 3, 5)
)

achievement(
    title = "The Small Eye-Wizard", type = "",
    description = "Get 3 stars in all stages of Area 4 on the 3rd Floor of the tower.",
    id = 583705, badge = "662180", points = 5,
    trigger = getGameMode() == 0x00 &&
              checkAreaRanks(3, 4, 5)
)

achievement(
    title = "The Blind Spot in the Picture", type = "progression",
    description = "Complete the 4th Floor of the tower.",
    id = 581278, badge = "662354", points = 10,
    trigger = getGameMode() == 0x00 &&
              checkStageClear(4, 4, 5)
)

achievement(
    title = "The Scarlet Photo Trip", type = "",
    description = "Get 3 stars in all stages of Area 1 on the 4th Floor of the tower.",
    id = 581164, badge = "662351", points = 5,
    trigger = getGameMode() == 0x00 &&
              checkAreaRanks(4, 1, 5)
)

achievement(
    title = "A Code of Stars and Differences", type = "",
    description = "Get 3 stars in all stages of Area 2 on the 4th Floor of the tower.",
    id = 581165, badge = "662352", points = 5,
    trigger = getGameMode() == 0x00 &&
              checkAreaRanks(4, 2, 5)
)

achievement(
    title = "The Unseen Changes", type = "",
    description = "Get 3 stars in all stages of Area 3 on the 4th Floor of the tower.",
    id = 581166, badge = "662353", points = 5,
    trigger = getGameMode() == 0x00 &&
              checkAreaRanks(4, 3, 5)
)

achievement(
    title = "Spot Digging With a Sigh", type = "",
    description = "Get 3 stars in all stages of Area 4 on the 4th Floor of the tower.",
    id = 581276, badge = "662355", points = 5,
    trigger = getGameMode() == 0x00 &&
              checkAreaRanks(4, 4, 5)
)

achievement(
    title = "The Silent Mirror Line", type = "progression",
    description = "Complete the 5th Floor of the tower.",
    id = 582677, badge = "662858", points = 10,
    trigger = getGameMode() == 0x00 &&
              checkStageClear(5, 4, 5)
)

achievement(
    title = "Result of the Circles", type = "",
    description = "Get 3 stars in all stages of Area 1 on the 5th Floor of the tower.",
    id = 582701, badge = "662851", points = 5,
    trigger = getGameMode() == 0x00 &&
              checkAreaRanks(5, 1, 5)
)

achievement(
    title = "Hidden Circumstances of the Picture Incident", type = "",
    description = "Get 3 stars in all stages of Area 2 on the 5th Floor of the tower.",
    id = 582703, badge = "662852", points = 5,
    trigger = getGameMode() == 0x00 &&
              checkAreaRanks(5, 2, 5)
)

achievement(
    title = "Picking Wild Scenes and Differences", type = "",
    description = "Get 3 stars in all stages of Area 3 on the 5th Floor of the tower.",
    id = 583702, badge = "662857", points = 5,
    trigger = getGameMode() == 0x00 &&
              checkAreaRanks(5, 3, 5)
)

achievement(
    title = "Solving Mysteries in a Blocked Scene", type = "",
    description = "Get 3 stars in all stages of Area 4 on the 5th Floor of the tower.",
    id = 584419, badge = "662859", points = 5,
    trigger = getGameMode() == 0x00 &&
              checkAreaRanks(5, 4, 5)
)

achievement(
    title = "Conan Figures It Out", type = "win_condition",
    description = "Complete the 6th Floor of the tower and rescue Professor Agasa.",
    id = 584429, badge = "662872", points = 10,
    trigger = getGameMode() == 0x00 &&
              checkCredits()
)

achievement(
    title = "Won't Miss Even One Millimeter", type = "",
    description = "Get 3 stars in all stages of Area 1 on the 6th Floor of the tower.",
    id = 584420, badge = "662861", points = 5,
    trigger = getGameMode() == 0x00 &&
              checkAreaRanks(6, 1, 4)
)

achievement(
    title = "Beyond the Illusions", type = "",
    description = "Get 3 stars in all stages of Area 2 on the 6th Floor of the tower.",
    id = 584421, badge = "662862", points = 5,
    trigger = getGameMode() == 0x00 &&
              checkAreaRanks(6, 2, 4)
)

achievement(
    title = "Detectives Don't Fail", type = "",
    description = "Get 3 stars in all stages of Area 3 on the 6th Floor of the tower.",
    id = 584422, badge = "662863", points = 5,
    trigger = getGameMode() == 0x00 &&
              checkAreaRanks(6, 3, 4)
)

achievement(
    title = "The Devil's Puzzles", type = "",
    description = "Get 3 stars in all stages of Area 4 on the 6th Floor of the tower.",
    id = 584428, badge = "662871", points = 5,
    trigger = getGameMode() == 0x00 &&
              checkAreaRanks(6, 4, 5)
)

achievement(
    title = "A Happy Game Brings Sadness", type = "",
    description = "Complete the basement of the tower.",
    id = 584768, badge = "663439", points = 10,
    trigger = getGameMode() == 0x00 &&
              checkStageClear(7, 4, 4)
)

achievement(
    title = "The Tense Puzzle Party", type = "",
    description = "Get 3 stars in all stages of Area 1 in the basement of the tower.",
    id = 584769, badge = "663440", points = 5,
    trigger = getGameMode() == 0x00 &&
              checkAreaRanks(7, 1, 4)
)

achievement(
    title = "Two Coincidental Scenaries", type = "",
    description = "Get 3 stars in all stages of Area 2 in the basement of the tower.",
    id = 584770, badge = "663441", points = 5,
    trigger = getGameMode() == 0x00 &&
              checkAreaRanks(7, 2, 4)
)

achievement(
    title = "Puzzles So Good, It's to Die For", type = "",
    description = "Get 3 stars in all stages of Area 3 in the basement of the tower.",
    id = 584771, badge = "663442", points = 5,
    trigger = getGameMode() == 0x00 &&
              checkAreaRanks(7, 3, 4)
)

achievement(
    title = "Did You Do It?", type = "",
    description = "Get 3 stars in all stages of Area 4 in the basement of the tower.",
    id = 584772, badge = "663443", points = 5,
    trigger = getGameMode() == 0x00 &&
              checkAreaRanks(7, 4, 4)
)

achievement(
    title = "Mystery of the Lost Differences", type = "",
    description = "Complete 75 scenes in the gallery.",
    id = 584780, badge = "663452", points = 10,
    trigger = getGameMode() == 0x01 &&
              checkGalleryCompletion(75)
)

achievement(
    title = "The Spark That Fell on the Scene", type = "",
    description = "Complete 150 scenes in the gallery.",
    id = 584781, badge = "663453", points = 10,
    trigger = getGameMode() == 0x01 &&
              checkGalleryCompletion(150)
)

achievement(
    title = "The Reason He Became a Puzzler", type = "",
    description = "Complete 225 scenes in the gallery.",
    id = 584782, badge = "663454", points = 10,
    trigger = getGameMode() == 0x01 &&
              checkGalleryCompletion(225)
)

achievement(
    title = "Last Difference For You", type = "",
    description = "Complete 300 scenes in the gallery.",
    id = 584783, badge = "663455", points = 10,
    trigger = getGameMode() == 0x01 &&
              checkGalleryCompletion(300)
)
   
//--------------------------------------------------
// Rich Presence

fillerZero = {
    0: "0"
}

floorNames = {
    0x00: "Floor 1",
    0x01: "Floor 2",
    0x02: "Floor 3",
    0x03: "Floor 4",
    0x04: "Floor 5",
    0x05: "Floor 6",
    0x06: "Basement 1",
}

gameStates = {
    0x00: "In the Titlescreen",
    0x01: "In the Titlescreen",
    0x02: "In the Titlescreen",
    0x03: "In the Titlescreen",
    0x04: "In the File Select",
    0x05: "In the Main Menu",
    0x08: "In the File Select",
    0x0C: "In the Gallery",
    0x0D: "In the Gallery",
    0x0F: "In the Communication Mode",
    0x10: "In the Communication Mode",
    0x14: "In the Communication Mode",
    0x16: "In the Communication Mode",
    0x17: "In the Communication Mode",
    0x18: "In the Communication Mode",
    0x19: "In the Communication Mode",
}

rich_presence_conditional_display(getGameMode() == 0x00 && getNodeSize(6) == 0xCE6C && getStoryPuzzleState() <= 0x0B && getStoryPuzzleScene() > 0, 
    "Conan is solving Puzzle {0}{1}{2} in Stage {5}-{3} on {4} of the Tower [Story]",
        rich_presence_lookup("fillerZero",
                        getStoryPuzzleScene() / 100,
                        fillerZero),    
        rich_presence_lookup("fillerZero",
                        getStoryPuzzleScene() / 10,
                        fillerZero), 
        rich_presence_macro("Number",
                        getStoryPuzzleScene()),
        rich_presence_macro("Number",
                        getCurrentStage() + 1),
        rich_presence_lookup("Floor",
                        getCurrentFloor(),
                        floorNames,
                        fallback = floorNames[0]),
        rich_presence_macro("Number",
                        getCurrentArea() + 1)
)

rich_presence_conditional_display(getGameMode() == 0x00 && getNodeSize(6) == 0xCDBC && getStoryBossPuzzleState() <= 0x0B && getStoryBossPuzzleScene() > 0, 
    "Conan is solving Puzzle {0}{1}{2} in Stage {5}-{3} on {4} of the Tower [Story]",
        rich_presence_lookup("fillerZero",
                        getStoryBossPuzzleScene() / 100,
                        fillerZero),    
        rich_presence_lookup("fillerZero",
                        getStoryBossPuzzleScene() / 10,
                        fillerZero), 
        rich_presence_macro("Number",
                        getStoryBossPuzzleScene()),
        rich_presence_macro("Number",
                        getCurrentStage() + 1),
        rich_presence_lookup("Floor",
                        getCurrentFloor(),
                        floorNames,
                        fallback = floorNames[0]),
        rich_presence_macro("Number",
                        getCurrentArea() + 1)
)

rich_presence_conditional_display(getGameMode() == 0x00, 
    "Conan is investigating Area {1} of {0} in the Tower [Story]",
        rich_presence_lookup("Floor",
                        getCurrentFloor(),
                        floorNames,
                        fallback = floorNames[0]),
        rich_presence_macro("Number",
                        getCurrentArea() + 1)
)

rich_presence_conditional_display(getGameMode() == 0x01 && getNodeSize(6) == 0xCD18 && getGalleryPuzzleState() <= 0x07 && getGalleryPuzzleScene() > 0, 
    "Conan is solving Puzzle {0}{1}{2} [Gallery]",
        rich_presence_lookup("fillerZero",
                        getGalleryPuzzleScene() / 100,
                        fillerZero),    
        rich_presence_lookup("fillerZero",
                        getGalleryPuzzleScene() / 10,
                        fillerZero), 
        rich_presence_macro("Number",
                        getGalleryPuzzleScene())
)

rich_presence_conditional_display(getGameMode() == 0x01, 
    "Conan is in the Puzzle Gallery [Gallery]"
)

rich_presence_display("{0}",
    rich_presence_lookup("gameStates",
                        getGameState(),
                        gameStates,
                        fallback = gameStates[0x05])
)