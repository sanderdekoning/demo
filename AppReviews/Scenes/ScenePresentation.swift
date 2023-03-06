//
//  ScenePresentation.swift
//  AppReviews
//
//  Created by Sander de Koning on 04/03/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import UIKit

enum ScenePresentation {
    case window(window: UIWindow)
    case root(navigationController: UINavigationController, animated: Bool)
    case push(navigationController: UINavigationController, animated: Bool)
    case present(presenter: UIViewController, animated: Bool)
    case append(tabBarController: UITabBarController, animated: Bool)
    
    func continued(animated: Bool) -> Self {
        switch self {
        case .root(let navigationController, _), .push(let navigationController, _):
            return .push(navigationController: navigationController, animated: animated)
        case .present(let presenter, _):
            return .present(presenter: presenter, animated: animated)
        case .window(let window):
            return .window(window: window)
        case .append(let tabBarController, _):
            return .present(presenter: tabBarController, animated: animated)
        }
    }
}
