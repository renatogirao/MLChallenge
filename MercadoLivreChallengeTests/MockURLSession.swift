//
//  MockURLSession.swift
//  MercadoLivreChallengeTests
//
//  Created by Renato Savoia Girão on 28/10/24.
//

import Foundation

class MockURLSession: URLSession {
    private let mockData: Data?
    private let mockResponse: URLResponse?
    private let mockError: Error?

    init(data: Data?, urlResponse: URLResponse?, error: Error?) {
        self.mockData = data
        self.mockResponse = urlResponse
        self.mockError = error
    }
    
    override func dataTask(
        with url: URL,
        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
    ) -> URLSessionDataTask {
        
        return MockURLSessionDataTask {
            completionHandler(self.mockData, self.mockResponse, self.mockError)
        }
    }
}

class MockURLSessionDataTask: URLSessionDataTask {
    private let completion: () -> Void
    
    init(completion: @escaping () -> Void) {
        self.completion = completion
    }
    
    override func resume() {
        completion()
    }
}
