//
//  Attribute.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 28/10/24.
//

import Foundation

struct Attribute: Codable {
    let id: String
    let name: String
    let valueId: String?
    let valueName: String?

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case valueId = "value_id"
        case valueName = "value_name"
    }
}
