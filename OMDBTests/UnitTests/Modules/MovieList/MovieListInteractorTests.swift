//
//  MovieListInteractorTests.swift
//  OMDBTests
//
//  Created by Sinan Ulusoy on 5.01.2025.
//

import XCTest
@testable import OMDB

final class MovieListInteractorTests: XCTestCase {
    
    // MARK: - Private Variables

    private var sut: MovieListInteractor!
    private var repository: MockMovieRepository!
    private var output: MockMovieListInteractorOutput!

    // MARK: - Lifecycle

    override func setUp() {
        super.setUp()
        repository = .init()
        output = .init()
        sut = .init(movieRepository: repository)
        
        repository.output = sut
        sut.output = output
    }

    override func tearDown() {
        sut = nil
        repository = nil
        output = nil
        super.tearDown()
    }

    // MARK: - Tests

    func test_retrieveMovieList_informsOutputOnSuccess() {
        // Given
        let expectation = XCTestExpectation(description: "Output should be informed with success response")
        output.didRetrieveMovieListExpectation = expectation
        let expectedResponse = MovieListResponseModel(
            search: [
                SearchModel(title: "Movie1", year: "2000", imdbID: "id1", poster: "Poster1"),
                SearchModel(title: "Movie2", year: "2001", imdbID: "id2", poster: "Poster2")
            ],
            totalResults: "2",
            response: "True"
        )

        // When
        repository.response = .success(expectedResponse)
        sut.retrieveMovieList(query: "TestQuery", page: 1, movieListType: .tableView)

        // Then
        wait(for: [expectation], timeout: 0.5)
    }
    

    func test_retrieveMovieList_informsOutputOnFailure() {
        // Given
        let expectation = XCTestExpectation(description: "Output should be informed with failure response")
        output.didRetrieveErrorExpectation = expectation
        let expectedError = NetworkError.retryFailed(.generic)

        // When
        repository.response = .failure(expectedError)
        sut.retrieveMovieList(query: "TestQuery", page: 1, movieListType: .tableView)

        // Then
        wait(for: [expectation], timeout: 0.5)
    }
}
