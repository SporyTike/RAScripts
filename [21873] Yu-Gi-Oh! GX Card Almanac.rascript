// Yu-Gi-Oh! GX: Card Almanac
// #ID = 21873

// 21873 - Yu-Gi-Oh! GX: Card Almanac
// 17744 - Yu-Gi-Oh! GX: Spirit Caller

// ~350 Combos

//--------------------------------------------------
// Addresses
gameID = 0x003FFE0C

// Yu-Gi-Oh! GX Spirit Caller (EU)
AYXP_cardDataSize               = 20
AYXP_battleState                = 0x00104C4C
AYXP_currentPlayerTurn          = 0x002D0E58
AYXP_playerMonsterZoneStart     = 0x002CF19C
AYXP_playerSpellTrapZoneStart   = AYXP_playerMonsterZoneStart   + 5 * AYXP_cardDataSize
AYXP_playerFieldZone            = AYXP_playerSpellTrapZoneStart + 5 * AYXP_cardDataSize
AYXP_opponentMonsterZoneStart   = 0x002CFA04
AYXP_opponentSpellTrapZoneStart = AYXP_opponentMonsterZoneStart   + 5 * AYXP_cardDataSize
AYXP_opponentFieldZone          = AYXP_opponentSpellTrapZoneStart + 5 * AYXP_cardDataSize
AYXP_CardSelectedFromDeck       = 0x002D11CC
AYXP_CardAmountInHand           = 0x002CF178
AYXP_chainLayer                 = 0x002CE708
AYXP_chainPointer               = AYXP_chainLayer + 0x0C
AYXP_chainDataSize              = 24
AYXP_cardEffectChainDataStart   = 0x002D0658

//--------------------------------------------------
// Arrays and Dictionaries

// Game ID, Game ID in Hex, Game Name, Version
gameIDs = [
    ["AYGE", 0x41594745, "Yu-Gi-Oh! Nightmare Troubadour", "US"],
    ["AYGJ", 0x4159474A, "Yu-Gi-Oh! Nightmare Troubadour", "JP"],
    ["AYGP", 0x41594750, "Yu-Gi-Oh! Nightmare Troubadour", "EU"],
    
    ["AY7E", 0x41593745, "Yu-Gi-Oh! World Championship 2007", "US"],
    ["AY7J", 0x4159374A, "Yu-Gi-Oh! World Championship 2007", "JP"],
    ["AY7P", 0x41593750, "Yu-Gi-Oh! World Championship 2007", "EU"],
    
    ["AY8E", 0x59473845, "Yu-Gi-Oh! World Championship 2008", "US"],
    ["AY8J", 0x5947384A, "Yu-Gi-Oh! World Championship 2008", "JP"],
    ["AY8P", 0x59473850, "Yu-Gi-Oh! World Championship 2008", "EU"],
    
    ["AY3J", 0x4159334A, "Yu-Gi-Oh! GX Card Almanac", "JP"],
    ["AY3P", 0x41593350, "Yu-Gi-Oh! GX Card Almanac", "EU"],
    
    ["AYXE", 0x41595845, "Yu-Gi-Oh! GX Spirit Caller", "US"],
    ["AYXJ", 0x4159584A, "Yu-Gi-Oh! GX Spirit Caller", "JP"],
    ["AYXP", 0x41595850, "Yu-Gi-Oh! GX Spirit Caller", "EU"],
    
    ["CY8E", 0x43593845, "Yu-Gi-Oh! 5D's World Championship 2009 - Stardust Accelerator", "US"],
    ["CY8J", 0x4359384A, "Yu-Gi-Oh! 5D's World Championship 2009 - Stardust Accelerator", "JP"],
    ["CY8K", 0x4359384B, "Yu-Gi-Oh! 5D's World Championship 2009 - Stardust Accelerator", "KR"],
    ["CY8P", 0x43593850, "Yu-Gi-Oh! 5D's World Championship 2009 - Stardust Accelerator", "EU"],
        
    ["BYXE", 0x42595845, "Yu-Gi-Oh! 5D's World Championship 2010 - Reverse of Arcadia", "US"],
    ["BYXJ", 0x4259584A, "Yu-Gi-Oh! 5D's World Championship 2010 - Reverse of Arcadia", "JP"],
    ["BYXK", 0x4259584B, "Yu-Gi-Oh! 5D's World Championship 2010 - Reverse of Arcadia", "KR"],
    ["BYXP", 0x42595850, "Yu-Gi-Oh! 5D's World Championship 2010 - Reverse of Arcadia", "EU"],
    
    ["BYYE", 0x42595945, "Yu-Gi-Oh! 5D's World Championship 2011 - Over the Nexus", "US"],
    ["BYYJ", 0x4259594A, "Yu-Gi-Oh! 5D's World Championship 2011 - Over the Nexus", "JP"],
    ["BYYK", 0x4259594B, "Yu-Gi-Oh! 5D's World Championship 2011 - Over the Nexus", "KR"],
    ["BYYP", 0x42595950, "Yu-Gi-Oh! 5D's World Championship 2011 - Over the Nexus", "EU"],
]

//--------------------------------------------------
// Functions

function getGame(gameString) {
    return unless(!ascii_string_equals(gameID, gameString))
}

// Yu-Gi-Oh! GX Spirit Caller (EU)
function AYXP_InBattle() {
    return never(dword(AYXP_battleState) == 0)
}

function AYXP_PlayerZone_CardSlot(zoneSlot) {
    return (zoneSlot - 1) * AYXP_cardDataSize
}

function AYXP_CheckCardID(address) {
    return word(address) & 0x1FFF
}

function AYXP_TurnChange() {
    return byte(AYXP_currentPlayerTurn) != prev(byte(AYXP_currentPlayerTurn))
}

function AYXP_CheckCardPosition(address) {
    address = address + 0x06
    return bit0(address)
    // Returns 0 if 'ATK'
    // Returns 1 if 'DEF'
}

function AYXP_CheckFacePosition(address) {
    address = address + 0x08
    return bit0(address)
    // Returns 0 if 'Down'
    // Returns 1 if 'Up'
}

function AYXP_MonsterZone_CardID(player, zoneSlot) {
    if (player == "Player") {
        address = AYXP_playerMonsterZoneStart
    }
    if (player == "Opponent") {
        address = AYXP_opponentMonsterZoneStart
    }
    address = address + AYXP_PlayerZone_CardSlot(zoneSlot)
    return AYXP_CheckCardID(address)
}

