//
//  ProfileViewController.swift
//  Navigation
//
//  Created by 4444 on 12.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profileHeader = ProfileHeaderView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileHeader.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        
        self.view.backgroundColor = UIColor.lightGray
        self.title = "Profile"
        print("OKOK")
        
        self.view.addSubview(profileHeader)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        profileHeader.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        
    }

}
