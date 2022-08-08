//
//  InfoViewController.swift
//  Navigation
//
//  Created by 4444 on 08.08.2022.
//

import Foundation
import UIKit

class InfoViewController: UIViewController {
    
    var delegate: InfoPresentDelegateProtocol? = nil //объявляем делегата
    
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
        if self.delegate != nil {
            self.delegate?.dismissView(viewController: self)
        }
    }
}
