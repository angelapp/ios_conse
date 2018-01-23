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
    static let aboutNRC1 = "aboutNRC1Cell"
    static let aboutNRC2 = "aboutNRC2Cell"
    static let aboutNRC3 = "aboutNRC3Cell"
    static let aboutWeDo1 = "aboutWeDo1Cell"
    static let aboutWeDo2 = "aboutWeDo2Cell"
    static let aboutWeDo3 = "aboutWeDo3Cell"
    static let aboutWeDo4 = "aboutWeDo4Cell"
    static let aboutWeDo5 = "aboutWeDo5Cell"
    static let aboutWeDo6 = "aboutWeDo6Cell"
    static let aboutWeDo7 = "aboutWeDo7Cell"
    static let aboutWhere1 = "aboutWhere1Cell"
    static let aboutWhere2 = "aboutWhere2Cell"
    
    static let contact = "contactCell"
    static let communityBody = "communitylBodyCell"
    static let communityHeader = "communityHeaderCell"
    static let formatBank = "formatBankCell"
    static let legalBody = "legalBodyCell"
    static let legalHeader = "legalHeaderCell"
    static let shieldBody = "shieldBodyCell"
    static let shieldHeader = "shieldHeaderCell"
    
    static let VBG_M0P0 = "VBG_M0P0_CELL"
    static let VBG_M0P1 = "VBG_M0P1_CELL"
    static let VBG_M1P0 = "VBG_M1P0_CELL"
    static let VBG_M1P1 = "VBG_M1P1_CELL"
    static let VBG_M1P2 = "VBG_M1P2_CELL"
    static let VBG_M1P3 = "VBG_M1P3_CELL"
    static let VBG_M1P4 = "VBG_M1P4_CELL"
    static let VBG_M1P5 = "VBG_M1P5_CELL"
    static let VBG_M1P6 = "VBG_M1P6_CELL"
    static let VBG_M1P7 = "VBG_M1P7_CELL"
    static let VBG_M1TEST = "VBG_CROSSWORD_CELL"  // Test Modulo 1 (Crucigrama)
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
    static let aboutUs_tab1 = "aboutusTab1VC"
    static let aboutUs_tab2 = "aboutusTab2VC"
    static let aboutUs_tab3 = "aboutusTab3VC"
    static let community = "myCommunityVC"
    static let configAlert = "ConfigAlertVC"
    static let contactUs = "contactUsVC"
    static let courseVBG = "courseVBGVC"
    static let coursePLC = "coursePLCVC"
    static let choiceAvatarGender = "choiceAvatarGenderVC"
    static let crosswordHelpPopup = "crosswordHelpPopup"
    static let documentBank = "documentBankVC"
    static let downloadPopup = "downloadPopupVC"
    static let emergencyCallPopup = "emergencyCallPopupVC"
    static let formatBank = "formatBankVC"
    static let leftMenu = "leftMenuVC"
    static let legal = "legalVC"
    static let letStart = "letStartVC"
    static let loader = "loaderVC"
    static let login = "loginVC"
    static let main = "mainVC"
    static let makeAvatar = "makeYourAvatarVC"
    static let myCourses = "myCourseVC"
    static let protectionShield = "protectionShieldVC"
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
