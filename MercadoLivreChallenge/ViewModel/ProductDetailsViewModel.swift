//
//  ProductViewModel.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 22/10/24.
//

import UIKit

class ProducDetailsViewModel {
    
    private let product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    var productTitle: String {
        return product.title
    }
    
    var productPrice: String {
        let formattedPrice = String(format: "%.2f", product.price)
        return "\(product.currencyId) \(formattedPrice)"
    }
    
    var productRating: String {
        return "\(product.installments.quantity) ⭐ (\(product.availableQuantity) reviews)"
    }
    
    var productDescription: String {
        return product.attributes.map { "\($0.name): \($0.valueName ?? "")" }.joined(separator: "\n")
    }
    
    var productCondition: String {
        return product.condition == "new" ? "Novo" : "Usado"
    }
    
    var productImageUrl: String? {
        return product.thumbnail
    }
    
    var acceptMercadoPago: Bool {
        return product.acceptMercadoPago
    }
    
    var productPermalink: String {
        return product.permalink
    }
    
    var installmentText: String {
        let quantity = product.installments.quantity
        let amount = String(format: "%.2f", product.installments.amount)
        return "\(quantity)x de \(amount) \(product.installments.currencyId)"
    }
    
    var hasFreeShipping: Bool {
        return product.shipping.freeShipping
    }
}
