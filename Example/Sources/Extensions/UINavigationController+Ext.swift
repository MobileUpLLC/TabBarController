//
//  UINavigationController+Ext.swift
//  Example
//
//  Created by Nikolai Timonin on 03.04.2023.
//

import UIKit

extension UINavigationController: FloatingTabBarItemProvider {
    var floatingTabBarItem: UIImage {
        get { rootController?.floatingTabBarItem ?? UIImage() }
        set { rootController?.floatingTabBarItem = newValue }
    }
               
    private var rootController: FloatingTabBarItemProvider? {
        return viewControllers.first as? FloatingTabBarItemProvider
    }
}
