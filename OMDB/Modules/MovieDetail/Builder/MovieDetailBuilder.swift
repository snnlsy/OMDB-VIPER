//
//  MovieDetailBuilder.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 23.09.2023.
//

import UIKit

enum MovieDetailBuilder {
    
    static func build(navigationController: UINavigationController?) -> UIViewController {
        let presenter = MovieDetailPresenter()
        let view = MovieDetailViewController(presenter: presenter)
        
        return view
    }
}
