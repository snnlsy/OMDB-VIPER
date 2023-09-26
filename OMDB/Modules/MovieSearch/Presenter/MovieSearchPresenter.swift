//
//  MovieSearchPresenter.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 23.09.2023.
//

import Foundation


// MARK: - MovieSearchPresenterProtocol

protocol MovieSearchPresenterProtocol {
    
    func viewDidLoad()
    
    func didSelectTableView(
        at indexPath: IndexPath,
        with viewModel: MovieSearchViewModel
    )
    
    func didSelectCollectionView(
        at indexPath: IndexPath,
        with viewModel: MovieSearchViewModel
    )
    
    func retrieveMovieList(movieListType: MovieSearchViewModel.MovieListType)
    
    func movieSearchPresenter(textDidChange searchText: String)
}


// MARK: - MovieSearchPresenter

final class MovieSearchPresenter {
    
    weak var view: MovieSearchViewControllerProtocol?
    
    private var viewModel: MovieSearchViewModel
    var router: MovieSearchRouterProtocol?
    let interactor: MovieSearchInteractorProtocol
    let group = DispatchGroup()
    
    init(interactor: MovieSearchInteractorProtocol) {
        self.interactor = interactor
        viewModel = .init()
    }
}


// MARK: - MovieSearchPresenterProtocol Implementation

extension MovieSearchPresenter: MovieSearchPresenterProtocol {
    
    func viewDidLoad() {
        view?.showLoading()
        view?.configureLayout()
        retrieveInitialMovieList()
    }
    
    func didSelectTableView(
        at indexPath: IndexPath,
        with viewModel: MovieSearchViewModel
    ) {
        router?.routeToMovieDetail(with: viewModel.tableViewMovieList[indexPath.row])
    }
    
    func didSelectCollectionView(
        at indexPath: IndexPath,
        with viewModel: MovieSearchViewModel
    ) {
        router?.routeToMovieDetail(with: viewModel.collectionViewMovieList[indexPath.row])
    }
    
    func retrieveMovieList(movieListType: MovieSearchViewModel.MovieListType) {
        switch movieListType {
        case .tableView:
            interactor.retrieveMovieList(
                query: viewModel.query,
                page: viewModel.tableViewPage,
                movieListType: .tableView
            )
        case .collectionView:
            interactor.retrieveMovieList(
                query: MovieSearchViewConstant.defaultCollectionViewQuery,
                page: viewModel.collectionViewPage,
                movieListType: .collectionView
            )
        }
    }
    
    func movieSearchPresenter(textDidChange searchText: String) {
        viewModel.query = searchText
        viewModel.tableViewMovieList = []
        viewModel.tableViewPage = 1
        interactor.retrieveMovieList(query: viewModel.query, page: viewModel.tableViewPage, movieListType: .tableView)
    }
    
    private func retrieveInitialMovieList() {
        group.countedEnter()
        interactor.retrieveMovieList(
            query: viewModel.query,
            page: viewModel.tableViewPage,
            movieListType: .tableView
        )
        
        group.countedEnter()
        interactor.retrieveMovieList(
            query: MovieSearchViewConstant.defaultCollectionViewQuery,
            page: viewModel.collectionViewPage,
            movieListType: .collectionView
        )

        group.notify(queue: .main) { [weak self] in
            guard let self else { return }
            self.view?.configureTableView(with: self.viewModel)
            self.view?.configureCollectionView(with: self.viewModel)
            self.view?.hideLoading()
        }
    }
}


// MARK: - MovieSearchInteractorOutput Implementation

extension MovieSearchPresenter: MovieSearchInteractorOutputProtocol {

    func movieSearchInteractor(
        _ api: MovieSearchInteractorProtocol,
        movieListType: MovieSearchViewModel.MovieListType,
        didRetrieveMovieList response: MovieListResponse?
    ) {
        if group.getEnterCount() > 0 {
            group.countedLeave()
        }
        response?.search.forEach({ model in
            let model: MovieEntity = .init(title: model?.title, poster: model?.poster, year: model?.year)
            switch movieListType {
            case .tableView:
                viewModel.tableViewMovieList.append(model)
            case .collectionView:
                viewModel.collectionViewMovieList.append(model)
            }
        })
        configureMovieListViews(movieListType: movieListType)
    }

    func movieSearchInteractor(
        _ api: MovieSearchInteractorProtocol,
        didRetrieveError error: APIError
    ) { }
    
    private func configureMovieListViews(movieListType: MovieSearchViewModel.MovieListType) {
        switch movieListType {
        case .tableView:
            viewModel.tableViewPage += 1
            view?.configureTableView(with: viewModel)
        case .collectionView:
            viewModel.collectionViewPage += 1
            view?.configureCollectionView(with: viewModel)
        }
    }
}
