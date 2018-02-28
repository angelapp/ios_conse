//
//  EmergencyPopupViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 11/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit
import AudioToolbox
import CoreLocation

class EmergencyPopupViewController: UIViewController, CLLocationManagerDelegate, SendAlertProtocol {

    // MARK: - Outlets
    @IBOutlet weak var btn_123: UIButton!
    @IBOutlet weak var btn_141: UIButton!
    @IBOutlet weak var btn_155: UIButton!
    @IBOutlet weak var btn_SMS: UIButton!
    @IBOutlet weak var btn_Cancel: UIButton!
    @IBOutlet weak var btn_sendAlert: UIButton!
    @IBOutlet weak var btn_cancelAlert: UIButton!
    
    @IBOutlet weak var lbl_alertMessage: UILabel!
    @IBOutlet weak var lbl_message: UILabel!
    @IBOutlet weak var lbl_line_123: UILabel!
    @IBOutlet weak var lbl_line_141: UILabel!
    @IBOutlet weak var lbl_line_155: UILabel!
    
    @IBOutlet weak var numbers_Content: UIView!
    @IBOutlet weak var message_Content: UIView!
    
    @IBOutlet weak var cancelButton_heigthConstraint: NSLayoutConstraint!
    
    // MARK: - Properties
    weak var testAlertDelegate: TestAlertProtocol?
    
    var contacts: Array<String> = []
    var messageBody = nullString
    let messageComposer = MessageComposer()
    var senderVC: ViewControllerTag = .main
    
    // Used to start getting the users location
    let locationManager = CLLocationManager()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        addStyles()
        senderVC == .testAlert ? loadSMSView() : loadCallView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private Functions
    private func addStyles() {
        
        setAspectFitToButton(buttons: btn_123, btn_141, btn_155, btn_SMS, btn_sendAlert)
        
        lbl_line_123.attributedText = addBoldWord(forText: Strings.emergency_line_123_message, toWord: Strings.emergency_line_123, fontSize: lbl_line_123.font.pointSize)
        lbl_line_141.attributedText = addBoldWord(forText: Strings.emergency_line_141_message, toWord: Strings.emergency_line_141, fontSize: lbl_line_141.font.pointSize)
        lbl_line_155.attributedText = addBoldWord(forText: Strings.emergency_line_155_message, toWord: Strings.emergency_line_155, fontSize: lbl_line_155.font.pointSize)
    }
    
    private func loadCallView() {
        
        message_Content.isHidden = true
        numbers_Content.isHidden = false
        lbl_message.text = Strings.emergency_label
    }
    
    private func loadSMSView() {
        
        message_Content.isHidden = false
        numbers_Content.isHidden = true
        
        // Load contacts for send message
        contacts = AplicationRuntime.sharedManager.getContactsNumber()
        
        // Set Message depend on sender controller
        lbl_alertMessage.text = senderVC == .testAlert ? Strings.emergency_SMS_test : Strings.emergency_SMS
        
        // Hide or show cancelAlert button depend on sender controller
        btn_cancelAlert.isHidden = (senderVC == .testAlert)
        cancelButton_heigthConstraint.constant = btn_cancelAlert.isHidden ? 0 : 30
        
        // make recognizer gesture and add to alert button
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector (sendAlert(press:)))
        longPress.minimumPressDuration = 3.0
        btn_sendAlert.addGestureRecognizer(longPress)
        
        // For use when the app is open & in the background
        locationManager.requestAlwaysAuthorization()
        
        // For use when the app is open
        //locationManager.requestWhenInUseAuthorization()
        
        // If location services is enabled get the users location
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest // You can change the locaiton accuary here.
            locationManager.startUpdatingLocation()
        }
    }
    
    // MARK: - Protocol Functions
    // Control the action when device can't send SMS
    func dismissPopup(error: Bool) {
        if testAlertDelegate != nil {
            testAlertDelegate?.startStepTwo(error: error)
            actionButtons(btn_Cancel)
        }
        else {
            self.showErrorMessage(withMessage: Strings.error_message_notAvailableAction)
        }
    }
    
    // MARK: - Location delegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.first {
            locationManager.stopUpdatingLocation() //stop updating location
            messageBody = String(format: Formats.testAlertMessage, lbl_alertMessage.text!, String(location.coordinate.latitude), String(location.coordinate.longitude))
        }
    }
    
    // If we have been deined access give the user the option to change it
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if(status == CLAuthorizationStatus.denied) {
            self.showSettingsPopup(title: Strings.error_title_locationDisabled,
                                   message: Strings.error_message_locationDisabled,
                                   settings: UIApplicationOpenSettingsURLString)
        }
    }

    // MARK: - Actions
    @objc func sendAlert(press: UILongPressGestureRecognizer){
        
        if press.state == .began {
            // Vibrate Device
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            
            // Add message body and recipients list
            messageComposer.messageRecipientes(message: messageBody, contactList: contacts, sendDelegate: self)
            
            // Make sure the device can send text messages
            if (messageComposer.canSendText()) {
                // Obtain a configured MFMessageComposeViewController
                let messageComposeVC = messageComposer.configuredMessageComposeViewController()
                
                // Present the configured MFMessageComposeViewController instance
                present(messageComposeVC, animated: true, completion: nil)
            } else {
                dismissPopup(error: true)
            }
        }
    }
    
    // Action for call to emergency numbers or show view for send SMS to a trueted contacts
    @IBAction func actionButtons(_ sender: UIButton) {
        
        switch sender {
            
        case btn_123:
            self.makeCall(forNumber: Strings.emergency_line_123)
            break
            
        case btn_141:
            self.makeCall(forNumber : Strings.emergency_line_141)
            break
            
        case btn_155:
            self.makeCall(forNumber: Strings.emergency_line_155)
            break
            
        case btn_SMS:
            loadSMSView()
            break
            
        default:
            self.dismiss(animated: true, completion: nil)
            break
        }
    }
}
