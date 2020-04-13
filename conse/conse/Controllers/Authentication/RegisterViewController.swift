//
//  RegisterViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 2/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit
import ObjectMapper

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Outlets
    
    // Buttons
    @IBOutlet weak var btn_back: UIButton!
    @IBOutlet weak var btn_next: UIButton!
    @IBOutlet weak var btn_edtAvatar: UIButton!
    @IBOutlet weak var btn_edtContacts: UIButton!
    

    // Checkbox
    @IBOutlet weak var check_beneficiary: UIImageView!
    @IBOutlet weak var check_terms: UIImageView!
    
    //@IBOutlet weak var checkNCR: UIView!
    @IBOutlet weak var checkTerms: UIView!
    
    // Conteiners
    @IBOutlet weak var cnt_editButtons: UIView!
    
    // Images
    @IBOutlet weak var img_avatar: UIImageView!
    
    // labels
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var lbl_terms: UILabel!
  
    @IBOutlet weak var lbl_error_email: UILabel!
    @IBOutlet weak var lbl_error_pass: UILabel!
    @IBOutlet weak var lbl_error_confirmPass: UILabel!
    
    @IBOutlet weak var lbl_error_terms: UILabel!
    
    // Scroll
    @IBOutlet weak var scroll: UIScrollView!
    

    
    @IBOutlet weak var navBar: UIView!
    
    @IBOutlet weak var viewUser: UIView!
    
    @IBOutlet weak var viewRegister: UIView!
    
    var vSpinner : UIView?
    
    @IBOutlet weak var editButtons: UIView!
    
    // Textfields
    @IBOutlet weak var tf_email: UITextField!
    @IBOutlet weak var tf_password: UITextField!
    @IBOutlet weak var tf_confirmPassword: UITextField!
    
    
    // Constraits
    @IBOutlet weak var constraints_editBtns_height: NSLayoutConstraint!
    @IBOutlet weak var constraints_navBar: NSLayoutConstraint!
    @IBOutlet weak var constraints_register_height: NSLayoutConstraint!
    @IBOutlet weak var constraints_terms_height: NSLayoutConstraint!
    @IBOutlet weak var constraints_userConse_Height: NSLayoutConstraint!
    
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
    //var profile: ProfileSerializer!
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
        
        let userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)

        var contentInset:UIEdgeInsets = self.scroll.contentInset
        contentInset.bottom = keyboardFrame.size.height
        scroll.contentInset = contentInset
        scroll.contentInset.bottom = scroll.contentInset.bottom + 20
    }
    
    //Obeserver for move frame to origin when keyboard is hiden
    @objc func keyboardWillHide(notification: NSNotification) {
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scroll.contentInset = contentInset
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
//        constraints_navBar.constant = isRegister ? ConseValues.navbarHeight_register : ConseValues.defaultHeight
 //       constraintBottom = isRegister ? ConseValues.marginBotton_register : ConseValues.marginBotton_edit
   //     constraints_scrollBottom.constant = constraintBottom
        
        // se ocultan los botones de editar (avatar y contactos)
        cnt_editButtons.isHidden = isRegister
        constraints_editBtns_height.constant = isRegister ? ConseValues.defaultHeight : ConseValues.avatarContactsHeight
        
        // Se agregan los estilos al botón
        setAspectFitToButton(buttons: btn_next, btn_back)
        
        
        
        /// set de botton image
        if isRegister { btn_next.setImageButton(normal: ImageName.next_1, hover: ImageName.nextHover_1) }
        else { btn_next.setImageButton(normal: ImageName.upateProfile, hover: ImageName.upateProfileHover) }
        
        // width of under line
        let underlineWidth = (ConseValues.margin + ConseValues.innerMargin)
        
       
        
        tf_email.underline(margin: underlineWidth)
        tf_password.underline(margin: underlineWidth)
        tf_confirmPassword.underline(margin: underlineWidth)
      
        
        tf_email.tag = 3
        tf_email.delegate = self
        
        tf_password.tag = 4
        tf_password.delegate = self
        
        tf_confirmPassword.tag = 5
        tf_confirmPassword.delegate = self
        
       
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
            }
            
            
        }else{
            editButtons.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
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
            //profile = AplicationRuntime.sharedManager.getUserProfile()
            user = AplicationRuntime.sharedManager.getUser()
        }
    }
   
   
    private func addGestureToViews() {
        // Gesture for checkbox
        
        let tapTerms = UITapGestureRecognizer(target: self, action: #selector(self.tappedTerms))
        checkTerms.addGestureRecognizer(tapTerms)
        
        // Add tapGesture for make terms link
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapFunction))
        lbl_terms.isUserInteractionEnabled = true
        lbl_terms.addGestureRecognizer(tap)
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
        
       
        // Campos que solo se validan si el usuario se esta registrando
        if isRegister {

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
        newUSR.email = tf_email.text

        if isRegister { newUSR.password = tf_password.text }
        
        
        sendRequest(formModel: newUSR)
    }
    
    /// Se envia los datos del usuario para registarlo
    func sendRequest(formModel: RegisterUserProfileModel){
        
        let loader = LoadingOverlay(text: LoaderStrings.registering)
        
        let json = Mapper().toJSONString(formModel, prettyPrint: true)
        var headers:[[String:String]] = []
        
        var apiURL = NetworkPOST.CREATE_USER
        var method: NetworkRestMethods = .methodPOST
        
       
        
        Network.buildRequest(urlApi: apiURL, json: json, extraHeaders: headers, method: method, completion: { (response) in
            
            loader.hideOverlayView()
            
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
