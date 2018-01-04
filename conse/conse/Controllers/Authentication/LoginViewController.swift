//
//  LoginViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 2/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var btn_alert: UIButton!
    @IBOutlet weak var btn_loggin: UIButton!
    @IBOutlet weak var btn_recoveryPassword: UIButton!
    
    @IBOutlet weak var img_logo: UIImageView!
    
    @IBOutlet weak var tf_email: UITextField!
    @IBOutlet weak var tf_password: UITextField!
    
    @IBOutlet weak var scroll: UIScrollView!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        addStyles()
        setBackTitle(forViewController: self, title: " ")
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
    private func addStyles() {
        btn_alert.imageView?.contentMode = .scaleAspectFit
        btn_loggin.imageView?.contentMode = .scaleAspectFit
        tf_email.underline(margin: ConseValues.margin)
        tf_password.underline(margin: ConseValues.margin)
    }
    
    // MARK: - Actions
    @IBAction func send (_ sender: UIButton){
        
        switch sender {
            
        case btn_loggin:
            break
            
        default:
            break
        }
    }

}
