//
//  MockMovieListInteractorOutput.swift
//  OMDBTests
//
//  Created by Sinan Ulusoy on 5.01.2025.
//

import XCTest
@testable import OMDB

// MARK: - MockMovieListInteractorOutput

final class MockMovieListInteractorOutput: MovieListInteractorOutput {

    var didRetrieveMovieListExpectation: XCTestExpectation?
    func movieListInteractor(
        _ repository: MovieListInteracting,
        movieListType: MovieListViewModel.MovieListType,
        didRetrieveMovieList response: MovieListResponseModel?
    ) {
        didRetrieveMovieListExpectation?.fulfill()
    }

    var didRetrieveErrorExpectation: XCTestExpectation?
    func movieListInteractor(
        _ repository: MovieListInteracting,
        didRetrieveError error: NetworkError
    ) {
        didRetrieveErrorExpectation?.fulfill()
    }
}
