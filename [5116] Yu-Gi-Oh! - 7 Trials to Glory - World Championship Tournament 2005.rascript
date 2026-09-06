// Yu-Gi-Oh! 7 Trials to Glory: World Championship Tournament 2005
// #ID = 5116

//----------------------------------------
// Addresses

mem_CardData    = 0x008008
mem_DuelPoints  = 0x009808
mem_RoomID      = 0x020872

//----------------------------------------
// Functions

function checkPasswordUsed(cardID) {
    cardOffset = (cardID - 1) * 0x04
    return bit2(mem_CardData + cardOffset) > prev(bit2(mem_CardData + cardOffset))
}

function checkAnyPasswordUsed() {
    code = always_false()
    for card in range(1, 1000) {
        code = code || checkPasswordUsed(card)
    }
    return __ornext(code)
}

function getRoomID() {
    return word(mem_RoomID)
}

function getDuelPoints() {
    return dword(mem_DuelPoints)
}

//----------------------------------------
// Achievements

achievement(
    title = "Cheater", points = 2,
    description = "Buy a card from a password machine",
    id = 32554, badge = "33329",
    trigger = getRoomID() == 0x03 &&
              getRoomID() == prev(getRoomID()) &&
              getDuelPoints() == prev(getDuelPoints()) &&
              checkAnyPasswordUsed()
)