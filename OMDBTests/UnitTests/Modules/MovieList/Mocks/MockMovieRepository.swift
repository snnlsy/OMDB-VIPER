//
//  MockMovieRepository.swift
//  OMDBTests
//
//  Created by Sinan Ulusoy on 5.01.2025.
//

import XCTest
@testable import OMDB

// MARK: - MockMovieRepository

final class MockMovieRepository: MovieRepositoryProtocol {

    weak var output: MovieRepositoryOutput?
    var response: Result<MovieListResponseModel, NetworkError>?

    func getMovieList(
        with request: MovieListRequestModel,
        movieListType: MovieListViewModel.MovieListType
    ) {
        Task { @MainActor in
            switch self.response {
            case .success(let response):
                self.output?.movieRepository(self, movieListType: movieListType, didRetrieveMovieList: response)
            case .failure(let error):
                self.output?.movieRepository(self, didRetrieveError: error)
            case .none:
                fatalError("Mock response not set")
            }
        }
    }
}
