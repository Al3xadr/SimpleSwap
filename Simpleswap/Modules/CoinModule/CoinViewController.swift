//
//  CoinViewController.swift
//  Simpleswap
//
//

import UIKit
protocol CoinViewControllerDelegate: AnyObject {
    func coinViewControllerDidDismiss()
}

final class CoinViewController: UIViewController {
    var delegate: CoinViewControllerDelegate?
    private let dismissButton: UIButton = LabelFactoryForCoinVC.createDismissButton()
    private let nameLabel: UILabel = LabelFactoryForCoinVC.createNameLabel()
    private let stackHigh: UIStackView = LabelFactoryForCoinVC.createStackHigh()
    private let symbolLabel: UILabel = LabelFactoryForCoinVC.createSymbolLabel()
    private let high24HoursLabel: UILabel = LabelFactoryForCoinVC.createHigh24HoursLabel()
    private let valueHigh24HoursLabel: UILabel = LabelFactoryForCoinVC.createValueHigh24HoursLabel()
    private let volume24h: UILabel = LabelFactoryForCoinVC.createVolume24h()
    private let valueVolume24h: UILabel = LabelFactoryForCoinVC.createValueVolume24h()
    private let stackLow: UIStackView = LabelFactoryForCoinVC.createStackLow()
    private let currentPrice: UILabel = LabelFactoryForCoinVC.createCurrentPrice()
    private let priceChange24h: UILabel = LabelFactoryForCoinVC.createPriceChange24h()
    private let priceChangePercentage24h: UILabel = LabelFactoryForCoinVC.createPriceChangePercentage24h()
    private let low24HoursLabel: UILabel = LabelFactoryForCoinVC.createLow24HoursLabel()
    private let valueLow24HoursLabel: UILabel = LabelFactoryForCoinVC.createValueLow24HoursLabel()
    private let marketCapChange24hLabel: UILabel = LabelFactoryForCoinVC.createMarketCapChange24hLabel()
    private let marketCapChangePercentage24h: UILabel = LabelFactoryForCoinVC.createMarketCapChangePercentage24h()
    private let chartView: UIView = LabelFactoryForCoinVC.createChartView()
    private let stackTotal: UIStackView = LabelFactoryForCoinVC.createStackTotal()
    private let totalSupply: UILabel = LabelFactoryForCoinVC.createTotalSupply()
    private let maxSupply: UILabel = LabelFactoryForCoinVC.createMaxSupply()
    private let fullyDilutedMarketCap: UILabel = LabelFactoryForCoinVC.createFullyDilutedMarketCap()
    private let valueTotalSupply: UILabel = LabelFactoryForCoinVC.createValueTotalSupply()
    private let valueMaxSupply: UILabel = LabelFactoryForCoinVC.createValueMaxSupply()
    private let valueFullyDilutedMarketCap: UILabel = LabelFactoryForCoinVC.createValueFullyDilutedMarketCap()
    
    init(coin: CoinModel) {
        self.nameLabel.text = coin.name
        self.symbolLabel.text = coin.symbol.uppercased()
        self.valueHigh24HoursLabel.text = "$ " + String(coin.high24H)
        self.volume24h.text = "24h Volume (\(coin.symbol.uppercased()))"
        self.valueVolume24h.text = "$ " + String(coin.totalVolume)
        self.currentPrice.text = String(coin.currentPrice) + " $"
        self.priceChange24h.text = String(format: "%.01f", coin.priceChange24H) + "$  "
        self.priceChangePercentage24h.text = String(format: "%.02f", coin.priceChangePercentage24H) + "%"
        self.valueLow24HoursLabel.text = "$ " + String(coin.low24H)
        self.marketCapChange24hLabel.text = "24h market Cap (\(coin.symbol.uppercased()))"
        self.marketCapChangePercentage24h.text = String(format: "%.02f", coin.marketCapChangePercentage24H) + "%"
        self.valueTotalSupply.text =  String(coin.circulatingSupply) + "(\(coin.symbol.uppercased()))"
        if let maxSupply = coin.maxSupply {
            self.valueMaxSupply.text = String(maxSupply) +  "(\(coin.symbol.uppercased()))"
        } else {
            self.valueMaxSupply.text = "N/A"
        }
        if let fullyDilutedMarketCap = coin.fullyDilutedValuation {
            self.valueFullyDilutedMarketCap.text = "$" + String(fullyDilutedMarketCap)
        } else {
            self.valueFullyDilutedMarketCap.text = "N/A"
        }
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        setupConstraints()
        dismissButton.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
    }
    @objc private func dismissButtonTapped() {
        delegate?.coinViewControllerDidDismiss()
    }
}

