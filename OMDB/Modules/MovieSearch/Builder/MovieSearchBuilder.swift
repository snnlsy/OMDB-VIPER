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
        let presenter = MovieSearchPresenter()
        let view = MovieSearchViewController(presenter: presenter)
        let navigationController = UINavigationController(rootViewController: view)
        let router = MovieSearchRouter(navigationController: navigationController)
        
        presenter.view = view
        presenter.router = router
        
        return navigationController
    }
}
