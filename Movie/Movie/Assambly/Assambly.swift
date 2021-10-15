// Assambly.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

protocol AssamblyProtocol {
    func createMenuViewModel() -> UIViewController
    func createDetailsViewModel(id: Int) -> UIViewController
}

final class Assambly: AssamblyProtocol {
    func createMenuViewModel() -> UIViewController {
        let mainVC = MainViewController()
        let movieAPIService = MovieAPIService()
        let menuViewModel = MainViewModel(networkService: movieAPIService)
        mainVC.installViewModel(viewModel: menuViewModel)
        return mainVC
    }

    func createDetailsViewModel(id: Int) -> UIViewController {
        let detailsVC = DetailViewController()
        let movieAPIService = MovieAPIService()
        let detailsViewModel = DetailViewModel(networkService: movieAPIService, id: id)
        detailsVC.installViewModel(viewModel: detailsViewModel)
        return detailsVC
    }
}
