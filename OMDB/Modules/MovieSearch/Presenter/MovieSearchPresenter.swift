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
    
    init() {
        viewModel = .init()
//        self.router = router
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
        router?.routeToMovieDetail(with: MovieSearchEntity(title: "", imdbId: "", type: "", poster: ""))
    }
}
