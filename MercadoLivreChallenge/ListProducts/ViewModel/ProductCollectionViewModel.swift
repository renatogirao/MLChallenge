//
//  ProductCollectionViewModel.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 27/10/24.
//

import UIKit

class ProductCollectionViewModel {
    private let product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    var title: String {
        return product.title
    }
    
    var price: String {
        return "\(product.currencyId) \(product.price)"
    }
    
    var thumbnailURL: URL? {
        return URL(string: product.thumbnail)
    }
    
    var hasFreeShipping: Bool {
        return product.shipping.freeShipping
    }
    
    var rating: String {
        return "Rating: \(product.installments.rate)"
    }
}

