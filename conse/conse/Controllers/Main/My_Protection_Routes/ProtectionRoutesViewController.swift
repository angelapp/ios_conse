//
//  ProtectionRoutesViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 31/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class ProtectionRoutesViewController: UIViewController, ProtectionRouteProtocol {
    
    // MARK: - Outlets
    @IBOutlet weak var container: UIView!
    
    // MARK: - Properties
    var selectRoute: SelectRouteViewController!
    var vbgRoute: VBGRouteViewController!
    var leadersRoute: LeadersRouteViewController!
    var welcomeRoutes: Bool = false
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        instanciateChild()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Protocol functions
    func showRoute(id: ViewControllerTag) {
        showChild(child: getViewController(viewControllerID: id))
    }
    
    // MARK: - Private Functions
    private func instanciateChild() {
        selectRoute = self.storyboard?.instantiateViewController(withIdentifier: ViewControllersId.selectRoute) as! SelectRouteViewController
        vbgRoute = self.storyboard?.instantiateViewController(withIdentifier: ViewControllersId.vbgRoute) as! VBGRouteViewController
        leadersRoute = self.storyboard?.instantiateViewController(withIdentifier: ViewControllersId.leadersRoute) as! LeadersRouteViewController
        
        showRoute(id: .selectRoute)
    }
    
    private func showChild(child: UIViewController) {
        
        if container.subviews.count > 0 {
            let vc = self.childViewControllers.last
            vc?.willMove(toParentViewController: nil)
            vc?.view.removeFromSuperview()
            vc?.removeFromParentViewController()
        }
        
        //Agrega el nuevo controlador como hijo
        addChildViewController(child)
        //Se ajusta el tamaño de nuevo vc al tamaño del contenedor
        child.view.frame = CGRect(x: 0, y: 0, width: container.frame.width, height: container.frame.height)
        //Se agrega la vista al contenedor
        container.addSubview(child.view)
        //recarga el controlador
        child.viewDidLoad()
        //Se notifica
        child.didMove(toParentViewController: self)
    }
    
    private func getViewController(viewControllerID id: ViewControllerTag) -> UIViewController {
        
        switch id {
            
        case .leadersRoute:
            return leadersRoute
            
        case .vbgRoute:
            return vbgRoute
            
        default:
            selectRoute.protectionRouteDelegate = self
            return selectRoute
        }
    }

}
