//
//  HomeTopCoinCell.swift
//  Simpleswap
//
//  Created by apple on 08.05.2023.
//

import Foundation
import UIKit
final class HomeTopCoinCell: UICollectionViewCell {
    // MARK: - UI Elements
    var container: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.cornerRadius = 4
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 4
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let imageViewCoin: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .lightGray
        imageView.layer.cornerRadius = 29
        return imageView
    }()
    private let nameLabelCoin: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    private let coinSymbol: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = UIColor(red: 0.459, green: 0.459, blue: 0.459, alpha: 1)
        return label
    }()
    private let currentPriceNumber: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .right
        return label
    }()
    private let percentageGrowth: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.textColor = UIColor(red: 0.459, green: 0.459, blue: 0.459, alpha: 1)
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    // MARK: - Override init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupContraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabelCoin.text = nil
        imageViewCoin.image = nil
        currentPriceNumber.text = nil
        coinSymbol.text = nil
        percentageGrowth.text = nil
    }
    func setupData(with coin: HomeCoinModel) {
        nameLabelCoin.text = coin.name
        imageViewCoin.kf.setImage(with: coin.image)
        currentPriceNumber.text = coin.currentPrice
        coinSymbol.text = coin.id
        percentageGrowth.text = coin.priceChangePercentage24h
    }
}
// MARK: - setupView and setupContraints
private extension HomeTopCoinCell {
    private func setupView() {
        addSubview(container)
        container.addSubview(imageViewCoin)
        container.addSubview(nameLabelCoin)
        container.addSubview(coinSymbol)
        container.addSubview(currentPriceNumber)
        container.addSubview(percentageGrowth)
    }
    private func setupContraints() {
        NSLayoutConstraint.activate([
            self.container.topAnchor.constraint(equalTo: topAnchor),
            self.container.leftAnchor.constraint(equalTo: leftAnchor),
            self.container.bottomAnchor.constraint(equalTo: bottomAnchor),
            self.container.rightAnchor.constraint(equalTo: rightAnchor)
        ])
        NSLayoutConstraint.activate([
            self.imageViewCoin.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 5),
            self.imageViewCoin.topAnchor.constraint(equalTo: container.topAnchor, constant: 5),
            self.imageViewCoin.heightAnchor.constraint(equalToConstant: 60),
            self.imageViewCoin.widthAnchor.constraint(equalToConstant: 60)
        ])
        NSLayoutConstraint.activate([
            self.nameLabelCoin.leadingAnchor.constraint(equalTo: imageViewCoin.trailingAnchor, constant: 10),
            self.nameLabelCoin.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
            self.nameLabelCoin.widthAnchor.constraint(equalToConstant: 90),
            self.nameLabelCoin.heightAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
            self.coinSymbol.leadingAnchor.constraint(equalTo: nameLabelCoin.leadingAnchor),
            self.coinSymbol.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -10),
            self.coinSymbol.widthAnchor.constraint(equalToConstant: 60),
            self.coinSymbol.heightAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
            self.currentPriceNumber.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10),
            self.currentPriceNumber.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
            self.currentPriceNumber.leadingAnchor.constraint(equalTo: nameLabelCoin.leadingAnchor, constant: 10),
            self.currentPriceNumber.heightAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
            self.percentageGrowth.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10),
            self.percentageGrowth.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -10),
            self.percentageGrowth.leadingAnchor.constraint(equalTo: coinSymbol.leadingAnchor, constant: 10),
            self.percentageGrowth.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
