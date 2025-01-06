//
//  DependencyContainerSetup.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 1.01.2025.
//

// MARK: - DependencyContainer Setup

extension DependencyContainer {
    
    func setupDependencies() {
        register(NetworkServicing.self, lifetime: .singleton) {
            NetworkService()
        }
    }
}
