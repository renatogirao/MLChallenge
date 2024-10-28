//
//  NetworkingManagerTests.swift
//  MercadoLivreChallengeTests
//
//  Created by Renato Savoia Girão on 28/10/24.
//

import XCTest
@testable import MercadoLivreChallenge

final class NetworkingManagerTests: XCTestCase {
    
    var networkingManager: NetworkingManager!
    let timeout: TimeInterval = 10.0
    
    override func setUp() {
        super.setUp()
        networkingManager = NetworkingManager()
    }
    
    override func tearDown() {
        networkingManager = nil
        super.tearDown()
    }

    // MARK: - Testing URL for all endpoints
    
    func testURLConstructionForCategoriesEndpoint() {
        let endpoint = APIEndpoint.categories
        let expectedURL = "https://api.mercadolibre.com/sites/MLB/categories"
        XCTAssertEqual(networkingManager.baseURL + endpoint.path, expectedURL)
    }
    
    func testURLConstructionForSearchEndpoint() {
        let searchText = "GoPro Hero 12"
        let endpoint = APIEndpoint.search(searchText: searchText)
        let expectedURL = "https://api.mercadolibre.com/sites/MLB/search?q=GoPro%20Hero%2012"
        XCTAssertEqual(networkingManager.baseURL + endpoint.path, expectedURL)
    }
    
    func testURLConstructionForProductEndpoint() {
        let productId = "MLB123456789"
        let endpoint = APIEndpoint.product(productId: productId)
        let expectedURL = "https://api.mercadolibre.com/items/\(productId)"
        XCTAssertEqual(networkingManager.baseURL + endpoint.path, expectedURL)
    }

    // MARK: - Test API Responses
    
    func testFetchDataWithInvalidURL() {
        let endpoint = APIEndpoint.product(productId: "")
        let expectation = XCTestExpectation(description: "Completion must return an invalid URL error")

        networkingManager.fetchData(from: endpoint, responseType: Product.self) { result in
            if case .failure(let error) = result {
                XCTAssertEqual(error, APIError.invalidURL)
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: timeout)
    }
        
    func testFetchDataWithDecodingError() {
        let endpoint = APIEndpoint.product(productId: "MLB123456789")
        let invalidData = "{ invalid json }".data(using: .utf8)!
        
        let mockURLSession = MockURLSession(data: invalidData, urlResponse: nil, error: nil)
        networkingManager.urlSession = mockURLSession
        
        let expectation = XCTestExpectation(description: "Completion should return decoding error")
        
        networkingManager.fetchData(from: endpoint, responseType: Product.self) { result in
            if case .failure(let error) = result {
                if case .decodingFailed(let decodingError) = error {
                    XCTAssertNotNil(decodingError)
                    expectation.fulfill()
                } else {
                    XCTFail("Expected decodingFailed error")
                }
            }
        }
        
        wait(for: [expectation], timeout: timeout)
    }

    func testFetchDataWithNetworkError() {
        let endpoint = APIEndpoint.product(productId: "MLB123456789")
        let networkError = NSError(domain: "NetworkError", code: -1009, userInfo: nil)
        
        let mockURLSession = MockURLSession(data: nil, urlResponse: nil, error: networkError)
        networkingManager = NetworkingManager(urlSession: mockURLSession)
        
        let expectation = XCTestExpectation(description: "Completion should return network error")
        
        networkingManager.fetchData(from: endpoint, responseType: Product.self) { result in
            if case .failure(let error) = result {
                if case .requestFailed(let receivedError) = error {
                    XCTAssertEqual(receivedError.localizedDescription, networkError.localizedDescription)
                    expectation.fulfill()
                } else {
                    XCTFail("Expected requestFailed error")
                }
            }
        }
        
        wait(for: [expectation], timeout: 10.0)
    }}

