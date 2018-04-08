//
//  StorageFunctions.swift
//  conse
//
//  Created by Felipe Zamudio on 10/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//
//  Clase para administrar el registro y lectura de datos en el dispositivo
//  haciendo uso de una instancia unica StorageConfig.

import Foundation
import UIKit
import ObjectMapper

class StorageFunctions: NSObject {
    
    // MARK: - SAVE METHODS
    
    /** Guarda toda la data del perfil del usuario */
    class func saveDataInLocal(user: RegisterUserResponse!) {
        
        // get data to save
        let jsonUserData = Mapper().toJSONString(user, prettyPrint: true)
        
        // Save data in local
        let storage = StorageConfig.share
        let saveData = UserPreferences(user: jsonUserData)
        let strRepresentation = saveData.dictionary()
        if let data = UserPreferences.archive(user: strRepresentation) {
            storage.saveParameterFromKey(key: DicKeys.user, value: data as AnyObject)
        }
    }
    
    /** Guarda la configuración de la APP */
    class func saveAppConfigInLocal(config: ApplicationConfiguration!) {
        
        // Map App Configuration Model in JSON string
        let jsonConf = Mapper().toJSONString(config, prettyPrint: true)
        
        // Save JSON in local
        let storage = StorageConfig.share
        let saveData = AppConfigPreferences(jsonConfig: jsonConf!)
        let strRepresentation = saveData.dictionary()
        if let data = AppConfigPreferences.archive(conf: strRepresentation) {
            storage.saveParameterFromKey(key: DicKeys.appConfig, value: data as AnyObject)
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
    
    /// Guarda en local, los indices del progreso del curso
    class func saveProgress(progress: CoursesProgress) {
        let storage = StorageConfig.share
        let saveDate = ProgressPreferences(indices: progress)
        let strRepresentation = saveDate.dictionary()
        if let data = ProgressPreferences.archive(progress: strRepresentation) {
            storage.saveParameterFromKey(key: DicKeys.progress, value: data as AnyObject)
        }
    }
    
    /** Guarda los el progreso de actividades de los cursos */
    class func saveActivitiesProgress(courses: CourseListModel!) {
        
        // Map App Configuration Model in JSON string
        let jsonCourse = Mapper().toJSONString(courses, prettyPrint: true)
        
        // Save JSON in local
        let storage = StorageConfig.share
        let saveData = ProgressActivitiesPreferences(jsonCourse: jsonCourse!)
        let strRepresentation = saveData.dictionary()
        if let data = ProgressActivitiesPreferences.archive(course: strRepresentation) {
            storage.saveParameterFromKey(key: DicKeys.activitiesProgress, value: data as AnyObject)
        }
    }
    
    /** Guarda los ID de las caracteristicas del avatar */
    class func saveAvatarInLocal(avatarPieces: MyAvatarPieces) {
        
        // Save JSON in local
        let storage = StorageConfig.share
        let saveData = MyAvatarPreferences(pieces: avatarPieces)
        let strRepresentation = saveData.dictionary()
        if let data = MyAvatarPreferences.archive(avatar: strRepresentation) {
            storage.saveParameterFromKey(key: DicKeys.avaterPieces, value: data as AnyObject)
        }
    }
    
    // MARK: - LOAD METHODS
    
    /// Get local storage data
    class func getAppConfig() -> ApplicationConfiguration! {
        let storage = StorageConfig.share
        guard let data = storage.getParameterFromKey(key: DicKeys.appConfig) as! Data! else { return nil}
        guard let dic = AppConfigPreferences.unarchive(data: data) else { return nil}
        let strConf = AppConfigPreferences.initConfig(fromDic: dic) as String!
        let appConf = Mapper<ApplicationConfiguration>().map(JSON: convertToDictionary(text: strConf!)!)
        return appConf
    }
    
    /// Get storage progress
    class func getProgress() -> CoursesProgress {
        let storage = StorageConfig.share
        guard let data = storage.getParameterFromKey(key: DicKeys.progress) as! Data! else { return CoursesProgress() }
        guard let dic = ProgressPreferences.unarchive(data: data) else { return CoursesProgress() }
        let progress = ProgressPreferences.initProgress(fromDic: dic)
        return progress
    }
    
    /// Get storage states
    class func getStates() -> StatesModel {
        let storage = StorageConfig.share
        guard let data = storage.getParameterFromKey(key: DicKeys.states) as! Data! else { return StatesModel() }
        guard let dic = StatesPreferences.unarchive(data: data) else { return StatesModel()}
        let states = StatesPreferences.initState(fromDic: dic)
        return states
    }
    
    /// Get local storage data
    class func getUser() -> RegisterUserResponse! {
        let storage = StorageConfig.share
        guard let data = storage.getParameterFromKey(key: DicKeys.user) as! Data! else { return nil}
        guard let dic = UserPreferences.unarchive(data: data) else { return nil}
        let userJSON = UserPreferences.initUser(fromDic: dic) as String!
        let user = Mapper<RegisterUserResponse>().map(JSON: convertToDictionary(text: userJSON!)!)
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
    
    /** carga los datos de cursos del, local  */
    class func loadActivitiesProgress() -> Array<Course>! {
        let storage = StorageConfig.share
        guard let data = storage.getParameterFromKey(key: DicKeys.activitiesProgress) as! Data! else { return nil }
        guard let dic = ProgressActivitiesPreferences.unarchive(data: data) else { return nil }
        let json = ProgressActivitiesPreferences.initCourse(fromDic: dic) as String!
        let courseList = Mapper<CourseListModel>().map(JSON: convertToDictionary(text: json!)!)
        return courseList?.courseList
    }
    
    /// Get storage Avatar
    class func getAvatarPieces() -> MyAvatarPieces! {
        let storage = StorageConfig.share
        guard let data = storage.getParameterFromKey(key: DicKeys.avaterPieces) as! Data! else { return nil}
        guard let dic = MyAvatarPreferences.unarchive(data: data) else { return nil}
        let avatar = MyAvatarPreferences.initAvatar(fromDic: dic)
        return avatar
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
