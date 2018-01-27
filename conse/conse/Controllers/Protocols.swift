//
//  Protocols.swift
//  conse
//
//  Created by Felipe Zamudio on 10/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import Foundation

protocol WelcomeProtocol: class {
    func showAlertSender()
    func showMessage(withMessage msn: String)
    func openSettingsPopup(title: String, message: String, settings: String)
}

protocol LogginProtocol: class {
    func showAlertSender()
    func showMessage(withMessage msn: String)
    func openSettingsPopup(title: String, message: String, settings: String)
}

protocol RecoveryProtocol: class {
    func showAlertSender()
    func showMessage(withMessage msn: String)
    func openSettingsPopup(title: String, message: String, settings: String)
}

/// Protocol de la parte de configuración para enviar un mensaje de prueba
protocol TestAlertProtocol: class {
    func startStepTwo()
}

protocol MainProtocol: class {
    func addToContainer(viewControllerID id: ViewControllerTag)
    func removeOfContainer()
    func showAlertSender()
    func showMessageInMain(withMessage msn: String)
    func openSettingsPopup(title: String, message: String, settings: String)
}

protocol VBGProtocol: class {
    func nextPage()
    func previusPage()
    func audioManager(audioID id: AUDIO_ID, play: Bool)
    func showPopupHelp(title: String, text: String)
    func showMessagePopup(message: String, inbold: String?, type: TypeMessage)
}

protocol FormatBankProtocol: class {
    func openShareDocument(documentName: String, fileExt: String, action: FileActions)
}

protocol CommunityProtocol: class {
    func openShareDocument(documentName: String, fileExt: String, action: FileActions)
}
