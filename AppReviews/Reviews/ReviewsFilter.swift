//
//  ReviewsFilter.swift
//  AppReviews
//
//  Created by Sander de Koning on 06/02/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import Foundation

protocol ReviewsFilter {
    func applied(to: [Review]) -> [Review]
}
