//
//  FeedCoordinator.swift
//  Navigation
//
//  Created by 4444 on 08.08.2022.
//

import Foundation
import UIKit

class FeedCoordinator {
    
    func viewPush(navCon: UINavigationController, viewController: UIViewController) {
        let vc = viewController
        navCon.pushViewController(vc, animated: true)
    }
    
    func viewPresent(navCon: UIViewController, viewController: UIViewController) {
        let vc = viewController
        navCon.present(vc, animated: true, completion: nil)
    }
    
    func viewDissmiss(viewController: UIViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
}
