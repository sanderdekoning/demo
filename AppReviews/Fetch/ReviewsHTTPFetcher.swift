//
//  ReviewsHTTPFetcher.swift
//  AppReviews
//
//  Created by Sander de Koning on 02/02/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import Foundation

class ReviewsHTTPFetcher: ReviewsURLFetcherProtocol {
    private let session: URLSession

    init(session: URLSession) {
        self.session = session
    }
    
    func reviews<RS: ReviewsURLSourceProtocol>(from source: RS) async throws -> RS.responseModel {
        let (data, _) = try await session.data(from: source.url)
        return try source.parser.parse(data: data, to: RS.responseModel.self)
    }
}
