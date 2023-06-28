//
//  SwitchTableViewCell.swift
//  Simpleswap
//
//  Created by apple on 14.06.2023.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {
    var switchValueChangeHandler: ((Bool) -> Void)?
    private let switchView: UISwitch = LabelFactorySwitchCell.createSwitch()
    internal let nameLabel: UILabel = LabelFactorySwitchCell.createNameLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupContraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
private extension SwitchTableViewCell {
    func setupView() {
        switchView.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        contentView.addSubview(switchView)
        contentView.addSubview(nameLabel)
    }
    func setupContraints() {
        LayoutContraintsSwitchCell.activateContraintsForSwitchCell(for: self,
                                                                   nameLabel: nameLabel,
                                                                   switchView: switchView)
    }
}
private extension SwitchTableViewCell {
    @objc func switchValueChanged(_ sender: UISwitch) {
        switchValueChangeHandler?(sender.isOn)
    }
}
