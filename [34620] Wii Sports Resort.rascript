// Wii Sports Resort
// #ID = 34620

//--------------------------------------------------
// Addresses

mem_pointer006F5378 = 0x006f5378
mem_pointer006F5518 = 0x006f5518
mem_pointer006F5538 = 0x006f5538
mem_pointer006F6690 = 0x006f6690
mem_valueR13        = 0x806f87c0

pointerMask = 0x3fffffff

//--------------------------------------------------
// Arrays and Dictionaries

sport_activities = {
    0x00000005: ["Swordplay", "Duel"],
    0x00000006: ["Swordplay", "Speed Slice"],
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

sport_levels = {
    0x1AC: ["Swordplay", "Showdown"],
    0x1F7: ["Swordplay", "Duel"],
    0x242: ["Swordplay", "Speed Slice"],
    0x28D: ["Power Cruising", "Slalom Course"],
    0x2D8: ["Archery", ""],
    0x323: ["Frisbee", "Frisbee Dog"],
    0x36E: ["Basketball", "3-Point Contest"],
    0x3B9: ["Basketball", "3-on-3 Game"], 
    0x404: ["Bowling", "10-Pin Game"],
    0x44F: ["Bowling", "100-Pin Game"],
    0x49A: ["Bowling", "Spin Control"],
    0x4E5: ["Canoeing", "Speed Challenge"],
    0x530: ["Table Tennis", "Return Challenge"],
    0x57B: ["Table Tennis", "Match"],
    0x5C6: ["Wakeboarding", ""],
    0x611: ["Golf", ""],
    0x65C: ["Frisbee", "Frisbee Golf"],
    0x6A7: ["Cycling", "Road Race"],
    0x6F2: ["Air Sports", "Skydiving"],
}

players = {
    0x01: "1 Player",
    0x02: "2 Players",
    0x03: "3 Players",
    0x04: "4 Players",
}

activity_courses = {
    0x00: "Beginner",
    0x01: "Intermediate",
    0x02: "Expert"
}

air_sports_island_flyover_daytimes = {
    0x00: "at daytime",
    0x01: "in the evening",
    0x02: "through the night"
}

letters_utf16 = {
    0x004C: "L",
    0x004D: "M",
    0x0061: "a",
    0x0063: "c",
    0x0074: "t",
    0x0075: "u",
    0x00ED: "í",
}

//--------------------------------------------------
// Functions

function is_ingame() {
    return dword_be(mem_pointer006F5518) != 0x00 &&
           prev(dword_be(mem_pointer006F5518)) != 0x00 &&
           get_mii_name("Player 1") != 0x00 &&
           prev(get_mii_name("Player 1") != 0x00)
}

function get_activity_difficulty() {
    return dword_be((dword_be(mem_pointer006F5538) & pointerMask) + 0x1C)
}

function is_paused() {
    return byte(mem_valueR13 - 0x800038E0) == 0x00 // Works when paused ingame and via Wii Menu
}

function get_mii_name(player) {
    return dword_be(get_mii_savedata_path(player) + 0x04)
}

function get_opponent_mii_name(name) {
    letter_array = []
    for letter in range(0, length(name)) {
        current_letter = substring(name, letter, 1)
        for letter_utf16 in letters_utf16 {
            if (letters_utf16[letter_utf16] == current_letter) {
                array_push(letter_array, letter_utf16)
            }
        }
    }
    code = always_true()
    address_path = (dword_be((dword_be((dword_be((dword_be((dword_be(mem_pointer006F5518) & 0x3fffffff) + 0xE4) & 0x3fffffff) + 0x138) & 0x3fffffff) + 0xB8) & 0x3fffffff) + 0x08) & 0x3fffffff) + 0x70
    array_index = 0
    for letter in letter_array {
        code = code && word_be(address_path + array_index * 2) == letter
        array_index = array_index + 1
    }
    return code
}

function get_opponent_mii_ID() {
    return dword_be((dword_be((dword_be((dword_be((dword_be((dword_be(mem_pointer006F5518) & 0x3fffffff) + 0xE4) & 0x3fffffff) + 0x138) & 0x3fffffff) + 0xB8) & 0x3fffffff) + 0x08) & 0x3fffffff) + 0xC4)
}

function pseudo_impossible_condition() {
    return dword_be((dword_be((dword_be(mem_pointer006F5378) & 0x3fffffff) + 0x10) & 0x3fffffff) + 0x0C) == 0xFFFFFFFF
}

function amount_players() {
    return dword_be((dword_be(mem_pointer006F5378) & 0x3fffffff) + 0x08)
}

function is_team_play() {
    return dword_be((dword_be(mem_pointer006F5538) & pointerMask) + 0x20) == 0x00
}

function sport_activity_modifier_active(player, button) {
           if (player == "Player 1") {
        offset = 0x38A + 0xF0 * 0
    } else if (player == "Player 2") {
        offset = 0x38A + 0xF0 * 1
    } else if (player == "Player 3") {
        offset = 0x38A + 0xF0 * 2
    } else if (player == "Player 4") {
        offset = 0x38A + 0xF0 * 3
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

function get_mii_savedata_path(player) {
    if(player == "Player 1") {
        offset = 0x0C
    } else 
    if(player == "Player 2") {
        offset = 0x1C
    } else 
    if(player == "Player 3") {
        offset = 0x2C
    } else 
    if(player == "Player 4") {
        offset = 0x3C 
    }
    return (dword_be((dword_be((dword_be(mem_pointer006F5378) & 0x3fffffff) + 0x10) & 0x3fffffff) + offset) & pointerMask)
}


function check_sport_activity(sport, mode) {
    sport_activity_objects = array_filter(sport_activities, sport_activity => sport_activities[sport_activity][0] == sport &&
                                                                              sport_activities[sport_activity][1] == mode)                                           
    return any_of(sport_activity_objects, sport_activity_ID => dword_be((dword_be(mem_pointer006F5538) & pointerMask) + 0x14) == (sport_activity_ID & 0xffff0000) / 0x10000 && 
                                                               dword_be((dword_be(mem_pointer006F5538) & pointerMask) + 0x18) == (sport_activity_ID & 0x0000ffff))
}

function get_sport_activity_level(sport, mode, player) {
    sport_activity_objects = array_filter(sport_levels, sport_level => sport_levels[sport_level][0] == sport &&
                                                                       sport_levels[sport_level][1] == mode)                                              
    return any_of(sport_activity_objects, sport_activity_offset => byte(get_mii_savedata_path(player) + sport_activity_offset)
                                                                 + low4(get_mii_savedata_path(player) + sport_activity_offset + 0x02) * 0x100)
}

// Swordplay / Speed Slice

function swordplay_speed_slice_activity_state() {
    return dword_be((dword_be((dword_be(mem_pointer006F5518) & 0x3fffffff) + 0x174) & 0x3fffffff) + 0x174)
}

function swordplay_speed_slice_turn() {
    return dword_be((dword_be((dword_be(mem_pointer006F6690) & 0x3fffffff) + 0x180) & 0x3fffffff) + 0x20)
}

function swordplay_speed_slice_player_points(player) {
    if (player == "Player 1") {
        offset = 0x18
    } else if (player == "Player 2") {
        offset = 0x1C
    }
    return dword_be((dword_be((dword_be(mem_pointer006F6690) & 0x3fffffff) + 0x180) & 0x3fffffff) + offset)
}

function swordplay_speed_slice_player_slices_made(player) {
    if (player == "Player 1") {
        offset = 0x24
    } else if (player == "Player 2") {
        offset = 0x28
    }
    return dword_be((dword_be((dword_be(mem_pointer006F6690) & 0x3fffffff) + 0x180) & 0x3fffffff) + offset)
}

function swordplay_speed_slice_player_slices_failed(player) {
    if (player == "Player 1") {
        offset = 0x2C
    } else if (player == "Player 2") {
        offset = 0x30
    }
    return dword_be((dword_be((dword_be(mem_pointer006F6690) & 0x3fffffff) + 0x180) & 0x3fffffff) + offset)
}

function swordplay_speed_slice_referee_state_ID() {
    return dword_be((dword_be((dword_be((dword_be(mem_pointer006F6690) & 0x3fffffff) + 0x180) & 0x3fffffff) + 0x14) & 0x3fffffff) + 0x48)
}

function swordplay_speed_slice_player_object_slice_flags_in_savefile(player) {
    if (player == "Player 1") {
        offset = 0x0C
    } else if (player == "Player 2") {
        offset = 0x1C
    }
    return bit0(get_mii_savedata_path("Player 1") + 0x789)
         + bit1(get_mii_savedata_path("Player 1") + 0x789)
         + bitcount(get_mii_savedata_path("Player 1") + 0x78A)
         + bitcount(get_mii_savedata_path("Player 1") + 0x78B)
}

function swordplay_speed_slice_player_1_object_slice_flags_ingame() {
    return bit0((dword_be((dword_be(mem_pointer006F6690) & 0x3fffffff) + 0x180) & 0x3fffffff) + 0x35)
         + bit1((dword_be((dword_be(mem_pointer006F6690) & 0x3fffffff) + 0x180) & 0x3fffffff) + 0x35)
         + bitcount((dword_be((dword_be(mem_pointer006F6690) & 0x3fffffff) + 0x180) & 0x3fffffff) + 0x36)
         + bitcount((dword_be((dword_be(mem_pointer006F6690) & 0x3fffffff) + 0x180) & 0x3fffffff) + 0x37)
}

function swordplay_speed_slice_player_1_hit_object_midair() {
    return dword_be((dword_be((dword_be(mem_pointer006F6690) & 0x3fffffff) + 0x180) & 0x3fffffff) + 0x38) == 0x01 &&
           prev(dword_be((dword_be((dword_be(mem_pointer006F6690) & 0x3fffffff) + 0x180) & 0x3fffffff) + 0x38)) == 0x00
}

function swordplay_speed_slice_unlit_candle_and_get_point(player) {
    if (player == "Player 1") {
        offset = 0x88
        codePoints = swordplay_speed_slice_player_points("Player 1") == prev(swordplay_speed_slice_player_points("Player 1")) + 1
    } else if (player == "Player 2") {
        offset = 0x8C
        codePoints = swordplay_speed_slice_player_points("Player 2") == prev(swordplay_speed_slice_player_points("Player 2")) + 1
    }
    return once(dword_be((dword_be((dword_be((dword_be((dword_be(mem_pointer006F6690) & 0x3fffffff) + 0x180) & 0x3fffffff) + 0x14) & 0x3fffffff) + offset) & 0x3fffffff) + 0xF8) == 0x0D &&
                dword_be((dword_be((dword_be((dword_be((dword_be((dword_be(mem_pointer006F6690) & 0x3fffffff) + 0x180) & 0x3fffffff) + 0x14) & 0x3fffffff) + 0x88) & 0x3fffffff) + 0x12C) & 0x3fffffff) + 0x14) == 0x02 &&
                prev(dword_be((dword_be((dword_be((dword_be((dword_be((dword_be(mem_pointer006F6690) & 0x3fffffff) + 0x180) & 0x3fffffff) + 0x14) & 0x3fffffff) + 0x88) & 0x3fffffff) + 0x12C) & 0x3fffffff) + 0x14)) == 0x01) &&
           codePoints
           
}

function swordplay_speed_slice_player_1_hit_alarm_clock_with_double_digit() {
    return dword_be((dword_be((dword_be(mem_pointer006F6690) & 0x3fffffff) + 0x180) & 0x3fffffff) + 0x3C) == 0x01 &&
           prev(dword_be((dword_be((dword_be(mem_pointer006F6690) & 0x3fffffff) + 0x180) & 0x3fffffff) + 0x3C)) == 0x00
}

function swordplay_speed_slice_object_ID_of_current_round() {
    return dword_be((dword_be((dword_be((dword_be(mem_pointer006F6690) & 0x3fffffff) + 0x180) & 0x3fffffff) + 0x14) & 0x3fffffff) + 0xB0)
}

// Archery

function archery_activity_state() {
    return dword_be((dword_be((dword_be(mem_pointer006F5518) & 0x3fffffff) + 0x140) & 0x3fffffff) + 0x12C)
}

function archery_get_current_player() {
    return dword_be((dword_be((dword_be(mem_pointer006F5518) & 0x3fffffff) + 0x140) & 0x3fffffff) + 0x1B4)
}

function archery_get_current_stage() {
    return byte((dword_be((dword_be(mem_pointer006F5518) & 0x3fffffff) + 0x140) & 0x3fffffff) + 0x1A8)
}

function archery_get_total_target_hits_of_player(player) {
    offset = 0x00
    if(player == "Player 1") {
        offset = 0x00
    } else 
    if(player == "Player 2") {
        offset = 0x04
    } else 
    if(player == "Player 3") {
        offset = 0x08
    } else 
    if(player == "Player 4") {
        offset = 0x0C 
    }
    return dword_be((dword_be((dword_be(mem_pointer006F5518) & 0x3fffffff) + 0x140) & 0x3fffffff) + 0x200 + offset)
}

function archery_get_total_arrows_shot_by_current_player_in_stage() {
    return byte((dword_be((dword_be((dword_be(mem_pointer006F5518) & 0x3fffffff) + 0x174) & 0x3fffffff) + 0xD0) & 0x3fffffff) + 0x118)
}

function archery_get_current_arrow_shot_of_player(player) {
    offset = 0x00
    if(player == "Player 1") {
        offset = 0x00
    } else 
    if(player == "Player 2") {
        offset = 0x04
    } else 
    if(player == "Player 3") {
        offset = 0x08
    } else 
    if(player == "Player 4") {
        offset = 0x0C 
    }
    return dword_be((dword_be((dword_be((dword_be((dword_be((dword_be(mem_pointer006F5518) & 0x3fffffff) + 0x154) & 0x3fffffff) + 0x48) & 0x3fffffff) + offset) & 0x3fffffff) + 0x5E0) & 0x3fffffff) + 0x40)
}

function archery_get_player_stage_score(player, stage, shot) {
    offset = 0x00
    if(player == "Player 1") {
        offset = 0x00
    } else 
    if(player == "Player 2") {
        offset = 0x04
    } else 
    if(player == "Player 3") {
        offset = 0x08
    } else 
    if(player == "Player 4") {
        offset = 0x0C 
    }
    return dword_be((dword_be((dword_be((dword_be((dword_be((dword_be(mem_pointer006F5518) & 0x3fffffff) + 0x174) & 0x3fffffff) + 0xF4) & 0x3fffffff) + offset) & 0x3fffffff) + (stage - 1) * 4) & 0x3fffffff) + (shot - 1))
}

function archery_get_player_total_score(player) {
    offset = 0x00
    if(player == "Player 1") {
        offset = 0x00
    } else 
    if(player == "Player 2") {
        offset = 0x04
    } else 
    if(player == "Player 3") {
        offset = 0x08
    } else 
    if(player == "Player 4") {
        offset = 0x0C 
    }
    return dword_be((dword_be((dword_be((dword_be(mem_pointer006F5518) & 0x3fffffff) + 0x174) & 0x3fffffff) + 0xF8) & 0x3fffffff) + offset)
}

function archery_get_10_point_zone_combo() {
    return byte((dword_be((dword_be(mem_pointer006F5518) & 0x3fffffff) + 0x140) & 0x3fffffff) + 0x1E8)
}

function archery_get_points_of_last_arrow_shot() {
    return byte((dword_be((dword_be(mem_pointer006F5518) & 0x3fffffff) + 0x140) & 0x3fffffff) + 0x1BC)
}

function archery_get_secret_target_flag_of_player(player, bitflag) {
    offset = 0x00
    if(player == "Player 1") {
        offset = 0x00
    } else 
    if(player == "Player 2") {
        offset = 0x04
    } else 
    if(player == "Player 3") {
        offset = 0x08
    } else 
    if(player == "Player 4") {
        offset = 0x0C 
    }
    address = (dword_be((dword_be(mem_pointer006F5518) & 0x3fffffff) + 0x140) & 0x3fffffff) + 0x1F0 + offset + 0x03
    return bit(bitflag % 8, address - (bitflag / 8))
}

function archery_get_secret_targets_of_player(player) {
    savefile_secret_targets = get_mii_savedata_path(player) + 0x7E4
    return tally(12,
                 once(archery_get_secret_target_flag_of_player(player, 0x00) + bit0(savefile_secret_targets + 0x03) >= 1),
                 once(archery_get_secret_target_flag_of_player(player, 0x01) + bit1(savefile_secret_targets + 0x03) >= 1),
                 once(archery_get_secret_target_flag_of_player(player, 0x02) + bit2(savefile_secret_targets + 0x03) >= 1),
                 once(archery_get_secret_target_flag_of_player(player, 0x03) + bit3(savefile_secret_targets + 0x03) >= 1),
                 once(archery_get_secret_target_flag_of_player(player, 0x04) + bit4(savefile_secret_targets + 0x03) >= 1),
                 once(archery_get_secret_target_flag_of_player(player, 0x05) + bit5(savefile_secret_targets + 0x03) >= 1),
                 once(archery_get_secret_target_flag_of_player(player, 0x06) + bit6(savefile_secret_targets + 0x03) >= 1),
                 once(archery_get_secret_target_flag_of_player(player, 0x07) + bit7(savefile_secret_targets + 0x03) >= 1),
                 once(archery_get_secret_target_flag_of_player(player, 0x08) + bit0(savefile_secret_targets + 0x02) >= 1),
                 once(archery_get_secret_target_flag_of_player(player, 0x09) + bit1(savefile_secret_targets + 0x02) >= 1),
                 once(archery_get_secret_target_flag_of_player(player, 0x0A) + bit2(savefile_secret_targets + 0x02) >= 1),
                 once(archery_get_secret_target_flag_of_player(player, 0x0B) + bit3(savefile_secret_targets + 0x02) >= 1)
    )
}

function archery_get_secret_targets_of_player_save(player) {
    return bit0(get_mii_savedata_path(player) + 0x7E4 + 0x03)
         + bit1(get_mii_savedata_path(player) + 0x7E4 + 0x03)
         + bit2(get_mii_savedata_path(player) + 0x7E4 + 0x03)
         + bit3(get_mii_savedata_path(player) + 0x7E4 + 0x03)
         + bit4(get_mii_savedata_path(player) + 0x7E4 + 0x03)
         + bit5(get_mii_savedata_path(player) + 0x7E4 + 0x03)
         + bit6(get_mii_savedata_path(player) + 0x7E4 + 0x03)
         + bit7(get_mii_savedata_path(player) + 0x7E4 + 0x03)
         + bit0(get_mii_savedata_path(player) + 0x7E4 + 0x02)
         + bit1(get_mii_savedata_path(player) + 0x7E4 + 0x02)
         + bit2(get_mii_savedata_path(player) + 0x7E4 + 0x02)
         + bit3(get_mii_savedata_path(player) + 0x7E4 + 0x02)
}

function archery_flags_of_secret_targets_of_player_playthrough_reset(player) {
  offset = 0x00
    if(player == "Player 1") {
        offset = 0x00
    } else 
    if(player == "Player 2") {
        offset = 0x04
    } else 
    if(player == "Player 3") {
        offset = 0x08
    } else 
    if(player == "Player 4") {
        offset = 0x0C 
    }  
    return dword_be((dword_be((dword_be(mem_pointer006F5518) & 0x3fffffff) + 0x140) & 0x3fffffff) + 0x1F0 + offset) < prev(dword_be((dword_be((dword_be(mem_pointer006F5518) & 0x3fffffff) + 0x140) & 0x3fffffff) + 0x1F0 + offset))
}

function archery_special_activity_state() {
    return dword_be((dword_be((dword_be(mem_pointer006F5518) & 0x3fffffff) + 0x140) & 0x3fffffff) + 0x1D8)
}

function archery_current_arrow_hit_secret_target() {
    return archery_get_total_arrows_shot_by_current_player_in_stage() > prev(archery_get_total_arrows_shot_by_current_player_in_stage()) &&
           archery_get_10_point_zone_combo() == prev(archery_get_10_point_zone_combo) &&
           archery_get_points_of_last_arrow_shot() == 10
}

// Air Sports / Island Flyover

function air_sports_island_flyover_activity_state() {
    return byte((dword_be((dword_be(mem_pointer006F5518) & 0x3fffffff) + 0x144) & 0x3fffffff) + 0x08)
}

function air_sports_island_flyover_daytime() {
    return get_activity_difficulty()
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
    return byte(get_mii_savedata_path("Player 1") + 0xC2B)
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
        code = code + bit(time, get_mii_savedata_path("Player 1") + 0xC7C + ipoint)
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
        code = code + bit(white_balloon % 8, get_mii_savedata_path("Player 1") + 0xCCC + flag_offset + white_balloon / 8)
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

// Swordplay / Speed Slice

achievement(
    title = "Sharp Minded", type = "progression",
    description = "[Swordplay / Speed Slice] Reach Pro Class by getting a level of 1,000 or higher.",
    id = 608583, badge = "80", points = 10,
    trigger = measured(get_sport_activity_level("Swordplay", "Speed Slice", "Player 1") >= 1000,
                       when = is_ingame() &&
                              check_sport_activity("Swordplay", "Speed Slice"),
                       format = "raw") &&
              prev(get_sport_activity_level("Swordplay", "Speed Slice", "Player 1")) >= 750 &&
              prev(get_sport_activity_level("Swordplay", "Speed Slice", "Player 1")) < 1000
)

achievement(
    title = "Master of Sword, Not a Fraud", type = "progression",
    description = "[Swordplay / Speed Slice] Reach Superstar Class by getting a level of 2,000 or higher.",
    id = 608584, badge = "80", points = 25,
    trigger = measured(get_sport_activity_level("Swordplay", "Speed Slice", "Player 1") >= 2000,
                       when = is_ingame() &&
                              check_sport_activity("Swordplay", "Speed Slice"),
                       format = "raw") &&
              prev(get_sport_activity_level("Swordplay", "Speed Slice", "Player 1")) >= 1750 &&
              prev(get_sport_activity_level("Swordplay", "Speed Slice", "Player 1")) < 2000
)

achievement(
    title = "Precession King", type = "",
    description = "[Swordplay / Speed Slice] Win a contest without missing an object by slicing it in the wrong way in Single Player Mode.",
    id = 607445, badge = "80", points = 5,
    trigger = is_ingame() &&
              amount_players() == 1 &&
              check_sport_activity("Swordplay", "Speed Slice") &&
              swordplay_speed_slice_activity_state() >= 0x0C &&
              swordplay_speed_slice_activity_state() <= 0x0F &&
              trigger_when(swordplay_speed_slice_activity_state() == 0x0F) &&
              trigger_when(prev(swordplay_speed_slice_activity_state()) == 0x0E) &&
              trigger_when(swordplay_speed_slice_player_points("Player 1") == 10) &&
              swordplay_speed_slice_player_slices_failed("Player 1") == 0
)

achievement(
    title = "Slicing for the Adrenaline", type = "",
    description = "[Swordplay / Speed Slice] Win a contest by slicing a total of 19 objects correctly in Single Player Mode.",
    id = 608974, badge = "80", points = 5,
    trigger = is_ingame() &&
              amount_players() == 1 &&
              check_sport_activity("Swordplay", "Speed Slice") &&
              swordplay_speed_slice_activity_state() >= 0x0C &&
              swordplay_speed_slice_activity_state() <= 0x0F &&
              ((trigger_when(pseudo_impossible_condition()) &&
                trigger_when(swordplay_speed_slice_activity_state() == 0x0F) &&
                trigger_when(prev(swordplay_speed_slice_activity_state()) == 0x0E) &&
                trigger_when(swordplay_speed_slice_player_points("Player 1") == 10) &&
                swordplay_speed_slice_player_slices_failed("Player 1") == 0) ||
               (swordplay_speed_slice_player_points("Player 1") == 10 &&
                measured(swordplay_speed_slice_player_slices_made("Player 1")
                       - swordplay_speed_slice_player_slices_failed("Player 1") == 19,
                         when = is_ingame() &&
                                check_sport_activity("Swordplay", "Speed Slice") &&
                                amount_players() == 1 &&
                                swordplay_speed_slice_player_slices_failed("Player 1") == 0)))
)

achievement(
    title = "The Slice of Life", type = "",
    description = "[Swordplay / Speed Slice] Slice every object correctly and faster than your opponent at least once throughout multiple contests in Single Player Mode.",
    id = 607489, badge = "80", points = 10,
    trigger = ((measured(swordplay_speed_slice_player_1_object_slice_flags_ingame() == 18,
                         when = is_ingame() &&
                                check_sport_activity("Swordplay", "Speed Slice") &&
                                amount_players() == 1 &&
                                swordplay_speed_slice_activity_state() >= 0x0C &&
                                swordplay_speed_slice_activity_state() <= 0x0F)) ||
               (pseudo_impossible_condition() &&
                measured(swordplay_speed_slice_player_object_slice_flags_in_savefile("Player 1") == 18,
                         when = is_ingame() &&
                                check_sport_activity("Swordplay", "Speed Slice") &&
                                amount_players() <= 2)) ||
               (pseudo_impossible_condition() &&
                measured(swordplay_speed_slice_player_object_slice_flags_in_savefile("Player 2") == 18,
                         when = is_ingame() &&
                                check_sport_activity("Swordplay", "Speed Slice") &&
                                amount_players() == 2)))
)

achievement(
    title = "Faster Then the Own Shadow", type = "",
    description = "[Swordplay / Speed Slice] Successfully slice an object before it touches the ground in Single Player Mode.",
    id = 607490, badge = "80", points = 3,
    trigger = is_ingame() &&
              amount_players() == 1 &&
              check_sport_activity("Swordplay", "Speed Slice") &&
              swordplay_speed_slice_activity_state() >= 0x0D &&
              swordplay_speed_slice_activity_state() <= 0x0E &&
              swordplay_speed_slice_player_1_hit_object_midair()
)

achievement(
    title = "Cutting Through Air", type = "",
    description = "[Swordplay / Speed Slice] Put out the flame of a candle before successfully slicing it while still being faster than the opponent and in Single Player Mode.",
    id = 607492, badge = "80", points = 3,
    trigger = is_ingame() &&
              amount_players() == 1 &&
              check_sport_activity("Swordplay", "Speed Slice") &&
              swordplay_speed_slice_activity_state() >= 0x0D &&
              swordplay_speed_slice_activity_state() <= 0x0E &&
              trigger_when(swordplay_speed_slice_unlit_candle_and_get_point("Player 1")) &&
              swordplay_speed_slice_object_ID_of_current_round() == 0x0D &&
              never(swordplay_speed_slice_turn() != prev(swordplay_speed_slice_turn())) &&
              never(swordplay_speed_slice_activity_state() < 0x0D) &&
              never(swordplay_speed_slice_activity_state() > 0x0E)
)

achievement(
    title = "Prime Time", type = "",
    description = "[Swordplay / Speed Slice] Successfully slice an alarm clock while it shows double digits in Single Player Mode.",
    id = 607491, badge = "80", points = 5,
    trigger = is_ingame() &&
              amount_players() == 1 &&
              check_sport_activity("Swordplay", "Speed Slice") &&
              swordplay_speed_slice_activity_state() >= 0x0D &&
              swordplay_speed_slice_activity_state() <= 0x0E &&
              trigger_when(swordplay_speed_slice_player_1_hit_alarm_clock_with_double_digit()) &&
              swordplay_speed_slice_object_ID_of_current_round() == 0x10
)

achievement(
    title = "My Blade Is Never Late", type = "",
    description = "[Swordplay / Speed Slice] Slice an object successfully almost at the same time as the opponent and get the point credited in Single Player Mode.",
    id = 608975, badge = "80", points = 2,
    trigger = is_ingame() &&
              amount_players() == 1 &&
              check_sport_activity("Swordplay", "Speed Slice") &&
              swordplay_speed_slice_activity_state() >= 0x0D &&
              swordplay_speed_slice_activity_state() <= 0x0E &&
              swordplay_speed_slice_referee_state_ID() == 0x08 &&
              prev(swordplay_speed_slice_referee_state_ID()) == 0x07 &&
              swordplay_speed_slice_player_points("Player 1") > prev(swordplay_speed_slice_player_points("Player 1"))
)

achievement(
    title = "A Matter of Time", type = "",
    description = "[Swordplay / Speed Slice] Defeat the champion Matt in a contest.",
    id = 608693, badge = "80", points = 10,
    trigger = is_ingame() &&
              amount_players() == 1 &&
              check_sport_activity("Swordplay", "Speed Slice") &&
              get_opponent_mii_ID() == 0x00 &&
              get_opponent_mii_name("Matt") &&
              swordplay_speed_slice_activity_state() >= 0x0C &&
              swordplay_speed_slice_activity_state() <= 0x0F &&
              trigger_when(swordplay_speed_slice_player_points("Player 1") > swordplay_speed_slice_player_points("Player 2")) &&
              trigger_when(prev(swordplay_speed_slice_activity_state() == 0x0E)) &&
              trigger_when(swordplay_speed_slice_activity_state() == 0x0F)
)

achievement(
    title = "The Matt-man I Am", type = "",
    description = "[Swordplay / Speed Slice] Defeat the champion Matt in a contest without pausing.",
    id = 608694, badge = "80", points = 10,
    trigger = is_ingame() &&
              amount_players() == 1 &&
              check_sport_activity("Swordplay", "Speed Slice") &&
              get_opponent_mii_ID() == 0x00 &&
              get_opponent_mii_name("Matt") &&
              swordplay_speed_slice_activity_state() >= 0x0C &&
              swordplay_speed_slice_activity_state() <= 0x0F &&
              trigger_when(swordplay_speed_slice_player_points("Player 1") > swordplay_speed_slice_player_points("Player 2")) &&
              trigger_when(prev(swordplay_speed_slice_activity_state() == 0x0E)) &&
              trigger_when(swordplay_speed_slice_activity_state() == 0x0F) && 
              once(prev(swordplay_speed_slice_activity_state() != 0x0C) &&
                        swordplay_speed_slice_activity_state() == 0x0C &&
                   never(swordplay_speed_slice_activity_state() >= 0x0D && 
                         swordplay_speed_slice_activity_state() <= 0x0F && 
                         is_paused())) 
)

// Archery

achievement(
    title = "Princess Miirida", type = "progression",
    description = "[Archery] Reach Pro Class by getting a level of 1,000 or higher.",
    id = 611780, badge = "80", points = 10,
    trigger = (measured(get_sport_activity_level("Archery", "", "Player 1") >= 1000,
                        when = is_ingame() &&
                               check_sport_activity("Archery", "") &&
                               amount_players() >= 1,
                        format = "raw") &&
               prev(get_sport_activity_level("Archery", "", "Player 1")) >= 500 &&
               prev(get_sport_activity_level("Archery", "", "Player 1")) < 1000) ||
              (measured(get_sport_activity_level("Archery", "", "Player 2") >= 1000,
                        when = is_ingame() &&
                               check_sport_activity("Archery", "") &&
                               amount_players() >= 2,
                        format = "raw") &&
               prev(get_sport_activity_level("Archery", "", "Player 2")) >= 500 &&
               prev(get_sport_activity_level("Archery", "", "Player 2")) < 1000) ||
              (measured(get_sport_activity_level("Archery", "", "Player 3") >= 1000,
                        when = is_ingame() &&
                               check_sport_activity("Archery", "") &&
                               amount_players() >= 3,
                        format = "raw") &&
               prev(get_sport_activity_level("Archery", "", "Player 3")) >= 500 &&
               prev(get_sport_activity_level("Archery", "", "Player 3")) < 1000) ||
              (measured(get_sport_activity_level("Archery", "", "Player 4") >= 1000,
                        when = is_ingame() &&
                               check_sport_activity("Archery", "") &&
                               amount_players() >= 4,
                        format = "raw") &&
               prev(get_sport_activity_level("Archery", "", "Player 4")) >= 500 &&
               prev(get_sport_activity_level("Archery", "", "Player 4")) < 1000)
)

achievement(
    title = "Bow Down Before Me", type = "progression",
    description = "[Archery] Reach Superstar Class by getting a level of 2,000 or higher.",
    id = 611781, badge = "80", points = 25,
    trigger = (measured(get_sport_activity_level("Archery", "", "Player 1") >= 2000,
                        when = is_ingame() &&
                               check_sport_activity("Archery", "") &&
                               amount_players() >= 1,
                        format = "raw") &&
               prev(get_sport_activity_level("Archery", "", "Player 1")) >= 1500 &&
               prev(get_sport_activity_level("Archery", "", "Player 1")) < 2000) ||
              (measured(get_sport_activity_level("Archery", "", "Player 2") >= 2000,
                        when = is_ingame() &&
                               check_sport_activity("Archery", "") &&
                               amount_players() >= 2,
                        format = "raw") &&
               prev(get_sport_activity_level("Archery", "", "Player 2")) >= 1500 &&
               prev(get_sport_activity_level("Archery", "", "Player 2")) < 2000) ||
              (measured(get_sport_activity_level("Archery", "", "Player 3") >= 2000,
                        when = is_ingame() &&
                               check_sport_activity("Archery", "") &&
                               amount_players() >= 3,
                        format = "raw") &&
               prev(get_sport_activity_level("Archery", "", "Player 3")) >= 1500 &&
               prev(get_sport_activity_level("Archery", "", "Player 3")) < 2000) ||
              (measured(get_sport_activity_level("Archery", "", "Player 4") >= 2000,
                        when = is_ingame() &&
                               check_sport_activity("Archery", "") &&
                               amount_players() >= 4,
                        format = "raw") &&
               prev(get_sport_activity_level("Archery", "", "Player 4")) >= 1500 &&
               prev(get_sport_activity_level("Archery", "", "Player 4")) < 2000)
)

achievement(
    title = "Hitting It Just Right", type = "",
    description = "[Archery] Hit all three arrow shots of a stage in the 10-point zone on the target without using Team Play.",
    id = 610382, badge = "80", points = 3,
    trigger = never(!is_ingame()) &&
              never(!check_sport_activity("Archery", "")) &&
              trigger_when(archery_get_10_point_zone_combo() == 3) &&
              trigger_when(prev(archery_get_10_point_zone_combo()) == 2) &&
              once(archery_activity_state() >= 0x01 &&
                   archery_activity_state() <= 0x02 &&
                   archery_get_total_arrows_shot_by_current_player_in_stage() == 0) &&
              never(archery_get_total_arrows_shot_by_current_player_in_stage() != archery_get_10_point_zone_combo()) &&
              never(is_team_play())
)

achievement(
    title = "Never Losing Your Target", type = "",
    description = "[Archery] Hit every arrow shot of a game on the target or a secret target without using Team Play.",
    id = 610413, badge = "80", points = 10,
    trigger = never(!is_ingame()) &&
              never(!check_sport_activity("Archery", "")) &&
              never(is_team_play()) &&
              trigger_when(archery_get_total_arrows_shot_by_current_player_in_stage() == 0x03) &&
              trigger_when(prev(archery_get_total_arrows_shot_by_current_player_in_stage()) == 0x02) &&
              trigger_when(archery_get_current_stage() == 0x03) && 
              ((archery_get_current_player() == 0x00 &&
                once(archery_get_current_player() == 0x00 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x00 &&
                           archery_get_points_of_last_arrow_shot() == 0 &&
                           archery_get_total_arrows_shot_by_current_player_in_stage() > prev(archery_get_total_arrows_shot_by_current_player_in_stage())))) ||
               (archery_get_current_player() == 0x01 &&
                once(archery_get_current_player() == 0x00 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x01 &&
                           archery_get_points_of_last_arrow_shot() == 0 &&
                           archery_get_total_arrows_shot_by_current_player_in_stage() > prev(archery_get_total_arrows_shot_by_current_player_in_stage())))) ||
               (archery_get_current_player() == 0x02 &&
                once(archery_get_current_player() == 0x00 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x02 &&
                           archery_get_points_of_last_arrow_shot() == 0 &&
                           archery_get_total_arrows_shot_by_current_player_in_stage() > prev(archery_get_total_arrows_shot_by_current_player_in_stage())))) ||
               (archery_get_current_player() == 0x03 &&
                once(archery_get_current_player() == 0x00 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x03 &&
                           archery_get_points_of_last_arrow_shot() == 0 &&
                           archery_get_total_arrows_shot_by_current_player_in_stage() > prev(archery_get_total_arrows_shot_by_current_player_in_stage())))))
)

