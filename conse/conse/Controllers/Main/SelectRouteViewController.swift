//
//  SelectRouteViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 31/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class SelectRouteViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var btn_vbgRoute: UIView!
    @IBOutlet weak var btn_leadersRoute: UIView!
    
    // MARK: - Properties
    weak var protectionRouteDelegate: ProtectionRouteProtocol?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        addGestureToViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private Functions
    private func addGestureToViews() {
        let tapVBG = UITapGestureRecognizer(target: self, action: #selector(self.tappedVBG))
        btn_vbgRoute.addGestureRecognizer(tapVBG)
        
        let tapLeaders = UITapGestureRecognizer(target: self, action: #selector(self.tappedLeaders))
        btn_leadersRoute.addGestureRecognizer(tapLeaders)
    }
    
    //MARK: - Gesture actions
    @objc func tappedVBG(gestureRecognizer: UITapGestureRecognizer){
        protectionRouteDelegate?.showRoute(id: .vbgRoute)
    }
    
    @objc func tappedLeaders (gestureRecognizer: UITapGestureRecognizer){
        protectionRouteDelegate?.showRoute(id: .leadersRoute)
    }
}
