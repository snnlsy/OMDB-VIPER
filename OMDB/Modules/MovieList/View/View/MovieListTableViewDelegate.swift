//
//  MovieListViewTableViewDelegate.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 23.09.2023.
//

import UIKit

// MARK: - MovieListViewTableViewDelegate

final class MovieListTableViewDelegate: NSObject {
    
    // MARK: - Properties

    private(set) var viewModel: MovieListViewModel?
    
    weak var output: MovieListTableViewDelegateOutput?
    
    // MARK: - Configurations

    func update(viewModel: MovieListViewModel) {
        self.viewModel = viewModel
    }
}


// MARK: - MovieListTableViewDelegate Implementation

extension MovieListTableViewDelegate: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel else { return }
        output?.movieListViewTableView(self, didSelectItemAt: indexPath, with: viewModel)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constant.tableViewCellHeight
    }
}


// MARK: - UIScrollViewDelegate Implementation

extension MovieListTableViewDelegate {
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        if maximumOffset - currentOffset <= Constant.offsetLimit {
            output?.scrollViewDidEndDragging(scrollView)
        }
    }
}


// MARK: - MovieListTableViewDelegate Constant

extension MovieListTableViewDelegate {
    
    private enum Constant {
        static let tableViewCellHeight: CGFloat = 100
        static let offsetLimit: CGFloat = 30
    }
}
