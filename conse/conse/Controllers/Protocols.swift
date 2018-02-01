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

protocol SendAlertProtocol: class {
    func dismissPopup(error: Bool)
}

protocol MainProtocol: class {
    func addToContainer(viewControllerID id: ViewControllerTag)
    func removeOfContainer()
    func showAlertSender()
    func showMessageInMain(withMessage msn: String)
    func openSettingsPopup(title: String, message: String, settings: String)
}


// Protocolos para Cursos
protocol VBGProtocol: class {
    func nextPage()
    func previusPage()
    func goCourses()
    func audioManager(audioID id: AUDIO_ID, play: Bool)
    func showPopupHelp(title: String, text: String)
    func showMessagePopup(message: String, inbold: String?, type: TypeMessage)
}

// Protocolos para Banco de Documentos
protocol FormatBankProtocol: class {
    func openShareDocument(documentName: String, fileExt: String, action: FileActions)
}

// Protocolos para Analizo mi comunidad
protocol CommunityProtocol: class {
    func openShareDocument(documentName: String, fileExt: String, action: FileActions)
}

// Protocolos para Rutas de Protección
protocol ProtectionRouteProtocol: class {
    func showRoute(id: ViewControllerTag)
}

protocol VBGRouteProtocol: class {
    func nextPage()
    func previusPage()
}

protocol LeadersRouteOneProtocol: class {
    func nextPage()
    func previusPage()
}

protocol LeadersRouteTwoProtocol: class {
    func nextPage()
    func previusPage()
}
