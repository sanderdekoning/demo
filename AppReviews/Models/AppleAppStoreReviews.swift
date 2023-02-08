//
//  ReviewFeed.swift
//  AppReviews
//
//  Created by Sander de Koning on 02/02/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import Foundation

struct AppleAppStoreReviews: Codable {
    let feed: Feed
}

extension AppleAppStoreReviews {
    struct Feed: Codable {
        let author: Author
        let entry: [Entry]
        let updated: Label
        let rights: Label
        let title: Label
        let icon: Label
        let link: [Link]
        let identifier: Label
        
        enum CodingKeys: String, CodingKey {
            case author
            case entry
            case updated
            case rights
            case title
            case icon
            case link
            case identifier = "id"
        }
    }
}

extension AppleAppStoreReviews.Feed {
    struct Label: Codable {
        let label: String
    }
    
    struct Link: Codable {
        struct Attributes: Codable {
            let rel: String
            let href: String
        }
        
        let attributes: Attributes
    }
    
    struct Author: Codable {
        let name: Label
        let uri: Label
    }
}
