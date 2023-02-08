//
//  ReviewsHTTPSource.swift
//  AppReviews
//
//  Created by Sander de Koning on 02/02/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import Foundation

struct AppleAppStoreReviewsHTTPSource: ReviewsURLSourceProtocol {
    typealias responseModel = AppleAppStoreReviews
    
    private var urlString = "https://itunes.apple.com/nl/rss/customerreviews/id=474495017/sortby=mostrecent/json"
    
    var url: URL {
        get throws {
            guard let url = URL(string: urlString) else {
                fatalError()
            }
            
            return url
        }
    }
    
    let parser: ReviewsParserProtocol = ReviewsJSONParser()
}
