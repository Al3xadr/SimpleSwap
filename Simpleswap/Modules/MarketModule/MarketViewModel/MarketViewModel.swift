//
//  MarketViewModel.swift
//  Simpleswap
//
//  Created by Podgainy Sergei on 03.05.2023.
//

// Cюда пока не смотреть - это для теста

import Foundation

protocol MarketViewModelProtocol {
    func fetchData()
    var coins: [Coin] { get }
}

final class MarketViewModel: MarketViewModelProtocol {

    private let networkManager: NetworkManagerProtocol = NetworkManager()
    private var coinsData = [CoinModel]()
    var coins = [Coin]()

    func fetchData() {
        networkManager.getRequestData(url: Constants.urlString) { result in
            switch result {
            case .success(let coins):
                self.coinsData = coins
                self.fetchCoins()
            case .failure(let fail):
                print(fail)
            }
        }
    }

    private func fetchCoins() {
        for i in 0..<coinsData.count {
            guard let urlPic = URL(string: coinsData[i].image) else { return }
            coins.append(Coin(
                image: urlPic,
                name: coinsData[i].name,
                symbol: coinsData[i].symbol.uppercased(),
                price: "$\(coinsData[i].currentPrice)",
                change: String(coinsData[i].priceChangePercentage24H),
                cap: "$" + String(coinsData[i].marketCap),
                vol: String(coinsData[i].totalVolume)
            ))
        }
    }
}
