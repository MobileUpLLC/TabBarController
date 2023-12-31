//
//  TableController.swift
//  Example
//
//  Created by Nikolai Timonin on 03.04.2023.
//

import UIKit
import SnapKit

class TableController: UIViewController, FloatingTabBarItemProvider {
    var floatingTabBarItem = UIImage()

    private lazy var tableView = UITableView()
    private var dataSource: UITableViewDiffableDataSource<Int, Int>?
    private let items = (0..<30).map { Int($0) }

    override func viewDidLoad() {
        super.viewDidLoad()

        layoutViews()
        setupTable()
        setupNavigationBar()
        setItems()
    }

    private func setItems() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, Int>()
        snapshot.appendSections([0])
        snapshot.appendItems(items)

        dataSource?.apply(snapshot)
    }

    private func setupTable() {
        tableView.register(TableCell.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.contentInset.bottom = 70

        dataSource = UITableViewDiffableDataSource<Int, Int>(
            tableView: tableView,
            cellProvider: { table, indexPath, item in
                let cell = table.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableCell
                cell?.label.text = "\(item)"

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

    private func setupNavigationBar() {
        let isTabBarHidden = floatingTabBarController?.tabBarView.isHidden ?? false
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: isTabBarHidden ? "Show" : "Hide",
            style: .plain,
            target: self,
            action: #selector(rightNavBarButtonTapped)
        )
    }

    @objc private func rightNavBarButtonTapped() {
        let isHidden = floatingTabBarController?.tabBarView.isHidden ?? false
        floatingTabBarController?.setTabBarViewVisibility(isHidden: !isHidden)
        setupNavigationBar()
    }
}

extension TableController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = TableController()
        controller.title = "\(items[indexPath.row])"

        navigationController?.pushViewController(controller, animated: true)
    }
}
