//
//  ReusableViewProtocol.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 23.09.2023.
//


// MARK: - ReusableViewProtocol

protocol ReusableViewProtocol {
    static var reuseIdentifier: String { get }
}


// MARK: - ReusableViewProtocol implementation

extension ReusableViewProtocol {

    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
