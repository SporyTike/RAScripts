// ~Hack~ Hero of Law
// #ID = 34006
// Hack Version: 1.03

// ------------------------------------------------------------
// Addresses

Mem_Scenario        = 0x11A5E8
Mem_GameState       = 0x11B92C
Mem_Map             = 0x1C8546
Mem_Health          = Mem_Scenario + 0x14
Mem_SubState        = Mem_GameState + 0x04
Mem_ExtraUnlocks    = 0x11B511
Mem_IngoRupees      = 0x11B51C

Mem_SecretDialogue  = 0x1E9EBC
Mem_CurrentDialogue = tbyte(tbyte(0x1E9EC8) + 0x1B0) + 0x36C
Mem_DialogueHistory = tbyte(0x1E9DA8) + 0x10
Mem_SuperTalonTime  = tbyte(0x1E9DA8) + 0x48
Mem_DragmireSecret  = tbyte(0x1E9EB4) + 0x27C
Mem_UnlockCheat     = tbyte(0x1EE524) + 0xB0
Mem_IngoPlayerHand  = 0x1FEFEF

// ------------------------------------------------------------
// Pre-Defined Values

Val_DragmireSecret  = 0xDE
Val_UnlockCheat     = 0x56

// ------------------------------------------------------------
// Logic Functions

function inGame() {
    return dword(Mem_GameState) == 0
}

function currentMap(map) {
    return word(Mem_Map) == map
}

function currentChapter(scenario) {
    return dword(Mem_Scenario) == scenario
}

function chapterCompleted(scenario) {
    return dword(Mem_Scenario) == scenario + 1 &&
           prev(dword(Mem_Scenario)) == scenario
}

function dialogueRead(id) {
    return dword(Mem_CurrentDialogue) != id &&
           prev(dword(Mem_CurrentDialogue)) == id
}

function beatSuperTalon() {
    return currentMap(0x78) &&
           dword(Mem_SuperTalonTime + 0x04) == 3 &&
           prev(dword(Mem_SuperTalonTime + 0x04)) == 2
}

function reachIngoRupees(rupee) {
    return currentMap(0x29) &&
           measured(word(Mem_IngoRupees) >= rupee,
                when=always_true(),
                format="percent") &&
           prev(word(Mem_IngoRupees)) < rupee
}

function winIngoHand(id) {
    return byte(Mem_IngoPlayerHand + 0x1E) > prev(byte(Mem_IngoPlayerHand + 0x1E)) &&
           byte(Mem_IngoPlayerHand + 0x1E) == 1 &&
           byte(Mem_IngoPlayerHand + 0x19) == id
}

// ------------------------------------------------------------
// Achievement Logic

achievement(
    id          = 0, 
    badge       = "0",
    title       = "--- Dialogue Pointer ---",
    description = "",
    points      = 0,
    trigger     = dword(Mem_CurrentDialogue) == 0,
    type        = ""
)

achievement(
    id          = 532705, 
    badge       = "604514",
    title       = "Turnabout Family",
    description = "[Main] Finish Detective Impa's cross-examination.",
    points      = 5,
    trigger     = inGame() &&
                  chapterCompleted(0x06),
    type        = "progression"
)

achievement(
    id          = 532706, 
    badge       = "604515",
    title       = "Vision-Blurring Crystal",
    description = "[Main] Finish Princess Zelda's first cross-examination.",
    points      = 3,
    trigger     = inGame() &&
                  chapterCompleted(0x0A),
    type        = "progression"
)

achievement(
    id          = 532844, 
    badge       = "604598",
    title       = "What You Really Saw...",
    description = "[Main] Finish Princess Zelda's second cross-examination.",
    points      = 3,
    trigger     = inGame() &&
                  chapterCompleted(0x0D),
    type        = "progression"
)

achievement(
    id          = 532845, 
    badge       = "604599",
    title       = "Unimportant Matter",
    description = "[Main] Finish Princess Zelda's third cross-examination.",
    points      = 1,
    trigger     = inGame() &&
                  chapterCompleted(0x11),
    type        = "progression"
)

achievement(
    id          = 532858, 
    badge       = "604614",
    title       = "Something Smells Wrong",
    description = "[Main] Finish Ingo's first cross-examination.",
    points      = 3,
    trigger     = inGame() &&
                  chapterCompleted(0x16),
    type        = "progression"
)

