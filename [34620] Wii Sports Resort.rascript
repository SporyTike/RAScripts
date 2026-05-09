// Wii Sports Resort
// #ID = 34620

//--------------------------------------------------
// Addresses

mem_pointer006F5378 = 0x006f5378
mem_pointer006F5518 = 0x006f5518
mem_pointer006F5538 = 0x006f5538

pointerMask = 0x3fffffff

//--------------------------------------------------
// Arrays and Dictionaries

sport_activities = {
    0x00000005: ["Swordplay", "Duel"],
    0x00060000: ["Swordplay", "Speed Slice"],
    0x00000001: ["Swordplay", "Showdown"],
    0x00080002: ["Wakeboarding", ""],
    0x00030002: ["Frisbee", "Frisbee Dog"],
    0x000B0002: ["Frisbee", "Frisbee Golf"],
    0x00020002: ["Archery", ""],
    0x00040002: ["Basketball", "3-Point Contest"],
    0x00040005: ["Basketball", "3-on-3 Game"],
    0x00070005: ["Table Tennis", "Match"],
    0x00070002: ["Table Tennis", "Return Challenge"],
    0x000A0002: ["Golf", ""],
    0x00050002: ["Bowling", "10-Pin Game"],
    0x00050003: ["Bowling", "100-Pin Game"],
    0x00050004: ["Bowling", "Spin Control"],
    0x00010002: ["Power Cruising", "Slalom Course"],
    0x00010005: ["Power Cruising", "VS"],
    0x00060008: ["Canoeing", "Speed Challenge"],
    0x00060007: ["Canoeing", "VS"],
    0x000C0008: ["Cycling", "Road Race"],
    0x000C0005: ["Cycling", "VS"],
    0x000D0001: ["Air Sports", "Skydiving"],
    0x00090000: ["Air Sports", "Island Flyover"],
    0x00090005: ["Air Sports", "Dogfight"],
}

air_sports_island_flyover_daytimes = {
    0x00: "at daytime",
    0x01: "in the evening",
    0x02: "through the night"
}

//--------------------------------------------------
// Functions

function is_ingame() {
    return dword_be(mem_pointer006F5518) != 0x00
}

function sport_activity_modifier_active(player, button) {
    if (player == "Player 1") {
        offset = 0x38A
    }   
           if (button == "2") {
        bitflag = 0
    } else if (button == "1") {
        bitflag = 1
    } else if (button == "B") {
        bitflag = 2
    } else if (button == "A") {
        bitflag = 3
    } else if (button == "-") {
        bitflag = 4
    } else {
        offset = offset + 1
           if (button == "Left") {
        bitflag = 0
    } else if (button == "Right") {
        bitflag = 1
    } else if (button == "Down") {
        bitflag = 2
    } else if (button == "Up") {
        bitflag = 3
    } else if (button == "+") {
        bitflag = 4
    }}
    return bit(bitflag, (dword_be(mem_pointer006F5538) & pointerMask) + offset) == 1
}

function get_mii_savedata_path() {
    return (dword_be((dword_be((dword_be(mem_pointer006F5378) & 0x3fffffff) + 0x10) & 0x3fffffff) + 0x0C) & pointerMask)
}


function check_sport_activity(sport, mode) {
    sport_activity_objects = array_filter(sport_activities, sport_activity => sport_activities[sport_activity][0] == sport &&
                                                                              sport_activities[sport_activity][1] == mode)                                              
    return any_of(sport_activity_objects, sport_activity_ID => dword_be((dword_be(mem_pointer006F5538) & pointerMask) + 0x14) == (sport_activity_ID & 0xffff0000) / 0x10000 && 
                                                               dword_be((dword_be(mem_pointer006F5538) & pointerMask) + 0x18) == (sport_activity_ID & 0x0000ffff))
}

function air_sports_island_flyover_activity_state() {
    return byte((dword_be((dword_be(mem_pointer006F5518) & 0x3fffffff) + 0x144) & 0x3fffffff) + 0x08)
}

