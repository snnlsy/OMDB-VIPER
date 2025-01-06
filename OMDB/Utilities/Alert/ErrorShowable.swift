//
//  ErrorShowable.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 5.01.2025.
//

import Foundation

// MARK: - ErrorShowable

/// A protocol defining the interface for displaying error alerts to the user.
/// This protocol standardizes how errors are presented, allowing for consistent error handling across the application.
protocol ErrorShowable: AnyObject {
    
    /// Displays an error alert with a retry action.
    ///
    /// - Parameters:
    ///   - description: A `String` describing the error to display to the user.
    ///   - retryAction: An optional closure to execute when the user selects the retry option.
    ///
    /// - Note: This method is used to present user-friendly error messages and provide an option to retry the failed operation.
    func showError(description: String, retryAction: AlertAction)
}


// MARK: - ErrorShowable Implementation

extension ErrorShowable where Self: Routing {

    func showError(description: String, retryAction: AlertAction = nil) {
        guard let viewController else {
            assertionFailure("Router's viewController is nil. Cannot present the error alert.")
            return
        }

        let errorAlert = AlertFactory.makeErrorAlertWithRetry(
            message: description,
            retryActionHandler: retryAction
        )

        Task { @MainActor in viewController.present(errorAlert, animated: true) }
    }
}
