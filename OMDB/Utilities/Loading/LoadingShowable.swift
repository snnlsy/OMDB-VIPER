//
//  LoadingShowable.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 5.01.2025.
//

// MARK: - LoadingShowable Protocol

/// A protocol that provides functionality for displaying and hiding a loading view.
///
/// Classes conforming to this protocol can use `showLoading()` and `hideLoading()`
/// methods to display or dismiss a centralized loading indicator.
protocol LoadingShowable: AnyObject {
    /// Displays a loading view.
    func showLoading()
    
    /// Hides the loading view.
    func hideLoading()
}


// MARK: - LoadingShowable Default Implementation

extension LoadingShowable where Self: Routing {
    
    func showLoading() {
        guard let viewController = self.viewController else {
            assertionFailure("Router's viewController is nil. Cannot present the loading view.")
            return
        }
        LoadingManager.shared.showLoading(from: viewController)
    }

    func hideLoading() {
        LoadingManager.shared.hideLoading()
    }
}
