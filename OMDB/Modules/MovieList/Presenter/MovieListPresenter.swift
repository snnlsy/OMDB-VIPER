//
//  MovieListPresenter.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 23.09.2023.
//

import Foundation

// MARK: - MovieListPresenter

final class MovieListPresenter {
    
    // MARK: - Properties
    
    weak var view: MovieListViewing?
    
    private let router: MovieListRouting
    private let interactor: MovieListInteracting
    private var viewModel: MovieListViewModel
    private let group = DispatchGroup()
    #if DEBUG
    var testViewModel: MovieListViewModel { viewModel }
    #endif
    
    // MARK: - Initializers

    init(
        router: MovieListRouting,
        interactor: MovieListInteracting,
        viewModel: MovieListViewModel = .init()
    ) {
        self.router = router
        self.interactor = interactor
        self.viewModel = viewModel
    }
}


// MARK: - MovieListPresenting Implementation

extension MovieListPresenter: MovieListPresenting {
    
    func viewDidLoad() {
        router.showLoading()
        view?.configureLayout()
        retrieveInitialMovieList()
    }
    
    func didSelectTableView(
        at indexPath: IndexPath,
        with viewModel: MovieListViewModel
    ) {
        router.routeToMovieDetail(with: viewModel.tableViewMovieList[indexPath.row])
    }
    
    func didSelectCollectionView(
        at indexPath: IndexPath,
        with viewModel: MovieListViewModel
    ) {
        router.routeToMovieDetail(with: viewModel.collectionViewMovieList[indexPath.row])
    }
    
    func retrieveMovieList(movieListType: MovieListViewModel.MovieListType) {
        switch movieListType {
        case .tableView:
            interactor.retrieveMovieList(
                query: viewModel.query,
                page: viewModel.page.tableViewPage,
                movieListType: .tableView
            )
        case .collectionView:
            interactor.retrieveMovieList(
                query: MovieListViewConstant.defaultCollectionViewQuery,
                page: viewModel.page.collectionViewPage,
                movieListType: .collectionView
            )
        }
    }
    
    func movieListPresenter(textDidChange searchText: String) {
        viewModel.query = searchText
        viewModel.tableViewMovieList = []
        viewModel.page = viewModel.page.resetTableViewPage()
        interactor.retrieveMovieList(
            query: viewModel.query,
            page: viewModel.page.tableViewPage,
            movieListType: .tableView
        )
    }
    
    private func retrieveInitialMovieList() {
        group.enterTask()
        interactor.retrieveMovieList(
            query: viewModel.query,
            page: viewModel.page.tableViewPage,
            movieListType: .tableView
        )
        group.enterTask()
        interactor.retrieveMovieList(
            query: MovieListViewConstant.defaultCollectionViewQuery,
            page: viewModel.page.collectionViewPage,
            movieListType: .collectionView
        )
        
        group.notify(queue: .main) { [weak self] in
            guard let self else { return }
            self.view?.configureTableView(with: self.viewModel)
            self.view?.configureCollectionView(with: self.viewModel)
            router.hideLoading()
        }
    }
}


// MARK: - MovieListInteractorOutput Implementation

extension MovieListPresenter: MovieListInteractorOutput {

    @MainActor
    func movieListInteractor(
        _ repository: MovieListInteracting,
        movieListType: MovieListViewModel.MovieListType,
        didRetrieveMovieList response: MovieListResponseModel?
    ) {
        if group.taskCount > .zero {
            group.leaveTask()
        }
        response?.search.forEach({ model in
            let model: MovieEntity = .init(
                title: model?.title,
                poster: model?.poster,
                year: model?.year
            )
            switch movieListType {
            case .tableView:
                viewModel.tableViewMovieList.append(model)
            case .collectionView:
                viewModel.collectionViewMovieList.append(model)
            }
        })
        configureMovieListViews(movieListType: movieListType)
    }

    @MainActor
    func movieListInteractor(
        _ repository: MovieListInteracting,
        didRetrieveError error: NetworkError
    ) { 
        router.hideLoading()
        Logger.error(error.localizedDescription)
    }
    
    private func configureMovieListViews(movieListType: MovieListViewModel.MovieListType) {
        switch movieListType {
        case .tableView:
            viewModel.page = viewModel.page.increaseTableViewPage()
            view?.configureTableView(with: viewModel)
        case .collectionView:
            viewModel.page = viewModel.page.increaseCollectionViewPage()
            view?.configureCollectionView(with: viewModel)
        }
    }
}
