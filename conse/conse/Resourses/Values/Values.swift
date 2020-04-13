//
//  Values.swift
//  conse
//
//  Created by Felipe Zamudio on 2/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import Foundation
import UIKit

let SKIN_GRID = 0
let HAIR_GRID = 1
let EYES_GRID = 2
let MOUTH_GRID = 3
let ACCESSORIES_GRID = 4

struct ConseValues {
    
    static let radius: CGFloat = 10.0 // Radio para redondear las esquinas 
    
    static let defaultPositionX: CGFloat = 0.0
    static let defaultPositionY: CGFloat = 0.0
    
    static let margin: CGFloat = 16.0
    static let innerMargin: CGFloat = 8.0
    
    /// Altura por defecto para una vista que esta oculta
    static let defaultHeight: CGFloat = 0.0
    /// Altura máxima del checkbox
    static let checkboxHeight_register: CGFloat = 52
    /// Margen inferior con boton de panico visible
    static let marginBotton_edit: CGFloat = 58
    /// Margen inferior con boton de panico oculto
    static let marginBotton_register: CGFloat = 20
    /// Altura de la barra de navegación
    static let navbarHeight_register: CGFloat = 40
    
    /// Margin Value *0.0*
    static let defaultMargin: CGFloat = 0.0
    /// Valor de la altura para la sección *"Beneficiario progragama NRC"*
    static let dataNCRHeight: CGFloat = 480.0
    /// Valor de la altura para la sección *"Usuario Conse"* en la pantalla registro
    static let conseUser_Height: CGFloat = 170.0
    /// Valor de la altura para la sección *"Usuario Conse"* en la pantalla editar perfil
    static let conseUserProfile_Heigth: CGFloat = 74.0
    /// Valor de la altura para la sección *"Terminos y Condiciones"* **Registro**
    static let termsHeigth_register: CGFloat = 142.0
    /// Valor de la altura para la sección *"Terminos y Condiciones"* **Perfil**
    static let termsHeigth_profile: CGFloat = 90.0
    /// Valor de la altura para la sección *"Avatar y Contactos"* **Perfil**
    static let avatarContactsHeight: CGFloat = 140.0
}

// MARK: - Índices usados para crear el avatar
enum AvatarGenderIDs: Int {
    case male = 1
    case female
}
enum AvatarPiecesIDs: Int {
    case Accessories = 1
    case Hair
    case Skin
    case Eyes
    case Mouth
}

// MARK: - Identificador de las vistas
/// Id númerico de las vistas
enum ViewControllerTag : Int {
    case aboutUs
    case aboutUs_tab1
    case aboutUs_tab2
    case aboutUs_tab3
    case community
    case configAlert
    case contactUs
    case choiceAvatarGender
    case crosswordHelpPopup
    case courseMessagePopup
    case courseVBG
    case coursePLC
    case documentBank
    case downloadPopup
    case editProfile
    case emergencyCallPopup
    case formatBank
    case leadersRoute
    case leadersRouteOne
    case leadersRouteTwo
    case leftMenu
    case legal
    case letStart
    case loader
    case login
    case main
    case makeAvatar
    case myCourses
    case news
    case openFile
    case progress
    case protectionRoutes
    case protectionShield
    case recoveryPass
    case register
    case rigthProgressPopup
    case selectRoute
    case sendAlertPopup
    case swMenu
    case testAlert
    case vbgRoute
    case vbgRouteOne
    case videoPlayer
    case welcome
}

/// Estados de un mensaje 
enum TypeMessage: Int {
    case failed
    case success
}

enum IdView : Int {
    case NCR_DATA
    case CITY_SELECTOR
}

// MARK: - Índices para las rutas e Protección
enum LeadersRouteOneIndex : Int {
    case route1, route2, route3, route4, route5, route6, route7
}

enum LeadersRouteTwoIndex : Int {
    case route1, route2, route3, route4, route5
}

enum VBGRouteIndex : Int {
    case route1, route2, route3, route4, route5, route6
}