function AYXP_MonsterZone_FacePosition(player, zoneSlot) {
    if (player == "Player") {
        address = AYXP_playerMonsterZoneStart
    }
    if (player == "Opponent") {
        address = AYXP_opponentMonsterZoneStart
    }
    address = address + AYXP_PlayerZone_CardSlot(zoneSlot)
    return AYXP_CheckFacePosition(address)
    // Returns 0 if 'Down'
    // Returns 1 if 'Up'
}

function AYXP_MonsterZone_MonsterAttacked(player, zoneSlot) {
    if (player == "Player") {
        address = AYXP_playerMonsterZoneStart
    }
    if (player == "Opponent") {
        address = AYXP_opponentMonsterZoneStart
    }
    address = address + AYXP_PlayerZone_CardSlot(zoneSlot) + 0x12
    return bit6(address)
    // Returns 0 if not attacked this turn
    // Returns 1 if attacked this turn
}

function AYXP_MonsterZone_BattlePosition(player, zoneSlot) {
    if (player == "Player") {
        address = AYXP_playerMonsterZoneStart
    }
    if (player == "Opponent") {
        address = AYXP_opponentMonsterZoneStart
    }
    address = address + AYXP_PlayerZone_CardSlot(zoneSlot)
    return AYXP_CheckCardPosition(address)
    // Returns 0 if 'ATK'
    // Returns 1 if 'DEF'
}

function AYXP_CardEffectLayer(chainAddress, layer) {
    effectAddress = (word(chainAddress) - 1) * 8 + AYXP_cardEffectChainDataStart

    if (layer > 1) {
        for i in range(1, layer - 1) {
            effectAddress = (word(effectAddress + 0x06) - 1) * 8 + AYXP_cardEffectChainDataStart
        }
    }
    
    return effectAddress
}

function AYXP_MonsterZone_EffectApplied_TargetCardID(monsterPlayer, zoneSlot, layer) {
    if (monsterPlayer == "Player") {
        address = AYXP_playerMonsterZoneStart
    }
    if (monsterPlayer == "Opponent") {
        address = AYXP_opponentMonsterZoneStart
    }
    
    zoneOffset = AYXP_MonsterZone_EffectApplied_PlayerOwningCardEffect(monsterPlayer, zoneSlot, layer) * (AYXP_opponentMonsterZoneStart - AYXP_playerMonsterZoneStart)
               + address
    
    address = address + AYXP_PlayerZone_CardSlot(zoneSlot) + 0x0A
    address = zoneOffset + byte(AYXP_CardEffectLayer(address, layer) + 0x01) * AYXP_cardDataSize
    
    return AYXP_CheckCardID(address)
}

function AYXP_MonsterZone_EffectApplied_PlayerOwningCardEffect(monsterPlayer, zoneSlot, layer) {
    if (monsterPlayer == "Player") {
        zoneAddress = AYXP_playerMonsterZoneStart
    }
    if (monsterPlayer == "Opponent") {
        zoneAddress = AYXP_opponentMonsterZoneStart
    }
    
    address = zoneAddress + AYXP_PlayerZone_CardSlot(zoneSlot) + 0x0A
    address = AYXP_CardEffectLayer(address, layer)
    
    return byte(address)
    // Returns 0 if Card Effect comes from Player's Card
    // Returns 1 if Card Effect comes from Opponent's Card
}

function AYXP_SpellTrapZone_CardID(player, zoneSlot) {
    if (player == "Player") {
        address = AYXP_playerSpellTrapZoneStart
    }
    if (player == "Opponent") {
        address = AYXP_opponentSpellTrapZoneStart
    }
    address = address + AYXP_PlayerZone_CardSlot(zoneSlot)
    return AYXP_CheckCardID(address)
}

function AYXP_SpellTrapZone_FacePosition(player, zoneSlot) {
    if (player == "Player") {
        address = AYXP_playerSpellTrapZoneStart
    }
    if (player == "Opponent") {
        address = AYXP_opponentSpellTrapZoneStart
    }
    address = address + AYXP_PlayerZone_CardSlot(zoneSlot)
    return AYXP_CheckFacePosition(address)
}

function AYXP_SpellTrapZone_DNAType(player, zoneSlot) {
    if (player == "Player") {
        address = AYXP_playerSpellTrapZoneStart
    }
    if (player == "Opponent") {
        address = AYXP_opponentSpellTrapZoneStart
    }
    address = address + AYXP_PlayerZone_CardSlot(zoneSlot) + 0x0C
    return AYXP_CheckCardID(address)
}

function AYXP_FieldZone_CardID(player) {
    if (player == "Player") {
        address = AYXP_playerFieldZone
    }
    if (player == "Opponent") {
        address = AYXP_opponentFieldZone
    }
    return AYXP_CheckCardID(address)
}

function AYXP_FieldZone_FacePosition(player) {
    if (player == "Player") {
        address = AYXP_playerFieldZone
    }
    if (player == "Opponent") {
        address = AYXP_opponentFieldZone
    }
    return AYXP_CheckFacePosition(address)
    // Returns 0 if 'Down'
    // Returns 1 if 'Up'
}

function AYXP_CardIDFromDeck() {
    return AYXP_CheckCardID(AYXP_CardSelectedFromDeck)
}

function AYXP_CheckChainLayer() {
    return tbyte(AYXP_chainPointer) + (dword(AYXP_chainLayer) - 1) * AYXP_chainDataSize
}

function AYXP_Chain_CardID() {
    return word(AYXP_CheckChainLayer()) & 0x1FFF
}

function AYXP_Chain_PlayerResponsible(player) {
    address = AYXP_CheckChainLayer() + 0x02
    if (player == "Player") {
        return bit0(address) == 0
    }
    if (player == "Opponent") {
        return bit0(address) == 1
    }
}

function AYXP_Chain_TargetCardID(offset) {
    return AYXP_CheckCardID(AYXP_CheckChainLayer() + 0x08 + offset)
}

function AYXP_Chain_TargetCardIDBySlot_MonsterZone(offset, player) {
    if (player == "Player") {
        address = AYXP_playerMonsterZoneStart
    }
    if (player == "Opponent") {
        address = AYXP_opponentMonsterZoneStart
    }
    return AYXP_CheckCardID((low4(AYXP_CheckChainLayer() + 0x08 + offset) / 2) * AYXP_cardDataSize + address)
}

//--------------------------------------------------
// Achievements

