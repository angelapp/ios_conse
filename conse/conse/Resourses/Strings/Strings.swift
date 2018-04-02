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

// MARK: - AVATAR, Config
struct AvatarStrings {
    static let makeYourAvatarTitle = "Arma tu Conse"
    static let makeYourAvatarMessage = "Inicia por escoger el género, depués, podrás definir las características físicas que más te gusten para tu Consejero o Consejera ¡Será quien te acompañe mientras usas la aplicación!"
}

struct ConfigStrings {
    static let alertConfig = "Ingresa de 1 a 3 contactos"
    
    static let letStartMessage = "Hola soy tu Conse y voy a estar acompañándote en este recorrido. Traigo mucha información y herramientas que me gustaría compartir contigo"
    static let letStartTitle = "¡Iniciemos!"
    
    static let testAlerthelp = "MANTÉN PULSADO EL BOTÓN PARA ENVIAR"
    static let testAlertMessage = "Ahora eres mi contacto de emergencia. \nEsta es una prueba"
    static let testAlertTitle = "¿Estás seguro de enviar esta alerta?"
    static let title_AlertConfig = "Configura el botón de alerta"
    static let title_EditAlertConfig = "Editar el botón de alerta"
    static let title_AlertTest = "Haz una prueba de funcionamiento"
}

struct Strings {
    static let aboutNRC_title = ""
    static let aboutNRC_tab1 = "QUIENES SOMOS"
    static let aboutNRC_tab2 = "QUE HACEMOS"
    static let aboutNRC_tab3 = "DONDE TRABAJAMOS"
    
    static let birthday_placeholder = "DÍA/MES/AÑO"
    
    static let button_accept = "Aceptar"
    static let button_cancel = "CANCELAR"
    static let button_settings = "CONFIGURACIÓN"
    
    static let checkbox_AcceptTerms = "Acepto los %@ del NRC"
    static let checkbox_Beneficiary = "Soy beneficiario de los programas NRC"
    
    static let contact_kindOfMessage = "Tipo de mensaje"
    static let contact_messagePlaceholder = "Escribe aquí tu mensaje"
    static let contact_messageTitle = "Tu mensaje"
    static let contact_telephonePlaceholder = "Tú Teléfono"
    static let contact_title = "DÉJANOS TU MENSAJE"
    
    static let download = "Descargar"
    static let downloading = "Descargando..."
    static let profileEdit = "Actualiza tu perfil"
    static let profileTitle = "Completa tu perfil"
    
    static let fullname_format = "%@ %@"
    
    static let hasHTTPProtocol = "http"
    static let httpProtocol = "http://"
    
    static let level_advanced = "Avanzado"
    static let level_begginer = "Conocedor"
    static let level_expert = "Experto"
    static let level_star = "Estrella"
    
    static let message_ok_contact = "Se ha enviado tu mensaje"
    static let message_ok_update = "Información actualizada"
    
    static let news_message = "Pulsa sobre cada enlace para acceder a la información actualizada en temas de protección y seguridad. Debes estar conectado a internet para poder ver los contenidos."
    
    static let review_content = "¿Quieres revisar nuevamente los contenidos de este módulo?"
    
    static let terms_Copy = "términos, condiciones, políticas de privacidad y de tratamientos de datos"
    static let texfiled_placeholder = "Selecciona"
    static let title_for_share = "Plantilla compartida desde Conse"
    
    static let youtubeEmbedFormat = "https://www.youtube.com/embed/%@"
}

// MARK: - Emergency
struct EmergencyStrings {
    static let label_01 = "Puedes llamar gratis, todos los días y a cualquier hora, a las siguientes líneas telefónicas:"
    
    static let line_123 = "123"
    static let line_141 = "141"
    static let line_155 = "155"
    static let line_123_message = "Línea nacional de atención de emergencias " + line_123
    static let line_141_message = "Línea de orientación del ICBF si la violencia es contra niños, niñas y adolescentes " + line_141
    static let line_155_message = "Línea de orientación a las mujeres vícitmas de violencia " + line_155
    
