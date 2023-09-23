//
//  ReusableViewProtocol.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 23.09.2023.
//

protocol ReusableViewProtocol {

    static var reuseIdentifier: String { get }
}

extension ReusableViewProtocol {

    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
