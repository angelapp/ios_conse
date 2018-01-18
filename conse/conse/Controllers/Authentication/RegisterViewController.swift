//
//  RegisterViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 2/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit
import ObjectMapper

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
    
    // Conteiners
    @IBOutlet weak var cnt_beneficiaryData: UIView!
    @IBOutlet weak var cnt_pickers: UIView!
    
    // labels
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var lbl_terms: UILabel!
    
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
    @IBOutlet weak var constraints_register_height: NSLayoutConstraint!
    @IBOutlet weak var constraints_terms_height: NSLayoutConstraint!
    @IBOutlet weak var constraints_userConse_Height: NSLayoutConstraint!
    
    // MARK: - propeties
    
    // tags para cargar información en el picker
    private let genderTag: Int = 1
    private let documentTag: Int = 2
    private let ethnicTag: Int = 3
    private let stateTag: Int = 4
    private let cityTag: Int = 5
    private let conditionTag: Int = 6
    private let profileTag: Int = 7
    
    weak var mainDelegate: MainProtocol?
    
    // flag (Register profile or Edit profile) default Register
    var formType: ViewControllerTag = .register
    var profile: ProfileSerializer!
    var user: UserSerializer!
    
    // booleanos para determinar estado de los checkbox
    var isBeneficiaryNCR: Bool = false
    var acceptedTerms: Bool = false
    
    // listas para los spinners
    var genderList: Array<Gender> = []
    var ethnicGroupList: Array<EthnicGroup> = []
    var stateList: Array<State> = []
    var cityList: Array<City> = []
    var conditionList: Array<Condition> = []
    var profileList: Array<Role> = []
    var documentTypeList: Array<DocumentType> = []
    
    // variables para guardar los id de los elementos seleccionados
    var pickerDate: Date!
    var actualCityID: Int!
    var conditionID: Int!
    var documentTypeID: Int!
    var ethniGroupID: Int!
    var genderID: Int!
    var originCityID: Int!
    var roleID: Int!

     // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        addStyles()
        loadData()
        fillView()
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
    
    // change navbor whe this controller disappear
    override func viewWillDisappear(_ animated: Bool) {
        if formType == .register {
            self.navigationController?.navigationBar.barTintColor = Colors().getColor(from: ConseColors.yellow.rawValue)
            self.navigationController?.navigationBar.tintColor = UIColor.white
            
        }
    }
    
    // MARK: - private functions
    private func addStyles(){
        
        // change navbar color
        if formType == .register {
            self.navigationController?.navigationBar.barTintColor = UIColor.groupTableViewBackground
            self.navigationController?.navigationBar.tintColor = UIColor.black
        }
        
        setBackTitle(forViewController: self, title: blankSpace)
        btn_next.imageView?.contentMode = .scaleAspectFit
        picker_birthday.maximumDate = Date()
        
        // width of under line
        let underlineWidth = (ConseValues.margin + ConseValues.innerMargin)
        
        // set underline for views
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
        
        // Set styles to terms and conditions copy
        let termsLabel = String(format: Strings.body_Checkbox_AcceptTerms, Strings.terms_Copy)
        let termsRange = (termsLabel as NSString).range(of: Strings.terms_Copy)
        let termsAttributed = NSMutableAttributedString(string: termsLabel)
        let underlineAttribute = [NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue]
        let colorAttribute = [NSAttributedStringKey.foregroundColor: Colors().getColor(from: ConseColors.salmon.rawValue)]
        
        termsAttributed.addAttributes(underlineAttribute, range: termsRange)
        termsAttributed.addAttributes(colorAttribute, range: termsRange)
        
        lbl_terms.attributedText = termsAttributed
        
        // Add tapGesture for make terms link
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapFunction))
        lbl_terms.isUserInteractionEnabled = true
        lbl_terms.addGestureRecognizer(tap)
    }
    
    /// Llena la vista, deacuerdo al tag (Register or EditProfile)
    private func fillView() {
        checkTerms.isHidden = formType != .register
        lbl_title.text = formType == .register ? nullString : Strings.copy_profileTitle
        tf_email.isEnabled = formType == .register
        tf_password.isHidden = formType != .register
        tf_confirmPassword.isHidden = formType != .register
        
        constraints_register_height.constant = formType == .register ? 120.0 : 68.0
        constraints_terms_height.constant = formType == .register ? 52.0 : 0.0
        constraints_userConse_Height.constant = formType == .register ? ConseValues.conseUser_Height : ConseValues.conseUserProfile_Heigth
        
        // Se llenan los campos si el formulario es de editar perfil
        if formType == .editProfile {
            
            if user != nil {
                tf_email.text = user.email
                tf_name.text = user.first_name
                tf_lastname.text = user.last_name
            }
            
            // Si hay datos de perfil se precargan
            if profile != nil {
                promt_birthday.text = profile.birthdate
                promt_birthday.textColor = UIColor.black
                genderID = profile.gender.id
                promt_gender.text = profile.gender.name
                isBeneficiaryNCR = profile.isNRCBeneficiary
            
                if isBeneficiaryNCR {
                    documentTypeID = profile.document_type.id
                    promt_dni_type.text = profile.document_type.name
                    tf_dni_number.text = profile.document_number
                    
                    ethniGroupID = profile.ethnic_group.id
                    promt_ethnic_group.text = profile.ethnic_group.name
                    
                    actualCityID = Int(profile.origin_city.name)
//                    promt_geo_state.text = profile.origin_city.state
                    
                    originCityID = profile.origin_city.id
                    promt_geo_city.text = profile.origin_city.name
                    
                    conditionID = profile.condition.id
                    promt_condition.text = profile.condition.name
                    
                    roleID = profile.role.id
                    promt_profile.text = profile.role.name
                }
            }
        }
    }
    
    /// Change state of beneficiaryNRC and update form for show or hidden fields
    private func setBeneficiaryState() {
        cnt_beneficiaryData.isHidden = !isBeneficiaryNCR
        constraints_NRC_Height.constant = hiddenView(view: .NCR_DATA, state: !isBeneficiaryNCR)
        check_beneficiary.image = isBeneficiaryNCR ? #imageLiteral(resourceName: "checkboxselec") : #imageLiteral(resourceName: "checkbox")
        
        // Show NCR data form
        if isBeneficiaryNCR && scroll.contentSize.height <= 510 {
            scroll.contentSize.height += ConseValues.dataNCRHeight
        }
        
        // Hidden NCR data form
        if !isBeneficiaryNCR && scroll.contentSize.height > 800 {
            scroll.contentSize.height -= ConseValues.dataNCRHeight
        }
    }
    
    /// Get list from appConfig (Runtime)
    private func loadData() {
        genderList = AplicationRuntime.sharedManager.getGenderList()
        documentTypeList = AplicationRuntime.sharedManager.getDocumentTypeList()
        ethnicGroupList = AplicationRuntime.sharedManager.getEthnicList()
        stateList = AplicationRuntime.sharedManager.getStateList()
        conditionList = AplicationRuntime.sharedManager.getConditionList()
        profileList = AplicationRuntime.sharedManager.getRoleList()
        
        if formType == .editProfile {
            profile = AplicationRuntime.sharedManager.getUserProfile()
            user = AplicationRuntime.sharedManager.getUser()
        }
    }
    
    /// Show picker view
    private func showPicker(isDatePicker: Bool) {
        cnt_pickers.isHidden = false
        view.endEditing(true)
        
        btn_pickerConfirm.isHidden = !isDatePicker
        btn_pickerCancel.isHidden = isDatePicker
        
        picker_birthday.isHidden = !isDatePicker
        picker.isHidden = isDatePicker
    }
    
    /// Hidden picker view
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
    
    // Lanza navegador con los términos y condiciones
    @objc func tapFunction(sender: UITapGestureRecognizer) {
        
        let termsLabel = lbl_terms.text!
        let termsRange = (termsLabel as NSString).range(of: Strings.terms_Copy)
        
        if sender.didTapAttributedTextInLabel(label: lbl_terms, inRange: termsRange) {
            let stringURL = AplicationRuntime.sharedManager.getURLTerms()
            let webURL = stringURL.contains(Strings.hasHTTPProtocol) ? stringURL : Strings.httpProtocol + stringURL
            
            if let url = URL(string: webURL), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                }
                else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
    }
    
    // MARK: - Request function
    /// Realiza las validaciones de acuerdo al tipo de formulario (Registro o edición de perfil )
    private func prepareRequest(forViewController id: ViewControllerTag) {
        
        // Se valida que todos los campos esten completos
        guard Validations.isValidData(fromField: tf_name, controller: self),
            Validations.isValidData(fromField: tf_lastname, controller: self),
            Validations.isValidData(fromField: promt_gender, controller: self),
            Validations.isValidDate(birthDate: promt_birthday.text, controller: self) else {
                return
        }
        
        // Campos que solo se validan si el usuario se esat registrando
        if id == .register {
            guard Validations.isValidData(fromField: tf_email, controller: self),
                Validations.isValidData(fromField: tf_password, controller: self),
                Validations.isValidData(fromField: tf_confirmPassword, controller: self) else {
                    return
            }
            
            // Se validan los formatos
            guard Validations.isValidEmail(email: tf_email.text!, controller: self),
                Validations.isValidPass(pass: tf_password.text!, controller: self) else {
                    return
            }
            
            // Se validan las contraseñas
            guard  tf_password.text! == tf_confirmPassword.text else {
                self.showErrorMessage(withMessage: Strings.error_message_passNotMatch)
                return
            }
            
            // Se verifica que accepte los terminos
            guard acceptedTerms else {
                self.showErrorMessage(withMessage: Strings.error_message_requieredData)
                return
            }
        }
        
        // Si es beneficiario conse valida que todos los campos esten llenos
        if isBeneficiaryNCR {
            
            guard Validations.isValidData(fromField: tf_dni_number, controller: self),
                Validations.isValidData(fromField: promt_dni_type, controller: self),
                Validations.isValidData(fromField: promt_ethnic_group, controller: self),
                Validations.isValidData(fromField: promt_geo_state, controller: self),
                Validations.isValidData(fromField: promt_geo_city, controller: self),
                Validations.isValidData(fromField: promt_condition, controller: self),
                Validations.isValidData(fromField: promt_profile, controller: self)
                else {
                    return
            }
        }
        
        // Crea el modelo para enviar al servidor
        let newUSR = RegisterUserProfileModel()
        newUSR.first_name = tf_name.text
        newUSR.last_name = tf_lastname.text
        newUSR.email =  tf_email.text
        newUSR.password = tf_password.text
        newUSR.birthdate = promt_birthday.text
        newUSR.isNRCBeneficiary = isBeneficiaryNCR
        newUSR.gender = genderID
        
        if isBeneficiaryNCR {
            newUSR.document_number = tf_dni_number.text
            newUSR.actual_city = actualCityID
            newUSR.condition = conditionID
            newUSR.document_type = documentTypeID
            newUSR.ethnic_group = ethniGroupID
            newUSR.origin_city = originCityID
            newUSR.role = roleID
        }
        
        sendRequest(formModel: newUSR)
    }
    
    /// Se envia los datos del usuario para registarlo
    func sendRequest(formModel: RegisterUserProfileModel){
        
        //self.showLoader(withMessage: Strings.loader_loading)
        
        let json = Mapper().toJSONString(formModel, prettyPrint: true)
        var headers:[[String:String]] = []
        
        var apiURL = NetworkPOST.CREATE_USER
        var method: NetworkRestMethods = .methodPOST
        
        if (formType == .editProfile){
            let token = NetworkConfig.token + AplicationRuntime.sharedManager.getUserToken()
            
            apiURL = NetworkPUT.USER_PROFILE_EDIT + String(format: NetworkURLComplement.update_profile, profile.id)
            method = .methodPUT
            headers.append([NetworkConfig.headerName: NetworkConfig.headerAuthorization,
                            NetworkConfig.headerValue: token])
        }
        
        Network.buildRequest(urlApi: apiURL, json: json, extraHeaders: headers, method: method, completion: { (response) in
            
           // NotificationCenter.default.post(name: NSNotification.Name(rawValue: observerName.stop_loader), object: nil)
            
            switch response {
                
            case .succeeded(let succeed, let message):
                if !succeed {
                    printDebugMessage(tag: message)
                    self.showErrorMessage(withMessage: message)
                }
                break
                
            case .error(let error):
                print(error.debugDescription)
                break
                
            case .succeededObject(let objReceiver):
                
                let user = Mapper<RegisterUserResponse>().map(JSON: objReceiver as! [String: Any])
                let stateModel = StatesModel()
                stateModel.wasLoggedAtSomeTime = true
                
                StorageFunctions.saveDataInLocal(user: user)
                StorageFunctions.saveStates(states: stateModel)
                AplicationRuntime.sharedManager.setUserData(user: user)
                
                if self.formType == .editProfile {
                    self.mainDelegate?.removeOfContainer()
                    self.mainDelegate?.showMessageInMain(withMessage: Strings.message_ok_update)
                }
                else {
                    let sb = UIStoryboard(name: StoryboardsId.configAlert, bundle: nil)
                    self.present(sb.instantiateInitialViewController()!, animated: true, completion: nil)
                }
                
                break
                
            default:
                break
            }
        })
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
            genderID = genderList[row].id
            break
        
        case documentTag:
            promt_dni_type.text = documentTypeList[row].name
            documentTypeID = documentTypeList[row].id
            break
            
        case ethnicTag:
            promt_ethnic_group.text = ethnicGroupList[row].name
            ethniGroupID = ethnicGroupList[row].id
            break
            
        case stateTag:
            promt_geo_state.text = stateList[row].name
            actualCityID = stateList[row].id
            break
            
        case cityTag:
            promt_geo_city.text = cityList[row].name
            originCityID = cityList[row].id
            break
            
        case conditionTag:
            promt_condition.text = conditionList[row].name
            conditionID = conditionList[row].id
            break
            
        case profileTag:
            promt_profile.text = profileList[row].name
            roleID = profileList[row].id
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
    /// Carga el picker con la información que se debe mostar
    @IBAction func selectorButtons(_ sender: UIButton) {
        
        switch sender {
            
        case btn_birthday:
            showPicker(isDatePicker: true)
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
            guard promt_geo_state.text != nil, promt_geo_state.text?.lowercased() != Strings.texfiled_placeholder.lowercased() else { return }
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
        showPicker(isDatePicker: false)
    }
    
    @IBAction func pickerButtons(_ sender: UIButton) {
        if sender == btn_pickerConfirm { setBirthday(picker_birthday) }
        hiddenPicker()
    }
    
    /// Actualiza el campo de fecha de nacimiento cada vez que se actualiza el picker
    @IBAction func setBirthday(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = DateTimeFormat.commonDateFormat
        promt_birthday.text = formatter.string(from: sender.date)
        promt_birthday.textColor = UIColor.black
        pickerDate = sender.date
    }
    
    /// Realiza las validaciones y contruye el modelo de datos para enviar al servidor
    @IBAction func next (_ sender: UIButton) {
        prepareRequest(forViewController: formType)
    }
}
