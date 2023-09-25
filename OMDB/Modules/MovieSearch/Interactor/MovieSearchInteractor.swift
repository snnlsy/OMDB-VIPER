//
//  MovieSearchInteractor.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 23.09.2023.
//

import Foundation


// MARK: - MovieSearchInteractorProtocol

protocol MovieSearchInteractorProtocol {
    func retrieveMovieList(
        query: String,
        page: Int,
        movieListType: MovieSearchViewModel.MovieListType
    )
}


// MARK: - MovieSearchInteractorOutputProtocol

protocol MovieSearchInteractorOutputProtocol: AnyObject {
    
    func movieSearchInteractor(
        _ api: MovieSearchInteractorProtocol,
        movieListType: MovieSearchViewModel.MovieListType,
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
    
    func retrieveMovieList(
        query: String,
        page: Int,
        movieListType: MovieSearchViewModel.MovieListType
    ) {
        movieAPI.getMovieList(with: .init(query: query, page: page), movieListType: movieListType)
    }
}


// MARK: - MovieAPIOutput Implementation

extension MovieSearchInteractor: MovieAPIOutputProtocol {
    
    func movieAPI(
        _ api: MovieAPIProtocol,
        movieListType: MovieSearchViewModel.MovieListType,
        didRetrieveMovieList response: MovieListResponse?
    ) {
        output?.movieSearchInteractor(self, movieListType: movieListType, didRetrieveMovieList: response)
    }
    
    func movieAPI(
        _ api: MovieAPIProtocol,
        didRetrieveError error: APIError
    ) {
        output?.movieSearchInteractor(self, didRetrieveError: error)
    }
}
