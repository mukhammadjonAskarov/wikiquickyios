//
//  RegisterController.swift
//  WikiQuicky
//
//  Created by Shakhzod Bobokhonov on 4/14/21.
//

import UIKit

class RegisterController: UIViewController {
    
    let placeholders = ["Enter phone number", "Create password", "Confirm password"]
    
    let tableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    let confirmButton = ConfirmationButton()
    var safeArea: UILayoutGuide!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        safeArea = view.layoutMarginsGuide

        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(tableView)
        self.view.addSubview(confirmButton)
        
        self.tableView.delegate   = self
        self.tableView.dataSource = self
        
        self.hideKeyboardWhenTappedAround()

        self.registerCell()
        self.addConstraints()
    }
    
    func registerCell () {
     self.tableView.register(RegistrationPhoneNumberCell.self, forCellReuseIdentifier: "RegistrationPhoneNumberCell")
    }
    
    func addConstraints(){
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            
            
            confirmButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant:  -50),
            confirmButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25),
            confirmButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25),
            confirmButton.heightAnchor.constraint(equalToConstant: 60)

            ]
        )
    }
}

// MARK: = UITableViewDataSource
extension RegisterController : UITableViewDataSource{
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "RegistrationPhoneNumberCell") as! RegistrationPhoneNumberCell
        cell.configureCell(placeholders: placeholders)
        cell.selectionStyle = .none
        return cell
    }
    
    
    
}

// MARK: = UITableViewDelegate
extension RegisterController : UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height
   
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

