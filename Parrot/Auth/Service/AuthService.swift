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
                    if let user = response.result.value {
                        if let token = response.response?.allHeaderFields["token"] as? String {
                            user.token = token
                            UserViewModel.save(user: user)
                            SessionControl.setHeaders()
                        }
                    }
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
                    if let user = response.result.value {
                        if let token = response.response?.allHeaderFields["token"] as? String {
                            user.token = token
                            UserViewModel.save(user: user)
                            SessionControl.setHeaders()
                        }
                    }
                    self.delegate.success()
                case .failure(let error):
                    self.delegate.failure(error: error.localizedDescription)
            }
        }
    }
    
    func deleteLogout() {
        AuthRequestFactory.deleteLogout().validate().responseObject { (response: DataResponse<User>) in
            switch response.result {
                case .success:
                    UserViewModel.delete()
                    self.delegate.success()
                case .failure(let error):
                    UserViewModel.delete()
                    self.delegate.failure(error: error.localizedDescription)
            }
        }
    }
}
