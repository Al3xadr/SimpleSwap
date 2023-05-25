//
//  MarketViewCell.swift
//  Simpleswap
//
//  Created by Podgainy Sergei on 03.05.2023.
//

import UIKit
import Kingfisher

final class MarketViewCell: UITableViewCell {

    private let coinImage = UIImageView()
    private let coinNameLabel = UILabel()
    private let symbolLabel = UILabel()
    private let priceLabel = UILabel()
    private let changeLabel = UILabel()
    private let capLabel = UILabel()
    private let volLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupElements()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        coinImage.image = nil
        coinNameLabel.text = nil
        symbolLabel.text = nil
        priceLabel.text = nil
        changeLabel.text = nil
        capLabel.text = nil
        volLabel.text = nil
    }

    func setupData(coin: Coin) {
        coinImage.kf.setImage(with: coin.image)
        coinNameLabel.text = coin.name
        symbolLabel.text = coin.symbol
        priceLabel.text = coin.price
        changeLabel.text = coin.change
        capLabel.text = coin.cap
        volLabel.text = coin.vol
    }
}

private extension MarketViewCell {
    func setupElements() {

        coinNameLabel.font = .boldSystemFont(ofSize: 14)
        symbolLabel.font = .systemFont(ofSize: 12)
        priceLabel.font = .systemFont(ofSize: 12)
        changeLabel.font = .systemFont(ofSize: 12)
        capLabel.font = .systemFont(ofSize: 12)
        volLabel.font = .systemFont(ofSize: 12)

        capLabel.textAlignment = .right
        volLabel.textAlignment = .right

        coinImage.translatesAutoresizingMaskIntoConstraints = false
        coinNameLabel.translatesAutoresizingMaskIntoConstraints = false
        symbolLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        changeLabel.translatesAutoresizingMaskIntoConstraints = false
        capLabel.translatesAutoresizingMaskIntoConstraints = false
        volLabel.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(coinImage)
        contentView.addSubview(coinNameLabel)
        contentView.addSubview(symbolLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(changeLabel)
        contentView.addSubview(capLabel)
        contentView.addSubview(volLabel)
    }

    func setupConstraints() {

        coinImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        coinImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        coinImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        coinImage.widthAnchor.constraint(equalToConstant: 40).isActive = true

        coinNameLabel.leftAnchor.constraint(equalTo: coinImage.rightAnchor, constant: 8).isActive = true
        coinNameLabel.bottomAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -5).isActive = true
        coinNameLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width / 4).isActive = true

        symbolLabel.leftAnchor.constraint(equalTo: coinImage.rightAnchor, constant: 8).isActive = true
        symbolLabel.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 5).isActive = true
        symbolLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width / 4).isActive = true

        priceLabel.leftAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -30).isActive = true
        priceLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width / 3.5).isActive = true
        priceLabel.bottomAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -5).isActive = true

        changeLabel.leftAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -30).isActive = true
        changeLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width / 3.5).isActive = true
        changeLabel.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 5).isActive = true

        capLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -25).isActive = true
        capLabel.bottomAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -5).isActive = true
        capLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width / 3.5).isActive = true

        volLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -25).isActive = true
        volLabel.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 5).isActive = true
        volLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width / 3.5).isActive = true
    }
}
