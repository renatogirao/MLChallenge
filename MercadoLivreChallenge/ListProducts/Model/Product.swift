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
    let availableQuantity: Int?
    let permalink: String
    let acceptsMercadoPago: Bool
    let shipping: Shipping
    let installments: Installments?
    let attributes: [Attribute]
    let salePrice: SalePrice?
    let description: String?
    let pictures: [Picture]?
    let warranty: String?

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
        case description
        case pictures
        case warranty
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
