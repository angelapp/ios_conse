//
//  StorageModels.swift
//  conse
//
//  Created by Felipe Zamudio on 10/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import Foundation

/// Modelo de datos para guardar la data de un *Usuario*
class UserPreferences: NSObject{
    
    var jsonUserData: String!
    
    /** Resibe los datos del usuario como un texto JSON para almacenarlos en local*/
    convenience init(user: String!){
        self.init()
        self.jsonUserData = user
    }
    
    ///Codifica los datos del modelo y lo asocia a una clave
    /// - Parameter aCoder: Interfaz para transferir objetos y otros valores entre la memoria y algún otro formato.
    func encodeData(aCoder: NSCoder){
        aCoder.encode(self.jsonUserData as String, forKey: DicKeys.userJSON)
    }
    
    /// Crea un diccionario con los datos del modelo
    /// - Returns: EL diccionario de datos del modelo
    func dictionary() -> [String:Any] {
        var myDic = [String:Any]()
        
        myDic[DicKeys.userJSON] = self.jsonUserData
        
        return myDic
    }
    
    /// Crea un modelo de datos a aprtir de un diccionario de datos
    /// - Parameter dic: Diccionario de datos
    /// - Returns: Modelo de datos
    class func initUser(fromDic dic: [String: Any]) -> String {
        let user =  dic[DicKeys.userJSON] as! String
        return user
    }
}

/// Modelo de datos para tener en local si ya se ha iniciado sesion
class StatesPreferences: NSObject {
    
    var wasLoggedAtSomeTime: Bool!
    
    /// Inicializa el modelo para almacenar en local apartir del modelo de datos
    /// - Parameter states: estados
    
    convenience init(states: StatesModel){
        self.init()
        self.wasLoggedAtSomeTime = states.wasLoggedAtSomeTime
    }
    
    ///Codifica los datos del modelo y lo asocia a una clave
    /// - Parameter aCoder: Interfaz para transferir objetos y otros valores entre la memoria y algún otro formato.
    func encodeData(aCoder: NSCoder){
        aCoder.encode(self.wasLoggedAtSomeTime as Bool, forKey: DicKeys.wasLoggedAtSomeTime)
    }
    
    /// Crea un diccionario con los datos del modelo
    /// - Returns: EL diccionario de datos del modelo
    func dictionary() -> [String:Any] {
        var myDic = [String:Any]()
        
        myDic[DicKeys.wasLoggedAtSomeTime] = self.wasLoggedAtSomeTime
        
        return myDic
    }
    
    /// Crea un modelo de datos a aprtir de un diccionario de datos
    /// - Parameter dic: Diccionario de datos
    /// - Returns: Modelo de datos
    class func initState(fromDic dic: [String: Any]) -> StatesModel {
        let state = StatesModel()
        
        state.wasLoggedAtSomeTime = dic[DicKeys.wasLoggedAtSomeTime] as! Bool
        
        return state
    }
}

/// Modelo de datos para tener en local los contactos de confianza
class ContactPreferences: NSObject {
    
    var jsonContact: String!
    
    /// Inicializa el modelo para almacenar en local apartir del modelo de datos
    /// - Parameter states: estados
    
    convenience init(jsonContacts: String) {
        self.init()
        self.jsonContact = jsonContacts
    }
    
    ///Codifica los datos del modelo y lo asocia a una clave
    /// - Parameter aCoder: Interfaz para transferir objetos y otros valores entre la memoria y algún otro formato.
    func encodeData(aCoder: NSCoder){
        aCoder.encode(self.jsonContact as String, forKey: DicKeys.contactList)
    }
    
    /// Crea un diccionario con los datos del modelo
    /// - Returns: EL diccionario de datos del modelo
    func dictionary() -> [String:Any] {
        var myDic = [String:Any]()
        
        myDic[DicKeys.contactList] = self.jsonContact
        
        return myDic
    }
    
    /// Crea un modelo de datos a aprtir de un diccionario de datos
    /// - Parameter dic: Diccionario de datos
    /// - Returns: Modelo de datos
    class func initContactList(fromDic dic: [String: Any]) -> String {
        let json = dic[DicKeys.contactList] as! String
        return json
    }
}

/** Modelo de datos para tener en local los indices del avance de los cursos */
class ProgressPreferences: NSObject {
    
    var vbg_index: Int!
    var plc_index: Int!
    
    /// Inicializa el modelo para almacenar en local apartir del modelo de datos
    /// - Parameter indices: estados
    convenience init(indices: CoursesProgress){
        self.init()
        self.vbg_index = indices.VBG_INDEX
        self.plc_index = indices.PLC_INDEX
    }
    
    ///Codifica los datos del modelo y lo asocia a una clave
    /// - Parameter aCoder: Interfaz para transferir objetos y otros valores entre la memoria y algún otro formato.
    func encodeData(aCoder: NSCoder){
        aCoder.encode(self.vbg_index as Int, forKey: DicKeys.vbgProgess)
        aCoder.encode(self.plc_index as Int, forKey: DicKeys.plcProgess)
    }
    
    /// Crea un diccionario con los datos del modelo
    /// - Returns: EL diccionario de datos del modelo
    func dictionary() -> [String:Any] {
        var myDic = [String:Any]()
        
        myDic[DicKeys.vbgProgess] = self.vbg_index
        myDic[DicKeys.plcProgess] = self.plc_index
        
        return myDic
    }
    
    /// Crea un modelo de datos a aprtir de un diccionario de datos
    /// - Parameter dic: Diccionario de datos
    /// - Returns: Modelo de datos
    class func initProgress(fromDic dic: [String: Any]) -> CoursesProgress {
        let progress = CoursesProgress()
        
        progress.VBG_INDEX = dic[DicKeys.vbgProgess] as? Int ?? 0
        progress.PLC_INDEX = dic[DicKeys.plcProgess] as? Int ?? 0
        
        return progress
    }
}
