// MovieCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class MovieCoordinator: BaseCoordinatorProtocol {
    // MARK: - Public Variables

    var childCoordinators: [BaseCoordinatorProtocol] = []
    var onFinishFlow: VoidHandler?

    // MARK: - Private Variables

    private var navigationController: UINavigationController
    private var assembly: Assambly?

    // MARK: - Init

    init(navigationController: UINavigationController, assembly: Assambly) {
        self.navigationController = navigationController
        self.assembly = assembly
    }

    // MARK: - Public Methods

    func start() {
        showMainModule()
    }

    // MARK: - Private Methods

    private func showMainModule() {
        guard let controller = assembly?.createMenuView() as? MainViewController else { return }

        controller.onSelectID = { [weak self] id in
            self?.showDetailsViewController(id: id)
        }
        navigationController.pushViewController(controller, animated: true)
        setAsRoot(navigationController)
    }

    private func showDetailsViewController(id: Int) {
        guard let controller = assembly?.createDetailsView(id: id) as? DetailViewController else { return }

        navigationController.pushViewController(controller, animated: true)
    }
}
