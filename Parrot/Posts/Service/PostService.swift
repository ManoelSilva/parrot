//
//  PostService.swift
//  Parrot
//
//  Created by administrador on 26/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

protocol PostServiceDelegate {
    func postServiceSuccess()
    func postServiceFailure(error: String)
}

class PostService {
    var delegate: PostServiceDelegate!
    
    init(delegate: PostServiceDelegate) {
        self.delegate = delegate
    }
    
    func getPosts(page: Int) {
        PostRequestFactory.getPosts(page: page).validate()
            .responseArray { (response: DataResponse<[Post]>) in
                switch response.result {
                    case .success:
                        if let posts = response.result.value {
                            PostViewModel.saveAll(posts: posts)
                        }
                        self.delegate.postServiceSuccess()
                    case .failure(let error):
                        self.delegate.postServiceFailure(error: error.localizedDescription)
                }
        }
    }
    
    func postCreateNewPost(post: String) {
        PostRequestFactory.postCreateNewPost(post: post).validate()
            .responseObject { (response: DataResponse<Post>) in
                switch response.result {
                    case .success:
                        if let post = response.result.value {
                            PostViewModel.save(post: post)
                        }
                        self.delegate.postServiceSuccess()
                    case .failure(let error):
                        self.delegate.postServiceFailure(error: error.localizedDescription)
                }
        }
    }
    
    func putUpdatePost(post: Post) {
        PostRequestFactory.putUpdatePost(post: post).validate()
            .responseObject { (response: DataResponse<Post>) in
                switch response.result {
                    case .success:
                        if let post = response.result.value {
                            PostViewModel.update(post: post)
                        }
                        self.delegate.postServiceSuccess()
                    case .failure(let error):
                        self.delegate.postServiceFailure(error: error.localizedDescription)
                }
        }
    }
    
    func deletePost(post: Post) {
        PostRequestFactory.deletePost(post: post).validate()
            .responseObject { (response: DataResponse<Post>) in
                switch response.result {
                    case .success:
                        if let post = response.result.value {
                            PostViewModel.delete(post: post)
                        }
                        self.delegate.postServiceSuccess()
                    case .failure(let error):
                        self.delegate.postServiceFailure(error: error.localizedDescription)
                }
        }
    }
}
