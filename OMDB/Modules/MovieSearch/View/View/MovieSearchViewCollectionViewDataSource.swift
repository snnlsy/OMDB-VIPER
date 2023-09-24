//
//  MovieSearchViewCollectionViewDataSource.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 23.09.2023.
//

import UIKit


// MARK: - MovieSearchViewCollectionViewDataSource

final class MovieSearchViewCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    init(viewModel: MovieSearchTableViewViewModel) {
        self.viewModel = viewModel
    }
    
    private let viewModel: MovieSearchTableViewViewModel

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MovieSearchCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.backgroundColor = .blue

        return cell
    }
}
