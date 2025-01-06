//
//  DataService.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 1.01.2025.
//

import Foundation

// MARK: - DataService

final class DataService<RequestType: URLRequestable, ResponseType: Decodable> {
    private let networkService: NetworkServicing
    
    // MARK: - Initializers

    init(container: DependencyContaining = DependencyContainer.shared) {
        self.networkService = container.resolve()
    }
}

// MARK: - DataServicing Implementation

extension DataService: DataServicing {
    func fetchData(with request: RequestType) async -> Result<ResponseType, NetworkError> {
        let result: Result<ResponseType, NetworkError> = await networkService.execute(request)
        
        return switch result {
        case .success(let response):
            .success(response)
        case .failure(let error):
            .failure(error)
        }
    }
}

// MARK: - Handle Helpers

private extension DataService {
    func handleError(_ error: Error) {
        Logger.error("Error fetching data: \(error.localizedDescription)")
    }
}
