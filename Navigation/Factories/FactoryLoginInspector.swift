//
//  FactoryLoginInspector.swift
//  Navigation
//
//  Created by 4444 on 30.06.2022.
//

import Foundation

protocol LoginInspectorProtocol {
    func createLoginInspector () -> LoginInspector
}

class FactoryLoginInspector: LoginInspectorProtocol {
    func createLoginInspector() -> LoginInspector {
        let loginInspector = LoginInspector()
        return loginInspector
    }
}
