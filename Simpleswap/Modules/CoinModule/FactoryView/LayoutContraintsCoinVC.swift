// swiftlint:disable function_parameter_count
// swiftlint:disable  line_length
//  LayoutContraintsCoinVC.swift
//  Simpleswap
//
//  Created by apple on 28.06.2023.
//

import UIKit

class LayoutConstraintsCoinVC {
    static func activateConstraintsForHeader(for coinViewController: CoinViewController, dismissButton: UIButton, nameLabel: UILabel) {
        NSLayoutConstraint.activate([
            dismissButton.leadingAnchor.constraint(equalTo: coinViewController.view.leadingAnchor, constant: 5),
            dismissButton.topAnchor.constraint(equalTo: coinViewController.view.safeAreaLayoutGuide.topAnchor, constant: 5),
            dismissButton.heightAnchor.constraint(equalToConstant: 30),
            dismissButton.widthAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: coinViewController.view.safeAreaLayoutGuide.topAnchor, constant: 5),
            nameLabel.centerXAnchor.constraint(equalTo: coinViewController.view.centerXAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            nameLabel.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    static func activateConstraintsForStackHight(for coinViewController: CoinViewController,
                                                 nameLabel: UILabel, stackHigh: UIStackView,
                                                 symbolLabel: UILabel, high24HoursLabel: UILabel,
                                                 valueHigh24HoursLabel: UILabel,
                                                 volume24h: UILabel, valueVolume24h: UILabel) {
        NSLayoutConstraint.activate([
            stackHigh.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            stackHigh.leadingAnchor.constraint(equalTo: coinViewController.view.leadingAnchor, constant: 10),
            stackHigh.trailingAnchor.constraint(equalTo: coinViewController.view.trailingAnchor, constant: -10),
            stackHigh.heightAnchor.constraint(equalToConstant: 60)
        ])
        NSLayoutConstraint.activate([
            symbolLabel.leadingAnchor.constraint(equalTo: stackHigh.leadingAnchor, constant: 10),
            symbolLabel.centerYAnchor.constraint(equalTo: stackHigh.centerYAnchor),
            symbolLabel.heightAnchor.constraint(equalToConstant: 20),
            symbolLabel.widthAnchor.constraint(equalToConstant: 60)
        ])
        NSLayoutConstraint.activate([
            high24HoursLabel.centerXAnchor.constraint(equalTo: stackHigh.centerXAnchor),
            high24HoursLabel.topAnchor.constraint(equalTo: stackHigh.topAnchor, constant: 5),
            high24HoursLabel.heightAnchor.constraint(equalToConstant: 20),
            high24HoursLabel.widthAnchor.constraint(equalToConstant: 95)

        ])
        NSLayoutConstraint.activate([
            valueHigh24HoursLabel.centerXAnchor.constraint(equalTo: stackHigh.centerXAnchor),
            valueHigh24HoursLabel.topAnchor.constraint(equalTo: high24HoursLabel.bottomAnchor, constant: 5),
            valueHigh24HoursLabel.heightAnchor.constraint(equalToConstant: 20),
            valueHigh24HoursLabel.widthAnchor.constraint(equalToConstant: 95)

        ])
        NSLayoutConstraint.activate([
            volume24h.topAnchor.constraint(equalTo: stackHigh.topAnchor, constant: 5),
            volume24h.trailingAnchor.constraint(equalTo: stackHigh.trailingAnchor, constant: -5),
            volume24h.heightAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
            valueVolume24h.topAnchor.constraint(equalTo: volume24h.bottomAnchor, constant: 5),
            valueVolume24h.trailingAnchor.constraint(equalTo: stackHigh.trailingAnchor, constant: -5),
            valueVolume24h.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    static func activateConstraintsForStackLow(for coinViewController: CoinViewController, stackHigh: UIStackView,
                                               stackLow: UIStackView, currentPrice: UILabel,
                                               priceChange24h: UILabel, priceChangePercentage24h: UILabel,
                                               low24HoursLabel: UILabel, valueLow24HoursLabel: UILabel,
                                               marketCapChange24hLabel: UILabel, marketCapChangePercentage24h: UILabel) {
        NSLayoutConstraint.activate([
            stackLow.topAnchor.constraint(equalTo: stackHigh.bottomAnchor, constant: 5),
            stackLow.leadingAnchor.constraint(equalTo: coinViewController.view.leadingAnchor, constant: 10),
            stackLow.trailingAnchor.constraint(equalTo: coinViewController.view.trailingAnchor, constant: -10),
            stackLow.heightAnchor.constraint(equalToConstant: 60)
        ])
        NSLayoutConstraint.activate([
            currentPrice.topAnchor.constraint(equalTo: stackLow.topAnchor, constant: 5),
            currentPrice.leadingAnchor.constraint(equalTo: stackLow.leadingAnchor, constant: 5),
            currentPrice.heightAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
            priceChange24h.leadingAnchor.constraint(equalTo: stackLow.leadingAnchor, constant: 5),
            priceChange24h.topAnchor.constraint(equalTo: currentPrice.bottomAnchor, constant: 5),
            priceChange24h.heightAnchor.constraint(equalToConstant: 15),
            priceChange24h.widthAnchor.constraint(equalToConstant: 35)
        ])
        NSLayoutConstraint.activate([
            priceChangePercentage24h.leadingAnchor.constraint(equalTo: priceChange24h.trailingAnchor, constant: 10),
            priceChangePercentage24h.topAnchor.constraint(equalTo: currentPrice.bottomAnchor, constant: 5),
            priceChangePercentage24h.heightAnchor.constraint(equalToConstant: 15),
            priceChangePercentage24h.widthAnchor.constraint(equalToConstant: 35)
        ])
        NSLayoutConstraint.activate([
            low24HoursLabel.centerXAnchor.constraint(equalTo: stackLow.centerXAnchor),
            low24HoursLabel.topAnchor.constraint(equalTo: stackLow.topAnchor, constant: 5),
            low24HoursLabel.heightAnchor.constraint(equalToConstant: 20),
            low24HoursLabel.widthAnchor.constraint(equalToConstant: 95)

        ])
        NSLayoutConstraint.activate([
            valueLow24HoursLabel.topAnchor.constraint(equalTo: low24HoursLabel.bottomAnchor, constant: 5),
            valueLow24HoursLabel.centerXAnchor.constraint(equalTo: stackLow.centerXAnchor),
            valueLow24HoursLabel.heightAnchor.constraint(equalToConstant: 20),
            valueLow24HoursLabel.widthAnchor.constraint(equalToConstant: 95)

        ])
        NSLayoutConstraint.activate([
            marketCapChange24hLabel.topAnchor.constraint(equalTo: stackLow.topAnchor, constant: 5),
            marketCapChange24hLabel.trailingAnchor.constraint(equalTo: stackLow.trailingAnchor, constant: -5),
            marketCapChange24hLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
            marketCapChangePercentage24h.trailingAnchor.constraint(equalTo: marketCapChange24hLabel.trailingAnchor),
            marketCapChangePercentage24h.topAnchor.constraint(equalTo: marketCapChange24hLabel.bottomAnchor, constant: 5),
            marketCapChangePercentage24h.leadingAnchor.constraint(equalTo: marketCapChange24hLabel.leadingAnchor, constant: 5),
            marketCapChangePercentage24h.heightAnchor.constraint(equalToConstant: 15)
        ])
    }
    static func activateConstraintsForChart(for coinViewController: CoinViewController, chartView: UIView,
                                            stackLow: UIStackView) {
        NSLayoutConstraint.activate([
            chartView.topAnchor.constraint(equalTo: stackLow.bottomAnchor, constant: 15),
            chartView.leadingAnchor.constraint(equalTo: coinViewController.view.leadingAnchor, constant: 10),
            chartView.trailingAnchor.constraint(equalTo: coinViewController.view.trailingAnchor, constant: -10),
            chartView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    static func activateConstraintsForStackTotal(for coinViewController: CoinViewController,
                                                 stackTotal: UIStackView, chartView: UIView,
                                                 totalSupply: UILabel, maxSupply: UILabel,
                                                 fullyDilutedMarketCap: UILabel, valueTotalSupply: UILabel,
                                                 valueMaxSupply: UILabel, valueFullyDilutedMarketCap: UILabel) {
        NSLayoutConstraint.activate([
            stackTotal.topAnchor.constraint(equalTo: chartView.bottomAnchor, constant: 15),
            stackTotal.leadingAnchor.constraint(equalTo: coinViewController.view.leadingAnchor, constant: 5),
            stackTotal.trailingAnchor.constraint(equalTo: coinViewController.view.trailingAnchor, constant: -5),
            stackTotal.heightAnchor.constraint(equalToConstant: 80)
        ])
        NSLayoutConstraint.activate([
            totalSupply.topAnchor.constraint(equalTo: stackTotal.topAnchor, constant: 5),
            totalSupply.leadingAnchor.constraint(equalTo: stackTotal.leadingAnchor, constant: 5),
            totalSupply.heightAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
            maxSupply.topAnchor.constraint(equalTo: totalSupply.bottomAnchor, constant: 5),
            maxSupply.leadingAnchor.constraint(equalTo: stackTotal.leadingAnchor, constant: 5),
            maxSupply.heightAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
            fullyDilutedMarketCap.topAnchor.constraint(equalTo: maxSupply.bottomAnchor, constant: 5),
            fullyDilutedMarketCap.leadingAnchor.constraint(equalTo: stackTotal.leadingAnchor, constant: 5),
            fullyDilutedMarketCap.heightAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
            valueTotalSupply.topAnchor.constraint(equalTo: stackTotal.topAnchor, constant: 5),
            valueTotalSupply.trailingAnchor.constraint(equalTo: stackTotal.trailingAnchor, constant: -5),
            valueTotalSupply.heightAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
            valueMaxSupply.topAnchor.constraint(equalTo: valueTotalSupply.bottomAnchor, constant: 5),
            valueMaxSupply.trailingAnchor.constraint(equalTo: stackTotal.trailingAnchor, constant: -5),
            valueMaxSupply.heightAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
            valueFullyDilutedMarketCap.topAnchor.constraint(equalTo: valueMaxSupply.bottomAnchor, constant: 5),
            valueFullyDilutedMarketCap.trailingAnchor.constraint(equalTo: stackTotal.trailingAnchor, constant: -5),
            valueFullyDilutedMarketCap.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
