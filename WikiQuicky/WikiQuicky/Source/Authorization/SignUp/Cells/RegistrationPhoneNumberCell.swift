//
//  RegistrationPhoneNumberCell.swift
//  WikiQuicky
//
//  Created by Shakhzod Bobokhonov on 4/14/21.
//

import UIKit

class RegistrationPhoneNumberCell: UITableViewCell {
    
    let phoneView           = RegistrationInputView()
    let passwordView        = RegistrationInputView()
    let confirmPasswordView = RegistrationInputView()
    
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
        
        
        phoneView.txtField.delegate = self
        phoneView.txtField.tag = 0
        passwordView.txtField.delegate = self
        passwordView.txtField.tag = 1
        confirmPasswordView.txtField.delegate = self
        confirmPasswordView.txtField.tag = 2
        
        
        self.contentView.addSubview(welcomeLabel)
        self.contentView.addSubview(phoneView)
        self.contentView.addSubview(passwordView)
        self.contentView.addSubview(confirmPasswordView)
        self.signView.addSubview(haveLabel)
        self.signView.addSubview(signButton)
        self.contentView.addSubview(signView)
        
        NSLayoutConstraint.activate([
            
            welcomeLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            welcomeLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 60),
            
            phoneView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 30),
            phoneView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -30),
            phoneView.topAnchor.constraint(equalTo: self.welcomeLabel.bottomAnchor, constant: self.contentView.frame.height * 0.8),
            phoneView.heightAnchor.constraint(equalToConstant: 60),
            
            passwordView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 30),
            passwordView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -30),
            passwordView.topAnchor.constraint(equalTo: self.phoneView.bottomAnchor, constant: 30),
            passwordView.heightAnchor.constraint(equalToConstant: 60),
            
            confirmPasswordView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 30),
            confirmPasswordView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -30),
            confirmPasswordView.topAnchor.constraint(equalTo: self.passwordView.bottomAnchor, constant: 30),
            confirmPasswordView.heightAnchor.constraint(equalToConstant: 60),
            
            signView.topAnchor.constraint(equalTo: self.confirmPasswordView.bottomAnchor, constant: 30),
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
        phoneView.txtField.placeholder = placeholders[0]
        passwordView.txtField.placeholder = placeholders[1]
        confirmPasswordView.txtField.placeholder = placeholders[2]
    }
    
    func setKeyboardType(){
        self.phoneView.txtField.keyboardType = .phonePad
        self.passwordView.txtField.isSecureTextEntry = true
        self.confirmPasswordView.txtField.isSecureTextEntry = true
        
        
        
        self.phoneView.txtField.returnKeyType = .next
        self.passwordView.txtField.returnKeyType = .next
        self.confirmPasswordView.txtField.returnKeyType = .done
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


extension RegistrationPhoneNumberCell : UITextFieldDelegate {
    
    func textFieldDidChange(_ textField: UITextField) {
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 0 {
            phoneView.layer.borderColor = UIColor.yellow.cgColor
            if phoneView.txtField.text == "" {
                textField.text = "+998 "
            }
        }
        
        if textField.tag == 1{
            passwordView.layer.borderColor = UIColor.yellow.cgColor
        }
        
        if textField.tag == 2 {
            confirmPasswordView.layer.borderColor = UIColor.yellow.cgColor
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField.tag == 0{
            
            guard let currentText:String = textField.text else {return true}
            if string.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) != nil { return false }
            let newCount:Int = currentText.count + string.count - range.length
            let addingCharacter:Bool = range.length <= 0
            
            if newCount == 4{
                return false
            }
            
            if(newCount == 8){
                textField.text = addingCharacter ? currentText + " \(string)" : String(currentText.dropLast(2))
                return false
                
            }else if(newCount == 12){
                textField.text = addingCharacter ? currentText + " \(string)" : String(currentText.dropLast(2))
                return false
                
            }else if(newCount == 15){
                textField.text = addingCharacter ? currentText + "-\(string)" : String(currentText.dropLast(2))
                return false
            }
            
            if newCount > 17{
                self.passwordView.txtField.becomeFirstResponder()
            }
            
            if(newCount > 17){
                return false
            }
        }
        
        if textField.tag == 2{
            if passwordView.txtField.text == confirmPasswordView.txtField.text! + string{
                textField.textColor = .black
            }else{
                textField.textColor = .red
            }
        }
        
        return true
        
    }
    
}
