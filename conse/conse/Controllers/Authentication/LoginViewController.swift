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
    @IBOutlet weak var btn_loggin: UIButton!
    @IBOutlet weak var btn_recoveryPassword: UIButton!
    
    @IBOutlet weak var img_logo: UIImageView!
    
    @IBOutlet weak var tf_email: UITextField!
    @IBOutlet weak var tf_password: UITextField!
    
    @IBOutlet weak var scroll: UIScrollView!
    
    // MARK: - Properties
    var actualViewYPosition: CGFloat = 0.0

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        addStyles()
        setBackTitle(forViewController: self, title: " ")
        
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
        btn_alert.imageView?.contentMode = .scaleAspectFit
        btn_loggin.imageView?.contentMode = .scaleAspectFit
        tf_email.underline(margin: ConseValues.margin, color: .white)
        tf_password.underline(margin: ConseValues.margin, color: .white)
        
        tf_email.delegate = self
        tf_password.delegate = self
    }
    
    //MARK: Métodos para el control de eventos del teclado
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
    /// Se envia los datos del usuario para loggin
    func sendLogginPost(userToAuth: RegisterUserProfileModel) {
        
        //self.showLoader(withMessage: Strings.loader_loading)
        
        let json = Mapper().toJSONString(userToAuth, prettyPrint: true)
        let headers:[[String:String]] = []
        
        Network.buildRequest(urlApi: NetworkPOST.USER_LOGGIN, json: json, extraHeaders: headers, method: .methodPOST, completion: { (response) in
            
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
                
                let sb = UIStoryboard(name: StoryboardsId.main, bundle: nil)
                self.present(sb.instantiateInitialViewController()!, animated: true, completion: nil)
                
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
            
            guard Validations.isValidData(fromField: tf_email, controller: self),
                Validations.isValidData(fromField: tf_password, controller: self),
                Validations.isValidEmail(email: tf_email.text!, controller: self) else { return }
            
            let user = RegisterUserProfileModel()
            user.email = tf_email.text
            user.password = tf_password.text
            
            sendLogginPost(userToAuth: user)
            break
            
        default:
            break
        }
    }

}
