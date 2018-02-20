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
    @IBOutlet weak var btn_docs: UIButton!
    @IBOutlet weak var btn_routes: UIButton!
    @IBOutlet weak var btn_courses: UIButton!
    @IBOutlet weak var btn_analyze: UIButton!
    @IBOutlet weak var btn_news: UIButton!
    @IBOutlet weak var btn_contactUs: UIButton!
    @IBOutlet weak var btn_aboutNRC: UIButton!
    @IBOutlet weak var btn_videoTutorial: UIButton!
    @IBOutlet weak var btn_editProfile: UIButton!
    @IBOutlet weak var btn_logout: UIButton!
    
    @IBOutlet weak var cnt_buttons: UIView!
    @IBOutlet weak var scroll: UIScrollView!
    
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
    
    // set content height to scroll
    override func viewDidLayoutSubviews() {
        var contentRect = CGRect.zero
        
        for view in scroll.subviews {
            contentRect = contentRect.union(view.frame)
        }
        
        scroll.contentSize = CGSize(width: self.accessibilityFrame.width, height: contentRect.size.height)
    }
    
    // MARK: - Private Functions
    private func addStyles() {
        
        //Ajusta el ancho del menú
        let screenSize = UIScreen.main.bounds
        self.revealViewController().rearViewRevealWidth = screenSize.width * 0.85
        
        for subView in cnt_buttons.subviews {
            if let button = subView as? UIButton {
                button.imageView?.contentMode = .scaleAspectFit
            }
        }
    }
    
    // MARK: - Actions
    @IBAction func actionButtons(_ sender: UIButton) {
        
        switch sender {
            
        case btn_docs:
            mainDelegate?.addToContainer(viewControllerID: .documentBank)
            self.revealViewController().revealToggle(animated: true)
            break
            
        case btn_routes:
            mainDelegate?.addToContainer(viewControllerID: .protectionRoutes)
            self.revealViewController().revealToggle(animated: true)
            break
            
        case btn_courses:
            mainDelegate?.addToContainer(viewControllerID: .myCourses)
            self.revealViewController().revealToggle(animated: true)
            break
            
        case btn_analyze:
            mainDelegate?.addToContainer(viewControllerID: .community)
            self.revealViewController().revealToggle(animated: true)
            break
            
        case btn_news:
            mainDelegate?.addToContainer(viewControllerID: .news)
            self.revealViewController().revealToggle(animated: true)
            break
            
        case btn_contactUs:
            mainDelegate?.addToContainer(viewControllerID: .contactUs)
            self.revealViewController().revealToggle(animated: true)
            break
            
        case btn_aboutNRC:
            mainDelegate?.addToContainer(viewControllerID: .aboutUs)
            self.revealViewController().revealToggle(animated: true)
            break
            
        case btn_videoTutorial:
            mainDelegate?.addToContainer(viewControllerID: .videoPlayer)
            self.revealViewController().revealToggle(animated: true)
            break
            
        case btn_editProfile:
            mainDelegate?.addToContainer(viewControllerID: .editProfile)
            self.revealViewController().revealToggle(animated: true)
            break
            
        default:
            // Clean user data in runtime
            AplicationRuntime.sharedManager.setUserData(user: nil)
            
            // Delete cookies
            let storageCookies = HTTPCookieStorage.shared
            for cookie in storageCookies.cookies! {
                storageCookies.deleteCookie(cookie)
            }
            
            // update login state in local
            let states = StorageFunctions.getStates()
            states.isLogin = false
            StorageFunctions.saveStates(states: states)
            
            // Launch Auth Screen
            let sb = UIStoryboard(name: StoryboardsId.auth, bundle: nil)
            self.present(sb.instantiateInitialViewController()!, animated: true, completion: nil)
            
            // Close menu
            self.revealViewController().revealToggle(animated: true)
            break
        }
    }
}
