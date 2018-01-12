//
//  SendAlertPopupViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 10/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class SendAlertPopupViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var btn_sendAlert: UIButton!
    @IBOutlet weak var btn_cancelAlert: UIButton!
    @IBOutlet weak var lbl_alertMessage: UILabel!
    @IBOutlet weak var cnt_alertView: UIView!
    
    // MARK: - Properties
    weak var testAlertDelegate: TestAlertProtocol?
    weak var callEmergencyDelegate: CallEmergencyProtocol?

    var alertMessage: String!
    var launchVC: ViewControllerTag!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        if (callEmergencyDelegate != nil) {
            callEmergencyDelegate?.closePopup()
        }
        
        btn_sendAlert.imageView?.contentMode = .scaleAspectFit
        lbl_alertMessage.text = alertMessage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private Functions
    private func closePopup() {
        
        if launchVC != nil && launchVC == .testAlert {
            testAlertDelegate?.startStepTwo()
        }
        
        cancelAction(btn_cancelAlert)
    }
    
    @IBAction func cancelAction(_ sender: UIButton) {
        
        if sender == btn_sendAlert {
            closePopup()
        }
        
        self.dismiss(animated: true, completion: nil)
    }
}
