//
//  MovieDetailView.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 24.09.2023.
//

import UIKit

// MARK: - MovieDetailView

final class MovieDetailView: UIView {
        
    // MARK: - View Components

    var posterImageView: UIImageView = .build()
    
    let titleLabel: UILabel = .builder()
        .backgroundColor(.yellow)
        .build()
    
    var yearLabel: UILabel = .build()
    
    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewHierarchy()
        setupViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - View Configuration

extension MovieDetailView {
    
    private func setupViewHierarchy() {
        add(subview: posterImageView)
        add(subview: titleLabel)
        add(subview: yearLabel)
    }
    
    private func setupViewConstraints() {
        posterImageView
            .width(equalTo: width, multiplier: 0.7)
            .height(equalTo: height, multiplier: 0.5)
            .centerInSuperview()

        titleLabel
            .top(equalTo: posterImageView.bottom, constant: Padding.large)
            .leading(equalTo: leading, constant: Padding.large)
            .trailing(equalTo: trailing, constant: -Padding.large)

        yearLabel
            .top(equalTo: titleLabel.bottom, constant: Padding.large)
            .leading(equalTo: leading, constant: Padding.large)
            .trailing(equalTo: trailing, constant: -Padding.large)
    }
}
