//
//  CrosswordHelpViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 19/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class CrosswordHelpViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var lbl_helpText: UILabel!
    @IBOutlet weak var popupScreen: UIView!
    
    // MARK: - Properties
    var titleText: String!
    var helpText: String!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Add gestur for close popup when the user tap the view
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(self.tapScreen))
        popupScreen.addGestureRecognizer(tapScreen)
        
        //Show Help
        fillView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private function
    private func fillView() {
        self.lbl_title.text = titleText
        self.lbl_helpText.text = helpText
    }
    
    // MARK: - Actions
    @objc func tapScreen(gesture: UITapGestureRecognizer){
        self.dismiss(animated: true, completion: nil)
    }
}
