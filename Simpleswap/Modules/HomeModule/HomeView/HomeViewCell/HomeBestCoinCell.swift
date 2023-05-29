//
//  HomeBestCoinCell.swift
//  Simpleswap
//
//  Created by apple on 08.05.2023.
//

import UIKit
final class HomeBestCoinCell: UICollectionViewCell {
    // MARK: - UI Elements
    private var container: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.cornerRadius = 15
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 4
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let containerLabelTop: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let containerLabelResultMiddle: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let containerResultBotton: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let imageViewCoin: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 35
        return imageView
    }()
    private let bestLabelCoin: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 18)
        label.text = "Best Coin"
        return label
    }()
    let nameLabelCoin: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 22)
        label.text = "Bitcoin"
        return label
    }()
    private let priceChangeCoinLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Price Change 24h"
        label.textColor = UIColor(red: 0.459, green: 0.459, blue: 0.459, alpha: 1)
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .left
        return label
    }()
    private let priceChangeCoinNumber: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        label.text = "$16.98899"
        return label
    }()
    private let coinGrowthNumber: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.text = "0.00121"
        return label
    }()
    private let coinIdLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.text = "BTC"
        label.textAlignment = .left
        return label
    }()
    private let percentageGrowth: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .green
        label.font = .systemFont(ofSize: 16)
        label.text = "4,3%"
        label.textAlignment = .right
        return label
    }()
    private let currentPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Current price"
        label.textColor = UIColor(red: 0.459, green: 0.459, blue: 0.459, alpha: 1)
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .right
        return label
    }()
    private let currentPriceNumber: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 19)
        label.text = "$1000"
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
        priceChangeCoinNumber.text = nil
        percentageGrowth.text = nil
        coinIdLabel.text = nil
    }
    func setupData(with coin: HomeCoinModel) {
        nameLabelCoin.text = coin.name
        imageViewCoin.kf.setImage(with: coin.image)
        currentPriceNumber.text = coin.currentPrice
        priceChangeCoinNumber.text = coin.priceChange24h
        percentageGrowth.text = coin.priceChangePercentage24h
        coinIdLabel.text = coin.id
    }
}
// MARK: - setupView and setupContraints()
extension HomeBestCoinCell {
    private func setupView() {
        addSubview(container)
        container.addSubview(containerLabelTop)
        container.addSubview(containerResultBotton)
        container.addSubview(containerLabelResultMiddle)
        container.addSubview(bestLabelCoin)
        container.addSubview(nameLabelCoin)
        container.addSubview(imageViewCoin)
        
        containerLabelTop.addSubview(priceChangeCoinLabel)
        containerLabelTop.addSubview(currentPriceLabel)
        
        containerLabelResultMiddle.addSubview(priceChangeCoinNumber)
        containerLabelResultMiddle.addSubview(currentPriceNumber)
        
        containerResultBotton.addSubview(coinGrowthNumber)
        containerResultBotton.addSubview(percentageGrowth)
        containerResultBotton.addSubview(coinIdLabel)
        
    }
    private func setupContraints() {
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor),
            container.leftAnchor.constraint(equalTo: leftAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            bestLabelCoin.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            bestLabelCoin.topAnchor.constraint(equalTo: container.topAnchor, constant: 15),
            bestLabelCoin.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            bestLabelCoin.heightAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
            imageViewCoin.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
            imageViewCoin.topAnchor.constraint(equalTo: bestLabelCoin.bottomAnchor, constant: 15),
            imageViewCoin.heightAnchor.constraint(equalToConstant: 75),
            imageViewCoin.widthAnchor.constraint(equalToConstant: 75)
        ])
        NSLayoutConstraint.activate([
            nameLabelCoin.topAnchor.constraint(equalTo: bestLabelCoin.bottomAnchor, constant: 5),
            nameLabelCoin.leadingAnchor.constraint(equalTo: imageViewCoin.trailingAnchor, constant: 10),
            nameLabelCoin.heightAnchor.constraint(equalToConstant: 20),
            nameLabelCoin.trailingAnchor.constraint(equalTo: container.trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            containerLabelTop.topAnchor.constraint(equalTo: bestLabelCoin.bottomAnchor, constant: 30),
            containerLabelTop.leadingAnchor.constraint(equalTo: nameLabelCoin.leadingAnchor),
            containerLabelTop.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10),
            containerLabelTop.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            priceChangeCoinLabel.leadingAnchor.constraint(equalTo: containerLabelTop.leadingAnchor),
            priceChangeCoinLabel.topAnchor.constraint(equalTo: containerLabelTop.topAnchor, constant: 5),
            priceChangeCoinLabel.heightAnchor.constraint(equalToConstant: 20),
            priceChangeCoinLabel.trailingAnchor.constraint(equalTo: currentPriceLabel.leadingAnchor, constant: 10)
        ])
        NSLayoutConstraint.activate([
            currentPriceLabel.trailingAnchor.constraint(equalTo: containerLabelTop.trailingAnchor, constant: -5),
            currentPriceLabel.topAnchor.constraint(equalTo: containerLabelTop.topAnchor, constant: 5),
            currentPriceLabel.heightAnchor.constraint(equalToConstant: 20),
            currentPriceLabel.widthAnchor.constraint(equalToConstant: 90)
        ])
        NSLayoutConstraint.activate([
            containerLabelResultMiddle.topAnchor.constraint(equalTo: containerLabelTop.bottomAnchor, constant: 10),
            containerLabelResultMiddle.leadingAnchor.constraint(equalTo: containerLabelTop.leadingAnchor),
            containerLabelResultMiddle.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10),
            containerLabelResultMiddle.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            priceChangeCoinNumber.leadingAnchor.constraint(equalTo: containerLabelResultMiddle.leadingAnchor),
            priceChangeCoinNumber.topAnchor.constraint(equalTo: containerLabelResultMiddle.topAnchor, constant: 5),
            priceChangeCoinNumber.heightAnchor.constraint(equalToConstant: 20),
            priceChangeCoinNumber.widthAnchor.constraint(equalToConstant: 70)
        ])
        NSLayoutConstraint.activate([
            currentPriceNumber.trailingAnchor.constraint(equalTo: containerLabelResultMiddle.trailingAnchor, constant: -5),
            currentPriceNumber.topAnchor.constraint(equalTo: containerLabelResultMiddle.topAnchor, constant: 5),
            currentPriceNumber.heightAnchor.constraint(equalToConstant: 20),
            currentPriceNumber.widthAnchor.constraint(equalToConstant: 90)
        ])
        NSLayoutConstraint.activate([
            containerResultBotton.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -15),
            containerResultBotton.leadingAnchor.constraint(equalTo: imageViewCoin.trailingAnchor, constant: 10),
            containerResultBotton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10),
            containerResultBotton.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            coinGrowthNumber.leadingAnchor.constraint(equalTo: containerResultBotton.leadingAnchor),
            coinGrowthNumber.topAnchor.constraint(equalTo: containerResultBotton.topAnchor, constant: 5),
            coinGrowthNumber.heightAnchor.constraint(equalToConstant: 20),
            coinGrowthNumber.trailingAnchor.constraint(equalTo: coinIdLabel.leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            coinIdLabel.leadingAnchor.constraint(equalTo: coinGrowthNumber.trailingAnchor),
            coinIdLabel.topAnchor.constraint(equalTo: containerResultBotton.topAnchor, constant: 5),
            coinIdLabel.heightAnchor.constraint(equalToConstant: 20),
            coinIdLabel.widthAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            percentageGrowth.trailingAnchor.constraint(equalTo: containerResultBotton.trailingAnchor, constant: -10),
            percentageGrowth.topAnchor.constraint(equalTo: containerResultBotton.topAnchor, constant: 5),
            percentageGrowth.heightAnchor.constraint(equalToConstant: 20),
            percentageGrowth.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
