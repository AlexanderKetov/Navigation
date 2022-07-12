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
extension ProfileHeaderView: CustomButtonProtocol {
    func buttonTapped() {
        print("statusCustomButton")
        print(statusLabel.text ?? 0)
        statusLabel.text = statusText
    }
}
class ProfileHeaderView: UITableViewHeaderFooterView {
    
    var userService: UserService?
    private var userData = User()
    
    private var statusText: String = ""
    
    let profileImage    = UIImageView()
    let nameLabel       = UILabel()
    lazy var statusCustomButton = CustomButton(title: "Log In", titleColor: .black, delegateIn: self)
    let statusLabel     = UILabel()
    let statusTextField = UITextField()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .blue
        
        //Profile Image
        profileImage.image = UIImage(named: "ProfileCat.jpg")
        profileImage.contentMode = .scaleAspectFill
        //Circle Profile Image
        profileImage.layer.cornerRadius = 80
        profileImage.clipsToBounds = true
        profileImage.layer.borderWidth = 3
        profileImage.layer.borderColor = UIColor.white.cgColor
        
        contentView.addSubview(profileImage)
        //autoLayout
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),       //Top
            profileImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),       //Left
            profileImage.heightAnchor.constraint(equalToConstant: 160), //Height
            profileImage.widthAnchor.constraint(equalToConstant: 160),   //Width
        ])
        
        //Name Label
        nameLabel.text = "Hipster Cat"
        nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        nameLabel.textColor = .black
        contentView.addSubview(nameLabel)
        //autoLayout
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 27),       //Top
            nameLabel.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: 16),       //Left
            nameLabel.heightAnchor.constraint(equalToConstant: 20), //Height
            nameLabel.widthAnchor.constraint(equalToConstant: 160)   //Width
        ])
        
        //Status Button
        statusCustomButton.button.backgroundColor = .systemBlue
        statusCustomButton.button.setTitle("Show status", for: .normal)
        statusCustomButton.button.layer.cornerRadius = 14 // 4px совсем не похож на макет внешне
        //Status Button Shadow
        statusCustomButton.button.layer.shadowRadius = 4;
        statusCustomButton.button.layer.shadowColor = UIColor.black.cgColor;
        statusCustomButton.button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0);
        statusCustomButton.button.layer.shadowOpacity = 0.7;
        contentView.addSubview(statusCustomButton.button)
        //autoLayout
        statusCustomButton.button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            statusCustomButton.button.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 16),       //Top
            statusCustomButton.button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),       //Left
            statusCustomButton.button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16), //Right
            statusCustomButton.button.heightAnchor.constraint(equalToConstant: 50), //Height
        ])

        //Status Label
        statusLabel.text = "Waiting for something..."
        statusLabel.font = .systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = .gray
        contentView.addSubview(statusLabel)
        //autoLayout
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            statusLabel.bottomAnchor.constraint(equalTo: statusCustomButton.button.topAnchor, constant: -54),       //Top
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
        contentView.addSubview(statusTextField)
        //autoLayout
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            statusTextField.bottomAnchor.constraint(equalTo: statusCustomButton.button.topAnchor, constant: -10),       //Top
            statusTextField.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: 16),       //Left
            statusTextField.heightAnchor.constraint(equalToConstant: 40), //Height
            statusTextField.widthAnchor.constraint(equalToConstant: 160)   //Width
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadUserData (userServiceIn: UserService?, userName: String?) {
        userData = userServiceIn?.userInit(userName: userName ?? "") ?? User()
        nameLabel.text = userData.name
        profileImage.image = UIImage(named: userData.image)
        statusTextField.text = userData.status
        print("Reload")
    }
    
    @objc func statusTextChanged () {
        statusText = statusTextField.text ?? ""
    }
}
