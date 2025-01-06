//
//  UIImageView+Extension.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 2.01.2025.
//

import UIKit
import SUImage

extension UIImageView {
    
    public func setImage(
        from urlString: String?,
        placeholder: UIImage? = nil,
        size: CGSize? = nil,
        errorImage: UIImage? = nil
    ) {
        guard let urlString, let url = URL(string: urlString) else { return }
        self.setImage(
            from: url,
            placeholder: placeholder, 
            size: size,
            errorImage: errorImage
        )
    }
}
