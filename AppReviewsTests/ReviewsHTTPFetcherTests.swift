//
//  AppReviewsTests.swift
//  AppReviewsTests
//
//  Created by Sander de Koning on 02/02/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import XCTest
@testable import AppReviews

final class ReviewsHTTPFetcherTests: XCTestCase {
    var sut: ReviewsHTTPFetcher!

    override func setUpWithError() throws {
        sut = ReviewsHTTPFetcher(session: .shared)
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testReviews() async throws {
        let source = AppleAppStoreReviewsHTTPSource()

        let response = URLProtocolMock.MockURLResponse(
            response: .init(
                url: try source.url,
                statusCode: 200,
                httpVersion: "2.0",
                headerFields: nil
            )!,
            data: ReviewsResponseMock.appleAppStore
        )
        
        URLProtocolMock.requestHandler = { _ in response }

        _ = try await sut.reviews(from: source)
    }
}
