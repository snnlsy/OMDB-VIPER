//
//  MovieSearchTableViewViewModel.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 23.09.2023.
//

import Foundation


// MARK: - MovieSearchTableViewViewModel

struct MovieSearchViewModel {
    
    // TODO: make update
    
    enum MovieListType {
        case tableView
        case collectionView
    }
    
    var tableViewMovieList: [MovieEntity] = []
    var collectionViewMovieList: [MovieEntity] = []
    
    var tableViewPage = 1
    var collectionViewPage = 1
    
    var query: String = "Star"
}
