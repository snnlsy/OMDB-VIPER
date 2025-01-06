//
//  UIEdgeInsets+Extension.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 5.01.2025.
//

import UIKit

extension UIEdgeInsets {

    public static func paddingAll(_ value: CGFloat) -> UIEdgeInsets {
        .init(top: value, left: value, bottom: value, right: value)
    }

    public static func horizontal(_ value: CGFloat) -> UIEdgeInsets {
        .init(top: 0, left: value, bottom: 0, right: value)
    }

    public static func vertical(_ value: CGFloat) -> UIEdgeInsets {
        .init(top: value, left: 0, bottom: value, right: 0)
    }
}
