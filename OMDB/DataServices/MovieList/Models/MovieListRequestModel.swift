//
//  MovieListRequestModel.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 1.01.2025.
//

// MARK: - MovieListRequestModel

struct MovieListRequestModel: BaseGetRequest {
    var path: String = ""
    var parameters: Encodable?

    init(parameters: MovieListRequestParameters) {
        self.parameters = parameters
    }
}


// MARK: - MovieListRequestParameters

struct MovieListRequestParameters: Encodable {
    let apiKey: String = Secret.apiKey
    let s: String
    let page: Int
}
