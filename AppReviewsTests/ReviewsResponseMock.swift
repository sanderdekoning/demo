//
//  ReviewsResponseMock.swift
//  AppReviewsTests
//
//  Created by Sander de Koning on 02/02/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import Foundation

final class ReviewsResponseMock {
    private static var appleAppStoreURL: URL {
        Bundle(for: self).url(
            forResource: "AppleAppStoreReviewsResponse",
            withExtension: ".json"
        )!
    }

    static var appleAppStore: Data {
        try! .init(contentsOf: appleAppStoreURL)
    }
}
