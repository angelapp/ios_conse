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
    var username: String!
    var token: String!
    var id: Int!
}

class StatesModel {
    var wasLoggedAtSomeTime: Bool!
}