function air_sports_island_flyover_daytime() {
    return dword_be((dword_be(mem_pointer006F5538) & pointerMask) + 0x1C)
}

function air_sports_island_flyover_time_left() {
    return dword_be((dword_be((dword_be(mem_pointer006F5518) & 0x3fffffff) + 0x144) & 0x3fffffff) + 0xCC)
}

function air_sports_island_flyover_read_location_at_wuhu_island() {
    address = bit0((dword_be(mem_pointer006F5518) & 0x3fffffff) + 0x15D)
    return address > prev(address)
}

function air_sports_island_flyover_miguel_guide_plane_follow_timer() {
    return dword_be((dword_be((dword_be((dword_be((dword_be(mem_pointer006F5518) & 0x3fffffff) + 0x140) & 0x3fffffff) + 0x10) & 0x3fffffff) + 0x0C) & 0x3fffffff) + 0xF0)
}

function air_sports_island_flyover_get_total_ipoints_found_in_current_flight() {
    return dword_be((dword_be((dword_be((dword_be(mem_pointer006F5518) & 0x3fffffff) + 0x144) & 0x3fffffff) + 0x128) & 0x3fffffff) + 0x644)
}

function air_sports_island_flyover_get_total_ipoints() {
    return byte(get_mii_savedata_path() + 0xC2B)
}

function air_sports_island_flyover_get_ipoints_by_daytime(time) {
    if (time == "Daytime") {
        time = 0
    } else if (time == "Evening") {
        time = 1
    } else if (time == "Night") {
        time = 2
    }
    code = 0
    for ipoint in range (0, 79) {
        code = code + bit(time, get_mii_savedata_path() + 0xC7C + ipoint)
    }
    return code
}

function air_sports_island_flyover_get_total_popped_balloons_in_current_flight() {
    return word_be((dword_be((dword_be((dword_be((dword_be((dword_be(mem_pointer006F5518) & 0x3fffffff) + 0x140) & 0x3fffffff) + 0x10) & 0x3fffffff) + 0x0C) & 0x3fffffff) + 0xB8) & 0x3fffffff) + 0x13016)
}

function air_sports_island_flyover_get_white_balloons_by_daytime(time) {
    if (time == "Daytime") {
        flag_offset = 0x00
        total_balloons = 372
    } else if (time == "Evening") {
        flag_offset = 0x40
        total_balloons = 340
    } else if (time == "Night") {
        flag_offset = 0x80
        total_balloons = 209
    }  
    code = 0
    for white_balloon in range (0, total_balloons - 1) {
        code = code + bit(white_balloon % 8, get_mii_savedata_path() + 0xCCC + flag_offset + white_balloon / 8)
    }
    return code
}

function air_sports_island_flyover_get_plane_data(type, type2) {
    if (type == "Coordinate") {
        offset = 0x00
        offset2 = 1
    } else if (type == "Speed") {
        offset = 0x0C
        offset2 = 2
    }
    if (type2 == "X-Axis") {
        offset = offset + 0x00 * offset2
    } else if (type2 == "Y-Axis") {
        offset = offset + 0x04 * offset2
    } else if (type2 == "Z-Axis") {
        offset = offset + 0x08 * offset2
    }
    return float_be((dword_be((dword_be((dword_be((dword_be((dword_be((dword_be(mem_pointer006F5518) & 0x3fffffff) + 0x140) & 0x3fffffff) + 0x10) & 0x3fffffff) + 0x08) & 0x3fffffff) + 0x48) & 0x3fffffff) + 0x0C) & 0x3fffffff) + 0x98 + offset)
}

function air_sports_island_flyover_total_barrel_rolls() {
    return word_be((dword_be((dword_be((dword_be((dword_be(mem_pointer006F5518) & 0x3fffffff) + 0x140) & 0x3fffffff) + 0x10) & 0x3fffffff) + 0x08) & 0x3fffffff) + 0x9C)
}

//--------------------------------------------------
// Achievements

