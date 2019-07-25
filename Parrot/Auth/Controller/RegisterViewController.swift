//
//  RegisterViewController.swift
//  Parrot
//
//  Created by administrador on 25/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    var service: AuthService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.service = AuthService.init(delegate: self)
        nextButton.layer.cornerRadius = 5
    }
    
    @IBAction func registerButton(_ sender: Any) {
        if let name = self.nameTextField.text, let userName = self.userNameTextField.text, let email = self.emailTextField.text, let password = self.passwordTextField.text, !name.isEmpty && !userName.isEmpty && !email.isEmpty && !password.isEmpty {
            self.service.postRegister(name: name, userName: userName, email: email, password: password)
        }
    }
}

extension RegisterViewController: AuthServiceDelegate {
    func success() {
        self.dismiss(animated: true) {
            ScreenManager.setUpInitViewController()
        }
    }
    
    func failure(error: String) {
        print(error)
    }
}
