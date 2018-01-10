//
//  RecoveryPasswordViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 2/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit
import ObjectMapper

class RecoveryPasswordViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var btn_alert: UIButton!
    @IBOutlet weak var btn_send: UIButton!
    @IBOutlet weak var img_logo: UIImageView!
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var tf_email: UITextField!
    
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
    
    // MARK: - Private functions
    private func addStyles() {
        
        btn_send.imageView?.contentMode = .scaleAspectFit
        btn_alert.imageView?.contentMode = .scaleAspectFit
        tf_email.underline(margin: ConseValues.margin)
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
    
    // MARK: - actions
    @IBAction func send(_ sender: UIButton){
        
        guard Validations.isValidData(fromField: tf_email, controller: self),
        Validations.isValidEmail(email: tf_email.text!, controller: self) else {
            return
        }
        
        let username = RegisterUserProfileModel()
        username.email = tf_email.text
        
        sendRecoveryPost(email: username)
    }
}
