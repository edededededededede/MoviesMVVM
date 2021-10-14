// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// сен делегат
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
        let networkService = MovieAPIService()
        let mainViewModel = MainViewModel(networkService: networkService)
        let firstVC = ViewController(viewModel: mainViewModel)
        firstVC.viewModel = mainViewModel
        let firstNavController = UINavigationController(rootViewController: firstVC)
        window?.rootViewController = firstNavController
        window?.makeKeyAndVisible()
    }
}
