//
//  File.swift
//  AppReviews
//
//  Created by Sander de Koning on 08/02/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import UIKit

class NoReviewsView: UIView {
    init(hasFilter: Bool) {
        super.init(frame: .zero)
        
        setupView(hasFilter: hasFilter)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(hasFilter: Bool) {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .footnote)
        label.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        if hasFilter {
            label.text = NSLocalizedString("No reviews matching filters", comment: "")
        } else {
            label.text = NSLocalizedString("No reviews", comment: "")
        }
        
        addSubview(label)
    }
}

