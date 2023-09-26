//
//  MovieSearchBuilder.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 23.09.2023.
//

import UIKit

// MARK: - MovieSearchBuilder

enum MovieSearchBuilder {
    
    static func build() -> UIViewController {
        let movieAPI = MovieAPI()
        let interactor = MovieSearchInteractor(movieAPI: movieAPI)
        let presenter = MovieSearchPresenter(interactor: interactor)
        let view = MovieSearchViewController(presenter: presenter)
        let navigationController = UINavigationController(rootViewController: view)
        let router = MovieSearchRouter(navigationController: navigationController)

        movieAPI.output = interactor
        interactor.output = presenter
        
        presenter.view = view
        presenter.router = router
        
        return navigationController
    }
}
