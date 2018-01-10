//
//  AplicationRuntime.swift
//  conse
//
//  Created by Felipe Zamudio on 8/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import Foundation

class AplicationRuntime {
    
    // MARK: - Private properties
    var appConfig: ApplicationConfiguration!
    var userData: RegisterUserResponse!
    
    var token: String!
    
    // MARK: - Singleton instance
    class var sharedManager: AplicationRuntime {
        struct Static {
            static let instance = AplicationRuntime()
        }
        return Static.instance
    }
    
    // MARK: - Getters and Setters
    
    // SET App Configuration
    public func setAppConfig(config: ApplicationConfiguration){
        self.appConfig = config
    }
    
    public func setUserData(user: RegisterUserResponse!) {
        self.userData = user
        self.token = user.token
    }
    
    public func setToken(token: String){
        self.token = token
    }
    
    // getters for - Spinners
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
    
    // getters for validations
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
    
    // urls
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
}
