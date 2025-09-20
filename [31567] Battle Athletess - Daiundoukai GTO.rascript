// Battle Athletess: Daiundoukai GTO
// #ID = 31567

//--------------------------------------------------
// Addresses
stage          = word(tbyte(0x1CB01C) + 0x10)
player1Char    = word(tbyte(0x1CB01C) + 0x12)
player1Char2   = byte(tbyte(0x1CB014) + 0x9A)
player1RunnerH = word(tbyte(0x1CB014) + 0xEA)
player1Action  = word(tbyte(0x1CB014) + 0xA2)
player1Dance   = word(tbyte(0x1CB014) + 0xF0)
player2Char    = word(tbyte(0x1CB01C) + 0x14)
gameState      = word(tbyte(0x1CB01C) + 0x1C)
mode           = word(0x1CAFF4)
storyProgress  = word(0x1CAFF8)
cameraMode     = dword(0x18D414)
difficulty     = word(0x1CC098)
camera         = dword(0x18D414)

time           = dword(tbyte(0x1CB010) + 0x18) * 6000
               + dword(tbyte(0x1CB010) + 0x1C) * 100
               + dword(tbyte(0x1CB010) + 0x20) / 1000
               
stateFile      = 0x1CEB48

//--------------------------------------------------
// Functions

function winStoryMode(endingIndex) {
    return mode == 0xFFFF &&
           prev(mode) == 0 &&
           difficulty >= 1 &&
           difficulty <= 2 &&
           storyProgress >= 5 + endingIndex &&
           storyProgress <= 6 + endingIndex &&
           ascii_string_equals(stateFile, "ENDINGS" + endingIndex)
}

function winNormalMode() {
    return mode == 0xFFFF &&
           prev(mode) == 1 &&
           difficulty >= 1 &&
           difficulty <= 2 &&
           storyProgress >= 7 &&
           storyProgress <= 8 &&
           ascii_string_equals(stateFile, "ENDINGN")
}

function winNormalModeWithChar(charID) {
    return winNormalMode() &&
           player1Char == charID &&
           ascii_string_equals(stateFile, "ENDINGN" + charID)
}

function winRaceWithoutFailing(stageID) {
    return never(player1RunnerH < prev(player1RunnerH)) &&
           never(player1Action == 0x0B) &&
           mode <= 1 &&
           stage == stageID &&
           once(byte(0x1CAFF1) == 0 &&
                camera == 2 &&
                prev(camera) != 2) &&
           trigger_when(camera == 3 &&
                        byte(0x18D56A) == 0x00 &&
                        byte(0x1CAFF1) == 0x00)
}

function finishTimeAttack(stageID) {
    return mode == 2 &&
           stage == stageID &&
           bit7(tbyte(0x1CB014) + 0x97) > prev(bit7(tbyte(0x1CB014) + 0x97)) &&
           byte(0x1CAFF1) == 0x00 &&
           time > 0
           
}

//--------------------------------------------------
// Achievements

achievement(
    title = "Beauty Metamorphosis", points = 10, type="progression",
    description = "In Story Mode defeat Grant Oldman and finish the tournament on Normal.",
    id = 545266, badge = "620034",
    trigger = winStoryMode(0x00)
)

achievement(
    title = "Back To Earth", points = 1,
    description = "In Story Mode lose to Tomoe Kanazaki and try your best next time.",
    id = 545268, badge = "620033",
    trigger = mode == 0x00 &&
              storyProgress == 5 &&
              prior(storyProgress) == 6 &&
              byte(0x18D56A) == 0x01 &&
              gameState == 0x05 &&
              prev(gameState) == 0x04
)

achievement(
    title = "Like Mother Like Daughter", points = 5,
    description = "In Story Mode get challenged by Tomoe Kanazaki and defeat her after winning Grant Oldman's race with full trainer's high on Normal.",
    id = 545267, badge = "620071",
    trigger = winStoryMode(0x01)
)

