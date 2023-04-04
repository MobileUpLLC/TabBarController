//
//  Sandbox.swift
//  
//
//  Created by Nikolai Timonin on 03.04.2023.
//

import UIKit

public protocol TabBarItemProvider: UIViewController {
    associatedtype Item: Any
    
    var tabBarItemModel: Item { get }
}

// вьюшка настраивается не с теми айтемами, которые выдает контроллер
public protocol TabBarView {
    associatedtype TabBarItem: Any
    
    var items: [TabBarItem] { get set }
}
