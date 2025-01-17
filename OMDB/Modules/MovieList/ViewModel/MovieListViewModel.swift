//
//  MovieListTableViewViewModel.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 23.09.2023.
//

// MARK: - MovieListTableViewViewModel

struct MovieListViewModel {
    
    enum MovieListSection: Hashable {
        case movieObjects
    }
    
    enum MovieListType {
        case tableView
        case collectionView
    }
    
    struct Page {
        
        let tableViewPage: Int
        let collectionViewPage: Int
        
        init(tableViewPage: Int = 1, collectionViewPage: Int = 1) {
            self.tableViewPage = tableViewPage
            self.collectionViewPage = collectionViewPage
        }
        
        func resetTableViewPage() -> Self {
            .init(
                collectionViewPage: collectionViewPage
            )
        }
        
        func resetCollectionViewPage() -> Self {
            .init(
                tableViewPage: tableViewPage
            )
        }
        
        func increaseTableViewPage() -> Self {
            .init(
                tableViewPage: tableViewPage + 1,
                collectionViewPage: collectionViewPage
            )
        }
        
        func increaseCollectionViewPage() -> Self {
            .init(
                tableViewPage: tableViewPage,
                collectionViewPage: collectionViewPage + 1
            )
        }
    }
    
    var query: String = MovieListViewConstant.defaultQuery
    var tableViewMovieList: [MovieEntity] = []
    var collectionViewMovieList: [MovieEntity] = []
    var page = Page()
}
