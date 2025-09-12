// ~Hack~ Newer Super Mario Bros. DS
// #ID = 14829

Mem_CurrentWorld  = 0x085A18
Mem_CurrentLevel  = 0x085A14
Mem_CurrentExit   = 0x085AC8
Mem_PointerFlag   = 0x0CAAC8
Mem_PointerPlayer = 0x08B35C

Mem_FlagValue     = tbyte(Mem_PointerFlag) + 0xC8
Mem_AnimationID   = tbyte(Mem_PointerPlayer) + 0x76C

function getTopOfFlag(world, level, exit) {
    return once(byte(Mem_CurrentWorld) == world &&
                byte(Mem_CurrentLevel) == level &&
                byte(Mem_CurrentExit) == exit &&
                dword(Mem_PointerFlag) != 0 &&
                byte(Mem_FlagValue) >= 8 &&
                byte(Mem_FlagValue) <= 9 &&
                byte(Mem_AnimationID) == 0x2C)
}

achievement(
    title = "On Top of the Trees of the Goldleaf Plains", points = 10,
    description = "Reach the Top of all Flagpoles in World 1 'Goldleaf Plains' in one Session.",
    id = 142021, badge = "157533", published = "19.02.2021 01:02:38", modified = "19.02.2021 01:02:38",
    trigger = measured(tally(8,
                             getTopOfFlag(0, 0, 0),
                             getTopOfFlag(0, 1, 0),
                             getTopOfFlag(0, 1, 1),
                             getTopOfFlag(0, 2, 0),
                             getTopOfFlag(0, 3, 0),
                             getTopOfFlag(0, 4, 0),
                             getTopOfFlag(0, 5, 0),
                             getTopOfFlag(0, 6, 1)
              ))
    // trigger = measured(tally(8,
    //               once(dword(0x085A94) == 0 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //               byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //               once(dword(0x085A94) == 4 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //               byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //               once(dword(0x085A94) == 5 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //               byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //               once(dword(0x085A94) == 6 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //               byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //               once(dword(0x085A94) == 16 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //               byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //               once(dword(0x085A94) == 8 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //               byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //               once(dword(0x085A94) == 10 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //               byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //               once(dword(0x085A94) == 12 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //               byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0))
    //           )    
)

achievement(
    title = "On Top of the the Crystals in the Crystal Sewers", points = 10,
    description = "Reach the Top of all Flagpoles in World 2 'Crystal Sewers' in one Session.",
    id = 142025, badge = "157569", published = "19.02.2021 01:02:43", modified = "27.09.2022 12:25:56",
    trigger = measured(tally(10,
                             getTopOfFlag(1, 0, 0),
                             getTopOfFlag(1, 1, 0),
                             getTopOfFlag(1, 2, 0),
                             getTopOfFlag(1, 2, 1),
                             getTopOfFlag(1, 3, 0),
                             getTopOfFlag(1, 3, 1),
                             getTopOfFlag(1, 4, 0),
                             getTopOfFlag(1, 5, 0),
                             getTopOfFlag(1, 6, 0),
                             getTopOfFlag(1, 6, 1)
              ))
    // trigger = measured(tally(10,
    //               once(dword(0x085A94) == 23 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //               byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //               once(dword(0x085A94) == 24 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //               byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //               once(dword(0x085A94) == 26 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //               byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //               once(dword(0x085A94) == 27 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //               byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //               once((dword(tbyte(0x08B35C) + 0x000060) >= 22020096) && dword(0x085A94) == 29 &&
    //               byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 && byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 &&
    //               prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //               once((dword(tbyte(0x08B35C) + 0x000060) <= 6291456) && dword(0x085A94) == 29 &&
    //               byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 && byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 &&
    //               prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //               once(dword(0x085A94) == 30 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //               byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //               once(dword(0x085A94) == 32 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //               byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //               once((dword(tbyte(0x08B35C) + 0x000060) < 2424832) && dword(0x085A94) == 36 &&
    //               byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 && byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 &&
    //               prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //               once((dword(tbyte(0x08B35C) + 0x000060) > 2424832) && dword(0x085A94) == 36 &&
    //               byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 && byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 &&
    //               prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0))
    //           )
)

