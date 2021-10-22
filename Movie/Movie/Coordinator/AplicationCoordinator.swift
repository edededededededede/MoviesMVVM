// AplicationCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class ApplicationCoordinator: BaseCoordinatorProtocol {
    // MARK: - Public Variables

    var childCoordinators: [BaseCoordinatorProtocol] = []

    // MARK: - Public Methods

    func start() {
        toMovies()
    }

    // MARK: - Private Methods

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
