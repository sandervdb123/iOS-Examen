//
//  SceneDelegate.swift
//  iOS-Examen
//
//  Created by Sander Vdb on 12/01/2021.
//  Copyright © 2021 Sander Vdb. All rights reserved.
//

import UIKit
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = scene as? UIWindowScene else { return }
        let window = UIWindow(windowScene: windowScene)
        
        //window.rootViewController = nav
        window.rootViewController = TabBarVC()
        self.window = window
        window.makeKeyAndVisible()
    }

}

