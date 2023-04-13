//
//  FloatingTabBarController.swift
//  Example
//
//  Created by Nikolai Timonin on 03.04.2023.
//

import TabBarController
import UIKit

protocol FloatingTabBarItemProvider: UIViewController {
    var floatingTabBarItem: UIImage { get set }
}

class FloatingTabBarController: TabBarController {
    override var controllers: [UIViewController] { tabControllers }
    override var tabBarView: UIView { floatingTabBarView }

    private lazy var floatingTabBarView: FloatingTabBarView = {
        let icons = tabControllers.map { $0.floatingTabBarItem }
        let view = FloatingTabBarView(icons: icons)
        view.onItemSelect = { [weak self] index in
            self?.selectedIndex = index
        }

        return view
    }()

    private let tabControllers: [FloatingTabBarItemProvider]

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
    }

    override func selectedIndexDidChange() {
        super.selectedIndexDidChange()

        floatingTabBarView.selectedIndex = selectedIndex
    }

    override func setupTabBarView() {
        super.setupTabBarView()

        view.addSubview(floatingTabBarView)
        floatingTabBarView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(32)
            make.centerX.equalToSuperview()
        }
    }

    init(controllers: [FloatingTabBarItemProvider]) {
        self.tabControllers = controllers

        super.init(nibName: nil, bundle: nil)
    }
}

extension UIViewController {
    var floatingTabBarController: FloatingTabBarController? {
        findParent(type: FloatingTabBarController.self)
    }
}
