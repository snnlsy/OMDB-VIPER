//
//  MovieDetailRouterInterface.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 5.01.2025.
//

// MARK: - MovieDetailRouting

/// A protocol defining the navigation and error handling responsibilities for the Movie Detail module.
/// The router manages transitions and user-facing feedback for the Movie Detail screen.
protocol MovieDetailRouting: Routing, LoadingShowable, ErrorShowable {
    
    /// Handles navigation and coordination tasks specific to the Movie Detail module.
    ///
    /// - Note: This protocol is designed to provide additional flexibility for extending
    /// navigation or routing logic, such as transitioning to related screens or managing modal presentations.
}