// 003) Adamant Shield
achievement(
    title = "Adamant Shield", type = "progression",
    description = "Force your 'Big Shield Gardna' into Defense-position by having 'Level Limit - Area B' active in your Spell & Trap Zone.",
    id = 484377, badge = "549292", points = 2,
    trigger = (getGame("AYXP") &&
               AYXP_InBattle() &&
                __ornext((
                    AYXP_MonsterZone_CardID("Player", 1)                                            // Card is 'Big Shield Gardna'
                    + AYXP_MonsterZone_BattlePosition("Player", 1)       * 0x00010000               // Card is in Defense Position
                    + prev(AYXP_MonsterZone_BattlePosition("Player", 1)) * 0x01000000 == 0x0001129C // Card was in Attack Position
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 2)
                    + AYXP_MonsterZone_BattlePosition("Player", 2)       * 0x00010000
                    + prev(AYXP_MonsterZone_BattlePosition("Player", 2)) * 0x01000000 == 0x0001129C
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 3)
                    + AYXP_MonsterZone_BattlePosition("Player", 3)       * 0x00010000
                    + prev(AYXP_MonsterZone_BattlePosition("Player", 3)) * 0x01000000 == 0x0001129C
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 4)
                    + AYXP_MonsterZone_BattlePosition("Player", 4)       * 0x00010000
                    + prev(AYXP_MonsterZone_BattlePosition("Player", 4)) * 0x01000000 == 0x0001129C
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 5)
                    + AYXP_MonsterZone_BattlePosition("Player", 5)       * 0x00010000
                    + prev(AYXP_MonsterZone_BattlePosition("Player", 5)) * 0x01000000 == 0x0001129C
                 )) &&
                  __ornext((
                    AYXP_SpellTrapZone_CardID("Player", 1)                                    // Card is 'Level Limit - Area B'
                    + AYXP_SpellTrapZone_FacePosition("Player", 1) * 0x00010000 == 0x000117A6 // Card is Face-Up Position
                 ) || (
                    AYXP_SpellTrapZone_CardID("Player", 2)
                    + AYXP_SpellTrapZone_FacePosition("Player", 2) * 0x00010000 == 0x000117A6
                 ) || (
                    AYXP_SpellTrapZone_CardID("Player", 3)
                    + AYXP_SpellTrapZone_FacePosition("Player", 3) * 0x00010000 == 0x000117A6
                 ) || (
                    AYXP_SpellTrapZone_CardID("Player", 4)
                    + AYXP_SpellTrapZone_FacePosition("Player", 4) * 0x00010000 == 0x000117A6
                 ) || (
                    AYXP_SpellTrapZone_CardID("Player", 5)
                    + AYXP_SpellTrapZone_FacePosition("Player", 5) * 0x00010000 == 0x000117A6
                 ))
              )
)

// 004) Age of Dinosaurs
achievement(
    title = "Age of Dinosaurs", type = "progression",
    description = "Destroy 'Babycerasaurus' using the effect of 'Generation Shift' to get a second 'Babycerasaurus' on your Hand and special summon a Dinosaur-type monster in your Monster Zone.",
    id = 554340, badge = "629434", points = 2,
    trigger = (getGame("AYXP") &&
               AYXP_InBattle() &&
                (once(AYXP_Chain_PlayerResponsible("Player") &&
                      AYXP_Chain_CardID() == 0x19DD &&        // Card is 'Generation Shift'
                      AYXP_Chain_TargetCardID(2) == 0x1A8F && // Card Target is 'Babycerasaurus'
                      never(AYXP_TurnChange())) &&
                 AYXP_Chain_CardID() == 0x1A8F                // Card is 'Babycerasaurus'
                )
              )
)

