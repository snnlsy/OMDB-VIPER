//
//  MovieSearchRouter.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 23.09.2023.
//

import UIKit


// MARK: - MovieSearchRouterProtocol

protocol MovieSearchRouterProtocol {
    func routeToMovieDetail(with entity: MovieSearchEntity)
}


// MARK: - MovieSearchRouter

final class MovieSearchRouter {
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    private(set) var navigationController: UINavigationController?
    
    var viewController: UIViewController? {
        navigationController
    }
}


// MARK: - MovieSearchRouterProtocol Implementation

extension MovieSearchRouter: MovieSearchRouterProtocol {
    
    func routeToMovieDetail(with entity: MovieSearchEntity) {
        let viewController = MovieDetailBuilder.build(navigationController: navigationController)
        navigationController?.pushViewController(viewController, animated: true)
    }
}