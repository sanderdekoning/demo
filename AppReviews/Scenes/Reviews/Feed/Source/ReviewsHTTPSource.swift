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

    private var urlString: String
    
    init(appID: String) {
        urlString = "https://itunes.apple.com/rss/customerreviews/id=\(appID)/sortby=mostrecent/json"
    }
    
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
