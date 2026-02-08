// Pokémon Mystery Dungeon: Red Rescue Team
// #ID = 2816

//----------------------------------------
// Variables, Arrays and Dictionaries

pokeSquareMapID = byte(0x041DE0)

pokemonIDs = [
    [0x0001, "Bulbasaur"],
    [0x0002, "Ivysaur"],
    [0x0003, "Venusaur"],
    [0x0004, "Charmander"],
    [0x0005, "Charmeleon"],
    [0x0006, "Charizard"],
    [0x0007, "Squirtle"],
    [0x0008, "Wartortle"],
    [0x0009, "Blastoise"],
    [0x000A, "Caterpie"],
    [0x000B, "Metapod"],
    [0x000C, "Butterfree"],
    [0x000D, "Weedle"],
    [0x000E, "Kakuna"],
    [0x000F, "Beedrill"],
    [0x0010, "Pidgey"],
    [0x0011, "Pidgeotto"],
    [0x0012, "Pidgeot"],
    [0x0013, "Rattata"],
    [0x0014, "Raticate"],
    [0x0015, "Spearow"],
    [0x0016, "Fearow"],
    [0x0017, "Ekans"],
    [0x0018, "Arbok"],
    [0x0019, "Pikachu"],
    [0x001A, "Raichu"],
    [0x001B, "Sandshrew"],
    [0x001C, "Sandslash"],
    [0x001D, "Nidoran♀"],
    [0x001E, "Nidorina"],
    [0x001F, "Nidoqueen"],
    [0x0020, "Nidoran♂"],
    [0x0021, "Nidorino"],
    [0x0022, "Nidoking"],
    [0x0023, "Clefairy"],
    [0x0024, "Clefable"],
    [0x0025, "Vulpix"],
    [0x0026, "Ninetales"],
    [0x0027, "Jigglypuff"],
    [0x0028, "Wigglytuff"],
    [0x0029, "Zubat"],
    [0x002A, "Golbat"],
    [0x002B, "Oddish"],
    [0x002C, "Gloom"],
    [0x002D, "Vileplume"],
    [0x002E, "Paras"],
    [0x002F, "Parasect"],
    [0x0030, "Venonat"],
    [0x0031, "Venomoth"],
    [0x0032, "Diglett"],
    [0x0033, "Dugtrio"],
    [0x0034, "Meowth"],
    [0x0035, "Persian"],
    [0x0036, "Psyduck"],
    [0x0037, "Golduck"],
    [0x0038, "Mankey"],
    [0x0039, "Primeape"],
    [0x003A, "Growlithe"],
    [0x003B, "Arcanine"],
    [0x003C, "Poliwag"],
    [0x003D, "Poliwhirl"],
    [0x003E, "Poliwrath"],
    [0x003F, "Abra"],
    [0x0040, "Kadabra"],
    [0x0041, "Alakazam"],
    [0x0042, "Machop"],
    [0x0043, "Machoke"],
    [0x0044, "Machamp"],
    [0x0045, "Bellsprout"],
    [0x0046, "Weepinbell"],
    [0x0047, "Victreebel"],
    [0x0048, "Tentacool"],
    [0x0049, "Tentacruel"],
    [0x004A, "Geodude"],
    [0x004B, "Graveler"],
    [0x004C, "Golem"],
    [0x004D, "Ponyta"],
    [0x004E, "Rapidash"],
    [0x004F, "Slowpoke"],
    [0x0050, "Slowbro"],
    [0x0051, "Magnemite"],
    [0x0052, "Magneton"],
    [0x0053, "Farfetch'd"],
    [0x0054, "Doduo"],
    [0x0055, "Dodrio"],
    [0x0056, "Seel"],
    [0x0057, "Dewgong"],
    [0x0058, "Grimer"],
    [0x0059, "Muk"],
    [0x005A, "Shellder"],
    [0x005B, "Cloyster"],
    [0x005C, "Gastly"],
    [0x005D, "Haunter"],
    [0x005E, "Gengar"],
    [0x005F, "Onix"],
    [0x0060, "Drowzee"],
    [0x0061, "Hypno"],
    [0x0062, "Krabby"],
    [0x0063, "Kingler"],
    [0x0064, "Voltorb"],
    [0x0065, "Electrode"],
    [0x0066, "Exeggcute"],
    [0x0067, "Exeggutor"],
    [0x0068, "Cubone"],
    [0x0069, "Marowak"],
    [0x006A, "Hitmonlee"],
    [0x006B, "Hitmonchan"],
    [0x006C, "Lickitung"],
    [0x006D, "Koffing"],
    [0x006E, "Weezing"],
    [0x006F, "Rhyhorn"],
    [0x0070, "Rhydon"],
    [0x0071, "Chansey"],
    [0x0072, "Tangela"],
    [0x0073, "Kangaskhan"],
    [0x0074, "Horsea"],
    [0x0075, "Seadra"],
    [0x0076, "Goldeen"],
    [0x0077, "Seaking"],
    [0x0078, "Staryu"],
    [0x0079, "Starmie"],
    [0x007A, "Mr. Mime"],
    [0x007B, "Scyther"],
    [0x007C, "Jynx"],
    [0x007D, "Electabuzz"],
    [0x007E, "Magmar"],
    [0x007F, "Pinsir"],
    [0x0080, "Tauros"],
    [0x0081, "Magikarp"],
    [0x0082, "Gyarados"],
    [0x0083, "Lapras"],
    [0x0084, "Ditto"],
    [0x0085, "Eevee"],
    [0x0086, "Vaporeon"],
    [0x0087, "Jolteon"],
    [0x0088, "Flareon"],
    [0x0089, "Porygon"],
    [0x008A, "Omanyte"],
    [0x008B, "Omastar"],
    [0x008C, "Kabuto"],
    [0x008D, "Kabutops"],
    [0x008E, "Aerodactyl"],
    [0x008F, "Snorlax"],
    [0x0090, "Articuno"],
    [0x0091, "Zapdos"],
    [0x0092, "Moltres"],
    [0x0093, "Dratini"],
    [0x0094, "Dragonair"],
    [0x0095, "Dragonite"],
    [0x0096, "Mewtwo"],
    [0x0097, "Mew"],
    [0x0098, "Chikorita"],
    [0x0099, "Bayleef"],
    [0x009A, "Meganium"],
    [0x009B, "Cyndaquil"],
    [0x009C, "Quilava"],
    [0x009D, "Typhlosion"],
    [0x009E, "Totodile"],
    [0x009F, "Croconaw"],
    [0x00A0, "Feraligatr"],
    [0x00A1, "Sentret"],
    [0x00A2, "Furret"],
    [0x00A3, "Hoothoot"],
    [0x00A4, "Noctowl"],
    [0x00A5, "Ledyba"],
    [0x00A6, "Ledian"],
    [0x00A7, "Spinarak"],
    [0x00A8, "Ariados"],
    [0x00A9, "Crobat"],
    [0x00AA, "Chinchou"],
    [0x00AB, "Lanturn"],
    [0x00AC, "Pichu"],
    [0x00AD, "Cleffa"],
    [0x00AE, "Igglybuff"],
    [0x00AF, "Togepi"],
    [0x00B0, "Togetic"],
    [0x00B1, "Natu"],
    [0x00B2, "Xatu"],
    [0x00B3, "Mareep"],
    [0x00B4, "Flaaffy"],
    [0x00B5, "Ampharos"],
    [0x00B6, "Bellossom"],
    [0x00B7, "Marill"],
    [0x00B8, "Azumarill"],
    [0x00B9, "Sudowoodo"],
    [0x00BA, "Politoed"],
    [0x00BB, "Hoppip"],
    [0x00BC, "Skiploom"],
    [0x00BD, "Jumpluff"],
    [0x00BE, "Aipom"],
    [0x00BF, "Sunkern"],
    [0x00C0, "Sunflora"],
    [0x00C1, "Yanma"],
    [0x00C2, "Wooper"],
    [0x00C3, "Quagsire"],
    [0x00C4, "Espeon"],
    [0x00C5, "Umbreon"],
    [0x00C6, "Murkrow"],
    [0x00C7, "Slowking"],
    [0x00C8, "Misdreavus"],
    [0x00C9, "Unown A"],
    [0x00CA, "Unown B"],
    [0x00CB, "Unown C"],
    [0x00CC, "Unown D"],
    [0x00CD, "Unown E"],
    [0x00CE, "Unown F"],
    [0x00CF, "Unown G"],
    [0x00D0, "Unown H"],
    [0x00D1, "Unown I"],
    [0x00D2, "Unown J"],
    [0x00D3, "Unown K"],
    [0x00D4, "Unown L"],
    [0x00D5, "Unown M"],
    [0x00D6, "Unown N"],
    [0x00D7, "Unown O"],
    [0x00D8, "Unown P"],
    [0x00D9, "Unown Q"],
    [0x00DA, "Unown R"],
    [0x00DB, "Unown S"],
    [0x00DC, "Unown T"],
    [0x00DD, "Unown U"],
    [0x00DE, "Unown V"],
    [0x00DF, "Unown W"],
    [0x00E0, "Unown X"],
    [0x00E1, "Unown Y"],
    [0x00E2, "Unown Z"],
    [0x00E3, "Wobbuffet"],
    [0x00E4, "Girafarig"],
    [0x00E5, "Pineco"],
    [0x00E6, "Forretress"],
    [0x00E7, "Dunsparce"],
    [0x00E8, "Gligar"],
    [0x00E9, "Steelix"],
    [0x00EA, "Snubbull"],
    [0x00EB, "Granbull"],
    [0x00EC, "Qwilfish"],
    [0x00ED, "Scizor"],
    [0x00EE, "Shuckle"],
    [0x00EF, "Heracross"],
    [0x00F0, "Sneasel"],
    [0x00F1, "Teddiursa"],
    [0x00F2, "Ursaring"],
    [0x00F3, "Slugma"],
    [0x00F4, "Magcargo"],
    [0x00F5, "Swinub"],
    [0x00F6, "Piloswine"],
    [0x00F7, "Corsola"],
    [0x00F8, "Remoraid"],
    [0x00F9, "Octillery"],
    [0x00FA, "Delibird"],
    [0x00FB, "Mantine"],
    [0x00FC, "Skarmory"],
    [0x00FD, "Houndour"],
    [0x00FE, "Houndoom"],
    [0x00FF, "Kingdra"],
    [0x0100, "Phanpy"],
    [0x0101, "Donphan"],
    [0x0102, "Porygon2"],
    [0x0103, "Stantler"],
    [0x0104, "Smeargle"],
    [0x0105, "Tyrogue"],
    [0x0106, "Hitmontop"],
    [0x0107, "Smoochum"],
    [0x0108, "Elekid"],
    [0x0109, "Magby"],
    [0x010A, "Miltank"],
    [0x010B, "Blissey"],
    [0x010C, "Raikou"],
    [0x010D, "Entei"],
    [0x010E, "Suicune"],
    [0x010F, "Larvitar"],
    [0x0110, "Pupitar"],
    [0x0111, "Tyranitar"],
    [0x0112, "Lugia"],
    [0x0113, "Ho-Oh"],
    [0x0114, "Celebi"],
    [0x0115, "Treecko"],
    [0x0116, "Grovyle"],
    [0x0117, "Sceptile"],
    [0x0118, "Torchic"],
    [0x0119, "Combusken"],
    [0x011A, "Blaziken"],
    [0x011B, "Mudkip"],
    [0x011C, "Marshtomp"],
    [0x011D, "Swampert"],
    [0x011E, "Poochyena"],
    [0x011F, "Mightyena"],
    [0x0120, "Zigzagoon"],
    [0x0121, "Linoone"],
    [0x0122, "Wurmple"],
    [0x0123, "Silcoon"],
    [0x0124, "Beautifly"],
    [0x0125, "Cascoon"],
    [0x0126, "Dustox"],
    [0x0127, "Lotad"],
    [0x0128, "Lombre"],
    [0x0129, "Ludicolo"],
    [0x012A, "Seedot"],
    [0x012B, "Nuzleaf"],
    [0x012C, "Shiftry"],
    [0x012D, "Taillow"],
    [0x012E, "Swellow"],
    [0x012F, "Wingull"],
    [0x0130, "Pelipper"],
    [0x0131, "Ralts"],
    [0x0132, "Kirlia"],
    [0x0133, "Gardevoir"],
    [0x0134, "Surskit"],
    [0x0135, "Masquerain"],
    [0x0136, "Shroomish"],
    [0x0137, "Breloom"],
    [0x0138, "Slakoth"],
    [0x0139, "Vigoroth"],
    [0x013A, "Slaking"],
    [0x013B, "Nincada"],
    [0x013C, "Ninjask"],
    [0x013D, "Shedinja"],
    [0x013E, "Whismur"],
    [0x013F, "Loudred"],
    [0x0140, "Exploud"],
    [0x0141, "Makuhita"],
    [0x0142, "Hariyama"],
    [0x0143, "Azurill"],
    [0x0144, "Nosepass"],
    [0x0145, "Skitty"],
    [0x0146, "Delcatty"],
    [0x0147, "Sableye"],
    [0x0148, "Mawile"],
    [0x0149, "Aron"],
    [0x014A, "Lairon"],
    [0x014B, "Aggron"],
    [0x014C, "Meditite"],
    [0x014D, "Medicham"],
    [0x014E, "Electrike"],
    [0x014F, "Manectric"],
    [0x0150, "Plusle"],
    [0x0151, "Minun"],
    [0x0152, "Volbeat"],
    [0x0153, "Illumise"],
    [0x0154, "Roselia"],
    [0x0155, "Gulpin"],
    [0x0156, "Swalot"],
    [0x0157, "Carvanha"],
    [0x0158, "Sharpedo"],
    [0x0159, "Wailmer"],
    [0x015A, "Wailord"],
    [0x015B, "Numel"],
    [0x015C, "Camerupt"],
    [0x015D, "Torkoal"],
    [0x015E, "Spoink"],
    [0x015F, "Grumpig"],
    [0x0160, "Spinda"],
    [0x0161, "Trapinch"],
    [0x0162, "Vibrava"],
    [0x0163, "Flygon"],
    [0x0164, "Cacnea"],
    [0x0165, "Cacturne"],
    [0x0166, "Swablu"],
    [0x0167, "Altaria"],
    [0x0168, "Zangoose"],
    [0x0169, "Seviper"],
    [0x016A, "Lunatone"],
    [0x016B, "Solrock"],
    [0x016C, "Barboach"],
    [0x016D, "Whiscash"],
    [0x016E, "Corphish"],
    [0x016F, "Crawdaunt"],
    [0x0170, "Baltoy"],
    [0x0171, "Claydol"],
    [0x0172, "Lileep"],
    [0x0173, "Cradily"],
    [0x0174, "Anorith"],
    [0x0175, "Armaldo"],
    [0x0176, "Feebas"],
    [0x0177, "Milotic"],
    [0x0178, "Castform"],
    [0x0179, "Castform-Ice"],
    [0x017A, "Castform-Fire"],
    [0x017B, "Castform-Water"],
    [0x017C, "Kecleon"],
    [0x017D, "Shuppet"],
    [0x017E, "Banette"],
    [0x017F, "Duskull"],
    [0x0180, "Dusclops"],
    [0x0181, "Tropius"],
    [0x0182, "Chimecho"],
    [0x0183, "Absol"],
    [0x0184, "Wynaut"],
    [0x0185, "Snorunt"],
    [0x0186, "Glalie"],
    [0x0187, "Spheal"],
    [0x0188, "Sealeo"],
    [0x0189, "Walrein"],
    [0x018A, "Clamperl"],
    [0x018B, "Huntail"],
    [0x018C, "Gorebyss"],
    [0x018D, "Relicanth"],
    [0x018E, "Luvdisc"],
    [0x018F, "Bagon"],
    [0x0190, "Shelgon"],
    [0x0191, "Salamence"],
    [0x0192, "Beldum"],
    [0x0193, "Metang"],
    [0x0194, "Metagross"],
    [0x0195, "Regirock"],
    [0x0196, "Regice"],
    [0x0197, "Registeel"],
    [0x0198, "Latias"],
    [0x0199, "Latios"],
    [0x019A, "Kyogre"],
    [0x019B, "Groudon"],
    [0x019C, "Rayquaza"],
    [0x019D, "Jirachi"],
    [0x019E, "Deoxys"],
    [0x019F, "Unown !"],
    [0x01A0, "Unown ?"],
    [0x01A1, "Deoxys-Atk"],
    [0x01A2, "Deoxys-Def"],
    [0x01A3, "Deoxys-Init"],
    [0x01A4, "Munchlax"],
    [0x01A5, "Decoy"],
    [0x01A6, "Statue"],
    [0x01A7, "Rayquaza-2"],
]

