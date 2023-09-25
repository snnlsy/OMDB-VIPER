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
        backgroundColor = .darkGray
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
        
        imageView.setImage(with: "https://m.media-amazon.com/images/M/MV5BYjZlYTBlZWMtNjc4Ni00ZmEyLTk1ZmQtZGI3ZDg4ZmM2OGU3XkEyXkFqcGdeQXVyNjI4NDY5ODM@._V1_SX300.jpg")
    }
    
    private func setupHierarchy() {
        addSubview(imageView)
    }
    
    private func setupLayout() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
