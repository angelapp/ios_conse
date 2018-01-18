//
//  DocumentBankViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 12/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class DocumentBankViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var segmentTabs: UISegmentedControl!
    
    // MARK: - Properties
    private let formatsIndex: Int = 0
    private let legalIndex: Int = 1
    private let shieldIndex: Int = 2
    
    var tab_formats: FormatBankViewController!
    var tab_legal: LegalViewController!
    var tab_shield: ProtectionShieldViewController!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        instanciateTabs()
        customSegment()
        
        segmentTabs.selectedSegmentIndex = formatsIndex
        changeTab(segmentTabs)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private Functions
    private func customSegment() {
        UILabel.appearance(whenContainedInInstancesOf: [UISegmentedControl.self]).numberOfLines = 0
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedStringKey.font: UIFont.systemFont(ofSize: 10.0)], for: .normal)
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 10.0)], for: .selected)
    }
    
    private func instanciateTabs() {
        tab_formats = self.storyboard?.instantiateViewController(withIdentifier: ViewControllersId.formatBank) as! FormatBankViewController
        tab_legal = self.storyboard?.instantiateViewController(withIdentifier: ViewControllersId.legal) as! LegalViewController
        tab_shield = self.storyboard?.instantiateViewController(withIdentifier: ViewControllersId.protectionShield) as! ProtectionShieldViewController
    }
    
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
    
    // MARK: - Public Functions (Access by protocols)
    
    
    // MARK: - Actions
    @IBAction func changeTab(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
            
        case formatsIndex:
            showTab(tab: tab_formats)
            break
            
        case legalIndex:
            showTab(tab: tab_legal)
            break
            
        default:
            showTab(tab: tab_shield)
            break
        }
    }
    
}
