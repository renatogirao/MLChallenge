//
//  Installments.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 28/10/24.
//

import Foundation

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
