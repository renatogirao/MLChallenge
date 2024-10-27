//
//  SearchResponse.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 27/10/24.
//

import UIKit

struct SearchResponse: Codable {
    let siteId: String
    let query: String
    let paging: Paging
    let results: [Product]

    private enum CodingKeys: String, CodingKey {
        case siteId = "site_id"
        case query
        case paging
        case results
    }
}

struct Paging: Codable {
    let total: Int
    let offset: Int
    let limit: Int
    let primaryResults: Int

    private enum CodingKeys: String, CodingKey {
        case total
        case offset
        case limit
        case primaryResults = "primary_results"
    }
}
