//
//  MovieListViewCollectionViewDataSource.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 23.09.2023.
//

import UIKit

// MARK: - MovieListViewCollectionViewDataSource

final class MovieListCollectionViewDataSource: NSObject {
    
    // MARK: - Type Aliases

    private typealias VM = MovieListViewModel
    private typealias DataSource = UICollectionViewDiffableDataSource<VM.MovieListSection, MovieEntity>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<VM.MovieListSection, MovieEntity>
    private typealias MovieCellRegistration = UICollectionView.CellRegistration<MovieListCollectionViewCell, MovieEntity>
    
    // MARK: - Properties

    private var dataSource: DataSource?
    private var collectionView: UICollectionView?
}


// MARK: - MovieListCollectionViewDataSourcing Implementation

extension MovieListCollectionViewDataSource: MovieListCollectionViewDataSourcing {
    
    func configureDataSource(for collectionView: UICollectionView) {
        self.collectionView = collectionView
        setUpDataSource()
        appendSections()
        applySnapshot(items: [])
    }

    func applySnapshot(items: [MovieEntity], animateChanges: Bool = true) {
        var snapshot: Snapshot = dataSource?.snapshot() ?? Snapshot()
        snapshot.appendItems(items, toSection: .movieObjects)
        dataSource?.apply(snapshot, animatingDifferences: animateChanges)
    }

    func getMovieEntity(at index: Int) -> MovieEntity? {
        guard let items = dataSource?.snapshot().itemIdentifiers(inSection: .movieObjects),
              items.indices.contains(index) else {
            return nil
        }
        return items[index]
    }
}


// MARK: - Private MovieListCollectionViewDataSourcing Helpers

private extension MovieListCollectionViewDataSource {

    private func setUpDataSource() {
        guard let collectionView else { return }
        let movieCellRegistration = makeMovieCellRegistration()
        
        dataSource = DataSource(collectionView: collectionView) { collectionView, indexPath, item in
            collectionView.dequeueConfiguredReusableCell(
                using: movieCellRegistration,
                for: indexPath,
                item: item
            )
        }
    }

    private func appendSections() {
        var snapshot: Snapshot = dataSource?.snapshot() ?? Snapshot()
        snapshot.appendSections([.movieObjects])
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
    
    private func makeMovieCellRegistration() -> MovieCellRegistration {
        .init { cell, _, item in
            cell.configure(with: item)
        }
    }
}
