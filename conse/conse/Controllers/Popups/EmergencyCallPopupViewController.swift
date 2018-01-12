//
//  EmergencyCallPopupViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 11/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class EmergencyCallPopupViewController: UIViewController, CallEmergencyProtocol {

    // MARK: - Outlets
    @IBOutlet weak var btn_123: UIButton!
    @IBOutlet weak var btn_141: UIButton!
    @IBOutlet weak var btn_155: UIButton!
    @IBOutlet weak var btn_SMS: UIButton!
    @IBOutlet weak var btn_Cancel: UIButton!
    
    @IBOutlet weak var lbl_line_123: UILabel!
    @IBOutlet weak var lbl_line_141: UILabel!
    @IBOutlet weak var lbl_line_155: UILabel!
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        addStyles()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private Functions
    private func addStyles() {
        
        setAspectFitToButton(buttons: btn_123, btn_141, btn_155, btn_SMS)
        
        btn_123.rounder()
        btn_141.rounder()
        btn_155.rounder()
        
        lbl_line_123.attributedText = addBoldWord(forText: Strings.emergency_line_123_message, toWord: Strings.emergency_line_123, fontSize: lbl_line_123.font.pointSize)
        lbl_line_141.attributedText = addBoldWord(forText: Strings.emergency_line_141_message, toWord: Strings.emergency_line_141, fontSize: lbl_line_141.font.pointSize)
        lbl_line_155.attributedText = addBoldWord(forText: Strings.emergency_line_155_message, toWord: Strings.emergency_line_155, fontSize: lbl_line_155.font.pointSize)
    }
    
    func closePopup() {
        self.dismiss(animated: true, completion: nil)
    }

    // MARK: - Actions
    @IBAction func actionButtons(_ sender: UIButton) {
        
        switch sender {
            
        case btn_123:
            self.makeCallEmergency(toEmergencyLine: Strings.emergency_line_123)
            break
            
        case btn_141:
            self.makeCallEmergency(toEmergencyLine: Strings.emergency_line_141)
            break
            
        case btn_155:
            self.makeCallEmergency(toEmergencyLine: Strings.emergency_line_155)
            break
            
        case btn_SMS:
            let sb = UIStoryboard(name: StoryboardsId.popup, bundle: nil)
            let nextVC = sb.instantiateViewController(withIdentifier: ViewControllersId.sendAlertPopup) as! SendAlertPopupViewController
            
            nextVC.alertMessage = Strings.emergency_SMS
            nextVC.launchVC = .emergencyCallPopup
            nextVC.callEmergencyDelegate = self
            nextVC.modalPresentationStyle = .overCurrentContext
            nextVC.modalTransitionStyle = .crossDissolve
            present(nextVC, animated: true, completion: nil)
            break
            
        default:
            closePopup()
            break
        }
    }
}
