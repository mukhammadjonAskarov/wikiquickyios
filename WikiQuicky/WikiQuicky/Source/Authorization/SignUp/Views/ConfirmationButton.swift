//
//  ConfirmationButton.swift
//  WikiQuicky
//
//  Created by Shakhzod Bobokhonov on 4/15/21.
//

import UIKit

class ConfirmationButton : UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure () {
        self.layer.cornerRadius = 15
        self.layer.backgroundColor = UIColor.gray.cgColor
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle("Подтверждение", for: .normal)
    }
    
    
}
