// New Super Mario Bros.
// #ID = 11729

//--------------------------------------------------
// Addresses

Mem_CurrentWorld  = 0x00098058
Mem_CurrentLevel  = 0x00098054
Mem_CurrentExit   = 0x00098108
Mem_PointerFlag   = 0x000DCB4C
Mem_PointerPlayer = 0x0009DBF8

Mem_FlagValue     = tbyte(Mem_PointerFlag) + 0xC4
Mem_AnimationID   = tbyte(Mem_PointerPlayer) + 0x718

//--------------------------------------------------
// Functions

function getTopOfFlag(world, level, exit) {
    return once(byte(Mem_CurrentWorld) == world &&
                byte(Mem_CurrentLevel) == level &&
                byte(Mem_CurrentExit) == exit &&
                dword(Mem_PointerFlag) != 0 &&
                byte(Mem_FlagValue) == 9 &&
                byte(Mem_AnimationID) == 0x2C)
}

//--------------------------------------------------
// Achievements

achievement(
    title = "On Top of the Grassland", points = 10,
    description = "In a single session, reach the top of every flagpole in World 1.",
    id = 104611, badge = "116365", published = "25.03.2020 17:11:46", modified = "06.12.2025 09:22:37",
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
    //              once(dword(0x0980D4) == 0 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 4 && dword(tbyte(0x09DBF8) + 0x00005C) > 4194304 &&
    //              byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 && prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 4 && dword(tbyte(0x09DBF8) + 0x00005C) < 3145728 &&
    //              byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 && prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 6 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 7 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 10 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 12 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 16 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0))
    //          )
)

achievement(
    title = "On Top of the Pyramids", points = 10,
    description = "In a single session, reach the top of every flagpole in World 2.",
    id = 104614, badge = "116368", published = "25.03.2020 17:11:53", modified = "06.12.2025 09:22:38",
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
    //              once(dword(0x0980D4) == 22 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 24 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 26 && dword(tbyte(0x09DBF8) + 0x00005C) < 3145728 &&
    //              byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 && prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 26 && dword(tbyte(0x09DBF8) + 0x00005C) > 5242880 &&
    //              byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 && prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 28 && dword(tbyte(0x09DBF8) + 0x00005C) > 17825792 &&
    //              byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 && prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 28 && dword(tbyte(0x09DBF8) + 0x00005C) < 6291456 &&
    //              byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 && prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 31 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 32 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 35 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 36 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0))
    //          )
)

achievement(
    title = "On Top of the Palms", points = 10,
    description = "In a single session, reach the top of every flagpole in World 3.",
    id = 104630, badge = "116371", published = "25.03.2020 21:27:44", modified = "06.12.2025 09:22:38",
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
    //              once(dword(0x0980D4) == 44 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 46 && dword(tbyte(0x09DBF8) + 0x00005C) < 20250624 &&
    //              byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 && prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 46 && dword(tbyte(0x09DBF8) + 0x00005C) > 20250624 &&
    //              byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 && prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 48 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 60 && dword(tbyte(0x09DBF8) + 0x00005C) < 2424832 &&
    //              byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 && prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 60 && dword(tbyte(0x09DBF8) + 0x00005C) > 5242880 &&
    //              byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 && prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 52 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 54 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 57 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0))
    //          )
)

achievement(
    title = "On Top of the Jungle Trees", points = 10,
    description = "In a single session, reach the top of every flagpole in World 4.",
    id = 104636, badge = "116374", published = "25.03.2020 22:16:52", modified = "06.12.2025 09:22:37",
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
    //              once(dword(0x0980D4) == 67 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 69 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 71 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 82 && dword(tbyte(0x09DBF8) + 0x00005C) < 2424832 &&
    //              byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 && prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 82 && dword(tbyte(0x09DBF8) + 0x00005C) > 5242880 &&
    //              byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 && prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 73 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 77 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 78 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 66 && dword(tbyte(0x09DBF8) + 0x00005C) < 17825792 &&
    //              byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 && prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 66 && dword(tbyte(0x09DBF8) + 0x00005C) > 17825792 &&
    //              byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 && prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0))
    //          )
)