achievement(
    title = "Everybody's Golf Resort", type = "",
    description = "[Air Sports / Island Flyover] Visit Wuhu Island and check one of its (i) points.",
    id = 606796, badge = "80", points = 1,
    trigger = is_ingame() &&
              check_sport_activity("Air Sports", "Island Flyover") &&
              air_sports_island_flyover_read_location_at_wuhu_island()
)

achievement(
    title = "Private Vacation Apartment", type = "progression",
    description = "[Air Sports / Island Flyover] Collect the (i) point of the Spacious Desert Island cottage after collecting every (i) point at least once in the daytime, evening or night.",
    id = 607263, badge = "80", points = 5,
    trigger = is_ingame() &&
              measured(air_sports_island_flyover_get_total_ipoints() == 80,
                       when = is_ingame() &&
                              check_sport_activity("Air Sports", "Island Flyover"),
                       format = "percent") &&
              air_sports_island_flyover_get_plane_data("Coordinate", "X-Axis") >= -10550.0 &&
              air_sports_island_flyover_get_plane_data("Coordinate", "X-Axis") <= -10150.0 &&
              air_sports_island_flyover_get_plane_data("Coordinate", "Y-Axis") >= 425.0 &&
              air_sports_island_flyover_get_plane_data("Coordinate", "Y-Axis") <= 825.0 &&
              air_sports_island_flyover_get_plane_data("Coordinate", "Z-Axis") >= -7870.0 &&
              air_sports_island_flyover_get_plane_data("Coordinate", "Z-Axis") <= -7470.0 &&
              air_sports_island_flyover_get_total_ipoints_found_in_current_flight() == prev(air_sports_island_flyover_get_total_ipoints_found_in_current_flight()) + 1 &&
              once(air_sports_island_flyover_activity_state() == 0x03 &&
                   prev(air_sports_island_flyover_activity_state()) < 0x03 &&
                   air_sports_island_flyover_get_total_ipoints() == 80 &&
                   never(is_ingame() &&
                         check_sport_activity("Air Sports", "Island Flyover") &&
                         air_sports_island_flyover_activity_state() != 0x03))
)

achievement(
    title = "Flight Seeing", type = "",
    description = "[Air Sports / Island Flyover] Follow Miguel's guide plane for three minutes in a single flight.",
    id = 606763, badge = "80", points = 3,
    trigger = is_ingame() &&
              measured(air_sports_island_flyover_miguel_guide_plane_follow_timer() * 0.0019 >= (60 * 60 * 3) * 0.0019,  // Multiplication to reduce the target value and make the progress bar update less frequent to avoid spam
                       when = is_ingame() &&                                                                            // Multiplication by 0.0019 to make it flat X/20 (5% per update) rather than x/21
                              check_sport_activity("Air Sports", "Island Flyover"),
                       format = "percent") &&
              prev(air_sports_island_flyover_miguel_guide_plane_follow_timer() < (60 * 60 * 3)) &&
              prev(air_sports_island_flyover_miguel_guide_plane_follow_timer() >= (60 * 60 * 3 - 100))
)

achievement(
    title = "Rushed Tour with Brief Turbulence", type = "",
    description = "[Air Sports / Island Flyover] Collect a total of 50 (i) points in a single flight.",
    id = 607179, badge = "80", points = 25,
    trigger = is_ingame() &&
              measured(air_sports_island_flyover_get_total_ipoints_found_in_current_flight() == 50,
                       when = is_ingame() &&
                              check_sport_activity("Air Sports", "Island Flyover"),
                       format = "raw") &&
              prev(air_sports_island_flyover_get_total_ipoints_found_in_current_flight()) == 49
)

achievement(
    title = "Perfect Weather for a Trip", type = "",
    description = "[Air Sports / Island Flyover] Collect every (i) point during the daytime.",
    id = 607152, badge = "80", points = 10,
    trigger = is_ingame() &&
              measured(air_sports_island_flyover_get_ipoints_by_daytime("Daytime") == 80,
                       when = is_ingame() &&
                              check_sport_activity("Air Sports", "Island Flyover"),
                       format = "raw") &&
              prev(air_sports_island_flyover_get_ipoints_by_daytime("Daytime")) == 79
)