// 006) Amazoness' Toll
achievement(
    title = "Amazoness' Toll", type = "progression",
    description = "While having 'Amazoness Paladin' in your Monster Zone and 'Toll' active in your Spell & Trap Zone, use 'Ojama Trio' to fill the opponent's Monster Zone with tokens and activate 'Amazoness Archers' and force the tokens to attack.",
    id = 554652, badge = "629864", points = 5,
    trigger = (getGame("AYXP") &&
               AYXP_InBattle() &&
                ((once(AYXP_Chain_PlayerResponsible("Player") &&
                       AYXP_Chain_CardID() == 0x14A6 &&   // Card is 'Amazoness Archers'
                  once(AYXP_Chain_PlayerResponsible("Player") &&
                       AYXP_Chain_CardID() == 0x166A)) && // Card is 'Ojama Trio'
                  always_true()) &&
                __ornext((
                   AYXP_SpellTrapZone_CardID("Player", 1)                                 // Card is 'Toll'
                   + AYXP_SpellTrapZone_FacePosition("Player", 1) * 0x10000 == 0x00011320 // Card is Face-Up Position
                ) || (
                   AYXP_SpellTrapZone_CardID("Player", 2)
                   + AYXP_SpellTrapZone_FacePosition("Player", 2) * 0x10000 == 0x00011320
                ) || (
                   AYXP_SpellTrapZone_CardID("Player", 3)
                   + AYXP_SpellTrapZone_FacePosition("Player", 3) * 0x10000 == 0x00011320
                ) || (
                   AYXP_SpellTrapZone_CardID("Player", 4)
                   + AYXP_SpellTrapZone_FacePosition("Player", 4) * 0x10000 == 0x00011320
                ) || (
                   AYXP_SpellTrapZone_CardID("Player", 5)
                   + AYXP_SpellTrapZone_FacePosition("Player", 5) * 0x10000 == 0x00011320
                )) &&
                ((
                   AYXP_MonsterZone_CardID("Player", 1)                                 // Card is 'Amazoness Paladin'                                                                              
                   + AYXP_MonsterZone_FacePosition("Player", 1) * 0x10000 == 0x0001160D // Card is Face-Up Position
                ) || (
                   AYXP_MonsterZone_CardID("Player", 2)
                   + AYXP_MonsterZone_FacePosition("Player", 2) * 0x10000 == 0x0001160D 
                ) || (
                   AYXP_MonsterZone_CardID("Player", 3)
                   + AYXP_MonsterZone_FacePosition("Player", 3) * 0x10000 == 0x0001160D 
                ) || (
                   AYXP_MonsterZone_CardID("Player", 4)
                   + AYXP_MonsterZone_FacePosition("Player", 4) * 0x10000 == 0x0001160D 
                ) || (
                   AYXP_MonsterZone_CardID("Player", 5)
                   + AYXP_MonsterZone_FacePosition("Player", 5) * 0x10000 == 0x0001160D 
                )) &&
                ((                                                       // Logic if 'Ojama Token' attacks and gets destroyed
                   prev(AYXP_MonsterZone_CardID("Opponent", 1))                        // Card was 'Ojama Token (Green)'
                   + AYXP_MonsterZone_CardID("Opponent", 1) * 0x00010000 == 0x00001670 // Card is not existing
                ) || (
                   prev(AYXP_MonsterZone_CardID("Opponent", 1))                        // Card was 'Ojama Token (Yellow)'
                   + AYXP_MonsterZone_CardID("Opponent", 1) * 0x00010000 == 0x00001671 // Card is not existing
                ) || (
                   prev(AYXP_MonsterZone_CardID("Opponent", 1))                        // Card was 'Ojama Token (Black)'
                   + AYXP_MonsterZone_CardID("Opponent", 1) * 0x00010000 == 0x00001672 // Card is not existing
                ) || (
                   prev(AYXP_MonsterZone_CardID("Opponent", 2))
                   + AYXP_MonsterZone_CardID("Opponent", 2) * 0x00010000 == 0x00001670 
                ) || (
                   prev(AYXP_MonsterZone_CardID("Opponent", 2))
                   + AYXP_MonsterZone_CardID("Opponent", 2) * 0x00010000 == 0x00001671
                ) || (
                   prev(AYXP_MonsterZone_CardID("Opponent", 2))
                   + AYXP_MonsterZone_CardID("Opponent", 2) * 0x00010000 == 0x00001672 
                ) || (
                   prev(AYXP_MonsterZone_CardID("Opponent", 3))
                   + AYXP_MonsterZone_CardID("Opponent", 3) * 0x00010000 == 0x00001670 
                ) || (
                   prev(AYXP_MonsterZone_CardID("Opponent", 3))
                   + AYXP_MonsterZone_CardID("Opponent", 3) * 0x00010000 == 0x00001671 
                ) || (
                   prev(AYXP_MonsterZone_CardID("Opponent", 3))
                   + AYXP_MonsterZone_CardID("Opponent", 3) * 0x00010000 == 0x00001672 
                ) || (
                   prev(AYXP_MonsterZone_CardID("Opponent", 4))
                   + AYXP_MonsterZone_CardID("Opponent", 4) * 0x00010000 == 0x00001670 
                ) || (
                   prev(AYXP_MonsterZone_CardID("Opponent", 4))
                   + AYXP_MonsterZone_CardID("Opponent", 4) * 0x00010000 == 0x00001671 
                ) || (
                   prev(AYXP_MonsterZone_CardID("Opponent", 4))
                   + AYXP_MonsterZone_CardID("Opponent", 4) * 0x00010000 == 0x00001672 
                ) || (
                   prev(AYXP_MonsterZone_CardID("Opponent", 5))
                   + AYXP_MonsterZone_CardID("Opponent", 5) * 0x00010000 == 0x00001670 
                ) || (
                   prev(AYXP_MonsterZone_CardID("Opponent", 5))
                   + AYXP_MonsterZone_CardID("Opponent", 5) * 0x00010000 == 0x00001671
                ) || (
                   prev(AYXP_MonsterZone_CardID("Opponent", 5))
                   + AYXP_MonsterZone_CardID("Opponent", 5) * 0x00010000 == 0x00001672 
                ) || (                                                                  // Logic if 'Ojama Token' attacks and stays alive                                                                                      
                   AYXP_MonsterZone_CardID("Opponent", 1)                                             // Card is 'Ojama Token (Green)'
                   + AYXP_MonsterZone_MonsterAttacked("Opponent", 1)       * 0x00010000               // Card is not able attack
                   + prev(AYXP_MonsterZone_MonsterAttacked("Opponent", 1)) * 0x01000000 == 0x00011670 // Card was able attack
                ) || (
                   AYXP_MonsterZone_CardID("Opponent", 1)                                             // Card is 'Ojama Token (Yellow)'
                   + AYXP_MonsterZone_MonsterAttacked("Opponent", 1)       * 0x00010000               // Card is not able attack
                   + prev(AYXP_MonsterZone_MonsterAttacked("Opponent", 1)) * 0x01000000 == 0x00011671 // Card was able attack
                ) || (
                   AYXP_MonsterZone_CardID("Opponent", 1)                                             // Card is 'Ojama Token (Black)'
                   + AYXP_MonsterZone_MonsterAttacked("Opponent", 1)       * 0x00010000               // Card is not able attack
                   + prev(AYXP_MonsterZone_MonsterAttacked("Opponent", 1)) * 0x01000000 == 0x00011672 // Card was able attack
                ) || (
                   AYXP_MonsterZone_CardID("Opponent", 2)
                   + AYXP_MonsterZone_MonsterAttacked("Opponent", 2)       * 0x00010000
                   + prev(AYXP_MonsterZone_MonsterAttacked("Opponent", 2)) * 0x01000000 == 0x00011670
                ) || (
                   AYXP_MonsterZone_CardID("Opponent", 2)
                   + AYXP_MonsterZone_MonsterAttacked("Opponent", 2)       * 0x00010000
                   + prev(AYXP_MonsterZone_MonsterAttacked("Opponent", 2)) * 0x01000000 == 0x00011671
                ) || (
                   AYXP_MonsterZone_CardID("Opponent", 2)
                   + AYXP_MonsterZone_MonsterAttacked("Opponent", 2)       * 0x00010000
                   + prev(AYXP_MonsterZone_MonsterAttacked("Opponent", 2)) * 0x01000000 == 0x00011672 
                ) || (
                   AYXP_MonsterZone_CardID("Opponent", 3)
                   + AYXP_MonsterZone_MonsterAttacked("Opponent", 3)       * 0x00010000
                   + prev(AYXP_MonsterZone_MonsterAttacked("Opponent", 3)) * 0x01000000 == 0x00011670 
                ) || (
                   AYXP_MonsterZone_CardID("Opponent", 3)
                   + AYXP_MonsterZone_MonsterAttacked("Opponent", 3)       * 0x00010000
                   + prev(AYXP_MonsterZone_MonsterAttacked("Opponent", 3)) * 0x01000000 == 0x00011671 
                ) || (
                   AYXP_MonsterZone_CardID("Opponent", 3)
                   + AYXP_MonsterZone_MonsterAttacked("Opponent", 3)       * 0x00010000
                   + prev(AYXP_MonsterZone_MonsterAttacked("Opponent", 3)) * 0x01000000 == 0x00011672
                ) || (
                   AYXP_MonsterZone_CardID("Opponent", 4)
                   + AYXP_MonsterZone_MonsterAttacked("Opponent", 4)       * 0x00010000
                   + prev(AYXP_MonsterZone_MonsterAttacked("Opponent", 4)) * 0x01000000 == 0x00011670 
                ) || (
                   AYXP_MonsterZone_CardID("Opponent", 4)
                   + AYXP_MonsterZone_MonsterAttacked("Opponent", 4)       * 0x00010000
                   + prev(AYXP_MonsterZone_MonsterAttacked("Opponent", 4)) * 0x01000000 == 0x00011671
                ) || (
                   AYXP_MonsterZone_CardID("Opponent", 4)
                   + AYXP_MonsterZone_MonsterAttacked("Opponent", 4)       * 0x00010000
                   + prev(AYXP_MonsterZone_MonsterAttacked("Opponent", 4)) * 0x01000000 == 0x00011672 
                ) || (
                   AYXP_MonsterZone_CardID("Opponent", 5)
                   + AYXP_MonsterZone_MonsterAttacked("Opponent", 5)       * 0x00010000
                   + prev(AYXP_MonsterZone_MonsterAttacked("Opponent", 5)) * 0x01000000 == 0x00011670
                ) || (
                   AYXP_MonsterZone_CardID("Opponent", 5)
                   + AYXP_MonsterZone_MonsterAttacked("Opponent", 5)       * 0x00010000
                   + prev(AYXP_MonsterZone_MonsterAttacked("Opponent", 5)) * 0x01000000 == 0x00011671 
                ) || (
                   AYXP_MonsterZone_CardID("Opponent", 5)
                   + AYXP_MonsterZone_MonsterAttacked("Opponent", 5)       * 0x00010000
                   + prev(AYXP_MonsterZone_MonsterAttacked("Opponent", 5)) * 0x01000000 == 0x00011672
                ))
            )
        )
)

