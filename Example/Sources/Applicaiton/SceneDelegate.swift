//
//  SceneDelegate.swift
//  Example
//
//  Created by Nikolai Timonin on 03.04.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }
        
        window = UIWindow(windowScene: windowScene)
        
        let lhs = TableController()
        if let floatingTabBarItem = UIImage(systemName: "square.and.arrow.up") {
            lhs.floatingTabBarItem = floatingTabBarItem
        }

        lhs.item = -13
        let lhsNav = UINavigationController(rootViewController: lhs)
        
        let rhs = TableController()
        if let floatingTabBarItem = UIImage(systemName: "square.and.arrow.up.circle") {
            rhs.floatingTabBarItem = floatingTabBarItem
        }
        rhs.item = -111
        let rhsNav = UINavigationController(rootViewController: rhs)
        
        window?.rootViewController = FloatingTabBarController(controllers: [lhsNav, rhsNav])
        window?.makeKeyAndVisible()
    }
}
