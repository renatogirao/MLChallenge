//
//  MainModelTests.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 28/10/24.
//

import XCTest

@testable import MercadoLivreChallenge

final class ModelTests: XCTestCase {

    func testPictureDecoding() throws {
        let json = """
        {
            "id": "123",
            "url": "http://example.com/image.jpg",
            "secure_url": "https://example.com/image.jpg",
            "size": "500x500",
            "max_size": "1000x1000",
            "quality": "high"
        }
        """.data(using: .utf8)!
        
        let picture = try JSONDecoder().decode(Picture.self, from: json)
        
        XCTAssertEqual(picture.id, "123")
        XCTAssertEqual(picture.url, "http://example.com/image.jpg")
        XCTAssertEqual(picture.secureURL, "https://example.com/image.jpg")
        XCTAssertEqual(picture.size, "500x500")
        XCTAssertEqual(picture.maxSize, "1000x1000")
        XCTAssertEqual(picture.quality, "high")
    }
    
    func testProductDecoding() throws {
        let json = """
        {
            "id": "123",
            "title": "Produto Teste",
            "condition": "new",
            "thumbnail": "http://example.com/image.jpg",
            "currency_id": "BRL",
            "price": 199.99,
            "available_quantity": 5,
            "permalink": "http://example.com/product",
            "accepts_mercadopago": true,
            "shipping": {
                "free_shipping": true,
                "logistic_type": "cross_docking",
                "store_pick_up": false
            },
            "installments": {
                "quantity": 10,
                "amount": 20.0,
                "rate": 0.0,
                "currency_id": "BRL"
            },
            "attributes": [],
            "sale_price": null,
            "description": "Descrição do produto",
            "pictures": [],
            "warranty": "12 meses"
        }
        """.data(using: .utf8)!
        
        let product = try JSONDecoder().decode(Product.self, from: json)
        
        XCTAssertEqual(product.id, "123")
        XCTAssertEqual(product.title, "Produto Teste")
        XCTAssertEqual(product.condition, "new")
        XCTAssertEqual(product.thumbnail, "http://example.com/image.jpg")
        XCTAssertEqual(product.currencyId, "BRL")
        XCTAssertEqual(product.price, 199.99)
        XCTAssertEqual(product.availableQuantity, 5)
        XCTAssertEqual(product.permalink, "http://example.com/product")
        XCTAssertEqual(product.acceptsMercadoPago, true)
        XCTAssertEqual(product.description, "Descrição do produto")
        XCTAssertEqual(product.warranty, "12 meses")
    }
    
    func testSearchResponseDecoding() throws {
        let json = """
        {
            "site_id": "MLB",
            "query": "Teste",
            "paging": {
                "total": 100,
                "offset": 0,
                "limit": 10,
                "primary_results": 5
            },
            "results": []
        }
        """.data(using: .utf8)!
        
        let response = try JSONDecoder().decode(SearchResponse.self, from: json)
        
        XCTAssertEqual(response.siteId, "MLB")
        XCTAssertEqual(response.query, "Teste")
        XCTAssertEqual(response.paging.total, 100)
        XCTAssertEqual(response.paging.offset, 0)
        XCTAssertEqual(response.paging.limit, 10)
        XCTAssertEqual(response.paging.primaryResults, 5)
        XCTAssertTrue(response.results.isEmpty)
    }
    
    func testPagingDecoding() throws {
        let json = """
        {
            "total": 200,
            "offset": 10,
            "limit": 20,
            "primary_results": 15
        }
        """.data(using: .utf8)!
        
        let paging = try JSONDecoder().decode(Paging.self, from: json)
        
        XCTAssertEqual(paging.total, 200)
        XCTAssertEqual(paging.offset, 10)
        XCTAssertEqual(paging.limit, 20)
        XCTAssertEqual(paging.primaryResults, 15)
    }
        
        func testAttributeDecoding() throws {
            let json = """
            {
                "id": "123",
                "name": "Color",
                "value_id": "456",
                "value_name": "Red"
            }
            """.data(using: .utf8)!
            
            let attribute = try JSONDecoder().decode(Attribute.self, from: json)
            
            XCTAssertEqual(attribute.id, "123")
            XCTAssertEqual(attribute.name, "Color")
            XCTAssertEqual(attribute.valueId, "456")
            XCTAssertEqual(attribute.valueName, "Red")
        }
        
        func testAttributeDecodingWithNilValues() throws {
            let json = """
            {
                "id": "123",
                "name": "Color",
                "value_id": null,
                "value_name": null
            }
            """.data(using: .utf8)!
            
            let attribute = try JSONDecoder().decode(Attribute.self, from: json)
            
            XCTAssertEqual(attribute.id, "123")
            XCTAssertEqual(attribute.name, "Color")
            XCTAssertNil(attribute.valueId)
            XCTAssertNil(attribute.valueName)
        }
        
        func testInstallmentsDecoding() throws {
            let json = """
            {
                "quantity": 12,
                "amount": 100.0,
                "rate": 1.5,
                "currency_id": "BRL"
            }
            """.data(using: .utf8)!
            
            let installments = try JSONDecoder().decode(Installments.self, from: json)
            
            XCTAssertEqual(installments.quantity, 12)
            XCTAssertEqual(installments.amount, 100.0)
            XCTAssertEqual(installments.rate, 1.5)
            XCTAssertEqual(installments.currencyId, "BRL")
        }
    }
