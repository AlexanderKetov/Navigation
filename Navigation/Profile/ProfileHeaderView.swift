//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by 4444 on 12.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var statusText: String = ""
    
    var statusButton = UIButton(frame: CGRect(x: 16, y: 16+80+160+16, width: 0, height: 50))
    var statusLabel = UILabel(frame: CGRect(x: 200, y: 16+80+90, width: 160, height: 20))
    let statusTextField = UITextField(frame: CGRect(x: 200, y: 16+80+120, width: 160, height: 40))
    
    
    override func layoutSubviews () {
        super.layoutSubviews()
        
        //Status Button resize
        statusButton.frame = CGRect(x: 16, y: 16+80+160+16, width: self.frame.width - 32, height: 50)
        self.addSubview(statusButton)
        
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        //Profile Image
        let profileImage = UIImageView(frame:CGRect(x: 16, y: 16+80, width: 160, height: 160))
        profileImage.image = UIImage(named: "ProfileCat.jpg")
        profileImage.contentMode = .scaleAspectFill
        //Circle Profile Image
        profileImage.layer.cornerRadius = 80
        profileImage.clipsToBounds = true
        profileImage.layer.borderWidth = 3
        profileImage.layer.borderColor = UIColor.white.cgColor
        self.addSubview(profileImage)
        
        //Name Label
        let nameLabel = UILabel(frame: CGRect(x: 200, y: 27+80, width: 160, height: 20))
        nameLabel.text = "Hipster Cat"
        nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        nameLabel.textColor = .black
        self.addSubview(nameLabel)
        
        //Status Button
        statusButton.frame = CGRect(x: 16, y: 16+80+160+16, width: self.frame.width - 32, height: 50)
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
        
        //Status Label
        statusLabel.text = "Waiting for something..."
        statusLabel.font = .systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = .gray
        self.addSubview(statusLabel)
        
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
        
    }
    
    @objc func buttonPressed () {
        print(statusLabel.text ?? 0)
        statusLabel.text = statusText
    }
    
    @objc func statusTextChanged () {
        statusText = statusTextField.text ?? ""
    }
    
}
