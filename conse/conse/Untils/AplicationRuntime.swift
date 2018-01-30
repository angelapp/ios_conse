//
//  AplicationRuntime.swift
//  conse
//
//  Created by Felipe Zamudio on 8/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import Foundation
import UIKit

class AplicationRuntime {
    
    // MARK: - Private properties
    private var appConfig: ApplicationConfiguration!
    private var userData: RegisterUserResponse!
    private var progress: CoursesProgress!

    var avatarGenderID: Int!
    var avatarImage: UIImage!
    var trustedContacts: Array<ContactModel>!
    
    weak var mainDelegate: MainProtocol?
    
    // MARK: - Singleton instance
    class var sharedManager: AplicationRuntime {
        struct Static {
            static let instance = AplicationRuntime()
        }
        return Static.instance
    }
    
    // MARK: - Getters and Setters
    
    // MARK: - SET App Configuration
    public func setAppConfig(config: ApplicationConfiguration){
        self.appConfig = config
    }
    
    public func setUserData(user: RegisterUserResponse!) {
        self.userData = user
    }
    
    public func setAvatarGenderID(id: Int) {
        self.avatarGenderID = id
    }
    
    public func setAvatarImage(img: UIImage) {
        self.avatarImage = img
    }
    
    public func setTrustedConctacs(list: Array<ContactModel>) {
        self.trustedContacts = list
    }
    
    public func setProgress(progress: CoursesProgress) {
        self.progress = progress
    }
    
    public func setProgress(forCourse id: CourseIDs, progress: Int) {
        if self.progress == nil { self.progress = CoursesProgress() }
        
        if id == .VBG { self.progress.VBG_INDEX = progress }
        else { self.progress.PLC_INDEX = progress }
        
        StorageFunctions.saveProgress(progress: self.progress)
    }
    
    // MARK: - getters for - Spinners
    public func getDocumentTypeList() -> Array<DocumentType> {
        guard appConfig != nil, appConfig.document_type_Array != nil else {
            return []
        }
        return appConfig.document_type_Array
    }
    
    public func getGenderList() -> Array<Gender> {
        guard appConfig != nil, appConfig.gender_Array != nil else {
            return []
        }
        return appConfig.gender_Array
    }
    
    public func getStateList() -> Array<State> {
        guard appConfig != nil, appConfig.state_Array != nil else {
            return []
        }
        return appConfig.state_Array
    }
    
    public func getCityList(forState name:String) -> Array<City> {
        
        guard appConfig != nil, appConfig.city_Array != nil else {
            return []
        }
        
        var cityForState: Array<City> = []
        
        for city in appConfig.city_Array {
            if city.state.uppercased() == name.uppercased() {
                cityForState.append(city)
            }
        }
        
        return cityForState
    }
    
    public func getConditionList() -> Array<Condition> {
        guard appConfig != nil, appConfig.condition_Array != nil else {
            return []
        }
        return appConfig.condition_Array
    }
    
    public func getEthnicList() -> Array<EthnicGroup> {
        guard appConfig != nil, appConfig.ethnic_group_Array != nil else {
            return []
        }
        return appConfig.ethnic_group_Array
    }
    
    public func getRoleList() -> Array<Role> {
        guard appConfig != nil, appConfig.role_Array != nil else {
            return []
        }
        return appConfig.role_Array
    }
    
    public func getContactFormTypeList() -> Array<ContactFormType> {
        guard appConfig != nil, appConfig.contact_form_type_Array != nil else {
            return []
        }
        return appConfig.contact_form_type_Array
    }
    
    // MARK: - Getters for validations
    public func getPswRegex() -> String {
        guard appConfig != nil, appConfig.psw_regular_expression != nil else {
            return nullString
        }
        return appConfig.psw_regular_expression
    }
    
    public func getPswErrorMessage() -> String {
        guard appConfig != nil, appConfig.psw_error_recomendation != nil else {
            return nullString
        }
        return appConfig.psw_error_recomendation
    }
    
    // MARK: - urls
    public func getURLTerms() -> String {
        guard appConfig != nil, appConfig.terms_condition_url != nil else {
            return nullString
        }
        return appConfig.terms_condition_url
    }
    
    public func getvideoID() -> String {
        guard appConfig != nil, appConfig.video_tutorial_id != nil else {
            return nullString
        }
        return appConfig.video_tutorial_id
    }
    
    // MARK: - Avatar
    public func getAvatarImage() -> UIImage! {
        return self.avatarImage
    }
    
    public func getAvatarGenderID() -> Int {
        return self.avatarGenderID
    }
    
    public func getPiecesList(forPart part: AvatarPiecesIDs) -> Array<AvatarPiece> {
        
        guard appConfig != nil, appConfig.avatar_pieces_Array != nil, self.avatarGenderID != nil else {
            return []
        }
        
        var piecesList: Array<AvatarPiece> = []
        
        for pieces in appConfig.avatar_pieces_Array {
            if pieces.gender == self.avatarGenderID && pieces.body_part == part.rawValue {
                piecesList.append(pieces)
            }
        }
        
        return piecesList
    }
    
    // MARK: - USER DATA
    public func getTrustedContact() -> Array<ContactModel>! {
        guard self.trustedContacts != nil else { return [] }
        return self.trustedContacts
    }
    
    public func getContactsNumber() -> Array<String> {
        guard self.trustedContacts != nil else { return [] }
        
        var arrayNumbers: Array<String> = []
        for contact in self.trustedContacts {
            arrayNumbers.append(contact.number)
        }
        
        return arrayNumbers
    }
    
    public func getUser() -> UserSerializer! {
        guard let user = userData?.user else { return nil }
        return user
    }
    
    public func getUserID() -> Int! {
        guard let id = userData?.user?.id else { return nil }
        return id
    }
    
    public func getUserProfile() -> ProfileSerializer! {
        guard let profile = userData?.profile else { return nil }
        return profile
    }
    
    public func getUserToken() -> String {
        guard let token = userData?.token else { return nullString }
        return token
    }
    
    public func getIndex(forCourse id: CourseIDs) -> Int {
        guard progress != nil else { return 0 }
        
        switch id {
            
        case .VBG:
            return progress.VBG_INDEX != nil ? progress.VBG_INDEX : 0
            
        default:
            return progress.PLC_INDEX != nil ? progress.PLC_INDEX : 0
        }
    }
    
    public func getCourseName(forID id: Int!) -> String {
        
        guard appConfig != nil, appConfig.course_Array != nil, id != nil else {
            return nullString
        }
        
        for course in appConfig.course_Array {
            if course.id == id { return course.name }
        }
        
        return nullString
    }
}
