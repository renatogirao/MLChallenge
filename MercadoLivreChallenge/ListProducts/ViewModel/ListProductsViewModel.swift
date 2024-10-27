//
//  ListProductsViewModel.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 26/10/24.
//

import UIKit

class ListProductsViewModel {
    
    // MARK: - Properties
    
    var products: [Product] = []
    private let networkingManager = NetworkingManager()
    
    var productsUpdated: (() -> Void)?
    var errorOccurred: ((Error) -> Void)?
    var isLoading: Observable<Bool> = Observable(false)

    func numberOfProducts() -> Int {
        return products.count
    }
    
    func product(at index: Int) -> Product {
        return products[index]
    }
    
    func searchProducts(with query: String) {
        isLoading.value = true
        
        networkingManager.fetchData(from: .search(searchText: query), responseType: SearchResponse.self) { [weak self] result in
            self?.isLoading.value = false
            
            switch result {
            case .success(let searchResponse):
                self?.products = searchResponse.results
                self?.productsUpdated?()
            case .failure(let error):
                // todo = alert to show error to user
                self?.errorOccurred?(error) 
            }
        }
    }
}
