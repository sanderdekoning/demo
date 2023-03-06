//
//  Review.swift
//  AppReviews
//
//  Created by Sander de Koning on 08/02/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import Foundation

struct Review: Codable {
    let author: String
    let version: String
    let rating: Int
    let title: String
    let identifier: String
    let content: String
    
    static var starRepresentation = "⭐️"
    
    var ratingVersionText: String {
        let stars = String(repeating: Self.starRepresentation, count: rating)
        return "\(stars) (ver: \(version))"
    }
}
