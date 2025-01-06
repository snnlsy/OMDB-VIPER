//
//  MockMovieListViewController.swift
//  OMDBTests
//
//  Created by Sinan Ulusoy on 5.01.2025.
//

import XCTest
@testable import OMDB

final class MockMovieListViewController: UIViewController & MovieListViewing {

    private(set) var isConfigureLayoutCalled = false
    func configureLayout() {
        isConfigureLayoutCalled = true
    }

    private(set) var isConfigureTableViewCalled = false
    func configureTableView(with viewModel: MovieListViewModel) {
        isConfigureTableViewCalled = true
    }

    func configureCollectionView(with viewModel: MovieListViewModel) {
    }
}
