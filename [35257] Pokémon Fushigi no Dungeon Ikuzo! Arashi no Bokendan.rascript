// Pokémon Fushigi no Dungeon: Ikuzo! Arashi no Bokendan
// #ID = 35257

//----------------------------------------
// Values and Addresses

gameVersion = 1
    // 0) 35259 - Susume! Hono no Bokendan
    // 1) 35257 - Ikuzo! Arashi no Bokendan
    // 2) 35258 - Mezase! Hikari no Bokendan
pointerMask = 0x7FFFFFFF

mem_gameState             = 0x004B0FF0
mem_dungeonPointer        = 0x0059C2D4
mem_dungeonStates         = 0x004C7030
mem_adventureResultData   = 0x0046FBEA
mem_recruitedPokemonData  = 0x00443288
mem_recruitedPokemonFlags = 0x0046E9A9
mem_teamRankPoints        = 0x00471998
mem_musicPointer          = 0x0059C208
mem_leaderPointer         = 0x0059C3A8
mem_gameMode              = 0x004557A0
mem_gameTimer             = 0x0059E520
mem_missionRewardPointer  = 0x0059C7E8
mem_partyPokemonData      = dword_be(0x00455798) & pointerMask

//----------------------------------------
// Arrays and Dictionaries

homeTownIDs = {
    0x00: "in the Pokémon Village",
    0x01: "on the Pokémon Beach",
    0x02: "in the Pokémon Garden",
    0xFFFFFFFF: "on Pelipper Island"
}

homeTownName = {
    0x00: "Pokémon Village",
    0x01: "Pokémon Beach",
    0x02: "Pokémon Garden"
}

dungeonIDs = {
    0x00: "Test Dungeon",
    0x01: "Dubious Woods",
    0x02: "Cheery Field",
    0x03: "Sunset Crag",
    0x04: "Chocolate Cliffs",
    0x05: "Path to Treasure Valley",
    0x06: "Wildfire Highland",
    0x07: "Ruby Lakeside",
    0x08: "Rippling Seas",
    0x09: "Enigmatic Plains",
    0x0A: "Bizarre Bluff",
    0x0B: "Secret Islands",
    0x0C: "Unown Village",
    0x0D: "",
    0x0E: "Marsh Valley",
    0x0F: "",
    0x10: "",
    0x11: "",
    0x12: "",
    0x13: "",
    0x14: "Secret Training Grounds",
    0x15: "",
    0x16: "",
    0x17: "",
    0x18: "",
    0x19: "",
    0x1A: "",
    0x1B: "",
    0x1C: "",
    0x1D: "",
    0x1E: "Mythic Magma Isle",
    0x1F: "",
    0x20: "Final Sacred Peak",
    0x21: "",
    0x22: "Dubious Hill",
    0x23: "Lively Field",
    0x24: "Cloudy Crag",
    0x25: "Chocolate Isles",
    0x26: "Path to Treasure Mountain",
    0x27: "Tempest Island",
    0x28: "Jade Lakeside",
    0x29: "Storming Seas",
    0x2A: "Enigmatic Swamp",
    0x2B: "Bizarre Rockland",
    0x2C: "Secret Plateau",
    0x2D: "Unown Resort",
    0x2E: "",
    0x2F: "Stream Forest",
    0x30: "",
    0x31: "",
    0x32: "",
    0x33: "",
    0x34: "",
    0x35: "Secret Training Grounds",
    0x36: "",
    0x37: "",
    0x38: "",
    0x39: "",
    0x3A: "",
    0x3B: "",
    0x3C: "",
    0x3D: "",
    0x3E: "",
    0x3F: "Mythic Quagmire",
    0x40: "",
    0x41: "Final Lone Island",
    0x42: "",
    0x43: "Dubious Valley",
    0x44: "Sparkling Field",
    0x45: "Shady Crag",
    0x46: "Chocolate Plains",
    0x47: "Path to Treasure Island",
    0x48: "Radiant Summit",
    0x49: "Mica Lakeside",
    0x4A: "Wavy Seas",
    0x4B: "Enigmatic Meadow",
    0x4C: "Bizarre Grove",
    0x4D: "Secret Rock Ridge",
    0x4E: "Unown Garden",
    0x4F: "",
    0x50: "Frozen Mound",
    0x51: "",
    0x52: "",
    0x53: "",
    0x54: "",
    0x55: "",
    0x56: "Secret Training Grounds",
    0x57: "",
    0x58: "",
    0x59: "",
    0x5A: "",
    0x5B: "",
    0x5C: "",
    0x5D: "",
    0x5E: "",
    0x5F: "",
    0x60: "Mythic Mountain",
    0x61: "",
    0x62: "Final Cavern",
    0x63: "",
}

dungeonFloorPrefix = {
    0x00: "B",
    0x01: "",
    0x02: "",
    0x03: "B",
    0x04: "",
    0x05: "B",
    0x06: "",
    0x07: "B",
    0x08: "B",
    0x09: "",
    0x0A: "",
    0x0B: "B",
    0x0C: "B",
    0x0D: "B",
    0x0E: "B",
    0x0F: "B",
    0x10: "B",
    0x11: "B",
    0x12: "B",
    0x13: "B",
    0x14: "B",
    0x15: "B",
    0x16: "B",
    0x17: "B",
    0x18: "B",
    0x19: "B",
    0x1A: "B",
    0x1B: "B",
    0x1C: "B",
    0x1D: "B",
    0x1E: "",
    0x1F: "B",
    0x20: "",
    0x21: "B",
    0x22: "",
    0x23: "",
    0x24: "B",
    0x25: "",
    0x26: "",
    0x27: "B",
    0x28: "B",
    0x29: "B",
    0x2A: "",
    0x2B: "",
    0x2C: "B",
    0x2D: "B",
    0x2E: "B",
    0x2F: "B",
    0x30: "B",
    0x31: "B",
    0x32: "B",
    0x33: "B",
    0x34: "B",
    0x35: "B",
    0x36: "B",
    0x37: "B",
    0x38: "B",
    0x39: "B",
    0x3A: "B",
    0x3B: "B",
    0x3C: "B",
    0x3D: "B",
    0x3E: "B",
    0x3F: "",
    0x40: "B",
    0x41: "B",
    0x42: "B",
    0x43: "B",
    0x44: "",
    0x45: "B",
    0x46: "",
    0x47: "B",
    0x48: "",
    0x49: "B",
    0x4A: "B",
    0x4B: "",
    0x4C: "",
    0x4D: "",
    0x4E: "B",
    0x4F: "B",
    0x50: "",
    0x51: "B",
    0x52: "B",
    0x53: "B",
    0x54: "B",
    0x55: "B",
    0x56: "B",
    0x57: "B",
    0x58: "B",
    0x59: "B",
    0x5A: "B",
    0x5B: "B",
    0x5C: "B",
    0x5D: "B",
    0x5E: "B",
    0x5F: "B",
    0x60: "",
    0x61: "B",
    0x62: "B",
    0x63: "B",
}

