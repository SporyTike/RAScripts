// Super Mario 64
// #ID = 10003

//--------------------------------------------------

marioObject = tbyte(0x361158)

//--------------------------------------------------

liveObjectIDs = [
    [0x800EF15C, "1-Up (Butterfly)"],
    [0x800EF190, "1-Up (!-Block)"],
    [0x800EF1C4, "1-Up (Escape)"],
    [0x800EF1FC, "1-Up (Standing)"],
    [0x800EF26C, "1-Up (Hidden)"],
    [0x800EF2C8, "1-Up (Following)"],
]

//--------------------------------------------------

function checkMarioYAxis(yAxis) {
    return float(marioObject + 0xA4) <= yAxis
}

function getLiveID(name) {
    for id in liveObjectIDs {
        if (id[1] == name) {
            return id[0]
        }
    }
}

function collect1UPs(amount) {
    return tally(amount, collectedButterfly1UPv1(1), collectedButterfly1UPv2(1),
                         collectedButterfly1UPv1(2), collectedButterfly1UPv2(2),
                         collectedButterfly1UPv1(3), collectedButterfly1UPv2(3),
                         collectedButterfly1UPv1(4), collectedButterfly1UPv2(4),
                         collectedBlock1UPv1(1),     collectedBlock1UPv2(1),
                         collectedBlock1UPv1(2),     collectedBlock1UPv2(2),
                         collectedBlock1UPv1(3),     collectedBlock1UPv2(3),
                         collectedBlock1UPv1(4),     collectedBlock1UPv2(4),
                         collectedEscape1UPv1(1),    collectedEscape1UPv2(1),
                         collectedEscape1UPv1(2),    collectedEscape1UPv2(2),
                         collectedEscape1UPv1(3),    collectedEscape1UPv2(3),
                         collectedEscape1UPv1(4),    collectedEscape1UPv2(4),
                         collectedStanding1UPv1(1),  collectedStanding1UPv2(1),
                         collectedStanding1UPv1(2),  collectedStanding1UPv2(2),
                         collectedStanding1UPv1(3),  collectedStanding1UPv2(3),
                         collectedStanding1UPv1(4),  collectedStanding1UPv2(4),
                         collectedHidden1UPv1(1),    collectedHidden1UPv2(1),
                         collectedHidden1UPv1(2),    collectedHidden1UPv2(2),
                         collectedHidden1UPv1(3),    collectedHidden1UPv2(3),
                         collectedHidden1UPv1(4),    collectedHidden1UPv2(4),
                         collectedFollowing1UPv1(1), collectedFollowing1UPv2(1),
                         collectedFollowing1UPv1(2), collectedFollowing1UPv2(2),
                         collectedFollowing1UPv1(3), collectedFollowing1UPv2(3),
                         collectedFollowing1UPv1(4), collectedFollowing1UPv2(4))
}

// Butterfly 1-Up
function collectedButterfly1UPv1(touchSlot) {
    touchObject = tbyte(marioObject + 0x78 + (touchSlot - 1) * 4)
    return byte(marioObject + 0x74) >= touchSlot &&
           byte(marioObject + 0x74) <= 4 &&
           touchObject == prev(touchObject) &&
           byte(touchObject + 0x76) < prev(byte(touchObject + 0x76)) &&
           dword(touchObject + 0x20C) == getLiveID("1-Up (Butterfly)")
}

function collectedButterfly1UPv2(touchSlot) {
    touchObject = tbyte(marioObject + 0x78 + (touchSlot - 1) * 4)
    return byte(marioObject + 0x74) >= touchSlot &&
           byte(marioObject + 0x74) <= 4 &&
           touchObject != prev(touchObject) &&
           byte(touchObject + 0x76) == 0x00 &&
           dword(touchObject + 0x20C) == getLiveID("1-Up (Butterfly)")
}

// Mole 1-Up in TTM
function collectedButterfly1UPv1TTM(touchSlot, yAxis) {
    touchObject = tbyte(marioObject + 0x78 + (touchSlot - 1) * 4)
    return byte(marioObject + 0x74) >= touchSlot &&
           byte(marioObject + 0x74) <= 4 &&
           touchObject == prev(touchObject) &&
           byte(touchObject + 0x76) < prev(byte(touchObject + 0x76)) &&
           dword(touchObject + 0x20C) == getLiveID("1-Up (Butterfly)")
}

function collectedButterfly1UPv2TTM(touchSlot, yAxis) {
    touchObject = tbyte(marioObject + 0x78 + (touchSlot - 1) * 4)
    return byte(marioObject + 0x74) >= touchSlot &&
           byte(marioObject + 0x74) <= 4 &&
           touchObject != prev(touchObject) &&
           byte(touchObject + 0x76) == 0x00 &&
           dword(touchObject + 0x20C) == getLiveID("1-Up (Butterfly)")
}

