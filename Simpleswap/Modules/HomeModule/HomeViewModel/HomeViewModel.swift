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
        networkManager.fetchRxSwiftData(url: UrlConstants.coinOpenAPIURL)
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
        for coin in coinsData {
            guard let urlPic = URL(string: coin.image) else { return }
            let coinModel = CoinModel(
                id: coin.id,
                symbol: coin.symbol,
                name: coin.name,
                image: coin.image,
                currentPrice: coin.currentPrice,
                marketCap: coin.marketCap,
                marketCapRank: coin.marketCapRank,
                fullyDilutedValuation: coin.fullyDilutedValuation,
                totalVolume: coin.totalVolume,
                high24H: coin.high24H,
                low24H: coin.low24H,
                priceChange24H: coin.priceChange24H,
                priceChangePercentage24H: coin.priceChangePercentage24H,
                marketCapChange24H: coin.marketCapChange24H,
                marketCapChangePercentage24H: coin.marketCapChangePercentage24H,
                circulatingSupply: coin.circulatingSupply,
                totalSupply: coin.totalSupply,
                maxSupply: coin.maxSupply,
                ath: coin.ath,
                athChangePercentage: coin.athChangePercentage,
                athDate: coin.athDate,
                atl: coin.atl,
                atlChangePercentage: coin.atlChangePercentage,
                atlDate: coin.atlDate,
                roi: coin.roi,
                lastUpdated: coin.lastUpdated
            )
            coins.append(HomeCoinModel(
                name: coin.name,
                image: urlPic,
                currentPrice: "$\(coin.currentPrice)",
                priceChange24h: String(format: "%.03f", coin.priceChange24H) + "$",
                priceChangePercentage24h: "$ " + String(format: "%.03f", coin.priceChangePercentage24H) + "%",
                id: coin.symbol.uppercased(),
                marketCapChangePercentage24h: String(format: "%.03f", coin.marketCapChangePercentage24H) + ":",
                coinModel: coinModel
            ))
        }
    }
}
