//
//  NetworkConstants.swift
//  Simpleswap
//
//  Created by apple on 25.05.2023.
//

import Foundation

struct UrlConstants {
    static var coinOpenAPIURL: String {
        return "\(Constants.baseUrl)\(Constants.coinsMarket)?vs_currency=\(Constants.usd)&" +
               "order=\(Constants.marketCap)&per_page=\(Constants.resultPage)&page=\(Constants.page)&" +
               "sparkline=\(Constants.sparkLine)&locale=\(Constants.local)"
    }
}
