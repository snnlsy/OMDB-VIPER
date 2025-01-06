//
//  MovieListInteractorInterface.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 2.01.2025.
//

// MARK: - MovieListInteracting

/// A protocol defining the interaction logic for fetching and managing movie data.
/// The interactor acts as a mediator between the presenter and the repository, handling business logic and data retrieval tasks.
protocol MovieListInteracting: AnyObject {
    
    /// The output delegate to communicate results back to the presenter.
    ///
    /// - Note: This delegate is used to send successful or failed results of data retrieval operations.
    var output: MovieListInteractorOutput? { get set }
    
    /// Retrieves a list of movies based on the given query and pagination parameters.
    ///
    /// - Parameters:
    ///   - query: A string representing the search query (e.g., movie title or keyword).
    ///   - page: An integer representing the page number for pagination.
    ///   - movieListType: A `MovieListViewModel.MovieListType` indicating whether the data is for a table view or collection view.
    /// - Note: This function initiates a network call to fetch movies and communicates the results via the `output` delegate.
    func retrieveMovieList(
        query: String,
        page: Int,
        movieListType: MovieListViewModel.MovieListType
    )
}


// MARK: - MovieListInteractorOutput

/// A protocol defining the output interface for the Movie List interactor.
/// This protocol is implemented by the presenter to receive data or error callbacks from the interactor.
protocol MovieListInteractorOutput: AnyObject {
    
    /// Called when the interactor successfully retrieves a list of movies.
    ///
    /// - Parameters:
    ///   - repository: The interactor instance providing the callback.
    ///   - movieListType: A `MovieListViewModel.MovieListType` indicating whether the data is for a table view or collection view.
    ///   - response: An optional `MovieListResponseModel` containing the retrieved movies.
    /// - Note: The presenter uses this callback to update the view with the fetched data.
    @MainActor
    func movieListInteractor(
        _ repository: MovieListInteracting,
        movieListType: MovieListViewModel.MovieListType,
        didRetrieveMovieList response: MovieListResponseModel?
    )
    
    /// Called when the interactor encounters an error while retrieving movie data.
    ///
    /// - Parameters:
    ///   - repository: The interactor instance providing the callback.
    ///   - error: A `NetworkError` representing the error encountered during the data retrieval process.
    /// - Note: The presenter uses this callback to handle the error and display appropriate feedback to the user.
    @MainActor
    func movieListInteractor(
        _ repository: MovieListInteracting,
        didRetrieveError error: NetworkError
    )
}