achievement(
    title = "Shot of the Century", type = "",
    description = "[Archery] Hit the target a total of 100 times.",
    id = 610415, badge = "80", points = 5,
    trigger = amount_players() <= 4 &&
              ((measured(archery_get_total_target_hits_of_player("Player 1") == 100,
                         when = is_ingame() &&
                                check_sport_activity("Archery", "") &&
                                amount_players() >= 1,
                         format = "raw") &&
                prev(archery_get_total_target_hits_of_player("Player 1")) == 99) ||
               (measured(archery_get_total_target_hits_of_player("Player 2") == 100,
                         when = is_ingame() &&
                                check_sport_activity("Archery", "") &&
                                amount_players() >= 2,
                         format = "raw") &&
                prev(archery_get_total_target_hits_of_player("Player 2")) == 99) ||
               (measured(archery_get_total_target_hits_of_player("Player 3") == 100,
                         when = is_ingame() &&
                                check_sport_activity("Archery", "") &&
                                amount_players() >= 3,
                         format = "raw") &&
                prev(archery_get_total_target_hits_of_player("Player 3")) == 99) ||
               (measured(archery_get_total_target_hits_of_player("Player 4") == 100,
                         when = is_ingame() &&
                                check_sport_activity("Archery", "") &&
                                amount_players() == 4,
                         format = "raw") &&
                prev(archery_get_total_target_hits_of_player("Player 4")) == 99))
)

