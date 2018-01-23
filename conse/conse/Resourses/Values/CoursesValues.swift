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
}

/// Indices para el curso *Protección Lideres Comunitarios*
enum PLC_INDEX: Int {
    case M0P0 // Página de bienvenida al curso
    case M1P1 // Inicio Modulo 1
    case M1P2
    case M1P3
    case M1P4
    case M1P5
    case M1P6
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
}
