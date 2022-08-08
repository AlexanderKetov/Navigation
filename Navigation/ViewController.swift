//
//  ViewController.swift
//  Navigation
//
//  Created by Alex Ketov on 06.03.2022.
//

import UIKit

//-----------NewsFeed-------------

protocol MyDataSendingDelegateProtocol {
    func sendDataToNavigationController(_ : PostData)
}

protocol LogInViewDelegateProtocol {
    func sendDataToNavigationController(userNameFromLogin: String, userPassword: String) -> Bool
}

protocol TabBarViewDelegateProtocol {
    func sendDataToNavigationController(userNameFromLogin: String)
}

struct PostData {
    var title: String
}

class InfoViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "Info"
        
        let button = UIButton(frame: CGRect(x: 10, y: 10, width: 100, height: 50))
        button.backgroundColor = .systemGray2
        button.setTitle("View Alert", for: .normal)
        button.addTarget(self, action: #selector(ButtonAlertPress), for: .touchUpInside)

        self.view.addSubview(button)
        
        let button2 = UIButton(frame: CGRect(x: 200, y: 10, width: 100, height: 50))
        button2.backgroundColor = .systemGray2
        button2.setTitle("Close View", for: .normal)
        button2.addTarget(self, action: #selector(ButtonClosePress), for: .touchUpInside)

        self.view.addSubview(button2)
        
    }
    
    @objc func ButtonAlertPress (sender: UIButton!) {
        // Initialize Alert Controller
        let alertController = UIAlertController(title: "Удаление заметки", message: "Вы уверены?", preferredStyle: .alert)
         
        // Initialize Actions
        let yesAction = UIAlertAction(title: "Да", style: .default) { (action) -> Void in
            print("The user is okay.")
        }
         
        let noAction = UIAlertAction(title: "Нет", style: .default) { (action) -> Void in
            print("The user is not okay.")
        }
         
        // Add Actions
        alertController.addAction(yesAction)
        alertController.addAction(noAction)
         
        // Present Alert Controller
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func ButtonClosePress (sender: UIButton!) {
        self.dismiss(animated: true, completion: nil)
    }
}

class PostViewController: UIViewController {
    
    var data = PostData(title: "Post View")
    let InfoView = InfoViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.systemGray3
        self.title = data.title
        
        //let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "info.circle"), style: .plain  , target: self, action: #selector(ButtonInfoPress))
    }
    
    @objc func ButtonInfoPress (sender: UIButton!) {
        self.present(InfoView, animated: true, completion: nil)
    }
    
}

class FeedViewNavigationController: UINavigationController, MyDataSendingDelegateProtocol {
    
    let controllerOne = FeedViewController()
    let controllerTwo = PostViewController()

    func sendDataToNavigationController(_ data: PostData) {  //функция обработчик делегата
        controllerTwo.data = data
        self.pushViewController(controllerTwo, animated: true)
        print("delegate")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "Feed View"
        self.tabBarItem.title = "Feed View"
        
        controllerOne.delegate = self
        
        self.pushViewController(controllerOne, animated: true)
        print(self.viewControllers.count)
        print(self.viewControllers)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//-----------Profile-------------


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
    
    func reloaduserName (userName: String) {
        self.userName = userName
        controllerOne.reloaduserName (userName: userName)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


class TabBar: UITabBarController, TabBarViewDelegateProtocol {
    
    private var userLogin: String = ""
    
    let tabOne = FeedViewNavigationController()
    let tabTwo = ProfileNavigationController()
    let tabThree = LogInViewController()
    
    func sendDataToNavigationController(userNameFromLogin: String) {  //функция обработчик делегата
        userLogin = userNameFromLogin
        tabTwo.reloaduserName(userName: userLogin)
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