achievement(
    title = "No More Cardboards", points = 10, type="win_condition",
    description = "Win the Normal Mode with Akari Kanazaki on Normal.",
    id = 545269, badge = "620044",
    trigger = winNormalModeWithChar(0x00)
)

achievement(
    title = "Ichi-Oh Dyno", points = 10, type="win_condition",
    description = "Win the Normal Mode with Ichino Yanagida on Normal.",
    id = 545270, badge = "620045",
    trigger = winNormalModeWithChar(0x01)
)

achievement(
    title = "Time For Roasted Mushrooms", points = 10, type="win_condition",
    description = "Win the Normal Mode with Tanya Natdhipytadd on Normal.",
    id = 545271, badge = "620046",
    trigger = winNormalModeWithChar(0x02)
)

achievement(
    title = "Overachieving For Good", points = 10, type="win_condition",
    description = "Win the Normal Mode with Jessie Gurtland on Normal.",
    id = 545272, badge = "620047",
    trigger = winNormalModeWithChar(0x03)
)

achievement(
    title = "Cheat of Fate", points = 10, type="win_condition",
    description = "Win the Normal Mode with Ling-Pha Wong on Normal.",
    id = 545273, badge = "620048",
    trigger = winNormalModeWithChar(0x04)
)

achievement(
    title = "Cool Like A Fridge", points = 10, type="win_condition",
    description = "Win the Normal Mode with Ayla Veferoscca Roznovsky on Normal.",
    id = 545274, badge = "620049",
    trigger = winNormalModeWithChar(0x05)
)

achievement(
    title = "Panty Entropy", points = 10, type="win_condition",
    description = "Win the Normal Mode with Grant Oldman on Normal.",
    id = 545275, badge = "620050",
    trigger = winNormalModeWithChar(0x06)
)

achievement(
    title = "Rising From the Dead", points = 10, type="win_condition",
    description = "Win the Normal Mode with Tomoe Kanazaki on Normal.",
    id = 545276, badge = "620051",
    trigger = winNormalModeWithChar(0x07)
)

achievement(
    title = "Interstellar Cosmo Beauty", points = 25,
    description = "Win the Normal Mode on Hard after unlocking Tomoe Kanazaki.",
    id = 545277, badge = "620043",
    trigger = winNormalMode() &&
              difficulty == 2 &&
              storyProgress == 8 &&
              bit7(0x1CAFF3) == 1
)

achievement(
    title = "Too Sweet For Me", points = 5,
    description = "Win a race on Akari's Stage without running into an obstacle or pit.",
    id = 545278, badge = "620055",
    trigger = winRaceWithoutFailing(0x07)
)

achievement(
    title = "Trip To Shibuya", points = 5,
    description = "Win a race on Ichino's Stage without running into an obstacle or pit.",
    id = 545279, badge = "620056",
    trigger = winRaceWithoutFailing(0x04)
)

achievement(
    title = "Shrine of Culture", points = 5,
    description = "Win a race on Tanya's Stage without running into an obstacle or pit.",
    id = 545280, badge = "620057",
    trigger = winRaceWithoutFailing(0x05)
)

achievement(
    title = "City of Hearts and Aces", points = 5,
    description = "Win a race on Jessie's Stage without running into an obstacle or pit.",
    id = 545281, badge = "620058",
    trigger = winRaceWithoutFailing(0x06)
)

achievement(
    title = "Ethical Run on the Wall", points = 5,
    description = "Win a race on Ling-Pha's Stage without running into an obstacle or pit.",
    id = 545282, badge = "620059",
    trigger = winRaceWithoutFailing(0x00)
)

achievement(
    title = "Splashy In the Freshy", points = 5,
    description = "Win a race on Ayla's Stage without running into an obstacle or pit.",
    id = 545283, badge = "620060",
    trigger = winRaceWithoutFailing(0x03)
)

achievement(
    title = "Unthinkable Movement", points = 5,
    description = "Win a race on Kouchou's Stage without running into an obstacle or pit.",
    id = 545284, badge = "620061",
    trigger = winRaceWithoutFailing(0x01)
)

