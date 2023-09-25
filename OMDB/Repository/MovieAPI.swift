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
        NetworkService.shared.fetchData(url: url) { [weak self] dataResponse in
            guard let self else { return }
            switch dataResponse {
            case .success(let data):
                guard let response: MovieListResponse = data.decodeData() else {
                    self.output?.movieAPI(self, didRetrieveError: .decodeError)
                    return
                }
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    self.output?.movieAPI(self, didRetrieveMovieList: response)
                }
            case .failure(let error):
                self.output?.movieAPI(self, didRetrieveError: error)
            }
        }
    }
}
