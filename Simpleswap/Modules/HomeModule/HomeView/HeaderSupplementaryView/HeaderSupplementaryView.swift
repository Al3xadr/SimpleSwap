//
//  HeaderSupplementaryView.swift
//  Simpleswap
//
//  Created by apple on 08.05.2023.
//

import UIKit
final class HeaderSupplementaryView: UICollectionReusableView {
    // MARK: - UI Elements
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 19)
        label.textAlignment = .center
        return label
    }()
    // MARK: - override init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headerLabel)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureHeader(categoryName: String) {
        headerLabel.text = categoryName
    }
}
