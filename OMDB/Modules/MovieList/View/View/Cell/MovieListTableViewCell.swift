//
//  MovieListTableViewCell.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 24.09.2023.
//

import UIKit

// MARK: - MovieListTableViewCell

final class MovieListTableViewCell: UITableViewCell {
    
    // MARK: - Properties

    private lazy var posterImageView: UIImageView = .build()
    private lazy var movieNameLabel: UILabel = .builder()
        .numberOfLines(0)
        .build()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewHierarchy()
        setupViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - MovieListTableViewCell Setup

extension MovieListTableViewCell {

    private func setupViewHierarchy() {
        add(subview: posterImageView)
        add(subview: movieNameLabel)
    }

    private func setupViewConstraints() {
        posterImageView
            .top(equalTo: top, constant: Padding.small)
            .bottom(equalTo: bottom, constant: -Padding.small)
            .leading(equalTo: leading, constant: Padding.large)
            .width(equalToConstant: Constant.posterImageViewWidth)
        
        movieNameLabel
            .centerY(equalTo: centerY)
            .leading(equalTo: posterImageView.trailing, constant: Padding.large)
            .trailing(equalTo: trailing, constant: -Padding.large)
    }
}


// MARK: - MovieListTableViewCell Configure

extension MovieListTableViewCell {
    
    func configure(with entity: MovieEntity) {
        movieNameLabel.text = entity.title
        posterImageView.setImage(from: entity.poster)
    }
}


// MARK: - MovieListTableViewCell Constant

extension MovieListTableViewCell {
    
    private enum Constant {
        static let posterImageViewWidth: CGFloat = 60
    }
}
