//
//  LoadingViewController.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 25.09.2023.
//

import UIKit

// MARK: - LoadingViewController

final class LoadingViewController: UIViewController {

    // MARK: - Properties

    private lazy var activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
        return activityIndicator
    }()

    // MARK: - Initializers

    init() {
        super.init(nibName: nil, bundle: nil)
        configureViewController()
        setupViewHierarchy()
        setupViewConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func configureViewController() {
        modalPresentationStyle = .overCurrentContext
        view.backgroundColor = .black.withAlphaComponent(0.3)
    }

    private func setupViewHierarchy() {
        view.addSubview(activityIndicatorView)
    }

    private func setupViewConstraints() {
        NSLayoutConstraint.activate([
            activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
