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
    let picture: String
    let totalItemsInThisCategory: Int
}
