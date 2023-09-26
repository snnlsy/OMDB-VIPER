//
//  MovieSearchViewTableViewDataSource.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 23.09.2023.
//

import UIKit

// MARK: - MovieSearchViewTableViewDataSource

final class MovieSearchTableViewDataSource: NSObject, UITableViewDataSource {
    
    init(viewModel: MovieSearchViewModel) {
        self.viewModel = viewModel
    }
    
    private let viewModel: MovieSearchViewModel
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tableViewMovieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieSearchTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(with: viewModel.tableViewMovieList[indexPath.row])
        return cell
    }
}
