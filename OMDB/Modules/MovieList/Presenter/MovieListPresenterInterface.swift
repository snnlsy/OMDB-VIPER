//
//  MovieListPresenterInterface.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 2.01.2025.
//

import Foundation

// MARK: - MovieListPresenting

/// A protocol defining the interface for the Movie List presenter.
/// The presenter acts as the middle layer, coordinating between the view and the interactor.
/// It handles user interactions, updates the view, and delegates business logic to the interactor.
protocol MovieListPresenting: AnyObject {
    
    /// A reference to the view associated with the presenter.
    ///
    /// - Note: The view conforms to `MovieListViewing` to allow the presenter to update the UI.
    var view: MovieListViewing? { get set }
    
    /// Called when the view is loaded to perform initial setup and data retrieval.
    ///
    /// - Note: This method sets up the layout and triggers the initial data fetch for both table view and collection view.
    func viewDidLoad()
    
    /// Handles the user's selection of an item in the table view.
    ///
    /// - Parameters:
    ///   - indexPath: The index path of the selected item.
    ///   - viewModel: The current view model containing the data for the table view.
    /// - Note: This method is responsible for navigating to the movie detail screen with the selected movie's details.
    func didSelectTableView(
        at indexPath: IndexPath,
        with viewModel: MovieListViewModel
    )
    
    /// Handles the user's selection of an item in the collection view.
    ///
    /// - Parameters:
    ///   - indexPath: The index path of the selected item.
    ///   - viewModel: The current view model containing the data for the collection view.
    /// - Note: This method is responsible for navigating to the movie detail screen with the selected movie's details.
    func didSelectCollectionView(
        at indexPath: IndexPath,
        with viewModel: MovieListViewModel
    )
    
    /// Triggers the retrieval of a new set of movies for the specified view type.
    ///
    /// - Parameter movieListType: The type of view (`tableView` or `collectionView`) requesting more data.
    /// - Note: This method delegates the data fetching logic to the interactor and updates the view with the results.
    func retrieveMovieList(movieListType: MovieListViewModel.MovieListType)
    
    /// Updates the movie search query and resets the current table view data.
    ///
    /// - Parameter searchText: The updated search text entered by the user.
    /// - Note: This method clears the current table view data and fetches movies matching the new search query.
    func movieListPresenter(textDidChange searchText: String)
}
