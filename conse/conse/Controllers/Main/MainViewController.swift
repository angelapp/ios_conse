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
    @IBOutlet weak var btn_menu: UIBarButtonItem!
    @IBOutlet weak var btn_progress: UIBarButtonItem!
    
    @IBOutlet weak var container: UIView!
    
    // MARK: - Properties
    var logView: [ViewControllerTag]! = []
    
    // Controllers that are managed by this controller
    var aboutNRCVC: AboutUsViewController!
    var contactFormVC: ContactUsViewController!
    var documentBankVC: DocumentBankViewController!
    var editProfileVC: RegisterViewController!
    var myCourseVC: MyCoursesViewController!
    var plcCourseVC: PLCCourseViewController!
    var vbgCourseVC: VBGCourseViewController!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set delegae to runtime
        AplicationRuntime.sharedManager.mainDelegate = self
        
        // Load Course Progress
        if let progress = StorageFunctions.getProgress() {
            AplicationRuntime.sharedManager.setProgress(progress: progress)
        }
        
        //Se agrega accion al boton menu
        btn_menu.target = revealViewController()
        btn_menu.action = #selector(SWRevealViewController.revealToggle(_:))
        
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
        myCourseVC = self.storyboard?.instantiateViewController(withIdentifier: ViewControllersId.myCourses) as! MyCoursesViewController
        plcCourseVC = self.storyboard?.instantiateViewController(withIdentifier: ViewControllersId.coursePLC) as! PLCCourseViewController
        vbgCourseVC = self.storyboard?.instantiateViewController(withIdentifier: ViewControllersId.courseVBG) as! VBGCourseViewController
        
        let sb = UIStoryboard(name: StoryboardsId.auth, bundle: nil)
        editProfileVC = sb.instantiateViewController(withIdentifier: ViewControllersId.register) as! RegisterViewController
        
        addToContainer(viewControllerID: .myCourses)
    }
    
    /** Return: viewController, add delegates and properties as appropriate */
    private func getViewController(viewControllerID id: ViewControllerTag) -> UIViewController {
        
        switch id {
            
        case .aboutUs:
            return aboutNRCVC
            
        case .contactUs:
            return contactFormVC
            
        case .documentBank:
            return documentBankVC
            
        case .myCourses:
            myCourseVC.mainDelegate = self
            return myCourseVC
            
        case .courseVBG:
            return vbgCourseVC
            
        case .coursePLC:
            return plcCourseVC
            
        case .editProfile:
            editProfileVC.formType = .editProfile
            editProfileVC.mainDelegate = self
            return editProfileVC
            
        default:
            return contactFormVC
        }
    }
    
    // MARK: - Public Functions (Access by protocols)
    
    /** Add a view controller as container child */
    func addToContainer(viewControllerID id: ViewControllerTag) {
        
        let vc = getViewController(viewControllerID: id)
        
        // continue is new vc to add is diferent to current top vc
        guard logView.last != id else {
            return
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
    
    // MARK: - Actions
}
