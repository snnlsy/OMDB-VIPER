//
//  MovieListPresenterTests.swift
//  OMDBTests
//
//  Created by Sinan Ulusoy on 5.01.2025.
//

import XCTest
@testable import OMDB

final class MovieListPresenterTests: XCTestCase {
    
    // MARK: - Private Variables

    private var sut: MovieListPresenter!
    private var view: MockMovieListViewController!
    private var router: MockMovieListRouter!
    private var interactor: MockMovieListInteractor!

    // MARK: - Lifecycle

    override func setUp() {
        super.setUp()
        view = .init()
        router = .init()
        interactor = .init()
        makeSUT()
    }

    override func tearDown() {
        sut = nil
        view = nil
        router = nil
        interactor = nil
        super.tearDown()
    }

    // MARK: - Tests

    func test_viewDidLoad_callsRequiredMethods() {
            // When
            sut.viewDidLoad()

            // Then
            XCTAssertTrue(router.isShowLoadingViewCalled)
            XCTAssertTrue(view.isConfigureLayoutCalled)
            XCTAssertTrue(interactor.isRetrieveMovieListCalled)
        }
    
    func test_didSelectTableView_routesToMovieDetail() {
        // Given
        let indexPath = IndexPath(row: 0, section: 0)

        // When
        sut.didSelectTableView(at: indexPath, with: sut.testViewModel)

        // Then
        XCTAssertTrue(router.isRouteToMovieDetailCalled)
    }

    func test_didSelectTableView_passesCorrectMovieEntityToRouter() {
        // Given
        let indexPath = IndexPath(row: 1, section: 0)

        // When
        sut.didSelectTableView(at: indexPath, with: sut.testViewModel)

        // Then
        XCTAssertEqual(router.routeToMovieDetailCalledWith?.title, "Movie2")
        XCTAssertEqual(router.routeToMovieDetailCalledWith?.year, "2001")
        XCTAssertEqual(router.routeToMovieDetailCalledWith?.poster, "Poster2")
    }
    
    func test_retrieveMovieList_callsInteractorWithCorrectType() {
        // Given
        let movieListType = MovieListViewModel.MovieListType.tableView

        // When
        sut.retrieveMovieList(movieListType: movieListType)

        // Then
        XCTAssertTrue(interactor.isRetrieveMovieListCalled)
        XCTAssertEqual(interactor.retrieveMovieListCalledWithType, movieListType)
    }

    func test_movieListPresenter_updatesQueryAndResetsList() {
        // Given
        let searchText = "NewQuery"

        // When
        sut.movieListPresenter(textDidChange: searchText)

        // Then
        XCTAssertEqual(sut.testViewModel.query, searchText)
        XCTAssertTrue(sut.testViewModel.tableViewMovieList.isEmpty)
        XCTAssertEqual(sut.testViewModel.page.tableViewPage, 1)
        XCTAssertTrue(interactor.isRetrieveMovieListCalled)
    }
    
    @MainActor
    func test_movieSearchInteractor_updatesViewModelAndNotifiesView() {
        // Given
        let response = MovieListResponseModel(
            search: [
                SearchModel(title: "Movie3", year: "2002", imdbID: "id3", poster: "Poster3")
            ],
            totalResults: "1",
            response: "True"
        )

        // When
        sut.movieListInteractor(
            interactor,
            movieListType: .tableView,
            didRetrieveMovieList: response
        )

        // Then
        XCTAssertEqual(sut.testViewModel.tableViewMovieList.count, 3)
        XCTAssertEqual(sut.testViewModel.tableViewMovieList.last?.title, "Movie3")
        XCTAssertTrue(view.isConfigureTableViewCalled)
    }
    
    // MARK: - Helpers

    private func makeSUT() {
        let vm = MovieListViewModel(
            query: "TestQuery",
            tableViewMovieList: [
                MovieEntity(title: "Movie1", poster: "Poster1", year: "2000"),
                MovieEntity(title: "Movie2", poster: "Poster2", year: "2001")
            ],
            collectionViewMovieList: []
        )
        sut = .init(router: router, interactor: interactor, viewModel: vm)
        sut.view = view
        interactor.output = sut
    }
}
