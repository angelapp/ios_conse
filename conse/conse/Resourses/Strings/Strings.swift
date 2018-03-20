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
let subject = "Subject"
let titleTextColor = "titleTextColor"
let defaultVideoID = "XxSK31L1D9A"
let resetButtonTitle = "Reiniciar Curso"

let URL_GENERAL_SETTINGS = "App-Prefs:root=General"
let URL_LOCATION_SERVICES = "App-Prefs:root=LOCATION_SERVICES"
let URL_WIFI_SETTINGS = "App-Prefs:root=WIFI"

struct AvatarStrings {
    static let makeYourAvatarTitle = "Arma tu Conse"
    static let makeYourAvatarMessage = "Inicia por escoger el género, depués, podrás definir las características físicas que más te gusten para tu Consejero o Consejera ¡Será quien te acompañe mientras usas la aplicación!"
}

struct Strings {
    
    static let birthday_placeholder = "DÍA/MES/AÑO"
    static let body_AlertConfig = "Ingresa de 1 a 3 contactos"
    static let body_Checkbox_Beneficiary = "Soy beneficiario de los programas NRC"
    static let body_Checkbox_AcceptTerms = "Acepto los %@ del NRC"
    static let button_accept = "Aceptar"
    static let button_cancel = "CANCELAR"
    static let button_settings = "CONFIGURACIÓN"
    
    static let copy_aboutusTitle = ""
    static let copy_aboutusTitle_tab1 = "QUIENES SOMOS"
    static let copy_aboutusTitle_tab2 = "QUE HACEMOS"
    static let copy_aboutusTitle_tab3 = "DONDE TRABAJAMOS"
    static let copy_contactusMessageType = "Tipo de mensaje"
    static let copy_contactusMessage = "Tu mensaje"
    static let copy_contactusTitle = "CONTÁCTENOS"
    static let copy_download = "Descargar"
    static let copy_downloading = "Descargando..."
    static let copy_letStartMessage = "Hola soy tu Conse y voy a estar acompañándote en este recorrido. Traigo mucha información y herramientas que me gustaría compartir contigo"
    static let copy_letStartTitle = "¡Iniciemos!"
    static let copy_profileEdit = "Actualiza tu perfil"
    static let copy_profileTitle = "Completa tu perfil"
    static let copy_progressTitle = "MI PROGRESO"
    static let copy_progressTab_VBG = "Violencia Basada en Género"
    static let copy_progressTab_LEADERS = "Protección de lideres y lideresas"
    static let copy_testAlerthelp = "MANTÉN PULSADO EL BOTÓN PARA ENVIAR"
    static let copy_testAlertMessage = "Ahora eres mi contacto de emergencia. \nEsta es una prueba"
    static let copy_testAlertTitle = "¿Estás seguro de enviar esta alerta?"
    
    static let image_advanced = "icon_progress_experto"
    static let image_advanced_off = "icon_progress_expertoapagado"
    static let image_begginer = "icon_progress_principiante"
    static let image_begginer_off = "icon_progress_principianteapagado"
    static let image_expert = "icon_progress_conocedor"
    static let image_expert_off = "icon_progress_conocedorapagado"
    static let image_star = "icon_progress_avanzado"
    static let image_star_off = "icon_progress_avanzadoapagado"
    
    static let error_message_avatarIncomplete = "¡Falta seleccionar una parte del ávatar!"
    static let error_message_invalidEmail = "Correo no válido"
    static let error_message_locationDisabled = "Conse necesita acceso a tu ubicación. Activa los servicios de geolocalización"
    static let error_message_notAvailable = "El contacto no tiene número telefónico"
    static let error_message_notAvailableAction = "El dispositivo no puedo realizar esta acción."
    static let error_message_notIntenertConection = "Debes tener una conexión activa a internet"
    static let error_message_notUserValidCredentials = "Credenciales inválidas"
    static let error_message_passNotMatch = "Las contraseñas no coinciden"
    static let error_message_requieredField = "Debes diligenciar este campo"
    static let error_message_requieredData = "Debes completar información"
    static let error_message_terms = "Debes diligenciar este campo"
    
    static let error_no_audio = "No se encuentra el archivo"
    static let error_play_audio = "No se pudo cargar el Audio"

    static let error_title_locationDisabled = "Geolocalización desactivada"
    static let error_title_notInternetConection = "No hay conexión a internet"
    
    static let emergency_label = "También puedes llamar gratis, todos los días y a cualquier hora, a las siguientes líneas telefónicas:"
    static let emergency_line_123 = "123"
    static let emergency_line_123_message = "Línea nacional de atención de emergencias " + emergency_line_123
    static let emergency_line_141 = "141"
    static let emergency_line_141_message = "Línea de orientación del ICBF si la violencia es contra niños, niñas y adolescentes " + emergency_line_141
    static let emergency_line_155 = "155"
    static let emergency_line_155_message = "Línea de orientación a las mujeres vícitmas de violencia " + emergency_line_155
    static let emergency_SMS = "Estoy en PELIGRO, necesito ayuda URGENTE"
    static let emergency_SMS_test = "Ahora eres mi contacto de emergencia. Esta es una prueba. Estoy ubicado en "
    
