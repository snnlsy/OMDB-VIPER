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
        with viewModel: MovieSearchTableViewViewModel
    )
}


// MARK: - MovieSearchPresenter

final class MovieSearchPresenter {
    
    weak var view: MovieSearchViewControllerProtocol?
    
    private var viewModel: MovieSearchTableViewViewModel
    var router: MovieSearchRouterProtocol?
    let interactor: MovieSearchInteractorProtocol
    
    init(interactor: MovieSearchInteractorProtocol) {
        self.interactor = interactor
        viewModel = .init()
    }
}


// MARK: - MovieSearchPresenterProtocol Implementation

extension MovieSearchPresenter: MovieSearchPresenterProtocol {
    
    func viewDidLoad() {
        view?.configureLayout()
        view?.configure(with: viewModel)
    }
    
    func didSelectTableView(
        at indexPath: IndexPath,
        with viewModel: MovieSearchTableViewViewModel
    ) {
        print(indexPath)
//        router?.routeToMovieDetail(with: MovieSearchEntity(title: "", imdbId: "", type: "", poster: ""))
        interactor.retrieveMovieList(query: "hello", page: 1)
    }
}


// MARK: - MovieSearchInteractorOutput Implementation

extension MovieSearchPresenter: MovieSearchInteractorOutputProtocol {

    func movieSearchInteractor(
        _ api: MovieSearchInteractorProtocol,
        didRetrieveMovieList response: MovieListResponse?
    ) {
        print(response)
    }

    func movieSearchInteractor(
        _ api: MovieSearchInteractorProtocol,
        didRetrieveError error: APIError
    ) {
        print(error)
    }
}
