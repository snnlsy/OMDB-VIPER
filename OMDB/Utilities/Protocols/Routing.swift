//
//  Routing.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 2.01.2025.
//

import UIKit

// MARK: - Routing

/// A protocol defining the basic responsibilities of a router in a VIPER architecture.
/// Routers handle navigation between view controllers and act as a coordinator for view transitions.
protocol Routing: AnyObject {
    
    /// A reference to the view controller managed by the router.
    ///
    /// - Note: This property is used to present or push new view controllers during navigation.
    var viewController: UIViewController? { get set }
}