    static let fullname_format = "%@ %@"
    
    static let hasHTTPProtocol = "http"
    static let httpProtocol = "http://"
    
    static let level_advanced = "Avanzado"
    static let level_begginer = "Conocedor"
    static let level_expert = "Experto"
    static let level_star = "Estrella"
    static let loader_configApp = "Obteniendo configuración de la aplicación"
    static let loader_getLegal = "Obteniendo biblioteca ..."
    static let loader_getNews = "Obteniendo listado de noticias..."
    static let loader_getShield = "Obteniendo Listado de Escudos de Protección"
    static let loader_loading = "Cargando..."
    static let loader_login = "Autenticando usuario..."
    static let loader_recording = "Guardando..."
    static let loader_recovery = "Recuperando contraseña..."
    static let loader_sendEmail = "Enviando email ..."
    
    static let message_ok_contact = "Se ha enviado tu mensaje"
    static let message_ok_update = "Información actualizada"
    
    static let news_message = "Pulse sobre cada enlace para acceder a la información actualizada en temas de protección y seguridad. Debes estar conectado a internet para poder ver los contenidos."
    
    static let placeholder_yourMessage = "Escribe aquí tu mensaje"
    
    static let review_content = "¿Quieres revisar nuevamente los contenidos de este módulo?"
    
    static let terms_Copy = "términos, condiciones, políticas de privacidad y de tratamientos de datos"
    static let texfiled_placeholder = "Selecciona"
    static let title_AlertConfig = "Configura el botón de alerta"
    static let title_AlertTest = "Haz una prueba de funcionamiento"
    static let title_for_share = "Plantilla compartida desde Conse"
    
    static let youtubeEmbedFormat = "https://www.youtube.com/embed/%@"
}

struct ImageName {
    static let next = "btn_siguiente"
    static let nextHover = "btn_siguiente_hover"
    static let tryAgain = "btn_intentar"
    static let tryAgainHover = "btn_intentar_hover"
}

// MARK: - Images names
struct RoutesImages {
    
    // Protection route
    static let leadersRoute1_1 = "protection_path_leaders_01"
    static let leadersRoute1_2 = "protection_path_leaders_02"
    static let leadersRoute1_3 = "protection_path_leaders_03"
    static let leadersRoute1_4 = "protection_path_leaders_04"
    static let leadersRoute1_5 = "protection_path_leaders_05"
    static let leadersRoute1_6 = "protection_path_leaders_06"
    static let leadersRoute1_7 = "protection_path_leaders_07"
    static let leadersRoute2_1 = "protection_path_leaders_08"
    static let leadersRoute2_2 = "protection_path_leaders_09"
    static let leadersRoute2_3 = "protection_path_leaders_10"
    static let leadersRoute2_4 = "protection_path_leaders_11"
    static let leadersRoute2_5 = "protection_path_leaders_12"
    static let vgbRoute_1 = "protection_path_vbg_01"
    static let vgbRoute_2 = "protection_path_vbg_02"
    static let vgbRoute_3 = "protection_path_vbg_03"
    static let vgbRoute_4 = "protection_path_vbg_04"
    static let vgbRoute_5 = "protection_path_vbg_05"
    static let vgbRoute_6 = "protection_path_vbg_06"
    
    // Leaders Course
    static let route_leaders_35 = "Ruta_Leaders_35"
    static let route_leaders_37 = "Ruta_Leaders_37"
    static let route_leaders_50 = "Ruta_Leaders_50"
    
    // VBG Course
    static let route_VBG_19 = "ruta_mod3_1"
    static let route_VBG_21 = "ruta_mod3_2"
    static let route_VBG_23 = "ruta_mod3_3"
    static let route_VBG_25 = "ruta_mod3_4"
    static let route_VBG_26 = "ruta_mod3_5"
    static let route_VBG_27 = "ruta_mod3_6"
    static let route_VBG_29 = "ruta_mod3_7"
    static let route_VBG_37 = "ruta_mod4_1"
    static let route_VBG_38 = "ruta_mod4_2"
}

struct BackgroundInsignia {
    static let bg_01 = "bg_modulo_1"
    static let bg_02 = "bg_ros"
    static let bg_03 = "bg_45"
    static let bg_04 = "bg_66"
    
    static let insignia_01 = "insignia_MOD1"
    static let insignia_02 = "insignia_MOD2"
    static let insignia_03 = "insignia_MOD3"
    static let insignia_04 = "insignia_MOD4"
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
    
    static let callFormat = "tel://%@"
    static let legalHeaderFormat = "%@ - %@"
    static let shieldURLComplement = "?latitude=%@&longitude=%@"
    static let successDownload = "El archivo: %@ fue descragado exitosamente"
    static let testAlertMessage = "%@ http://maps.google.com/?q=%@,%@" // Message, Latitute, Longitude
    static let bodyEmailShare = "Plantilla %@"
}
