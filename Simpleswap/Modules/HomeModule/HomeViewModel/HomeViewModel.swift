//
//  HomeViewModel.swift
//  Simpleswap
//
//  Created by apple on 08.05.2023.
//

import Foundation

protocol HomeViewModelProtocol {
    func fetchData(completion: @escaping () -> Void)
    var coins: [HomeCoinModel] { get }
}
class HomeViewModel: HomeViewModelProtocol {
    private let networkManager: NetworkManagerProtocol = NetworkManager()
    private var coinsData = [CoinModel]()
    var coins = [HomeCoinModel]()

    func fetchData(completion: @escaping () -> Void) {
        networkManager.getRequestData(url: Constants.urlString) { result in
            switch result {
            case .success(let coins):
                self.coinsData = coins
                self.fetchCoins()
            case .failure(let fail):
                print(fail)
            }
            DispatchQueue.main.async {
                completion()
            }
        }
    }

    private func fetchCoins() {
            for coin in coinsData {
                guard let urlPic = URL(string: coin.image) else { return }
                coins.append(HomeCoinModel(
                    name: coin.name,
                    image: urlPic,
                    currentPrice: "$" + String(format: "%.3f", coin.currentPrice),
                    priceChange24h: "$" + String(coin.priceChange24H),
                    priceChangePercentage24h: "$" + String(format: "%.2f", coin.priceChangePercentage24H) + "%",
                    id: " \(coin.symbol.uppercased())"
                ))
            }
        }
}
