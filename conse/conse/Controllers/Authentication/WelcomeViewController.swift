//
//  WelcomeViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 2/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var btn_login: UIButton!
    @IBOutlet weak var btn_register: UIButton!
    
    @IBOutlet weak var img_nrc_logo: UIImageView!
    @IBOutlet weak var img_conse_logo: UIImageView!
    @IBOutlet weak var img_alert_button: UIImageView!
    
    @IBOutlet weak var scroll: UIScrollView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        addStyles()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // set content height to scroll
    override func viewDidLayoutSubviews() {
        
        var contentRect = CGRect.zero
        
        for view in scroll.subviews {
            contentRect = contentRect.union(view.frame)
        }
        
        scroll.contentSize = CGSize(width: self.accessibilityFrame.width, height: contentRect.size.height)
    }
    
    // MARK: - private functions
    private func addStyles(){
        btn_register.rounder()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
