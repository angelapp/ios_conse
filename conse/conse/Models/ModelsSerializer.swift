//
//  ModelsSerializer.swift
//  conse
//
//  Created by Felipe Zamudio on 4/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import Foundation
import ObjectMapper
import SwiftyJSON

/// Corporate Model
class CorporatePhoneBook: Mappable {
    
    var id: Int!
    var organization_type: Int!
    var city: Int!
    var name: String!
    var description: String!
    var phone: String!
    var mobile_phone: String!
    var address: String!
    var url: String!
    var twitter: String!
    var email: String!
    var schedule: String!
    var latitude: Float!
    var longitude: Float!
    var icon: String!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        organization_type <- map[JSONKeys.organization_type]
        city <- map[JSONKeys.city]
        name <- map[JSONKeys.name]
        description <- map[JSONKeys.description]
        phone <- map[JSONKeys.phone]
        mobile_phone <- map[JSONKeys.mobile_phone]
        address <- map[JSONKeys.address]
        url <- map[JSONKeys.url]
        twitter <- map[JSONKeys.twitter]
        email <- map[JSONKeys.email]
        schedule <- map[JSONKeys.schedule]
        latitude <- map[JSONKeys.latitude]
        longitude <- map[JSONKeys.longitude]
        icon <- map[JSONKeys.icon]
    }
}

/// Organization Type Model
class OrganizationType: Mappable {
    
    var id: Int!
    var name: String!
    var description: String!
    var icon: String!
    var organization_by_type: Array<CorporatePhoneBook>!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        name <- map[JSONKeys.name]
        description <- map[JSONKeys.description]
        icon <- map[JSONKeys.icon]
        organization_by_type <- map[JSONKeys.organization_by_type]
    }
}

// MARK: - User authenticated models

/// User Model for register
class RegisterUserProfileModel : Mappable {

    var first_name: String!
    var last_name: String!
    var email: String!
    var password: String!
    
    var birthdate: String!
    var document_number: String!
    var contact_phone: String!
    var address: String!
    var role: Int!
    var gender: Int!
    var ethnic_group: Int!
    var condition: Int!
    var document_type: Int!
    var origin_city: Int!
    var actual_city: Int!
    
    var isNRCBeneficiary: Bool!
    
    var latitude: Float!
    var longitude: Float!

    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        first_name <- map[JSONKeys.first_name]
        last_name <- map[JSONKeys.last_name]
        email <- map[JSONKeys.email]
        password <- map[JSONKeys.password]
        
        birthdate <- map[JSONKeys.birthdate]
        document_number <- map[JSONKeys.document_number]
        contact_phone <- map[JSONKeys.contact_phone]
        address <- map[JSONKeys.address]
        role <- map[JSONKeys.role]
        gender <- map[JSONKeys.gender]
        ethnic_group <- map[JSONKeys.ethnic_group]
        condition <- map[JSONKeys.condition]
        document_type <- map[JSONKeys.document_type]
        origin_city <- map[JSONKeys.origin_city]
        actual_city <- map[JSONKeys.actual_city]
        
        isNRCBeneficiary <- map[JSONKeys.isNRCBeneficiary]
        
        latitude <- map[JSONKeys.latitude]
        longitude <- map[JSONKeys.longitude]
    }
}

/// User Model for server response
class RegisterUserResponse : Mappable {
    
    var token: String!
    var id: Int!
    var user: UserSerializer!
    var profile: ProfileSerializer!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        token <- map[JSONKeys.token]
        id <- map[JSONKeys.id]
        user <- map[JSONKeys.user]
        profile <- map[JSONKeys.profile]
    }
}

class UserSerializer : Mappable {
    
    var id: Int!
    var first_name: String!
    var last_name: String!
    var username: String!
    var email: String!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        first_name <- map[JSONKeys.first_name]
        last_name <- map[JSONKeys.last_name]
        username <- map[JSONKeys.username]
        email <- map[JSONKeys.email]
    }
}

class ProfileSerializer : Mappable {
    
    var id: Int!
    var document_number: String!
    var birthdate: String!
    var isNRCBeneficiary: Bool!
    var contact_phone: String!
    var role: Role!
    var gender: Gender!
    var ethnic_group: EthnicGroup!
    var condition: Condition!
    var document_type: DocumentType!
    var origin_city: City!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        document_number <- map[JSONKeys.document_number]
        birthdate <- map[JSONKeys.birthdate]
        isNRCBeneficiary <- map[JSONKeys.isNRCBeneficiary]
        contact_phone <- map[JSONKeys.contact_phone]
        role <- map[JSONKeys.role]
        gender <- map[JSONKeys.gender]
        ethnic_group <- map[JSONKeys.ethnic_group]
        condition <- map[JSONKeys.condition]
        document_type <- map[JSONKeys.document_type]
        origin_city <- map[JSONKeys.origin_city]
    }
}

