//
//  Reviews.swift
//  AppReviews
//
//  Created by Sander de Koning on 05/02/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import Foundation
import Combine

actor Reviews: ReviewsActor {
    var value: [Review] {
        didSet {
            publisher.value = value
        }
    }
    
    nonisolated let publisher: CurrentValueSubject<[Review], Never>

    init(reviews: [Review] = []) {
        value = reviews
        publisher = .init(reviews)
    }
    
    func set(reviews: [Review]) {
        value = reviews
    }
}
