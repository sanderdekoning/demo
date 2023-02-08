//
//  ReviewsOutputProtocol.swift
//  AppReviews
//
//  Created by Sander de Koning on 06/02/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import Foundation

protocol ReviewsOutputProtocol {
    var source: Reviews { get }
    var filter: ReviewsFilter? { get set }
    var output: [Review] { get }
    var equalsSource: Bool { get }
    
    func run<RI: ReviewsInsights>(insights: RI) -> RI.Insights
}
