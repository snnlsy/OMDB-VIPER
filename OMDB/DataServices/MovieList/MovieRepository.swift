//
//  MovieRepository.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 24.09.2023.
//

// MARK: - MovieRepository

final class MovieRepository {
    
    weak var output: MovieRepositoryOutput?
    
    private let dataService: MovieListDataService
    
    // MARK: - Initializers

    init(dataService: MovieListDataService = .init()) {
        self.dataService = dataService
    }
}


// MARK: - MovieRepositoryProtocol Implementation

extension MovieRepository: MovieRepositoryProtocol {
    
    func getMovieList(
        with request: MovieListRequestModel,
        movieListType: MovieListViewModel.MovieListType
    ) {
        Task {
            switch await dataService.fetchData(with: request) {
            case .success(let response):
                await self.output?.movieRepository(
                    self,
                    movieListType: movieListType,
                    didRetrieveMovieList: response
                )
            case .failure(let error):
                await self.output?.movieRepository(self, didRetrieveError: error)
            }
        }
    }
}
