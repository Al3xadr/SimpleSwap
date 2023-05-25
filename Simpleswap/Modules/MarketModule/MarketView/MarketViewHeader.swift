//
//  MarketViewHeader.swift
//  Simpleswap
//
//  Created by Podgainy Sergei on 09.05.2023.
//

import UIKit

final class MarketViewHeader: UITableViewHeaderFooterView {

    private let nameLabel = UILabel()
    private let priceAnd24Change = UILabel()
    private let capAndVol = UILabel()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupElements()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - SetupElements
private extension MarketViewHeader {
    func setupElements() {
        nameLabel.text = Constants.nameLabel
        nameLabel.font = .systemFont(ofSize: 12)
        nameLabel.textColor = .lightGray
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        priceAnd24Change.text = Constants.priceAnd24Change
        priceAnd24Change.font = .systemFont(ofSize: 12)
        priceAnd24Change.textColor = .lightGray
        priceAnd24Change.textAlignment = .center
        priceAnd24Change.translatesAutoresizingMaskIntoConstraints = false

        capAndVol.text = Constants.capAndVol
        capAndVol.font = .systemFont(ofSize: 12)
        capAndVol.textColor = .lightGray
        capAndVol.textAlignment = .right
        capAndVol.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(nameLabel)
        contentView.addSubview(priceAnd24Change)
        contentView.addSubview(capAndVol)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.heightAnchor.constraint(equalToConstant: 15),
            nameLabel.centerXAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            priceAnd24Change.heightAnchor.constraint(equalToConstant: 15),
            priceAnd24Change.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            priceAnd24Change.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            capAndVol.heightAnchor.constraint(equalToConstant: 15),
            capAndVol.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            capAndVol.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15)
        ])
    }
}
