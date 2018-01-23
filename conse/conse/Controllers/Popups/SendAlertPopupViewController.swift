//
//  SendAlertPopupViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 10/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit
import CoreLocation

class SendAlertPopupViewController: UIViewController, CLLocationManagerDelegate {

    // MARK: - Outlets
    @IBOutlet weak var btn_sendAlert: UIButton!
    @IBOutlet weak var btn_cancelAlert: UIButton!
    @IBOutlet weak var lbl_alertMessage: UILabel!
    @IBOutlet weak var cnt_alertView: UIView!
    
    // MARK: - Properties
    weak var logginDelegate: LogginProtocol?
    weak var mainDelegate: MainProtocol?
    weak var recoveryDelegate: RecoveryProtocol?
    weak var welcomeDelegate: WelcomeProtocol?
    weak var testAlertDelegate: TestAlertProtocol?

    var alertMessage: String!
    var contacts: Array<String> = []
    var messageBody = nullString
    var launchVC: ViewControllerTag!
    let messageComposer = MessageComposer()
    
    // Used to start getting the users location
    let locationManager = CLLocationManager()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        contacts = AplicationRuntime.sharedManager.getContactsNumber()
        mainDelegate = AplicationRuntime.sharedManager.mainDelegate
        
        btn_sendAlert.imageView?.contentMode = .scaleAspectFit
        lbl_alertMessage.text = launchVC == .testAlert ? Strings.emergency_SMS_test : Strings.emergency_SMS
        
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private Functions
    private func dismissPopup(error: Bool) {
        testAlertDelegate?.startStepTwo()
        cancelAction(btn_cancelAlert)
        
        if error {
            if launchVC == .main {
                mainDelegate?.showMessageInMain(withMessage: Strings.error_message_notAvailableAction)
            }
            else if launchVC == .login {
                logginDelegate?.showMessage(withMessage: Strings.error_message_notAvailableAction)
            }
            else if launchVC == .recoveryPass {
                recoveryDelegate?.showMessage(withMessage: Strings.error_message_notAvailableAction)
            }
            else if launchVC == .welcome {
                welcomeDelegate?.showMessage(withMessage: Strings.error_message_notAvailableAction)
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
            mainDelegate?.openSettingsPopup(title: Strings.error_message_locationDisabled,
                                            message: Strings.error_message_locationDisabled,
                                            settings: UIApplicationOpenSettingsURLString)
        }
    }
    
    @IBAction func cancelAction(_ sender: UIButton) {
        
        switch sender {
            
        case btn_sendAlert:
            
            // Add message body and recipients list
            messageComposer.messageRecipientes(message: messageBody, contactList: contacts)
            
            // Make sure the device can send text messages
            if (messageComposer.canSendText()) {
                // Obtain a configured MFMessageComposeViewController
                let messageComposeVC = messageComposer.configuredMessageComposeViewController()
                
                // Present the configured MFMessageComposeViewController instance
                present(messageComposeVC, animated: true, completion: nil)
            } else {
                dismissPopup(error: true)
            }
            break
            
        default:
            self.dismiss(animated: true, completion: nil)
            break
        }
    }
}