friendAreas = [
    // Friend Area,     Mem Start, Slots
    ["Aged Chamber AN", 0x03E7D8,  14],
    ["Aged Chamber O?", 0x03ECA8,  14],
    ["Ancient Relic",   0x03F178,  06],
    ["Beau Plains",     0x039088,  12],
    ["Boulder Cave",    0x03D128,  04],
    ["Bountiful Sea",   0x037400,  09],
    ["Crater",          0x03E308,  07],
    ["Cryptic Cave",    0x03CFC8,  01],
    ["Darkness Ridge",  0x03F388,  13],
    ["Decrepit Lab",    0x03D700,  07],
    ["Deep-Sea Current",0x038008,  01],
    ["Deep-Sea Floor",  0x037BE8,  12],
    ["Dragon Cave",     0x03D020,  03],
    ["Echo Cave",       0x03CC00,  11],
    ["Enclosed Island", 0x040148,  01],
    ["Energetic Forest",0x03AEC8,  15],
    ["Final Island",    0x0401A0,  01],
    ["Flyaway Forest",  0x03A790,  12],
    ["Frigid Cavern",   0x03F800,  07],
    ["Furnace Desert",  0x03E570,  07],
    ["Healing Forest",  0x03B658,  01],
    ["Ice Floe Beach",  0x03FA68,  05],
    ["Jungle",          0x03D288,  13],
    ["Legendary Island",0x03FF90,  03],
    ["Magnetic Quarry", 0x03FE88,  03],
    ["Mist-Rise Forest",0x03A2C0,  14],
    ["Mt. Cleft",       0x038690,  09],
    ["Mt. Deepgreen",   0x038270,  12],
    ["Mt. Discipline",  0x03D968,  11],
    ["Mt. Moonview",    0x0389A8,  06],
    ["Mushroom Forest", 0x03B3F0,  07],
    ["Mystic Lake",     0x03C4C8,  04],
    ["Overgrown Forest",0x03ABB0,  09],
    ["Peanut Swamp",    0x03C788,  07],
    ["Poison Swamp",    0x03C9F0,  06],
    ["Power Plant",     0x03E0F8,  06],
    ["Rainbow Peak",    0x038BB8,  01],
    ["Ravaged Field",   0x03FCD0,  05],
    ["Rub-a-Dub River", 0x03BBD8,  07],
    ["Sacred Field",    0x03A1B8,  03],
    ["Safari",          0x039920,  15],
    ["Scorched Plains", 0x039E48,  10],
    ["Seafloor Cave",   0x038060,  01],
    ["Secretive Forest",0x03B8C0,  09],
    ["Serene Sea",      0x037A88,  04],
    ["Shallow Beach",   0x0380B8,  05],
    ["Sky Blue Plains", 0x0394A8,  13],
    ["Southern Island", 0x040098,  02],
    ["Stratos Lookout", 0x03FC78,  01],
    ["Tadpole Pond",    0x03BE40,  09],
    ["Thunder Meadow",  0x03DD30,  11],
    ["Transform Forest",0x03B6B0,  06],
    ["Treasure Sea",    0x037718,  10],
    ["Turtleshell Pond",0x03C158,  10],
    ["Volcanic Pit",    0x03FC20,  01],
    ["Waterfall Lake",  0x03C628,  04],
    ["Wild Plains",     0x038C10,  13],
]

