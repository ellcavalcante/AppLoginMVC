//
//  LoginVC.swift
//  AppLoginMVC
//
//  Created by Ellington Cavalcante on 27/11/22.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    
    var screen: LoginScreen?
    var homeScreen: HomeScreen?
    var auth: Auth?
    var alert: Alert?

    
    
    override func loadView() {
        screen = LoginScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        screen?.configTextFieldDelegate(delegate: self)
        auth = Auth.auth()
        alert = Alert(controller: self)
        
    }
    
}

extension LoginVC: loginScreenProtocol{
    
    func actionLoginButton() {

      
        
        let homeScreen: HomeVC = HomeVC()
      
        
        
        guard let login = screen else { return }

        auth?.signIn(withEmail: login.getEmail(), password: login.getPassword(), completion: { (usuario, error) in
            if error != nil {
                self.alert?.getAlert(titulo: "Atenção!", message: "Dados incorretos, verifique e tente novamente!")

            } else {
                if usuario == nil {
                    self.alert?.getAlert(titulo: "Atenção", message: "Tivemos um problema inesperado, tente novamente mais tarde")
                } else {

                    self.navigationController?.pushViewController(homeScreen, animated: true)
                }
            }
        })
    }
    
    func actionRegisterButton() {
        let registerScreen: RegisterVC? = RegisterVC()
        navigationController?.pushViewController(registerScreen ?? UINavigationController(), animated: true)
    }
}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        screen?.validaTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


