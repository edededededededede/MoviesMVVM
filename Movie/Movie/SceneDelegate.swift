// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// сен делегат
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    var coordinator: AplicationCoordinator?

    func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        window.makeKeyAndVisible()
        self.window = window
        let coordinator = MainCoordinator(assambly: Assambly())
        coordinator.start()
    }
}
