//
//  Data+Extension.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 24.09.2023.
//

import Foundation


extension Data {
    
    func decodeData<T: Decodable>() -> T? {
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: self)
            return decodedData
        } catch {
            return nil
        }
    }
}
