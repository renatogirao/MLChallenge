//
//  ProductCarouselViewModel.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 26/10/24.
//

import Foundation

class ProductCarouselViewModel {
    
    private let product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    var title: String {
        return product.title
    }
    
    var price: String {
        return String(format: "%@ %.2f", product.currencyId, product.price)
    }
    
    var thumbnailURL: URL? {
        return URL(string: product.thumbnail)
    }
    
    var hasFreeShipping: Bool {
        return product.shipping.freeShipping
    }
    
    var freeShippingText: String {
        return hasFreeShipping ? "Frete Grátis" : ""
    }
}

