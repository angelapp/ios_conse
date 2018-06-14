//
//  MainViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 12/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, MainProtocol {

    // MARK: - Outlets
    @IBOutlet weak var btn_alert: UIButton!
    @IBOutlet weak var btn_menu: UIButton!
    @IBOutlet weak var btn_progress: UIButton!
    
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var img_background: UIImageView!
    
    // MARK: - Properties
    var logView: [ViewControllerTag]! = []
    
    // Controllers that are managed by this controller
    var aboutNRCVC: AboutUsViewController!
    var contactFormVC: ContactUsViewController!
    var documentBankVC: DocumentBankViewController!
    var editProfileVC: RegisterViewController!
    var myCommunityVC: CommunityViewController!
    var myCourseVC: MyCoursesViewController!
    var myRoutesVC: ProtectionRoutesViewController!
    var newsVC: NewsViewController!
    var plcCourseVC: PLCCourseViewController!
    var vbgCourseVC: VBGCourseViewController!
    var videoPlayerVC: ViedoPlayerViewController!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set delegae to runtime
        AplicationRuntime.sharedManager.mainDelegate = self
        
        // Load Course Progress
        AplicationRuntime.sharedManager.setProgress(progress: StorageFunctions.getProgress())
        
        //Add Geture for open/close menu
        if self.revealViewController() != nil {
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        }
        
        // init viewController child
        initChildView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private Functions
    /** init child viewControllers */
    private func initChildView() {
        aboutNRCVC = self.storyboard?.instantiateViewController(withIdentifier: ViewControllersId.aboutUs) as! AboutUsViewController
        contactFormVC = self.storyboard?.instantiateViewController(withIdentifier: ViewControllersId.contactUs) as! ContactUsViewController
        documentBankVC = self.storyboard?.instantiateViewController(withIdentifier: ViewControllersId.documentBank) as! DocumentBankViewController
        myCommunityVC = self.storyboard?.instantiateViewController(withIdentifier: ViewControllersId.community) as! CommunityViewController
        myCourseVC = self.storyboard?.instantiateViewController(withIdentifier: ViewControllersId.myCourses) as! MyCoursesViewController
        myRoutesVC = self.storyboard?.instantiateViewController(withIdentifier: ViewControllersId.protectionRoutes) as! ProtectionRoutesViewController
        newsVC = self.storyboard?.instantiateViewController(withIdentifier: ViewControllersId.news) as! NewsViewController
        plcCourseVC = self.storyboard?.instantiateViewController(withIdentifier: ViewControllersId.coursePLC) as! PLCCourseViewController
        vbgCourseVC = self.storyboard?.instantiateViewController(withIdentifier: ViewControllersId.courseVBG) as! VBGCourseViewController
        videoPlayerVC = self.storyboard?.instantiateViewController(withIdentifier: ViewControllersId.videoPLayer) as! ViedoPlayerViewController
        
        let sb = UIStoryboard(name: StoryboardsId.auth, bundle: nil)
        editProfileVC = sb.instantiateViewController(withIdentifier: ViewControllersId.register) as! RegisterViewController
        
        addToContainer(viewControllerID: .myCourses)
    }
    
    /** Return: viewController, add delegates and properties as appropriate */
    private func getViewController(viewControllerID id: ViewControllerTag) -> UIViewController {
        
        switch id {
            
        case .aboutUs:
            return aboutNRCVC
            
        case .community:
            return myCommunityVC
            
        case .contactUs:
            return contactFormVC
            
        case .documentBank:
            documentBankVC.mainDelegate = self
            return documentBankVC
            
        case .protectionRoutes:
            return myRoutesVC
            
        case .myCourses:
            myCourseVC.mainDelegate = self
            return myCourseVC
            
        case .courseVBG:
            vbgCourseVC.vbg_table?.reloadData()
            return vbgCourseVC
            
        case .coursePLC:
            plcCourseVC.leaders_table?.reloadData()
            return plcCourseVC
            
        case .news:
            return newsVC
            
        case .videoPlayer:
            videoPlayerVC.videoID = AplicationRuntime.sharedManager.getvideoID()
            return videoPlayerVC
            
        case .editProfile:
            editProfileVC.isRegister = false
            editProfileVC.mainDelegate = self
            return editProfileVC
            
        default:
            myCourseVC.mainDelegate = self
            return myCourseVC
        }
    }
    
    // MARK: - Public Functions (Access by protocols)
    
    /** Add a view controller as container child */
    func addToContainer(viewControllerID id: ViewControllerTag) {
        
        if id == .protectionRoutes { removeOfContainer() }
        let vc = getViewController(viewControllerID: id)
        
//        // continue is new vc to add is diferent to current top vc
//        guard logView.last != id else {
//            return
//        }
        if container.subviews.count > 0 {
            let vc = self.childViewControllers.last
            vc?.willMove(toParentViewController: nil)
            vc?.view.removeFromSuperview()
            vc?.removeFromParentViewController()
        }
        
        // Add vc as child
        addChildViewController(vc)
        // The new vc size is adjusted to the size of the container
        vc.view.frame = CGRect(x: 0, y: 0, width: container.frame.width, height: container.frame.height)
        // Add view to the container
        container.addSubview(vc.view)
        // Reload vc
        vc.viewDidLoad()
        // Set parent of vc
        vc.didMove(toParentViewController: self)
        
        // Add id reference to losg view
        logView.append(id)
    }
    
    /** Remove of container and the reference log */
    func removeOfContainer() {
        
        // Delete child from parent
        let vc = self.childViewControllers.last
        vc?.willMove(toParentViewController: nil)
        vc?.view.removeFromSuperview()
        vc?.removeFromParentViewController()
        
        // Delete reference in logView
        let refVC = logView.last
        let indexOF = logView.index(of: refVC!)
        logView.remove(at: indexOF!)
    }
    
    /** Usa el protocolo para mostar mensajes en el main */
    func showMessageInMain(withMessage msn: String) {
        self.showErrorMessage(withMessage: msn)
    }
    
    func openSettingsPopup(title: String, message: String, settings: String) {
        self.showSettingsPopup(title: title, message: message, settings: settings)
    }
    
    func openConseSetting(title: String, message: String) {
        self.showConseSettings(title: title, message: message)
    }
    
    /** Pone una imagen de fondo
     - Parameter withName: Nombre de la imagen que se desea usar como fondo */
    func setImageBackground(withName name: String) {
        img_background.image = name != nullString ? UIImage(named: name) : nil
    }
    
    // MARK: - Actions
    @IBAction func buttonAction(_ sender: UIButton) {
        self.showEmergencyPopup(senderVC: .main)
    }
    
    @IBAction func showMenu(_ sender: UIButton) {
        self.dismissKeyboard()
        self.revealViewController().revealToggle(self)
    }
    
    @IBAction func showProgress(_ sender: UIButton) {
        let sb = UIStoryboard(name: StoryboardsId.popup, bundle: nil)
        let nextVC = sb.instantiateViewController(withIdentifier: ViewControllersId.progress) as! ProgressViewController
        
        nextVC.modalPresentationStyle = .overCurrentContext
        nextVC.modalTransitionStyle = .crossDissolve
        present(nextVC, animated: true, completion: nil)
    }
}
