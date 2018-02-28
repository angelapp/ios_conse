//
//  LoginViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 2/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit
import ObjectMapper

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var btn_alert: UIButton!
    @IBOutlet weak var btn_back: UIButton!
    @IBOutlet weak var btn_loggin: UIButton!
    @IBOutlet weak var btn_recoveryPassword: UIButton!
    
    @IBOutlet weak var img_logo: UIImageView!
    
    @IBOutlet weak var lbl_error_email: UILabel!
    @IBOutlet weak var lbl_error_password: UILabel!
    
    @IBOutlet weak var tf_email: UITextField!
    @IBOutlet weak var tf_password: UITextField!
    
    @IBOutlet weak var scroll: UIScrollView!
    
    // MARK: - Properties
    var actualViewYPosition: CGFloat = 0.0
    var user = AplicationRuntime.sharedManager.getUser()
    var states = StorageFunctions.getStates()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        addStyles()
        
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
    
    // MARK: - private functions
    private func addStyles() {
        setAspectFitToButton(buttons: btn_alert, btn_loggin)
        tf_email.underline(margin: ConseValues.margin, padding: ConseValues.innerMargin, color: .white)
        tf_password.underline(margin: ConseValues.margin, padding: ConseValues.innerMargin, color: .white)
        
        tf_email.delegate = self
        tf_password.delegate = self
        
        btn_alert.isHidden = !states.wasLoggedAtSomeTime
    }
    
    private func startNextVC(name: String){
        let sb = UIStoryboard(name: name, bundle: nil)
        self.present(sb.instantiateInitialViewController()!, animated: true, completion: nil)
    }
    
    //MARK: - Métodos para el control de eventos del teclado
    //Observer for increment contentSize of the scroll
    @objc func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scroll.contentSize = CGSize(width: self.scroll.bounds.size.width, height: self.scroll.bounds.size.height + keyboardSize.height)
            
            if actualViewYPosition >= keyboardSize.height{
                scroll.setContentOffset(CGPoint(x: 0, y: actualViewYPosition - keyboardSize.height), animated: true)
            }
        }
    }
    
    //Obeserver for move frame to origin when keyboard is hiden
     @objc func keyboardWillHide(notification: NSNotification) {
        scroll.contentSize = CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height)
    }
    
    //Get the actual position of the TextView
    func textFieldDidBeginEditing(_ textField: UITextField) {
        actualViewYPosition = textField.convert(CGPoint.zero, to: self.view).y
    }
    
    // MARK: - Request function
    /// Se envia los datos del usuario para login
    func sendLogginPost(userToAuth: RegisterUserProfileModel) {
        
        let loader = LoadingOverlay(text: Strings.loader_login)
        let json = Mapper().toJSONString(userToAuth, prettyPrint: true)
        let headers:[[String:String]] = []
        
        loader.showOverlay(view: self.view)
        self.view.isUserInteractionEnabled = false
        
        Network.buildRequest(urlApi: NetworkPOST.USER_LOGGIN, json: json, extraHeaders: headers, method: .methodPOST, completion: { (response) in
            
            loader.hideOverlayView()
            self.view.isUserInteractionEnabled = true
            
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
                stateModel.isLogin = true
                stateModel.wasLoggedAtSomeTime = true
                
                StorageFunctions.saveDataInLocal(user: user)
                StorageFunctions.saveStates(states: stateModel)
                AplicationRuntime.sharedManager.setUserData(user: user)
                
                self.states.wasLoggedAtSomeTime ? self.startNextVC(name: StoryboardsId.main) : self.startNextVC(name: StoryboardsId.configAlert)
                
                break
                
            default:
                break
            }
        })
    }
    
    // MARK: - Actions
    @IBAction func send (_ sender: UIButton){
        
        switch sender {
            
        case btn_loggin:
            
            guard Validations.isValidData(fromField: tf_email, errorView: lbl_error_email),
                Validations.isValidData(fromField: tf_password, errorView: lbl_error_password),
                Validations.isValidEmail(email: tf_email.text!, errorView: lbl_error_email)
                else { return }
            
            if user != nil && tf_email.text?.lowercased() == user?.email.lowercased() {
                showErrorMessage(withMessage: Strings.error_message_notUserValidCredentials)
                return
            }
            
            let userRequest = RegisterUserProfileModel()
            userRequest.email = tf_email.text
            userRequest.password = tf_password.text
            
            sendLogginPost(userToAuth: userRequest)
            break
            
        case btn_alert:
            self.showEmergencyPopup(senderVC: .login)
            break
            
        default:
            self.dismiss(animated: true, completion: nil)
            break
        }
    }

}
