//
//  Review+AppleAppStore.swift
//  AppReviews
//
//  Created by Sander de Koning on 02/02/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import Foundation

extension AppleAppStoreReviews.Feed {
    struct Entry: Codable {
        let author: Author
        let updated: Label
        let identifier: Label
        let title: Label
        let content: Content
        let link: Link
        let imRating: Label
        let imVersion: Label
        let imVoteSum: Label
        let imContentType: IMContentType
        let imVoteCount: Label
        
        enum CodingKeys: String, CodingKey {
            case author
            case updated
            case identifier = "id"
            case title
            case content
            case link
            case imRating = "im:rating"
            case imVersion = "im:version"
            case imVoteSum = "im:voteSum"
            case imContentType = "im:contentType"
            case imVoteCount = "im:voteCount"
        }
    }
}

extension AppleAppStoreReviews.Feed.Entry {
    struct Author: Codable {
        let name: AppleAppStoreReviews.Feed.Label
        let uri: AppleAppStoreReviews.Feed.Label
        let label: String
    }
    
    struct Content: Codable {
        struct Attributes: Codable {
            let type: String
        }
        
        let label: String
        let attributes: Attributes
    }
    
    struct IMContentType: Codable {
        struct Attributes: Codable {
            let term: String
            let label: String
        }
        
        let attributes: Attributes
    }
}
