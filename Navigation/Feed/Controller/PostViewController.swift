//
//  PostViewController.swift
//  Navigation
//
//  Created by 4444 on 04.08.2022.
//

import Foundation
import UIKit

class PostViewController: UIViewController {
    
    var data = PostData(title: "Post View")
    
    var delegate: InfoPresentDelegateProtocol? = nil //объявляем делегата
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.systemGray3
        self.title = data.title
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "info.circle"), style: .plain  , target: self, action: #selector(ButtonInfoPress))
    }
    
    @objc func ButtonInfoPress (sender: UIButton!) {
        if self.delegate != nil {
            self.delegate?.presentView(navCon: self) //переход на Info
        }
    }
}
