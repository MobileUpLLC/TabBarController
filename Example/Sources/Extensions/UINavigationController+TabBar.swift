//
//  UINavigationController+Ext.swift
//  Example
//
//  Created by Nikolai Timonin on 03.04.2023.
//

import UIKit

extension UINavigationController: FloatingTabBarItemProvider {
    var floatingTabBarItem: UIImage {
        rootController?.floatingTabBarItem ?? UIImage()
    }

    private var rootController: FloatingTabBarItemProvider? {
        return viewControllers.first as? FloatingTabBarItemProvider
    }
}
