//
//  AuthService.swift
//  Parrot
//
//  Created by administrador on 25/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

protocol AuthServiceDelegate {
    func success()
    func failure(error: String)
}

class AuthService {
    var delegate: AuthServiceDelegate!
    
    init(delegate: AuthServiceDelegate) {
        self.delegate = delegate
    }
    
    func postLogin(email: String, password: String) {
        AuthRequestFactory.postLogin(email: email, password: password).validate().responseObject { (response: DataResponse<User>) in
            switch response.result {
                case .success:
                    self.delegate.success()
                case .failure(let error):
                    self.delegate.failure(error: error.localizedDescription)
            }
        }
    }
    
    func postRegister(name: String, userName: String, email: String, password: String) {
        AuthRequestFactory.postRegister(name: name, userName: userName, email: email, password: password).validate().responseObject { (response: DataResponse<User>) in
            switch response.result {
                case .success:
                    self.delegate.success()
                case .failure(let error):
                    self.delegate.failure(error: error.localizedDescription)
            }
        }
    }
}
