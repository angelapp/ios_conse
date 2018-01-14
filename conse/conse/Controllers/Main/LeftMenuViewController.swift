//
//  LeftMenuViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 12/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class LeftMenuViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var btn_aboutNRC: UIButton!
    @IBOutlet weak var btn_analyze: UIButton!
    @IBOutlet weak var btn_contactUs: UIButton!
    @IBOutlet weak var btn_courses: UIButton!
    @IBOutlet weak var btn_docs: UIButton!
    @IBOutlet weak var btn_editProfile: UIButton!
    @IBOutlet weak var btn_logout: UIButton!
    @IBOutlet weak var btn_news: UIButton!
    @IBOutlet weak var btn_routes: UIButton!
    
    @IBOutlet weak var cnt_buttons: UIView!
    
    // MARK: - Properties
    weak var mainDelegate: MainProtocol?
    var overlayView: UIView = UIView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addStyles()
        mainDelegate = AplicationRuntime.sharedManager.mainDelegate
        overlayView = UIView(frame: self.view.frame)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private Functions
    private func addStyles() {
        
        //Ajusta el ancho del menú
        let screenSize = UIScreen.main.bounds
        self.revealViewController().rearViewRevealWidth = screenSize.width * 0.85
        
        var cont = 0
        for subView in cnt_buttons.subviews {
            if let button = subView as? UIButton {
                button.imageView?.contentMode = .scaleAspectFit
                printDebugMessage(tag: "btnn_\(cont)")
                cont += 1
            }
        }
    }
    
    // MARK: - Public Functions (Access by protocols)
    
    
    // MARK: - Actions
    @IBAction func actionButtons(_ sender: UIButton) {
        
        switch sender {
            
        case btn_docs:
            break
            
        case btn_routes:
            break
            
        case btn_courses:
            break
            
        case btn_analyze:
            break
            
        case btn_news:
            break
            
        case btn_contactUs:
            mainDelegate?.addToContainer(viewControllerID: .contactUs)
            self.revealViewController().revealToggle(animated: true)
            break
            
        case btn_aboutNRC:
            break
            
        case btn_editProfile:
            break
            
        default:
            // Clean user data in runtime
            AplicationRuntime.sharedManager.setUserData(user: nil)
            
            // Delete cookies
            let storageCookies = HTTPCookieStorage.shared
            for cookie in storageCookies.cookies! {
                storageCookies.deleteCookie(cookie)
            }
            
            // Clean data in local
            StorageConfig.share.clearParameterFromKey(key: DicKeys.user)
            
            // Launch Auth Screen
            let sb = UIStoryboard(name: StoryboardsId.auth, bundle: nil)
            self.present(sb.instantiateInitialViewController()!, animated: true, completion: nil)
            
            // Close menu
            self.revealViewController().revealToggle(animated: true)
            break
        }
    }
}