//----------------------------------------
// Functions

function getPokemonID(pokemonName) {
    for pokemon in pokemonIDs {
        if (pokemon[1] == pokemonName) {
            return pokemon[0]
        }
    }
}

function getfriendAreaMemoryStart(friendAreaName) {
    for friendArea in friendAreas {
        if (friendArea[0] == friendAreaName) {
            return friendArea[1]
        }
    }
}

function getfriendAreaTotalSlots(friendAreaName) {
    for friendArea in friendAreas {
        if (friendArea[0] == friendAreaName) {
            return friendArea[2]
        }
    }
}

function checkfriendAreaForPokemon(friendAreaName, pokemonName) {
    memoryStart = getfriendAreaMemoryStart(friendAreaName)
    totalSlots  = getfriendAreaTotalSlots(friendAreaName)
    pokemonID   = getPokemonID(pokemonName)
    code = always_false()
    
    for i in range(0, totalSlots - 1) {
        code = code || word(memoryStart + (i * 0x58) + 0x08) *
                       bit0(memoryStart + (i * 0x58)) == pokemonID
    }
    return __ornext(code)
}

function checkfriendAreaGotNewPokemon(friendAreaName) {
    memoryStart = getfriendAreaMemoryStart(friendAreaName)
    totalSlots  = getfriendAreaTotalSlots(friendAreaName)
    code = always_false()
    
    for i in range(0, totalSlots - 1) {
        code = code || word(memoryStart + (i * 0x58) + 0x08) != prev(word(memoryStart + (i * 0x58) + 0x08)) ||
                       bit0(memoryStart + (i * 0x58)) > prev(bit0(memoryStart + (i * 0x58)))
    }
    return __ornext(pokeSquareMapID == 0x08 || // evolved new Friend in Luminous Cave
                    isInFrontOfRescueBase() || // got new Friend via Wish Stone
                    byte(0x00C139) > 0) &&     // was inside Dungeon before
           byte(0x04303c) != 0x00 &&
           __ornext(code)
}

function checkRecruitedLatiasOrLatios(friendAreaName) {
    memoryStart = getfriendAreaMemoryStart(friendAreaName)
    totalSlots  = getfriendAreaTotalSlots(friendAreaName)
    code = always_false()
    
    for i in range(0, totalSlots - 1) {
        code = code || word(memoryStart + (i * 0x58) + 0x08) != prev(word(memoryStart + (i * 0x58) + 0x08)) ||
                       bit0(memoryStart + (i * 0x58)) > prev(bit0(memoryStart + (i * 0x58)))
    }
    return __ornext(pokeSquareMapID == 0x01 ||  // recruited on Pokemon Square
                    isInFrontOfRescueBase()) && // got new Friend via Wish Stone
           byte(0x04303c) == 0x02 &&
           __ornext(code)
}

function isInFrontOfRescueBase() {
    return __ornext(pokeSquareMapID == 0x09 || pokeSquareMapID == 0x0A || pokeSquareMapID == 0x0B || // Pikachu Base
                    pokeSquareMapID == 0x0F || pokeSquareMapID == 0x10 || pokeSquareMapID == 0x11 || // Meowth Base
                    pokeSquareMapID == 0x15 || pokeSquareMapID == 0x16 || pokeSquareMapID == 0x17 || // Eevee Base
                    pokeSquareMapID == 0x1B || pokeSquareMapID == 0x1C || pokeSquareMapID == 0x1D || // Skitty Base
                    pokeSquareMapID == 0x21 || pokeSquareMapID == 0x22 || pokeSquareMapID == 0x23 || // Squirtle Base
                    pokeSquareMapID == 0x27 || pokeSquareMapID == 0x28 || pokeSquareMapID == 0x29 || // Totodile Base
                    pokeSquareMapID == 0x2D || pokeSquareMapID == 0x2E || pokeSquareMapID == 0x2F || // Mudkip Base
                    pokeSquareMapID == 0x33 || pokeSquareMapID == 0x34 || pokeSquareMapID == 0x35 || // Psyduck Base
                    pokeSquareMapID == 0x39 || pokeSquareMapID == 0x3A || pokeSquareMapID == 0x3B || // Charmander Base
                    pokeSquareMapID == 0x3F || pokeSquareMapID == 0x40 || pokeSquareMapID == 0x41 || // Torchic Base
                    pokeSquareMapID == 0x45 || pokeSquareMapID == 0x46 || pokeSquareMapID == 0x47 || // Cyndaquil Base
                    pokeSquareMapID == 0x4B || pokeSquareMapID == 0x4C || pokeSquareMapID == 0x4D || // Cubone Base
                    pokeSquareMapID == 0x51 || pokeSquareMapID == 0x52 || pokeSquareMapID == 0x53 || // Machop Base
                    pokeSquareMapID == 0x57 || pokeSquareMapID == 0x58 || pokeSquareMapID == 0x59 || // Bulbasaur Base
                    pokeSquareMapID == 0x5D || pokeSquareMapID == 0x5E || pokeSquareMapID == 0x5F || // Chikorita Base
                    pokeSquareMapID == 0x63 || pokeSquareMapID == 0x64 || pokeSquareMapID == 0x65    // Treecko Base
                   )
}

//----------------------------------------
// Achievements

achievement(
    title = "Friends of the Aged Chamber AN", points = 25,
    description = "Have every Pokémon recruited at the same time in the Aged Chamber AN Friend Area.",
    id = 85900, badge = "309123", published = "13.10.2019 13:50:05", modified = "10.01.2023 20:55:03",
    trigger = 
              checkfriendAreaForPokemon("Aged Chamber AN", "Unown A") &&
              checkfriendAreaForPokemon("Aged Chamber AN", "Unown B") &&
              checkfriendAreaForPokemon("Aged Chamber AN", "Unown C") &&
              checkfriendAreaForPokemon("Aged Chamber AN", "Unown D") &&
              checkfriendAreaForPokemon("Aged Chamber AN", "Unown E") &&
              checkfriendAreaForPokemon("Aged Chamber AN", "Unown F") &&
              checkfriendAreaForPokemon("Aged Chamber AN", "Unown G") &&
              checkfriendAreaForPokemon("Aged Chamber AN", "Unown H") &&
              checkfriendAreaForPokemon("Aged Chamber AN", "Unown I") &&
              checkfriendAreaForPokemon("Aged Chamber AN", "Unown J") &&
              checkfriendAreaForPokemon("Aged Chamber AN", "Unown K") &&
              checkfriendAreaForPokemon("Aged Chamber AN", "Unown L") &&
              checkfriendAreaForPokemon("Aged Chamber AN", "Unown M") &&
              checkfriendAreaForPokemon("Aged Chamber AN", "Unown N") &&
              checkfriendAreaGotNewPokemon("Aged Chamber AN")
)

achievement(
    title = "Friends of the Aged Chamber O?", points = 25,
    description = "Have every Pokémon recruited at the same time in the Aged Chamber O? Friend Area.",
    id = 85901, badge = "309124", published = "13.10.2019 13:50:07", modified = "10.01.2023 20:55:04",
    trigger = checkfriendAreaForPokemon("Aged Chamber O?", "Unown O") &&
              checkfriendAreaForPokemon("Aged Chamber O?", "Unown P") &&
              checkfriendAreaForPokemon("Aged Chamber O?", "Unown Q") &&
              checkfriendAreaForPokemon("Aged Chamber O?", "Unown R") &&
              checkfriendAreaForPokemon("Aged Chamber O?", "Unown S") &&
              checkfriendAreaForPokemon("Aged Chamber O?", "Unown T") &&
              checkfriendAreaForPokemon("Aged Chamber O?", "Unown U") &&
              checkfriendAreaForPokemon("Aged Chamber O?", "Unown V") &&
              checkfriendAreaForPokemon("Aged Chamber O?", "Unown W") &&
              checkfriendAreaForPokemon("Aged Chamber O?", "Unown X") &&
              checkfriendAreaForPokemon("Aged Chamber O?", "Unown Y") &&
              checkfriendAreaForPokemon("Aged Chamber O?", "Unown Z") &&
              checkfriendAreaForPokemon("Aged Chamber O?", "Unown !") &&
              checkfriendAreaForPokemon("Aged Chamber O?", "Unown ?") &&
              checkfriendAreaGotNewPokemon("Aged Chamber O?")
)

achievement(
    title = "Friends of the Ancient Relic", points = 5,
    description = "Have every Pokémon recruited at the same time in the Ancient Relic Friend Area.",
    id = 11868, badge = "309125", published = "21.08.2014 19:45:13", modified = "10.01.2023 20:55:05",
    trigger = checkfriendAreaForPokemon("Ancient Relic", "Aerodactyl") &&
              checkfriendAreaForPokemon("Ancient Relic", "Baltoy") &&
              checkfriendAreaForPokemon("Ancient Relic", "Claydol") &&
              checkfriendAreaForPokemon("Ancient Relic", "Regirock") &&
              checkfriendAreaForPokemon("Ancient Relic", "Regice") &&
              checkfriendAreaForPokemon("Ancient Relic", "Registeel") &&
              checkfriendAreaGotNewPokemon("Ancient Relic")
)

achievement(
    title = "Friends of the Beau Plains", points = 25,
    description = "Have every Pokémon recruited at the same time in the Beau Plains Friend Area.",
    id = 85902, badge = "309126", published = "13.10.2019 13:50:09", modified = "10.01.2023 20:55:05",
    trigger = checkfriendAreaForPokemon("Beau Plains", "Bulbasaur") &&
              checkfriendAreaForPokemon("Beau Plains", "Ivysaur") &&
              checkfriendAreaForPokemon("Beau Plains", "Venusaur") &&
              checkfriendAreaForPokemon("Beau Plains", "Chikorita") &&
              checkfriendAreaForPokemon("Beau Plains", "Bayleef") &&
              checkfriendAreaForPokemon("Beau Plains", "Meganium") &&
              checkfriendAreaForPokemon("Beau Plains", "Hoppip") &&
              checkfriendAreaForPokemon("Beau Plains", "Skiploom") &&
              checkfriendAreaForPokemon("Beau Plains", "Jumpluff") &&
              checkfriendAreaForPokemon("Beau Plains", "Taillow") &&
              checkfriendAreaForPokemon("Beau Plains", "Swellow") &&
              checkfriendAreaForPokemon("Beau Plains", "Roselia") &&
              checkfriendAreaGotNewPokemon("Beau Plains")
)

