//
//  MockMovieListInteractor.swift
//  OMDBTests
//
//  Created by Sinan Ulusoy on 5.01.2025.
//

@testable import OMDB

final class MockMovieListInteractor: MovieListInteracting {
   
    var output: MovieListInteractorOutput?

    private(set) var isRetrieveMovieListCalled = false
    private(set) var retrieveMovieListCalledWithType: MovieListViewModel.MovieListType?
    func retrieveMovieList(query: String, page: Int, movieListType: MovieListViewModel.MovieListType) {
        isRetrieveMovieListCalled = true
        retrieveMovieListCalledWithType = movieListType
    }
}
