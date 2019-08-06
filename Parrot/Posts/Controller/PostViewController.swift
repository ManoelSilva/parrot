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
        self.userPostView.delegate = self
        
        self.userImageView.image = Asset.defaultUser.image
        self.userPostView.layer.cornerRadius = 10
        self.setupPostTableView()
        self.setupLogoutButton()
        self.setTextFieldPlaceholder()
    }
    
    func setupLogoutButton() {
        if SessionControl.isSessionActive {
            let button = UIBarButtonItem.init(title: L10n.Common.logout, style: .done, target: self, action: #selector(PostViewController.logout))
            self.navigationItem.rightBarButtonItem = button
        }
    }
    
    func setupPostTableView() {
        self.postsTableView.delegate = self
        self.postsTableView.dataSource = self
        
        self.postsTableView.register(cellType: PostTableViewCell.self)
        self.postsTableView.estimatedRowHeight = 500
        
        self.loadTableViewData()
    }
    
    func setTextFieldPlaceholder() {
        self.userPostTextView.text = L10n.Common.feeling
        self.userPostTextView.textColor = UIColor.lightGray
    }
    
    func loadTableViewData(){
        SVProgressHUD.setDefaultStyle(.dark)
        SVProgressHUD.show()
        self.service.getPosts(page: 1)
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
        cell.bind(post: self.posts[indexPath.row], delegate: self)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension PostViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            self.setTextFieldPlaceholder()
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
            self.service.postCreateNewPost(post: self.userPostView.text)
            self.setTextFieldPlaceholder()
        }
        return true
    }
}

extension PostViewController: PostTableViewCellDelegate {
    func tapedDots(post: PostView!) {
        let postOptionsController = UIAlertController(title: L10n.Common.post, message: nil, preferredStyle: .actionSheet)
        
        let editAction = UIAlertAction(title: L10n.Common.edit, style: .default, handler: nil)
        let deleteAction = UIAlertAction(title: L10n.Common.delete, style: .default){ (action) in
            self.service.deletePost(post: post)
        }
        let cancelAction = UIAlertAction(title: L10n.Common.logout, style: .default, handler: nil)
//        {(action) in
//            print("The User Will Be Taken To the Settings")
//            let goToSettings = URL(string: UIApplication.openSettingsURLString)
//            UIApplication.shared.open(goToSettings!)
//        }
        postOptionsController.addAction(editAction)
        postOptionsController.addAction(deleteAction)
        postOptionsController.addAction(cancelAction)
        
        self.present(postOptionsController, animated: true, completion: nil)
    }
    
    func tapedLike(post: PostView!) {
        
    }
}
