//
//  CustomButton.swift
//  Navigation
//
//  Created by 4444 on 10.07.2022.
//

import Foundation
import UIKit

protocol CustomButtonProtocol: AnyObject {
    func buttonTapped()
}

class CustomButton {
    
    private var delegate: CustomButtonProtocol?
    
    let button = UIButton()
    
    init(title: String, titleColor: UIColor?, delegateIn: CustomButtonProtocol?) {
        self.delegate = delegateIn
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        guard let inputColor = titleColor else {
            return
        }
        button.tintColor = inputColor
    }
    
    @objc func buttonPressed() {
        delegate?.buttonTapped()
    }
}
