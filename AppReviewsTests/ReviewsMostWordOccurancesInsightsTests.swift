//
//  ReviewsMostWordOccurancesInsightsTests.swift
//  AppReviewsTests
//
//  Created by Sander de Koning on 07/02/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import XCTest
@testable import AppReviews

final class ReviewsMostWordOccurancesInsightsTests: XCTestCase {
    let reviews = try! ReviewsJSONParser().parse(
        data: ReviewsResponseMock.appleAppStore,
        to: AppleAppStoreReviews.self
    )

    func testParse_fieldsContent_pretransformSorted_minimumWordLength4_limit4() throws {
        let sut = ReviewsMostWordOccurancesInsights(
            fields: [\.content],
            preTransform: { $0.sorted() },
            minimumWordLength: 4,
            limit: 4
        )
        
        let insights = sut.process(reviews: reviews.reviews)
        
        XCTAssertEqual(insights, ["niet", "werkt", "maar", "meer"])
    }
    
    func testParse_fieldsTitle_pretransformSorted_minimumWordLength5_limit2() throws {
        let sut = ReviewsMostWordOccurancesInsights(
            fields: [\.title],
            preTransform: { $0.sorted() },
            minimumWordLength: 5,
            limit: 2
        )
        
        let insights = sut.process(reviews: reviews.reviews)
        
        XCTAssertEqual(insights, ["werkt", "prima"])
    }

    func testParse_fieldsTitle_pretransformSorted_minimumWordLength4_limit10() throws {
        let sut = ReviewsMostWordOccurancesInsights(
            fields: [\.title],
            preTransform: { $0.sorted() },
            minimumWordLength: 4,
            limit: 10
        )
        
        let insights = sut.process(reviews: reviews.reviews)
        
        XCTAssertEqual(insights, [
            "niet", "werkt", "meer", "prima", "storing", "widget", "doet", "maar", "problemen", "foutmelding"
        ])
    }
    
    func testParse_fieldsTitle_pretransformSortedDescending_minimumWordLength4_limit10() throws {
        let sut = ReviewsMostWordOccurancesInsights(
            fields: [\.title],
            preTransform: { $0.sorted(by: >) },
            minimumWordLength: 4,
            limit: 10
        )
        
        let insights = sut.process(reviews: reviews.reviews)
        
        XCTAssertEqual(insights, [
            "niet", "werkt", "widget", "storing", "prima", "meer", "problemen", "maar", "doet", "update"
        ])
    }
    
    func testParse_fieldsTitleContent_pretransformSortedDescending_minimumWordLength4_limit10() throws {
        let sut = ReviewsMostWordOccurancesInsights(
            fields: [\.title, \.content],
            preTransform: { $0.sorted(by: >) },
            minimumWordLength: 4,
            limit: 10
        )
        
        let insights = sut.process(reviews: reviews.reviews)
        
        XCTAssertEqual(insights, [
            "niet", "werkt", "meer", "maar", "weer", "voor", "mijn", "widget", "geen", "update"
        ])
    }
}

