//
//  ListProductsViewModel.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 26/10/24.
//

import Foundation

class ListProductsViewModel {
    var productsUpdated: (() -> Void)?
    var errorOccurred: ((Error) -> Void)?
    
    var products: [Product] = []
    private let networkingManager: NetworkingManagerProtocol
    private var loadingTask: DispatchWorkItem?
    
    public init(networkingManager: NetworkingManagerProtocol = NetworkingManager()) {
          self.networkingManager = networkingManager
      }

    var numberOfProducts: Int {
        return products.count
    }
    
    func product(at index: Int) -> Product {
        return products[index]
    }
    
    func searchProducts(with searchText: String) {
        loadingTask = DispatchWorkItem {
            self.errorOccurred?(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Ocorreu um erro ao carregar os produtos"]))
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 10, execute: loadingTask!)
        DispatchQueue.main.async {
              self.errorOccurred?(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Loading started."]))
          }
        networkingManager.fetchData(from: .search(searchText: searchText), responseType: SearchResponse.self) { [weak self] result in
            self?.loadingTask?.cancel()
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