private extension CoinViewController {
    func setupView() {
        view.addSubview(dismissButton)
        view.addSubview(nameLabel)
        view.addSubview(stackHigh)
        stackHigh.addSubview(symbolLabel)
        stackHigh.addSubview(high24HoursLabel)
        stackHigh.addSubview(valueHigh24HoursLabel)
        stackHigh.addSubview(volume24h)
        stackHigh.addSubview(valueVolume24h)
        view.addSubview(stackLow)
        stackLow.addSubview(currentPrice)
        stackLow.addSubview(priceChange24h)
        stackLow.addSubview(priceChangePercentage24h)
        stackLow.addSubview(low24HoursLabel)
        stackLow.addSubview(valueLow24HoursLabel)
        stackLow.addSubview(marketCapChange24hLabel)
        stackLow.addSubview(marketCapChangePercentage24h)
        view.addSubview(chartView)
        view.addSubview(stackTotal)
        stackTotal.addSubview(totalSupply)
        stackTotal.addSubview(maxSupply)
        stackTotal.addSubview(fullyDilutedMarketCap)
        stackTotal.addSubview(valueTotalSupply)
        stackTotal.addSubview(valueMaxSupply)
        stackTotal.addSubview(valueFullyDilutedMarketCap)
    }
    func setupConstraints() {
        LayoutConstraintsCoinVC.activateConstraintsForHeader(for: self, dismissButton: dismissButton,
                                                             nameLabel: nameLabel)
        LayoutConstraintsCoinVC.activateConstraintsForStackHight(for: self, nameLabel: nameLabel,
                                                                 stackHigh: stackHigh,
                                                                 symbolLabel: symbolLabel,
                                                                 high24HoursLabel: high24HoursLabel,
                                                                 valueHigh24HoursLabel: valueHigh24HoursLabel,
                                                                 volume24h: volume24h,
                                                                 valueVolume24h: valueVolume24h)
        LayoutConstraintsCoinVC.activateConstraintsForStackLow(for: self, stackHigh: stackHigh,
                                                               stackLow: stackLow,
                                                               currentPrice: currentPrice,
                                                               priceChange24h: priceChange24h,
                                                               priceChangePercentage24h: priceChangePercentage24h,
                                                               low24HoursLabel: low24HoursLabel,
                                                               valueLow24HoursLabel: valueLow24HoursLabel,
                                                               marketCapChange24hLabel: marketCapChange24hLabel,
                                                               marketCapChangePercentage24h: marketCapChangePercentage24h)
        LayoutConstraintsCoinVC.activateConstraintsForChart(for: self, chartView: chartView,
                                                            stackLow: stackLow)
        LayoutConstraintsCoinVC.activateConstraintsForStackTotal(for: self, stackTotal: stackTotal,
                                                                 chartView: chartView,
                                                                 totalSupply: totalSupply,
                                                                 maxSupply: maxSupply,
                                                                 fullyDilutedMarketCap: fullyDilutedMarketCap,
                                                                 valueTotalSupply: valueTotalSupply,
                                                                 valueMaxSupply: valueMaxSupply,
                                                                 valueFullyDilutedMarketCap: valueFullyDilutedMarketCap)
    }

}
