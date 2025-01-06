//
//  BasePostRequest.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 1.01.2025.
//

import Foundation

// MARK: - BasePostRequest

/// A protocol defining the requirements for making POST requests in a network service.
/// This protocol standardizes the structure and behavior of POST requests, ensuring consistency across the application.
protocol BasePostRequest: URLRequestable {}

/// Default implementation of the `BasePostRequest` protocol.
extension BasePostRequest {
    
    /// The base URL for all POST requests.
    ///
    /// - Note: This property provides the root URL for the API. Individual endpoints are appended to this base URL.
    var baseURL: URL {
        URL(string: "https://omdbapi.com")!
    }
    
    /// The HTTP method for the request.
    ///
    /// - Note: This property is always set to `.post`, indicating that the request sends data to the server.
    var method: HTTPMethod {
        .post
    }
    
    /// The encoding type for the request body.
    ///
    /// - Note: By default, all POST requests use JSON encoding to serialize the request body.
    var encoding: NetworkEncoding {
        .json
    }
}
