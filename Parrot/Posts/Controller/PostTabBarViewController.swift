//
//  PostTabBarViewController.swift
//  Parrot
//
//  Created by MANOEL PEREIRA DA SILVA on 26/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import UIKit

class PostTabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let postController = StoryboardScene.Posts.postViewController.instantiate()
//        postController.tabBarItem.image = Asset.tabBarHouse.image
        self.viewControllers = [postController]
    }
}
