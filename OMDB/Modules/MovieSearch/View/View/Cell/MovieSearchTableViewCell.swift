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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        backgroundColor = .purple
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
        
    }
    
    private func setupLayout() {

    }
}
