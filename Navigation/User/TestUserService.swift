//
//  TestUserService.swift
//  Navigation
//
//  Created by 4444 on 22.06.2022.
//

import Foundation

class TestUserService: UserService {
    
    let currentUserData: User = User(image: "ProfileCat.jpg", name: "Hipster Cat", status: "Load status")
    
    func userInit(userName: String) -> User {
        print("LinkUser")
        if self.currentUserData.name == userName {
            return currentUserData
        }
        return User()
    }
}
