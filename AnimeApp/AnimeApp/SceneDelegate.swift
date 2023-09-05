//
//  SceneDelegate.swift
//  AnimeApp
//
//  Created by user on 29/08/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      
        guard let windowScene = (scene as? UIWindowScene) else {return}
            window = UIWindow(windowScene: windowScene)
        let navigation = UINavigationController(rootViewController: AnimesViewController())
            window?.rootViewController = navigation	
            window?.makeKeyAndVisible()
        }
    }



