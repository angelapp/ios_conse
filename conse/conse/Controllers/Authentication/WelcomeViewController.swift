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
    var avatar: UIImage!
    var avatarPieces: MyAvatarPieces!
    var contacts: Array<ContactModel>!
    var states: StatesModel!
    var userData: RegisterUserResponse!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadLocalData()
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
        btn_alet.isHidden = !btn_videoTutorial.isHidden
        
        alertButton_heightConstraint.constant = btn_alet.isHidden ? 0 : 50
    }
    
    private func loadLocalData() {
        AplicationRuntime.sharedManager.setAppConfig(config: StorageFunctions.getAppConfig())
        AplicationRuntime.sharedManager.setUserData(user: StorageFunctions.getUser())
        states = StorageFunctions.getStates()
        contacts = StorageFunctions.getContactList()
        avatarPieces = StorageFunctions.getAvatarPieces()
        avatar = StorageFunctions.loadAvatarImage()
    }
    
    private func startCose() {
        
        guard (AplicationRuntime.sharedManager.getAppConfig()) != nil else {
            return
        }
        printDebugMessage(tag: "have app conf")
        guard states != nil, states.isLogin  else {
            return
        }
        
        printDebugMessage(tag: "state is login")
        guard (AplicationRuntime.sharedManager.getUser()) != nil else {
            states.isLogin = false
            StorageFunctions.saveStates(states: states)
            return
        }
        
        printDebugMessage(tag: "have user")
        if self.contacts != nil && self.contacts.count > 0 {
            AplicationRuntime.sharedManager.setTrustedConctacs(list: self.contacts)
            
            printDebugMessage(tag: "have trusted contacts")
            if self.avatarPieces != nil && self.avatarPieces.genderID != nil {
                AplicationRuntime.sharedManager.setAvatarPieces(avatarPieces: self.avatarPieces)
                AplicationRuntime.sharedManager.setAvatarImage(img: self.avatar)
                
                printDebugMessage(tag: "have Avatar")
                self.startConse(inScreen: StoryboardsId.main)
            }
            else {
                printDebugMessage(tag: "don't have Avatar")
                self.startConse(inScreen: StoryboardsId.configAlert)
            }
        }
        else {
            printDebugMessage(tag: "don't trusted contacts")
            self.startConse(inScreen: StoryboardsId.configAlert)
        }
    }
    
    private func startConse(inScreen name: String){
        printDebugMessage(tag: "start in screen ... \(name)")
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
                self.startCose()
                break
                
            case .error(let error):
                print(error.debugDescription)
                break
                
            case .succeededObject(let objReceiver):
                
                let config = Mapper<ApplicationConfiguration>().map(JSON: objReceiver as! [String: Any])
                
                AplicationRuntime.sharedManager.setAppConfig(config: config!)
                StorageFunctions.saveAppConfigInLocal(config: config!)
                
                self.startCose()
                
                break
                
            default:
                break
            }
            
            
        })
    }
    
    // MARK: - Methods for panic button
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
