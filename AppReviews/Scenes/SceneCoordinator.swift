//
//  Coordinator.swift
//  AppReviews
//
//  Created by Sander de Koning on 03/03/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import UIKit

typealias SceneCoordinator = SceneCoordinatorBase & SceneCoordinatorProtocol

@MainActor protocol SceneCoordinatorProtocol {
    func start(presentation: ScenePresentation) throws
}

@MainActor class SceneCoordinatorBase {
    func display(viewController: UIViewController, presentation: ScenePresentation) {
        switch presentation {
        case .present(let presenter, let animated):
            presenter.present(viewController, animated: animated)
        case .push(let navigationController, let animated):
            navigationController.pushViewController(viewController, animated: animated)
        case .root(let navigationController, let animated):
            navigationController.setViewControllers([viewController], animated: animated)
        case .window(let window):
            window.rootViewController = viewController
            window.makeKeyAndVisible()
        }
    }
}
