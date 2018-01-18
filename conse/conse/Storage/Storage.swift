//
//  Storage.swift
//  conse
//
//  Created by Felipe Zamudio on 10/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import Foundation

class StorageConfig: NSObject {
    
    var dataStorage: UserDefaults!
    
    static let share = StorageConfig()
    
    private override init() {
        super.init()
        dataStorage = UserDefaults.standard
    }
    
    /// Almacena en el dispositivo la data del usuario, asociandolo a una clave
    /// - Parameter key: Clave con la que será asociado el objeto en el dispositivo
    /// - Parameter value: Objeto que será almacenado
    func saveParameterFromKey (key: String, value:AnyObject){
        dataStorage.set(value, forKey: key)
        dataStorage.synchronize()
    }
    
    /// Obtiene los datos datos almacenados deacuerdo a una clave de entrada
    /// - Parameter key: Clave de la data almacenada
    /// - Returns: un Objeto con la data obtenida
    func getParameterFromKey(key: String) -> AnyObject! {
        let result = dataStorage.object(forKey: key)
        return result as AnyObject!
    }
    
    /// Elimina toda la data asociada a una clave
    /// - Parameter key: Clave de la data almacenada
    func clearParameterFromKey(key: String) {
        dataStorage.removeObject(forKey: key)
        dataStorage.synchronize()
    }
}

// Extensión de UserPreferences para agregar los métodos Archivar o Desarchivar la data de un usuario
extension UserPreferences {
    
    /// Archiva la data del usuario a partir de un diccionario de datos
    class func archive(user: [String:Any]) -> Data! {
        return NSKeyedArchiver.archivedData(withRootObject: user)
    }
    
    /// Desarchiva la data de un usuario
    /// - Returns: diccionario con la data del usuario
    class func unarchive (data: Data) -> [String:Any]! {
        guard let user = NSKeyedUnarchiver.unarchiveObject(with: data) as! [String:Any]! else { return nil }
        return user
    }
}

// Extensión de StatesPreferences para agregar los metodos de Archivar o Desarchivar los estados de la App
extension StatesPreferences {
    
    /// Archiva los estados de la aplicación
    class func archive(states: [String:Any]) -> Data! {
        return NSKeyedArchiver.archivedData(withRootObject: states)
    }
    
    /// Desarchiva los estados
    /// - Returns: diccionario con los estados
    class func unarchive (data: Data) -> [String:Any]! {
        guard let states = NSKeyedUnarchiver.unarchiveObject(with: data) as! [String:Any]! else {return nil}
        return states
    }
}

// Extensión de ContactPreferences para agregar los metodos de Archivar o Desarchivar
extension ContactPreferences {
    
    /// Archiva la lista de contactos
    class func archive(list: [String:Any]) -> Data! {
        return NSKeyedArchiver.archivedData(withRootObject: list)
    }
    
    /// Desarchiva la lista
    /// - Returns: diccionario con lista de contactos
    class func unarchive (data: Data) -> [String:Any]! {
        guard let list = NSKeyedUnarchiver.unarchiveObject(with: data) as! [String:Any]! else {return nil}
        return list
    }
}

// Extensión de ProgressPreferences para agregar los metodos de Archivar o Desarchivar
extension ProgressPreferences {
    
    /// Archiva los indices de os cursos
    class func archive(progress: [String:Any]) -> Data! {
        return NSKeyedArchiver.archivedData(withRootObject: progress)
    }
    
    /// Desarchiva la lista
    /// - Returns: diccionario con los indices de los cursos
    class func unarchive (data: Data) -> [String:Any]! {
        guard let progress = NSKeyedUnarchiver.unarchiveObject(with: data) as! [String:Any]! else {return nil}
        return progress
    }
}