achievement(
    title = "Scenaries in the Sunset", type = "",
    description = "[Air Sports / Island Flyover] Collect every (i) point during the evening.",
    id = 607153, badge = "80", points = 10,
    trigger = is_ingame() &&
              measured(air_sports_island_flyover_get_ipoints_by_daytime("Evening") == 80,
                       when = is_ingame() &&
                              check_sport_activity("Air Sports", "Island Flyover"),
                       format = "raw") &&
              prev(air_sports_island_flyover_get_ipoints_by_daytime("Evening")) == 79
)

achievement(
    title = "Ride Through the Night", type = "",
    description = "[Air Sports / Island Flyover] Collect every (i) point during the night.",
    id = 607154, badge = "80", points = 10,
    trigger = is_ingame() &&
              measured(air_sports_island_flyover_get_ipoints_by_daytime("Night") == 80,
                       when = is_ingame() &&
                              check_sport_activity("Air Sports", "Island Flyover"),
                       format = "raw") &&
              prev(air_sports_island_flyover_get_ipoints_by_daytime("Night")) == 79
)

achievement(
    title = "Wuhu Island's 24/7 Guide Plane Service", type = "",
    description = "[Air Sports / Island Flyover] Collect every (i) point during the daytime, evening and night.",
    id = 607155, badge = "80", points = 5,
    trigger = is_ingame() &&
              measured(air_sports_island_flyover_get_ipoints_by_daytime("Daytime")
                     + air_sports_island_flyover_get_ipoints_by_daytime("Evening")
                     + air_sports_island_flyover_get_ipoints_by_daytime("Night") == 240,
                       when = is_ingame() &&
                              check_sport_activity("Air Sports", "Island Flyover"),
                       format = "raw") &&
              prev(air_sports_island_flyover_get_ipoints_by_daytime("Daytime")
                 + air_sports_island_flyover_get_ipoints_by_daytime("Evening")
                 + air_sports_island_flyover_get_ipoints_by_daytime("Night")) == 239
)

achievement(
    title = "Pop Up Party Popper", type = "",
    description = "[Air Sports / Island Flyover] Pop a total of 150 balloons in a single flight.",
    id = 607156, badge = "80", points = 5,
    trigger = is_ingame() &&
              measured(air_sports_island_flyover_get_total_popped_balloons_in_current_flight() >= 150,
                       when = is_ingame() &&
                              check_sport_activity("Air Sports", "Island Flyover"),
                       format = "raw") &&
              prev(air_sports_island_flyover_get_total_popped_balloons_in_current_flight()) <= 149 &&
              prev(air_sports_island_flyover_get_total_popped_balloons_in_current_flight()) >= 120
)

achievement(
    title = "Find Mii on the Island", type = "",
    description = "[Air Sports / Island Flyover] Pop every white balloon during the daytime.",
    id = 607189, badge = "80", points = 10,
    trigger = is_ingame() &&
              measured(air_sports_island_flyover_get_white_balloons_by_daytime("Daytime") == 372,
                       when = is_ingame() &&
                              check_sport_activity("Air Sports", "Island Flyover"),
                       format = "raw") &&
              prev(air_sports_island_flyover_get_white_balloons_by_daytime("Daytime")) < 372 &&
              air_sports_island_flyover_get_total_popped_balloons_in_current_flight() > 0
)

achievement(
    title = "Mii, Myself and I", type = "",
    description = "[Air Sports / Island Flyover] Pop every white balloon during the evening.",
    id = 607190, badge = "80", points = 10,
    trigger = is_ingame() &&
              measured(air_sports_island_flyover_get_white_balloons_by_daytime("Evening") == 340,
                       when = is_ingame() &&
                              check_sport_activity("Air Sports", "Island Flyover"),
                       format = "raw") &&
              prev(air_sports_island_flyover_get_white_balloons_by_daytime("Evening")) < 340 &&
              air_sports_island_flyover_get_total_popped_balloons_in_current_flight() > 0
)