achievement(
    title = "Fruity Shish Kebab", type = "",
    description = "[Archery] Hit the secret target on every stage across all three courses throughout multiple contests.",
    id = 610713, badge = "80", points = 10,
    trigger = never(!is_ingame()) &&
              never(!check_sport_activity("Archery", "")) &&
              amount_players() <= 4 &&
              never(amount_players() >= 1 &&
                    archery_flags_of_secret_targets_of_player_playthrough_reset("Player 1")) &&
              never(amount_players() >= 2 &&
                    archery_flags_of_secret_targets_of_player_playthrough_reset("Player 2")) &&
              never(amount_players() >= 3 &&
                    archery_flags_of_secret_targets_of_player_playthrough_reset("Player 3")) &&
              never(amount_players() >= 4 &&
                    archery_flags_of_secret_targets_of_player_playthrough_reset("Player 4")) &&
              ((measured(archery_get_secret_targets_of_player("Player 1"),
                         when = is_ingame() &&
                                check_sport_activity("Archery", "") &&
                                amount_players() >= 1,
                         format = "raw") &&
                archery_get_secret_targets_of_player_save("Player 1") >= 8 &&
                archery_get_secret_targets_of_player_save("Player 1") <= 11) ||
               (measured(archery_get_secret_targets_of_player("Player 2"),
                         when = is_ingame() &&
                                check_sport_activity("Archery", "") &&
                                amount_players() >= 2,
                         format = "raw") &&
                archery_get_secret_targets_of_player_save("Player 2") >= 8 &&
                archery_get_secret_targets_of_player_save("Player 2") <= 11) ||
               (measured(archery_get_secret_targets_of_player("Player 3"),
                         when = is_ingame() &&
                                check_sport_activity("Archery", "") &&
                                amount_players() >= 3,
                         format = "raw") &&
                archery_get_secret_targets_of_player_save("Player 3") >= 8 &&
                archery_get_secret_targets_of_player_save("Player 3") <= 11) ||
               (measured(archery_get_secret_targets_of_player("Player 4"),
                         when = is_ingame() &&
                                check_sport_activity("Archery", "") &&
                                amount_players() == 4,
                         format = "raw") &&
                archery_get_secret_targets_of_player_save("Player 4") >= 8 &&
                archery_get_secret_targets_of_player_save("Player 4") <= 11))
)

