//
//  CoursesMessagesPopupViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 23/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class CoursesMessagesPopupViewController: UIViewController {

    // MARK: - Outltes
    @IBOutlet weak var btn_tryNext: UIButton!
    @IBOutlet weak var img_icon: UIImageView!
    @IBOutlet weak var lbl_message: UILabel!
    
    // MARK: - Properties
    weak var vbgDelegate: VBGProtocol?
    weak var leadersDelegate: LeadersProtocol?
    
    var typeMessage: TypeMessage = .failed
    var message: String = nullString
    var inBold: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fillView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private Function
    private func fillView() {
        
        img_icon.image = typeMessage == .failed ? #imageLiteral(resourceName: "icon_admiracion") : #imageLiteral(resourceName: "icon_success")
        
        let imageNormal = typeMessage == .failed ? ImageName.tryAgain : ImageName.next
        let imageHover = typeMessage == .failed ? ImageName.tryAgainHover : ImageName.nextHover
        
        btn_tryNext.setImage(UIImage(named: imageNormal), for: .normal)
        btn_tryNext.setImage(UIImage(named: imageHover), for: .highlighted)
        
        if inBold != nil && !(inBold?.isEmpty)! {
            lbl_message.attributedText = addBoldWord(forText: message, toWord: inBold!, fontSize: lbl_message.font.pointSize)
        }
        else {
            lbl_message.text = message
        }
    }
    
    // MARK: - Navigation
    @IBAction func dissmisMessage(_ sender: UIButton) {
        
        if typeMessage == .success {
            vbgDelegate?.nextPage()
            leadersDelegate?.nextPage()
        }
        
        self.dismiss(animated: true, completion: nil)
    }
 
}
