//
//  MenuViewController.swift
//  Simpleswap
//
//  Created by apple on 14.06.2023.
//

import UIKit

final class MenuViewController: UIViewController {
    private lazy var tableView: UITableView = LabelFactoryMenu.createTabkeView()
    private let sceneLabel: UILabel = LabelFactoryMenu.createSceneLabel()
    
    private lazy var dataSource: UITableViewDiffableDataSource<SectionMenu, MenuModel> = {
        let dataSource =
        UITableViewDiffableDataSource<SectionMenu, MenuModel>(tableView: tableView) { (tableView, indexPath, item)
            -> UITableViewCell? in
            switch indexPath.section {
            case 0:
                let segmentCell = tableView.dequeueReusableCell(withIdentifier: "SegmentCell", for: indexPath)
                as? SegmentTableViewCell
                segmentCell?.nameLabel.text = item.name
                return segmentCell
            case 1:
                let switchCell = tableView.dequeueReusableCell(withIdentifier: "SwitchCell", for: indexPath)
                as? SwitchTableViewCell
                switchCell?.nameLabel.text = item.name
                switchCell?.switchValueChangeHandler = { [weak self] newValue in
                    print("Switch value changed: \(newValue)") }
                return switchCell
            default:
                return UITableViewCell()
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
}
private extension MenuViewController {
    func setupView() {
        tableView.delegate = self
        view.addSubview(tableView)
        view.addSubview(sceneLabel)
    }
    func setupConstraints() {
        LayoutContraintsMenu.activateContraintsForSegmentCell(for: self, sceneLabel: sceneLabel, tableView: tableView)
    }
}
private extension MenuViewController {
    private func configureDataSource() {
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
            let headerView: UIView = LabelFactoryHeader.createHeaderView(tableView: tableView)
            
            let titleLabel: UILabel = LabelFactoryHeader.createTitleLabel()
            headerView.addSubview(titleLabel)
            let constraints = LayoutContraintsHeader.createConstraints(for: titleLabel, in: headerView)
            NSLayoutConstraint.activate(constraints)
            
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
