//
//  NetworkManager.swift
//  Simpleswap
//
//  Created by apple on 28.04.2023.
//

import Foundation
import Alamofire
import RxSwift
protocol NetworkManagerProtocol {
    func getRequestData(url: String, completion: @escaping (Result<[CoinModel], NetworkError>) -> Void)
    func fetchRxSwiftData<T: Decodable> ( url: String) -> Observable<T>
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
    func fetchRxSwiftData<T: Decodable> ( url: String) -> Observable<T> {
        return Observable<T>.create { observer in
            let request =  AF.request(url, method: .get).responseDecodable(decoder: self.decoder)
            { (response: AFDataResponse<T>)  in
                switch response.result {
                case .success(let value):
                    observer.onNext( value )
                    observer.onCompleted()
                case .failure(let error):
                    if let statusCode = response.response?.statusCode {
                        switch statusCode {
                        case 400..<500:
                            observer.onError(NetworkError.invalidResponse)
                        case 500..<600:
                            observer.onError(NetworkError.invalidStatusCode)
                        default:
                            observer.onError(error)
                        }
                    }
                }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
