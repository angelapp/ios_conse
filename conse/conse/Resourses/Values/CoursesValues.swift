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
