//
//  TableCell.swift
//  Example
//
//  Created by Nikolai Timonin on 03.04.2023.
//

import UIKit

class TableCell: UITableViewCell {
    let label = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        contentView.backgroundColor = .lightGray.withAlphaComponent(0.2)
        
        contentView.addSubview(label)
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
