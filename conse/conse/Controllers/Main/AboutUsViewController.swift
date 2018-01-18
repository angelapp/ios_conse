//
//  AboutUsViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 12/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var btn_aboutNRC: UIButton!
    @IBOutlet weak var btn_whatDoWeDo: UIButton!
    @IBOutlet weak var btn_whereWeWork: UIButton!
    
    @IBOutlet weak var cnt_buttons: UIView!
    @IBOutlet weak var container: UIView!
    
    @IBOutlet weak var lbl_title: UILabel!
    
    // MARK: - Properties
    var tab1: AboutUsTab1ViewController!
    var tab2: AboutUsTab2ViewController!
    var tab3: AboutUsTab3ViewController!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set tag to buttons
        btn_aboutNRC.tag = ViewControllerTag.aboutUs_tab1.rawValue
        btn_whatDoWeDo.tag = ViewControllerTag.aboutUs_tab2.rawValue
        btn_whereWeWork.tag = ViewControllerTag.aboutUs_tab3.rawValue
        
        // Instance Tabs
        tab1 = self.storyboard?.instantiateViewController(withIdentifier: ViewControllersId.aboutUs_tab1) as! AboutUsTab1ViewController
        tab2 = self.storyboard?.instantiateViewController(withIdentifier: ViewControllersId.aboutUs_tab2) as! AboutUsTab2ViewController
        tab3 = self.storyboard?.instantiateViewController(withIdentifier: ViewControllersId.aboutUs_tab3) as! AboutUsTab3ViewController
        
        changeTab(btn_aboutNRC)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private Functions
    private func showTab(tab: UIViewController) {
        
        if container.subviews.count > 0 {
            let vc = self.childViewControllers.last
            vc?.willMove(toParentViewController: nil)
            vc?.view.removeFromSuperview()
            vc?.removeFromParentViewController()
        }
        
        //Agrega el nuevo controlador como hijo
        addChildViewController(tab)
        //Se ajusta el tamaño de nuevo vc al tamaño del contenedor
        tab.view.frame = CGRect(x: 0, y: 0, width: container.frame.width, height: container.frame.height)
        //Se agrega la vista al contenedor
        container.addSubview(tab.view)
        //recarga el controlador
        tab.viewDidLoad()
        //Se notifica
        tab.didMove(toParentViewController: self)
    }
    
    private func updateToSelect(toButton tag:Int) {
        for subView in cnt_buttons.subviews {
            if let button = subView as? UIButton {
                button.isSelected = button.tag == tag
            }
        }
    }
    
    // MARK: - Actions
    @IBAction func changeTab(_ sender: UIButton) {
        
        updateToSelect(toButton: sender.tag)
        
        switch sender.tag {
            
        case ViewControllerTag.aboutUs_tab1.rawValue:
            showTab(tab: tab1)
            break
            
        case ViewControllerTag.aboutUs_tab2.rawValue:
            showTab(tab: tab2)
            break
            
        default:
            showTab(tab: tab3)
            break
        }
    }

}
