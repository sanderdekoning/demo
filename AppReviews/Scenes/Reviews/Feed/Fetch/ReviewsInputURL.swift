//
//  ReviewsSourceURL.swift
//  AppReviews
//
//  Created by Sander de Koning on 07/03/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import Foundation

class ReviewsInputURL<S: ReviewsURLSourceProtocol>: ReviewsInputProtocol where S.responseModel: ReviewsMapProtocol {
    let fetcher: ReviewsURLFetcherProtocol
    private var source: S
    
    init(
        fetcher: some ReviewsURLFetcherProtocol = ReviewsHTTPFetcher(session: .shared),
        source: S
    ) {
        self.fetcher = fetcher
        self.source = source
    }
    
    var reviews: [Review] {
        get async throws {
            try await fetcher.reviews(from: source).reviews
        }
    }
}
