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
        
        group.enter()
        interactor.retrieveMovieList(query: "Star", page: 1, movieListType: .tableView)
        
        group.enter()
        interactor.retrieveMovieList(query: "Comedy", page: 1, movieListType: .collectionView)

        group.notify(queue: .main) { [weak self] in
            guard let self else { return }
            self.view?.hideLoading()
            self.view?.configure(with: self.viewModel)
        }
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
}


// MARK: - MovieSearchInteractorOutput Implementation

extension MovieSearchPresenter: MovieSearchInteractorOutputProtocol {

    func movieSearchInteractor(
        _ api: MovieSearchInteractorProtocol,
        movieListType: MovieSearchViewModel.MovieListType,
        didRetrieveMovieList response: MovieListResponse?
    ) {
        group.leave()
        response?.search.forEach({ model in
            let model: MovieEntity = .init(title: model?.title, poster: model?.poster)
            switch movieListType {
            case .tableView:
                viewModel.tableViewMovieList.append(model)
            case .collectionView:
                viewModel.collectionViewMovieList.append(model)
            }
        })
    }

    func movieSearchInteractor(
        _ api: MovieSearchInteractorProtocol,
        didRetrieveError error: APIError
    ) {
        print(error)
    }
}
