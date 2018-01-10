//
//  Models.swift
//  conse
//
//  Created by Felipe Zamudio on 3/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import Foundation

class ContactModel {
    var fullName: String!
    var number: String!
    
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
