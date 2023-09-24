//
//  MovieListResponse.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 24.09.2023.
//


// MARK: - MovieListResponse

struct MovieListResponse: Codable {
    let search: [SearchRawModel?]
    let totalResults: String?
    let response: String?

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
}


// MARK: - Search

struct SearchRawModel: Codable {
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
