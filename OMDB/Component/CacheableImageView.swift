//
//  CacheableImageView.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 25.09.2023.
//

import UIKit

// MARK: - CacheableImageView

final class CacheableImageView: UIImageView {
    
    private static let imageCache = NSCache<NSString, UIImage>()
    
    func setImage(with imageUrlString: String?) {
        guard let imageUrlString,
              let imageUrl = URL(string: imageUrlString) else { return }
        checkCache(from: imageUrl) { cachedImage in
            if let cachedImage {
                self.image = cachedImage
                return
            }
            NetworkService.shared.fetchData(url: imageUrl) { [weak self] response in
                switch response {
                case .success(let data):
                    guard let fetchedImage = self?.dataToImage(data: data) else { return }
                    Self.imageCache.setObject(fetchedImage, forKey: NSString(string: imageUrl.absoluteString))
                    DispatchQueue.main.async { [weak self] in
                        self?.image = fetchedImage
                    }
                case .failure(_):
                    return
                }
            }
        }
    }
}


// MARK: - CacheableImageView Private Functions

extension CacheableImageView {
    
    private func checkCache(from imageUrl: URL, completion: (UIImage?) -> Void) {
        let cacheKey = NSString(string: imageUrl.absoluteString)
        if let image = Self.imageCache.object(forKey: cacheKey) {
            completion(image)
            return
        }
        completion(nil)
    }
    
    private func dataToImage(data: Data) -> UIImage? {
        if let image = UIImage(data: data) {
            return image
        }
        return nil
    }
}
