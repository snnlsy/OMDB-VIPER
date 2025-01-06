//
//  MovieListRouter.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 23.09.2023.
//

import UIKit

// MARK: - MovieListRouter

final class MovieListRouter {
    weak var viewController: UIViewController?
}


// MARK: - MovieListRouting Implementation

extension MovieListRouter: MovieListRouting {
    
    func routeToMovieDetail(with entity: MovieEntity) {
        let movieDetailVC = MovieDetailBuilder.build(
            viewController: viewController,
            movieEntity: entity
        )
        viewController?.navigationController?.pushViewController(movieDetailVC, animated: true)
    }
}
