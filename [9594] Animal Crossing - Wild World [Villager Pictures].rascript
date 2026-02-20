// Animal Crossing: Wild World
// #ID = 9594
achievementsetvillagerpictures = achievement_set("Villager Pictures", type="BONUS", id=6103)

//--------------------------------------------------
// Addresses
mem_interactedObject     = 0x001c6de2
mem_NPCslotTalkingTo     = 0x001c6de0
mem_playerID             = 0x001dcc84
mem_playerDataSize       = 8844
mem_villagerDataStart    = 0x001e3434
mem_villagerDataSize     = 1792
mem_playerSlotDataSize   = 104
mem_playerSlotInWorld    = 0x001cf970
mem_selectedPlayer       = 0x001d3f14

pointer_playerAnimation  = tbyte(0x001ca754) + 0x248
pointer_itemObtained     = tbyte(0x001c8e18) + 0x50

offset_playerSlotChecksum   = 0x0A
offset_playerSlotFriendship = 0x54
offset_playerSlotPicture    = 0x64
offset_villagerID           = 0x6CB

//--------------------------------------------------
// Functions

function playerTalkingToVillager(villagerID) {
    return word(mem_interactedObject) >= 0x84 &&
           word(mem_interactedObject) <= 0x85 &&
           byte(word(mem_NPCslotTalkingTo) * mem_villagerDataSize + mem_villagerDataStart + offset_villagerID) == villagerID
}

function playerReceivingPictureFurniture(villagerID) {
    return dword(pointer_playerAnimation) == 0x0032 &&
           word(pointer_itemObtained) == 0x47D8 + (villagerID * 4)
}

function checkPlayerChecksum(villagerSlot, villagerPlayerSlot) {
    playerPlayerChecksumAddress   = (byte(mem_selectedPlayer) * mem_playerDataSize) + mem_playerID
    villagerPlayerChecksumAddress = mem_villagerDataStart + (villagerSlot * mem_villagerDataSize) + offset_playerSlotChecksum + (villagerPlayerSlot * mem_playerSlotDataSize)

    return dword(mem_playerSlotInWorld) == 0x00 &&
            word(playerPlayerChecksumAddress + 0x00) ==  word(villagerPlayerChecksumAddress + 0x00) &&
           dword(playerPlayerChecksumAddress + 0x02) == dword(villagerPlayerChecksumAddress + 0x02) &&
           dword(playerPlayerChecksumAddress + 0x06) == dword(villagerPlayerChecksumAddress + 0x06) &&
            byte(playerPlayerChecksumAddress + 0x0A) ==  byte(villagerPlayerChecksumAddress + 0x0A)
}

function checkFriendship(villagerID, villagerSlot, villagerPlayerSlot) {
    villagerIDAddress               = mem_villagerDataStart + (villagerSlot * mem_villagerDataSize) + offset_villagerID
    villagerPlayerFriendshipAddress = mem_villagerDataStart + (villagerSlot * mem_villagerDataSize) + offset_playerSlotFriendship + (villagerPlayerSlot * mem_playerSlotDataSize)

    return measured(byte(villagerPlayerFriendshipAddress) == 127,
                when = byte(villagerIDAddress) == villagerID &&
                       checkPlayerChecksum(villagerSlot, villagerPlayerSlot),
                format = "raw")
}

function checkAnyVillagerPlayerSlot(villagerID) {
    code = always_false()

    for villagerSlot in range(0, 7) {
        for villagerPlayerSlot in range(0, 7) {
            code = code || checkFriendship(villagerID, villagerSlot, villagerPlayerSlot)
        }
    }
    
    return code
}

function getVillagerPicture(villagerID) {
    return playerTalkingToVillager(villagerID) &&
           playerReceivingPictureFurniture(villagerID) &&
           (checkAnyVillagerPlayerSlot(villagerID))
}

//--------------------------------------------------
// Achievements

achievement(
    title = "Wish you were here!", points = 5,
    description = "Obtain the Villager Picture of Cyrano.",
    set = achievementsetvillagerpictures,
    id = 259211, badge = "287156", published = "23.10.2022 13:39:50", modified = "28.03.2025 16:43:03",
    trigger = getVillagerPicture(0x00)
)

achievement(
    title = "Always go for the burn!", points = 5,
    description = "Obtain the Villager Picture of Antonio.",
    set = achievementsetvillagerpictures,
    id = 259212, badge = "287157", published = "23.10.2022 13:39:51", modified = "28.03.2025 16:43:03",
    trigger = getVillagerPicture(0x01)
)

achievement(
    title = "Now you can say you knew me when!", points = 5,
    description = "Obtain the Villager Picture of Pango.",
    set = achievementsetvillagerpictures,
    id = 259213, badge = "287158", published = "23.10.2022 13:39:51", modified = "28.03.2025 16:43:03",
    trigger = getVillagerPicture(0x02)
)

achievement(
    title = "I'll remember you even when I'm famous!", points = 5,
    description = "Obtain the Villager Picture of Anabelle.",
    set = achievementsetvillagerpictures,
    id = 259214, badge = "287159", published = "23.10.2022 13:39:51", modified = "28.03.2025 16:43:04",
    trigger = getVillagerPicture(0x03)
)

achievement(
    title = "You gotta play through the pain!", points = 5,
    description = "Obtain the Villager Picture of Teddy.",
    set = achievementsetvillagerpictures,
    id = 259215, badge = "287160", published = "23.10.2022 13:39:52", modified = "28.03.2025 16:43:04",
    trigger = getVillagerPicture(0x04)
)

achievement(
    title = "LEAPING LOLLIPOPS!", points = 5,
    description = "Obtain the Villager Picture of Pinky.",
    set = achievementsetvillagerpictures,
    id = 259216, badge = "287161", published = "23.10.2022 13:39:52", modified = "28.03.2025 16:43:04",
    trigger = getVillagerPicture(0x05)
)

achievement(
    title = "I'm watching you!", points = 5,
    description = "Obtain the Villager Picture of Curt.",
    set = achievementsetvillagerpictures,
    id = 259217, badge = "287162", published = "23.10.2022 13:39:52", modified = "28.03.2025 16:43:04",
    trigger = getVillagerPicture(0x06)
)

achievement(
    title = "Remember...I'm always watching you.", points = 5,
    description = "Obtain the Villager Picture of Chow.",
    set = achievementsetvillagerpictures,
    id = 259218, badge = "287163", published = "23.10.2022 13:39:53", modified = "28.03.2025 16:43:04",
    trigger = getVillagerPicture(0x07)
)

achievement(
    title = "You gotta want it!", points = 5,
    description = "Obtain the Villager Picture of Jay.",
    set = achievementsetvillagerpictures,
    id = 259219, badge = "287164", published = "23.10.2022 13:39:53", modified = "28.03.2025 16:43:05",
    trigger = getVillagerPicture(0x08)
)

