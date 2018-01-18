//
//  Protocols.swift
//  conse
//
//  Created by Felipe Zamudio on 10/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import Foundation

protocol TestAlertProtocol: class {
    func startStepTwo()
}

protocol CallEmergencyProtocol: class {
    func closePopup()
}

protocol MainProtocol: class {
    func addToContainer(viewControllerID id: ViewControllerTag)
    func removeOfContainer()
    func showMessageInMain(withMessage msn: String)
}

protocol VBGProtocol: class {
    func nextPage()
    func previusPage()
}
