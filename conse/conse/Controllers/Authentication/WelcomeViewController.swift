//
//  WelcomeViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 2/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import AVKit
import UIKit
import ObjectMapper
import CoreLocation

class WelcomeViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var btn_alet: UIButton!
    @IBOutlet weak var btn_login: UIButton!
    @IBOutlet weak var btn_register: UIButton!
    @IBOutlet weak var btn_videoTutorial: UIButton!
    
    @IBOutlet weak var img_nrc_logo: UIImageView!
    @IBOutlet weak var img_conse_logo: UIImageView!
    
    @IBOutlet weak var content_centerConstraint: NSLayoutConstraint!
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
    
    // MARK: - private functions
    private func addStyles(){
        
        setAspectFitToButton(buttons: btn_alet, btn_register, btn_login, btn_videoTutorial)
        
        btn_videoTutorial.isHidden = (states != nil && states.wasLoggedAtSomeTime)
        btn_alet.isHidden = !btn_videoTutorial.isHidden
        
        alertButton_heightConstraint.constant = btn_alet.isHidden ? 0 : 50
        content_centerConstraint.constant = btn_alet.isHidden ? 0 : 20
    }
    
    private func loadLocalData() {
        AplicationRuntime.sharedManager.setAppConfig(config: StorageFunctions.getAppConfig())
        AplicationRuntime.sharedManager.setUserData(user: StorageFunctions.getUser())
        states = StorageFunctions.getStates()
        contacts = StorageFunctions.getContactList()
        avatarPieces = StorageFunctions.getAvatarPieces()
        avatar = StorageFunctions.loadAvatarImage()
        
        // Activa una instancia para activar el sonido multimadia de la App cuando
        // El dispositivo está en mute
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        }
        catch {
            // report for an error
        }
    }
    
    private func startCose() {
        
        guard (AplicationRuntime.sharedManager.getAppConfig()) != nil else {
            return
        }
        
        guard states != nil, states.isLogin  else {
            return
        }
        
        guard (AplicationRuntime.sharedManager.getUser()) != nil else {
            states.isLogin = false
            StorageFunctions.saveStates(states: states)
            return
        }
        
        guard self.contacts != nil && self.contacts.count > 0 else {
            self.presentConse(storyBoard: StoryboardsId.configAlert, inScreen: ViewControllersId.configAlert)
            return
        }
        
        AplicationRuntime.sharedManager.setTrustedConctacs(list: self.contacts)
        
        guard self.avatarPieces != nil && self.avatarPieces.skinID != nil else {
            self.presentConse(storyBoard: StoryboardsId.configAlert, inScreen: ViewControllersId.choiceAvatarGender)
            return
        }
        
        AplicationRuntime.sharedManager.setAvatarPieces(avatarPieces: self.avatarPieces)
        AplicationRuntime.sharedManager.setAvatarImage(img: self.avatar)
        
        self.presentConse(storyBoard: StoryboardsId.main)
    }
    
    private func presentConse(storyBoard sbName: String, inScreen vc: String? = nil){
        let sb = UIStoryboard(name: sbName, bundle: nil)
        if vc != nil {
            self.present(sb.instantiateViewController(withIdentifier: vc!), animated: true, completion: nil)
        }
        else{
            self.present(sb.instantiateInitialViewController()!, animated: true, completion: nil)
        }
    }
    
    private func getConfiguration() {
        
        let loader = LoadingOverlay(text: LoaderStrings.configApp)
        let headers: [[String:String]] = []
        
        loader.showOverlay(view: self.view)
        self.view.isUserInteractionEnabled = false
        
        Network.buildRequest(urlApi: NetworkGET.APP_CONFIGURATION, json: nullString, extraHeaders: headers, method: .methodGET, completion: {(response) in
            
            loader.hideOverlayView()
            self.view.isUserInteractionEnabled = true
            
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
    
    // MARK: - Actions
    @IBAction func actionButtons(_ sender: UIButton) {
        
        switch sender {
            
        case btn_alet:
            self.showEmergencyPopup(senderVC: .welcome)
            break
            
        case btn_register:
            
            // Check Intenet Conexión
            guard ConnectionCheck.isConnectedToNetwork() else {
                self.showSettingsPopup(title: ErrorStrings.title_disabledInternet,
                                       message: ErrorStrings.disabledIntenert,
                                       settings: URL_GENERAL_SETTINGS)
                return
            }
            
            // Check if GPS is Enable
            guard CLLocationManager.locationServicesEnabled() else {
                self.showSettingsPopup(title: ErrorStrings.title_disabledLocation,
                                       message: ErrorStrings.disabledLocation,
                                       settings: URL_LOCATION_SERVICES)
                return
            }
            
            guard DocumentBankViewController.isLocationPermissionGranted() else {
                self.showConseSettings(title: ErrorStrings.title_disabledLocation, message: ErrorStrings.deniedLocation)
                return
            }
            
            performSegue(withIdentifier: segueID.welcomeResgister, sender: self)
            break
            
        default:
            break
        }
    }
}