achievement(
    title = "Friends of the Boulder Cave", points = 5,
    description = "Have every Pokémon recruited at the same time in the Boulder Cave Friend Area.",
    id = 85903, badge = "309127", published = "13.10.2019 13:50:10", modified = "10.01.2023 20:55:05",
    trigger = checkfriendAreaForPokemon("Boulder Cave", "Diglett") &&
              checkfriendAreaForPokemon("Boulder Cave", "Dugtrio") &&
              checkfriendAreaForPokemon("Boulder Cave", "Onix") &&
              checkfriendAreaForPokemon("Boulder Cave", "Steelix") &&
              checkfriendAreaGotNewPokemon("Boulder Cave")
)

achievement(
    title = "Friends of the Bountiful Sea", points = 10,
    description = "Have every Pokémon recruited at the same time in the Bountiful Sea Friend Area.",
    id = 85904, badge = "309128", published = "13.10.2019 13:50:11", modified = "10.01.2023 20:55:06",
    trigger = checkfriendAreaForPokemon("Bountiful Sea", "Tentacool") &&
              checkfriendAreaForPokemon("Bountiful Sea", "Tentacruel") &&
              checkfriendAreaForPokemon("Bountiful Sea", "Slowpoke") &&
              checkfriendAreaForPokemon("Bountiful Sea", "Slowbro") &&
              checkfriendAreaForPokemon("Bountiful Sea", "Shellder") &&
              checkfriendAreaForPokemon("Bountiful Sea", "Cloyster") &&
              checkfriendAreaForPokemon("Bountiful Sea", "Staryu") &&
              checkfriendAreaForPokemon("Bountiful Sea", "Starmie") &&
              checkfriendAreaForPokemon("Bountiful Sea", "Slowking") &&
              checkfriendAreaGotNewPokemon("Bountiful Sea")
)

achievement(
    title = "Friends of the Crater", points = 10,
    description = "Have every Pokémon recruited at the same time in the Crater Friend Area.",
    id = 85905, badge = "309129", published = "13.10.2019 13:50:13", modified = "10.01.2023 20:55:07",
    trigger = checkfriendAreaForPokemon("Crater", "Magmar") &&
              checkfriendAreaForPokemon("Crater", "Slugma") &&
              checkfriendAreaForPokemon("Crater", "Magcargo") &&
              checkfriendAreaForPokemon("Crater", "Magby") &&
              checkfriendAreaForPokemon("Crater", "Numel") &&
              checkfriendAreaForPokemon("Crater", "Camerupt") &&
              checkfriendAreaForPokemon("Crater", "Torkoal") &&
              checkfriendAreaGotNewPokemon("Crater")
)

achievement(
    title = "Friend of the Cryptic Cave", points = 3,
    description = "Recruit Mewtwo.",
    id = 11867, badge = "309110", published = "21.08.2014 19:45:11", modified = "10.01.2023 20:54:58",
    trigger = checkfriendAreaForPokemon("Cryptic Cave", "Mewtwo") &&
              checkfriendAreaGotNewPokemon("Cryptic Cave")
)

achievement(
    title = "Friends of the Darkness Ridge", points = 25,
    description = "Have every Pokémon recruited at the same time in the Darkness Ridge Friend Area.",
    id = 85906, badge = "309130", published = "13.10.2019 13:50:14", modified = "10.01.2023 20:55:07",
    trigger = checkfriendAreaForPokemon("Darkness Ridge", "Vulpix") &&
              checkfriendAreaForPokemon("Darkness Ridge", "Ninetales") &&
              checkfriendAreaForPokemon("Darkness Ridge", "Gastly") &&
              checkfriendAreaForPokemon("Darkness Ridge", "Haunter") &&
              checkfriendAreaForPokemon("Darkness Ridge", "Gengar") &&
              checkfriendAreaForPokemon("Darkness Ridge", "Misdreavus") &&
              checkfriendAreaForPokemon("Darkness Ridge", "Sneasel") &&
              checkfriendAreaForPokemon("Darkness Ridge", "Sableye") &&
              checkfriendAreaForPokemon("Darkness Ridge", "Shuppet") &&
              checkfriendAreaForPokemon("Darkness Ridge", "Banette") &&
              checkfriendAreaForPokemon("Darkness Ridge", "Duskull") &&
              checkfriendAreaForPokemon("Darkness Ridge", "Dusclops") &&
              checkfriendAreaForPokemon("Darkness Ridge", "Absol") &&
              checkfriendAreaGotNewPokemon("Darkness Ridge")
)

achievement(
    title = "Friends of the Decrepit Lab", points = 10,
    description = "Have every Pokémon recruited at the same time in the Decrepit Lab Friend Area.",
    id = 85907, badge = "309131", published = "13.10.2019 13:50:16", modified = "10.01.2023 20:55:07",
    trigger = checkfriendAreaForPokemon("Decrepit Lab", "Abra") &&
              checkfriendAreaForPokemon("Decrepit Lab", "Kadabra") &&
              checkfriendAreaForPokemon("Decrepit Lab", "Alakazam") &&
              checkfriendAreaForPokemon("Decrepit Lab", "Mr. Mime") &&
              checkfriendAreaForPokemon("Decrepit Lab", "Ditto") &&
              checkfriendAreaForPokemon("Decrepit Lab", "Porygon") &&
              checkfriendAreaForPokemon("Decrepit Lab", "Porygon2") &&
              checkfriendAreaGotNewPokemon("Decrepit Lab")
)

achievement(
    title = "Friend of the Deep-Sea Current", points = 3,
    description = "Recruit Lugia.",
    id = 11864, badge = "309111", published = "21.08.2014 19:45:04", modified = "10.01.2023 20:54:58",
    trigger = checkfriendAreaForPokemon("Deep-Sea Current", "Lugia") &&
              checkfriendAreaGotNewPokemon("Deep-Sea Current")
)

achievement(
    title = "Friends of the Deep-Sea Floor", points = 25,
    description = "Have every Pokémon recruited at the same time in the Deep-Sea Floor Friend Area.",
    id = 85908, badge = "309132", published = "13.10.2019 13:50:17", modified = "10.01.2023 20:55:08",
    trigger = checkfriendAreaForPokemon("Deep-Sea Floor", "Omanyte") &&
              checkfriendAreaForPokemon("Deep-Sea Floor", "Omastar") &&
              checkfriendAreaForPokemon("Deep-Sea Floor", "Kabuto") &&
              checkfriendAreaForPokemon("Deep-Sea Floor", "Kabutops") &&
              checkfriendAreaForPokemon("Deep-Sea Floor", "Chinchou") &&
              checkfriendAreaForPokemon("Deep-Sea Floor", "Lanturn") &&
              checkfriendAreaForPokemon("Deep-Sea Floor", "Lileep") &&
              checkfriendAreaForPokemon("Deep-Sea Floor", "Cradily") &&
              checkfriendAreaForPokemon("Deep-Sea Floor", "Clamperl") &&
              checkfriendAreaForPokemon("Deep-Sea Floor", "Huntail") &&
              checkfriendAreaForPokemon("Deep-Sea Floor", "Gorebyss") &&
              checkfriendAreaForPokemon("Deep-Sea Floor", "Relicanth") &&
              checkfriendAreaGotNewPokemon("Deep-Sea Floor")
)

achievement(
    title = "Friends of the Dragon Cave", points = 5,
    description = "Have every Pokémon recruited at the same time in the Dragon Cave Friend Area.",
    id = 85909, badge = "309133", published = "13.10.2019 13:50:19", modified = "10.01.2023 20:55:08",
    trigger = checkfriendAreaForPokemon("Dragon Cave", "Bagon") &&
              checkfriendAreaForPokemon("Dragon Cave", "Shelgon") &&
              checkfriendAreaForPokemon("Dragon Cave", "Salamence") &&
              checkfriendAreaGotNewPokemon("Dragon Cave")
)

achievement(
    title = "Friends of the Echo Cave", points = 10,
    description = "Have every Pokémon recruited at the same time in the Echo Cave Friend Area.",
    id = 85910, badge = "309134", published = "13.10.2019 13:50:20", modified = "10.01.2023 20:55:09",
    trigger = checkfriendAreaForPokemon("Echo Cave", "Zubat") &&
              checkfriendAreaForPokemon("Echo Cave", "Golbat") &&
              checkfriendAreaForPokemon("Echo Cave", "Crobat") &&
              checkfriendAreaForPokemon("Echo Cave", "Wobbuffet") &&
              checkfriendAreaForPokemon("Echo Cave", "Dunsparce") &&
              checkfriendAreaForPokemon("Echo Cave", "Whismur") &&
              checkfriendAreaForPokemon("Echo Cave", "Loudred") &&
              checkfriendAreaForPokemon("Echo Cave", "Exploud") &&
              checkfriendAreaForPokemon("Echo Cave", "Nosepass") &&
              checkfriendAreaForPokemon("Echo Cave", "Mawile") &&
              checkfriendAreaForPokemon("Echo Cave", "Wynaut") &&
              checkfriendAreaGotNewPokemon("Echo Cave")
)

