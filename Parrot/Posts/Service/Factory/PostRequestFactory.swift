//
//  PostRequestFactory.swift
//  Parrot
//
//  Created by administrador on 26/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import Foundation
import Alamofire

class PostRequestFactory {
    static func postCreateNewPost(post: String) -> DataRequest {
        return Alamofire.request(baseUrl + "/postagem", method: .post, parameters: ["mensagem": post], encoding: JSONEncoding.default, headers: SessionControl.headers)
    }
    
    static func putUpdatePost(post: Post) -> DataRequest {
        let id = String(post.id.value ?? 0)
        return Alamofire.request(baseUrl + "/postagem/" + id, method: .put, parameters: post.toJSON(), encoding: JSONEncoding.default, headers: SessionControl.headers)
    }
    
    static func getPosts(page: Int) -> DataRequest {
        return Alamofire.request(baseUrl + "/postagem?pagina=" + String(page), method: .get, headers: SessionControl.headers)
    }
    
    static func deletePost(id: Int) -> DataRequest {
        let id = String(id)
        return Alamofire.request(baseUrl + "/postagem/" + id, method: .delete, encoding: JSONEncoding.default, headers: SessionControl.headers)
    }
 }
