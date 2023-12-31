//
//  UICollectionView+Extension.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 23.09.2023.
//

import UIKit

extension UICollectionView {
    
    func register(_ type: UICollectionViewCell.Type) {
        register(type, forCellWithReuseIdentifier: type.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(
            withReuseIdentifier: T.reuseIdentifier,
            for: indexPath
        ) as? T else {
            fatalError("Unable to Dequeue Reusable CollectionViewCell")
        }
        return cell
    }
}