achievement(
    title = "Friend of the Enclosed Island", points = 3,
    description = "Recruit Deoxys.",
    id = 11857, badge = "309112", published = "21.08.2014 19:44:47", modified = "10.01.2023 20:54:59",
    trigger = __ornext(checkfriendAreaForPokemon("Enclosed Island", "Deoxys") ||
                       checkfriendAreaForPokemon("Enclosed Island", "Deoxys-Atk") ||
                       checkfriendAreaForPokemon("Enclosed Island", "Deoxys-Def") ||
                       checkfriendAreaForPokemon("Enclosed Island", "Deoxys-Init")) &&
              checkfriendAreaGotNewPokemon("Enclosed Island")
)

achievement(
    title = "Friends of the Energetic Forest", points = 25,
    description = "Have every Pokémon recruited at the same time in the Energetic Forest Friend Area.",
    id = 85911, badge = "309135", published = "13.10.2019 13:50:21", modified = "10.01.2023 20:55:09",
    trigger = checkfriendAreaForPokemon("Energetic Forest", "Pikachu") &&
              checkfriendAreaForPokemon("Energetic Forest", "Raichu") &&
              checkfriendAreaForPokemon("Energetic Forest", "Meowth") &&
              checkfriendAreaForPokemon("Energetic Forest", "Persian") &&
              checkfriendAreaForPokemon("Energetic Forest", "Mankey") &&
              checkfriendAreaForPokemon("Energetic Forest", "Primeape") &&
              checkfriendAreaForPokemon("Energetic Forest", "Snorlax") &&
              checkfriendAreaForPokemon("Energetic Forest", "Pichu") &&
              checkfriendAreaForPokemon("Energetic Forest", "Aipom") &&
              checkfriendAreaForPokemon("Energetic Forest", "Stantler") &&
              checkfriendAreaForPokemon("Energetic Forest", "Slakoth") &&
              checkfriendAreaForPokemon("Energetic Forest", "Vigoroth") &&
              checkfriendAreaForPokemon("Energetic Forest", "Slaking") &&
              checkfriendAreaForPokemon("Energetic Forest", "Skitty") &&
              checkfriendAreaForPokemon("Energetic Forest", "Delcatty") &&
              checkfriendAreaGotNewPokemon("Energetic Forest")
)

achievement(
    title = "Friend of the Final Island", points = 3,
    description = "Recruit Mew.",
    id = 11866, badge = "309113", published = "21.08.2014 19:45:09", modified = "10.01.2023 20:54:59",
    trigger = (checkfriendAreaForPokemon("Final Island", "Mew") &&
               checkfriendAreaGotNewPokemon("Final Island")) ||
              (byte(0x00C138) == 27 && word(0x0289A0) == 554)
)

achievement(
    title = "Friends of the Flyaway Forest", points = 25,
    description = "Have every Pokémon recruited at the same time in the Flyaway Forest Friend Area.",
    id = 85912, badge = "309136", published = "13.10.2019 13:50:23", modified = "10.01.2023 20:55:10",
    trigger = checkfriendAreaForPokemon("Flyaway Forest", "Pidgey") &&
              checkfriendAreaForPokemon("Flyaway Forest", "Pidgeotto") &&
              checkfriendAreaForPokemon("Flyaway Forest", "Pidgeot") &&
              checkfriendAreaForPokemon("Flyaway Forest", "Hoothoot") &&
              checkfriendAreaForPokemon("Flyaway Forest", "Noctowl") &&
              checkfriendAreaForPokemon("Flyaway Forest", "Togepi") &&
              checkfriendAreaForPokemon("Flyaway Forest", "Togetic") &&
              checkfriendAreaForPokemon("Flyaway Forest", "Natu") &&
              checkfriendAreaForPokemon("Flyaway Forest", "Xatu") &&
              checkfriendAreaForPokemon("Flyaway Forest", "Murkrow") &&
              checkfriendAreaForPokemon("Flyaway Forest", "Swablu") &&
              checkfriendAreaForPokemon("Flyaway Forest", "Altaria") &&
              checkfriendAreaGotNewPokemon("Flyaway Forest")
)

achievement(
    title = "Friends of the Frigid Cavern", points = 10,
    description = "Have every Pokémon recruited at the same time in the Frigid Cavern Friend Area.",
    id = 85913, badge = "309137", published = "13.10.2019 13:50:24", modified = "10.01.2023 20:55:10",
    trigger = checkfriendAreaForPokemon("Frigid Cavern", "Jynx") &&
              checkfriendAreaForPokemon("Frigid Cavern", "Swinub") &&
              checkfriendAreaForPokemon("Frigid Cavern", "Piloswine") &&
              checkfriendAreaForPokemon("Frigid Cavern", "Delibird") &&
              checkfriendAreaForPokemon("Frigid Cavern", "Smoochum") &&
              checkfriendAreaForPokemon("Frigid Cavern", "Snorunt") &&
              checkfriendAreaForPokemon("Frigid Cavern", "Glalie") &&
              checkfriendAreaGotNewPokemon("Frigid Cavern")
)

achievement(
    title = "Friends of the Furnace Desert", points = 10,
    description = "Have every Pokémon recruited at the same time in the Furnace Desert Friend Area.",
    id = 85914, badge = "309138", published = "13.10.2019 13:50:26", modified = "10.01.2023 20:55:10",
    trigger = checkfriendAreaForPokemon("Furnace Desert", "Sandshrew") &&
              checkfriendAreaForPokemon("Furnace Desert", "Sandslash") &&
              checkfriendAreaForPokemon("Furnace Desert", "Trapinch") &&
              checkfriendAreaForPokemon("Furnace Desert", "Vibrava") &&
              checkfriendAreaForPokemon("Furnace Desert", "Flygon") &&
              checkfriendAreaForPokemon("Furnace Desert", "Cacnea") &&
              checkfriendAreaForPokemon("Furnace Desert", "Cacturne") &&
              checkfriendAreaGotNewPokemon("Furnace Desert")
)

achievement(
    title = "Friend of the Healing Forest", points = 3,
    description = "Recruit Celebi.",
    id = 11865, badge = "309114", published = "21.08.2014 19:45:07", modified = "10.01.2023 20:54:59",
    trigger = checkfriendAreaForPokemon("Healing Forest", "Celebi") &&
              checkfriendAreaGotNewPokemon("Healing Forest")
)

achievement(
    title = "Friends of the Ice Floe Beach", points = 10,
    description = "Have every Pokémon recruited at the same time in the Ice Floe Beach Friend Area.",
    id = 85915, badge = "309139", published = "13.10.2019 13:50:27", modified = "10.01.2023 20:55:11",
    trigger = checkfriendAreaForPokemon("Ice Floe Beach", "Seel") &&
              checkfriendAreaForPokemon("Ice Floe Beach", "Dewgong") &&
              checkfriendAreaForPokemon("Ice Floe Beach", "Spheal") &&
              checkfriendAreaForPokemon("Ice Floe Beach", "Sealeo") &&
              checkfriendAreaForPokemon("Ice Floe Beach", "Walrein") &&
              checkfriendAreaGotNewPokemon("Ice Floe Beach")
)

achievement(
    title = "Friends of the Jungle", points = 25,
    description = "Have every Pokémon recruited at the same time in the Jungle Friend Area.",
    id = 85916, badge = "309140", published = "13.10.2019 13:50:28", modified = "10.01.2023 20:55:11",
    trigger = checkfriendAreaForPokemon("Jungle", "Oddish") &&
              checkfriendAreaForPokemon("Jungle", "Gloom") &&
              checkfriendAreaForPokemon("Jungle", "Vileplume") &&
              checkfriendAreaForPokemon("Jungle", "Bellsprout") &&
              checkfriendAreaForPokemon("Jungle", "Weepinbell") &&
              checkfriendAreaForPokemon("Jungle", "Victreebel") &&
              checkfriendAreaForPokemon("Jungle", "Exeggcute") &&
              checkfriendAreaForPokemon("Jungle", "Exeggutor") &&
              checkfriendAreaForPokemon("Jungle", "Tangela") &&
              checkfriendAreaForPokemon("Jungle", "Bellossom") &&
              checkfriendAreaForPokemon("Jungle", "Sunkern") &&
              checkfriendAreaForPokemon("Jungle", "Sunflora") &&
              checkfriendAreaForPokemon("Jungle", "Tropius") &&
              checkfriendAreaGotNewPokemon("Jungle")
)

achievement(
    title = "Friends of the Legendary Island", points = 5,
    description = "Have every Pokémon recruited at the same time in the Legendary Island Friend Area.",
    id = 11854, badge = "309141", published = "21.08.2014 19:44:40", modified = "10.01.2023 20:55:12",
    trigger = checkfriendAreaForPokemon("Legendary Island", "Articuno") &&
              checkfriendAreaForPokemon("Legendary Island", "Zapdos") &&
              checkfriendAreaForPokemon("Legendary Island", "Moltres") &&
              checkfriendAreaGotNewPokemon("Legendary Island")
)

achievement(
    title = "Friends of the Magnetic Quarry", points = 5,
    description = "Have every Pokémon recruited at the same time in the Magnetic Quarry Friend Area.",
    id = 85917, badge = "309142", published = "13.10.2019 13:50:30", modified = "10.01.2023 20:55:12",
    trigger = checkfriendAreaForPokemon("Magnetic Quarry", "Beldum") &&
              checkfriendAreaForPokemon("Magnetic Quarry", "Metang") &&
              checkfriendAreaForPokemon("Magnetic Quarry", "Metagross") &&
              checkfriendAreaGotNewPokemon("Magnetic Quarry")
)

