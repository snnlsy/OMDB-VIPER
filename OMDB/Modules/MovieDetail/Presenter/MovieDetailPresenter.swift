//
//  MovieDetailPresenter.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 23.09.2023.
//

// MARK: - MovieDetailPresenter

final class MovieDetailPresenter {
    
    // MARK: - Properties

    weak var view: MovieDetailViewing?
    
    private let movieEntity: MovieEntity
    private let router: MovieDetailRouting

    // MARK: - Initializers

    init(
        movieEntity: MovieEntity,
        router: MovieDetailRouting
    ) {
        self.movieEntity = movieEntity
        self.router = router
    }
}


// MARK: - MovieDetailPresenting Implementation

extension MovieDetailPresenter: MovieDetailPresenting {
    
    func viewDidLoad() {
        view?.configure(with: movieEntity)
    }
}
