//
//  FeedViewNavigationController.swift
//  Navigation
//
//  Created by 4444 on 08.08.2022.
//

import Foundation
import UIKit

//-----------NewsFeed-------------

protocol MyDataSendingDelegateProtocol {
    func sendDataToNavigationController(_ : PostData)
}

protocol LogInViewDelegateProtocol {
    func sendDataToNavigationController(userNameFromLogin: String, userPassword: String) -> Bool
}

struct PostData {
    var title: String
}

protocol InfoPresentDelegateProtocol {
    func presentView(navCon: UIViewController)
    func dismissView(viewController: UIViewController)
}

//Вкладка Feed View
class FeedViewNavigationController: UINavigationController, MyDataSendingDelegateProtocol {
    
    let feedViewController = FeedViewController()
    let postViewController = PostViewController()
    let infoViewController = InfoViewController()
    
    var coordinator: FeedCoordinator
    
    init(coordinator: FeedCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func sendDataToNavigationController(_ data: PostData) {  //функция обработчик делегата
        postViewController.data = data
        coordinator.viewPush(navCon: self, viewController: postViewController)
        print("delegate")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "Feed View"
        self.tabBarItem.title = "Feed View"
        
        self.feedViewController.delegate = self
        self.postViewController.delegate = self
        self.infoViewController.delegate = self
        coordinator.viewPush(navCon: self, viewController: feedViewController)
        
        print(self.viewControllers.count)
        print(self.viewControllers)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension FeedViewNavigationController: InfoPresentDelegateProtocol {
    func dismissView(viewController: UIViewController) {
        coordinator.viewDissmiss(viewController: viewController)
    }
    
    func presentView(navCon: UIViewController) {
        coordinator.viewPresent(navCon: navCon, viewController: infoViewController)
    }
}
