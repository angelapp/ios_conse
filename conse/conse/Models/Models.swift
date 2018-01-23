//
//  Models.swift
//  conse
//
//  Created by Felipe Zamudio on 3/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import Foundation
import ObjectMapper

class ContactModel: Mappable {
    var fullName: String!
    var number: String!
    
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        fullName <- map[JSONKeys.full_name]
        number <- map[JSONKeys.number]
    }
}

class ContactListModel: Mappable {
    
    var contacList: Array<ContactModel>!
    
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        contacList <- map[JSONKeys.contact_emergency_List]
    }
}

class MyAvatarPieces {
    
    var skinID: Int!
    var hairID: Int!
    var eyesID: Int!
    var mouthID: Int!
    var accID: Int!
    var genderID: Int!
    
    init() {
    }
}

class UserModel {
    var jsonProfile: String!
    var username: String!
    var token: String!
    var id: Int!
}

class StatesModel {
    var wasLoggedAtSomeTime: Bool!
}

class FormatsBankItem {
    
    var name: String!
    var file: String!
    var ext: String!
    
    init(name: String, file: String, ext: String) {
        self.file = file
        self.name = name
        self.ext = ext
    }
}

class MyCommunityItem {
    
    var title: String!
    var objective: String!
    var note: String!
    var downloadCopy: String!
    var file: String!
    var ext: String!
    
    init(title: String, objective: String, note: String, downloadCopy: String, file: String, ext: String) {
        self.title = title
        self.objective = objective
        self.note = note
        self.downloadCopy = downloadCopy
        self.file = file
        self.ext = ext
    }
}

/** Modelo para mantener el indice de la pág actual de los cursos */
class CoursesProgress {
    
    var VBG_INDEX: Int! // Indice de pág para el curso Violencia Basada en Genero
    var PLC_INDEX: Int! // Indice de pág para el curso Protección Lideres Comunitarios
    
    init() {
    }
}
