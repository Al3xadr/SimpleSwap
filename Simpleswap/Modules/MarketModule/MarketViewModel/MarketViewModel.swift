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
        networkManager.fetchRxSwiftData(url: UrlConstants.coinOpenAPIURL)
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
            coins.append(Coin(
                image: urlPic,
                name: coin.name,
                symbol: coin.symbol.uppercased(),
                currentPrice: "$\(coin.currentPrice)",
                change: String(coin.priceChangePercentage24H),
                cap: "$" + String(coin.marketCap),
                vol: String(coin.totalVolume),
                coinModel: coinModel
            ))
        }
    }
}
