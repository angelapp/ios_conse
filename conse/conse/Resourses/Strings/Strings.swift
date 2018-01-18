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
let jumpLine = "\n"
let titleTextColor = "titleTextColor"

struct Strings {
    
    static let birthday_placeholder = "DÍA/MES/AÑO"
    static let body_AlertConfig = "Selecciona tres contactos de confianza a quienes les llegarán las alertas en caso de que te encuentres en una situación de peligro"
    static let body_Checkbox_Beneficiary = "Soy beneficiario de los programas NRC"
    static let body_Checkbox_AcceptTerms = "Acepto los %@ del NRC"
    static let button_accept = "Aceptar"
    
    static let copy_aboutusTitle = ""
    static let copy_aboutusTitle_tab1 = "QUIENES SOMOS"
    static let copy_aboutusTitle_tab2 = "QUE HACEMOS"
    static let copy_aboutusTitle_tab3 = "DONDE TRABAJAMOS"
    static let copy_contactusMessageType = "Tipo de mensaje"
    static let copy_contactusMessage = "Tu mensaje"
    static let copy_contactusTitle = "CONTÁCTENOS"
    static let copy_letStartMessage = "Hola soy tu Conse y voy a estar acompañándote en este recorrido. Traigo mucha información y herramientas que me gustaría compartir contigo"
    static let copy_letStartTitle = "¡Iniciemos!"
    static let copy_profileTitle = "Completa tu perfil"
    static let copy_testAlerthelp = "MANTÉN PULSADO EL BOTÓN PARA ENVIAR"
    static let copy_testAlertMessage = "Ahora eres mi contacto de emergencia. \nEsta es una prueba"
    static let copy_testAlertTitle = "¿Estás seguro de enviar esta alerta?"
    
    static let error_message_avatarIncomplete = "¡Falta seleccionar una parte del ávatar!"
    static let error_message_invalidEmail = "Correo no valido"
    static let error_message_notAvailable = "El contacto no tiene número telefónico"
    static let error_message_notAvailableAction = "Este dispositivo no puede realizar esta acción"
    static let error_message_passNotMatch = "Las contraseñas no coinciden"
    static let error_message_requieredField = "Debe diligenciar este campo"
    static let error_message_requieredData = "Debe completar información"
    
    static let emergency_line_123 = "123"
    static let emergency_line_123_message = "Línea nacional de atención de emergencias \(emergency_line_123)"
    static let emergency_line_141 = "141"
    static let emergency_line_141_message = "Línea de orientación del ICBF si la violencia es contra niños, niñas y adolescentes \(emergency_line_141)"
    static let emergency_line_155 = "155"
    static let emergency_line_155_message = "Línea de orientación a las mujeres vícitmas de violencia \(emergency_line_155)"
    static let emergency_SMS = "Estoy en PELIGRO, necesito ayuda URGENTE"
    static let emergency_SMS_test = "Ahora eres mi contacto de emergencia. Esta es una prueba"
    
    static let fullname_format = "%@ %@"
    
    static let hasHTTPProtocol = "http"
    static let httpProtocol = "http://"
    
    static let loader_configApp = "Obteniendo configuración de la aplicación"
    static let loader_loading = "Cargando..."
    
    static let message_ok_contact = "Se ha enviado tu mensaje"
    static let message_ok_update = "Información actualizada"
    
    static let placeholder_yourMessage = "Escribe aquí tu mensaje"
    
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
    
    static let testAlertMessage = "%@ http://maps.google.com/?q=%@,%@"
    static let callFormat = "tel://@%"
}
