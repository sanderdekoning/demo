//
//  AppleAppStoreReviews+Reviews.swift
//  AppReviews
//
//  Created by Sander de Koning on 03/02/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import Foundation

extension AppleAppStoreReviews.Feed.Entry: ReviewMapProtocol {
    var review: Review {
        .init(
            author: author.name.label,
            version: imVersion.label,
            rating: Int(imRating.label) ?? 0,
            title: title.label,
            identifier: identifier.label,
            content: content.label
        )
    }
}

extension AppleAppStoreReviews: ReviewsMapProtocol {
    var reviews: [Review] {
        feed.entry.map { $0.review }
    }
}
