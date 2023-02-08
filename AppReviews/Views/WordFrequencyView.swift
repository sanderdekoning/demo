//
//  WordFrequencyView.swift
//  AppReviews
//
//  Created by Sander de Koning on 08/02/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import UIKit

class WordFrequencyView: UIView {
    let insights: [String]
    
    init(insights: [String]) {
        self.insights = insights
        
        super.init(frame: .zero)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("Top 3 occurring words", comment: "")
        label.font = .preferredFont(forTextStyle: .title3)
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("Minimum word length is 4", comment: "")
        label.font = .preferredFont(forTextStyle: .footnote)
        return label
    }()
    
    private lazy var titlesStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        
        return stackView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: insights.map {
            let label = UILabel()
            label.text = $0
            label.font = .preferredFont(forTextStyle: .headline)
            return label
        })
        
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        
        return stackView
    }()
}

private extension WordFrequencyView {
    func setupViews() {
        titlesStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titlesStackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        titlesStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        titlesStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8).isActive = true
        titlesStackView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        
        stackView.topAnchor.constraint(equalTo: titlesStackView.bottomAnchor, constant: 8).isActive = true
        stackView.leadingAnchor.constraint(equalTo: titlesStackView.leadingAnchor, constant: 0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: titlesStackView.trailingAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor, constant: -8).isActive = true
    }
}
