//
//  TabBarController.swift
//
//
//  Created by Nikolai Timonin on 03.04.2023.
//

import UIKit

open class TabBarController: UIViewController {
    public var selectedIndex: Int = 0 {
        willSet { selectedIndexWillChange() }
        didSet { selectedIndexDidChange() }
    }
    
    open var controllers: [UIViewController] { [] }
    open var tabBarView: UIView { UIView() }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    @available(*, unavailable) required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
       
        selectedIndexDidChange()
    }
    
    open func setTabBarViewVisibility(isHidden: Bool) {
        tabBarView.isHidden = isHidden
    }
    
    open func selectedIndexWillChange() {
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