achievement(
    title = "Always keep your wings manicured so you can fly away!", points = 5,
    description = "Obtain the Villager Picture of Robin.",
    set = achievementsetvillagerpictures,
    id = 259220, badge = "287165", published = "23.10.2022 13:39:53", modified = "28.03.2025 16:43:05",
    trigger = getVillagerPicture(0x09)
)

achievement(
    title = "I'm hungry.", points = 5,
    description = "Obtain the Villager Picture of Anchovy.",
    set = achievementsetvillagerpictures,
    id = 259221, badge = "287166", published = "23.10.2022 13:39:54", modified = "28.03.2025 16:43:05",
    trigger = getVillagerPicture(0x0A)
)

achievement(
    title = "Do you want my autograph, too?", points = 5,
    description = "Obtain the Villager Picture of Twiggy.",
    set = achievementsetvillagerpictures,
    id = 259222, badge = "287167", published = "23.10.2022 13:39:54", modified = "28.03.2025 16:43:05",
    trigger = getVillagerPicture(0x0B)
)

achievement(
    title = "When you're a team of one, you're always captain!", points = 5,
    description = "Obtain the Villager Picture of Jitters.",
    set = achievementsetvillagerpictures,
    id = 259223, badge = "287168", published = "23.10.2022 13:39:54", modified = "28.03.2025 16:43:05",
    trigger = getVillagerPicture(0x0C)
)

achievement(
    title = "Even strong men cry.", points = 5,
    description = "Obtain the Villager Picture of Angus.",
    set = achievementsetvillagerpictures,
    id = 259224, badge = "287169", published = "23.10.2022 13:39:55", modified = "28.03.2025 16:43:06",
    trigger = getVillagerPicture(0x0D)
)

achievement(
    title = "Zzzzzzzzzzzzzzzzz...", points = 5,
    description = "Obtain the Villager Picture of Rodeo.",
    set = achievementsetvillagerpictures,
    id = 259225, badge = "287170", published = "23.10.2022 13:39:55", modified = "28.03.2025 16:43:06",
    trigger = getVillagerPicture(0x0E)
)

achievement(
    title = "I'm a cat. Chillin' is in my blood, man.", points = 5,
    description = "Obtain the Villager Picture of Bob.",
    set = achievementsetvillagerpictures,
    id = 259226, badge = "287171", published = "23.10.2022 13:39:55", modified = "28.03.2025 16:43:07",
    trigger = getVillagerPicture(0x0F)
)

achievement(
    title = "Sometimes I think I'm the only sane one around.", points = 5,
    description = "Obtain the Villager Picture of Mitzi.",
    set = achievementsetvillagerpictures,
    id = 259227, badge = "287172", published = "23.10.2022 13:39:56", modified = "28.03.2025 16:43:07",
    trigger = getVillagerPicture(0x10)
)

achievement(
    title = "To the president of the Rosie Fan Club!", points = 5,
    description = "Obtain the Villager Picture of Rosie.",
    set = achievementsetvillagerpictures,
    id = 259228, badge = "287173", published = "23.10.2022 13:39:56", modified = "28.03.2025 16:43:07",
    trigger = getVillagerPicture(0x11)
)

achievement(
    title = "You're the best friend because you make me look even prettier.", points = 5,
    description = "Obtain the Villager Picture of Olivia.",
    set = achievementsetvillagerpictures,
    id = 259229, badge = "287174", published = "23.10.2022 13:39:56", modified = "28.03.2025 16:43:08",
    trigger = getVillagerPicture(0x12)
)

achievement(
    title = "Hang in there, kiddo.", points = 5,
    description = "Obtain the Villager Picture of Kiki.",
    set = achievementsetvillagerpictures,
    id = 259230, badge = "287175", published = "23.10.2022 13:39:57", modified = "28.03.2025 16:43:08",
    trigger = getVillagerPicture(0x13)
)

achievement(
    title = "They say cats hate citrus. THAT REALLY HURTS MY FEELINGS!", points = 5,
    description = "Obtain the Villager Picture of Tangy.",
    set = achievementsetvillagerpictures,
    id = 259231, badge = "287176", published = "23.10.2022 13:39:57", modified = "28.03.2025 16:43:09",
    trigger = getVillagerPicture(0x14)
)

achievement(
    title = "Turn the other cheek.", points = 5,
    description = "Obtain the Villager Picture of Punchy.",
    set = achievementsetvillagerpictures,
    id = 259232, badge = "287177", published = "23.10.2022 13:39:57", modified = "28.03.2025 16:43:09",
    trigger = getVillagerPicture(0x15)
)

achievement(
    title = "You don't mind if I use your bed to sharpen my claws, do you?", points = 5,
    description = "Obtain the Villager Picture of Purrl.",
    set = achievementsetvillagerpictures,
    id = 259233, badge = "287178", published = "23.10.2022 13:39:58", modified = "28.03.2025 16:43:09",
    trigger = getVillagerPicture(0x16)
)

achievement(
    title = "Whoa...", points = 5,
    description = "Obtain the Villager Picture of Moe.",
    set = achievementsetvillagerpictures,
    id = 259234, badge = "287179", published = "23.10.2022 13:39:58", modified = "28.03.2025 16:43:09",
    trigger = getVillagerPicture(0x17)
)

achievement(
    title = "Hoo-ha konichiwa!", points = 5,
    description = "Obtain the Villager Picture of Kabuki.",
    set = achievementsetvillagerpictures,
    id = 259235, badge = "287180", published = "23.10.2022 13:39:58", modified = "28.03.2025 16:43:09",
    trigger = getVillagerPicture(0x18)
)

achievement(
    title = "Spandex is the best disguise.", points = 5,
    description = "Obtain the Villager Picture of Kid Cat.",
    set = achievementsetvillagerpictures,
    id = 259236, badge = "287181", published = "23.10.2022 13:39:59", modified = "28.03.2025 16:43:10",
    trigger = getVillagerPicture(0x19)
)

achievement(
    title = "No airbrushing necessary!", points = 5,
    description = "Obtain the Villager Picture of Monique.",
    set = achievementsetvillagerpictures,
    id = 259237, badge = "287182", published = "23.10.2022 13:39:59", modified = "28.03.2025 16:43:11",
    trigger = getVillagerPicture(0x1A)
)

achievement(
    title = "This is my new headshot!", points = 5,
    description = "Obtain the Villager Picture of Tabby.",
    set = achievementsetvillagerpictures,
    id = 259238, badge = "287183", published = "23.10.2022 13:39:59", modified = "28.03.2025 16:43:11",
    trigger = getVillagerPicture(0x1B)
)

achievement(
    title = "I enjoy tap dancing and raspberry jam!", points = 5,
    description = "Obtain the Villager Picture of Bluebear.",
    set = achievementsetvillagerpictures,
    id = 259239, badge = "287184", published = "23.10.2022 13:40:00", modified = "28.03.2025 16:43:11",
    trigger = getVillagerPicture(0x1C)
)

