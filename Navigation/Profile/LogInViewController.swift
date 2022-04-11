//
//  LogInViewController.swift
//  Navigation
//
//  Created by 4444 on 24.03.2022.
//

import UIKit

class LogInViewController: UIViewController, LogInViewDelegateProtocol {
    
    private let nc = NotificationCenter.default
    
    var loginScrollView = UIScrollView()
    var logInView = LogInView()
    
    func sendDataToNavigationController() {  //функция обработчик делегата
        self.tabBarController?.selectedIndex = 1 //переключаемся на ProfileViewController
        self.tabBarController?.tabBar.isHidden = false //показываем таббар
        self.tabBarController?.viewControllers?.remove(at: 2) //удаляем вкладку с логином
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.isHidden = true
        logInView.delegate = self
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(loginScrollView)
        loginScrollView.addSubview(logInView)
        
        loginScrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginScrollView.topAnchor.constraint(equalTo: self.view.topAnchor),       //Top
            loginScrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),       //Left
            loginScrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor), //Right
            loginScrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor), //Bot
        ])
            
        logInView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logInView.topAnchor.constraint(equalTo: loginScrollView.contentLayoutGuide.topAnchor),             //Top
            logInView.leadingAnchor.constraint(equalTo: loginScrollView.contentLayoutGuide.leadingAnchor),     //Left
            logInView.trailingAnchor.constraint(equalTo: loginScrollView.contentLayoutGuide.trailingAnchor),   //Right
            logInView.bottomAnchor.constraint(equalTo: loginScrollView.contentLayoutGuide.bottomAnchor),       //Bot
            logInView.widthAnchor.constraint(equalTo: loginScrollView.widthAnchor),         //Width
            logInView.heightAnchor.constraint(equalTo: loginScrollView.heightAnchor)         //Heigh
        ])
         
    }
    
    override func viewWillAppear (_ animated: Bool) {
        super.viewWillAppear(animated)
        nc.addObserver(self, selector: #selector(keyBrdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(keyBrdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc private func keyBrdShow (notification: NSNotification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }

        let keyboardScreenEndFrame = keyboardValue.cgRectValue

        loginScrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardScreenEndFrame.height + 100, right: 0)

    }
    
    @objc private func keyBrdHide () {
        loginScrollView.contentInset.bottom = .zero
        loginScrollView.verticalScrollIndicatorInsets = .zero
        print("keyboard hide")
    }
}
