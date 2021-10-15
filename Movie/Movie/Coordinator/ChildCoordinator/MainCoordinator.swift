// MainCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class MainCoordinator: BaseCoordinator {
    var onFinishFlow: VoidHendler?

    // MARK: - private Properties

    private var navController: UINavigationController?
    private var assambly: AssamblyProtocol

    required init(assambly: AssamblyProtocol, navController: UINavigationController? = nil) {
        self.assambly = assambly
        self.navController = navController
        super.init(assambly: assambly, navController: navController)
    }

    override func start() {
        showMainModule()
    }

    private func showMainModule() {
        guard let menuVC = assambly.createMenuView() as? MainViewController else { return }
        menuVC.onSelectID = { [weak self] movieID in
            self?.showDetailsModule(movieID: movieID)
        }
        if navController == nil {
            let rootController = UINavigationController(rootViewController: menuVC)
            navController = rootController
            setAsRoot(rootController)
        } else if let navController = navController {
            navController.pushViewController(menuVC, animated: true)
            setAsRoot(navController)
        }
    }

    private func showDetailsModule(movieID: Int) {
        let detailVC = assambly.createDetailsView(id: movieID)
        navController?.pushViewController(detailVC, animated: true)
    }
}
