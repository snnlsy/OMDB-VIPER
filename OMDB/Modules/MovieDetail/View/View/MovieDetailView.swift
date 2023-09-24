//
//  MovieDetailView.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 24.09.2023.
//

import UIKit


protocol MovieDetailViewDelegate: AnyObject {
    
}

final class MovieDetailView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .orange
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    weak var delegate: MovieDetailViewDelegate?
    
    lazy var stackView: UIStackView = .build { stackView in
        stackView.axis = .vertical
    }
    
    lazy var posterImageView: UIImageView = .build { imageView in
        
    }
    
    lazy var titleLabel: UILabel = .build { label in
        
    }
    
    lazy var yearLabel: UILabel = .build { label in
        
    }
}