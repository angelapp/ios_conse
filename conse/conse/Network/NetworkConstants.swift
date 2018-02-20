//
//  NetworkConstants.swift
//  conse
//
//  Created by Felipe Zamudio on 4/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import Foundation

enum ResponseCallback {
    case succeeded(succeed: Bool, message: String)
    case succeededObject(result: AnyObject)
    case succeededArray(result: Array<AnyObject>)
    case error(error: Error?)
}

enum CustomError:Error {
    case NoData(description:String)
}

enum NetworkRestMethods: String {
    case methodGET = "GET"
    case methodPOST = "POST"
    case methodPUT = "PUT"
}

/// Status Response Code
struct NetworkCodes {
    static let internalServerError = 500
    static let successful = 200
    static let created = 201
    static let notFound = 404
}

/// Strings para configurar los Headers
struct NetworkConfig {
    //Root Api url
    #if DEBUG
        static let urlAccess = "https://consejo.nrc.org.co/api/"
    #else
        static let urlAccess = "https://consejo.nrc.org.co/api/"
    #endif
    
    //Header
    static let headerAccept = "Accept"
    static let headerApikey = "Api-Key"
    static let headerAuthorization = "Authorization"
    static let headerContentType = "Content-Type"
    
    //Header's values
    static let appJson = "application/json"
    static let token = "Token "
    
    #if DEBUG
        static let apiKey = "3036c87d7f906cc2b8155b7a70428eb008de81aa"
    #else
        static let apiKey = "3036c87d7f906cc2b8155b7a70428eb008de81aa"
    #endif
    
    //Key
    static let headerName = "header"
    static let headerValue = "value"
}

/// Formatos para complementar las URL
struct NetworkURLComplement {
    static let update_profile = "%d/"
}

/// Mensajes de error
struct NetworkErrorMessage {
    static let BirthdateFormatError = "Date has wrong format."
    static let createRequestError = "Error creating request"
    static let defaultRequestError = "Failed Request!"
    static let downloadError = "¡No se pudo descargar este archivo!"
    static let fileExistsError = "¡Ya has descargado este archivo anteriormente!"
    static let internalServerError = "Parece que hubo algún problema, por favor intentalo más tarde o comunicate con soporte"
    static let msnDefaultError = "No hay respuesta del servidor, por favor revise su conexión a internet"
    static let nilResponseError = "Error response is nil"
    static let notConexionError = "No hay respuesta del servidor, por favor revise su conexión a internet"
    static let notFoundError = "¡Archivo no encontrado!"
    static let parsingResultError = "Error parsing result"
}

/// String para establecer el 'EndPoint' de los métodos POST
struct NetworkPOST {
    static let CREATE_USER = "create_user/"
    static let CONTACT_FORM = "contact_form/"
    static let AVATAR_LIST = "user_avatar/"
    static let USER_PROGRESS_LIST = "user_progress/"
    static let USER_LOGGIN = "user_auth/"
    static let PASSWORD_RECOVERY = "user_password_recovery/"
}

/// String para establecer el 'EndPoint' de los métodos GET
struct NetworkGET {
    static let APP_CONFIGURATION = "applicationConfiguration/1/"
    static let LIBRARY_DOCS = "get_library_docs/"
    static let NEWS = "get_news_list/"
    static let SHIELDS = "get_corporate_phone_book"
}

/// String of the 'EndPoint' to PUT Method
struct NetworkPUT {
    static let USER_PROFILE_EDIT = "profile/"
}
