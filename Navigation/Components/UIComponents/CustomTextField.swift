//
//  CustomTextField.swift
//  Navigation
//
//  Created by 4444 on 12.07.2022.
//

import Foundation
import UIKit

protocol CustomTextFieldProtocol: AnyObject {
    func textChanged(textIn: String)
}
class CustomTextField {
    
    private var delegate: CustomTextFieldProtocol?
    
    let textField = UITextField()
    
    init(title: String, delegateIn: CustomTextFieldProtocol?) {
        self.delegate = delegateIn
        textField.text = title
        textField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
    }
    
    @objc func textChanged() {
        delegate?.textChanged(textIn: textField.text ?? "")
    }
}
