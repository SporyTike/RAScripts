// Game Boy Advance Video Series
// #ID = 11843

//--------------------------------------------------
// Addresses

mem_romType1EpisodePointer  = 0x006868
mem_romType1VideoState      = 0x006858
mem_romType1SceneCountdown  = 0x006874
mem_romType1VideoPlaytime   = 0x00687C
mem_romType1CurrentChapter  = 0x006888
mem_romType1Input           = 0x007EC4
mem_romType1RNG             = 0x007EF0

mem_romType2EpisodePointer  = 0x006828
mem_romType2VideoState      = 0x006818
mem_romType2SceneCountdown  = 0x006834
mem_romType2VideoPlaytime   = 0x00683C
mem_romType2CurrentChapter  = 0x006848
mem_romType2Input           = 0x007EBC
mem_romType2StateLoaded     = 0x007E80
mem_romType2MenuState       = 0x007EA4
mem_romType2RNG             = 0x0068D0

mem_romType3EpisodePointer  = 0x006820
mem_romType3VideoState      = 0x006810
mem_romType3SceneCountdown  = 0x00682C
mem_romType3VideoPlaytime   = 0x006834
mem_romType3CurrentChapter  = 0x006840
mem_romType3Input           = 0x007EC8
mem_romType3StateLoaded     = 0x0075A0
mem_romType3MenuState       = 0x007EB4
mem_romType3RNG             = 0x00659C

mem_romType4EpisodePointer  = 0x006690
mem_romType4VideoState      = 0x046A5C
mem_romType4SceneCountdown  = 0x0066F4
mem_romType4VideoPlaytime   = 0x0066FC
mem_romType4CurrentChapter  = 0x006704
mem_romType4Input           = 0x007EA8
mem_romType4MenuState       = 0x007E8C
mem_romType4RNG             = 0x007F98

mem_romType5EpisodePointer  = 0x007D54
mem_romType5VideoState      = 0x006EA4
mem_romType5VideoPlaytime   = 0x007D74
mem_romType5Input           = 0x007DD8
mem_romType5MenuState       = 0x007D80
mem_romType5RNG             = 0x006E80

//--------------------------------------------------
// Arrays and Dictionaries

inputArrow = [
    "🠉", "🠈", "🠋", "🠊"
]

previousArrow = [
    ["⇧", "⇦", "⇩", "⇨"] // Used before current
]

episodes = [
    [
        "All Grown Up!",
        "Susie Sings The Blues",
        "All Grown Up! - Volume 1",
        0x08021CDC, // Episode Pointer
        0x00000005, // Chapters
        0x00003DEB, // Total Playtime
    ],
    [
        "All Grown Up!",
        "Coup DeVille",
        "All Grown Up! - Volume 1",
        0x08F661FC, // Episode Pointer
        0x00000005, // Chapters
        0x00003DF9, // Total Playtime
    ],
    [
        "All Grown Up!",
        "Chuckie's in Love",
        "Nicktoons Collection - Volume 1",
        0x08022420, // Episode Pointer
        0x00000005, // Chapters
        0x00003FF5, // Total Playtime
    ],
    [
        "Danny Phantom",
        "Attack of the Killer Garage Sale",
        "Nicktoons Collection - Volume 3",
        0x08000EF8, // Episode Pointer
        0x00000005, // Chapters
        0x00004105, // Total Playtime
    ],
    [
        "Dora the Explorer",
        "Three Little Piggies",
        "Dora the Explorer - Volume 1",
        0x08020CAC, // Episode Pointer
        0x00000005, // Chapters
        0x00003E5F, // Total Playtime
    ],
    [
        "Dora the Explorer",
        "The Big River",
        "Dora the Explorer - Volume 1",
        0x08F43914, // Episode Pointer
        0x00000005, // Chapters
        0x00003EC0, // Total Playtime
    ],
    [
        "Pokémon: Johto League Champions",
        "A Hot Water Battle",
        "Pokémon - Volume 1",
        0x0801FC1C, // Episode Pointer
        0x00000001, // Chapters
        0x000025DE, // Total Playtime
    ],
    [
        "Pokémon: Master Quest",
        "For Ho-Oh The Bells Toll!",
        "Pokémon - Volume 1",
        0x08F4ADF4, // Episode Pointer
        0x00000001, // Chapters
        0x000025F9, // Total Playtime
    ],
    [
        "Pokémon: Master Quest",
        "Playing with Fire!",
        "Pokémon - Volume 2",
        0x0801FAC0, // Episode Pointer
        0x00000001, // Chapters
        0x0000260A, // Total Playtime
    ],
    [
        "Pokémon: Master Quest",
        "Johto Photo Finish",
        "Pokémon - Volume 2",
        0x08FA8DF8, // Episode Pointer
        0x00000001, // Chapters
        0x000025DF, // Total Playtime
    ],
    [
        "Pokémon: Indigo League",
        "Pokémon - I Choose You!",
        "Pokémon - Volume 3",
        0x0801F748, // Episode Pointer
        0x00000001, // Chapters
        0x000025F7, // Total Playtime
    ],
    [
        "Pokémon: Indigo League",
        "Here Comes The Squirtle Squad",
        "Pokémon - Volume 3",
        0x08F845A0, // Episode Pointer
        0x00000001, // Chapters
        0x000025F9, // Total Playtime
    ],
    [
        "Pokémon: Indigo League",
        "Beach Blank-Out Blastoise",
        "Pokémon - Volume 4",
        0x0801FE98, // Episode Pointer
        0x00000001, // Chapters
        0x00002869, // Total Playtime
    ],
    [
        "Pokémon: Indigo League",
        "Go West Young Meowth",
        "Pokémon - Volume 4",
        0x091E737C, // Episode Pointer
        0x00000001, // Chapters
        0x00002898, // Total Playtime
    ],
    [
        "Rocket Power",
        "Big Air Dare",
        "Nicktoons Collection - Volume 2",
        0x08289480, // Episode Pointer
        0x00000005, // Chapters
        0x00002153, // Total Playtime
    ],
    [
        "SpongeBob SquarePants",
        "Bubblestand",
        "SpongeBob SquarePants - Volume 1",
        0x080225B0, // Episode Pointer
        0x00000005, // Chapters
        0x00001F00, // Total Playtime
    ],
    [
        "SpongeBob SquarePants",
        "Ripped Pants",
        "SpongeBob SquarePants - Volume 1",
        0x0878A2E0, // Episode Pointer
        0x00000005, // Chapters
        0x00001EF9, // Total Playtime
    ],
    [
        "SpongeBob SquarePants",
        "Jellyfishing",
        "SpongeBob SquarePants - Volume 1",
        0x08F9FF40, // Episode Pointer
        0x00000005, // Chapters
        0x00001EFF, // Total Playtime
    ],
    [
        "SpongeBob SquarePants",
        "Plankton!",
        "SpongeBob SquarePants - Volume 1",
        0x09791CA0, // Episode Pointer
        0x00000005, // Chapters
        0x00001EF9, // Total Playtime
    ],
    [
        "SpongeBob SquarePants",
        "Mermaidman and Barnacleboy",
        "SpongeBob SquarePants - Volume 2",
        0x08022640, // Episode Pointer
        0x00000005, // Chapters
        0x00001EF9, // Total Playtime
    ],
    [
        "SpongeBob SquarePants",
        "Pickles",
        "SpongeBob SquarePants - Volume 2",
        0x08818EB0, // Episode Pointer
        0x00000005, // Chapters
        0x00001EFB, // Total Playtime
    ],
    [
        "SpongeBob SquarePants",
        "Hall Monitor",
        "SpongeBob SquarePants - Volume 2",
        0x08FBB398, // Episode Pointer
        0x00000005, // Chapters
        0x00001EFF, // Total Playtime
    ],
    [
        "SpongeBob SquarePants",
        "Jellyfish Jam",
        "SpongeBob SquarePants - Volume 2",
        0x096FF978, // Episode Pointer
        0x00000005, // Chapters
        0x00001F02, // Total Playtime
    ],
    [
        "SpongeBob SquarePants",
        "Texas",
        "SpongeBob SquarePants - Volume 3",
        0x0925B500, // Episode Pointer
        0x00000005, // Chapters
        0x00001F08, // Total Playtime
    ],
    [
        "SpongeBob SquarePants",
        "Walking Small",
        "SpongeBob SquarePants - Volume 3",
        0x099E1A94, // Episode Pointer
        0x00000005, // Chapters
        0x00001F47, // Total Playtime
    ],
    [
        "SpongeBob SquarePants",
        "Hooky",
        "SpongeBob SquarePants - Volume 3",
        0x0826EFEC, // Episode Pointer
        0x00000005, // Chapters
        0x000020F0, // Total Playtime
    ],
    [
        "SpongeBob SquarePants",
        "Mermaidman and Barnacleboy II",
        "SpongeBob SquarePants - Volume 3",
        0x08AC67B0, // Episode Pointer
        0x00000005, // Chapters
        0x00001F7A, // Total Playtime
    ],
    [
        "SpongeBob SquarePants",
        "Pizza Delivery",
        "Nicktoons Collection - Volume 1",
        0x0963B8E0, // Episode Pointer
        0x00000005, // Chapters
        0x000020CC, // Total Playtime
    ],
    [
        "SpongeBob SquarePants",
        "Nature Pants",
        "Nicktoons Collection - Volume 2",
        0x08BB19E0, // Episode Pointer
        0x00000005, // Chapters
        0x000020F7, // Total Playtime
    ],
    [
        "SpongeBob SquarePants",
        "Opposite Day",
        "Nicktoons Collection - Volume 2",
        0x09AF6910, // Episode Pointer
        0x00000005, // Chapters
        0x00001EF6, // Total Playtime
    ],
    [
        "SpongeBob SquarePants",
        "Squeaky Boots",
        "Nicktoons Collection - Volume 3",
        0x08EFC690, // Episode Pointer
        0x00000005, // Chapters
        0x00002113, // Total Playtime
    ],
    [
        "The Adventures of Jimmy Neutron: Boy Genius",
        "Brobot",
        "The Adventures of Jimmy Neutron: Boy Genius - Volume 1",
        0x08022E50, // Episode Pointer
        0x00000005, // Chapters
        0x00001F65, // Total Playtime
    ],
    [
        "The Adventures of Jimmy Neutron: Boy Genius",
        "The Big Pinch",
        "The Adventures of Jimmy Neutron: Boy Genius - Volume 1",
        0x087B7DA0, // Episode Pointer
        0x00000005, // Chapters
        0x00001E7B, // Total Playtime
    ],
    [
        "The Adventures of Jimmy Neutron: Boy Genius",
        "Granny Baby",
        "The Adventures of Jimmy Neutron: Boy Genius - Volume 1",
        0x08F190EC, // Episode Pointer
        0x00000005, // Chapters
        0x00001EAA, // Total Playtime
    ],
    [
        "The Adventures of Jimmy Neutron: Boy Genius",
        "Time is Money",
        "The Adventures of Jimmy Neutron: Boy Genius - Volume 1",
        0x09724BC0, // Episode Pointer
        0x00000005, // Chapters
        0x00001F2D, // Total Playtime
    ],
    [
        "The Fairly OddParents!",
        "The Big Problem!",
        "Nicktoons Collection - Volume 1",
        0x08F01CDC, // Episode Pointer
        0x00000005, // Chapters
        0x0000211E, // Total Playtime
    ],
    [
        "The Fairly OddParents!",
        "Odd Ball",
        "Nicktoons Collection - Volume 2",
        0x0945BED0, // Episode Pointer
        0x00000005, // Chapters
        0x000023F8, // Total Playtime
    ],
    [
        "The Fairly OddParents!",
        "Timvisible",
        "Nicktoons Collection - Volume 3",
        0x09839398, // Episode Pointer
        0x00000005, // Chapters
        0x00002443, // Total Playtime
    ],
]

