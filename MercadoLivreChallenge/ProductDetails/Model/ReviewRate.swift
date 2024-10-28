//
//  ReviewRate.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 28/10/24.
//

import UIKit

struct ProductRate: Decodable {
    let rateAverage: String
    let status: Int

    enum CodingKeys: String, CodingKey {
        case rateAverage = "rating_average"
        case status
    }
}
