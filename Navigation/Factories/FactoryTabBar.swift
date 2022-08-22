//
//  FactoryTabBar.swift
//  Navigation
//
//  Created by 4444 on 08.08.2022.
//

import Foundation
import UIKit

enum FactoryTabBarFlow {
    case tabOne
    case tabTwo
}
class FactoryTabBar {
    
    let flow: FactoryTabBarFlow
    
    init (
        flow: FactoryTabBarFlow
    ) {
        self.flow = flow
    }
    
    func startModule() -> UINavigationController {
        switch self.flow {
            case .tabOne:
                return FeedViewNavigationController(coordinator: FeedCoordinator())
            case .tabTwo:
                return ProfileNavigationController()
        }
    }
}
