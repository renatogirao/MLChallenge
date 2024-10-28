//
//  CategoryDetail.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 28/10/24.
//

import Foundation

struct CategoryDetail: Decodable {
    let id: String
    let name: String
    let picture: String
    let permalink: String?
    let totalItemsInThisCategory: Int?
    let pathFromRoot: [Category]?
    let childrenCategories: [ChildCategory]?
    let attributeTypes: String?
    let settings: Settings?
    let channelsSettings: [ChannelSetting]?
    let metaCategId: String?
    let attributable: Bool?
    let dateCreated: String?

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

