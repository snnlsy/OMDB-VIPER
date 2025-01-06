//
//  MovieDetailBuilder.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 23.09.2023.
//

import UIKit

// MARK: - MovieDetailBuilder

enum MovieDetailBuilder {
    
    static func build(viewController: UIViewController?, movieEntity: MovieEntity) -> UIViewController {
        // router
        let router: MovieDetailRouting = MovieDetailRouter()
        
        // presenter
        let presenter: MovieDetailPresenting = MovieDetailPresenter(movieEntity: movieEntity, router: router)
        
        // view
        let view: UIViewController & MovieDetailViewing 
        view = MovieDetailViewController(presenter: presenter)

        // connections
        presenter.view = view
        router.viewController = view

        return view
    }
}