pokemonIDs = {
    0x0001: "Bulbasaur",
    0x0002: "Ivysaur",
    0x0003: "Venusaur",
    0x0004: "Charmander",
    0x0005: "Charmeleon",
    0x0006: "Charizard",
    0x0007: "Squirtle",
    0x0008: "Wartortle",
    0x0009: "Blastoise",
    0x000A: "Caterpie",
    0x000B: "Metapod",
    0x000C: "Butterfree",
    0x000D: "Weedle",
    0x000E: "Kakuna",
    0x000F: "Beedrill",
    0x0010: "Pidgey",
    0x0011: "Pidgeotto",
    0x0012: "Pidgeot",
    0x0013: "Rattata",
    0x0014: "Raticate",
    0x0015: "Spearow",
    0x0016: "Fearow",
    0x0017: "Ekans",
    0x0018: "Arbok",
    0x0019: "Pikachu",
    0x001A: "Raichu",
    0x001B: "Sandshrew",
    0x001C: "Sandslash",
    0x001D: "Nidoran♀",
    0x001E: "Nidorina",
    0x001F: "Nidoqueen",
    0x0020: "Nidoran♂",
    0x0021: "Nidorino",
    0x0022: "Nidoking",
    0x0023: "Clefairy",
    0x0024: "Clefable",
    0x0025: "Vulpix",
    0x0026: "Ninetales",
    0x0027: "Jigglypuff",
    0x0028: "Wigglytuff",
    0x0029: "Zubat",
    0x002A: "Golbat",
    0x002B: "Oddish",
    0x002C: "Gloom",
    0x002D: "Vileplume",
    0x002E: "Paras",
    0x002F: "Parasect",
    0x0030: "Venonat",
    0x0031: "Venomoth",
    0x0032: "Diglett",
    0x0033: "Dugtrio",
    0x0034: "Meowth",
    0x0035: "Persian",
    0x0036: "Psyduck",
    0x0037: "Golduck",
    0x0038: "Mankey",
    0x0039: "Primeape",
    0x003A: "Growlithe",
    0x003B: "Arcanine",
    0x003C: "Poliwag",
    0x003D: "Poliwhirl",
    0x003E: "Poliwrath",
    0x003F: "Abra",
    0x0040: "Kadabra",
    0x0041: "Alakazam",
    0x0042: "Machop",
    0x0043: "Machoke",
    0x0044: "Machamp",
    0x0045: "Bellsprout",
    0x0046: "Weepinbell",
    0x0047: "Victreebel",
    0x0048: "Tentacool",
    0x0049: "Tentacruel",
    0x004A: "Geodude",
    0x004B: "Graveler",
    0x004C: "Golem",
    0x004D: "Ponyta",
    0x004E: "Rapidash",
    0x004F: "Slowpoke",
    0x0050: "Slowbro",
    0x0051: "Magnemite",
    0x0052: "Magneton",
    0x0053: "Farfetch'd",
    0x0054: "Doduo",
    0x0055: "Dodrio",
    0x0056: "Seel",
    0x0057: "Dewgong",
    0x0058: "Grimer",
    0x0059: "Muk",
    0x005A: "Shellder",
    0x005B: "Cloyster",
    0x005C: "Gastly",
    0x005D: "Haunter",
    0x005E: "Gengar",
    0x005F: "Onix",
    0x0060: "Drowzee",
    0x0061: "Hypno",
    0x0062: "Krabby",
    0x0063: "Kingler",
    0x0064: "Voltorb",
    0x0065: "Electrode",
    0x0066: "Exeggcute",
    0x0067: "Exeggutor",
    0x0068: "Cubone",
    0x0069: "Marowak",
    0x006A: "Hitmonlee",
    0x006B: "Hitmonchan",
    0x006C: "Lickitung",
    0x006D: "Koffing",
    0x006E: "Weezing",
    0x006F: "Rhyhorn",
    0x0070: "Rhydon",
    0x0071: "Chansey",
    0x0072: "Tangela",
    0x0073: "Kangaskhan",
    0x0074: "Horsea",
    0x0075: "Seadra",
    0x0076: "Goldeen",
    0x0077: "Seaking",
    0x0078: "Staryu",
    0x0079: "Starmie",
    0x007A: "Mr. Mime",
    0x007B: "Scyther",
    0x007C: "Jynx",
    0x007D: "Electabuzz",
    0x007E: "Magmar",
    0x007F: "Pinsir",
    0x0080: "Tauros",
    0x0081: "Magikarp",
    0x0082: "Gyarados",
    0x0083: "Lapras",
    0x0084: "Ditto",
    0x0085: "Eevee",
    0x0086: "Vaporeon",
    0x0087: "Jolteon",
    0x0088: "Flareon",
    0x0089: "Porygon",
    0x008A: "Omanyte",
    0x008B: "Omastar",
    0x008C: "Kabuto",
    0x008D: "Kabutops",
    0x008E: "Aerodactyl",
    0x008F: "Snorlax",
    0x0090: "Articuno",
    0x0091: "Zapdos",
    0x0092: "Moltres",
    0x0093: "Dratini",
    0x0094: "Dragonair",
    0x0095: "Dragonite",
    0x0096: "Mewtwo",
    0x0097: "Mew",
    0x0098: "Chikorita",
    0x0099: "Bayleef",
    0x009A: "Meganium",
    0x009B: "Cyndaquil",
    0x009C: "Quilava",
    0x009D: "Typhlosion",
    0x009E: "Totodile",
    0x009F: "Croconaw",
    0x00A0: "Feraligatr",
    0x00A1: "Sentret",
    0x00A2: "Furret",
    0x00A3: "Hoothoot",
    0x00A4: "Noctowl",
    0x00A5: "Ledyba",
    0x00A6: "Ledian",
    0x00A7: "Spinarak",
    0x00A8: "Ariados",
    0x00A9: "Crobat",
    0x00AA: "Chinchou",
    0x00AB: "Lanturn",
    0x00AC: "Pichu",
    0x00AD: "Cleffa",
    0x00AE: "Igglybuff",
    0x00AF: "Togepi",
    0x00B0: "Togetic",
    0x00B1: "Natu",
    0x00B2: "Xatu",
    0x00B3: "Mareep",
    0x00B4: "Flaaffy",
    0x00B5: "Ampharos",
    0x00B6: "Bellossom",
    0x00B7: "Marill",
    0x00B8: "Azumarill",
    0x00B9: "Sudowoodo",
    0x00BA: "Politoed",
    0x00BB: "Hoppip",
    0x00BC: "Skiploom",
    0x00BD: "Jumpluff",
    0x00BE: "Aipom",
    0x00BF: "Sunkern",
    0x00C0: "Sunflora",
    0x00C1: "Yanma",
    0x00C2: "Wooper",
    0x00C3: "Quagsire",
    0x00C4: "Espeon",
    0x00C5: "Umbreon",
    0x00C6: "Murkrow",
    0x00C7: "Slowking",
    0x00C8: "Misdreavus",
    0x00C9: "Unown",
    0x00CA: "Unown",
    0x00CB: "Unown",
    0x00CC: "Unown",
    0x00CD: "Unown",
    0x00CE: "Unown",
    0x00CF: "Unown",
    0x00D0: "Unown",
    0x00D1: "Unown",
    0x00D2: "Unown",
    0x00D3: "Unown",
    0x00D4: "Unown",
    0x00D5: "Unown",
    0x00D6: "Unown",
    0x00D7: "Unown",
    0x00D8: "Unown",
    0x00D9: "Unown",
    0x00DA: "Unown",
    0x00DB: "Unown",
    0x00DC: "Unown",
    0x00DD: "Unown",
    0x00DE: "Unown",
    0x00DF: "Unown",
    0x00E0: "Unown",
    0x00E1: "Unown",
    0x00E2: "Unown",
    0x00E3: "Unown",
    0x00E4: "Unown",
    0x00E5: "Wobbuffet",
    0x00E6: "Girafarig",
    0x00E7: "Pineco",
    0x00E8: "Forretress",
    0x00E9: "Dunsparce",
    0x00EA: "Gligar",
    0x00EB: "Steelix",
    0x00EC: "Snubbull",
    0x00ED: "Granbull",
    0x00EE: "Qwilfish",
    0x00EF: "Scizor",
    0x00F0: "Shuckle",
    0x00F1: "Heracross",
    0x00F2: "Sneasel",
    0x00F3: "Teddiursa",
    0x00F4: "Ursaring",
    0x00F5: "Slugma",
    0x00F6: "Magcargo",
    0x00F7: "Swinub",
    0x00F8: "Piloswine",
    0x00F9: "Corsola",
    0x00FA: "Remoraid",
    0x00FB: "Octillery",
    0x00FC: "Delibird",
    0x00FD: "Mantine",
    0x00FE: "Skarmory",
    0x00FF: "Houndour",
    0x0100: "Houndoom",
    0x0101: "Kingdra",
    0x0102: "Phanpy",
    0x0103: "Donphan",
    0x0104: "Porygon2",
    0x0105: "Stantler",
    0x0106: "Smeargle",
    0x0107: "Tyrogue",
    0x0108: "Hitmontop",
    0x0109: "Smoochum",
    0x010A: "Elekid",
    0x010B: "Magby",
    0x010C: "Miltank",
    0x010D: "Blissey",
    0x010E: "Raikou",
    0x010F: "Entei",
    0x0110: "Suicune",
    0x0111: "Larvitar",
    0x0112: "Pupitar",
    0x0113: "Tyranitar",
    0x0114: "Lugia",
    0x0115: "Ho-oh",
    0x0116: "Celebi",
    0x0117: "Celebi",
    0x0118: "Treecko",
    0x0119: "Grovyle",
    0x011A: "Sceptile",
    0x011B: "Torchic",
    0x011C: "Combusken",
    0x011D: "Blaziken",
    0x011E: "Mudkip",
    0x011F: "Marshtomp",
    0x0120: "Swampert",
    0x0121: "Poochyena",
    0x0122: "Mightyena",
    0x0123: "Zigzagoon",
    0x0124: "Linoone",
    0x0125: "Wurmple",
    0x0126: "Silcoon",
    0x0127: "Beautifly",
    0x0128: "Cascoon",
    0x0129: "Dustox",
    0x012A: "Lotad",
    0x012B: "Lombre",
    0x012C: "Ludicolo",
    0x012D: "Seedot",
    0x012E: "Nuzleaf",
    0x012F: "Shiftry",
    0x0130: "Taillow",
    0x0131: "Swellow",
    0x0132: "Wingull",
    0x0133: "Pelipper",
    0x0134: "Ralts",
    0x0135: "Kirlia",
    0x0136: "Gardevoir",
    0x0137: "Surskit",
    0x0138: "Masquerain",
    0x0139: "Shroomish",
    0x013A: "Breloom",
    0x013B: "Slakoth",
    0x013C: "Vigoroth",
    0x013D: "Slaking",
    0x013E: "Nincada",
    0x013F: "Ninjask",
    0x0140: "Shedinja",
    0x0141: "Whismur",
    0x0142: "Loudred",
    0x0143: "Exploud",
    0x0144: "Makuhita",
    0x0145: "Hariyama",
    0x0146: "Azurill",
    0x0147: "Nosepass",
    0x0148: "Skitty",
    0x0149: "Delcatty",
    0x014A: "Sableye",
    0x014B: "Mawile",
    0x014C: "Aron",
    0x014D: "Lairon",
    0x014E: "Aggron",
    0x014F: "Meditite",
    0x0150: "Medicham",
    0x0151: "Electrike",
    0x0152: "Manectric",
    0x0153: "Plusle",
    0x0154: "Minun",
    0x0155: "Volbeat",
    0x0156: "Illumise",
    0x0157: "Roselia",
    0x0158: "Gulpin",
    0x0159: "Swalot",
    0x015A: "Carvanha",
    0x015B: "Sharpedo",
    0x015C: "Wailmer",
    0x015D: "Wailord",
    0x015E: "Numel",
    0x015F: "Camerupt",
    0x0160: "Torkoal",
    0x0161: "Spoink",
    0x0162: "Grumpig",
    0x0163: "Spinda",
    0x0164: "Trapinch",
    0x0165: "Vibrava",
    0x0166: "Flygon",
    0x0167: "Cacnea",
    0x0168: "Cacturne",
    0x0169: "Swablu",
    0x016A: "Altaria",
    0x016B: "Zangoose",
    0x016C: "Seviper",
    0x016D: "Lunatone",
    0x016E: "Solrock",
    0x016F: "Barboach",
    0x0170: "Whiscash",
    0x0171: "Corphish",
    0x0172: "Crawdaunt",
    0x0173: "Baltoy",
    0x0174: "Claydol",
    0x0175: "Lileep",
    0x0176: "Cradily",
    0x0177: "Anorith",
    0x0178: "Armaldo",
    0x0179: "Feebas",
    0x017A: "Milotic",
    0x017B: "Castform",
    0x017C: "Castform",
    0x017D: "Castform",
    0x017E: "Castform",
    0x017F: "Kecleon",
    0x0180: "Kecleon",
    0x0181: "Shuppet",
    0x0182: "Banette",
    0x0183: "Duskull",
    0x0184: "Dusclops",
    0x0185: "Tropius",
    0x0186: "Chimecho",
    0x0187: "Absol",
    0x0188: "Wynaut",
    0x0189: "Snorunt",
    0x018A: "Glalie",
    0x018B: "Spheal",
    0x018C: "Sealeo",
    0x018D: "Walrein",
    0x018E: "Clamperl",
    0x018F: "Huntail",
    0x0190: "Gorebyss",
    0x0191: "Relicanth",
    0x0192: "Luvdisc",
    0x0193: "Bagon",
    0x0194: "Shelgon",
    0x0195: "Salamence",
    0x0196: "Beldum",
    0x0197: "Metang",
    0x0198: "Metagross",
    0x0199: "Regirock",
    0x019A: "Regice",
    0x019B: "Registeel",
    0x019C: "Latias",
    0x019D: "Latios",
    0x019E: "Kyogre",
    0x019F: "Groudon",
    0x01A0: "Rayquaza",
    0x01A1: "Jirachi",
    0x01A2: "Deoxys",
    0x01A3: "Deoxys",
    0x01A4: "Deoxys",
    0x01A5: "Deoxys",
    0x01A6: "Turtwig",
    0x01A7: "Grotle",
    0x01A8: "Torterra",
    0x01A9: "Chimchar",
    0x01AA: "Monferno",
    0x01AB: "Infernape",
    0x01AC: "Piplup",
    0x01AD: "Prinplup",
    0x01AE: "Empoleon",
    0x01AF: "Starly",
    0x01B0: "Staravia",
    0x01B1: "Staraptor",
    0x01B2: "Bidoof",
    0x01B3: "Bibarel",
    0x01B4: "Kricketot",
    0x01B5: "Kricketune",
    0x01B6: "Shinx",
    0x01B7: "Luxio",
    0x01B8: "Luxray",
    0x01B9: "Budew",
    0x01BA: "Roserade",
    0x01BB: "Cranidos",
    0x01BC: "Rampardos",
    0x01BD: "Shieldon",
    0x01BE: "Bastiodon",
    0x01BF: "Burmy",
    0x01C0: "Burmy",
    0x01C1: "Burmy",
    0x01C2: "Wormadam",
    0x01C3: "Wormadam",
    0x01C4: "Wormadam",
    0x01C5: "Mothim",
    0x01C6: "Combee",
    0x01C7: "Vespiquen",
    0x01C8: "Pachirisu",
    0x01C9: "Buizel",
    0x01CA: "Floatzel",
    0x01CB: "Cherubi",
    0x01CC: "Cherrim ",
    0x01CD: "Cherrim",
    0x01CE: "Shellos",
    0x01CF: "Shellos",
    0x01D0: "Gastrodon",
    0x01D1: "Gastrodon",
    0x01D2: "Ambipom",
    0x01D3: "Drifloon",
    0x01D4: "Drifblim",
    0x01D5: "Buneary",
    0x01D6: "Lopunny",
    0x01D7: "Mismagius",
    0x01D8: "Honchkrow",
    0x01D9: "Glameow",
    0x01DA: "Purugly",
    0x01DB: "Chingling",
    0x01DC: "Stunky",
    0x01DD: "Skuntank",
    0x01DE: "Bronzor",
    0x01DF: "Bronzong",
    0x01E0: "Bonsly",
    0x01E1: "Mime Jr.",
    0x01E2: "Happiny",
    0x01E3: "Chatot",
    0x01E4: "Spiritomb",
    0x01E5: "Gible",
    0x01E6: "Gabite",
    0x01E7: "Garchomp",
    0x01E8: "Munchlax",
    0x01E9: "Riolu",
    0x01EA: "Lucario",
    0x01EB: "Hippopotas",
    0x01EC: "Hippowdon",
    0x01ED: "Skorupi",
    0x01EE: "Drapion",
    0x01EF: "Croagunk",
    0x01F0: "Toxicroak",
    0x01F1: "Carnivine",
    0x01F2: "Finneon",
    0x01F3: "Lumineon",
    0x01F4: "Mantyke",
    0x01F5: "Snover",
    0x01F6: "Abomasnow",
    0x01F7: "Weavile",
    0x01F8: "Magnezone",
    0x01F9: "Lickilicky",
    0x01FA: "Rhyperior",
    0x01FB: "Tangrowth",
    0x01FC: "Electivire",
    0x01FD: "Magmortar",
    0x01FE: "Togekiss",
    0x01FF: "Yanmega",
    0x0200: "Leafeon",
    0x0201: "Glaceon",
    0x0202: "Gliscor",
    0x0203: "Mamoswine",
    0x0204: "Porygon-Z",
    0x0205: "Gallade",
    0x0206: "Probopass",
    0x0207: "Dusknoir",
    0x0208: "Froslass",
    0x0209: "Rotom",
    0x020A: "Uxie",
    0x020B: "Mesprit",
    0x020C: "Azelf",
    0x020D: "Dialga",
    0x020E: "Palkia",
    0x020F: "Heatran",
    0x0210: "Regigigas",
    0x0211: "Giratina",
    0x0212: "Cresselia",
    0x0213: "Phione",
    0x0214: "Manaphy",
    0x0215: "Darkrai",
    0x0216: "Shaymin",
    0x0217: "Shaymin",
    0x0218: "Giratina",
    0x0219: "Arceus",
    0x0259: "Bulbasaur",
    0x025A: "Ivysaur",
    0x025B: "Venusaur",
    0x025C: "Charmander",
    0x025D: "Charmeleon",
    0x025E: "Charizard",
    0x025F: "Squirtle",
    0x0260: "Wartortle",
    0x0261: "Blastoise",
    0x0262: "Caterpie",
    0x0263: "Metapod",
    0x0264: "Butterfree",
    0x0265: "Weedle",
    0x0266: "Kakuna",
    0x0267: "Beedrill",
    0x0268: "Pidgey",
    0x0269: "Pidgeotto",
    0x026A: "Pidgeot",
    0x026B: "Rattata",
    0x026C: "Raticate",
    0x026D: "Spearow",
    0x026E: "Fearow",
    0x026F: "Ekans",
    0x0270: "Arbok",
    0x0271: "Pikachu",
    0x0272: "Raichu",
    0x0273: "Sandshrew",
    0x0274: "Sandslash",
    0x0275: "Nidoran♀",
    0x0276: "Nidorina",
    0x0277: "Nidoqueen",
    0x0278: "Nidoran♂",
    0x0279: "Nidorino",
    0x027A: "Nidoking",
    0x027B: "Clefairy",
    0x027C: "Clefable",
    0x027D: "Vulpix",
    0x027E: "Ninetales",
    0x027F: "Jigglypuff",
    0x0280: "Wigglytuff",
    0x0281: "Zubat",
    0x0282: "Golbat",
    0x0283: "Oddish",
    0x0284: "Gloom",
    0x0285: "Vileplume",
    0x0286: "Paras",
    0x0287: "Parasect",
    0x0288: "Venonat",
    0x0289: "Venomoth",
    0x028A: "Diglett",
    0x028B: "Dugtrio",
    0x028C: "Meowth",
    0x028D: "Persian",
    0x028E: "Psyduck",
    0x028F: "Golduck",
    0x0290: "Mankey",
    0x0291: "Primeape",
    0x0292: "Growlithe",
    0x0293: "Arcanine",
    0x0294: "Poliwag",
    0x0295: "Poliwhirl",
    0x0296: "Poliwrath",
    0x0297: "Abra",
    0x0298: "Kadabra",
    0x0299: "Alakazam",
    0x029A: "Machop",
    0x029B: "Machoke",
    0x029C: "Machamp",
    0x029D: "Bellsprout",
    0x029E: "Weepinbell",
    0x029F: "Victreebel",
    0x02A0: "Tentacool",
    0x02A1: "Tentacruel",
    0x02A2: "Geodude",
    0x02A3: "Graveler",
    0x02A4: "Golem",
    0x02A5: "Ponyta",
    0x02A6: "Rapidash",
    0x02A7: "Slowpoke",
    0x02A8: "Slowbro",
    0x02A9: "Magnemite",
    0x02AA: "Magneton",
    0x02AB: "Farfetch'd",
    0x02AC: "Doduo",
    0x02AD: "Dodrio",
    0x02AE: "Seel",
    0x02AF: "Dewgong",
    0x02B0: "Grimer",
    0x02B1: "Muk",
    0x02B2: "Shellder",
    0x02B3: "Cloyster",
    0x02B4: "Gastly",
    0x02B5: "Haunter",
    0x02B6: "Gengar",
    0x02B7: "Onix",
    0x02B8: "Drowzee",
    0x02B9: "Hypno",
    0x02BA: "Krabby",
    0x02BB: "Kingler",
    0x02BC: "Voltorb",
    0x02BD: "Electrode",
    0x02BE: "Exeggcute",
    0x02BF: "Exeggutor",
    0x02C0: "Cubone",
    0x02C1: "Marowak",
    0x02C2: "Hitmonlee",
    0x02C3: "Hitmonchan",
    0x02C4: "Lickitung",
    0x02C5: "Koffing",
    0x02C6: "Weezing",
    0x02C7: "Rhyhorn",
    0x02C8: "Rhydon",
    0x02C9: "Chansey",
    0x02CA: "Tangela",
    0x02CB: "Kangaskhan",
    0x02CC: "Horsea",
    0x02CD: "Seadra",
    0x02CE: "Goldeen",
    0x02CF: "Seaking",
    0x02D0: "Staryu",
    0x02D1: "Starmie",
    0x02D2: "Mr. Mime",
    0x02D3: "Scyther",
    0x02D4: "Jynx",
    0x02D5: "Electabuzz",
    0x02D6: "Magmar",
    0x02D7: "Pinsir",
    0x02D8: "Tauros",
    0x02D9: "Magikarp",
    0x02DA: "Gyarados",
    0x02DB: "Lapras",
    0x02DC: "Ditto",
    0x02DD: "Eevee",
    0x02DE: "Vaporeon",
    0x02DF: "Jolteon",
    0x02E0: "Flareon",
    0x02E1: "Porygon",
    0x02E2: "Omanyte",
    0x02E3: "Omastar",
    0x02E4: "Kabuto",
    0x02E5: "Kabutops",
    0x02E6: "Aerodactyl",
    0x02E7: "Snorlax",
    0x02E8: "Articuno",
    0x02E9: "Zapdos",
    0x02EA: "Moltres",
    0x02EB: "Dratini",
    0x02EC: "Dragonair",
    0x02ED: "Dragonite",
    0x02EE: "Mewtwo",
    0x02EF: "Mew",
    0x02F0: "Chikorita",
    0x02F1: "Bayleef",
    0x02F2: "Meganium",
    0x02F3: "Cyndaquil",
    0x02F4: "Quilava",
    0x02F5: "Typhlosion",
    0x02F6: "Totodile",
    0x02F7: "Croconaw",
    0x02F8: "Feraligatr",
    0x02F9: "Sentret",
    0x02FA: "Furret",
    0x02FB: "Hoothoot",
    0x02FC: "Noctowl",
    0x02FD: "Ledyba",
    0x02FE: "Ledian",
    0x02FF: "Spinarak",
    0x0300: "Ariados",
    0x0301: "Crobat",
    0x0302: "Chinchou",
    0x0303: "Lanturn",
    0x0304: "Pichu",
    0x0305: "Cleffa",
    0x0306: "Igglybuff",
    0x0307: "Togepi",
    0x0308: "Togetic",
    0x0309: "Natu",
    0x030A: "Xatu",
    0x030B: "Mareep",
    0x030C: "Flaaffy",
    0x030D: "Ampharos",
    0x030E: "Bellossom",
    0x030F: "Marill",
    0x0310: "Azumarill",
    0x0311: "Sudowoodo",
    0x0312: "Politoed",
    0x0313: "Hoppip",
    0x0314: "Skiploom",
    0x0315: "Jumpluff",
    0x0316: "Aipom",
    0x0317: "Sunkern",
    0x0318: "Sunflora",
    0x0319: "Yanma",
    0x031A: "Wooper",
    0x031B: "Quagsire",
    0x031C: "Espeon",
    0x031D: "Umbreon",
    0x031E: "Murkrow",
    0x031F: "Slowking",
    0x0320: "Misdreavus",
    0x0321: "Unown",
    0x0322: "Unown",
    0x0323: "Unown",
    0x0324: "Unown",
    0x0325: "Unown",
    0x0326: "Unown",
    0x0327: "Unown",
    0x0328: "Unown",
    0x0329: "Unown",
    0x032A: "Unown",
    0x032B: "Unown",
    0x032C: "Unown",
    0x032D: "Unown",
    0x032E: "Unown",
    0x032F: "Unown",
    0x0330: "Unown",
    0x0331: "Unown",
    0x0332: "Unown",
    0x0333: "Unown",
    0x0334: "Unown",
    0x0335: "Unown",
    0x0336: "Unown",
    0x0337: "Unown",
    0x0338: "Unown",
    0x0339: "Unown",
    0x033A: "Unown",
    0x033B: "Unown",
    0x033C: "Unown",
    0x033D: "Wobbuffet",
    0x033E: "Girafarig",
    0x033F: "Pineco",
    0x0340: "Forretress",
    0x0341: "Dunsparce",
    0x0342: "Gligar",
    0x0343: "Steelix",
    0x0344: "Snubbull",
    0x0345: "Granbull",
    0x0346: "Qwilfish",
    0x0347: "Scizor",
    0x0348: "Shuckle",
    0x0349: "Heracross",
    0x034A: "Sneasel",
    0x034B: "Teddiursa",
    0x034C: "Ursaring",
    0x034D: "Slugma",
    0x034E: "Magcargo",
    0x034F: "Swinub",
    0x0350: "Piloswine",
    0x0351: "Corsola",
    0x0352: "Remoraid",
    0x0353: "Octillery",
    0x0354: "Delibird",
    0x0355: "Mantine",
    0x0356: "Skarmory",
    0x0357: "Houndour",
    0x0358: "Houndoom",
    0x0359: "Kingdra",
    0x035A: "Phanpy",
    0x035B: "Donphan",
    0x035C: "Porygon2",
    0x035D: "Stantler",
    0x035E: "Smeargle",
    0x035F: "Tyrogue",
    0x0360: "Hitmontop",
    0x0361: "Smoochum",
    0x0362: "Elekid",
    0x0363: "Magby",
    0x0364: "Miltank",
    0x0365: "Blissey",
    0x0366: "Raikou",
    0x0367: "Entei",
    0x0368: "Suicune",
    0x0369: "Larvitar",
    0x036A: "Pupitar",
    0x036B: "Tyranitar",
    0x036C: "Lugia",
    0x036D: "Ho-oh",
    0x036E: "Celebi",
    0x036F: "Celebi",
    0x0370: "Treecko",
    0x0371: "Grovyle",
    0x0372: "Sceptile",
    0x0373: "Torchic",
    0x0374: "Combusken",
    0x0375: "Blaziken",
    0x0376: "Mudkip",
    0x0377: "Marshtomp",
    0x0378: "Swampert",
    0x0379: "Poochyena",
    0x037A: "Mightyena",
    0x037B: "Zigzagoon",
    0x037C: "Linoone",
    0x037D: "Wurmple",
    0x037E: "Silcoon",
    0x037F: "Beautifly",
    0x0380: "Cascoon",
    0x0381: "Dustox",
    0x0382: "Lotad",
    0x0383: "Lombre",
    0x0384: "Ludicolo",
    0x0385: "Seedot",
    0x0386: "Nuzleaf",
    0x0387: "Shiftry",
    0x0388: "Taillow",
    0x0389: "Swellow",
    0x038A: "Wingull",
    0x038B: "Pelipper",
    0x038C: "Ralts",
    0x038D: "Kirlia",
    0x038E: "Gardevoir",
    0x038F: "Surskit",
    0x0390: "Masquerain",
    0x0391: "Shroomish",
    0x0392: "Breloom",
    0x0393: "Slakoth",
    0x0394: "Vigoroth",
    0x0395: "Slaking",
    0x0396: "Nincada",
    0x0397: "Ninjask",
    0x0398: "Shedinja",
    0x0399: "Whismur",
    0x039A: "Loudred",
    0x039B: "Exploud",
    0x039C: "Makuhita",
    0x039D: "Hariyama",
    0x039E: "Azurill",
    0x039F: "Nosepass",
    0x03A0: "Skitty",
    0x03A1: "Delcatty",
    0x03A2: "Sableye",
    0x03A3: "Mawile",
    0x03A4: "Aron",
    0x03A5: "Lairon",
    0x03A6: "Aggron",
    0x03A7: "Meditite",
    0x03A8: "Medicham",
    0x03A9: "Electrike",
    0x03AA: "Manectric",
    0x03AB: "Plusle",
    0x03AC: "Minun",
    0x03AD: "Volbeat",
    0x03AE: "Illumise",
    0x03AF: "Roselia",
    0x03B0: "Gulpin",
    0x03B1: "Swalot",
    0x03B2: "Carvanha",
    0x03B3: "Sharpedo",
    0x03B4: "Wailmer",
    0x03B5: "Wailord",
    0x03B6: "Numel",
    0x03B7: "Camerupt",
    0x03B8: "Torkoal",
    0x03B9: "Spoink",
    0x03BA: "Grumpig",
    0x03BB: "Spinda",
    0x03BC: "Trapinch",
    0x03BD: "Vibrava",
    0x03BE: "Flygon",
    0x03BF: "Cacnea",
    0x03C0: "Cacturne",
    0x03C1: "Swablu",
    0x03C2: "Altaria",
    0x03C3: "Zangoose",
    0x03C4: "Seviper",
    0x03C5: "Lunatone",
    0x03C6: "Solrock",
    0x03C7: "Barboach",
    0x03C8: "Whiscash",
    0x03C9: "Corphish",
    0x03CA: "Crawdaunt",
    0x03CB: "Baltoy",
    0x03CC: "Claydol",
    0x03CD: "Lileep",
    0x03CE: "Cradily",
    0x03CF: "Anorith",
    0x03D0: "Armaldo",
    0x03D1: "Feebas",
    0x03D2: "Milotic",
    0x03D3: "Castform",
    0x03D4: "Castform",
    0x03D5: "Castform",
    0x03D6: "Castform",
    0x03D7: "Kecleon",
    0x03D8: "Kecleon",
    0x03D9: "Shuppet",
    0x03DA: "Banette",
    0x03DB: "Duskull",
    0x03DC: "Dusclops",
    0x03DD: "Tropius",
    0x03DE: "Chimecho",
    0x03DF: "Absol",
    0x03E0: "Wynaut",
    0x03E1: "Snorunt",
    0x03E2: "Glalie",
    0x03E3: "Spheal",
    0x03E4: "Sealeo",
    0x03E5: "Walrein",
    0x03E6: "Clamperl",
    0x03E7: "Huntail",
    0x03E8: "Gorebyss",
    0x03E9: "Relicanth",
    0x03EA: "Luvdisc",
    0x03EB: "Bagon",
    0x03EC: "Shelgon",
    0x03ED: "Salamence",
    0x03EE: "Beldum",
    0x03EF: "Metang",
    0x03F0: "Metagross",
    0x03F1: "Regirock",
    0x03F2: "Regice",
    0x03F3: "Registeel",
    0x03F4: "Latias",
    0x03F5: "Latios",
    0x03F6: "Kyogre",
    0x03F7: "Groudon",
    0x03F8: "Rayquaza",
    0x03F9: "Jirachi",
    0x03FA: "Deoxys",
    0x03FB: "Deoxys",
    0x03FC: "Deoxys",
    0x03FD: "Deoxys",
    0x03FE: "Turtwig",
    0x03FF: "Grotle",
    0x0400: "Torterra",
    0x0401: "Chimchar",
    0x0402: "Monferno",
    0x0403: "Infernape",
    0x0404: "Piplup",
    0x0405: "Prinplup",
    0x0406: "Empoleon",
    0x0407: "Starly",
    0x0408: "Staravia",
    0x0409: "Staraptor",
    0x040A: "Bidoof",
    0x040B: "Bibarel",
    0x040C: "Kricketot",
    0x040D: "Kricketune",
    0x040E: "Shinx",
    0x040F: "Luxio",
    0x0410: "Luxray",
    0x0411: "Budew",
    0x0412: "Roserade",
    0x0413: "Cranidos",
    0x0414: "Rampardos",
    0x0415: "Shieldon",
    0x0416: "Bastiodon",
    0x0417: "Burmy",
    0x0418: "Burmy",
    0x0419: "Burmy",
    0x041A: "Wormadam",
    0x041B: "Wormadam",
    0x041C: "Wormadam",
    0x041D: "Mothim",
    0x041E: "Combee",
    0x041F: "Vespiquen",
    0x0420: "Pachirisu",
    0x0421: "Buizel",
    0x0422: "Floatzel",
    0x0423: "Cherubi",
    0x0424: "Cherrim",
    0x0425: "Cherrim",
    0x0426: "Shellos",
    0x0427: "Shellos",
    0x0428: "Gastrodon",
    0x0429: "Gastrodon",
    0x042A: "Ambipom",
    0x042B: "Drifloon",
    0x042C: "Drifblim",
    0x042D: "Buneary",
    0x042E: "Lopunny",
    0x042F: "Mismagius",
    0x0430: "Honchkrow",
    0x0431: "Glameow",
    0x0432: "Purugly",
    0x0433: "Chingling",
    0x0434: "Stunky",
    0x0435: "Skuntank",
    0x0436: "Bronzor",
    0x0437: "Bronzong",
    0x0438: "Bonsly",
    0x0439: "Mime Jr.",
    0x043A: "Happiny",
    0x043B: "Chatot",
    0x043C: "Spiritomb",
    0x043D: "Gible",
    0x043E: "Gabite",
    0x043F: "Garchomp",
    0x0440: "Munchlax",
    0x0441: "Riolu",
    0x0442: "Lucario",
    0x0443: "Hippopotas",
    0x0444: "Hippowdon",
    0x0445: "Skorupi",
    0x0446: "Drapion",
    0x0447: "Croagunk",
    0x0448: "Toxicroak",
    0x0449: "Carnivine",
    0x044A: "Finneon",
    0x044B: "Lumineon",
    0x044C: "Mantyke",
    0x044D: "Snover",
    0x044E: "Abomasnow",
    0x044F: "Weavile",
    0x0450: "Magnezone",
    0x0451: "Lickilicky",
    0x0452: "Rhyperior",
    0x0453: "Tangrowth",
    0x0454: "Electivire",
    0x0455: "Magmortar",
    0x0456: "Togekiss",
    0x0457: "Yanmega",
    0x0458: "Leafeon",
    0x0459: "Glaceon",
    0x045A: "Gliscor",
    0x045B: "Mamoswine",
    0x045C: "Porygon-Z",
    0x045D: "Gallade",
    0x045E: "Probopass",
    0x045F: "Dusknoir",
    0x0460: "Froslass",
    0x0461: "Rotom",
    0x0462: "Uxie",
    0x0463: "Mesprit",
    0x0464: "Azelf",
    0x0465: "Dialga",
    0x0466: "Palkia",
    0x0467: "Heatran",
    0x0468: "Regigigas",
    0x0469: "Giratina",
    0x046A: "Cresselia",
    0x046B: "Phione",
    0x046C: "Manaphy",
    0x046D: "Darkrai",
    0x046E: "Shaymin",
    0x046F: "Shaymin",
    0x0470: "Giratina",
    0x0471: "Arceus",
}

