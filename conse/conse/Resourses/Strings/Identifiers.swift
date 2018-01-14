//
//  Identifiers.swift
//  conse
//
//  Created by Felipe Zamudio on 3/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import Foundation

/// Cells Identifiers
struct CellsId {
    static let contact = "contactCell"
}

/// Storyboards Identifiers
struct StoryboardsId {
    static let auth = "Authentication"
    static let configAlert = "ConfigAlert"
    static let main = "Main"
    static let popup = "Popup"
}

/// View controllers Identifiers
struct ViewControllersId {
    static let aboutUs = "aboutUsVC"
    static let configAlert = "ConfigAlertVC"
    static let contactUs = "contactUsVC"
    static let choiceAvatarGender = "choiceAvatarGenderVC"
    static let documentBank = "documentBankVC"
    static let emergencyCallPopup = "emergencyCallPopupVC"
    static let leftMenu = "leftMenuVC"
    static let letStart = "letStartVC"
    static let loader = "loaderVC"
    static let login = "loginVC"
    static let main = "mainVC"
    static let makeAvatar = "makeYourAvatarVC"
    static let myCourses = "myCourseVC"
    static let recoveryPass = "recoveryPasswordVC"
    static let register = "registerVC"
    static let rigthProgressPopup = "rigthProgressVC"
    static let sendAlertPopup = "sendAlertPopupVC"
    static let swMenu = "SWRevealViewController"
    static let testAlert = "TestAlertVC"
    static let welcome = "welcomeVC"
}

/// Observer name's
struct observerName {
    static let stop_loader = "stopLoader"
    static let close_session = "closeSession"
    static let tapped_menuAbout = "menuAboutNRC"
    static let tapped_menuContact = "menuContactus"
}

/// Segue Identifiers
struct segueID {
    static let makeYourAvatar = "makeYourAvatar"
    static let savedContacs = "savedContacts"
    static let showAvatar = "showAvatar"
    static let swFront = "sw_front"
    static let swRear = "sw_rear"
}
