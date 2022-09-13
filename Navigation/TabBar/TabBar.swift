//
//  TabBar.swift
//  Navigation
//
//  Created by 4444 on 19.07.2022.
//

import Foundation
import UIKit

protocol TabBarViewDelegateProtocol {
    func sendDataToNavigationController(userNameFromLogin: String)
}

class TabBar: UITabBarController, TabBarViewDelegateProtocol {
    
    private var userLogin: String = ""
    
    let tabOne: FeedViewNavigationController = FactoryTabBar(flow: .tabOne).startModule() as! FeedViewNavigationController
    let tabTwo: ProfileNavigationController = FactoryTabBar(flow: .tabTwo).startModule() as! ProfileNavigationController
    let tabThree = LogInViewController()
    
    func sendDataToNavigationController(userNameFromLogin: String) {  //функция обработчик делегата
        userLogin = userNameFromLogin
        tabTwo.reloadUserName(userName: userLogin)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
        // Create Tab RandomPhoto
        let tabOneBarItem = UITabBarItem(title: "Feed View", image: UIImage (systemName: "newspaper"), selectedImage: UIImage(systemName: "newspaper.fill"))
        
        tabOne.tabBarItem = tabOneBarItem
        
        // Create Tab Favorite
        let tabTwoBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        
        tabTwo.tabBarItem = tabTwoBarItem
        
        // Create Tab LogIn
        tabThree.delegate = self
        let tabThreeBarItem = UITabBarItem(title: "Login", image: nil, selectedImage: nil)
        
        tabThree.tabBarItem = tabThreeBarItem
        
        self.viewControllers = [tabOne, tabTwo, tabThree]
        self.selectedIndex = 2
    }
}
