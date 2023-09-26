//
//  MovieSearchCollectionViewCell.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 24.09.2023.
//

import UIKit
import SnapKit

// MARK: - MovieSearchCollectionViewCell

final class MovieSearchCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var imageView: CacheableImageView = .build()
}


// MARK: - MovieSearchCollectionViewCell Setup

extension MovieSearchCollectionViewCell {
    
    private func setupView() {
        setupHierarchy()
        setupLayout()
    }
    
    private func setupHierarchy() {
        addSubview(imageView)
    }
    
    private func setupLayout() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(Spacing.small)
        }
    }
}


// MARK: - MovieSearchCollectionViewCell Configure

extension MovieSearchCollectionViewCell {
    
    func configure(with entity: MovieEntity) {
        imageView.setImage(with: entity.poster)
    }
}

