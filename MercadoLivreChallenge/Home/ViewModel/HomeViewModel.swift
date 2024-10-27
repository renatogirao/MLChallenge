//
//  HomeViewModel.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 25/10/24.
//

import Foundation

class HomeViewModel {
    
    // MARK: - Properties
    var categories: [Category] = []
    private let networkingManager = NetworkingManager()
    
    var productsUpdated: (() -> Void)?
    var errorOccurred: ((Error) -> Void)?
    var isLoading: Observable<Bool> = Observable(false)

    func fetchAllCategories() {
        isLoading.value = true
        let endpoint = APIEndpoint.categories
        networkingManager.fetchData(from: endpoint, responseType: [Category].self) { [weak self] result in
            self?.isLoading.value = false
            switch result {
            case .success(let categories):
                self?.categories = categories
                self?.productsUpdated?()
            case .failure(let error):
                self?.errorOccurred?(error)
            }
        }
    }
    
    func categoryDetail(for category: Category, completion: @escaping (Result<CategoryDetail, APIError>) -> Void) {
        let endpoint = APIEndpoint.imageCategories(categoryId: category.id)
        networkingManager.fetchData(from: endpoint, responseType: CategoryDetail.self) { result in
            completion(result)
        }
    }
    
    func numberOfCategories() -> Int {
        return categories.count
    }
    
    func category(at index: Int) -> Category {
        return categories[index]
    }
    
    func imageUrl(for categoryId: String, completion: @escaping (String?) -> Void) {
        let endpoint = APIEndpoint.imageCategories(categoryId: categoryId)
        networkingManager.fetchData(from: endpoint, responseType: CategoryDetail.self) { result in
            switch result {
            case .success(let categoryDetail):
                completion(categoryDetail.picture)
            case .failure:
                completion(nil)
            }
        }
    }
}
