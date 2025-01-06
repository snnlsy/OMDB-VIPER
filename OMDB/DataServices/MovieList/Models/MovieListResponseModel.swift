//
//  MovieListResponseModel.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 1.01.2025.
//

// MARK: - MovieListResponseModel

struct MovieListResponseModel: Codable, Hashable {
    let search: [SearchModel?]
    let totalResults: String?
    let response: String?

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
}


// MARK: - SearchModel

struct SearchModel: Codable, Hashable {
    let title: String?
    let year: String?
    let imdbID: String?
    let poster: String?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case poster = "Poster"
    }
}
