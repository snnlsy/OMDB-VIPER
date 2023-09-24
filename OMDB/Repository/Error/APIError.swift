//
//  APIError.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 24.09.2023.
//


enum APIError: Error {
    case responseFailed
    case invalidURL
    case invalidData
    case decodeError
}
