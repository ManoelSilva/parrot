//
//  Post.swift
//  Parrot
//
//  Created by administrador on 26/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class Post: Object, Mappable {
    var id = RealmOptional<Int>()
    var likes = RealmOptional<Int>()
    
    @objc dynamic var user: User?
    @objc dynamic var post: String?
    @objc dynamic var message: String?
    @objc dynamic var image: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func mapping(map: Map) {
        self.id.value                       <- map["id"]
        self.user                           <- map["autor"]
        self.message                        <- map["mensagem"]
        self.likes.value                    <- map["curtidas"]
        self.post                           <- map["postagem"]
        self.image                          <- map["imagem"]
    }
}
