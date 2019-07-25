//
//  ScreenManager.swift
//  Parrot
//
//  Created by administrador on 25/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import Foundation
import UIKit

class ScreenManager {
    static func setUpInitViewController() {
        if SessionControl.isSessionActive {
//            UIApplication.shared.keyWindow?.rootViewController = UINavigationController(rootViewController: StoryboardScene.Contatos.contatosViewController.instantiate())
            print("Session Active")
        } else {
            UIApplication.shared.keyWindow?.rootViewController = StoryboardScene.Auth.loginViewController.instantiate()
        }
    }
}
