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
    let condition: String
    let thumbnail: String
    let currencyId: String
    let price: Double
    let availableQuantity: Int
    let permalink: String
    let acceptsMercadoPago: Bool
    let shipping: Shipping
    let installments: Installments?
    let attributes: [Attribute]
    let salePrice: SalePrice?

    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case condition
        case thumbnail
        case currencyId = "currency_id"
        case price
        case availableQuantity = "available_quantity"
        case permalink
        case acceptsMercadoPago = "accepts_mercadopago"
        case shipping
        case installments
        case attributes
        case salePrice = "sale_price"
    }
}

struct Installments: Codable {
    let quantity: Int
    let amount: Double
    let rate: Double
    let currencyId: String

    private enum CodingKeys: String, CodingKey {
        case quantity
        case amount
        case rate
        case currencyId = "currency_id"
    }
}

struct SalePrice: Codable {
    let priceId: String?
    let amount: Double
    let currencyId: String
    let conditions: SaleConditions?

    private enum CodingKeys: String, CodingKey {
        case priceId = "price_id"
        case amount
        case currencyId = "currency_id"
        case conditions
    }
}

struct SaleConditions: Codable {
    let eligible: Bool
    let contextRestrictions: [String]
    let startTime: String?
    let endTime: String?

    private enum CodingKeys: String, CodingKey {
        case eligible
        case contextRestrictions = "context_restrictions"
        case startTime = "start_time"
        case endTime = "end_time"
    }
}

struct Shipping: Codable {
    let freeShipping: Bool
    let logisticType: String? 
    let storePickUp: Bool

    private enum CodingKeys: String, CodingKey {
        case freeShipping = "free_shipping"
        case logisticType = "logistic_type"
        case storePickUp = "store_pick_up"
    }
}

struct Attribute: Codable {
    let id: String
    let name: String
    let valueName: String?

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case valueName = "value_name"
    }
}
