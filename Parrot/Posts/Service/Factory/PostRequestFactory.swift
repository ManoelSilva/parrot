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
    static func postCreateNewPost(message: String) -> DataRequest {
        return Alamofire.request(baseUrl + "/postagem", method: .post, parameters: ["postagem": message], encoding: JSONEncoding.default, headers: SessionControl.headers)
    }
    
    static func getPosts(pagination: String) -> DataRequest {
        return Alamofire.request(baseUrl + "/postagem?pagina=" + pagination, method: .get, headers: SessionControl.headers)
    }
 }
