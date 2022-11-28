//
//  GruposCollectionCustomViewScreen.swift
//  AppLoginMVC
//
//  Created by Ellington Cavalcante on 27/11/22.
//

import UIKit

class GruposCollectionCustomViewScreen: UIView {
    
    lazy var imageView: UIImageView =  {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var countryName: UILabel =  {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .darkGray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(imageView)
        addSubview(countryName)
      
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            self.imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.imageView.bottomAnchor.constraint(equalTo: self.countryName.topAnchor, constant: -10),
            
            self.countryName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.countryName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.countryName.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            self.countryName.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
}