achievement(
    title = "Maple + Moppina = BFF!", points = 5,
    description = "Obtain the Villager Picture of Maple.",
    set = achievementsetvillagerpictures,
    id = 259240, badge = "287185", published = "23.10.2022 13:40:00", modified = "28.03.2025 16:43:11",
    trigger = getVillagerPicture(0x1D)
)

achievement(
    title = "C'mere! I wanna bench-press you!", points = 5,
    description = "Obtain the Villager Picture of Poncho.",
    set = achievementsetvillagerpictures,
    id = 259241, badge = "287186", published = "23.10.2022 13:40:00", modified = "28.03.2025 16:43:11",
    trigger = getVillagerPicture(0x1E)
)

achievement(
    title = "Keep it real. Yeah.", points = 5,
    description = "Obtain the Villager Picture of Pudge.",
    set = achievementsetvillagerpictures,
    id = 259242, badge = "287187", published = "23.10.2022 13:40:01", modified = "28.03.2025 16:43:12",
    trigger = getVillagerPicture(0x1F)
)

achievement(
    title = "Drop and give me twenty!", points = 5,
    description = "Obtain the Villager Picture of Kody.",
    set = achievementsetvillagerpictures,
    id = 259243, badge = "287188", published = "23.10.2022 13:40:01", modified = "28.03.2025 16:43:13",
    trigger = getVillagerPicture(0x20)
)

achievement(
    title = "Sometimes the sum is greater than its parts! Get it? A huh huh!", points = 5,
    description = "Obtain the Villager Picture of Stitches.",
    set = achievementsetvillagerpictures,
    id = 259244, badge = "287189", published = "23.10.2022 13:40:01", modified = "28.03.2025 16:43:13",
    trigger = getVillagerPicture(0x21)
)

achievement(
    title = "Who are you callin' chicken, chicken?!", points = 5,
    description = "Obtain the Villager Picture of Goose.",
    set = achievementsetvillagerpictures,
    id = 259245, badge = "287190", published = "23.10.2022 13:40:02", modified = "28.03.2025 16:43:13",
    trigger = getVillagerPicture(0x22)
)

achievement(
    title = "Bok bok bok?! Just kidding. A huh huh huh!", points = 5,
    description = "Obtain the Villager Picture of Benedict.",
    set = achievementsetvillagerpictures,
    id = 259246, badge = "287191", published = "23.10.2022 13:40:02", modified = "28.03.2025 16:43:13",
    trigger = getVillagerPicture(0x23)
)

achievement(
    title = "Napping is when I do my best thinking.", points = 5,
    description = "Obtain the Villager Picture of Egbert.",
    set = achievementsetvillagerpictures,
    id = 259247, badge = "287192", published = "23.10.2022 13:40:02", modified = "28.03.2025 16:43:14",
    trigger = getVillagerPicture(0x24)
)

achievement(
    title = "This month's Ms. Nintendique cover girl!", points = 5,
    description = "Obtain the Villager Picture of Patty.",
    set = achievementsetvillagerpictures,
    id = 259248, badge = "287193", published = "23.10.2022 13:40:03", modified = "28.03.2025 16:43:14",
    trigger = getVillagerPicture(0x25)
)

achievement(
    title = "I know you'll treasure this forever.", points = 5,
    description = "Obtain the Villager Picture of Tipper.",
    set = achievementsetvillagerpictures,
    id = 259249, badge = "287194", published = "23.10.2022 13:40:03", modified = "28.03.2025 16:43:14",
    trigger = getVillagerPicture(0x26)
)

achievement(
    title = "We're friends, so I won't gnaw on your legs.", points = 5,
    description = "Obtain the Villager Picture of Alfonso.",
    set = achievementsetvillagerpictures,
    id = 259250, badge = "287195", published = "23.10.2022 13:40:03", modified = "28.03.2025 16:43:14",
    trigger = getVillagerPicture(0x27)
)

achievement(
    title = "The important parts of any ensemble are the purse and shoes.", points = 5,
    description = "Obtain the Villager Picture of Alli.",
    set = achievementsetvillagerpictures,
    id = 259251, badge = "287196", published = "23.10.2022 13:40:04", modified = "28.03.2025 16:43:15",
    trigger = getVillagerPicture(0x28)
)

achievement(
    title = "I'm really into that Lab on the cover of Nintendogs.", points = 5,
    description = "Obtain the Villager Picture of Goldie.",
    set = achievementsetvillagerpictures,
    id = 259252, badge = "287197", published = "23.10.2022 13:40:04", modified = "28.03.2025 16:43:15",
    trigger = getVillagerPicture(0x29)
)

achievement(
    title = "I'm watching you!", points = 5,
    description = "Obtain the Villager Picture of Butch.",
    set = achievementsetvillagerpictures,
    id = 259253, badge = "287198", published = "23.10.2022 13:40:04", modified = "28.03.2025 16:43:16",
    trigger = getVillagerPicture(0x2A)
)

achievement(
    title = "Ow.", points = 5,
    description = "Obtain the Villager Picture of Lucky.",
    set = achievementsetvillagerpictures,
    id = 259254, badge = "287199", published = "23.10.2022 13:40:05", modified = "28.03.2025 16:43:16",
    trigger = getVillagerPicture(0x2B)
)

achievement(
    title = "Let sleeping dogs lie.", points = 5,
    description = "Obtain the Villager Picture of Biskit.",
    set = achievementsetvillagerpictures,
    id = 259255, badge = "287200", published = "23.10.2022 13:40:05", modified = "28.03.2025 16:43:16",
    trigger = getVillagerPicture(0x2C)
)

achievement(
    title = "Thanks for the snacks. Hint hint.", points = 5,
    description = "Obtain the Villager Picture of Bones.",
    set = achievementsetvillagerpictures,
    id = 259256, badge = "287201", published = "23.10.2022 13:40:05", modified = "28.03.2025 16:43:17",
    trigger = getVillagerPicture(0x2D)
)

achievement(
    title = "Of course my photo doesn't need retouching!", points = 5,
    description = "Obtain the Villager Picture of Portia.",
    set = achievementsetvillagerpictures,
    id = 259257, badge = "287202", published = "23.10.2022 13:40:06", modified = "28.03.2025 16:43:18",
    trigger = getVillagerPicture(0x2E)
)

achievement(
    title = "Perhaps you know me as my superhero alter ego, Fashion Lad.", points = 5,
    description = "Obtain the Villager Picture of Walker.",
    set = achievementsetvillagerpictures,
    id = 259258, badge = "287203", published = "23.10.2022 13:40:06", modified = "28.03.2025 16:43:18",
    trigger = getVillagerPicture(0x2F)
)

achievement(
    title = "Just a regular girl in a crazy world!", points = 5,
    description = "Obtain the Villager Picture of Daisy.",
    set = achievementsetvillagerpictures,
    id = 259259, badge = "287204", published = "23.10.2022 13:40:06", modified = "28.03.2025 16:43:18",
    trigger = getVillagerPicture(0x30)
)

