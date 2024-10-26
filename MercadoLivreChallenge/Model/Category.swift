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
    let settings: Settings
    let channelsSettings: [ChannelSetting]
    let metaCategId: String?
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

struct ChildCategory: Decodable {
    let id: String
    let name: String
    let totalItemsInThisCategory: Int

    private enum CodingKeys: String, CodingKey {
        case id, name
        case totalItemsInThisCategory = "total_items_in_this_category"
    }
}

struct Settings: Decodable {
    let adultContent: Bool
    let buyingAllowed: Bool
    let buyingModes: [String]
    let catalogDomain: String
    let coverageAreas: String
    let currencies: [String]
    let fragile: Bool
    let immediatePayment: String
    let itemConditions: [String]
    let itemsReviewsAllowed: Bool
    let listingAllowed: Bool
    let maxDescriptionLength: Int
    let maxPicturesPerItem: Int
    let maxPicturesPerItemVar: Int
    let maxSubTitleLength: Int
    let maxTitleLength: Int
    let maxVariationsAllowed: Int
    let maximumPrice: String?
    let maximumPriceCurrency: String
    let minimumPrice: Int
    let minimumPriceCurrency: String
    let mirrorCategory: String?
    let mirrorMasterCategory: String?
    let mirrorSlaveCategories: [String]
    let price: String
    let reservationAllowed: String
    let restrictions: [String]
    let roundedAddress: Bool
    let sellerContact: String
    let shippingOptions: [String]
    let shippingProfile: String
    let showContactInformation: Bool
    let simpleShipping: String
    let stock: String
    let subVertical: String
    let subscribable: Bool
    let tags: [String]
    let vertical: String
    let vipSubdomain: String
    let buyerProtectionPrograms: [String]
    let status: String

    private enum CodingKeys: String, CodingKey {
        case adultContent = "adult_content"
        case buyingAllowed = "buying_allowed"
        case buyingModes = "buying_modes"
        case catalogDomain = "catalog_domain"
        case coverageAreas = "coverage_areas"
        case currencies
        case fragile
        case immediatePayment = "immediate_payment"
        case itemConditions = "item_conditions"
        case itemsReviewsAllowed = "items_reviews_allowed"
        case listingAllowed = "listing_allowed"
        case maxDescriptionLength = "max_description_length"
        case maxPicturesPerItem = "max_pictures_per_item"
        case maxPicturesPerItemVar = "max_pictures_per_item_var"
        case maxSubTitleLength = "max_sub_title_length"
        case maxTitleLength = "max_title_length"
        case maxVariationsAllowed = "max_variations_allowed"
        case maximumPrice = "maximum_price"
        case maximumPriceCurrency = "maximum_price_currency"
        case minimumPrice = "minimum_price"
        case minimumPriceCurrency = "minimum_price_currency"
        case mirrorCategory = "mirror_category"
        case mirrorMasterCategory = "mirror_master_category"
        case mirrorSlaveCategories = "mirror_slave_categories"
        case price
        case reservationAllowed = "reservation_allowed"
        case restrictions
        case roundedAddress = "rounded_address"
        case sellerContact = "seller_contact"
        case shippingOptions = "shipping_options"
        case shippingProfile = "shipping_profile"
        case showContactInformation = "show_contact_information"
        case simpleShipping = "simple_shipping"
        case stock
        case subVertical = "sub_vertical"
        case subscribable
        case tags
        case vertical
        case vipSubdomain = "vip_subdomain"
        case buyerProtectionPrograms = "buyer_protection_programs"
        case status
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
