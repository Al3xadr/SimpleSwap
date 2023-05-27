//
//  HomeViewModel.swift
//  Simpleswap
//
//  Created by apple on 08.05.2023.
//

import Foundation
import RxSwift
import RxCocoa
protocol HomeViewModelProtocol {
    var coins: [HomeCoinModel] { get }
    var coinsObservable: Observable<[HomeCoinModel]> { get }
    func getCoinData()
}
class HomeViewModel: HomeViewModelProtocol {
    var coins: [HomeCoinModel] = []
    private let networkManager: NetworkManagerProtocol = NetworkManager()
    private var coinsData = [CoinModel]()
    private let coinsSubject = PublishSubject<[HomeCoinModel]>()
    internal var coinsObservable: Observable<[HomeCoinModel]> {
        return coinsSubject.asObservable()
    }
    private let disposeBag = DisposeBag()
    func getCoinData() {
        networkManager.fetchRxSwiftData(url: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en")
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] (value: [CoinModel])  in
                self?.coinsData = value
                self?.fetchCoins()
                self?.coinsSubject.onNext(self?.coins ?? [])
            }, onError: { error in
                switch error {
                case NetworkError.invalidResponse:
                    print("Invalid Response")
                case NetworkError.invalidStatusCode:
                    print("Invalid status code")
                default:
                    print("\(error)")
                }
            })
            .disposed(by: disposeBag)
    }
    private func fetchCoins() {
        var coins = [HomeCoinModel]()
        for coin in coinsData {
            guard let urlPic = URL(string: coin.image) else { return }
            coins.append(HomeCoinModel(
                name: coin.name,
                image: urlPic,
                currentPrice: "$\(coin.currentPrice)",
                priceChange24h: String(coin.priceChange24H),
                priceChangePercentage24h: "$" + String(coin.priceChangePercentage24H) + "%",
                id: coin.symbol.uppercased()
            ))
        }
        self.coins = coins
    }
}
