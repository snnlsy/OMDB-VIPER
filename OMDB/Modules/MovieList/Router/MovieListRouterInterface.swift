//
//  MovieListRouterInterface.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 2.01.2025.
//

// MARK: - MovieListRouting

/// A protocol defining the navigation and error handling responsibilities of the Movie List router.
/// The router is responsible for managing screen transitions and handling user-facing errors.
protocol MovieListRouting: Routing, LoadingShowable, ErrorShowable {
    
    /// Navigates to the movie detail screen with the specified movie entity.
    ///
    /// - Parameter entity: A `MovieEntity` containing the details of the selected movie.
    /// - Note: This method is called when a user selects a movie from the table view or collection view,
    /// transitioning the app to the detail screen for the chosen movie.
    func routeToMovieDetail(with entity: MovieEntity)
}
