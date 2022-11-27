//
//  UserDetailTableViewCell.swift
//  AppLoginMVC
//
//  Created by Ellington Cavalcante on 27/11/22.
//

import UIKit

class UserDetailTableViewCell: UITableViewCell {
    
    static let identifier: String = "UserDetailTableViewCell"
    
    lazy var userImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addElements()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpCell(data: DataUser) {
        self.nameLabel.text = data.name
        self.userImage.image = UIImage(named: data.nameImage)
    }
    
    private func addElements() {
        self.contentView.addSubview(userImage)
        self.contentView.addSubview(nameLabel)
    }

    private func setUpConstraints() {
        NSLayoutConstraint.activate([
        
            self.userImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.userImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.userImage.heightAnchor.constraint(equalToConstant: 80),
            self.userImage.widthAnchor.constraint(equalToConstant: 80),
            
            self.nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.nameLabel.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 20)
        
        
        
        ])
    }
}