achievement(
    title = "Even if there's no \"I\" in team, there's no \"everybody\" either.", points = 5,
    description = "Obtain the Villager Picture of Bill.",
    set = achievementsetvillagerpictures,
    id = 259260, badge = "287205", published = "23.10.2022 13:40:07", modified = "28.03.2025 16:43:18",
    trigger = getVillagerPicture(0x31)
)

achievement(
    title = "Don't get your feathers all ruffled. Just chill.", points = 5,
    description = "Obtain the Villager Picture of Joey.",
    set = achievementsetvillagerpictures,
    id = 259261, badge = "287206", published = "23.10.2022 13:40:07", modified = "28.03.2025 16:43:18",
    trigger = getVillagerPicture(0x32)
)

achievement(
    title = "SHRIEKING SUGARCUBES!", points = 5,
    description = "Obtain the Villager Picture of Pate.",
    set = achievementsetvillagerpictures,
    id = 259262, badge = "287207", published = "23.10.2022 13:40:07", modified = "28.03.2025 16:43:19",
    trigger = getVillagerPicture(0x33)
)

achievement(
    title = "I like long walks on the beach. Alone.", points = 5,
    description = "Obtain the Villager Picture of Maelle.",
    set = achievementsetvillagerpictures,
    id = 259263, badge = "287208", published = "23.10.2022 13:40:08", modified = "28.03.2025 16:43:19",
    trigger = getVillagerPicture(0x34)
)

achievement(
    title = "I'm not a lame duck!", points = 5,
    description = "Obtain the Villager Picture of Deena.",
    set = achievementsetvillagerpictures,
    id = 259264, badge = "287209", published = "23.10.2022 13:40:08", modified = "28.03.2025 16:43:19",
    trigger = getVillagerPicture(0x35)
)

achievement(
    title = "This one goes out to all my fans!", points = 5,
    description = "Obtain the Villager Picture of Pompom.",
    set = achievementsetvillagerpictures,
    id = 259265, badge = "287210", published = "23.10.2022 13:40:08", modified = "28.03.2025 16:43:20",
    trigger = getVillagerPicture(0x36)
)

achievement(
    title = "Purple is the color of royalty, you know!", points = 5,
    description = "Obtain the Villager Picture of Mallary.",
    set = achievementsetvillagerpictures,
    id = 259266, badge = "287211", published = "23.10.2022 13:40:09", modified = "28.03.2025 16:43:20",
    trigger = getVillagerPicture(0x37)
)

achievement(
    title = "CATAPULTING CUPCAKES!", points = 5,
    description = "Obtain the Villager Picture of Freckles.",
    set = achievementsetvillagerpictures,
    id = 259267, badge = "287212", published = "23.10.2022 13:40:09", modified = "28.03.2025 16:43:21",
    trigger = getVillagerPicture(0x38)
)

achievement(
    title = "Everything in moderation. Except for snacks.", points = 5,
    description = "Obtain the Villager Picture of Derwin.",
    set = achievementsetvillagerpictures,
    id = 259268, badge = "287213", published = "23.10.2022 13:40:09", modified = "26.11.2025 16:16:47",
    trigger = getVillagerPicture(0x39)
)

achievement(
    title = "Got any snacks on you?", points = 5,
    description = "Obtain the Villager Picture of Drake.",
    set = achievementsetvillagerpictures,
    id = 259269, badge = "287214", published = "23.10.2022 13:40:10", modified = "28.03.2025 16:43:21",
    trigger = getVillagerPicture(0x3A)
)

achievement(
    title = "Now whenever you see me, you can think warm thoughts.", points = 5,
    description = "Obtain the Villager Picture of Opal.",
    set = achievementsetvillagerpictures,
    id = 259270, badge = "287215", published = "23.10.2022 13:40:10", modified = "28.03.2025 16:43:21",
    trigger = getVillagerPicture(0x3B)
)

achievement(
    title = "Keep it mellow.", points = 5,
    description = "Obtain the Villager Picture of Dizzy.",
    set = achievementsetvillagerpictures,
    id = 259271, badge = "287216", published = "23.10.2022 13:40:10", modified = "28.03.2025 16:43:21",
    trigger = getVillagerPicture(0x3C)
)

achievement(
    title = "World domination!", points = 5,
    description = "Obtain the Villager Picture of Big Top.",
    set = achievementsetvillagerpictures,
    id = 259272, badge = "287217", published = "23.10.2022 13:40:11", modified = "28.03.2025 16:43:22",
    trigger = getVillagerPicture(0x3D)
)

achievement(
    title = "You'll want to display this prominently!", points = 5,
    description = "Obtain the Villager Picture of Eloise.",
    set = achievementsetvillagerpictures,
    id = 259273, badge = "287218", published = "23.10.2022 13:40:11", modified = "28.03.2025 16:43:23",
    trigger = getVillagerPicture(0x3E)
)

achievement(
    title = "Keep your feet on the ground.", points = 5,
    description = "Obtain the Villager Picture of Margie.",
    set = achievementsetvillagerpictures,
    id = 259274, badge = "287219", published = "23.10.2022 13:40:11", modified = "28.03.2025 16:43:23",
    trigger = getVillagerPicture(0x3F)
)

achievement(
    title = "Don't jump to conclusions!", points = 5,
    description = "Obtain the Villager Picture of Lily.",
    set = achievementsetvillagerpictures,
    id = 259275, badge = "287220", published = "23.10.2022 13:40:12", modified = "28.03.2025 16:43:23",
    trigger = getVillagerPicture(0x40)
)

achievement(
    title = "Never rest, never rust.", points = 5,
    description = "Obtain the Villager Picture of Ribbot.",
    set = achievementsetvillagerpictures,
    id = 259276, badge = "287221", published = "23.10.2022 13:40:12", modified = "28.03.2025 16:43:23",
    trigger = getVillagerPicture(0x41)
)

achievement(
    title = "I don't wanna see any lily-livered jumping! Always aim high!", points = 5,
    description = "Obtain the Villager Picture of Frobert.",
    set = achievementsetvillagerpictures,
    id = 259277, badge = "287222", published = "23.10.2022 13:40:12", modified = "28.03.2025 16:43:24",
    trigger = getVillagerPicture(0x42)
)

achievement(
    title = "You can't see me.", points = 5,
    description = "Obtain the Villager Picture of Camofrog.",
    set = achievementsetvillagerpictures,
    id = 259278, badge = "287223", published = "23.10.2022 13:40:13", modified = "28.03.2025 16:43:24",
    trigger = getVillagerPicture(0x43)
)

achievement(
    title = "Always go for the gold!", points = 5,
    description = "Obtain the Villager Picture of Drift.",
    set = achievementsetvillagerpictures,
    id = 259279, badge = "287224", published = "23.10.2022 13:40:13", modified = "28.03.2025 16:43:24",
    trigger = getVillagerPicture(0x44)
)