// 007) Ameba Encroachme
achievement(
    title = "Ameba Encroachme", type = "progression",
    description = "Move your 'Ameba' to the opponent's Monster Zone using 'Mystical Box' to deal effect damage.",
    id = 554659, badge = "629872", points = 2,
    trigger = (getGame("AYXP") &&
               AYXP_InBattle() &&
                (once(AYXP_Chain_PlayerResponsible("Player") &&
                      AYXP_Chain_CardID() == 0x1430 && // Card is 'Mystic Box'
                      AYXP_Chain_TargetCardIDBySlot_MonsterZone(2, "Player") == 0x118A && // Card Target is 'Ameba'
                      never(AYXP_TurnChange()))
                ) &&
                AYXP_Chain_PlayerResponsible("Opponent") &&
                AYXP_Chain_CardID() == 0x118A // Card is 'Ameba'
              )
)

// 012) Area: Mataza
achievement(
    title = "Area: Mataza", type = "progression",
    description = "Equip your 'Mataza the Zapper' with 'Mage Power' while having 'Level Limit - Area B' active in your Spell & Trap Zone.",
    id = 555594, badge = "631018", points = 2,
    trigger = (getGame("AYXP") &&
               AYXP_InBattle() &&
               __ornext((
                    AYXP_MonsterZone_CardID("Player", 1)                                                               // Card is 'Mataza the Zapper'
                    + AYXP_MonsterZone_FacePosition("Player", 1) * 0x00008000                                          // Card is Face-Up Position
                    + AYXP_MonsterZone_EffectApplied_TargetCardID("Player", 1, 1) * 0x00010000                         // Card equipped is 'Mage Power'
                    + AYXP_MonsterZone_EffectApplied_PlayerOwningCardEffect("Player", 1, 1) * 0x80000000 == 0x145D970A // Card of Card Effect is Player's Ownership
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 1)
                    + AYXP_MonsterZone_FacePosition("Player", 1) * 0x00008000                                          
                    + AYXP_MonsterZone_EffectApplied_TargetCardID("Player", 1, 2) * 0x00010000                         
                    + AYXP_MonsterZone_EffectApplied_PlayerOwningCardEffect("Player", 1, 2) * 0x80000000 == 0x145D970A
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 1)
                    + AYXP_MonsterZone_FacePosition("Player", 1) * 0x00008000                                          
                    + AYXP_MonsterZone_EffectApplied_TargetCardID("Player", 1, 3) * 0x00010000                         
                    + AYXP_MonsterZone_EffectApplied_PlayerOwningCardEffect("Player", 1, 3) * 0x80000000 == 0x145D970A
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 2)
                    + AYXP_MonsterZone_FacePosition("Player", 2) * 0x00008000                                          
                    + AYXP_MonsterZone_EffectApplied_TargetCardID("Player", 2, 1) * 0x00010000                         
                    + AYXP_MonsterZone_EffectApplied_PlayerOwningCardEffect("Player", 2, 1) * 0x80000000 == 0x145D970A
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 2)
                    + AYXP_MonsterZone_FacePosition("Player", 2) * 0x00008000                                          
                    + AYXP_MonsterZone_EffectApplied_TargetCardID("Player", 2, 2) * 0x00010000                         
                    + AYXP_MonsterZone_EffectApplied_PlayerOwningCardEffect("Player", 2, 2) * 0x80000000 == 0x145D970A
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 2)
                    + AYXP_MonsterZone_FacePosition("Player", 2) * 0x00008000                                          
                    + AYXP_MonsterZone_EffectApplied_TargetCardID("Player", 2, 3) * 0x00010000                         
                    + AYXP_MonsterZone_EffectApplied_PlayerOwningCardEffect("Player", 2, 3) * 0x80000000 == 0x145D970A
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 3)
                    + AYXP_MonsterZone_FacePosition("Player", 3) * 0x00008000                                          
                    + AYXP_MonsterZone_EffectApplied_TargetCardID("Player", 3, 1) * 0x00010000                         
                    + AYXP_MonsterZone_EffectApplied_PlayerOwningCardEffect("Player", 3, 1) * 0x80000000 == 0x145D970A
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 3)
                    + AYXP_MonsterZone_FacePosition("Player", 3) * 0x00008000                                          
                    + AYXP_MonsterZone_EffectApplied_TargetCardID("Player", 3, 2) * 0x00010000                         
                    + AYXP_MonsterZone_EffectApplied_PlayerOwningCardEffect("Player", 3, 2) * 0x80000000 == 0x145D970A
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 3)
                    + AYXP_MonsterZone_FacePosition("Player", 3) * 0x00008000                                          
                    + AYXP_MonsterZone_EffectApplied_TargetCardID("Player", 3, 3) * 0x00010000                         
                    + AYXP_MonsterZone_EffectApplied_PlayerOwningCardEffect("Player", 3, 3) * 0x80000000 == 0x145D970A
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 4)
                    + AYXP_MonsterZone_FacePosition("Player", 4) * 0x00008000                                          
                    + AYXP_MonsterZone_EffectApplied_TargetCardID("Player", 4, 1) * 0x00010000                         
                    + AYXP_MonsterZone_EffectApplied_PlayerOwningCardEffect("Player", 4, 1) * 0x80000000 == 0x145D970A
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 4)
                    + AYXP_MonsterZone_FacePosition("Player", 4) * 0x00008000                                          
                    + AYXP_MonsterZone_EffectApplied_TargetCardID("Player", 4, 2) * 0x00010000                         
                    + AYXP_MonsterZone_EffectApplied_PlayerOwningCardEffect("Player", 4, 2) * 0x80000000 == 0x145D970A
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 4)
                    + AYXP_MonsterZone_FacePosition("Player", 4) * 0x00008000                                          
                    + AYXP_MonsterZone_EffectApplied_TargetCardID("Player", 4, 3) * 0x00010000                         
                    + AYXP_MonsterZone_EffectApplied_PlayerOwningCardEffect("Player", 4, 3) * 0x80000000 == 0x145D970A
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 5)
                    + AYXP_MonsterZone_FacePosition("Player", 5) * 0x00008000                                          
                    + AYXP_MonsterZone_EffectApplied_TargetCardID("Player", 5, 1) * 0x00010000                         
                    + AYXP_MonsterZone_EffectApplied_PlayerOwningCardEffect("Player", 5, 1) * 0x80000000 == 0x145D970A
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 5)
                    + AYXP_MonsterZone_FacePosition("Player", 5) * 0x00008000                                          
                    + AYXP_MonsterZone_EffectApplied_TargetCardID("Player", 5, 2) * 0x00010000                         
                    + AYXP_MonsterZone_EffectApplied_PlayerOwningCardEffect("Player", 5, 2) * 0x80000000 == 0x145D970A
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 5)
                    + AYXP_MonsterZone_FacePosition("Player", 5) * 0x00008000                                           
                    + AYXP_MonsterZone_EffectApplied_TargetCardID("Player", 5, 3) * 0x00010000                         
                    + AYXP_MonsterZone_EffectApplied_PlayerOwningCardEffect("Player", 5, 3) * 0x80000000 == 0x145D970A
                 )) &&
               __ornext((
                    AYXP_SpellTrapZone_CardID("Player", 1)                                    // Card is 'Level Limit - Area B'
                    + AYXP_SpellTrapZone_FacePosition("Player", 1) * 0x00010000 == 0x000117A6 // Card is Face-Up Position
                 ) || (
                    AYXP_SpellTrapZone_CardID("Player", 2)
                    + AYXP_SpellTrapZone_FacePosition("Player", 2) * 0x00010000 == 0x000117A6
                 ) || (
                    AYXP_SpellTrapZone_CardID("Player", 3)
                    + AYXP_SpellTrapZone_FacePosition("Player", 3) * 0x00010000 == 0x000117A6
                 ) || (
                    AYXP_SpellTrapZone_CardID("Player", 4)
                    + AYXP_SpellTrapZone_FacePosition("Player", 4) * 0x00010000 == 0x000117A6
                 ) || (
                    AYXP_SpellTrapZone_CardID("Player", 5)
                    + AYXP_SpellTrapZone_FacePosition("Player", 5) * 0x00010000 == 0x000117A6
                 ))
            )
)

