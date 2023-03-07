//
//  FeedSceneCoordinator.swift
//  AppReviews
//
//  Created by Sander de Koning on 03/03/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import UIKit

class ReviewsSceneCoordinator: SceneCoordinator {
    let input: ReviewsInputProtocol
    
    init(input: some ReviewsInputProtocol) {
        self.input = input
    }

    func start(presentation: ScenePresentation) throws {
        let navigationController = UINavigationController()
        
        display(viewController: navigationController, presentation: presentation)
        
        let coordinator = FeedSceneCoordinator(input: input)
        try coordinator.start(presentation: .root(navigationController: navigationController, animated: false))
    }
}