pokemonFlagOffset = {
    0x0000: "Bulbasaur",
    0x0001: "Ivysaur",
    0x0002: "Venusaur",
    0x0003: "Charmander",
    0x0004: "Charmeleon",
    0x0005: "Charizard",
    0x0006: "Squirtle",
    0x0007: "Wartortle",
    0x0008: "Blastoise",
    0x0009: "Caterpie",
    0x000A: "Metapod",
    0x000B: "Butterfree",
    0x000C: "Weedle",
    0x000D: "Kakuna",
    0x000E: "Beedrill",
    0x000F: "Pidgey",
    0x0010: "Pidgeotto",
    0x0011: "Pidgeot",
    0x0012: "Rattata",
    0x0013: "Raticate",
    0x0014: "Spearow",
    0x0015: "Fearow",
    0x0016: "Ekans",
    0x0017: "Arbok",
    0x0018: "Pikachu",
    0x0019: "Raichu",
    0x001A: "Sandshrew",
    0x001B: "Sandslash",
    0x001C: "Nidoran♀",
    0x001D: "Nidorina",
    0x001E: "Nidoqueen",
    0x001F: "Nidoran♂",
    0x0020: "Nidorino",
    0x0021: "Nidoking",
    0x0022: "Clefairy",
    0x0023: "Clefable",
    0x0024: "Vulpix",
    0x0025: "Ninetales",
    0x0026: "Jigglypuff",
    0x0027: "Wigglytuff",
    0x0028: "Zubat",
    0x0029: "Golbat",
    0x002A: "Oddish",
    0x002B: "Gloom",
    0x002C: "Vileplume",
    0x002D: "Paras",
    0x002E: "Parasect",
    0x002F: "Venonat",
    0x0030: "Venomoth",
    0x0031: "Diglett",
    0x0032: "Dugtrio",
    0x0033: "Meowth",
    0x0034: "Persian",
    0x0035: "Psyduck",
    0x0036: "Golduck",
    0x0037: "Mankey",
    0x0038: "Primeape",
    0x0039: "Growlithe",
    0x003A: "Arcanine",
    0x003B: "Poliwag",
    0x003C: "Poliwhirl",
    0x003D: "Poliwrath",
    0x003E: "Abra",
    0x003F: "Kadabra",
    0x0040: "Alakazam",
    0x0041: "Machop",
    0x0042: "Machoke",
    0x0043: "Machamp",
    0x0044: "Bellsprout",
    0x0045: "Weepinbell",
    0x0046: "Victreebel",
    0x0047: "Tentacool",
    0x0048: "Tentacruel",
    0x0049: "Geodude",
    0x004A: "Graveler",
    0x004B: "Golem",
    0x004C: "Ponyta",
    0x004D: "Rapidash",
    0x004E: "Slowpoke",
    0x004F: "Slowbro",
    0x0050: "Magnemite",
    0x0051: "Magneton",
    0x0052: "Farfetch'd",
    0x0053: "Doduo",
    0x0054: "Dodrio",
    0x0055: "Seel",
    0x0056: "Dewgong",
    0x0057: "Grimer",
    0x0058: "Muk",
    0x0059: "Shellder",
    0x005A: "Cloyster",
    0x005B: "Gastly",
    0x005C: "Haunter",
    0x005D: "Gengar",
    0x005E: "Onix",
    0x005F: "Drowzee",
    0x0060: "Hypno",
    0x0061: "Krabby",
    0x0062: "Kingler",
    0x0063: "Voltorb",
    0x0064: "Electrode",
    0x0065: "Exeggcute",
    0x0066: "Exeggutor",
    0x0067: "Cubone",
    0x0068: "Marowak",
    0x0069: "Hitmonlee",
    0x006A: "Hitmonchan",
    0x006B: "Lickitung",
    0x006C: "Koffing",
    0x006D: "Weezing",
    0x006E: "Rhyhorn",
    0x006F: "Rhydon",
    0x0070: "Chansey",
    0x0071: "Tangela",
    0x0072: "Kangaskhan",
    0x0073: "Horsea",
    0x0074: "Seadra",
    0x0075: "Goldeen",
    0x0076: "Seaking",
    0x0077: "Staryu",
    0x0078: "Starmie",
    0x0079: "Mr. Mime",
    0x007A: "Scyther",
    0x007B: "Jynx",
    0x007C: "Electabuzz",
    0x007D: "Magmar",
    0x007E: "Pinsir",
    0x007F: "Tauros",
    0x0080: "Magikarp",
    0x0081: "Gyarados",
    0x0082: "Lapras",
    0x0083: "Ditto",
    0x0084: "Eevee",
    0x0085: "Vaporeon",
    0x0086: "Jolteon",
    0x0087: "Flareon",
    0x0088: "Porygon",
    0x0089: "Omanyte",
    0x008A: "Omastar",
    0x008B: "Kabuto",
    0x008C: "Kabutops",
    0x008D: "Aerodactyl",
    0x008E: "Snorlax",
    0x008F: "Articuno",
    0x0090: "Zapdos",
    0x0091: "Moltres",
    0x0092: "Dratini",
    0x0093: "Dragonair",
    0x0094: "Dragonite",
    0x0095: "Mewtwo",
    0x0096: "Mew",
    0x0097: "Chikorita",
    0x0098: "Bayleef",
    0x0099: "Meganium",
    0x009A: "Cyndaquil",
    0x009B: "Quilava",
    0x009C: "Typhlosion",
    0x009D: "Totodile",
    0x009E: "Croconaw",
    0x009F: "Feraligatr",
    0x00A0: "Sentret",
    0x00A1: "Furret",
    0x00A2: "Hoothoot",
    0x00A3: "Noctowl",
    0x00A4: "Ledyba",
    0x00A5: "Ledian",
    0x00A6: "Spinarak",
    0x00A7: "Ariados",
    0x00A8: "Crobat",
    0x00A9: "Chinchou",
    0x00AA: "Lanturn",
    0x00AB: "Pichu",
    0x00AC: "Cleffa",
    0x00AD: "Igglybuff",
    0x00AE: "Togepi",
    0x00AF: "Togetic",
    0x00B0: "Natu",
    0x00B1: "Xatu",
    0x00B2: "Mareep",
    0x00B3: "Flaaffy",
    0x00B4: "Ampharos",
    0x00B5: "Bellossom",
    0x00B6: "Marill",
    0x00B7: "Azumarill",
    0x00B8: "Sudowoodo",
    0x00B9: "Politoed",
    0x00BA: "Hoppip",
    0x00BB: "Skiploom",
    0x00BC: "Jumpluff",
    0x00BD: "Aipom",
    0x00BE: "Sunkern",
    0x00BF: "Sunflora",
    0x00C0: "Yanma",
    0x00C1: "Wooper",
    0x00C2: "Quagsire",
    0x00C3: "Espeon",
    0x00C4: "Umbreon",
    0x00C5: "Murkrow",
    0x00C6: "Slowking",
    0x00C7: "Misdreavus",
    0x00C8: "Unown",
    0x00C9: "Wobbuffet",
    0x00CA: "Girafarig",
    0x00CB: "Pineco",
    0x00CC: "Forretress",
    0x00CD: "Dunsparce",
    0x00CE: "Gligar",
    0x00CF: "Steelix",
    0x00D0: "Snubbull",
    0x00D1: "Granbull",
    0x00D2: "Qwilfish",
    0x00D3: "Scizor",
    0x00D4: "Shuckle",
    0x00D5: "Heracross",
    0x00D6: "Sneasel",
    0x00D7: "Teddiursa",
    0x00D8: "Ursaring",
    0x00D9: "Slugma",
    0x00DA: "Magcargo",
    0x00DB: "Swinub",
    0x00DC: "Piloswine",
    0x00DD: "Corsola",
    0x00DE: "Remoraid",
    0x00DF: "Octillery",
    0x00E0: "Delibird",
    0x00E1: "Mantine",
    0x00E2: "Skarmory",
    0x00E3: "Houndour",
    0x00E4: "Houndoom",
    0x00E5: "Kingdra",
    0x00E6: "Phanpy",
    0x00E7: "Donphan",
    0x00E8: "Porygon2",
    0x00E9: "Stantler",
    0x00EA: "Smeargle",
    0x00EB: "Tyrogue",
    0x00EC: "Hitmontop",
    0x00ED: "Smoochum",
    0x00EE: "Elekid",
    0x00EF: "Magby",
    0x00F0: "Miltank",
    0x00F1: "Blissey",
    0x00F2: "Raikou",
    0x00F3: "Entei",
    0x00F4: "Suicune",
    0x00F5: "Larvitar",
    0x00F6: "Pupitar",
    0x00F7: "Tyranitar",
    0x00F8: "Lugia",
    0x00F9: "Ho-oh",
    0x00FA: "Celebi",
    0x00FB: "Treecko",
    0x00FC: "Grovyle",
    0x00FD: "Sceptile",
    0x00FE: "Torchic",
    0x00FF: "Combusken",
    0x0100: "Blaziken",
    0x0101: "Mudkip",
    0x0102: "Marshtomp",
    0x0103: "Swampert",
    0x0104: "Poochyena",
    0x0105: "Mightyena",
    0x0106: "Zigzagoon",
    0x0107: "Linoone",
    0x0108: "Wurmple",
    0x0109: "Silcoon",
    0x010A: "Beautifly",
    0x010B: "Cascoon",
    0x010C: "Dustox",
    0x010D: "Lotad",
    0x010E: "Lombre",
    0x010F: "Ludicolo",
    0x0110: "Seedot",
    0x0111: "Nuzleaf",
    0x0112: "Shiftry",
    0x0113: "Taillow",
    0x0114: "Swellow",
    0x0115: "Wingull",
    0x0116: "Pelipper",
    0x0117: "Ralts",
    0x0118: "Kirlia",
    0x0119: "Gardevoir",
    0x011A: "Surskit",
    0x011B: "Masquerain",
    0x011C: "Shroomish",
    0x011D: "Breloom",
    0x011E: "Slakoth",
    0x011F: "Vigoroth",
    0x0120: "Slaking",
    0x0121: "Nincada",
    0x0122: "Ninjask",
    0x0123: "Shedinja",
    0x0124: "Whismur",
    0x0125: "Loudred",
    0x0126: "Exploud",
    0x0127: "Makuhita",
    0x0128: "Hariyama",
    0x0129: "Azurill",
    0x012A: "Nosepass",
    0x012B: "Skitty",
    0x012C: "Delcatty",
    0x012D: "Sableye",
    0x012E: "Mawile",
    0x012F: "Aron",
    0x0130: "Lairon",
    0x0131: "Aggron",
    0x0132: "Meditite",
    0x0133: "Medicham",
    0x0134: "Electrike",
    0x0135: "Manectric",
    0x0136: "Plusle",
    0x0137: "Minun",
    0x0138: "Volbeat",
    0x0139: "Illumise",
    0x013A: "Roselia",
    0x013B: "Gulpin",
    0x013C: "Swalot",
    0x013D: "Carvanha",
    0x013E: "Sharpedo",
    0x013F: "Wailmer",
    0x0140: "Wailord",
    0x0141: "Numel",
    0x0142: "Camerupt",
    0x0143: "Torkoal",
    0x0144: "Spoink",
    0x0145: "Grumpig",
    0x0146: "Spinda",
    0x0147: "Trapinch",
    0x0148: "Vibrava",
    0x0149: "Flygon",
    0x014A: "Cacnea",
    0x014B: "Cacturne",
    0x014C: "Swablu",
    0x014D: "Altaria",
    0x014E: "Zangoose",
    0x014F: "Seviper",
    0x0150: "Lunatone",
    0x0151: "Solrock",
    0x0152: "Barboach",
    0x0153: "Whiscash",
    0x0154: "Corphish",
    0x0155: "Crawdaunt",
    0x0156: "Baltoy",
    0x0157: "Claydol",
    0x0158: "Lileep",
    0x0159: "Cradily",
    0x015A: "Anorith",
    0x015B: "Armaldo",
    0x015C: "Feebas",
    0x015D: "Milotic",
    0x015E: "Castform",
    0x015F: "Kecleon",
    0x0160: "Shuppet",
    0x0161: "Banette",
    0x0162: "Duskull",
    0x0163: "Dusclops",
    0x0164: "Tropius",
    0x0165: "Chimecho",
    0x0166: "Absol",
    0x0167: "Wynaut",
    0x0168: "Snorunt",
    0x0169: "Glalie",
    0x016A: "Spheal",
    0x016B: "Sealeo",
    0x016C: "Walrein",
    0x016D: "Clamperl",
    0x016E: "Huntail",
    0x016F: "Gorebyss",
    0x0170: "Relicanth",
    0x0171: "Luvdisc",
    0x0172: "Bagon",
    0x0173: "Shelgon",
    0x0174: "Salamence",
    0x0175: "Beldum",
    0x0176: "Metang",
    0x0177: "Metagross",
    0x0178: "Regirock",
    0x0179: "Regice",
    0x017A: "Registeel",
    0x017B: "Latias",
    0x017C: "Latios",
    0x017D: "Kyogre",
    0x017E: "Groudon",
    0x017F: "Rayquaza",
    0x0180: "Jirachi",
    0x0181: "Deoxys",
    0x0182: "Turtwig",
    0x0183: "Grotle",
    0x0184: "Torterra",
    0x0185: "Chimchar",
    0x0186: "Monferno",
    0x0187: "Infernape",
    0x0188: "Piplup",
    0x0189: "Prinplup",
    0x018A: "Empoleon",
    0x018B: "Starly",
    0x018C: "Staravia",
    0x018D: "Staraptor",
    0x018E: "Bidoof",
    0x018F: "Bibarel",
    0x0190: "Kricketot",
    0x0191: "Kricketune",
    0x0192: "Shinx",
    0x0193: "Luxio",
    0x0194: "Luxray",
    0x0195: "Budew",
    0x0196: "Roserade",
    0x0197: "Cranidos",
    0x0198: "Rampardos",
    0x0199: "Shieldon",
    0x019A: "Bastiodon",
    0x019B: "Burmy",
    0x019C: "Wormadam",
    0x019D: "Mothim",
    0x019E: "Combee",
    0x019F: "Vespiquen",
    0x01A0: "Pachirisu",
    0x01A1: "Buizel",
    0x01A2: "Floatzel",
    0x01A3: "Cherubi",
    0x01A4: "Cherrim",
    0x01A5: "Shellos",
    0x01A6: "Gastrodon",
    0x01A7: "Ambipom",
    0x01A8: "Drifloon",
    0x01A9: "Drifblim",
    0x01AA: "Buneary",
    0x01AB: "Lopunny",
    0x01AC: "Mismagius",
    0x01AD: "Honchkrow",
    0x01AE: "Glameow",
    0x01AF: "Purugly",
    0x01B0: "Chingling",
    0x01B1: "Stunky",
    0x01B2: "Skuntank",
    0x01B3: "Bronzor",
    0x01B4: "Bronzong",
    0x01B5: "Bonsly",
    0x01B6: "Mime Jr.",
    0x01B7: "Happiny",
    0x01B8: "Chatot",
    0x01B9: "Spiritomb",
    0x01BA: "Gible",
    0x01BB: "Gabite",
    0x01BC: "Garchomp",
    0x01BD: "Munchlax",
    0x01BE: "Riolu",
    0x01BF: "Lucario",
    0x01C0: "Hippopotas",
    0x01C1: "Hippowdon",
    0x01C2: "Skorupi",
    0x01C3: "Drapion",
    0x01C4: "Croagunk",
    0x01C5: "Toxicroak",
    0x01C6: "Carnivine",
    0x01C7: "Finneon",
    0x01C8: "Lumineon",
    0x01C9: "Mantyke",
    0x01CA: "Snover",
    0x01CB: "Abomasnow",
    0x01CC: "Weavile",
    0x01CD: "Magnezone",
    0x01CE: "Lickilicky",
    0x01CF: "Rhyperior",
    0x01D0: "Tangrowth",
    0x01D1: "Electivire",
    0x01D2: "Magmortar",
    0x01D3: "Togekiss",
    0x01D4: "Yanmega",
    0x01D5: "Leafeon",
    0x01D6: "Glaceon",
    0x01D7: "Gliscor",
    0x01D8: "Mamoswine",
    0x01D9: "Porygon-Z",
    0x01DA: "Gallade",
    0x01DB: "Probopass",
    0x01DC: "Dusknoir",
    0x01DD: "Froslass",
    0x01DE: "Rotom",
    0x01DF: "Uxie",
    0x01E0: "Mesprit",
    0x01E1: "Azelf",
    0x01E2: "Dialga",
    0x01E3: "Palkia",
    0x01E4: "Heatran",
    0x01E5: "Regigigas",
    0x01E6: "Giratina",
    0x01E7: "Cresselia",
    0x01E8: "Phione",
    0x01E9: "Manaphy",
    0x01EA: "Darkrai",
    0x01EB: "Shaymin",
    0x01EC: "Arceus",
}

