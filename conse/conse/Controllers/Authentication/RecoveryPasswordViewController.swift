//
//  RecoveryPasswordViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 2/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class RecoveryPasswordViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var btn_alert: UIButton!
    @IBOutlet weak var btn_send: UIButton!
    @IBOutlet weak var img_logo: UIImageView!
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var tf_email: UITextField!
    
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
    
    // MARK: - Private functions
    private func addStyles() {
        
        btn_send.imageView?.contentMode = .scaleAspectFit
        btn_alert.imageView?.contentMode = .scaleAspectFit
        tf_email.underline(margin: ConseValues.margin)
    }
    
    // MARK: - actions
    @IBAction func send(_ sender: UIButton){
        
    }
}
