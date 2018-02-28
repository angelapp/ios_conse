//
//  ChoiceAvatarGenderViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 11/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class ChoiceAvatarGenderViewController: UIViewController {

    // MARK: - Outlet
    @IBOutlet weak var btn_man: UIButton!
    @IBOutlet weak var btn_woman: UIButton!
    
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var lbl_message: UILabel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Add buttons style
        setAspectFitToButton(buttons: btn_man, btn_woman)
        
        // Fill labels
        lbl_title.text = AvatarStrings.makeYourAvatarTitle
        lbl_message.text = AvatarStrings.makeYourAvatarMessage
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    @IBAction func actionButtons(_ sender: UIButton) {
        
        let avatar = MyAvatarPieces()
        avatar.genderID = sender == btn_man ? AvatarGenderIDs.male.rawValue : AvatarGenderIDs.female.rawValue
        AplicationRuntime.sharedManager.setAvatarPieces(avatarPieces: avatar)
        
        performSegue(withIdentifier: segueID.makeYourAvatar, sender: self)
    }
}
