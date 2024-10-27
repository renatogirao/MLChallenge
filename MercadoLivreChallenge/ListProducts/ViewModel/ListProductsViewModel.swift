//
//  ListProductsViewModel.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 26/10/24.
//

import UIKit

class ListProductsViewModel {
    
    var products: [Product] = []
    private let networkingManager = NetworkingManager()
    
    var productsUpdated: (() -> Void)?
    var errorOccurred: ((Error) -> Void)?
    
    func numberOfProducts() -> Int {
        return products.count
    }
    
    func product(at index: Int) -> Product {
        return products[index]
    }
    
    func searchProducts(with query: String) {
        networkingManager.fetchData(from: .search(searchText: query), responseType: SearchResponse.self) { [weak self] result in
            switch result {
            case .success(let response):
                self?.products = response.results
                self?.productsUpdated?()
            case .failure(let error):
                self?.errorOccurred?(error)
            }
        }
    }
}
