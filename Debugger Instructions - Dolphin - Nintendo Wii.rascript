// PowerPC Instructions for Nintendo Wii
// #ID = 0

// ----------------------------------------------------------------------------------------------------

// stb RS, D (RA)       | Store Byte
    function stb(RS, D, RA) {
          RS = dword_be(RA) + D
        return byte(RS)
    }
      // Reads RA as address reference and D as offset, then returns the byte of it and saves it into RS



// addis RT, RA, SI     | Add Immediate Shifted
    function addis(RT, RA, SI) {
          RT = RA + (SI * 0x10000)
        return RT
    }
    // Adds RA and SI * 0x10000 and writes it into RT
    // Info: This is often used in combination with a following instruction that uses RT to access an
    //       address using a small offset. In the development toolkit it is recommended to directly take
    //       the sum of SI * 0x10000 + offset, especially in cases where the small offset is negative.

// ----------------------------------------------------------------------------------------------------

achievement(
    title = "Example Achievement", points = 0, type="",
    description = "",
    id = 0, badge = "0",
    trigger = always_true()

)
