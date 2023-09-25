//
//  MovieSearchViewTableViewDataSource.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 23.09.2023.
//

import UIKit


// MARK: - MovieSearchViewTableViewDataSource

final class MovieSearchViewTableViewDataSource: NSObject, UITableViewDataSource {
    
    init(viewModel: MovieSearchTableViewViewModel) {
        self.viewModel = viewModel
    }
    
    private let viewModel: MovieSearchTableViewViewModel
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieSearchTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(with: viewModel.movieList[indexPath.row])
        return cell
    }
}