// 014) Astral Reconstruction (Earth)
achievement(
    title = "Astral Reconstruction (Earth)", type = "progression",
    description = "Use 'Terraforming' to get 'Gaia Power' from your Deck, then play it together with 'Milus Radiant' to give your Earth monsters 1000 ATK more.",
    id = 556784, badge = "632276", points = 2,
    trigger = (getGame("AYXP") &&
               AYXP_InBattle() &&
                (once(AYXP_Chain_PlayerResponsible("Player") &&
                      AYXP_Chain_CardID() == 0x15A1 &&     // Card is 'Terraforming'
                      AYXP_CardIDFromDeck() == 0x1344 &&   // Card Selected is 'Gaia Power'
                      dword(AYXP_CardAmountInHand) > prev(dword(AYXP_CardAmountInHand))) &&
                 (
                    AYXP_FieldZone_CardID("Player") == 0x1344) && // Card is 'Gaia Power'
                    AYXP_FieldZone_FacePosition("Player") == 1
                 ) && 
                __ornext((
                    AYXP_MonsterZone_CardID("Player", 1)                                    // Card is 'Milus Radiant'
                    + AYXP_MonsterZone_FacePosition("Player", 1) * 0x00010000 == 0x000111B5 // Card is Face-Up Position
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 2)                                      
                    + AYXP_MonsterZone_FacePosition("Player", 2) * 0x00010000 == 0x000111B5
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 3)                                      
                    + AYXP_MonsterZone_FacePosition("Player", 3) * 0x00010000 == 0x000111B5
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 4)                                      
                    + AYXP_MonsterZone_FacePosition("Player", 4) * 0x00010000 == 0x000111B5
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 5)                                      
                    + AYXP_MonsterZone_FacePosition("Player", 5) * 0x00010000 == 0x000111B5
                 ))
              )
)

// 015) Astral Reconstruction (Water)
achievement(
    title = "Astral Reconstruction (Water)", type = "progression",
    description = "Use 'Terraforming' to get 'Umiiruka' from your Deck, then play it together with 'Star Boy' to give your Water monsters 1000 ATK more.",
    id = 556785, badge = "632277", points = 2,
    trigger = (getGame("AYXP") &&
               AYXP_InBattle() &&
                (once(AYXP_Chain_PlayerResponsible("Player") &&
                      AYXP_Chain_CardID() == 0x15A1 &&     // Card is 'Terraforming'
                      AYXP_CardIDFromDeck() == 0x1345 &&   // Card Selected is 'Umiiruka'
                      dword(AYXP_CardAmountInHand) > prev(dword(AYXP_CardAmountInHand))) &&
                 (
                    AYXP_FieldZone_CardID("Player") == 0x1345) && // Card is 'Umiiruka'
                    AYXP_FieldZone_FacePosition("Player") == 1
                 ) && 
                __ornext((
                    AYXP_MonsterZone_CardID("Player", 1)                                    // Card is 'Star Boy'
                    + AYXP_MonsterZone_FacePosition("Player", 1) * 0x00010000 == 0x000111B2 // Card is Face-Up Position 
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 2)                                      
                    + AYXP_MonsterZone_FacePosition("Player", 2) * 0x00010000 == 0x000111B2
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 3)                                      
                    + AYXP_MonsterZone_FacePosition("Player", 3) * 0x00010000 == 0x000111B2
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 4)                                      
                    + AYXP_MonsterZone_FacePosition("Player", 4) * 0x00010000 == 0x000111B2
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 5)                                      
                    + AYXP_MonsterZone_FacePosition("Player", 5) * 0x00010000 == 0x000111B2
                 ))
              )
)

