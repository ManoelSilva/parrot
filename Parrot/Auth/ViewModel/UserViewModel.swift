//
//  UserViewModel.swift
//  Parrot
//
//  Created by administrador on 24/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import Foundation
import RealmSwift

struct UserView {
    var email = ""
}

class UserViewModel {
    static func save(user: User) {
        try? uiRealm.write {
            uiRealm.add(user, update: .all)
        }
    }
    
    static func delete() {
        
        try? uiRealm.write {
            uiRealm.deleteAll()
        }
//        if let result = uiRealm.objects(User.self).first {
//            try? uiRealm.write {
//                uiRealm.delete(result)
//            }
//        }
    }
}
