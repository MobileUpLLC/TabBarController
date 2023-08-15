//
//  UIViewController+Parent.swift
//  
//
//  Created by Nikolai Timonin on 03.04.2023.
//

import UIKit

public extension UIViewController {
    func findParent<T: UIViewController>(type: T.Type) -> T? {
        if let controller = self as? T {
            return controller
        }
        
        return parent?.findParent(type: type)
    }
}