achievement(
    title = "Meet Mii at Night", type = "",
    description = "[Air Sports / Island Flyover] Pop every white balloon during the night.",
    id = 607191, badge = "80", points = 10,
    trigger = is_ingame() &&
              measured(air_sports_island_flyover_get_white_balloons_by_daytime("Night") == 209,
                       when = is_ingame() &&
                              check_sport_activity("Air Sports", "Island Flyover"),
                       format = "raw") &&
              prev(air_sports_island_flyover_get_white_balloons_by_daytime("Night")) < 209 &&
              air_sports_island_flyover_get_total_popped_balloons_in_current_flight() > 0
)

achievement(
    title = "Everyone Knows Mii Now", type = "",
    description = "[Air Sports / Island Flyover] Pop every white balloon during the daytime, evening and night.",
    id = 607192, badge = "80", points = 10,
    trigger = is_ingame() &&
              measured(air_sports_island_flyover_get_white_balloons_by_daytime("Daytime")
                     + air_sports_island_flyover_get_white_balloons_by_daytime("Evening")
                     + air_sports_island_flyover_get_white_balloons_by_daytime("Night") == 921,
                       when = is_ingame() &&
                              check_sport_activity("Air Sports", "Island Flyover"),
                       format = "raw") &&
              prev(air_sports_island_flyover_get_white_balloons_by_daytime("Daytime")
                 + air_sports_island_flyover_get_white_balloons_by_daytime("Evening")
                 + air_sports_island_flyover_get_white_balloons_by_daytime("Night")) < 921 &&
              air_sports_island_flyover_get_total_popped_balloons_in_current_flight() > 0
)

achievement(
    title = "Drive to the Hotel Included", type = "",
    description = "[Air Sports / Island Flyover] Successfully land in the pool of the Seaside Hotel.",
    id = 607232, badge = "80", points = 2,
    trigger = is_ingame() &&
              check_sport_activity("Air Sports", "Island Flyover") &&
              air_sports_island_flyover_get_plane_data("Speed", "X-Axis") >= -0.015 &&
              air_sports_island_flyover_get_plane_data("Speed", "X-Axis") <= 0.015 &&
              air_sports_island_flyover_get_plane_data("Speed", "Y-Axis") >= -0.015 &&
              air_sports_island_flyover_get_plane_data("Speed", "Y-Axis") <= 0.015 &&
              air_sports_island_flyover_get_plane_data("Speed", "Z-Axis") >= -0.015 &&
              air_sports_island_flyover_get_plane_data("Speed", "Z-Axis") <= 0.015 &&
              air_sports_island_flyover_get_plane_data("Coordinate", "X-Axis") >= 4850.0 &&
              air_sports_island_flyover_get_plane_data("Coordinate", "X-Axis") <= 5150.0 &&
              air_sports_island_flyover_get_plane_data("Coordinate", "Y-Axis") >= 170.0 &&
              air_sports_island_flyover_get_plane_data("Coordinate", "Y-Axis") <= 185.0 &&
              air_sports_island_flyover_get_plane_data("Coordinate", "Z-Axis") >= -1500.0 &&
              air_sports_island_flyover_get_plane_data("Coordinate", "Z-Axis") <= -900.0
)