partyBe = {
    1: "is",
    2: "are",
    3: "are",
    4: "are"
}

partyConnect = {
    0: "",
    1: " and ",
    2: ", "
}

teamRanks = {
     0: "Normal",
     1: "Bronze",
     2: "Silver",
     3: "Gold",
     4: "Platinum",
     5: "Diamond",
     6: "Super",
     7: "Hyper",
     8: "Master",
     9: "Royal",
    10: "Slowking"
}

//----------------------------------------
// Functions

function filterPokemonIDs(pokemonName) {
    return array_filter(pokemonIDs, pokemonID => pokemonIDs[pokemonID] == pokemonName)
}

function inGame() {
    return bit0(mem_recruitedPokemonData) != 0x00 &&
           gameState() != 0xFFFFFFFF
}

function gameState() {
    return dword_be(mem_gameState)
}

function getHomeTown() {
    return homeTownIDs[gameVersion]
}

function getDungeonID(id) {
    if (id == 0x00) {
        return id
    }
    if (id > 0x00 && id <= 0x63) { //check valid dungeon ID
        return id + 0x21 * gameVersion
    }
}

function getDungeonName(id) {
    return dungeonIDs[getDungeonID(id)]
}

function checkDungeonID() {
    return byte((dword_be(mem_dungeonPointer) & pointerMask) + 0x2E8)
}

