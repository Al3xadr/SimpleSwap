//
//  MarketViewModel.swift
//  Simpleswap
//
//

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
        for coin in 0..<coinsData.count {
            guard let urlPic = URL(string: coinsData[coin].image) else { return }
            coins.append(Coin(
                image: urlPic,
                name: coinsData[coin].name,
                symbol: coinsData[coin].symbol.uppercased(),
                price: "$\(coinsData[coin].currentPrice)",
                change: String(coinsData[coin].priceChangePercentage24H),
                cap: "$" + String(coinsData[coin].marketCap),
                vol: String(coinsData[coin].totalVolume)
            ))
        }
    }
}
