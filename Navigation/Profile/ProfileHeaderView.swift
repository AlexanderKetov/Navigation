//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by 4444 on 12.03.2022.
//

import UIKit

struct Post {
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
}

class ProfileHeaderView: UIView {
    
    private var statusText: String = ""
    
    let profileImage    = UIImageView()
    let nameLabel       = UILabel()
    let statusButton    = UIButton()
    let statusLabel     = UILabel()
    let statusTextField = UITextField()
    let nameButton      = UIButton()
    
    
    override func layoutSubviews () {
        super.layoutSubviews()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        //Profile Image
        profileImage.image = UIImage(named: "ProfileCat.jpg")
        profileImage.contentMode = .scaleAspectFill
        //Circle Profile Image
        profileImage.layer.cornerRadius = 80
        profileImage.clipsToBounds = true
        profileImage.layer.borderWidth = 3
        profileImage.layer.borderColor = UIColor.white.cgColor
        self.addSubview(profileImage)
        //autoLayout
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),       //Top
            profileImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),       //Left
            profileImage.heightAnchor.constraint(equalToConstant: 160), //Height
            profileImage.widthAnchor.constraint(equalToConstant: 160),   //Width
        ])

        //Name Label
        nameLabel.text = "Hipster Cat"
        nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        nameLabel.textColor = .black
        self.addSubview(nameLabel)
        //autoLayout
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),       //Top
            nameLabel.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: 16),       //Left
            nameLabel.heightAnchor.constraint(equalToConstant: 20), //Height
            nameLabel.widthAnchor.constraint(equalToConstant: 160)   //Width
        ])

        //Status Button
        statusButton.backgroundColor = .systemBlue
        statusButton.setTitle("Show status", for: .normal)
        statusButton.layer.cornerRadius = 14 // 4px совсем не похож на макет внешне
        statusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        //Status Button Shadow
        statusButton.layer.shadowRadius = 4;
        statusButton.layer.shadowColor = UIColor.black.cgColor;
        statusButton.layer.shadowOffset = CGSize(width: 4.0, height: 4.0);
        statusButton.layer.shadowOpacity = 0.7;
        self.addSubview(statusButton)
        //autoLayout
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            statusButton.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 16),       //Top
            statusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),       //Left
            statusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16), //Right
            statusButton.heightAnchor.constraint(equalToConstant: 50) //Height
        ])

        //Status Label
        statusLabel.text = "Waiting for something..."
        statusLabel.font = .systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = .gray
        self.addSubview(statusLabel)
        //autoLayout
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            statusLabel.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -54),       //Top
            statusLabel.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: 16),       //Left
            statusLabel.heightAnchor.constraint(equalToConstant: 20), //Height
            statusLabel.widthAnchor.constraint(equalToConstant: 160)   //Width
        ])

        //Status Text Field
        statusTextField.text = "Insert your status"
        statusTextField.font = .systemFont(ofSize: 15, weight: .regular)
        statusTextField.textColor = .black
        statusTextField.textAlignment = .center
        statusTextField.backgroundColor = .white
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        self.addSubview(statusTextField)
        //autoLayout
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            statusTextField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -10),       //Top
            statusTextField.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: 16),       //Left
            statusTextField.heightAnchor.constraint(equalToConstant: 40), //Height
            statusTextField.widthAnchor.constraint(equalToConstant: 160)   //Width
        ])

//        //name Button
//        nameButton.backgroundColor = .systemBlue
//        nameButton.setTitle("Show title", for: .normal)
//        nameButton.layer.cornerRadius = 14 // 4px совсем не похож на макет внешне
//        nameButton.addTarget(self, action: #selector(nameButtonPressed), for: .touchUpInside)
//        //Status Button Shadow
//        nameButton.layer.shadowRadius = 4;
//        nameButton.layer.shadowColor = UIColor.black.cgColor;
//        nameButton.layer.shadowOffset = CGSize(width: 4.0, height: 4.0);
//        nameButton.layer.shadowOpacity = 0.7;
//        self.addSubview(nameButton)
//        //autoLayout
//        nameButton.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            nameButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0),       //Bot
//            nameButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),       //Left
//            nameButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16), //Right
//            nameButton.heightAnchor.constraint(equalToConstant: 50) //Height
//        ])
//
    }
    
    @objc func buttonPressed () {
        print(statusLabel.text ?? 0)
        statusLabel.text = statusText
    }
    
    @objc func nameButtonPressed () {
        print(nameLabel.text ?? 0)
        nameLabel.text = statusText
    }
    
    @objc func statusTextChanged () {
        statusText = statusTextField.text ?? ""
    }
    
}