achievement(
    title = "That's What They Call Mid Gameplay", type = "",
    description = "[Archery] Hit every arrow shot of a game in the 10-point zone of the target or a secret target without using Team Play.",
    id = 0, badge = "80", points = 25,
    trigger = never(!is_ingame()) &&
              never(!check_sport_activity("Archery", "")) &&
              never(is_team_play()) &&
              trigger_when(archery_get_total_arrows_shot_by_current_player_in_stage() == 0x03) &&
              trigger_when(prev(archery_get_total_arrows_shot_by_current_player_in_stage()) == 0x02) &&
              trigger_when(archery_get_current_stage() == 0x03) && 
              ((archery_get_current_player() == 0x00 &&
                once(archery_get_current_player() == 0x00 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x00 &&
                           archery_get_points_of_last_arrow_shot() < 10 &&
                           archery_get_total_arrows_shot_by_current_player_in_stage() > prev(archery_get_total_arrows_shot_by_current_player_in_stage())))) ||
               (archery_get_current_player() == 0x01 &&
                once(archery_get_current_player() == 0x01 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x01 &&
                           archery_get_points_of_last_arrow_shot() < 10 &&
                           archery_get_total_arrows_shot_by_current_player_in_stage() > prev(archery_get_total_arrows_shot_by_current_player_in_stage())))) ||
               (archery_get_current_player() == 0x02 &&
                once(archery_get_current_player() == 0x02 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x02 &&
                           archery_get_points_of_last_arrow_shot() < 10 &&
                           archery_get_total_arrows_shot_by_current_player_in_stage() > prev(archery_get_total_arrows_shot_by_current_player_in_stage())))) ||
               (archery_get_current_player() == 0x03 &&
                once(archery_get_current_player() == 0x03 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x03 &&
                           archery_get_points_of_last_arrow_shot() < 10 &&
                           archery_get_total_arrows_shot_by_current_player_in_stage() > prev(archery_get_total_arrows_shot_by_current_player_in_stage())))))
)

achievement(
    title = "Triplets of William Tell", type = "",
    description = "[Archery] Hit the secret target in a stage with all three arrows without using Team Play.",
    id = 610774, badge = "80", points = 5,
    trigger = never(!is_ingame()) &&
              never(!check_sport_activity("Archery", "")) &&
              never(is_team_play()) &&
              trigger_when(archery_get_total_arrows_shot_by_current_player_in_stage() == 3) &&
              ((archery_get_current_player() == 0x00 &&
                once(archery_get_current_player() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_10_point_zone_combo() > 0) &&
                     never(archery_get_points_of_last_arrow_shot() != 10 &&
                           archery_get_total_arrows_shot_by_current_player_in_stage() > prev(archery_get_total_arrows_shot_by_current_player_in_stage())))) ||
               (archery_get_current_player() == 0x01 &&
                once(archery_get_current_player() == 0x01 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_10_point_zone_combo() > 0) &&
                     never(archery_get_points_of_last_arrow_shot() != 10 &&
                           archery_get_total_arrows_shot_by_current_player_in_stage() > prev(archery_get_total_arrows_shot_by_current_player_in_stage())))) ||
               (archery_get_current_player() == 0x02 &&
                once(archery_get_current_player() == 0x02 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_10_point_zone_combo() > 0) &&
                     never(archery_get_points_of_last_arrow_shot() != 10 &&
                           archery_get_total_arrows_shot_by_current_player_in_stage() > prev(archery_get_total_arrows_shot_by_current_player_in_stage())))) ||
               (archery_get_current_player() == 0x03 &&
                once(archery_get_current_player() == 0x03 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_10_point_zone_combo() > 0) &&
                     never(archery_get_points_of_last_arrow_shot() != 10 &&
                           archery_get_total_arrows_shot_by_current_player_in_stage() > prev(archery_get_total_arrows_shot_by_current_player_in_stage())))))
)

