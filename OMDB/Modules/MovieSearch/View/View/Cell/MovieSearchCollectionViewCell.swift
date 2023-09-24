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
}


// MARK: - MovieSearchCollectionViewCell Setup

extension MovieSearchCollectionViewCell {
    
    private func setupView() {
        setupHierarchy()
        setupLayout()
    }
    
    private func setupHierarchy() {
        
    }
    
    private func setupLayout() {

    }
}
