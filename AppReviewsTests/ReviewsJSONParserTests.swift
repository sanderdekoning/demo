//
//  AppReviewsTests.swift
//  AppReviewsTests
//
//  Created by Sander de Koning on 02/02/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import XCTest
@testable import AppReviews

final class ReviewsParserTests: XCTestCase {
    var sut: ReviewsJSONParser!

    override func setUpWithError() throws {
        sut = ReviewsJSONParser()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testParse() throws {
        let reviews = try sut.parse(data: ReviewsResponseMock.appleAppStore, to: AppleAppStoreReviews.self)
        
        XCTAssertEqual(
            reviews.feed.author.name.label,
            "iTunes Store"
        )
        XCTAssertEqual(
            reviews.feed.identifier.label,
            "https://mzstoreservices-int-st.itunes.apple.com/nl/rss/customerreviews/id=474495017/sortby=mostrecent/json"
        )
    }
}
