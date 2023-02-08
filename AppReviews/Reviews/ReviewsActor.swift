//
//  ReviewsActor.swift
//  AppReviews
//
//  Created by Sander de Koning on 06/02/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import Foundation
import Combine

protocol ReviewsActor: Actor {
    var value: [Review] { get }
    var publisher: CurrentValueSubject<[Review], Never> { get }
    
    func set(reviews: [Review])
}
