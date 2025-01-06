//
//  ReusableViewing.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 23.09.2023.
//

// MARK: - ReusableViewing

/// A protocol defining a reusable identifier for views, particularly table view and collection view cells.
/// This protocol standardizes the reuse identifier generation process for views to ensure consistency and prevent errors.
protocol ReusableViewing {
    
    /// A static property that provides a unique identifier for reusable views.
    ///
    /// - Note: The default implementation returns the class name of the conforming type.
    /// This ensures that each view type has a consistent and unique reuse identifier.
    static var reuseIdentifier: String { get }
}


// MARK: - Default Implementation

extension ReusableViewing {

    /// Default implementation of `reuseIdentifier` using the class name.
    ///
    /// - Returns: The class name of the conforming type as a string.
    /// - Example: For a `CustomTableViewCell` class, the reuse identifier will be `"CustomTableViewCell"`.
    static var reuseIdentifier: String {
        String(describing: self)
    }
}
