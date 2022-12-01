//
//  GruposTableViewCellScreen.swift
//  AppLoginMVC
//
//  Created by Ellington Cavalcante on 27/11/22.
//

import UIKit
import SnapKit
class GruposTableViewCellScreen: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = "Grupo A"
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .none
        collectionView.delaysContentTouches = false
        collectionView.register(GruposCollectionViewCell.self, forCellWithReuseIdentifier: GruposCollectionViewCell.identifier)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layout, animated: false)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstrainsts()
        setUpConstraints()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configProtocolsCollectionView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        self.collectionView.delegate = delegate
        self.collectionView.dataSource = dataSource
    }
    
    private func addElements() {
        addSubview(collectionView)
        addSubview(titleLabel)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([

            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.titleLabel.heightAnchor.constraint(equalToConstant: 25)
            
        ])
    }
    
    func configConstrainsts() {
        self.collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.top.equalTo(titleLabel)
        }
    }
    
//    func configTitleLabel() {
//        self.titleLabel.snp.makeConstraints { make in
//            make.top.centerY.equalToSuperview().offset(10)
//
//        }
//    }
}