questions = [
    [
        0101,
        "Do not forget to land on what?",
            "Left Hand",
            "Left Foot",
            "Right Hand",
            "Right Foot"
    ],
    [
        0102,
        "How much did Blowing Bubbles cost?",
            "10 Cents",
            "25 Cents",
            "50 Cents",
            "1 Dollar"
    ],
    [
        0103,
        "Who made the gigantic bubble?",
            "SpongeBob",
            "Patrick",
            "Squidward",
            "Sandy"
    ],
    [
        0104,
        "What animal-shaped bubble did SpongeBob not create?",
            "Duck",
            "Giraffe",
            "Elephant",
            "Caterpillar"
    ],
    [
        0201,
        "What kind of sand pizza did SpongeBob deliver?",
            "Olive",
            "Broccoli",
            "Pineapple",
            "Pepperoni"
    ],
    [
        0202,
        "What did SpongeBob use as weights?",
            "Shells",
            "Stones",
            "Mashmallows",
            "Milkshake Cups"
    ],
    [
        0203,
        "What joke was second on SpongeBob's list?",
            "Snack Bar",
            "Volleyball",
            "Frisbee",
            "Surfing"
    ],
    [
        0204,
        "Which instrument did the male fish play?",
            "Guitar",
            "Bass Guitar",
            "Tambourine",
            "Drums"
    ],
    [
        0301,
        "How many jellyfish nets were in the locker?",
            "Two",
            "Three",
            "Four",
            "Five"
    ],
    [
        0302,
        "Who was seen with SpongeBob in the picture on the table?",
            "Patrick",
            "Gary",
            "Squidward",
            "Mr. Krabs"
    ],
    [
        0303,
        "What was the best day ever meal?",
            "Soup",
            "Cake",
            "Krabby Patty",
            "Pizza"
    ],
    [
        0304,
        "What present did Squidward get?",
            "Cake",
            "Jellyfish Net",
            "Jellyfish",
            "Picture"
    ],
    [
        0401,
        "What sauce did SpongeBob shoot into his eye?",
            "Ketchup",
            "Mayonnaise",
            "Mustard",
            "Horseradish"
    ],
    [
        0402,
        "What did Plankton dress up as to hide from SpongeBob?",
            "Gary",
            "Bean",
            "Krabby Patty",
            "Flower"
    ],
    [
        0403,
        "What kind of dog did Plankton own?",
            "Beagle",
            "Rottweiler",
            "Labrador",
            "Spaniel"
    ],
    [
        0404,
        "What is between cheese and lettuce on a Krabby Patty?",
            "Pickles",
            "Onions",
            "Tomatoes",
            "Sauce"
    ],
    [
        0501,
        "What did Mermaidman think SpongeBob and Patrick were doing?",
            "Call for Lunch",
            "Bring Medicine",
            "Fix TV",
            "Visit Them"
    ],
    [
        0502,
        "What was the name of the nursering home?",
            "Gloomy Galleon",
            "Shady Shoals",
            "Dark Depths",
            "Ancient Abyss"
    ],
    [
        0503,
        "What battle of wits did Mermaidman and Barnacleboy do?",
            "Checkers",
            "Chess",
            "Backgammon",
            "Yahtzee"
    ],
    [
        0504,
        "What color was the invisible boatmobile painted in?",
            "White",
            "Purple",
            "Black",
            "Silver"
    ],
    [
        0601,
        "How many bucks did Bubble Bass get back?",
            "Two",
            "Three",
            "Four",
            "Five"
    ],
    [
        0602,
        "Who made the Krabby Patties while SpongeBob was gone?",
            "Patrick",
            "Squidward",
            "Mr. Krabs",
            "Plankton"
    ],
    [
        0603,
        "What was hanging on SpongeBob's front door?",
            "Fried Eggs",
            "Underwear",
            "Shoe",
            "Toaster"
    ],
    [
        0604,
        "What was under Bubble Bass' tongue beside pickles?",
            "Jewelry",
            "Cufflinks",
            "Money",
            "Car Keys"
    ],
    [
        0701,
        "What ice cream flavour did Patrick drop on SpongeBob?",
            "Strawberry",
            "Vanilla",
            "Chocolate",
            "Mint"
    ],
    [
        0702,
        "Who was the maniac of Bikini Bottom?",
            "Patrick",
            "Mr. Krabs",
            "Plankton",
            "SpongeBob"
    ],
    [
        0703,
        "At what intersection did Patrick see the maniac?",
            "Conch / Coral",
            "Seeweed / Shell",
            "Bubble / Beluga",
            "Pearl / Prawn"
    ],
    [
        0704,
        "How many months months will Mrs Puff be in jail?",
            "Three",
            "Six",
            "Nine",
            "Twelve"
    ],
    [
        0801,
        "What did SpongeBob disguise as to hide from the jellyfish?",
            "Sea Sponge",
            "Rock",
            "Corals",
            "Sand"
    ],
    [
        0802,
        "How man fingers did SpongeBob hold up for the jellyfish to count?",
            "One",
            "Two",
            "Three",
            "Four"
    ],
    [
        0803,
        "Who soothes the jellyfish after they started raging?",
            "SpongeBob",
            "Patrick",
            "Gary",
            "Squidward"
    ],
    [
        0804,
        "What did the jellyfish swarm not transform into?",
            "Hand",
            "Guitar",
            "Face",
            "Music Note"
    ],
    [
        0901,
        "What did SpongeBob not try to stop Sandy from leaving Goo Lagoon?",
            "Surfing",
            "Volleyball",
            "Karate",
            "Jellyfishing"
    ],
    [
        0902,
        "What song did Patrick wonder whether Sandy could sing it?",
            "Happy Birthday",
            "Alphabet Song",
            "Muffin Man",
            "Five Little Ducks"
    ],
    [
        0903,
        "When being chased by Sandy, behind what was SpongeBob hiding?",
            "Palm",
            "Anchor",
            "Rock",
            "Corals"
    ],
    [
        0904,
        "What was not part of the Texas party at the Krusty Krab?",
            "Bull Riding",
            "Pecanpie",
            "Barbeque",
            "Square Dancing"
    ],
    [
        1001,
        "What did Plankton put into his suitcase when he was giving up?",
            "Doll",
            "Family Picture",
            "Teddy Bear",
            "Hat"
    ],
    [
        1002,
        "What ice cream flavour did Plankton share with SpongeBob?",
            "Mint",
            "Vanilla",
            "Chocolate",
            "Strawberry"
    ],
    [
        1003,
        "What did SpongeBob steal from the Snack Bar?",
            "French Fries",
            "Milkshakes",
            "Burgers",
            "Hotdogs"
    ],
    [
        1004,
        "What did SpongeBob not transform into?",
            "Elephant",
            "Surfboard",
            "Kite",
            "Volleyball"
    ],
    [
        1101,
        "What clothes were left at the Fish Hooks Park?",
            "Shoes",
            "Baseball Cap",
            "Underwear",
            "Shirt"
    ],
    [
        1102,
        "What was often used as a fishing bait?",
            "Cheese",
            "Worms",
            "Bread",
            "Prawns"
    ],
    [
        1103,
        "How many friends of Pearl were in the Krusty Krab?",
            "Three",
            "Four",
            "Five",
            "Six"
    ],
    [
        1104,
        "Where did Patrick finally end up?",
            "Seafood Dish",
            "Gift Shop",
            "Aquarium",
            "Tuna Can"
    ],
    [
        1201,
        "What vision did Barnacleboy use aginst the conch signal?",
            "Sulfur",
            "Heat",
            "Laser",
            "Acid"
    ],
    [
        1202,
        "What was the name of the hero's hideout?",
            "Mermalair",
            "Barnacave",
            "Hero Hollow",
            "Dark Cove"
    ],
    [
        1203,
        "What villain burned Barnacleboy's head?",
            "Man Ray",
            "Atomic Flounder",
            "Jumbo Shrimp",
            "Sinister Slug"
    ],
    [
        1204,
        "What did SpongeBob use to defeat Dirty Bubble?",
            "Nail",
            "Stick",
            "Pen",
            "Needle"
    ],
    [
        1301,
        "What shape of an animal did the clock in Jimmy's lab have?",
            "Pig",
            "Chicken",
            "Cow",
            "Horse"
    ],
    [
        1302,
        "Over what object did Brobot jump using the pogo stick?",
            "Tree",
            "Skyscraper",
            "Plane",
            "Moon"
    ],
    [
        1303,
        "What did Cindy smell like according to Brobot?",
            "Apples",
            "Flowers",
            "Candies",
            "Vanilla"
    ],
    [
        1304,
        "What did Brobot and his family do on the moon?",
            "Basketball",
            "Baseball",
            "Frisbee",
            "Football"
    ],
    [
        1401,
        "What park name did Jimmy type into the time booth?",
            "Menlo",
            "Holmdel",
            "Colonial",
            "Thompson"
    ],
    [
        1402,
        "What was the first electronical device that broke?",
            "Rollercoaster",
            "Jukebox",
            "Telephone",
            "Goddard"
    ],
    [
        1403,
        "What instrument did Edison play while singing for Ms. Fowl?",
            "Guitar",
            "Keyboard",
            "Ukulele",
            "Violin"
    ],
    [
        1404,
        "What knocked Jimmy out of the tree in the park?",
            "Baseball",
            "Bird",
            "Squirrel",
            "Frisbee"
    ],
    [
        1501,
        "What color does the Neutron family's car have?",
            "Green",
            "Blue",
            "Red",
            "Brown"
    ],
    [
        1502,
        "With what was the hair in Grandma Neutron's ear connected with?",
            "Arm",
            "Nose",
            "Eye",
            "Foot"
    ],
    [
        1503,
        "What did Jimmy do to his grandma in a previous experiment?",
            "Weightless",
            "Shrink",
            "Magnetic",
            "Invisible"
    ],
    [
        1504,
        "What kind of bird was having a fight with Jimmy's father?",
            "Eagle",
            "Crow",
            "Magpie",
            "Pidgeon"
    ],
    [
        1601,
        "How much start-up money was Jimmy's father asked to pay?",
            "$30",
            "$50",
            "$75",
            "$100"
    ],
    [
        1602,
        "How many years did Jimmy and his friends go back in time?",
            "10 Years",
            "12 Years",
            "15 Years",
            "20 Years"
    ],
    [
        1603,
        "What start-up could Jimmy's father invest in?",
            "McSpanky's",
            "McDonald's",
            "McCheesey's",
            "McBurger's"
    ],
    [
        1604,
        "What did Jimmy's father use the start-up money for instead?",
            "Ducks",
            "Bills",
            "Wedding Ring",
            "Encyclopedia"
    ],
    [
        1701,
        "Who wanted to make less boring decisions in life?",
            "Tommy",
            "Chuckie",
            "Susie",
            "Angelica"
    ],
    [
        1702,
        "What was hanging at the ceiling of the men's toilet in school?",
            "Shoes",
            "Pizza",
            "Wet Paper",
            "Pudding"
    ],
    [
        1703,
        "What was the name of the teenage pop artist?",
            "Zusan",
            "Emica",
            "Amber",
            "Lilya"
    ],
    [
        1704,
        "How much money did the con artist demand from Susie?",
            "$100",
            "$250",
            "$500",
            "$1000"
    ],
    [
        1705,
        "Who offered Susie to loan her $100?",
            "Lil",
            "Angelica",
            "Kimi",
            "Tommy"
    ],
    [
        1706,
        "Where did Susie have a singing performance?",
            "Java Lava",
            "Wow Mao",
            "Groovy Smoothie",
            "Jam Bam"
    ],
    [
        1801,
        "Who tested his smelling ability in the school cafeteria?",
            "Chuckie",
            "Dylan",
            "Tommy",
            "Phil"
    ],
    [
        1802,
        "What did Phil's armpit smell like according to Dylan?",
            "Onions",
            "Fish",
            "Cheese",
            "Ketchup"
    ],
    [
        1803,
        "Who is called socially inept and was not invited to the party?",
            "Phil",
            "Lil",
            "Dylan",
            "Chuckie"
    ],
    [
        1804,
        "What word was not written on the chalk board in class?",
            "Quaducti",
            "Pythagorus",
            "Vesuvus",
            "Archemides"
    ],
    [
        1805,
        "Who skipped sports class by pretending to be sick?",
            "Tommy",
            "Chuckie",
            "Dylan",
            "Phil"
    ],
    [
        1806,
        "What did Phil and Lil do together in the Twins Canyon Resort?",
            "Swimming",
            "Rollercoaster",
            "Mud Bath",
            "Cinema"
    ],
    [
        1901,
        "What color did the ribbons for the pigs have?",
            "Red",
            "Blue",
            "Yellow",
            "Green"
    ],
    [
        1902,
        "Who left the gate open allowing the pigs to escape?",
            "Boots",
            "Dora",
            "Tico",
            "Swiper"
    ],
    [
        1903,
        "What was not a location on the map?",
            "Apple Tree",
            "Hayfield",
            "Corn Field",
            "Barn"
    ],
    [
        1904,
        "Who opened the gate to prevent the wagon from crashing?",
            "Tico",
            "Dora",
            "Boots",
            "Oinky"
    ],
    [
        1905,
        "Behind what was the second pig hiding in the barn?",
            "Barrels",
            "Water Trough",
            "Haystacks",
            "Tractor"
    ],
    [
        1906,
        "What item did Dora take out of the backpack at the apple tree?",
            "Soccer Ball",
            "Doll",
            "Net",
            "Sunglasses"
    ],
    [
        2001,
        "What did Dora fish out of the river?",
            "Fish",
            "Boots",
            "Branch",
            "Purse"
    ],
    [
        2002,
        "What was not a location on the map?",
            "Waterfall",
            "Fishy Lake",
            "Bridge",
            "Froggy Rocks"
    ],
    [
        2003,
        "How many pieces were missing in the boat?",
            "5 ",
            "7 ",
            "9 ",
            "11"
    ],
    [
        2004,
        "Who was fishing at the bridge?",
            "Dora",
            "Swiper",
            "Boots",
            "Tico"
    ],
    [
        2005,
        "What is the Spanish word for \"open\"?",
            "Trabaja",
            "Toma",
            "Abre",
            "Vuelve"
    ],
    [
        2006,
        "What item did Boots take out of the backpack at the waterfall?",
            "Flower",
            "Maracas",
            "Fishing Pole",
            "Binoculars"
    ],
    [
        2101,
        "Who helped Kimi to change Chuckie's look?",
            "Betty",
            "Lil",
            "Nicole",
            "Angelica"
    ],
    [
        2102,
        "Where is Chongo coming from according to Kimi?",
            "Latvia",
            "Munama",
            "Batara",
            "Kubia"
    ],
    [
        2103,
        "Who played soccer in the sports class?",
            "Tommy",
            "Chuckie",
            "Dil",
            "Kimi"
    ],
    [
        2104,
        "What did Nicole order in the Java Lava?",
            "Burger",
            "Smoothie",
            "Softdrink",
            "Ice Cream"
    ],
    [
        2105,
        "What fruits makes Chaz cry instead of onions?",
            "Lemons",
            "Bananas",
            "Pineapples",
            "Limes"
    ],
    [
        2106,
        "Who helped Chuckie to change looks in the backroom of Java Lava?",
            "Chas",
            "Tommy",
            "Betty",
            "Phil"
    ],
    [
        2201,
        "Where did Timmy's parents go when they hired Vicky as babysitter?",
            "Minigolf",
            "Movies",
            "Dinner",
            "Musical"
    ],
    [
        2202,
        "What was Timmy's first action as adult?",
            "Movies",
            "Help Elder",
            "Driving",
            "Stop Bully"
    ],
    [
        2203,
        "What did two more hours with fairly godparents cost as adult?",
            "$2 ",
            "$5 ",
            "$10",
            "$20"
    ],
    [
        2204,
        "What was not a transformation of Cosmo or Wanda?",
            "Cat",
            "Pillow",
            "Toilet",
            "Tree"
    ],
    [
        2301,
        "What did SpongeBob not firmly check doing the boat inspection?",
            "Bumper",
            "Tire",
            "Antenna",
            "Lights"
    ],
    [
        2302,
        "What did SpongeBob use to land safetly after the tornado?",
            "Squidward",
            "His Pants",
            "Jellyfish",
            "Pizza"
    ],
    [
        2303,
        "What did the pioneers ride for miles according to SpongeBob?",
            "Horses",
            "Trucks",
            "Rocks",
            "Trains"
    ],
    [
        2304,
        "What was missing in the delivery according to the customer?",
            "Drink",
            "Napkins",
            "Fries",
            "Sauce"
    ],
    [
        2401,
        "What was the name of the video game console?",
            "V-Cube",
            "X-Game",
            "Y-Play",
            "Z-Box"
    ],
    [
        2402,
        "What was the name of Dimmsdale's basketball team?",
            "Ball Hogs",
            "Dunk Bears",
            "Slam Dogs",
            "Basket Bulls"
    ],
    [
        2403,
        "Where would the team have gone if they had lost the championship?",
            "Canada",
            "Siberia",
            "Alaska",
            "Iceland"
    ],
    [
        2404,
        "What did Timmy get in return for giving his dad the game console?",
            "Computer",
            "Newspaper",
            "Couch",
            "Blubber Nuggets"
    ],
    [
        2501,
        "Who persuaded the other kids to enter the off-limited slope?",
            "Reggie",
            "Sammy",
            "Twister",
            "Otto"
    ],
    [
        2502,
        "What did Tito play in the mountain cabin?",
            "Chess",
            "Cards",
            "Ukulele",
            "Video Games"
    ],
    [
        2503,
        "What did Raymundo built out of snow at the mountain cabine?",
            "Igloo",
            "Snow Ramp",
            "Icebear",
            "Himself"
    ],
    [
        2504,
        "What did Otto break after falling down the Big Air?",
            "Arm",
            "Hand",
            "Foot",
            "Leg"
    ],
    [
        2601,
        "Who put out the fire in the kitchen of the Krusty Krab?",
            "Mr. Krabs",
            "Squidward",
            "SpongeBob",
            "A Firefighter"
    ],
    [
        2602,
        "Who got SpongeBob's can opener as farewell gift?",
            "Squidward",
            "Patrick",
            "Sandy",
            "Mr. Krabs"
    ],
    [
        2603,
        "Behind what was SpongeBob hiding from Patrick at first?",
            "Corals",
            "Seagrass",
            "Snail",
            "Rock"
    ],
    [
        2604,
        "What did SpongeBob see when checking the Krusty Krab at night?",
            "Grill",
            "Krabby Patties",
            "Spatula",
            "Mr. Krabs"
    ],
    [
        2701,
        "On what day was Opposite Day?",
            "Monday",
            "Wednesday",
            "Friday",
            "Sunday"
    ],
    [
        2702,
        "Who did SpongeBob call his worst enemy during Opposite Day?",
            "Gary",
            "Squidward",
            "Plankton",
            "Patrick"
    ],
    [
        2703,
        "What was leaking in Squidward's house according to SpongeBob?",
            "Roof",
            "Walls",
            "Pipes",
            "Tub"
    ],
    [
        2704,
        "How many characters claimed to be Squidward?",
            "Three",
            "Four",
            "Five",
            "Six"
    ],
    [
        2801,
        "What animal inspired the name of Jack Fenton's new ghost device?",
            "Squirrel",
            "Beaver",
            "Rat",
            "Weasel"
    ],
    [
        2802,
        "What was the name of the technology ghost who attacked the town?",
            "Plasmius",
            "Electrus",
            "Technus",
            "Divius"
    ],
    [
        2803,
        "Who convinced Dash to invite Danny to his party?",
            "Paulina",
            "Jazz",
            "Sam",
            "Tucker"
    ],
    [
        2804,
        "What did the shaver shave into Mr. Lancer's hair on the back?",
            "Skull",
            "Cross",
            "Hash",
            "Smiley"
    ],
    [
        2805,
        "What was seen in the movie that Sam and Tucker watched?",
            "Ghosts",
            "Karate",
            "Pirates",
            "Racing"
    ],
    [
        2806,
        "What famous character did Danny transform into for a second?",
            "Spock",
            "Superman",
            "SpongeBob",
            "Shrek"
    ],
    [
        2901,
        "What object was not haunted by Timmy?",
            "Lights",
            "Towel",
            "Frog",
            "Chalk Board"
    ],
    [
        2902,
        "What class were Cosmo and Wanda in?",
            "History",
            "Mathematics",
            "Science",
            "Spanish"
    ],
    [
        2903,
        "What did Cosmo have in his pants?",
            "Pennies",
            "Cheese",
            "Hog",
            "Trumpet"
    ],
    [
        2904,
        "What did Wanda transform into to find Timmy?",
            "Ladybug",
            "Bat",
            "Mouse",
            "Dog"
    ],
    [
        3001,
        "How many friends of Pearl were on her birthday party?",
            "Three",
            "Four",
            "Five",
            "Six"
    ],
    [
        3002,
        "How much money did Mr. Krabs count in total while dreaming?",
            "$32",
            "$39",
            "$45",
            "$51"
    ],
    [
        3003,
        "Inside what did Mr. Krabs hide the squeaky boots?",
            "Flooring",
            "Deep Fryer",
            "Barrel",
            "Office Desk"
    ],
    [
        3004,
        "What was shown on the warning when Mr. Krabs fried the boots?",
            "Ear",
            "Mouth",
            "Nose",
            "Eye"
    ],
    [
        3101,
        "What Pokémon from the banana tree did Ash scan with his Pokédex?",
            "Aipom",
            "Snorlax",
            "Mankey",
            "Wobuffet"
    ],
    [
        3102,
        "What Poké Ball design did the beach ball have?",
            "Master Ball",
            "Great Ball",
            "Lure Ball",
            "Ultra Ball"
    ],
    [
        3103,
        "Which Pokémon got strongly hit by the beach ball?",
            "Totodile",
            "Cyndaquil",
            "Chikorita",
            "Pikachu"
    ],
    [
        3104,
        "Who was almost eaten by Snorlax?",
            "Meowth",
            "Jessie",
            "Wobuffet",
            "James"
    ],
    [
        3105,
        "What had Snorlax blocked while it was sleeping?",
            "Cave",
            "River",
            "Path",
            "Bridge"
    ],
    [
        3106,
        "Which Pokémon sensed the way out of the cave?",
            "Cyndaquil",
            "Meowth",
            "Chikorita",
            "Totodile"
    ],
    [
        3201,
        "How many gym badges were shown at the beginning of the episode?",
            "Two",
            "Four",
            "Six",
            "Eight"
    ],
    [
        3202,
        "What material were the bells on Tin Tower’s 9th floor made of?",
            "Silver",
            "Gold",
            "Crystal",
            "Platinum"
    ],
    [
        3203,
        "Who of Team Rocket broke one of the Tin Tower bells?",
            "Jessie",
            "Meowth",
            "James",
            "Wobbuffet"
    ],
    [
        3204,
        "What wild Pokémon was not seen protecting the forest?",
            "Weedle",
            "Tangela",
            "Ariados",
            "Paras"
    ],
    [
        3205,
        "Which Pokémon did Eusine use to hunt legendary Pokémon?",
            "Gengar",
            "Pikachu",
            "Suicune",
            "Alakazam"
    ],
    [
        3206,
        "Which legendary Pokémon calmed down the wild Pokémon?",
            "Suicune",
            "Raikou",
            "Entei",
            "Ho-Oh"
    ],
    [
        3301,
        "Which of Ash's Pokémon defeated Gary's Blastoise?",
            "Pikachu",
            "Charizard",
            "Bayleef",
            "Snorlax"
    ],
    [
        3302,
        "What part of its body could Kecleon not make invisible?",
            "Eyes",
            "Nose",
            "Stomach",
            "Tail"
    ],
    [
        3303,
        "What Pokémon did Harrison use after Kecleon fainted?",
            "Hypno",
            "Houndoom",
            "Blaziken",
            "Sneasel"
    ],
    [
        3304,
        "What Pokémon was not seen at the construction site?",
            "Machamp",
            "Meowth",
            "Steelix",
            "Machoke"
    ],
    [
        3305,
        "What weather move was used in the conference battle?",
            "Mist",
            "Rain Dance",
            "Hail",
            "Sandstorm"
    ],
    [
        3306,
        "Which Pokémon has a high level according to Harrison?",
            "Charizard",
            "Pikachu",
            "Blaziken",
            "Snorlax"
    ],
    [
        3401,
        "What Pokémon did Officer Jenny take with her on the motocycle?",
            "Growlithe",
            "Squirtle",
            "Pikachu",
            "Misdreavus"
    ],
    [
        3402,
        "Who was taking care of Prof. Oak's lab during the Johto League?",
            "Mr. Mime",
            "Prof. Oak",
            "Tracey",
            "Ash's Mom"
    ],
    [
        3403,
        "Which Pokémon was Harrison unable to use after battling Ash?",
            "Hypno",
            "Kecleon",
            "Blaziken",
            "Houndoom"
    ],
    [
        3404,
        "Who did not help rescuing the Misdreavus in the forest?",
            "Gary",
            "Brock",
            "Prof. Oak",
            "Harrison"
    ],
    [
        3405,
        "Which special evolution did Gary not tell Ash about?",
            "Remoraid",
            "Slowpoke",
            "Tyrogue",
            "Magikarp"
    ],
    [
        3406,
        "What Pokémon did Gary use to attack Team Rocket?",
            "Blaziken",
            "Blastoise",
            "Misdreavus",
            "Rhydon"
    ],
    [
        3501,
        "What Pokémon battled against Gengar in the TV show?",
            "Nidorina",
            "Nidoqueen",
            "Nidorino",
            "Nidoking"
    ],
    [
        3502,
        "What Pokémon did Ash want to choose initially in the lab?",
            "Bulbasaur",
            "Squirtle",
            "Charmander",
            "Pikachu"
    ],
    [
        3503,
        "Who was not electrified by Pikachu at all?",
            "Ash",
            "Gary",
            "Prof. Oak",
            "Ash's Mom"
    ],
    [
        3504,
        "What was the first wild Pokémon that Ash encountered?",
            "Pikachu",
            "Rattata",
            "Pidgey",
            "Spearow"
    ],
    [
        3505,
        "What did the red-haired girl do when Ash met her?",
            "Fishing",
            "Swimming",
            "Bicycling",
            "Training"
    ],
    [
        3506,
        "What animal type was the unknown Pokémon Ash saw?",
            "Bird",
            "Tiger",
            "Bear",
            "Dragon"
    ],
    [
        3601,
        "How many members did the Squirtle Squad have?",
            "Four",
            "Five",
            "Six",
            "Seven"
    ],
    [
        3602,
        "What Pokémon injured Pikachu very badly?",
            "Goldeen",
            "Squirtle",
            "Meowth",
            "Charmander"
    ],
    [
        3603,
        "What item did Ash grab from the town shop?",
            "Revive",
            "Antidote",
            "Super Potion",
            "Full Heal"
    ],
    [
        3604,
        "What hair color for Misty did the Squirtle threaten Ash with?",
            "Green",
            "Yellow",
            "Blue",
            "Purple"
    ],
    [
        3605,
        "Who or what did Ash use to light up the cave?",
            "Pikachu",
            "Flashlight",
            "Pokédex",
            "Charmander"
    ],
    [
        3606,
        "What did the Squirtle Squad become after helping the town?",
            "Policemen",
            "Dancers",
            "Bodyguards",
            "Firefighters"
    ],
    [
        3701,
        "What move did Ash's Charizard use to defeat Blaine's Magmar?",
            "Flamethrower",
            "Seismic Toss",
            "Skull Bash",
            "Dragon Rage"
    ],
    [
        3702,
        "Who woke up Ash after he fell asleep for the first time?",
            "Pikachu",
            "Brock",
            "Squirtle",
            "Misty"
    ],
    [
        3703,
        "Who explained the story of the turtle island using pictures?",
            "Squirtle",
            "Brock",
            "Pikachu",
            "Misty"
    ],
    [
        3704,
        "What Pokémon was stuck in one of Blastoise's hydro cannons?",
            "Togepi",
            "Meowth",
            "Jigglypuff",
            "Pikachu"
    ],
    [
        3705,
        "Who did Team Rocket send to the turtle island for investigation?",
            "Meowth",
            "James",
            "Pikachu",
            "Jessie"
    ],
    [
        3706,
        "What was Brock’s theory on why Ash’s Squirtle became the leader?",
            "Experience",
            "Courage",
            "Sunglasses",
            "A Trainer"
    ],
    [
        3801,
        "Who did not do a morning workout in the garden?",
            "Ash",
            "Pikachu",
            "Brock",
            "Misty"
    ],
    [
        3802,
        "What did Meowth steal from the restaurant in the past?",
            "Ice Cream",
            "Hot Dog",
            "Hamburger",
            "Fried Chicken"
    ],
    [
        3803,
        "What was the name of the Meowth the rich lady owned?",
            "Kitty",
            "Pawsie",
            "Meowzie",
            "Fluffy"
    ],
    [
        3804,
        "What gems were on the Poké Ball the rich lady bought?",
            "Diamonds",
            "Emeralds",
            "Rubies",
            "Sapphires"
    ],
    [
        3805,
        "What Pokémon defeated the street cats' leader?",
            "Arbok",
            "Pikachu",
            "Meowth",
            "Weezing"
    ],
    [
        3806,
        "Who said they saw Pikachu and Togepi in the movie?",
            "Ash",
            "Brock",
            "Misty",
            "Ash's Mom"
    ],
    [
        0000,
        "?",
            "",
            "",
            "",
            ""
    ],
]

