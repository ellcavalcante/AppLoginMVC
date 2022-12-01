//
//  RegisterVC.swift
//  AppLoginMVC
//
//  Created by Ellington Cavalcante on 27/11/22.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {
    
    var registerScreen: RegisterScreen?
    var auth: Auth?
    var alert: Alert?
    
    
    override func loadView() {
      registerScreen = RegisterScreen()
        view = registerScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerScreen?.configTextFieldDelegate(delegate: self)
        registerScreen?.delegate(delegate: self)
        auth = Auth.auth()
        alert = Alert(controller: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

}

extension RegisterVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        registerScreen?.validaTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension RegisterVC: registerScreenProtocol {
    func actionBackButton() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func actionRegisterButton() {
        
        guard let register = registerScreen else {return}
        
        auth?.createUser(withEmail: register.getEmail(), password: register.getPassword(), completion: { (result, error) in
            if error != nil {
                self.alert?.getAlert(titulo: "Atenção", message: "Erro ao cadastrar, verifique e tente novamente!")
            } else {
                self.alert?.getAlert(titulo: "Parabéns", message: "Usuário cadastrado com sucesso", completion: {
                    self.navigationController?.popToRootViewController(animated: true)
                })
            }
        })
    }
    
    
}

