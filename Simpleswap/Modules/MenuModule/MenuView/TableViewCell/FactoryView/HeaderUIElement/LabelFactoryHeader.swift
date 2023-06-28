//
//  LabelFactoryHeader.swift
//  Simpleswap
//
//  Created by apple on 28.06.2023.
//

import UIKit
class LabelFactoryHeader {
    static func createTitleLabel () -> UILabel {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textColor = .lightGray
        titleLabel.text = "Settings"
        return titleLabel
    }
    static func createHeaderView(tableView: UITableView) -> UIView {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 44))
        headerView.backgroundColor = .white
        return headerView
    }
}
