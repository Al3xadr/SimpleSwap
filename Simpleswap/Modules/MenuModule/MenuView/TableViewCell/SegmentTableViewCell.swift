//
//  MenuTableViewCell.swift
//  Simpleswap
//
//  Created by apple on 14.06.2023.
//

import UIKit
class SegmentTableViewCell: UITableViewCell {
    private let languageSegmentedControl =  LabelFactoryForSegmentCell.createLanguageSegmentedControl()
    internal let nameLabel = LabelFactoryForSegmentCell.createNameLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
        setupLanguageSegmentedControl()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(languageSegmentedControl)
    }

    func setupConstraints() {
        LayoutContraintsSegmentCell.activateConstraintsForSegmentCell(for: self, languageSegmentedControl: languageSegmentedControl, nameLabel: nameLabel)
    }

    func setupLanguageSegmentedControl() {
        languageSegmentedControl.addTarget(self, action: #selector(languageSegmentedControlValueChanged), for: .valueChanged)
        // Добавьте ограничения для `languageSegmentedControl`
    }

    @objc func languageSegmentedControlValueChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("rus")
            break
        case 1:
            print("eng")
            break
        default:
            break
        }
    }
}
