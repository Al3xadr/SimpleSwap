//
//  SwitchTableViewCell.swift
//  Simpleswap
//
//  Created by apple on 14.06.2023.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {
    var switchValueChangeHandler: ((Bool) -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let switchView = UISwitch()
        switchView.translatesAutoresizingMaskIntoConstraints = false
        switchView.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        
        contentView.addSubview(switchView)
        accessoryView = UIView()

        NSLayoutConstraint.activate([
            switchView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            switchView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func switchValueChanged(_ sender: UISwitch) {
        switchValueChangeHandler?(sender.isOn)
    }
}
