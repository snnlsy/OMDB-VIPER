//
//  MovieSearchTableViewViewModel.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 23.09.2023.
//

import Foundation


// MARK: - MovieSearchTableViewViewModel

struct MovieSearchViewModel {
    
    enum MovieListType {
        case tableView
        case collectionView
    }
    
    var tableViewMovieList: [MovieEntity] = []
    var collectionViewMovieList: [MovieEntity] = []
}
