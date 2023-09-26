//
//  MovieSearchRouter.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 23.09.2023.
//

import UIKit

// MARK: - MovieSearchRouterProtocol

protocol MovieSearchRouterProtocol {
    func routeToMovieDetail(with entity: MovieEntity)
}


// MARK: - MovieSearchRouter

final class MovieSearchRouter {
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    private(set) var navigationController: UINavigationController?
}


// MARK: - MovieSearchRouterProtocol Implementation

extension MovieSearchRouter: MovieSearchRouterProtocol {
    
    func routeToMovieDetail(with entity: MovieEntity) {
        let viewController = MovieDetailBuilder.build(
            navigationController: navigationController,
            movieEntity: entity
        )
        navigationController?.pushViewController(viewController, animated: true)
    }
}
