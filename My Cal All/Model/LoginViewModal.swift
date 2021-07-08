//
//  LoginViewModal.swift
//  StudyClock
//
//  Created by itechnotion on 18/06/18.
//  Copyright © 2018 itechnotion-mac1. All rights reserved.
//

import Foundation

struct Currency {
    var alphabetic_code : String?
    var currency : String?
    var entity : String?
}

struct Login {
    var USERID = Int()
    var USERNAME = String()
    var EMAIL = String()
    var CURRENCY = String()
    var PASSWORD = String()
}

enum UserDefaultsKeys : String {
    case isLoggedIn
    case userID
    case loginData
}


extension UserDefaults{
    func setLoggedIn(value: Bool) {
        set(value, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
        //synchronize()
    }
    
    func isLoggedIn()-> Bool {
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
    
    func setUserData(values : Login){
        
        set(values.USERID, forKey: "USERID")
        set(values.EMAIL, forKey: "EMAIL")
        set(values.PASSWORD, forKey: "PASSWORD")
        set(values.CURRENCY, forKey: "CURRENCY")
    }
    
    func getLoginInfo() -> Login{
        var logData = Login()
        logData.USERID = integer(forKey: "USERID")
        logData.EMAIL = string(forKey: "EMAIL")!
        logData.PASSWORD = string(forKey: "PASSWORD")!
        logData.CURRENCY = string(forKey: "CURRENCY")!
        
        return logData
    }
    
    func remove(){
        UserDefaults.standard.removeVolatileDomain(forName: UserDefaultsKeys.loginData.rawValue)
    }
    
    //MARK: Save User Data
    func setUserID(value: Int){
        set(value, forKey: UserDefaultsKeys.userID.rawValue)
        //synchronize()
    }
    //MARK: Retrieve User Data
    func getUserID() -> Int{
        return integer(forKey: UserDefaultsKeys.userID.rawValue)
    }
}
