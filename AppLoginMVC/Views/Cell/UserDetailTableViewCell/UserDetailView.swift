//
//  UserDetailView.swift
//  AppLoginMVC
//
//  Created by Ellington Cavalcante on 27/11/22.
//

import UIKit

class UserDetailView: UIView {
    
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

    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        self.addSubview(userImage)
        self.addSubview(nameLabel)
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
    
    func configUserImageViewConstraints() {
        self.userImage.snp.makeConstraints { make in
            make.centerY.leading.equalToSuperview()
            make.height.width.equalTo(80)
        }
    }
    
    func configNameLabelConstraints() {
        self.nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(self.userImage.snp.trailing).offset(20)
        }
    }
}
