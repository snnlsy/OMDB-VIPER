//
//  SUUIBuilder+Extension.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 5.01.2025.
//

import UIKit
import SUUIBuilder

extension UIBuilder {
    
    @discardableResult
    public func registerCell<C: UITableViewCell>(_ cellType: C.Type) -> Self where T: UITableView {
        let tableView = component as UITableView
        tableView.register(cellType, forCellReuseIdentifier: cellType.reuseIdentifier)
        return self
    }
}
