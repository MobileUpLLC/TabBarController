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
        lhs.floatingTabBarItem = UIImage(systemName: "basketball.fill") ?? UIImage()
        lhs.title = "Left Root"
        let lhsNav = UINavigationController(rootViewController: lhs)

        let rhs = TableController()
        rhs.floatingTabBarItem = UIImage(systemName: "volleyball.fill") ?? UIImage()
        rhs.title = "Right Root"
        let rhsNav = UINavigationController(rootViewController: rhs)

        window?.rootViewController = FloatingTabBarController(controllers: [lhsNav, rhsNav])
        window?.makeKeyAndVisible()
    }
}
