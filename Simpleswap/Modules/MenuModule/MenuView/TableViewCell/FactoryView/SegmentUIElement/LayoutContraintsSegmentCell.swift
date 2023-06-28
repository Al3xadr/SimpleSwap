//
//  LayoutContraintsSegmentCell.swift
//  Simpleswap
//
//  Created by apple on 28.06.2023.
//

import UIKit

class LayoutContraintsSegmentCell {
    static func activateContraintsForSegmentCell(for segmentTableViewCell: SegmentTableViewCell,
                                                 nameLabel: UILabel,
                                                 languageSegmentedControl: UISegmentedControl) {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: segmentTableViewCell.contentView.leadingAnchor, constant: 16),
            nameLabel.centerYAnchor.constraint(equalTo: segmentTableViewCell.contentView.centerYAnchor)
        ])
        NSLayoutConstraint.activate([
            languageSegmentedControl.trailingAnchor.constraint(equalTo: segmentTableViewCell.contentView.trailingAnchor, constant: -16),
            languageSegmentedControl.centerYAnchor.constraint(equalTo: segmentTableViewCell.contentView.centerYAnchor)
        ])
    }
}
