//
//  LocalizationKeys.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 7.01.2025.
//

// MARK: - LocalizationKey Struct

/// A type-safe wrapper for localization keys.
/// This struct ensures that all localization keys are encapsulated and prevents
/// hardcoded strings from being scattered throughout the codebase.
struct LocalizationKey: ExpressibleByStringLiteral {
    /// The raw string value of the localization key.
    let rawValue: String
    
    /// Initializes a `LocalizationKey` with a raw string value.
    /// - Parameter rawValue: The raw string representation of the localization key.
    init(_ rawValue: String) {
        self.rawValue = rawValue
    }
    
    /// Initializes a `LocalizationKey` from a string literal.
    /// This initializer is required to conform to `ExpressibleByStringLiteral`.
    /// - Parameter value: The string literal representing the localization key.
    init(stringLiteral value: String) {
        self.rawValue = value
    }
}
