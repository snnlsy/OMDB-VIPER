//
//  BaseGetRequest.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 1.01.2025.
//

import Foundation

// MARK: - BaseGetRequest

/// A protocol defining the requirements for making GET requests in a network service.
/// This protocol standardizes the structure and behavior of GET requests, ensuring consistency across the application.
protocol BaseGetRequest: URLRequestable {}

/// Default implementation of the `BaseGetRequest` protocol.
extension BaseGetRequest {
    
    /// The base URL for all GET requests.
    ///
    /// - Note: This property provides the root URL for the API. Individual endpoints are appended to this base URL.
    var baseURL: URL {
        URL(string: "https://omdbapi.com")!
    }
    
    /// The HTTP method for the request.
    ///
    /// - Note: This property is always set to `.get`, indicating that the request retrieves data from the server.
    var method: HTTPMethod {
        .get
    }
}
