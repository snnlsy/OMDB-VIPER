//
//  MovieSearchViewTableViewDelegate.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 23.09.2023.
//

import UIKit


// MARK: - MovieSearchViewTableViewDelegateOutput

protocol MovieSearchTableViewDelegateOutput: AnyObject {
    func movieSearchViewTableView(
        _ delegate: MovieSearchTableViewDelegate,
        didSelectItemAt indexPath: IndexPath,
        with viewModel: MovieSearchViewModel
    )
}


// MARK: - MovieSearchViewTableViewDelegate

final class MovieSearchTableViewDelegate: NSObject, UITableViewDelegate {
    
    private(set) var viewModel: MovieSearchViewModel?
    
    weak var output: MovieSearchTableViewDelegateOutput?
    
    func update(viewModel: MovieSearchViewModel) {
        self.viewModel = viewModel
    }
}


// MARK: - MovieSearchTableViewDelegate Implementation

extension MovieSearchTableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel else { return }
        output?.movieSearchViewTableView(self, didSelectItemAt: indexPath, with: viewModel)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
