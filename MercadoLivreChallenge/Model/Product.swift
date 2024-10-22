//
//  Product.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 22/10/24.
//

import Foundation

struct Product: Codable {
    let id: String
    let title: String
    let price: Double
    let currencyId: String
    let availableQuantity: Int
    let condition: String
    let permalink: String
    let thumbnail: String
    let acceptMercadoPago: Bool
    let installments: Installments
    let shipping: Shipping
    let attributes: [Attribute]
}

struct Installments: Codable {
    let quantity: Int
    let amount: Double
    let rate: Double
    let currencyId: String
}

struct Shipping: Codable {
    let freeShipping: Bool
    let logisticType: String
    let storePickUp: Bool
}

struct Attribute: Codable {
    let name: String
    let valueName: String?
}

// mock
let exampleProduct = Product(
    id: "MLA810645375",
    title: "Motorola G6 Plus 64 Gb Nimbus",
    price: 17999,
    currencyId: "ARS",
    availableQuantity: 100,
    condition: "new",
    permalink: "https://www.mercadolibre.com.ar/p/MLA9452524",
    thumbnail: "http://mla-s2-p.mlstatic.com/795558-MLA31003306206_062019-I.jpg",
    acceptMercadoPago: true,
    installments: Installments(quantity: 12, amount: 2456.41, rate: 63.77, currencyId: "ARS"),
    shipping: Shipping(freeShipping: false, logisticType: "custom", storePickUp: true),
    attributes: [
        Attribute(name: "Marca", valueName: "Motorola"),
        Attribute(name: "Modelo de CPU", valueName: "4x2.2 GHz Cortex-A53/4x1.8 GHz Cortex-A53")
    ]
)

