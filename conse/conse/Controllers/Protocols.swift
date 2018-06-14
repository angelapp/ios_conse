//
//  Protocols.swift
//  conse
//
//  Created by Felipe Zamudio on 10/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import Foundation

/// Protocol de la parte de configuración para enviar un mensaje de prueba
protocol TestAlertProtocol: class {
    func startStepTwo(message: String?)
}

protocol SendAlertProtocol: class {
    func dismissPopup(message: String?)
}

protocol MainProtocol: class {
    func addToContainer(viewControllerID id: ViewControllerTag)
    func removeOfContainer()
    func showMessageInMain(withMessage msn: String)
    func setImageBackground(withName name: String)
    func openConseSetting(title: String, message: String)
    func openSettingsPopup(title: String, message: String, settings: String)
}

// Protocolo para Sobre NRC
protocol AboutNRCTabProtocol: class {
    func changeTabSelected(toPosition: Int)
}

// Protocolos para administrar el avance de los Cursos
protocol LeadersProtocol: class {
    func nextPage()
    func previusPage()
    func audioManager(audioID id: Int, play: Bool)
    func sendRequest(formModel: Array<RequestCompleted>)
    func showMessagePopup(message: String, inbold: String?, type: TypeMessage)
}

protocol VBGProtocol: class {
    func nextPage()
    func previusPage()
    func audioManager(audioID id: Int, play: Bool)
    func showPopupHelp(title: String, text: String)
    func sendRequest(formModel: Array<RequestCompleted>)
    func showMessagePopup(message: String, inbold: String?, type: TypeMessage)
}

// Protocolos para Banco de Documentos
protocol DocumentsTabProtocol: class {
    func changeTabSelected(toPosition: Int)
}

protocol FormatBankProtocol: class {
    func openShareDocument(file: FormatsBankItem, action: FileActions)
}

// Protocolos para Analizo mi comunidad
protocol CommunityProtocol: class {
    func openShareDocument(documentName: String, fileExt: String, action: FileActions)
}

// Protocolos para Rutas de Protección
protocol ProtectionRouteProtocol: class {
    func showRoute(id: ViewControllerTag)
}

protocol VBGRouteTabProtocol: class {
    func changeTabSelected(toPosition: Int)
}

protocol VBGRouteProtocol: class {
    func nextPage()
    func previusPage()
}

protocol LeadersRouteTabProtocol: class {
    func changeTabSelected(toPosition: Int)
}

protocol LeadersRouteOneProtocol: class {
    func nextPage()
    func previusPage()
}

protocol LeadersRouteTwoProtocol: class {
    func nextPage()
    func previusPage()
}

// Protocolos para la vista de progreso
protocol ProgressTabProtocol: class {
    func changeTabSelected(toPosition position: Int)
}

// Protocolos para Noticias
protocol NewsProtocol: class {
    func changeCitySelected(inPosition position: Int, animated: Bool)
}
