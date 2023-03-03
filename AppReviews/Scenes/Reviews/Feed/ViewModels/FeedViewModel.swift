//
//  FeedViewModel.swift
//  AppReviews
//
//  Created by Sander de Koning on 02/02/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import Foundation

class FeedViewModel: FeedViewModelProtocol {
    let fetcher: ReviewsURLFetcherProtocol
    var showDetails: (@MainActor (Review) -> Void)?
    
    private(set) var reviews: ReviewsOutputProtocol

    init(
        fetcher: ReviewsURLFetcherProtocol = ReviewsHTTPFetcher(session: .shared),
        reviews: ReviewsOutputProtocol = ReviewsOutput(source: Reviews()),
        showDetails: (@MainActor (Review) -> Void)? = nil
    ) {
        self.fetcher = fetcher
        self.reviews = reviews
        self.showDetails = showDetails
    }
    
    func updateReviews() async throws {
        try await reviews.source.set(reviews: remoteReviews)
    }
    
    func apply(filter: ReviewsFilter?) {
        reviews.filter = filter
    }
    
    var mostWordOccurances: [String] {
        reviews.run(insights: ReviewsMostWordOccurancesInsights(
            fields: [\.content, \.title],
            preTransform: { $0.sorted() },
            minimumWordLength: 4,
            limit: 3
        ))
    }
}

private extension FeedViewModel {
    var remoteReviews: [Review] {
        get async throws {
            try await fetcher.reviews(from: AppleAppStoreReviewsHTTPSource()).reviews
        }
    }
}
