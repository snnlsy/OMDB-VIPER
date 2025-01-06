//
//  MovieDetailViewTests.swift
//  OMDBTests
//
//  Created by Sinan Ulusoy on 5.01.2025.
//

import XCTest 
import SnapshotTesting
@testable import OMDB

final class MovieDetailViewTests: XCTestCase {

    // MARK: - Properties
    
    private var sut: MovieDetailView!

    // MARK: - Lifecycle Methods
    
    override func setUp() {
        super.setUp()
        sut = MovieDetailView(frame: CGRect(x: 0, y: 0, width: 375, height: 667))
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    // MARK: - Test Methods
    
    func test_movieDetailView_matchesSnapshots() {
        // given
        sut.posterImageView.image = UIImage(named: "inception")
        sut.titleLabel.text = "Sample Movie Title"
        sut.yearLabel.text = "2020"
        
        // when
        let configurations: [ViewImageConfig] = [
            .iPhone8(.portrait),
            .iPhone13(.portrait),
            .iPadPro11(.portrait)
        ]

        // then
        configurations.forEach { config in
            assertSnapshot(
                of: sut,
                as: .image(size: config.size),
                named: snapshotName(config)
            )
        }
    }

    // MARK: - Helper Methods
    
    private var snapshotName: (ViewImageConfig) -> String {
        { config in
            let size = config.size ?? CGSize(width: 0, height: 0)
            return "MovieDetailView-\(Int(size.width))x\(Int(size.height))"
        }
    }
}
