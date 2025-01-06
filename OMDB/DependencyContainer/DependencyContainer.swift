//
//  DependencyContainer.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 1.01.2025.
//

import Foundation

// MARK: - DependencyContainer

final class DependencyContainer: DependencyContaining {
    static let shared = DependencyContainer()
    
    private let queue = DispatchQueue(label: "com.dependencycontainer.queue", attributes: .concurrent)
    private var dependencies: [String: Any] = [:]
    private var factories: [String: (lifetime: DependencyContainerLifetime, factory: () -> Any)] = [:]
    
    private init() {
        setupDependencies()
    }
    
    func register<T>(
        _ type: T.Type,
        lifetime: DependencyContainerLifetime = .singleton,
        factory: @escaping () -> T
    ) {
        let key = String(describing: type)
        queue.async(flags: .barrier) {
            self.factories[key] = (lifetime, factory)
        }
    }
    
    func resolve<T>() -> T {
        let key = String(describing: T.self)
        
        return queue.sync { () -> T in
            if let dependency = dependencies[key] as? T {
                return dependency
            }
            
            guard let (lifetime, factory) = factories[key] else {
                fatalError("Dependency '\(T.self)' not registered")
            }
            
            let instance = factory() as! T
            
            if lifetime == .singleton {
                dependencies[key] = instance
            }
            
            return instance
        }
    }
    
    func clear() {
        queue.async(flags: .barrier) {
            self.dependencies.removeAll()
            self.factories.removeAll()
        }
    }
}
