//
//  HomeScreen.swift
//  AppLoginMVC
//
//  Created by Ellington Cavalcante on 27/11/22.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    func actionBackButton()
}

class HomeScreen: UIView {
    
    private weak var delegate: HomeViewProtocol?
    func delegate(delegate: HomeViewProtocol) {
        self.delegate = delegate
    }
    

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.register(UserDetailTableViewCell.self, forCellReuseIdentifier: UserDetailTableViewCell.identifier)
        tableView.register(GruposTableViewCell.self, forCellReuseIdentifier: GruposTableViewCell.identifier)
        return tableView
    }()
    
    lazy var backButton: UIButton = {
        let bButton = UIButton()
        bButton.translatesAutoresizingMaskIntoConstraints = false
        bButton.setImage(UIImage(named: "back1"), for: .normal)
        bButton.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return bButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func tappedBackButton() {
        delegate?.actionBackButton()
    }
    
    public func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }
    
    private func addElements() {
        addSubview(tableView)
        addSubview(backButton)
        setUpConstraints()
        configBackground()
    }
    
    private func configBackground() {
        backgroundColor = .white
    }
    
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
        
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        
        ])
    }
}


