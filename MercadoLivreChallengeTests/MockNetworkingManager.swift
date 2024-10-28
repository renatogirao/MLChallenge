//
//  MockNetworkingManager.swift
//  MercadoLivreChallengeTests
//
//  Created by Renato Savoia Girão on 28/10/24.
//

import UIKit

class MockNetworkingManager: NetworkingManagerProtocol {
    
    var mockData: Decodable?
    var mockError: APIError?
    
    func fetchData<T: Decodable>(from endpoint: APIEndpoint, responseType: T.Type, completion: @escaping (Result<T, APIError>) -> Void) {
        if let mockError = mockError {
            completion(.failure(mockError))
        } else if let mockData = mockData as? T {
            completion(.success(mockData))
        }
    }
}
