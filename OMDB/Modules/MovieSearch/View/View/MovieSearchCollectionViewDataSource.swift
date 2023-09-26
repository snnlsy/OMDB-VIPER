//
//  MovieSearchViewCollectionViewDataSource.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 23.09.2023.
//

import UIKit

// MARK: - MovieSearchViewCollectionViewDataSource

final class MovieSearchCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    init(viewModel: MovieSearchViewModel) {
        self.viewModel = viewModel
    }
    
    private let viewModel: MovieSearchViewModel

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.collectionViewMovieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MovieSearchCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configure(with: viewModel.collectionViewMovieList[indexPath.row])
        return cell
    }
}
