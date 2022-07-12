//
//  FeedViewController.swift
//  Navigation
//
//  Created by 4444 on 12.07.2022.
//

import Foundation
import UIKit

class FeedViewController: UIViewController {
    
    let feedModel = FeedModel()
    
    var delegate: MyDataSendingDelegateProtocol? = nil //объявляем делегата
    var data = PostData(title: "Test string")
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    let buttonOne: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.setTitle("View Post", for: .normal)
        button.addTarget(self, action: #selector(ButtonPress), for: .touchUpInside)
        return button
    }()
    
    let buttonTwo: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.setTitle("View Post 2", for: .normal)
        button.addTarget(self, action: #selector(ButtonPress), for: .touchUpInside)
        return button
    }()
    
    lazy var customButton = CustomButton(title: "Send", titleColor: .black, delegateIn: self)
    
    lazy var customTextField = CustomTextField(title: "Inser your String", delegateIn: self)
    
    let statusLabel = UILabel()
    
    var textForCheck: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "Feed View"
        
        self.view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        
        stackView.addArrangedSubview(buttonOne)
        stackView.addArrangedSubview(buttonTwo)
        
        //Status Text Field
        customTextField.textField.font = .systemFont(ofSize: 15, weight: .regular)
        customTextField.textField.textColor = .black
        customTextField.textField.textAlignment = .center
        customTextField.textField.backgroundColor = .white
        customTextField.textField.layer.cornerRadius = 12
        customTextField.textField.layer.borderWidth = 1
        customTextField.textField.layer.borderColor = UIColor.black.cgColor
        stackView.addArrangedSubview(customTextField.textField)
        
        let imageBack = UIImage(named: "blue_pixel.png")
        //imageBack?.draw(at: .zero, blendMode: nil, alpha: 1.0)    //Не получилось задать разную Alpha, подскажите как правильно сделать
        customButton.button.setBackgroundImage(imageBack, for: UIControl.State.normal)
        //imageBack?.draw(at: .zero, blendMode: .normal, alpha: 0.8)
        customButton.button.setBackgroundImage(imageBack, for: UIControl.State.highlighted)
        customButton.button.setBackgroundImage(imageBack, for: UIControl.State.selected)
        customButton.button.setBackgroundImage(imageBack, for: UIControl.State.disabled)
        customButton.button.layer.cornerRadius = 14
        customButton.button.layer.masksToBounds = true
        //Status Button Shadow
        customButton.button.layer.shadowRadius = 4;
        customButton.button.layer.shadowColor = UIColor.white.cgColor;
        customButton.button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0);
        customButton.button.layer.shadowOpacity = 0.7;
        stackView.addArrangedSubview(customButton.button)
        
        //Status Label
        statusLabel.text = "Waiting for something..."
        statusLabel.font = .systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = .gray
        stackView.addArrangedSubview(statusLabel)
        
    }
    
    @objc func ButtonPress (sender: UIButton!) {
        if self.delegate != nil {
            self.delegate?.sendDataToNavigationController(data) //создаем делегата
        }
    }
}
//MARK: -- delegation from button
extension FeedViewController: CustomButtonProtocol {
    func buttonTapped() {
        let isValid: Bool = feedModel.check(word: textForCheck)
        statusLabel.text = textForCheck
        statusLabel.textColor = isValid ? .green : .red
    }
}
//MARK: -- delegation from TextField
extension FeedViewController: CustomTextFieldProtocol {
    func textChanged(textIn: String) {
        textForCheck = textIn
    }
}
