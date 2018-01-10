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
    
    static let birthday_placeholder = "DÍA/MES/AÑO"
    
    static let body_AlertConfig = "Selecciona tres contactos de confianza a quienes les llegarán las alertas en caso de que te encuentres en una situación de peligro"
    static let body_Checkbox_Beneficiary = "Soy beneficiario de los programas NRC"
    static let body_Checkbox_AcceptTerms = "Acepto los %@ del NRC"
    
    static let button_accept = "Aceptar"
    
    static let error_message_invalidEmail = "Correo no valido"
    static let error_message_notAvailable = "No disponible"
    static let error_message_passNotMatch = "Las contraseñas no coinciden"
    static let error_message_requieredField = "Debe diligenciar este campo"
    static let error_message_requieredData = "Debe completar información"
    
    static let hasHTTPProtocol = "http"
    static let httpProtocol = "http://"
    
    static let loader_configApp = "Obteniendo configuración de la aplicación"
    static let loader_loading = "Cargando..."
    
    static let terms_Copy = "términos, condiciones, políticas de privacidad y de tratamientos de datos"
    
    static let texfiled_placeholder = "Seleccione"
    
    static let title_AlertConfig = "Configura el botón de alerta"
    static let title_AlertTest = "Haz una prueba de funcionamiento"
    
    static let youtubeEmbedFormat = "https://www.youtube.com/embed/%@"
}

// MARK: - Formats

/// Formatos de fecha
struct DateTimeFormat {
    static let formatByZone = "yyyy-MM-dd'T'HH:mm:ssXXX"
    static let formatInMillis = "yyyy-MM-dd'T'HH:mm:ss.SSS"
    static let formatInMillisZone = "yyyy-MM-dd'T'HH:mm:ss.SSSXXX"
    
    static let shortDateFormat = "dd/MM"
    static let shortTimeFormat = "HH:mm"
    static let commonDateFormat = "dd/MM/yyyy"
    static let sendDateFormat = "yyyy-MM-dd"
    
    static let hourMinuteSecondFormat = "%02i:%02i:%02i"
}

/// Formatos, y Expresiones regulares
struct Formats {
    
    static let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    static let phoneRegEx = "^\\d{10}$"
    static let matchesFormat = "SELF MATCHES %@"
}