//--------------------------------------------------
// Functions

function getAchievementTitle(series, episode) {
    for episodeData in episodes {
        if (episodeData[0] == series && episodeData[1] == episode) {
            return episodeData[2]           
        }
    }
    assert(0 == 1, "Could not find Episode '" + episode + "' of '" + series + "'")
}

function getAchievementDescription(series, episode) {
    for episodeData in episodes {
        if(episodeData[0] == series && episodeData[1] == episode) {
            return "Answer a question for the episode '" + episode + "' of '" + series + "' correctly."            
        }
    }
    assert(0 == 1, "Could not find Episode '" + episode + "' of '" + series + "'")
}

function getEpisodePointer(series, episode) {
    for episodeData in episodes {
        if (episodeData[0] == series && episodeData[1] == episode) {
            return episodeData[3]           
        }
    }
    assert(0 == 1, "Could not find Episode '" + episode + "' of '" + series + "'")
}

function getTotalChapters(series, episode) {
    for episodeData in episodes {
        if (episodeData[0] == series && episodeData[1] == episode) {
            return episodeData[4]           
        }
    }
    assert(0 == 1, "Could not find Episode '" + episode + "' of '" + series + "'")
}

function getTotalPlaytime(series, episode) {
    for episodeData in episodes {
        if (episodeData[0] == series && episodeData[1] == episode) {
            return episodeData[5]           
        }
    }
    assert(0 == 1, "Could not find Episode '" + episode + "' of '" + series + "'")
}

function getQuestionTitle(questionID) {
    for questionData in questions {
        if (questionData[0] == questionID) {
            return questionData[1]
        }
    }
    assert(0 == 1, "Could not find Question ID " + questionID)
}

function getQuestionDescription(questionID) {
    for questionData in questions {
        if (questionData[0] == questionID) {
            return inputArrow[0] + questionData[2] + " | " + inputArrow[1] + questionData[3] + " | " + inputArrow[2] + questionData[4] + " | " + inputArrow[3] + questionData[5]
        }
    }
    assert(0 == 1, "Could not find Question ID " + questionID)
}



function romType1VideoStarted(series, episode) {
    return once(dword(mem_romType1EpisodePointer) == getEpisodePointer(series, episode) &&
                prev(dword(mem_romType1VideoPlaytime)) == 0x00 &&
                     dword(mem_romType1VideoPlaytime)  == 0x01) &&
           trigger_when(dword(mem_romType1CurrentChapter) == getTotalChapters(series, episode)) &&
           trigger_when(dword(mem_romType1SceneCountdown) == 0xFFFFFFFF) &&
           never(dword(mem_romType1EpisodePointer) == getEpisodePointer(series, episode) &&
                 dword(mem_romType1VideoPlaytime) == 0x00) &&
           never(dword(mem_romType1VideoPlaytime) < getTotalPlaytime(series, episode) &&
                 prev(dword(mem_romType1VideoState)) != 0x04 &&
                 prev(dword(mem_romType1VideoState)) != 0x08 &&
                      dword(mem_romType1VideoState)  == 0x08) &&
           never(repeated(600, dword(mem_romType1SceneCountdown) == 0xFFFFFFFF))
}

function romType1CorrectAnswer(totalQuestion, currentQuestion, index) {
    return trigger_when(once(prev(dword(mem_romType1SceneCountdown)) == 0x00000000 &&
                                  dword(mem_romType1SceneCountdown)  == 0xFFFFFFFF &&
                                  dword(mem_romType1RNG) % totalQuestion == currentQuestion)) &&
           trigger_when(bit0(mem_romType1Input + 0x01)
                      + bit1(mem_romType1Input + 0x01) >= 1 &&
                        bit(index % 4 + 4, mem_romType1Input) > prev(bit(index % 4 + 4, mem_romType1Input))) &&
           never(once(dword(mem_romType1SceneCountdown) == 0xFFFFFFFF &&
                bit0(mem_romType1Input + 0x01)
              + bit1(mem_romType1Input + 0x01) >= 1 &&
                bit((index + 1) % 4 + 4, mem_romType1Input)
              + bit((index + 2) % 4 + 4, mem_romType1Input)
              + bit((index + 3) % 4 + 4, mem_romType1Input) == 1) &&
                repeated(2, always_true())) &&
           trigger_when(bit((index + 1) % 4 + 4, mem_romType1Input)
                      + bit((index + 2) % 4 + 4, mem_romType1Input)
                      + bit((index + 3) % 4 + 4, mem_romType1Input) == 0)
}

function romType1LeaderboardQuestionSelect(totalQuestion, currentQuestion) {
    return prev(dword(mem_romType1SceneCountdown)) == 0x00000000 &&
                dword(mem_romType1SceneCountdown)  == 0xFFFFFFFF &&
                dword(mem_romType1RNG) % totalQuestion == currentQuestion
}

function romType1LeaderboardCancel(series, episode) {
    return (dword(mem_romType1SceneCountdown) != 0xFFFFFFFF) ||
           (repeated(600, dword(mem_romType1SceneCountdown) == 0xFFFFFFFF &&
                          never(dword(mem_romType1EpisodePointer) == getEpisodePointer(series, episode) &&
                                dword(mem_romType1VideoPlaytime) == 0x00 &&
                                dword(mem_romType1VideoPlaytime) == prev(dword(mem_romType1VideoPlaytime))))) ||
           (dword(mem_romType1EpisodePointer) == getEpisodePointer(series, episode) &&
            dword(mem_romType1VideoPlaytime) == 0x00 &&
            dword(mem_romType1VideoPlaytime) < prev(dword(mem_romType1VideoPlaytime))) ||
           (bit0(mem_romType1Input + 0x01)
          + bit1(mem_romType1Input + 0x01) >= 1 &&
            bit(4, mem_romType1Input)
          + bit(5, mem_romType1Input)
          + bit(6, mem_romType1Input)
          + bit(7, mem_romType1Input) == 1)
}



function romType2VideoStarted(series, episode) {
    return once(dword(mem_romType2EpisodePointer) == getEpisodePointer(series, episode) &&
                prev(dword(mem_romType2VideoPlaytime)) == 0x00 &&
                     dword(mem_romType2VideoPlaytime)  == 0x01) &&
           trigger_when(dword(mem_romType2CurrentChapter) == getTotalChapters(series, episode)) &&
           trigger_when(dword(mem_romType2SceneCountdown) == 0xFFFFFFFF) &&
           never(prev(dword(mem_romType2EpisodePointer) == getEpisodePointer(series, episode)) &&
                      dword(mem_romType2EpisodePointer) == 0x00000000) &&
           never(dword(mem_romType2VideoPlaytime) > 0x00000000 &&
                 dword(mem_romType2VideoPlaytime) < getTotalPlaytime(series, episode) &&
                 prev(dword(mem_romType2VideoState)) != 0x04 &&
                 prev(dword(mem_romType2VideoState)) != 0x08 &&
                      dword(mem_romType2VideoState)  == 0x08) &&
           never(repeated(600, dword(mem_romType2EpisodePointer) == getEpisodePointer(series, episode) &&
                               dword(mem_romType2SceneCountdown) == 0xFFFFFFFF))
}

function romType2CorrectAnswer(totalQuestion, currentQuestion, index) {
    return trigger_when(once(prev(dword(mem_romType2MenuState)) == 0x15 &&
                     dword(mem_romType2MenuState)  == 0x13 &&
                high4(mem_romType2RNG) % totalQuestion == currentQuestion &&
                never(dword(mem_romType2StateLoaded) == 0x02 &&
                      dword(mem_romType2EpisodePointer) == 0x00000000))) &&
           trigger_when(once(prev(dword(mem_romType2SceneCountdown)) == 0x00000000 &&
                                  dword(mem_romType2SceneCountdown)  == 0xFFFFFFFF)) &&
           trigger_when(bit0(mem_romType2Input + 0x01)
                      + bit1(mem_romType2Input + 0x01) >= 1 &&
                        bit(index % 4 + 4, mem_romType2Input) > prev(bit(index % 4 + 4, mem_romType2Input))) &&
           never(once(dword(mem_romType2SceneCountdown) == 0xFFFFFFFF &&
                bit0(mem_romType2Input + 0x01)
              + bit1(mem_romType2Input + 0x01) >= 1 &&
                bit((index + 1) % 4 + 4, mem_romType2Input)
              + bit((index + 2) % 4 + 4, mem_romType2Input)
              + bit((index + 3) % 4 + 4, mem_romType2Input) == 1) &&
                repeated(2, always_true())) &&
           trigger_when(bit((index + 1) % 4 + 4, mem_romType2Input)
                      + bit((index + 2) % 4 + 4, mem_romType2Input)
                      + bit((index + 3) % 4 + 4, mem_romType2Input) == 0)
}

function romType2LeaderboardQuestionSelect(totalQuestion, currentQuestion) {
    return prev(dword(mem_romType2SceneCountdown)) == 0x00000000 &&
                dword(mem_romType2SceneCountdown)  == 0xFFFFFFFF &&
           once(prev(dword(mem_romType2MenuState)) == 0x15 &&
                     dword(mem_romType2MenuState)  == 0x13 &&
                high4(mem_romType2RNG) % totalQuestion == currentQuestion &&
                never(dword(mem_romType2StateLoaded) == 0x02 &&
                      dword(mem_romType2EpisodePointer) == 0x00000000))
}

function romType2LeaderboardCancel(series, episode) {
    return (dword(mem_romType2SceneCountdown) != 0xFFFFFFFF) ||
           (repeated(600, dword(mem_romType2EpisodePointer) == getEpisodePointer(series, episode) &&
                          dword(mem_romType2SceneCountdown) == 0xFFFFFFFF &&
                          never(dword(mem_romType2EpisodePointer) == getEpisodePointer(series, episode) &&
                                dword(mem_romType2VideoPlaytime) == 0x00 &&
                                dword(mem_romType2VideoPlaytime) == prev(dword(mem_romType2VideoPlaytime))))) ||
           (prev(dword(mem_romType2EpisodePointer) == getEpisodePointer(series, episode)) &&
                 dword(mem_romType2EpisodePointer) == 0x00000000) ||
           (bit0(mem_romType2Input + 0x01)
          + bit1(mem_romType2Input + 0x01) >= 1 &&
            bit(4, mem_romType2Input)
          + bit(5, mem_romType2Input)
          + bit(6, mem_romType2Input)
          + bit(7, mem_romType2Input) == 1)
}



function romType3VideoStarted(series, episode) {
    return once(dword(mem_romType3EpisodePointer) == getEpisodePointer(series, episode) &&
                prev(dword(mem_romType3VideoPlaytime)) == 0x00 &&
                     dword(mem_romType3VideoPlaytime)  == 0x01) &&
           trigger_when(dword(mem_romType3CurrentChapter) == getTotalChapters(series, episode)) &&
           trigger_when(dword(mem_romType3SceneCountdown) == 0xFFFFFFFF) &&
           never(prev(dword(mem_romType3EpisodePointer) == getEpisodePointer(series, episode)) &&
                      dword(mem_romType3EpisodePointer) == 0x00000000) &&
           never(dword(mem_romType3VideoPlaytime) > 0x00000000 &&
                 dword(mem_romType3VideoPlaytime) < getTotalPlaytime(series, episode) &&
                 prev(dword(mem_romType3VideoState)) != 0x04 &&
                 prev(dword(mem_romType3VideoState)) != 0x08 &&
                      dword(mem_romType3VideoState)  == 0x08) &&
           never(repeated(600, dword(mem_romType3SceneCountdown) == 0xFFFFFFFF)) &&
           never(dword(mem_romType3MenuState) == 0x14 &&
                 dword(mem_romType3EpisodePointer) != getEpisodePointer(series, episode))
}

function romType3CorrectAnswer(totalQuestion, currentQuestion, index) {
    return trigger_when(once(prev(dword(mem_romType3MenuState)) == 0x14 &&
                                  dword(mem_romType3MenuState)  == 0x12 &&
                high4(mem_romType3RNG) % totalQuestion == currentQuestion &&
                never(byte(mem_romType3StateLoaded) == 0x02 &&
                      dword(mem_romType3EpisodePointer) == 0x00000000))) &&
           trigger_when(once(prev(dword(mem_romType3SceneCountdown)) == 0x00000000 &&
                                  dword(mem_romType3SceneCountdown)  == 0xFFFFFFFF)) &&
           trigger_when(bit0(mem_romType3Input + 0x01)
                      + bit1(mem_romType3Input + 0x01) >= 1 &&
                        bit(index % 4 + 4, mem_romType3Input) > prev(bit(index % 4 + 4, mem_romType3Input))) &&
           never(once(dword(mem_romType3SceneCountdown) == 0xFFFFFFFF &&
                bit0(mem_romType3Input + 0x01)
              + bit1(mem_romType3Input + 0x01) >= 1 &&
                bit((index + 1) % 4 + 4, mem_romType3Input)
              + bit((index + 2) % 4 + 4, mem_romType3Input)
              + bit((index + 3) % 4 + 4, mem_romType3Input) == 1) &&
                repeated(2, always_true())) &&
           trigger_when(bit((index + 1) % 4 + 4, mem_romType3Input)
                      + bit((index + 2) % 4 + 4, mem_romType3Input)
                      + bit((index + 3) % 4 + 4, mem_romType3Input) == 0)
}

function romType3LeaderboardQuestionSelect(totalQuestion, currentQuestion) {
    return prev(dword(mem_romType3SceneCountdown)) == 0x00000000 &&
                dword(mem_romType3SceneCountdown)  == 0xFFFFFFFF &&
           once(prev(dword(mem_romType3MenuState)) == 0x14 &&
                     dword(mem_romType3MenuState)  == 0x12 &&
                high4(mem_romType3RNG) % totalQuestion == currentQuestion &&
                never(byte(mem_romType3StateLoaded) == 0x02 &&
                      dword(mem_romType3EpisodePointer) == 0x00000000))
}

function romType3LeaderboardCancel(series, episode) {
    return (dword(mem_romType3SceneCountdown) != 0xFFFFFFFF) ||
           (repeated(600, dword(mem_romType3SceneCountdown) == 0xFFFFFFFF &&
                          never(dword(mem_romType3EpisodePointer) == getEpisodePointer(series, episode) &&
                                dword(mem_romType3VideoPlaytime) == 0x00 &&
                                dword(mem_romType3VideoPlaytime) == prev(dword(mem_romType3VideoPlaytime))))) ||
           (prev(dword(mem_romType3EpisodePointer) == getEpisodePointer(series, episode)) &&
                 dword(mem_romType3EpisodePointer) == 0x00000000) ||
           (bit0(mem_romType3Input + 0x01)
          + bit1(mem_romType3Input + 0x01) >= 1 &&
            bit(4, mem_romType3Input)
          + bit(5, mem_romType3Input)
          + bit(6, mem_romType3Input)
          + bit(7, mem_romType3Input) == 1) ||
          (dword(mem_romType3MenuState) == 0x14 &&
           dword(mem_romType3EpisodePointer) != getEpisodePointer(series, episode))
}



