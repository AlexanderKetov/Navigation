//
//  LoginInspector.swift
//  Navigation
//
//  Created by 4444 on 29.06.2022.
//

import Foundation

class LoginInspector {
    func loginCheck (userNameFromLogin: String, userPassword: String) -> Bool {
        let checker = Checker.shared
        let check: Bool = checker.checkPassword(userNameFromLogin: userNameFromLogin, userPassword: userPassword)
        return check
    }
}
