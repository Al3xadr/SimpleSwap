//
//  MenuTableViewCell.swift
//  Simpleswap
//
//  Created by apple on 14.06.2023.
//
import UIKit
class SegmentTableViewCell: UITableViewCell {
    private let languageSegmentedControl: UISegmentedControl =
                                                    LabelFactoryForSegmentCell.createLanguageSegmentedControl()
    internal let nameLabel: UILabel = LabelFactoryForSegmentCell.createNameLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
        setupLanguageSegmentedControl()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
private extension SegmentTableViewCell {
    func setupView() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(languageSegmentedControl)
    }
    func setupConstraints() {
        LayoutContraintsSegmentCell.activateContraintsForSegmentCell(for: self,
                                                                     nameLabel: nameLabel,
                                                                     languageSegmentedControl: languageSegmentedControl)
    }
}
private extension SegmentTableViewCell {
    func setupLanguageSegmentedControl() {
        languageSegmentedControl.addTarget(self, action: #selector(languageSegmentedControlValueChanged), for: .valueChanged)
        // Добавьте ограничения для `languageSegmentedControl`
    }
    
    @objc func languageSegmentedControlValueChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            // Действия для выбранного языка Русский
            print("rus")
            break
        case 1:
            // Действия для выбранного языка English
            print("eng")
            break
        default:
            break
        }
    }
}