achievement(
    id          = 532961, 
    badge       = "604699",
    title       = "Reasons of Doubt",
    description = "[Main] Finish Ingo's second cross-examination.",
    points      = 3,
    trigger     = inGame() &&
                  chapterCompleted(0x19),
    type        = "progression"
)

achievement(
    id          = 532962, 
    badge       = "604701",
    title       = "Goddess' Bless",
    description = "[Main] Discover the truth behind the murder and explain it to the court.",
    points      = 2,
    trigger     = inGame() &&
                  chapterCompleted(0x1A),
    type        = "progression"
)

achievement(
    id          = 532966, 
    badge       = "604705",
    title       = "Bitter Taste of Death",
    description = "[Main] Finish Ingo's third cross-examination.",
    points      = 3,
    trigger     = inGame() &&
                  chapterCompleted(0x1F),
    type        = "progression"
)

achievement(
    id          = 532967, 
    badge       = "604706",
    title       = "No Doubt About",
    description = "[Main] Rebuttal all of Dragmire's statements.",
    points      = 3,
    trigger     = inGame() &&
                  chapterCompleted(0x20),
    type        = "progression"
)

achievement(
    id          = 532969, 
    badge       = "604708",
    title       = "Sense of Justice",
    description = "[Main] Show Princess Zelda proof that you couldn't win the case without her.",
    points      = 2,
    trigger     = inGame() &&
                  currentChapter(0x24) &&
                  dialogueRead(0x25),
    type        = ""
)

achievement(
    id          = 532970, 
    badge       = "604709",
    title       = "Farmer For Life",
    description = "[Main] Win the case and look forward to the next one.",
    points      = 5,
    trigger     = inGame() &&
                  chapterCompleted(0x24),
    type        = "progression"
)

achievement(
    id          = 532971, 
    badge       = "604710",
    title       = "This Feels Familiar",
    description = "[Extra 1] Beat the Super Talon Game.",
    points      = 3,
    trigger     = beatSuperTalon(),
    type        = ""
)

achievement(
    id          = 532972, 
    badge       = "604711",
    title       = "On a Chicken Run",
    description = "[Extra 1] Beat the Super Talon Game with 115 seconds left.",
    points      = 5,
    trigger     = beatSuperTalon() &&
                  dword(Mem_SuperTalonTime) / 100 >= 115,
    type        = ""
)

achievement(
    id          = 532974, 
    badge       = "604727",
    title       = "Hero of Climate and Time",
    description = "[Extra 1] Unlock 'Ingo's Casino' without cheating.",
    points      = 1,
    trigger     = dword(Mem_GameState) == 1 &&
                  bit1(Mem_ExtraUnlocks) > prev(bit1(Mem_ExtraUnlocks)) &&
                  bit7(Mem_ExtraUnlocks) == prev(bit7(Mem_ExtraUnlocks)),
    type        = "missable"
)

achievement(
    id          = 532973, 
    badge       = "604726",
    title       = "Hero of Dreams",
    description = "[Extra 1] Unlock 'Turnabout Thief' without cheating.",
    points      = 1,
    trigger     = dword(Mem_GameState) == 1 &&
                  bit2(Mem_ExtraUnlocks) > prev(bit2(Mem_ExtraUnlocks)) &&
                  bit7(Mem_ExtraUnlocks) == prev(bit7(Mem_ExtraUnlocks)),
    type        = "missable"
)

achievement(
    id          = 533015, 
    badge       = "604769",
    title       = "Dirty Secrets",
    description = "[Extra 2] Learn about Dragmire's secret from Ingo.",
    points      = 4,
    trigger     = inGame() &&
                  byte(Mem_SubState) == 4 &&
                  reachIngoRupees(50),
    type        = ""
)

achievement(
    id          = 533016, 
    badge       = "604770",
    title       = "Stuck Here Forever",
    description = "[Extra 2] Collect enough rupees to pay bail.",
    points      = 25,
    trigger     = inGame() &&
                  byte(Mem_SubState) == 4 &&
                  reachIngoRupees(9999),
    type        = ""
)

achievement(
    id          = 533017, 
    badge       = "604771",
    title       = "Mega Bluff",
    description = "[Extra 2] Win with Nothing.",
    points      = 3,
    trigger     = inGame() &&
                  byte(Mem_SubState) == 4 &&
                  winIngoHand(0),
    type        = ""
)

