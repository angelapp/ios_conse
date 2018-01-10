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
    
    var username: String!
    var token: String!
    var id: Int!
    
    /**
     Inicializa el modelo para almacenar en local apartir del modelo de datos
     
     - Parameter user: Modelo de datos *Usuario*
     */
    convenience init(user: UserModel!){
        self.init()
        self.username = user.username
        self.token = user.token
        self.id = user.id
    }
    
    ///Codifica los datos del modelo y lo asocia a una clave
    /// - Parameter aCoder: Interfaz para transferir objetos y otros valores entre la memoria y algún otro formato.
    func encodeData(aCoder: NSCoder){
        aCoder.encode(self.username as String, forKey: DicKeys.username)
        aCoder.encode(self.token as String, forKey: DicKeys.token)
        aCoder.encode(self.id as Int, forKey: DicKeys.id)
    }
    
    /// Crea un diccionario con los datos del modelo
    /// - Returns: EL diccionario de datos del modelo
    func dictionary() -> [String:Any] {
        var myDic = [String:Any]()
        
        myDic[DicKeys.username] = self.username
        myDic[DicKeys.token] = self.token
        myDic[DicKeys.id] = self.id
        
        return myDic
    }
    
    /// Crea un modelo de datos a aprtir de un diccionario de datos
    /// - Parameter dic: Diccionario de datos
    /// - Returns: Modelo de datos
    class func initUser(fromDic dic: [String: Any]) -> UserModel {
        let user = UserModel()
        
        user.username = dic[DicKeys.username] as! String
        user.token = dic[DicKeys.token] as! String
        user.id = dic[DicKeys.id] as? Int
        
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
