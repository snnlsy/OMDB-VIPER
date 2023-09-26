//
//  MovieListRequest.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 24.09.2023.
//

import Foundation


// MARK: - MovieListRequest

struct MovieListRequest {
    
    let query: String
    let page: Int

    var url: URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "omdbapi.com"
        urlComponents.queryItems = [
            URLQueryItem(name: "apiKey", value: "ccb971c5"),
            URLQueryItem(name: "s", value: query),
            URLQueryItem(name: "page", value: String(page))
        ]
        return urlComponents.url
    }
}
