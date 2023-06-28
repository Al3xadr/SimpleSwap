//
//  LabelFactoryForSegmentCell.swift
//  Simpleswap
//
//  Created by apple on 28.06.2023.
//
import UIKit

class LabelFactoryForSegmentCell {
    static func createLanguageSegmentedControl() -> UISegmentedControl {
        var segmentControl = UISegmentedControl()
        segmentControl = UISegmentedControl(items: ["Rus", "Eng"])
        segmentControl.selectedSegmentIndex = 0
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentControl
    }
    static func createNameLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
