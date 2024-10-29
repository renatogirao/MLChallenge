//
//  ProductDetailsViewControllerTests.swift
//  MercadoLivreChallengeTests
//
//  Created by Renato Savoia Girão on 28/10/24.
//

import XCTest
@testable import MercadoLivreChallenge

final class ProductDetailsViewControllerTests: XCTestCase {

    var viewController: ProductDetailsViewController!
    var mockViewModel: MockProductDetailsViewModel!
    var mockProductDetailsView: MockProductDetailsView!
    
    override func setUp() {
        super.setUp()
        
        mockViewModel = MockProductDetailsViewModel(productId: "123")
        mockProductDetailsView = MockProductDetailsView(viewModel: mockViewModel)
        
        viewController = ProductDetailsViewController(
            productId: "123",
            viewModel: mockViewModel,
            productDetailsView: mockProductDetailsView
        )
        
        viewController.loadViewIfNeeded()
    }

    
    override func tearDown() {
        viewController = nil
        mockViewModel = nil
        mockProductDetailsView = nil
        super.tearDown()
    }
    
    func testViewDidLoadSetsUpSubviews() {
        XCTAssertTrue(viewController.view.subviews.contains(viewController.productDetailsView))
    }
    
    func testLoadProductDetailsCallsFetchProductDetails() {
        viewController.loadProductDetails()
        XCTAssertTrue(mockViewModel.fetchProductDetailsCalled)
    }
    
    func testLoadProductDetailsSuccessUpdatesView() {
        mockViewModel.shouldReturnSuccess = true
        
        let expectation = expectation(description: "configure() should be called after successful data fetch")
        
        mockProductDetailsView.configureCalled = false
        mockProductDetailsView.configureCalledExpectation = expectation
        
        viewController.loadProductDetails()
        
        wait(for: [expectation], timeout: 5.0)
        
        XCTAssertTrue(mockProductDetailsView.configureCalled, "configure() não foi chamado em um caso de sucesso.")
    }
    
    func testLoadProductDetailsFailureDoesNotUpdateView() {
        mockViewModel.shouldReturnSuccess = false
        viewController.loadProductDetails()
        XCTAssertFalse(mockProductDetailsView.configureCalled)
    }
}

final class MockProductDetailsViewModel: ProductDetailsViewModel {
    var fetchProductDetailsCalled = false
    var shouldReturnSuccess = true
    
    override func fetchProductDetails(completion: @escaping (Result<Void, Error>) -> Void) {
        fetchProductDetailsCalled = true
        if shouldReturnSuccess {
            completion(.success(()))
        } else {
            completion(.failure(NSError(domain: "TestError", code: -1, userInfo: nil)))
        }
    }
}

final class MockProductDetailsView: ProductDetailsView {
    var configureCalled = false
    var configureCalledExpectation: XCTestExpectation?
    
    override func configure() {
        if !configureCalled {
            configureCalled = true
            configureCalledExpectation?.fulfill()
        }
    }
}
