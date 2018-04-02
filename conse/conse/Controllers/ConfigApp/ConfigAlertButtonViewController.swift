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
    @IBOutlet weak var btn_dismiss: UIButton!
    @IBOutlet weak var btn_next: UIButton!
    
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var lbl_boby: UILabel!
    
    @IBOutlet weak var nextButtonTop: NSLayoutConstraint!
    
    @IBOutlet weak var table_contacts: UITableView!
    
    // MARK: - Propierties
    let sections: Int = 1
    let estimatedCellHeight: CGFloat = 48
    
    var contactList: Array<ContactModel> = []
    var position: Int!
    var isEdit = false

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
        
        setAspectFitToButton(buttons: btn_addContact, btn_next)
        btn_dismiss.isHidden = !isEdit
        
        //Set Default nextbutton position
        nextButtonTop.constant = (30 + btn_addContact.bounds.height)
    }
    
    private func fillView() {
        
        lbl_boby.text = ConfigStrings.alertConfig
        
        // Se determina el título y el boton siguiente de acuardo a si se esta editando o creando
        if isEdit {
            lbl_title.text = ConfigStrings.title_EditAlertConfig
            btn_next.setImageButton(normal: ImageName.endUpdate, hover: ImageName.endUpdateHover)
        }
        else {
            lbl_title.text = ConfigStrings.title_AlertConfig
            btn_next.setImageButton(normal: ImageName.next_1, hover: ImageName.nextHover_1)
        }
        
        // Se oculta el mensaje cuando hay datos
        lbl_boby.isHidden = contactList.count > 0
        table_contacts.isHidden = !lbl_boby.isHidden
        
        // Hide add contact button and move next button to nuew position
        if contactList.count >= 3 {
            btn_addContact.isHidden = true
            nextButtonTop.constant = 10
        }
        
        btn_next.isHidden = (contactList.count < 1)
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
        
        // create Gesture
        let selected = UITapGestureRecognizer(target: self, action: #selector(self.selected(gestureRecognizer:)))
        let deleted = UITapGestureRecognizer(target: self, action: #selector(self.deleted(gestureRecognizer:)))
        
        // fill data fields
        cell.lbl_contact_name.text = contactList[indexPath.row].fullName
        cell.lbl_contact_number.text = contactList[indexPath.row].number
        // add style to button
        cell.btn_edit_contact.imageView?.contentMode = .scaleAspectFit
        cell.btn_delete_contact.imageView?.contentMode = .scaleAspectFit
        
        // add actions to buttons
        cell.btn_edit_contact.tag = indexPath.row
        cell.btn_edit_contact.addGestureRecognizer(selected)
        
        cell.btn_delete_contact.tag = indexPath.row
        cell.btn_delete_contact.addGestureRecognizer(deleted)
        
        return cell
    }
    
    //Método para ejecutar acción al seleccionar una fila
    @objc func selected(gestureRecognizer: UITapGestureRecognizer){
    
        let btnTapped = gestureRecognizer.view!
        position = btnTapped.tag
        
        print(position)
        openContactConfig()
    }
    
    @objc func deleted(gestureRecognizer: UITapGestureRecognizer){
        
        let btnTapped = gestureRecognizer.view!
        position = btnTapped.tag
        
        print(position)
        contactList.remove(at: position)
        table_contacts.reloadData()
        fillView()
    }
    
    // MARK: - Contact Picker Delegate
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        picker.dismiss(animated: true) {}
    }
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        
        let fullName =  String(format: Strings.fullname_format, contact.givenName, contact.familyName)
        
        var phoneNo = ErrorStrings.withoutNumber
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
            
        case btn_dismiss:
            self.dismiss(animated: true, completion: nil)
            break
            
        default:
            
            let list = ContactListModel()
            list.contacList = contactList
            
            StorageFunctions.saveContactList(list: list)
            AplicationRuntime.sharedManager.setTrustedConctacs(list: contactList)
            
            performSegue(withIdentifier: segueID.savedContacs, sender: self)
            break
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let nextVC = segue.destination as? TestAlertViewController {
            nextVC.isEdit = isEdit
        }
    }
}
