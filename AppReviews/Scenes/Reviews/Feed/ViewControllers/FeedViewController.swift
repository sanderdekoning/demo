//
//  FeedViewController.swift
//  AppReviews
//
//  Created by Sander de Koning on 08/02/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import UIKit

class FeedViewController: UITableViewController {
    let viewModel: FeedViewModelProtocol
    
    init(viewModel: some FeedViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        refreshControlAction()
    }
    
    @objc private func refreshControlAction() {
        Task {
            do {
                try await updateReviews()
            } catch {
                // TODO: Handle errors during updating
            }
        }
    }
    
    func updateReviews() async throws {
        navigationItem.rightBarButtonItem?.isEnabled = false
        refreshControl?.beginRefreshing()
        
        try await viewModel.updateReviews()
        
        tableView.reloadData()
        
        refreshControl?.endRefreshing()
        navigationItem.rightBarButtonItem?.isEnabled = true
    }
}

fileprivate extension FeedViewController {
    func setupViews() {
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(refreshControlAction), for: .primaryActionTriggered)
        
        tableView.register(ReviewCell.self, forCellReuseIdentifier: "cellId")
        tableView.rowHeight = 160
        
        navigationItem.setRightBarButton(filterBarButtonItem, animated: false)
    }
}

