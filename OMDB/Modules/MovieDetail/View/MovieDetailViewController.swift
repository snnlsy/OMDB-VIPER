//
//  MovieDetailViewController.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 23.09.2023.
//

import UIKit

// MARK: - MovieListViewController

final class MovieDetailViewController: UIViewController {
    
    // MARK: - Properties

    private let presenter: MovieDetailPresenting
        
    private lazy var movieDetailView: MovieDetailView = .builder()
        .backgroundColor(.systemGray3)
        .build()
    
    // MARK: - Initializers

    init(presenter: MovieDetailPresenting) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - Lifecycle Methods

extension MovieDetailViewController {

    override func loadView() {
        view = movieDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}


// MARK: - MovieDetailViewing Implementation

extension MovieDetailViewController: MovieDetailViewing {
    
    func configure(with entity: MovieEntity) {
        movieDetailView.titleLabel.text = entity.title
        movieDetailView.yearLabel.text = entity.year
        movieDetailView.posterImageView.setImage(from: entity.poster)
    }
}
