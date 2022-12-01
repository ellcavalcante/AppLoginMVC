//
//  LoginScreen.swift
//  AppLoginMVC
//
//  Created by Ellington Cavalcante on 27/11/22.
//

import UIKit

protocol loginScreenProtocol: AnyObject {
    func actionLoginButton()
    func actionRegisterButton()
}

class LoginScreen: UIView {
    
    weak var delegate: loginScreenProtocol?
    
    func delegate(delegate: loginScreenProtocol?) {
        self.delegate = delegate
    }

    
//    lazy var loginLabel: UILabel = {
//        let login = UILabel()
//        login.translatesAutoresizingMaskIntoConstraints = false
//        login.textColor = .white
//        login.font = UIFont.boldSystemFont(ofSize: 40)
//        login.text = "Login"
//        return login
//    }()
    
    lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logocopa")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var emailTextField: UITextField = {
        let email = UITextField()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.autocorrectionType = .no
        email.backgroundColor = .white
        email.borderStyle = .roundedRect
        email.keyboardType = .emailAddress
        email.placeholder = "Digite seu e-mail:"
        email.textColor = .darkGray
        return email
    }()
    
    lazy var passwordTextField: UITextField = {
        let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.autocorrectionType = .no
        password.backgroundColor = .white
        password.borderStyle = .roundedRect
        password.keyboardType = .default
        password.isSecureTextEntry = true
        password.placeholder = "Digite sua senha:"
        password.textColor = .darkGray
        return password
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = UIColor(red: 0/255, green: 128/255, blue: 0/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let registerB = UIButton()
        registerB.translatesAutoresizingMaskIntoConstraints = false
        registerB.setTitle("Não tem conta? Cadastre-se", for: .normal)
        registerB.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        registerB.setTitleColor(.white, for: .normal)
        registerB.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        return registerB
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configBackground()
        addElements()
        setUpConstraints()
        configButtonEnable(false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tappedLoginButton() {
        self.delegate?.actionLoginButton()
    }
    
    @objc func tappedRegisterButton() {
        self.delegate?.actionRegisterButton()
    }
    
    public func validaTextFields() {
        let email: String = emailTextField.text ?? ""
        let password: String = passwordTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty {
            configButtonEnable(true)
        } else {
            configButtonEnable(false)
        }
    }
    
    private func configButtonEnable(_ enable: Bool) {
        if enable {
            loginButton.setTitleColor(.white, for: .normal)
            loginButton.isEnabled = true
        } else {
            loginButton.setTitleColor(.lightGray, for: .normal)
            loginButton.isEnabled = false
        }
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
    
    private func configBackground() {
        backgroundColor = UIColor(red: 255/255, green: 165/255, blue: 0/255, alpha: 1.0)
    }
    
    public func getEmail()-> String{
        return emailTextField.text ?? ""
    }
    
    public func getPassword()-> String{
        return passwordTextField.text ?? ""
    }
    
    private func addElements() {
//        addSubview(loginLabel)
        addSubview(logoImage)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(registerButton)
        
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
//            self.loginLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
//            self.loginLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            
            self.logoImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 90),
            self.logoImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            self.logoImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            self.logoImage.heightAnchor.constraint(equalToConstant: 200),
            
            
            self.emailTextField.topAnchor.constraint(equalTo: self.logoImage.bottomAnchor, constant: 20),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 15),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
            
            self.loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 15),
            self.loginButton.leadingAnchor.constraint(equalTo: self.passwordTextField.leadingAnchor),
            self.loginButton.trailingAnchor.constraint(equalTo: self.passwordTextField.trailingAnchor),
            self.loginButton.heightAnchor.constraint(equalTo: self.passwordTextField.heightAnchor),
            
            
            self.registerButton.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: 15),
            self.registerButton.leadingAnchor.constraint(equalTo: self.loginButton.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.loginButton.trailingAnchor),
            self.registerButton.heightAnchor.constraint(equalTo: self.loginButton.heightAnchor)
        ])
    }
}

