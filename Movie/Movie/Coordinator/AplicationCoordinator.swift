// AplicationCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class AplicationCoordinator: BaseCoordinator {
    // MARK: - private properties

    private var assambly: AssamblyProtocol
    private var navigationController: UINavigationController?

    required init(assambly: AssamblyProtocol, navController: UINavigationController? = nil) {
        navigationController = navController
        self.assambly = assambly
        super.init(assambly: assambly, navController: navigationController)
    }

    // MARK: - ApplicationCoordinator

    override func start() {
        toMenu()
    }

    // MARK: - Private methods

    private func toMenu() {
        let coordinator = MainCoordinator(assambly: assambly, navController: navigationController)
        coordinator.onFinishFlow = { [weak self, weak coordinator] in
            self?.removeDependency(coordinator)
            self?.start()
        }
        addDependency(coordinator)
        coordinator.start()
    }
}
