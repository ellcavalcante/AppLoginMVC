//
//  HomeVC.swift
//  AppLoginMVC
//
//  Created by Ellington Cavalcante on 27/11/22.
//

import UIKit

class HomeVC: UIViewController {

    var homeScreen: HomeScreen = HomeScreen()
//    var dataUser: [DataUser] = [DataUser(name: "Brasil", nameImage: "brasil"),
//                            DataUser(name: "Servia", nameImage: "servia"),
//                            DataUser(name: "Suíça", nameImage: "suica"),
//                            DataUser(name: "Camarões", nameImage: "camaroes"),
//    ]
//
    
    var grupoA: [Country] = [Country(name: "Holanda", nameImage: "holanda"),
                                  Country(name: "Equador", nameImage: "equador"),
                                  Country(name: "Senegal", nameImage: "senegal"),
                                  Country(name: "Catar", nameImage: "catar")]
    
    var grupoB: [Country] = [Country(name: "Inglaterra", nameImage: "inglaterra"),
                                  Country(name: "Irã", nameImage: "ira"),
                                  Country(name: "USA", nameImage: "usa"),
                                  Country(name: "País de Gales", nameImage: "gales")]
    
    var grupoC: [Country] = [Country(name: "Polônia", nameImage: "polonia"),
                                  Country(name: "Argentina", nameImage: "argentina"),
                                  Country(name: "Arábia Saudita", nameImage: "arabiasaudita"),
                                  Country(name: "Mexico", nameImage: "mexico")]
    
    var grupoD: [Country] = [Country(name: "França", nameImage: "franca"),
                                  Country(name: "Tunísia", nameImage: "tunisia"),
                                  Country(name: " Australia", nameImage: "australia"),
                                  Country(name: "Dinamarca", nameImage: "dinamarca")]
    
    var grupoE: [Country] = [Country(name: "Espanha", nameImage: "espanha"),
                                  Country(name: "Japão", nameImage: "japao"),
                                  Country(name: " Costa Rica", nameImage: "costarica"),
                                  Country(name: "Alemanha", nameImage: "alemanha")]
   
    var grupoF: [Country] = [Country(name: "Croácia", nameImage: "croacia"),
                                  Country(name: "Marrocos", nameImage: "marrocos"),
                                  Country(name: " Bélgica", nameImage: "belgica"),
                                  Country(name: "Canadá", nameImage: "canada")]
    
    var grupoG: [Country] = [Country(name: "Brasil", nameImage: "brasil"),
                                  Country(name: "Servia", nameImage: "servia"),
                                  Country(name: "Suíça", nameImage: "suica"),
                                  Country(name: "Camarões", nameImage: "camaroes")]
    
    var grupoH: [Country] = [Country(name: "Portugal", nameImage: "portugal"),
                                  Country(name: "Coreia do Sul", nameImage: "coreia"),
                                  Country(name: " Uruguai", nameImage: "uruguai"),
                                  Country(name: "Gana", nameImage: "gana")]
    
    
    override func loadView() {
        view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeScreen.configTableViewProtocols(delegate: self, dataSource: self)
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }


}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell: GruposTableViewCell? = tableView.dequeueReusableCell(withIdentifier: GruposTableViewCell.identifier, for: indexPath) as? GruposTableViewCell
            cell?.dataCollection(data: self.grupoA)
            
            return cell ?? UITableViewCell()
            
        }
        
        if indexPath.row == 1 {
            let cell: GruposTableViewCell? = tableView.dequeueReusableCell(withIdentifier: GruposTableViewCell.identifier, for: indexPath) as? GruposTableViewCell
            cell?.dataCollection(data: self.grupoB)
            
            return cell ?? UITableViewCell()
            
        }
        
        if indexPath.row == 2 {
            let cell: GruposTableViewCell? = tableView.dequeueReusableCell(withIdentifier: GruposTableViewCell.identifier, for: indexPath) as? GruposTableViewCell
            cell?.dataCollection(data: self.grupoC)
            
            return cell ?? UITableViewCell()
            
        }
        
        if indexPath.row == 3 {
            let cell: GruposTableViewCell? = tableView.dequeueReusableCell(withIdentifier: GruposTableViewCell.identifier, for: indexPath) as? GruposTableViewCell
            cell?.dataCollection(data: self.grupoD)
            
            return cell ?? UITableViewCell()
        }
        
        if indexPath.row == 4 {
            let cell: GruposTableViewCell? = tableView.dequeueReusableCell(withIdentifier: GruposTableViewCell.identifier, for: indexPath) as? GruposTableViewCell
            cell?.dataCollection(data: self.grupoE)
            
            return cell ?? UITableViewCell()
        }
        
        if indexPath.row == 5 {
            let cell: GruposTableViewCell? = tableView.dequeueReusableCell(withIdentifier: GruposTableViewCell.identifier, for: indexPath) as? GruposTableViewCell
            cell?.dataCollection(data: self.grupoF)
            
            return cell ?? UITableViewCell()
        }
        
        if indexPath.row == 6 {
            let cell: GruposTableViewCell? = tableView.dequeueReusableCell(withIdentifier: GruposTableViewCell.identifier, for: indexPath) as? GruposTableViewCell
            cell?.dataCollection(data: self.grupoG)
            
            return cell ?? UITableViewCell()
            
        }
        
        if indexPath.row == 7 {
            let cell: GruposTableViewCell? = tableView.dequeueReusableCell(withIdentifier: GruposTableViewCell.identifier, for: indexPath) as? GruposTableViewCell
            cell?.dataCollection(data: self.grupoH)
            
            return cell ?? UITableViewCell()
            
        }
        
//                let cell: UserDetailTableViewCell? = tableView.dequeueReusableCell(withIdentifier: UserDetailTableViewCell.identifier, for: indexPath) as? UserDetailTableViewCell
//                cell?.setUpCell(data: self.dataUser[indexPath.row])
//                return cell ?? UITableViewCell()
        
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
