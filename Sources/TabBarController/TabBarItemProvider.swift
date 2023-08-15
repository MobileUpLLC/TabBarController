//
//  TabBarItemProvider.swift
//  
//
//  Created by Nikolai Timonin on 03.04.2023.
//

import UIKit

public protocol TabBarItemProvider: UIViewController {
    associatedtype Item: Any
    
    var tabBarItemModel: Item { get }
}
