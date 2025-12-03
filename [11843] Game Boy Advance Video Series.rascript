// Game Boy Advance Video Series
// #ID = 11843

//--------------------------------------------------
// Addresses

mem_romType1EpisodePointer  = 0x006868
mem_romType1VideoState      = mem_romType1EpisodePointer - 0x10
mem_romType1SceneCountdown  = mem_romType1EpisodePointer + 0x0C
mem_romType1VideoPlaytime   = mem_romType1EpisodePointer + 0x14
mem_romType1CurrentChapter  = mem_romType1EpisodePointer + 0x20
mem_romType1Input           = 0x007EC4
mem_romType1RNG             = mem_romType1Input + 0x2C

mem_romType2EpisodePointer  = 0x006828
mem_romType2VideoState      = mem_romType2EpisodePointer - 0x10
mem_romType2SceneCountdown  = mem_romType2EpisodePointer + 0x0C
mem_romType2VideoPlaytime   = mem_romType2EpisodePointer + 0x14
mem_romType2CurrentChapter  = mem_romType2EpisodePointer + 0x20
mem_romType2Input           = 0x007EBC
mem_romType2StateLoaded     = mem_romType2Input - 0x3C
mem_romType2MenuState       = mem_romType2Input - 0x18
mem_romType2RNG             = 0x0068D0

mem_romType3EpisodePointer  = 0x006820
mem_romType3VideoState      = mem_romType3EpisodePointer - 0x10
mem_romType3SceneCountdown  = mem_romType3EpisodePointer + 0x0C
mem_romType3VideoPlaytime   = mem_romType3EpisodePointer + 0x14
mem_romType3CurrentChapter  = mem_romType3EpisodePointer + 0x20
mem_romType3Input           = 0x007EC8
mem_romType3StateLoaded     = 0x0075A0
mem_romType3MenuState       = mem_romType3Input - 0x14
mem_romType3RNG             = 0x00659C

//--------------------------------------------------
// Arrays and Dictionaries

inputArrow = [
    "🠉", "🠈", "🠋", "🠊"
]

episodes = [
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
]

questions = [
    [
        0101,
        "Do not forget to land on what?",
            "Left Arm",
            "Left Foot",
            "Right Arm",
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
        "What did Cindy smell like based on Brobot?",
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
        "What did Phil's armpit smell like based on Dylan?",
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
           never(repeated(600, dword(mem_romType2SceneCountdown) == 0xFFFFFFFF))
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
           (repeated(600, dword(mem_romType2SceneCountdown) == 0xFFFFFFFF &&
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
    id = 97655, badge = "107192", points = 3,
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
    id = 97664, badge = "107200", points = 3,
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
    id = 114580, badge = "641195", points = 3,
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
    id = 114581, badge = "125228", points = 3,
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
            
            
