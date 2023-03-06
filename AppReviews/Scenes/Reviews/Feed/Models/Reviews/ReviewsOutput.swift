//
//  ReviewsOutput.swift
//  AppReviews
//
//  Created by Sander de Koning on 06/02/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import Foundation

struct ReviewsOutput: ReviewsOutputProtocol {
    let source: Reviews
    var filter: ReviewsFilter?
    
    var output: [Review] {
        var output = source.publisher.value

        if let filter {
            output = filter.applied(to: output)
        }
        
        return output
    }
    
    var equalsSource: Bool {
        filter == nil
    }
    
    func run<RI: ReviewsInsights>(insights: RI) -> RI.Insights {
        insights.process(reviews: output)
    }
}
