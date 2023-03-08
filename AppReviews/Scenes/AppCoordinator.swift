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
        let tabBarController = UITabBarController()
        display(viewController: tabBarController, presentation: presentation)
        
        let coordinator = ReviewsSceneCoordinator(
            input: ReviewsInputFetchURL(source: ReviewsSourceHTTPAppleAppStore(appID: "1108187098"))
        )
        try coordinator.start(presentation: .append(tabBarController: tabBarController, animated: false))
    }
}
