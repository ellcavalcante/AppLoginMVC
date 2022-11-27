//
//  GruposCollectionViewCell.swift
//  AppLoginMVC
//
//  Created by Ellington Cavalcante on 27/11/22.
//

import UIKit

class GruposCollectionViewCell: UICollectionViewCell {
    
    let gruposCollectionCustomViewScreen: GruposCollectionCustomViewScreen = GruposCollectionCustomViewScreen()
    
    static var identifier: String = "GruposCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints() 
    }
    
    public func setupCell(data: Country) {
        self.gruposCollectionCustomViewScreen.imageView.image = UIImage(named: data.nameImage)
        self.gruposCollectionCustomViewScreen.countryName.text = data.name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addElements() {
        self.gruposCollectionCustomViewScreen.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(gruposCollectionCustomViewScreen)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            self.gruposCollectionCustomViewScreen.topAnchor.constraint(equalTo: self.topAnchor),
            self.gruposCollectionCustomViewScreen.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.gruposCollectionCustomViewScreen.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.gruposCollectionCustomViewScreen.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
        ])
    }
    
}
