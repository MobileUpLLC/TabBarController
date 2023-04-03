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

open class TabBarController: UIViewController {
    
    var selectedIndex: Int = 0 {
        didSet {
            
        }
    }
    
    public private(set) var controllers: [UIViewController]
    
    public init(controllers: [UIViewController]) {
        self.controllers = controllers
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setupTabBarView() {
    }
}
