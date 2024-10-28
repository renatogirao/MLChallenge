//
//  Settings.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 28/10/24.
//

import Foundation

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
