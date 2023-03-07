//
//  ReviewsSourceProtocol.swift
//  AppReviews
//
//  Created by Sander de Koning on 07/03/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import Foundation

protocol ReviewsInputProtocol {
    var reviews: [Review] { get async throws }
}
