//
//  Shipping.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 28/10/24.
//

import Foundation

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
