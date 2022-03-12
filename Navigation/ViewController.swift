//
//  ViewController.swift
//  Navigation
//
//  Created by Alex Ketov on 06.03.2022.
//

import UIKit

//-----------NewsFeed-------------

protocol MyDataSendingDelegateProtocol {
    func sendDataToNavigationController(_ : Post)
}

struct Post {
    var title: String
}

class FeedViewController: UIViewController {
    
    var delegate: MyDataSendingDelegateProtocol? = nil //объявляем делегата
    var data = Post(title: "Test string")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "Feed View"
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.backgroundColor = .green
        button.setTitle("View Post", for: .normal)
        button.addTarget(self, action: #selector(ButtonPress), for: .touchUpInside)

        self.view.addSubview(button)
        
    }
    
    @objc func ButtonPress (sender: UIButton!) {
        if self.delegate != nil {
            self.delegate?.sendDataToNavigationController(data) //создаем делегата
        }
    }
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
    
    var data = Post(title: "Post View")
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

    func sendDataToNavigationController(_ data: Post) {  //функция обработчик делегата
        controllerTwo.data = data
        self.pushViewController(controllerTwo, animated: true)
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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tabBarItem.title = "Profile"
        
        let controllerOne = ProfileViewController()
        
        self.viewControllers = [controllerOne]
        self.popToRootViewController(animated: true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


class TabBar: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create Tab RandomPhoto
        let tabOne = FeedViewNavigationController()
        let tabOneBarItem = UITabBarItem(title: "Feed View", image: UIImage (systemName: "newspaper"), selectedImage: UIImage(systemName: "newspaper.fill"))
        
        tabOne.tabBarItem = tabOneBarItem
        
        
        // Create Tab Favorite
        let tabTwo = ProfileNavigationController()
        let tabTwoBarItem2 = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        
        tabTwo.tabBarItem = tabTwoBarItem2
        
        self.viewControllers = [tabOne, tabTwo]

        
        // Create Tab NewsFeed
        
        // Create Tab Profile

    }
}
