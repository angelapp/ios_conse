//
//  LeadersRouteViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 31/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class LeadersRouteViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var segmentTabs: UISegmentedControl!
    
    // MARK: - Properties
    private let leadersRouteOneIndex: Int = 0
    private let leadersRouteTwoIndex: Int = 1
    private let videoIndex: Int = 2
    
    var leadersRouteOne_tab: LeadersRouteOneViewController!
    var leadersRouteTwo_tab: LeadersRouteTwoViewController!
    var video_tab: ViedoPlayerViewController!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        instanciateTabs()
        customSegment()
        
        segmentTabs.selectedSegmentIndex = leadersRouteOneIndex
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
        leadersRouteOne_tab = self.storyboard?.instantiateViewController(withIdentifier: ViewControllersId.leadersRouteOne) as! LeadersRouteOneViewController
        leadersRouteTwo_tab = self.storyboard?.instantiateViewController(withIdentifier: ViewControllersId.leadersRouteTwo) as! LeadersRouteTwoViewController
        video_tab = self.storyboard?.instantiateViewController(withIdentifier: ViewControllersId.videoPLayer) as! ViedoPlayerViewController
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
            
        case videoIndex:
//            video_tab.videoID = AplicationRuntime.sharedManager.getvideoID()
            showTab(tab: video_tab)
            break
            
        case leadersRouteTwoIndex:
            showTab(tab: leadersRouteTwo_tab)
            
        default:
            showTab(tab: leadersRouteOne_tab)
            break
        }
    }
    
}