// 016) Astral Reconstruction (Fire)
achievement(
    title = "Astral Reconstruction (Fire)", type = "progression",
    description = "Use 'Terraforming' to get 'Molten Destruction' from your Deck, then play it together with 'Little Chimera' to give your Water monsters 1000 ATK more.",
    id = 556786, badge = "632278", points = 2,
    trigger = (getGame("AYXP") &&
               AYXP_InBattle() &&
                (once(AYXP_Chain_PlayerResponsible("Player") &&
                      AYXP_Chain_CardID() == 0x15A1 &&     // Card is 'Terraforming'
                      AYXP_CardIDFromDeck() == 0x1346 &&   // Card Selected is 'Molten Destruction'
                      dword(AYXP_CardAmountInHand) > prev(dword(AYXP_CardAmountInHand))) &&
                 (
                    AYXP_FieldZone_CardID("Player") == 0x1346) && // Card is 'Molten Destruction'
                    AYXP_FieldZone_FacePosition("Player") == 1
                 ) && 
                __ornext((
                    AYXP_MonsterZone_CardID("Player", 1)                                    // Card is 'Little Chimera'
                    + AYXP_MonsterZone_FacePosition("Player", 1) * 0x00010000 == 0x000111FC // Card is Face-Up Position
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 2)                                      
                    + AYXP_MonsterZone_FacePosition("Player", 2) * 0x00010000 == 0x000111FC
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 3)                                      
                    + AYXP_MonsterZone_FacePosition("Player", 3) * 0x00010000 == 0x000111FC
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 4)                                      
                    + AYXP_MonsterZone_FacePosition("Player", 4) * 0x00010000 == 0x000111FC
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 5)                                      
                    + AYXP_MonsterZone_FacePosition("Player", 5) * 0x00010000 == 0x000111FC
                 ))
              )
)

// 017) Astral Reconstruction (Wind)
achievement(
    title = "Astral Reconstruction (Wind)", type = "progression",
    description = "Use 'Terraforming' to get 'Rising Air Current' from your Deck, then play it together with 'Bladefly' to give your Water monsters 1000 ATK more.",
    id = 556787, badge = "632279", points = 2,
    trigger = (getGame("AYXP") &&
               AYXP_InBattle() &&
                (once(AYXP_Chain_PlayerResponsible("Player") &&
                      AYXP_Chain_CardID() == 0x15A1 &&     // Card is 'Terraforming'
                      AYXP_CardIDFromDeck() == 0x1347 &&   // Card Selected is 'Rising Air Current'
                      dword(AYXP_CardAmountInHand) > prev(dword(AYXP_CardAmountInHand))) &&
                 (
                    AYXP_FieldZone_CardID("Player") == 0x1347) && // Card is 'Rising Air Current'
                    AYXP_FieldZone_FacePosition("Player") == 1
                 ) && 
                __ornext((
                    AYXP_MonsterZone_CardID("Player", 1)                                    // Card is 'Bladefly'
                    + AYXP_MonsterZone_FacePosition("Player", 1) * 0x00010000 == 0x00011207 // Card is Face-Up Position
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 2)                                      
                    + AYXP_MonsterZone_FacePosition("Player", 2) * 0x00010000 == 0x00011207
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 3)                                      
                    + AYXP_MonsterZone_FacePosition("Player", 3) * 0x00010000 == 0x00011207
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 4)                                      
                    + AYXP_MonsterZone_FacePosition("Player", 4) * 0x00010000 == 0x00011207
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 5)                                      
                    + AYXP_MonsterZone_FacePosition("Player", 5) * 0x00010000 == 0x00011207
                 ))
              )
)

// 018) Astral Reconstruction (Light)
achievement(
    title = "Astral Reconstruction (Light)", type = "progression",
    description = "Use 'Terraforming' to get 'Luminous Spark' from your Deck, then play it together with 'Hoshiningen' to give your Water monsters 1000 ATK more.",
    id = 556788, badge = "632280", points = 2,
    trigger = (getGame("AYXP") &&
               AYXP_InBattle() &&
                (once(AYXP_Chain_PlayerResponsible("Player") &&
                      AYXP_Chain_CardID() == 0x15A1 &&     // Card is 'Terraforming'
                      AYXP_CardIDFromDeck() == 0x1348 &&   // Card Selected is 'Luminous Spark'
                      dword(AYXP_CardAmountInHand) > prev(dword(AYXP_CardAmountInHand))) &&
                 (
                    AYXP_FieldZone_CardID("Player") == 0x1348) && // Card is 'Luminous Spark'
                    AYXP_FieldZone_FacePosition("Player") == 1
                 ) && 
                __ornext((
                    AYXP_MonsterZone_CardID("Player", 1)                                    // Card is 'Hoshiningen'
                    + AYXP_MonsterZone_FacePosition("Player", 1) * 0x00010000 == 0x00011192 // Card is Face-Up Position
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 2)                                      
                    + AYXP_MonsterZone_FacePosition("Player", 2) * 0x00010000 == 0x00011192
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 3)                                      
                    + AYXP_MonsterZone_FacePosition("Player", 3) * 0x00010000 == 0x00011192
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 4)                                      
                    + AYXP_MonsterZone_FacePosition("Player", 4) * 0x00010000 == 0x00011192
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 5)                                      
                    + AYXP_MonsterZone_FacePosition("Player", 5) * 0x00010000 == 0x00011192
                 ))
              )
)

