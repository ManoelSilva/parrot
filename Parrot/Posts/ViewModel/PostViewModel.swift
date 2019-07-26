//
//  PostViewModel.swift
//  Parrot
//
//  Created by administrador on 26/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import Foundation

struct PostView {
    var user = 0
    var post = ""
    var message = ""
}

class PostViewModel {
    static func save(post: Post) {
        try? uiRealm.write {
            uiRealm.add(post, update: .all)
        }
    }
    
    static func delete() {
        if let result = uiRealm.objects(Post.self).first {
            try? uiRealm.write {
                uiRealm.delete(result)
            }
        }
    }
}
