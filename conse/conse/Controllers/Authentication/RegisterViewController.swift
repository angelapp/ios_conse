//
//  RegisterViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 2/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit
import ObjectMapper

class RegisterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    // MARK: - Outlets
    
    // Buttons
    @IBOutlet weak var btn_back: UIButton!
    @IBOutlet weak var btn_next: UIButton!
    @IBOutlet weak var btn_edtAvatar: UIButton!
    @IBOutlet weak var btn_edtContacts: UIButton!
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
    @IBOutlet weak var cnt_editButtons: UIView!
    @IBOutlet weak var cnt_beneficiaryData: UIView!
    @IBOutlet weak var cnt_pickers: UIView!
    
    // Images
    @IBOutlet weak var img_avatar: UIImageView!
    
    // labels
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var lbl_terms: UILabel!
    
    @IBOutlet weak var lbl_error_name: UILabel!
    @IBOutlet weak var lbl_error_lastName: UILabel!
    @IBOutlet weak var lbl_error_birthday: UILabel!
    @IBOutlet weak var lbl_error_gender: UILabel!
    @IBOutlet weak var lbl_error_email: UILabel!
    @IBOutlet weak var lbl_error_pass: UILabel!
    @IBOutlet weak var lbl_error_confirmPass: UILabel!
    @IBOutlet weak var lbl_error_IDType: UILabel!
    @IBOutlet weak var lbl_error_dni: UILabel!
    @IBOutlet weak var lbl_error_ethnic: UILabel!
    @IBOutlet weak var lbl_error_state: UILabel!
    @IBOutlet weak var lbl_error_town: UILabel!
    @IBOutlet weak var lbl_error_condition: UILabel!
    @IBOutlet weak var lbl_error_role: UILabel!
    @IBOutlet weak var lbl_error_terms: UILabel!
    @IBOutlet weak var lbl_error_telephone: UILabel!
    
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
    @IBOutlet weak var navBar: UIView!
    
    // Textfields
    @IBOutlet weak var tf_dni_number: UITextField!
    @IBOutlet weak var tf_email: UITextField!
    @IBOutlet weak var tf_name: UITextField!
    @IBOutlet weak var tf_lastname: UITextField!
    @IBOutlet weak var tf_password: UITextField!
    @IBOutlet weak var tf_confirmPassword: UITextField!
    @IBOutlet weak var tf_telephone: UITextField!
    
    // Constraits
    @IBOutlet weak var constraints_editBtns_height: NSLayoutConstraint!
    @IBOutlet weak var constraints_navBar: NSLayoutConstraint!
    @IBOutlet weak var constraints_NRC_Height: NSLayoutConstraint!
    @IBOutlet weak var constraints_register_height: NSLayoutConstraint!
    @IBOutlet weak var constraints_terms_height: NSLayoutConstraint!
    @IBOutlet weak var constraints_userConse_Height: NSLayoutConstraint!
    @IBOutlet weak var constraints_scrollBottom: NSLayoutConstraint!
    
    // MARK: - propeties
    
    // tags para cargar información en el picker
    private let birthdayTag: Int = 0
    private let genderTag: Int = 1
    private let documentTag: Int = 2
    private let ethnicTag: Int = 3
    private let stateTag: Int = 4
    private let cityTag: Int = 5
    private let conditionTag: Int = 6
    private let profileTag: Int = 7
    
    weak var mainDelegate: MainProtocol?
    var currentTextfield: UITextField!
    var constraintBottom: CGFloat = 0.0
    var actualViewYPosition: CGFloat = ConseValues.defaultPositionY
    
    // flag (Register profile or Edit profile) default Register
    var profile: ProfileSerializer!
    var user: UserSerializer!
    
    // booleanos para determinar estado de los checkbox
    var isRegister: Bool = true
    var isBeneficiaryNCR: Bool = false
    var isTermsAccepted: Bool = false
    
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
    var conditionID: Int!
    var documentTypeID: Int!
    var ethniGroupID: Int!
    var genderID: Int!
    var geoCityID: Int!
    var geoStateID: Int!
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
        
        self.hideKeyboardWhenTappedAround()
        
        //Se agrega observable para desplazar vista cuando se muestra/oculta el teclado
        NotificationCenter.default.removeObserver(Any.self)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
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
    
    //MARK: - Métodos para el control de eventos del teclado
    //Observer for increment contentSize of the scroll
    @objc func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            constraints_scrollBottom.constant = keyboardSize.height
            
            if actualViewYPosition >= keyboardSize.height {
                var forceBottomY: CGFloat = 0
                if (currentTextfield != nil && currentTextfield == tf_dni_number){
                    forceBottomY = 210
                }
                let centerOffsetY = (scroll.frame.size.height / 2) + forceBottomY
                scroll.setContentOffset(CGPoint(x: ConseValues.defaultPositionX, y: centerOffsetY), animated: true)
            }
        }
    }
    
    //Obeserver for move frame to origin when keyboard is hiden
    @objc func keyboardWillHide(notification: NSNotification) {
        constraints_scrollBottom.constant = constraintBottom
    }
    
    // MARK: - TextFields
    /// Se agrega boton de retorno o confirmacion al teclado numerico
    func addDoneButtonOnKeyboard() {
        let doneToolbar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: 50))
        doneToolbar.barStyle = UIBarStyle.default
        doneToolbar.items = [
            UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(title: Strings.button_accept, style: UIBarButtonItemStyle.done, target: self, action: #selector(self.doneButtonAction))
        ]
        
        doneToolbar.sizeToFit()
        
        self.tf_telephone.inputAccessoryView = doneToolbar
    }
    
    /// Se agrega el funcionalidad de *Return* a la barra del teclado
    @objc func doneButtonAction() -> Bool {
        return self.textFieldShouldReturn(tf_telephone)
    }
    
    //Get the actual position of the TextView
    func textFieldDidBeginEditing(_ textField: UITextField) {
        currentTextfield = textField
        actualViewYPosition = textField.convert(CGPoint.zero, to: self.view).y
        
        if textField == tf_password {
            self.view.makeToast(message: AplicationRuntime.sharedManager.getPswErrorMessage(), duration: 5.0, position: HRToastPositionTop as AnyObject)
        }
    }
    
    // MARK: - private functions
    private func addStyles(){
        
        // Se oculta la barra de Navegación si se esta en editar perfil
        navBar.isHidden = !isRegister
        constraints_navBar.constant = isRegister ? ConseValues.navbarHeight_register : ConseValues.defaultHeight
        constraintBottom = isRegister ? ConseValues.marginBotton_register : ConseValues.marginBotton_edit
        constraints_scrollBottom.constant = constraintBottom
        
        // se ocultan los botones de editar (avatar y contactos)
        cnt_editButtons.isHidden = isRegister
        constraints_editBtns_height.constant = isRegister ? ConseValues.defaultHeight : ConseValues.avatarContactsHeight
        
        // Se agregan los estilos al botón
        setAspectFitToButton(buttons: btn_next, btn_back)
        
        // Se configura los limites de fechas del datePicker
        picker_birthday.maximumDate = Date()
        picker_birthday.date = picker_birthday.minimumDate!
        
        /// set de botton image
        if isRegister { btn_next.setImageButton(normal: ImageName.next_1, hover: ImageName.nextHover_1) }
        else { btn_next.setImageButton(normal: ImageName.upateProfile, hover: ImageName.upateProfileHover) }
        
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
        tf_telephone.underline(margin: underlineWidth)
        tf_password.underline(margin: underlineWidth)
        tf_confirmPassword.underline(margin: underlineWidth)
        
        // Config TextField
        tf_name.tag = 0
        tf_name.delegate = self
        
        tf_lastname.tag = 1
        tf_lastname.delegate = self
        
        tf_telephone.tag = 2
        tf_telephone.delegate = self
        
        tf_email.tag = 3
        tf_email.delegate = self
        
        tf_password.tag = 4
        tf_password.delegate = self
        
        tf_confirmPassword.tag = 5
        tf_confirmPassword.delegate = self
        
        tf_dni_number.tag = 6
        tf_dni_number.delegate = self
        
        // Set Buttons tags
        btn_birthday.tag = birthdayTag
        btn_gender.tag = genderTag
        btn_dni_type.tag = documentTag
        btn_ethnic_group.tag = ethnicTag
        btn_geo_state.tag = stateTag
        btn_geo_city.tag = cityTag
        btn_condition.tag = conditionTag
        btn_profile.tag = profileTag
        
        // Set styles to terms and conditions copy
        let termsLabel = String(format: Strings.checkbox_AcceptTerms, Strings.terms_Copy)
        let termsRange = (termsLabel as NSString).range(of: Strings.terms_Copy)
        let termsAttributed = NSMutableAttributedString(string: termsLabel)
        let underlineAttribute = [NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue]
        let colorAttribute = [NSAttributedStringKey.foregroundColor: Colors().getColor(from: ConseColors.salmon.rawValue)]
        
        termsAttributed.addAttributes(underlineAttribute, range: termsRange)
        termsAttributed.addAttributes(colorAttribute, range: termsRange)
        
        lbl_terms.attributedText = termsAttributed
    }
    
    /// Llena la vista, deacuerdo al tag (Register or EditProfile)
    private func fillView() {
        
        enableDisableCity()
        addDoneButtonOnKeyboard()
        
        checkTerms.isHidden = !isRegister
        lbl_title.text = isRegister ? Strings.profileTitle : Strings.profileEdit
        tf_email.isEnabled = isRegister
        tf_password.isHidden = !isRegister
        tf_confirmPassword.isHidden = !isRegister
        
        constraints_register_height.constant = isRegister ? ConseValues.termsHeigth_register : ConseValues.termsHeigth_profile
        constraints_terms_height.constant = isRegister ? ConseValues.checkboxHeight_register : ConseValues.defaultHeight
        constraints_userConse_Height.constant = isRegister ? ConseValues.conseUser_Height : ConseValues.conseUserProfile_Heigth
        
        // Se llenan los campos si el formulario es de editar perfil
        if !isRegister {
            
            img_avatar.image = AplicationRuntime.sharedManager.getAvatarImage()
            
            if user != nil {
                tf_email.text = user.email
                tf_name.text = user.first_name
                tf_lastname.text = user.last_name
            }
            
            // Si hay datos de perfil se precargan
            if profile != nil {
                
                // Set start DatePicker the current usser birthDate
                let currentDateFormatter = DateFormatter()
                currentDateFormatter.dateFormat = DateTimeFormat.sendDateFormat
                let currentDate = currentDateFormatter.date(from: profile.birthdate)
                picker_birthday.date = currentDate!
                
                // Fill birthDate field
                promt_birthday.text = getBirthdateString(inFormat: DateTimeFormat.commonDateFormat, fromDate: profile.birthdate, withFormat: DateTimeFormat.sendDateFormat)
                promt_birthday.textColor = UIColor.black
                
                genderID = profile.gender?.id
                promt_gender.text = profile.gender?.name ?? Strings.texfiled_placeholder
                tf_telephone.text = profile.contact_phone
                isBeneficiaryNCR = profile.isNRCBeneficiary
            
                if isBeneficiaryNCR {
                    documentTypeID = profile.document_type?.id
                    promt_dni_type.text = profile.document_type?.name ?? Strings.texfiled_placeholder
                    tf_dni_number.text = profile.document_number
                    
                    ethniGroupID = profile.ethnic_group?.id
                    promt_ethnic_group.text = profile.ethnic_group?.name ?? Strings.texfiled_placeholder
                    
                    if profile.origin_city != nil && profile.origin_city.state != nil {
                        geoStateID = AplicationRuntime.sharedManager.getStateID(fromValue: profile.origin_city.state)
                        promt_geo_state.text = AplicationRuntime.sharedManager.getStateName(fromValue: profile.origin_city.state)
                    }
                    
                    geoCityID = profile.origin_city?.id
                    promt_geo_city.text = profile.origin_city?.name ?? Strings.texfiled_placeholder
                    
                    conditionID = profile.condition?.id
                    promt_condition.text = profile.condition?.name ?? Strings.texfiled_placeholder
                    
                    roleID = profile.role?.id
                    promt_profile.text = profile.role?.name ?? Strings.texfiled_placeholder
                }
            }
        }
    }
    
    /// Change state of beneficiaryNRC and update form for show or hidden fields
    private func setBeneficiaryState() {
        // Oculta la vista
        cnt_beneficiaryData.isHidden = !isBeneficiaryNCR
        // Actualiza las constraints
        constraints_NRC_Height.constant = hiddenView(view: .NCR_DATA, state: !isBeneficiaryNCR)
        // Actualiza las el estado del check
        check_beneficiary.image = isBeneficiaryNCR ? #imageLiteral(resourceName: "checkboxselec") : #imageLiteral(resourceName: "checkbox")
        
        // Muestra el formulario NRC
        if isBeneficiaryNCR && scroll.contentSize.height <= 510 {
            scroll.contentSize.height += ConseValues.dataNCRHeight
        }
        
        // Oculta el formulario NRC
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
        
        if !isRegister {
            profile = AplicationRuntime.sharedManager.getUserProfile()
            user = AplicationRuntime.sharedManager.getUser()
        }
    }
    
    private func enableDisableCity() {
        btn_geo_city.isEnabled = geoStateID != nil
        selector_geo_city.alpha = btn_geo_city.isEnabled ? 1.0 : 0.3
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
        
        // Add tapGesture for make terms link
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapFunction))
        lbl_terms.isUserInteractionEnabled = true
        lbl_terms.addGestureRecognizer(tap)
    }
    
    //MARK: - Gesture actions
    @objc func tappedBeficiary(gestureRecognizer: UITapGestureRecognizer){
        isBeneficiaryNCR = !isBeneficiaryNCR
        setBeneficiaryState()
    }
    
    @objc func tappedTerms (gestureRecognizer: UITapGestureRecognizer){
        isTermsAccepted = !isTermsAccepted
        check_terms.image = isTermsAccepted ? #imageLiteral(resourceName: "checkboxselec") : #imageLiteral(resourceName: "checkbox")
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
    private func prepareRequest() {
        
        // Se valida que todos los campos esten completos
        guard Validations.isValidData(fromField: tf_name, errorView: lbl_error_name),
            Validations.isValidData(fromField: tf_lastname, errorView: lbl_error_lastName),
            Validations.isValidData(fromField: tf_telephone, errorView: lbl_error_telephone),
            Validations.isValidDate(birthDate: promt_birthday.text, errorView: lbl_error_birthday),
            Validations.isValidData(fromPromt: promt_gender, errorView: lbl_error_gender) else {
                self.showErrorMessage(withMessage: ErrorStrings.requiredData)
                return
        }
        
        // Campos que solo se validan si el usuario se esta registrando
        if isRegister {
            guard Validations.isValidData(fromField: tf_email, errorView: lbl_error_email),
                Validations.isValidData(fromField: tf_password, errorView: lbl_error_pass),
                Validations.isValidData(fromField: tf_confirmPassword, errorView: lbl_error_confirmPass) else {
                    self.showErrorMessage(withMessage: ErrorStrings.requiredData)
                    return
            }
            
            // Se validan los formatos
            guard Validations.isValidEmail(email: tf_email.text!, errorView: lbl_error_email),
                Validations.isValidPass(pass: tf_password.text!, controller: self) else {
                    return
            }
            
            // Se validan las contraseñas
            guard  tf_password.text! == tf_confirmPassword.text else {
                self.showErrorMessage(withMessage: ErrorStrings.passNotMatch)
                return
            }
        }
        
        // Si es beneficiario conse valida que todos los campos esten llenos
        if isBeneficiaryNCR {
            
            guard Validations.isValidData(fromField: tf_dni_number, errorView: lbl_error_dni),
                Validations.isValidData(fromPromt: promt_dni_type, errorView: lbl_error_IDType),
                Validations.isValidData(fromPromt: promt_ethnic_group, errorView: lbl_error_ethnic),
                Validations.isValidData(fromPromt: promt_geo_state, errorView: lbl_error_state),
                Validations.isValidData(fromPromt: promt_geo_city, errorView: lbl_error_town),
                Validations.isValidData(fromPromt: promt_condition, errorView: lbl_error_condition),
                Validations.isValidData(fromPromt: promt_profile, errorView: lbl_error_role)
                else {
                    self.showErrorMessage(withMessage: ErrorStrings.requiredData)
                    return
            }
        }
        
        // Se verifica que accepte los terminos
        if isRegister {
            lbl_error_terms.text = isTermsAccepted ? nullString : ErrorStrings.requiredterms
            guard isTermsAccepted else {
                self.showErrorMessage(withMessage: ErrorStrings.requiredData)
                return
            }
        }
        
        // Crea el modelo para enviar al servidor
        let newUSR = RegisterUserProfileModel()
        newUSR.first_name = tf_name.text
        newUSR.last_name = tf_lastname.text
        newUSR.email = tf_email.text
        newUSR.contact_phone = tf_telephone.text
        newUSR.birthdate = getBirthdateString(inFormat: DateTimeFormat.sendDateFormat, fromDate: promt_birthday.text!, withFormat: DateTimeFormat.commonDateFormat)
        newUSR.isNRCBeneficiary = isBeneficiaryNCR
        newUSR.gender = genderID
        if isRegister { newUSR.password = tf_password.text }
        
        if isBeneficiaryNCR {
            newUSR.document_number = tf_dni_number.text
            newUSR.actual_city = geoStateID
            newUSR.condition = conditionID
            newUSR.document_type = documentTypeID
            newUSR.ethnic_group = ethniGroupID
            newUSR.origin_city = geoCityID
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
        
        if (!isRegister) {
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
                stateModel.isLogin = true
                
                StorageFunctions.saveDataInLocal(user: user)
                StorageFunctions.saveStates(states: stateModel)
                AplicationRuntime.sharedManager.setUserData(user: user)
                
                if self.isRegister {
                    
                    //Se limpian los datos almacenados en el local
                    let storage = StorageConfig.share
                    storage.clearParameterFromKey(key: DicKeys.progress)
                    storage.clearParameterFromKey(key: DicKeys.contactList)
                    storage.clearParameterFromKey(key: DicKeys.activitiesProgress)
                    
                    // Actualiza valores en runtime
                    AplicationRuntime.sharedManager.setProgress(progress: StorageFunctions.getProgress())
                    
                    // Inicía configuración
                    let sb = UIStoryboard(name: StoryboardsId.configAlert, bundle: nil)
                    self.present(sb.instantiateInitialViewController()!, animated: true, completion: nil)
                }
                else {
                    self.mainDelegate?.addToContainer(viewControllerID: .myCourses)
                    self.mainDelegate?.showMessageInMain(withMessage: Strings.message_ok_update)
                }
                
                break
                
            default:
                break
            }
        })
    }
    
    //MARK: - UIPicker DataSource and Delegate
    
    // Set number of columms section for the picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Set number of componets for genderPicker and localityPicker
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
    
    // Set font to the label and set content
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
            geoStateID = stateList[row].id
            enableDisableCity()
            break
            
        case cityTag:
            promt_geo_city.text = cityList[row].name
            geoCityID = cityList[row].id
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
            
        case btn_geo_city:
            cityList = AplicationRuntime.sharedManager.getCityList(forState: promt_geo_state.text!)
            break
            
        default:
            break
        }
        
        picker.tag = sender.tag
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
        prepareRequest()
    }
    
    /// Vuelve a la pantalla anterior
    @IBAction func backAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /// Acciones de loa botones de edición
    @IBAction func editAction(_ sender: UIButton) {
        
        // Instancia del Storyboard de Configuraciones
        let sb = UIStoryboard(name: StoryboardsId.configAlert, bundle: nil)
        
        // Carga vista para cambiar el avatar
        if sender == btn_edtAvatar {
            let nextVC = sb.instantiateViewController(withIdentifier: ViewControllersId.choiceAvatarGender) as! ChoiceAvatarGenderViewController
            
            nextVC.modalPresentationStyle = .overCurrentContext
            nextVC.modalTransitionStyle = .crossDissolve
            nextVC.isEdit = true
            present(nextVC, animated: true, completion: nil)
        }
            
        // Carga vista para cambiar contactos
        else {
            let nextVC = sb.instantiateViewController(withIdentifier: ViewControllersId.configAlert) as! ConfigAlertButtonViewController
            
            nextVC.modalPresentationStyle = .overCurrentContext
            nextVC.modalTransitionStyle = .crossDissolve
            nextVC.isEdit = true
            present(nextVC, animated: true, completion: nil)
        }
    }
}
