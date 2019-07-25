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
}
