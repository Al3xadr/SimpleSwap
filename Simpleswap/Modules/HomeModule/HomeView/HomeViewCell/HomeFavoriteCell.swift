//
//  HomeFavoriteCell.swift
//  Simpleswap
//
//  Created by apple on 08.05.2023.
//
import UIKit
final class HomeFavoriteCell: UICollectionViewCell {
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
        imageView.layer.cornerRadius = 18
        return imageView
    }()
    private let nameLabelCoin: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = UIColor(red: 0.459, green: 0.459, blue: 0.459, alpha: 1)
        return label
    }()
    private let coinSymbol: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    private let currentPriceNumber: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        return label
    }()
    private let percentageGrowth: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .green
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .left
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
private extension HomeFavoriteCell {
    private func setupView() {
        addSubview(container)
        container.addSubview(imageViewCoin)
        container.addSubview(coinSymbol)
        container.addSubview(currentPriceNumber)
        container.addSubview(percentageGrowth)
    }
    private func setupContraints() {
        NSLayoutConstraint.activate([
            self.container.topAnchor.constraint(equalTo: topAnchor),
            self.container.leftAnchor.constraint(equalTo: leftAnchor),
            self.container.bottomAnchor.constraint(equalTo: bottomAnchor),
            self.container.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            self.imageViewCoin.leadingAnchor.constraint(equalTo: self.container.leadingAnchor, constant: 5),
            self.imageViewCoin.topAnchor.constraint(equalTo: self.container.topAnchor, constant: 5),
            self.imageViewCoin.heightAnchor.constraint(equalToConstant: 40),
            self.imageViewCoin.widthAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            self.coinSymbol.topAnchor.constraint(equalTo: self.container.topAnchor, constant: 15),
            self.coinSymbol.leadingAnchor.constraint(equalTo: self.imageViewCoin.trailingAnchor, constant: 5),
            self.coinSymbol.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 5),
            self.coinSymbol.heightAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
            self.currentPriceNumber.topAnchor.constraint(equalTo: self.imageViewCoin.bottomAnchor, constant: 15),
            self.currentPriceNumber.leadingAnchor.constraint(equalTo: self.container.leadingAnchor, constant: 10),
            self.currentPriceNumber.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10),
            self.currentPriceNumber.heightAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
            self.percentageGrowth.topAnchor.constraint(equalTo: currentPriceNumber.bottomAnchor, constant: 10),
            self.percentageGrowth.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
            self.percentageGrowth.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10),
            self.percentageGrowth.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
