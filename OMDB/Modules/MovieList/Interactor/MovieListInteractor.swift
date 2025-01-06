//
//  MovieListInteractor.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 23.09.2023.
//

// MARK: - MovieListInteractor

final class MovieListInteractor {
    
    // MARK: - Properties

    weak var output: MovieListInteractorOutput?
    
    private let movieRepository: MovieRepositoryProtocol
    
    // MARK: - Initializers

    init(movieRepository: MovieRepositoryProtocol) {
        self.movieRepository = movieRepository
    }
}


// MARK: - MovieListInteracting Implementation

extension MovieListInteractor: MovieListInteracting {
    
    func retrieveMovieList(
        query: String,
        page: Int,
        movieListType: MovieListViewModel.MovieListType
    ) {
        movieRepository.getMovieList(
            with: .init(
                parameters: .init(
                    s: query,
                    page: page
                )
            ),
            movieListType: movieListType
        )
    }
}


// MARK: - MovieRepositoryOutput Implementation

extension MovieListInteractor: MovieRepositoryOutput {
    
    @MainActor
    func movieRepository(
        _ repository: MovieRepositoryProtocol,
        movieListType: MovieListViewModel.MovieListType,
        didRetrieveMovieList response: MovieListResponseModel?
    ) {
        output?.movieListInteractor(self, movieListType: movieListType, didRetrieveMovieList: response)
    }
    
    @MainActor
    func movieRepository(
        _ repository: MovieRepositoryProtocol,
        didRetrieveError error: NetworkError
    ) {
        output?.movieListInteractor(self, didRetrieveError: error)
    }
}
