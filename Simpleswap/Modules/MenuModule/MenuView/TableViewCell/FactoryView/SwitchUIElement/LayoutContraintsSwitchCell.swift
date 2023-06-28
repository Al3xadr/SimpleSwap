//
//  LayoutContraintsSwitchCell.swift
//  Simpleswap
//
//  Created by apple on 28.06.2023.
//

import UIKit

class LayoutContraintsSwitchCell {
    static func activateContraintsForSwitchCell(for switchTableViewCell: SwitchTableViewCell,
                                                 nameLabel: UILabel,
                                                 switchView: UISwitch) {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: switchTableViewCell.leadingAnchor, constant: 16),
            nameLabel.centerYAnchor.constraint(equalTo: switchTableViewCell.centerYAnchor)
        ])
        NSLayoutConstraint.activate([
            switchView.trailingAnchor.constraint(equalTo: switchTableViewCell.trailingAnchor, constant: -16),
            switchView.centerYAnchor.constraint(equalTo: switchTableViewCell.centerYAnchor)
        ])
     }}
