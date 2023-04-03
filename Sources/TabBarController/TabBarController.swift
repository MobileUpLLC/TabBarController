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
    public var selectedIndex: Int = 0 {
        willSet {
            selectedIndexWillchange()
        }
        didSet {
            selectedIndexDidChange()
        }
    }
    
    open var controllers: [UIViewController] { [] }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    @available(*, unavailable) required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
       
        setupTabBarView()
        
        selectedIndexDidChange()
    }
    
    open func setupTabBarView() {
        
    }
    
    open func selectedIndexWillchange() {
        let controller = controllers[selectedIndex]
        
        controller.willMove(toParent: nil)
        controller.view.removeFromSuperview()
        controller.removeFromParent()
    }
    
    open func selectedIndexDidChange() {
        let controller = controllers[selectedIndex]
        
        addChild(controller)
        view.insertSubview(controller.view, at: 0)
        controller.view.frame = view.bounds
        controller.didMove(toParent: self)
    }
}
