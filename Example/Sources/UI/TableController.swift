//
//  TableController.swift
//  Example
//
//  Created by Nikolai Timonin on 03.04.2023.
//

import UIKit
import SnapKit

class TableController: UIViewController, FloatingTabBarItemProvider {
    var floatingTabBarItem: UIImage = UIImage()
    
    lazy var tableView = UITableView()
    var dataSource: UITableViewDiffableDataSource<Int, Int>!
    
    let items = (0..<30).map { Int($0) }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutViews()
        setupTable()
        
        var snapshot = NSDiffableDataSourceSnapshot<Int, Int>()
        snapshot.appendSections([0])
        snapshot.appendItems(items)
        
        dataSource.apply(snapshot)
    }
    
    private func setupTable() {
        tableView.register(TableCell.self, forCellReuseIdentifier: "Cell")
        
        dataSource = UITableViewDiffableDataSource<Int, Int>(
            tableView: tableView,
            cellProvider: { (table, indexPath, item) in
                let cell = table.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableCell
                cell.label.text = "\(item)"
                
                return cell
            }
        )
    }
    
    private func layoutViews() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

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
