//
//  Product.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 22/10/24.
//

import UIKit

struct Product: Codable {
    let id: String
    let title: String
    let price: Double
    let currencyId: String
    let availableQuantity: Int
    let condition: String
    let permalink: String
    let thumbnail: String
    let acceptMercadoPago: Bool
    let installments: Installments
    let shipping: Shipping
    let attributes: [Attribute]
}

struct Installments: Codable {
    let quantity: Int
    let amount: Double
    let rate: Double
    let currencyId: String
}

struct Shipping: Codable {
    let freeShipping: Bool
    let logisticType: String
    let storePickUp: Bool
}

struct Attribute: Codable {
    let name: String
    let valueName: String?
}

