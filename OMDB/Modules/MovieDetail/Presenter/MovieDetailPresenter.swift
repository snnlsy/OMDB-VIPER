//
//  MovieDetailPresenter.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 23.09.2023.
//

import Foundation


protocol MovieDetailPresenterProtocol {
    func viewDidLoad()
}


final class MovieDetailPresenter {
    
    weak var view: MovieDetailViewControllerProtocol?
    
    let movieEntity: MovieEntity
    
    init(movieEntity: MovieEntity) {
        self.movieEntity = movieEntity
    }
    
}


extension MovieDetailPresenter: MovieDetailPresenterProtocol {
    func viewDidLoad() {
        view?.configure(with: movieEntity)
    }
}
