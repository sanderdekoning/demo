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
        
        let window = UIWindow(windowScene: scene)
        self.window = window

        let coordinator = AppCoordinator()
        try? coordinator.start(presentation: .window(window: window))
    }
}

