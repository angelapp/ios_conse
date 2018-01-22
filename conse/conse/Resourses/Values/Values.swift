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
    
    static let defaultPositionX: CGFloat = 0.0
    static let defaultPositionY: CGFloat = 0.0
    
    static let margin: CGFloat = 16.0
    static let innerMargin: CGFloat = 8.0
    
    static let notHeight: CGFloat = 0.0
    static let dataNCRHeight: CGFloat = 397.0
    static let conseUser_Height: CGFloat = 150.0
    static let conseUserProfile_Heigth: CGFloat = 74.0
}

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

enum ViewControllerTag : Int {
    case aboutUs
    case aboutUs_tab1
    case aboutUs_tab2
    case aboutUs_tab3
    case configAlert
    case contactUs
    case choiceAvatarGender
    case crosswordHelpPopup
    case courseVBG
    case coursePLC
    case documentBank
    case downloadPopup
    case editProfile
    case emergencyCallPopup
    case formatBank
    case leftMenu
    case legal
    case letStart
    case loader
    case login
    case main
    case makeAvatar
    case myCourses
    case protectionShield
    case recoveryPass
    case register
    case rigthProgressPopup
    case sendAlertPopup
    case swMenu
    case testAlert
    case welcome
}

enum IdView : Int {
    case NCR_DATA
    case CITY_SELECTOR
}
