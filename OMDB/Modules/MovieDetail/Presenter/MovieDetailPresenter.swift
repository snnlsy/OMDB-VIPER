//
//  MovieDetailPresenter.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 23.09.2023.
//

// MARK: - MovieDetailPresenterProtocol

protocol MovieDetailPresenterProtocol {
    func viewDidLoad()
}


// MARK: - MovieDetailPresenter

final class MovieDetailPresenter {
    
    weak var view: MovieDetailViewControllerProtocol?
    
    let movieEntity: MovieEntity
    
    init(movieEntity: MovieEntity) {
        self.movieEntity = movieEntity
    }
}


// MARK: - MovieDetailPresenterProtocol Implementation

extension MovieDetailPresenter: MovieDetailPresenterProtocol {
    
    func viewDidLoad() {
        view?.configure(with: movieEntity)
    }
}