achievement(
    title = "I've got my eye on you.", points = 5,
    description = "Obtain the Villager Picture of Wart Jr.",
    set = achievementsetvillagerpictures,
    id = 259280, badge = "287225", published = "23.10.2022 13:40:13", modified = "28.03.2025 16:43:24",
    trigger = getVillagerPicture(0x45)
)

achievement(
    title = "HIP HOP HO! Hey, let's go!", points = 5,
    description = "Obtain the Villager Picture of Puddles.",
    set = achievementsetvillagerpictures,
    id = 259281, badge = "287226", published = "23.10.2022 13:40:14", modified = "28.03.2025 16:43:26",
    trigger = getVillagerPicture(0x46)
)

achievement(
    title = "Bullfrog is only one letter away from blue frog.", points = 5,
    description = "Obtain the Villager Picture of Jeremiah.",
    set = achievementsetvillagerpictures,
    id = 259282, badge = "287227", published = "23.10.2022 13:40:14", modified = "28.03.2025 16:43:26",
    trigger = getVillagerPicture(0x47)
)

achievement(
    title = "Dream a little dream.", points = 5,
    description = "Obtain the Villager Picture of Chevre.",
    set = achievementsetvillagerpictures,
    id = 259283, badge = "287228", published = "23.10.2022 13:40:14", modified = "28.03.2025 16:43:26",
    trigger = getVillagerPicture(0x48)
)

achievement(
    title = "Nanny-nanny boo-boo!", points = 5,
    description = "Obtain the Villager Picture of Nan.",
    set = achievementsetvillagerpictures,
    id = 259284, badge = "287229", published = "23.10.2022 13:40:15", modified = "28.03.2025 16:43:27",
    trigger = getVillagerPicture(0x49)
)

achievement(
    title = "All hail my moustache!", points = 5,
    description = "Obtain the Villager Picture of Cesar.",
    set = achievementsetvillagerpictures,
    id = 259285, badge = "287230", published = "23.10.2022 13:40:15", modified = "28.03.2025 16:43:27",
    trigger = getVillagerPicture(0x4A)
)

achievement(
    title = "I AM BEHIND YOU!", points = 5,
    description = "Obtain the Villager Picture of Peewee.",
    set = achievementsetvillagerpictures,
    id = 259286, badge = "287231", published = "23.10.2022 13:40:15", modified = "28.03.2025 16:43:27",
    trigger = getVillagerPicture(0x4B)
)

achievement(
    title = "Words to live by: Don't ever wimp out!", points = 5,
    description = "Obtain the Villager Picture of Boone.",
    set = achievementsetvillagerpictures,
    id = 259287, badge = "287232", published = "23.10.2022 13:40:16", modified = "28.03.2025 16:43:27",
    trigger = getVillagerPicture(0x4C)
)

achievement(
    title = "You smell like patchouli!", points = 5,
    description = "Obtain the Villager Picture of Rocco.",
    set = achievementsetvillagerpictures,
    id = 259288, badge = "287233", published = "23.10.2022 13:40:16", modified = "28.03.2025 16:43:27",
    trigger = getVillagerPicture(0x4D)
)

achievement(
    title = "What are you staring at?!", points = 5,
    description = "Obtain the Villager Picture of Buck.",
    set = achievementsetvillagerpictures,
    id = 259289, badge = "287234", published = "23.10.2022 13:40:16", modified = "28.03.2025 16:43:27",
    trigger = getVillagerPicture(0x4E)
)

achievement(
    title = "CATERWAULING CARROT CAKE!", points = 5,
    description = "Obtain the Villager Picture of Victoria.",
    set = achievementsetvillagerpictures,
    id = 259290, badge = "287235", published = "23.10.2022 13:40:17", modified = "28.03.2025 16:43:28",
    trigger = getVillagerPicture(0x4F)
)

achievement(
    title = "Keep your chin up!", points = 5,
    description = "Obtain the Villager Picture of Savannah.",
    set = achievementsetvillagerpictures,
    id = 259291, badge = "287236", published = "23.10.2022 13:40:17", modified = "28.03.2025 16:43:29",
    trigger = getVillagerPicture(0x50)
)

achievement(
    title = "Got any snacks on you?", points = 5,
    description = "Obtain the Villager Picture of Elmer.",
    set = achievementsetvillagerpictures,
    id = 259292, badge = "287237", published = "23.10.2022 13:40:17", modified = "28.03.2025 16:43:29",
    trigger = getVillagerPicture(0x51)
)

achievement(
    title = "I've got my eye on you, bucko!", points = 5,
    description = "Obtain the Villager Picture of Roscoe.",
    set = achievementsetvillagerpictures,
    id = 259293, badge = "287238", published = "23.10.2022 13:40:18", modified = "28.03.2025 16:43:29",
    trigger = getVillagerPicture(0x52)
)

achievement(
    title = "It's nice that you have me as a friend.", points = 5,
    description = "Obtain the Villager Picture of Yuka.",
    set = achievementsetvillagerpictures,
    id = 259294, badge = "287239", published = "23.10.2022 13:40:18", modified = "28.03.2025 16:43:29",
    trigger = getVillagerPicture(0x53)
)

achievement(
    title = "I like having you around.", points = 5,
    description = "Obtain the Villager Picture of Alice.",
    set = achievementsetvillagerpictures,
    id = 259295, badge = "287240", published = "23.10.2022 13:40:19", modified = "28.03.2025 16:43:30",
    trigger = getVillagerPicture(0x54)
)

achievement(
    title = "You're my new best bud!", points = 5,
    description = "Obtain the Villager Picture of Melba.",
    set = achievementsetvillagerpictures,
    id = 259296, badge = "287241", published = "23.10.2022 13:40:19", modified = "28.03.2025 16:43:30",
    trigger = getVillagerPicture(0x55)
)

achievement(
    title = "They say that ugly parents have ugly kids.", points = 5,
    description = "Obtain the Villager Picture of Kitt.",
    set = achievementsetvillagerpictures,
    id = 259297, badge = "287242", published = "23.10.2022 13:40:19", modified = "28.03.2025 16:43:30",
    trigger = getVillagerPicture(0x56)
)

achievement(
    title = "Blood is thicker than water!", points = 5,
    description = "Obtain the Villager Picture of Mathilda.",
    set = achievementsetvillagerpictures,
    id = 259298, badge = "287243", published = "23.10.2022 13:40:19", modified = "28.03.2025 16:43:30",
    trigger = getVillagerPicture(0x57)
)

achievement(
    title = "You're not living unless you're sweating!", points = 5,
    description = "Obtain the Villager Picture of Bud.",
    set = achievementsetvillagerpictures,
    id = 259299, badge = "287244", published = "23.10.2022 13:40:20", modified = "28.03.2025 16:43:32",
    trigger = getVillagerPicture(0x58)
)

