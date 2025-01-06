//
//  UIView+Anchor.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 5.01.2025.
//

import UIKit

extension UIView {
    
    var trailing: NSLayoutXAxisAnchor { trailingAnchor }
    
    var leading: NSLayoutXAxisAnchor { leadingAnchor }
    
    var top: NSLayoutYAxisAnchor { topAnchor }
    
    var bottom: NSLayoutYAxisAnchor { bottomAnchor }
    
    var centerX: NSLayoutXAxisAnchor { centerXAnchor }
    
    var centerY: NSLayoutYAxisAnchor { centerYAnchor }
    
    var width: NSLayoutDimension { widthAnchor }
    
    var height: NSLayoutDimension { heightAnchor }
    
    var safeArea: UILayoutGuide { safeAreaLayoutGuide }
}