//
//  Category.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 22/10/24.
//

import Foundation

struct Category: Decodable {
    let id: String
    let name: String
}

struct ChildCategory: Decodable {
    let id: String
    let name: String
    let totalItemsInThisCategory: Int

    private enum CodingKeys: String, CodingKey {
        case id, name
        case totalItemsInThisCategory = "total_items_in_this_category"
    }
}

struct ChannelSetting: Decodable {
    let channel: String
    let settings: ChannelSettingsPrice

    private enum CodingKeys: String, CodingKey {
        case channel
        case settings
    }
}

struct ChannelSettingsPrice: Decodable {
    let minimumPrice: Int?

    private enum CodingKeys: String, CodingKey {
        case minimumPrice = "minimum_price"
    }
}