achievement(
    title = "Honor of the Deceased", points = 5,
    description = "Win a race on Tomoe's Stage without running into an obstacle or pit.",
    id = 545285, badge = "620062",
    trigger = winRaceWithoutFailing(0x02)
)

achievement(
    title = "Sugar Rush Meltdown", points = 5,
    description = "Finish a Time Attack on Akari's Stage with a time of 01:10:00 or less.",
    id = 545286, badge = "620063",
    trigger = finishTimeAttack(0x07) &&
              time <= 7000
)

achievement(
    title = "Technological Breakthrough", points = 5,
    description = "Finish a Time Attack on Ichino's Stage with a time of 01:10:00 or less.",
    id = 545287, badge = "620064",
    trigger = finishTimeAttack(0x04) &&
              time <= 7000
)

achievement(
    title = "Prairie Runner", points = 5,
    description = "Finish a Time Attack on Tanya's Stage with a time of 01:10:00 or less.",
    id = 545288, badge = "620065",
    trigger = finishTimeAttack(0x05) &&
              time <= 7000
)

achievement(
    title = "Wild Wild West Wind", points = 5,
    description = "Finish a Time Attack on Jessie's Stage with a time of 01:10:00 or less.",
    id = 545289, badge = "620066",
    trigger = finishTimeAttack(0x06) &&
              time <= 7000
)

achievement(
    title = "Intermise of Walls", points = 5,
    description = "Finish a Time Attack on Ling-Pha's Stage with a time of 01:10:00 or less.",
    id = 545290, badge = "620067",
    trigger = finishTimeAttack(0x00) &&
              time <= 7000
)

achievement(
    title = "Sliding Into the Goal", points = 5,
    description = "Finish a Time Attack on Ayla's Stage with a time of 01:10:00 or less.",
    id = 545291, badge = "620068",
    trigger = finishTimeAttack(0x03) &&
              time <= 7000
)

achievement(
    title = "Cosmic Challenge", points = 5,
    description = "Finish a Time Attack on Kouchou's Stage with a time of 01:10:00 or less.",
    id = 545292, badge = "620069",
    trigger = finishTimeAttack(0x01) &&
              time <= 7000
)

achievement(
    title = "Kiss of the Angels", points = 5,
    description = "Finish a Time Attack on Tomoe's Stage with a time of 01:10:00 or less.",
    id = 545293, badge = "620070",
    trigger = finishTimeAttack(0x02) &&
              time <= 7000
)

achievement(
    title = "Dancing Feever", points = 1,
    description = "Let a character show all their moves in one dance session.",
    id = 545305, badge = "620072",
    trigger = mode == 4 &&
              never(camera != 0x08) && 
              once(player1Dance == 0x00) &&
              once(player1Dance == 0x03) &&
              once(player1Dance == 0x05) &&
              once(player1Dance == 0x06) &&
              once(player1Dance == 0x07) &&
              once(player1Dance == 0x08) &&
              once(player1Dance == 0x09) &&
              once(player1Dance == 0x0A) &&
              once(player1Dance == 0x0D) &&
              once(player1Dance == 0x0E) &&
              once(player1Dance == 0x0F) &&
              once(player1Dance == 0x12)
)

//--------------------------------------------------
// Leaderboards

leaderboard(
    id              = 139829,
    title           = "Akari Stage", 
    description     = "Fastest Time in Time Attack.", 
    start           = finishTimeAttack(0x07), 
    cancel          = always_false(), 
    submit          = always_true(), 
    value           = time, 
    format          = "MILLISECS", 
    lower_is_better = true
)

leaderboard(
    id              = 139830,
    title           = "Ichino Stage", 
    description     = "Fastest Time in Time Attack.", 
    start           = finishTimeAttack(0x04), 
    cancel          = always_false(), 
    submit          = always_true(), 
    value           = time, 
    format          = "MILLISECS", 
    lower_is_better = true
)

