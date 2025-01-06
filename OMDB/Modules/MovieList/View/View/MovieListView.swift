//
//  MovieListView.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 22.09.2023.
//

import UIKit

// MARK: - MovieListView

final class MovieListView: UIView {
    
    // MARK: - Properties

    weak var delegate: MovieListViewDelegate?
    
    private let tableViewDelegate = MovieListTableViewDelegate()
    private var tableViewDataSource: MovieListTableViewDataSource?
    private let collectionViewDelegate = MovieListCollectionViewDelegate()
    private var collectionViewDataSource: MovieListCollectionViewDataSource?
    // TODO: sinan: move to presenter
    private var searchTimer: Timer?

    private lazy var searchBar: UISearchBar = .builder()
        .delegate(self)
        .text(MovieListViewConstant.defaultQuery)
        .build()
    
    private lazy var tableView: UITableView = .builder()
        .registerCell(MovieListTableViewCell.self)
        .build()
  
    private lazy var collectionView: UICollectionView = {
        let layout = createCompositionalLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemGray3
        return collectionView
    }()
    
    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewHierarchy()
        setupViewConstraints()
        configureTableView()
        configureCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - MovieListView Setup

extension MovieListView {

    private func setupViewHierarchy() {
        add(subview: searchBar)
        add(subview: tableView)
        add(subview: collectionView)
    }

    private func setupViewConstraints() {
        searchBar
            .top(equalTo: safeArea.top)
            .leading(equalTo: safeArea.leading)
            .trailing(equalTo: safeArea.trailing)
        
        tableView
            .top(equalTo: searchBar.bottom)
            .bottom(equalTo: collectionView.top)
            .leading(equalTo: leading)
            .trailing(equalTo: trailing)
        
        collectionView
            .bottom(equalTo: safeArea.bottom)
            .leading(equalTo: leading)
            .trailing(equalTo: trailing)
            .height(equalToConstant: Constant.collectionViewHeight)
    }
}


// MARK: - MovieListView Configuration

extension MovieListView {
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
        )
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.4),
                heightDimension: .fractionalHeight(1)
            ),
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    private func configureTableView() {
        tableViewDelegate.output = self
        tableView.delegate = tableViewDelegate
    }
    
    private func configureCollectionView() {
        collectionViewDataSource = MovieListCollectionViewDataSource()
        collectionViewDataSource?.configureDataSource(for: collectionView)
        collectionViewDelegate.output = self
        collectionView.delegate = collectionViewDelegate
    }
    
    func updateTableView(with viewModel: MovieListViewModel) {
        tableViewDataSource = MovieListTableViewDataSource(viewModel: viewModel)
        tableViewDelegate.update(viewModel: viewModel)
        tableView.dataSource = tableViewDataSource
        tableView.reloadData()
    }
    
    func updateCollectionView(with viewModel: MovieListViewModel) {
        collectionViewDelegate.update(viewModel: viewModel)
        collectionViewDataSource?.applySnapshot(items: viewModel.collectionViewMovieList)
    }
}


// MARK: - UISearchBarDelegate Implementation

extension MovieListView: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchTimer?.invalidate()
        searchTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { [weak self] _ in
            self?.performSearch(with: searchText)
        }
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchTimer?.invalidate()
    }
    
    private func performSearch(with query: String) {
        self.delegate?.movieListView(self, textDidChange: query)
    }
}


// MARK: - MovieListTableViewDelegateOutput Implementation

extension MovieListView: MovieListTableViewDelegateOutput {
    
    func movieListViewTableView(
        _ delegate: MovieListTableViewDelegate,
        didSelectItemAt indexPath: IndexPath,
        with viewModel: MovieListViewModel
    ) {
        self.delegate?.movieListView(self, didSelectTableViewItemAt: indexPath, with: viewModel)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView) {
        self.delegate?.scrollViewDidEndDragging(scrollView)
    }
}


// MARK: - MovieListView CollectionView

extension MovieListView: MovieListViewCollectionViewDelegateOutput {
    
    func movieListCollectionView(
        _ delegate: MovieListCollectionViewDelegate,
        didSelectItemAt indexPath: IndexPath,
        with viewModel: MovieListViewModel
    ) {
        self.delegate?.movieListView(self, didSelectCollectionViewItemAt: indexPath, with: viewModel)
    }

    func collectionViewWillDisplayLastCell(_ collectionView: UICollectionView) {
        self.delegate?.collectionViewWillDisplayLastCell(collectionView)
    }
}


// MARK: - MovieListView Constant

extension MovieListView {
    
    private enum Constant {
        static let collectionViewHeight: CGFloat = 200
    }
}
