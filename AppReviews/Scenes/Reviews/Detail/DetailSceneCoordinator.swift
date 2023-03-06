//
//  DetailSceneCoordinator.swift
//  AppReviews
//
//  Created by Sander de Koning on 03/03/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import UIKit

class DetailSceneCoordinator: SceneCoordinator {
    let review: Review
    
    init(review: Review) {
        self.review = review
    }

    func start(presentation: ScenePresentation) throws {
        display(viewController: DetailsViewController(review: review), presentation: presentation)
    }
}
