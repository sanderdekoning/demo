//
//  AppCoordinator.swift
//  AppReviews
//
//  Created by Sander de Koning on 03/03/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import UIKit

class AppCoordinator: SceneCoordinator {
    func start(presentation: ScenePresentation) throws {
        let navigationController = UINavigationController()
        display(viewController: navigationController, presentation: presentation)

        let coordinator = ReviewsSceneCoordinator()
        try coordinator.start(presentation: .root(navigationController: navigationController, animated: false))
    }
}