achievement(
    title = "Slicing the Fruits", type = "",
    description = "[Archery] Hit the secret target in every stage of the Beginner course in one run without using Team Play.",
    id = 610800, badge = "80", points = 10,
    trigger = never(!is_ingame()) &&
              never(!check_sport_activity("Archery", "")) &&
              never(get_activity_difficulty() != 0x00) &&
              never(is_team_play()) &&
              archery_activity_state() <= 0x0A &&
              ((archery_get_current_player() == 0x00 &&
                trigger_when(archery_get_current_stage() == 0x03) &&
                trigger_when(archery_get_total_arrows_shot_by_current_player_in_stage() == 3) &&
                trigger_when(archery_get_secret_target_flag_of_player("Player 1", 0x00)
                           + archery_get_secret_target_flag_of_player("Player 1", 0x01)
                           + archery_get_secret_target_flag_of_player("Player 1", 0x02)
                           + archery_get_secret_target_flag_of_player("Player 1", 0x03) == 4) &&
                once(archery_get_current_player() == 0x00 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x00 &&
                           archery_get_current_stage() == 0x01 &&
                           archery_get_secret_target_flag_of_player("Player 1", 0x00) == 0)) &&
                once(archery_get_current_player() == 0x00 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x00 &&
                           archery_get_current_stage() == 0x02 &&
                           archery_get_secret_target_flag_of_player("Player 1", 0x01) == 0)) &&
                once(archery_get_current_player() == 0x00 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x00 &&
                           archery_get_current_stage() == 0x03 &&
                           archery_get_secret_target_flag_of_player("Player 1", 0x02) == 0))) ||
               (archery_get_current_player() == 0x01 &&
                trigger_when(archery_get_current_stage() == 0x03) &&
                trigger_when(archery_get_total_arrows_shot_by_current_player_in_stage() == 3) &&
                trigger_when(archery_get_secret_target_flag_of_player("Player 2", 0x00)
                           + archery_get_secret_target_flag_of_player("Player 2", 0x01)
                           + archery_get_secret_target_flag_of_player("Player 2", 0x02)
                           + archery_get_secret_target_flag_of_player("Player 2", 0x03) == 4) &&
                once(archery_get_current_player() == 0x01 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x01 &&
                           archery_get_current_stage() == 0x01 &&
                           archery_get_secret_target_flag_of_player("Player 2", 0x00) == 0)) &&
                once(archery_get_current_player() == 0x01 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x01 &&
                           archery_get_current_stage() == 0x02 &&
                           archery_get_secret_target_flag_of_player("Player 2", 0x01) == 0)) &&
                once(archery_get_current_player() == 0x01 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x01 &&
                           archery_get_current_stage() == 0x03 &&
                           archery_get_secret_target_flag_of_player("Player 2", 0x02) == 0))) ||
               (archery_get_current_player() == 0x02 &&
                trigger_when(archery_get_current_stage() == 0x03) &&
                trigger_when(archery_get_total_arrows_shot_by_current_player_in_stage() == 3) &&
                trigger_when(archery_get_secret_target_flag_of_player("Player 3", 0x00)
                           + archery_get_secret_target_flag_of_player("Player 3", 0x01)
                           + archery_get_secret_target_flag_of_player("Player 3", 0x02)
                           + archery_get_secret_target_flag_of_player("Player 3", 0x03) == 4) &&
                once(archery_get_current_player() == 0x02 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x02 &&
                           archery_get_current_stage() == 0x01 &&
                           archery_get_secret_target_flag_of_player("Player 3", 0x00) == 0)) &&
                once(archery_get_current_player() == 0x02 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x02 &&
                           archery_get_current_stage() == 0x02 &&
                           archery_get_secret_target_flag_of_player("Player 3", 0x01) == 0)) &&
                once(archery_get_current_player() == 0x02 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x02 &&
                           archery_get_current_stage() == 0x03 &&
                           archery_get_secret_target_flag_of_player("Player 3", 0x02) == 0))) ||
               (archery_get_current_player() == 0x03 &&
                trigger_when(archery_get_current_stage() == 0x03) &&
                trigger_when(archery_get_total_arrows_shot_by_current_player_in_stage() == 3) &&
                trigger_when(archery_get_secret_target_flag_of_player("Player 4", 0x00)
                           + archery_get_secret_target_flag_of_player("Player 4", 0x01)
                           + archery_get_secret_target_flag_of_player("Player 4", 0x02)
                           + archery_get_secret_target_flag_of_player("Player 4", 0x03) == 4) &&
                once(archery_get_current_player() == 0x03 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x03 &&
                           archery_get_current_stage() == 0x01 &&
                           archery_get_secret_target_flag_of_player("Player 4", 0x00) == 0)) &&
                once(archery_get_current_player() == 0x03 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x03 &&
                           archery_get_current_stage() == 0x02 &&
                           archery_get_secret_target_flag_of_player("Player 4", 0x01) == 0)) &&
                once(archery_get_current_player() == 0x03 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x03 &&
                           archery_get_current_stage() == 0x03 &&
                           archery_get_secret_target_flag_of_player("Player 4", 0x02) == 0))))
)

achievement(
    title = "Right on the Apricot", type = "",
    description = "[Archery] Hit the secret target in every stage of the Intermediate course in one run without using Team Play.",
    id = 610801, badge = "80", points = 10,
    trigger = never(!is_ingame()) &&
              never(!check_sport_activity("Archery", "")) &&
              never(get_activity_difficulty() != 0x01) &&
              never(is_team_play()) &&
              archery_activity_state() <= 0x0A &&
              ((archery_get_current_player() == 0x00 &&
                trigger_when(archery_get_current_stage() == 0x03) &&
                trigger_when(archery_get_total_arrows_shot_by_current_player_in_stage() == 3) &&
                trigger_when(archery_get_secret_target_flag_of_player("Player 1", 0x04)
                           + archery_get_secret_target_flag_of_player("Player 1", 0x05)
                           + archery_get_secret_target_flag_of_player("Player 1", 0x06)
                           + archery_get_secret_target_flag_of_player("Player 1", 0x07) == 4) &&
                once(archery_get_current_player() == 0x00 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x00 &&
                           archery_get_current_stage() == 0x01 &&
                           archery_get_secret_target_flag_of_player("Player 1", 0x00) == 0)) &&
                once(archery_get_current_player() == 0x00 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x00 &&
                           archery_get_current_stage() == 0x02 &&
                           archery_get_secret_target_flag_of_player("Player 1", 0x01) == 0)) &&
                once(archery_get_current_player() == 0x00 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x00 &&
                           archery_get_current_stage() == 0x03 &&
                           archery_get_secret_target_flag_of_player("Player 1", 0x02) == 0))) ||
               (archery_get_current_player() == 0x01 &&
                trigger_when(archery_get_current_stage() == 0x03) &&
                trigger_when(archery_get_total_arrows_shot_by_current_player_in_stage() == 3) &&
                trigger_when(archery_get_secret_target_flag_of_player("Player 2", 0x04)
                           + archery_get_secret_target_flag_of_player("Player 2", 0x05)
                           + archery_get_secret_target_flag_of_player("Player 2", 0x06)
                           + archery_get_secret_target_flag_of_player("Player 2", 0x07) == 4) &&
                once(archery_get_current_player() == 0x01 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x01 &&
                           archery_get_current_stage() == 0x01 &&
                           archery_get_secret_target_flag_of_player("Player 2", 0x00) == 0)) &&
                once(archery_get_current_player() == 0x01 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x01 &&
                           archery_get_current_stage() == 0x02 &&
                           archery_get_secret_target_flag_of_player("Player 2", 0x01) == 0)) &&
                once(archery_get_current_player() == 0x01 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x01 &&
                           archery_get_current_stage() == 0x03 &&
                           archery_get_secret_target_flag_of_player("Player 2", 0x02) == 0))) ||
               (archery_get_current_player() == 0x02 &&
                trigger_when(archery_get_current_stage() == 0x03) &&
                trigger_when(archery_get_total_arrows_shot_by_current_player_in_stage() == 3) &&
                trigger_when(archery_get_secret_target_flag_of_player("Player 3", 0x04)
                           + archery_get_secret_target_flag_of_player("Player 3", 0x05)
                           + archery_get_secret_target_flag_of_player("Player 3", 0x06)
                           + archery_get_secret_target_flag_of_player("Player 3", 0x07) == 4) &&
                once(archery_get_current_player() == 0x02 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x02 &&
                           archery_get_current_stage() == 0x01 &&
                           archery_get_secret_target_flag_of_player("Player 3", 0x00) == 0)) &&
                once(archery_get_current_player() == 0x02 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x02 &&
                           archery_get_current_stage() == 0x02 &&
                           archery_get_secret_target_flag_of_player("Player 3", 0x01) == 0)) &&
                once(archery_get_current_player() == 0x02 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x02 &&
                           archery_get_current_stage() == 0x03 &&
                           archery_get_secret_target_flag_of_player("Player 3", 0x02) == 0))) ||
               (archery_get_current_player() == 0x03 &&
                trigger_when(archery_get_current_stage() == 0x03) &&
                trigger_when(archery_get_total_arrows_shot_by_current_player_in_stage() == 3) &&
                trigger_when(archery_get_secret_target_flag_of_player("Player 4", 0x04)
                           + archery_get_secret_target_flag_of_player("Player 4", 0x05)
                           + archery_get_secret_target_flag_of_player("Player 4", 0x06)
                           + archery_get_secret_target_flag_of_player("Player 4", 0x07) == 4) &&
                once(archery_get_current_player() == 0x03 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x03 &&
                           archery_get_current_stage() == 0x01 &&
                           archery_get_secret_target_flag_of_player("Player 4", 0x00) == 0)) &&
                once(archery_get_current_player() == 0x03 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x03 &&
                           archery_get_current_stage() == 0x02 &&
                           archery_get_secret_target_flag_of_player("Player 4", 0x01) == 0)) &&
                once(archery_get_current_player() == 0x03 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x03 &&
                           archery_get_current_stage() == 0x03 &&
                           archery_get_secret_target_flag_of_player("Player 4", 0x02) == 0))))
)

achievement(
    title = "Time for Some Vitamins", type = "",
    description = "[Archery] Hit the secret target in every stage of the Expert course in one run without using Team Play.",
    id = 610802, badge = "80", points = 10,
    trigger = never(!is_ingame()) &&
              never(!check_sport_activity("Archery", "")) &&
              never(get_activity_difficulty() != 0x02) &&
              never(is_team_play()) &&
              archery_activity_state() <= 0x0A &&
              ((archery_get_current_player() == 0x00 &&
                trigger_when(archery_get_current_stage() == 0x03) &&
                trigger_when(archery_get_total_arrows_shot_by_current_player_in_stage() == 3) &&
                trigger_when(archery_get_secret_target_flag_of_player("Player 1", 0x08)
                           + archery_get_secret_target_flag_of_player("Player 1", 0x09)
                           + archery_get_secret_target_flag_of_player("Player 1", 0x0A)
                           + archery_get_secret_target_flag_of_player("Player 1", 0x0B) == 4) &&
                once(archery_get_current_player() == 0x00 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x00 &&
                           archery_get_current_stage() == 0x01 &&
                           archery_get_secret_target_flag_of_player("Player 1", 0x00) == 0)) &&
                once(archery_get_current_player() == 0x00 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x00 &&
                           archery_get_current_stage() == 0x02 &&
                           archery_get_secret_target_flag_of_player("Player 1", 0x01) == 0)) &&
                once(archery_get_current_player() == 0x00 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x00 &&
                           archery_get_current_stage() == 0x03 &&
                           archery_get_secret_target_flag_of_player("Player 1", 0x02) == 0))) ||
               (archery_get_current_player() == 0x01 &&
                trigger_when(archery_get_current_stage() == 0x03) &&
                trigger_when(archery_get_total_arrows_shot_by_current_player_in_stage() == 3) &&
                trigger_when(archery_get_secret_target_flag_of_player("Player 2", 0x08)
                           + archery_get_secret_target_flag_of_player("Player 2", 0x09)
                           + archery_get_secret_target_flag_of_player("Player 2", 0x0A)
                           + archery_get_secret_target_flag_of_player("Player 2", 0x0B) == 4) &&
                once(archery_get_current_player() == 0x01 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x01 &&
                           archery_get_current_stage() == 0x01 &&
                           archery_get_secret_target_flag_of_player("Player 2", 0x00) == 0)) &&
                once(archery_get_current_player() == 0x01 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x01 &&
                           archery_get_current_stage() == 0x02 &&
                           archery_get_secret_target_flag_of_player("Player 2", 0x01) == 0)) &&
                once(archery_get_current_player() == 0x01 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x01 &&
                           archery_get_current_stage() == 0x03 &&
                           archery_get_secret_target_flag_of_player("Player 2", 0x02) == 0))) ||
               (archery_get_current_player() == 0x02 &&
                trigger_when(archery_get_current_stage() == 0x03) &&
                trigger_when(archery_get_total_arrows_shot_by_current_player_in_stage() == 3) &&
                trigger_when(archery_get_secret_target_flag_of_player("Player 3", 0x08)
                           + archery_get_secret_target_flag_of_player("Player 3", 0x09)
                           + archery_get_secret_target_flag_of_player("Player 3", 0x0A)
                           + archery_get_secret_target_flag_of_player("Player 3", 0x0B) == 4) &&
                once(archery_get_current_player() == 0x02 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x02 &&
                           archery_get_current_stage() == 0x01 &&
                           archery_get_secret_target_flag_of_player("Player 3", 0x00) == 0)) &&
                once(archery_get_current_player() == 0x02 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x02 &&
                           archery_get_current_stage() == 0x02 &&
                           archery_get_secret_target_flag_of_player("Player 3", 0x01) == 0)) &&
                once(archery_get_current_player() == 0x02 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x02 &&
                           archery_get_current_stage() == 0x03 &&
                           archery_get_secret_target_flag_of_player("Player 3", 0x02) == 0))) ||
               (archery_get_current_player() == 0x03 &&
                trigger_when(archery_get_current_stage() == 0x03) &&
                trigger_when(archery_get_total_arrows_shot_by_current_player_in_stage() == 3) &&
                trigger_when(archery_get_secret_target_flag_of_player("Player 4", 0x08)
                           + archery_get_secret_target_flag_of_player("Player 4", 0x09)
                           + archery_get_secret_target_flag_of_player("Player 4", 0x0A)
                           + archery_get_secret_target_flag_of_player("Player 4", 0x0B) == 4) &&
                once(archery_get_current_player() == 0x03 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x03 &&
                           archery_get_current_stage() == 0x01 &&
                           archery_get_secret_target_flag_of_player("Player 4", 0x00) == 0)) &&
                once(archery_get_current_player() == 0x03 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x03 &&
                           archery_get_current_stage() == 0x02 &&
                           archery_get_secret_target_flag_of_player("Player 4", 0x01) == 0)) &&
                once(archery_get_current_player() == 0x03 &&
                     archery_get_current_stage() == 0x00 &&
                     archery_activity_state() >= 0x01 &&
                     archery_activity_state() <= 0x02 &&
                     archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                     never(archery_get_current_player() == 0x03 &&
                           archery_get_current_stage() == 0x03 &&
                           archery_get_secret_target_flag_of_player("Player 4", 0x02) == 0))))
)

