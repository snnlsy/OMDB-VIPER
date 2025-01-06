//
//  MovieListViewTableViewDataSource.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 23.09.2023.
//

import UIKit

// MARK: - MovieListViewTableViewDataSource

final class MovieListTableViewDataSource: NSObject, UITableViewDataSource {

    // MARK: - Properties

    private let viewModel: MovieListViewModel
    
    // MARK: - Initializers

    init(viewModel: MovieListViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Delegates

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.tableViewMovieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieListTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(with: viewModel.tableViewMovieList[indexPath.row])
        return cell
    }
}