// !-Block 1-Up
function collectedBlock1UPv1(touchSlot) {
    touchObject = tbyte(marioObject + 0x78 + (touchSlot - 1) * 4)
    return byte(marioObject + 0x74) >= touchSlot &&
           byte(marioObject + 0x74) <= 4 &&
           touchObject == prev(touchObject) &&
           byte(touchObject + 0x76) < prev(byte(touchObject + 0x76)) &&
           dword(touchObject + 0x20C) == getLiveID("1-Up (!-Block)")
}

function collectedBlock1UPv2(touchSlot) {
    touchObject = tbyte(marioObject + 0x78 + (touchSlot - 1) * 4)
    return byte(marioObject + 0x74) >= touchSlot &&
           byte(marioObject + 0x74) <= 4 &&
           touchObject != prev(touchObject) &&
           byte(touchObject + 0x76) == 0x00 &&
           dword(touchObject + 0x20C) == getLiveID("1-Up (!-Block)")
}

// Escape 1-Up
function collectedEscape1UPv1(touchSlot) {
    touchObject = tbyte(marioObject + 0x78 + (touchSlot - 1) * 4)
    return byte(marioObject + 0x74) >= touchSlot &&
           byte(marioObject + 0x74) <= 4 &&
           touchObject == prev(touchObject) &&
           byte(touchObject + 0x76) < prev(byte(touchObject + 0x76)) &&
           dword(touchObject + 0x20C) == getLiveID("1-Up (Escape)")
}

function collectedEscape1UPv2(touchSlot) {
    touchObject = tbyte(marioObject + 0x78 + (touchSlot - 1) * 4)
    return byte(marioObject + 0x74) >= touchSlot &&
           byte(marioObject + 0x74) <= 4 &&
           touchObject != prev(touchObject) &&
           byte(touchObject + 0x76) == 0x00 &&
           dword(touchObject + 0x20C) == getLiveID("1-Up (Escape)")
}

// Standing 1-UP
function collectedStanding1UPv1(touchSlot) {
    touchObject = tbyte(marioObject + 0x78 + (touchSlot - 1) * 4)
    return byte(marioObject + 0x74) >= touchSlot &&
           byte(marioObject + 0x74) <= 4 &&
           touchObject == prev(touchObject) &&
           byte(touchObject + 0x76) < prev(byte(touchObject + 0x76)) &&
           dword(touchObject + 0x20C) == getLiveID("1-Up (Standing)")
}

function collectedStanding1UPv2(touchSlot) {
    touchObject = tbyte(marioObject + 0x78 + (touchSlot - 1) * 4)
    return byte(marioObject + 0x74) >= touchSlot &&
           byte(marioObject + 0x74) <= 4 &&
           touchObject != prev(touchObject) &&
           byte(touchObject + 0x76) == 0x00 &&
           dword(touchObject + 0x20C) == getLiveID("1-Up (Standing)")
}

// Hidden 1-UP
function collectedHidden1UPv1(touchSlot) {
    touchObject = tbyte(marioObject + 0x78 + (touchSlot - 1) * 4)
    return byte(marioObject + 0x74) >= touchSlot &&
           byte(marioObject + 0x74) <= 4 &&
           touchObject == prev(touchObject) &&
           byte(touchObject + 0x76) < prev(byte(touchObject + 0x76)) &&
           dword(touchObject + 0x20C) == getLiveID("1-Up (Hidden)")
}

function collectedHidden1UPv2(touchSlot) {
    touchObject = tbyte(marioObject + 0x78 + (touchSlot - 1) * 4)
    return byte(marioObject + 0x74) >= touchSlot &&
           byte(marioObject + 0x74) <= 4 &&
           touchObject != prev(touchObject) &&
           byte(touchObject + 0x76) == 0x00 &&
           dword(touchObject + 0x20C) == getLiveID("1-Up (Hidden)")
}

// Following 1-UP
function collectedFollowing1UPv1(touchSlot) {
    touchObject = tbyte(marioObject + 0x78 + (touchSlot - 1) * 4)
    return byte(marioObject + 0x74) >= touchSlot &&
           byte(marioObject + 0x74) <= 4 &&
           touchObject == prev(touchObject) &&
           byte(touchObject + 0x76) < prev(byte(touchObject + 0x76)) &&
           dword(touchObject + 0x20C) == getLiveID("1-Up (Following)")
}

function collectedFollowing1UPv2(touchSlot) {
    touchObject = tbyte(marioObject + 0x78 + (touchSlot - 1) * 4)
    return byte(marioObject + 0x74) >= touchSlot &&
           byte(marioObject + 0x74) <= 4 &&
           touchObject != prev(touchObject) &&
           byte(touchObject + 0x76) == 0x00 &&
           dword(touchObject + 0x20C) == getLiveID("1-Up (Following)")
}

