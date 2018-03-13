//
//  CoursesValues.swift
//  conse
//
//  Created by Felipe Zamudio on 17/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import Foundation

enum CourseIDs: Int {
    case VBG = 1, PLC = 2
}

enum TopicsIDs: Int {
    case mod_01, mod_02, mod_03, mod_04
}

enum AudioAction: Int {
    case play
    case pause
    case stop
}

enum FileActions: Int {
    case open
    case share
}

enum ClueID: Int {
    case clue_01, clue_02, clue_03, clue_04, clue_05, clue_06
}

/// Indices para el curso *Violencia Basada en Genero*
enum VBG_INDEX: Int {
    case VBG_01, VBG_02, VBG_03, VBG_04, VBG_05, VBG_06, VBG_07, VBG_08, VBG_09, VBG_10
    case VBG_11, VBG_12, VBG_13, VBG_14, VBG_15, VBG_16, VBG_17, VBG_18, VBG_19, VBG_20
    case VBG_21, VBG_22, VBG_23, VBG_24, VBG_25, VBG_26, VBG_27, VBG_28, VBG_29, VBG_30
    case VBG_31, VBG_32, VBG_33, VBG_34, VBG_35, VBG_36, VBG_37, VBG_38, VBG_39, VBG_40
    case VBG_41, VBG_42, VBG_43, VBG_44, VBG_45, VBG_46, VBG_47, VBG_48, VBG_49, VBG_50
    case VBG_51, VBG_52, VBG_53, VBG_54, VBG_55
}

/// Indices para el curso *Protección Lideres Comunitarios*
enum LEADERS_INDEX: Int {
    case LEADERS_01, LEADERS_02, LEADERS_03, LEADERS_04, LEADERS_05, LEADERS_06, LEADERS_07, LEADERS_08, LEADERS_09, LEADERS_10
    case LEADERS_11, LEADERS_12, LEADERS_13, LEADERS_14, LEADERS_15, LEADERS_16, LEADERS_17, LEADERS_18, LEADERS_19, LEADERS_20
    case LEADERS_21, LEADERS_22, LEADERS_23, LEADERS_24, LEADERS_25, LEADERS_26, LEADERS_27, LEADERS_28, LEADERS_29, LEADERS_30
    case LEADERS_31, LEADERS_32, LEADERS_33, LEADERS_34, LEADERS_35, LEADERS_36, LEADERS_37, LEADERS_38, LEADERS_39, LEADERS_40
    case LEADERS_41, LEADERS_42, LEADERS_43, LEADERS_44, LEADERS_45, LEADERS_46, LEADERS_47, LEADERS_48, LEADERS_49, LEADERS_50
    case LEADERS_51, LEADERS_52, LEADERS_53, LEADERS_54, LEADERS_55, LEADERS_56, LEADERS_57, LEADERS_58
}

enum VBG_AUDIO_ID: Int {
    case AUD_01, AUD_02, AUD_03, AUD_04, AUD_05, AUD_06, AUD_07, AUD_08, AUD_09, AUD_10
    case AUD_11, AUD_12, AUD_13, AUD_14, AUD_15, AUD_16, AUD_17, AUD_18, AUD_19, AUD_20
    case AUD_21
}

enum LEADERS_AUDIO_ID: Int {
    case AUD_01, AUD_02, AUD_03, AUD_04, AUD_05, AUD_06, AUD_07, AUD_08, AUD_09, AUD_10
    case AUD_11, AUD_12, AUD_13, AUD_14, AUD_15, AUD_16, AUD_17, AUD_18, AUD_19, AUD_20
    case AUD_21, AUD_22, AUD_23, AUD_24, AUD_25, AUD_26, AUD_27, AUD_28, AUD_29
}
