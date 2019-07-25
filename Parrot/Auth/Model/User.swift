//
//  User.swift
//  Parrot
//
//  Created by administrador on 24/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class User: Object, Mappable {
    var id = RealmOptional<Int>()
    
    @objc dynamic var token: String?
    @objc dynamic var name: String?
    @objc dynamic var userName: String?
    @objc dynamic var email: String?
    @objc dynamic var photo: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func mapping(map: Map) {
        self.id.value                       <- map["id"]
        self.name                           <- map["nome"]
        self.email                          <- map["email"]
        self.userName                       <- map["username"]
        self.photo                          <- map["foto"]
    }
}
