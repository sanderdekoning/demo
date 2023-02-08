//
//  ReviewsInsights.swift
//  AppReviews
//
//  Created by Sander de Koning on 07/02/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import Foundation

protocol ReviewsInsights {
    associatedtype Insights
    
    func process(reviews: [Review]) -> Insights
}
