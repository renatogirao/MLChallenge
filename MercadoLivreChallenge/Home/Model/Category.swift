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

struct CategoryDetail: Decodable {
    let id: String
    let name: String
    let picture: String
    let permalink: String
    let totalItemsInThisCategory: Int
    let pathFromRoot: [Category]
    let childrenCategories: [ChildCategory]
    let attributeTypes: String
    let settings: Settings? // Tornar opcional
    let channelsSettings: [ChannelSetting]
    let metaCategId: String? // Permitir valores nulos
    let attributable: Bool
    let dateCreated: String

    private enum CodingKeys: String, CodingKey {
        case id, name, picture, permalink
        case totalItemsInThisCategory = "total_items_in_this_category"
        case pathFromRoot = "path_from_root"
        case childrenCategories = "children_categories"
        case attributeTypes = "attribute_types"
        case settings
        case channelsSettings = "channels_settings"
        case metaCategId = "meta_categ_id"
        case attributable
        case dateCreated = "date_created"
    }
}

struct Settings: Decodable {
    let adultContent: Bool?
    let buyingAllowed: Bool?
    let buyingModes: [String]?
    let catalogDomain: String?
    let coverageAreas: String?
    let currencies: [String]?
    let fragile: Bool?
    let immediatePayment: String?
    let itemConditions: [String]?
    let itemsReviewsAllowed: Bool?
    let listingAllowed: Bool?
    let maxDescriptionLength: Int?
    let maxPicturesPerItem: Int?
    let maxPicturesPerItemVar: Int?
    let maxSubTitleLength: Int?
    let maxTitleLength: Int?
    let maxVariationsAllowed: Int?
    let maximumPrice: String?
    let maximumPriceCurrency: String?
    let minimumPrice: Int?
    let minimumPriceCurrency: String?
    let mirrorCategory: String?
    let mirrorMasterCategory: String?
    let mirrorSlaveCategories: [String]?
    let price: String?
    let reservationAllowed: String?
    let restrictions: [String]?
    let roundedAddress: Bool?
    let sellerContact: String?
    let shippingOptions: [String]?
    let shippingProfile: String?
    let showContactInformation: Bool?
    let simpleShipping: String?
    let stock: String?
    let subVertical: String?
    let subscribable: Bool?
    let tags: [String]?
    let vertical: String?
    let vipSubdomain: String?
    let buyerProtectionPrograms: [String]?
    let status: String?
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
    let settings: ChannelSettings

    private enum CodingKeys: String, CodingKey {
        case channel
        case settings
    }
}

struct ChannelSettings: Decodable {
    let minimumPrice: Int?

    private enum CodingKeys: String, CodingKey {
        case minimumPrice = "minimum_price"
    }
}