achievement(
    id          = 533018, 
    badge       = "604772",
    title       = "It's Enough For You",
    description = "[Extra 2] Win with One Pair.",
    points      = 3,
    trigger     = inGame() &&
                  byte(Mem_SubState) == 4 &&
                  winIngoHand(1),
    type        = ""
)

achievement(
    id          = 533019, 
    badge       = "604773",
    title       = "Double Trouble",
    description = "[Extra 2] Win with Two Pairs.",
    points      = 3,
    trigger     = inGame() &&
                  byte(Mem_SubState) == 4 &&
                  winIngoHand(2),
    type        = ""
)

achievement(
    id          = 533020, 
    badge       = "604774",
    title       = "Three Force",
    description = "[Extra 2] Win with Three of a Kind.",
    points      = 3,
    trigger     = inGame() &&
                  byte(Mem_SubState) == 4 &&
                  winIngoHand(3),
    type        = ""
)

achievement(
    id          = 533021, 
    badge       = "604775",
    title       = "Filled With Joy",
    description = "[Extra 2] Win with a Full House.",
    points      = 3,
    trigger     = inGame() &&
                  byte(Mem_SubState) == 4 &&
                  winIngoHand(4),
    type        = ""
)

achievement(
    id          = 533022, 
    badge       = "604776",
    title       = "Rupees Four Me",
    description = "[Extra 2] Win with Four of a Kind.",
    points      = 3,
    trigger     = inGame() &&
                  byte(Mem_SubState) == 4 &&
                  winIngoHand(5),
    type        = ""
)

achievement(
    id          = 533023, 
    badge       = "604777",
    title       = "Royal Flush",
    description = "[Extra 2] Win with Five of a Kind.",
    points      = 3,
    trigger     = inGame() &&
                  byte(Mem_SubState) == 4 &&
                  winIngoHand(6),
    type        = ""
)

achievement(
    id          = 532964, 
    badge       = "604704",
    title       = "Almighty Being",
    description = "[Extra 2] Discover Dragmire's secret.",
    points      = 2,
    trigger     = inGame() &&
                  byte(Mem_DragmireSecret) == Val_DragmireSecret &&
                  prev(byte(Mem_DragmireSecret) < Val_DragmireSecret),
    type        = ""
)

achievement(
    id          = 532965, 
    badge       = "604703",
    title       = "Galactic Overrule",
    description = "[Extra 2] Get your evidence judged unworthy by the moon.",
    points      = 2,
    trigger     = inGame() &&
                  currentChapter(0x20)&&
                  dword(Mem_SecretDialogue) == 0 &&
                  prev(dword(Mem_SecretDialogue)) != 0,
    type        = ""
)

achievement(
    id          = 533010, 
    badge       = "604767",
    title       = "Keep 'Er Hands Of Ma Wares",
    description = "[Extra 3] Finish the Shopkeeper's cross-examination.",
    points      = 1,
    trigger     = inGame() &&
                  chapterCompleted(0x2C),
    type        = ""
)

achievement(
    id          = 533011, 
    badge       = "604768",
    title       = "Dream In A Dream",
    description = "[Extra 3] Finish the Owl's cross-examination.",
    points      = 1,
    trigger     = inGame() &&
                  chapterCompleted(0x2F),                  
    type        = ""
)

achievement(
    id          = 532976, 
    badge       = "604729",
    title       = "Spell My Name",
    description = "[Extra 3] Successfully remove the curse from your defendant on Koholint Island.",
    points      = 1,
    trigger     = inGame() &&
                  currentChapter(0x32) &&
                  dialogueRead(0x23),
    type        = ""
)

// Defendant is named Link
achievement(
    id          = 532978, 
    badge       = "604738",
    title       = "Linked Together",
    description = "[Extra 3] Let Link realize the defendants name...",
    points      = 1,
    trigger     = inGame() &&
                  currentChapter(0x32) &&
                  dialogueRead(0x34),
    type        = "missable"
)

// Defendant is named Zelda
achievement(
    id          = 532980, 
    badge       = "604735",
    title       = "Great Taste of Music",
    description = "[Extra 3] Let Link realize the defendants name...",
    points      = 1,
    trigger     = inGame() &&
                  currentChapter(0x32) &&
                  dialogueRead(0x37),
    type        = "missable"
)

// Defendant is named Ganon
achievement(
    id          = 532979, 
    badge       = "604737",
    title       = "Unfunny Coincidence",
    description = "[Extra 3] Let Link realize the defendants name...",
    points      = 1,
    trigger     = inGame() &&
                  currentChapter(0x32) &&
                  dialogueRead(0x3C),
    type        = "missable"
)

