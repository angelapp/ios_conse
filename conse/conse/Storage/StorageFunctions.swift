//
//  StorageFunctions.swift
//  conse
//
//  Created by Felipe Zamudio on 10/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class StorageFunctions: NSObject {
    
    /** Obtine el *token*, el *id* y el *username* de la respuesta para
     guardarlos en el dispositivo
     
     - Parameter user: Modelo del usuario que contiene todos los datos del mismo
     */
    class func saveDataInLocal(user: RegisterUserResponse!) {
        
        // get data to save
        let dataToSave = UserModel()
        dataToSave.id = user.user.id
        dataToSave.token = user.token
        dataToSave.username = user.user.username
        
        // Save data in local
        let storage = StorageConfig.share
        let saveData = UserPreferences(user: dataToSave)
        let strRepresentation = saveData.dictionary()
        if let data = UserPreferences.archive(user: strRepresentation) {
            storage.saveParameterFromKey(key: DicKeys.user, value: data as AnyObject)
        }
    }
    
    /// Guarda los estados de la aplicación
    class func saveStates(states: StatesModel) {
        let storage = StorageConfig.share
        let saveDate = StatesPreferences(states: states)
        let strRepresentation = saveDate.dictionary()
        if let data = StatesPreferences.archive(states: strRepresentation) {
            storage.saveParameterFromKey(key: DicKeys.states, value: data as AnyObject)
        }
    }
    
    /// Guarda la lista de contactos
    class func saveContactList(list: ContactListModel) {
        
        let json = Mapper().toJSONString(list, prettyPrint: true)
        
        let storage = StorageConfig.share
        let saveDate = ContactPreferences(jsonContacts: json!)
        let strRepresentation = saveDate.dictionary()
        if let data = ContactPreferences.archive(list: strRepresentation) {
            storage.saveParameterFromKey(key: DicKeys.contactList, value: data as AnyObject)
        }
    }
    
    /// Get storage states
    class func getStates() -> StatesModel! {
        let storage = StorageConfig.share
        guard let data = storage.getParameterFromKey(key: DicKeys.states) as! Data! else { return nil}
        guard let dic = StatesPreferences.unarchive(data: data) else { return nil}
        let states = StatesPreferences.initState(fromDic: dic)
        return states
    }
    
    /// Get local storage data
    class func getUser() -> UserModel! {
        let storage = StorageConfig.share
        guard let data = storage.getParameterFromKey(key: DicKeys.user) as! Data! else { return nil}
        guard let dic = UserPreferences.unarchive(data: data) else { return nil}
        let user = UserPreferences.initUser(fromDic: dic)
        return user
    }
    
    /// Get local list data
    class func getContactList() -> Array<ContactModel>! {
        let storage = StorageConfig.share
        guard let data = storage.getParameterFromKey(key: DicKeys.contactList) as! Data! else { return nil }
        guard let dic = ContactPreferences.unarchive(data: data) else { return nil }
        let json = ContactPreferences.initContactList(fromDic: dic) as String!
        let contactList = Mapper<ContactListModel>().map(JSON: convertToDictionary(text: json!)!)
        return contactList?.contacList
    }
    
    /// Save image as data
    class func saveAvatarImage(image: UIImage) {
        let imageData: NSData = UIImagePNGRepresentation(image)! as NSData
        UserDefaults.standard.set(imageData, forKey: DicKeys.avatarImg)
    }
    
    /// Load data and return image
    class func loadAvatarImage() -> UIImage! {
        if let data = UserDefaults.standard.object(forKey: DicKeys.avatarImg) as! NSData! {
            return UIImage(data: data as Data)
        }
        else {
            return nil
            
        }
    }
}
