//
//  PostViewController.swift
//  Parrot
//
//  Created by administrador on 26/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import UIKit
import SVProgressHUD

class PostViewController: UIViewController {
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userPostTextView: UITextView!
    @IBOutlet weak var postsTableView: UITableView!
    @IBOutlet weak var userPostView: UITextView!
    
    var authService: AuthService!
    var service: PostService!
    var posts: [PostView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.authService = AuthService(delegate: self)
        self.service = PostService(delegate: self)
        
        self.userPostView.layer.cornerRadius = 10
        self.setupLogoutButton()
        
        self.postsTableView.delegate = self
        self.postsTableView.dataSource = self
        
        self.postsTableView.register(cellType: PostTableViewCell.self)
        self.postsTableView.estimatedRowHeight = 500
        
        self.loadData()
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
    
    func loadData(){
        SVProgressHUD.setDefaultStyle(.dark)
        SVProgressHUD.show()
        self.service.getPosts(page: 1)
    }
    
    func setTextFieldPlaceholder() {
        self.userPostTextView.text = L10n.Common.feeling
        self.userPostTextView.textColor = UIColor.lightGray
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

extension PostViewController: PostServiceDelegate {
    func postServiceSuccess() {
        self.posts = PostViewModel.getPosts()
        self.postsTableView.reloadData()
        SVProgressHUD.dismiss()
    }
    
    func postServiceFailure(error: String) {
        print(error)
        SVProgressHUD.dismiss()
    }
}

extension PostViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as PostTableViewCell
        cell.bind(post: self.posts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