achievement(
    title = "No Aim, No Gain", type = "",
    description = "[Archery] Finish any course with 100 points or more without using Team Play and in the Expert Mode, that gets activated when any player holds (2) on the Wiimote while the course gets selected.",
    id = 611779, badge = "80", points = 25,
    trigger = never(!is_ingame()) &&
              never(!check_sport_activity("Archery", "")) &&
              amount_players() <= 4 &&
              never(is_team_play()) &&
              never(archery_get_current_stage() == 0x00 &&
                    archery_activity_state() == 0x00) &&
              tally(1, (archery_get_current_stage() == 0x00 &&
                        archery_activity_state() >= 0x01 &&
                        archery_activity_state() <= 0x02 &&
                        archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                        amount_players() >= 1 &&
                        amount_players() <= 4 &&
                        sport_activity_modifier_active("Player 1", "2")),
                       (archery_get_current_stage() == 0x00 &&
                        archery_activity_state() >= 0x01 &&
                        archery_activity_state() <= 0x02 &&
                        archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                        amount_players() >= 2 &&
                        amount_players() <= 4 &&
                        sport_activity_modifier_active("Player 2", "2")),
                       (archery_get_current_stage() == 0x00 &&
                        archery_activity_state() >= 0x01 &&
                        archery_activity_state() <= 0x02 &&
                        archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                        amount_players() >= 3 &&
                        amount_players() <= 4 &&
                        sport_activity_modifier_active("Player 3", "2")),
                       (archery_get_current_stage() == 0x00 &&
                        archery_activity_state() >= 0x01 &&
                        archery_activity_state() <= 0x02 &&
                        archery_get_total_arrows_shot_by_current_player_in_stage() == 0 &&
                        amount_players() == 4 &&
                        sport_activity_modifier_active("Player 4", "2"))) &&
              trigger_when(archery_activity_state() == 0x0B) &&
              trigger_when(prev(archery_activity_state() < 0x0B)) &&
              ((amount_players() >= 1 &&
                trigger_when(archery_get_player_total_score("Player 1") >= 100) &&
                trigger_when(archery_get_player_total_score("Player 1") <= 120)) ||
               (amount_players() >= 2 &&
                trigger_when(archery_get_player_total_score("Player 2") >= 100) &&
                trigger_when(archery_get_player_total_score("Player 2") <= 120)) ||
               (amount_players() >= 3 &&
                trigger_when(archery_get_player_total_score("Player 3") >= 100) &&
                trigger_when(archery_get_player_total_score("Player 3") <= 120)) ||
               (amount_players() >= 4 &&
                trigger_when(archery_get_player_total_score("Player 4") >= 100) &&
                trigger_when(archery_get_player_total_score("Player 4") <= 120)))
)

achievement(
    title = "Be Careful, Partner", type = "",
    description = "[Archery] Get a tip that you stay calm and relax yourself when aiming with a bow.",
    id = 611782, badge = "80", points = 1,
    trigger = is_ingame() &&
              check_sport_activity("Archery", "") &&
              __ornext(archery_activity_state() == 0x02 ||
                       archery_activity_state() == 0x04) &&
              archery_special_activity_state() == 0x05 &&
              archery_special_activity_state() != prev(archery_special_activity_state())
)

// Air Sports / Island Flyover

achievement(
    title = "Everybody's Golf Resort", type = "",
    description = "[Air Sports / Island Flyover] Visit Wuhu Island and check one of its (i) points.",
    id = 606796, badge = "690785", points = 1,
    trigger = is_ingame() &&
              check_sport_activity("Air Sports", "Island Flyover") &&
              air_sports_island_flyover_read_location_at_wuhu_island()
)

