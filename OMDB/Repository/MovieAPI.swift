//
//  MovieRepository.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 24.09.2023.
//

import Foundation


// MARK: - MovieRepositoryProtocol

protocol MovieAPIProtocol {
    func getMovieList(with request: MovieListRequest)
}


// MARK: - MovieAPIOutputProtocol

protocol MovieAPIOutputProtocol: AnyObject {
    func movieAPI(
        _ api: MovieAPIProtocol,
        didRetrieveMovieList response: MovieListResponse?
    )
    
    func movieAPI(
        _ api: MovieAPIProtocol,
        didRetrieveError error: APIError
    )
}


// MARK: - MovieAPI

final class MovieAPI {
    
    weak var output: MovieAPIOutputProtocol?
}


// MARK: - MovieAPIProtocol Implementation

extension MovieAPI: MovieAPIProtocol {
    
    func getMovieList(with request: MovieListRequest) {
        guard let url = request.url else {
            output?.movieAPI(self, didRetrieveError: .invalidURL)
            return
        }
        URLSession.shared.dataTask(
            with: url,
            completionHandler: { [weak self] (data, response, error) in
                guard let self else { return }
                if let _ = error {
                    self.output?.movieAPI(self, didRetrieveError: .responseFailed)
                    return
                }
                guard let _ = response else {
                    self.output?.movieAPI(self, didRetrieveError: .responseFailed)
                    return
                }
                guard let data = data else {
                    self.output?.movieAPI(self, didRetrieveError: .invalidData)
                    return
                }
                let response = try? JSONDecoder().decode(MovieListResponse.self, from: data)
                self.output?.movieAPI(self, didRetrieveMovieList: response)
            }
        ).resume()
    }
}
