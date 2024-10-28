//
//  NetworkingManagerProtocol.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 28/10/24.
//

import UIKit

protocol NetworkingManagerProtocol {
    func fetchData<T: Decodable>(from endpoint: APIEndpoint, responseType: T.Type, completion: @escaping (Result<T, APIError>) -> Void)
}
