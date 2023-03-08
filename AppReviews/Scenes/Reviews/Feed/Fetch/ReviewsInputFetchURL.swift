//
//  ReviewsInputFetchURL.swift
//  AppReviews
//
//  Created by Sander de Koning on 07/03/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import Foundation

class ReviewsInputFetchURL<S: SourceURLProtocol>: ReviewsInputProtocol where S.responseModel: ReviewsMapProtocol {
    let fetcher: URLFetcherProtocol
    private let source: S
    
    init(
        fetcher: some URLFetcherProtocol = HTTPFetcher(session: .shared),
        source: S
    ) {
        self.fetcher = fetcher
        self.source = source
    }
    
    var reviews: [Review] {
        get async throws {
            try await fetcher.fetch(from: source).reviews
        }
    }
}
