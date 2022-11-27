//
//  UserDetailTableViewCell.swift
//  AppLoginMVC
//
//  Created by Ellington Cavalcante on 27/11/22.
//

import UIKit

class UserDetailTableViewCell: UITableViewCell {
    
    static let identifier: String = "UserDetailTableViewCell"
    
    lazy var userDetailView: UserDetailView = {
        let view = UserDetailView()
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addElements()
        configConstraintsDescriptionCell()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpCell(data: DataUser) {
        self.userDetailView.nameLabel.text = data.name
        self.userDetailView.userImage.image = UIImage(named: data.nameImage)
        
    }
    
    private func addElements() {
        self.contentView.addSubview(self.userDetailView)
    }
    
    private func configConstraintsDescriptionCell() {
        self.userDetailView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
}
