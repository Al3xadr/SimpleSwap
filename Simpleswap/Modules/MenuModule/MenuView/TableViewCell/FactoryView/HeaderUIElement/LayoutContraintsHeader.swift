//
//  LayoutContraintsHeader.swift
//  Simpleswap
//
//  Created by apple on 28.06.2023.
//

import UIKit

class LayoutContraintsHeader {
    static func createConstraints(for titleLabel: UILabel, in headerView: UIView) -> [NSLayoutConstraint] {
        let constraints = [
            titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -8)
        ]
        return constraints
    }
}