achievement(
    title = "Thank you very much.", points = 5,
    description = "Obtain the Villager Picture of Elvis.",
    set = achievementsetvillagerpictures,
    id = 259300, badge = "287245", published = "23.10.2022 13:40:20", modified = "28.03.2025 16:43:32",
    trigger = getVillagerPicture(0x59)
)

achievement(
    title = "Got any cheese for me?", points = 5,
    description = "Obtain the Villager Picture of Dora.",
    set = achievementsetvillagerpictures,
    id = 259301, badge = "287246", published = "23.10.2022 13:40:20", modified = "28.03.2025 16:43:32",
    trigger = getVillagerPicture(0x5A)
)

achievement(
    title = "Something stinks!", points = 5,
    description = "Obtain the Villager Picture of Limberg.",
    set = achievementsetvillagerpictures,
    id = 259302, badge = "287247", published = "23.10.2022 13:40:21", modified = "28.03.2025 16:43:32",
    trigger = getVillagerPicture(0x5B)
)

achievement(
    title = "Would you like my autograph?", points = 5,
    description = "Obtain the Villager Picture of Bella.",
    set = achievementsetvillagerpictures,
    id = 259303, badge = "287248", published = "23.10.2022 13:40:21", modified = "28.03.2025 16:43:32",
    trigger = getVillagerPicture(0x5C)
)

achievement(
    title = "Just in case you were wondering, I like presents.", points = 5,
    description = "Obtain the Villager Picture of Bree.",
    set = achievementsetvillagerpictures,
    id = 259304, badge = "287249", published = "23.10.2022 13:40:21", modified = "28.03.2025 16:43:33",
    trigger = getVillagerPicture(0x5D)
)

achievement(
    title = "This isn't a dress I'm wearing! It's a muscle tee!", points = 5,
    description = "Obtain the Villager Picture of Samson.",
    set = achievementsetvillagerpictures,
    id = 259305, badge = "287250", published = "23.10.2022 13:40:22", modified = "28.03.2025 16:43:33",
    trigger = getVillagerPicture(0x5E)
)

achievement(
    title = "You're not done 'til your muscles are screaming in agony!", points = 5,
    description = "Obtain the Villager Picture of Rod.",
    set = achievementsetvillagerpictures,
    id = 259306, badge = "287251", published = "23.10.2022 13:40:22", modified = "28.03.2025 16:43:33",
    trigger = getVillagerPicture(0x5F)
)

achievement(
    title = "Don't be a sucker!", points = 5,
    description = "Obtain the Villager Picture of Octavian.",
    set = achievementsetvillagerpictures,
    id = 259307, badge = "287252", published = "23.10.2022 13:40:22", modified = "28.03.2025 16:43:33",
    trigger = getVillagerPicture(0x60)
)

achievement(
    title = "I think I'm the only sane one in this town.", points = 5,
    description = "Obtain the Villager Picture of Marina.",
    set = achievementsetvillagerpictures,
    id = 259308, badge = "287253", published = "23.10.2022 13:40:23", modified = "28.03.2025 16:43:34",
    trigger = getVillagerPicture(0x61)
)

achievement(
    title = "No retouching necessary!", points = 5,
    description = "Obtain the Villager Picture of Queenie.",
    set = achievementsetvillagerpictures,
    id = 259309, badge = "287254", published = "23.10.2022 13:40:23", modified = "28.03.2025 16:43:34",
    trigger = getVillagerPicture(0x62)
)

achievement(
    title = "Smiles are free, you know.", points = 5,
    description = "Obtain the Villager Picture of Gladys.",
    set = achievementsetvillagerpictures,
    id = 259310, badge = "287255", published = "23.10.2022 13:40:23", modified = "28.03.2025 16:43:35",
    trigger = getVillagerPicture(0x63)
)

achievement(
    title = "I'm not bald! I've just got fine feathers, that's all!", points = 5,
    description = "Obtain the Villager Picture of Apollo.",
    set = achievementsetvillagerpictures,
    id = 259311, badge = "287256", published = "23.10.2022 13:40:24", modified = "28.03.2025 16:43:35",
    trigger = getVillagerPicture(0x64)
)

achievement(
    title = "Pampering yourself is as important as food, water, and shelter!", points = 5,
    description = "Obtain the Villager Picture of Amelia.",
    set = achievementsetvillagerpictures,
    id = 259312, badge = "287257", published = "23.10.2022 13:40:24", modified = "28.03.2025 16:43:35",
    trigger = getVillagerPicture(0x65)
)

achievement(
    title = "Nobody likes flabby wings.", points = 5,
    description = "Obtain the Villager Picture of Pierce.",
    set = achievementsetvillagerpictures,
    id = 259313, badge = "287258", published = "23.10.2022 13:40:24", modified = "28.03.2025 16:43:36",
    trigger = getVillagerPicture(0x66)
)

achievement(
    title = "Just keep your cool.", points = 5,
    description = "Obtain the Villager Picture of Aurora.",
    set = achievementsetvillagerpictures,
    id = 259314, badge = "287259", published = "23.10.2022 13:40:25", modified = "28.03.2025 16:43:36",
    trigger = getVillagerPicture(0x67)
)

achievement(
    title = "I'm not waddling! I'm working my glutes!", points = 5,
    description = "Obtain the Villager Picture of Roald.",
    set = achievementsetvillagerpictures,
    id = 259315, badge = "287260", published = "23.10.2022 13:40:25", modified = "28.03.2025 16:43:36",
    trigger = getVillagerPicture(0x68)
)

achievement(
    title = "Sometimes you gotta learn to chill.", points = 5,
    description = "Obtain the Villager Picture of Cube.",
    set = achievementsetvillagerpictures,
    id = 259316, badge = "287261", published = "23.10.2022 13:40:25", modified = "28.03.2025 16:43:37",
    trigger = getVillagerPicture(0x69)
)

achievement(
    title = "This is my good side.", points = 5,
    description = "Obtain the Villager Picture of Hopper.",
    set = achievementsetvillagerpictures,
    id = 259317, badge = "287262", published = "23.10.2022 13:40:26", modified = "28.03.2025 16:43:37",
    trigger = getVillagerPicture(0x6A)
)

achievement(
    title = "This isn't a fortune cookie! It's an important life lesson!", points = 5,
    description = "Obtain the Villager Picture of Friga.",
    set = achievementsetvillagerpictures,
    id = 259318, badge = "287263", published = "23.10.2022 13:40:26", modified = "28.03.2025 16:43:37",
    trigger = getVillagerPicture(0x6B)
)

achievement(
    title = "I'm just that cool.", points = 5,
    description = "Obtain the Villager Picture of Gwen.",
    set = achievementsetvillagerpictures,
    id = 259319, badge = "287264", published = "23.10.2022 13:40:26", modified = "28.03.2025 16:43:37",
    trigger = getVillagerPicture(0x6C)
)

achievement(
    title = "Get fired up!", points = 5,
    description = "Obtain the Villager Picture of Curly.",
    set = achievementsetvillagerpictures,
    id = 259320, badge = "287265", published = "23.10.2022 13:40:27", modified = "28.03.2025 16:43:39",
    trigger = getVillagerPicture(0x6D)
)

