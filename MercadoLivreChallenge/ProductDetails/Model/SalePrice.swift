//
//  SalePrice.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 28/10/24.
//

import Foundation

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
