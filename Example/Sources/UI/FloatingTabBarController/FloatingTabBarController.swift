//
//  FloatingTabBarController.swift
//  Example
//
//  Created by Nikolai Timonin on 03.04.2023.
//

import TabBarController
import UIKit

protocol IconTabBarItemProvider: TabBarItemProvider where Item == UIImage {
    
}

class FloatingTabBarController: TabBarController {
    private lazy var tabBarView: FloatingTabBarView = {
        let icons = [
            UIImage(systemName: "square.and.arrow.up")!,
            UIImage(systemName: "square.and.arrow.up.circle")!,
            UIImage(systemName: "square.and.arrow.up.trianglebadge.exclamationmark")!,
            UIImage(systemName: "square.and.arrow.down")!,
        ]
        let view = FloatingTabBarView(icons: icons)
        
        return view
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
       
        view.addSubview(tabBarView)
        tabBarView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(32)
            make.centerX.equalToSuperview()
        }
    }
    
}
