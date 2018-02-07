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
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var segmentTabs: UISegmentedControl!
    
    @IBOutlet weak var lbl_title: UILabel!
    
    // MARK: - Properties
    private let tab1Index: Int = 0
    private let tab2Index: Int = 1
    private let tab3Index: Int = 2
    
    var tab1: AboutUsTab1ViewController!
    var tab2: AboutUsTab2ViewController!
    var tab3: AboutUsTab3ViewController!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        instanciateTabs()
        customSegment()
        
        segmentTabs.selectedSegmentIndex = tab1Index
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
        tab1 = self.storyboard?.instantiateViewController(withIdentifier: ViewControllersId.aboutUs_tab1) as! AboutUsTab1ViewController
        tab2 = self.storyboard?.instantiateViewController(withIdentifier: ViewControllersId.aboutUs_tab2) as! AboutUsTab2ViewController
        tab3 = self.storyboard?.instantiateViewController(withIdentifier: ViewControllersId.aboutUs_tab3) as! AboutUsTab3ViewController
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
    
    // MARK: - Actions
    @IBAction func changeTab(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
            
        case tab1Index:
            showTab(tab: tab1)
            break
            
        case tab2Index:
            showTab(tab: tab2)
            break
            
        default:
            showTab(tab: tab3)
            break
        }
    }

}
