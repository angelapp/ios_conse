//
//  StorageFunctions.swift
//  conse
//
//  Created by Felipe Zamudio on 10/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import Foundation

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
}
