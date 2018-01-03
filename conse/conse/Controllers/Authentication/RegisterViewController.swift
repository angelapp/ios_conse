//
//  RegisterViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 2/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    // MARK: - Outlets
    
    // Buttons
    @IBOutlet weak var btn_next: UIButton!
    
    // Scroll
    @IBOutlet weak var scroll: UIScrollView!
    
    // Pickers
    
    // promt for selectors
    @IBOutlet weak var promt_birthday: UILabel!
    @IBOutlet weak var promt_gender: UILabel!
    @IBOutlet weak var promt_dni_type: UILabel!
    @IBOutlet weak var promt_ethnic_group: UILabel!
    @IBOutlet weak var promt_geo_state: UILabel!
    @IBOutlet weak var promt_geo_city: UILabel!
    @IBOutlet weak var promt_condition: UILabel!
    @IBOutlet weak var promt_profile: UILabel!
    
    // View as selector button
    @IBOutlet weak var selector_birthday: UIView!
    @IBOutlet weak var selector_gender: UIView!
    @IBOutlet weak var selector_dni_type: UIView!
    @IBOutlet weak var selector_ethnic_group: UIView!
    @IBOutlet weak var selector_geo_state: UIView!
    @IBOutlet weak var selector_geo_city: UIView!
    @IBOutlet weak var selector_condition: UIView!
    @IBOutlet weak var selector_profile: UIView!
    
    // Textfields
    @IBOutlet weak var tf_dni_number: UITextField!
    @IBOutlet weak var tf_email: UITextField!
    @IBOutlet weak var tf_name: UITextField!
    @IBOutlet weak var tf_lastname: UITextField!
    @IBOutlet weak var tf_password: UITextField!
    @IBOutlet weak var tf_confirmPassword: UITextField!

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
        
        btn_next.rounder()
        
        let underlineWidth = UIScreen.main.bounds.width - ((ConseValues.margin + ConseValues.innerMargin) * 2)
        
        selector_birthday.underline(width: underlineWidth)
        selector_gender.underline(width: underlineWidth)
        selector_dni_type.underline(width: underlineWidth)
        selector_ethnic_group.underline(width: underlineWidth)
        selector_geo_state.underline(width: underlineWidth)
        selector_geo_city.underline(width: underlineWidth)
        selector_condition.underline(width: underlineWidth)
        selector_profile.underline(width: underlineWidth)
        
        tf_dni_number.underline(width: underlineWidth)
        tf_email.underline(width: underlineWidth)
        tf_name.underline(width: underlineWidth)
        tf_lastname.underline(width: underlineWidth)
        tf_password.underline(width: underlineWidth)
        tf_confirmPassword.underline(width: underlineWidth)
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
