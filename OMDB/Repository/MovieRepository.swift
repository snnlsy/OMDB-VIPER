//
//  MovieRepository.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 24.09.2023.
//

import Foundation


// MARK: - MovieRepositoryProtocol

protocol MovieRepositoryProtocol {
    func getMovieList(
        with request: MovieListRequest,
        completion: @escaping (Result<Data, APIError>) -> Void
    )
}


// MARK: - MovieRepository

final class MovieRepository: MovieRepositoryProtocol {
     
    func getMovieList(
        with request: MovieListRequest,
        completion: @escaping (Result<Data, APIError>) -> Void
    ) {
        guard let url = request.url else {
            completion(.failure(.invalidURL))
            return
        }
        URLSession.shared.dataTask(
            with: url,
            completionHandler: { (data, response, error) in
                if let _ = error {
                    completion(.failure(.responseFailed))
                    return
                }
                guard let _ = response else {
                    completion(.failure(.responseFailed))
                    return
                }
                guard let data = data else {
                    completion(.failure(.invalidData))
                    return
                }
                completion(.success(data))
            }
        ).resume()
    }
}
