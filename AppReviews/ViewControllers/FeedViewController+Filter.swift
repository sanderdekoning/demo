//
//  FeedViewController+Filter.swift
//  AppReviews
//
//  Created by Sander de Koning on 06/02/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import UIKit

extension FeedViewController {
    var filterBarButtonItem: UIBarButtonItem {
        let button = UIBarButtonItem(
            title: NSLocalizedString("Filter", comment: "Button title to filter reviews"),
            menu: UIMenu(
                title: "Rating",
                children: [filterMenuShowAllElement] + filterMenuRatingElements
            )
        )
        
        if #available(iOS 15.0, *) {
            button.isSelected = !viewModel.reviews.equalsSource
        } else {
            // TODO: Configure bar button item background to indicate selection
        }

        return button
    }
}

private extension FeedViewController {
    func filterActionReload() {
        tableView.tableHeaderView = tableHeaderView
        
        tableView?.reloadData()
        
        // We set the bar button item again with a new menu item which then
        // has the correct button states
        navigationItem.setRightBarButton(filterBarButtonItem, animated: false)
    }
    
    var filterMenuShowAllElement: UIMenuElement {
        let title = NSLocalizedString("Show All", comment: "Show all reviews")
        let action = UIAction(title: title) { [unowned self] _ in
            viewModel.apply(filter: nil)
            filterActionReload()
        }
        
        action.state = viewModel.reviews.equalsSource ? .on : .off
        
        return action
    }
    
    var filterMenuRatingElements: [UIMenuElement] {
        var actions: [UIMenuElement] = []
        
        for i in stride(from: 5, to: 0, by: -1) {
            let title = String(repeating: Review.starRepresentation, count: i)
            let action = UIAction(title: title) { [unowned self] _ in
                viewModel.apply(filter: ReviewsRatingFilter(rating: i))
                filterActionReload()
            }
            
            // Set the element state to on/off when there is a filter that equals its filter
            if let filter = viewModel.reviews.filter as? ReviewsRatingFilter {
                action.state = i == filter.rating ? .on : .off
            }
            
            actions.append(action)
        }
        
        return actions
    }
}