achievement(
    title = "Private Vacation Apartment", type = "progression",
    description = "[Air Sports / Island Flyover] Collect the (i) point of the Spacious Desert Island cottage after collecting every (i) point at least once in the daytime, evening or night.",
    id = 607263, badge = "690434", points = 5,
    trigger = measured(air_sports_island_flyover_get_total_ipoints() == 80,
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
    id = 606763, badge = "690431", points = 3,
    trigger = measured(air_sports_island_flyover_miguel_guide_plane_follow_timer() * 0.0019 >= (60 * 60 * 3) * 0.0019,  // Multiplication to reduce the target value and make the progress bar update less frequent to avoid spam
                       when = is_ingame() &&                                                                            // Multiplication by 0.0019 to make it flat X/20 (5% per update) rather than x/21
                              check_sport_activity("Air Sports", "Island Flyover"),
                       format = "percent") &&
              prev(air_sports_island_flyover_miguel_guide_plane_follow_timer() < (60 * 60 * 3)) &&
              prev(air_sports_island_flyover_miguel_guide_plane_follow_timer() >= (60 * 60 * 3 - 100))
)

achievement(
    title = "Rushed Tour with Brief Turbulence", type = "",
    description = "[Air Sports / Island Flyover] Collect a total of 50 (i) points in a single flight.",
    id = 607179, badge = "690435", points = 25,
    trigger = measured(air_sports_island_flyover_get_total_ipoints_found_in_current_flight() == 50,
                       when = is_ingame() &&
                              check_sport_activity("Air Sports", "Island Flyover"),
                       format = "raw") &&
              prev(air_sports_island_flyover_get_total_ipoints_found_in_current_flight()) == 49
)

achievement(
    title = "Perfect Weather for a Trip", type = "",
    description = "[Air Sports / Island Flyover] Collect every (i) point during the daytime.",
    id = 607152, badge = "690418", points = 10,
    trigger = measured(air_sports_island_flyover_get_ipoints_by_daytime("Daytime") == 80,
                       when = is_ingame() &&
                              check_sport_activity("Air Sports", "Island Flyover"),
                       format = "raw") &&
              prev(air_sports_island_flyover_get_ipoints_by_daytime("Daytime")) == 79
)

achievement(
    title = "Scenaries in the Sunset", type = "",
    description = "[Air Sports / Island Flyover] Collect every (i) point during the evening.",
    id = 607153, badge = "690426", points = 10,
    trigger = measured(air_sports_island_flyover_get_ipoints_by_daytime("Evening") == 80,
                       when = is_ingame() &&
                              check_sport_activity("Air Sports", "Island Flyover"),
                       format = "raw") &&
              prev(air_sports_island_flyover_get_ipoints_by_daytime("Evening")) == 79
)

achievement(
    title = "Ride Through the Night", type = "",
    description = "[Air Sports / Island Flyover] Collect every (i) point during the night.",
    id = 607154, badge = "690427", points = 10,
    trigger = measured(air_sports_island_flyover_get_ipoints_by_daytime("Night") == 80,
                       when = is_ingame() &&
                              check_sport_activity("Air Sports", "Island Flyover"),
                       format = "raw") &&
              prev(air_sports_island_flyover_get_ipoints_by_daytime("Night")) == 79
)

achievement(
    title = "Wuhu Island's 24/7 Guide Plane Service", type = "",
    description = "[Air Sports / Island Flyover] Collect every (i) point during the daytime, evening and night.",
    id = 607155, badge = "690428", points = 5,
    trigger = measured(air_sports_island_flyover_get_ipoints_by_daytime("Daytime")
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
    id = 607156, badge = "690433", points = 5,
    trigger = measured(air_sports_island_flyover_get_total_popped_balloons_in_current_flight() >= 150,
                       when = is_ingame() &&
                              check_sport_activity("Air Sports", "Island Flyover"),
                       format = "raw") &&
              prev(air_sports_island_flyover_get_total_popped_balloons_in_current_flight()) <= 149 &&
              prev(air_sports_island_flyover_get_total_popped_balloons_in_current_flight()) >= 120
)

achievement(
    title = "Find Mii on the Island", type = "",
    description = "[Air Sports / Island Flyover] Pop every white balloon during the daytime.",
    id = 607189, badge = "690787", points = 10,
    trigger = measured(air_sports_island_flyover_get_white_balloons_by_daytime("Daytime") == 372,
                       when = is_ingame() &&
                              check_sport_activity("Air Sports", "Island Flyover"),
                       format = "raw") &&
              prev(air_sports_island_flyover_get_white_balloons_by_daytime("Daytime")) < 372 &&
              air_sports_island_flyover_get_total_popped_balloons_in_current_flight() > 0
)

achievement(
    title = "Mii, Myself and I", type = "",
    description = "[Air Sports / Island Flyover] Pop every white balloon during the evening.",
    id = 607190, badge = "690786", points = 10,
    trigger = measured(air_sports_island_flyover_get_white_balloons_by_daytime("Evening") == 340,
                       when = is_ingame() &&
                              check_sport_activity("Air Sports", "Island Flyover"),
                       format = "raw") &&
              prev(air_sports_island_flyover_get_white_balloons_by_daytime("Evening")) < 340 &&
              air_sports_island_flyover_get_total_popped_balloons_in_current_flight() > 0
)

achievement(
    title = "Meet Mii at Night", type = "",
    description = "[Air Sports / Island Flyover] Pop every white balloon during the night.",
    id = 607191, badge = "690788", points = 10,
    trigger = measured(air_sports_island_flyover_get_white_balloons_by_daytime("Night") == 209,
                       when = is_ingame() &&
                              check_sport_activity("Air Sports", "Island Flyover"),
                       format = "raw") &&
              prev(air_sports_island_flyover_get_white_balloons_by_daytime("Night")) < 209 &&
              air_sports_island_flyover_get_total_popped_balloons_in_current_flight() > 0
)

achievement(
    title = "Everyone Knows Mii Now", type = "",
    description = "[Air Sports / Island Flyover] Pop every white balloon during the daytime, evening and night.",
    id = 607192, badge = "690430", points = 10,
    trigger = measured(air_sports_island_flyover_get_white_balloons_by_daytime("Daytime")
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
    id = 607232, badge = "690429", points = 2,
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
    id = 607233, badge = "690398", points = 3,
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
    id = 607234, badge = "690783", points = 1,
    trigger = measured(air_sports_island_flyover_total_barrel_rolls() == 30,
                       when = is_ingame() &&
                              check_sport_activity("Air Sports", "Island Flyover"),
                       format = "raw") &&
              prev(air_sports_island_flyover_total_barrel_rolls()) == 29
)

achievement(
    title = "Just a Casual Flight", type = "",
    description = "[Air Sports / Island Flyover] Finish a flight with balloons and (i) points disabled by holding (2) on the Wiimote while selecting the time of day.",
    id = 607245, badge = "690432", points = 1,
    trigger = is_ingame() &&
              check_sport_activity("Air Sports", "Island Flyover") &&
              trigger_when(air_sports_island_flyover_activity_state() == 0x05) &&
              trigger_when(prev(air_sports_island_flyover_activity_state()) == 0x04) &&
              sport_activity_modifier_active("Player 1", "2")
)

//--------------------------------------------------
// Leaderboards

leaderboard(
    id = 163558,
    title       = "Archery", 
    description = "Most points got in the Beginner Course in 1-Player Mode without using Expert Mode.",
    start  = is_ingame() &&
             check_sport_activity("Archery", "") &&
             !is_team_play() &&
             get_activity_difficulty() == 0x00 &&
             archery_activity_state() == 0x0B &&
             prev(archery_activity_state()) < 0x0B &&
             (!sport_activity_modifier_active("Player 1", "2")) &&
             (__ornext(amount_players() < 2 ||
                       !sport_activity_modifier_active("Player 2", "2"))) &&
             (__ornext(amount_players() < 3 ||
                       !sport_activity_modifier_active("Player 3", "2"))) &&
             (__ornext(amount_players() < 4 ||
                       !sport_activity_modifier_active("Player 4", "2"))),
    cancel = always_false(), 
    submit = always_true(), 
    value  = max_of(measured(archery_get_player_total_score("Player 1"),
                             when = amount_players() >= 1 &&
                                    amount_players() <= 4),
                    measured(archery_get_player_total_score("Player 2"),
                             when = amount_players() >= 2 &&
                                    amount_players() <= 4),
                    measured(archery_get_player_total_score("Player 3"),
                             when = amount_players() >= 3 &&
                                    amount_players() <= 4),
                    measured(archery_get_player_total_score("Player 4"),
                             when = amount_players() >= 4 &&
                                    amount_players() <= 4)),
    format = "Value",
    lower_is_better = false
)

leaderboard(
    id = 163559,
    title       = "Archery", 
    description = "Most points got in the Beginner Course in 1-Player Mode while using Expert Mode.",
    start  = is_ingame() &&
             check_sport_activity("Archery", "") &&
             !is_team_play() &&
             get_activity_difficulty() == 0x00 &&
             archery_activity_state() == 0x0B &&
             prev(archery_activity_state()) < 0x0B &&
             ((sport_activity_modifier_active("Player 1", "2")) ||
              (amount_players() >= 2 &&
               sport_activity_modifier_active("Player 2", "2")) ||
              (amount_players() >= 3 &&
               sport_activity_modifier_active("Player 3", "2")) ||
              (amount_players() >= 4 &&
               sport_activity_modifier_active("Player 4", "2"))),
    cancel = always_false(), 
    submit = always_true(), 
    value  = max_of(measured(archery_get_player_total_score("Player 1"),
                             when = amount_players() >= 1 &&
                                    amount_players() <= 4),
                    measured(archery_get_player_total_score("Player 2"),
                             when = amount_players() >= 2 &&
                                    amount_players() <= 4),
                    measured(archery_get_player_total_score("Player 3"),
                             when = amount_players() >= 3 &&
                                    amount_players() <= 4),
                    measured(archery_get_player_total_score("Player 4"),
                             when = amount_players() >= 4 &&
                                    amount_players() <= 4)),
    format = "Value",
    lower_is_better = false
)

leaderboard(
    id = 163560,
    title       = "Archery", 
    description = "Most points got in the Beginner Course in Team Play Mode without using Expert Mode.",
    start  = is_ingame() &&
             check_sport_activity("Archery", "") &&
             is_team_play() &&
             get_activity_difficulty() == 0x00 &&
             archery_activity_state() == 0x0B &&
             prev(archery_activity_state()) < 0x0B &&
             (!sport_activity_modifier_active("Player 1", "2")) &&
             (__ornext(amount_players() < 2 ||
                       !sport_activity_modifier_active("Player 2", "2"))) &&
             (__ornext(amount_players() < 3 ||
                       !sport_activity_modifier_active("Player 3", "2"))) &&
             (__ornext(amount_players() < 4 ||
                       !sport_activity_modifier_active("Player 4", "2"))),
    cancel = always_false(), 
    submit = always_true(), 
    value  = max_of(measured(archery_get_player_total_score("Player 1"),
                             when = amount_players() >= 1 &&
                                    amount_players() <= 4),
                    measured(archery_get_player_total_score("Player 2"),
                             when = amount_players() >= 2 &&
                                    amount_players() <= 4),
                    measured(archery_get_player_total_score("Player 3"),
                             when = amount_players() >= 3 &&
                                    amount_players() <= 4),
                    measured(archery_get_player_total_score("Player 4"),
                             when = amount_players() >= 4 &&
                                    amount_players() <= 4)),
    format = "Value",
    lower_is_better = false
)

leaderboard(
    id = 163561,
    title       = "Archery", 
    description = "Most points got in the Beginner Course in Team Play Mode while using Expert Mode.",
    start  = is_ingame() &&
             check_sport_activity("Archery", "") &&
             is_team_play() &&
             get_activity_difficulty() == 0x00 &&
             archery_activity_state() == 0x0B &&
             prev(archery_activity_state()) < 0x0B &&
             ((sport_activity_modifier_active("Player 1", "2")) ||
              (amount_players() >= 2 &&
               sport_activity_modifier_active("Player 2", "2")) ||
              (amount_players() >= 3 &&
               sport_activity_modifier_active("Player 3", "2")) ||
              (amount_players() >= 4 &&
               sport_activity_modifier_active("Player 4", "2"))),
    cancel = always_false(), 
    submit = always_true(), 
    value  = max_of(measured(archery_get_player_total_score("Player 1"),
                             when = amount_players() >= 1 &&
                                    amount_players() <= 4),
                    measured(archery_get_player_total_score("Player 2"),
                             when = amount_players() >= 2 &&
                                    amount_players() <= 4),
                    measured(archery_get_player_total_score("Player 3"),
                             when = amount_players() >= 3 &&
                                    amount_players() <= 4),
                    measured(archery_get_player_total_score("Player 4"),
                             when = amount_players() >= 4 &&
                                    amount_players() <= 4)),
    format = "Value",
    lower_is_better = false
)

leaderboard(
    id = 163562,
    title       = "Archery", 
    description = "Most points got in the Intermediate Course in 1-Player Mode without using Expert Mode.",
    start  = is_ingame() &&
             check_sport_activity("Archery", "") &&
             !is_team_play() &&
             get_activity_difficulty() == 0x01 &&
             archery_activity_state() == 0x0B &&
             prev(archery_activity_state()) < 0x0B &&
             (!sport_activity_modifier_active("Player 1", "2")) &&
             (__ornext(amount_players() < 2 ||
                       !sport_activity_modifier_active("Player 2", "2"))) &&
             (__ornext(amount_players() < 3 ||
                       !sport_activity_modifier_active("Player 3", "2"))) &&
             (__ornext(amount_players() < 4 ||
                       !sport_activity_modifier_active("Player 4", "2"))),
    cancel = always_false(), 
    submit = always_true(), 
    value  = max_of(measured(archery_get_player_total_score("Player 1"),
                             when = amount_players() >= 1 &&
                                    amount_players() <= 4),
                    measured(archery_get_player_total_score("Player 2"),
                             when = amount_players() >= 2 &&
                                    amount_players() <= 4),
                    measured(archery_get_player_total_score("Player 3"),
                             when = amount_players() >= 3 &&
                                    amount_players() <= 4),
                    measured(archery_get_player_total_score("Player 4"),
                             when = amount_players() >= 4 &&
                                    amount_players() <= 4)),
    format = "Value",
    lower_is_better = false
)

leaderboard(
    id = 163563,
    title       = "Archery", 
    description = "Most points got in the Intermediate Course in 1-Player Mode while using Expert Mode.",
    start  = is_ingame() &&
             check_sport_activity("Archery", "") &&
             !is_team_play() &&
             get_activity_difficulty() == 0x01 &&
             archery_activity_state() == 0x0B &&
             prev(archery_activity_state()) < 0x0B &&
             ((sport_activity_modifier_active("Player 1", "2")) ||
              (amount_players() >= 2 &&
               sport_activity_modifier_active("Player 2", "2")) ||
              (amount_players() >= 3 &&
               sport_activity_modifier_active("Player 3", "2")) ||
              (amount_players() >= 4 &&
               sport_activity_modifier_active("Player 4", "2"))),
    cancel = always_false(), 
    submit = always_true(), 
    value  = max_of(measured(archery_get_player_total_score("Player 1"),
                             when = amount_players() >= 1 &&
                                    amount_players() <= 4),
                    measured(archery_get_player_total_score("Player 2"),
                             when = amount_players() >= 2 &&
                                    amount_players() <= 4),
                    measured(archery_get_player_total_score("Player 3"),
                             when = amount_players() >= 3 &&
                                    amount_players() <= 4),
                    measured(archery_get_player_total_score("Player 4"),
                             when = amount_players() >= 4 &&
                                    amount_players() <= 4)),
    format = "Value",
    lower_is_better = false
)

leaderboard(
    id = 163564,
    title       = "Archery", 
    description = "Most points got in the Intermediate Course in Team Play Mode without using Expert Mode.",
    start  = is_ingame() &&
             check_sport_activity("Archery", "") &&
             is_team_play() &&
             get_activity_difficulty() == 0x01 &&
             archery_activity_state() == 0x0B &&
             prev(archery_activity_state()) < 0x0B &&
             (!sport_activity_modifier_active("Player 1", "2")) &&
             (__ornext(amount_players() < 2 ||
                       !sport_activity_modifier_active("Player 2", "2"))) &&
             (__ornext(amount_players() < 3 ||
                       !sport_activity_modifier_active("Player 3", "2"))) &&
             (__ornext(amount_players() < 4 ||
                       !sport_activity_modifier_active("Player 4", "2"))),
    cancel = always_false(), 
    submit = always_true(), 
    value  = max_of(measured(archery_get_player_total_score("Player 1"),
                             when = amount_players() >= 1 &&
                                    amount_players() <= 4),
                    measured(archery_get_player_total_score("Player 2"),
                             when = amount_players() >= 2 &&
                                    amount_players() <= 4),
                    measured(archery_get_player_total_score("Player 3"),
                             when = amount_players() >= 3 &&
                                    amount_players() <= 4),
                    measured(archery_get_player_total_score("Player 4"),
                             when = amount_players() >= 4 &&
                                    amount_players() <= 4)),
    format = "Value",
    lower_is_better = false
)

leaderboard(
    id = 163565,
    title       = "Archery", 
    description = "Most points got in the Intermediate Course in Team Play Mode while using Expert Mode.",
    start  = is_ingame() &&
             check_sport_activity("Archery", "") &&
             is_team_play() &&
             get_activity_difficulty() == 0x01 &&
             archery_activity_state() == 0x0B &&
             prev(archery_activity_state()) < 0x0B &&
             ((sport_activity_modifier_active("Player 1", "2")) ||
              (amount_players() >= 2 &&
               sport_activity_modifier_active("Player 2", "2")) ||
              (amount_players() >= 3 &&
               sport_activity_modifier_active("Player 3", "2")) ||
              (amount_players() >= 4 &&
               sport_activity_modifier_active("Player 4", "2"))),
    cancel = always_false(), 
    submit = always_true(), 
    value  = max_of(measured(archery_get_player_total_score("Player 1"),
                             when = amount_players() >= 1 &&
                                    amount_players() <= 4),
                    measured(archery_get_player_total_score("Player 2"),
                             when = amount_players() >= 2 &&
                                    amount_players() <= 4),
                    measured(archery_get_player_total_score("Player 3"),
                             when = amount_players() >= 3 &&
                                    amount_players() <= 4),
                    measured(archery_get_player_total_score("Player 4"),
                             when = amount_players() >= 4 &&
                                    amount_players() <= 4)),
    format = "Value",
    lower_is_better = false
)

leaderboard(
    id = 163566,
    title       = "Archery", 
    description = "Most points got in the Expert Course in 1-Player Mode without using Expert Mode.",
    start  = is_ingame() &&
             check_sport_activity("Archery", "") &&
             !is_team_play() &&
             get_activity_difficulty() == 0x02 &&
             archery_activity_state() == 0x0B &&
             prev(archery_activity_state()) < 0x0B &&
             (!sport_activity_modifier_active("Player 1", "2")) &&
             (__ornext(amount_players() < 2 ||
                       !sport_activity_modifier_active("Player 2", "2"))) &&
             (__ornext(amount_players() < 3 ||
                       !sport_activity_modifier_active("Player 3", "2"))) &&
             (__ornext(amount_players() < 4 ||
                       !sport_activity_modifier_active("Player 4", "2"))),
    cancel = always_false(), 
    submit = always_true(), 
    value  = max_of(measured(archery_get_player_total_score("Player 1"),
                             when = amount_players() >= 1 &&
                                    amount_players() <= 4),
                    measured(archery_get_player_total_score("Player 2"),
                             when = amount_players() >= 2 &&
                                    amount_players() <= 4),
                    measured(archery_get_player_total_score("Player 3"),
                             when = amount_players() >= 3 &&
                                    amount_players() <= 4),
                    measured(archery_get_player_total_score("Player 4"),
                             when = amount_players() >= 4 &&
                                    amount_players() <= 4)),
    format = "Value",
    lower_is_better = false
)

leaderboard(
    id = 163567,
    title       = "Archery", 
    description = "Most points got in the Expert Course in 1-Player Mode while using Expert Mode.",
    start  = is_ingame() &&
             check_sport_activity("Archery", "") &&
             !is_team_play() &&
             get_activity_difficulty() == 0x02 &&
             archery_activity_state() == 0x0B &&
             prev(archery_activity_state()) < 0x0B &&
             ((sport_activity_modifier_active("Player 1", "2")) ||
              (amount_players() >= 2 &&
               sport_activity_modifier_active("Player 2", "2")) ||
              (amount_players() >= 3 &&
               sport_activity_modifier_active("Player 3", "2")) ||
              (amount_players() >= 4 &&
               sport_activity_modifier_active("Player 4", "2"))),
    cancel = always_false(), 
    submit = always_true(), 
    value  = max_of(measured(archery_get_player_total_score("Player 1"),
                             when = amount_players() >= 1 &&
                                    amount_players() <= 4),
                    measured(archery_get_player_total_score("Player 2"),
                             when = amount_players() >= 2 &&
                                    amount_players() <= 4),
                    measured(archery_get_player_total_score("Player 3"),
                             when = amount_players() >= 3 &&
                                    amount_players() <= 4),
                    measured(archery_get_player_total_score("Player 4"),
                             when = amount_players() >= 4 &&
                                    amount_players() <= 4)),
    format = "Value",
    lower_is_better = false
)

leaderboard(
    id = 163568,
    title       = "Archery", 
    description = "Most points got in the Expert Course in Team Play Mode without using Expert Mode.",
    start  = is_ingame() &&
             check_sport_activity("Archery", "") &&
             is_team_play() &&
             get_activity_difficulty() == 0x02 &&
             archery_activity_state() == 0x0B &&
             prev(archery_activity_state()) < 0x0B &&
             (!sport_activity_modifier_active("Player 1", "2")) &&
             (__ornext(amount_players() < 2 ||
                       !sport_activity_modifier_active("Player 2", "2"))) &&
             (__ornext(amount_players() < 3 ||
                       !sport_activity_modifier_active("Player 3", "2"))) &&
             (__ornext(amount_players() < 4 ||
                       !sport_activity_modifier_active("Player 4", "2"))),
    cancel = always_false(), 
    submit = always_true(), 
    value  = max_of(measured(archery_get_player_total_score("Player 1"),
                             when = amount_players() >= 1 &&
                                    amount_players() <= 4),
                    measured(archery_get_player_total_score("Player 2"),
                             when = amount_players() >= 2 &&
                                    amount_players() <= 4),
                    measured(archery_get_player_total_score("Player 3"),
                             when = amount_players() >= 3 &&
                                    amount_players() <= 4),
                    measured(archery_get_player_total_score("Player 4"),
                             when = amount_players() >= 4 &&
                                    amount_players() <= 4)),
    format = "Value",
    lower_is_better = false
)

leaderboard(
    id = 163569,
    title       = "Archery", 
    description = "Most points got in the Expert Course in Team Play Mode while using Expert Mode.",
    start  = is_ingame() &&
             check_sport_activity("Archery", "") &&
             is_team_play() &&
             get_activity_difficulty() == 0x02 &&
             archery_activity_state() == 0x0B &&
             prev(archery_activity_state()) < 0x0B &&
             ((sport_activity_modifier_active("Player 1", "2")) ||
              (amount_players() >= 2 &&
               sport_activity_modifier_active("Player 2", "2")) ||
              (amount_players() >= 3 &&
               sport_activity_modifier_active("Player 3", "2")) ||
              (amount_players() >= 4 &&
               sport_activity_modifier_active("Player 4", "2"))),
    cancel = always_false(), 
    submit = always_true(), 
    value  = max_of(measured(archery_get_player_total_score("Player 1"),
                             when = amount_players() >= 1 &&
                                    amount_players() <= 4),
                    measured(archery_get_player_total_score("Player 2"),
                             when = amount_players() >= 2 &&
                                    amount_players() <= 4),
                    measured(archery_get_player_total_score("Player 3"),
                             when = amount_players() >= 3 &&
                                    amount_players() <= 4),
                    measured(archery_get_player_total_score("Player 4"),
                             when = amount_players() >= 4 &&
                                    amount_players() <= 4)),
    format = "Value",
    lower_is_better = false
)

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
    is_ingame() && check_sport_activity("Swordplay", "Speed Slice"), 
    "Two Miis are competiting in a sword contest [🔵{0}] [🔴{1}] [Swordplay / Speed Slice] [{2}]",
        rich_presence_macro("Number",
                        swordplay_speed_slice_player_points("Player 1")),
        rich_presence_macro("Number",
                        swordplay_speed_slice_player_points("Player 2")),
        rich_presence_lookup("PlayerAmount",
                         amount_players(),
                         players,
                         fallback = players[1])
)

rich_presence_conditional_display(
    is_ingame() && check_sport_activity("Archery", "") && !is_team_play() && amount_players() == 1, 
    "A Mii is shooting arrows at Stage {0} of the {1} Course [🔵{2}] [Archery] [1-Player]",
        rich_presence_macro("Number",
                        archery_get_current_stage() + 1),
        rich_presence_lookup("ActivityCourse",
                        get_activity_difficulty(),
                        activity_courses,
                        fallback = activity_courses[0]),
        rich_presence_macro("Number",
                        archery_get_player_total_score("Player 1"))
)

rich_presence_conditional_display(
    is_ingame() && check_sport_activity("Archery", "") && !is_team_play() && amount_players() == 2, 
    "Two Miis are shooting arrows at Stage {0} of the {1} Course [🔵{2}] [🔴{3}] [Archery] [1-Player]",
        rich_presence_macro("Number",
                        archery_get_current_stage() + 1),
        rich_presence_lookup("ActivityCourse",
                        get_activity_difficulty(),
                        activity_courses,
                        fallback = activity_courses[0]),
        rich_presence_macro("Number",
                        archery_get_player_total_score("Player 1")),
        rich_presence_macro("Number",
                        archery_get_player_total_score("Player 2"))
)

rich_presence_conditional_display(
    is_ingame() && check_sport_activity("Archery", "") && !is_team_play() && amount_players() == 3, 
    "Three Miis are shooting arrows at Stage {0} of the {1} Course [🔵{2}] [🔴{3}] [🟢{4}] [Archery] [1-Player]",
        rich_presence_macro("Number",
                        archery_get_current_stage() + 1),
        rich_presence_lookup("ActivityCourse",
                        get_activity_difficulty(),
                        activity_courses,
                        fallback = activity_courses[0]),
        rich_presence_macro("Number",
                        archery_get_player_total_score("Player 1")),
        rich_presence_macro("Number",
                        archery_get_player_total_score("Player 2")),
        rich_presence_macro("Number",
                        archery_get_player_total_score("Player 3"))
)

rich_presence_conditional_display(
    is_ingame() && check_sport_activity("Archery", "") && !is_team_play() && amount_players() == 4, 
    "Four Miis are shooting arrows at Stage {0} of the {1} Course [🔵{2}] [🔴{3}] [🟢{4}] [🟡{5}] [Archery] [1-Player]",
        rich_presence_macro("Number",
                        archery_get_current_stage() + 1),
        rich_presence_lookup("ActivityCourse",
                        get_activity_difficulty(),
                        activity_courses,
                        fallback = activity_courses[0]),
        rich_presence_macro("Number",
                        archery_get_player_total_score("Player 1")),
        rich_presence_macro("Number",
                        archery_get_player_total_score("Player 2")),
        rich_presence_macro("Number",
                        archery_get_player_total_score("Player 3")),
        rich_presence_macro("Number",
                        archery_get_player_total_score("Player 4"))
)

rich_presence_conditional_display(
    is_ingame() && check_sport_activity("Archery", "") && is_team_play() && amount_players() == 3, 
    "Three Miis are shooting arrows at Stage {0} of the {1} Course [🔵{2}] [🔴{3}] [Archery] [Team Play]",
        rich_presence_macro("Number",
                        archery_get_current_stage() + 1),
        rich_presence_lookup("ActivityCourse",
                        get_activity_difficulty(),
                        activity_courses,
                        fallback = activity_courses[0]),
        rich_presence_macro("Number",
                        archery_get_player_total_score("Player 1")),
        rich_presence_macro("Number",
                        archery_get_player_total_score("Player 2"))
)

rich_presence_conditional_display(
    is_ingame() && check_sport_activity("Archery", "") && is_team_play() && amount_players() == 4, 
    "Four Miis are shooting arrows at Stage {0} of the {1} Course [🔵{2}] [🔴{3}] [Archery] [Team Play]",
        rich_presence_macro("Number",
                        archery_get_current_stage() + 1),
        rich_presence_lookup("ActivityCourse",
                        get_activity_difficulty(),
                        activity_courses,
                        fallback = activity_courses[0]),
        rich_presence_macro("Number",
                        archery_get_player_total_score("Player 1")),
        rich_presence_macro("Number",
                        archery_get_player_total_score("Player 2"))
)

rich_presence_conditional_display(
    is_ingame() && check_sport_activity("Air Sports", "Island Flyover"), 
    "A Mii is flying over Wuhu Island in a plane {0} [ℹ️{1}] [🎈{2}] [⏱️{3}] [Air Sports / Island Flyover]",
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


