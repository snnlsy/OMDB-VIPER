//
//  DependencyContainerInterface.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 4.01.2025.
//

// MARK: - DependencyContaining

/// A protocol defining the interface for a dependency container.
/// The container is responsible for registering, resolving, and managing the lifecycle of dependencies
/// in a decoupled and modular way.
protocol DependencyContaining {
    
    /// Registers a dependency with a specific type and lifetime.
    ///
    /// - Parameters:
    ///   - type: The type of the dependency to register.
    ///   - lifetime: The lifetime of the dependency, defined by `DependencyContainerLifetime`.
    ///   - factory: A closure that creates an instance of the dependency when needed.
    /// - Note: Dependencies can be registered as either singleton (shared instance) or transient (new instance per resolution).
    func register<T>(
        _ type: T.Type,
        lifetime: DependencyContainerLifetime,
        factory: @escaping () -> T
    )
    
    /// Resolves and retrieves a registered dependency by its type.
    ///
    /// - Returns: An instance of the requested type.
    /// - Note: If the dependency is registered as a singleton, the same instance is returned for subsequent resolutions.
    /// If it is registered as transient, a new instance is created each time.
    /// - Warning: This method will throw a runtime error if the requested dependency has not been registered.
    func resolve<T>() -> T
}
