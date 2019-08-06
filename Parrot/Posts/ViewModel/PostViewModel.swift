//
//  PostViewModel.swift
//  Parrot
//
//  Created by administrador on 26/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import Foundation
import RealmSwift

struct PostView {
    var id = 0
    var likes = 0
    var user = User()
    var message = ""
}

class PostViewModel {
    static func save(post: Post) {
        try? uiRealm.write {
            uiRealm.add(post, update: .all)
        }
    }
    
    static func saveAll(posts: [Post]) {
        try? uiRealm.write {
            uiRealm.add(posts, update: .all)
        }
    }
    
    static func update(post: Post) {
        try? uiRealm.write {
            uiRealm.add(post, update: .modified)
        }
    }
    
    static func delete(post: Post) {
        if let post = uiRealm.object(ofType: Post.self, forPrimaryKey: post.id) {
            try? uiRealm.write {
                uiRealm.delete(post)
            }
        }
    }
    
    static func deleteAll() {
        let results = uiRealm.objects(Post.self)
        
        try? uiRealm.write {
            uiRealm.delete(results)
        }
    }

    static func get() -> [Post] {
        let results = uiRealm.objects(Post.self)
        
        var posts: [Post] = []
        posts.append(contentsOf: results)
        
        return posts
    }
    
    static func getPosts() -> [PostView] {
        return self.getAsView(posts: self.get())
    }
    
    static func getAsView(post: Post?) -> PostView {
        guard let post = post else {
            return PostView()
        }
        
        var postView = PostView()
        postView.id = post.id.value ?? 0
        postView.likes = post.likes.value ?? 0
        postView.user = post.user ?? User()
        postView.message = post.message ?? ""
        return postView
    }
    
    static func getAsView(posts: [Post]) -> [PostView] {
        var postView: [PostView] = []

        posts.forEach { (post) in
            postView.append(self.getAsView(post: post))
        }
        return postView
    }
    
    static func getAsModel(postView: PostView) -> Post {
        let post = Post()
        post.user = postView.user
        post.id.value = postView.id
        post.message = postView.message
        
        return post
    }
}