// Defendant is named Talon or Ingo
achievement(
    id          = 532982, 
    badge       = "604740",
    title       = "Opening Fresh Wounds",
    description = "[Extra 3] Let Link realize the defendants name...",
    points      = 1,
    trigger     = inGame() &&
                  currentChapter(0x32) &&
                  dialogueRead(0x3E),
    type        = "missable"
)

// Defendant is named Impa
achievement(
    id          = 532981, 
    badge       = "604734",
    title       = "Legacy of Loyalty",
    description = "[Extra 3] Let Link realize the defendants name...",
    points      = 1,
    trigger     = inGame() &&
                  currentChapter(0x32) &&
                  dialogueRead(0x3E),
    type        = "missable"
)

// Defendant is named Marin
achievement(
    id          = 532983, 
    badge       = "604741",
    title       = "Singer From Heart",
    description = "[Extra 3] Let Link realize the defendants name...",
    points      = 1,
    trigger     = inGame() &&
                  currentChapter(0x32) &&
                  dialogueRead(0x43),
    type        = "missable"
)

// Defendant is named Thief
achievement(
    id          = 532977, 
    badge       = "604730",
    title       = "Why Doing This Then?!",
    description = "[Extra 3] Let Link realize the defendants name...",
    points      = 1,
    trigger     = inGame() &&
                  currentChapter(0x32) &&
                  dialogueRead(0x48),
    type        = "missable"
)

// Defendant is named Skawo
achievement(
    id          = 532984, 
    badge       = "604742",
    title       = "Guilty via Identity Theft",
    description = "[Extra 3] Let Link realize the defendants name...",
    points      = 1,
    trigger     = inGame() &&
                  currentChapter(0x32) &&
                  dialogueRead(0x4E),
    type        = "missable"
)

achievement(
    id          = 532975, 
    badge       = "604728",
    title       = "Slumber of Time",
    description = "[Extra 3] Win the case and wake up yourself.",
    points      = 1,
    trigger     = inGame() &&
                  currentMap(0x36) &&
                  prev(currentMap(0x31)),
    type        = ""
)

// ------------------------------------------------------------
// Rich Presence Logic

Scenario = {
    0x00: "Princess Zelda is discovering a Murder at Lon Lon Ranch",
    0x01: "Link is in the Defendant Lobby No. 3 before the Trial",
    0x02: "Link is in the Grand Court of Hyrule during the Opening",
    0x03: "Link is in the Grand Court of Hyrule listening to Detective Impa",
    0x04: "Link is in the Grand Court of Hyrule listening to Detective Impa",
    0x05: "Link is in the Grand Court of Hyrule listening to Detective Impa",
    0x06: "Link is in the Grand Court of Hyrule cross-examining Detective Impa",
    0x07: "Link is in the Grand Court of Hyrule listening to Detective Impa",
    0x08: "Link is in the Grand Court of Hyrule listening to Princess Zelda for the first time",
    0x09: "Link is in the Grand Court of Hyrule listening to Princess Zelda for the first time",
    0x0A: "Link is in the Grand Court of Hyrule cross-examining Princess Zelda for the first time",
    0x0B: "Link is in the Grand Court of Hyrule listening to Princess Zelda for the second time",
    0x0C: "Link is in the Grand Court of Hyrule listening to Princess Zelda for the second time",
    0x0D: "Link is in the Grand Court of Hyrule cross-examining Princess Zelda for the second time",
    0x0E: "Link is in the Grand Court of Hyrule listening to Princess Zelda for the third time",
    0x0F: "Link is in the Grand Court of Hyrule listening to Princess Zelda for the third time",
    0x10: "Link is in the Grand Court of Hyrule listening to Princess Zelda for the third time",
    0x11: "Link is in the Grand Court of Hyrule cross-examining Princess Zelda for the third time",
    0x12: "Link is in the Defendant Lobby No. 3 doing a Recess",
    0x13: "Link is in the Grand Court of Hyrule listening to Ingo for the first time",
    0x14: "Link is in the Grand Court of Hyrule listening to Ingo for the first time",
    0x15: "Link is in the Grand Court of Hyrule listening to Ingo for the first time",
    0x16: "Link is in the Grand Court of Hyrule cross-examining Ingo for the first time",
    0x17: "Link is in the Grand Court of Hyrule listening to Ingo for the second time",
    0x18: "Link is in the Grand Court of Hyrule listening to Ingo for the second time",
    0x19: "Link is in the Grand Court of Hyrule cross-examining Ingo for the second time",
    0x1A: "Link is in the Grand Court of Hyrule creating a Theory",
    0x1B: "Link is in the Grand Court of Hyrule creating a Theory",
    0x1C: "Link is in the Grand Court of Hyrule explaining his Theory",
    0x1D: "Link is in the Grand Court of Hyrule listening to Ingo for the third time",
    0x1E: "Link is in the Grand Court of Hyrule listening to Ingo for the third time",
    0x1F: "Link is in the Grand Court of Hyrule cross-examining Ingo for the third time",
    0x20: "Link is in the Grand Court of Hyrule arguing with Dragmire",
    0x21: "Link is in the Grand Court of Hyrule discovering the Truth",
    0x22: "Marlon is in the Grand Court of Hyrule explaining what really happened to Ingo",
    0x23: "Marlon is in the Grand Court of Hyrule getting found not guilty",
    0x24: "Link is in the Defendant Lobby No. 3 after the Trial",
    0x25: "In the Credits",
    0x27: "Link is in the Grand Court of Hyrule before the Trial",
    0x28: "Link is in the Grand Court of Hyrule before the Trial",
    0x29: "Link is in the Grand Court of Hyrule listening to the Shopkeeper",
    0x2A: "Link is in the Grand Court of Hyrule listening to the Shopkeeper",
    0x2B: "Link is in the Grand Court of Hyrule listening to the Shopkeeper",
    0x2C: "Link is in the Grand Court of Hyrule cross-examining the Shopkeeper",
    0x2D: "Link is in the Grand Court of Hyrule listening to the Owl",
    0x2F: "Link is in the Grand Court of Hyrule cross-examining the Owl",
    0x30: "Link is in the Grand Court of Hyrule creating a Theory",
    0x31: "Link is in the Grand Court of Hyrule creating a Theory",
    0x32: "Link is in the Grand Court of Hyrule winning the Case",
}

