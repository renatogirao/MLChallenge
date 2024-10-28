//
//  ProductViewModel.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 22/10/24.
//

import UIKit

class ProductDetailsViewModel {
    var productId: String
    var productTitle: String
    var productDescription: String
    var productThumbnailURL: URL?
    var productPrice: String
    var productRating: String
    var productImageURL: URL?
    var acceptsMercadoPago: Bool
    private let networkingManager = NetworkingManager()
    
    init(productId: String) {
        self.productId = productId
        self.productTitle = ""
        self.productDescription = ""
        self.productImageURL = nil
        self.productPrice = ""
        self.productRating = ""
        self.acceptsMercadoPago = false
    }
    
    func fetchProductDetails(completion: @escaping (Result<Void, Error>) -> Void) {
        let endpoint = APIEndpoint.product(productId: productId)
        networkingManager.fetchData(from: endpoint, responseType: Product.self) { [weak self] result in
            switch result {
            case .success(let product):
                self?.productTitle = product.title
                self?.productDescription = product.description ?? "Sem descrição disponível"
                self?.productThumbnailURL = URL(string: product.thumbnail)
                self?.acceptsMercadoPago = product.acceptsMercadoPago
                let priceFormatted = product.price.formattedCurrency(for: .brl)
                self?.productPrice = priceFormatted
                
                if let firstPicture = product.pictures?.first {
                    self?.productImageURL = URL(string: firstPicture.url)
                }
                
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
