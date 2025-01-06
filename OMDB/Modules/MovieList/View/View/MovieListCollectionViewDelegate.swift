//
//  MovieListViewCollectionViewDelegate.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 26.09.2023.
//

import UIKit

// MARK: - MovieListCollectionViewDelegate

final class MovieListCollectionViewDelegate: NSObject, UICollectionViewDelegate {
    
    // MARK: - Properties

    private(set) var viewModel: MovieListViewModel?
    
    weak var output: MovieListViewCollectionViewDelegateOutput?
    
    // MARK: - Configurations

    func update(viewModel: MovieListViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - UICollectionViewDelegate Implementation
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        guard let viewModel else { return }
        output?.movieListCollectionView(self, didSelectItemAt: indexPath, with: viewModel)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        willDisplay cell: UICollectionViewCell,
        forItemAt indexPath: IndexPath
    ) {
        guard let viewModel else { return }
        let lastIndex = viewModel.collectionViewMovieList.count - 1
        if lastIndex == indexPath.row {
            output?.collectionViewWillDisplayLastCell(collectionView)
        }
    }
}