// MARK: Documents Models
class Document: Mappable {
    var id: Int!
    var name: String!
    var description: String!
    var date: String!
    var code: String!
    var url: String!
    var file_ext: String!
    var icon: String!
    var file: String!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        name <- map[JSONKeys.name]
        description <- map[JSONKeys.description]
        date <- map[JSONKeys.date]
        code <- map[JSONKeys.code]
        url <- map[JSONKeys.url]
        file_ext <- map[JSONKeys.file_ext]
        icon <- map[JSONKeys.icon]
        file <- map[JSONKeys.file]
    }
}

class DocumentTextType: Mappable {
    var id: Int!
    var course: Int!
    var name: String!
    var abreviature: String!
    var description: String!
    var icon: String!
    var document_by_type: Array<Document>!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        course <- map[JSONKeys.course]
        name <- map[JSONKeys.name]
        abreviature <- map[JSONKeys.abreviature]
        description <- map[JSONKeys.description]
        icon <- map[JSONKeys.icon]
        document_by_type <- map[JSONKeys.document_by_type]
    }
}

class DocumentType: Mappable {
    
    var id: Int!
    var name: String!
    var abreviature: String!
    var description: String!
    var icon: String!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        name <- map[JSONKeys.name]
        abreviature <- map[JSONKeys.abreviature]
        description <- map[JSONKeys.description]
        icon <- map[JSONKeys.icon]
    }
}

// MARK: - Config App Models
class ApplicationConfiguration: Mappable {
    
    var video_tutorial_id: String!
    var emergency_message: String!
    var about_noruegan_council: String!
    var terms_condition_url: String!
    var min_pin_length: Int!
    var psw_regular_expression: String!
    var psw_error_recomendation: String!
    
    var document_type_Array: Array<DocumentType>!
    var gender_Array: Array<Gender>!
    var state_Array: Array<State>!
    var city_Array: Array<City>!
    var condition_Array: Array<Condition>!
    var ethnic_group_Array: Array<EthnicGroup>!
    var role_Array: Array<Role>!
    var body_parts_Array: Array<BodyParts>!
    var avatar_pieces_Array: Array<AvatarPiece>!
    var contact_form_type_Array: Array<ContactFormType>!
    var course_Array: Array<Course>!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        video_tutorial_id <- map[JSONKeys.video_tutorial_id]
        emergency_message <- map[JSONKeys.emergency_message]
        about_noruegan_council <- map[JSONKeys.about_noruegan_council]
        terms_condition_url <- map[JSONKeys.terms_condition_url]
        min_pin_length <- map[JSONKeys.min_pin_length]
        psw_regular_expression <- map[JSONKeys.psw_regular_expression]
        psw_error_recomendation <- map[JSONKeys.psw_error_recomendation]
        
        document_type_Array <- map[JSONKeys.document_type_list]
        gender_Array <- map[JSONKeys.gender_list]
        state_Array <- map[JSONKeys.state_list]
        city_Array <- map[JSONKeys.city_list]
        condition_Array <- map[JSONKeys.condition_list]
        ethnic_group_Array <- map[JSONKeys.ethnic_group_list]
        role_Array <- map[JSONKeys.role_list]
        body_parts_Array <- map[JSONKeys.body_parts_list]
        avatar_pieces_Array <- map[JSONKeys.avatar_pieces_list]
        contact_form_type_Array <- map[JSONKeys.contact_form_type_list]
        course_Array <- map[JSONKeys.course_list]
    }
}

class Gender: Mappable {
    
    var id: Int!
    var name: String!
    var abreviature: String!
    var icon: String!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        name <- map[JSONKeys.name]
        abreviature <- map[JSONKeys.abreviature]
        icon <- map[JSONKeys.icon]
    }
}

class State: Mappable {
    
    var id: Int!
    var name: String!
    var code: String!
    var abreviature: String!
    var country: String!
    var description: String!
    var icon: String!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        name <- map[JSONKeys.name]
        code <- map[JSONKeys.code]
        abreviature <- map[JSONKeys.abreviature]
        country <- map[JSONKeys.country]
        description <- map[JSONKeys.description]
        icon <- map[JSONKeys.icon]
    }
}

class City: Mappable {
    