function blockRespawned1UPmoles() {
    return disable_when(tally(2, (prev(word(0x33B17C)) == 0x1924 || prev(word(0x33B17C)) == 0x1932) && word(0x33B17C) != prev(word(0x33B17C)) && byte(0x33BAC8) == 0x01), until = byte(0x32DDFA) != 36)
}

//--------------------------------------------------

achievement(
    title = "Lifesaver I", points = 3,
    description = "Collect three 1-UPs in Bob-omb Battlefield without leaving.",
    id = 126531, badge = "83297", published = "20.09.2020 19:23:03", modified = "24.05.2025 18:01:18",
    trigger = never(byte(0x32DDFA) != 9) && 
              measured(collect1UPs(3))
)

achievement(
    title = "Lifesaver II", points = 4,
    description = "Collect four 1-UPs in Whomp's Fortress without leaving.",
    id = 126532, badge = "83298", published = "20.09.2020 19:23:06", modified = "24.05.2025 18:01:19",
    trigger = never(byte(0x32DDFA) != 24) && 
              measured(collect1UPs(4))
)

achievement(
    title = "Lifesaver III", points = 2,
    description = "Collect two 1-UPs in Jolly Roger Bay without leaving.",
    id = 126533, badge = "83299", published = "20.09.2020 19:23:09", modified = "24.05.2025 18:01:19",
    trigger = never(byte(0x32DDFA) != 12) && 
              measured(collect1UPs(2))
)

achievement(
    title = "Lifesaver IV", points = 5,
    description = "Collect five 1-UPs in Cool, Cool Mountain without leaving.",
    id = 126534, badge = "83417", published = "20.09.2020 19:23:13", modified = "24.05.2025 18:01:19",
    trigger = never(byte(0x32DDFA) != 5) && 
              measured(collect1UPs(5))
)

achievement(
    title = "Lifesaver V", points = 2,
    description = "Collect two 1-UPs in Big Boo's Haunt without leaving.",
    id = 126535, badge = "83301", published = "20.09.2020 19:23:16", modified = "24.05.2025 18:01:20",
    trigger = never(byte(0x32DDFA) != 4) && 
              measured(collect1UPs(2))
)

achievement(
    title = "Lifesaver VI", points = 4,
    description = "Collect four 1-UPs in Hazy Maze Cave without leaving.",
    id = 126536, badge = "83302", published = "20.09.2020 19:23:19", modified = "24.05.2025 18:01:20",
    trigger = never(byte(0x32DDFA) != 7) && 
              measured(collect1UPs(4))
)

achievement(
    title = "Lifesaver VII", points = 5,
    description = "Collect eight 1-UPs in Lethal Lava Land without leaving.",
    id = 126537, badge = "83303", published = "20.09.2020 19:23:22", modified = "24.05.2025 18:01:20",
    trigger = never(byte(0x32DDFA) != 22) && 
              measured(collect1UPs(8))
)

achievement(
    title = "Lifesaver VIII", points = 10,
    description = "Collect nine 1-UPs in Shifting Sand Land without leaving.",
    id = 126538, badge = "89503", published = "20.09.2020 19:23:26", modified = "24.05.2025 18:01:20",
    trigger = never(byte(0x32DDFA) != 8) && 
              measured(collect1UPs(9))
)

achievement(
    title = "Lifesaver IX", points = 1,
    description = "Collect the 1-UP in Dire, Dire Docks.",
    id = 126539, badge = "83305", published = "20.09.2020 19:23:29", modified = "24.05.2025 18:01:21",
    trigger = never(byte(0x32DDFA) != 23) && 
              measured(collect1UPs(1))
)

achievement(
    title = "Lifesaver X", points = 4,
    description = "Collect four 1-UPs in Snowman's Land without leaving.",
    id = 126540, badge = "83306", published = "20.09.2020 19:23:33", modified = "24.05.2025 18:01:22",
    trigger = never(byte(0x32DDFA) != 10) && 
              measured(collect1UPs(4))
)

achievement(
    title = "Lifesaver XI", points = 4,
    description = "Collect four 1-UPs in Wet-Dry World without leaving.",
    id = 126541, badge = "83307", published = "20.09.2020 19:23:36", modified = "24.05.2025 18:01:22",
    trigger = never(byte(0x32DDFA) != 11) && 
              measured(collect1UPs(4))
)

achievement(
    title = "Lifesaver XII", points = 10,
    description = "Collect eleven unique 1-UPs in Tall, Tall Mountain without loading the outside more than once.",
    id = 126542, badge = "83308", published = "20.09.2020 19:23:40", modified = "22.10.2025 17:38:25",
    trigger = never(byte(0x32DDFA) != 36) && 
              measured(collect1UPs(11)) &&
              blockRespawned1UPmoles()
)

