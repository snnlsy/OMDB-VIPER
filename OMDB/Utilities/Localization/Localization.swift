//
//  Localization.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 7.01.2025.
//

// MARK: - Localization

/// A utility struct for managing localization.
/// This struct provides a clean and type-safe interface for retrieving localized strings
/// using `LocalizationKey` instances.
struct Localization {
    /// Fetches the localized string for the given key.
    /// - Parameter key: The `LocalizationKey` to fetch the localized string for.
    /// - Returns: The localized string corresponding to the given key.
    static subscript(key: LocalizationKey) -> String {
        // Use Swift's built-in localization API to fetch the string.
        String(localized: String.LocalizationValue(key.rawValue))
    }
}
