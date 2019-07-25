//
//  AuthRequestFactory.swift
//  
//
//  Created by administrador on 25/07/19.
//

import Foundation
import Alamofire

class AuthRequestFactory {
    static func postLogin(email: String, password: String) -> DataRequest {
        return Alamofire.request(baseUrl + "/usuario/login", method: .post, parameters: ["email" : email, "password" : password], encoding: JSONEncoding.default)
    }
}