achievement(
    title = "Friends of the Mist-Rise Forest", points = 25,
    description = "Have every Pokémon recruited at the same time in the Mist-Rise Forest Friend Area.",
    id = 85918, badge = "309143", published = "13.10.2019 13:50:31", modified = "10.01.2023 20:55:12",
    trigger = checkfriendAreaForPokemon("Mist-Rise Forest", "Caterpie") &&
              checkfriendAreaForPokemon("Mist-Rise Forest", "Metapod") &&
              checkfriendAreaForPokemon("Mist-Rise Forest", "Butterfree") &&
              checkfriendAreaForPokemon("Mist-Rise Forest", "Weedle") &&
              checkfriendAreaForPokemon("Mist-Rise Forest", "Kakuna") &&
              checkfriendAreaForPokemon("Mist-Rise Forest", "Beedrill") &&
              checkfriendAreaForPokemon("Mist-Rise Forest", "Ledyba") &&
              checkfriendAreaForPokemon("Mist-Rise Forest", "Ledian") &&
              checkfriendAreaForPokemon("Mist-Rise Forest", "Yanma") &&
              checkfriendAreaForPokemon("Mist-Rise Forest", "Wurmple") &&
              checkfriendAreaForPokemon("Mist-Rise Forest", "Silcoon") &&
              checkfriendAreaForPokemon("Mist-Rise Forest", "Beautifly") &&
              checkfriendAreaForPokemon("Mist-Rise Forest", "Cascoon") &&
              checkfriendAreaForPokemon("Mist-Rise Forest", "Dustox") &&
              checkfriendAreaGotNewPokemon("Mist-Rise Forest")
)

achievement(
    title = "Friends of Mt. Cleft", points = 10,
    description = "Have every Pokémon recruited at the same time in the Mt. Cleft Friend Area.",
    id = 85919, badge = "309119", published = "13.10.2019 13:50:33", modified = "10.01.2023 20:55:01",
    trigger = checkfriendAreaForPokemon("Mt. Cleft", "Charmander") &&
              checkfriendAreaForPokemon("Mt. Cleft", "Charmeleon") &&
              checkfriendAreaForPokemon("Mt. Cleft", "Charizard") &&
              checkfriendAreaForPokemon("Mt. Cleft", "Larvitar") &&
              checkfriendAreaForPokemon("Mt. Cleft", "Pupitar") &&
              checkfriendAreaForPokemon("Mt. Cleft", "Tyranitar") &&
              checkfriendAreaForPokemon("Mt. Cleft", "Aron") &&
              checkfriendAreaForPokemon("Mt. Cleft", "Lairon") &&
              checkfriendAreaForPokemon("Mt. Cleft", "Aggron") &&
              checkfriendAreaGotNewPokemon("Mt. Cleft")
)

achievement(
    title = "Friends of Mt. Deepgreen", points = 25,
    description = "Have every Pokémon recruited at the same time in the Mt. Deepgreen Friend Area.",
    id = 85920, badge = "309120", published = "13.10.2019 13:50:34", modified = "10.01.2023 20:55:02",
    trigger = checkfriendAreaForPokemon("Mt. Deepgreen", "Geodude") &&
              checkfriendAreaForPokemon("Mt. Deepgreen", "Graveler") &&
              checkfriendAreaForPokemon("Mt. Deepgreen", "Golem") &&
              checkfriendAreaForPokemon("Mt. Deepgreen", "Cubone") &&
              checkfriendAreaForPokemon("Mt. Deepgreen", "Marowak") &&
              checkfriendAreaForPokemon("Mt. Deepgreen", "Gligar") &&
              checkfriendAreaForPokemon("Mt. Deepgreen", "Shuckle") &&
              checkfriendAreaForPokemon("Mt. Deepgreen", "Teddiursa") &&
              checkfriendAreaForPokemon("Mt. Deepgreen", "Ursaring") &&
              checkfriendAreaForPokemon("Mt. Deepgreen", "Spoink") &&
              checkfriendAreaForPokemon("Mt. Deepgreen", "Grumpig") &&
              checkfriendAreaForPokemon("Mt. Deepgreen", "Spinda") &&
              checkfriendAreaGotNewPokemon("Mt. Deepgreen")
)

achievement(
    title = "Friends of Mt. Discipline", points = 10,
    description = "Have every Pokémon recruited at the same time in the Mt. Discipline Friend Area.",
    id = 85921, badge = "309121", published = "13.10.2019 13:50:36", modified = "10.01.2023 20:55:03",
    trigger = checkfriendAreaForPokemon("Mt. Discipline", "Machop") &&
              checkfriendAreaForPokemon("Mt. Discipline", "Machoke") &&
              checkfriendAreaForPokemon("Mt. Discipline", "Machamp") &&
              checkfriendAreaForPokemon("Mt. Discipline", "Hitmonlee") &&
              checkfriendAreaForPokemon("Mt. Discipline", "Hitmonchan") &&
              checkfriendAreaForPokemon("Mt. Discipline", "Tyrogue") &&
              checkfriendAreaForPokemon("Mt. Discipline", "Hitmontop") &&
              checkfriendAreaForPokemon("Mt. Discipline", "Makuhita") &&
              checkfriendAreaForPokemon("Mt. Discipline", "Hariyama") &&
              checkfriendAreaForPokemon("Mt. Discipline", "Meditite") &&
              checkfriendAreaForPokemon("Mt. Discipline", "Medicham") &&
              checkfriendAreaGotNewPokemon("Mt. Discipline")
)

achievement(
    title = "Friends of Mt. Moonview", points = 5,
    description = "Have every Pokémon recruited at the same time in the Mt. Moonview Friend Area.",
    id = 11860, badge = "309122", published = "21.08.2014 19:44:55", modified = "10.01.2023 20:55:03",
    trigger = checkfriendAreaForPokemon("Mt. Moonview", "Clefairy") &&
              checkfriendAreaForPokemon("Mt. Moonview", "Clefable") &&
              checkfriendAreaForPokemon("Mt. Moonview", "Cleffa") &&
              checkfriendAreaForPokemon("Mt. Moonview", "Lunatone") &&
              checkfriendAreaForPokemon("Mt. Moonview", "Solrock") &&
              checkfriendAreaForPokemon("Mt. Moonview", "Jirachi") &&
              checkfriendAreaGotNewPokemon("Mt. Moonview")
)

achievement(
    title = "Friends of the Mushroom Forest", points = 10,
    description = "Have every Pokémon recruited at the same time in the Mushroom Forest Friend Area.",
    id = 85922, badge = "309144", published = "13.10.2019 13:50:37", modified = "10.01.2023 20:55:13",
    trigger = checkfriendAreaForPokemon("Mushroom Forest", "Paras") &&
              checkfriendAreaForPokemon("Mushroom Forest", "Parasect") &&
              checkfriendAreaForPokemon("Mushroom Forest", "Seedot") &&
              checkfriendAreaForPokemon("Mushroom Forest", "Nuzleaf") &&
              checkfriendAreaForPokemon("Mushroom Forest", "Shiftry") &&
              checkfriendAreaForPokemon("Mushroom Forest", "Shroomish") &&
              checkfriendAreaForPokemon("Mushroom Forest", "Breloom") &&
              checkfriendAreaGotNewPokemon("Mushroom Forest")
)

achievement(
    title = "Friends of the Mystic Lake", points = 5,
    description = "Have every Pokémon recruited at the same time in the Mystic Lake Friend Area.",
    id = 85923, badge = "309145", published = "13.10.2019 13:50:38", modified = "10.01.2023 20:55:14",
    trigger = checkfriendAreaForPokemon("Mystic Lake", "Lapras") &&
              checkfriendAreaForPokemon("Mystic Lake", "Dratini") &&
              checkfriendAreaForPokemon("Mystic Lake", "Dragonair") &&
              checkfriendAreaForPokemon("Mystic Lake", "Dragonite") &&
              checkfriendAreaGotNewPokemon("Mystic Lake")
)

achievement(
    title = "Friends of the Overgrown Forest", points = 50,
    description = "Have every Pokémon recruited at the same time in the Overgrown Forest Friend Area.",
    id = 85924, badge = "309146", published = "13.10.2019 13:50:40", modified = "10.01.2023 20:55:14",
    trigger = checkfriendAreaForPokemon("Overgrown Forest", "Scyther") &&
              checkfriendAreaForPokemon("Overgrown Forest", "Pinsir") &&
              checkfriendAreaForPokemon("Overgrown Forest", "Sudowoodo") &&
              checkfriendAreaForPokemon("Overgrown Forest", "Scizor") &&
              checkfriendAreaForPokemon("Overgrown Forest", "Heracross") &&
              checkfriendAreaForPokemon("Overgrown Forest", "Treecko") &&
              checkfriendAreaForPokemon("Overgrown Forest", "Grovyle") &&
              checkfriendAreaForPokemon("Overgrown Forest", "Sceptile") &&
              checkfriendAreaForPokemon("Overgrown Forest", "Kecleon") &&
              checkfriendAreaGotNewPokemon("Overgrown Forest")
)

achievement(
    title = "Friends of the Peanut Swamp", points = 10,
    description = "Have every Pokémon recruited at the same time in the Peanut Swamp Friend Area.",
    id = 85925, badge = "309147", published = "13.10.2019 13:50:41", modified = "10.01.2023 20:55:14",
    trigger = checkfriendAreaForPokemon("Peanut Swamp", "Wooper") &&
              checkfriendAreaForPokemon("Peanut Swamp", "Quagsire") &&
              checkfriendAreaForPokemon("Peanut Swamp", "Mudkip") &&
              checkfriendAreaForPokemon("Peanut Swamp", "Marshtomp") &&
              checkfriendAreaForPokemon("Peanut Swamp", "Swampert") &&
              checkfriendAreaForPokemon("Peanut Swamp", "Barboach") &&
              checkfriendAreaForPokemon("Peanut Swamp", "Whiscash") &&
              checkfriendAreaGotNewPokemon("Peanut Swamp")
)

achievement(
    title = "Friends of the Poison Swamp", points = 5,
    description = "Have every Pokémon recruited at the same time in the Poison Swamp Friend Area.",
    id = 85926, badge = "309148", published = "13.10.2019 13:50:42", modified = "10.01.2023 20:55:15",
    trigger = checkfriendAreaForPokemon("Poison Swamp", "Grimer") &&
              checkfriendAreaForPokemon("Poison Swamp", "Muk") &&
              checkfriendAreaForPokemon("Poison Swamp", "Koffing") &&
              checkfriendAreaForPokemon("Poison Swamp", "Weezing") &&
              checkfriendAreaForPokemon("Poison Swamp", "Gulpin") &&
              checkfriendAreaForPokemon("Poison Swamp", "Swalot") &&
              checkfriendAreaGotNewPokemon("Poison Swamp")
)

