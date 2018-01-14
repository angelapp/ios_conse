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
    var contactFormVC: ContactUsViewController!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set delegae to runtime
        AplicationRuntime.sharedManager.mainDelegate = self
        
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
        contactFormVC = self.storyboard?.instantiateViewController(withIdentifier: ViewControllersId.contactUs) as! ContactUsViewController
    }
    
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
    private func removeOfContainer(viewController vc: UIViewController){
        
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
    
    /** Return: viewController, add delegates and properties as appropriate */
    private func getViewController(viewControllerID id: ViewControllerTag) -> UIViewController {
        
        switch id {
            
        case .contactUs:
            return contactFormVC
            
        default:
            return contactFormVC
        }
    }
    
    
    // MARK: - Public Functions (Access by protocols)
    
    
    // MARK: - Actions
}
