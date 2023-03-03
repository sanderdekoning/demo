//
//  SceneDelegate.swift
//  AppReviews
//
//  Created by Sander de Koning on 08/02/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let scene = scene as? UIWindowScene else {
            return
        }
        
        window = .init(windowScene: scene)
        window?.rootViewController = UINavigationController(
            rootViewController: FeedViewController(viewModel: FeedViewModel())
        )
        window?.makeKeyAndVisible()
    }
}

