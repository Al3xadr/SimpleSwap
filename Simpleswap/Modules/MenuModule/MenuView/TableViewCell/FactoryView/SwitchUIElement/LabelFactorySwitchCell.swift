//
//  LabelFactorySwitchCell.swift
//  Simpleswap
//
//  Created by apple on 28.06.2023.
//

import UIKit

class LabelFactorySwitchCell {
    static func createNameLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    static func createSwitch() -> UISwitch {
        let switchView = UISwitch()
        switchView.translatesAutoresizingMaskIntoConstraints = false
        return switchView
    }
}