achievement(
    title = "Emergency Stop at Town", type = "",
    description = "[Air Sports / Island Flyover] Successfully land in the wishing fountain of Wuhu Town.",
    id = 607233, badge = "80", points = 3,
    trigger = is_ingame() &&
              check_sport_activity("Air Sports", "Island Flyover") &&
              air_sports_island_flyover_get_plane_data("Speed", "X-Axis") >= -0.015 &&
              air_sports_island_flyover_get_plane_data("Speed", "X-Axis") <= 0.015 &&
              air_sports_island_flyover_get_plane_data("Speed", "Y-Axis") >= -0.015 &&
              air_sports_island_flyover_get_plane_data("Speed", "Y-Axis") <= 0.015 &&
              air_sports_island_flyover_get_plane_data("Speed", "Z-Axis") >= -0.015 &&
              air_sports_island_flyover_get_plane_data("Speed", "Z-Axis") <= 0.015 &&
              air_sports_island_flyover_get_plane_data("Coordinate", "X-Axis") >= -2250.0 &&
              air_sports_island_flyover_get_plane_data("Coordinate", "X-Axis") <= -1800.0 &&
              air_sports_island_flyover_get_plane_data("Coordinate", "Y-Axis") >= 65.0 &&
              air_sports_island_flyover_get_plane_data("Coordinate", "Y-Axis") <= 75.0 &&
              air_sports_island_flyover_get_plane_data("Coordinate", "Z-Axis") >= 1850.0 &&
              air_sports_island_flyover_get_plane_data("Coordinate", "Z-Axis") <= 2300.0
)

achievement(
    title = "Screw the Flight Regulations!", type = "",
    description = "[Air Sports / Island Flyover] Perform a total of 30 barrel rolls in a single flight.",
    id = 607234, badge = "80", points = 1,
    trigger = is_ingame() &&
              measured(air_sports_island_flyover_total_barrel_rolls() == 30,
                       when = is_ingame() &&
                              check_sport_activity("Air Sports", "Island Flyover"),
                       format = "raw") &&
              prev(air_sports_island_flyover_total_barrel_rolls()) == 29
)

achievement(
    title = "Just a Casual Flight", type = "",
    description = "[Air Sports / Island Flyover] Finish a flight with balloons and (i) points disabled by holding (2) on the Wiimote while selecting the time of day.",
    id = 607245, badge = "80", points = 1,
    trigger = is_ingame() &&
              check_sport_activity("Air Sports", "Island Flyover") &&
              trigger_when(air_sports_island_flyover_activity_state() == 0x05) &&
              trigger_when(prev(air_sports_island_flyover_activity_state()) == 0x04) &&
              sport_activity_modifier_active("Player 1", "2")
)

//--------------------------------------------------
// Leaderboards

leaderboard(
    id = 162628,
    title       = "Air Sports / Island Flyover", 
    description = "Most (i) points collected in a single flight.",
    start  = is_ingame() &&
             check_sport_activity("Air Sports", "Island Flyover") &&
             air_sports_island_flyover_activity_state() == 0x05 &&
             prev(air_sports_island_flyover_activity_state()) == 0x04,
    cancel = always_false(), 
    submit = always_true(), 
    value  = air_sports_island_flyover_get_total_ipoints_found_in_current_flight(),
    format = "Value",
    lower_is_better = false
)

leaderboard(
    id = 162629,
    title       = "Air Sports / Island Flyover", 
    description = "Most balloons popped in a single flight.",
    start  = is_ingame() &&
             check_sport_activity("Air Sports", "Island Flyover") &&
             air_sports_island_flyover_activity_state() == 0x05 &&
             prev(air_sports_island_flyover_activity_state()) == 0x04,
    cancel = always_false(), 
    submit = always_true(), 
    value  = air_sports_island_flyover_get_total_popped_balloons_in_current_flight(),
    format = "Value",
    lower_is_better = false
)

//--------------------------------------------------
// Rich Presences

rich_presence_conditional_display(
    is_ingame() && check_sport_activity("Air Sports", "Island Flyover"), 
    "The player is flying over Wuhu Island with a plane {0} [ℹ️{1}] [🎈{2}] [⏱️{3}]",
        rich_presence_lookup("FlightDaytime",
                         air_sports_island_flyover_daytime(),
                         air_sports_island_flyover_daytimes,
                         fallback = air_sports_island_flyover_daytimes[0]),
        rich_presence_macro("Number",
                        air_sports_island_flyover_get_total_ipoints_found_in_current_flight()),
        rich_presence_macro("Number",
                        air_sports_island_flyover_get_total_popped_balloons_in_current_flight()),
        rich_presence_macro("Seconds",
                        air_sports_island_flyover_time_left() / 60)
)

rich_presence_display(
    "In the Main Menu"
)