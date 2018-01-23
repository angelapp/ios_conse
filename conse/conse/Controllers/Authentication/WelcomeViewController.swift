//
//  WelcomeViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 2/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit
import ObjectMapper

class WelcomeViewController: UIViewController, WelcomeProtocol {

    // MARK: - Outlets
    @IBOutlet weak var btn_alet: UIButton!
    @IBOutlet weak var btn_login: UIButton!
    @IBOutlet weak var btn_register: UIButton!
    @IBOutlet weak var btn_videoTutorial: UIButton!
    
    @IBOutlet weak var img_nrc_logo: UIImageView!
    @IBOutlet weak var img_conse_logo: UIImageView!
    
    @IBOutlet weak var scroll: UIScrollView!
    
    @IBOutlet weak var alertButton_heightConstraint: NSLayoutConstraint!
    
    // MARK: - Properties
    var userData: RegisterUserResponse!
    var states: StatesModel!
    var contacts: Array<ContactModel>!
    var avatar: UIImage!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        userData = StorageFunctions.getUser()
        states = StorageFunctions.getStates()
        contacts = StorageFunctions.getContactList()
        avatar = StorageFunctions.loadAvatarImage()
        
        addStyles()
        getConfiguration()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // set content height to scroll
    override func viewDidLayoutSubviews() {
        
        var contentRect = CGRect.zero
        
        for view in scroll.subviews {
            contentRect = contentRect.union(view.frame)
        }
        
        scroll.contentSize = CGSize(width: self.accessibilityFrame.width, height: contentRect.size.height)
    }
    
    // MARK: - private functions
    private func addStyles(){
        btn_register.imageView?.contentMode = .scaleAspectFit
        btn_alet.imageView?.contentMode = .scaleAspectFit
        btn_videoTutorial.imageView?.contentMode = .scaleAspectFit
        
        btn_videoTutorial.isHidden = (states != nil && states.wasLoggedAtSomeTime)
        btn_alet.isHidden = !(states != nil && states.wasLoggedAtSomeTime)
        
        alertButton_heightConstraint.constant = btn_alet.isHidden ? 0 : 50
    }
    
    private func startConse(inScreen name: String){
        let sb = UIStoryboard(name: name, bundle: nil)
        self.present(sb.instantiateInitialViewController()!, animated: true, completion: nil)
    }
    
    private func getConfiguration() {
        
        self.showLoader(withMessage: Strings.loader_configApp)
        let headers: [[String:String]] = []
        
        Network.buildRequest(urlApi: NetworkGET.APP_CONFIGURATION, json: nullString, extraHeaders: headers, method: .methodGET, completion: {(response) in
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: observerName.stop_loader), object: nil)
            
            switch response {
                
            case .succeeded(let succeed, let message):
                if !succeed, !message.isEmpty {
                    print(message)
                }
                break
                
            case .error(let error):
                print(error.debugDescription)
                break
                
            case .succeededObject(let objReceiver):
                
                let config = Mapper<ApplicationConfiguration>().map(JSON: objReceiver as! [String: Any])
                AplicationRuntime.sharedManager.setAppConfig(config: config!)
                
                if self.userData != nil {
                    AplicationRuntime.sharedManager.setUserData(user: self.userData)
                    
                    if self.contacts != nil && self.contacts.count > 0 {
                        AplicationRuntime.sharedManager.setTrustedConctacs(list: self.contacts)
                        
                        if self.avatar != nil {
                            AplicationRuntime.sharedManager.setAvatarImage(img: self.avatar)
                            self.startConse(inScreen: StoryboardsId.main)
                        }
                        else {
                            self.startConse(inScreen: StoryboardsId.configAlert)
                        }
                    }
                    else {
                        self.startConse(inScreen: StoryboardsId.configAlert)
                    }
                }
                
                break
                
            default:
                break
            }
        })
    }
    
    func showAlertSender(){
        self.showSMSEmergency(wellcomeDelegate: self, senderVC: .welcome)
    }
    /** Usa el protocolo para mostar mensajes */
    func showMessage(withMessage msn: String) {
        self.showErrorMessage(withMessage: msn)
    }
    
    func openSettingsPopup(title: String, message: String, settings: String) {
        self.showSettingsPopup(title: title, message: message, settings: settings)
    }
    
    // MARK: - Actions
    @IBAction func alert(_ sender: UIButton) {
        self.showCallEmergency(wellcomeDelegate: self, senderVC: .welcome)
    }
}
