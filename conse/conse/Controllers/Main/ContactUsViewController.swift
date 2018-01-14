//
//  ContactUsViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 12/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit
import ObjectMapper

class ContactUsViewController: UIViewController, UITextViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    // MARK: - Outlets
    @IBOutlet weak var btn_cancel: UIButton!
    @IBOutlet weak var btn_confrim: UIButton!
    @IBOutlet weak var btn_send: UIButton!
    
    @IBOutlet weak var cnt_messageType: UIView!
    @IBOutlet weak var cnt_picker: UIView!
    
    @IBOutlet weak var lbl_messageType: UILabel!
    @IBOutlet weak var lbl_message: UILabel!
    @IBOutlet weak var lbl_promtMesaggeType: UILabel!
    @IBOutlet weak var lbl_title: UILabel!
    
    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var scroll: UIScrollView!
    
    @IBOutlet weak var tv_message: UITextView!
    
    // MARK: - Properties
    weak var mainDelegate: MainProtocol?
    
    var messageTypeList: Array<ContactFormType> = []
    var messageTypeID: Int!
    var message: String = nullString
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get picker and mainDelegate form options from runtime
        messageTypeList = AplicationRuntime.sharedManager.getContactFormTypeList()
        mainDelegate = AplicationRuntime.sharedManager.mainDelegate
        
        addStyles()
        fillView()
        
        picker.delegate = self
        picker.dataSource = self
        tv_message.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        
        var contentRect = CGRect.zero
        
        for view in scroll.subviews {
            contentRect = contentRect.union(view.frame)
        }
        
        scroll.contentSize = CGSize(width: self.accessibilityFrame.width, height: contentRect.size.height)
    }
    
    // MARK: - Private Functions
    private func addStyles() {
        
        setAspectFitToButton(buttons: btn_send)
        
        // set underline for view
        cnt_messageType.underline(margin: (ConseValues.margin + ConseValues.innerMargin))
        
        // Add tap gesture to message type View
        let tapSpinner = UITapGestureRecognizer(target: self, action: #selector(self.tappedMessageType))
        cnt_messageType.addGestureRecognizer(tapSpinner)
    }
    
    private func fillView() {
        
        // Set labels text
        lbl_message.text = Strings.copy_contactusMessage
        lbl_messageType.text = Strings.copy_contactusMessageType
        lbl_promtMesaggeType.text = Strings.texfiled_placeholder
        lbl_title.text = Strings.copy_contactusTitle
        
        // Hidden content Picker
        cnt_picker.isHidden = true
        
        //Set placeholder to textView if message is Empty
        if message == nullString {
            tv_message.text = Strings.placeholder_yourMessage
            tv_message.textColor = .lightGray
        }
        else {
            tv_message.text = message
            tv_message.textColor = .black
        }
    }
    
    private func showHiddenPicker() {
        cnt_picker.isHidden = !cnt_picker.isHidden
    }
    
    // MARK: - TextView Delegate
    
    // TextView resing keyboard
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == jumpLine {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    // Placeholder:
    
    // Delete placeholder when start editing
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        //obtiene la posicion del textview
//        actualViewYPosition = textView.convert(CGPoint.zero, to: self.view).y
        
        if textView.text == Strings.placeholder_yourMessage {
            textView.text = nullString
            textView.textColor = .black
        }
        textView.becomeFirstResponder()
    }
    
    // Se placeholder when end editing, and text is empty
    func textViewDidEndEditing(_ textView: UITextView) {
        
//        scroll.contentSize = CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height)
        
        //If text is empty, put Placeholder
        if textView.text == nullString {
            textView.text = Strings.placeholder_yourMessage
            textView.textColor = .lightGray
        }
        
        //If text is diferent to placeholder, set text to message
        if textView.text != Strings.placeholder_yourMessage {
            message = textView.text!
        }
        
        textView.resignFirstResponder()
    }
    
    //MARK: - UIPicker DataSource and Delegate
    
    // Set number of columms section for the picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Set number of componets for genderPicker and localityPicker
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return messageTypeList.count
    }
    
    // Set font to the label and set content
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        //custom label
        let pickerLabel = UILabel()
        pickerLabel.numberOfLines = 0
        pickerLabel.sizeToFit()
        pickerLabel.textColor = UIColor.black
        pickerLabel.textAlignment = NSTextAlignment.center
        pickerLabel.text = messageTypeList[row].name
        
        return pickerLabel
    }
    
    //action for event onchange
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lbl_promtMesaggeType.text = messageTypeList[row].name
        messageTypeID = messageTypeList[row].id
        cnt_picker.isHidden = true
    }
    
    // MARK: - Request
    private func prepareRequest() {
        
        guard messageTypeID != nil, !message.isEmpty else {
            self.showErrorMessage(withMessage: Strings.error_message_requieredData)
            return
        }
        
        let form = ContactForm()
        form.detail = message
        form.message_type = messageTypeID
        form.user = AplicationRuntime.sharedManager.userID
        
        sendRequest(contactForm: form)
    }
    
    private func sendRequest(contactForm: ContactForm) {
        
        let json = Mapper().toJSONString(contactForm, prettyPrint: true)
        let token = NetworkConfig.token + AplicationRuntime.sharedManager.token
        
        var headers: [[String:String]] = []
        headers.append([NetworkConfig.headerName: NetworkConfig.headerAuthorization,
                        NetworkConfig.headerValue: token])
        
        Network.buildRequest(urlApi: NetworkPOST.CONTACT_FORM, json: json, extraHeaders: headers, method: .methodPOST, completion: { (response) in
            
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
                
                _ = Mapper<SimpleResponseModel>().map(JSON: objReceiver as! [String: Any])
                
                self.lbl_promtMesaggeType.text = Strings.texfiled_placeholder
                self.tv_message.text = Strings.placeholder_yourMessage
                self.tv_message.textColor = .lightGray
                
                break
                
            default:
                break
            }
        })
        
    }
    
    // MARK: - Gestures
    @objc func tappedMessageType (gestureRecognizer: UITapGestureRecognizer){
        showHiddenPicker()
    }
    
    
    // MARK: - Actions
    @IBAction func actionButtons(_ sender: UIButton) {
        
        switch sender {
            
        case btn_cancel:
            showHiddenPicker()
            break
            
        case btn_confrim:
            lbl_promtMesaggeType.text = messageTypeList[0].name
            messageTypeID = messageTypeList[0].id
            showHiddenPicker()
            break
            
        default:
            prepareRequest()
            break
        }
    }

}
