//
//  FeedViewModelProtocol.swift
//  AppReviews
//
//  Created by Sander de Koning on 08/02/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import Foundation

protocol FeedViewModelProtocol {
    var reviews: ReviewsOutputProtocol { get }
    
    func updateReviews() async throws
    func apply(filter: ReviewsFilter?)
    
    var mostWordOccurances: [String] { get }
    
    var showDetails: (@MainActor (Review) throws -> Void)? { get }
}