leaderboard(
    id              = 139831,
    title           = "Tanya Stage", 
    description     = "Fastest Time in Time Attack.", 
    start           = finishTimeAttack(0x05), 
    cancel          = always_false(), 
    submit          = always_true(), 
    value           = time, 
    format          = "MILLISECS", 
    lower_is_better = true
)

leaderboard(
    id              = 139832,
    title           = "Jessie Stage", 
    description     = "Fastest Time in Time Attack.", 
    start           = finishTimeAttack(0x06), 
    cancel          = always_false(), 
    submit          = always_true(), 
    value           = time, 
    format          = "MILLISECS", 
    lower_is_better = true
)

leaderboard(
    id              = 139833,
    title           = "Ling-Pha Stage", 
    description     = "Fastest Time in Time Attack.", 
    start           = finishTimeAttack(0x00), 
    cancel          = always_false(), 
    submit          = always_true(), 
    value           = time, 
    format          = "MILLISECS", 
    lower_is_better = true
)

leaderboard(
    id              = 139834,
    title           = "Ayla Stage", 
    description     = "Fastest Time in Time Attack.", 
    start           = finishTimeAttack(0x03), 
    cancel          = always_false(), 
    submit          = always_true(), 
    value           = time, 
    format          = "MILLISECS", 
    lower_is_better = true
)

leaderboard(
    id              = 139835,
    title           = "Kouchou Stage", 
    description     = "Fastest Time in Time Attack.", 
    start           = finishTimeAttack(0x01), 
    cancel          = always_false(), 
    submit          = always_true(), 
    value           = time, 
    format          = "MILLISECS", 
    lower_is_better = true
)

leaderboard(
    id              = 139836,
    title           = "Tomoe Stage", 
    description     = "Fastest Time in Time Attack.", 
    start           = finishTimeAttack(0x02), 
    cancel          = always_false(), 
    submit          = always_true(), 
    value           = time, 
    format          = "MILLISECS", 
    lower_is_better = true
)

//--------------------------------------------------
// Rich Presence
characters = {
    0x00: "Akari Kanazaki",
    0x01: "Ichino Yanagida",
    0x02: "Tanya Natdhipytadd",
    0x03: "Jessie Gurtland",
    0x04: "Ling-Pha Wong",
    0x05: "Ayla Roznovsky",
    0x06: "Grant Oldman",
    0x07: "Tomoe Kanazaki"
}

stages = {
    0x00: "Ling-Pha's Stage",
    0x01: "Kouchou's Stage",
    0x02: "Tomoe's Stage",
    0x03: "Ayla's Stage",
    0x04: "Ichino's Stage",
    0x05: "Tanya's Stage",
    0x06: "Jessie's Stage",
    0x07: "Akari's Stage"
}

modes = {
    0x00: "Story Mode",
    0x01: "Normal Mode",
    0x02: "Time Attack"
}

replay = {
    0x00: "racing",
    0x01: "watching a replay"
}

rich_presence_conditional_display(gameState <= 1, 
    "In the Titlescreen"
)

rich_presence_conditional_display(gameState == 2 && mode == 3, 
    "Watching {0}'s Instructions how to Race [Tutorial]",
     rich_presence_lookup("CharacterPlayer",
                          player1Char,
                          characters,
                          fallback = characters[0])
)

rich_presence_conditional_display(gameState == 2, 
    "Watching a race between {0} and {1} on {2} [Demo]",
     rich_presence_lookup("CharacterPlayer",
                          player1Char,
                          characters,
                          fallback = characters[0]),
     rich_presence_lookup("CharacterOpponent",
                          player2Char,
                          characters,
                          fallback = characters[1]),
     rich_presence_lookup("Stage",
                          stage,
                          stages,
                          fallback = stages[0])
)

rich_presence_conditional_display(gameState == 3, 
    "Checking the Best Times on each Race"
)

rich_presence_conditional_display(gameState == 4 && mode == 0, 
    "Getting invited to the Cosmo Beauty Tournament [Story Mode]"
)

