//
//  MovieSearchViewTableViewDelegate.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 23.09.2023.
//

import UIKit


// MARK: - MovieSearchViewTableViewDelegateOutput

protocol MovieSearchViewTableViewDelegateOutput: AnyObject {
    func movieSearchViewTableView(
        _ delegate: MovieSearchViewTableViewDelegate,
        didSelectItemAt indexPath: IndexPath,
        with viewModel: MovieSearchTableViewViewModel
    )
}


// MARK: - MovieSearchViewTableViewDelegate

final class MovieSearchViewTableViewDelegate: NSObject, UITableViewDelegate {
    
    private(set) var viewModel: MovieSearchTableViewViewModel?
    
    weak var output: MovieSearchViewTableViewDelegateOutput?
    
    func update(viewModel: MovieSearchTableViewViewModel) {
        self.viewModel = viewModel
    }
}


// MARK: - MovieSearchViewTableViewDelegate Implementation

extension MovieSearchViewTableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output?.movieSearchViewTableView(self, didSelectItemAt: indexPath, with: viewModel!)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