achievement(
    title = "On Top of Dorrie at Dorrie's Island", points = 10,
    description = "Reach the Top of all Flagpoles in World 3 'Dorrie's Island' in one Session.",
    id = 142029, badge = "157575", published = "19.02.2021 01:02:48", modified = "27.09.2022 12:25:56",
    trigger = measured(tally(9,
                             getTopOfFlag(2, 0, 0),
                             getTopOfFlag(2, 1, 0),
                             getTopOfFlag(2, 1, 1),
                             getTopOfFlag(2, 2, 0),
                             getTopOfFlag(2, 3, 0),
                             getTopOfFlag(2, 4, 0),
                             getTopOfFlag(2, 5, 0),
                             getTopOfFlag(2, 6, 0),
                             getTopOfFlag(2, 6, 1)
              ))
    // trigger = measured(tally(9,
    //              once(dword(0x085A94) == 44 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once(dword(0x085A94) == 48 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once((dword(tbyte(0x08B35C) + 0x000060) < 2424832) && dword(0x085A94) == 60 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 && byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 &&
    //              prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once((dword(tbyte(0x08B35C) + 0x000060) > 3145728) && dword(0x085A94) == 60 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 && byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 &&
    //              prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once(dword(0x085A94) == 51 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once(dword(0x085A94) == 54 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once(dword(0x085A94) == 56 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once((dword(tbyte(0x08B35C) + 0x000060) < 3145728) && dword(0x085A94) == 46 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 && byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 &&
    //              prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once((dword(tbyte(0x08B35C) + 0x000060) > 29360128) && dword(0x085A94) == 46 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 && byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 &&
    //              prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0))
    //          )
)

achievement(
    title = "On Top of the Tombstones in the Pumpkin Boneyard", points = 10,
    description = "Reach the Top of all Flagpoles in World 4 'Pumpkin Boneyard'.",
    id = 142033, badge = "158245", published = "19.02.2021 01:02:54", modified = "27.09.2022 12:25:56",
    trigger = measured(tally(10,
                             getTopOfFlag(3, 0, 0),
                             getTopOfFlag(3, 0, 1),
                             getTopOfFlag(3, 1, 0),
                             getTopOfFlag(3, 2, 0),
                             getTopOfFlag(3, 3, 0),
                             getTopOfFlag(3, 4, 0),
                             getTopOfFlag(3, 5, 0),
                             getTopOfFlag(3, 6, 0),
                             getTopOfFlag(3, 7, 0),
                             getTopOfFlag(3, 7, 1)
              ))
    // trigger = measured(tally(10,
    //              once((dword(tbyte(0x08B35C) + 0x000060) > 22020096) && dword(0x085A94) == 66 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 && byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 &&
    //              prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once((dword(tbyte(0x08B35C) + 0x000060) < 2228224) && dword(0x085A94) == 66 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 && byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 &&
    //              prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once(dword(0x085A94) == 67 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once(dword(0x085A94) == 69 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once(dword(0x085A94) == 71 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once((dword(tbyte(0x08B35C) + 0x000060) > 5242880) && dword(0x085A94) == 82 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 && byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 &&
    //              prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once((dword(tbyte(0x08B35C) + 0x000060) < 3145728) && dword(0x085A94) == 82 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 && byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 &&
    //              prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once(dword(0x085A94) == 73 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once(dword(0x085A94) == 76 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once(dword(0x085A94) == 78 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0))
    //          )
)

achievement(
    title = "On Top of the Snowhills in Moonview Glacier", points = 10,
    description = "Reach the Top of all Flagpoles in World 5 'Moonview Glacier'.",
    id = 142037, badge = "158249", published = "19.02.2021 01:03:02", modified = "27.09.2022 12:25:57",
    trigger = measured(tally(10,
                             getTopOfFlag(4, 0, 0),
                             getTopOfFlag(4, 1, 0),
                             getTopOfFlag(4, 1, 1),
                             getTopOfFlag(4, 2, 0),
                             getTopOfFlag(4, 3, 0),
                             getTopOfFlag(4, 4, 0),
                             getTopOfFlag(4, 5, 0),
                             getTopOfFlag(4, 5, 1),
                             getTopOfFlag(4, 6, 0),
                             getTopOfFlag(4, 7, 0)
              ))
    // This does not cover W5-Ghost House Secret Exit since it is a King Boo boss

    // trigger = measured(tally(10,
    //              once(dword(0x085A94) == 88 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once((dword(tbyte(0x08B35C) + 0x000060) < 3866624) && dword(0x085A94) == 89 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 && byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 &&
    //              prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once((dword(tbyte(0x08B35C) + 0x000060) > 3866624) && dword(0x085A94) == 89 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 && byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 &&
    //              prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once(dword(0x085A94) == 92 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once(dword(0x085A94) == 101 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once(dword(0x085A94) == 93 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once(dword(0x085A94) == 94 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once((dword(tbyte(0x08B35C) + 0x000060) > 22020096) && dword(0x085A94) == 96 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 && byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 &&
    //              prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once((dword(tbyte(0x08B35C) + 0x000060) < 16777216) && dword(0x085A94) == 96 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 && byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 &&
    //              prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once(dword(0x085A94) == 97 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0))
    //          )
)

