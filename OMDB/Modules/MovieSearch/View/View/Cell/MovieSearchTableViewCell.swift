//
//  MovieSearchTableViewCell.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 24.09.2023.
//

import UIKit
import SnapKit


// MARK: - MovieSearchTableViewCell

final class MovieSearchTableViewCell: UITableViewCell {
    
    private lazy var posterImageView: CacheableImageView = .build()
    private lazy var movieNameLabel: UILabel = .build { label in
        label.numberOfLines = 0
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - MovieSearchTableViewCell Setup

extension MovieSearchTableViewCell {
    
    private func setupView() {
        setupHierarchy()
        setupLayout()
    }
    
    private func setupHierarchy() {
        addSubview(posterImageView, movieNameLabel)
    }
    
    private func setupLayout() {
        posterImageView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(Spacing.small)
            make.leading.equalToSuperview().offset(Spacing.large)
            make.width.equalTo(Constant.posterImageViewWidth)
        }
        
        movieNameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(posterImageView.snp.trailing).offset(Spacing.large)
            make.trailing.equalToSuperview().inset(Spacing.large)
        }
    }
}


// MARK: - MovieSearchTableViewCell Configure

extension MovieSearchTableViewCell {
    
    func configure(with entity: MovieEntity) {
        posterImageView.setImage(with: entity.poster)
        movieNameLabel.text = entity.title
    }
}


// MARK: - MovieSearchTableViewCell Constant

extension MovieSearchTableViewCell {
    
    private enum Constant {
        static let posterImageViewWidth: CGFloat = 60
    }
}
