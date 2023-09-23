//
//  MovieDetailViewController.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 23.09.2023.
//

import UIKit


// MARK: - MovieDetailViewControllerProtocol

protocol MovieDetailViewControllerProtocol: AnyObject {
//    func configureLayout()
//    func configure(with viewModel: MovieSearchTableViewViewModel)
}


// MARK: - MovieSearchViewController

final class MovieDetailViewController: UIViewController {
    
    init(presenter: MovieDetailPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let presenter: MovieDetailPresenterProtocol
        
    private lazy var movieDetailView: MovieDetailView = .build { view in
        view.delegate = self
    }
}


// MARK: - MovieDetailViewController Lifecycle

extension MovieDetailViewController {

    override func loadView() {
        view = movieDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        presenter.viewDidLoad()
    }
}


// MARK: - MovieDetailViewControllerProtocol Implementation

extension MovieDetailViewController: MovieDetailViewControllerProtocol {

}


extension MovieDetailViewController: MovieDetailViewDelegate { }