function romType4VideoStarted(series, episode) {
    return once(dword(mem_romType4EpisodePointer) == getEpisodePointer(series, episode) &&
                prev(dword(mem_romType4VideoPlaytime)) == 0x00 &&
                     dword(mem_romType4VideoPlaytime)  == 0x01) &&
           trigger_when(dword(mem_romType4CurrentChapter) == getTotalChapters(series, episode)) &&
           trigger_when(dword(mem_romType4SceneCountdown) == 0x00000000) &&
           trigger_when(prior(dword(mem_romType4VideoPlaytime)) == getTotalPlaytime(series, episode)) &&
           trigger_when(dword(mem_romType4MenuState) == 0x1A) &&
           never(prev(dword(mem_romType4EpisodePointer) == getEpisodePointer(series, episode)) &&
                      dword(mem_romType4EpisodePointer) == 0x00000000) &&
           never(dword(mem_romType4VideoPlaytime) > 0x00000000 &&
                 dword(mem_romType4VideoPlaytime) < getTotalPlaytime(series, episode) &&
                 dword(mem_romType4MenuState) == 0x15 &&
                 prev(dword(mem_romType4VideoState)) != 0x04 &&
                 prev(dword(mem_romType4VideoState)) != 0x08 &&
                      dword(mem_romType4VideoState)  == 0x08) &&
           never(repeated(600, dword(mem_romType4MenuState) == 0x1A)) &&
           never(dword(mem_romType4MenuState) == 0x00 &&
                 dword(mem_romType4EpisodePointer) != getEpisodePointer(series, episode))
}

function romType4CorrectAnswer(totalQuestion, currentQuestion, index) {
    return trigger_when(once(dword(mem_romType4EpisodePointer) == 0x00 &&
                             prev(dword(mem_romType4MenuState)) == 0x00 &&
                                  dword(mem_romType4MenuState)  == 0x15 &&
                prior(low4(mem_romType4RNG)) % totalQuestion == currentQuestion &&
                never(dword(mem_romType4MenuState) == 0x00 &&
                      dword(mem_romType4EpisodePointer) == 0x00000000))) &&
           trigger_when(dword(mem_romType4MenuState) == 0x1A) &&
           trigger_when(bit0(mem_romType4Input + 0x01)
                      + bit1(mem_romType4Input + 0x01) >= 1 &&
                        bit(index % 4 + 4, mem_romType4Input) > prev(bit(index % 4 + 4, mem_romType4Input))) &&
           never(once(dword(mem_romType4MenuState) == 0x1A &&
                bit0(mem_romType4Input + 0x01)
              + bit1(mem_romType4Input + 0x01) >= 1 &&
                bit((index + 1) % 4 + 4, mem_romType4Input)
              + bit((index + 2) % 4 + 4, mem_romType4Input)
              + bit((index + 3) % 4 + 4, mem_romType4Input) == 1) &&
                repeated(2, always_true())) &&
           trigger_when(bit((index + 1) % 4 + 4, mem_romType4Input)
                      + bit((index + 2) % 4 + 4, mem_romType4Input)
                      + bit((index + 3) % 4 + 4, mem_romType4Input) == 0)
}

function romType4LeaderboardQuestionSelect(totalQuestion, currentQuestion) {
    return dword(mem_romType4MenuState)  == 0x1A &&
           once(dword(mem_romType4EpisodePointer) == 0x00 &&
                prev(dword(mem_romType4MenuState)) == 0x00 &&
                     dword(mem_romType4MenuState)  == 0x15 &&
                prior(low4(mem_romType4RNG)) % totalQuestion == currentQuestion &&
                never(byte(mem_romType4MenuState) == 0x00 &&
                      dword(mem_romType4EpisodePointer) == 0x00000000))
}

function romType4LeaderboardCancel(series, episode) {
    return (dword(mem_romType4SceneCountdown) != 0x00000000) ||
           (repeated(600, dword(mem_romType4MenuState) == 0x1A &&
                          never(dword(mem_romType4MenuState) == 0x00 &&
                           prev(dword(mem_romType4EpisodePointer)) != 0x00000000 &&
                                dword(mem_romType4EpisodePointer)  == 0x00000000))) ||
           (prev(dword(mem_romType4EpisodePointer) == getEpisodePointer(series, episode)) &&
                 dword(mem_romType4EpisodePointer) == 0x00000000) ||
           (bit0(mem_romType4Input + 0x01)
          + bit1(mem_romType4Input + 0x01) >= 1 &&
            bit(4, mem_romType4Input)
          + bit(5, mem_romType4Input)
          + bit(6, mem_romType4Input)
          + bit(7, mem_romType4Input) == 1) ||
          (dword(mem_romType4MenuState) == 0x00 &&
           dword(mem_romType4EpisodePointer) != getEpisodePointer(series, episode))
}



function romType5VideoStarted(series, episode) {
    return once(dword(mem_romType5EpisodePointer) == getEpisodePointer(series, episode) &&
                prev(dword(mem_romType5VideoPlaytime)) == 0x00 &&
                     dword(mem_romType5VideoPlaytime)  == 0x01) &&
           trigger_when(dword(mem_romType5VideoPlaytime) >= getTotalPlaytime(series, episode)) &&
           trigger_when(prior(byte(mem_romType5MenuState)) == 0x01) &&
                 trigger_when(byte(mem_romType5MenuState)  == 0x00) &&
           never(dword(mem_romType5EpisodePointer) == getEpisodePointer(series, episode) &&
                 dword(mem_romType5VideoPlaytime) == 0x00) &&
           never(dword(mem_romType5EpisodePointer) == getEpisodePointer(series, episode) &&
                 dword(mem_romType5VideoPlaytime) > 0x00 &&
                 dword(mem_romType5VideoPlaytime) < getTotalPlaytime(series, episode) &&
                 prev(byte(mem_romType5VideoState)) == 0x01 && 
                      byte(mem_romType5VideoState)  == 0x00) &&
           never(repeated(600, byte(mem_romType5MenuState) == 0x00)) &&
           never(dword(mem_romType5EpisodePointer) != getEpisodePointer(series, episode))
}

function romType5CorrectAnswer(totalQuestion, currentQuestion, index) {
    return trigger_when(once(prev(byte(mem_romType5MenuState)) == 0x01 &&
                                  byte(mem_romType5MenuState)  == 0x00 &&
                             high4(mem_romType5RNG) % totalQuestion == currentQuestion)) &&
           trigger_when(byte(mem_romType5Input) > 0x0F &&
                        bit0(mem_romType5Input + 0x01)
                      + bit1(mem_romType5Input + 0x01) <= 1 &&
                        bit(index % 4 + 4, mem_romType5Input) < prev(bit(index % 4 + 4, mem_romType5Input))) &&
           never(once(byte(mem_romType5Input) > 0x0F &&
                bit0(mem_romType5Input + 0x01)
              + bit1(mem_romType5Input + 0x01) <= 1 &&
                bit((index + 1) % 4 + 4, mem_romType5Input)
              + bit((index + 2) % 4 + 4, mem_romType5Input)
              + bit((index + 3) % 4 + 4, mem_romType5Input) == 2) &&
                repeated(2, always_true())) &&
           trigger_when(bit((index + 1) % 4 + 4, mem_romType5Input)
                      + bit((index + 2) % 4 + 4, mem_romType5Input)
                      + bit((index + 3) % 4 + 4, mem_romType5Input) == 3)
}

function romType5LeaderboardQuestionSelect(totalQuestion, currentQuestion) {
    return prev(byte(mem_romType5MenuState)) == 0x01 &&
                byte(mem_romType5MenuState)  == 0x00 &&
           high4(mem_romType5RNG) % totalQuestion == currentQuestion     
}

function romType5LeaderboardCancel(series, episode) {
    return (dword(mem_romType5VideoPlaytime) < getTotalPlaytime(series, episode)) ||
           (repeated(600, byte(mem_romType5MenuState) == 0x00 &&
                          never(dword(mem_romType5EpisodePointer) == getEpisodePointer(series, episode) &&
                                dword(mem_romType5VideoPlaytime) == 0x00 &&
                                dword(mem_romType5VideoPlaytime) == prev(dword(mem_romType5VideoPlaytime))))) ||
           (dword(mem_romType5EpisodePointer) == getEpisodePointer(series, episode) &&
            dword(mem_romType5VideoPlaytime) == 0x00 &&
            dword(mem_romType5VideoPlaytime) < prev(dword(mem_romType5VideoPlaytime))) ||
           (byte(mem_romType5MenuState) == 0x00 &&
            byte(mem_romType5Input) > 0x0F &&
            bit0(mem_romType5Input + 0x01)
          + bit1(mem_romType5Input + 0x01) <= 1 &&
            bit(4, mem_romType5Input)
          + bit(5, mem_romType5Input)
          + bit(6, mem_romType5Input)
          + bit(7, mem_romType5Input) == 3)
}

//--------------------------------------------------
// Achievements

