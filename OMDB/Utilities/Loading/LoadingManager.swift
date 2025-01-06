//
//  LoadingManager.swift
//  OMDB
//
//  Created by Sinan Ulusoy on 8.01.2025.
//

import UIKit

// MARK: - LoadingManager

final class LoadingManager {
    
    // MARK: - Properties

    static let shared = LoadingManager()

    private var loadingVC: LoadingViewController?
    private let queue = DispatchQueue(label: "com.loadingmanager.queue", attributes: .concurrent)

    // MARK: - Initializers

    private init() {}
    
    // MARK: - Loading Methods

    func showLoading(from viewController: UIViewController) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            if self.loadingVC?.presentingViewController == nil {
                let loadingVC = self.getLoadingViewController()
                viewController.present(loadingVC, animated: false)
            }
        }
    }

    func hideLoading() {
        DispatchQueue.main.async { [weak self] in
            if let self, let loadingVC, loadingVC.presentingViewController != nil {
                loadingVC.dismiss(animated: false) {
                    self.resetLoadingViewController()
                }
            }
        }
    }
    
    // MARK: - Helper Methods

    private func getLoadingViewController() -> LoadingViewController {
        queue.sync { [weak self] in
            if let loadingVC = self?.loadingVC { return loadingVC }
            let newLoadingVC = LoadingViewController()
            self?.queue.async(flags: .barrier) {
                self?.loadingVC = newLoadingVC
            }
            return newLoadingVC
        }
    }

    private func resetLoadingViewController() {
        queue.async(flags: .barrier) { [weak self] in
            self?.loadingVC = nil
        }
    }
}
