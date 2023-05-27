//
//  NetworkError.swift
//  Simpleswap
//
//  Created by apple on 28.04.2023.
//

import Foundation

enum NetworkError: Error {
    case invalidUrl
    case invalidResponse
    case invalidData(Error)
    case invalidStatusCode
    case networkFailed(Error)
}