achievement(
    title = "Lifesaver XIII", points = 10,
    description = "Collect ten 1-UPs in Tiny-Huge Island without leaving.",
    id = 126543, badge = "83309", published = "20.09.2020 19:23:44", modified = "24.05.2025 18:01:23",
    trigger = never(byte(0x32DDFA) != 13) && 
              measured(collect1UPs(10))
)

achievement(
    title = "Lifesaver XIV", points = 4,
    description = "Collect four 1-UPs in Tick Tock Clock without leaving.",
    id = 126544, badge = "83310", published = "20.09.2020 19:23:47", modified = "24.05.2025 18:01:23",
    trigger = never(byte(0x32DDFA) != 14) && 
              measured(collect1UPs(4))
)

achievement(
    title = "Lifesaver XV", points = 25,
    description = "Collect nine 1-UPs in Rainbow Ride without leaving.",
    id = 126545, badge = "89504", published = "20.09.2020 19:23:50", modified = "24.05.2025 18:01:23",
    trigger = never(byte(0x32DDFA) != 15) && 
              measured(collect1UPs(9))
)

achievement(
    title = "Lifesaver Vanish", points = 4,
    description = "Collect four 1-UPs in Vanish Cap Under the Moat without leaving.",
    id = 126546, badge = "83312", published = "20.09.2020 19:23:54", modified = "24.05.2025 18:01:23",
    trigger = never(byte(0x32DDFA) != 18) && 
              measured(collect1UPs(4))
)

achievement(
    title = "Lifesaver Metal", points = 2,
    description = "Collect two 1-UPs in Cavern of the Metal Cap without leaving.",
    id = 126547, badge = "83313", published = "20.09.2020 19:23:57", modified = "24.05.2025 18:01:24",
    trigger = never(byte(0x32DDFA) != 28) && 
              measured(collect1UPs(2))
)

achievement(
    title = "Lifesaver Slide", points = 2,
    description = "Collect two 1-UPs in The Princess's Secret Slide without leaving.",
    id = 126548, badge = "83321", published = "20.09.2020 19:24:00", modified = "24.05.2025 18:01:24",
    trigger = never(byte(0x32DDFA) != 27) && 
              measured(collect1UPs(2))
)

achievement(
    title = "Lifesaver Aquarium", points = 1,
    description = "Collect the 1-UP in The Secret Aquarium.",
    id = 126549, badge = "83315", published = "20.09.2020 19:24:03", modified = "24.05.2025 18:01:24",
    trigger = never(byte(0x32DDFA) != 20) && 
              measured(collect1UPs(1))
)

achievement(
    title = "Lifesaver Rainbow", points = 4,
    description = "Collect four 1-UPs in Wing Mario over the Rainbow without leaving.",
    id = 126550, badge = "83316", published = "20.09.2020 19:24:06", modified = "24.05.2025 18:01:25",
    trigger = never(byte(0x32DDFA) != 31) && 
              measured(collect1UPs(4))
)

achievement(
    title = "Lifesaver Dark", points = 5,
    description = "Collect six 1-UPs in Bowser in the Dark World without leaving.",
    id = 126551, badge = "83317", published = "20.09.2020 19:24:10", modified = "24.05.2025 18:01:25",
    trigger = never(byte(0x32DDFA) != 17) && 
              measured(collect1UPs(6))
)

achievement(
    title = "Lifesaver Fire", points = 10,
    description = "Collect seven 1-UPs in Bowser in the Fire Sea without leaving.",
    id = 126552, badge = "83318", published = "20.09.2020 19:24:13", modified = "24.05.2025 18:01:25",
    trigger = never(byte(0x32DDFA) != 19) && 
              measured(collect1UPs(7))
)

achievement(
    title = "Lifesaver Sky", points = 10,
    description = "Collect six 1-UPs in Bowser in the Sky without leaving.",
    id = 126553, badge = "83319", published = "20.09.2020 19:24:15", modified = "24.05.2025 18:01:25",
    trigger = never(byte(0x32DDFA) != 21) && 
              measured(collect1UPs(6))
)

achievement(
    title = "Lifesaver Inside", points = 2,
    description = "Collect two 1-UPs inside the Castle without leaving.",
    id = 126554, badge = "83320", published = "20.09.2020 19:24:19", modified = "24.05.2025 18:01:43",
    trigger = never(byte(0x32DDFA) != 6) && 
              measured(collect1UPs(2))
)

achievement(
    title = "Lifesaver Outside", points = 5,
    description = "Collect seven 1-UPs outside the Castle without leaving.",
    id = 126555, badge = "83329", published = "20.09.2020 19:24:22", modified = "14.10.2025 18:29:57",
    trigger = never(byte(0x32DDFA) != 16) && 
              measured(collect1UPs(7)) &&
              never((prev(byte(0x33B21E)) == 0 && byte(0x33B21E) == 4))
)
