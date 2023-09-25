//
//  MovieSearchView.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 22.09.2023.
//

import UIKit
import SnapKit


// MARK: - MovieSearchViewDelegate

protocol MovieSearchViewDelegate: AnyObject {
    func movieSearchView(
        _ view: MovieSearchView,
        didSelectItemAt indexPath: IndexPath,
        with viewModel: MovieSearchTableViewViewModel
    )
}


// MARK: - MovieSearchView

final class MovieSearchView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    weak var delegate: MovieSearchViewDelegate?
    
    private let tableViewDelegate = MovieSearchViewTableViewDelegate()
    private var tableViewDataSource: MovieSearchViewTableViewDataSource?
    private var collectionViewDataSource: MovieSearchViewCollectionViewDataSource?

    private lazy var searchBar: UISearchBar = .build { searchBar in
        searchBar.delegate = self
    }
    
    private lazy var tableView: UITableView = .build { [weak self] tableView in
        tableView.register(MovieSearchTableViewCell.self)
    }
  
    private lazy var collectionView: UICollectionView = {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
        )
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .fractionalHeight(1)
            ),
            subitems: [item]
        )
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewCompositionalLayout(section: section)
        )
        return collectionView
    }()
}


// MARK: - MovieSearchView Setup

extension MovieSearchView {
    
    private func setupView() {
        setupHierarchy()
        setupLayout()
    }
    
    private func setupHierarchy() {
        addSubview(
            searchBar,
            tableView,
            collectionView
        )
    }
    
    private func setupLayout() {
        searchBar.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(safeAreaLayoutGuide)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(300)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(200)
        }
    }
}


// MARK: - MovieSearchView Configuration

extension MovieSearchView {
    
    func configure(with viewModel: MovieSearchTableViewViewModel) {
        tableViewDataSource = MovieSearchViewTableViewDataSource(viewModel: viewModel)
        tableView.dataSource = tableViewDataSource
        tableView.delegate = tableViewDelegate
        tableViewDelegate.output = self
        tableViewDelegate.update(viewModel: viewModel)
        tableView.reloadData()
        
        
        collectionViewDataSource = MovieSearchViewCollectionViewDataSource(viewModel: viewModel)
        collectionView.dataSource = collectionViewDataSource
        collectionView.register(MovieSearchCollectionViewCell.self)
    }
}


// MARK: - UISearchBarDelegate Implementation

extension MovieSearchView: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}


// MARK: - MovieSearchViewTableViewDelegateOutput Implementation

extension MovieSearchView: MovieSearchViewTableViewDelegateOutput {
    
    func movieSearchViewTableView(
        _ delegate: MovieSearchViewTableViewDelegate,
        didSelectItemAt indexPath: IndexPath,
        with viewModel: MovieSearchTableViewViewModel
    ) {
        self.delegate?.movieSearchView(self, didSelectItemAt: indexPath, with: viewModel)
    }
}
