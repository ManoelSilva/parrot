//
//  PostViewController.swift
//  Parrot
//
//  Created by administrador on 26/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userPostTextView: UITextView!
    @IBOutlet weak var postsTableView: UITableView!
    
    var authService: AuthService!
    var service: PostService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.authService = AuthService(delegate: self)
        self.userPostTextView.layer.cornerRadius = 10
        self.setupLogoutButton()
    }
    
    func setupLogoutButton() {
        if SessionControl.isSessionActive {
            let button = UIBarButtonItem.init(title: L10n.Common.logout, style: .done, target: self, action: #selector(PostViewController.logout))
            self.navigationItem.rightBarButtonItem = button
        }
    }
    
    @objc func logout() {
        self.authService.deleteLogout()
    }
}

extension PostViewController: AuthServiceDelegate {
    func success() {
        ScreenManager.setUpInitViewController()
    }
    
    func failure(error: String) {
        print(error)
        ScreenManager.setUpInitViewController()
    }
}
