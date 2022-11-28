//
//  RegisterScreen.swift
//  AppLoginMVC
//
//  Created by Ellington Cavalcante on 27/11/22.
//

import UIKit


protocol registerScreenProtocol: AnyObject {
    func actionBackButton()
    func actionRegisterButton()
}

class RegisterScreen: UIView {
    
   private weak var delegate: registerScreenProtocol?
    func delegate(delegate: registerScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var backButton: UIButton = {
        let bButton = UIButton()
        bButton.translatesAutoresizingMaskIntoConstraints = false
        bButton.setImage(UIImage(named: "back1"), for: .normal)
        bButton.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return bButton
    }()

    lazy var imageRegister: UIImageView = {
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
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Registrar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = UIColor(red: 0/255, green: 128/255, blue: 0/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedRegisterButton(){
        delegate?.actionRegisterButton()
    }
    
    @objc func tappedBackButton(){
        delegate?.actionBackButton()
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
            registerButton.setTitleColor(.white, for: .normal)
            registerButton.isEnabled = true
        } else {
            registerButton.setTitleColor(.lightGray, for: .normal)
            registerButton.isEnabled = false
        }
    }
    
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
    
    private func addElements() {
        addSubview(imageRegister)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(registerButton)
        addSubview(backButton)
    }
    
    public func getEmail()-> String{
        return emailTextField.text ?? ""
    }
    
    public func getPassword()-> String{
        return passwordTextField.text ?? ""
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
    
    private func configBackground() {
        backgroundColor = UIColor(red: 255/255, green: 165/255, blue: 0/255, alpha: 1.0)
    }
    
        private func setUpConstraints(){
            NSLayoutConstraint.activate([
                
                self.imageRegister.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 70),
                self.imageRegister.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                self.imageRegister.widthAnchor.constraint(equalTo: self.widthAnchor, constant: 150),
                self.imageRegister.heightAnchor.constraint(equalToConstant: 150),
                
    
                self.backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
                self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
    
                self.emailTextField.topAnchor.constraint(equalTo: imageRegister.bottomAnchor, constant: 20),
                self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
                self.emailTextField.heightAnchor.constraint(equalToConstant: 45),
    
                self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 15),
                self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
                self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
                self.passwordTextField.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
    
    
                self.registerButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 15),
                self.registerButton.leadingAnchor.constraint(equalTo: self.passwordTextField.leadingAnchor),
                self.registerButton.trailingAnchor.constraint(equalTo: self.passwordTextField.trailingAnchor),
                self.registerButton.heightAnchor.constraint(equalTo: self.passwordTextField.heightAnchor)
            ])
        }
}

