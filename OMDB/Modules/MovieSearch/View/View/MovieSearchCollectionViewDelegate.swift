//
//  MovieSearchViewCollectionViewDelegate.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 26.09.2023.
//

import UIKit


// MARK: - MovieSearchViewTableViewDelegateOutput

protocol MovieSearchViewCollectionViewDelegateOutput: AnyObject {
    func movieSearchCollectionView(
        _ delegate: MovieSearchCollectionViewDelegate,
        didSelectItemAt indexPath: IndexPath,
        with viewModel: MovieSearchViewModel
    )
}


// MARK: - MovieSearchCollectionViewDelegate

final class MovieSearchCollectionViewDelegate: NSObject, UICollectionViewDelegate {
    
    private(set) var viewModel: MovieSearchViewModel?
    
    weak var output: MovieSearchViewCollectionViewDelegateOutput?
    
    func update(viewModel: MovieSearchViewModel) {
        self.viewModel = viewModel
    }
}


// MARK: - MovieSearchCollectionViewDelegate Implementation

extension MovieSearchCollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let viewModel else { return }
        output?.movieSearchCollectionView(self, didSelectItemAt: indexPath, with: viewModel)
    }
}
