// BaseCoordinator.swift
// Copyright © Edo. All rights reserved.

import UIKit

protocol BaseCoordinatorProtocol: AnyObject {
    var childCoordinators: [BaseCoordinatorProtocol] { get set }
    func start()
    func addDependency(_ coordinator: BaseCoordinatorProtocol)
    func removeDependency(_ coordinator: BaseCoordinatorProtocol?)
    func setAsRoot(_ controller: UIViewController)
}

extension BaseCoordinatorProtocol {
    func start() {}

    func addDependency(_ coordinator: BaseCoordinatorProtocol) {
        for element in childCoordinators where element === coordinator {
            return
        }
        childCoordinators.append(coordinator)
    }

    func removeDependency(_ coordinator: BaseCoordinatorProtocol?) {
        guard
            childCoordinators.isEmpty == false,
            let coordinator = coordinator
        else { return }

        for (index, element) in childCoordinators.reversed().enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            break
        }
    }

    func setAsRoot(_ controller: UIViewController) {
        UIApplication.shared.keyWindow?.rootViewController = controller
    }
}
