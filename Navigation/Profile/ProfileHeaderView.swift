//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by 4444 on 12.03.2022.
//

import UIKit
import SnapKit

struct Post {
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
}

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    private var statusText: String = ""
    
    let profileImage    = UIImageView()
    let nameLabel       = UILabel()
    let statusButton    = UIButton()
    let statusLabel     = UILabel()
    let statusTextField = UITextField()
    let nameButton      = UIButton()

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
        profileImage.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(contentView).offset(16)
            make.leading.equalTo(contentView).offset(16)
            make.width.equalTo(160)
            make.height.equalTo(160)
        }

        //Name Label
        nameLabel.text = "Hipster Cat"
        nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        nameLabel.textColor = .black
        contentView.addSubview(nameLabel)
        //autoLayout
        nameLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(contentView.layoutMarginsGuide).offset(27)
            make.left.equalTo(profileImage.snp_rightMargin).offset(16)
            make.width.equalTo(160)
            make.height.equalTo(20)
        }
        
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
        contentView.addSubview(statusButton)
        //autoLayout
        statusButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(profileImage.snp_bottomMargin).offset(16)
            make.leading.equalTo(contentView.snp_leadingMargin).offset(16)
            make.trailing.equalTo(contentView.snp_trailingMargin).offset(16)
            make.height.equalTo(50)
        }

        //Status Label
        statusLabel.text = "Waiting for something..."
        statusLabel.font = .systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = .gray
        contentView.addSubview(statusLabel)
        //autoLayout
        statusLabel.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(statusButton.snp_topMargin).offset(-64)
            make.left.equalTo(profileImage.snp_rightMargin).offset(16)
            make.height.equalTo(20)
            make.width.equalTo(160)
        }

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
        statusTextField.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(statusButton.snp_topMargin).offset(-15)
            make.left.equalTo(profileImage.snp_rightMargin).offset(16)
            make.height.equalTo(40)
            make.width.equalTo(160)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
