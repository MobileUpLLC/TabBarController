//
//  FloatingTabBarController.swift
//  Example
//
//  Created by Nikolai Timonin on 03.04.2023.
//

import TabBarController
import UIKit

protocol FloatingTabBarItemProvider: UIViewController {
    var floatingTabBarItem: UIImage { get }
}

class FloatingTabBarController: TabBarController {
    override var controllers: [UIViewController] {
        tabControllers
    }
    
    private lazy var tabBarView: FloatingTabBarView = {
        let icons = tabControllers.map { $0.floatingTabBarItem }
        let view = FloatingTabBarView(icons: icons)
        view.onItemSelect = { [weak self] index in
            self?.selectedIndex = index
        }
        
        return view
    }()
    
    private let tabControllers: [FloatingTabBarItemProvider]
   
    init(controllers: [FloatingTabBarItemProvider]) {
        self.tabControllers = controllers
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
    
    override func selectedIndexDidChange() {
        super.selectedIndexDidChange()
        
        tabBarView.selectedIndex = selectedIndex
    }

    override func setupTabBarView() {
        super.setupTabBarView()
        
        view.addSubview(tabBarView)
        tabBarView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(32)
            make.centerX.equalToSuperview()
        }
    }
}
