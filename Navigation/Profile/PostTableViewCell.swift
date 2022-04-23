//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by 4444 on 19.04.2022.
//
    
import UIKit

class PostTableViewCell: UITableViewCell {
    
    private let contentCellView: UIView = {
        let view = UIView()
        //view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let postLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.numberOfLines = 10
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let postImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        //Circle Profile Image
//        image.layer.cornerRadius = 80
//        image.clipsToBounds = true
//        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 1
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let viewsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 1
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    private func layout() {
        //Добавление View
        contentView.addSubview(contentCellView)
        
        NSLayoutConstraint.activate([
            contentCellView.topAnchor.constraint(equalTo: contentView.topAnchor),       //Top
            contentCellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),       //Left
            contentCellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor), //Right
            contentCellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor), //Bot
        ])
        //Настройка View
        
        //Label Author
        contentCellView.addSubview(authorLabel)
        //autoLayout
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: contentCellView.topAnchor, constant: 0),
            authorLabel.leadingAnchor.constraint(equalTo: contentCellView.leadingAnchor, constant: 16),
            //authorLabel.heightAnchor.constraint(equalToConstant: 20), //Height
            //authorLabel.widthAnchor.constraint(equalToConstant: 160)   //Width
        ])
        //Label Image
        contentCellView.addSubview(postImage)
        //autoLayout
        NSLayoutConstraint.activate([
            postImage.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 16),       //Top
            postImage.leadingAnchor.constraint(equalTo: contentCellView.leadingAnchor),       //Left
            postImage.trailingAnchor.constraint(equalTo: contentCellView.trailingAnchor),       //Left
            //postImage.heightAnchor.constraint(equalToConstant: 160), //Height
            //postImage.widthAnchor.constraint(equalToConstant: 160)   //Width
            postImage.heightAnchor.constraint(equalTo: contentCellView.widthAnchor),
            postImage.widthAnchor.constraint(equalTo: contentCellView.widthAnchor),
        ])
        
        //Label Post
        contentCellView.addSubview(postLabel)
        //autoLayout
        NSLayoutConstraint.activate([
            postLabel.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 16),       //
            postLabel.leadingAnchor.constraint(equalTo: contentCellView.leadingAnchor, constant: 16),
            postLabel.trailingAnchor.constraint(equalTo: contentCellView.trailingAnchor, constant: -16),
            //postLabel.bottomAnchor.constraint(equalTo: contentCellView.bottomAnchor, constant: -16)
            
        ])
        
        //likesLabel
        contentCellView.addSubview(likesLabel)
        //autoLayout
        NSLayoutConstraint.activate([
            likesLabel.topAnchor.constraint(equalTo: postLabel.bottomAnchor, constant: 16),       //
            likesLabel.leadingAnchor.constraint(equalTo: contentCellView.leadingAnchor, constant: 16),
            //likesLabel.trailingAnchor.constraint(equalTo: contentCellView.trailingAnchor, constant: -16),
            likesLabel.bottomAnchor.constraint(equalTo: contentCellView.bottomAnchor, constant: -16)
            
        ])
        //viewsLabel
        contentCellView.addSubview(viewsLabel)
        //autoLayout
        NSLayoutConstraint.activate([
            viewsLabel.topAnchor.constraint(equalTo: postLabel.bottomAnchor, constant: 16),       //
            //viewsLabel.leadingAnchor.constraint(equalTo: contentCellView.leadingAnchor, constant: 16),
            viewsLabel.trailingAnchor.constraint(equalTo: contentCellView.trailingAnchor, constant: -16),
            //viewsLabel.bottomAnchor.constraint(equalTo: contentCellView.bottomAnchor, constant: -16)
            
        ])
    }
    
    func cellContentSetup (post: PostS) {
        authorLabel.text = "Author: " + post.author
        postLabel.text = post.description
        postImage.image = UIImage(named: post.image)
        likesLabel.text = "Likes: " + String(post.likes)
        viewsLabel.text = "Views: " + String(post.views)
        print("")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
