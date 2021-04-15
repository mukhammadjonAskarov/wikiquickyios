//
//  RegistrationCustomView.swift
//  WikiQuicky
//
//  Created by Shakhzod Bobokhonov on 4/14/21.
//

import UIKit


class RegistrationInputView : UIView {
    
    let txtField : UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.isUserInteractionEnabled = true
        txtField.textColor = .black
        return txtField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure () {
        self.layer.cornerRadius = 15
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        self.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(txtField)
        
        NSLayoutConstraint.activate([
            txtField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            txtField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            txtField.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            txtField.bottomAnchor.constraint(equalTo : self.bottomAnchor, constant: 0)
            ]
        )
    }
    
    
}
