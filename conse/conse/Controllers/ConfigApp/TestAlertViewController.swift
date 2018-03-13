//
//  TestAlertViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 3/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class TestAlertViewController: UIViewController, TestAlertProtocol {
    
    // MARK: - Outlets
    @IBOutlet weak var cnt_step1: UIView!
    @IBOutlet weak var cnt_step2: UIView!
    
    @IBOutlet weak var img_step1: UIImageView!
    @IBOutlet weak var img_step2: UIImageView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cnt_step1.isHidden = false
        cnt_step2.isHidden = true
        
        img_step1.image = #imageLiteral(resourceName: "circulo_amarillo")
        img_step2.image = #imageLiteral(resourceName: "circulo_blanco")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - functions
    func startStepTwo(error: Bool) {
        
        if !error {
            self.view.makeToast(message: Strings.error_message_notAvailableAction,
                                duration: 5.0,
                                position: HRToastPositionDefault as AnyObject)
        }
        
        cnt_step1.isHidden = true
        cnt_step2.isHidden = false
        
        img_step1.image = #imageLiteral(resourceName: "circulo_blanco")
        img_step2.image = #imageLiteral(resourceName: "circulo_amarillo")
    }
    
    // MARK: - Actions
    @IBAction func sendAlertTest(_ sender: UIButton) {
        self.showEmergencyPopup(senderVC: .testAlert, testDelegate: self)
    }

    @IBAction func backAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
