//
//  LayoutContraintsMenu.swift
//  Simpleswap
//
//  Created by apple on 28.06.2023.
//

import UIKit
class LayoutContraintsMenu {
    static func activateContraintsForSegmentCell(for menuViewController: MenuViewController,
                                                 sceneLabel: UILabel,
                                                 tableView: UITableView) {
        NSLayoutConstraint.activate([
            sceneLabel.centerXAnchor.constraint(equalTo: menuViewController.view.centerXAnchor),
            sceneLabel.topAnchor.constraint(equalTo: menuViewController.view.topAnchor, constant: 15),
            sceneLabel.widthAnchor.constraint(equalToConstant: 200),
            sceneLabel.heightAnchor.constraint(equalToConstant: 35)
        ])
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: menuViewController.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: menuViewController.view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: sceneLabel.safeAreaLayoutGuide.topAnchor, constant: 35),
            tableView.bottomAnchor.constraint(equalTo: menuViewController.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
