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
        didSelectTableViewItemAt indexPath: IndexPath,
        with viewModel: MovieSearchViewModel
    )
    
    func movieSearchView(
        _ view: MovieSearchView,
        didSelectCollectionViewItemAt indexPath: IndexPath,
        with viewModel: MovieSearchViewModel
    )
    
    func scrollViewDidEndDragging(
        _ scrollView: UIScrollView
    )
    
    func collectionViewWillDisplayLastCell(
        _ collectionView: UICollectionView
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
    
    private let tableViewDelegate = MovieSearchTableViewDelegate()
    private var tableViewDataSource: MovieSearchTableViewDataSource?
    private let collectionViewDelegate = MovieSearchCollectionViewDelegate()
    private var collectionViewDataSource: MovieSearchCollectionViewDataSource?

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
            make.bottom.equalTo(collectionView.snp.top)
            make.horizontalEdges.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(200)
        }
    }
}


// MARK: - MovieSearchView Configuration

extension MovieSearchView {
    
    func configure(with viewModel: MovieSearchViewModel) {
        tableViewDataSource = MovieSearchTableViewDataSource(viewModel: viewModel)
        tableView.dataSource = tableViewDataSource
        tableView.delegate = tableViewDelegate
        tableViewDelegate.output = self
        tableViewDelegate.update(viewModel: viewModel)
        tableView.reloadData()
        
        
        collectionViewDataSource = MovieSearchCollectionViewDataSource(viewModel: viewModel)
        collectionView.dataSource = collectionViewDataSource
        collectionView.delegate = collectionViewDelegate
        collectionViewDelegate.output = self
        collectionView.register(MovieSearchCollectionViewCell.self)
        collectionViewDelegate.update(viewModel: viewModel)
        collectionView.reloadData()
    }
}


// MARK: - UISearchBarDelegate Implementation

extension MovieSearchView: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}


// MARK: - MovieSearchTableViewDelegateOutput Implementation

extension MovieSearchView: MovieSearchTableViewDelegateOutput {
    
    func movieSearchViewTableView(
        _ delegate: MovieSearchTableViewDelegate,
        didSelectItemAt indexPath: IndexPath,
        with viewModel: MovieSearchViewModel
    ) {
        self.delegate?.movieSearchView(self, didSelectTableViewItemAt: indexPath, with: viewModel)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView) {
        self.delegate?.scrollViewDidEndDragging(scrollView)
    }
}


// MARK: - MovieSearchView CollectionView

extension MovieSearchView: MovieSearchViewCollectionViewDelegateOutput {
    
    func movieSearchCollectionView(
        _ delegate: MovieSearchCollectionViewDelegate,
        didSelectItemAt indexPath: IndexPath,
        with viewModel: MovieSearchViewModel
    ) {
        self.delegate?.movieSearchView(self, didSelectCollectionViewItemAt: indexPath, with: viewModel)
    }

    func collectionViewWillDisplayLastCell(_ collectionView: UICollectionView) {
        self.delegate?.collectionViewWillDisplayLastCell(collectionView)
    }
}
