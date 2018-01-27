//
//  CoursesValues.swift
//  conse
//
//  Created by Felipe Zamudio on 17/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import Foundation

enum CourseIDs: Int {
    case VBG = 1
    case PLC = 2
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

/// Indices para el curso *Violencia Basada en Genero*
enum VBG_INDEX: Int {
    case M0P0 // Página de bienvenida al curso
    case M0P1 
    case M1P0 // Inicio Modulo 1
    case M1P1
    case M1P2
    case M1P3
    case M1P4
    case M1P5
    case M1P6
    case M1P7
    case M1TEST // Crucigrama
    case M1COMPLET
    case VBG_13 // MODULO 3
    case VBG_14
    case VBG_15
    case VBG_16
    case VBG_17
    case VBG_18
    case VBG_19
    case VBG_20
    case VBG_21
    case VBG_22
    case VBG_23
    case VBG_24
    case VBG_25
    case VBG_26
    case VBG_27
    case VBG_28
    case VBG_29
    case VBG_30
    case VBG_31
    case VBG_32
    case VBG_33
    case VBG_34
    case VBG_35
    case VBG_36
    case VBG_37
    case VBG_38
    case VBG_39
    case VBG_40
    case VBG_41
    case VBG_42
    case VBG_43
    case VBG_44
    case VBG_45
    case VBG_46
    case VBG_47
    case VBG_48
    case VBG_49
    case VBG_50
    case VBG_51
    case VBG_52
    case VBG_53
    case VBG_54
    case VBG_55
}

/// Indices para el curso *Protección Lideres Comunitarios*
enum PLC_INDEX: Int {
    case LEADERS_1
    case LEADERS_2
    case LEADERS_3
    case LEADERS_4
    case LEADERS_5
    case LEADERS_6
    case LEADERS_7
    case LEADERS_8
    case LEADERS_9
    case LEADERS_10
    case LEADERS_11
    case LEADERS_12
    case LEADERS_13
    case LEADERS_14
    case LEADERS_15
    case LEADERS_16
    case LEADERS_17
    case LEADERS_18
    case LEADERS_19
    case LEADERS_20
    case LEADERS_21
    case LEADERS_22
    case LEADERS_23
    case LEADERS_24
    case LEADERS_25
    case LEADERS_26
    case LEADERS_27
    case LEADERS_28
    case LEADERS_29
}

enum AUDIO_ID: Int {
    case AUD_1
    case AUD_2
    case AUD_3
    case AUD_4
    case AUD_5
    case AUD_6
    case AUD_7
    case AUD_8
    case AUD_9
    case AUD_10
    case AUD_11
    case AUD_12
    case AUD_13
    case AUD_14
    case AUD_15
    case AUD_16
    case AUD_17
    case AUD_18
    case AUD_19
    case AUD_20
    case AUD_21
}
