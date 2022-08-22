//
//  Checker.swift
//  Navigation
//
//  Created by 4444 on 29.06.2022.
//

import Foundation

class Checker {
    
    static let shared = Checker()
    
    private let login: String = "Vasily"
    private let password: String = "12345"
    
    private init () {}
    
    func checkPassword (userNameFromLogin: String, userPassword: String) -> Bool {
        var check: Bool = false
        if (userNameFromLogin == login) && (userPassword == password) {
            check = true
        } else {
            check = false
        }
        return check
    }
}