function checkDungeonFloor() {
    return byte((dword_be(mem_dungeonPointer) & pointerMask) + 0x2E9)
}

function checkDungeonCompletion(id) {
    if (id <= 0x33) { //check valid dungeon index of version
        return dword_be(mem_dungeonStates + id * 4)
    }
}

function checkAdventureResultTextID() {
    return word_be(mem_adventureResultData)
}

function checkAdventureResultDungeonID() {
    return byte(mem_adventureResultData + 0x02)
}

function checkAdventureResultDungeonFloor() {
    return byte(mem_adventureResultData + 0x03)
}

function checkMusicID() {
    return word_be((dword_be(mem_musicPointer) & pointerMask) + 0xE4)
}

function countPartySize() {
    return bit0(mem_partyPokemonData + 0 * 176)
         + bit0(mem_partyPokemonData + 1 * 176)
         + bit0(mem_partyPokemonData + 2 * 176)
         + bit0(mem_partyPokemonData + 3 * 176)
}

function checkOpponentPokemonID(slot, pokemonName) {
    address = word_be((dword_be((dword_be((dword_be(mem_dungeonPointer) & pointerMask) + 0x226D0 + ((1 - slot) * 4)) & pointerMask) + 0x40) & pointerMask) + 0x04)
    return __ornext(any_of(filterPokemonIDs(pokemonName), pokemonID => address == pokemonID))
} 

function checkLeaderCoordinate(axis) {
    if (axis == "X") {
        offset = 0x02
    }
    if (axis == "Y") {
        offset = 0x04
    }
    
    return word_be((dword_be(mem_leaderPointer) & pointerMask) + offset)
}

function checkAdventureRankPoints() {
    return dword_be(mem_teamRankPoints)
}

function checkPartyTowerHeight() {
    return dword_be((dword_be((dword_be(mem_leaderPointer) & pointerMask) + 0x44) & pointerMask) + 0x5C)
}

function checkPartyTowerPokemonID(slot, pokemonName) {
    address = word_be((dword_be((dword_be((dword_be((dword_be(mem_leaderPointer) & pointerMask) + 0x44) & pointerMask) + 0x4C + ((slot - 1) * 0x4)) & pointerMask) + 0x40) & pointerMask) + 0x04)
    
    return __ornext(any_of(filterPokemonIDs(pokemonName), pokemonID => address == pokemonID))
}

function checkPokemonIDRecruited(pokemonName) {
    // Alternative check for Pokémon like Azelf; unused because a lot of characters used
    totalSlots = 552
    code = always_false()
        
    for slot in range(1, totalSlots) {
        address = mem_recruitedPokemonData + ((slot - 1) * 128)
        
        code = code || (bit0(address) > prev(bit0(address)) &&
                        __ornext(any_of(filterPokemonIDs(pokemonName), pokemonID => word_be(address + 0x04) == pokemonID)))
    }
    
    return code
}

function checkDeoxysRecruited() {
    // Alternative check for Deoxys Recruitment; unused because barely hits character limit
    totalSlots = 552
    code = always_false()
        
    for slot in range(1, totalSlots) {
        address = mem_recruitedPokemonData + ((slot - 1) * 128)
        
        code = code || (bit0(address) > prev(bit0(address)) &&
                        word_be(address + 0x04) >= 0x1A2 &&
                        word_be(address + 0x04) <= 0x1A5)
                    || (bit0(address) > prev(bit0(address)) &&
                        word_be(address + 0x04) >= 0x3FA &&
                        word_be(address + 0x04) <= 0x3FD)
    }
    
    return code
}

function checkShinyPokemonRecruited() {
    totalSlots = 552
    code = always_false()
        
    for slot in range(1, totalSlots) {
        address = mem_recruitedPokemonData + ((slot - 1) * 128)
        
        code = code || (bit0(address) > prev(bit0(address)) &&
                        byte(address + 0x7E) > 0)
    }
    
    return code
}

function checkPokemonRecruitedFlag(pokemonName) {
    offset = array_filter(pokemonFlagOffset, pokemonID => pokemonFlagOffset[pokemonID] == pokemonName)
    
    return byte(mem_recruitedPokemonFlags + any_of(offset, i => i)) / byte(mem_recruitedPokemonFlags + any_of(offset, i => i))
}

