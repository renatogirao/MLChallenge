//
//  NetworkingManager.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 22/10/24.
//

import Foundation

enum APIEndpoint {
    case home
    case search(searchText: String)
    
    var path: String {
        switch self {
        case .home:
            return "/sites/MLA/search?category=MLA1055"
        case .search(let searchText):
            return "/sites/MLA/search?q=\(searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"
        }
    }
}

enum APIError: Error {
    case invalidURL
    case requestFailed
    case decodingFailed
}

class NetworkingManager {
    
    private let baseURL = "https://api.mercadolibre.com"
    
    func fetchData<T: Decodable>(from endpoint: APIEndpoint, responseType: T.Type, completion: @escaping (Result<T, APIError>) -> Void) {
        
        guard let url = URL(string: baseURL + endpoint.path) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Request error: \(error.localizedDescription)")
            }
        }
    }
}

