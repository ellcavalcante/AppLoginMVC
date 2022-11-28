//
//  GruposTableViewCell.swift
//  AppLoginMVC
//
//  Created by Ellington Cavalcante on 27/11/22.
//

import UIKit

class GruposTableViewCell: UITableViewCell {
    
    var gruposTableviewCellScreen : GruposTableViewCellScreen = GruposTableViewCellScreen()
    
    var data: [Country] = []
    
    static var identifier: String = "GruposTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubView()
        setUpConstraintsGruposTableViewCellScreen()
        gruposTableviewCellScreen.configProtocolsCollectionView(delegate: self, dataSource: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubView() {
        self.gruposTableviewCellScreen.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.gruposTableviewCellScreen)
    }
    
    private func setUpConstraintsGruposTableViewCellScreen() {
        NSLayoutConstraint.activate([
            self.gruposTableviewCellScreen.topAnchor.constraint(equalTo: self.topAnchor),
            self.gruposTableviewCellScreen.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.gruposTableviewCellScreen.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.gruposTableviewCellScreen.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
        ])
    }
    
    public func dataCollection(data: [Country]) {
        self.data = data
    }
    
    func configConstraints() {
        self.gruposTableviewCellScreen.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension GruposTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count 
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: GruposCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: GruposCollectionViewCell.identifier, for: indexPath) as? GruposCollectionViewCell
        cell?.setupCell(data: self.data[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 140, height: 100)
    }
    
    
}
