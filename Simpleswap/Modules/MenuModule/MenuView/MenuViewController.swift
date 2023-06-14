//
//  MenuViewController.swift
//  Simpleswap
//
//  Created by apple on 14.06.2023.
//

import UIKit

final class MenuViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        return tableView
    }()
    
    private lazy var dataSource: UITableViewDiffableDataSource<SectionMenu, MenuModel> = {
        let dataSource = UITableViewDiffableDataSource<SectionMenu, MenuModel>(tableView: tableView) { (tableView, indexPath, item) -> UITableViewCell? in
            if indexPath.section == 1 {
                let switchCell = tableView.dequeueReusableCell(withIdentifier: "SwitchCell", for: indexPath) as? SwitchTableViewCell
                switchCell?.textLabel?.text = item.name
                switchCell?.switchValueChangeHandler = { [weak self] newValue in
                    print("Switch value changed: \(newValue)")
                }
                return switchCell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath)
                cell.textLabel?.text = item.name
                return cell
            }
        }
        return dataSource
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        setupConstraints()
        configureDataSource()
    }
    
    private func setupView() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func configureDataSource() {
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: "MenuCell")
        tableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: "SwitchCell")
        
        var snapshot = NSDiffableDataSourceSnapshot<SectionMenu, MenuModel>()
        snapshot.appendSections([.main, .switchSection])
        
        let menuItems: [MenuModel] = [
            MenuModel(name: "Language")
        ]
        let switchItem: [MenuModel] = [
            MenuModel(name: "Dark Mode")
        ]
        
        snapshot.appendItems(menuItems, toSection: .main)
        snapshot.appendItems(switchItem, toSection: .switchSection)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 44))
            headerView.backgroundColor = .white
            
            let titleLabel = UILabel()
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
            titleLabel.textColor = .lightGray
            titleLabel.text = "Settings"
            
            headerView.addSubview(titleLabel)
            
            NSLayoutConstraint.activate([
                titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
                titleLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
                titleLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 8),
                titleLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -8)
            ])
            
            return headerView
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 44
        } else {
            return 15
        }
    }
}