function checkTotalRecruitments() {
  return 0
       + checkPokemonRecruitedFlag("Bulbasaur")     // 001
       + checkPokemonRecruitedFlag("Ivysaur")       // 002
       + checkPokemonRecruitedFlag("Venusaur")      // 003
       + checkPokemonRecruitedFlag("Squirtle")      // 007
       + checkPokemonRecruitedFlag("Wartortle")     // 008
       + checkPokemonRecruitedFlag("Blastoise")     // 009
       + checkPokemonRecruitedFlag("Caterpie")      // 010
       + checkPokemonRecruitedFlag("Metapod")       // 011
       + checkPokemonRecruitedFlag("Butterfree")    // 012
       + checkPokemonRecruitedFlag("Sandshrew")     // 027
       + checkPokemonRecruitedFlag("Sandslash")     // 028
       + checkPokemonRecruitedFlag("Clefairy")      // 035
       + checkPokemonRecruitedFlag("Clefable")      // 036
       + checkPokemonRecruitedFlag("Jigglypuff")    // 039
       + checkPokemonRecruitedFlag("Wigglytuff")    // 040
       + checkPokemonRecruitedFlag("Zubat")         // 041
       + checkPokemonRecruitedFlag("Golbat")        // 042
       + checkPokemonRecruitedFlag("Oddish")        // 043
       + checkPokemonRecruitedFlag("Gloom")         // 044
       + checkPokemonRecruitedFlag("Vileplume")     // 045
       + checkPokemonRecruitedFlag("Diglett")       // 050
       + checkPokemonRecruitedFlag("Dugtrio")       // 051
       + checkPokemonRecruitedFlag("Poliwag")       // 060
       + checkPokemonRecruitedFlag("Poliwhirl")     // 061
       + checkPokemonRecruitedFlag("Poliwrath")     // 062
       + checkPokemonRecruitedFlag("Geodude")       // 074
       + checkPokemonRecruitedFlag("Graveler")      // 075
       + checkPokemonRecruitedFlag("Golem")         // 076
       + checkPokemonRecruitedFlag("Slowpoke")      // 079
       + checkPokemonRecruitedFlag("Slowbro")       // 080
       + checkPokemonRecruitedFlag("Farfetch'd")    // 083
       + checkPokemonRecruitedFlag("Onix")          // 095
       + checkPokemonRecruitedFlag("Voltorb")       // 100
       + checkPokemonRecruitedFlag("Electrode")     // 101
       + checkPokemonRecruitedFlag("Koffing")       // 109
       + checkPokemonRecruitedFlag("Weezing")       // 110
       + checkPokemonRecruitedFlag("Tangela")       // 114
       + checkPokemonRecruitedFlag("Kangaskhan")    // 115
       + checkPokemonRecruitedFlag("Horsea")        // 116
       + checkPokemonRecruitedFlag("Seadra")        // 117
       + checkPokemonRecruitedFlag("Mr. Mime")      // 122
       + checkPokemonRecruitedFlag("Scyther")       // 123
       + checkPokemonRecruitedFlag("Jynx")          // 124
       + checkPokemonRecruitedFlag("Tauros")        // 128
       + checkPokemonRecruitedFlag("Lapras")        // 131
       + checkPokemonRecruitedFlag("Ditto")         // 132
       + checkPokemonRecruitedFlag("Vaporeon")      // 134
       + checkPokemonRecruitedFlag("Porygon")       // 137
       + checkPokemonRecruitedFlag("Snorlax")       // 143
       + checkPokemonRecruitedFlag("Dratini")       // 147
       + checkPokemonRecruitedFlag("Dragonair")     // 148
       + checkPokemonRecruitedFlag("Dragonite")     // 149
       + checkPokemonRecruitedFlag("Mewtwo")        // 150
       + checkPokemonRecruitedFlag("Chikorita")     // 152
       + checkPokemonRecruitedFlag("Bayleef")       // 153
       + checkPokemonRecruitedFlag("Meganium")      // 154
       + checkPokemonRecruitedFlag("Totodile")      // 158
       + checkPokemonRecruitedFlag("Croconaw")      // 159
       + checkPokemonRecruitedFlag("Feraligatr")    // 160
       + checkPokemonRecruitedFlag("Hoothoot")      // 163
       + checkPokemonRecruitedFlag("Noctowl")       // 164
       + checkPokemonRecruitedFlag("Spinarak")      // 167
       + checkPokemonRecruitedFlag("Ariados")       // 168
       + checkPokemonRecruitedFlag("Crobat")        // 169
       + checkPokemonRecruitedFlag("Chinchou")      // 170
       + checkPokemonRecruitedFlag("Lanturn")       // 171
       + checkPokemonRecruitedFlag("Cleffa")        // 173
       + checkPokemonRecruitedFlag("Igglybuff")     // 174
       + checkPokemonRecruitedFlag("Natu")          // 177
       + checkPokemonRecruitedFlag("Xatu")          // 178
       + checkPokemonRecruitedFlag("Bellossom")     // 182
       + checkPokemonRecruitedFlag("Marill")        // 183
       + checkPokemonRecruitedFlag("Azumarill")     // 184
       + checkPokemonRecruitedFlag("Politoed")      // 186
       + checkPokemonRecruitedFlag("Hoppip")        // 187
       + checkPokemonRecruitedFlag("Skiploom")      // 188
       + checkPokemonRecruitedFlag("Jumpluff")      // 189
       + checkPokemonRecruitedFlag("Yanma")         // 193
       + checkPokemonRecruitedFlag("Wooper")        // 194
       + checkPokemonRecruitedFlag("Quagsire")      // 195
       + checkPokemonRecruitedFlag("Murkrow")       // 198
       + checkPokemonRecruitedFlag("Slowking")      // 199
       + checkPokemonRecruitedFlag("Misdreavus")    // 200
       + checkPokemonRecruitedFlag("Unown")         // 201
       + checkPokemonRecruitedFlag("Wobbuffet")     // 202
       + checkPokemonRecruitedFlag("Girafarig")     // 203
       + checkPokemonRecruitedFlag("Pineco")        // 204
       + checkPokemonRecruitedFlag("Forretress")    // 205
       + checkPokemonRecruitedFlag("Dunsparce")     // 206
       + checkPokemonRecruitedFlag("Steelix")       // 208
       + checkPokemonRecruitedFlag("Scizor")        // 212
       + checkPokemonRecruitedFlag("Shuckle")       // 213
       + checkPokemonRecruitedFlag("Sneasel")       // 215
       + checkPokemonRecruitedFlag("Slugma")        // 218
       + checkPokemonRecruitedFlag("Magcargo")      // 219
       + checkPokemonRecruitedFlag("Corsola")       // 222
       + checkPokemonRecruitedFlag("Delibird")      // 225
       + checkPokemonRecruitedFlag("Skarmory")      // 227
       + checkPokemonRecruitedFlag("Houndour")      // 228
       + checkPokemonRecruitedFlag("Houndoom")      // 229
       + checkPokemonRecruitedFlag("Kingdra")       // 230
       + checkPokemonRecruitedFlag("Phanpy")        // 231
       + checkPokemonRecruitedFlag("Donphan")       // 232
       + checkPokemonRecruitedFlag("Porygon2")      // 233
       + checkPokemonRecruitedFlag("Smeargle")      // 235
       + checkPokemonRecruitedFlag("Smoochum")      // 238
       + checkPokemonRecruitedFlag("Lugia")         // 249
       + checkPokemonRecruitedFlag("Mudkip")        // 258
       + checkPokemonRecruitedFlag("Marshtomp")     // 259
       + checkPokemonRecruitedFlag("Swampert")      // 260
       + checkPokemonRecruitedFlag("Zigzagoon")     // 263
       + checkPokemonRecruitedFlag("Linoone")       // 264
       + checkPokemonRecruitedFlag("Wurmple")       // 265
       + checkPokemonRecruitedFlag("Silcoon")       // 266
       + checkPokemonRecruitedFlag("Beautifly")     // 267
       + checkPokemonRecruitedFlag("Cascoon")       // 268
       + checkPokemonRecruitedFlag("Dustox")        // 269
       + checkPokemonRecruitedFlag("Ludicolo")      // 272
       + checkPokemonRecruitedFlag("Seedot")        // 273
       + checkPokemonRecruitedFlag("Nuzleaf")       // 274
       + checkPokemonRecruitedFlag("Shiftry")       // 275
       + checkPokemonRecruitedFlag("Wingull")       // 278
       + checkPokemonRecruitedFlag("Pelipper")      // 279
       + checkPokemonRecruitedFlag("Surskit")       // 283
       + checkPokemonRecruitedFlag("Masquerain")    // 284
       + checkPokemonRecruitedFlag("Slakoth")       // 287
       + checkPokemonRecruitedFlag("Vigoroth")      // 288
       + checkPokemonRecruitedFlag("Slaking")       // 289
       + checkPokemonRecruitedFlag("Whismur")       // 293
       + checkPokemonRecruitedFlag("Loudred")       // 294
       + checkPokemonRecruitedFlag("Exploud")       // 295
       + checkPokemonRecruitedFlag("Makuhita")      // 296
       + checkPokemonRecruitedFlag("Hariyama")      // 297
       + checkPokemonRecruitedFlag("Azurill")       // 298
       + checkPokemonRecruitedFlag("Nosepass")      // 299
       + checkPokemonRecruitedFlag("Skitty")        // 300
       + checkPokemonRecruitedFlag("Delcatty")      // 301
       + checkPokemonRecruitedFlag("Sableye")       // 302
       + checkPokemonRecruitedFlag("Aron")          // 304
       + checkPokemonRecruitedFlag("Lairon")        // 305
       + checkPokemonRecruitedFlag("Aggron")        // 306
       + checkPokemonRecruitedFlag("Meditite")      // 307
       + checkPokemonRecruitedFlag("Medicham")      // 308
       + checkPokemonRecruitedFlag("Roselia")       // 315
       + checkPokemonRecruitedFlag("Wailmer")       // 320
       + checkPokemonRecruitedFlag("Wailord")       // 321
       + checkPokemonRecruitedFlag("Numel")         // 322
       + checkPokemonRecruitedFlag("Camerupt")      // 323
       + checkPokemonRecruitedFlag("Torkoal")       // 324
       + checkPokemonRecruitedFlag("Spoink")        // 325
       + checkPokemonRecruitedFlag("Grumpig")       // 326
       + checkPokemonRecruitedFlag("Trapinch")      // 328
       + checkPokemonRecruitedFlag("Vibrava")       // 329
       + checkPokemonRecruitedFlag("Flygon")        // 330
       + checkPokemonRecruitedFlag("Swablu")        // 333
       + checkPokemonRecruitedFlag("Altaria")       // 334
       + checkPokemonRecruitedFlag("Zangoose")      // 335
       + checkPokemonRecruitedFlag("Lunatone")      // 337
       + checkPokemonRecruitedFlag("Barboach")      // 339
       + checkPokemonRecruitedFlag("Whiscash")      // 340
       + checkPokemonRecruitedFlag("Corphish")      // 341
       + checkPokemonRecruitedFlag("Crawdaunt")     // 342
       + checkPokemonRecruitedFlag("Anorith")       // 347
       + checkPokemonRecruitedFlag("Armaldo")       // 348
       + checkPokemonRecruitedFlag("Feebas")        // 349
       + checkPokemonRecruitedFlag("Milotic")       // 350
       + checkPokemonRecruitedFlag("Castform")      // 351
       + checkPokemonRecruitedFlag("Shuppet")       // 353
       + checkPokemonRecruitedFlag("Banette")       // 354
       + checkPokemonRecruitedFlag("Duskull")       // 355
       + checkPokemonRecruitedFlag("Dusclops")      // 356
       + checkPokemonRecruitedFlag("Chimecho")      // 358
       + checkPokemonRecruitedFlag("Absol")         // 359
       + checkPokemonRecruitedFlag("Wynaut")        // 360
       + checkPokemonRecruitedFlag("Snorunt")       // 361
       + checkPokemonRecruitedFlag("Glalie")        // 362
       + checkPokemonRecruitedFlag("Relicanth")     // 369
       + checkPokemonRecruitedFlag("Metagross")     // 376
       + checkPokemonRecruitedFlag("Regice")        // 378
       + checkPokemonRecruitedFlag("Kyogre")        // 382
       + checkPokemonRecruitedFlag("Deoxys")        // 386
       + checkPokemonRecruitedFlag("Turtwig")       // 387
       + checkPokemonRecruitedFlag("Grotle")        // 388
       + checkPokemonRecruitedFlag("Torterra")      // 389
       + checkPokemonRecruitedFlag("Chimchar")      // 390
       + checkPokemonRecruitedFlag("Monferno")      // 391
       + checkPokemonRecruitedFlag("Infernape")     // 392
       + checkPokemonRecruitedFlag("Piplup")        // 393
       + checkPokemonRecruitedFlag("Prinplup")      // 394
       + checkPokemonRecruitedFlag("Empoleon")      // 395
       + checkPokemonRecruitedFlag("Bidoof")        // 399
       + checkPokemonRecruitedFlag("Bibarel")       // 400
       + checkPokemonRecruitedFlag("Budew")         // 406
       + checkPokemonRecruitedFlag("Roserade")      // 407
       + checkPokemonRecruitedFlag("Burmy")         // 412
       + checkPokemonRecruitedFlag("Wormadam")      // 413
       + checkPokemonRecruitedFlag("Mothim")        // 414
       + checkPokemonRecruitedFlag("Buizel")        // 418
       + checkPokemonRecruitedFlag("Floatzel")      // 419
       + checkPokemonRecruitedFlag("Shellos")       // 422
       + checkPokemonRecruitedFlag("Gastrodon")     // 423
       + checkPokemonRecruitedFlag("Mismagius")     // 429
       + checkPokemonRecruitedFlag("Honchkrow")     // 430
       + checkPokemonRecruitedFlag("Chingling")     // 433
       + checkPokemonRecruitedFlag("Stunky")        // 434
       + checkPokemonRecruitedFlag("Skuntank")      // 435
       + checkPokemonRecruitedFlag("Mime Jr.")      // 439
       + checkPokemonRecruitedFlag("Chatot")        // 441
       + checkPokemonRecruitedFlag("Spiritomb")     // 442
       + checkPokemonRecruitedFlag("Munchlax")      // 446
       + checkPokemonRecruitedFlag("Riolu")         // 447
       + checkPokemonRecruitedFlag("Lucario")       // 448
       + checkPokemonRecruitedFlag("Croagunk")      // 453
       + checkPokemonRecruitedFlag("Toxicroak")     // 454
       + checkPokemonRecruitedFlag("Weavile")       // 461
       + checkPokemonRecruitedFlag("Tangrowth")     // 465
       + checkPokemonRecruitedFlag("Yanmega")       // 469
       + checkPokemonRecruitedFlag("Porygon-Z")     // 474
       + checkPokemonRecruitedFlag("Probopass")     // 476
       + checkPokemonRecruitedFlag("Dusknoir")      // 477
       + checkPokemonRecruitedFlag("Froslass")      // 478
       + checkPokemonRecruitedFlag("Azelf")         // 482
       + checkPokemonRecruitedFlag("Heatran")       // 485
       + checkPokemonRecruitedFlag("Phione")        // 489
       + checkPokemonRecruitedFlag("Manaphy")       // 490
}