achievement(
    title = getAchievementTitle("SpongeBob SquarePants", "Bubblestand"), type = "progression",
    description = getAchievementDescription("SpongeBob SquarePants", "Bubblestand"),
    id = 93881, badge = "103410", points = 2,
    trigger = romType1VideoStarted("SpongeBob SquarePants", "Bubblestand") &&
              (romType1CorrectAnswer(4, 0, 4) ||
               romType1CorrectAnswer(4, 1, 5) ||
               romType1CorrectAnswer(4, 2, 6) ||
               romType1CorrectAnswer(4, 3, 5))
)
            leaderboard(
                 id = 7085,
                 title       = getQuestionTitle(0101), 
                 description = getQuestionDescription(0101),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Bubblestand") &&
                          romType1LeaderboardQuestionSelect(4, 0),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Bubblestand"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7086,
                 title       = getQuestionTitle(0102), 
                 description = getQuestionDescription(0102),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Bubblestand") &&
                          romType1LeaderboardQuestionSelect(4, 1),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Bubblestand"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7087,
                 title       = getQuestionTitle(0103), 
                 description = getQuestionDescription(0103),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Bubblestand") &&
                          romType1LeaderboardQuestionSelect(4, 2),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Bubblestand"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7082,
                 title       = getQuestionTitle(0104), 
                 description = getQuestionDescription(0104),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Bubblestand") &&
                          romType1LeaderboardQuestionSelect(4, 3),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Bubblestand"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            
achievement(
    title = getAchievementTitle("SpongeBob SquarePants", "Ripped Pants"), type = "progression",
    description = getAchievementDescription("SpongeBob SquarePants", "Ripped Pants"),
    id = 93982, badge = "103412", points = 2,
    trigger = romType1VideoStarted("SpongeBob SquarePants", "Ripped Pants") &&
              (romType1CorrectAnswer(4, 0, 4) ||
               romType1CorrectAnswer(4, 1, 7) ||
               romType1CorrectAnswer(4, 2, 7) ||
               romType1CorrectAnswer(4, 3, 5))
)
            leaderboard(
                 id = 7101,
                 title       = getQuestionTitle(0201), 
                 description = getQuestionDescription(0201),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Ripped Pants") &&
                          romType1LeaderboardQuestionSelect(4, 0),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Ripped Pants"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7098,
                 title       = getQuestionTitle(0202), 
                 description = getQuestionDescription(0202),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Ripped Pants") &&
                          romType1LeaderboardQuestionSelect(4, 1),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Ripped Pants"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7099,
                 title       = getQuestionTitle(0203), 
                 description = getQuestionDescription(0203),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Ripped Pants") &&
                          romType1LeaderboardQuestionSelect(4, 2),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Ripped Pants"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7100,
                 title       = getQuestionTitle(0204), 
                 description = getQuestionDescription(0204),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Ripped Pants") &&
                          romType1LeaderboardQuestionSelect(4, 3),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Ripped Pants"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            
achievement(
    title = getAchievementTitle("SpongeBob SquarePants", "Jellyfishing"), type = "progression",
    description = getAchievementDescription("SpongeBob SquarePants", "Jellyfishing"),
    id = 93987, badge = "103414", points = 2,
    trigger = romType1VideoStarted("SpongeBob SquarePants", "Jellyfishing") &&
              (romType1CorrectAnswer(4, 0, 5) ||
               romType1CorrectAnswer(4, 1, 7) ||
               romType1CorrectAnswer(4, 2, 6) ||
               romType1CorrectAnswer(4, 3, 7))
)
            leaderboard(
                 id = 7103,
                 title       = getQuestionTitle(0301), 
                 description = getQuestionDescription(0301),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Jellyfishing") &&
                          romType1LeaderboardQuestionSelect(4, 0),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Jellyfishing"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7104,
                 title       = getQuestionTitle(0302), 
                 description = getQuestionDescription(0302),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Jellyfishing") &&
                          romType1LeaderboardQuestionSelect(4, 1),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Jellyfishing"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7105,
                 title       = getQuestionTitle(0303), 
                 description = getQuestionDescription(0303),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Jellyfishing") &&
                          romType1LeaderboardQuestionSelect(4, 2),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Jellyfishing"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7102,
                 title       = getQuestionTitle(0304), 
                 description = getQuestionDescription(0304),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Jellyfishing") &&
                          romType1LeaderboardQuestionSelect(4, 3),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Jellyfishing"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            
achievement(
    title = getAchievementTitle("SpongeBob SquarePants", "Plankton!"), type = "progression",
    description = getAchievementDescription("SpongeBob SquarePants", "Plankton!"),
    id = 93988, badge = "103460", points = 2,
    trigger = romType1VideoStarted("SpongeBob SquarePants", "Plankton!") &&
              (romType1CorrectAnswer(4, 0, 7) ||
               romType1CorrectAnswer(4, 1, 4) ||
               romType1CorrectAnswer(4, 2, 7) ||
               romType1CorrectAnswer(4, 3, 6))
)
            leaderboard(
                 id = 7110,
                 title       = getQuestionTitle(0401), 
                 description = getQuestionDescription(0401),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Plankton!") &&
                          romType1LeaderboardQuestionSelect(4, 0),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Plankton!"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7107,
                 title       = getQuestionTitle(0402), 
                 description = getQuestionDescription(0402),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Plankton!") &&
                          romType1LeaderboardQuestionSelect(4, 1),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Plankton!"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7108,
                 title       = getQuestionTitle(0403), 
                 description = getQuestionDescription(0403),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Plankton!") &&
                          romType1LeaderboardQuestionSelect(4, 2),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Plankton!"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7109,
                 title       = getQuestionTitle(0404), 
                 description = getQuestionDescription(0404),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Plankton!") &&
                          romType1LeaderboardQuestionSelect(4, 3),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Plankton!"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )

achievement(
    title = getAchievementTitle("SpongeBob SquarePants", "Mermaidman and Barnacleboy"), type = "progression",
    description = getAchievementDescription("SpongeBob SquarePants", "Mermaidman and Barnacleboy"),
    id = 94325, badge = "103808", points = 2,
    trigger = romType1VideoStarted("SpongeBob SquarePants", "Mermaidman and Barnacleboy") &&
              (romType1CorrectAnswer(4, 0, 7) ||
               romType1CorrectAnswer(4, 1, 5) ||
               romType1CorrectAnswer(4, 2, 6) ||
               romType1CorrectAnswer(4, 3, 7))
)
            leaderboard(
                 id = 7118,
                 title       = getQuestionTitle(0501), 
                 description = getQuestionDescription(0501),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Mermaidman and Barnacleboy") &&
                          romType1LeaderboardQuestionSelect(4, 0),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Mermaidman and Barnacleboy"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7115,
                 title       = getQuestionTitle(0502), 
                 description = getQuestionDescription(0502),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Mermaidman and Barnacleboy") &&
                          romType1LeaderboardQuestionSelect(4, 1),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Mermaidman and Barnacleboy"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7116,
                 title       = getQuestionTitle(0503), 
                 description = getQuestionDescription(0503),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Mermaidman and Barnacleboy") &&
                          romType1LeaderboardQuestionSelect(4, 2),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Mermaidman and Barnacleboy"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7117,
                 title       = getQuestionTitle(0504), 
                 description = getQuestionDescription(0504),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Mermaidman and Barnacleboy") &&
                          romType1LeaderboardQuestionSelect(4, 3),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Mermaidman and Barnacleboy"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )

achievement(
    title = getAchievementTitle("SpongeBob SquarePants", "Pickles"), type = "progression",
    description = getAchievementDescription("SpongeBob SquarePants", "Pickles"),
    id = 94333, badge = "103837", points = 2,
    trigger = romType1VideoStarted("SpongeBob SquarePants", "Pickles") &&
              (romType1CorrectAnswer(4, 0, 6) ||
               romType1CorrectAnswer(4, 1, 5) ||
               romType1CorrectAnswer(4, 2, 4) ||
               romType1CorrectAnswer(4, 3, 4))
)
            leaderboard(
                 id = 7119,
                 title       = getQuestionTitle(0601), 
                 description = getQuestionDescription(0601),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Pickles") &&
                          romType1LeaderboardQuestionSelect(4, 0),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Pickles"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7120,
                 title       = getQuestionTitle(0602), 
                 description = getQuestionDescription(0602),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Pickles") &&
                          romType1LeaderboardQuestionSelect(4, 1),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Pickles"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7121,
                 title       = getQuestionTitle(0603), 
                 description = getQuestionDescription(0603),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Pickles") &&
                          romType1LeaderboardQuestionSelect(4, 2),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Pickles"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7122,
                 title       = getQuestionTitle(0604), 
                 description = getQuestionDescription(0604),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Pickles") &&
                          romType1LeaderboardQuestionSelect(4, 3),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Pickles"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            
achievement(
    title = getAchievementTitle("SpongeBob SquarePants", "Hall Monitor"), type = "progression",
    description = getAchievementDescription("SpongeBob SquarePants", "Hall Monitor"),
    id = 94396, badge = "104021", points = 2,
    trigger = romType1VideoStarted("SpongeBob SquarePants", "Hall Monitor") &&
              (romType1CorrectAnswer(4, 0, 6) ||
               romType1CorrectAnswer(4, 1, 4) ||
               romType1CorrectAnswer(4, 2, 6) ||
               romType1CorrectAnswer(4, 3, 5))
)
            leaderboard(
                 id = 7128,
                 title       = getQuestionTitle(0701), 
                 description = getQuestionDescription(0701),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Hall Monitor") &&
                          romType1LeaderboardQuestionSelect(4, 0),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Hall Monitor"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7129,
                 title       = getQuestionTitle(0702), 
                 description = getQuestionDescription(0702),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Hall Monitor") &&
                          romType1LeaderboardQuestionSelect(4, 1),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Hall Monitor"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7130,
                 title       = getQuestionTitle(0703), 
                 description = getQuestionDescription(0703),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Hall Monitor") &&
                          romType1LeaderboardQuestionSelect(4, 2),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Hall Monitor"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7131,
                 title       = getQuestionTitle(0704), 
                 description = getQuestionDescription(0704),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Hall Monitor") &&
                          romType1LeaderboardQuestionSelect(4, 3),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Hall Monitor"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            
achievement(
    title = getAchievementTitle("SpongeBob SquarePants", "Jellyfish Jam"), type = "progression",
    description = getAchievementDescription("SpongeBob SquarePants", "Jellyfish Jam"),
    id = 94407, badge = "104022", points = 2,
    trigger = romType1VideoStarted("SpongeBob SquarePants", "Jellyfish Jam") &&
              (romType1CorrectAnswer(4, 0, 5) ||
               romType1CorrectAnswer(4, 1, 7) ||
               romType1CorrectAnswer(4, 2, 7) ||
               romType1CorrectAnswer(4, 3, 4))
)
            leaderboard(
                 id = 7132,
                 title       = getQuestionTitle(0801), 
                 description = getQuestionDescription(0801),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Jellyfish Jam") &&
                          romType1LeaderboardQuestionSelect(4, 0),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Jellyfish Jam"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7133,
                 title       = getQuestionTitle(0802), 
                 description = getQuestionDescription(0802),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Jellyfish Jam") &&
                          romType1LeaderboardQuestionSelect(4, 1),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Jellyfish Jam"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7134,
                 title       = getQuestionTitle(0803), 
                 description = getQuestionDescription(0803),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Jellyfish Jam") &&
                          romType1LeaderboardQuestionSelect(4, 2),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Jellyfish Jam"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7135,
                 title       = getQuestionTitle(0804), 
                 description = getQuestionDescription(0804),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Jellyfish Jam") &&
                          romType1LeaderboardQuestionSelect(4, 3),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Jellyfish Jam"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            
achievement(
    title = getAchievementTitle("SpongeBob SquarePants", "Texas"), type = "progression",
    description = getAchievementDescription("SpongeBob SquarePants", "Texas"),
    id = 94538, badge = "639171", points = 2,
    trigger = romType2VideoStarted("SpongeBob SquarePants", "Texas") &&
              (romType2CorrectAnswer(4, 0, 5) ||
               romType2CorrectAnswer(4, 1, 7) ||
               romType2CorrectAnswer(4, 2, 6) ||
               romType2CorrectAnswer(4, 3, 6))
)
            leaderboard(
                 id = 7137,
                 title       = getQuestionTitle(0901), 
                 description = getQuestionDescription(0901),
                 start  = romType2VideoStarted("SpongeBob SquarePants", "Texas") &&
                          romType2LeaderboardQuestionSelect(4, 0),
                 cancel = romType2LeaderboardCancel("SpongeBob SquarePants", "Texas"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7138,
                 title       = getQuestionTitle(0902), 
                 description = getQuestionDescription(0902),
                 start  = romType2VideoStarted("SpongeBob SquarePants", "Texas") &&
                          romType2LeaderboardQuestionSelect(4, 1),
                 cancel = romType2LeaderboardCancel("SpongeBob SquarePants", "Texas"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7139,
                 title       = getQuestionTitle(0903), 
                 description = getQuestionDescription(0903),
                 start  = romType2VideoStarted("SpongeBob SquarePants", "Texas") &&
                          romType2LeaderboardQuestionSelect(4, 2),
                 cancel = romType2LeaderboardCancel("SpongeBob SquarePants", "Texas"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7140,
                 title       = getQuestionTitle(0904), 
                 description = getQuestionDescription(0904),
                 start  = romType2VideoStarted("SpongeBob SquarePants", "Texas") &&
                          romType2LeaderboardQuestionSelect(4, 3),
                 cancel = romType2LeaderboardCancel("SpongeBob SquarePants", "Texas"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            
achievement(
    title = getAchievementTitle("SpongeBob SquarePants", "Walking Small"), type = "progression",
    description = getAchievementDescription("SpongeBob SquarePants", "Walking Small"),
    id = 94540, badge = "104154", points = 2,
    trigger = romType2VideoStarted("SpongeBob SquarePants", "Walking Small") &&
              (romType2CorrectAnswer(4, 0, 6) ||
               romType2CorrectAnswer(4, 1, 4) ||
               romType2CorrectAnswer(4, 2, 4) ||
               romType2CorrectAnswer(4, 3, 7))
)
            leaderboard(
                 id = 7142,
                 title       = getQuestionTitle(1001), 
                 description = getQuestionDescription(1001),
                 start  = romType2VideoStarted("SpongeBob SquarePants", "Walking Small") &&
                          romType2LeaderboardQuestionSelect(4, 0),
                 cancel = romType2LeaderboardCancel("SpongeBob SquarePants", "Walking Small"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7143,
                 title       = getQuestionTitle(1002), 
                 description = getQuestionDescription(1002),
                 start  = romType2VideoStarted("SpongeBob SquarePants", "Walking Small") &&
                          romType2LeaderboardQuestionSelect(4, 1),
                 cancel = romType2LeaderboardCancel("SpongeBob SquarePants", "Walking Small"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7144,
                 title       = getQuestionTitle(1003), 
                 description = getQuestionDescription(1003),
                 start  = romType2VideoStarted("SpongeBob SquarePants", "Walking Small") &&
                          romType2LeaderboardQuestionSelect(4, 2),
                 cancel = romType2LeaderboardCancel("SpongeBob SquarePants", "Walking Small"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7145,
                 title       = getQuestionTitle(1004), 
                 description = getQuestionDescription(1004),
                 start  = romType2VideoStarted("SpongeBob SquarePants", "Walking Small") &&
                          romType2LeaderboardQuestionSelect(4, 3),
                 cancel = romType2LeaderboardCancel("SpongeBob SquarePants", "Walking Small"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )

achievement(
    title = getAchievementTitle("SpongeBob SquarePants", "Hooky"), type = "progression",
    description = getAchievementDescription("SpongeBob SquarePants", "Hooky"),
    id = 97409, badge = "107025", points = 2,
    trigger = romType2VideoStarted("SpongeBob SquarePants", "Hooky") &&
              (romType2CorrectAnswer(4, 0, 6) ||
               romType2CorrectAnswer(4, 1, 6) ||
               romType2CorrectAnswer(4, 2, 5) ||
               romType2CorrectAnswer(4, 3, 4))
)
            leaderboard(
                 id = 7277,
                 title       = getQuestionTitle(1101), 
                 description = getQuestionDescription(1101),
                 start  = romType2VideoStarted("SpongeBob SquarePants", "Hooky") &&
                          romType2LeaderboardQuestionSelect(4, 0),
                 cancel = romType2LeaderboardCancel("SpongeBob SquarePants", "Hooky"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7278,
                 title       = getQuestionTitle(1102), 
                 description = getQuestionDescription(1102),
                 start  = romType2VideoStarted("SpongeBob SquarePants", "Hooky") &&
                          romType2LeaderboardQuestionSelect(4, 1),
                 cancel = romType2LeaderboardCancel("SpongeBob SquarePants", "Hooky"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7279,
                 title       = getQuestionTitle(1103), 
                 description = getQuestionDescription(1103),
                 start  = romType2VideoStarted("SpongeBob SquarePants", "Hooky") &&
                          romType2LeaderboardQuestionSelect(4, 2),
                 cancel = romType2LeaderboardCancel("SpongeBob SquarePants", "Hooky"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7280,
                 title       = getQuestionTitle(1104), 
                 description = getQuestionDescription(1104),
                 start  = romType2VideoStarted("SpongeBob SquarePants", "Hooky") &&
                          romType2LeaderboardQuestionSelect(4, 3),
                 cancel = romType2LeaderboardCancel("SpongeBob SquarePants", "Hooky"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            
achievement(
    title = getAchievementTitle("SpongeBob SquarePants", "Mermaidman and Barnacleboy II"), type = "progression",
    description = getAchievementDescription("SpongeBob SquarePants", "Mermaidman and Barnacleboy II"),
    id = 97410, badge = "107026", points = 2,
    trigger = romType2VideoStarted("SpongeBob SquarePants", "Mermaidman and Barnacleboy II") &&
              (romType2CorrectAnswer(4, 0, 6) ||
               romType2CorrectAnswer(4, 1, 6) ||
               romType2CorrectAnswer(4, 2, 5) ||
               romType2CorrectAnswer(4, 3, 7))
)
            leaderboard(
                 id = 7281,
                 title       = getQuestionTitle(1201), 
                 description = getQuestionDescription(1201),
                 start  = romType2VideoStarted("SpongeBob SquarePants", "Mermaidman and Barnacleboy II") &&
                          romType2LeaderboardQuestionSelect(4, 0),
                 cancel = romType2LeaderboardCancel("SpongeBob SquarePants", "Mermaidman and Barnacleboy II"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7282,
                 title       = getQuestionTitle(1202), 
                 description = getQuestionDescription(1202),
                 start  = romType2VideoStarted("SpongeBob SquarePants", "Mermaidman and Barnacleboy II") &&
                          romType2LeaderboardQuestionSelect(4, 1),
                 cancel = romType2LeaderboardCancel("SpongeBob SquarePants", "Mermaidman and Barnacleboy II"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7283,
                 title       = getQuestionTitle(1203), 
                 description = getQuestionDescription(1203),
                 start  = romType2VideoStarted("SpongeBob SquarePants", "Mermaidman and Barnacleboy II") &&
                          romType2LeaderboardQuestionSelect(4, 2),
                 cancel = romType2LeaderboardCancel("SpongeBob SquarePants", "Mermaidman and Barnacleboy II"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7284,
                 title       = getQuestionTitle(1204), 
                 description = getQuestionDescription(1204),
                 start  = romType2VideoStarted("SpongeBob SquarePants", "Mermaidman and Barnacleboy II") &&
                          romType2LeaderboardQuestionSelect(4, 3),
                 cancel = romType2LeaderboardCancel("SpongeBob SquarePants", "Mermaidman and Barnacleboy II"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            
            
achievement(
    title = getAchievementTitle("The Adventures of Jimmy Neutron: Boy Genius", "Brobot"), type = "progression",
    description = getAchievementDescription("The Adventures of Jimmy Neutron: Boy Genius", "Brobot"),
    id = 97411, badge = "107027", points = 2,
    trigger = romType3VideoStarted("The Adventures of Jimmy Neutron: Boy Genius", "Brobot") &&
              (romType3CorrectAnswer(4, 0, 6) ||
               romType3CorrectAnswer(4, 1, 5) ||
               romType3CorrectAnswer(4, 2, 7) ||
               romType3CorrectAnswer(4, 3, 7))
)
            leaderboard(
                 id = 7285,
                 title       = getQuestionTitle(1301), 
                 description = getQuestionDescription(1301),
                 start  = romType3VideoStarted("The Adventures of Jimmy Neutron: Boy Genius", "Brobot") &&
                          romType3LeaderboardQuestionSelect(4, 0),
                 cancel = romType3LeaderboardCancel("The Adventures of Jimmy Neutron: Boy Genius", "Brobot"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7286,
                 title       = getQuestionTitle(1302), 
                 description = getQuestionDescription(1302),
                 start  = romType3VideoStarted("The Adventures of Jimmy Neutron: Boy Genius", "Brobot") &&
                          romType3LeaderboardQuestionSelect(4, 1),
                 cancel = romType3LeaderboardCancel("The Adventures of Jimmy Neutron: Boy Genius", "Brobot"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7287,
                 title       = getQuestionTitle(1303), 
                 description = getQuestionDescription(1303),
                 start  = romType3VideoStarted("The Adventures of Jimmy Neutron: Boy Genius", "Brobot") &&
                          romType3LeaderboardQuestionSelect(4, 2),
                 cancel = romType3LeaderboardCancel("The Adventures of Jimmy Neutron: Boy Genius", "Brobot"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7288,
                 title       = getQuestionTitle(1304), 
                 description = getQuestionDescription(1304),
                 start  = romType3VideoStarted("The Adventures of Jimmy Neutron: Boy Genius", "Brobot") &&
                          romType3LeaderboardQuestionSelect(4, 3),
                 cancel = romType3LeaderboardCancel("The Adventures of Jimmy Neutron: Boy Genius", "Brobot"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            
achievement(
    title = getAchievementTitle("The Adventures of Jimmy Neutron: Boy Genius", "The Big Pinch"), type = "progression",
    description = getAchievementDescription("The Adventures of Jimmy Neutron: Boy Genius", "The Big Pinch"),
    id = 97413, badge = "107032", points = 2,
    trigger = romType3VideoStarted("The Adventures of Jimmy Neutron: Boy Genius", "The Big Pinch") &&
              (romType3CorrectAnswer(4, 0, 5) ||
               romType3CorrectAnswer(4, 1, 4) ||
               romType3CorrectAnswer(4, 2, 7) ||
               romType3CorrectAnswer(4, 3, 6))
)
            leaderboard(
                 id = 7289,
                 title       = getQuestionTitle(1401), 
                 description = getQuestionDescription(1401),
                 start  = romType3VideoStarted("The Adventures of Jimmy Neutron: Boy Genius", "The Big Pinch") &&
                          romType3LeaderboardQuestionSelect(4, 0),
                 cancel = romType3LeaderboardCancel("The Adventures of Jimmy Neutron: Boy Genius", "The Big Pinch"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7290,
                 title       = getQuestionTitle(1402), 
                 description = getQuestionDescription(1402),
                 start  = romType3VideoStarted("The Adventures of Jimmy Neutron: Boy Genius", "The Big Pinch") &&
                          romType3LeaderboardQuestionSelect(4, 1),
                 cancel = romType3LeaderboardCancel("The Adventures of Jimmy Neutron: Boy Genius", "The Big Pinch"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7291,
                 title       = getQuestionTitle(1403), 
                 description = getQuestionDescription(1403),
                 start  = romType3VideoStarted("The Adventures of Jimmy Neutron: Boy Genius", "The Big Pinch") &&
                          romType3LeaderboardQuestionSelect(4, 2),
                 cancel = romType3LeaderboardCancel("The Adventures of Jimmy Neutron: Boy Genius", "The Big Pinch"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7292,
                 title       = getQuestionTitle(1404), 
                 description = getQuestionDescription(1404),
                 start  = romType3VideoStarted("The Adventures of Jimmy Neutron: Boy Genius", "The Big Pinch") &&
                          romType3LeaderboardQuestionSelect(4, 3),
                 cancel = romType3LeaderboardCancel("The Adventures of Jimmy Neutron: Boy Genius", "The Big Pinch"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            
achievement(
    title = getAchievementTitle("The Adventures of Jimmy Neutron: Boy Genius", "Granny Baby"), type = "progression",
    description = getAchievementDescription("The Adventures of Jimmy Neutron: Boy Genius", "Granny Baby"),
    id = 97414, badge = "107039", points = 2,
    trigger = romType3VideoStarted("The Adventures of Jimmy Neutron: Boy Genius", "Granny Baby") &&
              (romType3CorrectAnswer(4, 0, 5) ||
               romType3CorrectAnswer(4, 1, 4) ||
               romType3CorrectAnswer(4, 2, 7) ||
               romType3CorrectAnswer(4, 3, 6))
)
            leaderboard(
                 id = 7293,
                 title       = getQuestionTitle(1501), 
                 description = getQuestionDescription(1501),
                 start  = romType3VideoStarted("The Adventures of Jimmy Neutron: Boy Genius", "Granny Baby") &&
                          romType3LeaderboardQuestionSelect(4, 0),
                 cancel = romType3LeaderboardCancel("The Adventures of Jimmy Neutron: Boy Genius", "Granny Baby"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7294,
                 title       = getQuestionTitle(1502), 
                 description = getQuestionDescription(1502),
                 start  = romType3VideoStarted("The Adventures of Jimmy Neutron: Boy Genius", "Granny Baby") &&
                          romType3LeaderboardQuestionSelect(4, 1),
                 cancel = romType3LeaderboardCancel("The Adventures of Jimmy Neutron: Boy Genius", "Granny Baby"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7295,
                 title       = getQuestionTitle(1503), 
                 description = getQuestionDescription(1503),
                 start  = romType3VideoStarted("The Adventures of Jimmy Neutron: Boy Genius", "Granny Baby") &&
                          romType3LeaderboardQuestionSelect(4, 2),
                 cancel = romType3LeaderboardCancel("The Adventures of Jimmy Neutron: Boy Genius", "Granny Baby"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7296,
                 title       = getQuestionTitle(1504), 
                 description = getQuestionDescription(1504),
                 start  = romType3VideoStarted("The Adventures of Jimmy Neutron: Boy Genius", "Granny Baby") &&
                          romType3LeaderboardQuestionSelect(4, 3),
                 cancel = romType3LeaderboardCancel("The Adventures of Jimmy Neutron: Boy Genius", "Granny Baby"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            
achievement(
    title = getAchievementTitle("The Adventures of Jimmy Neutron: Boy Genius", "Time is Money"), type = "progression",
    description = getAchievementDescription("The Adventures of Jimmy Neutron: Boy Genius", "Time is Money"),
    id = 97515, badge = "640637", points = 2,
    trigger = romType3VideoStarted("The Adventures of Jimmy Neutron: Boy Genius", "Time is Money") &&
              (romType3CorrectAnswer(4, 0, 5) ||
               romType3CorrectAnswer(4, 1, 7) ||
               romType3CorrectAnswer(4, 2, 6) ||
               romType3CorrectAnswer(4, 3, 7))
)
            leaderboard(
                 id = 7297,
                 title       = getQuestionTitle(1601), 
                 description = getQuestionDescription(1601),
                 start  = romType3VideoStarted("The Adventures of Jimmy Neutron: Boy Genius", "Time is Money") &&
                          romType3LeaderboardQuestionSelect(4, 0),
                 cancel = romType3LeaderboardCancel("The Adventures of Jimmy Neutron: Boy Genius", "Time is Money"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7298,
                 title       = getQuestionTitle(1602), 
                 description = getQuestionDescription(1602),
                 start  = romType3VideoStarted("The Adventures of Jimmy Neutron: Boy Genius", "Time is Money") &&
                          romType3LeaderboardQuestionSelect(4, 1),
                 cancel = romType3LeaderboardCancel("The Adventures of Jimmy Neutron: Boy Genius", "Time is Money"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7299,
                 title       = getQuestionTitle(1603), 
                 description = getQuestionDescription(1603),
                 start  = romType3VideoStarted("The Adventures of Jimmy Neutron: Boy Genius", "Time is Money") &&
                          romType3LeaderboardQuestionSelect(4, 2),
                 cancel = romType3LeaderboardCancel("The Adventures of Jimmy Neutron: Boy Genius", "Time is Money"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7300,
                 title       = getQuestionTitle(1604), 
                 description = getQuestionDescription(1604),
                 start  = romType3VideoStarted("The Adventures of Jimmy Neutron: Boy Genius", "Time is Money") &&
                          romType3LeaderboardQuestionSelect(4, 3),
                 cancel = romType3LeaderboardCancel("The Adventures of Jimmy Neutron: Boy Genius", "Time is Money"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            
achievement(
    title = getAchievementTitle("All Grown Up!", "Susie Sings The Blues"), type = "progression",
    description = getAchievementDescription("All Grown Up!", "Susie Sings The Blues"),
    id = 97655, badge = "107192", points = 4,
    trigger = romType1VideoStarted("All Grown Up!", "Susie Sings The Blues") &&
              (romType1CorrectAnswer(6, 0, 5) ||
               romType1CorrectAnswer(6, 1, 6) ||
               romType1CorrectAnswer(6, 2, 5) ||
               romType1CorrectAnswer(6, 3, 4) ||
               romType1CorrectAnswer(6, 4, 7) ||
               romType1CorrectAnswer(6, 5, 6))
)
            leaderboard(
                 id = 7304,
                 title       = getQuestionTitle(1701), 
                 description = getQuestionDescription(1701),
                 start  = romType1VideoStarted("All Grown Up!", "Susie Sings The Blues") &&
                          romType1LeaderboardQuestionSelect(6, 0),
                 cancel = romType1LeaderboardCancel("All Grown Up!", "Susie Sings The Blues"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7305,
                 title       = getQuestionTitle(1702), 
                 description = getQuestionDescription(1702),
                 start  = romType1VideoStarted("All Grown Up!", "Susie Sings The Blues") &&
                          romType1LeaderboardQuestionSelect(6, 1),
                 cancel = romType1LeaderboardCancel("All Grown Up!", "Susie Sings The Blues"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7306,
                 title       = getQuestionTitle(1703), 
                 description = getQuestionDescription(1703),
                 start  = romType1VideoStarted("All Grown Up!", "Susie Sings The Blues") &&
                          romType1LeaderboardQuestionSelect(6, 2),
                 cancel = romType1LeaderboardCancel("All Grown Up!", "Susie Sings The Blues"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7307,
                 title       = getQuestionTitle(1704), 
                 description = getQuestionDescription(1704),
                 start  = romType1VideoStarted("All Grown Up!", "Susie Sings The Blues") &&
                          romType1LeaderboardQuestionSelect(6, 3),
                 cancel = romType1LeaderboardCancel("All Grown Up!", "Susie Sings The Blues"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7308,
                 title       = getQuestionTitle(1705), 
                 description = getQuestionDescription(1705),
                 start  = romType1VideoStarted("All Grown Up!", "Susie Sings The Blues") &&
                          romType1LeaderboardQuestionSelect(6, 4),
                 cancel = romType1LeaderboardCancel("All Grown Up!", "Susie Sings The Blues"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7309,
                 title       = getQuestionTitle(1706), 
                 description = getQuestionDescription(1706),
                 start  = romType1VideoStarted("All Grown Up!", "Susie Sings The Blues") &&
                          romType1LeaderboardQuestionSelect(6, 5),
                 cancel = romType1LeaderboardCancel("All Grown Up!", "Susie Sings The Blues"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            
achievement(
    title = getAchievementTitle("All Grown Up!", "Coup DeVille"), type = "progression",
    description = getAchievementDescription("All Grown Up!", "Coup DeVille"),
    id = 97664, badge = "107200", points = 4,
    trigger = romType1VideoStarted("All Grown Up!", "Coup DeVille") &&
              (romType1CorrectAnswer(6, 0, 5) ||
               romType1CorrectAnswer(6, 1, 5) ||
               romType1CorrectAnswer(6, 2, 6) ||
               romType1CorrectAnswer(6, 3, 4) ||
               romType1CorrectAnswer(6, 4, 5) ||
               romType1CorrectAnswer(6, 5, 7))
)
            leaderboard(
                 id = 7312,
                 title       = getQuestionTitle(1801), 
                 description = getQuestionDescription(1801),
                 start  = romType1VideoStarted("All Grown Up!", "Coup DeVille") &&
                          romType1LeaderboardQuestionSelect(6, 0),
                 cancel = romType1LeaderboardCancel("All Grown Up!", "Coup DeVille"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7313,
                 title       = getQuestionTitle(1802), 
                 description = getQuestionDescription(1802),
                 start  = romType1VideoStarted("All Grown Up!", "Coup DeVille") &&
                          romType1LeaderboardQuestionSelect(6, 1),
                 cancel = romType1LeaderboardCancel("All Grown Up!", "Coup DeVille"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7314,
                 title       = getQuestionTitle(1803), 
                 description = getQuestionDescription(1803),
                 start  = romType1VideoStarted("All Grown Up!", "Coup DeVille") &&
                          romType1LeaderboardQuestionSelect(6, 2),
                 cancel = romType1LeaderboardCancel("All Grown Up!", "Coup DeVille"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7315,
                 title       = getQuestionTitle(1804), 
                 description = getQuestionDescription(1804),
                 start  = romType1VideoStarted("All Grown Up!", "Coup DeVille") &&
                          romType1LeaderboardQuestionSelect(6, 3),
                 cancel = romType1LeaderboardCancel("All Grown Up!", "Coup DeVille"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7316,
                 title       = getQuestionTitle(1805), 
                 description = getQuestionDescription(1805),
                 start  = romType1VideoStarted("All Grown Up!", "Coup DeVille") &&
                          romType1LeaderboardQuestionSelect(6, 4),
                 cancel = romType1LeaderboardCancel("All Grown Up!", "Coup DeVille"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7317,
                 title       = getQuestionTitle(1806), 
                 description = getQuestionDescription(1806),
                 start  = romType1VideoStarted("All Grown Up!", "Coup DeVille") &&
                          romType1LeaderboardQuestionSelect(6, 5),
                 cancel = romType1LeaderboardCancel("All Grown Up!", "Coup DeVille"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            
achievement(
    title = getAchievementTitle("Dora the Explorer", "Three Little Piggies"), type = "progression",
    description = getAchievementDescription("Dora the Explorer", "Three Little Piggies"),
    id = 114580, badge = "641195", points = 4,
    trigger = romType1VideoStarted("Dora the Explorer", "Three Little Piggies") &&
              (romType1CorrectAnswer(6, 0, 5) ||
               romType1CorrectAnswer(6, 1, 4) ||
               romType1CorrectAnswer(6, 2, 7) ||
               romType1CorrectAnswer(6, 3, 6) ||
               romType1CorrectAnswer(6, 4, 6) ||
               romType1CorrectAnswer(6, 5, 7))
)
            leaderboard(
                 id = 8383,
                 title       = getQuestionTitle(1901), 
                 description = getQuestionDescription(1901),
                 start  = romType1VideoStarted("Dora the Explorer", "Three Little Piggies") &&
                          romType1LeaderboardQuestionSelect(6, 0),
                 cancel = romType1LeaderboardCancel("Dora the Explorer", "Three Little Piggies"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8384,
                 title       = getQuestionTitle(1902), 
                 description = getQuestionDescription(1902),
                 start  = romType1VideoStarted("Dora the Explorer", "Three Little Piggies") &&
                          romType1LeaderboardQuestionSelect(6, 1),
                 cancel = romType1LeaderboardCancel("Dora the Explorer", "Three Little Piggies"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8385,
                 title       = getQuestionTitle(1903), 
                 description = getQuestionDescription(1903),
                 start  = romType1VideoStarted("Dora the Explorer", "Three Little Piggies") &&
                          romType1LeaderboardQuestionSelect(6, 2),
                 cancel = romType1LeaderboardCancel("Dora the Explorer", "Three Little Piggies"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8386,
                 title       = getQuestionTitle(1904), 
                 description = getQuestionDescription(1904),
                 start  = romType1VideoStarted("Dora the Explorer", "Three Little Piggies") &&
                          romType1LeaderboardQuestionSelect(6, 3),
                 cancel = romType1LeaderboardCancel("Dora the Explorer", "Three Little Piggies"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7318,
                 title       = getQuestionTitle(1905), 
                 description = getQuestionDescription(1905),
                 start  = romType1VideoStarted("Dora the Explorer", "Three Little Piggies") &&
                          romType1LeaderboardQuestionSelect(6, 4),
                 cancel = romType1LeaderboardCancel("Dora the Explorer", "Three Little Piggies"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7319,
                 title       = getQuestionTitle(1906), 
                 description = getQuestionDescription(1906),
                 start  = romType1VideoStarted("Dora the Explorer", "Three Little Piggies") &&
                          romType1LeaderboardQuestionSelect(6, 5),
                 cancel = romType1LeaderboardCancel("Dora the Explorer", "Three Little Piggies"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            
achievement(
    title = getAchievementTitle("Dora the Explorer", "The Big River"), type = "progression",
    description = getAchievementDescription("Dora the Explorer", "The Big River"),
    id = 114581, badge = "125228", points = 4,
    trigger = romType1VideoStarted("Dora the Explorer", "The Big River") &&
              (romType1CorrectAnswer(6, 0, 5) ||
               romType1CorrectAnswer(6, 1, 5) ||
               romType1CorrectAnswer(6, 2, 5) ||
               romType1CorrectAnswer(6, 3, 4) ||
               romType1CorrectAnswer(6, 4, 7) ||
               romType1CorrectAnswer(6, 5, 7))
)
            leaderboard(
                 id = 8387,
                 title       = getQuestionTitle(2001), 
                 description = getQuestionDescription(2001),
                 start  = romType1VideoStarted("Dora the Explorer", "The Big River") &&
                          romType1LeaderboardQuestionSelect(6, 0),
                 cancel = romType1LeaderboardCancel("Dora the Explorer", "The Big River"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8388,
                 title       = getQuestionTitle(2002), 
                 description = getQuestionDescription(2002),
                 start  = romType1VideoStarted("Dora the Explorer", "The Big River") &&
                          romType1LeaderboardQuestionSelect(6, 1),
                 cancel = romType1LeaderboardCancel("Dora the Explorer", "The Big River"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8389,
                 title       = getQuestionTitle(2003), 
                 description = getQuestionDescription(2003),
                 start  = romType1VideoStarted("Dora the Explorer", "The Big River") &&
                          romType1LeaderboardQuestionSelect(6, 2),
                 cancel = romType1LeaderboardCancel("Dora the Explorer", "The Big River"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8390,
                 title       = getQuestionTitle(2004), 
                 description = getQuestionDescription(2004),
                 start  = romType1VideoStarted("Dora the Explorer", "The Big River") &&
                          romType1LeaderboardQuestionSelect(6, 3),
                 cancel = romType1LeaderboardCancel("Dora the Explorer", "The Big River"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7310,
                 title       = getQuestionTitle(2005), 
                 description = getQuestionDescription(2005),
                 start  = romType1VideoStarted("Dora the Explorer", "The Big River") &&
                          romType1LeaderboardQuestionSelect(6, 4),
                 cancel = romType1LeaderboardCancel("Dora the Explorer", "The Big River"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 7311,
                 title       = getQuestionTitle(2006), 
                 description = getQuestionDescription(2006),
                 start  = romType1VideoStarted("Dora the Explorer", "The Big River") &&
                          romType1LeaderboardQuestionSelect(6, 5),
                 cancel = romType1LeaderboardCancel("Dora the Explorer", "The Big River"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            
achievement(
    title = getAchievementTitle("All Grown Up!", "Chuckie's in Love"), type = "progression",
    description = getAchievementDescription("All Grown Up!", "Chuckie's in Love"),
    id = 114590, badge = "125258", points = 4,
    trigger = romType1VideoStarted("All Grown Up!", "Chuckie's in Love") &&
              (romType1CorrectAnswer(6, 0, 5) ||
               romType1CorrectAnswer(6, 1, 6) ||
               romType1CorrectAnswer(6, 2, 6) ||
               romType1CorrectAnswer(6, 3, 5) ||
               romType1CorrectAnswer(6, 4, 7) ||
               romType1CorrectAnswer(6, 5, 7))
)
            leaderboard(
                 id = 8391,
                 title       = getQuestionTitle(2101), 
                 description = getQuestionDescription(2101),
                 start  = romType1VideoStarted("All Grown Up!", "Chuckie's in Love") &&
                          romType1LeaderboardQuestionSelect(6, 0),
                 cancel = romType1LeaderboardCancel("All Grown Up!", "Chuckie's in Love"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8392,
                 title       = getQuestionTitle(2102), 
                 description = getQuestionDescription(2102),
                 start  = romType1VideoStarted("All Grown Up!", "Chuckie's in Love") &&
                          romType1LeaderboardQuestionSelect(6, 1),
                 cancel = romType1LeaderboardCancel("All Grown Up!", "Chuckie's in Love"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8393,
                 title       = getQuestionTitle(2103), 
                 description = getQuestionDescription(2103),
                 start  = romType1VideoStarted("All Grown Up!", "Chuckie's in Love") &&
                          romType1LeaderboardQuestionSelect(6, 2),
                 cancel = romType1LeaderboardCancel("All Grown Up!", "Chuckie's in Love"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8394,
                 title       = getQuestionTitle(2104), 
                 description = getQuestionDescription(2104),
                 start  = romType1VideoStarted("All Grown Up!", "Chuckie's in Love") &&
                          romType1LeaderboardQuestionSelect(6, 3),
                 cancel = romType1LeaderboardCancel("All Grown Up!", "Chuckie's in Love"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8395,
                 title       = getQuestionTitle(2105), 
                 description = getQuestionDescription(2105),
                 start  = romType1VideoStarted("All Grown Up!", "Chuckie's in Love") &&
                          romType1LeaderboardQuestionSelect(6, 4),
                 cancel = romType1LeaderboardCancel("All Grown Up!", "Chuckie's in Love"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8396,
                 title       = getQuestionTitle(2106), 
                 description = getQuestionDescription(2106),
                 start  = romType1VideoStarted("All Grown Up!", "Chuckie's in Love") &&
                          romType1LeaderboardQuestionSelect(6, 5),
                 cancel = romType1LeaderboardCancel("All Grown Up!", "Chuckie's in Love"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            
achievement(
    title = getAchievementTitle("The Fairly OddParents!", "The Big Problem!"), type = "progression",
    description = getAchievementDescription("The Fairly OddParents!", "The Big Problem!"),
    id = 114638, badge = "125375", points = 2,
    trigger = romType1VideoStarted("The Fairly OddParents!", "The Big Problem!") &&
              (romType1CorrectAnswer(4, 0, 5) ||
               romType1CorrectAnswer(4, 1, 7) ||
               romType1CorrectAnswer(4, 2, 5) ||
               romType1CorrectAnswer(4, 3, 6))
)
            leaderboard(
                 id = 8400,
                 title       = getQuestionTitle(2201), 
                 description = getQuestionDescription(2201),
                 start  = romType1VideoStarted("The Fairly OddParents!", "The Big Problem!") &&
                          romType1LeaderboardQuestionSelect(4, 0),
                 cancel = romType1LeaderboardCancel("The Fairly OddParents!", "The Big Problem!"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8401,
                 title       = getQuestionTitle(2202), 
                 description = getQuestionDescription(2202),
                 start  = romType1VideoStarted("The Fairly OddParents!", "The Big Problem!") &&
                          romType1LeaderboardQuestionSelect(4, 1),
                 cancel = romType1LeaderboardCancel("The Fairly OddParents!", "The Big Problem!"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8402,
                 title       = getQuestionTitle(2203), 
                 description = getQuestionDescription(2203),
                 start  = romType1VideoStarted("The Fairly OddParents!", "The Big Problem!") &&
                          romType1LeaderboardQuestionSelect(4, 2),
                 cancel = romType1LeaderboardCancel("The Fairly OddParents!", "The Big Problem!"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8403,
                 title       = getQuestionTitle(2204), 
                 description = getQuestionDescription(2204),
                 start  = romType1VideoStarted("The Fairly OddParents!", "The Big Problem!") &&
                          romType1LeaderboardQuestionSelect(4, 3),
                 cancel = romType1LeaderboardCancel("The Fairly OddParents!", "The Big Problem!"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            
achievement(
    title = getAchievementTitle("SpongeBob SquarePants", "Pizza Delivery"), type = "progression",
    description = getAchievementDescription("SpongeBob SquarePants", "Pizza Delivery"),
    id = 114643, badge = "641734", points = 2,
    trigger = romType1VideoStarted("SpongeBob SquarePants", "Pizza Delivery") &&
              (romType1CorrectAnswer(4, 0, 4) ||
               romType1CorrectAnswer(4, 1, 4) ||
               romType1CorrectAnswer(4, 2, 7) ||
               romType1CorrectAnswer(4, 3, 6))
)
            leaderboard(
                 id = 8405,
                 title       = getQuestionTitle(2301), 
                 description = getQuestionDescription(2301),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Pizza Delivery") &&
                          romType1LeaderboardQuestionSelect(4, 0),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Pizza Delivery"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8406,
                 title       = getQuestionTitle(2302), 
                 description = getQuestionDescription(2302),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Pizza Delivery") &&
                          romType1LeaderboardQuestionSelect(4, 1),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Pizza Delivery"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8407,
                 title       = getQuestionTitle(2303), 
                 description = getQuestionDescription(2303),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Pizza Delivery") &&
                          romType1LeaderboardQuestionSelect(4, 2),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Pizza Delivery"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8408,
                 title       = getQuestionTitle(2304), 
                 description = getQuestionDescription(2304),
                 start  = romType1VideoStarted("SpongeBob SquarePants", "Pizza Delivery") &&
                          romType1LeaderboardQuestionSelect(4, 3),
                 cancel = romType1LeaderboardCancel("SpongeBob SquarePants", "Pizza Delivery"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
           
achievement(
    title = getAchievementTitle("The Fairly OddParents!", "Odd Ball"), type = "progression",
    description = getAchievementDescription("The Fairly OddParents!", "Odd Ball"),
    id = 114646, badge = "125400", points = 2,
    trigger = romType2VideoStarted("The Fairly OddParents!", "Odd Ball") &&
              (romType2CorrectAnswer(4, 0, 6) ||
               romType2CorrectAnswer(4, 1, 6) ||
               romType2CorrectAnswer(4, 2, 7) ||
               romType2CorrectAnswer(4, 3, 7))
)
            leaderboard(
                 id = 8409,
                 title       = getQuestionTitle(2401), 
                 description = getQuestionDescription(2401),
                 start  = romType2VideoStarted("The Fairly OddParents!", "Odd Ball") &&
                          romType2LeaderboardQuestionSelect(4, 0),
                 cancel = romType2LeaderboardCancel("The Fairly OddParents!", "Odd Ball"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8410,
                 title       = getQuestionTitle(2402), 
                 description = getQuestionDescription(2402),
                 start  = romType2VideoStarted("The Fairly OddParents!", "Odd Ball") &&
                          romType2LeaderboardQuestionSelect(4, 1),
                 cancel = romType2LeaderboardCancel("The Fairly OddParents!", "Odd Ball"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8411,
                 title       = getQuestionTitle(2403), 
                 description = getQuestionDescription(2403),
                 start  = romType2VideoStarted("The Fairly OddParents!", "Odd Ball") &&
                          romType2LeaderboardQuestionSelect(4, 2),
                 cancel = romType2LeaderboardCancel("The Fairly OddParents!", "Odd Ball"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8412,
                 title       = getQuestionTitle(2404), 
                 description = getQuestionDescription(2404),
                 start  = romType2VideoStarted("The Fairly OddParents!", "Odd Ball") &&
                          romType2LeaderboardQuestionSelect(4, 3),
                 cancel = romType2LeaderboardCancel("The Fairly OddParents!", "Odd Ball"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            
achievement(
    title = getAchievementTitle("Rocket Power", "Big Air Dare"), type = "progression",
    description = getAchievementDescription("Rocket Power", "Big Air Dare"),
    id = 114721, badge = "125492", points = 2,
    trigger = romType2VideoStarted("Rocket Power", "Big Air Dare") &&
              (romType2CorrectAnswer(4, 0, 4) ||
               romType2CorrectAnswer(4, 1, 7) ||
               romType2CorrectAnswer(4, 2, 7) ||
               romType2CorrectAnswer(4, 3, 4))
)
            leaderboard(
                 id = 8414,
                 title       = getQuestionTitle(2501), 
                 description = getQuestionDescription(2501),
                 start  = romType2VideoStarted("Rocket Power", "Big Air Dare") &&
                          romType2LeaderboardQuestionSelect(4, 0),
                 cancel = romType2LeaderboardCancel("Rocket Power", "Big Air Dare"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8415,
                 title       = getQuestionTitle(2502), 
                 description = getQuestionDescription(2502),
                 start  = romType2VideoStarted("Rocket Power", "Big Air Dare") &&
                          romType2LeaderboardQuestionSelect(4, 1),
                 cancel = romType2LeaderboardCancel("Rocket Power", "Big Air Dare"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8416,
                 title       = getQuestionTitle(2503), 
                 description = getQuestionDescription(2503),
                 start  = romType2VideoStarted("Rocket Power", "Big Air Dare") &&
                          romType2LeaderboardQuestionSelect(4, 2),
                 cancel = romType2LeaderboardCancel("Rocket Power", "Big Air Dare"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8417,
                 title       = getQuestionTitle(2504), 
                 description = getQuestionDescription(2504),
                 start  = romType2VideoStarted("Rocket Power", "Big Air Dare") &&
                          romType2LeaderboardQuestionSelect(4, 3),
                 cancel = romType2LeaderboardCancel("Rocket Power", "Big Air Dare"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            
achievement(
    title = getAchievementTitle("SpongeBob SquarePants", "Nature Pants"), type = "progression",
    description = getAchievementDescription("SpongeBob SquarePants", "Nature Pants"),
    id = 114722, badge = "641864", points = 2,
    trigger = romType2VideoStarted("SpongeBob SquarePants", "Nature Pants") &&
              (romType2CorrectAnswer(4, 0, 7) ||
               romType2CorrectAnswer(4, 1, 6) ||
               romType2CorrectAnswer(4, 2, 7) ||
               romType2CorrectAnswer(4, 3, 5))
)
            leaderboard(
                 id = 8419,
                 title       = getQuestionTitle(2601), 
                 description = getQuestionDescription(2601),
                 start  = romType2VideoStarted("SpongeBob SquarePants", "Nature Pants") &&
                          romType2LeaderboardQuestionSelect(4, 0),
                 cancel = romType2LeaderboardCancel("SpongeBob SquarePants", "Nature Pants"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8420,
                 title       = getQuestionTitle(2602), 
                 description = getQuestionDescription(2602),
                 start  = romType2VideoStarted("SpongeBob SquarePants", "Nature Pants") &&
                          romType2LeaderboardQuestionSelect(4, 1),
                 cancel = romType2LeaderboardCancel("SpongeBob SquarePants", "Nature Pants"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8421,
                 title       = getQuestionTitle(2603), 
                 description = getQuestionDescription(2603),
                 start  = romType2VideoStarted("SpongeBob SquarePants", "Nature Pants") &&
                          romType2LeaderboardQuestionSelect(4, 2),
                 cancel = romType2LeaderboardCancel("SpongeBob SquarePants", "Nature Pants"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8422,
                 title       = getQuestionTitle(2604), 
                 description = getQuestionDescription(2604),
                 start  = romType2VideoStarted("SpongeBob SquarePants", "Nature Pants") &&
                          romType2LeaderboardQuestionSelect(4, 3),
                 cancel = romType2LeaderboardCancel("SpongeBob SquarePants", "Nature Pants"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            
achievement(
    title = getAchievementTitle("SpongeBob SquarePants", "Opposite Day"), type = "progression",
    description = getAchievementDescription("SpongeBob SquarePants", "Opposite Day"),
    id = 114728, badge = "641865", points = 2,
    trigger = romType2VideoStarted("SpongeBob SquarePants", "Opposite Day") &&
              (romType2CorrectAnswer(4, 0, 5) ||
               romType2CorrectAnswer(4, 1, 4) ||
               romType2CorrectAnswer(4, 2, 6) ||
               romType2CorrectAnswer(4, 3, 7))
)
            leaderboard(
                 id = 8423,
                 title       = getQuestionTitle(2701), 
                 description = getQuestionDescription(2701),
                 start  = romType2VideoStarted("SpongeBob SquarePants", "Opposite Day") &&
                          romType2LeaderboardQuestionSelect(4, 0),
                 cancel = romType2LeaderboardCancel("SpongeBob SquarePants", "Opposite Day"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8424,
                 title       = getQuestionTitle(2702), 
                 description = getQuestionDescription(2702),
                 start  = romType2VideoStarted("SpongeBob SquarePants", "Opposite Day") &&
                          romType2LeaderboardQuestionSelect(4, 1),
                 cancel = romType2LeaderboardCancel("SpongeBob SquarePants", "Opposite Day"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8425,
                 title       = getQuestionTitle(2703), 
                 description = getQuestionDescription(2703),
                 start  = romType2VideoStarted("SpongeBob SquarePants", "Opposite Day") &&
                          romType2LeaderboardQuestionSelect(4, 2),
                 cancel = romType2LeaderboardCancel("SpongeBob SquarePants", "Opposite Day"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8426,
                 title       = getQuestionTitle(2704), 
                 description = getQuestionDescription(2704),
                 start  = romType2VideoStarted("SpongeBob SquarePants", "Opposite Day") &&
                          romType2LeaderboardQuestionSelect(4, 3),
                 cancel = romType2LeaderboardCancel("SpongeBob SquarePants", "Opposite Day"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            
achievement(
    title = getAchievementTitle("Danny Phantom", "Attack of the Killer Garage Sale"), type = "progression",
    description = getAchievementDescription("Danny Phantom", "Attack of the Killer Garage Sale"),
    id = 114754, badge = "643472", points = 4,
    trigger = romType4VideoStarted("Danny Phantom", "Attack of the Killer Garage Sale") &&
              (romType4CorrectAnswer(6, 0, 4) ||
               romType4CorrectAnswer(6, 1, 7) ||
               romType4CorrectAnswer(6, 2, 5) ||
               romType4CorrectAnswer(6, 3, 7) ||
               romType4CorrectAnswer(6, 4, 5) ||
               romType4CorrectAnswer(6, 5, 6))
)
            leaderboard(
                 id = 8427,
                 title       = getQuestionTitle(2801), 
                 description = getQuestionDescription(2801),
                 start  = romType4VideoStarted("Danny Phantom", "Attack of the Killer Garage Sale") &&
                          romType4LeaderboardQuestionSelect(6, 0),
                 cancel = romType4LeaderboardCancel("Danny Phantom", "Attack of the Killer Garage Sale"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8428,
                 title       = getQuestionTitle(2802), 
                 description = getQuestionDescription(2802),
                 start  = romType4VideoStarted("Danny Phantom", "Attack of the Killer Garage Sale") &&
                          romType4LeaderboardQuestionSelect(6, 1),
                 cancel = romType4LeaderboardCancel("Danny Phantom", "Attack of the Killer Garage Sale"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8429,
                 title       = getQuestionTitle(2803), 
                 description = getQuestionDescription(2803),
                 start  = romType4VideoStarted("Danny Phantom", "Attack of the Killer Garage Sale") &&
                          romType4LeaderboardQuestionSelect(6, 2),
                 cancel = romType4LeaderboardCancel("Danny Phantom", "Attack of the Killer Garage Sale"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8430,
                 title       = getQuestionTitle(2804), 
                 description = getQuestionDescription(2804),
                 start  = romType4VideoStarted("Danny Phantom", "Attack of the Killer Garage Sale") &&
                          romType4LeaderboardQuestionSelect(6, 3),
                 cancel = romType4LeaderboardCancel("Danny Phantom", "Attack of the Killer Garage Sale"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8432,
                 title       = getQuestionTitle(2805), 
                 description = getQuestionDescription(2805),
                 start  = romType4VideoStarted("Danny Phantom", "Attack of the Killer Garage Sale") &&
                          romType4LeaderboardQuestionSelect(6, 4),
                 cancel = romType4LeaderboardCancel("Danny Phantom", "Attack of the Killer Garage Sale"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8433,
                 title       = getQuestionTitle(2806), 
                 description = getQuestionDescription(2806),
                 start  = romType4VideoStarted("Danny Phantom", "Attack of the Killer Garage Sale") &&
                          romType4LeaderboardQuestionSelect(6, 5),
                 cancel = romType4LeaderboardCancel("Danny Phantom", "Attack of the Killer Garage Sale"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            
achievement(
    title = getAchievementTitle("The Fairly OddParents!", "Timvisible"), type = "progression",
    description = getAchievementDescription("The Fairly OddParents!", "Timvisible"),
    id = 114755, badge = "125652", points = 2,
    trigger = romType4VideoStarted("The Fairly OddParents!", "Timvisible") &&
              (romType4CorrectAnswer(4, 0, 6) ||
               romType4CorrectAnswer(4, 1, 4) ||
               romType4CorrectAnswer(4, 2, 7) ||
               romType4CorrectAnswer(4, 3, 5))
)
            leaderboard(
                 id = 8431,
                 title       = getQuestionTitle(2901), 
                 description = getQuestionDescription(2901),
                 start  = romType4VideoStarted("The Fairly OddParents!", "Timvisible") &&
                          romType4LeaderboardQuestionSelect(4, 0),
                 cancel = romType4LeaderboardCancel("The Fairly OddParents!", "Timvisible"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8435,
                 title       = getQuestionTitle(2902), 
                 description = getQuestionDescription(2902),
                 start  = romType4VideoStarted("The Fairly OddParents!", "Timvisible") &&
                          romType4LeaderboardQuestionSelect(4, 1),
                 cancel = romType4LeaderboardCancel("The Fairly OddParents!", "Timvisible"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8436,
                 title       = getQuestionTitle(2903), 
                 description = getQuestionDescription(2903),
                 start  = romType4VideoStarted("The Fairly OddParents!", "Timvisible") &&
                          romType4LeaderboardQuestionSelect(4, 2),
                 cancel = romType4LeaderboardCancel("The Fairly OddParents!", "Timvisible"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8434,
                 title       = getQuestionTitle(2904), 
                 description = getQuestionDescription(2904),
                 start  = romType4VideoStarted("The Fairly OddParents!", "Timvisible") &&
                          romType4LeaderboardQuestionSelect(4, 3),
                 cancel = romType4LeaderboardCancel("The Fairly OddParents!", "Timvisible"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            
achievement(
    title = getAchievementTitle("SpongeBob SquarePants", "Squeaky Boots"), type = "progression",
    description = getAchievementDescription("SpongeBob SquarePants", "Squeaky Boots"),
    id = 114756, badge = "125655", points = 2,
    trigger = romType4VideoStarted("SpongeBob SquarePants", "Squeaky Boots") &&
              (romType4CorrectAnswer(4, 0, 5) ||
               romType4CorrectAnswer(4, 1, 7) ||
               romType4CorrectAnswer(4, 2, 6) ||
               romType4CorrectAnswer(4, 3, 7))
)
            leaderboard(
                 id = 8437,
                 title       = getQuestionTitle(3001), 
                 description = getQuestionDescription(3001),
                 start  = romType4VideoStarted("SpongeBob SquarePants", "Squeaky Boots") &&
                          romType4LeaderboardQuestionSelect(4, 0),
                 cancel = romType4LeaderboardCancel("SpongeBob SquarePants", "Squeaky Boots"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8440,
                 title       = getQuestionTitle(3002), 
                 description = getQuestionDescription(3002),
                 start  = romType4VideoStarted("SpongeBob SquarePants", "Squeaky Boots") &&
                          romType4LeaderboardQuestionSelect(4, 1),
                 cancel = romType4LeaderboardCancel("SpongeBob SquarePants", "Squeaky Boots"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8441,
                 title       = getQuestionTitle(3003), 
                 description = getQuestionDescription(3003),
                 start  = romType4VideoStarted("SpongeBob SquarePants", "Squeaky Boots") &&
                          romType4LeaderboardQuestionSelect(4, 2),
                 cancel = romType4LeaderboardCancel("SpongeBob SquarePants", "Squeaky Boots"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8442,
                 title       = getQuestionTitle(3004), 
                 description = getQuestionDescription(3004),
                 start  = romType4VideoStarted("SpongeBob SquarePants", "Squeaky Boots") &&
                          romType4LeaderboardQuestionSelect(4, 3),
                 cancel = romType4LeaderboardCancel("SpongeBob SquarePants", "Squeaky Boots"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            
achievement(
    title = getAchievementTitle("Pokémon: Johto League Champions", "A Hot Water Battle"), type = "progression",
    description = getAchievementDescription("Pokémon: Johto League Champions", "A Hot Water Battle"),
    id = 115131, badge = "125908", points = 4,
    trigger = romType5VideoStarted("Pokémon: Johto League Champions", "A Hot Water Battle") &&
              (romType5CorrectAnswer(6, 0, 6) ||
               romType5CorrectAnswer(6, 1, 6) ||
               romType5CorrectAnswer(6, 2, 5) ||
               romType5CorrectAnswer(6, 3, 4) ||
               romType5CorrectAnswer(6, 4, 6) ||
               romType5CorrectAnswer(6, 5, 7))
)
            leaderboard(
                 id = 8451,
                 title       = getQuestionTitle(3101), 
                 description = getQuestionDescription(3101),
                 start  = romType5VideoStarted("Pokémon: Johto League Champions", "A Hot Water Battle") &&
                          romType5LeaderboardQuestionSelect(6, 0),
                 cancel = romType5LeaderboardCancel("Pokémon: Johto League Champions", "A Hot Water Battle"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8452,
                 title       = getQuestionTitle(3102), 
                 description = getQuestionDescription(3102),
                 start  = romType5VideoStarted("Pokémon: Johto League Champions", "A Hot Water Battle") &&
                          romType5LeaderboardQuestionSelect(6, 1),
                 cancel = romType5LeaderboardCancel("Pokémon: Johto League Champions", "A Hot Water Battle"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8453,
                 title       = getQuestionTitle(3103), 
                 description = getQuestionDescription(3103),
                 start  = romType5VideoStarted("Pokémon: Johto League Champions", "A Hot Water Battle") &&
                          romType5LeaderboardQuestionSelect(6, 2),
                 cancel = romType5LeaderboardCancel("Pokémon: Johto League Champions", "A Hot Water Battle"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8454,
                 title       = getQuestionTitle(3104), 
                 description = getQuestionDescription(3104),
                 start  = romType5VideoStarted("Pokémon: Johto League Champions", "A Hot Water Battle") &&
                          romType5LeaderboardQuestionSelect(6, 3),
                 cancel = romType5LeaderboardCancel("Pokémon: Johto League Champions", "A Hot Water Battle"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8455,
                 title       = getQuestionTitle(3105), 
                 description = getQuestionDescription(3105),
                 start  = romType5VideoStarted("Pokémon: Johto League Champions", "A Hot Water Battle") &&
                          romType5LeaderboardQuestionSelect(6, 4),
                 cancel = romType5LeaderboardCancel("Pokémon: Johto League Champions", "A Hot Water Battle"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8456,
                 title       = getQuestionTitle(3106), 
                 description = getQuestionDescription(3106),
                 start  = romType5VideoStarted("Pokémon: Johto League Champions", "A Hot Water Battle") &&
                          romType5LeaderboardQuestionSelect(6, 5),
                 cancel = romType5LeaderboardCancel("Pokémon: Johto League Champions", "A Hot Water Battle"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
           
achievement(
    title = getAchievementTitle("Pokémon: Master Quest", "For Ho-Oh The Bells Toll!"), type = "progression",
    description = getAchievementDescription("Pokémon: Master Quest", "For Ho-Oh The Bells Toll!"),
    id = 115215, badge = "176297", points = 4,
    trigger = romType5VideoStarted("Pokémon: Master Quest", "For Ho-Oh The Bells Toll!") &&
              (romType5CorrectAnswer(6, 0, 7) ||
               romType5CorrectAnswer(6, 1, 7) ||
               romType5CorrectAnswer(6, 2, 6) ||
               romType5CorrectAnswer(6, 3, 4) ||
               romType5CorrectAnswer(6, 4, 4) ||
               romType5CorrectAnswer(6, 5, 6))
)
            leaderboard(
                 id = 8459,
                 title       = getQuestionTitle(3201), 
                 description = getQuestionDescription(3201),
                 start  = romType5VideoStarted("Pokémon: Master Quest", "For Ho-Oh The Bells Toll!") &&
                          romType5LeaderboardQuestionSelect(6, 0),
                 cancel = romType5LeaderboardCancel("Pokémon: Master Quest", "For Ho-Oh The Bells Toll!"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8460,
                 title       = getQuestionTitle(3202), 
                 description = getQuestionDescription(3202),
                 start  = romType5VideoStarted("Pokémon: Master Quest", "For Ho-Oh The Bells Toll!") &&
                          romType5LeaderboardQuestionSelect(6, 1),
                 cancel = romType5LeaderboardCancel("Pokémon: Master Quest", "For Ho-Oh The Bells Toll!"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8461,
                 title       = getQuestionTitle(3203), 
                 description = getQuestionDescription(3203),
                 start  = romType5VideoStarted("Pokémon: Master Quest", "For Ho-Oh The Bells Toll!") &&
                          romType5LeaderboardQuestionSelect(6, 2),
                 cancel = romType5LeaderboardCancel("Pokémon: Master Quest", "For Ho-Oh The Bells Toll!"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8462,
                 title       = getQuestionTitle(3204), 
                 description = getQuestionDescription(3204),
                 start  = romType5VideoStarted("Pokémon: Master Quest", "For Ho-Oh The Bells Toll!") &&
                          romType5LeaderboardQuestionSelect(6, 3),
                 cancel = romType5LeaderboardCancel("Pokémon: Master Quest", "For Ho-Oh The Bells Toll!"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8463,
                 title       = getQuestionTitle(3205), 
                 description = getQuestionDescription(3205),
                 start  = romType5VideoStarted("Pokémon: Master Quest", "For Ho-Oh The Bells Toll!") &&
                          romType5LeaderboardQuestionSelect(6, 4),
                 cancel = romType5LeaderboardCancel("Pokémon: Master Quest", "For Ho-Oh The Bells Toll!"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8464,
                 title       = getQuestionTitle(3206), 
                 description = getQuestionDescription(3206),
                 start  = romType5VideoStarted("Pokémon: Master Quest", "For Ho-Oh The Bells Toll!") &&
                          romType5LeaderboardQuestionSelect(6, 5),
                 cancel = romType5LeaderboardCancel("Pokémon: Master Quest", "For Ho-Oh The Bells Toll!"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            
achievement(
    title = getAchievementTitle("Pokémon: Master Quest", "Playing with Fire!"), type = "progression",
    description = getAchievementDescription("Pokémon: Master Quest", "Playing with Fire!"),
    id = 115217, badge = "125978", points = 4,
    trigger = romType5VideoStarted("Pokémon: Master Quest", "Playing with Fire!") &&
              (romType5CorrectAnswer(6, 0, 7) ||
               romType5CorrectAnswer(6, 1, 7) ||
               romType5CorrectAnswer(6, 2, 6) ||
               romType5CorrectAnswer(6, 3, 4) ||
               romType5CorrectAnswer(6, 4, 4) ||
               romType5CorrectAnswer(6, 5, 6))
)
            leaderboard(
                 id = 8467,
                 title       = getQuestionTitle(3301), 
                 description = getQuestionDescription(3301),
                 start  = romType5VideoStarted("Pokémon: Master Quest", "Playing with Fire!") &&
                          romType5LeaderboardQuestionSelect(6, 0),
                 cancel = romType5LeaderboardCancel("Pokémon: Master Quest", "Playing with Fire!"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8468,
                 title       = getQuestionTitle(3302), 
                 description = getQuestionDescription(3302),
                 start  = romType5VideoStarted("Pokémon: Master Quest", "Playing with Fire!") &&
                          romType5LeaderboardQuestionSelect(6, 1),
                 cancel = romType5LeaderboardCancel("Pokémon: Master Quest", "Playing with Fire!"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8469,
                 title       = getQuestionTitle(3303), 
                 description = getQuestionDescription(3303),
                 start  = romType5VideoStarted("Pokémon: Master Quest", "Playing with Fire!") &&
                          romType5LeaderboardQuestionSelect(6, 2),
                 cancel = romType5LeaderboardCancel("Pokémon: Master Quest", "Playing with Fire!"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8470,
                 title       = getQuestionTitle(3304), 
                 description = getQuestionDescription(3304),
                 start  = romType5VideoStarted("Pokémon: Master Quest", "Playing with Fire!") &&
                          romType5LeaderboardQuestionSelect(6, 3),
                 cancel = romType5LeaderboardCancel("Pokémon: Master Quest", "Playing with Fire!"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8471,
                 title       = getQuestionTitle(3305), 
                 description = getQuestionDescription(3305),
                 start  = romType5VideoStarted("Pokémon: Master Quest", "Playing with Fire!") &&
                          romType5LeaderboardQuestionSelect(6, 4),
                 cancel = romType5LeaderboardCancel("Pokémon: Master Quest", "Playing with Fire!"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8472,
                 title       = getQuestionTitle(3306), 
                 description = getQuestionDescription(3306),
                 start  = romType5VideoStarted("Pokémon: Master Quest", "Playing with Fire!") &&
                          romType5LeaderboardQuestionSelect(6, 5),
                 cancel = romType5LeaderboardCancel("Pokémon: Master Quest", "Playing with Fire!"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            
achievement(
    title = getAchievementTitle("Pokémon: Master Quest", "Johto Photo Finish"), type = "progression",
    description = getAchievementDescription("Pokémon: Master Quest", "Johto Photo Finish"),
    id = 115219, badge = "125989", points = 4,
    trigger = romType5VideoStarted("Pokémon: Master Quest", "Johto Photo Finish") &&
              (romType5CorrectAnswer(6, 0, 5) ||
               romType5CorrectAnswer(6, 1, 7) ||
               romType5CorrectAnswer(6, 2, 7) ||
               romType5CorrectAnswer(6, 3, 7) ||
               romType5CorrectAnswer(6, 4, 5) ||
               romType5CorrectAnswer(6, 5, 4))
)
            leaderboard(
                 id = 8475,
                 title       = getQuestionTitle(3401), 
                 description = getQuestionDescription(3401),
                 start  = romType5VideoStarted("Pokémon: Master Quest", "Johto Photo Finish") &&
                          romType5LeaderboardQuestionSelect(6, 0),
                 cancel = romType5LeaderboardCancel("Pokémon: Master Quest", "Johto Photo Finish"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8476,
                 title       = getQuestionTitle(3402), 
                 description = getQuestionDescription(3402),
                 start  = romType5VideoStarted("Pokémon: Master Quest", "Johto Photo Finish") &&
                          romType5LeaderboardQuestionSelect(6, 1),
                 cancel = romType5LeaderboardCancel("Pokémon: Master Quest", "Johto Photo Finish"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8477,
                 title       = getQuestionTitle(3403), 
                 description = getQuestionDescription(3403),
                 start  = romType5VideoStarted("Pokémon: Master Quest", "Johto Photo Finish") &&
                          romType5LeaderboardQuestionSelect(6, 2),
                 cancel = romType5LeaderboardCancel("Pokémon: Master Quest", "Johto Photo Finish"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8478,
                 title       = getQuestionTitle(3404), 
                 description = getQuestionDescription(3404),
                 start  = romType5VideoStarted("Pokémon: Master Quest", "Johto Photo Finish") &&
                          romType5LeaderboardQuestionSelect(6, 3),
                 cancel = romType5LeaderboardCancel("Pokémon: Master Quest", "Johto Photo Finish"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8479,
                 title       = getQuestionTitle(3405), 
                 description = getQuestionDescription(3405),
                 start  = romType5VideoStarted("Pokémon: Master Quest", "Johto Photo Finish") &&
                          romType5LeaderboardQuestionSelect(6, 4),
                 cancel = romType5LeaderboardCancel("Pokémon: Master Quest", "Johto Photo Finish"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8480,
                 title       = getQuestionTitle(3406), 
                 description = getQuestionDescription(3406),
                 start  = romType5VideoStarted("Pokémon: Master Quest", "Johto Photo Finish") &&
                          romType5LeaderboardQuestionSelect(6, 5),
                 cancel = romType5LeaderboardCancel("Pokémon: Master Quest", "Johto Photo Finish"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
           
achievement(
    title = getAchievementTitle("Pokémon: Indigo League", "Pokémon - I Choose You!"), type = "progression",
    description = getAchievementDescription("Pokémon: Indigo League", "Pokémon - I Choose You!"),
    id = 115221, badge = "125991", points = 4,
    trigger = romType5VideoStarted("Pokémon: Indigo League", "Pokémon - I Choose You!") &&
              (romType5CorrectAnswer(6, 0, 7) ||
               romType5CorrectAnswer(6, 1, 5) ||
               romType5CorrectAnswer(6, 2, 5) ||
               romType5CorrectAnswer(6, 3, 7) ||
               romType5CorrectAnswer(6, 4, 6) ||
               romType5CorrectAnswer(6, 5, 6))
)
            leaderboard(
                 id = 8485,
                 title       = getQuestionTitle(3501), 
                 description = getQuestionDescription(3501),
                 start  = romType5VideoStarted("Pokémon: Indigo League", "Pokémon - I Choose You!") &&
                          romType5LeaderboardQuestionSelect(6, 0),
                 cancel = romType5LeaderboardCancel("Pokémon: Indigo League", "Pokémon - I Choose You!"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8486,
                 title       = getQuestionTitle(3502), 
                 description = getQuestionDescription(3502),
                 start  = romType5VideoStarted("Pokémon: Indigo League", "Pokémon - I Choose You!") &&
                          romType5LeaderboardQuestionSelect(6, 1),
                 cancel = romType5LeaderboardCancel("Pokémon: Indigo League", "Pokémon - I Choose You!"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8487,
                 title       = getQuestionTitle(3503), 
                 description = getQuestionDescription(3503),
                 start  = romType5VideoStarted("Pokémon: Indigo League", "Pokémon - I Choose You!") &&
                          romType5LeaderboardQuestionSelect(6, 2),
                 cancel = romType5LeaderboardCancel("Pokémon: Indigo League", "Pokémon - I Choose You!"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8488,
                 title       = getQuestionTitle(3504), 
                 description = getQuestionDescription(3504),
                 start  = romType5VideoStarted("Pokémon: Indigo League", "Pokémon - I Choose You!") &&
                          romType5LeaderboardQuestionSelect(6, 3),
                 cancel = romType5LeaderboardCancel("Pokémon: Indigo League", "Pokémon - I Choose You!"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8489,
                 title       = getQuestionTitle(3505), 
                 description = getQuestionDescription(3505),
                 start  = romType5VideoStarted("Pokémon: Indigo League", "Pokémon - I Choose You!") &&
                          romType5LeaderboardQuestionSelect(6, 4),
                 cancel = romType5LeaderboardCancel("Pokémon: Indigo League", "Pokémon - I Choose You!"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8490,
                 title       = getQuestionTitle(3506), 
                 description = getQuestionDescription(3506),
                 start  = romType5VideoStarted("Pokémon: Indigo League", "Pokémon - I Choose You!") &&
                          romType5LeaderboardQuestionSelect(6, 5),
                 cancel = romType5LeaderboardCancel("Pokémon: Indigo League", "Pokémon - I Choose You!"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
           
achievement(
    title = getAchievementTitle("Pokémon: Indigo League", "Here Comes The Squirtle Squad"), type = "progression",
    description = getAchievementDescription("Pokémon: Indigo League", "Here Comes The Squirtle Squad"),
    id = 115267, badge = "126026", points = 4,
    trigger = romType5VideoStarted("Pokémon: Indigo League", "Here Comes The Squirtle Squad") &&
              (romType5CorrectAnswer(6, 0, 5) ||
               romType5CorrectAnswer(6, 1, 6) ||
               romType5CorrectAnswer(6, 2, 7) ||
               romType5CorrectAnswer(6, 3, 4) ||
               romType5CorrectAnswer(6, 4, 4) ||
               romType5CorrectAnswer(6, 5, 4))
)
            leaderboard(
                 id = 8494,
                 title       = getQuestionTitle(3601), 
                 description = getQuestionDescription(3601),
                 start  = romType5VideoStarted("Pokémon: Indigo League", "Here Comes The Squirtle Squad") &&
                          romType5LeaderboardQuestionSelect(6, 0),
                 cancel = romType5LeaderboardCancel("Pokémon: Indigo League", "Here Comes The Squirtle Squad"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8495,
                 title       = getQuestionTitle(3602), 
                 description = getQuestionDescription(3602),
                 start  = romType5VideoStarted("Pokémon: Indigo League", "Here Comes The Squirtle Squad") &&
                          romType5LeaderboardQuestionSelect(6, 1),
                 cancel = romType5LeaderboardCancel("Pokémon: Indigo League", "Here Comes The Squirtle Squad"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8496,
                 title       = getQuestionTitle(3603), 
                 description = getQuestionDescription(3603),
                 start  = romType5VideoStarted("Pokémon: Indigo League", "Here Comes The Squirtle Squad") &&
                          romType5LeaderboardQuestionSelect(6, 2),
                 cancel = romType5LeaderboardCancel("Pokémon: Indigo League", "Here Comes The Squirtle Squad"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8497,
                 title       = getQuestionTitle(3604), 
                 description = getQuestionDescription(3604),
                 start  = romType5VideoStarted("Pokémon: Indigo League", "Here Comes The Squirtle Squad") &&
                          romType5LeaderboardQuestionSelect(6, 3),
                 cancel = romType5LeaderboardCancel("Pokémon: Indigo League", "Here Comes The Squirtle Squad"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8498,
                 title       = getQuestionTitle(3605), 
                 description = getQuestionDescription(3605),
                 start  = romType5VideoStarted("Pokémon: Indigo League", "Here Comes The Squirtle Squad") &&
                          romType5LeaderboardQuestionSelect(6, 4),
                 cancel = romType5LeaderboardCancel("Pokémon: Indigo League", "Here Comes The Squirtle Squad"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8499,
                 title       = getQuestionTitle(3606), 
                 description = getQuestionDescription(3606),
                 start  = romType5VideoStarted("Pokémon: Indigo League", "Here Comes The Squirtle Squad") &&
                          romType5LeaderboardQuestionSelect(6, 5),
                 cancel = romType5LeaderboardCancel("Pokémon: Indigo League", "Here Comes The Squirtle Squad"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            
achievement(
    title = getAchievementTitle("Pokémon: Indigo League", "Beach Blank-Out Blastoise"), type = "progression",
    description = getAchievementDescription("Pokémon: Indigo League", "Beach Blank-Out Blastoise"),
    id = 115525, badge = "126353", points = 4,
    trigger = romType5VideoStarted("Pokémon: Indigo League", "Beach Blank-Out Blastoise") &&
              (romType5CorrectAnswer(6, 0, 5) ||
               romType5CorrectAnswer(6, 1, 6) ||
               romType5CorrectAnswer(6, 2, 5) ||
               romType5CorrectAnswer(6, 3, 7) ||
               romType5CorrectAnswer(6, 4, 6) ||
               romType5CorrectAnswer(6, 5, 7))
)
            leaderboard(
                 id = 8503,
                 title       = getQuestionTitle(3701), 
                 description = getQuestionDescription(3701),
                 start  = romType5VideoStarted("Pokémon: Indigo League", "Beach Blank-Out Blastoise") &&
                          romType5LeaderboardQuestionSelect(6, 0),
                 cancel = romType5LeaderboardCancel("Pokémon: Indigo League", "Beach Blank-Out Blastoise"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8504,
                 title       = getQuestionTitle(3702), 
                 description = getQuestionDescription(3702),
                 start  = romType5VideoStarted("Pokémon: Indigo League", "Beach Blank-Out Blastoise") &&
                          romType5LeaderboardQuestionSelect(6, 1),
                 cancel = romType5LeaderboardCancel("Pokémon: Indigo League", "Beach Blank-Out Blastoise"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8505,
                 title       = getQuestionTitle(3703), 
                 description = getQuestionDescription(3703),
                 start  = romType5VideoStarted("Pokémon: Indigo League", "Beach Blank-Out Blastoise") &&
                          romType5LeaderboardQuestionSelect(6, 2),
                 cancel = romType5LeaderboardCancel("Pokémon: Indigo League", "Beach Blank-Out Blastoise"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8506,
                 title       = getQuestionTitle(3704), 
                 description = getQuestionDescription(3704),
                 start  = romType5VideoStarted("Pokémon: Indigo League", "Beach Blank-Out Blastoise") &&
                          romType5LeaderboardQuestionSelect(6, 3),
                 cancel = romType5LeaderboardCancel("Pokémon: Indigo League", "Beach Blank-Out Blastoise"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8507,
                 title       = getQuestionTitle(3705), 
                 description = getQuestionDescription(3705),
                 start  = romType5VideoStarted("Pokémon: Indigo League", "Beach Blank-Out Blastoise") &&
                          romType5LeaderboardQuestionSelect(6, 4),
                 cancel = romType5LeaderboardCancel("Pokémon: Indigo League", "Beach Blank-Out Blastoise"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8508,
                 title       = getQuestionTitle(3706), 
                 description = getQuestionDescription(3706),
                 start  = romType5VideoStarted("Pokémon: Indigo League", "Beach Blank-Out Blastoise") &&
                          romType5LeaderboardQuestionSelect(6, 5),
                 cancel = romType5LeaderboardCancel("Pokémon: Indigo League", "Beach Blank-Out Blastoise"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            
achievement(
    title = getAchievementTitle("Pokémon: Indigo League", "Go West Young Meowth"), type = "progression",
    description = getAchievementDescription("Pokémon: Indigo League", "Go West Young Meowth"),
    id = 115531, badge = "126354", points = 4,
    trigger = romType5VideoStarted("Pokémon: Indigo League", "Go West Young Meowth") &&
              (romType5CorrectAnswer(6, 0, 4) ||
               romType5CorrectAnswer(6, 1, 4) ||
               romType5CorrectAnswer(6, 2, 7) ||
               romType5CorrectAnswer(6, 3, 6) ||
               romType5CorrectAnswer(6, 4, 7) ||
               romType5CorrectAnswer(6, 5, 4))
)
            leaderboard(
                 id = 8511,
                 title       = getQuestionTitle(3801), 
                 description = getQuestionDescription(3801),
                 start  = romType5VideoStarted("Pokémon: Indigo League", "Go West Young Meowth") &&
                          romType5LeaderboardQuestionSelect(6, 0),
                 cancel = romType5LeaderboardCancel("Pokémon: Indigo League", "Go West Young Meowth"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8512,
                 title       = getQuestionTitle(3802), 
                 description = getQuestionDescription(3802),
                 start  = romType5VideoStarted("Pokémon: Indigo League", "Go West Young Meowth") &&
                          romType5LeaderboardQuestionSelect(6, 1),
                 cancel = romType5LeaderboardCancel("Pokémon: Indigo League", "Go West Young Meowth"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8513,
                 title       = getQuestionTitle(3803), 
                 description = getQuestionDescription(3803),
                 start  = romType5VideoStarted("Pokémon: Indigo League", "Go West Young Meowth") &&
                          romType5LeaderboardQuestionSelect(6, 2),
                 cancel = romType5LeaderboardCancel("Pokémon: Indigo League", "Go West Young Meowth"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8514,
                 title       = getQuestionTitle(3804), 
                 description = getQuestionDescription(3804),
                 start  = romType5VideoStarted("Pokémon: Indigo League", "Go West Young Meowth") &&
                          romType5LeaderboardQuestionSelect(6, 3),
                 cancel = romType5LeaderboardCancel("Pokémon: Indigo League", "Go West Young Meowth"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8515,
                 title       = getQuestionTitle(3805), 
                 description = getQuestionDescription(3805),
                 start  = romType5VideoStarted("Pokémon: Indigo League", "Go West Young Meowth") &&
                          romType5LeaderboardQuestionSelect(6, 4),
                 cancel = romType5LeaderboardCancel("Pokémon: Indigo League", "Go West Young Meowth"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            leaderboard(
                 id = 8516,
                 title       = getQuestionTitle(3806), 
                 description = getQuestionDescription(3806),
                 start  = romType5VideoStarted("Pokémon: Indigo League", "Go West Young Meowth") &&
                          romType5LeaderboardQuestionSelect(6, 5),
                 cancel = romType5LeaderboardCancel("Pokémon: Indigo League", "Go West Young Meowth"), 
                 submit = always_false(), 
                 value  = always_true(),
                 format = "Frames"
            )
            
            