achievement(
    title = "On Top of the Icicles", points = 10,
    description = "In a single session, reach the top of every flagpole in World 5.",
    id = 104936, badge = "116377", published = "26.03.2020 17:07:39", modified = "06.12.2025 09:22:37",
    trigger = measured(tally(11,
                             getTopOfFlag(4, 0, 0),
                             getTopOfFlag(4, 1, 0),
                             getTopOfFlag(4, 1, 1),
                             getTopOfFlag(4, 2, 0),
                             getTopOfFlag(4, 3, 0),
                             getTopOfFlag(4, 4, 0),
                             getTopOfFlag(4, 5, 0),
                             getTopOfFlag(4, 5, 1),
                             getTopOfFlag(4, 6, 0),
                             getTopOfFlag(4, 7, 0),
                             getTopOfFlag(4, 7, 1)
              ))
    
    // trigger = measured(tally(11,
    //              once(dword(0x0980D4) == 88 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 89 && dword(tbyte(0x09DBF8) + 0x00005C) < 2097152 &&
    //              byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 && prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 89 && dword(tbyte(0x09DBF8) + 0x00005C) > 5242880 &&
    //              byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 && prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 91 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 101 && dword(tbyte(0x09DBF8) + 0x00005C) < 2097152 &&
    //              byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 && prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 101 && dword(tbyte(0x09DBF8) + 0x00005C) > 6291456 &&
    //              byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 && prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 93 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 94 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 96 && dword(tbyte(0x09DBF8) + 0x00005C) < 4194304 &&
    //              byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 && prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 96 && dword(tbyte(0x09DBF8) + 0x00005C) > 16777216 &&
    //              byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 && prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 97 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0))
    //          )
)

achievement(
    title = "On Top of the Mountains", points = 10,
    description = "In a single session, reach the top of every flagpole in World 6.",
    id = 104939, badge = "116380", published = "26.03.2020 17:58:55", modified = "06.12.2025 09:22:37",
    trigger = measured(tally(8,
                             getTopOfFlag(5, 0, 0),
                             getTopOfFlag(5, 1, 0),
                             getTopOfFlag(5, 2, 0),
                             getTopOfFlag(5, 3, 0),
                             getTopOfFlag(5, 4, 0),
                             getTopOfFlag(5, 5, 0),
                             getTopOfFlag(5, 6, 0),
                             getTopOfFlag(5, 7, 0)
              ))
    
    // trigger = measured(tally(8,
    //              once(dword(0x0980D4) == 107 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 109 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 111 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 113 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 114 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 118 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 119 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 121 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0))
    //          )
)

achievement(
    title = "On Top of the Clouds", points = 10,
    description = "In a single session, reach the top of every flagpole in World 7.",
    id = 104975, badge = "116383", published = "26.03.2020 21:18:23", modified = "06.12.2025 09:22:36",
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
    //              once(dword(0x0980D4) == 130 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 147 && dword(tbyte(0x09DBF8) + 0x00005C) < 3145728 &&
    //              byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 && prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 147 && dword(tbyte(0x09DBF8) + 0x00005C) > 6291456 &&
    //              byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 && prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 131 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 133 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 135 && dword(tbyte(0x09DBF8) + 0x00005C) < 7798784 &&
    //              byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 && prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 135 && dword(tbyte(0x09DBF8) + 0x00005C) > 7798784 &&
    //              byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 && prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 136 && dword(tbyte(0x09DBF8) + 0x00005C) < 3145728 &&
    //              byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 && prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 136 && dword(tbyte(0x09DBF8) + 0x00005C) > 19922944 &&
    //              byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 && prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 139 && dword(tbyte(0x09DBF8) + 0x00005C) < 17825792 &&
    //              byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 && prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 139 && dword(tbyte(0x09DBF8) + 0x00005C) > 20971520 &&
    //              byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 && prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 142 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 143 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0))
    //          )
)

achievement(
    title = "On Top of the Volcanos", points = 10,
    description = "In a single session, reach the top of every flagpole in World 8.",
    id = 104978, badge = "116386", published = "26.03.2020 21:35:03", modified = "06.12.2025 09:22:38",
    trigger = measured(tally(8,
                             getTopOfFlag(7, 0, 0),
                             getTopOfFlag(7, 1, 0),
                             getTopOfFlag(7, 2, 0),
                             getTopOfFlag(7, 3, 0),
                             getTopOfFlag(7, 4, 0),
                             getTopOfFlag(7, 5, 0),
                             getTopOfFlag(7, 6, 0),
                             getTopOfFlag(7, 7, 0)
              ))
    
    // trigger = measured(tally(8,
    //              once(dword(0x0980D4) == 152 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 154 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 157 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 159 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 162 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 164 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 165 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0),
    //              once(dword(0x0980D4) == 166 && byte(tbyte(0x0DCB4C) + 0x0000C4) == 9 &&
    //              prev(byte(tbyte(0x0DCB4C) + 0x0000C4)) == 0))
    //          )
)
