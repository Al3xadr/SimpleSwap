//
//  HomeModel.swift
//  Simpleswap
//
//  Created by apple on 08.05.2023.
//

import Foundation
struct HomeCoinModel: Hashable {
    let identifier: UUID
    let id: String
    let name: String
    let image: URL
    let currentPrice: String
    let priceChange24h: String
    let priceChangePercentage24h: String
    init(name: String, image: URL, currentPrice: String,
         priceChange24h: String, priceChangePercentage24h: String, id: String) {
        self.identifier = UUID()
        self.name = name
        self.image = image
        self.currentPrice = currentPrice
        self.priceChange24h = priceChange24h
        self.priceChangePercentage24h = priceChangePercentage24h
        self.id = id
    }
}
extension HomeCoinModel {
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    static func == (lhs: HomeCoinModel, rhs: HomeCoinModel) -> Bool {
        lhs.identifier == rhs.identifier
    }
}
