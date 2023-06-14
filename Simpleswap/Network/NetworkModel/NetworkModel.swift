//
//  NetworkModel.swift
//  Simpleswap
//
//

import Foundation

struct CoinModel: Decodable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank: Int
    let fullyDilutedValuation: Int?
    let totalVolume, high24H, low24H, priceChange24H: Double
    let priceChangePercentage24H, marketCapChange24H, marketCapChangePercentage24H, circulatingSupply: Double
    let totalSupply, maxSupply: Double?
    let ath, athChangePercentage: Double
    let athDate: Date
    let atl, atlChangePercentage: Double
    let atlDate: String
    let roi: Roi?
    let lastUpdated: String

    struct Roi: Decodable {
        let times: Double
        let currency: Currency
        let percentage: Double
    }

    enum Currency: String, Decodable {
        case btc
        case eth
        case usd
    }
}
