//
//  MovieListViewInterface.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 2.01.2025.
//

import UIKit

// MARK: - MovieListViewing

/// A protocol defining the interface for the Movie List view to interact with the presenter.
/// This protocol ensures the separation of concerns by delegating the view's behavior to the presenter.
protocol MovieListViewing: AnyObject {
    
    /// Configures the layout and initial UI settings for the movie list view.
    ///
    /// This function is typically called once the view is loaded to apply static configurations such as colors,
    /// layout constraints, and navigation bar titles.
    func configureLayout()
    
    /// Updates the table view with the provided movie list view model.
    ///
    /// - Parameter viewModel: The `MovieListViewModel` containing the data to display in the table view.
    /// - Note: This function reloads the table view with the updated data, ensuring it reflects the latest state.
    func configureTableView(with viewModel: MovieListViewModel)
    
    /// Updates the collection view with the provided movie list view model.
    ///
    /// - Parameter viewModel: The `MovieListViewModel` containing the data to display in the collection view.
    /// - Note: This function reloads the collection view to ensure it displays the correct data.
    func configureCollectionView(with viewModel: MovieListViewModel)
}


// MARK: - MovieListViewDelegate

/// A delegate protocol for handling user interactions in the Movie List view.
protocol MovieListViewDelegate: AnyObject {
    
    /// Called when a table view item is selected by the user.
    ///
    /// - Parameters:
    ///   - view: The `MovieListView` instance where the selection occurred.
    ///   - indexPath: The index path of the selected item.
    ///   - viewModel: The current view model containing the data for the table view.
    func movieListView(
        _ view: MovieListView,
        didSelectTableViewItemAt indexPath: IndexPath,
        with viewModel: MovieListViewModel
    )
    
    /// Called when a collection view item is selected by the user.
    ///
    /// - Parameters:
    ///   - view: The `MovieListView` instance where the selection occurred.
    ///   - indexPath: The index path of the selected item.
    ///   - viewModel: The current view model containing the data for the collection view.
    func movieListView(
        _ view: MovieListView,
        didSelectCollectionViewItemAt indexPath: IndexPath,
        with viewModel: MovieListViewModel
    )
    
    /// Called when the search text in the search bar is updated by the user.
    ///
    /// - Parameters:
    ///   - view: The `MovieListView` instance containing the search bar.
    ///   - searchText: The updated search text entered by the user.
    func movieListView(
        _ view: MovieListView,
        textDidChange searchText: String
    )
    
    /// Called when the user finishes dragging the table view.
    ///
    /// - Parameter scrollView: The `UIScrollView` instance representing the table view.
    /// - Note: This is typically used to detect when to load more data as the user scrolls to the bottom.
    func scrollViewDidEndDragging(_ scrollView: UIScrollView)
    
    /// Called when the last cell of the collection view is about to be displayed.
    ///
    /// - Parameter collectionView: The `UICollectionView` instance displaying the items.
    /// - Note: This function is used to trigger loading of more data for infinite scrolling.
    func collectionViewWillDisplayLastCell(_ collectionView: UICollectionView)
}


// MARK: - MovieListTableViewDelegateOutput

/// A protocol for handling events triggered by the table view delegate.
protocol MovieListTableViewDelegateOutput: AnyObject {
    
    /// Called when a table view item is selected.
    ///
    /// - Parameters:
    ///   - delegate: The table view delegate handling the selection.
    ///   - indexPath: The index path of the selected item.
    ///   - viewModel: The current view model containing the table view's data.
    func movieListViewTableView(
        _ delegate: MovieListTableViewDelegate,
        didSelectItemAt indexPath: IndexPath,
        with viewModel: MovieListViewModel
    )
    
    /// Called when the user finishes dragging the scroll view.
    ///
    /// - Parameter scrollView: The `UIScrollView` instance that was dragged.
    /// - Note: Typically used to detect if more data needs to be loaded when reaching the bottom of the table view.
    func scrollViewDidEndDragging(_ scrollView: UIScrollView)
}


// MARK: - MovieListCollectionViewDataSourcing

/// A protocol defining the interface for managing the collection view's data source.
protocol MovieListCollectionViewDataSourcing: AnyObject {
    
    /// Configures the collection view's data source.
    ///
    /// - Parameter collectionView: The `UICollectionView` instance to configure.
    /// - Note: This function is responsible for setting up the initial data and registering cell types.
    func configureDataSource(for collectionView: UICollectionView)
    
    /// Applies a snapshot of items to the collection view's data source.
    ///
    /// - Parameters:
    ///   - items: The array of `MovieEntity` items to display.
    ///   - animateChanges: A Boolean value indicating whether changes should be animated.
    /// - Note: This function is used to update the collection view with new data dynamically.
    func applySnapshot(items: [MovieEntity], animateChanges: Bool)
    
    /// Retrieves the movie entity at a specific index.
    ///
    /// - Parameter index: The index of the item to retrieve.
    /// - Returns: The `MovieEntity` at the specified index, or `nil` if the index is invalid.
    func getMovieEntity(at index: Int) -> MovieEntity?
}


// MARK: - MovieListViewCollectionViewDelegateOutput

/// A protocol for handling events triggered by the collection view delegate.
protocol MovieListViewCollectionViewDelegateOutput: AnyObject {
    
    /// Called when a collection view item is selected.
    ///
    /// - Parameters:
    ///   - delegate: The collection view delegate handling the selection.
    ///   - indexPath: The index path of the selected item.
    ///   - viewModel: The current view model containing the collection view's data.
    func movieListCollectionView(
        _ delegate: MovieListCollectionViewDelegate,
        didSelectItemAt indexPath: IndexPath,
        with viewModel: MovieListViewModel
    )
    
    /// Called when the last cell in the collection view is about to be displayed.
    ///
    /// - Parameter collectionView: The `UICollectionView` instance displaying the items.
    /// - Note: Used to load more data when reaching the end of the collection view.
    func collectionViewWillDisplayLastCell(_ collectionView: UICollectionView)
}