function pokemonWasRecruited() {
    totalSlots = 552
    code = always_false()
        
    for slot in range(1, totalSlots) {
        address = mem_recruitedPokemonData + ((slot - 1) * 128)
        
        code = code || (inGame() && bit0(address) > prev(bit0(address)))
    }
    
    return once(code)
}


function pokemonWasReleased() {
    totalSlots = 552
    code = always_false()
        
    for slot in range(1, totalSlots) {
        address = mem_recruitedPokemonData + ((slot - 1) * 128)
        
        code = code || bit0(address) < prev(bit0(address))
    }
    
    return once(code)
}

function checkUnownVersion(firstID) {    
    totalRecruitmentSlots = 552

    timer = (byte(mem_gameTimer + 0x03) * 60) + byte(mem_gameTimer + 0x04)
    timerIndex = timer % totalRecruitmentSlots
    slotAddress = mem_recruitedPokemonData + ((timerIndex) * 128)

    return bit0(slotAddress) == 1 &&
           __ornext(word_be(slotAddress + 0x04) == firstID ||
                    word_be(slotAddress + 0x04) == firstID + 0x258)
}

function checkAllUnownRecruited() {
    return tally(28,
                 once(checkUnownVersion(0xC9)), // A
                 once(checkUnownVersion(0xCA)), // B
                 once(checkUnownVersion(0xCB)), // C
                 once(checkUnownVersion(0xCC)), // D
                 once(checkUnownVersion(0xCD)), // E
                 once(checkUnownVersion(0xCE)), // F
                 once(checkUnownVersion(0xCF)), // G
                 once(checkUnownVersion(0xD0)), // H
                 once(checkUnownVersion(0xD1)), // I
                 once(checkUnownVersion(0xD2)), // J
                 once(checkUnownVersion(0xD3)), // K
                 once(checkUnownVersion(0xD4)), // L
                 once(checkUnownVersion(0xD5)), // M
                 once(checkUnownVersion(0xD6)), // N
                 once(checkUnownVersion(0xD7)), // O
                 once(checkUnownVersion(0xD8)), // P
                 once(checkUnownVersion(0xD9)), // Q
                 once(checkUnownVersion(0xDA)), // R
                 once(checkUnownVersion(0xDB)), // S
                 once(checkUnownVersion(0xDC)), // T
                 once(checkUnownVersion(0xDD)), // U
                 once(checkUnownVersion(0xDE)), // V
                 once(checkUnownVersion(0xDF)), // W
                 once(checkUnownVersion(0xE0)), // X
                 once(checkUnownVersion(0xE1)), // Y
                 once(checkUnownVersion(0xE2)), // Z
                 once(checkUnownVersion(0xE3)), // !
                 once(checkUnownVersion(0xE4))  // ?
           )
}

//----------------------------------------
// Achievements

achievement(
    title = "No Food, No Juice", type = "progression",
    description = format("Find and rescue Shuckle in {0}.", getDungeonName(0x01)),
    id = 558140, badge = "633758", points = 3,
    trigger = inGame() &&
              checkAdventureResultDungeonID() == getDungeonID(0x01) &&
              checkAdventureResultDungeonFloor() == 7 &&
              checkDungeonCompletion(0x01) > prev(checkDungeonCompletion(0x01))
)

achievement(
    title = "Reaper of the Lively Field", type = "",
    description = format("Reach the end of {0}.", getDungeonName(0x02)),
    id = 558288, badge = "633954", points = 5,
    trigger = inGame() &&
              checkAdventureResultDungeonID() == getDungeonID(0x02) &&
              checkAdventureResultDungeonFloor() == 11 &&
              checkAdventureResultTextID() == 0x27A
)

achievement(
    title = "Stack of Trouble", type = "progression",
    description = format("Learn how to stack from Slowking."),
    id = 558150, badge = "633901", points = 1,
    trigger = inGame() &&
              checkAdventureResultDungeonID() == getDungeonID(0x14) &&
              checkAdventureResultDungeonFloor() == 1 &&
              checkAdventureResultTextID() == 0x27A
)

achievement(
    title = "Above the Veil", type = "",
    description = format("Reach the end of {0}.", getDungeonName(0x03)),
    id = 558289, badge = "634037", points = 5,
    trigger = inGame() &&
              checkAdventureResultDungeonID() == getDungeonID(0x03) &&
              checkAdventureResultDungeonFloor() == 15 &&
              checkAdventureResultTextID() == 0x27A
)

achievement(
    title = "Mangrove Paradise", type = "",
    description = format("Reach the end of {0}.", getDungeonName(0x0E)),
    id = 559324, badge = "635272", points = 3,
    trigger = inGame() &&
              checkAdventureResultDungeonID() == getDungeonID(0x0E) &&
              checkAdventureResultDungeonFloor() == 6 &&
              checkAdventureResultTextID() == 0x27A
)

achievement(
    title = "Gleam in the Depths", type = "",
    description = format("Reach the end of {0}.", getDungeonName(0x07)),
    id = 559342, badge = "635291", points = 5,
    trigger = inGame() &&
              checkAdventureResultDungeonID() == getDungeonID(0x07) &&
              checkAdventureResultDungeonFloor() == 12 &&
              checkAdventureResultTextID() == 0x27A
)


achievement(
    title = "Too Sweet To Die", type = "progression",
    description = format("Find the delicious-looking chocolate in {0}.", getDungeonName(0x04)),
    id = 559345, badge = "635296", points = 10,
    trigger = inGame() &&
              checkAdventureResultDungeonID() == getDungeonID(0x04) &&
              checkAdventureResultDungeonFloor() == 20 &&
              checkDungeonCompletion(0x04) > prev(checkDungeonCompletion(0x04))
)

achievement(
    title = "A Piece of Peace", type = "win_condition",
    description = format("Find the treasure and bring peace to the {0}.", homeTownName[gameVersion]),
    id = 559640, badge = "635744", points = 10,
    trigger = inGame() &&
              checkAdventureResultDungeonID() == getDungeonID(0x05) &&
              checkAdventureResultDungeonFloor() == 25 &&
              checkAdventureResultTextID() == 0x27A &&
              checkMusicID() == 0x10
)

achievement(
    title = "Swirling Waves", type = "",
    description = format("Defeat the lord of the seas at {0}.", getDungeonName(0x06)),
    id = 560222, badge = "636625", points = 25,
    trigger = inGame() &&
              checkAdventureResultDungeonID() == getDungeonID(0x06) &&
              checkAdventureResultDungeonFloor() == 30 &&
              checkAdventureResultTextID() == 0x27A &&
              once(checkOpponentPokemonID(1, "Kyogre") &&
                never(gameState() == 0x02 &&
                      checkDungeonFloor() != 30))
)

achievement(
    title = "Rising Wind", type = "",
    description = format("Defeat the guardian of the seas at {0}.", getDungeonName(0x08)),
    id = 560620, badge = "636731", points = 10,
    trigger = inGame() &&
              checkAdventureResultDungeonID() == getDungeonID(0x08) &&
              checkAdventureResultDungeonFloor() == 18 &&
              checkAdventureResultTextID() == 0x27A &&
              once(checkOpponentPokemonID(1, "Lugia") &&
                never(gameState() == 0x02 &&
                      checkDungeonFloor() != 18))
)

achievement(
    title = "Mysterious Deluxe Trip", type = "",
    description = format("Reach the end of {0}.", getDungeonName(0x09)),
    id = 560623, badge = "636738", points = 10,
    trigger = inGame() &&
              checkAdventureResultDungeonID() == getDungeonID(0x09) &&
              checkAdventureResultDungeonFloor() == 20 &&
              checkAdventureResultTextID() == 0x27A
)

achievement(
    title = "Resistance Blizzard", type = "",
    description = format("Defeat the ice exterminator at {0}.", getDungeonName(0x0A)),
    id = 560711, badge = "636938", points = 25,
    trigger = inGame() &&
              checkAdventureResultDungeonID() == getDungeonID(0x0A) &&
              checkAdventureResultDungeonFloor() == 24 &&
              checkAdventureResultTextID() == 0x27A &&
              once(checkOpponentPokemonID(1, "Regice") &&
                never(gameState() == 0x02 &&
                      checkDungeonFloor() != 24))
)

achievement(
    title = "Psychic Sphere", type = "",
    description = format("Defeat the research specimen at {0}.", getDungeonName(0x0B)),
    id = 560784, badge = "637011", points = 25,
    trigger = inGame() &&
              checkAdventureResultDungeonID() == getDungeonID(0x0B) &&
              checkAdventureResultDungeonFloor() == 30 &&
              checkAdventureResultTextID() == 0x27A &&
              once(checkOpponentPokemonID(1, "Mewtwo") &&
                never(gameState() == 0x02 &&
                      checkDungeonFloor() != 30))
)

achievement(
    title = "Resorting Alphabet", type = "",
    description = format("Reach the end of {0}.", getDungeonName(0x0C)),
    id = 561260, badge = "637519", points = 5,
    trigger = inGame() &&
              checkAdventureResultDungeonID() == getDungeonID(0x0C) &&
              checkAdventureResultDungeonFloor() == 15 &&
              checkAdventureResultTextID() == 0x27A
)


achievement(
    title = "Wild Freeze", type = "",
    description = format("Defeat the warder of ice at {0}.", getDungeonName(0x1E)),
    id = 561446, badge = "637701", points = 50,
    trigger = inGame() &&
              checkAdventureResultDungeonID() == getDungeonID(0x1E) &&
              checkAdventureResultDungeonFloor() == 50 &&
              checkAdventureResultTextID() == 0x27A &&
              once(checkOpponentPokemonID(1, "Articuno") &&
                never(gameState() == 0x02 &&
                      checkDungeonFloor() != 50))
)

achievement(
    title = "Final Evolution", type = "",
    description = format("Reach the end of {0}.", getDungeonName(0x20)),
    id = 561272, badge = "637531", points = 25,
    trigger = inGame() &&
              checkAdventureResultDungeonID() == getDungeonID(0x20) &&
              checkAdventureResultDungeonFloor() == 30 &&
              checkAdventureResultTextID() == 0x27A
)

achievement(
    title = "One Last Secret", type = "",
    description = format("Enter the treasure room of {0}.", getDungeonName(0x20)),
    id = 561273, badge = "637532", points = 10,
    trigger = inGame() &&
              checkDungeonID() == getDungeonID(0x20) &&
              checkDungeonFloor() == 30 &&
              __ornext(
                  checkLeaderCoordinate("X") != prev(checkLeaderCoordinate("X")) ||
                  checkLeaderCoordinate("Y") != prev(checkLeaderCoordinate("Y"))
              ) &&
              (
                    (
                       checkLeaderCoordinate("X") == 0x0009 &&
                       checkLeaderCoordinate("Y") == 0x0009
                    ) || (
                       checkLeaderCoordinate("X") == 0x000A &&
                       checkLeaderCoordinate("Y") == 0x0009
                    ) || (
                       checkLeaderCoordinate("X") == 0x000B &&
                       checkLeaderCoordinate("Y") == 0x0009
                    ) || (
                       checkLeaderCoordinate("X") == 0x0009 &&
                       checkLeaderCoordinate("Y") == 0x000A
                    ) || (
                       checkLeaderCoordinate("X") == 0x000A &&
                       checkLeaderCoordinate("Y") == 0x000A
                    ) || (
                       checkLeaderCoordinate("X") == 0x000B &&
                       checkLeaderCoordinate("Y") == 0x000A
                    ) || (
                       checkLeaderCoordinate("X") == 0x000A &&
                       checkLeaderCoordinate("Y") == 0x000B
                    )
              )
)

achievement(
    title = "Wigglytuff's Left Hand", type = "",
    description = format("Form a Pokémon Stack every friend of Wigglypuff would recognize."),
    id = 561442, badge = "637696", points = 5,
    trigger = inGame() &&
              gameState() == 0x02 &&
              checkPartyTowerHeight() == 3 &&
              checkPartyTowerPokemonID(1, "Noctowl") &&
              checkPartyTowerPokemonID(2, "Anorith") &&
              checkPartyTowerPokemonID(3, "Hoothoot")
)

