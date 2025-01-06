//
//  MovieListBuilder.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 23.09.2023.
//

import UIKit

// MARK: - MovieListBuilder

enum MovieListBuilder {
    
    static func build() -> UIViewController {
        // interactor
        let movieRepository: MovieRepositoryProtocol = MovieRepository()
        let interactor: MovieListInteracting & MovieRepositoryOutput 
        interactor = MovieListInteractor(movieRepository: movieRepository)
        
        // router
        let router: MovieListRouting = MovieListRouter()
        
        // presenter
        let presenter: MovieListPresenting & MovieListInteractorOutput
        presenter = MovieListPresenter(router: router, interactor: interactor)
        
        // view
        let view: UIViewController & MovieListViewing
        view = MovieListViewController(presenter: presenter)

        // connections
        presenter.view = view
        movieRepository.output = interactor
        interactor.output = presenter
        router.viewController = view
        
        return view
    }
}
