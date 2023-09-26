//
//  UIView+Extension.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 22.09.2023.
//

import UIKit

extension UIView {
    
    static func build<T: UIView>(_ builder: ((T) -> Void)? = nil) -> T {
        let view = T()
        builder?(view)
        return view
    }
    
    func addSubview(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