achievement(
    title = "JUMPING JELLY BEANS!", points = 5,
    description = "Obtain the Villager Picture of Truffles.",
    set = achievementsetvillagerpictures,
    id = 259321, badge = "287266", published = "23.10.2022 13:40:27", modified = "28.03.2025 16:43:39",
    trigger = getVillagerPicture(0x6E)
)

achievement(
    title = "Stop looking at me with those hungry eyes! I'm not a pork chop!", points = 5,
    description = "Obtain the Villager Picture of Rasher.",
    set = achievementsetvillagerpictures,
    id = 259322, badge = "287267", published = "23.10.2022 13:40:27", modified = "28.03.2025 16:43:39",
    trigger = getVillagerPicture(0x6F)
)

achievement(
    title = "Keep it real. Real chill.", points = 5,
    description = "Obtain the Villager Picture of Hugh.",
    set = achievementsetvillagerpictures,
    id = 259323, badge = "287268", published = "23.10.2022 13:40:28", modified = "28.03.2025 16:43:39",
    trigger = getVillagerPicture(0x70)
)

achievement(
    title = "This picture entitles you to one free smile!", points = 5,
    description = "Obtain the Villager Picture of Lucy.",
    set = achievementsetvillagerpictures,
    id = 259324, badge = "287269", published = "23.10.2022 13:40:28", modified = "28.03.2025 16:43:40",
    trigger = getVillagerPicture(0x71)
)

achievement(
    title = "Come on! Get amped!", points = 5,
    description = "Obtain the Villager Picture of Bunnie.",
    set = achievementsetvillagerpictures,
    id = 259325, badge = "287270", published = "23.10.2022 13:40:28", modified = "28.03.2025 16:43:40",
    trigger = getVillagerPicture(0x72)
)

achievement(
    title = "Hop to it, wee one!", points = 5,
    description = "Obtain the Villager Picture of Dotty.",
    set = achievementsetvillagerpictures,
    id = 259326, badge = "287271", published = "23.10.2022 13:40:29", modified = "28.03.2025 16:43:40",
    trigger = getVillagerPicture(0x73)
)

achievement(
    title = "I'm feeling kind of blank today.", points = 5,
    description = "Obtain the Villager Picture of Coco.",
    set = achievementsetvillagerpictures,
    id = 259327, badge = "287272", published = "23.10.2022 13:40:29", modified = "28.03.2025 16:43:40",
    trigger = getVillagerPicture(0x74)
)

achievement(
    title = "Snake's number one!", points = 5,
    description = "Obtain the Villager Picture of Snake.",
    set = achievementsetvillagerpictures,
    id = 259328, badge = "287273", published = "23.10.2022 13:40:29", modified = "28.03.2025 16:43:40",
    trigger = getVillagerPicture(0x75)
)

achievement(
    title = "Sacre bleu!", points = 5,
    description = "Obtain the Villager Picture of Gaston.",
    set = achievementsetvillagerpictures,
    id = 259329, badge = "287274", published = "23.10.2022 13:40:30", modified = "28.03.2025 16:43:42",
    trigger = getVillagerPicture(0x76)
)

achievement(
    title = "I'm trying out a new earstyle here.", points = 5,
    description = "Obtain the Villager Picture of Gabi.",
    set = achievementsetvillagerpictures,
    id = 259330, badge = "287275", published = "23.10.2022 13:40:30", modified = "28.03.2025 16:43:42",
    trigger = getVillagerPicture(0x77)
)

achievement(
    title = "HOPPING HOTCAKES!", points = 5,
    description = "Obtain the Villager Picture of Pippy.",
    set = achievementsetvillagerpictures,
    id = 259331, badge = "287276", published = "23.10.2022 13:40:30", modified = "28.03.2025 16:43:43",
    trigger = getVillagerPicture(0x78)
)

achievement(
    title = "Hai-ya!", points = 5,
    description = "Obtain the Villager Picture of Genji.",
    set = achievementsetvillagerpictures,
    id = 259332, badge = "287277", published = "23.10.2022 13:40:31", modified = "28.03.2025 16:43:43",
    trigger = getVillagerPicture(0x79)
)

achievement(
    title = "What's up, bunbun?", points = 5,
    description = "Obtain the Villager Picture of Tiffany.",
    set = achievementsetvillagerpictures,
    id = 259333, badge = "287278", published = "23.10.2022 13:40:31", modified = "28.03.2025 16:43:43",
    trigger = getVillagerPicture(0x7A)
)

achievement(
    title = "I'm not sick, I'm just albino!", points = 5,
    description = "Obtain the Villager Picture of Ruby.",
    set = achievementsetvillagerpictures,
    id = 259334, badge = "287279", published = "23.10.2022 13:40:31", modified = "28.03.2025 16:43:43",
    trigger = getVillagerPicture(0x7B)
)

achievement(
    title = "Remember to keep your core muscles engaged!", points = 5,
    description = "Obtain the Villager Picture of Tank.",
    set = achievementsetvillagerpictures,
    id = 259335, badge = "287280", published = "23.10.2022 13:40:32", modified = "28.03.2025 16:43:44",
    trigger = getVillagerPicture(0x7C)
)

achievement(
    title = "Don't look down your nose at people!", points = 5,
    description = "Obtain the Villager Picture of Rhonda.",
    set = achievementsetvillagerpictures,
    id = 259336, badge = "287281", published = "23.10.2022 13:40:32", modified = "28.03.2025 16:43:44",
    trigger = getVillagerPicture(0x7D)
)

achievement(
    title = "I'm so lucky to have this wool coat!", points = 5,
    description = "Obtain the Villager Picture of Vesta.",
    set = achievementsetvillagerpictures,
    id = 259337, badge = "287282", published = "23.10.2022 13:40:32", modified = "28.03.2025 16:43:44",
    trigger = getVillagerPicture(0x7E)
)

achievement(
    title = "I'm so soft that I don't even need a pillow!", points = 5,
    description = "Obtain the Villager Picture of Baabara.",
    set = achievementsetvillagerpictures,
    id = 259338, badge = "287283", published = "23.10.2022 13:40:33", modified = "28.03.2025 16:43:44",
    trigger = getVillagerPicture(0x7F)
)

achievement(
    title = "This is my star smile.", points = 5,
    description = "Obtain the Villager Picture of Peanut.",
    set = achievementsetvillagerpictures,
    id = 259339, badge = "287284", published = "23.10.2022 13:40:33", modified = "28.03.2025 16:43:44",
    trigger = getVillagerPicture(0x80)
)

achievement(
    title = "My tail looks extra fluffy in this picture.", points = 5,
    description = "Obtain the Villager Picture of Blaire.",
    set = achievementsetvillagerpictures,
    id = 259340, badge = "287285", published = "23.10.2022 13:40:33", modified = "28.03.2025 16:43:45",
    trigger = getVillagerPicture(0x81)
)