achievement(
    title = "Friends of the Power Plant", points = 5,
    description = "Have every Pokémon recruited at the same time in the Power Plant Friend Area.",
    id = 85927, badge = "309149", published = "13.10.2019 13:50:43", modified = "10.01.2023 20:55:15",
    trigger = checkfriendAreaForPokemon("Power Plant", "Magnemite") &&
              checkfriendAreaForPokemon("Power Plant", "Magneton") &&
              checkfriendAreaForPokemon("Power Plant", "Voltorb") &&
              checkfriendAreaForPokemon("Power Plant", "Electrode") &&
              checkfriendAreaForPokemon("Power Plant", "Electabuzz") &&
              checkfriendAreaForPokemon("Power Plant", "Elekid") &&
              checkfriendAreaGotNewPokemon("Power Plant")
)

achievement(
    title = "Friend of the Rainbow Peak", points = 3,
    description = "Recruit Ho-Oh.",
    id = 11861, badge = "309115", published = "21.08.2014 19:44:57", modified = "10.01.2023 20:55:00",
    trigger = checkfriendAreaForPokemon("Rainbow Peak", "Ho-Oh") &&
              checkfriendAreaGotNewPokemon("Rainbow Peak")
)

achievement(
    title = "Friends of the Ravaged Field", points = 5,
    description = "Have every Pokémon recruited at the same time in the Ravaged Field Friend Area.",
    id = 85928, badge = "309150", published = "13.10.2019 13:50:45", modified = "10.01.2023 20:55:15",
    trigger = checkfriendAreaForPokemon("Ravaged Field", "Spearow") &&
              checkfriendAreaForPokemon("Ravaged Field", "Fearow") &&
              checkfriendAreaForPokemon("Ravaged Field", "Skarmory") &&
              checkfriendAreaForPokemon("Ravaged Field", "Houndour") &&
              checkfriendAreaForPokemon("Ravaged Field", "Houndoom") &&
              checkfriendAreaGotNewPokemon("Ravaged Field")
)

achievement(
    title = "Friends of the Rub-a-Dub River", points = 10,
    description = "Have every Pokémon recruited at the same time in the Rub-a-Dub River Friend Area.",
    id = 85929, badge = "309151", published = "13.10.2019 13:50:47", modified = "10.01.2023 20:55:16",
    trigger = checkfriendAreaForPokemon("Rub-a-Dub River", "Goldeen") &&
              checkfriendAreaForPokemon("Rub-a-Dub River", "Seaking") &&
              checkfriendAreaForPokemon("Rub-a-Dub River", "Totodile") &&
              checkfriendAreaForPokemon("Rub-a-Dub River", "Croconaw") &&
              checkfriendAreaForPokemon("Rub-a-Dub River", "Feraligatr") &&
              checkfriendAreaForPokemon("Rub-a-Dub River", "Volbeat") &&
              checkfriendAreaForPokemon("Rub-a-Dub River", "Illumise") &&
              checkfriendAreaGotNewPokemon("Rub-a-Dub River")
)

achievement(
    title = "Friends of the Sacred Field", points = 5,
    description = "Have every Pokémon recruited at the same time in the Sacred Field Friend Area.",
    id = 11858, badge = "309152", published = "21.08.2014 19:44:50", modified = "10.01.2023 20:55:16",
    trigger = checkfriendAreaForPokemon("Sacred Field", "Entei") &&
              checkfriendAreaForPokemon("Sacred Field", "Raikou") &&
              checkfriendAreaForPokemon("Sacred Field", "Suicune") &&
              checkfriendAreaGotNewPokemon("Sacred Field")
)

achievement(
    title = "Friends of the Safari", points = 25,
    description = "Have every Pokémon recruited at the same time in the Safari Friend Area.",
    id = 85930, badge = "309153", published = "13.10.2019 13:50:48", modified = "10.01.2023 20:55:16",
    trigger = checkfriendAreaForPokemon("Safari", "Nidoran♀") &&
              checkfriendAreaForPokemon("Safari", "Nidorina") &&
              checkfriendAreaForPokemon("Safari", "Nidoqueen") &&
              checkfriendAreaForPokemon("Safari", "Nidoran♂") &&
              checkfriendAreaForPokemon("Safari", "Nidorino") &&
              checkfriendAreaForPokemon("Safari", "Nidoking") &&
              checkfriendAreaForPokemon("Safari", "Doduo") &&
              checkfriendAreaForPokemon("Safari", "Dodrio") &&
              checkfriendAreaForPokemon("Safari", "Rhyhorn") &&
              checkfriendAreaForPokemon("Safari", "Rhydon") &&
              checkfriendAreaForPokemon("Safari", "Kangaskhan") &&
              checkfriendAreaForPokemon("Safari", "Tauros") &&
              checkfriendAreaForPokemon("Safari", "Phanpy") &&
              checkfriendAreaForPokemon("Safari", "Donphan") &&
              checkfriendAreaForPokemon("Safari", "Miltank") &&
              checkfriendAreaGotNewPokemon("Safari")
)

achievement(
    title = "Friends of the Scorched Plains", points = 10,
    description = "Have every Pokémon recruited at the same time in the Scorched Plains Friend Area.",
    id = 85931, badge = "309154", published = "13.10.2019 13:50:49", modified = "10.01.2023 20:55:17",
    trigger = checkfriendAreaForPokemon("Scorched Plains", "Growlithe") &&
              checkfriendAreaForPokemon("Scorched Plains", "Arcanine") &&
              checkfriendAreaForPokemon("Scorched Plains", "Ponyta") &&
              checkfriendAreaForPokemon("Scorched Plains", "Rapidash") &&
              checkfriendAreaForPokemon("Scorched Plains", "Cyndaquil") &&
              checkfriendAreaForPokemon("Scorched Plains", "Quilava") &&
              checkfriendAreaForPokemon("Scorched Plains", "Typhlosion") &&
              checkfriendAreaForPokemon("Scorched Plains", "Torchic") &&
              checkfriendAreaForPokemon("Scorched Plains", "Combusken") &&
              checkfriendAreaForPokemon("Scorched Plains", "Blaziken") &&
              checkfriendAreaGotNewPokemon("Scorched Plains")
)

achievement(
    title = "Friend of the Seafloor Cave", points = 3,
    description = "Recruit Kyogre.",
    id = 11862, badge = "309116", published = "21.08.2014 19:45:00", modified = "10.01.2023 20:55:00",
    trigger = checkfriendAreaForPokemon("Seafloor Cave", "Kyogre") &&
              checkfriendAreaGotNewPokemon("Seafloor Cave")
)

achievement(
    title = "Friends of the Secretive Forest", points = 10,
    description = "Have every Pokémon recruited at the same time in the Secretive Forest Friend Area.",
    id = 85932, badge = "309155", published = "13.10.2019 13:50:51", modified = "10.01.2023 20:55:17",
    trigger = checkfriendAreaForPokemon("Secretive Forest", "Venonat") &&
              checkfriendAreaForPokemon("Secretive Forest", "Venomoth") &&
              checkfriendAreaForPokemon("Secretive Forest", "Spinarak") &&
              checkfriendAreaForPokemon("Secretive Forest", "Ariados") &&
              checkfriendAreaForPokemon("Secretive Forest", "Pineco") &&
              checkfriendAreaForPokemon("Secretive Forest", "Forretress") &&
              checkfriendAreaForPokemon("Secretive Forest", "Nincada") &&
              checkfriendAreaForPokemon("Secretive Forest", "Ninjask") &&
              checkfriendAreaForPokemon("Secretive Forest", "Shedinja") &&
              checkfriendAreaGotNewPokemon("Secretive Forest")
)

achievement(
    title = "Friends of the Serene Sea", points = 5,
    description = "Have every Pokémon recruited at the same time in the Serene Sea Friend Area.",
    id = 85933, badge = "309156", published = "13.10.2019 13:50:52", modified = "10.01.2023 20:55:17",
    trigger = checkfriendAreaForPokemon("Serene Sea", "Qwilfish") &&
              checkfriendAreaForPokemon("Serene Sea", "Mantine") &&
              checkfriendAreaForPokemon("Serene Sea", "Wailmer") &&
              checkfriendAreaForPokemon("Serene Sea", "Wailord") &&
              checkfriendAreaGotNewPokemon("Serene Sea")
)

achievement(
    title = "Friends of the Shallow Beach", points = 5,
    description = "Have every Pokémon recruited at the same time in the Shallow Beach Friend Area.",
    id = 85934, badge = "309157", published = "13.10.2019 13:50:54", modified = "10.01.2023 20:55:18",
    trigger = checkfriendAreaForPokemon("Shallow Beach", "Krabby") &&
              checkfriendAreaForPokemon("Shallow Beach", "Kingler") &&
              checkfriendAreaForPokemon("Shallow Beach", "Corsola") &&
              checkfriendAreaForPokemon("Shallow Beach", "Wingull") &&
              checkfriendAreaForPokemon("Shallow Beach", "Pelipper") &&
              checkfriendAreaGotNewPokemon("Shallow Beach")
)

achievement(
    title = "Friends of the Sky Blue Plains", points = 25,
    description = "Have every Pokémon recruited at the same time in the Sky Blue Plains Friend Area.",
    id = 85935, badge = "309158", published = "13.10.2019 13:50:55", modified = "10.01.2023 20:55:18",
    trigger = checkfriendAreaForPokemon("Sky Blue Plains", "Jigglypuff") &&
              checkfriendAreaForPokemon("Sky Blue Plains", "Wigglytuff") &&
              checkfriendAreaForPokemon("Sky Blue Plains", "Lickitung") &&
              checkfriendAreaForPokemon("Sky Blue Plains", "Chansey") &&
              checkfriendAreaForPokemon("Sky Blue Plains", "Igglybuff") &&
              checkfriendAreaForPokemon("Sky Blue Plains", "Girafarig") &&
              checkfriendAreaForPokemon("Sky Blue Plains", "Snubbull") &&
              checkfriendAreaForPokemon("Sky Blue Plains", "Granbull") &&
              checkfriendAreaForPokemon("Sky Blue Plains", "Smeargle") &&
              checkfriendAreaForPokemon("Sky Blue Plains", "Blissey") &&
              checkfriendAreaForPokemon("Sky Blue Plains", "Ralts") &&
              checkfriendAreaForPokemon("Sky Blue Plains", "Kirlia") &&
              checkfriendAreaForPokemon("Sky Blue Plains", "Gardevoir") &&
              checkfriendAreaGotNewPokemon("Sky Blue Plains")
)

