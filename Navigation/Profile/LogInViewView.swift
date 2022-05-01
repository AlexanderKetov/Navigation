//
//  LogInViewView.swift
//  Navigation
//
//  Created by 4444 on 24.03.2022.
//

import UIKit

class LogInView: UIView {
    
    var delegate: LogInViewDelegateProtocol? = nil //объявляем делегата
    
    let profileViewController = ProfileViewController()
    
    let logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo.png")
        image.contentMode = .scaleAspectFill
        return image
    }()
    var loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email of phone"
        textField.font = .systemFont(ofSize: 16, weight: .regular)
        textField.textColor = .black
        //textField.tintColor =  //какой нужно сделать?
        textField.autocapitalizationType = .none
        textField.textAlignment = .center
        textField.keyboardType = .emailAddress
        textField.backgroundColor = .systemGray6
        textField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        return textField
    }()
    var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        //textField.tintColor =  //какой нужно сделать?
        textField.autocapitalizationType = .none
        textField.textAlignment = .center
        textField.backgroundColor = .systemGray6
        textField.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemYellow
        let imageBack = UIImage(named: "blue_pixel.png")
        //imageBack?.draw(at: .zero, blendMode: nil, alpha: 1.0)    //Не получилось задать разную Alpha, подскажите как правильно сделать
        button.setBackgroundImage(imageBack, for: UIControl.State.normal)
        //imageBack?.draw(at: .zero, blendMode: .normal, alpha: 0.8)
        button.setBackgroundImage(imageBack, for: UIControl.State.highlighted)
        button.setBackgroundImage(imageBack, for: UIControl.State.selected)
        button.setBackgroundImage(imageBack, for: UIControl.State.disabled)
        
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 14 // 4px совсем не похож на макет внешне
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(buttonLoginPressed), for: .touchUpInside)
        //Status Button Shadow
        button.layer.shadowRadius = 4;
        button.layer.shadowColor = UIColor.white.cgColor;
        button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0);
        button.layer.shadowOpacity = 0.7;
        return button
    }()
    /*
    let nameLabel       = UILabel()
    let statusButton    = UIButton()
    let statusLabel     = UILabel()
    let nameButton      = UIButton()
    */
    
    //override func layoutSubviews () {
    //    super.layoutSubviews()
    //}
    
    override func draw (_ rect: CGRect) {
        super.draw(rect)
        
        //VC Logo
        self.addSubview(logoImage)
        //autoLayout
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 120),       //Top
            logoImage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor, constant: -50),       //Left
            logoImage.heightAnchor.constraint(equalToConstant: 100), //Height
            logoImage.widthAnchor.constraint(equalToConstant: 100)   //Width
        ])
        
        //Login Text Field
        self.addSubview(loginTextField)
        //autoLayout
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginTextField.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120),       //Top
            loginTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),       //Left
            loginTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),       //Left
            loginTextField.heightAnchor.constraint(equalToConstant: 50), //Height
        ])
        
        
        //Password Text Field
        self.addSubview(passwordTextField)
        //autoLayout
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 0),       //Top
            passwordTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),       //Left
            passwordTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),       //Left
            passwordTextField.heightAnchor.constraint(equalToConstant: 50), //Height
        ])
        
        //name Button
        self.addSubview(loginButton)
        //autoLayout
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),       //Top
            loginButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),       //Left
            loginButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16), //Right
            loginButton.heightAnchor.constraint(equalToConstant: 50), //Height
            //loginButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 16), //Right
        ])
        
    }
    
    @objc func buttonLoginPressed (sender: UIButton!) {
        if self.delegate != nil {
            self.delegate?.sendDataToNavigationController() // вызываем функцию делегата
            print("send delegate")
        }
       
    }
    
}
