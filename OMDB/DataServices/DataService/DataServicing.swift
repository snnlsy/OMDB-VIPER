//
//  DataServicing.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 5.01.2025.
//

// MARK: - DataServicing

/// A protocol defining the interface for data service operations.
/// This protocol standardizes the process of fetching and decoding data from a network service.
protocol DataServicing {
    
    /// The type of request that conforms to `URLRequestable`.
    ///
    /// - Note: This associated type ensures that the request object adheres to a standardized structure for network operations.
    associatedtype RequestType: URLRequestable
    
    /// The type of response that conforms to `Decodable`.
    ///
    /// - Note: This associated type defines the expected response format, ensuring that the data can be decoded into a specific model.
    associatedtype ResponseType: Decodable
    
    /// Fetches data from a network service and returns the result asynchronously.
    ///
    /// - Parameter request: An instance of `RequestType` containing the details of the network request.
    /// - Returns: A `Result` containing the decoded `ResponseType` on success or a `NetworkError` on failure.
    ///
    /// - Note: This method leverages Swift's `async` capabilities to provide a non-blocking way to fetch data.
    func fetchData(with request: RequestType) async -> Result<ResponseType, NetworkError>
}