achievement(
    title = "Don't go nuts or anything.", points = 5,
    description = "Obtain the Villager Picture of Filbert.",
    set = achievementsetvillagerpictures,
    id = 259341, badge = "287286", published = "23.10.2022 13:40:34", modified = "28.03.2025 16:43:46",
    trigger = getVillagerPicture(0x82)
)

achievement(
    title = "A picture of me is worth a thousand pictures of someone else!", points = 5,
    description = "Obtain the Villager Picture of Pecan.",
    set = achievementsetvillagerpictures,
    id = 259342, badge = "287287", published = "23.10.2022 13:40:34", modified = "28.03.2025 16:43:46",
    trigger = getVillagerPicture(0x83)
)

achievement(
    title = "Coming soon to a billboard near you!", points = 5,
    description = "Obtain the Villager Picture of Nibbles.",
    set = achievementsetvillagerpictures,
    id = 259343, badge = "287288", published = "23.10.2022 13:40:34", modified = "28.03.2025 16:43:46",
    trigger = getVillagerPicture(0x84)
)

achievement(
    title = "I'm gonna, like, save the world!", points = 5,
    description = "Obtain the Villager Picture of Agent S.",
    set = achievementsetvillagerpictures,
    id = 259344, badge = "287289", published = "23.10.2022 13:40:35", modified = "28.03.2025 16:43:47",
    trigger = getVillagerPicture(0x85)
)

achievement(
    title = "Relax!", points = 5,
    description = "Obtain the Villager Picture of Caroline.",
    set = achievementsetvillagerpictures,
    id = 259345, badge = "287290", published = "23.10.2022 13:40:47", modified = "28.03.2025 16:43:47",
    trigger = getVillagerPicture(0x86)
)

achievement(
    title = "Just something to remember me by.", points = 5,
    description = "Obtain the Villager Picture of Sally.",
    set = achievementsetvillagerpictures,
    id = 259346, badge = "287291", published = "23.10.2022 13:40:47", modified = "28.03.2025 16:43:47",
    trigger = getVillagerPicture(0x87)
)

achievement(
    title = "Zap!", points = 5,
    description = "Obtain the Villager Picture of Static.",
    set = achievementsetvillagerpictures,
    id = 259347, badge = "287292", published = "23.10.2022 13:40:48", modified = "28.03.2025 16:43:47",
    trigger = getVillagerPicture(0x88)
)

achievement(
    title = "I'm totally fresh and you know it!", points = 5,
    description = "Obtain the Villager Picture of Mint.",
    set = achievementsetvillagerpictures,
    id = 259348, badge = "287293", published = "23.10.2022 13:40:48", modified = "28.03.2025 16:43:47",
    trigger = getVillagerPicture(0x89)
)

achievement(
    title = "I could eat you for lunch, you know.", points = 5,
    description = "Obtain the Villager Picture of Rolf.",
    set = achievementsetvillagerpictures,
    id = 259349, badge = "287294", published = "23.10.2022 13:40:48", modified = "28.03.2025 16:43:48",
    trigger = getVillagerPicture(0x8A)
)

achievement(
    title = "Why be junior varsity when you can be VARSITY?!", points = 5,
    description = "Obtain the Villager Picture of Rowan.",
    set = achievementsetvillagerpictures,
    id = 259350, badge = "287295", published = "23.10.2022 13:40:49", modified = "28.03.2025 16:43:49",
    trigger = getVillagerPicture(0x8B)
)

achievement(
    title = "Harrumph!", points = 5,
    description = "Obtain the Villager Picture of Chief.",
    set = achievementsetvillagerpictures,
    id = 259351, badge = "287296", published = "23.10.2022 13:40:49", modified = "28.03.2025 16:43:50",
    trigger = getVillagerPicture(0x8C)
)

achievement(
    title = "I'm always watching you!", points = 5,
    description = "Obtain the Villager Picture of Lobo.",
    set = achievementsetvillagerpictures,
    id = 259352, badge = "287297", published = "23.10.2022 13:40:49", modified = "28.03.2025 16:43:50",
    trigger = getVillagerPicture(0x8D)
)

achievement(
    title = "I could eat you for breakfast, short stack!", points = 5,
    description = "Obtain the Villager Picture of Wolfgang.",
    set = achievementsetvillagerpictures,
    id = 259353, badge = "287298", published = "23.10.2022 13:40:50", modified = "28.03.2025 16:43:50",
    trigger = getVillagerPicture(0x8E)
)

achievement(
    title = "If you THINK about me, just think about these pearly whites!", points = 5,
    description = "Obtain the Villager Picture of Whitney.",
    set = achievementsetvillagerpictures,
    id = 259354, badge = "287299", published = "23.10.2022 13:40:50", modified = "28.03.2025 16:43:50",
    trigger = getVillagerPicture(0x8F)
)

achievement(
    title = "You'll never get THIS monkey off your back!", points = 5,
    description = "Obtain the Villager Picture of Champ.",
    set = achievementsetvillagerpictures,
    id = 259355, badge = "287300", published = "23.10.2022 13:40:50", modified = "12.11.2022 10:15:49",
    trigger = getVillagerPicture(0x90)
)

achievement(
    title = "Pink is the new black!", points = 5,
    description = "Obtain the Villager Picture of Nana.",
    set = achievementsetvillagerpictures,
    id = 259356, badge = "287301", published = "23.10.2022 13:40:51", modified = "12.11.2022 10:15:49",
    trigger = getVillagerPicture(0x91)
)

achievement(
    title = "It's kind of a stereotype, but I really do love bananas!", points = 5,
    description = "Obtain the Villager Picture of Simon.",
    set = achievementsetvillagerpictures,
    id = 259357, badge = "287302", published = "23.10.2022 13:40:51", modified = "12.11.2022 10:15:50",
    trigger = getVillagerPicture(0x92)
)

achievement(
    title = "EEEEEEEEEEK!", points = 5,
    description = "Obtain the Villager Picture of Tammi.",
    set = achievementsetvillagerpictures,
    id = 259358, badge = "287303", published = "23.10.2022 13:40:51", modified = "12.11.2022 10:15:50",
    trigger = getVillagerPicture(0x93)
)

achievement(
    title = "What are YOU looking at?!", points = 5,
    description = "Obtain the Villager Picture of Monty.",
    set = achievementsetvillagerpictures,
    id = 259359, badge = "287304", published = "23.10.2022 13:40:52", modified = "12.11.2022 10:15:50",
    trigger = getVillagerPicture(0x94)
)

achievement(
    title = "If you are monkeying around, I'll scream!", points = 5,
    description = "Obtain the Villager Picture of Elise.",
    set = achievementsetvillagerpictures,
    id = 259360, badge = "287305", published = "23.10.2022 13:40:52", modified = "12.11.2022 10:15:51",
    trigger = getVillagerPicture(0x95)
)
