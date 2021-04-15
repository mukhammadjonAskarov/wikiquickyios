//
//  LoginController.swift
//  WikiQuicky
//
//  Created by Shakhzod Bobokhonov on 4/15/21.
//

import UIKit

class LoginController: UIViewController {
    
    let placeholders = ["Enter login", "password"]
    
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

        self.navigationController?.navigationBar.prefersLargeTitles = false
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(tableView)
        self.view.addSubview(confirmButton)
        
        self.tableView.delegate   = self
        self.tableView.dataSource = self
        
        
        self.hideKeyboardWhenTappedAround()

        self.registerCell()
        self.addConstraints()
        
        self.confirmButton.addTarget(self, action: #selector(openConfirmVC), for: .touchUpInside)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func registerCell () {
     self.tableView.register(LoginTableViewCell.self, forCellReuseIdentifier: "LoginTableViewCell")
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
extension LoginController : UITableViewDataSource{
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "LoginTableViewCell") as! LoginTableViewCell
        cell.configureCell(placeholders: placeholders)
        cell.signButton.addTarget(self, action: #selector(openLoginVC), for: .touchUpInside)
        cell.selectionStyle = .none
        return cell
    }
    
    
    
}

// MARK: = UITableViewDelegate
extension LoginController : UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height
   
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}


//MARK: = Actions
extension LoginController {
    
    @objc func openLoginVC(){
        let vc = LoginController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func openConfirmVC(){
        let vc = ConfirmPhoneNumberController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}

