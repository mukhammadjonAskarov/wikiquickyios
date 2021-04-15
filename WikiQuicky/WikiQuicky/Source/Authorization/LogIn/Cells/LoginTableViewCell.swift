//
//  LoginTableViewCell.swift
//  WikiQuicky
//
//  Created by Shakhzod Bobokhonov on 4/15/21.
//

import UIKit

class LoginTableViewCell: UITableViewCell {
    
    let loginView           = RegistrationInputView()
    let passwordView        = RegistrationInputView()
    
    var phoneNumber = String()
    var currentPassword = String()
    var confirmPassword = String()
    
    let welcomeLabel : UILabel = {
        let welcome = UILabel()
        welcome.translatesAutoresizingMaskIntoConstraints = false
        welcome.text = "Welcome"
        welcome.font = UIFont.boldSystemFont(ofSize: 18)
        welcome.numberOfLines = 1
        return welcome
    }()
    
    let haveLabel : UILabel = {
        let haveLabel = UILabel()
        haveLabel.translatesAutoresizingMaskIntoConstraints = false
        haveLabel.text = "have an account?"
        haveLabel.font = UIFont.boldSystemFont(ofSize: 16)
        haveLabel.numberOfLines = 1
        return haveLabel
    }()
    
    let signButton : UIButton = {
        let signButton = UIButton()
        signButton.translatesAutoresizingMaskIntoConstraints = false
        signButton.setTitle("Sign In", for: .normal)
        signButton.setTitleColor(UIColor.yellow, for: .normal)
        return signButton
    }()
    
    let signView : UIView = {
        let signView = UIView()
        signView.translatesAutoresizingMaskIntoConstraints = false
        return signView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        loginView.txtField.delegate = self
        loginView.txtField.tag = 0
        passwordView.txtField.delegate = self
        passwordView.txtField.tag = 1
        
        
        self.contentView.addSubview(welcomeLabel)
        self.contentView.addSubview(loginView)
        self.contentView.addSubview(passwordView)
        self.signView.addSubview(haveLabel)
        self.signView.addSubview(signButton)
        self.contentView.addSubview(signView)
        
        NSLayoutConstraint.activate([
            
            welcomeLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            welcomeLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 60),
            
            loginView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 30),
            loginView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -30),
            loginView.topAnchor.constraint(equalTo: self.welcomeLabel.bottomAnchor, constant: self.contentView.frame.height * 0.8),
            loginView.heightAnchor.constraint(equalToConstant: 60),
            
            passwordView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 30),
            passwordView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -30),
            passwordView.topAnchor.constraint(equalTo: self.loginView.bottomAnchor, constant: 30),
            passwordView.heightAnchor.constraint(equalToConstant: 60),
            
    
            signView.topAnchor.constraint(equalTo: self.passwordView.bottomAnchor, constant: 30),
            signView.heightAnchor.constraint(equalToConstant: 50),
            signView.widthAnchor.constraint(equalToConstant: 200),
            signView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            signView.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -10),
            
            
            haveLabel.leadingAnchor.constraint(equalTo: self.signView.leadingAnchor, constant: 0),
            haveLabel.topAnchor.constraint(equalTo: self.signView.topAnchor, constant: 0),
            haveLabel.bottomAnchor.constraint(equalTo: self.signView.bottomAnchor, constant: 0),
            haveLabel.widthAnchor.constraint(equalToConstant: 140),
          
            signButton.trailingAnchor.constraint(equalTo: self.signView.trailingAnchor, constant: 0),
            signButton.leadingAnchor.constraint(equalTo: self.haveLabel.trailingAnchor, constant: 0),
            signButton.topAnchor.constraint(equalTo: self.signView.topAnchor, constant: 0),
            signButton.bottomAnchor.constraint(equalTo: self.signView.bottomAnchor, constant: 0)
        ]
        )
        self.setKeyboardType()
    }
    
    func configureCell (placeholders: [String]){
        loginView.txtField.placeholder = placeholders[0]
        passwordView.txtField.placeholder = placeholders[1]
    }
    
    func setKeyboardType(){
        self.loginView.txtField.keyboardType = .emailAddress
        self.passwordView.txtField.isSecureTextEntry = true
        
        
        
        self.loginView.txtField.returnKeyType = .next
        self.passwordView.txtField.returnKeyType = .done
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


extension LoginTableViewCell : UITextFieldDelegate {
    
   
    
}

