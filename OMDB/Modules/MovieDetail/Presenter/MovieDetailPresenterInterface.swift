//
//  MovieDetailPresenterInterface.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 2.01.2025.
//

// MARK: - MovieDetailPresenting

/// A protocol defining the interface for the Movie Detail presenter.
/// The presenter handles the interaction between the view and the router, orchestrating the display of movie details.
protocol MovieDetailPresenting: AnyObject {
    
    /// A reference to the view associated with the presenter.
    ///
    /// - Note: The view conforms to `MovieDetailViewing`, allowing the presenter to update UI elements with movie details.
    var view: MovieDetailViewing? { get set }
    
    /// Called when the view is loaded to initialize the display of movie details.
    ///
    /// - Note: This method configures the view with the movie details provided to the presenter.
    func viewDidLoad()
}
