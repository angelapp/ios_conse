//
//  RecoveryPasswordViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 2/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit
import ObjectMapper

class RecoveryPasswordViewController: UIViewController, UITextFieldDelegate, RecoveryProtocol {
    
    // MARK: - Outlets
    @IBOutlet weak var btn_alert: UIButton!
    @IBOutlet weak var btn_send: UIButton!
    @IBOutlet weak var img_logo: UIImageView!
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var tf_email: UITextField!
    
    // MARK: - Properties
    let states = StorageFunctions.getStates()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        //Se agrega observable para desplazar vista cuando se muestra/oculta el teclado
        NotificationCenter.default.removeObserver(Any.self)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
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
    
    // MARK: - Private functions
    private func addStyles() {
        
        btn_send.imageView?.contentMode = .scaleAspectFit
        btn_alert.imageView?.contentMode = .scaleAspectFit
        tf_email.underline(margin: ConseValues.margin, color: .white)
        tf_email.delegate = self
        
        btn_alert.isHidden = !states.wasLoggedAtSomeTime
    }
    
    private func dismissVC() {
        tf_email.text? = nullString
        self.navigationController?.popViewController(animated: true)
    }
    
    private func showMessage(withMessage msn:String, title:String? = nullString) {
        
        let alert = UIAlertController(title: title, message: msn, preferredStyle: .alert)
        let cancel = UIAlertAction(title: Strings.button_accept, style: .cancel) {(_) in
            alert.dismiss(animated: false, completion: nil)
            self.dismissVC()
        }
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: Métodos para el control de eventos del teclado
    //Observer for increment contentSize of the scroll
    @objc func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scroll.contentSize = CGSize(width: self.scroll.bounds.size.width, height: self.scroll.bounds.size.height + keyboardSize.height)
        }
    }
    
    //Obeserver for move frame to origin when keyboard is hiden
    @objc func keyboardWillHide(notification: NSNotification) {
        scroll.contentSize = CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height)
    }
    
    // MARK: - Request function
    /// Se envia correo del usuario para recuperar la contraseña
    func sendRecoveryPost(email: RegisterUserProfileModel) {
        
        //self.showLoader(withMessage: Strings.loader_loading)
        
        let json = Mapper().toJSONString(email, prettyPrint: true)
        let headers:[[String:String]] = []
        
        Network.buildRequest(urlApi: NetworkPOST.PASSWORD_RECOVERY, json: json, extraHeaders: headers, method: .methodPOST, completion: { (response) in
            
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
                
                let resp = objReceiver as! [String: Any]
                self.showMessage(withMessage: resp[JSONKeys.detail] as! String)
                
                break
                
            default:
                break
            }
        })
    }
    
    // MARK: - Methods for panic button
    func showAlertSender(){
        self.showSMSEmergency(recoveryDelegate: self, senderVC: .login)
    }
    /** Usa el protocolo para mostar mensajes */
    func showMessage(withMessage msn: String) {
        self.showErrorMessage(withMessage: msn)
    }
    
    func openSettingsPopup(title: String, message: String, settings: String) {
        self.showSettingsPopup(title: title, message: message, settings: settings)
    }
    
    // MARK: - actions
    @IBAction func send(_ sender: UIButton){
        
        switch sender {
            
        case btn_send:
            guard Validations.isValidData(fromField: tf_email, controller: self),
                Validations.isValidEmail(email: tf_email.text!, controller: self) else {
                    return
            }
            
            let username = RegisterUserProfileModel()
            username.email = tf_email.text
            
            sendRecoveryPost(email: username)
            break
            
        default:
            self.showCallEmergency(recoveryDelegate: self, senderVC: .login)
        }
    }
}