achievement(
    title = "Friends of the Southern Island", points = 3,
    description = "Recruit Latios and Latias.",
    id = 11859, badge = "309159", published = "21.08.2014 19:44:52", modified = "10.01.2023 20:55:18",
    trigger = checkfriendAreaForPokemon("Southern Island", "Latias") &&
              checkfriendAreaForPokemon("Southern Island", "Latios") &&
              checkRecruitedLatiasOrLatios("Southern Island")
)

achievement(
    title = "Friend of the Stratos Lookout", points = 3,
    description = "Recruit Rayquaza.",
    id = 11863, badge = "309117", published = "21.08.2014 19:45:02", modified = "10.01.2023 20:55:00",
    trigger = __ornext(checkfriendAreaForPokemon("Stratos Lookout", "Rayquaza") ||
                       checkfriendAreaForPokemon("Stratos Lookout", "Rayquaza-2")) &&
              checkfriendAreaGotNewPokemon("Stratos Lookout")
)

achievement(
    title = "Friends of the Tadpole Pond", points = 10,
    description = "Have every Pokémon recruited at the same time in the Tadpole Pond Friend Area.",
    id = 85936, badge = "309160", published = "13.10.2019 13:50:56", modified = "10.01.2023 20:55:19",
    trigger = checkfriendAreaForPokemon("Tadpole Pond", "Poliwag") &&
              checkfriendAreaForPokemon("Tadpole Pond", "Poliwhirl") &&
              checkfriendAreaForPokemon("Tadpole Pond", "Poliwrath") &&
              checkfriendAreaForPokemon("Tadpole Pond", "Politoed") &&
              checkfriendAreaForPokemon("Tadpole Pond", "Lotad") &&
              checkfriendAreaForPokemon("Tadpole Pond", "Lombre") &&
              checkfriendAreaForPokemon("Tadpole Pond", "Ludicolo") &&
              checkfriendAreaForPokemon("Tadpole Pond", "Surskit") &&
              checkfriendAreaForPokemon("Tadpole Pond", "Masquerain") &&
              checkfriendAreaGotNewPokemon("Tadpole Pond")
)

achievement(
    title = "Friends of the Thunder Meadow", points = 10,
    description = "Have every Pokémon recruited at the same time in the Thunder Meadow Friend Area.",
    id = 85937, badge = "309161", published = "13.10.2019 13:50:57", modified = "10.01.2023 20:55:19",
    trigger = checkfriendAreaForPokemon("Thunder Meadow", "Sentret") &&
              checkfriendAreaForPokemon("Thunder Meadow", "Furret") &&
              checkfriendAreaForPokemon("Thunder Meadow", "Mareep") &&
              checkfriendAreaForPokemon("Thunder Meadow", "Flaaffy") &&
              checkfriendAreaForPokemon("Thunder Meadow", "Ampharos") &&
              checkfriendAreaForPokemon("Thunder Meadow", "Electrike") &&
              checkfriendAreaForPokemon("Thunder Meadow", "Manectric") &&
              checkfriendAreaForPokemon("Thunder Meadow", "Plusle") &&
              checkfriendAreaForPokemon("Thunder Meadow", "Minun") &&
              __ornext(checkfriendAreaForPokemon("Thunder Meadow", "Castform") ||
                       checkfriendAreaForPokemon("Thunder Meadow", "Castform-Ice") ||
                       checkfriendAreaForPokemon("Thunder Meadow", "Castform-Fire") ||
                       checkfriendAreaForPokemon("Thunder Meadow", "Castform-Water")) &&
              checkfriendAreaForPokemon("Thunder Meadow", "Chimecho") &&
              checkfriendAreaGotNewPokemon("Thunder Meadow")
)

achievement(
    title = "Friends of the Transform Forest", points = 5,
    description = "Have every Pokémon recruited at the same time in the Transform Forest Friend Area.",
    id = 85938, badge = "309162", published = "13.10.2019 13:50:59", modified = "10.01.2023 20:55:19",
    trigger = checkfriendAreaForPokemon("Transform Forest", "Eevee") &&
              checkfriendAreaForPokemon("Transform Forest", "Vaporeon") &&
              checkfriendAreaForPokemon("Transform Forest", "Jolteon") &&
              checkfriendAreaForPokemon("Transform Forest", "Flareon") &&
              checkfriendAreaForPokemon("Transform Forest", "Espeon") &&
              checkfriendAreaForPokemon("Transform Forest", "Umbreon") &&
              checkfriendAreaGotNewPokemon("Transform Forest")
)

achievement(
    title = "Friends of the Treasure Sea", points = 10,
    description = "Have every Pokémon recruited at the same time in the Treasure Sea Friend Area.",
    id = 85939, badge = "309163", published = "13.10.2019 13:51:01", modified = "10.01.2023 20:55:20",
    trigger = checkfriendAreaForPokemon("Treasure Sea", "Horsea") &&
              checkfriendAreaForPokemon("Treasure Sea", "Seadra") &&
              checkfriendAreaForPokemon("Treasure Sea", "Remoraid") &&
              checkfriendAreaForPokemon("Treasure Sea", "Octillery") &&
              checkfriendAreaForPokemon("Treasure Sea", "Kingdra") &&
              checkfriendAreaForPokemon("Treasure Sea", "Carvanha") &&
              checkfriendAreaForPokemon("Treasure Sea", "Sharpedo") &&
              checkfriendAreaForPokemon("Treasure Sea", "Anorith") &&
              checkfriendAreaForPokemon("Treasure Sea", "Armaldo") &&
              checkfriendAreaForPokemon("Treasure Sea", "Luvdisc") &&
              checkfriendAreaGotNewPokemon("Treasure Sea")
)

achievement(
    title = "Friends of the Turtleshell Pond", points = 10,
    description = "Have every Pokémon recruited at the same time in the Turtleshell Pond Friend Area.",
    id = 85940, badge = "309164", published = "13.10.2019 13:51:07", modified = "10.01.2023 20:55:20",
    trigger = checkfriendAreaForPokemon("Turtleshell Pond", "Squirtle") &&
              checkfriendAreaForPokemon("Turtleshell Pond", "Wartortle") &&
              checkfriendAreaForPokemon("Turtleshell Pond", "Blastoise") &&
              checkfriendAreaForPokemon("Turtleshell Pond", "Psyduck") &&
              checkfriendAreaForPokemon("Turtleshell Pond", "Golduck") &&
              checkfriendAreaForPokemon("Turtleshell Pond", "Marill") &&
              checkfriendAreaForPokemon("Turtleshell Pond", "Azumarill") &&
              checkfriendAreaForPokemon("Turtleshell Pond", "Azurill") &&
              checkfriendAreaForPokemon("Turtleshell Pond", "Corphish") &&
              checkfriendAreaForPokemon("Turtleshell Pond", "Crawdaunt") &&
              checkfriendAreaGotNewPokemon("Turtleshell Pond")
)

achievement(
    title = "Friend of the Volcanic Pit", points = 3,
    description = "Recruit Groudon.",
    id = 11869, badge = "309118", published = "21.08.2014 19:45:17", modified = "10.01.2023 20:55:01",
    trigger = checkfriendAreaForPokemon("Volcanic Pit", "Groudon") &&
              checkfriendAreaGotNewPokemon("Volcanic Pit")
)

achievement(
    title = "Friends of the Waterfall Lake", points = 3,
    description = "Have every Pokémon recruited at the same time in the Waterfall Lake Friend Area.",
    id = 85941, badge = "309165", published = "13.10.2019 13:51:09", modified = "10.01.2023 20:55:21",
    trigger = checkfriendAreaForPokemon("Waterfall Lake", "Magikarp") &&
              checkfriendAreaForPokemon("Waterfall Lake", "Gyarados") &&
              checkfriendAreaForPokemon("Waterfall Lake", "Feebas") &&
              checkfriendAreaForPokemon("Waterfall Lake", "Milotic") &&
              checkfriendAreaGotNewPokemon("Waterfall Lake")
)

achievement(
    title = "Friends of the Wild Plains", points = 25,
    description = "Have every Pokémon recruited at the same time in the Wild Plains Friend Area.",
    id = 85942, badge = "309166", published = "13.10.2019 13:51:11", modified = "10.01.2023 20:55:21",
    trigger = checkfriendAreaForPokemon("Wild Plains", "Rattata") &&
              checkfriendAreaForPokemon("Wild Plains", "Raticate") &&
              checkfriendAreaForPokemon("Wild Plains", "Ekans") &&
              checkfriendAreaForPokemon("Wild Plains", "Arbok") &&
              checkfriendAreaForPokemon("Wild Plains", "Farfetch'd") &&
              checkfriendAreaForPokemon("Wild Plains", "Drowzee") &&
              checkfriendAreaForPokemon("Wild Plains", "Hypno") &&
              checkfriendAreaForPokemon("Wild Plains", "Poochyena") &&
              checkfriendAreaForPokemon("Wild Plains", "Mightyena") &&
              checkfriendAreaForPokemon("Wild Plains", "Zigzagoon") &&
              checkfriendAreaForPokemon("Wild Plains", "Linoone") &&
              checkfriendAreaForPokemon("Wild Plains", "Zangoose") &&
              checkfriendAreaForPokemon("Wild Plains", "Seviper") &&
              checkfriendAreaGotNewPokemon("Wild Plains")
)
