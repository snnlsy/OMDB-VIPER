//
//  MovieRepositoryInterface.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 2.01.2025.
//

// MARK: - MovieRepositoryProtocol

/// A protocol defining the responsibilities of the Movie Repository.
/// The repository handles data fetching and acts as a bridge between the interactor and the data layer.
protocol MovieRepositoryProtocol: AnyObject {
    
    /// A delegate to communicate results of data operations back to the interactor.
    ///
    /// - Note: The delegate conforms to `MovieRepositoryOutput` to handle success and error callbacks.
    var output: MovieRepositoryOutput? { get set }
    
    /// Fetches a list of movies based on the given request model and movie list type.
    ///
    /// - Parameters:
    ///   - request: A `MovieListRequestModel` containing the parameters for the API call.
    ///   - movieListType: A `MovieListViewModel.MovieListType` indicating whether the request is for a table view or collection view.
    /// - Note: This method performs a network request using the provided request model and forwards the results via the `output` delegate.
    func getMovieList(
        with request: MovieListRequestModel,
        movieListType: MovieListViewModel.MovieListType
    )
}


// MARK: - MovieRepositoryOutput

/// A protocol defining the output interface for the Movie Repository.
/// The interactor implements this protocol to receive callbacks from the repository.
protocol MovieRepositoryOutput: AnyObject {
    
    /// Called when the repository successfully retrieves a list of movies.
    ///
    /// - Parameters:
    ///   - repository: The repository instance providing the callback.
    ///   - movieListType: A `MovieListViewModel.MovieListType` indicating whether the data is for a table view or collection view.
    ///   - response: An optional `MovieListResponseModel` containing the retrieved movies.
    /// - Note: This method is used to update the interactor with fetched data.
    @MainActor
    func movieRepository(
        _ repository: MovieRepositoryProtocol,
        movieListType: MovieListViewModel.MovieListType,
        didRetrieveMovieList response: MovieListResponseModel?
    )
    
    /// Called when the repository encounters an error while retrieving data.
    ///
    /// - Parameters:
    ///   - repository: The repository instance providing the callback.
    ///   - error: A `NetworkError` representing the error encountered during the request.
    /// - Note: This method is used to inform the interactor about the failure, enabling error handling.
    @MainActor
    func movieRepository(
        _ repository: MovieRepositoryProtocol,
        didRetrieveError error: NetworkError
    )
}
