//
//  NetworkModel.swift
//  Simpleswap
//
//

import Foundation

struct CoinModel: Decodable {
    let id: String
    let symbol: String
    let name: String
    let image: String
    let currentPrice: Double
    let marketCap: Int
    let marketCapRank: Int
    let fullyDilutedValuation: Int?
    let totalVolume: Double
    let high24H: Double
    let low24H: Double
    let priceChange24H: Double
    let priceChangePercentage24H: Double
    let marketCapChange24H: Double
    let marketCapChangePercentage24H: Double
    let circulatingSupply: Double
    let totalSupply: Double?
    let maxSupply: Double?
    let ath: Double
    let athChangePercentage: Double
    let athDate: Date
    let atl: Double
    let atlChangePercentage: Double
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
