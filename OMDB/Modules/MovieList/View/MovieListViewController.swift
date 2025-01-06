//
//  MovieListViewController.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 22.09.2023.
//

import UIKit

// MARK: - MovieListViewController

final class MovieListViewController: UIViewController {
    
    // MARK: - Properties

    private let presenter: MovieListPresenting

    private lazy var movieListView: MovieListView = .build {
        $0.delegate = self
    }
    
    // MARK: - Initializers
    
    init(presenter: MovieListPresenting) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - Lifecycle Methods

extension MovieListViewController {

    override func loadView() {
        view = movieListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}


// MARK: - MovieListViewing Implementation

extension MovieListViewController: MovieListViewing {
    
    func configureLayout() {
        movieListView.backgroundColor = .systemGray3
        navigationItem.title = Localization[.movieListTitle]
    }

    func configureTableView(with viewModel: MovieListViewModel) {
        movieListView.updateTableView(with: viewModel)
    }
    
    func configureCollectionView(with viewModel: MovieListViewModel) {
        movieListView.updateCollectionView(with: viewModel)
    }
}


// MARK: - MovieListViewDelegate Implementation

extension MovieListViewController: MovieListViewDelegate {

    func movieListView(
        _ view: MovieListView,
        didSelectTableViewItemAt indexPath: IndexPath,
        with viewModel: MovieListViewModel
    ) {
        presenter.didSelectTableView(at: indexPath, with: viewModel)
    }
    
    func movieListView(
        _ view: MovieListView,
        didSelectCollectionViewItemAt indexPath: IndexPath,
        with viewModel: MovieListViewModel
    ) {
        presenter.didSelectCollectionView(at: indexPath, with: viewModel)
    }
    
    func movieListView(_ view: MovieListView, textDidChange searchText: String) {
        presenter.movieListPresenter(textDidChange: searchText)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView) {
        presenter.retrieveMovieList(movieListType: .tableView)
    }
    
    func collectionViewWillDisplayLastCell(_ collectionView: UICollectionView) {
        presenter.retrieveMovieList(movieListType: .collectionView)
    }
}
