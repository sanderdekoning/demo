//
//  FeedViewModel.swift
//  AppReviews
//
//  Created by Sander de Koning on 02/02/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import Foundation

class FeedViewModel: FeedViewModelProtocol {
    private var input: ReviewsInputProtocol
    var showDetails: (@MainActor (Review) throws -> Void)?
    
    private(set) var reviews: ReviewsOutputProtocol
    
    init(
        input: some ReviewsInputProtocol,
        reviews: some ReviewsOutputProtocol = ReviewsOutput(source: Reviews()),
        showDetails: (@MainActor (Review) throws -> Void)? = nil
    ) {
        self.input = input
        self.reviews = reviews
        self.showDetails = showDetails
    }
    
    func updateReviews() async throws {
        try await reviews.source.set(reviews: input.reviews)
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
