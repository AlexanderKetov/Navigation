//
//  ProfileNavigationController.swift
//  Navigation
//
//  Created by 4444 on 04.08.2022.
//

import Foundation
import UIKit

class ProfileNavigationController: UINavigationController {
    
    let controllerOne = ProfileTableHederViewController()   //Заменил чтоб появилась таблица с постами
    
    private var userName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tabBarItem.title = "Profile"
        
        self.viewControllers = [controllerOne]
        self.popToRootViewController(animated: true)
        
    }
    
    func reloadUserName (userName: String) {
        self.userName = userName
        controllerOne.reloaduserName (userName: userName)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
