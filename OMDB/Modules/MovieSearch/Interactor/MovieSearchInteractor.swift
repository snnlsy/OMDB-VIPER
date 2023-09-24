//
//  MovieSearchInteractor.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 23.09.2023.
//

import Foundation


// MARK: - MovieSearchInteractorProtocol

protocol MovieSearchInteractorProtocol {
    func retrieveMovieList(query: String, page: Int)
}


// MARK: - MovieSearchInteractorOutputProtocol

protocol MovieSearchInteractorOutputProtocol: AnyObject {
    
    func movieSearchInteractor(
        _ api: MovieSearchInteractorProtocol,
        didRetrieveMovieList response: MovieListResponse?
    )
    
    func movieSearchInteractor(
        _ api: MovieSearchInteractorProtocol,
        didRetrieveError error: APIError
    )
}


// MARK: - MovieSearchInteractor

final class MovieSearchInteractor {
    
    init(movieAPI: MovieAPIProtocol) {
        self.movieAPI = movieAPI
    }
    
    private let movieAPI: MovieAPIProtocol
    
    weak var output: MovieSearchInteractorOutputProtocol?
}


// MARK: - MovieSearchInteractorProtocol Implementation

extension MovieSearchInteractor: MovieSearchInteractorProtocol {
    
    func retrieveMovieList(query: String, page: Int) {
        movieAPI.getMovieList(with: .init(query: query, page: page))
    }
}


// MARK: - MovieAPIOutput Implementation

extension MovieSearchInteractor: MovieAPIOutputProtocol {
    
    func movieAPI(
        _ api: MovieAPIProtocol,
        didRetrieveMovieList response: MovieListResponse?
    ) {
        output?.movieSearchInteractor(self, didRetrieveMovieList: response)
    }
    
    func movieAPI(
        _ api: MovieAPIProtocol,
        didRetrieveError error: APIError
    ) {
        output?.movieSearchInteractor(self, didRetrieveError: error)
    }
}
