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
    
    // Checkbox
    @IBOutlet weak var check_beneficiary: UIImageView!
    @IBOutlet weak var check_terms: UIImageView!
    
    @IBOutlet weak var checkNCR: UIView!
    @IBOutlet weak var checkTerms: UIView!
    
    @IBOutlet weak var cnt_beneficiaryData: UIView!
    
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
    
    // Constraits
    @IBOutlet weak var constraints_NRC_Height: NSLayoutConstraint!
    
    // MARK: - propeties
    var isBeneficiaryNCR: Bool = false
    var acceptedTerms: Bool = false

     // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        addStyles()
        setBeneficiaryState()
        
        // Add gesture
        let tapBeneficiary = UITapGestureRecognizer(target: self, action: #selector(self.tappedBeficiary))
        checkNCR.addGestureRecognizer(tapBeneficiary)
        
        let tapTerms = UITapGestureRecognizer(target: self, action: #selector(self.tappedTerms))
        checkTerms.addGestureRecognizer(tapTerms)
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
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = Colors().getColor(from: ConseColors.yellow.rawValue)
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    // MARK: - private functions
    private func addStyles(){
        
        self.navigationController?.navigationBar.barTintColor = UIColor.groupTableViewBackground
        self.navigationController?.navigationBar.tintColor = UIColor.black
        
        setBackTitle(forViewController: self, title: blankSpace)
        btn_next.imageView?.contentMode = .scaleAspectFit
        
        let underlineWidth = (ConseValues.margin + ConseValues.innerMargin)
        
        selector_birthday.underline(margin: underlineWidth)
        selector_gender.underline(margin: underlineWidth)
        selector_dni_type.underline(margin: underlineWidth)
        selector_ethnic_group.underline(margin: underlineWidth)
        selector_geo_state.underline(margin: underlineWidth)
        selector_geo_city.underline(margin: underlineWidth)
        selector_condition.underline(margin: underlineWidth)
        selector_profile.underline(margin: underlineWidth)
        
        tf_dni_number.underline(margin: underlineWidth)
        tf_email.underline(margin: underlineWidth)
        tf_name.underline(margin: underlineWidth)
        tf_lastname.underline(margin: underlineWidth)
        tf_password.underline(margin: underlineWidth)
        tf_confirmPassword.underline(margin: underlineWidth)
    }
    
    private func setBeneficiaryState() {
        
        cnt_beneficiaryData.isHidden = !isBeneficiaryNCR
        constraints_NRC_Height.constant = hiddenView(view: .NCR_DATA, state: !isBeneficiaryNCR)
        check_beneficiary.image = isBeneficiaryNCR ? #imageLiteral(resourceName: "checkboxselec") : #imageLiteral(resourceName: "checkbox")
        
        if isBeneficiaryNCR && scroll.contentSize.height <= 510 {
            scroll.contentSize.height += ConseValues.dataNCRHeight
        }
        if !isBeneficiaryNCR && scroll.contentSize.height > 800 {
            scroll.contentSize.height -= ConseValues.dataNCRHeight
        }
    }
    
    @objc func tappedBeficiary(gestureRecognizer: UITapGestureRecognizer){
        isBeneficiaryNCR = !isBeneficiaryNCR
        setBeneficiaryState()
    }
    
    @objc func tappedTerms (gestureRecognizer: UITapGestureRecognizer){
        acceptedTerms = !acceptedTerms
        check_terms.image = acceptedTerms ? #imageLiteral(resourceName: "checkboxselec") : #imageLiteral(resourceName: "checkbox")
    }
    
    // MARK: - Action
    @IBAction func next (_ sender: UIButton){
        let sb = UIStoryboard(name: StoryboardsId.configAlert, bundle: nil)
        present(sb.instantiateInitialViewController()!, animated: true, completion: nil)
    }

}
