//
//  RegisterViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 2/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: - Outlets
    
    // Buttons
    @IBOutlet weak var btn_next: UIButton!
    @IBOutlet weak var btn_pickerCancel: UIButton!
    @IBOutlet weak var btn_pickerConfirm: UIButton!
    
    @IBOutlet weak var btn_birthday: UIButton!
    @IBOutlet weak var btn_gender: UIButton!
    @IBOutlet weak var btn_dni_type: UIButton!
    @IBOutlet weak var btn_ethnic_group: UIButton!
    @IBOutlet weak var btn_geo_state: UIButton!
    @IBOutlet weak var btn_geo_city: UIButton!
    @IBOutlet weak var btn_condition: UIButton!
    @IBOutlet weak var btn_profile: UIButton!
    
    // Checkbox
    @IBOutlet weak var check_beneficiary: UIImageView!
    @IBOutlet weak var check_terms: UIImageView!
    
    @IBOutlet weak var checkNCR: UIView!
    @IBOutlet weak var checkTerms: UIView!
    
    @IBOutlet weak var cnt_beneficiaryData: UIView!
    @IBOutlet weak var cnt_pickers: UIView!
    
    // Scroll
    @IBOutlet weak var scroll: UIScrollView!
    
    // Pickers
    @IBOutlet weak var picker_birthday: UIDatePicker!
    @IBOutlet weak var picker: UIPickerView!
    
    // promt for selectors
    @IBOutlet weak var promt_birthday: UILabel!
    @IBOutlet weak var promt_gender: UILabel!
    @IBOutlet weak var promt_dni_type: UILabel!
    @IBOutlet weak var promt_ethnic_group: UILabel!
    @IBOutlet weak var promt_geo_state: UILabel!
    @IBOutlet weak var promt_geo_city: UILabel!
    @IBOutlet weak var promt_condition: UILabel!
    @IBOutlet weak var promt_profile: UILabel!
    
    // contentainer selector
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
    private let genderTag: Int = 1
    private let documentTag: Int = 2
    private let ethnicTag: Int = 3
    private let stateTag: Int = 4
    private let cityTag: Int = 5
    private let conditionTag: Int = 6
    private let profileTag: Int = 7
    
    var isBeneficiaryNCR: Bool = false
    var acceptedTerms: Bool = false
    
    var genderList: Array<Gender> = []
    var ethnicGroupList: Array<EthnicGroup> = []
    var stateList: Array<State> = []
    var cityList: Array<City> = []
    var conditionList: Array<Condition> = []
    var profileList: Array<Role> = []
    var documentTypeList: Array<DocumentType> = []

     // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        addStyles()
        loadList()
        addGestureToViews()
        setBeneficiaryState()
        
        cnt_pickers.isHidden = true
        picker.delegate = self
        picker.dataSource = self
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
    
    private func loadList() {
        genderList = AplicationRuntime.sharedManager.getGenderList()
        documentTypeList = AplicationRuntime.sharedManager.getDocumentTypeList()
        ethnicGroupList = AplicationRuntime.sharedManager.getEthnicList()
        stateList = AplicationRuntime.sharedManager.getStateList()
        conditionList = AplicationRuntime.sharedManager.getConditionList()
        profileList = AplicationRuntime.sharedManager.getRoleList()
    }
    
    private func showPicker() {
        cnt_pickers.isHidden = false
        view.endEditing(true)
        
        picker_birthday.isHidden = true
        picker.isHidden = false
    }
    
    private func hiddenPicker() {
        picker_birthday.isHidden = true
        picker.isHidden = true
        cnt_pickers.isHidden =  true
    }
    
    private func addGestureToViews() {
        // Gesture for checkbox
        let tapBeneficiary = UITapGestureRecognizer(target: self, action: #selector(self.tappedBeficiary))
        checkNCR.addGestureRecognizer(tapBeneficiary)
        
        let tapTerms = UITapGestureRecognizer(target: self, action: #selector(self.tappedTerms))
        checkTerms.addGestureRecognizer(tapTerms)
    }
    
    //MARK: - Gesture actions
    @objc func tappedBeficiary(gestureRecognizer: UITapGestureRecognizer){
        isBeneficiaryNCR = !isBeneficiaryNCR
        setBeneficiaryState()
    }
    
    @objc func tappedTerms (gestureRecognizer: UITapGestureRecognizer){
        acceptedTerms = !acceptedTerms
        check_terms.image = acceptedTerms ? #imageLiteral(resourceName: "checkboxselec") : #imageLiteral(resourceName: "checkbox")
    }
    
    //MARK: - UIPicker DataSource and Delegate
    
    //Set number of columms section for the picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Set number of componets for genderPicker and localityPicker
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch pickerView.tag {
            
        case genderTag:
            return genderList.count
            
        case documentTag:
            return documentTypeList.count
            
        case ethnicTag:
            return ethnicGroupList.count
            
        case stateTag:
            return stateList.count
            
        case cityTag:
            return cityList.count
            
        case conditionTag:
            return conditionList.count
            
        case profileTag:
            return profileList.count
            
        default:
            return 0
        }
    }
    
    //Set font to the label and set content
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        //custom label
        let pickerLabel = UILabel()
        pickerLabel.numberOfLines = 0
        pickerLabel.sizeToFit()
        pickerLabel.textColor = UIColor.black
        pickerLabel.textAlignment = NSTextAlignment.center
        
        switch pickerView.tag {
            
        case genderTag:
            pickerLabel.text = genderList[row].name
            break
            
        case documentTag:
            pickerLabel.text = documentTypeList[row].name
            break
            
        case ethnicTag:
            pickerLabel.text = ethnicGroupList[row].name
            break
            
        case stateTag:
            pickerLabel.text = stateList[row].name
            break
            
        case cityTag:
            pickerLabel.text = cityList[row].name
            break
            
        case conditionTag:
            pickerLabel.text = conditionList[row].name
            break
            
        case profileTag:
            pickerLabel.text = profileList[row].name
            break
            
        default:
            break
        }
        
        return pickerLabel
    }
    
    //action for event onchange
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch pickerView.tag {
        
        case genderTag:
            promt_gender.text = genderList[row].name
            break
        
        case documentTag:
            promt_dni_type.text = documentTypeList[row].name
            break
            
        case ethnicTag:
            promt_ethnic_group.text = ethnicGroupList[row].name
            break
            
        case stateTag:
            promt_geo_state.text = stateList[row].name
            break
            
        case cityTag:
            promt_geo_city.text = cityList[row].name
            break
            
        case conditionTag:
            promt_condition.text = conditionList[row].name
            break
            
        case profileTag:
            promt_profile.text = profileList[row].name
            break
            
        default:
            break
        }
        
        picker.isHidden = true
        cnt_pickers.isHidden = true
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 45
    }
    
    // MARK: - Action
    @IBAction func selectorButtons(_ sender: UIButton) {
        
        switch sender {
            
        case btn_birthday:
            return
            
        case btn_gender:
            picker.tag = genderTag
            break
            
        case btn_dni_type:
            picker.tag = documentTag
            break
            
        case btn_ethnic_group:
            picker.tag = ethnicTag
            break
            
        case btn_geo_state:
            picker.tag = stateTag
            break
            
        case btn_geo_city:
            guard promt_geo_state.text != nil, promt_geo_state.text != "Seleccione" else { return }
            cityList = AplicationRuntime.sharedManager.getCityList(forState: promt_geo_state.text!)
            picker.tag = cityTag
            break
            
        case btn_condition:
            picker.tag = conditionTag
            break
            
        case btn_profile:
            picker.tag = profileTag
            break
            
        default:
            break
        }
        
        picker.reloadAllComponents()
        showPicker()
    }
    
    @IBAction func pickerButtons(_ sender: UIButton) {
        
        switch sender {
            
        case btn_pickerCancel:
            hiddenPicker()
            break
            
        default:
            break
        }
    }
    
    @IBAction func next (_ sender: UIButton){
        let sb = UIStoryboard(name: StoryboardsId.configAlert, bundle: nil)
        present(sb.instantiateInitialViewController()!, animated: true, completion: nil)
    }

}