achievement(
    title = "Riding the Ghost Train", type = "",
    description = format("Ride a Ghost-type Pokémon which can go through walls."),
    id = 561948, badge = "638328", points = 2,
    trigger = inGame() &&
              gameState() == 0x02 &&
              checkDungeonID() != 0x14 &&
              checkDungeonID() != 0x35 &&
              checkDungeonID() != 0x56 &&
              checkPartyTowerHeight() >= 2 &&
              checkPartyTowerHeight() <= 4 &&
              dword_be((dword_be(mem_leaderPointer) & pointerMask) + 0x44) != dword_be(mem_leaderPointer) &&
              __ornext(checkPartyTowerPokemonID(1, "Gastly")     ||
                       checkPartyTowerPokemonID(1, "Haunter")    ||
                       checkPartyTowerPokemonID(1, "Gengar")     ||
                       checkPartyTowerPokemonID(1, "Misdreavus") ||
                       checkPartyTowerPokemonID(1, "Shedinja")   ||
                       checkPartyTowerPokemonID(1, "Shuppet")    ||
                       checkPartyTowerPokemonID(1, "Banette")    ||
                       checkPartyTowerPokemonID(1, "Duskull")    ||
                       checkPartyTowerPokemonID(1, "Dusclops")   ||
                       checkPartyTowerPokemonID(1, "Mismagius")  ||
                       checkPartyTowerPokemonID(1, "Dusknoir")   ||
                       checkPartyTowerPokemonID(1, "Rotom")      ||
                       checkPartyTowerPokemonID(1, "Darkrai")
                      )
)

achievement(
    title = "Together We Are Strong", type = "",
    description = format("Recruit every available Pokémon at least once."),
    id = 561699, badge = "638073", points = 50,
    trigger = inGame() &&
              measured(checkTotalRecruitments() == 225) &&
                 prev(checkTotalRecruitments()) == 224
)

achievement(
    title = "Spelling Friends", type = "",
    description = format("Have every Unown version befriended at the same time."),
    id = 561730, badge = "638082", points = 10,
    trigger = inGame() &&
              measured(checkAllUnownRecruited()) &&
              pokemonWasRecruited() &&
              never(pokemonWasReleased())
)

achievement(
    title = "My Tummy Is Ready!", type = "",
    description = format("Recruit a shiny Pokémon."),
    id = 561689, badge = "637973", points = 5,
    trigger = inGame() &&
              checkShinyPokemonRecruited()
)

achievement(
    title = "Reactive Color", type = "",
    description = "Recruit Kecleon in a dungeon.",
    id = 0, badge = "638285", points = 25,
    trigger = inGame() &&
              gameState() == 0x02 &&
              checkPokemonRecruitedFlag("Kecleon") == 1 &&
              prev(checkPokemonRecruitedFlag("Kecleon")) == 0
)

achievement(
    title = "Star Force", type = "",
    description = format("Recruit Deoxys at {0}.", getDungeonName(0x09)),
    id = 561788, badge = "638138", points = 10,
    trigger = inGame() &&
              gameState() == 0x02 &&
              checkDungeonID() == getDungeonID(0x09) &&
              checkDungeonFloor() == 18 &&
              checkPokemonRecruitedFlag("Deoxys") == 1 &&
              prev(checkPokemonRecruitedFlag("Deoxys")) == 0
)

achievement(
    title = "Neurokinesis", type = "",
    description = format("Recruit Azelf at {0}.", getDungeonName(0x07)),
    id = 561786, badge = "638093", points = 10,
    trigger = inGame() &&
              gameState() == 0x02 &&
              checkDungeonID() == getDungeonID(0x07) &&
              checkDungeonFloor() == 12 &&
              checkPokemonRecruitedFlag("Azelf") == 1 &&
              prev(checkPokemonRecruitedFlag("Azelf")) == 0
)

achievement(
    title = "Sea Feast", type = "",
    description = format("Recruit Phione at {0}.", getDungeonName(0x06)),
    id = 561934, badge = "638285", points = 10,
    trigger = inGame() &&
              gameState() == 0x02 &&
              checkDungeonID() == getDungeonID(0x06) &&
              checkDungeonFloor() == 16 &&
              checkPokemonRecruitedFlag("Phione") == 1 &&
              prev(checkPokemonRecruitedFlag("Phione")) == 0
)

achievement(
    title = "Doing the Impossible", type = "",
    description = format("Complete a 7-Star mission."),
    id = 561937, badge = "638325", points = 10,
    trigger = inGame() &&
              gameState() == 0x00 &&
              dword_be(mem_missionRewardPointer) != 0 &&
              byte((dword_be(mem_missionRewardPointer) & pointerMask) + 0x00) == 0x4C &&
              prev(byte((dword_be(mem_missionRewardPointer) & pointerMask) + 0x00)) < 0x4C &&
              dword_be((dword_be(mem_missionRewardPointer) & pointerMask) + 0x30) == 6000
)

achievement(
    title = "Baby's First Missions", type = "",
    description = format("Get promoted to Bronze Rank."),
    id = 561289, badge = "637584", points = 1,
    trigger = inGame() &&
              gameState() == 0x00 &&
              measured(checkAdventureRankPoints() >= 100) &&
              prev(checkAdventureRankPoints()) < 100
)

achievement(
    title = "Aiming for Something Bigger", type = "",
    description = format("Get promoted to Silver Rank."),
    id = 561290, badge = "637585", points = 1,
    trigger = inGame() &&
              gameState() == 0x00 &&
              measured(checkAdventureRankPoints() >= 300) &&
              prev(checkAdventureRankPoints()) < 300
)

achievement(
    title = "Make Yourself a Name", type = "",
    description = format("Get promoted to Gold Rank."),
    id = 561291, badge = "637586", points = 3,
    trigger = inGame() &&
              gameState() == 0x00 &&
              measured(checkAdventureRankPoints() >= 1600) &&
              prev(checkAdventureRankPoints()) < 1600
)

achievement(
    title = "Specialists for Rescue", type = "",
    description = format("Get promoted to Platinum Rank."),
    id = 561292, badge = "637587", points = 5,
    trigger = inGame() &&
              gameState() == 0x00 &&
              measured(checkAdventureRankPoints() >= 3200) &&
              prev(checkAdventureRankPoints()) < 3200
)

achievement(
    title = "Treasure Hunters for Life", type = "",
    description = format("Get promoted to Diamond Rank."),
    id = 561293, badge = "637588", points = 5,
    trigger = inGame() &&
              gameState() == 0x00 &&
              measured(checkAdventureRankPoints() >= 5600) &&
              prev(checkAdventureRankPoints()) < 5600
)

achievement(
    title = "Officially Better Than Good", type = "",
    description = format("Get promoted to Super Rank."),
    id = 561294, badge = "637589", points = 10,
    trigger = inGame() &&
              gameState() == 0x00 &&
              measured(checkAdventureRankPoints() >= 9600) &&
              prev(checkAdventureRankPoints()) < 9600
)

achievement(
    title = "Super Dooper Hyper Trooper", type = "",
    description = format("Get promoted to Hyper Rank."),
    id = 561295, badge = "637590", points = 10,
    trigger = inGame() &&
              gameState() == 0x00 &&
              measured(checkAdventureRankPoints() >= 14400) &&
              prev(checkAdventureRankPoints()) < 14400
)

achievement(
    title = "Newborn Guild Master", type = "",
    description = format("Get promoted to Master Rank."),
    id = 561296, badge = "637591", points = 10,
    trigger = inGame() &&
              gameState() == 0x00 &&
              measured(checkAdventureRankPoints() >= 20800) &&
              prev(checkAdventureRankPoints()) < 20800
)
achievement(
    title = "Elite of the Elite", type = "",
    description = format("Get promoted to Royal Rank."),
    id = 561297, badge = "637592", points = 10,
    trigger = inGame() &&
              gameState() == 0x00 &&
              measured(checkAdventureRankPoints() >= 28800) &&
              prev(checkAdventureRankPoints()) < 28800
)

achievement(
    title = "Certified King of Slowness", type = "",
    description = format("Get promoted to Slowking's Certification Rank."),
    id = 561298, badge = "637593", points = 25,
    trigger = inGame() &&
              gameState() == 0x00 &&
              measured(checkAdventureRankPoints() >= 100000) &&
              prev(checkAdventureRankPoints()) < 100000
)

//----------------------------------------
// Rich Presence

rich_presence_conditional_display(!inGame(), 
    "In the Titlescreen"
)

rich_presence_conditional_display(gameState() <= 0x01 && countPartySize() > 0, 
    "{0}{1}{2}{3}{4}{5}{6} {7} {8} [🎀{9}]",
    rich_presence_lookup(
        "PokemonID", 
        word_be(mem_partyPokemonData + 0x0C + 3 * 176) * bit0(mem_partyPokemonData + 3 * 176), 
        pokemonIDs),
    rich_presence_lookup(
        "PartyConnect", 
        measured(2, when = bit0(mem_partyPokemonData + 3 * 176) == 1), 
        partyConnect),
    rich_presence_lookup(
        "PokemonID", 
        word_be(mem_partyPokemonData + 0x0C + 2 * 176) * bit0(mem_partyPokemonData + 2 * 176), 
        pokemonIDs),
    rich_presence_lookup(
        "PartyConnect", 
        measured(2, when = bit0(mem_partyPokemonData + 2 * 176) == 1), 
        partyConnect),
    rich_presence_lookup(
        "PokemonID", 
        word_be(mem_partyPokemonData + 0x0C + 1 * 176) * bit0(mem_partyPokemonData + 1 * 176), 
        pokemonIDs),
    rich_presence_lookup(
        "PartyConnect", 
        measured(1, when = bit0(mem_partyPokemonData + 1 * 176) == 1), 
        partyConnect),
    rich_presence_lookup(
        "PokemonID", 
        word_be(mem_partyPokemonData + 0x0C + 0 * 176) * bit0(mem_partyPokemonData + 0 * 176), 
        pokemonIDs),
    rich_presence_lookup(
        "PartyBe", 
        countPartySize(), 
        partyBe),
    rich_presence_lookup(
        "HomeTown", 
        max_of(measured(gameVersion, when = byte(mem_gameMode) == 0),
               measured(0xFFFFFFFF, when = byte(mem_gameMode) == 1)), 
        homeTownIDs),
    rich_presence_lookup(
        "TeamRank",
        max_of(measured(1,  when = checkAdventureRankPoints() >= 100),
               measured(2,  when = checkAdventureRankPoints() >= 300),
               measured(3,  when = checkAdventureRankPoints() >= 1600),
               measured(4,  when = checkAdventureRankPoints() >= 3200),
               measured(5,  when = checkAdventureRankPoints() >= 5600),
               measured(6,  when = checkAdventureRankPoints() >= 9600),
               measured(7,  when = checkAdventureRankPoints() >= 14400),
               measured(8,  when = checkAdventureRankPoints() >= 20800),
               measured(9,  when = checkAdventureRankPoints() >= 28800),
               measured(10, when = checkAdventureRankPoints() >= 100000)),
        teamRanks)
)

rich_presence_conditional_display(gameState() == 0x02 && countPartySize() > 0, 
    "{0}{1}{2}{3}{4}{5}{6} {7} on {8} {9}{10}F [🎀{11}]",
    rich_presence_lookup(
        "PokemonID", 
        word_be(mem_partyPokemonData + 0x0C + 3 * 176) * bit0(mem_partyPokemonData + 3 * 176), 
        pokemonIDs),
    rich_presence_lookup(
        "PartyConnect", 
        measured(2, when = bit0(mem_partyPokemonData + 3 * 176) == 1), 
        partyConnect),
    rich_presence_lookup(
        "PokemonID", 
        word_be(mem_partyPokemonData + 0x0C + 2 * 176) * bit0(mem_partyPokemonData + 2 * 176), 
        pokemonIDs),
    rich_presence_lookup(
        "PartyConnect", 
        measured(2, when = bit0(mem_partyPokemonData + 2 * 176) == 1), 
        partyConnect),
    rich_presence_lookup(
        "PokemonID", 
        word_be(mem_partyPokemonData + 0x0C + 1 * 176) * bit0(mem_partyPokemonData + 1 * 176), 
        pokemonIDs),
    rich_presence_lookup(
        "PartyConnect", 
        measured(1, when = bit0(mem_partyPokemonData + 1 * 176) == 1), 
        partyConnect),
    rich_presence_lookup(
        "PokemonID", 
        word_be(mem_partyPokemonData + 0x0C + 0 * 176) * bit0(mem_partyPokemonData + 0 * 176), 
        pokemonIDs),
    rich_presence_lookup(
        "PartyBe", 
        countPartySize(), 
        partyBe),
    rich_presence_lookup(
        "Dungeon", 
        checkDungeonID(), 
        dungeonIDs),
    rich_presence_lookup(
        "FloorPrefix", 
        checkDungeonID(), 
        dungeonFloorPrefix),
    rich_presence_macro(
        "Number", 
        checkDungeonFloor()),
    rich_presence_lookup(
        "TeamRank",
        max_of(measured(1,  when = checkAdventureRankPoints() >= 100),
               measured(2,  when = checkAdventureRankPoints() >= 300),
               measured(3,  when = checkAdventureRankPoints() >= 1600),
               measured(4,  when = checkAdventureRankPoints() >= 3200),
               measured(5,  when = checkAdventureRankPoints() >= 5600),
               measured(6,  when = checkAdventureRankPoints() >= 9600),
               measured(7,  when = checkAdventureRankPoints() >= 14400),
               measured(8,  when = checkAdventureRankPoints() >= 20800),
               measured(9,  when = checkAdventureRankPoints() >= 28800),
               measured(10, when = checkAdventureRankPoints() >= 100000)),
        teamRanks)
)

rich_presence_display("In the Titlescreen")