// 019) Astral Reconstruction (Dark)
achievement(
    title = "Astral Reconstruction (Dark)", type = "progression",
    description = "Use 'Terraforming' to get 'Mystic Plasma Zone' from your Deck, then play it together with 'Witch's Apprentice' to give your Water monsters 1000 ATK more.",
    id = 556789, badge = "632281", points = 2,
    trigger = (getGame("AYXP") &&
               AYXP_InBattle() &&
                (once(AYXP_Chain_PlayerResponsible("Player") &&
                      AYXP_Chain_CardID() == 0x15A1 &&     // Card is 'Terraforming'
                      AYXP_CardIDFromDeck() == 0x1349 &&   // Card Selected is 'Mystic Plasma Zone'
                      dword(AYXP_CardAmountInHand) > prev(dword(AYXP_CardAmountInHand))) &&
                 (
                    AYXP_FieldZone_CardID("Player") == 0x1349) && // Card is 'Mystic Plasma Zone'
                    AYXP_FieldZone_FacePosition("Player") == 1
                 ) && 
                __ornext((
                    AYXP_MonsterZone_CardID("Player", 1)                                    // Card is 'Witch's Apprentice'
                    + AYXP_MonsterZone_FacePosition("Player", 1) * 0x00010000 == 0x0001121A // Card is Face-Up Position
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 2)                                      
                    + AYXP_MonsterZone_FacePosition("Player", 2) * 0x00010000 == 0x0001121A
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 3)                                      
                    + AYXP_MonsterZone_FacePosition("Player", 3) * 0x00010000 == 0x0001121A
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 4)                                      
                    + AYXP_MonsterZone_FacePosition("Player", 4) * 0x00010000 == 0x0001121A
                 ) || (
                    AYXP_MonsterZone_CardID("Player", 5)                                      
                    + AYXP_MonsterZone_FacePosition("Player", 5) * 0x00010000 == 0x0001121A
                 ))
              )
)

// 021) Avian Special
achievement(
    title = "Avian Special", type = "progression",
    description = "Use 'Scapegoat' to special summon four tokens, then while having them on the field use 'Feather Shot' on your 'Elemental Hero Avian' to allow it to attack multiple times this turn.",
    id = 556790, badge = "632282", points = 2,
    trigger = (getGame("AYXP") &&
               AYXP_InBattle() &&
                (once(AYXP_Chain_PlayerResponsible("Player") &&
                      AYXP_Chain_CardID() == 0x195B &&                                    // Card is 'Feather Shot'
                      AYXP_Chain_TargetCardIDBySlot_MonsterZone(0, "Player") == 0x18A6 && // Card Target is 'Elemental Hero Avian'
                      never(AYXP_TurnChange()))
                ) &&
                ((
                   AYXP_MonsterZone_CardID("Player", 1)                                 // Card is 'Sheep Token (Blue)'                                                                              
                   + AYXP_MonsterZone_FacePosition("Player", 1) * 0x10000 == 0x000114F9 // Card is Face-Up Position
                ) || (
                   AYXP_MonsterZone_CardID("Player", 2)
                   + AYXP_MonsterZone_FacePosition("Player", 2) * 0x10000 == 0x000114F9 
                ) || (
                   AYXP_MonsterZone_CardID("Player", 3)
                   + AYXP_MonsterZone_FacePosition("Player", 3) * 0x10000 == 0x000114F9 
                ) || (
                   AYXP_MonsterZone_CardID("Player", 4)
                   + AYXP_MonsterZone_FacePosition("Player", 4) * 0x10000 == 0x000114F9 
                ) || (
                   AYXP_MonsterZone_CardID("Player", 5)
                   + AYXP_MonsterZone_FacePosition("Player", 5) * 0x10000 == 0x000114F9 
                )) &&
                ((
                   AYXP_MonsterZone_CardID("Player", 1)                                 // Card is 'Sheep Token (Red)'                                                                              
                   + AYXP_MonsterZone_FacePosition("Player", 1) * 0x10000 == 0x0001154F // Card is Face-Up Position
                ) || (
                   AYXP_MonsterZone_CardID("Player", 2)
                   + AYXP_MonsterZone_FacePosition("Player", 2) * 0x10000 == 0x0001154F 
                ) || (
                   AYXP_MonsterZone_CardID("Player", 3)
                   + AYXP_MonsterZone_FacePosition("Player", 3) * 0x10000 == 0x0001154F 
                ) || (
                   AYXP_MonsterZone_CardID("Player", 4)
                   + AYXP_MonsterZone_FacePosition("Player", 4) * 0x10000 == 0x0001154F 
                ) || (
                   AYXP_MonsterZone_CardID("Player", 5)
                   + AYXP_MonsterZone_FacePosition("Player", 5) * 0x10000 == 0x0001154F 
                )) &&
                ((
                   AYXP_MonsterZone_CardID("Player", 1)                                 // Card is 'Sheep Token (Orange)'                                                                              
                   + AYXP_MonsterZone_FacePosition("Player", 1) * 0x10000 == 0x00011550 // Card is Face-Up Position
                ) || (
                   AYXP_MonsterZone_CardID("Player", 2)
                   + AYXP_MonsterZone_FacePosition("Player", 2) * 0x10000 == 0x00011550 
                ) || (
                   AYXP_MonsterZone_CardID("Player", 3)
                   + AYXP_MonsterZone_FacePosition("Player", 3) * 0x10000 == 0x00011550 
                ) || (
                   AYXP_MonsterZone_CardID("Player", 4)
                   + AYXP_MonsterZone_FacePosition("Player", 4) * 0x10000 == 0x00011550 
                ) || (
                   AYXP_MonsterZone_CardID("Player", 5)
                   + AYXP_MonsterZone_FacePosition("Player", 5) * 0x10000 == 0x00011550 
                )) &&
                ((
                   AYXP_MonsterZone_CardID("Player", 1)                                 // Card is 'Sheep Token (Yellow)'                                                                              
                   + AYXP_MonsterZone_FacePosition("Player", 1) * 0x10000 == 0x00011551 // Card is Face-Up Position
                ) || (
                   AYXP_MonsterZone_CardID("Player", 2)
                   + AYXP_MonsterZone_FacePosition("Player", 2) * 0x10000 == 0x00011551 
                ) || (
                   AYXP_MonsterZone_CardID("Player", 3)
                   + AYXP_MonsterZone_FacePosition("Player", 3) * 0x10000 == 0x00011551 
                ) || (
                   AYXP_MonsterZone_CardID("Player", 4)
                   + AYXP_MonsterZone_FacePosition("Player", 4) * 0x10000 == 0x00011551 
                ) || (
                   AYXP_MonsterZone_CardID("Player", 5)
                   + AYXP_MonsterZone_FacePosition("Player", 5) * 0x10000 == 0x00011551 
                ))
              )
)




