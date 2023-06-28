//
//  MarketModel.swift
//  Simpleswap
//
//

import Foundation

struct Coin: CoinModelProtocol {
    let image: URL
    let name: String
    let symbol: String
    let currentPrice: String
    let change: String
    let cap: String
    let vol: String
}
