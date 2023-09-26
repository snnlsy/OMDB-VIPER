//
//  MovieSearchViewController.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 22.09.2023.
//

import UIKit


// MARK: - MovieSearchViewControllerProtocol

protocol MovieSearchViewControllerProtocol: AnyObject, LoadingProtocol {
    func configureLayout()
    func configureTableView(with viewModel: MovieSearchViewModel)
    func configureCollectionView(with viewModel: MovieSearchViewModel)
}


// MARK: - MovieSearchViewController

final class MovieSearchViewController: LoadingViewController {
    
    init(presenter: MovieSearchPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let presenter: MovieSearchPresenterProtocol

    private lazy var movieSearchView: MovieSearchView = .build { view in
        view.delegate = self
    }
}


// MARK: - MovieSearchViewController Lifecycle

extension MovieSearchViewController {

    override func loadView() {
        view = movieSearchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}


// MARK: - MovieSearchViewControllerProtocol Implementation

extension MovieSearchViewController: MovieSearchViewControllerProtocol {

    func showLoading() {
        showLoadingIndicator()
    }
    
    func hideLoading() {
        hideLoadingIndicator()
    }
    
    func configureLayout() {
        movieSearchView.backgroundColor = .systemGray3
        navigationItem.title = MovieSearchViewConstant.title
    }

    func configureTableView(with viewModel: MovieSearchViewModel) {
        movieSearchView.configureTableView(with: viewModel)
    }
    
    func configureCollectionView(with viewModel: MovieSearchViewModel) {
        movieSearchView.configureCollectionView(with: viewModel)
    }
}


// MARK: - MovieSearchViewDelegate Implementation

extension MovieSearchViewController: MovieSearchViewDelegate {

    func movieSearchView(
        _ view: MovieSearchView,
        didSelectTableViewItemAt indexPath: IndexPath,
        with viewModel: MovieSearchViewModel
    ) {
        presenter.didSelectTableView(at: indexPath, with: viewModel)
    }
    
    func movieSearchView(
        _ view: MovieSearchView,
        didSelectCollectionViewItemAt indexPath: IndexPath,
        with viewModel: MovieSearchViewModel
    ) {
        presenter.didSelectCollectionView(at: indexPath, with: viewModel)
    }
    
    func movieSearchView(_ view: MovieSearchView, textDidChange searchText: String) {
        presenter.movieSearchPresenter(textDidChange: searchText)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView) {
        presenter.retrieveMovieList(movieListType: .tableView)
    }
    
    func collectionViewWillDisplayLastCell(_ collectionView: UICollectionView) {
        presenter.retrieveMovieList(movieListType: .collectionView)
    }
}

