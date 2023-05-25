//
//  NetworkManager.swift
//  Simpleswap
//
//  Created by apple on 28.04.2023.
//

import Foundation
import Alamofire

protocol NetworkManagerProtocol {
    func getRequestData(url: String, completion: @escaping (Result<[CoinModel], NetworkError>) -> Void)
}

final class NetworkManager: NetworkManagerProtocol {

    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }()

    func getRequestData(url: String, completion: @escaping (Result<[CoinModel], NetworkError>) -> Void) {
        AF.request(url, method: .get).responseDecodable(of: [CoinModel].self, decoder: decoder) { response in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(NetworkError.networkFailed(error)))
            }
        }
    }
}
