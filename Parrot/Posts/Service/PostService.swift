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
    func success()
    func failure(error: String)
}

class PostService {
    var delegate: PostServiceDelegate!
    
    init(delegate: PostServiceDelegate) {
        self.delegate = delegate
    }
    
//    func getPost() {
//        ContatosRequestFactory.getContatos().validate().responseArray { (response: DataResponse<[Contato]>) in
//            switch response.result {
//                case .success:
//                    if let contatos = response.result.value {
//                        ContatoViewModel.saveAll(objects: contatos, clear: true)
//                    }
//                    self.delegate.success()
//                case .failure(let error):
//                    self.delegate.failure(error: error.localizedDescription)
//            }
//        }
//    }
//
//    func postPost(contatoView: ContatoView) {
//        let contato = ContatoViewModel.getAsModel(contatoView: contatoView)
//        ContatosRequestFactory.postContato(contato: contato).validate().responseObject { (response: DataResponse<Contato>) in
//            switch response.result {
//                case .success:
//
//                    if let contato = response.result.value {
//                        ContatoViewModel.saveAll(objects: [contato])
//                    }
//                    self.delegate.success()
//
//                case .failure(let error):
//
//                    self.delegate.failure(error: error.localizedDescription)
//            }
//        }
//    }
}