rich_presence_conditional_display(gameState == 4 && mode == 1, 
    "Selecting a Character [Normal Mode]"
)

rich_presence_conditional_display((gameState == 4 && mode == 2) || (gameState == 5 && mode == 2 && camera == 0), 
    "Selecting a Character and Stage [Time Attack]"
)

rich_presence_conditional_display(gameState == 4 && mode == 4 && stage == 0xFFFF, 
    "Selecting a Character to start a Dance Session [??? Mode]"
)

rich_presence_conditional_display(gameState == 4 && mode == 4, 
    "Watching {0} doing a Dance Session [??? Mode]",
    rich_presence_lookup("CharacterPlayer",
                          player1Char2,
                          characters,
                          fallback = characters[0])
)

rich_presence_conditional_display(gameState == 5 && mode == 0, 
    "{0} is {3} against {1} on {2} [Story Mode]",
     rich_presence_lookup("CharacterPlayer",
                          player1Char,
                          characters,
                          fallback = characters[0]),
     rich_presence_lookup("CharacterOpponent",
                          player2Char,
                          characters,
                          fallback = characters[1]),
     rich_presence_lookup("Stage",
                          stage,
                          stages,
                          fallback = stages[0]),
     rich_presence_lookup("Replay",
                          byte(0x1CAFF1),
                          replay,
                          fallback = replay[0])                  
)

rich_presence_conditional_display(gameState == 5 && mode == 1, 
    "{0} is {3} against {1} on {2} [Normal Mode]",
     rich_presence_lookup("CharacterPlayer",
                          player1Char,
                          characters,
                          fallback = characters[0]),
     rich_presence_lookup("CharacterOpponent",
                          player2Char,
                          characters,
                          fallback = characters[1]),
     rich_presence_lookup("Stage",
                          stage,
                          stages,
                          fallback = stages[0]),
     rich_presence_lookup("Replay",
                          byte(0x1CAFF1),
                          replay,
                          fallback = replay[0]) 
)

rich_presence_conditional_display(gameState == 5 && mode == 2, 
    "{0} is {3} against the time on {1} [⏱️{2}] [Time Attack]",
     rich_presence_lookup("CharacterPlayer",
                          player1Char,
                          characters,
                          fallback = characters[0]),
     rich_presence_lookup("Stage",
                          stage,
                          stages,
                          fallback = stages[0]),
     rich_presence_macro("Centiseconds",
                         time),
     rich_presence_lookup("Replay",
                          byte(0x1CAFF1),
                          replay,
                          fallback = replay[0]) 
)

rich_presence_conditional_display(gameState == 6 && mode == 0, 
    "{0} is talking to {1} [Story Mode]",
     rich_presence_lookup("CharacterPlayer",
                          player1Char,
                          characters,
                          fallback = characters[0]),
     rich_presence_lookup("CharacterOpponent",
                          player2Char,
                          characters,
                          fallback = characters[1])
)

rich_presence_conditional_display(gameState == 6 && mode == 1, 
    "{0} is talking to {1} [Normal Mode]",
     rich_presence_lookup("CharacterPlayer",
                          player1Char,
                          characters,
                          fallback = characters[0]),
     rich_presence_lookup("CharacterOpponent",
                          player2Char,
                          characters,
                          fallback = characters[1])
)

rich_presence_conditional_display(gameState == 7, 
    "{0} got a new record time on {1} [Time Attack]",
     rich_presence_lookup("CharacterPlayer",
                          player1Char,
                          characters,
                          fallback = characters[0]),
     rich_presence_lookup("Stage",
                          stage,
                          stages,
                          fallback = stages[0])
)

rich_presence_conditional_display(gameState == 6 && ascii_string_equals(0x1CEB48, "END"), 
    "In the Credits [{0}]",
    rich_presence_lookup("Mode",
                         mode,
                         modes,
                         fallback = modes[0])
)

rich_presence_display("In the Titlescreen")