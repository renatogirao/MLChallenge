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
    @Published var productRate: String
    @Published var productImageURL: URL?
    var acceptsMercadoPago: Bool
    var warrantyText: String?
    private(set) var productImageURLs: [URL] = []
    private let networkingManager = NetworkingManager()
    
    init(productId: String) {
        self.productId = productId
        self.productTitle = ""
        self.productDescription = ""
        self.productImageURL = nil
        self.productPrice = ""
        self.productRate = "Sem avaliações"
        self.acceptsMercadoPago = false
        self.warrantyText = ""
    }
    
    func fetchProductDetails(completion: @escaping (Result<Void, Error>) -> Void) {
        let endpoint = APIEndpoint.product(productId: productId)
        networkingManager.fetchData(from: endpoint, responseType: Product.self) { [weak self] result in
            switch result {
            case .success(let product):
                self?.productTitle = product.title
                self?.productDescription = product.attributes.first?.valueName ?? "Sem descrição disponível"
                self?.productThumbnailURL = URL(string: product.thumbnail)
                self?.acceptsMercadoPago = product.acceptsMercadoPago
                self?.warrantyText = product.warranty ?? "Sem garantia"
                print("GARANTIA: \(product.warranty)")
                let priceFormatted = product.price.formattedCurrency(for: .brl)
                self?.productPrice = priceFormatted
                self?.productImageURLs = product.pictures?.compactMap { URL(string: $0.url) } ?? []
                
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getProductRate(itemID: String) {
        networkingManager.fetchData(from: .rateProduct(productId: itemID), responseType: ProductRate.self) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let reviewResponse):
                    self?.productRate = reviewResponse.rateAverage
                case .failure(let error):
                    print("Erro ao buscar avaliação do produto: \(error)")
                }
            }
        }
    }
}
