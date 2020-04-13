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
    @IBOutlet weak var btn_UNP_NAL: UIButton!
    @IBOutlet weak var btn_UNP_BOG: UIButton!
    
    @IBOutlet weak var lbl_alertMessage: UILabel!
    @IBOutlet weak var lbl_message: UILabel!
    @IBOutlet weak var lbl_message_02: UILabel!
    @IBOutlet weak var lbl_line_123: UILabel!
    @IBOutlet weak var lbl_line_141: UILabel!
    @IBOutlet weak var lbl_line_155: UILabel!
    @IBOutlet weak var lbl_line_UPN_NAL: UILabel!
    @IBOutlet weak var lbl_line_UPN_BOG: UILabel!
    
    @IBOutlet weak var numbers_Content: UIView!
    @IBOutlet weak var message_Content: UIView!
    
    @IBOutlet weak var cancelButton_heigthConstraint: NSLayoutConstraint!
    
    // MARK: - Properties
    weak var testAlertDelegate: TestAlertProtocol?
    
    var contacts: Array<String> = []
    var messageBody = nullString
    var senderVC: ViewControllerTag = .main
    var isAnimationCancelled = false
    
    let messageComposer = MessageComposer()
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
        
        lbl_line_123.attributedText = addBoldWord(forText: EmergencyStrings.line_123_message, toWord: EmergencyStrings.line_123, fontSize: lbl_line_123.font.pointSize)
        lbl_line_141.attributedText = addBoldWord(forText: EmergencyStrings.line_141_message, toWord: EmergencyStrings.line_141, fontSize: lbl_line_141.font.pointSize)
        lbl_line_155.attributedText = addBoldWord(forText: EmergencyStrings.line_155_message, toWord: EmergencyStrings.line_155, fontSize: lbl_line_155.font.pointSize)
        lbl_line_UPN_BOG.attributedText = addBoldWord(forText: EmergencyStrings.line_bog_label, toWord: EmergencyStrings.line_bog, fontSize: lbl_line_UPN_BOG.font.pointSize)
        lbl_line_UPN_NAL.attributedText = addBoldWord(forText: EmergencyStrings.line_nal_label, toWord: EmergencyStrings.line_nal, fontSize: lbl_line_UPN_NAL.font.pointSize)
    }
    
    private func loadCallView() {
        
        message_Content.isHidden = true
        numbers_Content.isHidden = false
        lbl_message.text = EmergencyStrings.label_01
        lbl_message_02.text = EmergencyStrings.label_02
    }
    
    private func loadSMSView() {
        
        message_Content.isHidden = false
        numbers_Content.isHidden = true
        
        // Load contacts for send message
        contacts = AplicationRuntime.sharedManager.getContactsNumber()
        
        // Set Message depend on sender controller
        lbl_alertMessage.text = senderVC == .testAlert ? EmergencyStrings.SMS_test : EmergencyStrings.SMS
        
        // Hide or show cancelAlert button depend on sender controller
        btn_cancelAlert.isHidden = (senderVC == .testAlert)
        cancelButton_heigthConstraint.constant = btn_cancelAlert.isHidden ? 0 : 30
        
        // make recognizer gesture and add to alert button
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector (longPressGesture(press:)))
        longPress.minimumPressDuration = 0.5
        btn_sendAlert.addGestureRecognizer(longPress)
        
        // For use when the app is open & in the background
        //locationManager.requestAlwaysAuthorization()
        
        // For use when the app is open
        locationManager.requestWhenInUseAuthorization()
        
        // If location services is enabled get the users location
        if CLLocationManager.locationServicesEnabled() {
            
            if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.notDetermined {
                locationManager.requestWhenInUseAuthorization()
            }
            
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest // You can change the locaiton accuary here.
            locationManager.startUpdatingLocation()
        }
    }
    
    /**
     Send alert message to trusted contacts
     if the **longpress** is completed and
     the device can perform this action
     */
    private func sendAlert() {
        
        // set default state to btn_sent Alert
        self.btn_sendAlert.alpha = 0.5
        // check if longPress is compled
        guard !isAnimationCancelled else {
            return
        }
        
        // Vibrate Device
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        guard contacts.count > 0 else {
            dismissPopup(message: ErrorStrings.contactsNotFound)
            return
        }
        
        // Valida si se han solicitado permisos para usar la localización
        guard CLLocationManager.authorizationStatus() != CLAuthorizationStatus.notDetermined else {
            locationManager.requestWhenInUseAuthorization()
            return
        }
        
        // Valida si esta permitido el uso de la localización
        guard DocumentBankViewController.isLocationPermissionGranted() else {
            self.showConseSettings(title: ErrorStrings.title_disabledLocation, message: ErrorStrings.deniedLocation)
            return
        }
        
        // Add message body and recipients list
        messageComposer.messageRecipientes(message: messageBody, contactList: contacts, sendDelegate: self)
        
        // Make sure the device can send text messages
        if (messageComposer.canSendText()) {
            // Obtain a configured MFMessageComposeViewController
            let messageComposeVC = messageComposer.configuredMessageComposeViewController()
            
            // Present the configured MFMessageComposeViewController instance
            present(messageComposeVC, animated: true, completion: nil)
        } else {
            dismissPopup(message: ErrorStrings.disabledAction)
        }
    }
    
    /// Add animation alpha to send Alert button
    private func animateButton(){
        isAnimationCancelled = false
        UIView.animate(withDuration: 3, animations: {
            self.btn_sendAlert.alpha = 1
        }) { _ in
            // Animation completion (completed or cancel LongPress)
            self.sendAlert()
        }
    }
    
    // MARK: - Protocol Functions
    // Control the action when device can't send SMS
    func dismissPopup(message: String?) {
        
        if testAlertDelegate != nil {
            testAlertDelegate?.startStepTwo(message: message)
            actionButtons(btn_Cancel)
        }
        else {
            if message != nil {
                self.showErrorMessage(withMessage: message!)
            }
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
            self.showSettingsPopup(title: ErrorStrings.title_disabledLocation,
                                   message: ErrorStrings.disabledLocation,
                                   settings: UIApplicationOpenSettingsURLString)
        }
    }
    
    // MARK: - Actions
    @objc func longPressGesture(press: UILongPressGestureRecognizer){
        
        if press.state == .began {
            animateButton()
        }
        // cancelled animation if user touch down send alert button.
        if press.state == .ended {
            isAnimationCancelled = true
            btn_sendAlert.layer.removeAllAnimations()
        }
    }
    
    @IBAction func touchDown(_ sender: UIButton) {
        self.view.layer.removeAllAnimations()
    }
    
    // Action for call to emergency numbers or show view for send SMS to a trueted contacts
    @IBAction func actionButtons(_ sender: UIButton) {
        
        switch sender {
            
        case btn_123:
            self.makeCall(forNumber: EmergencyStrings.line_123)
            break
            
        case btn_141:
            self.makeCall(forNumber : EmergencyStrings.line_141)
            break
            
        case btn_155:
            self.makeCall(forNumber: EmergencyStrings.line_155)
            break
            
        case btn_UNP_BOG:
            self.makeCall(forNumber: EmergencyStrings.UNP_BOG)
            break
            
        case btn_UNP_NAL:
            self.makeCall(forNumber: EmergencyStrings.line_nal)
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
