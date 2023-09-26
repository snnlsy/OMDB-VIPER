//
//  MovieDetailBuilder.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 23.09.2023.
//

import UIKit

enum MovieDetailBuilder {
    
    static func build(navigationController: UINavigationController?, movieEntity: MovieEntity) -> UIViewController {
        let presenter = MovieDetailPresenter(movieEntity: movieEntity)
        let view = MovieDetailViewController(presenter: presenter)
        
        presenter.view = view
        
        return view
    }
}
