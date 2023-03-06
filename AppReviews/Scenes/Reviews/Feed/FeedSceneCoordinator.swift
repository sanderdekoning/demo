//
//  ReviewsSceneCoordinator.swift
//  AppReviews
//
//  Created by Sander de Koning on 03/03/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import UIKit

class FeedSceneCoordinator: SceneCoordinator {
    func start(presentation: ScenePresentation) throws {
        let viewModel = FeedViewModel()
        let feed = FeedViewController(viewModel: viewModel)

        viewModel.showDetails = { review in
            let coordinator = DetailSceneCoordinator(review: review)
            try? coordinator.start(presentation: presentation.continued(animated: true))
        }
        
        display(viewController: feed, presentation: presentation)
    }
}
