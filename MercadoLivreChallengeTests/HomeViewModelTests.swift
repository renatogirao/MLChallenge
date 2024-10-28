//
//  HomeViewModelTests.swift
//  MercadoLivreChallengeTests
//
//  Created by Renato Savoia Girão on 28/10/24.
//

import XCTest
@testable import MercadoLivreChallenge

final class HomeViewModelTests: XCTestCase {
    
    let mockCategoryDetail = CategoryDetail(
        id: "MLB123",
        name: "Eletrônicos",
        picture: "http://example.com/picture.jpg",
        permalink: "http://example.com/permalink",
        totalItemsInThisCategory: 100,
        pathFromRoot: [Category(id: "MLB123", name: "Eletrônicos")],
        childrenCategories: [],
        attributeTypes: "attributes",
        settings: nil,  // Ajuste conforme a definição do seu Settings
        channelsSettings: [],
        metaCategId: nil,
        attributable: true,
        dateCreated: "2024-10-28T10:00:00.000Z"
    )
    
    var viewModel: HomeViewModel!
    var mockNetworkingManager: MockNetworkingManager!
    
    override func setUp() {
        super.setUp()
        mockNetworkingManager = MockNetworkingManager()
        viewModel = HomeViewModel(networkingManager: mockNetworkingManager)
    }
    
    override func tearDown() {
        viewModel = nil
        mockNetworkingManager = nil
        super.tearDown()
    }
    
    // MARK: - Test Fetching Categories
    
    func testFetchAllCategoriesSuccess() {
        let mockCategories = [Category(id: "MLB123", name: "Eletrônicos")]
        mockNetworkingManager.mockData = mockCategories
        
        let expectation = XCTestExpectation(description: "Categories should be updated successfully")
        
        viewModel.productsUpdated = {
            XCTAssertEqual(self.viewModel.categories.count, mockCategories.count)
            XCTAssertEqual(self.viewModel.categories.first?.id, mockCategories.first?.id)
            expectation.fulfill()
        }
        
        viewModel.fetchAllCategories()
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testFetchAllCategoriesFailure() {
        let mockError = APIError.requestFailed(NSError(domain: "NetworkError", code: -1, userInfo: nil))
        mockNetworkingManager.mockError = mockError
        
        let expectation = XCTestExpectation(description: "An error should occur while fetching categories")
        
        viewModel.errorOccurred = { error in
            XCTAssertEqual(error as? APIError, mockError)
            expectation.fulfill()
        }
        
        viewModel.fetchAllCategories()
        wait(for: [expectation], timeout: 5.0)
    }
    
    // MARK: - Test Category Detail Fetching
    
    func testCategoryDetailFetchSuccess() {
        
        mockNetworkingManager.mockData = mockCategoryDetail
        
        let expectation = XCTestExpectation(description: "Category details should be fetched successfully")
        
        viewModel.categoryDetail(for: Category(id: "MLB123", name: "Eletrônicos")) { result in
            if case .success(let detail) = result {
                XCTAssertEqual(detail.id, self.mockCategoryDetail.id)
                XCTAssertEqual(detail.picture, self.mockCategoryDetail.picture)
                expectation.fulfill()
            }
        }
    }
}


