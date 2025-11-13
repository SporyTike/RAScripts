// PowerPC Instructions for Nintendo Wii
// #ID = 0

// --------------------------------------------------

// stb RS, D (RA)       | Store Byte
      function stb(RS, D, RA) {
            RS = dword_be(RA) + D
          return byte(RS)
      }
      // Reads RA as address reference and D as offset,
      // then returns the byte of the target address



// addis RT, RA, SI     | Add Immediate Shifted
    function addis(RT, RA, SI) {
          RT = RA + (SI * 0x10000)
        return RT
    }
    // Adds RA and SI * 0x10000 and writes it into RT

// --------------------------------------------------

achievement(
    title = "Example Achievement", points = 0, type="",
    description = "",
    id = 0, badge = "0",
    trigger = always_true()

)
