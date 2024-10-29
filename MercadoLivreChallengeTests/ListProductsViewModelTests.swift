//
//  ListProductsViewModelTests.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 28/10/24.
//

import XCTest

@testable import MercadoLivreChallenge

final class ListProductsViewModelTests: XCTestCase {
    
    var viewModel: ListProductsViewModel!
    var mockNetworkingManager: MockNetworkingManager!
    
    override func setUp() {
        super.setUp()
        mockNetworkingManager = MockNetworkingManager()
        viewModel = ListProductsViewModel(networkingManager: mockNetworkingManager)
    }
    
    override func tearDown() {
        viewModel = nil
        mockNetworkingManager = nil
        super.tearDown()
    }
    
    // MARK: - Test Successful Product Search
    
    func testSearchProductsSuccess() {
        let mockShipping = Shipping(freeShipping: true, logisticType: "cross_docking", storePickUp: false)
        let mockInstallments = Installments(quantity: 10, amount: 10.0, rate: 0.0, currencyId: "BRL")
        let mockAttributes = [Attribute(id: "123", name: "Color", valueId: "83427", valueName: "Red")]
        
        let mockProducts = [
            Product(
                id: "123",
                title: "Produto Teste",
                condition: "new",
                thumbnail: "http://example.com/image.jpg",
                currencyId: "BRL",
                price: 100.0,
                availableQuantity: 10,
                permalink: "http://example.com/product",
                acceptsMercadoPago: true,
                shipping: mockShipping,
                installments: mockInstallments,
                attributes: mockAttributes,
                salePrice: nil,
                description: "Descrição do produto",
                pictures: nil,
                warranty: "12 meses"
            )
        ]
        
        let mockPaging = Paging(total: 1, offset: 0, limit: 10, primaryResults: 1)
        let mockResponse = SearchResponse(
            siteId: "MLB",
            query: "Teste",
            paging: mockPaging,
            results: mockProducts
        )
        mockNetworkingManager.mockData = mockResponse
        
        let expectation = XCTestExpectation(description: "Products should be updated successfully")
        
        viewModel.productsUpdated = {
            XCTAssertEqual(self.viewModel.numberOfProducts, mockProducts.count)
            XCTAssertEqual(self.viewModel.product(at: 0).id, mockProducts.first?.id)
            expectation.fulfill()
        }
        
        viewModel.searchProducts(with: "Teste")
        wait(for: [expectation], timeout: 5.0)
    }


    
    // MARK: - Test Product Search with Error
    
    func testSearchProductsFailure() {
        // Configura o mock para retornar um erro
        let mockError = APIError.requestFailed(NSError(domain: "NetworkError", code: -1, userInfo: nil))
        mockNetworkingManager.mockError = mockError
        
        let expectation = XCTestExpectation(description: "An error should occur during product search")
        
        viewModel.errorOccurred = { error in
            XCTAssertEqual(error as? APIError, mockError)
            expectation.fulfill()
        }
        
        viewModel.searchProducts(with: "Teste")
        wait(for: [expectation], timeout: 5.0)
    }
    
    // MARK: - Test Properties Derived and Helper Methods
    
    func testNumberOfProducts() {
        let mockShipping = Shipping(freeShipping: true, logisticType: "cross_docking", storePickUp: false)
        let mockInstallments = Installments(quantity: 10, amount: 10.0, rate: 0.0, currencyId: "BRL")
        let mockAttributes = [Attribute(id: "123", name: "Color", valueId: "87534", valueName: "Red")]
        
        viewModel.products = [
            Product(
                id: "123",
                title: "Produto Teste",
                condition: "new",
                thumbnail: "http://example.com/image.jpg",
                currencyId: "BRL",
                price: 100.0,
                availableQuantity: 10,
                permalink: "http://example.com/product",
                acceptsMercadoPago: true,
                shipping: mockShipping,
                installments: mockInstallments,
                attributes: mockAttributes,
                salePrice: nil,
                description: "Descrição do produto",
                pictures: nil,
                warranty: "12 meses"
            )
        ]
        
        XCTAssertEqual(viewModel.numberOfProducts, 1)
    }

    func testProductAtIndex() {
        let mockShipping = Shipping(freeShipping: true, logisticType: "cross_docking", storePickUp: false)
        let mockInstallments = Installments(quantity: 10, amount: 10.0, rate: 0.0, currencyId: "BRL")
        let mockAttributes = [Attribute(id: "123", name: "Color", valueId: "53636", valueName: "Red")]
        
        let product = Product(
            id: "123",
            title: "Produto Teste",
            condition: "new",
            thumbnail: "http://example.com/image.jpg",
            currencyId: "BRL",
            price: 100.0,
            availableQuantity: 10,
            permalink: "http://example.com/product",
            acceptsMercadoPago: true,
            shipping: mockShipping,
            installments: mockInstallments,
            attributes: mockAttributes,
            salePrice: nil,
            description: "Descrição do produto",
            pictures: nil,
            warranty: "12 meses"
        )
        
        viewModel.products = [product]
        XCTAssertEqual(viewModel.product(at: 0).id, product.id)
    }
}

