//
//  CurrentUserService.swift
//  Navigation
//
//  Created by 4444 on 20.06.2022.
//

import Foundation

protocol UserService {
    func userInit(userName: String) -> User
}

class CurrentUserService: UserService {
    
    let currentUserData = User()
    
    func userInit(userName: String) -> User {
        print("LinkUser")
        if self.currentUserData.name == userName {
            return currentUserData
        }
        return User()
    }
}
