//
//  SceneDelegate.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 22.09.2023.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else { return }
        setupWindow(for: windowScene)
    }
}

// MARK: - Scene Configuration

extension SceneDelegate {
    
    private func setupWindow(for windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        window.rootViewController = makeRootViewController()
        window.makeKeyAndVisible()
    }

    private func makeRootViewController() -> UIViewController {
        let mainVC = MovieListBuilder.build()
        let navigationController = UINavigationController(rootViewController: mainVC)
        return navigationController
    }
}
