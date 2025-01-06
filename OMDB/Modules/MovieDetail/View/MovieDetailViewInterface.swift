//
//  MovieDetailViewInterface.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 2.01.2025.
//

// MARK: - MovieDetailViewing

/// A protocol defining the interface for the Movie Detail view.
/// The view conforms to this protocol to allow the presenter to update the UI with movie details.
protocol MovieDetailViewing: AnyObject {
    
    /// Configures the view with the provided movie entity.
    ///
    /// - Parameter entity: A `MovieEntity` containing the details of the movie to display.
    /// - Note: This method updates the view components such as labels and image views to reflect the movie's title,
    /// year, and poster image.
    func configure(with entity: MovieEntity)
}
