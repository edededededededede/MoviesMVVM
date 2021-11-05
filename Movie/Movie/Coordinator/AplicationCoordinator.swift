// AplicationCoordinator.swift
// Copyright © Edo. All rights reserved.

import UIKit

final class ApplicationCoordinator: BaseCoordinatorProtocol {
    var childCoordinators: [BaseCoordinatorProtocol] = []

    func start() {
        toMovies()
    }

    private func toMovies() {
        let assembly = Assambly()
        let navigationController = UINavigationController()
        let coordinator = MovieCoordinator(navigationController: navigationController, assembly: assembly)

        coordinator.onFinishFlow = { [weak self, weak coordinator] in
            self?.removeDependency(coordinator)
            self?.start()
        }
        addDependency(coordinator)
        coordinator.start()
    }
}
