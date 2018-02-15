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

        addStyles()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private Functions
    private func addStyles() {
        setBackTitle(forViewController: self, title: blankSpace)
        
        btn_man.imageView?.contentMode = .scaleAspectFit
        btn_woman.imageView?.contentMode = .scaleAspectFit
    }
    
    // MARK: - Actions
    @IBAction func actionButtons(_ sender: UIButton) {
        
        let avatar = MyAvatarPieces()
        avatar.genderID = sender == btn_man ? AvatarGenderIDs.male.rawValue : AvatarGenderIDs.female.rawValue
        
        AplicationRuntime.sharedManager.setAvatarPieces(avatarPieces: avatar)
        
        performSegue(withIdentifier: segueID.makeYourAvatar, sender: self)
    }
}