    var id: Int!
    var name: String!
    var code: String!
    var abreviature: String!
    var state: String!
    var description: String!
    var icon: String!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        name <- map[JSONKeys.name]
        code <- map[JSONKeys.code]
        abreviature <- map[JSONKeys.abreviature]
        state <- map[JSONKeys.state]
        description <- map[JSONKeys.description]
        icon <- map[JSONKeys.icon]
    }
}

class Condition: Mappable {
    
    var id: Int!
    var name: String!
    var abreviature: String!
    var description: String!
    var icon: String!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        name <- map[JSONKeys.name]
        abreviature <- map[JSONKeys.abreviature]
        description <- map[JSONKeys.description]
        icon <- map[JSONKeys.icon]
    }
}

class EthnicGroup: Mappable {
    
    var id: Int!
    var name: String!
    var abreviature: String!
    var description: String!
    var icon: String!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        name <- map[JSONKeys.name]
        abreviature <- map[JSONKeys.abreviature]
        description <- map[JSONKeys.description]
        icon <- map[JSONKeys.icon]
    }
}

class Role: Mappable {
    
    var id: Int!
    var name: String!
    var abreviature: String!
    var description: String!
    var icon: String!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        name <- map[JSONKeys.name]
        abreviature <- map[JSONKeys.abreviature]
        description <- map[JSONKeys.description]
        icon <- map[JSONKeys.icon]
    }
}

class ContactFormType: Mappable {
    
    var  id: Int!
    var  name: String!
    var  abreviature: String!
    var  description: String!
    var  icon: String!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        name <- map[JSONKeys.name]
        abreviature <- map[JSONKeys.abreviature]
        description <- map[JSONKeys.description]
        icon <- map[JSONKeys.icon]
    }
}


class ContactForm: Mappable {
    
    var  user: Int!
    var  message_type: Int!
    var  detail: String!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        user <- map[JSONKeys.user]
        message_type <- map[JSONKeys.message_type]
        detail <- map[JSONKeys.detail]
    }
}

class Course: Mappable {
    
    var  id: Int!
    var  name: String!
    var  abreviature: String!
    var  description: String!
    var  icon: String!
    var  course_topics: Array<Topic>!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        name <- map[JSONKeys.name]
        abreviature <- map[JSONKeys.abreviature]
        description <- map[JSONKeys.description]
        icon <- map[JSONKeys.icon]
        course_topics <- map[JSONKeys.course_topics]
    }
}

class Topic: Mappable {
    
    var  id: Int!
    var  course: Int!
    var  name: String!
    var  abreviature: String!
    var  description: String!
    var  icon: String!
    
    var  topic_activity_list: Array<TopicActivity>!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        course <- map[JSONKeys.course]
        name <- map[JSONKeys.name]
        abreviature <- map[JSONKeys.abreviature]
        description <- map[JSONKeys.description]
        icon <- map[JSONKeys.icon]
    }
}

class TopicActivity: Mappable {
    
    var  id: Int!
    var  topic: Int!
    var  name: String!
    var  abreviature: String!
    var  description: String!
    var  icon: String!
    var  ponderation_progress: Int!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        topic <- map[JSONKeys.topic]
        name <- map[JSONKeys.name]
        abreviature <- map[JSONKeys.abreviature]
        description <- map[JSONKeys.description]
        icon <- map[JSONKeys.icon]
        ponderation_progress <- map[JSONKeys.ponderation_progress]
    }
}

class SimpleResponseModel: Mappable {
    
    var  detail: String!
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        detail <- map[JSONKeys.detail]
    }
}

// MARK: - Avatar Models
class BodyParts: Mappable {
    
    var id: Int!
    var name: String!
    var abreviature: String!
    var description: String!
    var icon: String!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        name <- map[JSONKeys.name]
        abreviature <- map[JSONKeys.abreviature]
        description <- map[JSONKeys.description]
        icon <- map[JSONKeys.icon]
    }
}

class AvatarPiece: Mappable {
    
    var id: Int!
    var body_part: Int!
    var gender: Int!
    var name: String!
    var description: String!
    var icon: String!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map[JSONKeys.id]
        body_part <- map[JSONKeys.body_part]
        gender <- map[JSONKeys.gender]
        name <- map[JSONKeys.name]
        description <- map[JSONKeys.description]
        icon <- map[JSONKeys.icon]
    }
}

class UserAvatar: Mappable {
    
    var user: Int!
    var avatar_piece: Int!
    
    //inicializador vacio
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        user <- map[JSONKeys.user]
        avatar_piece <- map[JSONKeys.avatar_piece]
    }
}
