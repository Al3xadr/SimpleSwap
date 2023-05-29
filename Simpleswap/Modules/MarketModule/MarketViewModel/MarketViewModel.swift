//
//  MarketViewModel.swift
//  Simpleswap
//
//

import Foundation
import RxSwift
import RxCocoa
protocol MarketViewModelProtocol {
    func fetchData()
    var coins: [Coin] { get }
    var coinsObservable: Observable<[Coin]> { get }
}

final class MarketViewModel: MarketViewModelProtocol {
    private let coinsSubject = PublishSubject<[Coin]>()
    private let networkManager: NetworkManagerProtocol = NetworkManager()
    private var coinsData = [CoinModel]()
    var coins: [Coin] = []
    private let disposeBag = DisposeBag()
    internal var coinsObservable: Observable<[Coin]> {
        return coinsSubject.asObservable()
    }
    func fetchData() {
        networkManager.fetchRxSwiftData(url: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en")
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] ( value: [CoinModel]) in
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
