//
//  ViewController.swift
//  Treinamento-iOS
//
//  Created by Jobson Mateus on 12/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerLabel: UILabel!
    
    var service: AuthService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.service = AuthService(delegate: self)
        self.loginButton.layer.cornerRadius = 5
        self.setUpRegisterLabel()
        self.setUpNavigationButtons()
    }
    
    func setUpRegisterLabel() {
        self.registerLabel.isUserInteractionEnabled = true
        self.registerLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(LoginViewController.regiterLabelAction)))
    }
    
    func setUpNavigationButtons() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        if let email = loginTextField.text,
            let password = passwordTextField.text,
            !email.isEmpty && !password.isEmpty {
                self.service.postLogin(email: email, password: password)
        }
    }
    
    @objc func regiterLabelAction() {
        let registerViewController = StoryboardScene.Auth.registerViewController.instantiate()
        self.navigationController?.pushViewController(registerViewController, animated: true)
    }
}

extension LoginViewController: AuthServiceDelegate {
    func success() {
        ScreenManager.setUpInitViewController()
    }
    
    func failure(error: String) {
        print(error)
    }
}
