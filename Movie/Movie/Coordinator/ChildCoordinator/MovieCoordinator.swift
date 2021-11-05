// MovieCoordinator.swift
// Copyright © Edo. All rights reserved.

import UIKit

final class MovieCoordinator: BaseCoordinatorProtocol {
    var childCoordinators: [BaseCoordinatorProtocol] = []
    var onFinishFlow: VoidHandler?

    private var navigationController: UINavigationController
    private var assembly: Assambly?

    init(navigationController: UINavigationController, assembly: Assambly) {
        self.navigationController = navigationController
        self.assembly = assembly
    }

    func start() {
        showMainModule()
    }

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
