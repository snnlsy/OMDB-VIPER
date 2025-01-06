//
//  MockMovieListRouter.swift
//  OMDBTests
//
//  Created by Sinan Ulusoy on 5.01.2025.
//

import XCTest
@testable import OMDB

final class MockMovieListRouter: MovieListRouting {
    
    var viewController: UIViewController?
    
    private(set) var isRouteToMovieDetailCalled = false
    private(set) var routeToMovieDetailCalledWith: MovieEntity?
    func routeToMovieDetail(with entity: MovieEntity) {
        isRouteToMovieDetailCalled = true
        routeToMovieDetailCalledWith = entity
    }

    private(set) var isShowLoadingViewCalled = false
    func showLoading() {
        isShowLoadingViewCalled = true
    }

    private(set) var isShowErrorCalled = false
    private(set) var showErrorCalledWithDescription: String?
    func showError(description: String, retryAction: (() -> Void)?) {
        isShowErrorCalled = true
        showErrorCalledWithDescription = description
    }

    func hideLoading() {
    }
}
