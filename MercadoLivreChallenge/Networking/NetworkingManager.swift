//
//  NetworkingManager.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 22/10/24.
//

import Foundation

enum APIEndpoint {
    case categories
    case search(searchText: String)
    case imageCategories(categoryId: String)

    var path: String {
        switch self {
        case .categories:
            return "/sites/MLA/categories"
        case .search(let searchText):
            let encodedText = searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            return "/sites/MLA/search?q=\(encodedText)"
        case .imageCategories(let categoryId):
            return "/categories/\(categoryId)"
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
                completion(.failure(.requestFailed))
                return
            }
            
            guard let data = data else {
                completion(.failure(.requestFailed))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(responseType, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.decodingFailed))
            }
        }
        task.resume()
    }
}
