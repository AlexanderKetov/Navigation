//
//  ProfileViewController.swift
//  Navigation
//
//  Created by 4444 on 12.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profileHeader = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //profileHeader.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        
        self.view.backgroundColor = UIColor.lightGray
        self.title = "Profile"
        print("OKOK")
        
        self.view.addSubview(profileHeader)
        //profileHeader autoLayout
        profileHeader.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileHeader.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),       //Top
            profileHeader.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),       //Left
            profileHeader.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0), //Right
            
            profileHeader.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 16), //Bot
            
            //profileHeader.heightAnchor.constraint(equalToConstant: 220) //Height убрал чтоб кнопка была внизу
        ])
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        profileHeader.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        
    }

}
