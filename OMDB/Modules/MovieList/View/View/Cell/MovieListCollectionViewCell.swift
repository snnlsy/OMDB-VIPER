//
//  MovieListCollectionViewCell.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 24.09.2023.
//

import UIKit

// MARK: - MovieListCollectionViewCell

final class MovieListCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties

    private lazy var imageView: UIImageView = .build()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - MovieListCollectionViewCell Setup

extension MovieListCollectionViewCell {
    
    private func setupView() {
        wrap(subView: imageView)
    }
}


// MARK: - MovieListCollectionViewCell Configure

extension MovieListCollectionViewCell {
    
    func configure(with entity: MovieEntity) {
        imageView.setImage(from: entity.poster)
    }
}

