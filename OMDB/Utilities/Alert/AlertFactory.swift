//
//  AlertFactory.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 5.01.2025.
//

import UIKit

// MARK: - Typealiases

typealias AlertAction = (() -> Void)?


// MARK: - AlertFactory

/// Factory for creating UIAlertControllers
enum AlertFactory {

    // MARK: - Public Functions

    /// Creates an alert with a single "OK" button
    static func makeOkAlert(
        title: String = Constants.defaultAlertTitle,
        message: String,
        okActionHandler: AlertAction = nil
    ) -> UIAlertController {
        let alert = makeAlert(title: title, message: message)
        alert.addAction(makeAction(title: Constants.okButtonTitle, handler: okActionHandler))
        return alert
    }

    /// Creates an error alert with "OK" button
    static func makeErrorAlert(
        message: String,
        okActionHandler: AlertAction = nil
    ) -> UIAlertController {
        let alert = makeAlert(title: Constants.errorAlertTitle, message: message)
        alert.addAction(makeAction(title: Constants.okButtonTitle, handler: okActionHandler))
        return alert
    }

    /// Creates an error alert with "Retry" and "OK" buttons
    static func makeErrorAlertWithRetry(
        message: String,
        retryActionHandler: AlertAction,
        okActionHandler: AlertAction = nil
    ) -> UIAlertController {
        let alert = makeAlert(title: Constants.errorAlertTitle, message: message)
        alert.addAction(makeAction(title: Constants.retryButtonTitle, handler: retryActionHandler))
        alert.addAction(makeAction(title: Constants.okButtonTitle, handler: okActionHandler))
        return alert
    }

    // MARK: - Private Helpers

    private static func makeAlert(title: String, message: String) -> UIAlertController {
        UIAlertController(title: title, message: message, preferredStyle: .alert)
    }

    private static func makeAction(
        title: String,
        style: UIAlertAction.Style = .default,
        handler: AlertAction
    ) -> UIAlertAction {
        UIAlertAction(title: title, style: style) { _ in
            handler?()
        }
    }
}


// MARK: - Constants

private extension AlertFactory {
    enum Constants {
        static let defaultAlertTitle = "Alert"
        static let errorAlertTitle = "Ooops Error"
        static let okButtonTitle = "OK"
        static let retryButtonTitle = "Retry"
    }
}
