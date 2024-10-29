//
//  Picture.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 28/10/24.
//

import UIKit

struct Picture: Codable {
    let id: String
    let url: String
    let secureURL: String
    let size: String
    let maxSize: String
    let quality: String?

    private enum CodingKeys: String, CodingKey {
        case id
        case url
        case secureURL = "secure_url"
        case size
        case maxSize = "max_size"
        case quality
    }
}
