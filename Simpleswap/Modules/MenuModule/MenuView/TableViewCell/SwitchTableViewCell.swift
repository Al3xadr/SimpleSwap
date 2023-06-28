//
//  SwitchTableViewCell.swift
//  Simpleswap
//
//  Created by apple on 14.06.2023.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {
    var switchValueChangeHandler: ((Bool) -> Void)?
    private let switchView = LabelFactoryForSwitchCell.createSwitchView()
    internal let nameLabel = LabelFactoryForSwitchCell.createNameLabel()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func switchValueChanged(_ sender: UISwitch) {
        switchValueChangeHandler?(sender.isOn)
    }
}
private extension SwitchTableViewCell {
    func setupView() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(switchView)
    }
    func setupContraints() {
        LayoutContraintsSwitchCell.activateConstraintsForSwitchCell(for: self, nameLabel: nameLabel, switchView: switchView)
    }
}