rich_presence_conditional_display(
    dword(Mem_GameState) == 0x01 && word(Mem_Map) != 0x62,
    "In the Titlescreen"
)
rich_presence_conditional_display(
    dword(Mem_Scenario) == 0x25 && dword(Mem_SubState) == 5,
    "In the Credits"
)
rich_presence_conditional_display(
    word(Mem_Map) == 0x29,
    "Link is playing Poker with Ingo [💰{0}] [Extra 2]",
    rich_presence_value(
        "Number", dword(Mem_IngoRupees), "VALUE"
    )
)
rich_presence_conditional_display(
    word(Mem_Map) == 0x62 || word(Mem_Map) == 0x78,
    "Super Talon is jumping around [⏱️{0}] [Extra 1]",
    rich_presence_value(
        "Number", dword(Mem_SuperTalonTime)/100, "VALUE"
    )
)
rich_presence_conditional_display(
    word(Mem_Map) >= 1 && word(Mem_Map) <= 100 && dword(Mem_Scenario) <= 0x24,
    "{0} [❤️{1}] [Main]",
    rich_presence_lookup(
        "Scenario",
        dword(Mem_Scenario),
        Scenario,
        fallback = "Link is in the Grand Court of Hyrule [Main]"
    ),
    rich_presence_value(
        "Number", word(Mem_Health), "VALUE"
    )
)
rich_presence_conditional_display(
    word(Mem_Map) >= 1 && word(Mem_Map) <= 100 && dword(Mem_Scenario) >= 0x27,
    "{0} [❤️{1}] [Extra 3]",
    rich_presence_lookup(
        "ScenarioExtra",
        dword(Mem_Scenario),
        Scenario,
        fallback = "Link is in the Grand Court of Hyrule [Extra 3]"
    ),
    rich_presence_value(
        "Number", word(Mem_Health), "VALUE"
    )
)
rich_presence_display(
    "In the Titlescreen"
)

// ------------------------------------------------------------
// Leaderboard Logic

leaderboard(
    id = 135588,
    title = "Super Talon Game", 
    description = "Most Time left on the Clock.", 
    start = beatSuperTalon(), 
    cancel = always_false(), 
    submit = always_true(), 
    value = dword(Mem_SuperTalonTime), 
    format="MILLISECS", 
    lower_is_better=false
)
