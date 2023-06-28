//
//  LabelFactoryMenu.swift
//  Simpleswap
//
//  Created by apple on 28.06.2023.
//

import UIKit
class LabelFactoryMenu {
    static func createTabkeView() -> UITableView {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SegmentTableViewCell.self, forCellReuseIdentifier: "SegmentCell")
        tableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: "SwitchCell")
        return tableView
    }
    static func createSceneLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = HomeConstantsBestCell.nameLabel
        label.text = "Menu"
        label.textAlignment = .center
        return label
    }
}
