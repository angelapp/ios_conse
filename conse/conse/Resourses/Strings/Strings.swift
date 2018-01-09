//
//  Strings.swift
//  conse
//
//  Created by Felipe Zamudio on 3/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import Foundation

let appName = "Conse"
let debugFlag = "♻️ \(appName)_Debug: "

let blankSpace = " "
let nullString = ""
let titleTextColor = "titleTextColor"

struct Strings {
    
    static let loader_configApp = "Obteniendo configuración de la aplicación"
    static let loader_loading = "Cargando..."
    
    static let terms_Copy = "términos, condiciones, políticas de privacidad y de tratamientos de datos"
    
    static let body_AlertConfig = "Selecciona tres contactos de confianza a quienes les llegarán las alertas en caso de que te encuentres en una situación de peligro"
    static let body_Checkbox_Beneficiary = "Soy beneficiario de los programas NRC"
    static let body_Checkbox_AcceptTerms = "Acepto los \(terms_Copy) del NRC"
    
    static let error_message_notAvailable = "No disponible"
    
    static let title_AlertConfig = "Configura el botón de alerta"
    static let title_AlertTest = "Haz una prueba de funcionamiento"
}

struct observerName {
    static let stop_loader = "stopLoader"
}
