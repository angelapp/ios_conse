//
//  MyCoursesViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 12/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class MyCoursesViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var btn_vbg: UIButton!
    @IBOutlet weak var btn_plc: UIButton!
    
    @IBOutlet weak var lbl_title: UILabel!
    
    // MARK: - Properties
    weak var mainDelegate: MainProtocol?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    @IBAction func selectCourse(_ sender: UIButton) {
        
        switch sender {
            
        case btn_vbg:
            mainDelegate?.addToContainer(viewControllerID: .courseVBG)
            break
            
        default:
            mainDelegate?.addToContainer(viewControllerID: .coursePLC)
            break
        }
    }
}
