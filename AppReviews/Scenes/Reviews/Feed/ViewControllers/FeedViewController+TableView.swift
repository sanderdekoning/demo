//
//  FeedViewController+Table.swift
//  AppReviews
//
//  Created by Sander de Koning on 06/02/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import UIKit

extension FeedViewController {
    var tableHeaderView: UIView? {
        guard !viewModel.reviews.output.isEmpty else {
            return noReviewsView
        }
        
        guard viewModel.reviews.filter != nil else {
            return nil
        }
        
        return wordFrequencyView
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.reviews.output.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "cellId",
            for: indexPath
        ) as? ReviewCell else {
            return .init()
        }
        
        cell.update(item: viewModel.reviews.output[indexPath.item])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let review = viewModel.reviews.output[indexPath.item]
        
        do {
            try viewModel.showDetails?(review)
        } catch {
            // TODO: handle error showing details
        }
    }
}

private extension FeedViewController {
    var wordFrequencyView: UIView {
        let view = WordFrequencyView(insights: viewModel.mostWordOccurances)
        view.frame.size.height = 140
        return view
    }
    
    var noReviewsView: UIView {
        let view = NoReviewsView(hasFilter: viewModel.reviews.filter != nil)
        view.frame.size.height = 400
        return view
    }
}
