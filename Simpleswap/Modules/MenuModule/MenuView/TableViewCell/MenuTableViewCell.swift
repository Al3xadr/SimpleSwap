//
//  MenuTableViewCell.swift
//  Simpleswap
//
//  Created by apple on 14.06.2023.
//

import UIKit
class MenuTableViewCell: UITableViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = HomeConstantsBestCell.nameLabel
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupContraints()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension MenuTableViewCell {
    func setupView() {
        contentView.addSubview(nameLabel)
    }
    func setupContraints() {
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
