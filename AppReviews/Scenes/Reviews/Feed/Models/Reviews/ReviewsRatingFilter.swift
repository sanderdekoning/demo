//
//  ReviewsRatingFilter.swift
//  AppReviews
//
//  Created by Sander de Koning on 06/02/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import Foundation

struct ReviewsRatingFilter: ReviewsFilter {
    let rating: Int
    
    func applied(to reviews: [Review]) -> [Review] {
        reviews.filter { $0.rating == rating }
    }
}