achievement(
    title = "On Top of the Stars in the Lunar Realm", points = 10,
    description = "Reach the Top of all Flagpoles in World 6 'Lunar Realm'.",
    id = 142041, badge = "158422", published = "19.02.2021 01:03:07", modified = "19.02.2021 01:03:07",
    trigger = measured(tally(9,
                             getTopOfFlag(5, 0, 0),
                             getTopOfFlag(5, 1, 0),
                             getTopOfFlag(5, 2, 0),
                             getTopOfFlag(5, 3, 0),
                             getTopOfFlag(5, 4, 0),
                             getTopOfFlag(5, 5, 0),
                             getTopOfFlag(5, 6, 0),
                             getTopOfFlag(5, 7, 0),
                             getTopOfFlag(5, 9, 0)
              ))
    // trigger = measured(tally(9,
    //              once(dword(0x085A94) == 107 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once(dword(0x085A94) == 109 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once(dword(0x085A94) == 111 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once(dword(0x085A94) == 113 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once(dword(0x085A94) == 124 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once(dword(0x085A94) == 114 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once(dword(0x085A94) == 117 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once(dword(0x085A94) == 119 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once(dword(0x085A94) == 121 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0))
    //          )
)

achievement(
    title = "On Top of the Clouds in the Cirrus Heavens", points = 10,
    description = "Reach the Top of all Flagpoles in World 7 'Cirrus Heavens'.",
    id = 142045, badge = "158431", published = "19.02.2021 01:03:12", modified = "20.07.2024 12:51:45",
    trigger = measured(tally(13,
                             getTopOfFlag(6, 0, 0),
                             getTopOfFlag(6, 1, 0),
                             getTopOfFlag(6, 2, 0),
                             getTopOfFlag(6, 3, 0),
                             getTopOfFlag(6, 3, 1),
                             getTopOfFlag(6, 4, 0),
                             getTopOfFlag(6, 4, 1),
                             getTopOfFlag(6, 5, 0),
                             getTopOfFlag(6, 5, 1),
                             getTopOfFlag(6, 6, 0),
                             getTopOfFlag(6, 7, 0),
                             getTopOfFlag(6, 8, 0),
                             getTopOfFlag(6, 8, 1)
              ))
    // trigger = measured(tally(13,
    //              once(dword(0x085A94) == 129 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once((dword(tbyte(0x08B35C) + 0x000060) < 10485760) && dword(0x085A94) == 146 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 && byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 &&
    //              prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once((dword(tbyte(0x08B35C) + 0x000060) > 10485760) && dword(0x085A94) == 146 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 && byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 &&
    //              prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once(dword(0x085A94) == 130 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once(dword(0x085A94) == 132 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once((dword(tbyte(0x08B35C) + 0x000064) < 4291821568) && dword(0x085A94) == 136 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 && byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 &&
    //              prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once((dword(tbyte(0x08B35C) + 0x000064) > 4291821568) && dword(0x085A94) == 136 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 && byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 &&
    //              prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once(dword(0x085A94) == 135 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once(dword(0x085A94) == 137 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once((dword(tbyte(0x08B35C) + 0x000060) < 23068672) && dword(0x085A94) == 138 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 && byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 &&
    //              prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once((dword(tbyte(0x08B35C) + 0x000060) > 23068672) && dword(0x085A94) == 138 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 && byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 &&
    //              prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once(dword(0x085A94) == 141 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once(dword(0x085A94) == 142 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0))
    //          )
)

achievement(
    title = "On Top of the Volcanos in Koopa Country", points = 10,
    description = "Reach the Top of all Flagpoles in World 8 'Koopa Country'.",
    id = 142049, badge = "158440", published = "19.02.2021 01:03:18", modified = "19.02.2021 01:03:18",
    trigger = measured(tally(9,
                             getTopOfFlag(7, 0, 0),
                             getTopOfFlag(7, 1, 0),
                             getTopOfFlag(7, 2, 0),
                             getTopOfFlag(7, 3, 0),
                             getTopOfFlag(7, 4, 0),
                             getTopOfFlag(7, 5, 0),
                             getTopOfFlag(7, 6, 0),
                             getTopOfFlag(7, 7, 0),
                             getTopOfFlag(7, 9, 0)
              ))
    // trigger = measured(tally(9,
    //              once(dword(0x085A94) == 151 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once(dword(0x085A94) == 153 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once(dword(0x085A94) == 156 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once(dword(0x085A94) == 159 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once(dword(0x085A94) == 160 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once(dword(0x085A94) == 163 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once(dword(0x085A94) == 161 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once(dword(0x085A94) == 166 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0),
    //              once(dword(0x085A94) == 169 && byte(tbyte(0x0CAAC8) + 0x0000C8) >= 8 &&
    //              byte(tbyte(0x0CAAC8) + 0x0000C8) <= 9 && prev(byte(tbyte(0x0CAAC8) + 0x0000C8)) == 0))
    //          )
)

