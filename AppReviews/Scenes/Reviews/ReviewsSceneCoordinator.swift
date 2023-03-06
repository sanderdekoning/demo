//
//  FeedSceneCoordinator.swift
//  AppReviews
//
//  Created by Sander de Koning on 03/03/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import UIKit

class ReviewsSceneCoordinator: SceneCoordinator {    
    func start(presentation: ScenePresentation) throws {
        let coordinator = FeedSceneCoordinator()
        try coordinator.start(presentation: presentation)
    }
}