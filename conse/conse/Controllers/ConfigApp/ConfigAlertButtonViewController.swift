//
//  ConfigAlertButtonViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 3/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit
import Contacts
import ContactsUI

class ConfigAlertButtonViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CNContactPickerDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var btn_addContact: UIButton!
    @IBOutlet weak var btn_next: UIButton!
    
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var lbl_boby: UILabel!
    
    @IBOutlet weak var table_contacts: UITableView!
    
    // MARK: - Propierties
    let sections: Int = 1
    let estimatedCellHeight: CGFloat = 48
    
    var contactList: Array<ContactModel> = []
    var position: Int!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        contactList = AplicationRuntime.sharedManager.getTrustedContact()
        
        addStyles()
        fillView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - private functions
    private func addStyles() {
        
        setBackTitle(forViewController: self, title: blankSpace)
        setAspectFitToButton(buttons: btn_addContact, btn_next)
    }
    
    private func fillView() {
        
        lbl_title.text = Strings.title_AlertConfig
        lbl_boby.text = Strings.body_AlertConfig
        
        if contactList.count > 0 {
            lbl_boby.isHidden = true
        }
        
        if contactList.count >= 3 {
            btn_addContact.isHidden = true
        }
        
        btn_next.isHidden = (contactList.count < 1) ? true : false
        table_contacts.isHidden = !lbl_boby.isHidden
    }
    
    private func updateContactList(name: String, phone: String){
        
        let newContact = ContactModel()
        newContact.fullName = name
        newContact.number = phone
        
        // Edit contact in (x) position
        if position != nil {
            contactList[position!] = newContact
        }
        // Add contact to list
        else {
            if contactList.count < 3 {
                contactList.append(newContact)
            }
        }
        
        table_contacts.reloadData()
        fillView()
    }
    
    private func openContactConfig() {
        
        let entityType = CNEntityType.contacts
        let authStatus = CNContactStore.authorizationStatus(for: entityType)
        
        if authStatus == CNAuthorizationStatus.notDetermined {
            
            let contactStore = CNContactStore.init()
            contactStore.requestAccess(for: entityType, completionHandler: { (success, nil) in
                
                if success {
                    self.openContact()
                }
                else {
                    
                }
            })
        }
        else if authStatus == CNAuthorizationStatus.authorized {
            self.openContact()
        }
    }
    
    private func openContact() {
        let contactPicker = CNContactPickerViewController.init()
        contactPicker.delegate = self
        self.present(contactPicker, animated: true, completion: nil)
    }
    
    //MARK: - TableView delegate and datasource
    
    // Número de secciones para las familias
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections
    }
    
    // Número de filas deacuerdo a la cantidad de familias
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
    
    // Se agrega la propiedad para ajustar el tamaño de la celda al contenido
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return estimatedCellHeight
    }
    
    // Pintado de la tabla
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellsId.contact) as! ContactsTableViewCell
        let selected = UITapGestureRecognizer(target: self, action: #selector(self.selected(gestureRecognizer:)))
        
        cell.lbl_contact_name.text = contactList[indexPath.row].fullName
        cell.lbl_contact_number.text = contactList[indexPath.row].number
        cell.btn_edit_contact.imageView?.contentMode = .scaleAspectFit
        
        cell.tag = indexPath.row
        cell.btn_edit_contact.addGestureRecognizer(selected)
        
        return cell
    }
    
    //Método para ejecutar acción al seleccionar una fila
    @objc func selected(gestureRecognizer: UITapGestureRecognizer){
    
        let btnTapped = gestureRecognizer.view!
        position = btnTapped.tag
        
        print(position)
        openContactConfig()
    }
    
    // MARK: - Contact Picker Delegate
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        picker.dismiss(animated: true) {}
    }
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        
        let fullName =  String(format: Strings.fullname_format, contact.givenName, contact.familyName)
        
        var phoneNo = Strings.error_message_notAvailable
        if !contact.phoneNumbers.isEmpty {
            let phoneString = ((((contact.phoneNumbers[0] as AnyObject).value(forKey: "labelValuePair") as AnyObject).value(forKey: "value") as AnyObject).value(forKey: "stringValue"))
            
            phoneNo = phoneString as! String
        }
        
        updateContactList(name: fullName, phone: phoneNo)
    }
    

    // MARK: - actions
    @IBAction func actionButton(_ sender: UIButton) {
        
        switch sender {
            
        case btn_addContact:
            position = nil
            openContactConfig()
            break
            
        default:
            let list = ContactListModel()
            list.contacList = contactList
            
            StorageFunctions.saveContactList(list: list)
            performSegue(withIdentifier: segueID.savedContacs, sender: self)
            break
        }
    }
    
}
