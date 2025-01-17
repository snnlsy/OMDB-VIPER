//
//  Data+Extension.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 24.09.2023.
//

import Foundation

extension Data {
    
    func decodeData<T: Decodable>() -> T? {
        try? JSONDecoder().decode(T.self, from: self)
    }
}
