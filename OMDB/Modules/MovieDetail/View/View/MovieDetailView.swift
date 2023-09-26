//
//  MovieDetailView.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 24.09.2023.
//

import UIKit
import SnapKit


final class MovieDetailView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        backgroundColor = .orange
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    var posterImageView: CacheableImageView = .build()
    
    var titleLabel: UILabel = .build { label in
        label.numberOfLines = 0
    }
}


extension MovieDetailView {
    
    private func setupView() {
        setupHierarchy()
        setupLayout()
    }
    
    private func setupHierarchy() {
        addSubview(posterImageView, titleLabel)
    }
    
    private func setupLayout() {
        posterImageView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalToSuperview().multipliedBy(0.5)
            make.center.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(posterImageView.snp.bottom)
            make.horizontalEdges.equalToSuperview().inset(Spacing.large)
        }
    }
}
