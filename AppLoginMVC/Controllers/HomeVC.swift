//
//  HomeVC.swift
//  AppLoginMVC
//
//  Created by Ellington Cavalcante on 27/11/22.
//

import UIKit

class HomeVC: UIViewController {

    var homeScreen: HomeScreen = HomeScreen()
    var dataUser: [DataUser] = [DataUser(name: "Brasil", nameImage: "brasil"),
                            DataUser(name: "Servia", nameImage: "servia"),
                            DataUser(name: "Suíça", nameImage: "suica"),
                            DataUser(name: "Camarões", nameImage: "camaroes"),
    ]
    
    var dataCountry: [Country] = [Country(name: "Brasil", nameImage: "brasil"),
                                  Country(name: "Servia", nameImage: "servia"),
                                  Country(name: "Suíça", nameImage: "suica"),
                                  Country(name: "Camarões", nameImage: "camaroes")]
    
    
    override func loadView() {
        view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeScreen.configTableViewProtocols(delegate: self, dataSource: self)
        homeScreen.delegate(delegate: self)
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }


}

extension HomeVC: HomeViewProtocol {
    func actionBackButton() {
        navigationController?.popToRootViewController(animated: true)
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataUser.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 4 {
            let cell: GruposTableViewCell? = tableView.dequeueReusableCell(withIdentifier: GruposTableViewCell.identifier, for: indexPath) as? GruposTableViewCell
            cell?.dataCollection(data: self.dataCountry)
            return cell ?? UITableViewCell()
        }
        
        let cell: UserDetailTableViewCell? = tableView.dequeueReusableCell(withIdentifier: UserDetailTableViewCell.identifier, for: indexPath) as? UserDetailTableViewCell
        cell?.setUpCell(data: self.dataUser[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
