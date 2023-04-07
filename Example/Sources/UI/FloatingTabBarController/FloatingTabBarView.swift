//
//  FloatingTabBarView.swift
//  Example
//
//  Created by Nikolai Timonin on 03.04.2023.
//

import UIKit
import Utils

class FloatingTabBarView: ItemsStackView<UIImage, UIImageView> {
    var onItemSelect: Closure.Int?
    
    var selectedIndex: Int = 0 {
        didSet { indexDidChange() }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = bounds.height / 2
    }
    
    init(icons: [UIImage]) {
        super.init(
            axis: .horizontal,
            distribution: .fill,
            alignment: .fill,
            spacing: 34,
            edgeInsets: .init(top: 20, left: 35, bottom: 20, right: 35),
            items: icons
        ) { image in
            let view = UIImageView(image: image.withRenderingMode(.alwaysTemplate))
            view.contentMode = .scaleAspectFit
            view.snp.makeConstraints { make in
                make.size.equalTo(18)
            }
            
            return view
        }
        
        innerStack.arrangedSubviews.forEach { view in
            view.isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.itemTapped(sender:)))
            view.addGestureRecognizer(tapGesture)
        }
        
        backgroundColor = .darkGray.withAlphaComponent(0.8)
        indexDidChange()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(fromCodeWithFrame frame: CGRect) {
        fatalError("init(fromCodeWithFrame:) has not been implemented")
    }
    
    private func indexDidChange() {
        innerStack.arrangedSubviews.enumerated().forEach { index, view in
            view.tintColor = (index == selectedIndex) ? .white : .lightGray
        }
    }
    
    @objc private func itemTapped(sender: UITapGestureRecognizer) {
        let index = innerStack.arrangedSubviews.firstIndex { view in
            view === sender.view
        }
        
        guard let index else {
            return
        }
        
        selectedIndex = index
        onItemSelect?(index)
    }
}