    static let label_02 = "De lunes a viernes de 8:00am a 4:30pm"
    
    static let UNP_BOG = "0314269800"
    static let line_nal = "018000118228"
    static let line_bog = "(1) 4269800"
    static let line_nal_label = "Unidad Nacional de Protección línea nacional 018000118228"
    static let line_bog_label = "Unidad Nacional de Protección en Bogotá (1) 4269800"
    
    static let SMS = "Estoy en PELIGRO, necesito ayuda URGENTE"
    static let SMS_test = "Ahora eres mi contacto de emergencia. Esta es una prueba. Estoy ubicado en "
}

struct ErrorStrings {
    static let audioNotFound = "No se encuentra el archivo"
    static let audioDontLoad = "No se pudo cargar el Audio"
    static let avatarIncomplete = "¡Falta seleccionar una parte del ávatar!"
    static let invalidCredentials = "Credenciales inválidas"
    static let invalidEmail = "Correo no válido"
    static let disabledAction = "El dispositivo no puedo realizar esta acción."
    static let disabledIntenert = "Debes tener una conexión activa a internet"
    static let disabledLocation = "Conse necesita acceso a tu ubicación. Activa los servicios de geolocalización"
    static let passNotMatch = "Las contraseñas no coinciden"
    static let requiredData = "Debes completar información"
    static let requiredField = "Debes diligenciar este campo"
    static let requiredterms = "Debes diligenciar este campo"
    static let withoutNumber = "El contacto no tiene número telefónico"
    
    static let title_disabledLocation = "Geolocalización desactivada"
    static let title_disabledInternet = "No hay conexión a internet"
}

struct LoaderStrings {
    static let configApp = "Obteniendo configuración de la aplicación"
    static let getLegal = "Obteniendo biblioteca ..."
    static let getNews = "Obteniendo listado de noticias..."
    static let getShield = "Obteniendo Listado de Escudos de Protección"
    static let loading = "Cargando..."
    static let login = "Autenticando usuario..."
    static let recording = "Guardando..."
    static let recovery = "Recuperando contraseña..."
    static let sendEmail = "Enviando email ..."
}

struct ProgressStrings {
    static let message = "Puedes volver al incio de cada módulo pulsando sobre el ícono correspondiente"
    static let title = "MI PROGRESO"
    static let tab_VBG = "Violencia Basada en Género"
    static let tab_LEADERS = "Protección de lideres y lideresas"
    
    static let image_advanced = "icon_progress_experto"
    static let image_advanced_off = "icon_progress_expertoapagado"
    static let image_begginer = "icon_progress_principiante"
    static let image_begginer_off = "icon_progress_principianteapagado"
    static let image_expert = "icon_progress_conocedor"
    static let image_expert_off = "icon_progress_conocedorapagado"
    static let image_star = "icon_progress_avanzado"
    static let image_star_off = "icon_progress_avanzadoapagado"
}

// MARK: - Images
struct ImageName {
    static let addOther = "btn_addOther"
    static let addOtherHover = "btn_addOther_hover"
    static let endUpdate = "btn_endUpdate"
    static let endUpdateHover = "btn_endUpdate_hover"
    static let next = "btn_siguiente"
    static let nextHover = "btn_siguiente_hover"
    static let next_1 = "btn_siguiente_01"
    static let nextHover_1 = "btn_siguientehover_01"
    static let tryAgain = "btn_intentar"
    static let tryAgainHover = "btn_intentar_hover"
    static let upateProfile = "btn_actualizar"
    static let upateProfileHover = "btn_actualizar_hover"
}

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
    static let contactMessage = "Teléfono: %@ \n\n Mensaje: %@ \n\n Nombres: %@ \n\n Email: %@"
    static let legalHeaderFormat = "%@ - %@"
    static let shieldURLComplement = "?latitude=%@&longitude=%@"
    static let successDownload = "El archivo: %@ fue descragado exitosamente"
    static let testAlertMessage = "%@ http://maps.google.com/?q=%@,%@" // Message, Latitute, Longitude
    static let bodyEmailShare = "Plantilla %@"
}
